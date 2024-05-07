from datetime import datetime
from datetime import datetime

# Add constant values for minimum and maximum price
class Product:
    MIN_PRICE = 0
    MAX_PRICE = 1000000

    def __init__(self, id, name, description, price, category_id):
        self.id = id
        self.name = name
        self.description = description
        self.set_price(price)
        self.category_id = category_id
        self.created_at = datetime.now()
        self.updated_at = datetime.now()

    # Getter methods
    def get_id(self):
        return self.id

    def get_name(self):
        return self.name

    def get_description(self):
        return self.description

    def get_price(self):
        return self.price

    def get_category_id(self):
        return self.category_id

    def get_created_at(self):
        return self.created_at

    def get_updated_at(self):
        return self.updated_at

    # Setter methods
    def set_id(self, id):
        self.id = id

    def set_name(self, name):
        self.name = name

    def set_description(self, description):
        self.description = description

    def set_price(self, price):
        # Check if price is within the range, if not raise an exception
        if price < Product.MIN_PRICE or price > Product.MAX_PRICE:
            raise ValueError(f"Price must be between {Product.MIN_PRICE} and {Product.MAX_PRICE}")

        self.price = price

