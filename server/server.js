// Import packages
const express = require("express");
const cors = require("cors");

// Create app
const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static("public"));

// Test route
app.get("/", (req, res) => {
    res.send("Seven Sisters Travel Agency Server Running");
});

// Start server
app.listen(5000, () => {
    console.log(`Server running on http://localhost:5000`);
});