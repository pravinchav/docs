---
layout: default
title: My Page Title
---

# Send Orders

Version: 1.0 | Last updated: 2025-11-01

Purpose
Push new orders into RetailProcessor for processing and fulfillment.

Endpoint
- POST /api/external/sendOrders  
- Content-Type: application/json  
- Accept: application/json

Authentication & headers
| Header | Required | Description |
|---|:---:|---|
| Authorization | Yes | `Bearer <JWT>` |
| key | Yes | Encrypted company key |

Request body (example)
```json
{
  "orderNo": "EXT-9001",
  "companyCode": "COMP123",
  "customerCode": "CUST001",
  "version": 1,
  "orderDetails": [
    {"sku":"SKU123","qty":2,"price":10.99},
    {"sku":"SKU456","qty":1,"price":5.50}
  ],
  "payments": [
    {"method":"CARD","amount":26.58}
  ],
  "notes": "Third-party order integration"
}
```

Sample curl
```bash
curl -v -X POST "https://api.example.com/api/external/sendOrders" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "key: ENCRYPTED_COMPANY_KEY" \
  -H "Content-Type: application/json" \
  -d @order.json
```

Success response (200)
```json
{
  "status": "success",
  "orderNo": "EXT-9001",
  "message": "Order accepted",
  "savedOrderId": 98765
}
```

Errors
| HTTP | Reason |
|---:|---|
| 400 | Validation errors — missing required fields |
| 401 | Unauthorized |
| 409 | Conflict — duplicate order/version mismatch |
| 500 | Persistence error |

Integration notes
- Server may derive `companyCode` from `key` when omitted.
- Server ensures orderDetails receive `companyCode`, `orderNo` and `version` before persisting.
- On validation failure, inspect returned error details and resubmit corrected payload.
