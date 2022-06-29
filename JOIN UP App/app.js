//console.log('Hello world!');
const { faker } = require('@faker-js/faker');
// console.log(faker.internet.email());
// console.log(faker.date.past());
const mysql  = require('mysql')
let connection = mysql.createConnection({
	host:'localhost',
	user: 'root',
	database: 'join_up'
});


	
connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
   if (error) throw error;
   console.log('The solution is: ', results[0].solution);
});


function generateAddress(){
	console.log(faker.address.streetAddress());
	console.log(faker.address.city());
	console.log(faker.address.state());
}

generateAddress();

var q = 'SELECT CURTIME() as time, CURDATE() as date, NOW() as now';
connection.query(q, function (error, results, fields) {
  if (error) throw error;
  console.log(results[0].time);
  console.log(results[0].date.toString());
  console.log(results[0].now.toString());
});


var createTable = 'CREATE TABLE users(email VARCHAR(255) PRIMARY KEY, created_at TIMESTAMP DEFAULT NOW())';


//Inserting Data
// query = 'INSERT INTO users (email) VALUES ("rusty_the_dog@gmail.com")';
// connection.query(query, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
// });

// for (let i =0; i<500; i++){
	
// };


let data = []; 
for (let i =0; i<500; i++){
	data.push([
		faker.internet.email(),
		faker.date.past()
	]);

};

let person = {
				email : faker.internet.email(),
			 	created_at : faker.date.past()
			 };


let query = 'INSERT INTO users (email, created_at) VALUES ?';
connection.query(query, [data], function(error, results){
	if (error) throw error;
	console.log(results);
});


connection.query('INSERT INTO users SET ?', person, function(err, result){
	if (err) throw error;
  	console.log(result);
});


query = 'SELECT COUNT(*) AS Total FROM users';
connection.query(query, function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});


connection.end();

   //  Root User: root
   // Database Name: mysql