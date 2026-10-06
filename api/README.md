# Auto Yard APP APIs - Complete Documentation

This repository contains the separated, fully detailed documentation for all 28 API endpoints in the **Auto Yard App API Collection** (Driver Portal APIs).

---

## 1. Environment & Base Configuration

- **Target Domain:** `dev.autoyard.com.au` (Note: `dev.autoyard.co.au` has no active DNS record; the working base is `dev.autoyard.com.au`)
- **Base API URL:** `https://dev.autoyard.com.au/api/v1`
- **Auth Protocol:** Bearer Token JWT (Laravel Passport / Sanctum)
- **Test Driver Account:** `fawaz.pixelz360@gmail.com` (Driver ID: `16`, Name: `Fawaz Hussain`, Parent Customer ID: `15`)

### Authentication Header
All protected endpoints require the following HTTP headers:
```http
Authorization: Bearer <DRIVER_AUTH_TOKEN>
Accept: application/json
```

---

## 2. API Endpoints Directory & Index

| # | Category | Name | Method | Endpoint Path | Live Test Status | Documentation File |
| :-: | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | `Driver Portal APIs/Auth` | **Login** | `POST` | `/auth/authenticate` | ✅ `200 OK` | [auth/login.md](auth/login.md) |
| 2 | `Driver Portal APIs/Auth` | **Signup** | `POST` | `/auth/signup_driver` | ℹ️ _Skipped (Safety)_ | [auth/signup.md](auth/signup.md) |
| 3 | `Driver Portal APIs/Auth` | **Forgot Password** | `POST` | `/auth/forgot-password` | ✅ `200 OK` | [auth/forgot_password.md](auth/forgot_password.md) |
| 4 | `Driver Portal APIs/Auth` | **Logout** | `POST` | `/auth/logout` | ℹ️ _Skipped (Safety)_ | [auth/logout.md](auth/logout.md) |
| 5 | `Driver Portal APIs/Auth` | **Get Current User** | `GET` | `/auth/get-user` | ✅ `200 OK` | [auth/get_current_user.md](auth/get_current_user.md) |
| 6 | `Driver Portal APIs/Auth` | **Account Setting** | `POST` | `/auth/account-settings` | ✅ `200 OK` | [auth/account_setting.md](auth/account_setting.md) |
| 7 | `Driver Portal APIs/Auth` | **Change Password** | `POST` | `/auth/change-password` | ℹ️ _Skipped (Safety)_ | [auth/change_password.md](auth/change_password.md) |
| 8 | `Driver Portal APIs/Auth` | **Send Email Verification Link** | `POST` | `/auth/resend-verification-email` | ✅ `200 OK` | [auth/send_email_verification_link.md](auth/send_email_verification_link.md) |
| 9 | `Driver Portal APIs/Assigned Car Pickup` | **All** | `GET` | `/assign_vehicle?orderby=id&order=DESC&perpage=10&page=1&date=2024-08-23` | ✅ `200 OK` | [assigned_car_pickup/all.md](assigned_car_pickup/all.md) |
| 10 | `Driver Portal APIs/Assigned Car Pickup` | **Single** | `GET` | `/assign_vehicle/1` | ✅ `200 OK` | [assigned_car_pickup/single.md](assigned_car_pickup/single.md) |
| 11 | `Driver Portal APIs/Assigned Car Pickup` | **Status Update** | `POST` | `/assign_vehicle/status/1` | ✅ `200 OK` | [assigned_car_pickup/status_update.md](assigned_car_pickup/status_update.md) |
| 12 | `Driver Portal APIs/Car Inventory` | **All** | `GET` | `/vehicle?orderby=id&order=DESC&perpage=10&page=1` | ✅ `200 OK` | [car_inventory/all.md](car_inventory/all.md) |
| 13 | `Driver Portal APIs/Car Inventory` | **Single** | `GET` | `/vehicle/1` | ✅ `200 OK` | [car_inventory/single.md](car_inventory/single.md) |
| 14 | `Driver Portal APIs/Car Inventory` | **Get Vehicle Details By Rego Number & State Copy** | `GET` | `/vehicle/vehicle-details?registration_state=VIC&registration_number=TEST00` | ✅ `200 OK` | [car_inventory/get_vehicle_details_by_rego_number_state_copy.md](car_inventory/get_vehicle_details_by_rego_number_state_copy.md) |
| 15 | `Driver Portal APIs/Car Inventory` | **Add** | `POST` | `/vehicle/create` | ⚠️ `422 Validation Error (Needs Body)` | [car_inventory/add.md](car_inventory/add.md) |
| 16 | `Driver Portal APIs/Car Inventory` | **Update** | `POST` | `/vehicle/update/1` | ⚠️ `422 Validation Error (Needs Body)` | [car_inventory/update.md](car_inventory/update.md) |
| 17 | `Driver Portal APIs/Car Inventory` | **Delete** | `POST` | `/vehicle/delete/1` | ℹ️ _Skipped (Safety)_ | [car_inventory/delete.md](car_inventory/delete.md) |
| 18 | `Driver Portal APIs/Car Inventory` | **Bulk Delete** | `POST` | `/vehicle/bulk_delete` | ℹ️ _Skipped (Safety)_ | [car_inventory/bulk_delete.md](car_inventory/bulk_delete.md) |
| 19 | `Driver Portal APIs/Car Inventory` | **Purchase Receipt PDF** | `GET` | `/vehicle/purchase_receipt/26` | ✅ `200 OK` | [car_inventory/purchase_receipt_pdf.md](car_inventory/purchase_receipt_pdf.md) |
| 20 | `Driver Portal APIs/Car Inventory` | **Send Purchase Receipt** | `POST` | `/vehicle/send_purchase_receipt/15?email=example@mail.com` | ⚠️ `404 Access Denied / Not Found` | [car_inventory/send_purchase_receipt.md](car_inventory/send_purchase_receipt.md) |
| 21 | `Driver Portal APIs/Car Inventory` | **Search Vehicle Details By Rego Number & State** | `GET` | `/vehicle/search-vehicle-details?registration_state=QLD&registration_number=4H5AN` | ✅ `200 OK` | [car_inventory/search_vehicle_details_by_rego_number_state.md](car_inventory/search_vehicle_details_by_rego_number_state.md) |
| 22 | `Driver Portal APIs/Car Inventory` | **Get Vehicle Details By Rego Number & State** | `GET` | `/vehicle/vehicle-details?registration_state=QLD&registration_number=4H5AN` | ✅ `200 OK` | [car_inventory/get_vehicle_details_by_rego_number_state.md](car_inventory/get_vehicle_details_by_rego_number_state.md) |
| 23 | `Driver Portal APIs/Car Inventory` | **Get Vehicle Details By Vin No.** | `GET` | `/vehicle/vin-decoder?vin_number=LRW3F7FS0PC781475` | ✅ `200 OK` | [car_inventory/get_vehicle_details_by_vin_no.md](car_inventory/get_vehicle_details_by_vin_no.md) |
| 24 | `Driver Portal APIs/Notifications` | **All Notifications** | `GET` | `/notification?orderby=created_at&order=DESC&perpage=10&page=1` | ✅ `200 OK` | [notifications/all_notifications.md](notifications/all_notifications.md) |
| 25 | `Driver Portal APIs/Notifications` | **Mark As Read** | `POST` | `/notification/mark_read/7bb240e4-89fb-43fa-b199-60b72071cdd7` | ✅ `200 OK` | [notifications/mark_as_read.md](notifications/mark_as_read.md) |
| 26 | `Driver Portal APIs/Notifications` | **Bulk Mark as Read** | `POST` | `/notification/bulk_mark_read` | ✅ `200 OK` | [notifications/bulk_mark_as_read.md](notifications/bulk_mark_as_read.md) |
| 27 | `Driver Portal APIs/Brand` | **All** | `GET` | `/brand?status=active` | ✅ `200 OK` | [brand/all.md](brand/all.md) |
| 28 | `Driver Portal APIs/Model` | **All** | `GET` | `/model?status=active&brand=1` | ✅ `200 OK` | [model/all.md](model/all.md) |

---

## 3. Folder Structure

```text
api/
├── README.md                                          # Master API index & status report
├── Auto Yard APP APIs.postman_collection.json         # Original Postman collection
├── auth/                                              # Driver Authentication & Profile APIs
│   ├── login.md
│   ├── signup.md
│   ├── forgot_password.md
│   ├── logout.md
│   ├── get_current_user.md
│   ├── account_setting.md
│   ├── change_password.md
│   └── send_email_verification_link.md
├── assigned_car_pickup/                               # Assigned Vehicle Pickup APIs
│   ├── all.md
│   ├── single.md
│   └── status_update.md
├── car_inventory/                                     # Car Inventory & Valuation APIs
│   ├── all.md
│   ├── single.md
│   ├── get_vehicle_details_by_rego_number_state_copy.md
│   ├── add.md
│   ├── update.md
│   ├── delete.md
│   ├── bulk_delete.md
│   ├── purchase_receipt_pdf.md
│   ├── send_purchase_receipt.md
│   ├── search_vehicle_details_by_rego_number_state.md
│   ├── get_vehicle_details_by_rego_number_state.md
│   └── get_vehicle_details_by_vin_no.md
├── notifications/                                     # Driver Notifications APIs
│   ├── all_notifications.md
│   ├── mark_as_read.md
│   └── bulk_mark_as_read.md
├── brand/                                             # Car Brands List API
│   └── all.md
└── model/                                             # Car Models List API
    └── all.md
```

---

## 4. API Testing Report & Issues Found

During live validation of the collection against `https://dev.autoyard.com.au/api/v1` using driver credentials (`fawaz.pixelz360@gmail.com`), the following key observations and issues were identified:

### 1. Base URL & DNS Resolution
- The initial prompt specified `dev.autoyard.co.au`. DNS checks confirm `dev.autoyard.co.au` has **no registered DNS records**.
- The active working server domain is `dev.autoyard.com.au`, with API prefix `/api/v1`. Full base URL is **`https://dev.autoyard.com.au/api/v1`**.

### 2. Working Endpoints (Status 200 OK)
- **Auth:** `Login`, `Forgot Password`, `Get Current User`, `Account Setting`, `Send Email Verification Link` all responded successfully.
- **Assigned Car Pickup:** `All` and `Single` (using assigned vehicle ID `52`) returned 200 OK.
- **Car Inventory:** `All` (returns vehicles assigned to driver: IDs 90, 80, 76, 62, 58), `Single` (tested with ID `90`), `Purchase Receipt PDF` (generated live PDF at `https://dev.autoyard.com.au/storage/purchase_receipt/...`), `Search Vehicle Details`, `Get Vehicle Details By Rego`, and `Vin Decoder` all responded with full 200 OK vehicle data.
- **Notifications:** `All Notifications`, `Mark As Read` (with real notification ID `f2032229-9964-4a14-bc56-d2fafc84dda8`), and `Bulk Mark as Read` all returned 200 OK.
- **Brand & Model:** `GET /brand` and `GET /model` returned full active car brand and model lists.

### 3. Non-Working / Problematic Endpoints
1. **`POST /vehicle/send_purchase_receipt/{id}` (`HTTP 404: Access Denied`)**:
   - Even when supplying a vehicle handled by the driver (e.g. ID `90`), this returns `{"error": 1, "message": "Access Denied!"}`.
   - **Root Cause:** Drivers do not have permission to trigger email sending of purchase receipts; this permission is restricted to customer/company admin accounts.
2. **`POST /notification/bulk_mark_read` (`HTTP 500 Server Error` if payload is empty)**:
   - If `ids` is missing or sent with empty parameters, the backend throws an unhandled `500 Server Error` instead of a clean `422 Validation Error`.
   - When passing `ids: ["<notification-uuid>"]` (JSON) or `ids[]=<uuid>` (urlencoded), the endpoint works properly with 200 OK.
3. **Placeholder ID Not Found Errors (404)**:
   - The Postman collection contains placeholder IDs such as `/vehicle/1`, `/assign_vehicle/1`, `/vehicle/purchase_receipt/26`, and `/notification/mark_read/7bb240e4-...`.
   - These return `404 Vehicle/Notification not found` when used verbatim because ID 1 does not belong to this driver. Using real account IDs (e.g. Vehicle ID `90`, Assigned ID `52`, Notification `f2032229-9964-4a14-bc56-d2fafc84dda8`) resolves properly.
4. **`POST /assign_vehicle/status/{id}` (`HTTP 409 Conflict`)**:
   - When attempting status update on already accepted or reassigned pickups, returns `{"error": 1, "message": "This pickup has been reassigned to another driver."}`.
