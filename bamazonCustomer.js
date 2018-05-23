var mysql = require("mysql");
var inquirer = require("inquirer");
var items = [], product, purchaseQuant,newTotalQuant,price;

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "piis3.1415926",
    database: "bamazon"
});


connection.query('SELECT * FROM products', function (error, results, fields) {
    if (error) throw error;
    for (let i = 0; i < results.length; i++) {
        const element = results[i];
        console.log(`${element.item_id}. ${element.product_name} $${element.price}`);
        items.push(element.product_name);
    }
    inquirer.prompt([{
        name: "name",
        type: "list",
        choices: items,
        message: "What item would you like to purchase?"
    }, {
        name: "quantity",
        type: "input",
        message: "How many of this item would you like to buy?",
        validate: function (value) {
            if (isNaN(value) === false) {
                return true;
            }
            return false;
        }
    }
    ]).then(function (response) {
        product = response.name;
        purchaseQuant = parseInt(response.quantity);
        connection.query('SELECT * FROM products WHERE ?', {
            product_name: product
        }, function (error, results) {
            if (error) throw error;
            if (results[0].stock_quantity < purchaseQuant) {
                console.log("Insufficient quantity!");
            } else {
                price=results[0].price*purchaseQuant;
                newTotalQuant=results[0].stock_quantity-purchaseQuant;
                connection.query(
                    "UPDATE products SET ? WHERE ?", [
                        {
                            stock_quantity: newTotalQuant
                        },
                        {
                            product_name: product
                        }
                    ],
                    function (error,results) {
                        if (error) throw error;
                        console.log(`You purchased ${purchaseQuant} of ${product}, which totals to $${price.toFixed(2)}`);
                    }
                );
            }
        })
    });
});