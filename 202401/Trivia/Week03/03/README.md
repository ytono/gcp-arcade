# Google Chat Bot - Apps Script

https://script.google.com/create

# Project Name
Attendance Bot

## Task 1. Create handlers for Google Chat events
###  Code.gs
```
/**
* Responds to an ADDED_TO_SPACE event in Google Chat.
* @param {object} event the event object from Google Chat
* @return {object} JSON-formatted response
* @see https://developers.google.com/chat/reference/message-formats/events
*/

function onAddToSpace(event) {
  console.info(event);
  var message = 'Thank you for adding me to ';
  if (event.space.type === 'DM') {
    message += 'a DM, ' + event.user.displayName + '!';
  } else {
    message += event.space.displayName;
  }
  console.log('Attendance Bot added in ', event.space.name);
  return { text: message };
}

/**
* Responds to a REMOVED_FROM_SPACE event in Google Chat.
* @param {object} event the event object from Google Chat
* @see https://developers.google.com/chat/reference/message-formats/events
*/
function onRemoveFromSpace(event) {
  console.info(event);
  console.log('Bot removed from ', event.space.name);
}

```

## Task 2. Publish the bot

### appsscript.json
```
{
  "timeZone": "Asia/Tokyo",
  "dependencies": {
      "enabledAdvancedServices": [
      {
        "userSymbol": "Gmail",
        "version": "v1",
        "serviceId": "gmail"
      },
      ]
  },
  "exceptionLogging": "STACKDRIVER",
  "chat": {},
  "runtimeVersion": "V8"
}
Configure the Google Cloud proj
```

# APIs & Services > OAuth consent screen
# Internal create
# App Name , User support email, Developer contact information
```
Attendance Bot
```

# Back to Dashboard > Project settings. > Project number
# App Script editor > Project Settings 
# Deploy > New Deployment

Description copy

# Google Chat API > Configuration 

Attendance Bot
https://goo.gl/kv2ENA
Apps Script lab bot
Receive 1:1 messages
# Deployment ID field
# username

https://chat.google.com/

search Attendance bot

```
var DEFAULT_IMAGE_URL = 'https://goo.gl/bMqzYS';
var HEADER = {
  header: {
    title : 'Attendance Bot',
    subtitle : 'Log your vacation time',
    imageUrl : DEFAULT_IMAGE_URL
  }
};

/**
 * Creates a card-formatted response.
 * @param {object} widgets the UI components to send
 * @return {object} JSON-formatted response
 */
function createCardResponse(widgets) {
  return {
    cards: [HEADER, {
      sections: [{
        widgets: widgets
      }]
    }]
  };
}

/**
 * Responds to a MESSAGE event triggered
 * in Google Chat.
 *
 * @param event the event object from Google Chat
 * @return JSON-formatted response
 */
function onMessage(event) {
  var userMessage = event.message.text;

  var widgets = [{
    "textParagraph": {
      "text": "You said: " + userMessage
    }
  }];

  console.log('You said:', userMessage);

  return createCardResponse(widgets);
}
```

### Deploy

### Test the bot

configure

