"""Update Reef's formula from a verified release checksum manifest."""

import re
import sys
from pathlib import Path

ASSETS = (
    "reef-macos-arm64.tar.gz",
    "reef-macos-x86_64.tar.gz",
    "reef-linux-x86_64.tar.gz",
    "reef-windows-x86_64.tar.gz",
)
VERSION = re.compile(r"[0-9]+\.[0-9]+\.[0-9]+\Z")
SHA256 = re.compile(r"[0-9a-f]{64}\Z")


def parse_checksums(manifest: str) -> dict[str, str]:
    checksums = {}
    for line in manifest.splitlines():
        fields = line.split()
        if len(fields) != 2 or not SHA256.fullmatch(fields[0]):
            raise ValueError(f"invalid checksum line: {line}")
        checksum, asset = fields
        if asset not in ASSETS or asset in checksums:
            raise ValueError(f"unexpected or duplicate release asset: {asset}")
        checksums[asset] = checksum
    if set(checksums) != set(ASSETS):
        raise ValueError(
            f"missing release assets: {sorted(set(ASSETS) - set(checksums))}"
        )
    return checksums


def update_formula(formula: str, version: str, checksums: dict[str, str]) -> str:
    if not VERSION.fullmatch(version):
        raise ValueError(f"invalid Reef version: {version}")
    current = re.findall(r"releases/download/v([0-9]+\.[0-9]+\.[0-9]+)/reef-", formula)
    if len(current) != 3 or len(set(current)) != 1:
        raise ValueError("formula release versions disagree")
    if tuple(map(int, version.split("."))) < tuple(map(int, current[0].split("."))):
        raise ValueError(f"refusing to downgrade Reef from {current[0]} to {version}")
    if set(checksums) != set(ASSETS) or any(
        not SHA256.fullmatch(checksum) for checksum in checksums.values()
    ):
        raise ValueError("release checksums are incomplete or invalid")

    for asset in ASSETS[:-1]:
        pattern = re.compile(
            r'(url "https://github\.com/smykla-skalski/reef/releases/download/v)'
            r"[0-9]+\.[0-9]+\.[0-9]+"
            rf'(/{re.escape(asset)}"\n\s*sha256 ")'
            r"[0-9a-f]{64}(\")"
        )
        formula, count = pattern.subn(
            lambda match, release_asset=asset: (
                f"{match.group(1)}{version}{match.group(2)}"
                f"{checksums[release_asset]}{match.group(3)}"
            ),
            formula,
        )
        if count != 1:
            raise ValueError(f"expected one formula entry for {asset}, found {count}")

    formula, count = re.subn(
        r'(assert_match "reef )[0-9]+\.[0-9]+\.[0-9]+('
        r'", shell_output\("#\{bin\}/reef --version"\))',
        rf"\g<1>{version}\g<2>",
        formula,
    )
    if count != 1:
        raise ValueError(f"expected one Reef version test, found {count}")
    return formula


def main() -> None:
    if len(sys.argv) != 2:
        raise SystemExit("usage: update_reef_formula.py VERSION")
    formula_path = Path("Formula/reef.rb")
    checksums = parse_checksums(Path("SHA256SUMS").read_text())
    updated = update_formula(formula_path.read_text(), sys.argv[1], checksums)
    formula_path.write_text(updated)


if __name__ == "__main__":
    main()
