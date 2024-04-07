CREATE SCHEMA draft;

CREATE TABLE draft.dim_candidate_info ( 
	candidate_id int64 NOT NULL  ,
	first_name string  ,
	MI string  ,
	last_name string  
 );

ALTER TABLE draft.dim_candidate_info ADD PRIMARY KEY ( candidate_id )  NOT ENFORCED;

CREATE TABLE draft.dim_date ( 
	date_id int64 NOT NULL  ,
	date_original_format VARCHAR(100)  ,
	date_iso_format date  ,
	year int64  ,
	month int64  ,
	quarter int64  ,
	day_number int64  ,
	month_name string  ,
	day_name string  ,
	week_of_year int64  ,
	week_of_month int64  
 );

ALTER TABLE draft.dim_date ADD PRIMARY KEY ( date_id )  NOT ENFORCED;

CREATE TABLE draft.dim_exam ( 
	exam_id int64 NOT NULL  ,
	eaxm_no VARCHAR(100)  
 );

ALTER TABLE draft.dim_exam ADD PRIMARY KEY ( exam_id )  NOT ENFORCED;

CREATE TABLE draft.dim_list ( 
	list_id int64 NOT NULL  ,
	list_no VARCHAR(100)  ,
	group_no VARCHAR(100)  ,
	list_div_code VARCHAR(100)  
 );

ALTER TABLE draft.dim_list ADD PRIMARY KEY ( list_id )  NOT ENFORCED;

CREATE TABLE draft.dim_list_agency ( 
	list_agency_id int64 NOT NULL  ,
	list_agency_code VARCHAR(100)  ,
	list_agency_desc VARCHAR(100)  
 );

ALTER TABLE draft.dim_list_agency ADD PRIMARY KEY ( list_agency_id )  NOT ENFORCED;

CREATE TABLE draft.dim_list_title ( 
	list_title_id int64 NOT NULL  ,
	list_title_code VARCHAR(100)  ,
	list_title_description VARCHAR(150)  
 );

ALTER TABLE draft.dim_list_title ADD PRIMARY KEY ( list_title_id )  NOT ENFORCED;

CREATE TABLE draft.dim_parent_lgy_info ( 
	parent_lgy_id int64 NOT NULL  ,
	parent_lgy_credit VARCHAR(100)  
 );

ALTER TABLE draft.dim_parent_lgy_info ADD PRIMARY KEY ( parent_lgy_id )  NOT ENFORCED;

CREATE TABLE draft.dim_residency_info ( 
	residency_id int64 NOT NULL  ,
	residency_credit VARCHAR(100)  
 );

ALTER TABLE draft.dim_residency_info ADD PRIMARY KEY ( residency_id )  NOT ENFORCED;

CREATE TABLE draft.dim_sibling_credit_info ( 
	sibling_lgy_id int64 NOT NULL  ,
	sibling_lgy_credit VARCHAR(100)  
 );

ALTER TABLE draft.dim_sibling_credit_info ADD PRIMARY KEY ( sibling_lgy_id )  NOT ENFORCED;

CREATE TABLE draft.dim_veteran_credit_info ( 
	veteran_credit_id int64 NOT NULL  ,
	veteran_credit VARCHAR(100)  
 );

ALTER TABLE draft.dim_veteran_credit_info ADD PRIMARY KEY ( veteran_credit_id )  NOT ENFORCED;

CREATE TABLE draft.fact_candidate ( 
	fact_id int64 NOT NULL  ,
	exam_id int64  ,
	adj_final_avg numeric  ,
	list_id int64  ,
	list_title_id int64  ,
	list_agency_id int64  ,
	published_date_id int64  ,
	est_date_id int64  ,
	anniversary_date_id int64  ,
	extension_date_id int64  ,
	veteran_credit_id int64  ,
	parent_lgy_id int64  ,
	sibling_lgy_id int64  ,
	residency_id int64  ,
	load_date_id int64  
 );

ALTER TABLE draft.fact_candidate ADD PRIMARY KEY ( fact_id )  NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_exam FOREIGN KEY ( exam_id ) REFERENCES draft.dim_exam( exam_id ) NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_list FOREIGN KEY ( list_id ) REFERENCES draft.dim_list( list_id ) NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_list_title FOREIGN KEY ( list_title_id ) REFERENCES draft.dim_list_title( list_title_id ) NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_list_agency FOREIGN KEY ( list_agency_id ) REFERENCES draft.dim_list_agency( list_agency_id ) NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_date FOREIGN KEY ( published_date_id ) REFERENCES draft.dim_date( date_id ) NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_date_0 FOREIGN KEY ( est_date_id ) REFERENCES draft.dim_date( date_id ) NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_date_1 FOREIGN KEY ( anniversary_date_id ) REFERENCES draft.dim_date( date_id ) NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_date_2 FOREIGN KEY ( extension_date_id ) REFERENCES draft.dim_date( date_id ) NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_veteran_credit_info FOREIGN KEY ( veteran_credit_id ) REFERENCES draft.dim_veteran_credit_info( veteran_credit_id ) NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_parent_lgy_info FOREIGN KEY ( parent_lgy_id ) REFERENCES draft.dim_parent_lgy_info( parent_lgy_id ) NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_sibling_credit_info FOREIGN KEY ( sibling_lgy_id ) REFERENCES draft.dim_sibling_credit_info( sibling_lgy_id ) NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_residency_info FOREIGN KEY ( residency_id ) REFERENCES draft.dim_residency_info( residency_id ) NOT ENFORCED;

ALTER TABLE draft.fact_candidate ADD CONSTRAINT fk_fact_candidate_dim_date_3 FOREIGN KEY ( load_date_id ) REFERENCES draft.dim_date( date_id ) NOT ENFORCED;
