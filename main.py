import tkinter as tk
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password=""
)

cursor = mydb.cursor()

root = tk.Tk()
root.title("Store")
root.geometry("800x800")

root.mainloop()