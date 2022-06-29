let express = require('express');
let app = express();
const { faker } = require('@faker-js/faker');
const mysql  = require('mysql')
let bodyParser = require('body-parser');

let connection = mysql.createConnection({
	host:'localhost',
	user: 'root',
	database: 'join_up'
});

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended:true}));
app.use(express.static(__dirname+"/public"));

app.get("/", (req,res)=>{
	let query = "SELECT COUNT(*) AS count FROM users";
	connection.query(query, (err,results) =>{
		if(err) throw err;
		let count = (results[0].count);
		console.log(count);
		res.render("home", {count:count});
		// res.send("We have " + count + " users in our DB");
	 });
	// console.log("hello from web page");
	
});

app.post("/register", (req, res)=>{
	let person = {
		email: req.body.email
	};
	
	connection.query("INSERT INTO users SET ?", person, function(err,result){
		if(err) throw err;
		console.log(result);
		// res.send("Thanks for join us!");
		res.redirect('/');
	});
	console.log("Post request" + person);
});


app.get("/joke", async(req,res)=>{
	let joke = "ahah"
	res.send("You've reached the joke page " + joke);
});

app.get("/rand", async(req,res)=>{
	let reand = Math.floor(floMath.random()*10+1);
})

app.listen('3000', function(){
	console.log('App listening on port 3000');
});