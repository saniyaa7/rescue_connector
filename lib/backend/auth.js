const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const connection = require('./server.js');
const bodyParser = require('body-parser');




// Express route to handle the API request
router.get('/task-forces', (req, res) => {
  connection.query('SELECT name from task_force', (error, results, fields) => {

    if (error) {
      console.error('Error fetching task_force data from MySQL:', error);
      res.status(500).json({ message: 'Internal server error' });
      return;
    }

    res.json(results);
  });
});

router.get('/data-with-task-force', (req, res) => {
  // Extract the task_force_name from the query parameters
  const taskForceName = req.query.task_force_name;

  // Construct the SQL query
  let query = `
    SELECT username, location, area_of_expertise,mobileNumber
    FROM users`;

  // If task_force_name is provided, add a WHERE clause to filter the results
  if (taskForceName) {
    query += ` WHERE task_force_name = ${taskForceName}`; // Assuming task_force_name is a column in the users table
  }

  // Execute the SQL query with parameters
  connection.query(query, [taskForceName], (error, results, fields) => {
    if (error) {
      console.error('Error fetching data with task force:', error);
      res.status(500).json({ error: 'Internal server error' });
      return;
    }
    // Log fetched data to console
    console.log('Fetched data with task force:', results);
    // Send the data as JSON response
    res.json({ data_with_task_force: results });
  });
});


router.post('/task-forces', (req, res) => {
  const { name } = req.body;
  const newTaskForce = { name };

  // Insert the new task force into the database
  connection.query('INSERT INTO task_force (name) VALUES (?)', [name], (error, results, fields) => {
    if (error) {
      console.error('Error inserting task force data into MySQL:', error);
      res.status(500).json({ message: 'Internal server error' });
      return;
    }
    res.json({ message: 'Task force created successfully', taskForce: newTaskForce });
  });
});
router.put('/update-task-force', (req, res) => {
  const { organization_id, task_force_name } = req.body;

  // First, check if any user in the organization has an empty task force name
  const checkQuery = 'SELECT * FROM users WHERE organization_id = ? AND (task_force_name IS NULL OR task_force_name = "")';
  connection.query(checkQuery, [organization_id], (checkError, checkResults) => {
    if (checkError) {
      console.error('Error checking task force names in MySQL:', checkError);
      res.status(500).json({ message: 'Internal server error' });
      return;
    }

    if (checkResults.length === 0) {
      res.status(400).json({ message: 'No users in the organization have an empty task force name. Update aborted.' });
      return;
    }

    // If there are users with an empty task force name, proceed with the update
    const updateQuery = 'UPDATE users SET task_force_name = ? WHERE organization_id = ? AND (task_force_name IS NULL OR task_force_name = "")';
    connection.query(updateQuery, [task_force_name, organization_id], (updateError, updateResults) => {
      if (updateError) {
        console.error('Error updating task force name in MySQL:', updateError);
        res.status(500).json({ message: 'Internal server error' });
        return;
      }
      res.status(200).json({ message: 'Task force name updated successfully.' });
    });
  });
});

router.delete('/task-forces', (req, res) => {
  const { name } = req.body;
  console.log(req);

  const deleteQuery = `DELETE FROM task_force WHERE name = "${name}"`; // Adjust this query to match your schema
  connection.query(deleteQuery, (deleteError, deleteResults) => {
    if (deleteError) {
      console.error('Error deleting task force from MySQL:', deleteError);
      res.status(500).json({ message: 'Internal server error' });
      return;
    }

    res.status(200).json({ message: 'Task force deleted successfully.' });
  });
});


// Route to update task force name for a user

router.post('/signup', async (req, res) => {
  try {
    const { organization_id, username, email, password, mobileNumber, areaOfExpertise, numberOfMembers, location, equipments, medicalRequirements, communicationEquipments, shelterAndNecessities, latitude, longitude } = req.body;
    console.log(req.body, req.headers)
    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Insert user data into MySQL
    connection.query('INSERT INTO users (organization_id,username,email,password,mobileNumber,area_of_expertise,number_of_members,location,equipment,medical_requirements,communication,shelter_and_necessity,latitude,longitude) VALUES (?,?,?,?,?,?, ?, ?, ?, ?,?,?,?, ?)',
      [organization_id, username, email, hashedPassword, mobileNumber, areaOfExpertise, numberOfMembers, location, equipments, medicalRequirements, communicationEquipments, shelterAndNecessities, latitude, longitude],
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
    const { email, password } = req.body;

    // Fetch user from database based on email
    connection.query('SELECT * FROM users WHERE email=?', [email], async (error, results, fields) => {
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
  const { email } = req.body;
  console.log(email)
  // Fetch all user data from MySQL
  connection.query('SELECT * FROM users WHERE email=?', [email], (error, results, fields) => {
    if (error) {
      console.error('Error fetching user data from MySQL:', error);
      res.status(500).json({ message: 'Internal server error' });
      return;
    }
    // Log fetched data to console
    console.log('Fetched data_profile:', results);
    // Send user data as JSON response
    res.json(results);
  });
});


// module.exports = router;
router.get('/data_cross', (req, res) => {
  // Fetch specific user data from MySQL
  connection.query('SELECT organization_id, username, location,email,mobileNumber FROM users', (error, results, fields) => {
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
