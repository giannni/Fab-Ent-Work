import csv
import PySimpleGUI as sg


# data = [order_number, ship_name, ship_address, ship_other, number_type, department_input, dc_num_input, "", sku_input, units_input, "Airex Balance Pad", gtin_input]

def create_data(value1, value2, value3, value4, value5, value6, value7):
    gtin_dict = {"30-1910": "714905066503", "30-1915": "714905057976", "30-1915LAV": "714905066541"}

    ship_dict = {"CLT1N TROUTMAN NC FC-VS3856": "386 MURDOCK RD",
                 "NV1 HVFC WHSE MACARRAN NV": "235 E SYDNEY DR",
                 "DFW1S Fort Worth TX FC-VS2148": "5300 Westport Pkwy",
                 "DFW6N Fort Worth TX FC-VS3863": "14700 Blue Mound RD",
                 "Chino Combo WHSE 8103": "6750 Kimball Avenue",
                 "Regional Distribution Center 8240": "6055 S. Fulton Parkway",
                 "Distribution Center 6280": "9590 ALLPOINTS PWKY",
                 "Regional Distribution Center 7853": "5100 N Ridge TRL",
                 "Walmart DC 7356": "3215 Commerce Center BLVD"}

    ship_other_dict = {"CLT1N TROUTMAN NC FC-VS3856": "TROUTMAN,NC,28166,US",
                       "NV1 HVFC WHSE MACARRAN NV": "SPARKS,NV,89437,US",
                       "DFW1S Fort Worth TX FC-VS2148": "Fort Worth,TX,76177,US",
                       "DFW6N Fort Worth TX FC-VS3863": "Fort Worth,TX,76052,US",
                       "Chino Combo WHSE 8103": "Chino,CA,91708,US",
                       "Regional Distribution Center 8240": "Atlanta,GA,30349,US",
                       "Distribution Center 6280": "Plainfield,IN,46168,US",
                       "Regional Distribution Center 7853": "Davenport,FL,33897,US",
                       "Walmart DC 7356": "Bethlehem,PA,18015,US"}

    # get our values that match the dictionary
    ship_to_address = ship_dict[value2]
    ship_other = ship_other_dict[value2]
    gtin_value = gtin_dict[value6]

    # return order_number, ship_name, ship_address, ship_other, number_type, department_input, dc_num_input, "", sku_input, units_input, "Airex Balance Pad", gtin_input
    return [value1, value2, ship_to_address, ship_other, value3, value4, value5, "", value6, value7,
            "Airex Balance Pad", gtin_value]


def create_csv_data(data):
    # header = ['OrderNum', 'ShiptoName', 'ShiptoAddress', 'ShiptoCityStateZipCountry', 'Type', 'Department', 'DCNum', 'WMIT', 'SKU', 'Units', 'Description', 'GTIN']
    with open("carton label.csv", 'a+', encoding='UTF8', newline='') as f:
        writer = csv.writer(f, quoting=csv.QUOTE_ALL)
        f.seek(0)
        data_from_file = f.read(100)
        if len(data_from_file) > 0:
            f.write("\n")
        # write one row
        writer.writerow(data)


sg.theme('dark grey 9')

# Define the window's contents
layout = [[sg.Text("Enter order number")],
          [sg.Input(key='-ORDERINPUT-')],
          [sg.Text('Choose Ship Name', size=(20, 1), font='Lucida', justification='left')],
          [sg.Combo(['CLT1N TROUTMAN NC FC-VS3856', 'NV1 HVFC WHSE MACARRAN NV', 'DFW1S Fort Worth TX FC-VS2148',
                     'DFW6N Fort Worth TX FC-VS3863', 'Chino Combo WHSE 8103', 'Regional Distribution Center 8240',
                     'Distribution Center 6280', 'Regional Distribution Center 7853', 'Walmart DC 7356'],
                    key='shipToName')],
          [sg.Text('Choose number type', size=(20, 1), font='Lucida', justification='left')],
          [sg.Combo(['0020'], key='numberType')],
          [sg.Text('Choose Department', size=(20, 1), font='Lucida', justification='left')],
          [sg.Combo(['00040', '00009'], key='departmentNumber')],
          [sg.Text('Choose DC Number', size=(20, 1), font='Lucida', justification='left')],
          [sg.Combo(['FC-VS3856', 'MACARRAN NV', 'FC-VS2148', 'FC-VS3863', 'WHSE 8103', '8240', '6280', '7853', '7356'],
                    key='dcNumber')],
          [sg.Text('Choose SKU', size=(20, 1), font='Lucida', justification='left')],
          [sg.Combo(['30-1915', '30-1910', '30-1915LAV'], key='skuNumber')],
          [sg.Text("Enter Units")],
          [sg.Input(key='-UNITINPUT-')],
          [sg.Text(size=(40, 1), key='-OUTPUT-')],
          [sg.Button('process'), sg.Button('Quit')]]

# Define Window
window = sg.Window('Walmart Store Label Data Generator', layout)

# Display and interact with the Window using an Event Loop
while True:
    event, values = window.read()

    # See if user wants to quit or window was closed
    if event == sg.WINDOW_CLOSED or event == 'Quit':
        break

    # set our data
    order_number = values['-ORDERINPUT-']
    ship_name = values['shipToName']
    number_type = values['numberType']
    department_input = values['departmentNumber']
    dc_num_input = values['dcNumber']
    sku_input = values['skuNumber']
    units_input = values['-UNITINPUT-']

    # call our function to pass the above data so we can create our data to pass to the CSV
    our_data = create_data(order_number, ship_name, number_type, department_input, dc_num_input, sku_input, units_input)

    if event == 'process':
        # call our function to create the csv data and process it to the file
        create_csv_data(our_data)

# close first window
window.close()