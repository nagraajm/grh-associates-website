#!/usr/bin/env python3
import os
import re

def find_image_references(file_path):
    """Find all image references in an HTML file"""
    references = []
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
            # Find all src attributes pointing to images/projects
            matches = re.findall(r'src="(images/projects/[^"]+)"', content)
            references.extend(matches)
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
    return references

def check_file_exists(file_path):
    """Check if a file exists"""
    return os.path.exists(file_path)

# Check HTML files
html_files = ['index.html', 'projects.html']
all_references = []

for html_file in html_files:
    if os.path.exists(html_file):
        refs = find_image_references(html_file)
        print(f"\nImage references in {html_file}:")
        for ref in refs:
            all_references.append(ref)
            exists = check_file_exists(ref)
            status = "✓ EXISTS" if exists else "✗ MISSING"
            print(f"  {ref} - {status}")

# List actual files in images/projects
print(f"\nActual files in images/projects/:")
projects_dir = "images/projects"
if os.path.exists(projects_dir):
    files = [f for f in os.listdir(projects_dir) if not f.startswith('.')]
    for file in sorted(files):
        print(f"  {file}")

print(f"\nSummary:")
print(f"Total image references found: {len(all_references)}")
missing_count = sum(1 for ref in all_references if not check_file_exists(ref))
print(f"Missing files: {missing_count}")
