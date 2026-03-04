import mysql.connector

class SQLManager:
    def __init__(self):
        mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password=""
        )

        self.cursor = mydb.cursor()

        self.cursor.execute("USE store")

        self.cursor.execute("SELECT name FROM category")
        self.categories = self.cursor.fetchall()
        self.cursor.execute("SELECT P.id, P.name, description, price, quantity, C.name FROM product P JOIN category C ON P.id_category=C.id")
        self.products = self.cursor.fetchall()

    def refresh_categories(self):
        self.cursor.execute("SELECT name FROM category")
        self.categories = self.cursor.fetchall()

    def refresh_products(self):
        self.cursor.execute("SELECT P.id, P.name, description, price, quantity, C.name FROM product P JOIN category C ON P.id_category=C.id")
        self.products = self.cursor.fetchall()