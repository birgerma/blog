
NAME:=myblog

install:
	gem install bundler jekyll

new-site:
	cd .. && jekyll new ${NAME}

run:
	rm -rf ./_site/* && bundle exec jekyll serve --incremental
