#!/bin/bash

echo "🔍 Testing GRH Associates Website..."
echo "=================================="

# Check if all main files exist
echo "📁 Checking file structure..."
files=("index.html" "projects.html" "about.html" "css/style.css" "js/script.js")

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file exists"
    else
        echo "❌ $file missing"
    fi
done

# Check if image directories exist
echo ""
echo "🖼️  Checking image directories..."
dirs=("images" "images/projects" "images/profile")

for dir in "${dirs[@]}"; do
    if [ -d "$dir" ]; then
        echo "✅ $dir exists"
    else
        echo "❌ $dir missing"
    fi
done

# Check for common HTML validation issues
echo ""
echo "🔍 Checking HTML structure..."

# Check for proper DOCTYPE
for html_file in *.html; do
    if grep -q "<!DOCTYPE html>" "$html_file"; then
        echo "✅ $html_file has proper DOCTYPE"
    else
        echo "❌ $html_file missing DOCTYPE"
    fi
done

echo ""
echo "🎉 Website structure validation complete!"
echo "Please test the website by opening the HTML files in your browser."
