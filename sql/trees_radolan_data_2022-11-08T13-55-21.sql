-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: trees
-- Generation Time: 2022-11-08 13:55:28.1580
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS radolan_data_id_seq;

-- Table Definition
CREATE TABLE "public"."radolan_data" (
    "id" int4 NOT NULL DEFAULT nextval('radolan_data_id_seq'::regclass),
    "measured_at" timestamp,
    "value" int2,
    "geom_id" int2,
    PRIMARY KEY ("id")
);

