# Send Purchase Receipt API

**Category:** `Driver Portal APIs/Car Inventory`  
**HTTP Method:** `POST`  
**Endpoint:** `/vehicle/send_purchase_receipt/15?email=example@mail.com`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/vehicle/send_purchase_receipt/15?email=example@mail.com`  
**Base URL:** `https://dev.autoyard.com.au/api/v1`  

> **Status:** `HTTP 404` (See Response Details below)

## Request Headers
| Header | Value | Description |
| :--- | :--- | :--- |
| `Accept` | `application/json` | Required for JSON response |
| `Authorization` | `Bearer <Driver_Auth_Token>` | - |

## Query Parameters
| Parameter | Type | Disabled/Default | Description |
| :--- | :--- | :--- | :--- |
| `email` | `string` | Active (value: `example@mail.com`) | - |

## Live Response
**HTTP Status Code:** `404`

### Response Headers
```http
Date: Tue, 06 Oct 2026 03:34:51 GMT
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
  "error": 1,
  "message": "Access Denied!"
}
```

## cURL Example
```bash
curl -X POST 'https://dev.autoyard.com.au/api/v1/vehicle/send_purchase_receipt/15?email=example@mail.com' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- **404 Not Found / Access Denied**: {
  "error": 1,
  "message": "Access Denied!"
}
