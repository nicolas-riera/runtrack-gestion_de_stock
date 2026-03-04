import tkinter as tk
from tkinter import ttk

from database import *

class StoreApp:

    def __init__(self, root):
        self.root = root
        self.root.title("Gestion de Stock")
        self.root.geometry("800x800")
        self.root.configure(bg="#f4f4f4")

        self.database = SQLManager()

        self.create_header()
        self.create_table()
        self.create_form()

    def create_header(self):
        header = tk.Frame(self.root, bg="#2c3e50", height=80)
        header.pack(fill="x")

        title = tk.Label(
            header,
            text="TABLEAU DE BORD - GESTION DE STOCK",
            bg="#2c3e50",
            fg="white",
            font=("Arial", 18, "bold")
        )
        title.pack(pady=20)

    def create_table(self):
        table_frame = tk.Frame(self.root)
        table_frame.pack(pady=20)

        columns = ("ID", "Nom", "Description", "Prix", "Qté", "Catégorie")

        self.tree = ttk.Treeview(
            table_frame,
            columns=columns,
            show="headings",
            height=17
        )

        for product in self.database.products:
            self.tree.insert("", "end", values=product)

        for col in columns:
            self.tree.heading(col, text=col)

        self.tree.column("ID", width=30)        
        self.tree.column("Nom", width=180)  
        self.tree.column("Description", width=200)    
        self.tree.column("Prix", width=40)
        self.tree.column("Qté", width=40)
        self.tree.column("Catégorie", width=130)

        self.tree.pack()

    def create_form(self):
        form_frame = tk.Frame(self.root)
        form_frame.pack(pady=30)

        tk.Label(form_frame, text="Nom").grid(row=0, column=0, padx=10, pady=10)
        self.entry_name = tk.Entry(form_frame)
        self.entry_name.grid(row=0, column=1)

        tk.Label(form_frame, text="Description").grid(row=1, column=0)
        self.entry_desc = tk.Entry(form_frame)
        self.entry_desc.grid(row=1, column=1)

        tk.Label(form_frame, text="Prix").grid(row=2, column=0)
        self.entry_price = tk.Entry(form_frame)
        self.entry_price.grid(row=2, column=1)

        tk.Label(form_frame, text="Quantité").grid(row=3, column=0)
        self.entry_qty = tk.Entry(form_frame)
        self.entry_qty.grid(row=3, column=1)

        tk.Label(form_frame, text="Catégorie").grid(row=4, column=0)
        self.combo_category = ttk.Combobox(
            form_frame,
            values=self.database.categories
        )
        self.combo_category.grid(row=4, column=1)

        button_frame = tk.Frame(self.root)
        button_frame.pack()

        tk.Button(button_frame, text="Ajouter", width=15).grid(row=0, column=0, padx=10)
        tk.Button(button_frame, text="Modifier", width=15).grid(row=0, column=1, padx=10)
        tk.Button(button_frame, text="Supprimer", width=15).grid(row=0, column=2, padx=10)