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
scaffold TEMPLATE +PARAMS:
  degit moveread/{{TEMPLATE}} {{PARAMS}}

# Degits and installs the vite playground template
playground OUTPUT='playground':
  degit moveread/vite-playground-template {{OUTPUT}}
  cd {{OUTPUT}} && yarn

# Degits and installs the vite empty template
devapp OUTPUT='devapp':
  degit moveread/vite-react-ts-template {{OUTPUT}}
  cd {{OUTPUT}} && yarn