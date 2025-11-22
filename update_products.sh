#!/bin/bash

# Update all remaining product divs to article tags with schema markup
sed -i '' 's|<div class="product-card">|<article class="product-card" itemscope itemtype="https://schema.org/Product">|g' products.html
sed -i '' 's|</div><!-- Product Card|</article><!-- Product Card|g' products.html

# Add itemprop to h2 tags in product-box
sed -i '' 's|<h2>\([^<]*\)</h2>|<h2 itemprop="name">\1</h2>|g' products.html

# Add itemprop to product-type
sed -i '' 's|<p class="product-type">\([^<]*\)</p>|<p class="product-type" itemprop="dosageForm">\1</p>|g' products.html

# Add itemprop to composition
sed -i '' 's|<p class="composition">|<p class="composition" itemprop="description">|g' products.html

# Add aria labels to indications divs
sed -i '' 's|<div class="indications">|<div class="indications" role="list" aria-label="Medical indications">|g' products.html

# Add role to badge spans
sed -i '' 's|<span class="badge badge-\([1-4]\)">\([^<]*\)</span>|<span class="badge badge-\1" role="listitem">\2</span>|g' products.html

# Update icon divs to be aria-hidden with better alt text
sed -i '' 's|<div class="product-icon"><img src="\([^"]*\)" alt="Tablet"></div>|<div class="product-icon" aria-hidden="true"><img src="\1" alt="Tablet icon"></div>|g' products.html

echo "Products updated successfully!"
