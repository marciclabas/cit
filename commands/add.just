help:
  @just --list


# Add a .venv, requirements.txt, .vscode with config. Installs requirements.txt if existent
python HERE='.':
  mkdir {{invocation_directory()}}/{{HERE}}/.vscode || :
  cd {{invocation_directory()}}/{{HERE}}/.vscode && \
    [ ! -f settings.json ] && echo "{}" > settings.json || : && \
    jq '. + {"python.defaultInterpreterPath": ".venv/bin/python"}' settings.json > temp.json && mv temp.json settings.json && \
    jq '. + {"python.analysis.typeCheckingMode": "standard"}' settings.json > temp.json && mv temp.json settings.json && \
    jq '. + {"cursorpyright.analysis.typeCheckingMode": "standard"}' settings.json > temp.json && mv temp.json settings.json

  cat $CIT_HOME/resources/python/.gitignore >> {{invocation_directory()}}/{{HERE}}/.gitignore

  if [ ! -e "{{invocation_directory()}}/{{HERE}}/.cursor" ]; then \
    cp -r $CIT_HOME/resources/python/.cursor "{{invocation_directory()}}/{{HERE}}/.cursor"; \
  fi

  cd {{invocation_directory()}}/{{HERE}} && \
  if [ ! -f requirements.txt ]; then \
    echo "build" >> requirements.txt && \
    echo "twine" >> requirements.txt && \
    echo "ipykernel" >> requirements.txt && \
    echo "pyright" >> requirements.txt && \
    echo "mcp" >> requirements.txt && \
    echo "python-dotenv" >> requirements.txt && \
    python3.11 -m venv .venv && \
    .venv/bin/python -m pip install --upgrade pip && \
    .venv/bin/python -m pip install -r requirements.txt; \
  fi 
  
# Add recipe to publish to GitHub pages. Requires activating them on github!
gh-pages:
  cat $CIT_HOME/resources/recipes/gh-pages.just >> {{invocation_directory()}}/Justfile

# Add Docker recipes
docker:
  cat $CIT_HOME/resources/recipes/docker.just >> {{invocation_directory()}}/Justfile
