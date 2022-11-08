-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: trees
-- Generation Time: 2022-11-08 13:54:30.7820
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS radolan_temp_id_seq;

-- Table Definition
CREATE TABLE "public"."radolan_temp" (
    "id" int4 NOT NULL DEFAULT nextval('radolan_temp_id_seq'::regclass),
    "geometry" geometry(MultiPolygon,4326),
    "value" int2,
    "measured_at" timestamp,
    PRIMARY KEY ("id")
);

