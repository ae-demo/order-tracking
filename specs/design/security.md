# Security design

## Roles → permissions

## Authentication (Thunder)

- Shared `thunder-app` dependency name: **`user-auth`**, declared identically
on `order-webapp` and `order-api` — this shared name is what ties SSO
sign-in to the tokens `order-api` validates on incoming calls.
- Scopes: default `openid profile email`.
- `order-webapp` performs OIDC + PKCE in the browser and attaches the
resulting token to every call to `order-api`.
- `order-api` validates the token on every request from a signed-in user
(Customer, Staff, Delivery Courier) and rejects an invalid or missing
token with `401`.
- The inbound order-creation endpoint the external storefront website calls
(`POST /orders`) is authenticated separately with a static API key, since
the storefront is a system-to-system caller with no Thunder-signed-in
user — see `openapi.yaml` for its security scheme.

## Role resolution

- `order-api` resolves the caller's role from the `role` claim Thunder
includes in the validated token (Customer, Staff, or Delivery Courier).
- A Customer's requests are additionally scoped to their own `customerId`
(from the token's subject) — they can never list or view another
customer's orders.
- A Delivery Courier's requests are scoped to orders where
`courierId` matches their own identity.
- A token with no recognized role, or a missing/invalid token, is denied
(`401`/`403`) by default — no implicit access.

