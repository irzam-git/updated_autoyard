# Bulk Delete API

**Category:** `Driver Portal APIs/Car Inventory`  
**HTTP Method:** `POST`  
**Endpoint:** `/vehicle/bulk_delete`  
**Full URL:** `https://dev.autoyard.com.au/api/v1/vehicle/bulk_delete`  
**Base URL:** `https://dev.autoyard.com.au/api/v1`  

> **Status:** `Not Executed Live` (Destructive endpoint (bulk deletes vehicles).)

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
| `ids[]` | `text` | Array of vehicle IDs to update. Example: [1, 2, 3] | `1` |

**Example Payload (JSON Representation):**
```json
{
  "ids[]": "1"
}
```

## Live Response
**HTTP Status Code:** `SKIPPED`

### Response Body
```json
{
  "info": "Destructive endpoint (bulk deletes vehicles)."
}
```

## cURL Example
```bash
curl -X POST 'https://dev.autoyard.com.au/api/v1/vehicle/bulk_delete' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d 'ids%5B%5D=1'
```

## Notes & Observations
- Live execution skipped: Destructive endpoint (bulk deletes vehicles).
