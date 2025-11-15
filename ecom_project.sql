use ecom;
-- >> What percentage of total sessions ended in a purchase (Purchased = 1)?
select * from sessions;
with session_type as (
select
distinct sessionid,
case
when purchased = 1 then 'Purchased'
else 'Not Purchased' end as session_output,
purchased
from sessions)

select 
session_output,
-- count(*) means total number of sessions in each category
concat(round(count(*) * 100.0 / (select count(*) from session_type),1),"%") as pct_sessions
from session_type 
group by session_output;

-- >> 20.2% of the total sessions end up purchased

-- >> Which Referral Source (Google, Social Media, Email, Direct) has the highest conversion rate?

with referral_conversion as(
select
distinct sessionid,
referralsource as referral_source,
purchased
from sessions)

select referral_source, 
concat(ROUND(sum(purchased)*100/count(*),1),"%") as 'conversion %' from referral_conversion 
group by referral_source
order by sum(purchased)*100/count(*) desc;

-- >> How does device type (Mobile vs Desktop vs Tablet) affect the likelihood of purchase?

select 
u.device_type, 
CONCAT(round(sum(s.purchased)*100/count(s.sessionid),2),"%") as device_conversion_rate 
from users u 
left join sessions s 
on u.userid = s.userid
group by 1
order by device_conversion_rate desc;

-- Desktop user have higer conversion rate with 47.09% followed closely by 47.05%. The tablet users have lower conversion rate than other two with 46.36%.

-- >> Does average time spent on site (AVG(TimeOnPage_seconds)) correlate with conversion rate? Are sessions with more items in cart more likely to result in a purchase?

select
e.page_type,
round(avg(case when s.purchased = 1 then e.engagement_time end),2) as avg_time_purchased,
round(avg(case when s.purchased = 0 then e.engagement_time end),2) as avg_time_not_purchased
from events e 
join sessions s 
on e.eventid = s.eventid 
group by 1 
order by avg_time_purchased desc;

-- >> which country has highest conversion rate (%)?
select u.country, 
concat(round(sum(s.purchased)*100.0/count(s.sessionid),1),'%') as conversion_rate
from users u 
join sessions s 
on u.eventid = s.eventid
group by 1
order by conversion_rate desc;

-- >> At what time and date has the highest conversion rate?
-- Hour
select t.hour as time_hr, round(sum(s.purchased)*100.0/count(s.sessionid),1) as conversion_rate from aggregatedb_date t 
left join sessions s 
on t.eventid = s.eventid
group by 1
order by conversion_rate desc;
-- Month
select t.month as month, 
CONCAT(round(sum(s.purchased)*100.0/count(s.sessionid),2),"%") as conversion_rate from aggregatedb_date t 
left join sessions s 
on t.eventid = s.eventid
group by 1
order by conversion_rate desc;
-- Day
select t.day as day, round(sum(s.purchased)*100.0/count(s.sessionid),2) as conversion_rate from aggregatedb_date t 
left join sessions s 
on t.eventid = s.eventid
group by 1
order by conversion_rate desc;


-- > Are sessions with more items in cart more likely to result in a purchase?
with session_cart as(
select s.sessionid as ses_id, sum(e.items_in_cart) as total_items_in_cart from sessions s 
join events e 
on s.eventid = e.eventid
group by 1
order by total_items_in_cart desc),

ses_purchase_rate as(
select sessionid, max(purchased) as purchase_rate from sessions
group by sessionid
order by purchase_rate desc)

select cart.total_items_in_cart as total_cart_items, 
CONCAT(ROUND(sum(rate.purchase_rate)*100.0/count(cart.total_items_in_cart),1),'%') as purchase_rate 
from session_cart cart
join ses_purchase_rate rate
on cart.ses_id = rate.sessionid
group by 1
order by total_cart_items desc;
















