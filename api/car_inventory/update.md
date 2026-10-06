# Update API

**Category:** `Driver Portal APIs/Car Inventory`  
**HTTP Method:** `POST`  
**Endpoint:** `/vehicle/update/1`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/vehicle/update/1`  
**Base URL:** `https://dev.autoyard.com.au/api/v1`  

> **Status:** `HTTP 422` (See Response Details below)

## Request Headers
| Header | Value | Description |
| :--- | :--- | :--- |
| `Accept` | `application/json` | Required for JSON response |
| `Authorization` | `Bearer <Driver_Auth_Token>` | - |
| `Content-Type` | `multipart/form-data` or `application/x-www-form-urlencoded` | Required for POST form body |

## Request Body
**Body Type:** `formdata`

| Field | Type | Description | Sample Value |
| :--- | :--- | :--- | :--- |
| `step` | `text` | Step in the creation process.  | `3` |
| `brand` | `text` | Brand ID. | `1` |
| `model` | `text` | Model ID.  | `1` |
| `year` | `text` | Vehicle year. | `1999` |
| `registration_number` | `text` | Vehicle registration number.  | `1CMR524` |
| `registration_date` | `text` | Vehicle registration date in YYYY-MM-DD format.  | `2024-05-22` |
| `registration_state` | `text` | State where the vehicle is registered.  | `NSW` |
| `engine_size` | `text` | Engine size.  | `1.6L` |
| `engine_number` | `text` | Engine number.  | `1598CC` |
| `vin_number` | `text` | Vehicle Identification Number (VIN).  | `23213232132132213` |
| `transmission` | `text` | Type of transmission.  | `Auto` |
| `body_type` | `text` | Type of vehicle body.  | `2D HATCHBACK` |
| `variant` | `text` | Variant of the vehicle.  | `Consequatur Animi` |
| `built` | `text` | Build date in MM/YYYY format.  | `11/2024` |
| `odometer` | `text` | Odometer reading or description.  | `Error quam id vero` |
| `first_name` | `text` | Owner's first name.  | `Robert` |
| `last_name` | `text` | Owner's last name.  | `Mccoy` |
| `abn_number` | `text` | Australian Business Number (ABN).  | `12345678912345678` |
| `business_name` | `text` | Business name associated with the vehicle.  | `Lorem Ipsum Company` |
| `phone_number` | `text` | Owner's phone number.  | `+1-202-555-0150` |
| `license_number` | `text` | Owner's license number.  | `A1234567` |
| `pickup_date` | `text` | Date when the vehicle will be picked up in YYYY-MM-DD format.  | `2024-06-01` |
| `date_of_birth` | `text` | Owner's date of birth in YYYY-MM-DD format.  | `1980-01-01` |
| `pickup_address` | `text` | Address where the vehicle will be picked up.  | `123 Main St, Springfield` |
| `residential_address` | `text` | Owner's residential address.  | `456 Elm St, Springfield` |
| `same_pickup_address` | `text` | Indicates if the pickup address is the same as the residential address (1 for yes, 0 for no).  | `0` |
| `vehicle_condition` | `text` | Condition of the vehicle. Value type JSON  Possible values: drivable - yes or no accidental - yes or no wovi - yes or no under_finance - yes or no | `{"drivable": "yes", "accidental": "no", "wovi": "no", "under_finance": "no"}` |
| `note` | `text` | Additional notes regarding the vehicle.  | `Lorem ipsum dolor sit amet` |
| `price` | `text` | Price of the vehicle.  | `15000` |
| `payment_method` | `text` | Payment method. Possible values: Cash, Bank Transfer.  | `Bank Transfer` |
| `owner_signature` | `file` | Image file of the owner's signature. Accepts jpg, jpeg, png formats, max size 10MB.  | `None` |
| `buyer_signature` | `file` | Image file of the buyer's signature. Accepts jpg, jpeg, png formats, max size 10MB.  | `None` |

**Example Payload (JSON Representation):**
```json
{
  "step": "3",
  "brand": "1",
  "model": "1",
  "year": "1999",
  "registration_number": "1CMR524",
  "registration_date": "2024-05-22",
  "registration_state": "NSW",
  "engine_size": "1.6L",
  "engine_number": "1598CC",
  "vin_number": "23213232132132213",
  "transmission": "Auto",
  "body_type": "2D HATCHBACK",
  "variant": "Consequatur Animi",
  "built": "11/2024",
  "odometer": "Error quam id vero",
  "first_name": "Robert",
  "last_name": "Mccoy",
  "abn_number": "12345678912345678",
  "business_name": "Lorem Ipsum Company",
  "phone_number": "+1-202-555-0150",
  "license_number": "A1234567",
  "pickup_date": "2024-06-01",
  "date_of_birth": "1980-01-01",
  "pickup_address": "123 Main St, Springfield",
  "residential_address": "456 Elm St, Springfield",
  "same_pickup_address": "0",
  "vehicle_condition": "{\"drivable\": \"yes\", \"accidental\": \"no\", \"wovi\": \"no\", \"under_finance\": \"no\"}",
  "note": "Lorem ipsum dolor sit amet",
  "price": "15000",
  "payment_method": "Bank Transfer",
  "owner_signature": null,
  "buyer_signature": null
}
```

## Live Response
**HTTP Status Code:** `422`

### Response Headers
```http
Date: Tue, 06 Oct 2026 03:34:50 GMT
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
  "data": {
    "owner_signature": [
      "The owner signature must be a file.",
      "The owner signature must be a file of type: jpg, jpeg, png."
    ],
    "buyer_signature": [
      "The buyer signature must be a file.",
      "The buyer signature must be a file of type: jpg, jpeg, png."
    ]
  },
  "message": "Validation Errors Found!"
}
```

## cURL Example
```bash
curl -X POST 'https://dev.autoyard.com.au/api/v1/vehicle/update/1' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'step=3&brand=1&model=1&year=1999&registration_number=1CMR524&registration_date=2024-05-22&registration_state=NSW&engine_size=1.6L&engine_number=1598CC&vin_number=23213232132132213&transmission=Auto&body_type=2D+HATCHBACK&variant=Consequatur+Animi&built=11%2F2024&odometer=Error+quam+id+vero&first_name=Robert&last_name=Mccoy&abn_number=12345678912345678&business_name=Lorem+Ipsum+Company&phone_number=%2B1-202-555-0150&license_number=A1234567&pickup_date=2024-06-01&date_of_birth=1980-01-01&pickup_address=123+Main+St%2C+Springfield&residential_address=456+Elm+St%2C+Springfield&same_pickup_address=0&vehicle_condition=%7B%22drivable%22%3A+%22yes%22%2C+%22accidental%22%3A+%22no%22%2C+%22wovi%22%3A+%22no%22%2C+%22under_finance%22%3A+%22no%22%7D&note=Lorem+ipsum+dolor+sit+amet&price=15000&payment_method=Bank+Transfer&owner_signature=None&buyer_signature=None'
```

## Notes & Observations
- **422 Validation Error**: Missing required parameters in payload. Ensure all mandatory fields are provided.
