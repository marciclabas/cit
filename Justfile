# Show this list
default:
  @just --list

# Opens vscode on a template
templates TEMPLATE:
	code ~/mr-github/templates/{{TEMPLATE}}	

# Degits a given template to OUTPUT_DIR
scaffold TEMPLATE OUTPUT_DIR:
  degit moveread/{{TEMPLATE}} {{OUTPUT_DIR}}