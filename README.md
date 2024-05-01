# Citadel v2
## Quickstart

- Show all recipes
  ```bash
  cit
  ```
- Scaffold package/app templates
  ```bash
  cit scaffold python my-pkg "Description of My package"
  cit scaffold react app-without-description
  cit scaffold typescript my-ts-pkg
  ```
- Run stuff
    ```bash
    cit run tfserving-image
    cit run whatever-really
    ```
- Open repositories (generally in vscode)
  ```bash
  cit open cit
  cit open this-repo-I-work-very-often-in
  ```
- Add stuff to current project
  ```bash
  cit add images
  cit add python # adds .vscode/config.json, virutal env, requirements.txt, Justfile with commands
  ```

## Release Notes (new in v2)
- Now based on Just modules
- Custom bash completions for modules
- Simplified templates
