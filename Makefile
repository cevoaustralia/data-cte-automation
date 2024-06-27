# Makefile for managing the AWS Python Project



# Variables
VENV_DIR := venv
ACTIVATE := source $(VENV_DIR)/bin/activate
SHELL := /bin/bash
DEACTIVATE := deactivate

# Help command to display available commands
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  venv          - Create a virtual environment"
	@echo "  requirements  - Install dependencies"
#	@echo "  deploy        - Deploy using AWS CloudFormation"
	@echo "  clean         - Clean the environment"
	@echo "  setup         - Full setup"

# Creating a local python copy
.PHONY: local 
local: 
	pyenv local 3.11.1
	pip install --upgrade pip

# Create a virtual environment
.PHONY: venv
venv:
	python -m venv $(VENV_DIR)

# Activate the virtual environment (useful for running commands interactively)
.PHONY: activate
activate:
	@echo "Run 'source $(VENV_DIR)/bin/activate' to activate the virtual environment."

.PHONY: deactivate
deactivate:
	@echo "Run 'source deactivate' to activate the virtual environment."

# Install dependencies
.PHONY: requirements
requirements: venv
	$(ACTIVATE) && pip install -r requirements.txt
# Add similar lines for other lambdas or libraries as needed

# Clean the environment (removing virtual environment)
.PHONY: clean
clean: deactivate
	rm -rf $(VENV_DIR)

# Full setup: create venv, install requirements, install libs, install layers
.PHONY: setup
setup: local venv requirements