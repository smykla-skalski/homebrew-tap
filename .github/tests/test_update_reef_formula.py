import unittest
from pathlib import Path

from update_reef_formula import ASSETS, parse_checksums, update_formula

ROOT = Path(__file__).resolve().parents[2]


class ReefFormulaUpdateTest(unittest.TestCase):
    def setUp(self):
        self.formula = (ROOT / "Formula/reef.rb").read_text()
        self.checksums = {asset: f"{index + 1:064x}" for index, asset in enumerate(ASSETS)}

    def test_updates_each_platform_and_version_test(self):
        updated = update_formula(self.formula, "0.0.7", self.checksums)

        for asset in ASSETS[:-1]:
            self.assertIn(f"/v0.0.7/{asset}", updated)
            self.assertIn(f' sha256 "{self.checksums[asset]}"', updated)
        self.assertIn('assert_match "reef 0.0.7"', updated)
        self.assertIn('bin.install "reef"', updated)
        self.assertNotIn("/v0.0.6/", updated)

    def test_rejects_an_unexpected_formula_layout(self):
        with self.assertRaisesRegex(ValueError, "expected one formula entry"):
            update_formula(self.formula.replace("reef-linux-x86_64.tar.gz", "reef-linux.tar.gz"), "0.0.7", self.checksums)

    def test_rejects_invalid_version_and_checksum(self):
        with self.assertRaisesRegex(ValueError, "invalid Reef version"):
            update_formula(self.formula, "0.0.7; echo bad", self.checksums)
        with self.assertRaisesRegex(ValueError, "refusing to downgrade"):
            update_formula(self.formula, "0.0.5", self.checksums)
        self.checksums[ASSETS[0]] = "bad"
        with self.assertRaisesRegex(ValueError, "release checksums"):
            update_formula(self.formula, "0.0.7", self.checksums)

    def test_requires_exact_release_asset_set(self):
        manifest = "\n".join(
            f"{checksum}  {asset}" for asset, checksum in self.checksums.items()
        )
        self.assertEqual(parse_checksums(manifest), self.checksums)
        with self.assertRaisesRegex(ValueError, "missing release assets"):
            parse_checksums(manifest.rsplit("\n", 1)[0])
        with self.assertRaisesRegex(ValueError, "duplicate release asset"):
            parse_checksums(f"{manifest}\n{manifest.splitlines()[0]}")


if __name__ == "__main__":
    unittest.main()
