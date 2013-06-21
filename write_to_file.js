#!/usr/bin/env node
if(process.argv[2] === 'usage') {
	console.log("Usage :\n  -o [output-file] -c [content]");  
	process.exit(0);
}	
var params = {};
for(var i = 2; i < process.argv.length; i += 2) {
	params[process.argv[i].slice(1)] = process.argv[i+1];
}

var fs = require('fs'),
	outFile = params.o ? params.o : "hello.txt",
	outContent = params.c ? params.c : "A startup is a business built to grow rapidly.\n";

fs.writeFile(outFile, outContent, function(err) {
	console.log(err ? err : "Wrote content to : " + outFile);
});
