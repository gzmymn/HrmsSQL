-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.abilities
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    ability_name character varying(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.ability_candidates
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    ability_id integer NOT NULL,
    candidate_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.activation_codes
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    activation_code character varying(50) NOT NULL,
    is_confirmed boolean NOT NULL,
    activation_date timestamp without time zone,
    created_date timestamp without time zone,
    is_deleted boolean NOT NULL,
    uid character varying(50) NOT NULL,
    expration_date timestamp without time zone NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.candidates
(
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    national_identity character varying(11) NOT NULL,
    date_of_birth date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.cities
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    city_name character varying(20) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.cv_details
(
    id integer NOT NULL,
    candidate_id integer NOT NULL,
    image_url character varying(255),
    description character varying(500),
    uploaded_date timestamp with time zone[],
    PRIMARY KEY (id)
);

CREATE TABLE public.departments
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    department_name character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employees
(
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employers
(
    id integer NOT NULL,
    company_name character varying(50) NOT NULL,
    web_address character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employers_activation_by_employees
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    employer_id integer NOT NULL,
    employee_id integer NOT NULL,
    is_confirmed boolean NOT NULL,
    confirmed_date timestamp without time zone NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    is_deleted boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_positions
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "position" character varying(50) NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    uid character varying(50) NOT NULL,
    is_deleted boolean NOT NULL,
    is_activated boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_postings
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    employer_id integer NOT NULL,
    job_position_id integer NOT NULL,
    job_definition text NOT NULL,
    city_id integer NOT NULL,
    quota integer NOT NULL,
    min_salary double precision NOT NULL,
    max_salary double precision NOT NULL,
    created_date timestamp without time zone,
    application_deadline timestamp without time zone NOT NULL,
    is_deleted boolean NOT NULL,
    is_activated boolean NOT NULL,
    deleted_date timestamp without time zone,
    uid character varying(50),
    PRIMARY KEY (id)
);

CREATE TABLE public.language_candidates
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    language_id integer NOT NULL,
    language_level_id integer NOT NULL,
    candidate_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.language_levels
(
    id integer NOT NULL,
    language_level_name character varying(2) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.languages
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    language_name character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.school_candidates
(
    id integer NOT NULL,
    candidate_id integer NOT NULL,
    school_department_id integer NOT NULL,
    date_of_entry date NOT NULL,
    date_of_graduation date,
    PRIMARY KEY (id)
);

CREATE TABLE public.school_departments
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    school_id integer NOT NULL,
    department_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.schools
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    school_name character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.social_media_link_types
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    link_type character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.social_medias
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    candidate_id integer NOT NULL,
    link_type_id integer NOT NULL,
    link character varying(1010) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.users
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email character varying(30) NOT NULL,
    password character varying(20) NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    uid character varying(50) NOT NULL,
    is_deleted boolean,
    is_activated boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.workplace_candidates
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    workplace_id integer NOT NULL,
    candidate_id integer NOT NULL,
    job_position_id integer NOT NULL,
    date_of_start date NOT NULL,
    date_of_leave date,
    PRIMARY KEY (id)
);

CREATE TABLE public.workplaces
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    workplace_name character varying(150) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public.ability_candidates
    ADD FOREIGN KEY (ability_id)
    REFERENCES public.abilities (id)
    NOT VALID;


ALTER TABLE public.ability_candidates
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.activation_codes
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.candidates
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.cv_details
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.employees
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employers
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employers_activation_by_employees
    ADD FOREIGN KEY (employee_id)
    REFERENCES public.employees (id)
    NOT VALID;


ALTER TABLE public.employers_activation_by_employees
    ADD FOREIGN KEY (employer_id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.job_postings
    ADD FOREIGN KEY (city_id)
    REFERENCES public.cities (id)
    NOT VALID;


ALTER TABLE public.job_postings
    ADD FOREIGN KEY (employer_id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.job_postings
    ADD FOREIGN KEY (job_position_id)
    REFERENCES public.job_positions (id)
    NOT VALID;


ALTER TABLE public.language_candidates
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.language_candidates
    ADD FOREIGN KEY (language_id)
    REFERENCES public.languages (id)
    NOT VALID;


ALTER TABLE public.language_candidates
    ADD FOREIGN KEY (language_level_id)
    REFERENCES public.language_levels (id)
    NOT VALID;


ALTER TABLE public.school_candidates
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.school_candidates
    ADD FOREIGN KEY (school_department_id)
    REFERENCES public.school_departments (id)
    NOT VALID;


ALTER TABLE public.school_departments
    ADD FOREIGN KEY (department_id)
    REFERENCES public.departments (id)
    NOT VALID;


ALTER TABLE public.school_departments
    ADD FOREIGN KEY (school_id)
    REFERENCES public.schools (id)
    NOT VALID;


ALTER TABLE public.social_medias
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.social_medias
    ADD FOREIGN KEY (link_type_id)
    REFERENCES public.social_media_link_types (id)
    NOT VALID;


ALTER TABLE public.workplace_candidates
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.workplace_candidates
    ADD FOREIGN KEY (job_position_id)
    REFERENCES public.job_positions (id)
    NOT VALID;


ALTER TABLE public.workplace_candidates
    ADD FOREIGN KEY (workplace_id)
    REFERENCES public.workplaces (id)
    NOT VALID;

END;
