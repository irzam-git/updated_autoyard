# Mark As Read API

**Category:** `Driver Portal APIs/Notifications`  
**HTTP Method:** `POST`  
**Endpoint:** `/notification/mark_read/7bb240e4-89fb-43fa-b199-60b72071cdd7`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/notification/mark_read/7bb240e4-89fb-43fa-b199-60b72071cdd7`  
**Base URL:** `https://dev.autoyard.com.au/api/v1`  

> **Status:** `200 OK` (Verified & Working)

## Request Headers
| Header | Value | Description |
| :--- | :--- | :--- |
| `Accept` | `application/json` | Required for JSON response |
| `Authorization` | `Bearer <Driver_Auth_Token>` | - |

## Live Response
**HTTP Status Code:** `200`

### Response Headers
```http
Date: Tue, 06 Oct 2026 03:34:57 GMT
Content-Type: application/json
Transfer-Encoding: chunked
Connection: close
Vary: Accept-Encoding
x-powered-by: PHP/8.3.33
Cache-Control: no-cache, private
access-control-allow-origin: *
```

### Response Body
```json
{
  "error": 0,
  "data": [],
  "message": "Notification marked as read"
}
```

## cURL Example
```bash
curl -X POST 'https://dev.autoyard.com.au/api/v1/notification/mark_read/7bb240e4-89fb-43fa-b199-60b72071cdd7' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
