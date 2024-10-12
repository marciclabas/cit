# Customization

## Understanding Cit

The `cit` repo has this structure:

```
cit/
  ...
  commands/
    cit.just
    scaffold.just
    open.just
    run.just
    ...
```

The `cit` command is an alias to

```bash
just -f $CIT_HOME/commands/cit.just
```

The main `cit.just` imports other `.just` files as submodules. Check out [`just`](https://github.com/casey/just) to learn more about it!

## Adding a new subcommand

We want to add:

```bash
cit <command> <new-subcommand> # e.g. cit run kafka
```

We'll have to add a new rule to `commands/<command>.just`:

```Makefile
# commands/run.just

kafka:
  docker run --rm -d --name kafka -p 9092:9092 apache/kafka:latest
```


## Adding a new command

We want to add:

```bash
cit <new-command> # e.g. cit say
```

We'll have to add a new `.just` file (a Just module) to `commands/`:

```Makefile
# commands/say.just

hello:
  @echo Hello

bye:
  @echo Bye
```

And then we'll have to import it in `commands/cit.just`:

```Makefile
# commands/cit.just
mod say
```
