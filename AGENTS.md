# zituoguan-data

Chinese-translated fork of [awesome-selfhosted-data](https://github.com/awesome-selfhosted/awesome-selfhosted-data). Structured YAML entries processed by [hecat](https://github.com/zituoguan/hecat.git) → [zituoguan.com](https://zituoguan.com) (HTML) and [zituoguan/zituoguan](https://github.com/zituoguan/zituoguan) (Markdown).

## Commands

All via `make` (auto-activates `.venv`). Run `make install` first.

| Command | What it does |
|---------|-------------|
| `make install` | Create `.venv`, install hecat + sphinx-sitemap |
| `make awesome_lint` | Validate against awesome-selfhosted guidelines |
| `make export_markdown` | YAML → Markdown → `zituoguan/` (cloned) |
| `make export_html` | YAML → HTML via Sphinx/Furo → `html/` (then pushed) |
| `make update_metadata` | Fetch stars/releases/commits from GitHub API |
| `make import` | **Destructive**: deletes `software/`, `tags/`, `platforms/`, clones upstream, re-parses |
| `make url_check` | Dead link scan |
| `make authors` | Rebuild AUTHORS from `git shortlog` |
| `make clean` | Remove `awesome-selfhosted/`, `html/` |

- `push_markdown` / `push_html` force-push; CI-only, **do not run locally**
- `update_metadata` needs `GITHUB_TOKEN` (and optional `GITLAB_TOKEN`) env vars; failure is non-fatal in CI
- PR CI: `install` → `awesome_lint` → `export_markdown` (no HTML build)

## Data layout

- **`software/*.yml`** — One file per entry. Required: `name`, `website_url`, `source_code_url`, `description`, `licenses`, `platforms`, `tags`. Auto-populated metadata (`stargazers_count`, `updated_at`, `current_release`, `commit_history`, `archived`) — **do not edit manually**.
- **`tags/*.yml`** — Category definitions. Filename is kebab-case derived from Chinese name (e.g., `tags/media-streaming---multimedia-streaming.yml`). Must have ≥3 software entries.
- **`platforms/*.yml`** — Language/runtime definitions (e.g., `Docker`, `Python`, `Go`).
- **`licenses.yml`** / **`licenses-nonfree.yml`** — SPDX identifier → name + URL.

## Conventions

- **Language**: All `description`, tag/platform `name`, `description` in **Chinese (Simplified)**. Project name = "自托管精选".
- **Description style**: No articles, no "is a", no "open-source"/"free"/"self-hosted" (implied). Max ~250 chars.
- **Tag filenames**: Kebab-case from Chinese name, using `---` separator for multi-word names (e.g., `file-transfer---synchronization`).
- **Software filenames**: English kebab-case (`my-awesome-software.yml`).
- **Licenses**: Must match identifiers exactly from `licenses.yml` or `licenses-nonfree.yml`.
- **Platforms/tags**: Must match `name` field of existing files in those directories.
- **Entry age**: First release must be >4 months old.
- **No LLM-generated submissions** (project rule).
- **`export_html`** post-processes: generates Cloudflare `_redirects`, `_headers`, `robots.txt`, `ads.txt`, custom `404.html`, strips `.html` from canonical URLs in sitemap and HTML.

## Key sources

- `CONTRIBUTING.md` — full submission guidelines and YAML templates
- `.hecat/*.yml` — hecat pipeline configs (lint rules, import/export params)
- `.hecat/conf.py` — Sphinx config (Furo theme, MyST parser, sitemap)
- `.github/workflows/` — CI pipeline definitions
