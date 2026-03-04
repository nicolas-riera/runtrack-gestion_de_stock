import tkinter as tk
import mysql.connector

from gui import *

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password=""
)

cursor = mydb.cursor()

root = tk.Tk()
app = StoreApp(root)
root.mainloop()