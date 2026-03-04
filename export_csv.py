import csv
from tkinter import filedialog
from datetime import datetime

def export_to_csv(products):

    file_path = filedialog.asksaveasfilename(
        initialfile= f"product_{datetime.now().strftime("%d-%m-%Y_%H-%M-%S")}.csv",
        defaultextension=".csv",
        filetypes=[("CSV files", "*.csv"), ("All files", "*.*")]
    )
    if not file_path:
        return
    
    with open(file_path, mode="w", newline="", encoding="utf-8-sig") as file:
        writer = csv.writer(file)

        columns = ["ID", "Nom", "Description", "Prix", "Quantité", "Catégorie"]
        writer.writerow(columns)

        for line in products:
            writer.writerow(line)
