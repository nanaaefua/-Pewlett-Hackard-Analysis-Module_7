-- Table: public.retirement_info

-- DROP TABLE IF EXISTS public.retirement_info;

CREATE TABLE IF NOT EXISTS public.retirement_info
(
    emp_no integer,
    first_name character varying COLLATE pg_catalog."default",
    last_name character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.retirement_info
    OWNER to postgres;