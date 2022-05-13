select format((max(lat_n) - min(lat_n)) + (max(long_w) - min(long_w)), 'N4')
from station;