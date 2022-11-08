-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: trees
-- Generation Time: 2022-11-08 13:53:59.2910
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS trees_adopted_id_seq;

-- Table Definition
CREATE TABLE "public"."trees_adopted" (
    "id" int4 NOT NULL DEFAULT nextval('trees_adopted_id_seq'::regclass),
    "uuid" text,
    "tree_id" text NOT NULL,
    CONSTRAINT "fk_trees_adopted_trees" FOREIGN KEY ("tree_id") REFERENCES "public"."trees"("id"),
    PRIMARY KEY ("id")
);

