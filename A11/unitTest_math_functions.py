import unittest
from math_functions import power, divide

class TestMathFunctions(unittest.TestCase):

    # Unit tests for the power function
    def test_zero_power(self):
        """Test zero exponent for any number."""
        self.assertEqual(power(5, 0), 1)
        self.assertEqual(power(-5, 0), 1)
        self.assertEqual(power(0, 0), 1)  

    def test_negative_exponent(self):
        """Test negative exponents."""
        self.assertEqual(power(2, -3), 0.125)
        self.assertEqual(power(-2, -3), -0.125)

    def test_large_exponent(self):
        """Test large exponent value."""
        self.assertEqual(power(2, 1000), 2 ** 1000)

    # Tests for the divide function
    def test_zero_divisor(self):
        """Test division by zero."""
        self.assertEqual(divide(10, 0), "Error: Cannot divide by zero")
        self.assertEqual(divide(-10, 0), "Error: Cannot divide by zero")

    def test_valid_division(self):
        """Test valid division cases."""
        self.assertEqual(divide(10, 2), 5)
        self.assertEqual(divide(9, 3), 3)
        self.assertEqual(divide(-9, 3), -3)

    def test_negative_division(self):
        """Test division with negative numbers."""
        self.assertEqual(divide(10, -2), -5)
        self.assertEqual(divide(-10, -2), 5)

if __name__ == '__main__':
    unittest.main()

