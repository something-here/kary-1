CREATE TABLE users (
  id SERIAL NOT NULL PRIMARY KEY,
  email TEXT NOT NULL,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (email, username)
);

 INSERT INTO users (id, email, username, password, created_at) VALUES
  (1, 'admin@163.com', 'admin', '$2y$12$q7SzshOdyC5IUkc0TL8bd.ERXPgKrwPmUrgtR.34tRS6yI2Ueu7Je', '2018-07-08 13:00:26.353041');
 SELECT setval('users_id_seq', 1, true);

CREATE TABLE  themes (
  id SERIAL NOT NULL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  theme_status INTEGER NOT NULL DEFAULT '0',
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  view_count INTEGER NOT NULL DEFAULT '0',
  comment_count INTEGER NOT NULL DEFAULT '0',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE  categorys (
  id SERIAL NOT NULL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  category_name TEXT NOT NULL,
  category_name_cn TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

 INSERT INTO categorys (id, user_id, category_name, category_name_cn, created_at) VALUES
  (1, 1, 'Office', '官方', '2018-07-08 13:00:26.353041'),
  (2, 1, 'Blog', '博客', '2018-07-08 13:00:28.353041'),
  (3, 1, 'FAQ', '问答', '2018-07-08 13:00:38.353041'),
  (4, 1, 'Share', '分享', '2018-07-08 13:00:26.353041'),
  (5, 1, 'Job', '招聘', '2018-07-08 13:00:28.353041');
 SELECT setval('categorys_id_seq', 5, true);


 CREATE TABLE  comments (
  id SERIAL NOT NULL PRIMARY KEY,
  theme_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


  CREATE TABLE messages (
  id SERIAL NOT NULL PRIMARY KEY,
  theme_id INTEGER NOT NULL,
  from_user_id INTEGER NOT NULL,
  to_user_id INTEGER NOT NULL,
  content TEXT NOT NULL,
  types INTEGER NOT NULL DEFAULT '0',
  message_status INTEGER NOT NULL DEFAULT '0',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

  CREATE TABLE saves (
  id SERIAL NOT NULL PRIMARY KEY,
  theme_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


