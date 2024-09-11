select *
from(select bp.id
as booking_platform_id,
bp.name as
booking_platform_name, bp.url,
count(bp.id) as NumberOfBookings
from bookingPlatform bp
join booking b on b.booking_platform_id = bp.id
join passenger p on p.id = b.passenger_id
group by bp.id, bp.name,bp.url) tb1
where NumberOfBookings <  (
select (NumberOfBookings)
from (select bp.id, bp.name,count(bp.id) as NumberOfBookings
from bookingPlatform bp
join booking b on b.booking_platform_id = bp.id
join passenger p on p.id = b.passenger_id
group by bp.id, bp.name
having bp.name = 'Amadeus') tb2 

) and NumberOfBookings <
(
select (NumberOfBookings)
from (select bp.id, bp.name,count(bp.id) as NumberOfBookings
from bookingPlatform bp
join booking b on b.booking_platform_id = bp.id
join passenger p on p.id = b.passenger_id
group by bp.id, bp.name
having bp.name = 'Expedia') tb2 

)
