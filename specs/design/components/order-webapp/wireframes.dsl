// Order Tracking App — wireframes for Customer, Staff, and Delivery Courier

screen CustomerOrders "Customer views the list and status of their own orders"
  navbar "OrderTrack | My Orders -> CustomerOrders"
  row
    heading "My Orders"
    right
    search "Search by order number"
  table "Order | Placed | Status | " -> CustomerOrderDetail
    row "#10245 | Aug 2 | Shipped | View ->"
    row "#10198 | Jul 28 | Delivered | View ->"
    row "#10091 | Jul 20 | Cancelled | View ->"

screen CustomerOrderDetail "Customer sees the full status history of one order"
  navbar "OrderTrack | My Orders -> CustomerOrders"
  breadcrumb "My Orders / #10245"
  row
    heading "Order #10245"
    badge "Shipped" info
  text "Placed Aug 2 · Notifications sent to jane@example.com"
  heading "Status history"
  list "Placed — Aug 2, 9:03am | Processing — Aug 2, 2:11pm | Shipped — Aug 3, 8:40am"

screen StaffDashboard "Staff sees every order and its current status"
  navbar "OrderTrack Ops"
  sidebar "Dashboard -> StaffDashboard | Couriers -> CourierRoster | Settings"
  row
    heading "Order Dashboard"
    right
    button "New order" primary -> NewOrder
  row
    card "Open orders | 38 | in progress"
    card "Overdue | 4 | past expected delivery"
    card "Delivered today | 12 | completed"
  tabs "All (146) | Placed (12) | Processing (9) | Shipped (17) | Out for Delivery (6) | Delivered (98) | Cancelled (4)"
  table "Order | Customer | Status | Courier | " -> StaffOrderDetail
    row "#10245 | J. Alvarez | Shipped | M. Diaz | Manage ->"
    row "#10246 | K. Smith | Placed | Unassigned | Manage ->"
    row "#10240 | A. Chen | Out for Delivery | R. Cole | Manage ->"

screen NewOrder "Staff manually creates a new order"
  navbar "OrderTrack Ops"
  sidebar "Dashboard -> StaffDashboard | Couriers -> CourierRoster | Settings"
  breadcrumb "Orders / New order"
  heading "New Order"
  input "Customer email — e.g. jane@example.com"
  input "Customer name (optional)"
  textarea "Items — one per line, e.g. 2x Ceramic Mug"
  row
    right
    button "Cancel"
    button "Create order" primary -> StaffDashboard

screen StaffOrderDetail "Staff updates an order's status, assigns a courier, or cancels it"
  navbar "OrderTrack Ops"
  sidebar "Dashboard -> StaffDashboard | Couriers -> CourierRoster | Settings"
  breadcrumb "Orders / #10245"
  row
    heading "Order #10245"
    badge "Shipped" info
  text "Customer: J. Alvarez (jane@example.com) — Placed Aug 2"
  split 60/40
    left
      heading "Status history"
      list "Placed — Aug 2, 9:03am | Processing — Aug 2, 2:11pm | Shipped — Aug 3, 8:40am"
      row
        select "Set status: Out for Delivery"
        button "Update status" primary
      row
        right
        button "Cancel order" danger
    right
      card "Courier assignment"
        select "Assigned courier: M. Diaz"
        button "Reassign" primary

screen CourierRoster "Staff views the list of delivery couriers"
  navbar "OrderTrack Ops"
  sidebar "Dashboard -> StaffDashboard | Couriers -> CourierRoster | Settings"
  heading "Couriers"
  table "Name | Email | Active deliveries"
    row "M. Diaz | m.diaz@example.com | 6"
    row "R. Cole | r.cole@example.com | 4"

screen CourierDeliveries "Courier sees the orders assigned to them and updates delivery status"
  navbar "OrderTrack | My Deliveries -> CourierDeliveries"
  row
    heading "My Deliveries"
    right
    tabs "Assigned (6) | Delivered today (3)"
  table "Order | Customer | Status | " -> CourierDeliveryDetail
    row "#10240 | A. Chen | Out for Delivery | Update ->"
    row "#10241 | K. Smith | Shipped | Update ->"

screen CourierDeliveryDetail "Courier updates one delivery's status"
  navbar "OrderTrack | My Deliveries -> CourierDeliveries"
  breadcrumb "My Deliveries / #10240"
  row
    heading "Order #10240"
    badge "Out for Delivery" info
  text "Deliver to: A. Chen — 44 Birch Street"
  row
    right
    button "Mark Delivered" primary -> CourierDeliveries
