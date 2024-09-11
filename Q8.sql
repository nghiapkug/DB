CREATE PROC P2
	@airline_id int,
	@NumberOfFlights int output
as
begin

select @NumberOfFlights = count(f.airline_id)
from flight f
where f.airline_id = @airline_id

end

declare @x int
exec P2 1, @x output
select @x as NumberOfFlights


