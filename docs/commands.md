# Commands

Cit ships with many useful commands. See the [customization](customization.md) page for how to easily add your own.

## Scaffolding

| Command | Description |
| --- | --- |
| `cit scaffold python my-pkg "Description of My package"` | Scaffold a Python package |
| `cit scaffold typescript my-ts-pkg` | Scaffold a TypeScript package |
| `cit scaffold react my-spa` | Scaffold a React x Vite x ChakraUI SPA |
| `cit scaffold next my-next-app` | Scaffold a Next.js x Tailwind app |
| `cit scaffold capacitor my-cap-app` | Scaffold a Capacitor x React x Vite app |

## Running scripts, service, containers, etc.

| Command | Description |
| --- | --- |
| `cit run postgres` | Run a PostgreSQL container |
| `cit kill postgres` | Kill the PostgreSQL container |
| `cit run redis` | Run a Redis container |
| `cit kill redis` | Kill the Redis container |
| `cit run rabbitmq` | Run a RabbitMQ container |
| `cit kill rabbitmq` | Kill the RabbitMQ container |

## Opening repositories
| Command | Description |
| --- | --- |
| `cit open cit` | Open the cit repository |
| `cit open <my-repo>` | You can customize this! |


Now, let's [customize](customization.md) it!