
CREATE TABLE "public".dim_candidate_info ( 
	candidate_id         bigint  NOT NULL  ,
	first_name           char(100)    ,
	middle_initial       char(50)    ,
	last_name            char(100)    ,
	CONSTRAINT pk_dim_candidate_info PRIMARY KEY ( candidate_id )
 );



CREATE TABLE "public".dim_date ( 
	date_id              integer  NOT NULL  ,
	date_original_format varchar(100)    ,
	date_iso_format      date    ,
	year_no              integer    ,
	month_no             integer    ,
	quarter_no           integer    ,
	day_number           integer    ,
	month_name           char(100)    ,
	day_name             char(100)    ,
	CONSTRAINT pk_dim_date PRIMARY KEY ( date_id )
 );

CREATE TABLE "public".dim_exam ( 
	exam_id              integer  NOT NULL  ,
	exam_no              varchar(100)    ,
	CONSTRAINT pk_dim_exam PRIMARY KEY ( exam_id )
 );

CREATE TABLE "public".dim_list_agency ( 
	list_agency_id       integer  NOT NULL  ,
	list_agency_description varchar(100)    ,
	CONSTRAINT pk_dim_list_agency PRIMARY KEY ( list_agency_id )
 );

CREATE TABLE "public".dim_list_title ( 
	list_title_id        integer  NOT NULL  ,
	list_title_code      varchar(100)    ,
	list_title_description varchar(100)    ,
	CONSTRAINT pk_dim_list_title PRIMARY KEY ( list_title_id )
 );

CREATE TABLE "public".dim_parent_lgy_info ( 
	parent_lgy_id        integer  NOT NULL  ,
	parent_lgy_credit    varchar(100)    ,
	CONSTRAINT pk_dim_parent_lgy_info PRIMARY KEY ( parent_lgy_id )
 );

CREATE TABLE "public".dim_residency_info ( 
	residency_id         integer  NOT NULL  ,
	residency_credit     varchar(100)    ,
	CONSTRAINT pk_dim_residency_info PRIMARY KEY ( residency_id )
 );

CREATE TABLE "public".dim_sibling_credit_info ( 
	sibling_lgy_id       integer  NOT NULL  ,
	sibling_lgy_credit   varchar(100)    ,
	CONSTRAINT pk_dim_sibling_credit_info PRIMARY KEY ( sibling_lgy_id )
 );

CREATE TABLE "public".dim_veteran_credit_info ( 
	veteran_credit_id    integer  NOT NULL  ,
	veteran_credit       varchar(100)    ,
	CONSTRAINT pk_dim_veteran_credit_info PRIMARY KEY ( veteran_credit_id )
 );

CREATE TABLE "public".fact_candidate ( 
	fact_id              integer  NOT NULL  ,
	exam_id              integer    ,
	adj_final_avg        decimal(38,5)    ,
	list_title_id        integer    ,
	list_agency_id       integer    ,
	published_date_id    integer    ,
	est_date_id          integer    ,
	anniversary_date_id  integer    ,
	extension_date_id    integer    ,
	veteran_credit_id    integer    ,
	parent_lgy_id        integer    ,
	sibling_lgy_id       integer    ,
	residency_id         integer    ,
	load_date_id         integer    ,
	CONSTRAINT pk_fact_candidate PRIMARY KEY ( fact_id ),
	CONSTRAINT fk_fact_candidate_dim_exam FOREIGN KEY ( exam_id ) REFERENCES "public".dim_exam( exam_id )  ,
	CONSTRAINT fk_fact_candidate_dim_list_title FOREIGN KEY ( list_title_id ) REFERENCES "public".dim_list_title( list_title_id )  ,
	CONSTRAINT fk_fact_candidate_dim_list_agency FOREIGN KEY ( list_agency_id ) REFERENCES "public".dim_list_agency( list_agency_id )  ,
	CONSTRAINT fk_fact_candidate_dim_date FOREIGN KEY ( published_date_id ) REFERENCES "public".dim_date( date_id )  ,
	CONSTRAINT fk_fact_candidate_dim_date_0 FOREIGN KEY ( est_date_id ) REFERENCES "public".dim_date( date_id )  ,
	CONSTRAINT fk_fact_candidate_dim_date_1 FOREIGN KEY ( anniversary_date_id ) REFERENCES "public".dim_date( date_id )  ,
	CONSTRAINT fk_fact_candidate_dim_date_2 FOREIGN KEY ( extension_date_id ) REFERENCES "public".dim_date( date_id )  ,
	CONSTRAINT fk_fact_candidate_dim_veteran_credit_info FOREIGN KEY ( veteran_credit_id ) REFERENCES "public".dim_veteran_credit_info( veteran_credit_id )  ,
	CONSTRAINT fk_fact_candidate_dim_parent_lgy_info FOREIGN KEY ( parent_lgy_id ) REFERENCES "public".dim_parent_lgy_info( parent_lgy_id )  ,
	CONSTRAINT fk_fact_candidate_dim_sibling_credit_info FOREIGN KEY ( sibling_lgy_id ) REFERENCES "public".dim_sibling_credit_info( sibling_lgy_id )  ,
	CONSTRAINT fk_fact_candidate_dim_residency_info FOREIGN KEY ( residency_id ) REFERENCES "public".dim_residency_info( residency_id )  ,
	CONSTRAINT fk_fact_candidate_dim_date_3 FOREIGN KEY ( load_date_id ) REFERENCES "public".dim_date( date_id )  
 );