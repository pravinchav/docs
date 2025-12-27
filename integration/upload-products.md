---
layout: default
title: My Page Title
---

# Upload Products

Version: 1.0 | Last updated: 2025-11-01

Purpose
Accept a product data file (CSV or JSON). Optionally include related images in the same multipart request.

Endpoint
- POST /api/external/uploadProducts  
- Content-Type: multipart/form-data

Authentication & headers
| Header | Required | Description |
|---|:---:|---|
| Authorization | Yes | `Bearer <JWT>` |
| key | Yes | Encrypted company key (tenant context) |
| Accept | Recommended | `application/json` |

Form fields
| Field | Required | Type | Description |
|---|:---:|---|---|
| file | Yes | file | Product data (CSV or JSON) |
| images | No | file[] | Optional images (multiple) |
| metadata | No | string | JSON string, e.g. `{"overwrite":true}` |

Sample curl — CSV only
```bash
curl -v -X POST "https://api.example.com/api/external/uploadProducts" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "key: ENCRYPTED_COMPANY_KEY" \
  -F "file=@/path/to/products.csv;type=text/csv"
```

Sample curl — CSV + images
```bash
curl -v -X POST "https://api.example.com/api/external/uploadProducts" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "key: ENCRYPTED_COMPANY_KEY" \
  -F "file=@/path/to/products.csv;type=text/csv" \
  -F "images=@/path/to/image1.jpg" \
  -F "images=@/path/to/image2.png" \
  -F 'metadata={"overwrite":true}'
```

Success response (200)
```json
{
  "status": "success",
  "message": "Product file received and queued for processing",
  "jobId": "abc123"
}
```

Errors
| HTTP | Reason |
|---:|---|
| 400 | Missing file or invalid format |
| 401 | Unauthorized (invalid token) |
| 403 | Invalid/missing `key` |
| 500 | Processing/storage failure |

Integration notes
- Use streaming for large files and set adequate timeouts.
- When images are submitted with the file, associate by exact filename.
- Processing may be asynchronous — use `jobId` for tracking if provided.
