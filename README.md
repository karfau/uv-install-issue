# fastapi_template
A service to manage change of schoolyears

## Installation

```bash
pip compile requirements.in
pip install -e .[tests]
```
or using https://github.com/astral-sh/uv
```bash
uv pip compile requirements.in -o requirements.txt
uv pip install -e .[tests]
```
## Running the application

### Install CDK dependencies
```bash
make cdk_install
```
### Synthesize the manifests files
```bash
make synth
```
### Install tilt
https://docs.tilt.dev/install
```bash
curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash
``` 
### Start service
```bash
tilt up
```
### Stop service
```bash
tilt down
```

## Format and linter
We are using [ruff](https://docs.astral.sh/ruff/) as linter and formatter. There is a pre-commit configuration. 
To install it using [pre-commit](https://pre-commit.com/) via
```bash
pip install pre-commit
pre-commit
```
When committing the `ruff check .` and `ruff format` will now run automatically.

## Migrations with 'alembic'

### Generate new migrations

This requires the postgres to be accessable by alembic. Start the database in your k8s
cluster and set these environment variables (best via a `.bashrc` file):

```
export SEGMENT=loc00
export DB_HOST=localhost
export DB_PORT=25432
export DB_USER=postgres
export DB_PASSWORD=postgres
export DB_NAME=fastapi_template_db
```

Generate migration with
```sh
alembic revision --autogenerate -m "<some meaningful title>"
```

### Apply migrations
```sh
alembic upgrade head
```