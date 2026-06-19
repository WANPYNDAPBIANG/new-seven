/* const mysql = require("mysql2");

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "Root@123",
  database: "seven_sisters_travel",
  port: 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

module.exports = pool.promise();

 */

const mariadb = require("mariadb");

const pool = mariadb.createPool({
  host: "serverless-europe-west9.sysp0000.db2.skysql.com",
  user: "Wan",
  password: "W@npynd@p2001",
  database: "seven_sisters_travel",
  port: 4070,
  connectionLimit: 5,
  ssl: true
});

module.exports = pool;