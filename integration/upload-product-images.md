---
layout: default
title: My Page Title
---

# Upload Product Images

Version: 1.0 | Last updated: 2025-11-01

Purpose
Upload one or more product images when images are provided separately from the product file.

Endpoint
- POST /api/external/uploadProductImages  
- Content-Type: multipart/form-data

Authentication & headers

| Header | Required | Description |
|---|:---:|---|
| Authorization | Yes | `Bearer <JWT>` |
| key | Yes | Encrypted company key |
| Accept | Recommended | `application/json` |

Form fields

| Field | Required | Type | Description |
|---|:---:|---|---|
| images | Yes | file[] | Image files (JPEG/PNG) |
| mapping | No | string | JSON array mapping `file` → `sku`, e.g. `[{"file":"img.jpg","sku":"SKU123"}]` |

Sample curl
```bash
curl -v -X POST "https://api.example.com/api/external/uploadProductImages" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "key: ENCRYPTED_COMPANY_KEY" \
  -F "images=@/path/to/image1.jpg" \
  -F "images=@/path/to/image2.png" \
  -F 'mapping=[{"file":"image1.jpg","sku":"SKU123"}]'
```

Success response (200)
```json
{
  "status": "success",
  "uploaded": 2,
  "message": "Images stored and mapped to products"
}
```

Errors & tips

| HTTP | Reason / Recommendation |
|---:|---|
| 400 | No images or invalid mapping — ensure JSON mapping matches filenames |
| 413 | Payload too large — split or chunk uploads |
| 500 | Storage error — retry with backoff |

Integration tips
- Prefer unique filenames (SKU prefix or UUID) to prevent collisions.
- Always verify server filename normalization before relying on exact names.
