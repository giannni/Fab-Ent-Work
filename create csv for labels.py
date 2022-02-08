import csv

order_number = input("Enter order number\n")
ship_name = input("Enter ship to name\n")
ship_address = input("Enter ship to address\n")
ship_other = input("Enter ship to City,State,Zip,Country\n")
number_type = input("Enter number type(EX: 0020)\n")
department_input = input("Enter department (EX: 00040)\n")
dc_num_input = input("Enter DC NUM\n")
sku_input = input("Enter SKU\n")
units_input = input("Enter the amount of units\n")
description_input = input("Enter the description of the product\n")
gtin_input = input("Enter the GTIN\n")

data = [order_number, ship_name, ship_address, ship_other, number_type, department_input, dc_num_input, "", sku_input, units_input, description_input, gtin_input]

header = ['OrderNum', 'ShiptoName', 'ShiptoAddress', 'ShiptoCityStateZipCountry', 'Type', 'Department', 'DCNum', 'WMIT',
          'SKU', 'Units', 'Description', 'GTIN']

with open("carton label.csv", 'w', encoding='UTF8', newline='') as f:
    writer = csv.writer(f, quoting=csv.QUOTE_ALL)

    # write the header
    writer.writerow(header)

    # write one row
    writer.writerow(data)
