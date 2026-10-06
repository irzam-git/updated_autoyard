# Logout API

**Category:** `Driver Portal APIs/Auth`  
**HTTP Method:** `POST`  
**Endpoint:** `/auth/logout`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/auth/logout`  
**Base URL:** `https://dev.autoyard.com.au/api/v1`  

> **Status:** `Not Executed Live` (Logout invalidates the active session Bearer token.)

## Request Headers
| Header | Value | Description |
| :--- | :--- | :--- |
| `Accept` | `application/json` | Required for JSON response |
| `Authorization` | `Bearer <Driver_Auth_Token>` | - |

## Live Response
**HTTP Status Code:** `SKIPPED`

### Response Body
```json
{
  "info": "Logout invalidates the active session Bearer token."
}
```

## cURL Example
```bash
curl -X POST 'https://dev.autoyard.com.au/api/v1/auth/logout' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- Live execution skipped: Logout invalidates the active session Bearer token.
