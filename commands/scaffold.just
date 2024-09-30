TEMPLATES := "$CIT_HOME" + "/resources/templates"

help:
  @just --list

# Scaffold a python package
python NAME DESCRIPTION='package_description':
  cp -r {{TEMPLATES}}/python-pkg {{invocation_directory()}}/{{NAME}}
  $CIT_SCRIPTS/replace.sh {{invocation_directory()}}/{{NAME}} '<DESCRIPTION>' '{{DESCRIPTION}}'
  cd {{invocation_directory()}}/{{NAME}} && \
  sed -i 's/<NAME>/{{file_name(NAME)}}/g' {{invocation_directory()}}/{{NAME}}/pyproject.toml && \
  sed -i 's/<NAME>/{{titlecase(file_name(NAME))}}/g' {{invocation_directory()}}/{{NAME}}/README.md && \
  sed -i 's/<NAME>/{{titlecase(file_name(NAME))}}/g' {{invocation_directory()}}/{{NAME}}/src/NAME/__init__.py && \
  mv src/NAME  src/{{snakecase(file_name(NAME))}}

# Scaffold a typescript node package
typescript NAME DESCRIPTION='package_description':
  cp -r {{TEMPLATES}}/ts-pkg {{invocation_directory()}}/{{NAME}}
  $CIT_SCRIPTS/replace.sh {{invocation_directory()}}/{{NAME}} '<DESCRIPTION>' '{{DESCRIPTION}}'
  cd {{invocation_directory()}}/{{NAME}} && \
  sed -i 's/<NAME>/{{file_name(NAME)}}/g' package.json && \
  sed -i 's/<NAME>/{{titlecase(file_name(NAME))}}/g' README.md && \
  yarn

# Scaffold a react x vite app
react NAME='app' DESCRIPTION='app_description':
  cp -r {{TEMPLATES}}/react-vite {{invocation_directory()}}/{{NAME}}
  $CIT_SCRIPTS/replace.sh {{invocation_directory()}}/{{NAME}} '<DESCRIPTION>' '{{DESCRIPTION}}'
  cd {{invocation_directory()}}/{{NAME}} && \
  sed -i 's/<NAME>/{{file_name(NAME)}}/g' package.json && \
  sed -i 's/<NAME>/{{titlecase(file_name(NAME))}}/g' index.html && \
  yarn

# Scaffold a next x tailwind app
next NAME='app' DESCRIPTION='app_description':
  cp -r {{TEMPLATES}}/react-next {{invocation_directory()}}/{{NAME}}
  $CIT_SCRIPTS/replace.sh {{invocation_directory()}}/{{NAME}} '<DESCRIPTION>' '{{DESCRIPTION}}'
  cd {{invocation_directory()}}/{{NAME}} && \
  sed -i 's/<NAME>/{{file_name(NAME)}}/g' package.json && \
  sed -i 's/<NAME>/{{titlecase(file_name(NAME))}}/g' src/app/layout.tsx && \
  yarn

# Scaffold a react x capacitor app
capacitor NAME='app' DESCRIPTION='app_description':
  cp -r {{TEMPLATES}}/react-capacitor {{invocation_directory()}}/{{NAME}}
  $CIT_SCRIPTS/replace.sh {{invocation_directory()}}/{{NAME}} '<DESCRIPTION>' '{{DESCRIPTION}}'
  cd {{invocation_directory()}}/{{NAME}} && \
  sed -i 's/<NAME>/{{file_name(NAME)}}/g' package.json && \
  sed -i 's/<NAME>/{{titlecase(file_name(NAME))}}/g' index.html && \
  yarn
  echo "Run 'just init' to create the android project!"