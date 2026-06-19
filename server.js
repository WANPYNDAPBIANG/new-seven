const express = require('express');
const path = require('path');
const cors = require('cors'); // Run: npm install cors
const db = require('./db');
const bcrypt = require("bcrypt");
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors()); // Allows frontend (port 5500) to safely talk to backend (port 3000)
app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

// Hash helper (can be removed if not used elsewhere)
(async () => {
    const hash = await bcrypt.hash("admin123", 10);
})();

/* ==========================================
   API ROUTES
   ========================================== */

// 1. Test database route
app.get('/api/test-db', async (req, res) => {
    try {
        const result = await db.query('SELECT NOW() as currentTime');
        res.json({ success: true, message: 'Connected!', data: result });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

// 2. Fetch all states
app.get("/api/states", async (req, res) => {
    try {
        const rows = await db.query("SELECT * FROM states ORDER BY name");
        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// 3. Fetch featured packages
app.get("/api/packages/featured", async (req, res) => {
    try {
        // Update table/column names below to match your database schema
        const rows = await db.query("SELECT * FROM packages LIMIT 3");
        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// 4. Fetch all packages
app.get("/api/packages", async (req, res) => {
    try {
        const rows = await db.query("SELECT * FROM packages");
        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// 5. Fetch all reviews
// Inside server.js - Updated Reviews Fallback Array
app.get("/api/reviews", async (req, res) => {
    try {
        // Attempt query if table exists, otherwise catch error and return fallback array
        const rows = await db.query("SELECT * FROM reviews ORDER BY created_at DESC").catch(() => null);

        if (rows) {
            return res.json(rows);
        }

        // Structural fallback mock payload data to keep frontend rendering happy
        res.json([
            {
                id: 1,
                name: "Sarah Jenkins",
                rating: 5,
                comment: "The Living Root Bridges trek in Meghalaya was life-changing! Absolutely breathtaking views.",
                package_id: 1
            },
            {
                id: 2,
                name: "Arjun Mehta",
                rating: 5,
                comment: "Spotting three one-horned rhinos within the first hour at Kaziranga was legendary.",
                package_id: 2
            }
        ]);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});


/* ==========================================
   SERVER INITIALISATION
   ========================================== */
// Always keep app.listen at the very bottom of the file
app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server running at http://localhost:${PORT}/`);
});
