# Get Vehicle Details By Vin No. API

**Category:** `Driver Portal APIs/Car Inventory`  
**HTTP Method:** `GET`  
**Endpoint:** `/vehicle/vin-decoder?vin_number=LRW3F7FS0PC781475`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/vehicle/vin-decoder?vin_number=LRW3F7FS0PC781475`  
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
| `vin_number` | `string` | Active (value: `LRW3F7FS0PC781475`) | - |

## Live Response
**HTTP Status Code:** `200`

### Response Headers
```http
Date: Tue, 06 Oct 2026 03:34:56 GMT
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
    "request_id": "71ed3e89-62b7-4a28-ae65-62de0b7ec261",
    "result": {
      "make": "Tesla",
      "model": "Model 3",
      "variant": "RWD",
      "series": null,
      "build_year": 2023,
      "model_year": 2023,
      "body_style": "Sedan",
      "doors": 4,
      "seats": 5,
      "drive": "RWD",
      "fuel": {
        "type": "EV"
      },
      "engine": {
        "cylinders": null,
        "size_litres": null
      },
      "transmission": {
        "type": "Reduction Gear"
      }
    }
  },
  "message": "Success!"
}
```

## cURL Example
```bash
curl -X GET 'https://dev.autoyard.com.au/api/v1/vehicle/vin-decoder?vin_number=LRW3F7FS0PC781475' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
