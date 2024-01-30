SELECT * FROM db_study.publisher_tb;

# 1 - 1. 그닥인방법
select 
	*,
    (select
		count(*)
	from
		publisher_tb) as count
from
	publisher_tb pt;

# 1 - 2. 이게 더 좋은 방법(서브쿼리는 select에는 쓰지말고 가능한 from에 쓰자)
select
	*
from
	publisher_tb
    left outer join (select count(*) from publisher_tb) pt2 on(1 = 1);
    
    
    
# 2 - 1. 먼저 합치고 난 후에 선별작업함
select
	bt.book_id,
    bt.book_name,
    bt.author_id,
    bt.publisher_id
from
	book_tb bt
    left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
where
	pt.publisher_name like '아%';

# 2 - 2. 선별이 먼저 이루어짐
select
	*
from
	book_tb bt
where
	bt.publisher_id in (select
							pt.publisher_id
						from
							publisher_tb pt
						where
							pt.publisher_name like '아%');


select @@profiling;
show profiles;
set profiling = 1;

    

    
    