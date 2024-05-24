const accountSid = require('./CONSTANTS').accountSid;
const authToken = require('./CONSTANTS').authToken;

const express = require('express');
const bodyParser = require('body-parser');
const twilio = require('twilio');
const cors = require('cors');

const app = express();
const PORT = 3036;

// Twilio credentials
const client = twilio(accountSid, authToken);

// Middleware to parse JSON bodies
app.use(bodyParser.json());

app.use(cors());

// Phone numbers to send notifications to
const phoneNumbers = ['+918856814335', '+919096198872', '+918855048883']; // Add your desired phone numbers here

app.post('/sendNotification2', (req, res) => {
  console.log(`Request body: ${JSON.stringify(req.body)}`);

  const { imageName, latitude, longitude, mapImageUrl } = req.body;

  // Log individual fields to verify they are received correctly
  // console.log(`imageName: ${imageName}`);
  console.log(`latitude: ${latitude}`);
  console.log(`longitude: ${longitude}`);
  // console.log(`mapImageUrl: ${mapImageUrl}`);

  if (!latitude || !longitude) {
    return res.status(400).send('Missing required fields');
  }

  phoneNumbers.forEach(phoneNumber => {
    client.messages
      .create({
        body: `Red Alert: There is an emergency, we need Resource at Location: Latitude ${latitude}, Longitude ${longitude}. Map: ${mapImageUrl}.`,
        from: '+13253095939', // Your Twilio phone number
        to: phoneNumber,
      })
      .then(message => console.log(`Notification sent to ${phoneNumber}: ${message.sid}`))
      .catch(error => console.error(`Failed to send notification to ${phoneNumber}: ${error}`));
  });

  res.send('Notifications sent successfully');
});

// Endpoint to handle image click and send notification
app.post('/sendNotification', (req, res) => {
  console.log('Request body:', req.body);

  const { imageName, latitude, longitude, mapImageUrl } = req.body;

  // Log individual fields to verify they are received correctly
  console.log('imageName:', imageName);
  console.log('latitude:', latitude);
  console.log('longitude:', longitude);
  console.log('mapImageUrl:', mapImageUrl);

  if (!imageName || !latitude || !longitude || !mapImageUrl) {
    return res.status(400).send('Missing required fields');
  }

  phoneNumbers.forEach(phoneNumber => {
    client.messages
      .create({
        body: `Red Alert: There is an emergency of ${imageName}. Location: Latitude ${latitude}, Longitude ${longitude}. Map: ${mapImageUrl}`,
        from: '+13253095939', // Your Twilio phone number
        to: phoneNumber,
      })
      .then(message => console.log(`Notification sent to ${phoneNumber}: ${message.sid}`))
      .catch(error => console.error(`Failed to send notification to ${phoneNumber}: ${error}`));
  });

  res.send('Notifications sent successfully');
});

// Endpoint to handle message notification and send SMS
app.post('/sendMessageNotification', (req, res) => {
  console.log('Request body:', req.body);

  const { MessageNotfication, latitude, longitude, mapImageUrl } = req.body;

  // Log individual fields to verify they are received correctly
  console.log('MessageNotfication:', MessageNotfication);
  console.log('latitude:', latitude);
  console.log('longitude:', longitude);
  console.log('mapImageUrl:', mapImageUrl);

  if (!MessageNotfication || !latitude || !longitude || !mapImageUrl) {
    return res.status(400).send('Missing required fields');
  }

  phoneNumbers.forEach(phoneNumber => {
    client.messages
      .create({
        body: `Red Alert: There is an emergency of ${MessageNotfication}. Location: Latitude ${latitude}, Longitude ${longitude}. Map: ${mapImageUrl}`,
        from: '+13253095939', // Your Twilio phone number
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
