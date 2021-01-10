rm -rf ./target
mkdir target
cp -r ./asm/. ./target
cp -r ./docs ./target/docs
cp ./README.md ./target/
cp ./changes.txt ./target/
cp ./style.css ./target/docs
cp "./quick guide.txt" ./target/

markhtml () {
    github-markdown "$1" "-t \$BASENAME" -s "$2style.css" > "${1%.*}.html"
	rm "$1"
}

folderhtml () {
	for i in *.md; do
		[ -f "$i" ] || break
		markhtml $i $1
	done
	
	sed -i -- 's/.md/.html/g' *.html
}

cd ./target
folderhtml "docs/"
cd ./docs
folderhtml ""
