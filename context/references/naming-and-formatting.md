# Naming and formatting

Surface-form standards for names, dates, versions, and language casing. Non-normative: the convention that points here owns when these standards apply.

## File and directory names

Use content-identifying sections separated by `-`, ordered by what is most useful for sorting. Within a section, use lowercase alphanumeric characters; replace spaces and special characters with `_`.

Examples:

- `results-20230101-v2.pptx` - content, date, version.
- `model-unet-train_20230101-epoch100.pt` - concept, detail, version.
- `20230101-results-v2.pptx` - date-first when sorting by date matters.
- `20230101 Progress Report.pdf` -> `20230101-progress_report.pdf`.

If `-` is problematic for a tool, use `+` as the deterministic swap, or defer to the tool's required scheme.

## Code names

Names should carry intent: a reader can infer the purpose from the name alone. Use short forms only for common or repeated concepts, such as `idx` for index and `cfg` for config.

## Dates and versions

- **Dates in prose and data:** ISO 8601 `YYYY-MM-DD`, for example `2026-06-19`; avoid locale forms such as `06/19/26`.
- **Dates in file names:** compact `YYYYMMDD`, with time as `HHMMSS` or `HHMM` when seconds are not meaningful, for example `20230101-132503-fov01.nd2`.
- **Timestamps:** `YYYY-MM-DDTHH:MM` in local time; append `Z` only for UTC.
- **Package versions:** semantic `vMAJOR.MINOR.PATCH`.
- **Study snapshots:** dated tags frozen at submission.

## Language casing

### Python (PEP 8)

- `snake_case` for functions, variables, and modules.
- `PascalCase` for classes.
- `UPPER_CASE` for constants.

### MATLAB

- `snake_case` for functions.
- `camelCase` for variables.
- A package is a `+folder`, for example `+plt`.
