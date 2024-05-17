const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const connection = require('./server.js');

router.post('/signup', async (req, res) => {
  try {
    const { organization_id,username,email,password,mobileNumber,areaOfExpertise,numberOfMembers,location,equipments,medicalRequirements,communicationEquipments,shelterAndNecessities,latitude,longitude} = req.body;
    console.log(req.body,req.headers)
    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert user data into MySQL
    connection.query('INSERT INTO users (organization_id,username,email,password,mobileNumber,area_of_expertise,number_of_members,location,equipment,medical_requirements,communication,shelter_and_necessity,latitude,longitude) VALUES (?,?,?,?,?,?, ?, ?, ?, ?,?,?,?, ?)', 
      [organization_id,username,email,hashedPassword,mobileNumber,areaOfExpertise,numberOfMembers,location,equipments,medicalRequirements,communicationEquipments,shelterAndNecessities,latitude,longitude],
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
      console.log('Results:', results);

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

// module.exports = router;
router.get('/data', (req, res) => {
  // Fetch user data from MySQL
  connection.query('SELECT organization_id, equipment, medical_requirements, communication, shelter_and_necessity FROM users', (error, results, fields) => {
    if (error) {
      console.error('Error fetching user data from MySQL:', error);
      res.status(500).json({ message: 'Internal server error' });
      return;
    }
    // Log fetched data to console
    console.log('Fetched data_requestPage:', results);
    // Send user data as JSON response
    res.json(results);
  });
});


// module.exports = router;
router.post('/data_profile', (req, res) => {
  const {email} = req.body;
  console.log(email)
  // Fetch all user data from MySQL
  connection.query('SELECT * FROM users WHERE email=?', [email], (error, results, fields) => {
    if (error) {
      console.error('Error fetching user data from MySQL:', error);
      res.status(500).json({ message: 'Internal server error' });
      return;
    }
    // Log fetched data to console
    console.log('Fetched data_profile:',results);
    // Send user data as JSON response
    res.json(results);
  });
});


// module.exports = router;
router.get('/data_cross', (req, res) => {
  // Fetch specific user data from MySQL
  connection.query('SELECT organization_id, username, location FROM users', (error, results, fields) => {
    if (error) {
      console.error('Error fetching user data from MySQL:', error);
      res.status(500).json({ message: 'Internal server error' });
      return;
    }
    // Log fetched data to console
    console.log('Fetched data_communications:', results);
    // Send user data as JSON response
    res.json(results);
  });
});



// Function to calculate distance using Haversine formula
const calculateDistance = (lat1, lon1, lat2, lon2) => {
    const R = 6371; // Radius of the earth in km
    const dLat = deg2rad(lat2 - lat1);
    const dLon = deg2rad(lon2 - lon1);
    const a =
        Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
        Math.sin(dLon / 2) * Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    const d = R * c; // Distance in km
    return d;
};

const deg2rad = (deg) => {
    return deg * (Math.PI / 180)
};

// API route to fetch user coordinates
router.get('/coordinates', (req, res) => {
    // Fetch user coordinates from MySQL
    connection.query('SELECT latitude, longitude FROM public_account LIMIT 1', (error, results, fields) => {
        if (error) {
            console.error('Error fetching coordinates from MySQL:', error);
            res.status(500).json({ message: 'Internal server error' });
            return;
        }
        // Extract latitude and longitude from the fetched results
        const { latitude, longitude } = results[0];
        res.json({ latitude, longitude });
    });
});

// API route to find nearest users based on given coordinates
router.get('/nearest-agencies', (req, res) => {
    const { latitude, longitude } = req.query;

    if (!latitude || !longitude) {
        return res.status(400).json({ error: 'Latitude and longitude are required' });
    }

    // Fetch user data from MySQL
    connection.query('SELECT * FROM users', (error, results, fields) => {
        if (error) {
            console.error('Error fetching user data from MySQL:', error);
            res.status(500).json({ message: 'Internal server error' });
            return;
        }
        // Calculate distance for each user
        results.forEach(user => {
            user.distance = calculateDistance(latitude, longitude, user.latitude, user.longitude);
        });

        // Sort users by distance
        results.sort((a, b) => a.distance - b.distance);

        // Send sorted user data as JSON response
        res.json(results);
    });
});

module.exports = router;
