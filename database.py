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

    def update_name(self, value, id):
        self.cursor.execute("UPDATE product SET name=%s WHERE id=%s", (value, id))
        self.refresh_products()
        self.mydb.commit()

    def update_description(self, value, id):
        self.cursor.execute("UPDATE product SET description=%s WHERE id=%s", (value, id))
        self.refresh_products()
        self.mydb.commit()

    def update_price(self, value, id):
        try :
            value = int(value)
            self.cursor.execute("UPDATE product SET price=%s WHERE id=%s", (value, id))
            self.refresh_products()
            self.mydb.commit()
        except:
            return
        
    def update_quantity(self, value, id):
        try :
            value = int(value)
            self.cursor.execute("UPDATE product SET quantity=%s WHERE id=%s", (value, id))
            self.refresh_products()
            self.mydb.commit()
        except:
            return
        
    def update_category(self, value, id):

        self.cursor.execute(f"SELECT id FROM category WHERE name = '{value}'")
        id_category = self.cursor.fetchone()[0]
        
        self.cursor.execute("UPDATE product SET id_category=%s WHERE id=%s", (id_category, id))
        self.refresh_products()
        self.mydb.commit()
       

    def delete_selected_product(self, selected):
        if selected != "None":
            self.cursor.execute(f"DELETE FROM product WHERE id={selected}")
            self.refresh_products()
            self.mydb.commit()