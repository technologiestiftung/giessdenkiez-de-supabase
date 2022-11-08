-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: trees
-- Generation Time: 2022-11-08 13:54:48.6430
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS radolan_harvester_id_seq;

-- Table Definition
CREATE TABLE "public"."radolan_harvester" (
    "id" int4 NOT NULL DEFAULT nextval('radolan_harvester_id_seq'::regclass),
    "collection_date" date,
    "start_date" timestamp,
    "end_date" timestamp,
    PRIMARY KEY ("id")
);

