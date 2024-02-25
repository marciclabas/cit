HOME := "/home/m4rs"
CIT := HOME + "/cit"
JUSTFILE := CIT + "/Justfile"
# Show this list
default:
  @just --justfile {{JUSTFILE}} --list

# Open Cit in vscode
cit:
  code {{CIT}}

# Opens a template in vscode
templates TEMPLATE:
	code {{HOME}}/mr-github/templates/{{TEMPLATE}}	

# Degits a given template to OUTPUT_DIR
scaffold TEMPLATE OUTPUT_DIR:
  degit moveread/{{TEMPLATE}} {{OUTPUT_DIR}}