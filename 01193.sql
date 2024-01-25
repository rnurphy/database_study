select *
from
	student_tb st
	left outer join address1_tb at1 on(at1.address1_id = st.address_sido)
    left outer join address2_tb at2 on(at2.address2_id = st.address_sigungu);

update
	student_tb st
	left outer join address1_tb at1 on(st.address like concat(at1.address1_sido, '%'))
    left outer join address2_tb at2 on(st.address like concat('%', at2.address2_sigungu))
set
	st.address_sido = at1.address1_id,
	st.address_sigungu = at2.address2_id;
	