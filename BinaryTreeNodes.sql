/*
If node don't have parent -> Root
If node in both node and parent -> Inner
orthewise -> Leaf (just in node column)
*/
select
case
    when P is null then str(N) + ' Root'
    when N in (select P from BST) then str(N) + ' Inner'
    else str(N) + ' Leaf'
end
from BST
order by N;