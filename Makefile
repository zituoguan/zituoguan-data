# 要求: git、bash、make、python3-pip、python3-venv
SHELL := /bin/bash
MARKDOWN_REPOSITORY = zituoguan/zituoguan
HTML_REPOSITORY = zituoguan/zituoguan-html

.PHONY: install # 安装构建工具到虚拟环境
install:
	python3 -m venv .venv
	source .venv/bin/activate && \
	pip3 install wheel && \
	pip3 install --force git+https://github.com/zituoguan/hecat.git@1.2.2c

.PHONY: import # 从原始列表 https://github.com/awesome-selfhosted/awesome-selfhosted 导入数据
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

.PHONY: awesome_lint # 检查数据是否符合awesome-selfhosted的指南 (严格模式)
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
	sed -i 's|<a href="https://github.com/pradyunsg/furo">Furo</a>|<a href="https://github.com/nodiscc/hecat/">hecat</a>, <a href="https://www.sphinx-doc.org/">sphinx</a> 和 <a href="https://github.com/pradyunsg/furo">furo</a>。内容在 <a href="https://github.com/awesome-selfhosted/awesome-selfhosted-data/blob/master/LICENSE">CC-BY-SA 3.0</a> 许可下。 <a href="https://github.com/awesome-selfhosted/awesome-selfhosted-html">源代码</a>，<a href="https://github.com/awesome-selfhosted/awesome-selfhosted-data">原始数据</a>。|' .venv/lib/python*/site-packages/furo/theme/furo/page.html
	source .venv/bin/activate && sphinx-build -b html -c .hecat/ html/md/ html/html/
	rm -rf html/html/.buildinfo html/html/objects.inv html/html/.doctrees zituoguan-html/*
	echo "# 请不要过于频繁地爬取此站点。源代码可在 https://github.com/zituoguan/zituoguan-html 获取。原始数据可在 https://github.com/zituoguan/zituoguan-data 获取" >| html/html/robots.txt

.PHONY: push_markdown # 提交并推送更改到Markdown仓库
push_markdown:
	$(eval COMMIT_HASH=$(shell git rev-parse --short HEAD))
	cd awesome-selfhosted && git remote set-url origin git@github.com:$(MARKDOWN_REPOSITORY)
	cd awesome-selfhosted && git config user.name awesome-selfhosted-bot && git config user.email github-actions@github.com
	cd awesome-selfhosted && git add . && (git diff-index --quiet HEAD || git commit -m "[bot] 从zituoguan-data构建Markdown $(COMMIT_HASH)")
	cd awesome-selfhosted && git push -f

.PHONY: push_html # 提交并推送更改到HTML站点仓库（修正先前的提交并强制推送）
push_html:
	$(eval COMMIT_HASH=$(shell git rev-parse --short HEAD))
	mv html/html/* zituoguan-html/
	cd awesome-selfhosted-html/ && git remote set-url origin git@github.com:$(HTML_REPOSITORY)
	cd awesome-selfhosted-html/ && git config user.name awesome-selfhosted-bot && git config user.email github-actions@github.com
	cd awesome-selfhosted-html/ && git add . && (git diff-index --quiet HEAD || git commit --amend -m "[bot] 从zituoguan-data构建HTML $(COMMIT_HASH)")
	cd awesome-selfhosted-html/ && git push -f

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
