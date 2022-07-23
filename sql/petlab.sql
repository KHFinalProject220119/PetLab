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

create table member (
	member_id	varchar2(200)		NOT NULL,
	grade_no	number		NOT NULL,
	password	varchar2(300) 	NOT	NULL,
	member_name	varchar2(50)	NOT	NULL,
	nickname	varchar2(100)	NOT	NULL,
	phone	char(11)	NOT	NULL,
	email	varchar2(300)	NOT	NULL,
	birthday	date		NULL,
	gender	char(1)		NULL,
	member_social	varchar2(15)	 default 'normal', -- normal, kakao, naver, google  
	recommended_id	varchar2(200)		NULL,
	membership_point	number	 DEFAULT 1000 NULL,
	point	number 	DEFAULT 0	NULL,
	enabled	number 	DEFAULT 1, -- 활성화 여부 :  1 사용중, 0 비활성화,
	enroll_date	date	 DEFAULT sysdate,
    constraint pk_member_member_id primary key(member_id),
   constraint ck_member_gender check(gender in ('M', 'F')),
    constraint ck_member_enabled check(enabled in (1, 0)),
    constraint fk_member_grade_no foreign key(grade_no) references member_grade(grade_no)
);
commit;
select * from member;
--delete from member where member_id = 'mrjeon';
--delete from member where member_id = 'sinsa';
--delete from member where member_id = 'honggd';
--delete from member where member_id = 'admin';
--update member set membership_point = 0 where member_id = 'sinsa';


-- 샘플데이터  비밀번호 asdf456!
-- 회원테이블
insert into member values('admin', 100, '$2a$10$vXeuyNX1jwvG7GepkNOIZ.lPyuyOLL3ascNo2tHR8Y00Pjoj2PJli', '관리자', '관리자', '01011102220', 'admin@PetLab.com', to_date('88-01-25','rr-mm-dd'), 'M', 'normal', null, 0, 0, 1, default);
insert into member values('honggd', 97, '$2a$10$vXeuyNX1jwvG7GepkNOIZ.lPyuyOLL3ascNo2tHR8Y00Pjoj2PJli', '홍길동', '신출귀몰', '01011103234', 'honggd@naver.com', to_date('96-05-14','rr-mm-dd'), 'M', 'normal', null, 0, 0, 1, default);
insert into member values('sinsa', 98, '$2a$10$vXeuyNX1jwvG7GepkNOIZ.lPyuyOLL3ascNo2tHR8Y00Pjoj2PJli', '신사임당', '사임당', '01021478424', 'sinsa@naver.com', to_date('91-12-22','rr-mm-dd'), 'F', 'normal', null, 0, 0, 1, default);
-- 주소 테이블
insert into address values(seq_address_no.nextval, 'admin', default, '06234', '서울 강남구 테헤란로10길 9', '5층 M강의장', '(역삼동)'); 
insert into address values(seq_address_no.nextval, 'honggd', default, '03076', '서울 종로구 혜화로 12', '1층 102호', '(혜화동)'); 
insert into address values(seq_address_no.nextval, 'sinsa', default, '03055', '서울 종로구 북촌로 35', '2층 201호', '(가회동)'); 
-- 권한 테이블
insert into authority values('ROLE_USER', 'admin'); 
insert into authority values('ROLE_ADMIN', 'admin'); 
insert into authority values('ROLE_USER', 'honggd'); 
insert into authority values('ROLE_HOSPITAL', 'honggd'); 
insert into authority values('ROLE_USER', 'sinsa'); 
insert into authority values('ROLE_MALL', 'sinsa'); 

CREATE TABLE member_grade (
	grade_no	number		NOT NULL,
	grade_title	varchar2(40)	NOT	NULL,
    constraint pk_member_grade_no primary key(grade_no)
);

create sequence seq_member_grade_no nocache;
insert into member_grade values(seq_member_grade_no.nextval, '초보');
insert into member_grade values(97, '동물병원');
insert into member_grade values(98, '입점몰');
insert into member_grade values(99, '상담사');
insert into member_grade values(100, '관리자');

select * from member_grade;

CREATE TABLE address (
	address_no	number		NOT NULL,
	member_id	varchar2(200)		NOT NULL,
	address_title	varchar2(40) default '배송지',
	postcode	varchar2(30)		NOT NULL,
	address	varchar2(200)		NOT NULL,
	address_detail	varchar2(30)	NULL,
	address_extra	varchar2(30)	NULL,
    constraint pk_address_no primary key(address_no),
    constraint fk_address_member_id foreign key(member_id)  references member(member_id) on delete cascade
);

create sequence seq_address_no nocache;

select * from address order by address_no;

CREATE TABLE authority (
	auth	varchar2(30)		NOT NULL,
	member_id	varchar2(200)		NOT NULL,
    constraint pk_authority primary key(member_id, auth),
    constraint fk_authority_member_id foreign key(member_id) references member(member_id) on delete cascade
);

select * from  authority;

--drop table address;
--drop table authority;
--drop table member;

CREATE TABLE pet_hospital (
	hospital_no	number		NOT NULL,
	hospital_name	varchar2(50)		NULL,
	address	varchar2(200)		NULL,
	tel	varchar2(30)		NULL,
	operation_hours	varchar2(80)		NULL,
	content	varchar2(4000)		NULL,
	isabled	char(1)		NULL,
	homepage	varchar2(50)		NULL,
	chief_veterinarian	varchar2(30)		NULL,
	cnt_veterinarian	number		NULL
);

CREATE TABLE hospital_review (
	hos_reiview_no	number		NOT NULL,
	member_id	varchar2(200)		NOT NULL,
	hospital_no	number		NOT NULL,
	title	varchar2(50)		NULL,
	content	varchar2(4000)		NULL,
	Field	date		NULL
);

CREATE TABLE hosptial_image (
	no	number		NOT NULL,
	hospital_no	number		NOT NULL,
	original_filename	varchar2(200)		NULL,
	renamed_filename	varchar2(200)		NULL,
	reg_date	date		NULL
);