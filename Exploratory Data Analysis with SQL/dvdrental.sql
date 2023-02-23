
/* For this project, we'll use the dvdrental PostgreSQL sample database.
 * This database contains 15 tables:
 * 
 * actor — contains actors data including first name and last name.
 * film — contains films data such as title, release year, length, rating, etc.
 * film_actor — contains the relationships between films and actors.
 * category — contains film’s categories data.
 * film_category — containing the relationships between films and categories.
 * store — contains the store data including manager staff and address.
 * inventory — stores inventory data.
 * rental — stores rental data.
 * payment — stores customer’s payments.
 * staff — stores staff data.
 * customer — stores customer’s data.
 * address — stores address data for staff and customers
 * city — stores the city names.
 * country — stores the country names.
 * 
 * 
 * For this project, suppose that the management wants to see:
 * 1. What are the top rented films and their sales?
 * 2. How much is the revenue per genre? Which genre sells the best?
 * 3. How many rented films are returned early, on time, and late?
 * 4. What does store performance look like?
 * 5. In which countries are the customers mostly located in?
 * 6. Who are the top customers in each store?
 */

--Let's look at the revenue and rent count of films
select f.title
	, c.name as genre
	, count(r.rental_date) as rent_count
	, sum(p.amount) as total_revenue
from rental r
join inventory i using(inventory_id)
join film f using(film_id)
join film_category fc using(film_id)
join category c using(category_id)
join payment p using(rental_id)
group by 1, 2
order by 3 desc;

--To see which genre sells best, let's look at the total revenue per genre, rent count, and unique renters
with revenue_per_genre as (
	select c.name as genre
		, count(r.rental_date) as rent_demand
		, count(distinct p.customer_id) as unique_renters
		, sum(p.amount) as total_revenue
	from rental r
	join inventory i using(inventory_id)
	join film f using(film_id)
	join film_category fc using(film_id)
	join category c using(category_id)
	join payment p using(rental_id)
	group by 1
	order by 3 desc
	)
select genre
	, rent_demand
	, unique_renters
	, round(rent_demand/unique_renters::numeric, 2) as ave_rent_recurrence
	, total_revenue
from revenue_per_genre
order by 5 desc;


--Now let's see when do customers return the rentals
with sub1 as (
	select date_part('day', return_date - rental_date) as date_diff
		, f.rental_duration 
	from rental r
	join inventory i using(inventory_id)
	join film f using(film_id)
	),
	sub2 as (
	select case when date_diff < rental_duration then 'Returned early'
			when date_diff = rental_duration then 'Returned on time'
			else 'Returned late'
			end as return_type
		, count(*) as type_count
	from sub1
	group by 1
	)
select return_type
	, type_count
	, round(type_count*100/(select count(*) from sub1)::numeric, 1) as percentage
from sub2
order by 2 desc;


--Looking at store performance
select c2.country
	, c.city
	, count(*) as rent_count
	, sum(amount) as total_revenue
from payment p
join staff sf using(staff_id)
join store sr on sf.staff_id = sr.manager_staff_id 
join address a on sr.address_id = a.address_id 
join city c using(city_id)
join country c2 using(country_id)
group by 1, 2
order by 4 desc;

--Customer base per country
select country
	, count(distinct customer_id) as customer_count
from customer
join address using(address_id)
join city using(city_id)
join country using(country_id)
group by 1
order by 2 desc

--Top 10 customers per store
with top_customers as (
	select store_id
		, first_name || ' ' || last_name as full_name
		, email
		, sum(amount) as total_sales
		, row_number() over (partition by store_id order by sum(amount) desc) as ranking
	from customer c
	join payment p using(customer_id)
	group by 1, 2, 3
	)
select store_id
	, full_name
	, email
	, total_sales
from top_customers
where ranking <= 10;
