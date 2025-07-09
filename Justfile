# Python Project Justfile
# Common development tasks for Python projects

# Variables
PYTHON := "python3"
PIP := "pip"
SRC_DIR := "src"
TEST_DIR := "tests"
DOCS_DIR := "docs"

# Default task - show available commands
default:
    @just --list

# Setup development environment
setup:
    @echo "Setting up development environment..."
    {{PYTHON}} -m venv venv
    @echo "Virtual environment created. Activate with: source venv/bin/activate"
    @echo "Then run: just install"

# Install dependencies
install:
    @echo "Installing dependencies..."
    {{PIP}} install -r requirements.txt
    @if [ -f requirements-dev.txt ]; then {{PIP}} install -r requirements-dev.txt; fi
    @if [ -f pyproject.toml ]; then {{PIP}} install -e .; fi

# Install pre-commit hooks
install-hooks:
    @echo "Installing pre-commit hooks..."
    pre-commit install

# Run tests
test:
    @echo "Running tests..."
    pytest {{TEST_DIR}} -v

# Run tests with coverage
test-cov:
    @echo "Running tests with coverage..."
    pytest {{TEST_DIR}} --cov={{SRC_DIR}} --cov-report=term-missing --cov-report=html

# Run tests and stop on first failure
test-fast:
    @echo "Running tests (stop on first failure)..."
    pytest {{TEST_DIR}} -x

# Run specific test file or pattern
test-specific pattern:
    @echo "Running tests matching: {{pattern}}"
    pytest -k "{{pattern}}" -v

# Code formatting
format:
    @echo "Formatting code..."
    black {{SRC_DIR}} {{TEST_DIR}}
    isort {{SRC_DIR}} {{TEST_DIR}}

# Check code formatting
format-check:
    @echo "Checking code formatting..."
    black --check {{SRC_DIR}} {{TEST_DIR}}
    isort --check-only {{SRC_DIR}} {{TEST_DIR}}

# Lint code
lint:
    @echo "Linting code..."
    flake8 {{SRC_DIR}} {{TEST_DIR}}
    @if command -v ruff >/dev/null 2>&1; then ruff check {{SRC_DIR}} {{TEST_DIR}}; fi

# Type checking
type-check:
    @echo "Running type checks..."
    mypy {{SRC_DIR}}

# Run all quality checks
quality: format-check lint type-check

# Full CI pipeline
ci: quality test-cov

# Clean up generated files
clean:
    @echo "Cleaning up..."
    find . -type f -name "*.pyc" -delete
    find . -type d -name "__pycache__" -delete
    find . -type d -name "*.egg-info" -exec rm -rf {} +
    rm -rf build/
    rm -rf dist/
    rm -rf .coverage
    rm -rf htmlcov/
    rm -rf .pytest_cache/
    rm -rf .mypy_cache/

# Security audit
security:
    @echo "Running security audit..."
    @if command -v bandit >/dev/null 2>&1; then bandit -r {{SRC_DIR}}; fi
    @if command -v safety >/dev/null 2>&1; then safety check; fi

# Generate documentation
docs:
    @echo "Building documentation..."
    @if [ -d {{DOCS_DIR}} ]; then cd {{DOCS_DIR}} && make html; fi

# Serve documentation locally
docs-serve:
    @echo "Serving documentation..."
    @if [ -d {{DOCS_DIR}}/_build/html ]; then cd {{DOCS_DIR}}/_build/html && {{PYTHON}} -m http.server 8000; fi

# Install package in development mode
install-dev:
    @echo "Installing package in development mode..."
    {{PIP}} install -e .

# Build package
build:
    @echo "Building package..."
    {{PYTHON}} -m build

# Build and upload to PyPI (requires twine)
publish:
    @echo "Publishing to PyPI..."
    {{PYTHON}} -m build
    twine upload dist/*

# Update dependencies
update-deps:
    @echo "Updating dependencies..."
    {{PIP}} list --outdated
    @echo "Run 'pip install --upgrade <package>' to update specific packages"

# Generate requirements.txt from current environment
freeze:
    @echo "Generating requirements.txt..."
    {{PIP}} freeze > requirements.txt

# Run Python REPL with project imports
repl:
    @echo "Starting Python REPL..."
    {{PYTHON}} -c "import sys; sys.path.insert(0, '{{SRC_DIR}}'); import IPython; IPython.start_ipython()"

# Run the main application (if exists)
run *args:
    @echo "Running application..."
    {{PYTHON}} -m {{SRC_DIR}}.main {{args}}

# Profile performance
profile:
    @echo "Profiling application..."
    {{PYTHON}} -m cProfile -o profile.stats -m {{SRC_DIR}}.main

# Start development server (for web apps)
dev:
    @echo "Starting development server..."
    @if [ -f "{{SRC_DIR}}/app.py" ]; then {{PYTHON}} {{SRC_DIR}}/app.py; fi
    @if [ -f "manage.py" ]; then {{PYTHON}} manage.py runserver; fi

# Database migrations (for Django projects)
migrate:
    @if [ -f "manage.py" ]; then {{PYTHON}} manage.py migrate; fi

# Create database migrations (for Django projects)
makemigrations:
    @if [ -f "manage.py" ]; then {{PYTHON}} manage.py makemigrations; fi

# Run Django shell
shell:
    @if [ -f "manage.py" ]; then {{PYTHON}} manage.py shell; fi

# Jupyter notebook
notebook:
    @echo "Starting Jupyter notebook..."
    jupyter notebook

# Check dependency vulnerabilities
check-deps:
    @echo "Checking for dependency vulnerabilities..."
    @if command -v pip-audit >/dev/null 2>&1; then pip-audit; fi

# Pre-commit checks
pre-commit:
    @echo "Running pre-commit checks..."
    pre-commit run --all-files

# Initialize new Python project structure
init-project name:
    @echo "Initializing project structure for {{name}}..."
    mkdir -p {{SRC_DIR}}/{{name}}
    mkdir -p {{TEST_DIR}}
    mkdir -p {{DOCS_DIR}}
    touch {{SRC_DIR}}/{{name}}/__init__.py
    touch {{SRC_DIR}}/{{name}}/main.py
    touch {{TEST_DIR}}/__init__.py
    touch {{TEST_DIR}}/conftest.py
    touch {{TEST_DIR}}/test_{{name}}.py
    touch requirements.txt
    touch requirements-dev.txt
    touch .gitignore
    touch .env.example
    echo "Project structure created for {{name}}"

# Show project info
info:
    @echo "Python Version: $({{PYTHON}} --version)"
    @echo "Pip Version: $({{PIP}} --version)"
    @echo "Virtual Environment: ${VIRTUAL_ENV:-Not activated}"
    @echo "Source Directory: {{SRC_DIR}}"
    @echo "Test Directory: {{TEST_DIR}}"
    @if [ -f requirements.txt ]; then echo "Requirements: $(wc -l < requirements.txt) packages"; fi