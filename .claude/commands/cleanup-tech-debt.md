# /cleanup-tech-debt

Analyze the codebase for technical debt and perform comprehensive cleanup including code organization improvements, dead code removal, dependency optimization, and structural refactoring. This command systematically identifies and resolves technical debt to improve maintainability and code quality.

## Variables

SCOPE: $ARGUMENTS (optional - specify scope like "src/services", "tests", "scripts", or "all" for entire codebase)

## Execute

### Phase 1: Technical Debt Analysis

1. **Code Organization Analysis**
   - Scan for misplaced files and inconsistent package structure
   - Identify files that should be moved to better locations
   - Check for circular imports and dependency cycles
   - Analyze module cohesion and coupling

2. **Dead Code Detection**
   - Find unused functions, classes, and variables
   - Identify unreachable code paths
   - Locate abandoned files and empty directories
   - Check for commented-out code blocks

3. **Dependency Audit**
   - Review requirements.txt/pyproject.toml for unused dependencies
   - Check for duplicate functionality across modules
   - Identify outdated or vulnerable dependencies
   - Find missing dependencies that should be explicit

4. **Code Quality Issues**
   - Scan for overly complex functions (high cyclomatic complexity)
   - Find functions with too many parameters
   - Identify large files that should be split
   - Check for inconsistent naming conventions

5. **Type Annotation Coverage**
   - Find functions missing type hints
   - Identify incomplete or incorrect type annotations
   - Check for Any types that could be more specific
   - Review return type consistency

### Phase 2: Cleanup Strategy Planning

1. **Prioritize Issues**
   - High Impact: Security vulnerabilities, performance issues, maintainability blockers
   - Medium Impact: Code organization, redundancy, minor architectural issues
   - Low Impact: Style consistency, documentation gaps, minor optimizations

2. **Create Cleanup Plan**
   - Generate ordered list of cleanup tasks
   - Group related changes for atomic commits
   - Identify breaking changes that need careful handling
   - Plan testing strategy for each change

3. **Risk Assessment**
   - Identify changes that could break existing functionality
   - Plan rollback strategies for risky changes
   - Determine which changes need comprehensive testing
   - Flag changes that require manual review

### Phase 3: Automated Cleanup

1. **Safe Automated Fixes**
   - Run `black` for consistent formatting
   - Execute `isort` for import organization
   - Apply `autoflake` to remove unused imports
   - Fix simple linting issues with `autopep8`

2. **Code Organization**
   - Move misplaced files to appropriate modules
   - Rename files to follow naming conventions
   - Reorganize package structure if needed
   - Update import statements after moves

3. **Dead Code Removal**
   - Remove unused functions and classes
   - Delete commented-out code blocks
   - Remove empty files and directories
   - Clean up unused test files

4. **Dependency Optimization**
   - Remove unused dependencies from requirements files
   - Consolidate duplicate functionality
   - Update outdated dependencies (with testing)
   - Add missing explicit dependencies

### Phase 4: Structural Improvements

1. **Function Refactoring**
   - Split overly long functions into smaller ones
   - Extract common functionality into utilities
   - Reduce function parameter counts
   - Improve function naming and documentation

2. **Module Structure**
   - Reorganize modules for better cohesion
   - Fix circular imports
   - Ensure proper separation of concerns
   - Improve class and interface definitions

3. **Exception Handling Standardization**
   - Standardize exception handling patterns
   - Add missing try/except blocks
   - Improve error messages and context
   - Create custom exception hierarchies

4. **Code Duplication Elimination**
   - Extract common patterns into shared functions
   - Create utility functions for repeated code
   - Consolidate similar implementations
   - Improve code reusability

### Phase 5: Testing and Validation

1. **Pre-cleanup Testing**
   - Run full test suite with pytest to establish baseline
   - Execute `pytest --cov` for coverage report
   - Run type checking with mypy
   - Perform integration testing

2. **Post-cleanup Validation**
   - Run full test suite after each major change
   - Verify type checking still passes
   - Check that coverage hasn't decreased
   - Validate that all modules still import correctly

3. **Manual Testing**
   - Test critical user flows
   - Verify API endpoints still work
   - Check CLI functionality
   - Validate configuration loading

### Phase 6: Documentation and Reporting

1. **Update Documentation**
   - Update module docstrings for moved files
   - Fix outdated comments and examples
   - Update README if package structure changed
   - Add missing docstrings

2. **Generate Cleanup Report**
   - Summary of changes made
   - List of removed dead code
   - Dependencies added/removed
   - Performance improvements achieved
   - Remaining technical debt items

3. **Commit Changes**
   - Create atomic commits for each cleanup category
   - Use descriptive commit messages
   - Include test results in commit messages
   - Add Claude Code attribution

## Example Usage

```
/cleanup-tech-debt
/cleanup-tech-debt "src/services"
/cleanup-tech-debt "tests"
/cleanup-tech-debt "scripts"
/cleanup-tech-debt "all"
```

## Cleanup Categories

### Code Organization
- Move files to appropriate modules
- Rename files for consistency
- Fix module import structures
- Eliminate circular imports

### Dead Code Removal
- Remove unused functions and classes
- Delete commented-out code
- Remove empty files and directories
- Clean up unused test fixtures

### Dependency Management
- Remove unused dependencies
- Update outdated packages
- Add missing explicit dependencies
- Consolidate duplicate functionality

### Structural Improvements
- Refactor overly complex functions
- Extract common utilities
- Improve exception handling patterns
- Standardize naming conventions

### Performance Optimizations
- Remove inefficient algorithms
- Optimize memory usage
- Improve async/await patterns
- Fix resource leaks

## Safety Measures

1. **Backup Strategy**
   - Create backup branches before major changes
   - Commit frequently with descriptive messages
   - Test after each significant change
   - Maintain rollback capability

2. **Testing Requirements**
   - All tests must pass before and after cleanup
   - Type checking must pass
   - Coverage must not decrease
   - Critical functionality verified

3. **Review Process**
   - Generate detailed change summary
   - Highlight breaking changes
   - Document removed functionality
   - Provide migration guidance if needed

## Integration with Existing Commands

- Use `/commit-changes` for individual cleanup commits
- Create specs with `/create-spec` for major refactoring
- Run `/debug` if issues arise during cleanup
- Use project's justfile if available for validation

## Quality Standards

The cleanup process must:
- Maintain all existing functionality
- Follow PEP 8 and project conventions
- Improve code maintainability and readability
- Not introduce new bugs or regressions
- Include comprehensive testing
- Provide clear documentation of changes

## Error Handling

- If tests fail: Stop cleanup and report which tests failed
- If build fails: Rollback changes and report errors
- If dependencies conflict: Resolve conflicts or report for manual review
- If type checking fails: Fix type errors or rollback changes
- If breaking changes needed: Create separate spec for major refactoring

## Output Format

The command will provide:
1. **Analysis Report**: Summary of technical debt found
2. **Cleanup Plan**: Ordered list of changes to be made
3. **Progress Updates**: Real-time updates during cleanup
4. **Final Summary**: Complete report of changes made
5. **Recommendations**: Remaining debt and future improvements