# Get Vehicle Details By Rego Number & State API

**Category:** `Driver Portal APIs/Car Inventory`  
**HTTP Method:** `GET`  
**Endpoint:** `/vehicle/vehicle-details?registration_state=QLD&registration_number=4H5AN`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/vehicle/vehicle-details?registration_state=QLD&registration_number=4H5AN`  
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
Date: Tue, 06 Oct 2026 03:34:54 GMT
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
    "request_id": "3b4e41fc-8f85-4aa3-a58c-ded04f7864e8",
    "result": [
      {
        "vin": "LRW3F7FS0PC781475",
        "chassis": null,
        "registration": {
          "plate": "4H5AN",
          "state": "QLD"
        },
        "make": "Tesla",
        "model": "Model 3",
        "colour": "WHITE",
        "body_type": "SEDAN",
        "vehicle_type": "CAR / SMALL PASSENGER VEHICLE",
        "engine_number": "TG3230390036YA"
      }
    ]
  },
  "message": "Vehicle Details Successfully Fetched By Rego Number & State"
}
```

## cURL Example
```bash
curl -X GET 'https://dev.autoyard.com.au/api/v1/vehicle/vehicle-details?registration_state=QLD&registration_number=4H5AN' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
