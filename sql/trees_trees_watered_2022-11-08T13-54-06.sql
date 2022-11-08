-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: trees
-- Generation Time: 2022-11-08 13:54:14.4570
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS trees_watered_id_seq;

-- Table Definition
CREATE TABLE "public"."trees_watered" (
    "time" text NOT NULL,
    "uuid" text,
    "amount" numeric CHECK (amount > (0)::numeric),
    "timestamp" timestamptz,
    "username" text,
    "id" int4 NOT NULL DEFAULT nextval('trees_watered_id_seq'::regclass),
    "tree_id" text NOT NULL,
    CONSTRAINT "fk_trees_watered_trees" FOREIGN KEY ("tree_id") REFERENCES "public"."trees"("id"),
    PRIMARY KEY ("id")
);

