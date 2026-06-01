const express = require("express");
const cors = require("cors");
const bcrypt = require("bcrypt");
const mysql = require("mysql2");

const app = express();
const PORT = 5000;

// middleware
app.use(cors());
app.use(express.json());
app.use(express.static("public"));

/* =========================
   MYSQL CONNECTION (SKYSQL)
========================= */
const db = mysql.createConnection({
    host: "serverless-europe-west9.sysp0000.db2.skysql.com",
    user: "Wan",
    password: "W@npynd@p2001",
    database: "seven_sisters_travel",
    port: 4070,
    ssl: {
        rejectUnauthorized: false
    }
});

/* =========================
   REGISTER API
========================= */
app.post("/api/register", async (req, res) => {

    const { name, username, email, phone, password } = req.body;

    try {
        const hashedPassword = await bcrypt.hash(password, 10);

        const sql = `
            INSERT INTO users (name, username, email, phone, password)
            VALUES (?, ?, ?, ?, ?)
        `;

        db.query(sql,
            [name, username, email, phone, hashedPassword],
            (err, result) => {

                if (err) {
                    return res.status(500).json({ error: err.message });
                }

                res.json({ message: "User registered successfully" });
            }
        );

    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

/* =========================
   LOGIN API
========================= */
app.post("/api/login", (req, res) => {

    const { email, password } = req.body;

    const sql = "SELECT * FROM users WHERE email = ?";

    db.query(sql, [email], async (err, results) => {

        if (err) return res.status(500).json({ error: err.message });

        if (results.length === 0) {
            return res.status(401).json({ message: "User not found" });
        }

        const user = results[0];

        const isMatch = await bcrypt.compare(password, user.password);

        if (!isMatch) {
            return res.status(401).json({ message: "Invalid password" });
        }

        res.json({
            message: "Login successful",
            user: {
                id: user.id,
                name: user.name,
                email: user.email,
                role: user.role
            }
        });
    });
});

app.post("/api/book", (req, res) => {

    const {
        user_id,
        name,
        email,
        phone,
        package_name,
        destination,
        travel_date,
        persons,
        message
    } = req.body;

    const sql = `
        INSERT INTO bookings
        (user_id, name, email, phone, package_name, destination, travel_date, persons, message)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    db.query(sql, [
        user_id,
        name,
        email,
        phone,
        package_name,
        destination,
        travel_date,
        persons,
        message
    ], (err, result) => {

        if (err) {
            return res.status(500).json({ error: err.message });
        }

        res.json({ message: "Booking successful" });
    });

});

app.get("/api/admin/bookings", checkAdmin, (req, res) => {

    db.query("SELECT * FROM bookings ORDER BY id DESC", (err, results) => {

        if (err) {
            return res.status(500).json({ error: err.message });
        }

        res.json(results);
    });

});

app.get("/api/admin/users", checkAdmin, (req, res) => {

    db.query(
        "SELECT id, name, username, email, phone, role, created_at FROM users",
        (err, results) => {

            if (err) {
                return res.status(500).json({ error: err.message });
            }

            res.json(results);
        }
    );

});

function checkAdmin(req, res, next) {
    const role = req.headers.role;

    if (role !== "admin") {
        return res.status(403).json({ message: "Access denied" });
    }

    next();
}

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});