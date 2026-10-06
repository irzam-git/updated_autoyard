# Status Update API

**Category:** `Driver Portal APIs/Assigned Car Pickup`  
**HTTP Method:** `POST`  
**Endpoint:** `/assign_vehicle/status/1`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/assign_vehicle/status/1`  
**Base URL:** `https://dev.autoyard.com.au/api/v1`  

> **Status:** `200 OK` (Verified & Working)

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
| `status` | `text` | New status of the assign vehicle. Possible values: pending, completed or cancelled. Example: completed. | `completed` |

**Example Payload (JSON Representation):**
```json
{
  "status": "completed"
}
```

## Live Response
**HTTP Status Code:** `200`

### Response Headers
```http
Date: Tue, 06 Oct 2026 03:34:46 GMT
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
    "id": 52,
    "user_id": 15,
    "driver_id": 16,
    "brand_id": 12,
    "model_id": 302,
    "customer_name": "Ibrar Jadoon",
    "phone_number": "+923212110948",
    "address": "test address",
    "year": "2000",
    "pickup_date": "2026-10-02",
    "pickup_time": "05:20:00",
    "track_driver": null,
    "track_driver_enable": 0,
    "price": 2500,
    "payment_method": "Cash",
    "note": "call to customer before picking the car",
    "status": "accepted",
    "created_at": "2026-10-01T01:20:04.000000Z",
    "updated_at": "2026-10-06T03:34:45.000000Z",
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
      },
      "customer_details": {
        "id": 6,
        "user_id": 15,
        "company_name": "P360 Automobiles",
        "business_name": "P360 Automobiles",
        "business_address": "Karachi Pakistan",
        "business_email": "pm@pixelz360.com.au",
        "abn_number": "124411278",
        "crn_number": null,
        "business_license": null,
        "website": "https://p360automobiles.com/",
        "business_logo": null,
        "is_avail_trial": 0,
        "is_avail_free_plan": 1,
        "auto_renewal_subscription": 1,
        "xero_access_token": null,
        "xero_refresh_token": null,
        "xero_token_expires_at": null,
        "xero_tenant_id": null,
        "activation_key": "20250521045823ZNMN4B",
        "pm_customer_id": "cus_VNsY3eFfsFQtzY",
        "status": "active",
        "business_initials": "P",
        "business_logo_url": null
      }
    },
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
      },
      "driver_details": {
        "id": 9,
        "user_id": 16,
        "send_details_to": "email"
      }
    },
    "brand": {
      "id": 12,
      "name": "Bentley",
      "image": null,
      "description": null,
      "status": "active",
      "created_at": "2024-08-23T01:05:20.000000Z",
      "updated_at": "2025-06-15T13:00:56.000000Z",
      "image_url": null,
      "has_pickup_vehicles": true,
      "has_vehicles": false,
      "pickup_vehicles_count": 1,
      "vehicles_count": 0,
      "models_count": 29
    },
    "model": {
      "id": 302,
      "brand_id": 12,
      "name": "Continental GT Speed",
      "description": null,
      "status": "active",
      "created_at": "2024-08-23T01:05:21.000000Z",
      "updated_at": "2024-08-23T01:05:21.000000Z",
      "has_pickup_vehicles": true,
      "has_vehicles": false,
      "pickup_vehicles_count": 1,
      "vehicles_count": 0
    }
  },
  "message": "Assigned vehicles status have been successfully updated."
}
```

## cURL Example
```bash
curl -X POST 'https://dev.autoyard.com.au/api/v1/assign_vehicle/status/1' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'status=completed'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
