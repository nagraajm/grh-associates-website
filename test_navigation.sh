#!/bin/bash

echo "🔍 Testing GRH Associates Website Navigation..."
echo "=============================================="

# Test all HTML files for basic structure
echo "📋 Testing HTML file structure..."

for file in index.html projects.html about.html; do
    echo "Testing $file..."
    
    # Check for proper HTML structure
    if grep -q "<!DOCTYPE html>" "$file"; then
        echo "  ✅ DOCTYPE declaration found"
    else
        echo "  ❌ DOCTYPE declaration missing"
    fi
    
    # Check for proper head section
    if grep -q "<head>" "$file" && grep -q "</head>" "$file"; then
        echo "  ✅ Head section complete"
    else
        echo "  ❌ Head section incomplete"
    fi
    
    # Check for navigation
    if grep -q "<nav>" "$file" && grep -q "</nav>" "$file"; then
        echo "  ✅ Navigation section found"
    else
        echo "  ❌ Navigation section missing"
    fi
    
    # Check for footer
    if grep -q "<footer>" "$file" && grep -q "</footer>" "$file"; then
        echo "  ✅ Footer section found"
    else
        echo "  ❌ Footer section missing"
    fi
    
    echo ""
done

# Check CSS and JS files
echo "📁 Checking resource files..."

if [ -f "css/style.css" ]; then
    echo "✅ Main stylesheet found"
else
    echo "❌ Main stylesheet missing"
fi

if [ -f "js/script.js" ]; then
    echo "✅ Main JavaScript file found"
else
    echo "❌ Main JavaScript file missing"
fi

# Check image directories
echo ""
echo "🖼️  Checking image assets..."

if [ -d "images/projects" ]; then
    project_count=$(ls images/projects/*.jpg 2>/dev/null | wc -l)
    echo "✅ Projects directory found with $project_count images"
else
    echo "❌ Projects directory missing"
fi

if [ -d "images/profile" ]; then
    profile_count=$(ls images/profile/*.* 2>/dev/null | wc -l)
    echo "✅ Profile directory found with $profile_count images"
else
    echo "❌ Profile directory missing"
fi

echo ""
echo "🌐 Server is running on http://localhost:8000"
echo "✅ Website structure validation complete!"
echo ""
echo "Navigate to the following URLs to test:"
echo "  - http://localhost:8000/ (Home page)"
echo "  - http://localhost:8000/projects.html (Projects page)"
echo "  - http://localhost:8000/about.html (About page)"
