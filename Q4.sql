select f.id AS flight_id, f.departure_time, f.arrival_time, 
a.name as airlineName,
ap.name as departingAirportName, 
ap.country as departingCountry,
ap1.name as arrivingAirportName,
ap1.country as arrivingCountry
from flight f
join airport ap on ap.id = f.departing_airport
join airport ap1 on ap1.id = f.arriving_airport
join airline a on a.id = f.airline_id
where f.departure_time >= '2023-01-01' and
f.departure_time <= '2023-06-30' and
ap1.country = 'United States' or
ap1.country = 'United Kingdom' or
ap1.country = 'United China'
