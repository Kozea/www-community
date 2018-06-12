PYTHON_ONLY = 1

HOST ?= 0.0.0.0
API_PORT ?= 5000

export SERVER = $(HOST):$(API_PORT)
export FLASK_APP ?= $(PWD)/community.py
export FLASK_CONFIG ?= $(PWD)/community.cfg
export FLASK_DEBUG ?= 1
export PYTEST_ARGS ?= 

# Python env
PYTHON_VERSION ?= python
PIPENV ?= $(shell command -v pipenv 2> /dev/null)
VENV = $(PWD)/.venv
export PIPENV_VENV_IN_PROJECT = 1
