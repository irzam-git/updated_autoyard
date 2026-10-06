# Send Email Verification Link API

**Category:** `Driver Portal APIs/Auth`  
**HTTP Method:** `POST`  
**Endpoint:** `/auth/resend-verification-email`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/auth/resend-verification-email`  
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
Date: Tue, 06 Oct 2026 03:34:43 GMT
Content-Type: application/json
Transfer-Encoding: chunked
Connection: close
Vary: Accept-Encoding
X-Powered-By: PHP/8.3.33
Cache-Control: no-cache, private
Access-Control-Allow-Origin: *
```

### Response Body
```json
{
  "error": 0,
  "message": "Verification link sent!"
}
```

## cURL Example
```bash
curl -X POST 'https://dev.autoyard.com.au/api/v1/auth/resend-verification-email' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
