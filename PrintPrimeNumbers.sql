/*
For loop i from 1 to sqrt(number), if number is just divisible i=1 then prime number else nỏ prime number
*/

declare @i int = 2;
declare @res nvarchar(1000) = '';
while (@i <= 1000)
begin
    declare @j int = 1;
    declare @count int = 0;
    while(@j <= sqrt(@i))
    begin
        if @i % @j = 0
        begin
            set @count = @count + 1;
        end
        set @j = @j + 1;
    end
    if @count = 1
    begin
        set @res += cast(@i as nvarchar(1000)) + '&';
    end
    set @i = @i + 1;
end
select left(@res, len(@res) - 1)