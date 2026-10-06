# Signup API

**Category:** `Driver Portal APIs/Auth`  
**HTTP Method:** `POST`  
**Endpoint:** `/auth/signup_driver`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/auth/signup_driver`  
**Base URL:** `https://dev.autoyard.com.au/api/v1`  

> **Status:** `Not Executed Live` (Avoid creating duplicate mock driver accounts on test environment.)

## Request Headers
| Header | Value | Description |
| :--- | :--- | :--- |
| `Accept` | `application/json` | Required for JSON response |
| `Content-Type` | `multipart/form-data` or `application/x-www-form-urlencoded` | Required for POST form body |

## Request Body
**Body Type:** `formdata`

| Field | Type | Description | Sample Value |
| :--- | :--- | :--- | :--- |
| `first_name` | `text` | User first name. Example: John | `John` |
| `last_name` | `text` | User last name. | `Doe` |
| `phone_number` | `text` | User phone number. Example: +1-202-555-0150 | `1234567890` |
| `email` | `text` | User email. Example: driver@mail.com | `driver@mail.com` |
| `password` | `text` | Password for the user account. Example: password | `password` |
| `password_confirmation` | `text` | Confirmation of the password. Should match the password. Example: password | `password` |
| `send_details_to` | `text` | Preferred method for receiving details. Possible values: sms, email. Example: email | `email` |
| `activation_key` | `text` | - | `20240822124803WICNKF` |

**Example Payload (JSON Representation):**
```json
{
  "first_name": "John",
  "last_name": "Doe",
  "phone_number": "1234567890",
  "email": "driver@mail.com",
  "password": "password",
  "password_confirmation": "password",
  "send_details_to": "email",
  "activation_key": "20240822124803WICNKF"
}
```

## Live Response
**HTTP Status Code:** `SKIPPED`

### Response Body
```json
{
  "info": "Avoid creating duplicate mock driver accounts on test environment."
}
```

## cURL Example
```bash
curl -X POST 'https://dev.autoyard.com.au/api/v1/auth/signup_driver' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'first_name=John&last_name=Doe&phone_number=1234567890&email=driver%40mail.com&password=password&password_confirmation=password&send_details_to=email&activation_key=20240822124803WICNKF'
```

## Notes & Observations
- Live execution skipped: Avoid creating duplicate mock driver accounts on test environment.
