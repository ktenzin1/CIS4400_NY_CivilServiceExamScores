CREATE SCHEMA cis4400_hw1;

CREATE TABLE `avian-silicon-418821`.cis4400_hw1.dim_candidate_exam ( 
	exam_id string NOT NULL  ,
	first_name string  ,
	middle_initial string  ,
	last_name string  
 );

ALTER TABLE `avian-silicon-418821`.cis4400_hw1.dim_candidate_exam ADD PRIMARY KEY ( exam_id )  NOT ENFORCED;

CREATE TABLE `avian-silicon-418821`.cis4400_hw1.dim_date ( 
	date_id int64 NOT NULL  ,
	date_iso_format date  ,
	year_no int64  ,
	month_no int64  ,
	quarter_no int64  ,
	day_number int64  ,
	month_name string  ,
	hour_no int64  ,
	day_name string  
 );

ALTER TABLE `avian-silicon-418821`.cis4400_hw1.dim_date ADD PRIMARY KEY ( date_id ) NOT ENFORCED NOT ENFORCED;

CREATE TABLE `avian-silicon-418821`.cis4400_hw1.dim_list_title ( 
	list_title_id string NOT NULL  ,
	list_title_description string  
 );

ALTER TABLE `avian-silicon-418821`.cis4400_hw1.dim_list_title ADD PRIMARY KEY ( list_title_id )  NOT ENFORCED;

CREATE TABLE `avian-silicon-418821`.cis4400_hw1.facts_candidate ( 
	fact_id int64 NOT NULL  ,
	adj_final_avg numeric  ,
	published_date_id int64  ,
	est_date_id int64  ,
	anniversary_date_id int64  ,
	extension_date_id int64  ,
	load_date_id int64  ,
	candidate_id_ int64  ,
	veteran_credit string  ,
	parent_lgy_credit string  ,
	sibling_lgy_credit string  ,
	residency_credit string  ,
	list_agency_description string  ,
	exam_id string  ,
	list_title_id string  
 );

ALTER TABLE `avian-silicon-418821`.cis4400_hw1.facts_candidate ADD PRIMARY KEY ( fact_id ) NOT ENFORCED NOT ENFORCED;

ALTER TABLE `avian-silicon-418821`.cis4400_hw1.facts_candidate ADD CONSTRAINT fk_facts_candidate_dim_date FOREIGN KEY ( published_date_id ) REFERENCES `avian-silicon-418821`.cis4400_hw1.dim_date( date_id ) NOT ENFORCED;

ALTER TABLE `avian-silicon-418821`.cis4400_hw1.facts_candidate ADD CONSTRAINT fk_facts_candidate_dim_date_0 FOREIGN KEY ( est_date_id ) REFERENCES `avian-silicon-418821`.cis4400_hw1.dim_date( date_id ) NOT ENFORCED;

ALTER TABLE `avian-silicon-418821`.cis4400_hw1.facts_candidate ADD CONSTRAINT fk_facts_candidate_dim_date_1 FOREIGN KEY ( anniversary_date_id ) REFERENCES `avian-silicon-418821`.cis4400_hw1.dim_date( date_id ) NOT ENFORCED;

ALTER TABLE `avian-silicon-418821`.cis4400_hw1.facts_candidate ADD CONSTRAINT fk_facts_candidate_dim_date_2 FOREIGN KEY ( extension_date_id ) REFERENCES `avian-silicon-418821`.cis4400_hw1.dim_date( date_id ) NOT ENFORCED;

ALTER TABLE `avian-silicon-418821`.cis4400_hw1.facts_candidate ADD CONSTRAINT fk_facts_candidate_dim_date_3 FOREIGN KEY ( load_date_id ) REFERENCES `avian-silicon-418821`.cis4400_hw1.dim_date( date_id ) NOT ENFORCED;

ALTER TABLE `avian-silicon-418821`.cis4400_hw1.facts_candidate ADD CONSTRAINT fk_facts_candidate_dim_candidate_exam FOREIGN KEY ( exam_id ) REFERENCES `avian-silicon-418821`.cis4400_hw1.dim_candidate_exam( exam_id ) NOT ENFORCED;

ALTER TABLE `avian-silicon-418821`.cis4400_hw1.facts_candidate ADD CONSTRAINT fk_facts_candidate_dim_list_title FOREIGN KEY ( list_title_id ) REFERENCES `avian-silicon-418821`.cis4400_hw1.dim_list_title( list_title_id ) NOT ENFORCED;
