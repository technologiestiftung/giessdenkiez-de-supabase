-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: trees
-- Generation Time: 2022-11-08 13:55:13.4580
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS radolan_geometry_id_seq;

-- Table Definition
CREATE TABLE "public"."radolan_geometry" (
    "id" int4 NOT NULL DEFAULT nextval('radolan_geometry_id_seq'::regclass),
    "geometry" geometry(Polygon,4326),
    "centroid" geometry(Point,4326),
    PRIMARY KEY ("id")
);

