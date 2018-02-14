DROP DATABASE IF EXISTS gantt; 

CREATE DATABASE gantt;

\c gantt;

CREATE TYPE caneditBool AS ENUM ('can edit', 'cannot edit');
CREATE TYPE completedBool AS ENUM ('true', 'false');

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	username VARCHAR(255),
	password_digest VARCHAR(60)
	-- permission caneditBool
);

CREATE TABLE projects(
	id SERIAL PRIMARY KEY,
	content VARCHAR(255),
	start DATE,
	"end" DATE,
	completed completedBool,
	user_id INT references users(id)
);

CREATE TABLE tasks(
	id SERIAL PRIMARY KEY,
	content VARCHAR(255),
	start DATE,
	"end" DATE,
	completed completedBool,
	belongs_to INT, -- 0 if it is top level, otherwise it references the task it is a sub of
	project_id INT references projects(id)
);
