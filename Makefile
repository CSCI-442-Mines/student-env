render:
# Delete old rendering artifacts
	rm -rf temp
	rm -rf docs-html
	rm -rf website-branch
# Sets up quartz
	git clone https://github.com/jackyzha0/quartz.git; cd quartz; npm i
# Builds site
	mkdir docs-html
	cd quartz; npx quartz build -d ../docs/ -o ../docs-html
# Adds clone of existing repo, using website branch
	git clone --branch website https://github.com/CSCI-442-Mines/student-env
	mv student-env website-branch
	cd website-branch; rm -rf *
# Moves in the rendered documents
	cp -r docs-html/* website-branch/
# Cleans up
	rm -rf docs-html
	rm -rf temp