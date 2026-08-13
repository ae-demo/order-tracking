# Order Tracking App — Design

## Overview

The system is a single Ballerina API (`order-api`) backed by a Postgres
database (`order-db`), fronted by one React single-page application
(`order-webapp`) that serves three signed-in roles — Customer, Staff, and
Delivery Courier — each with its own screens behind a shared shell. Orders
enter the system either through manual staff entry or through an inbound API
call from the external storefront website. `order-api` owns the order
lifecycle (status transitions, history, courier assignment) and sends email
notifications through an external email provider whenever an order's status
changes. All three roles authenticate through Thunder, the platform IDP.

## Context (C1)

```mermaid
graph TD
  customer((Customer))
  staff((Staff))
  courier((Delivery Courier))
  storefront[External Storefront Website]

  system[Order Tracking App]

  auth[Thunder Auth]
  email[Email Provider]

  customer --> system
  staff --> system
  courier --> system
  storefront -->|creates orders via API| system
  system --> auth
  system --> email
```

## Domain model (ER)

```mermaid
erDiagram
  ORDER {
    string id
    string customerId
    string customerEmail
    string status
    string courierId
    datetime createdAt
    datetime updatedAt
  }
  ORDER_STATUS_EVENT {
    string id
    string orderId
    string status
    string changedBy
    datetime changedAt
  }
  COURIER {
    string id
    string name
    string email
  }

  ORDER ||--o{ ORDER_STATUS_EVENT : "has history"
  COURIER ||--o{ ORDER : "delivers"
```

## Key flows

### Order creation (manual + inbound API)

```mermaid
sequenceDiagram
  participant Storefront as External Storefront Website
  participant Staff
  participant API as order-api
  participant DB as order-db
  participant Email as Email Provider

  alt Manual entry
    Staff->>API: POST /orders
  else Inbound API from storefront
    Storefront->>API: POST /orders
  end
  API->>DB: insert Order (status=Placed)
  API->>DB: insert OrderStatusEvent (Placed)
  API->>Email: send order-placed notification
  Email-->>API: accepted
  API-->>Staff: 201 Created
```

### Status update and customer notification

### Customer tracks an order

```mermaid
sequenceDiagram
  participant Customer
  participant WebApp as order-webapp
  participant API as order-api
  participant Auth as Thunder Auth

  Customer->>WebApp: sign in
  WebApp->>Auth: OIDC + PKCE
  Auth-->>WebApp: token
  Customer->>WebApp: open "My Orders"
  WebApp->>API: GET /orders?customerId=me
  API-->>WebApp: orders + status history
  WebApp-->>Customer: render tracking view
```



# Order Tracking App — Design

## Overview

The system is a single Ballerina API (`order-api`) backed by a Postgres
database (`order-db`), fronted by one React single-page application
(`order-webapp`) that serves three signed-in roles — Customer, Staff, and
Delivery Courier — each with its own screens behind a shared shell. Orders
enter the system either through manual staff entry or through an inbound API
call from the external storefront website. `order-api` owns the order
lifecycle (status transitions, history, courier assignment) and sends email
notifications through an external email provider whenever an order's status
changes. All three roles authenticate through Thunder, the platform IDP.

## Context (C1)

```mermaid
graph TD
  customer((Customer))
  staff((Staff))
  courier((Delivery Courier))
  storefront[External Storefront Website]

  system[Order Tracking App]

  auth[Thunder Auth]
  email[Email Provider]

  customer --> system
  staff --> system
  courier --> system
  storefront -->|creates orders via API| system
  system --> auth
  system --> email
```

## Domain model (ER)

```mermaid
erDiagram
  ORDER {
    string id
    string customerId
    string customerEmail
    string status
    string courierId
    datetime createdAt
    datetime updatedAt
  }
  ORDER_STATUS_EVENT {
    string id
    string orderId
    string status
    string changedBy
    datetime changedAt
  }
  COURIER {
    string id
    string name
    string email
  }

  ORDER ||--o{ ORDER_STATUS_EVENT : "has history"
  COURIER ||--o{ ORDER : "delivers"
```

## Key flows

### Order creation (manual + inbound API)

```mermaid
sequenceDiagram
  participant Storefront as External Storefront Website
  participant Staff
  participant API as order-api
  participant DB as order-db
  participant Email as Email Provider

  alt Manual entry
    Staff->>API: POST /orders
  else Inbound API from storefront
    Storefront->>API: POST /orders
  end
  API->>DB: insert Order (status=Placed)
  API->>DB: insert OrderStatusEvent (Placed)
  API->>Email: send order-placed notification
  Email-->>API: accepted
  API-->>Staff: 201 Created
```

### Status update and customer notification

### Customer tracks an order

```mermaid
sequenceDiagram
  participant Customer
  participant WebApp as order-webapp
  participant API as order-api
  participant Auth as Thunder Auth

  Customer->>WebApp: sign in
  WebApp->>Auth: OIDC + PKCE
  Auth-->>WebApp: token
  Customer->>WebApp: open "My Orders"
  WebApp->>API: GET /orders?customerId=me
  API-->>WebApp: orders + status history
  WebApp-->>Customer: render tracking view
```

