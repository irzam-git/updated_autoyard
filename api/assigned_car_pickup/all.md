# All API

**Category:** `Driver Portal APIs/Assigned Car Pickup`  
**HTTP Method:** `GET`  
**Endpoint:** `/assign_vehicle?orderby=id&order=DESC&perpage=10&page=1&date=2024-08-23`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/assign_vehicle?orderby=id&order=DESC&perpage=10&page=1&date=2024-08-23`  
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
| `orderby` | `string` | Active (value: `id`) | Field to order the results by. Example: id. Default is id. |
| `order` | `string` | Active (value: `DESC`) | Order direction. Possible values: ASC, DESC. Default is DESC. |
| `perpage` | `string` | Active (value: `10`) | Number of results per page. Used for pagination. Example: 10. |
| `limit` | `string` | Yes (Disabled by default) (value: ``) | Limit the number of records returned. |
| `search` | `string` | Yes (Disabled by default) (value: `ABCD`) | Search by customer name or phone number. Example: ABCD. |
| `status` | `string` | Yes (Disabled by default) (value: `pending`) | Filter by status. Possible values: pending, completed or cancelled. Example: pending. |
| `dates[]` | `string` | Yes (Disabled by default) (value: `2024-05-31`) | Search by date range. Example: ["2024-05-31", "2024-06-31"]. |
| `dates[]` | `string` | Yes (Disabled by default) (value: `2024-06-31`) | - |
| `driver` | `string` | Yes (Disabled by default) (value: `1`) | Search by driver id. Example: 1. |
| `brand` | `string` | Yes (Disabled by default) (value: `1`) | Search by brand id. Example: 1. |
| `model` | `string` | Yes (Disabled by default) (value: `1`) | Search by model id. Example: 1. |
| `year` | `string` | Yes (Disabled by default) (value: `1999`) | Search by year. Example: 1999. |
| `page` | `string` | Active (value: `1`) | - |
| `date` | `string` | Active (value: `2024-08-23`) | Search by date |

## Live Response
**HTTP Status Code:** `200`

### Response Headers
```http
Date: Tue, 06 Oct 2026 03:34:44 GMT
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
  "data": [],
  "message": "Assigned vehicles have been successfully retrieved.",
  "paginate": {
    "current_page": 1,
    "last_page": 1,
    "per_page": 10,
    "from": 0,
    "to": 0,
    "count": 0,
    "total": 0,
    "has_more_pages": false
  }
}
```

## cURL Example
```bash
curl -X GET 'https://dev.autoyard.com.au/api/v1/assign_vehicle?orderby=id&order=DESC&perpage=10&page=1&date=2024-08-23' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'
```

## Notes & Observations
- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.
