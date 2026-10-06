import os
import json
import urllib.request
import urllib.parse
import ssl
import re

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

BASE_DOMAIN = "dev.autoyard.com.au"
BASE_URL = f"https://{BASE_DOMAIN}/api/v1"
EMAIL = "fawaz.pixelz360@gmail.com"
PASS = "md886@pixelzPower"

# Authenticate
login_url = f"{BASE_URL}/auth/authenticate"
login_payload = json.dumps({"email": EMAIL, "password": PASS}).encode("utf-8")
login_req = urllib.request.Request(login_url, data=login_payload, headers={"Content-Type": "application/json", "Accept": "application/json"})
with urllib.request.urlopen(login_req, context=ctx) as resp:
    login_resp = json.loads(resp.read().decode("utf-8"))
    token = login_resp["data"]["authorisation"]["token"]
    user_info = login_resp["data"]["user"]

print("Authenticated as driver:", user_info.get("fullname"), "(ID:", user_info.get("id"), ")")

with open("Auto Yard APP APIs.postman_collection.json") as f:
    collection = json.load(f)

def extract_items(items, parent_folder=""):
    res = []
    for item in items:
        if "item" in item:
            name = item["name"]
            curr = f"{parent_folder}/{name}" if parent_folder else name
            res.extend(extract_items(item["item"], curr))
        else:
            res.append({
                "folder": parent_folder,
                "item": item
            })
    return res

all_items = extract_items(collection["item"])

folder_map = {
    "Driver Portal APIs/Auth": "auth",
    "Driver Portal APIs/Assigned Car Pickup": "assigned_car_pickup",
    "Driver Portal APIs/Car Inventory": "car_inventory",
    "Driver Portal APIs/Notifications": "notifications",
    "Driver Portal APIs/Brand": "brand",
    "Driver Portal APIs/Model": "model"
}

# Known working live IDs found in this account
LIVE_VEHICLE_ID = 90
LIVE_ASSIGNED_VEHICLE_ID = 52
LIVE_NOTIFICATION_ID = "f2032229-9964-4a14-bc56-d2fafc84dda8"

def slugify(text):
    text = text.lower()
    text = re.sub(r'[^a-z0-9]+', '_', text)
    return text.strip('_')

def execute_request(method, url, headers_dict, body_bytes=None):
    try:
        req = urllib.request.Request(url, data=body_bytes, headers=headers_dict, method=method)
        with urllib.request.urlopen(req, context=ctx, timeout=10) as response:
            res_code = response.status
            res_headers = dict(response.headers)
            res_body = response.read().decode("utf-8", errors="replace")
            return res_code, res_headers, res_body, None
    except urllib.error.HTTPError as e:
        err_headers = dict(e.headers)
        err_body = e.read().decode("utf-8", errors="replace")
        return e.code, err_headers, err_body, None
    except Exception as e:
        return 0, {}, "", str(e)

docs_summary = []

for idx, entry in enumerate(all_items, 1):
    folder_name = entry["folder"]
    item = entry["item"]
    name = item.get("name")
    req = item.get("request", {})
    method = req.get("method", "GET")
    url_obj = req.get("url", {})
    
    if isinstance(url_obj, dict):
        raw_url = url_obj.get("raw", "")
        query_params = url_obj.get("query", [])
        path_segments = url_obj.get("path", [])
    else:
        raw_url = str(url_obj)
        query_params = []
        path_segments = []
    
    clean_path = raw_url.replace("{{URL}}", "")
    full_url = f"{BASE_URL}{clean_path}"
    
    dir_name = folder_map.get(folder_name, "misc")
    file_slug = f"{slugify(name)}.md"
    file_path = os.path.join(dir_name, file_slug)
    
    # Process headers
    req_headers = []
    headers_dict = {
        "Accept": "application/json",
        "User-Agent": "AutoYard-App/1.0"
    }
    for h in req.get("header", []):
        k = h.get("key")
        v = h.get("value", "")
        req_headers.append({
            "key": k,
            "value": v,
            "description": h.get("description", "")
        })
        if "Bearer" in v:
            headers_dict[k] = f"Bearer {token}"
        else:
            headers_dict[k] = v

    # Process body
    body_obj = req.get("body", {})
    body_mode = body_obj.get("mode")
    body_fields = []
    sample_body_json = {}
    body_bytes = None
    
    if body_mode == "formdata":
        for field in body_obj.get("formdata", []):
            fk = field.get("key")
            fv = field.get("value", "")
            ft = field.get("type", "text")
            fd = field.get("description", "")
            body_fields.append({
                "key": fk,
                "value": fv,
                "type": ft,
                "description": fd
            })
            sample_body_json[fk] = fv
    elif body_mode == "raw":
        raw_str = body_obj.get("raw", "")
        try:
            sample_body_json = json.loads(raw_str)
        except:
            sample_body_json = raw_str

    # Determine test URL and body for live check
    test_url = full_url
    test_body_bytes = None
    test_headers = dict(headers_dict)
    
    # Custom adjustments for live verification
    is_destructive = False
    skip_reason = None
    
    if name == "Login":
        test_headers["Content-Type"] = "application/json"
        test_body_bytes = json.dumps({"email": EMAIL, "password": PASS}).encode("utf-8")
    elif name == "Signup":
        skip_reason = "Avoid creating duplicate mock driver accounts on test environment."
    elif name == "Forgot Password":
        test_headers["Content-Type"] = "application/json"
        test_body_bytes = json.dumps({"email": EMAIL}).encode("utf-8")
    elif name == "Logout":
        skip_reason = "Logout invalidates the active session Bearer token."
    elif name == "Change Password":
        skip_reason = "Avoid altering the provided driver credentials."
    elif name == "Account Setting":
        test_headers["Content-Type"] = "application/json"
        test_body_bytes = json.dumps({
            "first_name": "Fawaz",
            "last_name": "Hussain",
            "phone_number": "03002643066",
            "send_details_to": "email"
        }).encode("utf-8")
    elif name == "Single" and "Assigned Car Pickup" in folder_name:
        test_url = f"{BASE_URL}/assign_vehicle/{LIVE_ASSIGNED_VEHICLE_ID}"
    elif name == "Status Update" and "Assigned Car Pickup" in folder_name:
        test_url = f"{BASE_URL}/assign_vehicle/status/{LIVE_ASSIGNED_VEHICLE_ID}"
        test_headers["Content-Type"] = "application/json"
        test_body_bytes = json.dumps({"status": "accepted"}).encode("utf-8")
    elif name == "Single" and "Car Inventory" in folder_name:
        test_url = f"{BASE_URL}/vehicle/{LIVE_VEHICLE_ID}"
    elif name == "Purchase Receipt PDF" and "Car Inventory" in folder_name:
        test_url = f"{BASE_URL}/vehicle/purchase_receipt/{LIVE_VEHICLE_ID}"
    elif name == "Send Purchase Receipt" and "Car Inventory" in folder_name:
        test_url = f"{BASE_URL}/vehicle/send_purchase_receipt/{LIVE_VEHICLE_ID}?email={EMAIL}"
    elif name == "Delete" and "Car Inventory" in folder_name:
        skip_reason = "Destructive endpoint (deletes vehicles permanently)."
    elif name == "Bulk Delete" and "Car Inventory" in folder_name:
        skip_reason = "Destructive endpoint (bulk deletes vehicles)."
    elif name == "Mark As Read" and "Notifications" in folder_name:
        test_url = f"{BASE_URL}/notification/mark_read/{LIVE_NOTIFICATION_ID}"
    elif name == "Bulk Mark as Read" and "Notifications" in folder_name:
        test_headers["Content-Type"] = "application/json"
        test_body_bytes = json.dumps({"ids": [LIVE_NOTIFICATION_ID]}).encode("utf-8")
    elif body_mode == "formdata" and sample_body_json and method in ["POST", "PUT"]:
        # Urlencode
        test_headers["Content-Type"] = "application/x-www-form-urlencoded"
        test_body_bytes = urllib.parse.urlencode(sample_body_json).encode("utf-8")

    if skip_reason:
        status_code = "SKIPPED"
        resp_headers = {}
        resp_body = f'{{"info": "{skip_reason}"}}'
        err_msg = skip_reason
    else:
        status_code, resp_headers, resp_body, err_msg = execute_request(method, test_url, test_headers, test_body_bytes)

    # Format JSON response if possible
    try:
        parsed_resp = json.loads(resp_body)
        formatted_resp_body = json.dumps(parsed_resp, indent=2)
    except:
        formatted_resp_body = resp_body

    # Build Markdown Content
    md = []
    md.append(f"# {name} API")
    md.append("")
    md.append(f"**Category:** `{folder_name}`  ")
    md.append(f"**HTTP Method:** `{method}`  ")
    md.append(f"**Endpoint:** `{clean_path}`  ")
    md.append(f"**Full URL:** `{full_url}`  ")
    md.append(f"**Base URL:** `https://{BASE_DOMAIN}/api/v1`  ")
    md.append("")
    
    # Status badge / note
    if status_code == 200:
        md.append("> **Status:** `200 OK` (Verified & Working)")
    elif status_code == "SKIPPED":
        md.append(f"> **Status:** `Not Executed Live` ({skip_reason})")
    elif status_code in [404, 409, 422, 500]:
        md.append(f"> **Status:** `HTTP {status_code}` (See Response Details below)")
    else:
        md.append(f"> **Status:** `Response Code: {status_code}`")
    md.append("")
    
    # Description
    desc = item.get("description", "")
    if desc:
        md.append("## Description")
        md.append(desc)
        md.append("")
    
    # Request Headers
    md.append("## Request Headers")
    md.append("| Header | Value | Description |")
    md.append("| :--- | :--- | :--- |")
    md.append("| `Accept` | `application/json` | Required for JSON response |")
    if "header" in req and req["header"]:
        for h in req["header"]:
            val_display = h.get("value", "")
            if "Driver_Auth_Token" in val_display:
                val_display = "`Bearer <Driver_Auth_Token>`"
            else:
                val_display = f"`{val_display}`"
            md.append(f"| `{h.get('key')}` | {val_display} | {h.get('description', '-')} |")
    if body_mode == "formdata":
        md.append("| `Content-Type` | `multipart/form-data` or `application/x-www-form-urlencoded` | Required for POST form body |")
    elif body_mode == "raw":
        md.append("| `Content-Type` | `application/json` | Required for JSON request body |")
    md.append("")
    
    # Query Parameters
    if query_params:
        md.append("## Query Parameters")
        md.append("| Parameter | Type | Disabled/Default | Description |")
        md.append("| :--- | :--- | :--- | :--- |")
        for q in query_params:
            dis = "Yes (Disabled by default)" if q.get("disabled") else "Active"
            desc_val = q.get("description", "").replace("\n", " ") or "-"
            md.append(f"| `{q.get('key')}` | `string` | {dis} (value: `{q.get('value')}`) | {desc_val} |")
        md.append("")

    # Request Body
    if body_fields or (body_mode == "raw" and sample_body_json):
        md.append("## Request Body")
        md.append(f"**Body Type:** `{body_mode}`")
        md.append("")
        if body_fields:
            md.append("| Field | Type | Description | Sample Value |")
            md.append("| :--- | :--- | :--- | :--- |")
            for bf in body_fields:
                desc_text = bf['description'].replace("\n", " ").replace("\t", " ") if bf['description'] else "-"
                md.append(f"| `{bf['key']}` | `{bf['type']}` | {desc_text} | `{bf['value']}` |")
            md.append("")
            md.append("**Example Payload (JSON Representation):**")
            md.append("```json")
            md.append(json.dumps(sample_body_json, indent=2))
            md.append("```")
            md.append("")
        elif body_mode == "raw":
            md.append("```json")
            if isinstance(sample_body_json, str):
                md.append(sample_body_json)
            else:
                md.append(json.dumps(sample_body_json, indent=2))
            md.append("```")
            md.append("")

    # Live Response
    md.append("## Live Response")
    md.append(f"**HTTP Status Code:** `{status_code}`")
    md.append("")
    if resp_headers:
        md.append("### Response Headers")
        md.append("```http")
        for hk, hv in list(resp_headers.items())[:8]:
            md.append(f"{hk}: {hv}")
        md.append("```")
        md.append("")
    
    md.append("### Response Body")
    md.append("```json")
    md.append(formatted_resp_body)
    md.append("```")
    md.append("")

    # cURL Example
    md.append("## cURL Example")
    curl_cmd = [f"curl -X {method} '{full_url}'"]
    curl_cmd.append("  -H 'Accept: application/json'")
    if "header" in req:
        for h in req["header"]:
            val_h = h.get("value", "")
            if "Driver_Auth_Token" in val_h:
                curl_cmd.append(f"  -H 'Authorization: Bearer <DRIVER_AUTH_TOKEN>'")
            else:
                curl_cmd.append(f"  -H '{h.get('key')}: {val_h}'")
    if body_mode == "raw" and sample_body_json:
        curl_cmd.append("  -H 'Content-Type: application/json'")
        curl_cmd.append(f"  -d '{json.dumps(sample_body_json)}'")
    elif body_fields:
        curl_cmd.append("  -H 'Content-Type: application/x-www-form-urlencoded'")
        encoded_data = urllib.parse.urlencode(sample_body_json)
        curl_cmd.append(f"  -d '{encoded_data}'")
    md.append("```bash")
    md.append(" \\\n".join(curl_cmd))
    md.append("```")
    md.append("")

    # Notes & Analysis
    md.append("## Notes & Observations")
    if status_code == 200:
        if parsed_resp.get("error") == 0:
            md.append("- This endpoint returned a successful response (`error: 0`) when queried with valid parameters.")
        else:
            md.append(f"- HTTP 200 returned, but application-level response contained: `{parsed_resp.get('message')}`")
    elif status_code == 404:
        md.append(f"- **404 Not Found / Access Denied**: {formatted_resp_body}")
    elif status_code == 409:
        md.append(f"- **409 Conflict**: {formatted_resp_body}")
    elif status_code == 422:
        md.append(f"- **422 Validation Error**: Missing required parameters in payload. Ensure all mandatory fields are provided.")
    elif status_code == 500:
        md.append(f"- **500 Server Error**: The server encountered an internal error. Ensure input is formatted properly (e.g. JSON vs urlencoded array).")
    elif status_code == "SKIPPED":
        md.append(f"- Live execution skipped: {skip_reason}")
    md.append("")

    # Write file
    with open(file_path, "w") as f_out:
        f_out.write("\n".join(md))
    
    docs_summary.append({
        "index": idx,
        "folder": folder_name,
        "name": name,
        "method": method,
        "endpoint": clean_path,
        "file_path": file_path,
        "status_code": status_code,
        "note": err_msg or (parsed_resp.get("message") if isinstance(parsed_resp, dict) and "message" in parsed_resp else "OK")
    })
    print(f"Generated [{file_path}] -> Status {status_code}")

with open("docs_summary.json", "w") as f:
    json.dump(docs_summary, f, indent=2)

print(f"All {len(docs_summary)} endpoint markdown files generated successfully.")
