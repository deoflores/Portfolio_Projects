
# Exploratory Data Analysis with SQL

Structure Query Language (SQL) is a widely used programming language in managing data usually stored in relational database management systems (RDBMS).

In this project, I performed a basic exploratory data analysis (EDA) on the fictional Sakila DVD rental database.

## Tech Stack

**Database Tool:** Dbeaver

**Database:** Sakila Database

**RDBMS:** PostgreSQL




## Data

The Sakila database is already quite well-known and usually used for learning and practicing SQL skills. The following figure shows the database's schema:

![alt text](https://github.com/deoflores/Portfolio_Projects/blob/main/Exploratory%20Data%20Analysis%20with%20SQL/screenshots/dvd%20schema.png?raw=true)


In total, there are 15 tables in the database:
- actor – stores actors data including first name and last name.
- film – stores film data such as title, release year, length, rating, etc.
- film_actor – stores the relationships between films and actors.
- category – stores film’s categories data.
- film_category- stores the relationships between films and categories.
- store – contains the store data including manager staff and address.
- inventory – stores inventory data.
- rental – stores rental data.
- payment – stores customer’s payments.
- staff – stores staff data.
- customer – stores customer data.
- address – stores address data for staff and customers
- city – stores city names.
- country – stores country names.






## Objectives

For this analysis, let us suppose that the Sakila management wants to get a clearer picture on how their business's performance. And as such, they have asked the following questions:

    1. What are the top rented films and their sales?
    2. How much is the revenue per genre? Which genre sells the best?
    3. How many rented films are returned early, on time, and late?
    4. What does store performance look like?
    5. Where are the customers mostly located in?
    6. Who are the top customers in each store?

## Analysis

To answer the questions above, I queried the database using different techniques. As can be seen in the schema above, the database has segmented detailed information across multiple tables. Therefore, multiple joins are needed to create a sensible view on the data.

    1. What are the top rented films and their sales?

![alt text](https://github.com/deoflores/Portfolio_Projects/blob/main/Exploratory%20Data%20Analysis%20with%20SQL/screenshots/1.jpg?raw=true)

From the results, although Telegraph Voyage has generated the most revenue, it is not the most rented film. Let's look at the most rented films by ordering by rent_count.

![alt text](https://github.com/deoflores/Portfolio_Projects/blob/main/Exploratory%20Data%20Analysis%20with%20SQL/screenshots/1-2.jpg?raw=true)

Here we can see that the most rented films generate far less revenue than the others. It might be good to consider recommending an increasing the rental rate for these films to maximize revenue.

While this query focuses on the rent count and total revenue, we also get a picture on what genres sell to the customers. Genres like Music, Family, Foreign, Games, and Comedy seems to appeal the customers.

Let's try to confirm that by looking at rent count and revenue by genre.

    2. How much is the revenue per genre? Which genre sells the best?

![alt text](https://github.com/deoflores/Portfolio_Projects/blob/main/Exploratory%20Data%20Analysis%20with%20SQL/screenshots/2.jpg?raw=true)

Sports is the top rented genre and has also generated the most revenue. Comedy, Foreign, and Drama are also within the top 10 and confirms our observation from the previous query. Future investments might be directed towards these genres to ensure ROI.

Now, let's try to get a more business intelligence look and see customer attitude towards returning rentals.

    3. How many rented films are returned early, on time, and late?

![alt text](https://github.com/deoflores/Portfolio_Projects/blob/main/Exploratory%20Data%20Analysis%20with%20SQL/screenshots/3.jpg?raw=true)

It seems like customers generally have a positive attitude towards returning rentals since 48.2% return them early. This may be driven by customers who rent films regulary and more frequently than average. It might be fruitful to explore this data point further and look at the possibility of offering a loyalty program for these customers.

Late returns make up 41%, still a sizeable chunk. While penalty fees for late returns are commonplace for rentals, revenue may be maximized by increasing penalty fees for consecutive late returns.

    4. What does store performance look like?

![alt text](https://github.com/deoflores/Portfolio_Projects/blob/main/Exploratory%20Data%20Analysis%20with%20SQL/screenshots/4.jpg?raw=true)

Looks like business is doing well. Both stores in Australia and Canada have similar performance and rent count and revenue.

    5. Where are the customers mostly located in?

![alt text](https://github.com/deoflores/Portfolio_Projects/blob/main/Exploratory%20Data%20Analysis%20with%20SQL/screenshots/5.jpg?raw=true)

It might be weird for 2 DVD rental stores to have customers scattered all over the globe, but hey, it works for a fictional dataset. :laughing:

A good chunk of customers is located in India and China and accounts for about 20% of all customers. Maybe the company should invest in Indian and Chinese films.

    6. Who are the top customers in each store?

![alt text](https://github.com/deoflores/Portfolio_Projects/blob/main/Exploratory%20Data%20Analysis%20with%20SQL/screenshots/6.jpg?raw=true)

Say the company wants to offer rewards to the top 10 customers in each store, we can provide names and emails of these customers so other deparments may start to contact them.
## Conclusion

In this exercise, we have gained insights and potential course of actions for this fictional company.

- Top rented films generate low revenue, rental rate may be increased to maximize revenue.
- Sports, Sci-Fi, Animation, Drama, and Comedy are the top genres that sell to customers. Investments may be directed towards these genres to ensure ROI.
- Customers generally return rentals early. Loyalty program may be offered for requent renters. Late returners is still a sizeable base, consecutive late returns may be given hefty penalties.
- 20% of customers are located in India and China, recommendation to offer Indian and Chinese films
## Authors

- [@deoflores](https://www.github.com/deoflores)

