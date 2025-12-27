---
layout: default
title: My Page Title
---

# Upload Invoice PDFs

Version: 1.0 | Last updated: 2025-11-01

Purpose
Upload invoice PDF files to be stored under the configured invoice storage folder for a company.

Endpoint
- POST /api/orders/invoices  
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
| invoices | Yes | file[] | One or more PDF files |
| metadata | No | string | JSON string, e.g. `{"orderNo":"ORD-1001"}` |

Storage behavior
- Base folder: `{app.storage.invoice}` (server configuration)  
- Company folder: `{app.storage.invoice}/{companyCode}/`  
- Filenames: server may prefix with UUID to avoid collisions. Response contains `originalName`, `storedName`, and `path`.

Sample curl
```bash
curl -v -X POST "https://api.example.com/api/orders/invoices" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -H "key: ENCRYPTED_COMPANY_KEY" \
  -F "invoices=@/path/to/invoice1.pdf;type=application/pdf" \
  -F "invoices=@/path/to/invoice2.pdf" \
  -F 'metadata={"orderNo":"ORD-1001"}'
```

Success response (200)
```json
{
  "status": "success",
  "stored": [
    {"originalName":"invoice1.pdf","storedName":"f47ac10b-invoice1.pdf","path":"COMP123/f47ac10b-invoice1.pdf"}
  ],
  "message": "Invoices saved"
}
```

Errors

| HTTP | Reason |
|---:|---|
| 400 | No files or non-PDF content |
| 401 | Unauthorized |
| 500 | Storage write failure |

Integration notes
- Validate PDFs on client-side before upload.
- Use the returned `path`/`storedName` to reference files for later download.
- Consider including `orderNo` in metadata to simplify reconciliation.
