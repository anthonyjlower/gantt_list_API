INSERT INTO users (username, password) VALUES ('Anthony', 'can edit');
INSERT INTO users (username, password) VALUES ('Travis', 'can edit');

INSERT INTO projects (content, start, "end", completed, user_id) VALUES ('Project 1', '2018/02/09', '2018/10/25', 'false', 1);
INSERT INTO projects (content, start, "end", completed, user_id) VALUES ('Project 2', '2018/04/09', '2018/6/05', 'false', 1);
INSERT INTO projects (content, start, "end", completed, user_id) VALUES ('Project 3', '2017/01/09', '2020/1/09', 'false', 1);

INSERT INTO projects (content, start, "end", completed, user_id) VALUES ('Project 1', '2018/02/09', '2018/10/25', 'false', 2);
INSERT INTO projects (content, start, "end", completed, user_id) VALUES ('Project 2', '2018/04/09', '2018/6/05', 'false', 2);
INSERT INTO projects (content, start, "end", completed, user_id) VALUES ('Project 3', '2017/01/09', '2020/1/09', 'false', 2);

INSERT INTO tasks (content, start, "end", completed, belongs_to, project_id) VALUES ('Task 1', '2018/02/09', '2018/02/25', 'false', 0, 1);
INSERT INTO tasks (content, start, "end", completed, belongs_to, project_id) VALUES ('Task 2', '2018/02/25', '2018/04/12', 'false', 0, 1);
INSERT INTO tasks (content, start, "end", completed, belongs_to, project_id) VALUES ('Task 3', '2018/04/12', '2018/08/30', 'false', 0, 1);
INSERT INTO tasks (content, start, "end", completed, belongs_to, project_id) VALUES ('SubTask 1', '2018/02/09', '2018/02/20', 'false', 1, 1);
INSERT INTO tasks (content, start, "end", completed, belongs_to, project_id) VALUES ('SubTask 2', '2018/02/20', '2018/02/25', 'false', 1, 1);
