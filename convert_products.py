#!/usr/bin/env python3
import re
import json

# Read the updated product list
with open('Product list udpated.txt', 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Find column positions from header
header = lines[0]
code_start = header.find('Product Code')
desc_start = header.find('Description1')
price_start = header.find('Price1')

print(f"Column positions - Code: {code_start}, Desc: {desc_start}, Price: {price_start}")

# Parse each data line
products = []
for line in lines[1:]:
    if len(line.strip()) == 0:
        continue
    
    # Extract fields by character position (fixed-width format)
    barcode = line[code_start:desc_start].strip() if len(line) > desc_start else ''
    name = line[desc_start:price_start].strip() if len(line) > price_start else ''
    price_str = line[price_start:price_start+15].strip() if len(line) > price_start else ''
    
    # Clean up the name - take only the first description field
    if name:
        # Split by multiple spaces and take first meaningful part
        name_parts = [p.strip() for p in re.split(r'\s{2,}', name) if p.strip()]
        if name_parts:
            name = name_parts[0]
    
    # Parse price - remove $ and extract number
    price_match = re.search(r'\$?([\d.]+)', price_str)
    if price_match:
        try:
            price = float(price_match.group(1))
        except:
            price = 0.0
    else:
        price = 0.0
    
    # Only add if we have barcode and name
    if barcode and name:
        products.append({
            'barcode': barcode,
            'name': name,
            'price': price
        })

print(f"Total products parsed: {len(products)}")

# Write to productData-inline.js
output = "const productData = " + json.dumps(products, indent=2) + ";"

with open('productData-inline.js', 'w', encoding='utf-8') as f:
    f.write(output)

print(f"Created productData-inline.js with {len(products)} products")

# Show first 5 products as preview
print("\nFirst 5 products:")
for p in products[:5]:
    print(f"  {p['barcode']}: {p['name']} - ${p['price']:.2f}")
