--============================================
-- 관리자 계정
--============================================
-- petlab 계정 생성
alter session set _oracle_script = true;

create user petlab
IDENTIFIED by petlab
default tablespace users;

alter user petlab quota unlimited on users;

grant connect, resource to petlab;

--=============================================
-- petlab 계정
--=============================================

-- 첨부파일 테이블
create table attachment (
    attach_group_id varchar2(256),
    attach_no number,
    original_filename varchar2(256),
    renamed_filename varchar2(256),
    download_count number default 0,
    created_at date default sysdate,
    
    constraint pk_attachment_attach_group_id primary key(attach_group_id)
);
--drop table attachment;
create sequence seq_attachment_attach_no nocache;



create table product(
    product_no number,
    category_id varchar2(30) not null,
    category_sub_id varchar2(30) not null,
    attach_group_id varchar2(256),
    product_name varchar2(150),
    product_price number,
    product_des varchar2(3000),
    
    constraint pk_product_no primary key(product_no),
    constraint fk_product_category_id foreign key(category_id) references product_category(category_id) on delete cascade,
    constraint fk_product_category_sub_id foreign key(category_sub_id) references product_sub_category(category_sub_id) on delete cascade,
    constraint fk_attach_group_id foreign key(attach_group_id) references attachment(attach_group_id) on delete cascade
);
create sequence seq_product_no;


select * from attachment;
	select 
			b.*,
			(select count(*) from attachment where product_no  = b.product_no) attach_count
		from
			product b
		order by
			product_no desc;



commit;