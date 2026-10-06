# Bulk Mark as Read API

**Category:** `Driver Portal APIs/Notifications`  
**HTTP Method:** `POST`  
**Endpoint:** `/notification/bulk_mark_read`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/notification/bulk_mark_read`  
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
| `ids[]` | `text` | Array of Notification IDs to mark read. | `7bb240e4-89fb-43fa-b199-60b72071cdd7` |

**Example Payload (JSON Representation):**
```json
{
  "ids[]": "7bb240e4-89fb-43fa-b199-60b72071cdd7"
}
```

## Live Response
**HTTP Status Code:** `200`

### Response Headers
```http
Date: Tue, 06 Oct 2026 03:34:57 GMT
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
  "data": [
    {
      "id": "f2032229-9964-4a14-bc56-d2fafc84dda8",
      "type": "App\\Notifications\\AssignedVehicleToDriverByCustomerNotification",
      "notifiable_type": "App\\Models\\User",
      "notifiable_id": 16,
      "data": {
        "title": "Pickup Vehicle Assignment",
        "url": "http://127.0.0.1:8000/driver/assigned_vehicle/52",
        "message": "Bentley Continental GT Speed pickup vehicle has been assigned."
      },
      "read_at": "2026-10-06T03:33:28.000000Z",
      "created_at": "2026-10-01T01:20:04.000000Z",
      "updated_at": "2026-10-06T03:33:28.000000Z"
    }
  ],
  "message": "Notifications marked as read."
}
```

## cURL Example
```bash
curl -X POST 'https://dev.autoyard.com.au/api/v1/notification/bulk_mark_read' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'ids%5B%5D=7bb240e4-89fb-43fa-b199-60b72071cdd7'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
