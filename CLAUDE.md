# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

This is the data repository for [zituoguan.com](https://zituoguan.com) — a Chinese-language curated list of self-hostable free software (a fork/localization of [awesome-selfhosted-data](https://github.com/awesome-selfhosted/awesome-selfhosted-data)). It contains YAML data files that are processed by [hecat](https://github.com/zituoguan/hecat.git) to generate Markdown and HTML exports.

## Setup and common commands

```bash
make install          # create .venv and install hecat (required before other targets)
make awesome_lint     # validate all YAML data against guidelines
make export_markdown  # render README.md into cloned zituoguan/ repo
make export_html      # render HTML site into html/ (requires sphinx/furo)
make update_metadata  # fetch stargazers, release dates, commit history from GitHub API
make url_check        # check for dead links
make authors          # regenerate AUTHORS from git shortlog
make clean            # remove generated directories (awesome-selfhosted/, html/)
```

All make targets activate `.venv` internally — you don't need to activate it manually.

## Data architecture

The repo is a flat collection of YAML files in three directories:

- **`software/*.yml`** — one file per project (1600+ entries). Each file contains: `name`, `website_url`, `source_code_url`, `description` (Chinese, <250 chars), `licenses` (list), `platforms` (list), `tags` (list), plus auto-updated metadata fields (`stargazers_count`, `updated_at`, `current_release`, `commit_history`, `archived`).
- **`tags/*.yml`** — 125 category/tag definitions with `name` (Chinese), `description` (Chinese, markdown allowed), optional `related_tags`, `external_links`, and `redirect`.
- **`platforms/*.yml`** — runtime/language platform definitions with `name` and `description`.

Reference files:
- **`licenses.yml`** / **`licenses-nonfree.yml`** — license identifier → name → URL mappings (SPDX preferred).
- **`markdown/header.md`**, **`markdown/footer.md`** — prepended/appended to Markdown export.
- **`_templates/base.html`**, **`_static/`** — HTML export assets.
- **`.hecat/*.yml`** — hecat pipeline configs controlling lint, export, import, and metadata update behavior.

## Adding or editing entries

**New software** (`software/software-name.yml`): use kebab-case filename, Chinese description, reference existing tag/platform names exactly. Required fields: `name`, `website_url`, `source_code_url`, `description`, `licenses`, `platforms`, `tags`. Metadata fields (`stargazers_count`, `updated_at`, etc.) are auto-populated by `make update_metadata`.

**New tag** (`tags/tag-name.yml`): requires `name` and `description` in Chinese. A tag must have at least 3 software entries referencing it.

**New platform** (`platforms/platform-name.yml`): requires `name` and `description`.

After edits, run `make awesome_lint` to validate before committing.

## Key constraints

- Software descriptions must be in Chinese and under 250 characters.
- `licenses` values must match identifiers in `licenses.yml` or `licenses-nonfree.yml`.
- `platforms` and `tags` values must match the `name` field of existing files in those directories.
- Non-free software licenses (proprietary, BUSL, CC-BY-NC, etc.) are excluded from the main Markdown export but included in `non-free.md`.
- Software must have a first release older than 4 months to qualify for the list.
- The `export_markdown` and `push_markdown` targets operate on a cloned copy of the `zituoguan/zituoguan` repo; `push_*` targets force-push and are for CI use only.
