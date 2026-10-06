# Single API

**Category:** `Driver Portal APIs/Car Inventory`  
**HTTP Method:** `GET`  
**Endpoint:** `/vehicle/1`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/vehicle/1`  
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
Date: Tue, 06 Oct 2026 03:34:47 GMT
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
    "id": 90,
    "user_id": 15,
    "driver_id": 16,
    "brand_id": 7,
    "model_id": 209,
    "year": "2024",
    "registration_number": "ABC123",
    "registration_date": "2025-08-27",
    "registration_state": "ACT",
    "engine_size": "2 Cylinder",
    "engine_number": "JGSWBC22004",
    "vin_number": "78787878878TYGGGG",
    "transmission": "Auto",
    "body_type": "Wagon",
    "variant": "Supreme 11",
    "built": "11/2025",
    "odometer": "40000",
    "first_name": "Arifa",
    "last_name": "RIAZ",
    "abn_number": "352626262626",
    "business_name": "bahl",
    "phone_number": "6789045678976",
    "license_number": "FHGF6666666666666666",
    "pickup_date": "2025-08-26T14:00:00.000000Z",
    "date_of_birth": "2025-08-27",
    "pickup_address": "Gold Coast QLD, Australia",
    "residential_address": "Gold Coast QLD, Australia",
    "same_pickup_address": 1,
    "vehicle_condition": {
      "drivable": "yes",
      "accidental": "no",
      "wovi": "yes",
      "under_finance": "no"
    },
    "note": "NB",
    "price": 7000,
    "payment_method": "Cash",
    "owner_signature": "175627119968ae925fb4390.png",
    "buyer_signature": "175627119968ae925fb748f.png",
    "status": "in-stock",
    "approval": 1,
    "created_at": "2025-08-27T00:06:39.000000Z",
    "updated_at": "2026-10-05T09:00:27.000000Z",
    "fullname": "Arifa RIAZ",
    "owner_signature_url": "https://dev.autoyard.com.au/storage/vehicle/175627119968ae925fb4390.png",
    "buyer_signature_url": "https://dev.autoyard.com.au/storage/vehicle/175627119968ae925fb748f.png",
    "brand": {
      "id": 7,
      "name": "Audi",
      "image": null,
      "description": null,
      "status": "deactive",
      "created_at": "2024-08-23T01:05:18.000000Z",
      "updated_at": "2025-08-28T16:23:51.000000Z",
      "image_url": null,
      "has_pickup_vehicles": true,
      "has_vehicles": true,
      "pickup_vehicles_count": 2,
      "vehicles_count": 14,
      "models_count": 161
    },
    "model": {
      "id": 209,
      "brand_id": 7,
      "name": "100 quattro",
      "description": null,
      "status": "active",
      "created_at": "2024-08-23T01:05:20.000000Z",
      "updated_at": "2024-08-23T01:05:20.000000Z",
      "has_pickup_vehicles": false,
      "has_vehicles": true,
      "pickup_vehicles_count": 0,
      "vehicles_count": 3
    },
    "buyer": null,
    "driver_info": {
      "id": 16,
      "role_id": null,
      "parent_id": 15,
      "first_name": "Fawaz",
      "last_name": "Hussain",
      "user_type": "driver",
      "username": "yousufyhsblaze",
      "email": "fawaz.pixelz360@gmail.com",
      "email_verified_at": "2025-02-03T22:21:55.000000Z",
      "phone_number": "03002643066",
      "profile_image": "17495822366848819cb9ff5.jpeg",
      "avatar_color": "#0DB0F4",
      "first_attempt": true,
      "status": "active",
      "latitude": null,
      "longitude": null,
      "location_updated_at": null,
      "is_super": false,
      "created_at": "2025-02-03T22:21:15.000000Z",
      "updated_at": "2026-09-30T20:18:25.000000Z",
      "fullname": "Fawaz Hussain",
      "initials": "FH",
      "verified": true,
      "profile_image_url": "https://dev.autoyard.com.au/storage/users/17495822366848819cb9ff5.jpeg",
      "other": {
        "driver_assigned_vehicles": true,
        "driver_vehicles": true
      }
    },
    "customer_info": {
      "id": 15,
      "role_id": null,
      "parent_id": null,
      "first_name": "Huzaifa",
      "last_name": "Rasheed",
      "user_type": "customer",
      "username": "pm",
      "email": "pm@pixelz360.com.au",
      "email_verified_at": "2025-02-03T22:10:49.000000Z",
      "phone_number": "+923002643066",
      "profile_image": null,
      "avatar_color": "#0DB0F4",
      "first_attempt": true,
      "status": "active",
      "latitude": null,
      "longitude": null,
      "location_updated_at": null,
      "is_super": false,
      "created_at": "2025-02-03T22:10:41.000000Z",
      "updated_at": "2025-05-21T00:08:00.000000Z",
      "fullname": "Huzaifa Rasheed",
      "initials": "HR",
      "verified": true,
      "profile_image_url": null,
      "other": {
        "is_subscribed": true,
        "is_subscription_active": true,
        "has_exceeded_driver_limit": false,
        "has_exceeded_car_limit": false,
        "drivers_count": 1,
        "vehicles_count": 27
      }
    }
  },
  "message": "Vehicle have been successfully retrieved."
}
```

## cURL Example
```bash
curl -X GET 'https://dev.autoyard.com.au/api/v1/vehicle/1' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
