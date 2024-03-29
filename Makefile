.DEFAULT_GOAL := serve

help: ## Show all Makefile targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

update: ## Update Quartz to the latest version on Github
	go install github.com/jackyzha0/hugo-obsidian@latest
	@git remote show upstream || (echo "remote 'upstream' not present, setting 'upstream'" && git remote add upstream https://github.com/jackyzha0/quartz.git)
	git fetch upstream
	git log --oneline --decorate --graph ..upstream/hugo
	git checkout -p upstream/hugo -- layouts .github Makefile assets/js assets/styles/base.scss assets/styles/darkmode.scss config.toml data

update-force: ## Forcefully pull all changes and don't ask to patch
	go install github.com/jackyzha0/hugo-obsidian@latest
	@git remote show upstream || (echo "remote 'upstream' not present, setting 'upstream'" && git remote add upstream https://github.com/jackyzha0/quartz.git)
	git fetch upstream
	git checkout upstream/hugo -- layouts .github Makefile assets/js assets/styles/base.scss assets/styles/darkmode.scss config.toml data

serve: ## Serve Quartz locally
	hugo-obsidian -input=content -output=assets/indices -index -root=. && hugo server --enableGitInfo

sync-content: rm-content
	bash ./sync-files.sh
	bash ./copy_linked_notes.sh
	bash ./content_to_quartz_format.sh
	bash ./format_fields.sh
	bash ./rename_main_page.sh
	bash ./wikilinks_to_markdownlinks.sh

rm-content:
	@rm -rf content

pull-files:
	@git submodule update --init
	@git -C files checkout main
	@git -C files pull

upload-content: pull-files sync-content
	git add files content
	git commit -m "content update"
	git push origin hugo
