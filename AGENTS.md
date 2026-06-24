# zituoguan-data

Chinese-translated fork of [awesome-selfhosted-data](https://github.com/awesome-selfhosted/awesome-selfhosted-data) — a curated directory of free software network services and web applications that can be self-hosted. Data is in structured YAML files, processed via [hecat](https://github.com/nodiscc/hecat) to generate [zituoguan.com](https://zituoguan.com) (Sphinx/HTML) and the [zituoguan Markdown repo](https://github.com/zituoguan/zituoguan).

## Project

- **Language / Runtime**: Python (hecat, Sphinx)
- **Downstream outputs**:
  - Markdown: https://github.com/zituoguan/zituoguan
  - HTML site: https://zituoguan.com (repo: https://github.com/zituoguan/zituoguan-html)
- **Entry point**: No single entry-point script; orchestrated via `make` targets that invoke hecat with `.hecat/*.yml` config files.
- **License**: CC-BY-SA 3.0

## Commands

All commands run via `make`. Requires `git`, `bash`, `make`, `python3`, `python3-pip`, `python3-venv`.

| Command | Description |
|---------|-------------|
| `make install` | Create `.venv` and install hecat from GitHub |
| `make import` | Clone awesome-selfhosted and parse its README.md into `software/`, `tags/`, `platforms/` |
| `make update_metadata` | Fetch latest metadata (stars, releases, etc.) from project repos/APIs |
| `make awesome_lint` | Validate data against awesome-selfhosted guidelines |
| `make awesome_lint_strict` | Same but strict mode |
| `make export_markdown` | Render `software/` YAML → Markdown, push to the Markdown repo |
| `make export_html` | Render YAML → HTML site via Sphinx (Furo theme), push to the HTML repo |
| `make url_check` | Scan URLs for dead links |
| `make authors` | Rebuild AUTHORS file from git shortlog |
| `make help` | List all targets |

## Architecture

- **`software/*.yml`** — One file per software entry. Fields: `name`, `website_url`, `description`, `licenses`, `platforms`, `tags`, `source_code_url`, `demo_url`, `related_software_url`, and auto-populated metadata (`stargazers_count`, `updated_at`, `current_release`, `commit_history`). See `software/jellyfin.yml` for a complete example.
- **`tags/*.yml`** — Category/feature definitions. Fields: `name`, `description`, optional `related_tags`, `external_links`, `redirect`. At least 3 software entries must reference a tag.
- **`platforms/*.yml`** — Language/platform definitions. Fields: `name`, `description`.
- **`licenses.yml` / `licenses-nonfree.yml`** — SPDX-identifier → name + URL mappings.
- **`.hecat/`** — hecat pipeline configs:
  - `import.yml` — Parse awesome-selfhosted README into YAML
  - `update-metadata.yml` — Refresh remote metadata
  - `awesome-lint*.yml` — Validation rules
  - `export-markdown.yml`, `export-html.yml` — Output pipelines
  - `conf.py` — Sphinx configuration (Furo theme, Chinese language, MyST parser)
  - `url-check.yml` — Dead-link checking rules
- **`markdown/`** — Supplementary Markdown content (`header.md`, `footer.md`, `non-free-header.md`) for the Markdown output.
- **`_static/`** — Static assets for the HTML site (logo, favicon, adsense JS).
- **`_templates/base.html`** — Sphinx template override (Google Tag Manager injection).
- **`.github/workflows/`** — CI/CD:
  - `build.yml` — On push to master: lint → export Markdown → push to `zituoguan/zituoguan`, and lint → export HTML → push to `zituoguan/zituoguan-html`.
  - `daily-update-metadata.yml` — Daily scheduled metadata refresh.
  - `check-dead-links.yml` / `check-unmaintained-projects.yml` — Scheduled curation checks.
  - `pull-request.yml` — PR validation.

## Conventions

- **File names**: Kebab-case for software entries (`my-awesome-software.yml`). Tag/platform names use kebab-case with Unix-style naming.
- **Language**: All descriptions, comments, and documentation are in **Chinese (Simplified)**. The project name = "自托管精选".
- **Description style**: Use concise descriptions starting without articles or "is a" — e.g. "跨平台的古代战争即时战略游戏。" not "A cross-platform…". Avoid "open-source", "free", "self-hosted" (implied by context).
- **YAML schema for software entries**:
  - `name` (required): Display name
  - `website_url` (required): Project homepage
  - `description` (required): Concise, no redundant terms
  - `licenses` (required): Array of SPDX identifiers from `licenses.yml`
  - `platforms` (required): Array of platform identifiers from `platforms/`
  - `tags` (required): Array of tag identifiers from `tags/`
  - `source_code_url` (required): Link to source
  - Other fields optional: `demo_url`, `related_software_url`, `stargazers_count`, `updated_at`, `current_release`, `archived`, `commit_history`
- **Adding software**: Create new file in `software/` per CONTRIBUTING.md template, referencing only existing `tags/*.yml` and `licenses.yml` identifiers.
- **Removing software**: Delete its `.yml` file from `software/` and submit a PR.
- **Tag requirements**: Each tag must have ≥3 software entries. `Miscellaneous` tag for uncategorizable items.
- **Entry age requirement**: Software must have its first release >4 months before inclusion.
- **No machine/LLM-generated submissions** violating project guidelines.

## Notes

(Add quick-reference notes here as needed.)
