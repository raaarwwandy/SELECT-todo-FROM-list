\c randysalazar

DROP USER "michael";
CREATE USER "michael";
DROP DATABASE IF EXISTS "todo_app";
CREATE DATABASE "todo_app";
\c "todo_app";

CREATE TABLE "task"(id serial PRIMARY KEY NOT NULL, 
  title varchar(255), description text, 
  created_at timestamp without time zone DEFAULT now(), 
  updated_at timestamp without time zone, 
  completed boolean NOT NULL DEFAULT NULL);

ALTER TABLE "task" DROP COLUMN "completed";
ALTER TABLE "task" ADD COLUMN "completed_at" timestamp DEFAULT NULL;
ALTER TABLE "task" ALTER COLUMN "updated_at" SET DEFAULT NULL;
ALTER TABLE "task" ALTER COLUMN "updated_at" SET DEFAULT now();
INSERT INTO "task" VALUES (DEFAULT , 'Study SQL', 'Complete this exercise'); 

INSERT INTO "task" (title, description) VALUES ('Study PostgreSQL', 'Read all the documentations');

SELECT title FROM "task" WHERE completed_at IS null; 
UPDATE "task" SET completed_at = now() WHERE title = 'Study SQL'; 
SELECT title, description FROM "task" WHERE completed_at IS null;
SELECT * FROM "task" ORDER BY created_at DESC;

INSERT INTO "task" (title, description) VALUES ('mistake 1', 'a test entry');
INSERT INTO "task" (title, description) VALUES ('mistake 2', 'another test entry');
INSERT INTO "task" (title, description) VALUES ('mistake 3', 'another test entry');

SELECT title FROM "task" WHERE title LIKE '%mistake%';

DELETE FROM "task" WHERE title = 'mistake 1';
SELECT title, description FROM "task" WHERE title LIKE '%mistake%';
DELETE FROM "task" where title LIKE '%mistake%';

SELECT * FROM "task" ORDER BY title ASC;
 
