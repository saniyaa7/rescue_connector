const accountSid = require('./CONSTANTS').accountSid;
const authToken = require('./CONSTANTS').authToken;

const express = require('express');
const bodyParser = require('body-parser');
const twilio = require('twilio');
const cors = require('cors');

const app = express();
const PORT = 3000;

// Twilio credentials
const client = twilio(accountSid, authToken);

// Middleware to parse JSON bodies
app.use(bodyParser.json());

app.use(cors());

// Phone numbers to send notifications to
const phoneNumbers = ['+918856814335', '+918237939131','+919096198872']; // Add your desired phone numbers here

// Endpoint to handle image click and send notification
app.post('/sendNotification', (req, res) => {
  const { imageName, latitude, longitude } = req.body;

  // Send SMS notification to each phone number
  phoneNumbers.forEach(phoneNumber => {
    client.messages
      .create({
        body: `Red Alert: There is an emergency of ${imageName}. Location: Latitude ${latitude}, Longitude ${longitude}`,
        from: '+12568889906', // Your Twilio phone number
        to: phoneNumber,
      })
      .then(message => console.log(`Notification sent to ${phoneNumber}: ${message.sid}`))
      .catch(error => console.error(`Failed to send notification to ${phoneNumber}: ${error}`));
  });

  res.send('Notifications sent successfully');
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});