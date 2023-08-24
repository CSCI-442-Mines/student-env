render:
	rm -rf temp
	mkdir temp
# Sets up quartz
	cd temp; git clone https://github.com/jackyzha0/quartz.git; cd quartz; npm i
# Builds site
	cd temp/quartz; npx quartz build -d ../../docs/ -o ../../docs-html
# Cleans up
	rm -rf temp
	