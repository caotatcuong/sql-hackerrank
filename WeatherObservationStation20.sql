select
format((
 (select MAX(lat_n) from
   (select top 50 percent lat_n from station order by lat_n) as BottomHalf)
 +
 (select MIN(lat_n) from
   (select top 50 percent lat_n from station order by lat_n desc) as TopHalf)
 ) / 2, 'N4');
