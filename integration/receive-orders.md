---
layout: default
title: "Zoom Market Documentation"
---

# Receive Orders

Version: 1.0 | Last updated: 2025-11-01

Purpose
Poll RetailProcessor for new or updated orders. Designed for reliable third‑party synchronization.

Endpoint
- GET /api/external/receiveOrders  
- Accept: application/json

Authentication & headers

<!-- blank line ensured before table -->
| Header | Required | Description |
|---|:---:|---|
| Authorization | Yes | `Bearer <JWT>` |
| key | Yes | Encrypted company key |
| Accept | Recommended | `application/json` |

<!-- blank line ensured after table -->

Query parameters

<!-- blank line ensured before table -->
| Name | Required | Type | Description |
|---|:---:|---|---|
| since | No | timestamp | ISO‑8601 — return orders updated after this time |
| status | No | string | Filter by status (e.g., NEW, PROCESSING, SHIPPED) |
| limit | No | integer | Max records per page |
| offset | No | integer | Pagination offset |

<!-- blank line ensured after table -->

Sample curl — basic
```bash
curl -v -X GET "https://api.example.com/api/external/receiveOrders" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "key: ENCRYPTED_COMPANY_KEY" \
  -H "Accept: application/json"
```

Sample curl — incremental
```bash
curl -v -X GET "https://api.example.com/api/external/receiveOrders?since=2025-11-01T00:00:00Z&status=NEW&limit=50" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "key: ENCRYPTED_COMPANY_KEY" \
  -H "Accept: application/json"
```

Success response (200)
```json
{
  "status": "success",
  "count": 2,
  "orders": [
    {
      "orderNo": "ORD-1001",
      "companyCode": "COMP123",
      "version": 1,
      "customerCode": "CUST001",
      "status": "NEW",
      "orderDetails": [
        {"sku":"SKU123","qty":2,"price":10.99,"companyCode":"COMP123","orderNo":"ORD-1001","version":1}
      ],
      "payments": [{"method":"CARD","amount":21.98}],
      "createdAt": "2025-11-10T12:34:56Z",
      "updatedAt": "2025-11-10T12:40:00Z"
    }
  ]
}
```

Errors

<!-- blank line ensured before table -->
| HTTP | Reason |
|---:|---|
| 400 | Malformed parameter (e.g., timestamp) |
| 401 | Missing/invalid Authorization |
| 403 | Invalid/missing `key` |
| 429 | Rate limit exceeded |
| 500 | Server error |

<!-- blank line ensured after table -->

Integration notes
- Use `since` for incremental polling and deduplicate by `orderNo + version`.
- Implement exponential backoff on 429 responses.
- Validate nested arrays and handle partial/nullable fields gracefully.

Angular tip
- Use HttpClient and typed models; for polling consider RxJS operators (interval, retryWhen).
