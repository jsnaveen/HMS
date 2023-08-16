alter table address drop foreign key FKBB979BF41B3A746E;
alter table admission_log drop foreign key FKB381BE0EDEBB1344;
alter table admission_log drop foreign key FKB381BE0EBAF586AF;
alter table clinician_profile drop foreign key FKE21D5AD81B3A746E;
alter table clinician_profile_hospital drop foreign key FK118B87C13A4DDB38;
alter table clinician_profile_hospital drop foreign key FK118B87C1BAF586AF;
alter table clinician_profile_organization drop foreign key FK89EB5B3A9D4F558F;
alter table clinician_profile_organization drop foreign key FK89EB5B3AF354A31;
alter table clinician_profile_trust drop foreign key FK54287A312C638FA5;
alter table clinician_profile_trust drop foreign key FK54287A31274C15A8;
alter table hospital drop foreign key FKEDE6FE3A9D4F558F;
alter table patient_profile drop foreign key FK7F2D466F1B3A746E;
alter table patient_profile_hospital drop foreign key FK3785B60A1B7F8BCA;
alter table patient_profile_hospital drop foreign key FK3785B60ABAF586AF;
alter table trust_organization drop foreign key FK945E27BA9D4F558F;
alter table trust_organization drop foreign key FK945E27BA2C638FA5;
alter table user_role drop foreign key FK143BF46A1B3A746E;
alter table user_role drop foreign key FK143BF46ABB476FAF;
drop table if exists address;
drop table if exists admission_log;
drop table if exists clinician_profile;
drop table if exists clinician_profile_hospital;
drop table if exists clinician_profile_organization;
drop table if exists clinician_profile_trust;
drop table if exists hospital;
drop table if exists organization;
drop table if exists patient_profile;
drop table if exists patient_profile_hospital;
drop table if exists role;
drop table if exists trust;
drop table if exists trust_organization;
drop table if exists user_profile;
drop table if exists user_role;
create table address (id bigint not null auto_increment, version bigint not null, city varchar(255) not null, country varchar(255) not null, date_created datetime not null, last_updated datetime not null, postal_code varchar(255) not null, state varchar(255) not null, status integer not null, street_address_line1 varchar(255) not null, street_address_line2 varchar(255) not null, user_profile_id bigint not null, primary key (id)) ENGINE=InnoDB;
create table admission_log (id bigint not null auto_increment, version bigint not null, admission_notes varchar(255) not null, date_created datetime not null, hospital_id bigint not null, last_updated datetime not null, patient_admission_date_and_time datetime not null, patient_discharge_date_and_time datetime not null, patient_profile_id bigint not null, status integer not null, primary key (id)) ENGINE=InnoDB;
create table clinician_profile (id bigint not null auto_increment, version bigint not null, clinician_id varchar(255) not null unique, date_created datetime not null, last_updated datetime not null, license_number varchar(20) not null, status integer not null, user_profile_id bigint not null, primary key (id)) ENGINE=InnoDB;
create table clinician_profile_hospital (clinician_profile_hospitals_id bigint, hospital_id bigint) ENGINE=InnoDB;
create table clinician_profile_organization (clinician_profile_organizations_id bigint, organization_id bigint) ENGINE=InnoDB;
create table clinician_profile_trust (clinician_profile_trusts_id bigint, trust_id bigint) ENGINE=InnoDB;
create table hospital (id bigint not null auto_increment, version bigint not null, code varchar(255) not null unique, date_created datetime not null, last_updated datetime not null, location varchar(255) not null, name varchar(255) not null, organization_id bigint not null, status integer not null, primary key (id)) ENGINE=InnoDB;
create table organization (id bigint not null auto_increment, version bigint not null, code varchar(255) not null unique, date_created datetime not null, last_updated datetime not null, location varchar(255) not null, name varchar(255) not null, status integer not null, primary key (id)) ENGINE=InnoDB;
create table patient_profile (id bigint not null auto_increment, version bigint not null, date_created datetime not null, last_updated datetime not null, medical_record_no varchar(255) not null unique, patient_id varchar(255) not null unique, status integer not null, user_profile_id bigint not null, primary key (id)) ENGINE=InnoDB;
create table patient_profile_hospital (patient_profile_hospitals_id bigint, hospital_id bigint) ENGINE=InnoDB;
create table role (id bigint not null auto_increment, version bigint not null, code varchar(255) not null unique, date_created datetime not null, last_updated datetime not null, name varchar(255) not null, status integer not null, primary key (id)) ENGINE=InnoDB;
create table trust (id bigint not null auto_increment, version bigint not null, code varchar(255) not null unique, date_created datetime not null, last_updated datetime not null, location varchar(255) not null, name varchar(255) not null, status integer not null, primary key (id)) ENGINE=InnoDB;
create table trust_organization (id bigint not null auto_increment, version bigint not null, date_created datetime not null, last_updated datetime not null, organization_id bigint not null, status integer not null, trust_id bigint not null, primary key (id)) ENGINE=InnoDB;
create table user_profile (id bigint not null auto_increment, version bigint not null, access_token varchar(255) not null, date_created datetime not null, dob datetime not null, email varchar(255) not null, first_name varchar(20) not null, gender varchar(6) not null, last_name varchar(20) not null, last_updated datetime not null, password varchar(15) not null, phone_number varchar(255), status integer not null, title varchar(4) not null, uuid varchar(255) not null unique, primary key (id)) ENGINE=InnoDB;
create table user_role (id bigint not null auto_increment, version bigint not null, date_created datetime not null, last_updated datetime not null, role_id bigint not null, status integer not null, user_profile_id bigint not null, primary key (id)) ENGINE=InnoDB;
alter table address add index FKBB979BF41B3A746E (user_profile_id), add constraint FKBB979BF41B3A746E foreign key (user_profile_id) references user_profile (id);
alter table admission_log add index FKB381BE0EDEBB1344 (patient_profile_id), add constraint FKB381BE0EDEBB1344 foreign key (patient_profile_id) references patient_profile (id);
alter table admission_log add index FKB381BE0EBAF586AF (hospital_id), add constraint FKB381BE0EBAF586AF foreign key (hospital_id) references hospital (id);
alter table clinician_profile add index FKE21D5AD81B3A746E (user_profile_id), add constraint FKE21D5AD81B3A746E foreign key (user_profile_id) references user_profile (id);
alter table clinician_profile_hospital add index FK118B87C13A4DDB38 (clinician_profile_hospitals_id), add constraint FK118B87C13A4DDB38 foreign key (clinician_profile_hospitals_id) references clinician_profile (id);
alter table clinician_profile_hospital add index FK118B87C1BAF586AF (hospital_id), add constraint FK118B87C1BAF586AF foreign key (hospital_id) references hospital (id);
alter table clinician_profile_organization add index FK89EB5B3A9D4F558F (organization_id), add constraint FK89EB5B3A9D4F558F foreign key (organization_id) references organization (id);
alter table clinician_profile_organization add index FK89EB5B3AF354A31 (clinician_profile_organizations_id), add constraint FK89EB5B3AF354A31 foreign key (clinician_profile_organizations_id) references clinician_profile (id);
alter table clinician_profile_trust add index FK54287A312C638FA5 (trust_id), add constraint FK54287A312C638FA5 foreign key (trust_id) references trust (id);
alter table clinician_profile_trust add index FK54287A31274C15A8 (clinician_profile_trusts_id), add constraint FK54287A31274C15A8 foreign key (clinician_profile_trusts_id) references clinician_profile (id);
alter table hospital add index FKEDE6FE3A9D4F558F (organization_id), add constraint FKEDE6FE3A9D4F558F foreign key (organization_id) references organization (id);
alter table patient_profile add index FK7F2D466F1B3A746E (user_profile_id), add constraint FK7F2D466F1B3A746E foreign key (user_profile_id) references user_profile (id);
alter table patient_profile_hospital add index FK3785B60A1B7F8BCA (patient_profile_hospitals_id), add constraint FK3785B60A1B7F8BCA foreign key (patient_profile_hospitals_id) references patient_profile (id);
alter table patient_profile_hospital add index FK3785B60ABAF586AF (hospital_id), add constraint FK3785B60ABAF586AF foreign key (hospital_id) references hospital (id);
alter table trust_organization add index FK945E27BA9D4F558F (organization_id), add constraint FK945E27BA9D4F558F foreign key (organization_id) references organization (id);
alter table trust_organization add index FK945E27BA2C638FA5 (trust_id), add constraint FK945E27BA2C638FA5 foreign key (trust_id) references trust (id);
alter table user_role add index FK143BF46A1B3A746E (user_profile_id), add constraint FK143BF46A1B3A746E foreign key (user_profile_id) references user_profile (id);
alter table user_role add index FK143BF46ABB476FAF (role_id), add constraint FK143BF46ABB476FAF foreign key (role_id) references role (id);
