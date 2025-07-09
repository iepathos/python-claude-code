# Python Claude Code Starter Template

A modern Python project template optimized for development with Claude Code. This template provides a comprehensive foundation for Python applications with integrated AI assistance, modern tooling, and best practices.

## 🚀 Features

- **Claude Code Integration**: Pre-configured CLAUDE.md with Python-specific guidelines
- **Modern Python Setup**: Support for Python 3.8+ with type hints and async capabilities
- **Testing Framework**: pytest with coverage reporting and fixtures
- **Code Quality**: Black, isort, flake8, mypy, and pre-commit hooks
- **Documentation**: Sphinx-ready documentation with Google-style docstrings
- **Dependency Management**: Poetry or pip with requirements files
- **CI/CD Ready**: GitHub Actions workflows for testing and deployment
- **Development Tools**: Justfile for common tasks and development workflows

## 📋 Prerequisites

- Python 3.8 or higher
- pip or Poetry for dependency management
- git for version control
- (Optional) just command runner for using the Justfile

## 🛠️ Quick Start

1. **Clone this template**:
   ```bash
   git clone <your-repo-url>
   cd <your-project-name>
   ```

2. **Set up Python environment**:
   ```bash
   # Using venv
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   
   # Or using Poetry
   poetry install
   ```

3. **Install dependencies**:
   ```bash
   # Using pip
   pip install -r requirements.txt
   pip install -r requirements-dev.txt
   
   # Or using Poetry
   poetry install --with dev
   ```

4. **Run initial setup**:
   ```bash
   # Install pre-commit hooks
   pre-commit install
   
   # Run tests to verify setup
   pytest
   ```

## 📁 Project Structure

```
python-project/
├── src/                    # Source code
│   └── your_package/       # Your Python package
│       ├── __init__.py
│       ├── main.py        # Entry point
│       └── modules/       # Additional modules
├── tests/                 # Test files
│   ├── __init__.py
│   ├── conftest.py        # pytest fixtures
│   └── test_*.py          # Test modules
├── docs/                  # Documentation
├── scripts/               # Utility scripts
├── .claude/               # Claude Code configuration
│   └── commands/          # Custom commands
├── .github/               # GitHub Actions workflows
├── pyproject.toml         # Poetry configuration (if using Poetry)
├── requirements.txt       # Production dependencies
├── requirements-dev.txt   # Development dependencies
├── setup.py              # Package setup (if distributing)
├── .gitignore
├── .pre-commit-config.yaml
├── CLAUDE.md             # Claude Code guidelines
├── Justfile              # Development commands
└── README.md             # This file
```

## 🧰 Available Commands

If you have `just` installed, you can use these commands:

```bash
just test           # Run all tests
just lint           # Run linters (black, isort, flake8, mypy)
just format         # Format code with black and isort
just coverage       # Run tests with coverage report
just docs           # Build documentation
just clean          # Clean up temporary files
just install        # Install all dependencies
```

Without `just`, you can run the underlying commands directly:

```bash
# Testing
pytest
pytest --cov=src --cov-report=html

# Linting and formatting
black src tests
isort src tests
flake8 src tests
mypy src

# Documentation
cd docs && make html
```

## 🤖 Claude Code Integration

This template includes a comprehensive CLAUDE.md file that provides:

- Python-specific coding guidelines and best practices
- Common patterns and anti-patterns
- Testing and documentation standards
- Performance and security considerations
- Example prompts for effective AI assistance

When using Claude Code with this template, Claude will automatically follow these guidelines to generate high-quality, consistent Python code.

## 🧪 Testing

The project uses pytest for testing:

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=src --cov-report=term-missing

# Run specific test file
pytest tests/test_main.py

# Run with verbose output
pytest -v
```

## 📝 Code Style

This template enforces consistent code style using:

- **Black**: Opinionated code formatter
- **isort**: Import statement organizer
- **flake8**: Style guide enforcement
- **mypy**: Static type checker

Pre-commit hooks automatically run these tools before each commit.

## 🔧 Configuration Files

- `pyproject.toml`: Project metadata and tool configuration (if using Poetry)
- `setup.cfg`: Configuration for setuptools and tools like flake8
- `.pre-commit-config.yaml`: Pre-commit hook configuration
- `pytest.ini` or `pyproject.toml`: pytest configuration
- `.gitignore`: Git ignore patterns for Python projects

## 🚀 Deployment

The template includes GitHub Actions workflows for:

- Running tests on multiple Python versions
- Checking code quality
- Building and publishing packages
- Deploying to various platforms

## 📚 Documentation

Documentation is set up using Sphinx:

```bash
# Build documentation
cd docs
make html

# View documentation
open _build/html/index.html  # On macOS
# Or start a local server
python -m http.server -d _build/html
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests and linting (`just test && just lint`)
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## 📄 License

This template is open source and available under the MIT License.

## 🙏 Acknowledgments

- Built with best practices from the Python community
- Optimized for Claude Code AI assistance
- Inspired by modern Python project templates

---

Happy coding! 🐍✨