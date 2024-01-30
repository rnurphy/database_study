create view product_register_view as 
select
	prt.product_register_id,
	prt.product_id,
    pt.product_name,
    pt.product_price,
	prt.product_size_id,
    pst.product_size_name,
    prt.product_color_id,
    pct.product_color_name
from
	# 테이블은 as 생략가능하다
	product_register_tb prt
	# on() 안은 조건을 의미
	# on() 내에서 슬레이브 테이블이 조건을 판가름 하는 기준이 되어야함. 따라서 비교 연산 시 먼저 와야한다.
	left outer join product_tb pt on(pt.product_id = prt.product_id)
	left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id);
    
    
select
	prt.product_size_id,
    pst.product_size_name,
    count(prt.product_size_id) as count
--     prt.product_color_id,
--     pct.product_color_name,
-- 	count(prt.product_color_id) as count
from
	# 테이블은 as 생략가능하다
	product_register_tb prt
	# on() 안은 조건을 의미
	# on() 내에서 슬레이브 테이블이 조건을 판가름 하는 기준이 되어야함. 따라서 비교 연산에서 먼저 와야한다.
	left outer join product_tb pt on(pt.product_id = prt.product_id)
	left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
    left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id)
group by
	prt.product_size_id,
    pst.product_size_name
--     prt.product_color_id,
--     pct.product_color_name
having
	prt.product_size_id > 3;
-- order by
-- 	prt.product_size_id;
    
select 
	*
from product_register_view
where product_size_id >= 4
order by product_size_id;


    