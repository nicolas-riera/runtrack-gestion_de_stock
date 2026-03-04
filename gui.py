import tkinter as tk
from tkinter import ttk
from tkinter import messagebox
import matplotlib
matplotlib.use("TkAgg")
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg

from database import *
from export_csv import *

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

        export_button_frame = tk.Frame(self.root)
        export_button_frame.pack(pady=0)

        tk.Button(export_button_frame, text="Exporter liste", width=15, command=lambda: export_to_csv(self.database.products)).grid(row=0, column=1, padx=10)
        tk.Button(export_button_frame, text="Graphique stock", width=15, command=lambda: self.show_graph_menu()).grid(row=0, column=2, padx=10)

    def refresh_table(self):
        for row in self.tree.get_children():
            self.tree.delete(row)

        for product in self.database.products:
            self.tree.insert("", "end", values=product)
            
        self.tree.pack()

    def create_form(self):
        form_frame = tk.Frame(self.root)
        form_frame.pack(pady=30)

        tk.Label(
        form_frame, 
        text="Gérer les produits", 
        font=("Arial", 12), 
        fg="#2c3e50"
        ).grid(row=0, column=0, columnspan=2, pady=(10, 0))

        tk.Label(form_frame, text="Nom").grid(row=1, column=0, padx=10, pady=10)
        self.entry_name = tk.Entry(form_frame)
        self.entry_name.grid(row=1, column=1)

        tk.Label(form_frame, text="Description").grid(row=2, column=0)
        self.entry_desc = tk.Entry(form_frame)
        self.entry_desc.grid(row=2, column=1)

        tk.Label(form_frame, text="Prix").grid(row=3, column=0)
        self.entry_price = tk.Entry(form_frame)
        self.entry_price.grid(row=3, column=1)

        tk.Label(form_frame, text="Quantité").grid(row=4, column=0)
        self.entry_qty = tk.Entry(form_frame)
        self.entry_qty.grid(row=4, column=1)

        tk.Label(form_frame, text="Catégorie").grid(row=5, column=0)
        self.combo_category = ttk.Combobox(
            form_frame,
            values=self.database.categories
        )
        self.combo_category.grid(row=5, column=1)

        button_frame = tk.Frame(self.root)
        button_frame.pack()

        tk.Button(button_frame, text="Ajouter", width=15, command=lambda: self.add_product()).grid(row=0, column=0, padx=10)
        tk.Button(button_frame, text="Modifier", width=15, command=lambda: self.edit_selected_product()).grid(row=0, column=1, padx=10)
        tk.Button(button_frame, text="Supprimer", width=15, command=lambda: (self.database.delete_selected_product(f"{self.get_selected_product_id()}"), self.refresh_table())).grid(row=0, column=2, padx=10)

    def get_selected_product_id(self):
        selected = self.tree.selection()
        if not selected:
            return None  

        item = self.tree.item(selected[0])
        values = item["values"]

        product_id = values[0]
        return product_id
    
    def clear_form(self):
        self.entry_name.delete(0, tk.END)
        self.entry_desc.delete(0, tk.END)
        self.entry_price.delete(0, tk.END)
        self.entry_qty.delete(0, tk.END)
        self.combo_category.set("")

    def add_product(self):

        name = self.entry_name.get()         
        description = self.entry_desc.get()   
        price = self.entry_price.get()     
        quantity = self.entry_qty.get()    
        category = self.combo_category.get() 

        if name and description and price and quantity and category:
            self.database.add_product(name, description, price, quantity, category)
            self.refresh_table()
            self.clear_form()
            messagebox.showinfo("Gestion du produit", "Le produit a été ajouté.")
        else:
            messagebox.showerror("Erreur", "Vous devez entrer toutes les informations !")
    
    def edit_selected_product(self):

        name = self.entry_name.get()         
        description = self.entry_desc.get()   
        price = self.entry_price.get()     
        quantity = self.entry_qty.get()    
        category = self.combo_category.get() 

        id = self.get_selected_product_id() 

        if id:
            if name:
                self.database.update_name(name, id)
            if description:
                self.database.update_description(description, id)
            if price:
                self.database.update_price(price, id)
            if quantity:
                self.database.update_quantity(quantity, id)
            if category:
                self.database.update_category(category, id)
            self.refresh_table()
            self.clear_form()
            messagebox.showinfo("Gestion du produit", "Le produit a été modifié.")
        else:
            messagebox.showerror("Erreur", "Vous devez sélectionner un élément pour le modifier.")

    def show_graph_menu(self):

        self.root.pack_slaves() 
        for widget in self.root.winfo_children():
            widget.pack_forget()

        self.graph_frame = tk.Frame(self.root)
        self.graph_frame.pack(fill="both", expand=True)

        products = [p[1] for p in self.database.products] 
        quantities = [p[4] for p in self.database.products]  

        fig = Figure(figsize=(8,4))
        ax = fig.add_subplot(111)
        ax.bar(products, quantities, color="skyblue")
        ax.set_xlabel("Produit")
        ax.set_ylabel("Quantité en stock")
        ax.set_title("Stock des produits")
        ax.set_xticklabels(products, rotation=45, ha="right")

        canvas = FigureCanvasTkAgg(fig, master=self.graph_frame)
        canvas.draw()
        canvas.get_tk_widget().pack(fill="both", expand=True)

        tk.Button(self.graph_frame, text="Retour", width=15, command=self.show_main_menu).pack(pady=10)

    def show_main_menu(self):
 
        self.graph_frame.destroy()

        self.create_header()
        self.create_table()
        self.create_form()
