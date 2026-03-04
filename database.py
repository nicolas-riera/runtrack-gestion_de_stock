import mysql.connector

class SQLManager:
    def __init__(self):
        self.mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password=""
        )

        self.cursor = self.mydb.cursor()

        self.cursor.execute("USE store")

        self.cursor.execute("SELECT name FROM category")
        self.categories = self.cursor.fetchall()
        self.cursor.execute("SELECT P.id, P.name, description, price, quantity, C.name FROM product P JOIN category C ON P.id_category=C.id")
        self.products = self.cursor.fetchall()

    def refresh_products(self):
        self.cursor.execute("SELECT P.id, P.name, description, price, quantity, C.name FROM product P JOIN category C ON P.id_category=C.id")
        self.products = self.cursor.fetchall()

    def delete_selected_product(self, selected):
        if selected != "None":
            self.cursor.execute(f"DELETE FROM product WHERE id={selected}")
            self.refresh_products()
            self.mydb.commit()