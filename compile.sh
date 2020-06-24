#!/bin/bash
rm -f dist/* && \
docker run --rm -it -v $PWD/src:/opt/pas2js/src -v $PWD/dist:/opt/pas2js/dist abner/pas2js:latest && \
echo "module.exports = pas.program;" >> ./dist/script.js  && \
npx uglify-js dist/script.js --compress --mangle -o dist/script.min.js && \
echo "Script gerado com sucesso a partir do código pascal"