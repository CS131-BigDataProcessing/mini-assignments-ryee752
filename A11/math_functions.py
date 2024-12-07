def power(b, e):
    """Raises a base number to the given exponent."""
    try:
        return b ** e
    except Exception as e:
        return f"Error: {e}"

def divide(n, d):
    """Divides the numerator by the denominator."""
    try:
        if d == 0:
            raise ValueError("Cannot divide by zero")
        return n / d
    except Exception as e:
        return f"Error: {e}"

