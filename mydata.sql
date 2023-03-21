DROP TABLE customers;
DROP TABLE orders;
DROP TABLE shippings;

CREATE TABLE app_user (
  Id INT NOT NULL,
  first_name VARCHAR,
  last_name VARCHAR
)

CREATE TABLE post (
  Id INT NOT NULL,
  created_by_user_Id INT,
  created_datetime datetime,
  caption VARCHAR,
  post_type INT
   )

 CREATE TABLE post_type(
  Id INT NOT NULL,
  post_type_name VARCHAR
  )  

  INSERT INTO app_user (id,first_name,last_name)
  VALUES (1,'john','doe')

  INSERT INTO app_user (id,first_name,last_name)
  VALUES (2,'bob','smith')

  INSERT INTO app_user (id,first_name,last_name)
  VALUES (3,'harry','williams')

  CREATE TABLE follower(
    Id INT NOT NULL,
    following_user_id INT,
    follower_user_id INT
  )

  INSERT INTO follower (id,following_user_id ,follower_user_id)
  VALUES(1,3,2)

  CREATE TABLE post_reaction(
    Id INT NOT NULL,
    user_id INT,
    post_id INT
  )

  CREATE TABLE comment(
    Id INT NOT NULL,
    crated_by_user_id INT, 
    post_id INT,
    created_datetime datetime, 
    comment VARCHAR,
    comment_replied_to_id INT
  )

  CREATE TABLE post_media (
    id INT NOT NULL,
    post_id INT,
    filter_Id INT,
    media_file VARCHAR, 
    longitude VARCHAR,
    latitude VARCHAR
  )

  CREATE TABLE FILTER (
    Id INT NOT NuLL,
    filter_name VARCHAR,
    filter_details VARCHAR
  )

  CREATE TABLE post_media_user_tag(
    Id INT NOT NULL, 
    user_id INT,
    x_coordinate VARCHAR,
    y_coordinate VARCHAR
  )

  INSERT INTO filter (id,filter_name,filter_details)
  VALUES (1,'cinematic shot', '{contrase:80%, brighnes:30% }')

  INSERT INTO filter (id,filter_name,filter_details)
  VALUES (2,'cinematic video', '{slow-motion:40% }')

  INSERT INTO post_type (id,post_type_name)
  VALUES (1,'story')

  INSERT INTO post_type (id,post_type_name)
  VALUES (2,'new feed post')

  INSERT INTO  Post(id,created_by_user_id,created_datetime,caption,Post_type)
  VALUES (1,3, '2021-10-17 16:35:00','new post',2)

  INSERT INTO  Post_media (id,post_id,filter_id,media_file,longitude,latitude)
  VALUES (1,1,2, 'videos/my-video1.mpg', '55.3781',3.4360)

  INSERT INTO  Post_reaction (user_id, post_id)
  VALUES (2,1)

  INSERT INTO comment(id,created_by user_id,post_id,create_datetime,comment)
  VALUES(1,1,1,'2021-10-17 17:35:00','it looks amazing!')

  SELECT post.id,post.created_datetime,post.caption,app_user-first_name, 
  app_user.last_name,post_media.media_file,post_type.post_tуре_name,comment.comment
  FROM post LEFT JOIN app_userON post.created_by_user_id=app_user.idLEFT JOIN post_mediaON 
  post_media.post_id=post.id
  LEFT JOIN post_typeON post.post_type=post_type.id 
  LEFT Join comment ON comment.post_id=Post.id

  SELECT follower_p.first_name,Follower_p.last_name,followed_p.first_name,Followed_p.last_nameFrom follower 
  LEFT JOIN app_user As follower_pON follower.following_user_id = follower_p.id
  Left join app_user as followed_pOn follower.follower_user_id = followed_p.id