call p_insert_book('가나다라마바사', '김상현', '김상현');

set @book_name = '혼자 공부하는 SQL';
set @author = '우재남';
set @publisher = '한빛미디어';
set @new_author_id = 0;
set @new_publisher_id = 0;

insert into author_tb
values(0, @author);

select
	max(author_id) into @new_author_id
from author_tb;

select
	max(publisher_id) into @new_publisher_id
from publisher_tb;

select @new_author_id;
select @new_publisher_id;

-- insert into publisher_tb
-- values(0, @publisher);

insert into book_tb
values(0, @book_name, @new_author_id, @new_publisher_id);

select *
from book_tb
order by book_id desc;

-- set @book_name = '송사무장의 실전경매';
-- set @author_name = '송희창';
-- set @publisher_name = '지혜로';
-- set @insert_book_status = 0;

-- call p_insert_book(@book_name, @author_name, @publisher_name, @insert_book_status);

-- select * from book_tb order by book_id desc;

-- select @insert_book_status;
