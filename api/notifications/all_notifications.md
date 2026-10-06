# All Notifications API

**Category:** `Driver Portal APIs/Notifications`  
**HTTP Method:** `GET`  
**Endpoint:** `/notification?orderby=created_at&order=DESC&perpage=10&page=1`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/notification?orderby=created_at&order=DESC&perpage=10&page=1`  
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
| `orderby` | `string` | Active (value: `created_at`) | Field to order the results by. Example: id. Default is id. |
| `order` | `string` | Active (value: `DESC`) | Order direction. Possible values: ASC, DESC. Default is DESC. |
| `perpage` | `string` | Active (value: `10`) | Number of results per page. Used for pagination. Example: 10. |
| `limit` | `string` | Yes (Disabled by default) (value: ``) | Limit the number of records returned. |
| `dates[]` | `string` | Yes (Disabled by default) (value: `2024-05-31`) | Search by date range. Example: ["2024-05-31", "2024-06-31"]. |
| `dates[]` | `string` | Yes (Disabled by default) (value: `2024-06-31`) | Search by date range. Example: ["2024-05-31", "2024-06-31"]. |
| `page` | `string` | Active (value: `1`) | - |

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
  "message": "Notification have been successfully retrieved.",
  "paginate": {
    "current_page": 1,
    "last_page": 1,
    "per_page": 10,
    "from": 1,
    "to": 1,
    "count": 1,
    "total": 1,
    "has_more_pages": false
  }
}
```

## cURL Example
```bash
curl -X GET 'https://dev.autoyard.com.au/api/v1/notification?orderby=created_at&order=DESC&perpage=10&page=1' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
