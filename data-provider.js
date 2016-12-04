/**
 * New node file
 */
var fs = require('fs');

function readData(filename, response)
{
	console.log('providing ' + filename);
	fs.exists(filename, function(exists) {
		if (exists) {		
				fs.readFile(filename, function(error, data) {	
					if (!error)	{
						response.writeHead(200, {"Content-type":"application/json"});
						response.end(data);
					}
					else {			
						response.writeHead(500);
						response.end('Internal Server Error');
					}
				});
		}
		else
		{
			response.writeHead(404);
			response.end('Image not found');
		}
	});	
}



exports.provideData = function(filename, response)
{
	readData(filename, response);
};

exports.provideList = function(filename,  response)
{
	readData(filename, response);
};

exports.queryData = function(filename, json, response) {
	fs.exists(filename, function(exists) {
		if (exists) {		
				fs.readFile(filename, function(error, data) {	
					if (!error)	{
						var result = {};
						var filteredData = [];
						var i = 0;
						var allData = JSON.parse(data);
						if (Array.isArray(allData.characters)){
							allData.characters.forEach(function(character) {
							if(json){
								i = 0;
								for(key in json) {
									if (character[key] === json[key]) {
											i++;
									}
									if(i == Object.keys(json).length) {
										filteredData.push(character);
									}
								}
							}});
						}
						if (filteredData.length > 0) {
							result = filteredData;
							var imageUrl = 'images/' + json.type;
						}
						response.json(result);
					}
					else {			
						response.writeHead(500);
						response.end('Internal Server Error');
					}
				});
		}
		else
		{
			response.writeHead(404);
			response.end('Image not found');
		}
	});	
};
