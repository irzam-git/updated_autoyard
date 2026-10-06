# Delete API

**Category:** `Driver Portal APIs/Car Inventory`  
**HTTP Method:** `POST`  
**Endpoint:** `/vehicle/delete/1`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/vehicle/delete/1`  
**Base URL:** `https://dev.autoyard.com.au/api/v1`  

> **Status:** `Not Executed Live` (Destructive endpoint (deletes vehicles permanently).)

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
  "info": "Destructive endpoint (deletes vehicles permanently)."
}
```

## cURL Example
```bash
curl -X POST 'https://dev.autoyard.com.au/api/v1/vehicle/delete/1' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- Live execution skipped: Destructive endpoint (deletes vehicles permanently).
