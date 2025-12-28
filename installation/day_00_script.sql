-- DROP SCHEMA master;

CREATE SCHEMA master AUTHORIZATION postgres;
-- master.app_config definition

-- Drop table

-- DROP TABLE master.app_config;

CREATE TABLE master.app_config (
	company_code varchar(5) NOT NULL,
	config_code varchar(15) NOT NULL,
	config_value varchar(25) NOT NULL,
	config_desc varchar(100) NULL,
	config_level varchar(1) NOT NULL,
	status bool DEFAULT false NULL,
	upd_user varchar(5) NULL,
	upd_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT app_config_pkey PRIMARY KEY (config_code)
);

-- Permissions

ALTER TABLE master.app_config OWNER TO postgres;
GRANT ALL ON TABLE master.app_config TO postgres;


-- master.mst_admin_user definition

-- Drop table

-- DROP TABLE master.mst_admin_user;

CREATE TABLE master.mst_admin_user (
	user_code varchar(5) NOT NULL,
	username varchar(100) NOT NULL,
	active bool NOT NULL,
	"password" varchar(255) NULL,
	user_type varchar(1) NULL,
	CONSTRAINT app_admin_user_pkey PRIMARY KEY (user_code)
);

-- Permissions

ALTER TABLE master.mst_admin_user OWNER TO postgres;
GRANT ALL ON TABLE master.mst_admin_user TO postgres;


-- master.mst_app_user definition

-- Drop table

-- DROP TABLE master.mst_app_user;

CREATE TABLE master.mst_app_user (
	company_code varchar(5) NOT NULL,
	user_code varchar(5) NOT NULL,
	username varchar(100) NOT NULL,
	active bool NOT NULL,
	email varchar(100) NULL,
	"password" varchar(255) NULL,
	otp varchar(6) NULL,
	user_type varchar(1) NULL,
	upd_user varchar(30) NULL,
	upd_date date DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT app_user_pkey PRIMARY KEY (company_code, user_code)
);

-- Permissions

ALTER TABLE master.mst_app_user OWNER TO postgres;
GRANT ALL ON TABLE master.mst_app_user TO postgres;


-- master.mst_company definition

-- Drop table

-- DROP TABLE master.mst_company;

CREATE TABLE master.mst_company (
	company_code varchar(5) NOT NULL,
	company_name varchar(50) NOT NULL,
	domain_name varchar(50) NOT NULL,
	short_name varchar(25) NOT NULL,
	start_date date NOT NULL,
	address varchar(200) NOT NULL,
	state_code varchar(2) NOT NULL,
	pin varchar(6) NOT NULL,
	mobile varchar(10) NOT NULL,
	whatsapp varchar(13) NULL,
	email varchar(50) NOT NULL,
	website varchar(50) NULL,
	pan varchar(10) NOT NULL,
	cin varchar(21) NOT NULL,
	gst_regn_type varchar(1) NOT NULL,
	gstin_no varchar(15) NULL,
	gst_filling_freq varchar(1) NULL,
	contact_person varchar(50) NOT NULL,
	status bool DEFAULT false NULL,
	upd_user varchar(30) NULL,
	upd_date date DEFAULT CURRENT_TIMESTAMP NOT NULL,
	circle varchar(100) NULL,
	port int4 NULL,
	CONSTRAINT mst_company_pk PRIMARY KEY (company_code)
);

-- Permissions

ALTER TABLE master.mst_company OWNER TO postgres;
GRANT ALL ON TABLE master.mst_company TO postgres;


-- master.mst_customer definition

-- Drop table

-- DROP TABLE master.mst_customer;

CREATE TABLE master.mst_customer (
	company_code varchar(5) NOT NULL,
	customer_code varchar(10) NOT NULL,
	customer_name varchar(50) NULL,
	address varchar(300) NULL,
	state varchar(50) NULL,
	country varchar(50) NULL,
	pin varchar(6) NULL,
	status bool DEFAULT false NULL,
	upd_user varchar(5) NULL,
	upd_date timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	email varchar(50) NULL,
	phone_number varchar(10) NULL,
	CONSTRAINT mst_customer_pk PRIMARY KEY (company_code, customer_code)
);

-- Permissions

ALTER TABLE master.mst_customer OWNER TO postgres;
GRANT ALL ON TABLE master.mst_customer TO postgres;


-- master.mst_data_sequence definition

-- Drop table

-- DROP TABLE master.mst_data_sequence;

CREATE TABLE master.mst_data_sequence (
	company_code varchar(5) NOT NULL,
	tablename varchar(200) NOT NULL,
	prefix varchar(10) NULL,
	counter int8 NULL,
	padding int8 NULL,
	CONSTRAINT data_sequence_pkey PRIMARY KEY (company_code, tablename)
);

-- Permissions

ALTER TABLE master.mst_data_sequence OWNER TO postgres;
GRANT ALL ON TABLE master.mst_data_sequence TO postgres;


-- master.mst_other_master definition

-- Drop table

-- DROP TABLE master.mst_other_master;

CREATE TABLE master.mst_other_master (
	company_code varchar(5) NOT NULL,
	other_master_group varchar(10) NOT NULL,
	other_master_name varchar(25) NOT NULL,
	order_by varchar(3) NULL,
	status bool DEFAULT false NULL,
	upd_user varchar(5) NULL,
	upd_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT mst_other_master_pk PRIMARY KEY (company_code, other_master_group, other_master_name)
);

-- Permissions

ALTER TABLE master.mst_other_master OWNER TO postgres;
GRANT ALL ON TABLE master.mst_other_master TO postgres;


-- master.mst_outlet definition

-- Drop table

-- DROP TABLE master.mst_outlet;

CREATE TABLE master.mst_outlet (
	outlet_code varchar(5) NOT NULL,
	outlet_name varchar(50) NOT NULL,
	company_code varchar(5) NOT NULL,
	short_name varchar(25) NULL,
	start_date timestamp(6) NOT NULL,
	address varchar(200) NULL,
	state_code varchar(2) NOT NULL,
	pin varchar(6) NOT NULL,
	mobile varchar(10) NOT NULL,
	whatsapp varchar(13) NULL,
	email varchar(50) NOT NULL,
	website varchar(50) NULL,
	pan varchar(10) NOT NULL,
	cin varchar(21) NULL,
	fssai_no varchar(25) NULL,
	fssai_exp_date timestamp(6) NULL,
	gstin_no varchar(15) NULL,
	contact_person varchar(50) NOT NULL,
	status bool DEFAULT false NULL,
	upd_user varchar(30) NULL,
	upd_date date DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT mst_outlet_pk PRIMARY KEY (company_code, outlet_code)
);

-- Permissions

ALTER TABLE master.mst_outlet OWNER TO postgres;
GRANT ALL ON TABLE master.mst_outlet TO postgres;


-- master.mst_product definition

-- Drop table

-- DROP TABLE master.mst_product;

CREATE TABLE master.mst_product (
	company_code varchar(5) NOT NULL,
	product_code varchar(5) NOT NULL,
	alt_product_code varchar(5) NULL,
	product_name varchar(50) NOT NULL,
	alt_product_name varchar(100) NULL,
	category varchar(50) NULL,
	sub_category varchar(50) NULL,
	brand varchar(50) NULL,
	gst_percentage numeric(6, 2) NULL,
	cess_percentage numeric(6, 2) NULL,
	hsn_code varchar(8) NULL,
	fixed_selling_price numeric(6, 2) NULL,
	per_off numeric(6, 2) NULL,
	price_off numeric(6, 2) NULL,
	mrp numeric(6, 2) NULL,
	image_name varchar(50) NULL,
	temp_stock varchar(3) NULL,
	start_date date NOT NULL,
	end_date date NULL,
	add_information varchar(1500) NULL,
	home_page_view varchar(2) NULL,
	max_qty varchar(3) NULL,
	status bool DEFAULT false NULL,
	upd_user varchar(5) NULL,
	upd_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT mst_product_pkey PRIMARY KEY (company_code, product_code)
);

-- Permissions

ALTER TABLE master.mst_product OWNER TO postgres;
GRANT ALL ON TABLE master.mst_product TO postgres;


-- master.mst_role definition

-- Drop table

-- DROP TABLE master.mst_role;

CREATE TABLE master.mst_role (
	company_code varchar(5) NOT NULL,
	role_name varchar(50) NOT NULL,
	upd_user varchar(30) NULL,
	upd_date date DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT role_pkey PRIMARY KEY (company_code, role_name)
);

-- Permissions

ALTER TABLE master.mst_role OWNER TO postgres;
GRANT ALL ON TABLE master.mst_role TO postgres;


-- master.mst_user definition

-- Drop table

-- DROP TABLE master.mst_user;

CREATE TABLE master.mst_user (
	company_code varchar(5) NOT NULL,
	outlet_code varchar(5) NULL,
	user_code varchar(5) NOT NULL,
	user_name varchar(15) NOT NULL,
	"password" varchar(15) NOT NULL,
	max_login_attempt varchar(1) NOT NULL,
	status bool DEFAULT false NULL,
	upd_user varchar(5) NULL,
	upd_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT mst_user_pk PRIMARY KEY (company_code, user_code)
);

-- Permissions

ALTER TABLE master.mst_user OWNER TO postgres;
GRANT ALL ON TABLE master.mst_user TO postgres;


-- master.mst_user_permission definition

-- Drop table

-- DROP TABLE master.mst_user_permission;

CREATE TABLE master.mst_user_permission (
	company_code varchar(5) NOT NULL,
	user_code varchar(5) NOT NULL,
	menu_code varchar(5) NOT NULL,
	view_data bool DEFAULT false NULL,
	insert_data bool DEFAULT false NULL,
	update_data bool DEFAULT false NULL,
	auth_data bool DEFAULT false NULL,
	status bool DEFAULT false NULL,
	upd_user varchar(5) NULL,
	upd_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT mst_user_permission_pk PRIMARY KEY (company_code, user_code, menu_code)
);

-- Permissions

ALTER TABLE master.mst_user_permission OWNER TO postgres;
GRANT ALL ON TABLE master.mst_user_permission TO postgres;


-- master.mst_user_role definition

-- Drop table

-- DROP TABLE master.mst_user_role;

CREATE TABLE master.mst_user_role (
	company_code varchar(5) NOT NULL,
	user_code varchar(5) NOT NULL,
	role_name varchar(50) NOT NULL,
	upd_user varchar(30) NULL,
	upd_date date DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT user_role_pkey PRIMARY KEY (company_code, user_code, role_name)
);

-- Permissions

ALTER TABLE master.mst_user_role OWNER TO postgres;
GRANT ALL ON TABLE master.mst_user_role TO postgres;


-- master.sys_po_data definition

-- Drop table

-- DROP TABLE master.sys_po_data;

CREATE TABLE master.sys_po_data (
	po_group_code varchar(15) NOT NULL,
	po_data_code varchar(15) NOT NULL,
	po_data_desc varchar(100) NULL,
	status bool DEFAULT false NULL,
	upd_user varchar(30) NULL,
	upd_date date DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT sys_po_data_pk PRIMARY KEY (po_group_code, po_data_code)
);

-- Permissions

ALTER TABLE master.sys_po_data OWNER TO postgres;
GRANT ALL ON TABLE master.sys_po_data TO postgres;


-- master.sys_po_group definition

-- Drop table

-- DROP TABLE master.sys_po_group;

CREATE TABLE master.sys_po_group (
	po_group_code varchar(15) NOT NULL,
	po_group_desc varchar(100) NULL,
	status bool DEFAULT false NULL,
	upd_user varchar(30) NULL,
	upd_date date DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT sys_po_group_pk PRIMARY KEY (po_group_code)
);

-- Permissions

ALTER TABLE master.sys_po_group OWNER TO postgres;
GRANT ALL ON TABLE master.sys_po_group TO postgres;


-- master.tran_data_sequence definition

-- Drop table

-- DROP TABLE master.tran_data_sequence;

CREATE TABLE master.tran_data_sequence (
	company_code varchar(5) NOT NULL,
	tablename varchar(200) NOT NULL,
	prefix varchar(10) NULL,
	counter int8 NULL,
	padding int8 NULL,
	CONSTRAINT tran_data_sequence_pkey PRIMARY KEY (company_code, tablename)
);

-- Permissions

ALTER TABLE master.tran_data_sequence OWNER TO postgres;
GRANT ALL ON TABLE master.tran_data_sequence TO postgres;


-- master.tran_order definition

-- Drop table

-- DROP TABLE master.tran_order;

CREATE TABLE master.tran_order (
	company_code varchar(5) NOT NULL,
	order_no varchar(15) NOT NULL,
	order_date timestamp NULL,
	customer_code varchar(10) NOT NULL,
	customer_name varchar(50) NULL,
	alt_customer_code varchar(10) NULL,
	alt_customer_name varchar(50) NULL,
	mobile varchar(10) NOT NULL,
	email varchar(50) NULL,
	gstin_no varchar(15) NULL,
	pin varchar(6) NULL,
	remark varchar(200) NULL,
	status varchar(15) NULL,
	cancellation_date timestamp NULL,
	schedule_delivery_date timestamp NULL,
	delivery_date timestamp NULL,
	delivered_by varchar(50) NULL,
	delivery_address varchar(400) NULL,
	delivered_to varchar(50) NULL,
	alt_mobile varchar(10) NULL,
	bill_no varchar(16) NULL,
	upd_user varchar(5) NULL,
	upd_date timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	ref_order_no varchar(15) NULL,
	"version" int4 DEFAULT 1 NOT NULL,
	CONSTRAINT tran_order_pk PRIMARY KEY (company_code, order_no, version)
);

-- Permissions

ALTER TABLE master.tran_order OWNER TO postgres;
GRANT ALL ON TABLE master.tran_order TO postgres;


-- master.tran_order_detail definition

-- Drop table

-- DROP TABLE master.tran_order_detail;

CREATE TABLE master.tran_order_detail (
	company_code varchar(5) NOT NULL,
	order_no varchar(16) NOT NULL,
	product_code varchar(5) NOT NULL,
	product_name varchar(50) NULL,
	alt_product_code varchar(10) NULL,
	alt_product_name varchar(100) NULL,
	order_qty numeric NOT NULL,
	fixed_selling_price numeric(6, 2) NULL,
	per_off numeric(6, 2) NULL,
	price_off numeric(6, 2) NULL,
	mrp numeric(6, 2) NULL,
	net_selling_price numeric(6, 2) NULL,
	billed_qty numeric NULL,
	bill_mrp numeric NULL,
	bill_selling_price numeric NULL,
	hsn_code varchar(8) NULL,
	gst_percentage numeric(6, 2) NULL,
	cess_percentage numeric(6, 2) NULL,
	upd_user varchar(5) NULL,
	upd_date timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	image_name varchar(50) NULL,
	"version" int4 DEFAULT 1 NOT NULL,
	id varchar(100) NOT NULL,
	CONSTRAINT tran_order_detail_pk PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE master.tran_order_detail OWNER TO postgres;
GRANT ALL ON TABLE master.tran_order_detail TO postgres;


-- master.tran_order_payment definition

-- Drop table

-- DROP TABLE master.tran_order_payment;

CREATE TABLE master.tran_order_payment (
	company_code varchar(5) NOT NULL,
	order_no varchar(16) NOT NULL,
	status varchar(15) NULL,
	remark varchar(200) NULL,
	payment_mode varchar(15) NULL,
	rzr_order_id varchar(50) NULL,
	rzr_order_status varchar(50) NULL,
	rzr_payment_id varchar(50) NULL,
	rzr_sign varchar(100) NULL,
	payment_date date NULL,
	payment_amt numeric NULL,
	payment_id varchar(50) NOT NULL,
	upd_user varchar(5) NULL,
	upd_date timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	"version" int4 DEFAULT 1 NOT NULL,
	id varchar(100) NOT NULL,
	CONSTRAINT tran_order_payment_pk PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE master.tran_order_payment OWNER TO postgres;
GRANT ALL ON TABLE master.tran_order_payment TO postgres;




-- Permissions

GRANT ALL ON SCHEMA master TO postgres;