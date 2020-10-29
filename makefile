
NAME:=myblog

install:
	gem install bundler jekyll

new-site:
	cd .. && jekyll new ${NAME}

run:
	rm -rf ./_site/* && bundle exec jekyll serve --incremental


name:=new_post
new:
	./create_post.sh ${name}
	${EDITOR} ./_posts/$(shell date +%F)-${name}.md
