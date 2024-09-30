# Cit[adel]

> The developer productivity tool

## Features
- Template scaffolding
- Run scripts
- Open repositories
- Fully customizable

## Commands

**Scaffolding**

```bash
cit scaffold python my-pkg "Description of My package"
cit scaffold react my-spa
cit scaffold typescript my-ts-pkg
cit scaffold next my-next-app
# etc
```

**Running scripts**

```bash
cit run postgres
cit kill postgres

cit run redis
cit kill redis

cit run rabbitmq
cit kill rabbitmq

# etc
```

**Opening repos**

```bash
cit open cit
cit open my-repo # customizable
```

**Adding stuff**

```bash
cit add python # adds .vscode/config.json, .venv, requirements.txt, Justfile (with some commands)
cit add docker # adds Justfile with common commands
```

**Other commands**

Fully customizable, using [`just`](https://github.com/casey/just)

## Installation

- Install [`just`](https://just.systems/man/en/packages.html)
- Add source to `.bashrc` (or `.zshrc`, etc.):

```bash
source /path/to/cit/source.sh
```