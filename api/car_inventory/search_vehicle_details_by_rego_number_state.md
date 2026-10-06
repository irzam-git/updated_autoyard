# Search Vehicle Details By Rego Number & State API

**Category:** `Driver Portal APIs/Car Inventory`  
**HTTP Method:** `GET`  
**Endpoint:** `/vehicle/search-vehicle-details?registration_state=QLD&registration_number=4H5AN`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/vehicle/search-vehicle-details?registration_state=QLD&registration_number=4H5AN`  
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
| `registration_state` | `string` | Active (value: `QLD`) | - |
| `registration_number` | `string` | Active (value: `4H5AN`) | - |

## Live Response
**HTTP Status Code:** `200`

### Response Headers
```http
Date: Tue, 06 Oct 2026 03:34:53 GMT
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
    "vin_number": "LRW3F7FS0PC781475",
    "brand": {
      "id": 131,
      "name": "Tesla"
    },
    "model": {
      "id": 4902,
      "name": "Model 3"
    },
    "year": 2023,
    "registration_number": "4H5AN",
    "registration_state": "QLD",
    "body_type": "SEDAN",
    "engine_number": "TG3230390036YA",
    "engine_size": "",
    "variant": "RWD",
    "transmission": "Manual"
  },
  "message": "Vehicle Details Successfully Fetched By Rego Number & State"
}
```

## cURL Example
```bash
curl -X GET 'https://dev.autoyard.com.au/api/v1/vehicle/search-vehicle-details?registration_state=QLD&registration_number=4H5AN' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
