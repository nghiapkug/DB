select f.id as flight_id,
f.departing_airport, f.arriving_airport,
f.departure_time, f.arrival_time,
a.name as airlineName
from flight f
left join airline a on a.id = f.airline_id
where a.name = 'Vietnam Airlines'

