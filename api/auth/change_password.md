# Change Password API

**Category:** `Driver Portal APIs/Auth`  
**HTTP Method:** `POST`  
**Endpoint:** `/auth/change-password`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/auth/change-password`  
**Base URL:** `https://dev.autoyard.com.au/api/v1`  

> **Status:** `Not Executed Live` (Avoid altering the provided driver credentials.)

## Request Headers
| Header | Value | Description |
| :--- | :--- | :--- |
| `Accept` | `application/json` | Required for JSON response |
| `Authorization` | `Bearer <Driver_Auth_Token>` | - |
| `Content-Type` | `multipart/form-data` or `application/x-www-form-urlencoded` | Required for POST form body |

## Request Body
**Body Type:** `formdata`

| Field | Type | Description | Sample Value |
| :--- | :--- | :--- | :--- |
| `current_password` | `text` | The user's current password. Example: password | `password` |
| `new_password` | `text` | The new password the user wants to set. Example: password123 | `password123` |
| `confirm_password` | `text` | Confirmation of the new password. It should match the new_password. Example: password123 | `password123` |

**Example Payload (JSON Representation):**
```json
{
  "current_password": "password",
  "new_password": "password123",
  "confirm_password": "password123"
}
```

## Live Response
**HTTP Status Code:** `SKIPPED`

### Response Body
```json
{
  "info": "Avoid altering the provided driver credentials."
}
```

## cURL Example
```bash
curl -X POST 'https://dev.autoyard.com.au/api/v1/auth/change-password' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'current_password=password&new_password=password123&confirm_password=password123'
```

## Notes & Observations
- Live execution skipped: Avoid altering the provided driver credentials.
