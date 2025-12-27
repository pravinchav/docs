
# RetailProcessor API Documentation (Third‑Party Integration)

This folder contains integration guides for the public APIs exposed by RetailProcessor. Each document includes endpoint details, required headers, sample requests (curl), example responses, and integration notes.

Included documents
- upload-products.md — Upload product CSV/JSON file (and optional images).
- upload-product-images.md — Upload images for products (multipart).
- receive-orders.md — Pull orders from RetailProcessor (GET).
- send-orders.md — Push orders into RetailProcessor (POST).
- upload-invoices.md — Upload invoice PDF files (multipart).

Integration notes
- All requests require authentication. Include an Authorization header with a bearer token (or as specified by your agreement).
- Many endpoints expect an encrypted company key header (named `key`) — see each doc for details.
- For file uploads, use multipart/form-data with proper Content-Type boundaries.
- For downloads, the API returns Content-Type: application/pdf and Content-Disposition: attachment.

If you need a machine-readable OpenAPI (Swagger) file, request it from the API owner.



