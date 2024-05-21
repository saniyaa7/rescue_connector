// Import necessary modules

const mysql = require('mysql');
const express = require('express');
const app = express();
const cors = require('cors')

app.use(express.json());
app.use(cors({
  origin: "*"
}))

// Create MySQL database connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  // port: 3306,
  password: 'Kasliwal@1071',
  database: 'major_project'
});

// Connect to the database
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL database:', err);
    return;
  }
  console.log('Connected to MySQL database');
});
// export const conn = connection ;
module.exports = connection;
// module.exports = router;

// Middleware to parse JSON requests
// app.use(express.json());

// Use the auth routes (assuming you have a separate auth.js file)
const authRoutes = require('./auth');
// app.use(express.json());

app.use('/api/auth', authRoutes);

// app.get("/", (req, res) => res.send("Hello World"))

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

// module.exports = connection;
