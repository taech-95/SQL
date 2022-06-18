//console.log('Hello world!');
const { faker } = require('@faker-js/faker');
// console.log(faker.internet.email());
// console.log(faker.date.past());
const mysql  = require('mysql')
let connection = mysql.createConnection({
	host:'localhost',
	user: 'root',
	database: 'mysql'
})
	
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


connection.end();

   //  Root User: root
   // Database Name: mysql