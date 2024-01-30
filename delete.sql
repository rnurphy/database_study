SELECT * FROM db_study.product_register_tb;

#	delete는 join이 불가능
#	select의 결과행이 복수개일 경우 =을 in으로 바꾼다
#	select의 결과열은 복수개면 안됨
delete
from
	product_register_tb
where
	product_color_id = (select
							product_color_id
						from
							product_color_tb
						where
							product_color_name = 'Black');
    
#	select와 where은 하나의 테이블을 결과로 가지는 서브쿼리가 올 수 있음
#	from은 여러개 가능
