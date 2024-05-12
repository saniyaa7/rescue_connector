const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const connection = require('./server.js');

router.post('/signup', async (req, res) => {
  try {
    const { organization_id,username,email,password,areaOfExpertise,numberOfMembers,location,equipments,medicalRequirements,communicationEquipments,shelterAndNecessities} = req.body;
    console.log(req.body,req.headers)
    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert user data into MySQL
    connection.query('INSERT INTO users (organization_id,username,email,password,area_of_expertise,number_of_members,location,equipment,medical_requirements,communication,shelter_and_necessity) VALUES (?,?,?, ?, ?, ?, ?,?,?,?, ?)', 
      [organization_id,username,email,hashedPassword,areaOfExpertise,numberOfMembers,location,equipments,medicalRequirements,communicationEquipments,shelterAndNecessities],
      (error, results, fields) => {
        if (error) {
          console.error('Error inserting user data into MySQL:', error);
          res.status(500).json({ message: 'Internal server error' });
          return;
        }
        res.json({ message: 'User created successfully' });
    });
  } catch (error) {
    console.error('Error in user sign-up:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

// router.get("/signup", (req, res) => res.send("Hello WOrld"))

router.post('/signin', async (req, res) => {
  try {
    const {email,password} = req.body;

    // Fetch user from database based on email
    connection.query('SELECT * FROM users WHERE email=?', [email], async (error,results,fields) => {
      if (error) {
        console.error('Error querying user:', error);
        res.status(500).json({ message: 'Internal server error' });
        return;
      }

      if (results.length === 0) {
        res.status(401).json({ message: 'User not found' });
        return;
      }

      // Compare hashed password
      const user = results[0];
      const isPasswordMatch = await bcrypt.compare(password, user.password);

      if (!isPasswordMatch) {
        res.status(401).json({ message: 'Invalid password' });
        return;
      }

      // Password is correct, respond with user data (excluding password)
      res.status(200).json({
        message: 'Login successful',
        user: {
          username: user.username,
          email: user.email,
          areaOfExpertise: user.area_of_expertise,
          // Add other fields as needed
        }
      });
    });
  } catch (error) {
    console.error('Error in user login:', error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

module.exports = router;


