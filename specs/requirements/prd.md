# Order Tracking App — PRD

## Problem Statement

Customers who place orders through an online store or by phone have no
reliable way to see where their order is in the fulfillment process, and
support/operations staff have no single place to see every order's status,
update it as it moves, and hand it off to a delivery courier. Today, status
lives scattered across spreadsheets, phone calls, and the external
storefront's own limited order history, costing staff time on "where is my
order" questions and leaving customers guessing.

## Solution

A web application that gives customers real-time visibility into their
order's journey from placement to delivery, gives staff a single dashboard to
create, ingest, and progress orders through their lifecycle, and gives
delivery couriers a focused view of the orders they are delivering so they
can update delivery milestones as they happen.

## Actors

- **Customer**: Signs in to view the status and history of their own orders,
and receives email notifications when an order's status changes.
- **Staff**: Signs in to view and manage all orders — manually creating
orders, updating an order's status through its lifecycle, and cancelling
orders when needed.
- **Delivery Courier**: Signs in to view the orders assigned to them for
delivery and update delivery-specific status milestones (out for delivery,
delivered).

## User Stories

1. As a Customer, I want to view the current status of my order, so that I know where it is in the fulfillment process.
2. As a Customer, I want to see the full history of status changes for my order, so that I understand its journey so far.
3. As a Customer, I want to receive an email notification whenever my order's status changes, so that I don't have to keep checking the app.
4. As a Customer, I want to sign in and see only my own orders, so that my order data stays private.
5. As a Staff member, I want to manually create a new order, so that orders placed offline or by phone are tracked in the system.
6. As a Staff member, I want orders placed on the external website to be created automatically via an inbound API, so that I don't have to double-enter them.
7. As a Staff member, I want to update an order's status (Placed, Processing, Shipped, Out for Delivery, Delivered), so that customers see accurate tracking information.
8. As a Staff member, I want to cancel an order, so that cancelled orders are reflected accurately in tracking.
9. As a Staff member, I want to view a dashboard listing all orders and their current statuses, so that I can manage day-to-day operations.
10. As a Staff member, I want to assign an order to a delivery courier, so that the right courier knows which orders to deliver.
11. As a Delivery Courier, I want to view the list of orders assigned to me, so that I know what I need to deliver.
12. As a Delivery Courier, I want to update an order's status to "Out for Delivery" and "Delivered", so that customers and staff see real-time delivery progress.

## Product Decisions

- Every actor signs in via SSO through Thunder, the platform IDP.
- Web app is built as a TypeScript + React single-page application; backend
services are built in Ballerina.
- Order status changes trigger an email notification to the customer.
- The external storefront creates orders in this system via an inbound API,
in addition to staff being able to create orders manually.
- Orders move through a standard status lifecycle: Placed → Processing →
Shipped → Out for Delivery → Delivered, with Cancelled as a terminal state
reachable from any non-delivered status.

## Phasing

- **Phase 1 — Ship a working order tracking app for customers, staff, and couriers**: deliver order creation (manual and via inbound API), the full status lifecycle with courier assignment and updates, customer-facing tracking with email notifications, and a staff dashboard. Stories: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12.

## Out of Scope

- Building a customer-facing storefront or checkout — orders originate from
staff entry or the external website's own checkout, not from this app.
- Payment processing and refunds.
- Inventory or warehouse management.
- Returns processing.
- Courier route optimization or real-time GPS tracking of couriers.

## Open Questions

1. How are couriers assigned to orders — always manually by staff, or should
the system suggest/auto-assign a courier? *(deferred — does not block
design; Phase 1 assumes manual staff assignment, per story 10)*

## Further Notes

None.



# Order Tracking App — PRD

## Problem Statement

Customers who place orders through an online store or by phone have no
reliable way to see where their order is in the fulfillment process, and
support/operations staff have no single place to see every order's status,
update it as it moves, and hand it off to a delivery courier. Today, status
lives scattered across spreadsheets, phone calls, and the external
storefront's own limited order history, costing staff time on "where is my
order" questions and leaving customers guessing.

## Solution

A web application that gives customers real-time visibility into their
order's journey from placement to delivery, gives staff a single dashboard to
create, ingest, and progress orders through their lifecycle, and gives
delivery couriers a focused view of the orders they are delivering so they
can update delivery milestones as they happen.

## Actors

- **Customer**: Signs in to view the status and history of their own orders,
and receives email notifications when an order's status changes.
- **Staff**: Signs in to view and manage all orders — manually creating
orders, updating an order's status through its lifecycle, and cancelling
orders when needed.
- **Delivery Courier**: Signs in to view the orders assigned to them for
delivery and update delivery-specific status milestones (out for delivery,
delivered).

## User Stories

1. As a Customer, I want to view the current status of my order, so that I know where it is in the fulfillment process.
2. As a Customer, I want to see the full history of status changes for my order, so that I understand its journey so far.
3. As a Customer, I want to receive an email notification whenever my order's status changes, so that I don't have to keep checking the app.
4. As a Customer, I want to sign in and see only my own orders, so that my order data stays private.
5. As a Staff member, I want to manually create a new order, so that orders placed offline or by phone are tracked in the system.
6. As a Staff member, I want orders placed on the external website to be created automatically via an inbound API, so that I don't have to double-enter them.
7. As a Staff member, I want to update an order's status (Placed, Processing, Shipped, Out for Delivery, Delivered), so that customers see accurate tracking information.
8. As a Staff member, I want to cancel an order, so that cancelled orders are reflected accurately in tracking.
9. As a Staff member, I want to view a dashboard listing all orders and their current statuses, so that I can manage day-to-day operations.
10. As a Staff member, I want to assign an order to a delivery courier, so that the right courier knows which orders to deliver.
11. As a Delivery Courier, I want to view the list of orders assigned to me, so that I know what I need to deliver.
12. As a Delivery Courier, I want to update an order's status to "Out for Delivery" and "Delivered", so that customers and staff see real-time delivery progress.

## Product Decisions

- Every actor signs in via SSO through Thunder, the platform IDP.
- Web app is built as a TypeScript + React single-page application; backend
services are built in Ballerina.
- Order status changes trigger an email notification to the customer.
- The external storefront creates orders in this system via an inbound API,
in addition to staff being able to create orders manually.
- Orders move through a standard status lifecycle: Placed → Processing →
Shipped → Out for Delivery → Delivered, with Cancelled as a terminal state
reachable from any non-delivered status.

## Phasing

- **Phase 1 — Ship a working order tracking app for customers, staff, and couriers**: deliver order creation (manual and via inbound API), the full status lifecycle with courier assignment and updates, customer-facing tracking with email notifications, and a staff dashboard. Stories: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12.

## Out of Scope

- Building a customer-facing storefront or checkout — orders originate from
staff entry or the external website's own checkout, not from this app.
- Payment processing and refunds.
- Inventory or warehouse management.
- Returns processing.
- Courier route optimization or real-time GPS tracking of couriers.

## Open Questions

1. How are couriers assigned to orders — always manually by staff, or should
the system suggest/auto-assign a courier? *(deferred — does not block
design; Phase 1 assumes manual staff assignment, per story 10)*

## Further Notes

None.

