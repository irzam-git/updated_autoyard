# Get Vehicle Details By Rego Number & State Copy API

**Category:** `Driver Portal APIs/Car Inventory`  
**HTTP Method:** `GET`  
**Endpoint:** `/vehicle/vehicle-details?registration_state=VIC&registration_number=TEST00`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/vehicle/vehicle-details?registration_state=VIC&registration_number=TEST00`  
**Base URL:** `https://dev.autoyard.com.au/api/v1`  

> **Status:** `200 OK` (Verified & Working)

## Request Headers
| Header | Value | Description |
| :--- | :--- | :--- |
| `Accept` | `application/json` | Required for JSON response |
| `Authorization` | `Bearer <Driver_Auth_Token>` | - |

## Query Parameters
| Parameter | Type | Disabled/Default | Description |
| :--- | :--- | :--- | :--- |
| `registration_state` | `string` | Active (value: `VIC`) | - |
| `registration_number` | `string` | Active (value: `TEST00`) | - |

## Live Response
**HTTP Status Code:** `200`

### Response Headers
```http
Date: Tue, 06 Oct 2026 03:34:48 GMT
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
    "request_id": "c7098713-0522-4231-b4a8-f657fb827842",
    "result": null
  },
  "message": "Vehicle Details Successfully Fetched By Rego Number & State"
}
```

## cURL Example
```bash
curl -X GET 'https://dev.autoyard.com.au/api/v1/vehicle/vehicle-details?registration_state=VIC&registration_number=TEST00' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
