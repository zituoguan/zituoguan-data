# 要求: git、bash、make、python3-pip、python3-venv
SHELL := /bin/bash
MARKDOWN_REPOSITORY = zituoguan/zituoguan
HTML_REPOSITORY = zituoguan/zituoguan-html

.PHONY: install # 安装构建工具到虚拟环境
install:
	python3 -m venv .venv
	source .venv/bin/activate && \
	pip3 install wheel && \
	pip3 install --force git+https://github.com/zituoguan/hecat.git && \
	pip3 install sphinx-sitemap

.PHONY: import # import data from original list at https://github.com/awesome-selfhosted/awesome-selfhosted
import: clean install
	git clone --depth=1 https://github.com/awesome-selfhosted/awesome-selfhosted
	cp awesome-selfhosted/AUTHORS AUTHORS
	rm -rf tags/ software/ platforms/
	mkdir -p tags/ software/ platforms/
	source .venv/bin/activate && \
	hecat --config .hecat/import.yml

.PHONY: update_metadata # 从项目仓库/API更新元数据
update_metadata:
	source .venv/bin/activate && \
	hecat --config .hecat/update-metadata.yml

.PHONY: awesome_lint # 检查数据是否符合awesome-selfhosted的指南
awesome_lint:
	source .venv/bin/activate && \
	hecat --config .hecat/awesome-lint.yml

.PHONY: awesome_lint_strict # 检查数据是否符合awesome-selfhosted的指南 (严格模式)
awesome_lint_strict:
	source .venv/bin/activate && \
	hecat --config .hecat/awesome-lint-strict.yml

.PHONY: export_markdown # 从YAML数据渲染Markdown导出 (https://github.com/zituoguan/zituoguan)
export_markdown:
	rm -rf zituoguan/
	git clone https://github.com/$(MARKDOWN_REPOSITORY)
	source .venv/bin/activate && hecat --config .hecat/export-markdown.yml
	cd zituoguan && git diff --color=always

.PHONY: export_html # 从YAML数据渲染HTML导出 (https://zituoguan.com/)
export_html:
	rm -rf zituoguan-html/ html/
	git clone https://github.com/$(HTML_REPOSITORY)
	mkdir html && source .venv/bin/activate && hecat --config .hecat/export-html.yml
	source .venv/bin/activate && sphinx-build -b html -j auto -c .hecat/ html/md/ html/html/
	rm -rf html/html/.buildinfo html/html/objects.inv html/html/.doctrees zituoguan-html/*
	printf "User-agent: *\nDisallow: /_static/\nDisallow: /_sphinx_design_static/\n\nSitemap: https://zituoguan.com/sitemap.xml\n" >| html/html/robots.txt
	echo "google.com, pub-5479527225721408, DIRECT, f08c47fec0942fa0" >| html/html/ads.txt
	printf "# 将复合 _static 路径重定向到正确位置，防止 AI 爬虫 URL 堆叠\n/*/_static/* /_static/:splat 301\n/*/*/_static/* /_static/:splat 301\n/*/*/*/_static/* /_static/:splat 301\n\n# 首页 canonical 修正\n/index / 301\n\n# catch-all：所有未匹配到真实页面的路径（错误后缀、嵌套软 404、伪造路径）返回 404，阻止 AI 爬虫 URL 堆叠\n/* /404.html 404\n" >| html/html/_redirects
	printf "/_static/*\n  Cache-Control: public, max-age=31536000, immutable\n\n/*\n  X-Content-Type-Options: nosniff\n  X-Frame-Options: SAMEORIGIN\n  Referrer-Policy: strict-origin-when-cross-origin\n" >| html/html/_headers
	@printf '<!doctype html>\n<html lang="zh-cn">\n<head>\n<meta charset="utf-8"/>\n<meta name="viewport" content="width=device-width,initial-scale=1"/>\n<meta name="robots" content="noindex"/>\n<title>404 - 页面不存在 | 自托管精选</title>\n<style>\nbody{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"PingFang SC","Microsoft YaHei",sans-serif;background:#f8f8f8;color:#1a1a1a;margin:0;display:flex;min-height:100vh;align-items:center;justify-content:center}\n.box{max-width:560px;padding:48px 40px;text-align:center;background:#fff;border:1px solid #e5e7eb;border-radius:12px;box-shadow:0 1px 3px rgba(0,0,0,.04)}\nh1{font-size:72px;margin:0 0 8px;color:#2563eb;line-height:1}\np{color:#6b7280;margin:0 0 24px}\na{display:inline-block;padding:10px 22px;background:#2563eb;color:#fff;border-radius:6px;text-decoration:none;font-weight:600}\na:hover{background:#1d4ed8}\n.links{margin-top:18px;font-size:14px;color:#9ca3af}\n.links a{display:inline;background:none;color:#2563eb;padding:0;font-weight:400}\n.links a:hover{text-decoration:underline;background:none}\n</style>\n</head>\n<body>\n<div class="box">\n<h1>404</h1>\n<p>您访问的页面不存在。请从首页或分类继续浏览自托管精选。</p>\n<a href="/">返回首页</a>\n<div class="links"><a href="/tags/">标签</a> · <a href="/software/">软件</a> · <a href="/platforms/">平台</a></div>\n</div>\n</body>\n</html>\n' >| html/html/404.html
	python3 -c "import os,re; [open(p,'w').write(re.sub(r'(href=\"https://zituoguan\.com)/index(\")',r'\1/\2',c)) for r,d,fs in os.walk('html/html') for f in fs if f.endswith('.html') for p in [os.path.join(r,f)] for c in [re.sub(r'(<link rel=\"canonical\" href=\"https://zituoguan\.com/[^\"]+)\.html(\" />)',r'\1\2',open(p).read())]]"
	python3 -c "import re; s=open('html/html/sitemap.xml').read(); s=re.sub(r'\.html</loc>','</loc>',s); s=re.sub(r'(https://zituoguan\.com)/index</loc>',r'\1/</loc>',s); open('html/html/sitemap.xml','w').write(s)"

.PHONY: push_markdown # 提交并推送更改到Markdown仓库
push_markdown:
	$(eval COMMIT_HASH=$(shell git rev-parse --short HEAD))
	cd zituoguan && git remote set-url origin git@github.com:$(MARKDOWN_REPOSITORY)
	cd zituoguan && git config user.name awesome-selfhosted-bot && git config user.email github-actions@github.com
	cd zituoguan && git add . && (git diff-index --quiet HEAD || git commit -m "[bot] 从zituoguan-data构建Markdown $(COMMIT_HASH)")
	cd zituoguan && git push -f

.PHONY: push_html # 提交并推送更改到HTML站点仓库（修正先前的提交并强制推送）


push_html:
	$(eval COMMIT_HASH=$(shell git rev-parse --short HEAD))
	mv html/html/* zituoguan-html/
	cd zituoguan-html/ && git remote set-url origin git@github.com:$(HTML_REPOSITORY)
	cd zituoguan-html/ && git config user.name awesome-selfhosted-bot && git config user.email github-actions@github.com
	cd zituoguan-html/ && git add . && (git diff-index --quiet HEAD || git commit --amend -m "[bot] 从zituoguan-data构建HTML $(COMMIT_HASH)")
	cd zituoguan-html/ && git push -f

.PHONY: url_check # 检查URL是否存在死链或其他连接问题
url_check:
	source .venv/bin/activate && \
	hecat --config .hecat/url-check.yml

.PHONY: authors # 更新AUTHORS文件
authors:
	printf "Commits|Author\n-------|---------------------------------------------------\n" > AUTHORS
	git shortlog -sne | grep -v awesome-selfhosted-bot >> AUTHORS

.PHONY: clean # 清理由自动化任务生成的文件
clean:
	rm -rf awesome-selfhosted/ awesome-selfhosted-html/ html/

.PHONY: help # 生成带有描述的目标列表
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1	\2/' | expand -t20
