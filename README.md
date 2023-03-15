## Filter linted files

If you need to lint only a folder or exclude some files from linting, you can use optional environment parameters `FILTER_REGEX_INCLUDE` and `FILTER_REGEX_EXCLUDE`

Examples :

- Lint only src folder: `FILTER_REGEX_INCLUDE=.*src/.*`
- Do not lint files inside test folder: `FILTER_REGEX_EXCLUDE=.*test/.*`
- Do not lint javascript files inside test folder: `FILTER_REGEX_EXCLUDE=.*test/.*.js`
