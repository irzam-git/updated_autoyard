# Purchase Receipt PDF API

**Category:** `Driver Portal APIs/Car Inventory`  
**HTTP Method:** `GET`  
**Endpoint:** `/vehicle/purchase_receipt/26`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/vehicle/purchase_receipt/26`  
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
Date: Tue, 06 Oct 2026 03:34:50 GMT
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
  "data": {
    "receipt_url": "https://dev.autoyard.com.au/storage/purchase_receipt/receipt-QUFZ9RTvBHO4.pdf"
  },
  "message": "Purchase View PDF Generated!"
}
```

## cURL Example
```bash
curl -X GET 'https://dev.autoyard.com.au/api/v1/vehicle/purchase_receipt/26' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
