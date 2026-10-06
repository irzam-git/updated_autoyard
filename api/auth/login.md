# Login API

**Category:** `Driver Portal APIs/Auth`  
**HTTP Method:** `POST`  
**Endpoint:** `/auth/authenticate`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/auth/authenticate`  
**Base URL:** `https://dev.autoyard.com.au/api/v1`  

> **Status:** `200 OK` (Verified & Working)

## Request Headers
| Header | Value | Description |
| :--- | :--- | :--- |
| `Accept` | `application/json` | Required for JSON response |
| `Content-Type` | `multipart/form-data` or `application/x-www-form-urlencoded` | Required for POST form body |

## Request Body
**Body Type:** `formdata`

| Field | Type | Description | Sample Value |
| :--- | :--- | :--- | :--- |
| `email` | `text` | User email. Example: driver@mail.com | `ahmed@pixelz360.com.au` |
| `password` | `text` | User password. Example: password | `password` |

**Example Payload (JSON Representation):**
```json
{
  "email": "ahmed@pixelz360.com.au",
  "password": "password"
}
```

## Live Response
**HTTP Status Code:** `200`

### Response Headers
```http
Date: Tue, 06 Oct 2026 03:34:39 GMT
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
  "error": 0,
  "data": {
    "user": {
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
      },
      "driver_parent": {
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
      },
      "driver_parent_details": {
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
    "authorisation": {
      "type": "Bearer",
      "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiZDJkYjlhYzQ1N2ZlY2ViMTMwMzI2OWQ2ZTIwMWFhOTBmOWE4MGFiYjRhOTkyMTQ0ZjcxZTFmMzA2NmM3ODExNTNhMTk3ZTJhMWY4ZTVhNDgiLCJpYXQiOjE3OTEyNTc2NzkuMjAyOTI3LCJuYmYiOjE3OTEyNTc2NzkuMjAyOTI5LCJleHAiOjE4MjI3OTM2NzkuMjAyMzM1LCJzdWIiOiIxNiIsInNjb3BlcyI6W119.RN8HjS4iP1Ump7p3028JNBEBgNTFajKLVgkm_7gMobuCGO5_-HeKuGg1KhJsP5Flt6hCPz-iyPBxbbyW6dyyjr9RwFnSErtbXi4H87FEa4JSovLIllN-9WKYd9rvDgSdwKoewglqVT_MjXiBt7j--k58P8JWEdrdsxDrhw90Pm3lEi2Mc7Ke9rhyhXLYV43d6O-LOMwBTfFrGNFyLFRYzxA0hAbC_yTDPZ6fIm03KwgOD_78IB0J2I58Hcv0UjsKE1yXAiLhS9XQee6-n5THaDFAvLUo6NZLpX5rz0FxTyx-6OjrTswMtvIsUiDpw0KM3zW2xD9yHLvZ4hIw4Uck22Kcl7Cw9oeVGMQN8ceCfEs1uuFMamb99HZGCB9Yc0hWkrGUtrqHYhHpkSOk4IC5jNwT_GfkJOtFLMwgInEnZHT2W4_56H7aGGmbVdx8g0Lp1CyHckAvX7Rx2DLxLS1qvl80NahO1v-ilJrePY1syfPxJsnePtprM7IyJNR--ahGXBBtvO9KkB2W__sNEHJNW_xEQBHjuK2KIHFRFSDfjZmgJThmeym8FnJ99DP1pq-OhTveYXreUbFOzZOoHt1a1UnqlWQ9KPRh8u46zVDg5XIW53rpUpVJEAoripx3luprdvQxr9bUD0a570x-leWZJ_DUYKdhOrjXI4ch1Gd_WR0",
      "expiration": 31535999
    }
  },
  "message": "Congratulations! You are now logged in"
}
```

## cURL Example
```bash
curl -X POST 'https://dev.autoyard.com.au/api/v1/auth/authenticate' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'email=ahmed%40pixelz360.com.au&password=password'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
