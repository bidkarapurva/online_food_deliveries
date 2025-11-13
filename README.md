# online_food_deliveries
# Online Food Delivery Database

This project is a sample SQL database for an Online Food Delivery System.  
It models customers, restaurants, delivery personnel, orders, menu items, deliveries, and reviews.

## Features

- Customer management  
- Restaurant and menu catalog  
- Placing and tracking orders  
- Itemized order details  
- Delivery assignments  
- Customer reviews for restaurants

## Database Schema

The database includes the following tables:

- **Customers:** Stores information about users
- **Restaurants:** Details of restaurants available for ordering
- **MenuItems:** Menu items sold by restaurants
- **Orders:** Records each customer’s orders
- **OrderItems:** Lists items within each order
- **DeliveryPersons:** People who deliver orders
- **Deliveries:** Assignment of orders to delivery persons
- **Reviews:** Customer reviews for restaurants

## Sample Data

The repository includes SQL scripts for:

- Table creation
- Inserting sample data for:
  - 50 customers
  - 35 restaurants
  - 105 menu items (3 per restaurant)
  - Orders, order items, deliveries, delivery personnel, reviews

## Example Queries

The project includes example SQL queries for:

- Aggregation, joins, and string matching
- Conditional logic with `CASE`
- User privilege management with `GRANT`/`REVOKE`

## Getting Started

1. Clone this repository to your local machine
2. Create the database schema by running the provided SQL script
3. Insert sample data using the insertion script
4. Practice with the example queries

## Usage

Open your SQL client (MySQL, PostgreSQL, Oracle, etc.), and run the scripts in order:

