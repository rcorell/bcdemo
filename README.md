# BigCommerce Demo

## Spec

### Admin GUI 
Lets admin users CRUD products and rate plans
1)  As an admin I need to be able to add products to the catalog.
2)  As an admin I need to be able to edit products in the catalog.
3)  As an admin I need to mark products as discontinued
4)  As an admin I need to be able to see a list of all the products in the catalog.
4)  As an admin I need to be able to see the detail of a single product
6)  As an admin I need to be able to add rate plans to products.
7)  As an admin I need to be able to edit rate plans for a product.
8)  As an admin I need to be able to retire rate plans for a product
9)  As an admin I need be able to filter out any expired or retired products or rate plans

### Customer API 
A JSON API that lets people pull back product lists and details
1)  As a customer I should be able get all the products in the catalog (except discontinued).
2)  As a customer I should be able to hit an API end point and pull back the details of just one product (except retired)

### Product
Products have multiple rate plans.
  * Title
  * Description
  * StartDate (when it's first available)
  * EndDate  (when it's no longer available)

### Rate plan
A rate plan belongs only to one product. 
  * Title 
  * Description
  * StartDate (when it's first available)
  * EndDate (when it's first available)
  * Recurrence  (One-time, Monthly, Quarterly, Annually)
  * Price (in USD)
 
## Project dependencies
* **Ruby**: 2.4.1
* **Rails**: 5.1.1
* **Gems**
    * haml
    * money-rails
    * normalize-rails
* **MySQL**: 5.6.21
