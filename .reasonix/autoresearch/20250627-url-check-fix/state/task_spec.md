# Task: Fix broken URLs in software YAML files

## Goal
Fix all 93 broken URLs reported by `make url_check` so the GitHub workflow passes.

## Scope
- Find the software YAML file for each broken URL
- Research the correct replacement URL (new domain, working demo link, etc.)
- Update `website_url` and/or `source_code_url` in the YAML file
- Do NOT delete software entries — only fix URLs

## Non-goals
- Adding new software entries
- Modifying descriptions, tags, platforms, licenses, or metadata
- Modifying files unrelated to broken URLs

## Success Criteria
- `make url_check` exits with code 0 (no errors)
- No software entries are deleted
- All URL changes point to valid, reachable endpoints

## Allowed operations
- read_file, grep, glob (for finding/reading YAML files)
- web_fetch (for researching replacement URLs)
- edit_file (for updating URLs in YAML files)
- bash (for running make url_check)
