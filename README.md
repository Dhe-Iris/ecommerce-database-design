# E-Commerce Database Project

## Overview

This project implements a comprehensive relational database for an e-commerce platform,submitted as part of the PLP challenge. The database is designed to handle product management, inventory tracking, order processing, and customer management with support for product variations, custom attributes, and categorization.This solution demonstrates database design principles and SQL implementation skills while creating a practical foundation for a real-world e-commerce application.

## Database Structure

The database follows a normalized structure with proper relationships between entities. It supports key e-commerce functionalities including:

- Product management with variations (size, color)
- Brand and category organization
- Inventory tracking at the product item level
- Customer profiles and address management
- Order processing and history
- Custom product attributes

## Entity Relationship Diagram

The database structure is based on the following ERD:

[Link to ERD Diagram](https://github.com/Dhe-Iris/ecommerce-database-design/blob/main/erd_diagram.png)

![E-commerce ERD](https://github.com/Dhe-Iris/ecommerce-database-design/blob/main/erd_diagram.png)

## Tables

The database consists of the following tables:

1. **customer** - Stores customer account information
2. **address** - Manages customer shipping and billing addresses
3. **order** - Contains order header information
4. **order_item** - Tracks individual items within orders
5. **product** - Stores general product information
6. **product_item** - Represents specific purchasable variations of products
7. **product_variation** - Links products to specific size and color combinations
8. **product_category** - Organizes products into categories
9. **brand** - Stores brand information
10. **color** - Manages available color options
11. **size_category** - Groups sizes into categories (clothing, shoes, etc.)
12. **size_option** - Lists specific sizes within categories
13. **product_image** - Stores product image URLs
14. **product_attribute** - Defines custom product attributes
15. **product_attribute_category** - Groups attributes into categories
16. **product_attribute_type** - Defines types of attributes
17. **product_attribute_value** - Stores attribute values for specific products

## Installation

To set up the database:

1. Clone this repository:

   ```
   git clone https://github.com/your-username/your-repo-name.git
   ```

2. Import the SQL script into your database management system:

   ```
   mysql -u username -p database_name < ecommerce.sql
   ```

   Or for PostgreSQL:

   ```
   psql -U username -d database_name -f ecommerce.sql
   ```

## Project Structure

```
ecommerce-database/
└── ERD diagram/
    ├──erd_diagram.png       # Visual representation of the database schema
└── SQL Scripts/
    ├── ecommerce.sql        # Complete SQL script to create the database and tables
├── README.md                # This file
```

## License

This project is licensed under the MIT License
