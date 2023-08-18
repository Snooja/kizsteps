#!/bin/bash

SOURCE_DIR="data/source"
RENDERED_DIR="data/rendered"

if ! command -v pipenv &> /dev/null; then
  echo "Pipenv is not installed. Installing..."
  pip install pipenv
fi

if ! pipenv run pip show blockdiag | grep -q "WARNING: Package(s) not found: blockdiag"; then
  echo "Installing blockdiag using pipenv..."
  pipenv install blockdiag
fi

if ! command -v inkscape &> /dev/null; then
  echo "Inkscape is not installed. Please install Inkscape and then run the script again."
  brew install inkscape
fi

if [ $# -ne 1 ]; then
  echo "Usage: $0 <input.diag>"
  exit 1
fi

input_diag="$1"
base_name=$(basename "${input_diag%.*}")
output_svg="$RENDERED_DIR/${base_name}.svg"
output_pdf="$RENDERED_DIR/${base_name}.pdf"

# Create output directory if not exists
mkdir -p "$RENDERED_DIR"

# Render .diag to .svg using Graphviz
pipenv run blockdiag -Tsvg "$SOURCE_DIR/$input_diag" -o "$output_svg"

# Convert .svg to .pdf using Inkscape
inkscape --export-filename="$output_pdf" "$output_svg"

echo "Conversion complete: $output_pdf"
