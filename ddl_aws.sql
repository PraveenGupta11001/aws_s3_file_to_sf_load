CREATE OR REPLACE FILE FORMAT csv_format
  TYPE = 'CSV'
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
  RECORD_DELIMITER = '\n'
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1; 

create or replace stage fs_stage 
file_format = csv_format;
    
list @fs_stage;



CREATE OR REPLACE STAGE s3_stage
  URL = 's3://praveeng-s3/'
  CREDENTIALS = (
    AWS_KEY_ID='XXXXXXXXXXXXXXXXX',
    AWS_SECRET_KEY='XXXXXXXXXXXCCXXXX'
);

list @s3_stage;
    
select $1 as id, $2 as name, $3 as nationality, $4 as city, $5 as latitude, $6 as longitude, $7 as gender, $8 as ethinic_group, $9 as age, $10 as english_grade, $11 as math_grade, $12 as science_grade, $13 as language_grade, $14 as portfolio_rating, $15 as coverletter_rating, $16  as refletter_rating from @s3_stage/chunked_csv/student_dataset_2.csv;




create or replace table aws_student_dataset_dir (
    filename varchar,
    id varchar, 
    name varchar, 
    nationality varchar, 
    city varchar, 
    latitude varchar, 
    longitude varchar, 
    gender varchar, 
    ethinic_group varchar, 
    age varchar, 
    english_grade varchar, 
    math_grade varchar, 
    science_grade varchar, 
    language_grade varchar, 
    portfolio_rating varchar, 
    coverletter_rating varchar,
    REFLETTER_RATING varchar,
    copy_date varchar
);

select * from aws_student_dataset_dir;


create or replace table aws_student_dataset_fs (
    filename varchar,
    id varchar, 
    name varchar, 
    nationality varchar, 
    city varchar, 
    latitude varchar, 
    longitude varchar, 
    gender varchar, 
    ethinic_group varchar, 
    age varchar, 
    english_grade varchar, 
    math_grade varchar, 
    science_grade varchar, 
    language_grade varchar, 
    portfolio_rating varchar, 
    coverletter_rating varchar,
    REFLETTER_RATING varchar,
    copy_date varchar
);

select * from aws_student_dataset_fs;



create or replace table aws_student_dataset_s3 (
    filename varchar,
    id varchar, 
    name varchar, 
    nationality varchar, 
    city varchar, 
    latitude varchar, 
    longitude varchar, 
    gender varchar, 
    ethinic_group varchar, 
    age varchar, 
    english_grade varchar, 
    math_grade varchar, 
    science_grade varchar, 
    language_grade varchar, 
    portfolio_rating varchar, 
    coverletter_rating varchar,
    REFLETTER_RATING varchar,
    copy_date varchar
);

select * from aws_student_dataset_s3;
