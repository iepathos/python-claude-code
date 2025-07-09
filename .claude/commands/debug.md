# Debug Command

Runs comprehensive debugging analysis for Python projects, including tests, linting, type checking, and intelligent error analysis optimized for Claude Code workflows.

## Usage
This command performs automated debugging and provides structured error analysis for rapid issue resolution.

## Core Analysis Steps
1. **Test Execution**: Comprehensive test suite with coverage analysis
2. **Code Quality**: Formatting, linting, and static analysis
3. **Type Checking**: mypy static type analysis
4. **Error Intelligence**: Advanced error categorization and solution suggestions
5. **Dependency Validation**: Package integrity and version compatibility

## Test Execution Strategy
```bash
# Progressive test execution with detailed output
pytest -v                    # Basic unit tests with verbose output
pytest --cov=src            # Coverage analysis with detailed report
pytest -x                   # Stop on first failure for quick debugging
pytest -k "test_specific"   # Run specific test patterns
```

## Code Quality Pipeline
```bash
# Automated formatting and linting
black src tests             # Code formatting
isort src tests            # Import organization
flake8 src tests           # Style guide enforcement
mypy src                   # Static type checking
```

## Complete CI Pipeline
```bash
# Full continuous integration workflow
just ci                    # Sequential: format → lint → type-check → test
# Or manually:
black . && isort . && flake8 . && mypy . && pytest
```

## Advanced Error Analysis & Claude Code Integration

### Intelligent Error Detection
The debug command provides structured error analysis optimized for Claude Code workflows:

1. **Context-Aware Pattern Recognition**:
   - **Import Errors**: Missing dependencies, circular imports, module not found
   - **Type Errors**: Type hint mismatches, missing annotations, incompatible types
   - **Async Issues**: Missing await, synchronous code in async context
   - **Test Failures**: Assertion analysis with suggested fixes
   - **Syntax Errors**: Common Python gotchas and fixes

2. **Project-Specific Error Categories**:
   - **API Integration**: Request/response validation, authentication issues
   - **Database Operations**: Connection failures, query errors, migration issues
   - **Async/Await**: Event loop problems, coroutine management
   - **Configuration**: Environment variable issues, settings validation
   - **Performance**: Memory leaks, slow queries, inefficient algorithms

3. **Claude Code Optimized Diagnostics**:
   - **File Location**: Precise `file_path:line_number` references for easy navigation
   - **Search Patterns**: Provides `rg` commands for investigating related code
   - **Fix Suggestions**: Actionable code changes with context
   - **Test Recommendations**: Specific test cases to verify fixes

### Automated Recovery Actions
```bash
# Safe automatic fixes applied in sequence
pip install -r requirements.txt    # Dependency installation
black src tests                    # Code formatting
isort src tests                    # Import organization
pip check                         # Dependency conflict detection
```

## Example Debug Session Output

```
🔍 Python Debug Analysis - Claude Code Optimized

=== CODE QUALITY ===
✅ black: All files formatted
❌ isort: 3 files need import sorting
✅ flake8: No style violations
❌ mypy: 2 type errors found

=== TEST EXECUTION ===  
✅ pytest: 48/50 tests passed
❌ Failed: test_user_authentication, test_data_validation
✅ Coverage: 92.3% (target: 90%+)

=== DEPENDENCY CHECK ===
✅ pip check: No conflicts found
⚠️  outdated: 3 packages have newer versions available

🧠 INTELLIGENT ERROR ANALYSIS

1. **Type Error** - src/services/user_service.py:45
   🔍 Pattern: Incompatible return type
   💡 Fix: Change return type hint from `str` to `Optional[str]`
   📝 Code: `def get_user(id: int) -> Optional[str]:`
   🔎 Search: `rg "def get_user" src/services/`

2. **Import Order** - src/api/routes.py:1-10
   🔍 Pattern: Incorrect import grouping
   💡 Fix: Run `isort src/api/routes.py`
   🔎 Search: `rg "^import|^from" src/api/routes.py`

3. **Test Failure** - tests/test_authentication.py:23
   🔍 Pattern: Mock not properly configured
   💡 Fix: Add return_value to mock: `mock_auth.return_value = True`
   🔎 Search: `rg "mock_auth" tests/`

4. **Async Warning** - src/utils/cache.py:67
   🔍 Pattern: Synchronous operation in async function
   💡 Fix: Use `await asyncio.sleep(1)` instead of `time.sleep(1)`
   🔎 Search: `rg "time\.sleep" src/`

🔧 AUTOMATED RECOVERY
✅ black: Code formatting applied
✅ isort: Import order fixed
✅ pip install: All dependencies installed
✅ pre-commit: Hooks installed and passing

🎯 CLAUDE CODE ACTIONS
1. Edit src/services/user_service.py:45 - Fix return type hint
2. Edit tests/test_authentication.py:23 - Configure mock properly
3. Edit src/utils/cache.py:67 - Use async sleep
4. Run: `pytest tests/test_authentication.py` to verify fix
5. Run: `mypy src` to confirm type errors resolved

📊 PROJECT HEALTH
- Code Quality: ⚠️  Requires fixes (4 issues)
- Test Coverage: ✅ 92.3% (exceeds 90% target)
- Dependencies: ✅ All installed, 3 outdated
- Type Safety: ⚠️  2 type errors to fix
```

## Python-Specific Intelligence

### Common Python Patterns
- **Import Management**: Detects circular imports, missing __init__.py files
- **Type Safety**: Validates type hints, suggests appropriate annotations
- **Async/Await**: Identifies blocking operations in async code
- **Memory Management**: Detects common memory leak patterns
- **Security Issues**: SQL injection risks, hardcoded secrets

### Claude Code Workflow Optimization
- **Precise Navigation**: `file_path:line_number` format for instant IDE navigation
- **Search Integration**: Ready-to-use `rg` commands for code investigation
- **Batch Operations**: Parallelizable fix suggestions for efficient execution
- **Context Preservation**: Maintains error context across multiple debugging iterations

### Common Command Alignment
All commands work with standard Python tooling:
- ✅ `pytest` → Test execution with coverage
- ✅ `black` → Code formatting
- ✅ `isort` → Import organization
- ✅ `flake8` → Linting
- ✅ `mypy` → Type checking

## Prerequisites & Dependencies

### Required Tools
```bash
# Core Python toolchain
python --version           # Python 3.8+ required
pip --version             # Package installer
pytest --version          # Testing framework

# Code quality tools
black --version           # Code formatter
isort --version          # Import sorter
flake8 --version         # Linter
mypy --version           # Type checker
```

### Common Project Dependencies
```bash
# Web frameworks
fastapi                   # Modern web API framework
flask                    # Lightweight web framework
django                   # Full-featured web framework

# Data and validation
pydantic                 # Data validation using type hints
sqlalchemy               # Database toolkit
pandas                   # Data analysis

# Testing and development
pytest                   # Testing framework
pytest-cov              # Coverage plugin
pytest-mock             # Mocking support
hypothesis              # Property-based testing
```

### Virtual Environment Setup
```bash
# Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
pip install -r requirements-dev.txt

# Install pre-commit hooks
pre-commit install
```

## Error Categories and Solutions

### Import Errors
- **ModuleNotFoundError**: Check virtual environment activation and installed packages
- **ImportError**: Verify module structure and __init__.py files
- **Circular Import**: Restructure code to break dependency cycles

### Type Errors
- **Type hint mismatch**: Update function signatures to match implementation
- **Missing annotations**: Add type hints to function parameters and returns
- **Generic type issues**: Use proper typing imports (List, Dict, Optional)

### Test Failures
- **Assertion errors**: Review test logic and expected values
- **Fixture issues**: Check pytest fixture scope and dependencies
- **Mock configuration**: Ensure mocks have proper return values and side effects

### Performance Issues
- **Slow tests**: Use pytest-benchmark for performance testing
- **Memory leaks**: Profile with memory_profiler
- **Inefficient queries**: Use logging to identify slow database operations