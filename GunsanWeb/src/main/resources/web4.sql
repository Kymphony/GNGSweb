create table MEMBER(
    MEMBER_ID                      varchar2(40) primary key,
    MEMBER_PW                      varchar2(40) not null,
    MEMBER_NAME                    varchar2(40) not null,
    MEMBER_BIRTH                       varchar2(40) not null,
    MEMBER_GENDER                      char(1) not null,
    MEMBER_PHONE_NUMBER            varchar2(40) unique,
    MEMBER_DISTRICT                    varchar2(10) default '99',
    MEMBER_SIGN_UP_DATE                varchar2(20) default sysdate,
    MEMBER_NUM_OF_POSTS                number(10)  default 0,
    MEMBER_NUM_OF_COMMENTS             number(5) default 0,
    MEMBER_LAST_LOGIN_DATE                date,
    MEMBER_NUM_OF_FAILS                number(1) default 0,
    MEMBER_LOCK_FLAG                  char(1) default '1',
    MEMBER_MAIL_ADDRESS                varchar2(40),
    MEMBER_POSITION               varchar2(10) default '99'
);

бщ rivision бщ

create table MEMBER(
    id                      varchar2(40) primary key,
    pw                      varchar2(40) not null,
    name                    varchar2(40) not null,
    birth                       varchar2(40) not null,
    gender                      char(1) not null,
    phone_number            varchar2(40) unique,
    district                    varchar2(10) default '99',
    sign_up_date                varchar2(20) default sysdate,
    num_of_posts                number(10)  default 0,
    num_of_comments             number(5) default 0,
    last_login_date                date,
    num_of_fails                number(1) default 0,
    lock_flag                  char(1) default '1',
    mail_address                varchar2(40),
    position               varchar2(10) default '99'
);
