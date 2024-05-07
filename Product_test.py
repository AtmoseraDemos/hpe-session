import unittest
from datetime import datetime
from product import Product

class TestProduct(unittest.TestCase):
    def test_set_price_within_range(self):
        product = Product(1, "Test Product", "Description", 500, 1)
        self.assertEqual(product.get_price(), 500)

    def test_set_price_below_minimum(self):
        with self.assertRaises(ValueError):
            product = Product(1, "Test Product", "Description", -100, 1)

    def test_set_price_above_maximum(self):
        with self.assertRaises(ValueError):
            product = Product(1, "Test Product", "Description", 2000000, 1)

if __name__ == '__main__':
    unittest.main()