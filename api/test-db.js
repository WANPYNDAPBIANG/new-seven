require('dotenv').config();
const mariadb = require('mariadb');

async function test() {
    try {
        const conn = await mariadb.createConnection({
            host: process.env.DB_HOST,
            port: Number(process.env.DB_PORT),
            user: process.env.DB_USER,
            password: process.env.DB_PASSWORD,
            database: process.env.DB_NAME
        });

        console.log('CONNECTED SUCCESSFULLY');

        const rows = await conn.query('SELECT COUNT(*) total FROM states');
        console.log(rows);

        await conn.end();
    } catch (err) {
        console.error('ERROR:');
        console.error(err);
    }
}

test();