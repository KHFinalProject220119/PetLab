--=============================================
-- petlab 계정
--=============================================

-- 첨부파일 테이블
create table attachment (
    attach_group_id varchar2(256),
    attach_no number,
    original_filename varchar2(256) not null,
    renamed_filename varchar2(256) not null,
    download_count number default 0,
    created_at date default sysdate,
    constraint pk_attachment_attach_group_id primary key(attach_group_id)
);
--drop table attachment;
select * from attachment;
create sequence seq_attachment_attach_no nocache;
--drop sequence seq_attachment_attach_no;

--delete from authority;
--delete from address;
--delete from member;
--drop table authority;
--drop table address;
--drop table member;


-- 회원등급 테이블
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


create table member (
	member_id	varchar2(200)		NOT NULL,
    attach_group_id  varchar2(256),
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
    constraint fk_member_grade_no foreign key(grade_no) references member_grade(grade_no),
    constraint fk_member_attach_group_id foreign key(attach_group_id) references attachment(attach_group_id)
);
commit;
select * from member;
--delete from member where member_id = 'mrjeon';
--delete from member where member_id = 'sinsa';
--delete from member where member_id = 'honggd';
--delete from member where member_id = 'admin';
--update member set email = 'veraxanimus@naver.com' where member_id = 'honggd';
--$2a$10$vXeuyNX1jwvG7GepkNOIZ.lPyuyOLL3ascNo2tHR8Y00Pjoj2PJli

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
--drop sequence seq_address_no;
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


-- 샘플데이터  비밀번호 asdf456!
-- 회원테이블
insert into member values('admin', null, 100, '$2a$10$vXeuyNX1jwvG7GepkNOIZ.lPyuyOLL3ascNo2tHR8Y00Pjoj2PJli', '관리자', '관리자', '01011102220', 'admin@PetLab.com', to_date('88-01-25','rr-mm-dd'), 'M', 'normal', null, 0, 0, 1, default);
insert into member values('honggd', null, 97, '$2a$10$vXeuyNX1jwvG7GepkNOIZ.lPyuyOLL3ascNo2tHR8Y00Pjoj2PJli', '홍길동', '신출귀몰', '01011103234', 'honggd@naver.com', to_date('96-05-14','rr-mm-dd'), 'M', 'normal', null, 0, 0, 1, default);
insert into member values('sinsa', null, 98, '$2a$10$vXeuyNX1jwvG7GepkNOIZ.lPyuyOLL3ascNo2tHR8Y00Pjoj2PJli', '신사임당', '사임당', '01021478424', 'sinsa@naver.com', to_date('91-12-22','rr-mm-dd'), 'F', 'normal', null, 0, 0, 1, default);
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



CREATE TABLE pet_hospital (
	hospital_no	number		NOT NULL,
	hospital_name	varchar2(50)		NULL,
	address	varchar2(200)		NULL,
	tel	varchar2(30)		NULL,
	operation_hours	varchar2(80)		NULL,
	content	varchar2(4000)		NULL,
	isparked	char(1)		NULL,
	homepage	varchar2(50)		NULL,
	chief_veterinarian	varchar2(30)		NULL,
	cnt_veterinarian	number		NULL
);

create sequence seq_pet_hospital_no nocache;


ALTER TABLE   pet_hospital   ADD CONSTRAINT   PK_PET_HOSPITAL   PRIMARY KEY (
	  hospital_no  
);
ALTER TABLE   pet_hospital   ADD CONSTRAINT   FK_attachment_TO_pet_hospital_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);

CREATE TABLE hospital_review (
	hos_reiview_no	number		NOT NULL,
	member_id	varchar2(200)		NOT NULL,
	hospital_no	number		NOT NULL,
	title	varchar2(50)		NULL,
	content	varchar2(4000)		NULL,
	Field	date		NULL
);

create sequence seq_hospital_review_no nocache;

ALTER TABLE   hospital_review   ADD CONSTRAINT   FK_member_TO_hospital_review_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);

ALTER TABLE   hospital_review   ADD CONSTRAINT   FK_pet_hospital_TO_hospital_review_1   FOREIGN KEY (
	  hospital_no  
)
REFERENCES   pet_hospital   (
	  hospital_no  
);

ALTER TABLE   hospital_review   ADD CONSTRAINT   FK_attachment_TO_hospital_review_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);


CREATE TABLE  review_rate  (
	 no 	VARCHAR(255)		NOT NULL,
	 hos_reiview_no 	number		NOT NULL,
	 kindness 	number	DEFAULT 5	NULL,
	 description 	number		NULL,
	 diagnosis 	number		NULL,
	 facility 	number		NULL,
	 price 	number		NULL
);

create sequence seq_review_rate_no nocache;
ALTER TABLE review_rate ADD CONSTRAINT PK_REVIEW_RATE PRIMARY KEY (
	no
);


ALTER TABLE   review_rate   ADD CONSTRAINT   FK_hospital_review_TO_review_rate_1   FOREIGN KEY (
	  hos_reiview_no  
)
REFERENCES   hospital_review   (
	  hos_reiview_no  
);

-- rememberme table
create table persistent_logins (
        username varchar(64) not null, 
        series varchar(64) primary key, 
        token varchar(64) not null,  -- username, password, expiry time을 hashing 한 값
        last_used timestamp not null
);

select * from persistent_logins;




CREATE TABLE   qa_notice   (
	  notice_no  	number		NOT NULL,
	  attach_group_id  	varchar2(256)		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  nickname  	varchar2(100)		NULL,
	  notice_title  	varchar2(200)		NULL,
	  content  	varchar2(1000)		NULL,
	  read_count  	number		NULL,
	  reg_date  	date		NULL
);

create sequence seq_qa_notice_no nocache;
ALTER TABLE   qa_notice   ADD CONSTRAINT   PK_QA_NOTICE   PRIMARY KEY (
	  notice_no  
);

ALTER TABLE   qa_notice   ADD CONSTRAINT   FK_attachment_TO_qa_notice_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);

ALTER TABLE   qa_notice   ADD CONSTRAINT   FK_member_TO_qa_notice_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);

CREATE TABLE   contest   (
	  contest_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  attach_group_id  	varchar2(256)		NOT NULL,
	  nickname  	varchar2(100)		NULL,
	  title  	varchar2(30)		NULL,
	  content  	varchar2(2000)		NULL,
	  cover_photo  	varchar2(255)		NULL,
	  read_count  	number		NULL,
	  reg_date  	date		NULL,
	  reg_date2  	date		NULL
);

create sequence seq_contest_no nocache;

ALTER TABLE   contest   ADD CONSTRAINT   FK_member_TO_contest_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);

ALTER TABLE   contest   ADD CONSTRAINT   FK_attachment_TO_contest_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);

ALTER TABLE   contest   ADD CONSTRAINT   PK_CONTEST   PRIMARY KEY (
	  contest_no  
);


ALTER TABLE   product_category   ADD CONSTRAINT   PK_PRODUCT_CATEGORY   PRIMARY KEY (
	  category_id  
);

ALTER TABLE   product_review   ADD CONSTRAINT   PK_PRODUCT_REVIEW   PRIMARY KEY (
	  review_no  
);





CREATE TABLE   product   (
	  product_no  	number		NOT NULL,
	  category_id  	varchar2(30)		NOT NULL,
	  category_sub_id  	varchar2(30)		NOT NULL,
	  attach_group_id  	varchar2(256)		NOT NULL,
	  product_name  	varchar2(150)		NULL,
	  product_price  	number		NULL,
	  product_des  	varchar2(3000)		NULL
);

create sequence seq_product_no nocache;

ALTER TABLE   product   ADD CONSTRAINT   PK_PRODUCT   PRIMARY KEY (
	  product_no  
);

ALTER TABLE   product   ADD CONSTRAINT   FK_product_category_TO_product_1   FOREIGN KEY (
	  category_id  
)
REFERENCES   product_category   (
	  category_id  
);

ALTER TABLE   product   ADD CONSTRAINT   FK_product_sub_category_TO_product_1   FOREIGN KEY (
	  category_sub_id  
)
REFERENCES   product_sub_category   (
	  category_sub_id  
);

ALTER TABLE   product   ADD CONSTRAINT   FK_attachment_TO_product_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);



CREATE TABLE   product_category   (
	  category_id  	varchar2(30)		NOT NULL,
	  category_name  	varchar2(30)		NULL
);

CREATE TABLE   product_review   (
	  review_no  	number		NOT NULL,
	  product_id  	varchar2(100)		NOT NULL,
	  attach_group_id  	varchar2(256)		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  review_content  	varchar2(1500)		NOT NULL,
	  review_grade  	number		NULL,
	  reg_date  	date		NULL
);

create sequence seq_product_review_no nocache;
ALTER TABLE   product_review   ADD CONSTRAINT   FK_product_TO_product_review_1   FOREIGN KEY (
	  product_id  
)
REFERENCES   product   (
	  product_no  
);

ALTER TABLE   product_review   ADD CONSTRAINT   FK_attachment_TO_product_review_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);

ALTER TABLE   product_review   ADD CONSTRAINT   FK_member_TO_product_review_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);



CREATE TABLE   cart   (
	  cart_no  	number		NOT NULL,
	  product_id  	varchar2(100)		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  product_count  	number		NULL
);
create sequence seq_cart_no nocache;
ALTER TABLE   cart   ADD CONSTRAINT   PK_CART   PRIMARY KEY (
	  cart_no  
);

ALTER TABLE   cart   ADD CONSTRAINT   FK_product_TO_cart_1   FOREIGN KEY (
	  product_id  
)
REFERENCES   product   (
	  product_no  
);

ALTER TABLE   cart   ADD CONSTRAINT   FK_member_TO_cart_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);


CREATE TABLE   product_sub_category   (
	  category_sub_id  	varchar2(30)		NOT NULL,
	  category_id  	varchar2(30)		NOT NULL,
	  category_sub_name  	varchar2(30)		NULL
);

ALTER TABLE   product_sub_category   ADD CONSTRAINT   PK_PRODUCT_SUB_CATEGORY   PRIMARY KEY (
	  category_sub_id  
);

ALTER TABLE   product_sub_category   ADD CONSTRAINT   FK_product_category_TO_product_sub_category_1   FOREIGN KEY (
	  category_id  
)
REFERENCES   product_category   (
	  category_id  
);


CREATE TABLE   pet   (
	  pet_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  type_id  	varchar2(30)		NOT NULL,
	  breed_id  	varchar2(30)		NOT NULL,
	  attach_group_id  	varchar2(256)		NOT NULL,
	  pet_id  	varchar2(100)		NULL,
	  pet_name  	varchar2(50)		NULL,
	  pet_type  	char(1)		NULL,
	  breed  	varchar2(30)		NULL,
	  gender  	char(1)		NULL,
	  weight  	number		NULL,
	  birthday  	date		NULL,
	  Field  	char(1)		NULL
);

COMMENT ON COLUMN   pet  .  pet_type   IS 'D  - dog
C - cat
E - Etc';

COMMENT ON COLUMN   pet  .  Field   IS 'T 
F';

create sequence seq_pet_pet_no nocache;
ALTER TABLE   pet   ADD CONSTRAINT   PK_PET   PRIMARY KEY (
	  pet_no  
);
ALTER TABLE   pet   ADD CONSTRAINT   FK_member_TO_pet_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);

ALTER TABLE   pet   ADD CONSTRAINT   FK_pet_type_TO_pet_1   FOREIGN KEY (
	  type_id  
)
REFERENCES   pet_type   (
	  type_id  
);

ALTER TABLE   pet   ADD CONSTRAINT   FK_breed_TO_pet_1   FOREIGN KEY (
	  breed_id  
)
REFERENCES   breed   (
	  breed_id  
);

ALTER TABLE   pet   ADD CONSTRAINT   FK_attachment_TO_pet_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);



CREATE TABLE   breed   (
	  breed_id  	varchar2(30)		NOT NULL,
	  type_id  	varchar2(30)		NOT NULL,
	  breed_name  	varchar2(20)		NULL
);

ALTER TABLE   breed   ADD CONSTRAINT   PK_BREED   PRIMARY KEY (
	  breed_id  
);

ALTER TABLE   breed   ADD CONSTRAINT   FK_pet_type_TO_breed_1   FOREIGN KEY (
	  type_id  
)
REFERENCES   pet_type   (
	  type_id  
);




CREATE TABLE   pet_type   (
	  type_id  	varchar2(30)		NOT NULL,
	  type_name  	varchar2(20)		NULL
);

ALTER TABLE   pet_type   ADD CONSTRAINT   PK_PET_TYPE   PRIMARY KEY (
	  type_id  
);

COMMENT ON COLUMN   pet_type  .  type_name   IS '개, 고양이, 기타';


CREATE TABLE   community_group   (
	  group_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  ggrade_no  	number		NOT NULL,
	  attach_group_id  	varchar2(256)		NOT NULL,
	  group_name  	varchar2(200)		NULL,
	  content  	varchar2(1000)		NULL,
	  read_count  	number		NULL,
	  reg_date  	date		NULL,
	  member_count  	number		NULL,
	  like_count  	number		NULL
);

create sequence seq_community_group_no nocache;
ALTER TABLE   community_group   ADD CONSTRAINT   PK_COMMUNITY_GROUP   PRIMARY KEY (
	  group_no  
);

ALTER TABLE   community_group   ADD CONSTRAINT   FK_member_TO_community_group_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);

ALTER TABLE   community_group   ADD CONSTRAINT   FK_group_member_grade_TO_community_group_1   FOREIGN KEY (
	  ggrade_no  
)
REFERENCES   group_member_grade   (
	  ggrade_no  
);

ALTER TABLE   community_group   ADD CONSTRAINT   FK_attachment_TO_community_group_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);


CREATE TABLE   community_free_board   (
	  freeb_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  attach_group_id  	varchar2(256)		NOT NULL,
	  board_theme_id  	varchar2(50)		NOT NULL,
	  freeb_title  	varchar2(200)		NULL,
	  content  	varchar2(1000)		NULL,
	  read_count  	number		NULL,
	  reg_date  	date		NULL,
	  like_count  	number		NULL
);
create sequence seq_community_free_board_freeb_no nocache;
ALTER TABLE   community_free_board   ADD CONSTRAINT   PK_COMMUNITY_FREE_BOARD   PRIMARY KEY (
	  freeb_no  
);

ALTER TABLE   community_free_board   ADD CONSTRAINT   FK_member_TO_community_free_board_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);

ALTER TABLE   community_free_board   ADD CONSTRAINT   FK_attachment_TO_community_free_board_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);

ALTER TABLE   community_free_board   ADD CONSTRAINT   FK_board_theme_TO_community_free_board_1   FOREIGN KEY (
	  board_theme_id  
)
REFERENCES   board_theme   (
	  board_theme_id  
);



CREATE TABLE   freeb_reply   (
	  fbreply_no  	number		NOT NULL,
	  freeb_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  content  	varchar2(1000)		NULL,
	  like_count  	number		NULL,
	  hate_count  	number		NULL,
	  reg_date  	date		NULL
);

create sequence seq_freeb_reply_fbreply_no nocache;

ALTER TABLE   freeb_reply   ADD CONSTRAINT   PK_FREEB_REPLY   PRIMARY KEY (
	  fbreply_no  
);


ALTER TABLE   freeb_reply   ADD CONSTRAINT   FK_community_free_board_TO_freeb_reply_1   FOREIGN KEY (
	  freeb_no  
)
REFERENCES   community_free_board   (
	  freeb_no  
);

ALTER TABLE   freeb_reply   ADD CONSTRAINT   FK_member_TO_freeb_reply_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);



CREATE TABLE   community_photo   (
	  photo_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  attach_group_id  	varchar2(256)		NOT NULL,
	  p_title  	varchar2(200)		NULL,
	  p_content  	varchar2(1000)		NULL,
	  read_count  	number		NULL,
	  like_count  	number		NULL,
	  reg_date  	date		NULL
);
create sequence seq_community_photo_photo_no nocache;
ALTER TABLE   community_photo   ADD CONSTRAINT   PK_COMMUNITY_PHOTO   PRIMARY KEY (
	  photo_no  
);

ALTER TABLE   community_photo   ADD CONSTRAINT   FK_member_TO_community_photo_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);

ALTER TABLE   community_photo   ADD CONSTRAINT   FK_attachment_TO_community_photo_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);




CREATE TABLE   cs_email_type   (
	  question_type  	number		NOT NULL,
	  question_type_name  	varchar2(30)		NULL
);

ALTER TABLE   cs_email_type   ADD CONSTRAINT   PK_CS_EMAIL_TYPE   PRIMARY KEY (
	  question_type  
);



CREATE TABLE   cs_email_log   (
	  cs_email_log_no  	number		NOT NULL,
	  question_type  	number		NOT NULL,
	  name  	varchar2(30)		NULL,
	  email  	varchar2(100)		NULL,
	  title  	varchar2(50)		NULL,
	  content  	varchar2(4000)		NULL,
	  reg_date  	date		NULL,
	  attach_group_id  	varchar2(256)		NOT NULL
);

create sequence cs_email_log_no nocache;
ALTER TABLE   cs_email_log   ADD CONSTRAINT   PK_CS_EMAIL_LOG   PRIMARY KEY (
	  cs_email_log_no  
);

ALTER TABLE   cs_email_log   ADD CONSTRAINT   FK_cs_email_type_TO_cs_email_log_1   FOREIGN KEY (
	  question_type  
)
REFERENCES   cs_email_type   (
	  question_type  
);

ALTER TABLE   cs_email_log   ADD CONSTRAINT   FK_attachment_TO_cs_email_log_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);



CREATE TABLE   group_reply   (
	  gbreply_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  groupb_no  	number		NOT NULL,
	  content  	varchar2(1000)		NULL,
	  like_count  	number		NULL,
	  hate_count  	number		NULL,
	  reg_date  	date		NULL
);

create sequence group_reply_gbreply_no nocache;

ALTER TABLE   group_reply   ADD CONSTRAINT   PK_GROUP_REPLY   PRIMARY KEY (
	  gbreply_no  
);


ALTER TABLE   group_reply   ADD CONSTRAINT   FK_member_TO_group_reply_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);

ALTER TABLE   group_reply   ADD CONSTRAINT   FK_group_board_TO_group_reply_1   FOREIGN KEY (
	  groupb_no  
)
REFERENCES   group_board   (
	  groupb_no  
);





CREATE TABLE   gphoto_reply   (
	  gpreply_no  	number		NOT NULL,
	  photo_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  content  	varchar2(1000)		NULL,
	  like_count  	number		NULL,
	  hate_count  	number		NULL,
	  reg_date  	date		NULL
);

create sequence gphoto_reply_gpreply_no nocache;
ALTER TABLE   gphoto_reply   ADD CONSTRAINT   PK_GPHOTO_REPLY   PRIMARY KEY (
	  gpreply_no  
);

ALTER TABLE   gphoto_reply   ADD CONSTRAINT   FK_group_photo_TO_gphoto_reply_1   FOREIGN KEY (
	  photo_no  
)
REFERENCES   group_photo   (
	  photo_no  
);

ALTER TABLE   gphoto_reply   ADD CONSTRAINT   FK_member_TO_gphoto_reply_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);






CREATE TABLE   group_photo   (
	  photo_no  	number		NOT NULL,
	  group_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  attach_group_id  	varchar2(256)		NOT NULL,
	  p_title  	varchar2(200)		NULL,
	  p_content  	varchar2(1000)		NULL,
	  read_count  	number		NULL,
	  like_count  	number		NULL,
	  reg_date  	date		NULL
);

create sequence group_photo_photo_no nocache;
ALTER TABLE   group_photo   ADD CONSTRAINT   PK_GROUP_PHOTO   PRIMARY KEY (
	  photo_no  
);
ALTER TABLE   group_photo   ADD CONSTRAINT   FK_community_group_TO_group_photo_1   FOREIGN KEY (
	  group_no  
)
REFERENCES   community_group   (
	  group_no  
);

ALTER TABLE   group_photo   ADD CONSTRAINT   FK_member_TO_group_photo_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);

ALTER TABLE   group_photo   ADD CONSTRAINT   FK_attachment_TO_group_photo_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);



CREATE TABLE   community_photo_reply   (
	  cpreply_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  photo_no  	number		NOT NULL,
	  content  	varchar2(1000)		NULL,
	  like_count  	number		NULL,
	  hate_count  	number		NULL,
	  reg_date  	date		NULL
);

create sequence community_photo_reply_cpreply_no nocache;

ALTER TABLE   community_photo_reply   ADD CONSTRAINT   PK_COMMUNITY_PHOTO_REPLY   PRIMARY KEY (
	  cpreply_no  
);

ALTER TABLE   community_photo_reply   ADD CONSTRAINT   FK_member_TO_community_photo_reply_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);

ALTER TABLE   community_photo_reply   ADD CONSTRAINT   FK_community_photo_TO_community_photo_reply_1   FOREIGN KEY (
	  photo_no  
)
REFERENCES   community_photo   (
	  photo_no  
);



CREATE TABLE   group_schedule   (
	  schedule_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  group_no  	number		NOT NULL,
	  attach_group_id  	varchar2(256)		NOT NULL,
	  schedule_title  	varchar2(100)		NULL,
	  schedule_content  	varchar2(1000)		NULL,
	  attach_count  	number		NULL,
	  non_attach_count  	number		NULL,
	  schedule_date  	date		NULL,
	  reg_date  	date		NULL,
	  place  	varchar2(100)		NULL
);

create sequence group_schedule_schedule_no nocache;

ALTER TABLE   group_schedule   ADD CONSTRAINT   PK_GROUP_SCHEDULE   PRIMARY KEY (
	  schedule_no  
);

ALTER TABLE   group_schedule   ADD CONSTRAINT   FK_member_TO_group_schedule_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);

ALTER TABLE   group_schedule   ADD CONSTRAINT   FK_community_group_TO_group_schedule_1   FOREIGN KEY (
	  group_no  
)
REFERENCES   community_group   (
	  group_no  
);

ALTER TABLE   group_schedule   ADD CONSTRAINT   FK_attachment_TO_group_schedule_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);



CREATE TABLE   schedule_reply   (
	  sreply_no  	number		NOT NULL,
	  schedule_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  content  	varchar2(1000)		NULL,
	  like_count  	number		NULL,
	  hate_count  	number		NULL,
	  reg_date  	date		NULL
);
create sequence schedule_reply_sreply_no nocache;

ALTER TABLE   schedule_reply   ADD CONSTRAINT   PK_SCHEDULE_REPLY   PRIMARY KEY (
	  sreply_no  
);

ALTER TABLE   schedule_reply   ADD CONSTRAINT   FK_group_schedule_TO_schedule_reply_1   FOREIGN KEY (
	  schedule_no  
)
REFERENCES   group_schedule   (
	  schedule_no  
);

ALTER TABLE   schedule_reply   ADD CONSTRAINT   FK_member_TO_schedule_reply_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);




CREATE TABLE   order   (
	  order_no  	number		NOT NULL,
	  member_id  	varchar2(200)		NOT NULL,
	  product_id  	varchar2(100)		NOT NULL,
	  address_no  	number		NOT NULL,
	  product_name  	varchar2(150)		NULL,
	  product_total_price  	number		NULL,
	  order_state  	varchar2(10)		NULL,
	  order_date  	date		NULL
);

create sequence order_order_no nocache;

ALTER TABLE   order   ADD CONSTRAINT   PK_ORDER   PRIMARY KEY (
	  order_no  
);

ALTER TABLE   order   ADD CONSTRAINT   FK_member_TO_order_1   FOREIGN KEY (
	  member_id  
)
REFERENCES   member   (
	  member_id  
);

ALTER TABLE   order   ADD CONSTRAINT   FK_product_TO_order_1   FOREIGN KEY (
	  product_id  
)
REFERENCES   product   (
	  product_no  
);

ALTER TABLE   order   ADD CONSTRAINT   FK_address_TO_order_1   FOREIGN KEY (
	  address_no  
)
REFERENCES   address   (
	  address_no  
);


CREATE TABLE   board_theme   (
	  board_theme_id  	varchar2(50)		NOT NULL,
	  theme_name  	varchar2(50)		NULL
);

ALTER TABLE   board_theme   ADD CONSTRAINT   PK_BOARD_THEME   PRIMARY KEY (
	  board_theme_id  
);



CREATE TABLE   group_board   (
	  groupb_no  	number		NOT NULL,
	  group_no  	number		NOT NULL,
	  attach_group_id  	varchar2(256)		NOT NULL,
	  groupb_title  	varchar2(200)		NULL,
	  content  	varchar2(1000)		NULL,
	  read_count  	number		NULL,
	  reg_date  	date		NULL,
	  like_count  	number		NULL
);

create sequence group_board_groupb_no nocache;
ALTER TABLE   group_board   ADD CONSTRAINT   PK_GROUP_BOARD   PRIMARY KEY (
	  groupb_no  
);
ALTER TABLE   group_board   ADD CONSTRAINT   FK_community_group_TO_group_board_1   FOREIGN KEY (
	  group_no  
)
REFERENCES   community_group   (
	  group_no  
);

ALTER TABLE   group_board   ADD CONSTRAINT   FK_attachment_TO_group_board_1   FOREIGN KEY (
	  attach_group_id  
)
REFERENCES   attachment   (
	  attach_group_id  
);

