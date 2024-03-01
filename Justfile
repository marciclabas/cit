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
scaffold TEMPLATE OUTPUT *PARAMS:
  degit moveread/{{TEMPLATE}} {{PARAMS}} {{OUTPUT}} && \
  cd {{OUTPUT}} && \
  json -I -f package.json -e 'this.name = "{{OUTPUT}}"'

# Degits and installs the vite playground template
playground OUTPUT='playground':
  degit moveread/vite-playground-template {{OUTPUT}} && \
  cd {{OUTPUT}} && \
  json -I -f package.json -e 'this.name = "{{OUTPUT}}"' && \
  yarn

# Degits and installs the vite empty template
devapp OUTPUT='devapp':
  degit moveread/vite-react-ts-template {{OUTPUT}} && \
  cd {{OUTPUT}} && \
  json -I -f package.json -e 'this.name = "{{OUTPUT}}"' && \
  yarn

# Open lite-mode
lite-mode:
  code /home/m4rs/mr-github/frontend/lite-mode

# Open user-mode
user-mode:
  code /home/m4rs/mr-github/lib/js/clients/user-mode/

# Generates a GitHub workflow file to deploy to GitHub pages
workflow FOLDER:
  @bash -c '{{CIT}}/workflow.sh {{FOLDER}}'

# Link the basic Moveread images
images DEST='.':
  ln -s {{CIT}}/images {{DEST}}