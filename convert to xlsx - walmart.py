import pandas as pd
import openpyxl
from datetime import date
import numpy as np

today = date.today()
filename = 'price.review.txt'

# read the text file as a csv since it's the same thing
pd.options.display.width = 0
df = pd.read_csv(filename, delimiter='\t', skiprows=2, header=0, dtype={'Order or Invoice Number': str, 'Purchase Order': str, 'Product Number': str})
# create our output name format
date_now = today.strftime("%Y%m%d")
output_name = 'Walmart pricing review ' + date_now


d2 = today.strftime("%B %d, %Y")
print(output_name + " - todays date:" + d2)

# convert it to an excel file with no index
df.to_excel(output_name + '.xlsx', index=False)

print(df)
