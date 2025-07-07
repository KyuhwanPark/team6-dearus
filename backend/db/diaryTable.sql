CREATE DATABASE IF NOT EXISTS dearus;
USE dearus;

-- 1. 사용자
CREATE TABLE user (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  user_id VARCHAR(100) NOT NULL UNIQUE KEY,
  nickname VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

-- 2. 다이어리
CREATE TABLE diary (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  is_deleted BIT NOT NULL DEFAULT 0,
  owner_id BIGINT NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES user(id) ON DELETE CASCADE
);

-- 3. 다이어리 멤버
CREATE TABLE diary_member (
  diary_id BIGINT,
  user_id BIGINT,
  role ENUM('OWNER', 'GUEST') NOT NULL DEFAULT 'GUEST',
  invited_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  accepted BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (diary_id, user_id),
  FOREIGN KEY (diary_id) REFERENCES diary(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

-- 4. 일기 엔트리
CREATE TABLE diary_entry (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  diary_id BIGINT NOT NULL,
  author_id BIGINT NOT NULL,
  emotion ENUM('행복해', '즐거워', '감사해', '사랑해', '뿌듯해', '그저그래', '화나', '힘들어') NOT NULL,
  title VARCHAR(100),
  content TEXT,
  image_url VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (diary_id) REFERENCES diary(id) ON DELETE CASCADE,
  FOREIGN KEY (author_id) REFERENCES user(id)
);

-- 5. 태그
CREATE TABLE tag (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  user_id BIGINT NOT NULL,
  CONSTRAINT fk_tag_user FOREIGN KEY (user_id) REFERENCES user(id),
  CONSTRAINT uk_user_tag UNIQUE (user_id, name)
);

-- 6. 일기-태그 연결
CREATE TABLE entry_tag (
  entry_id BIGINT,
  tag_id BIGINT,
  PRIMARY KEY (entry_id, tag_id),
  FOREIGN KEY (entry_id) REFERENCES diary_entry(id) ON DELETE CASCADE,
  FOREIGN KEY (tag_id) REFERENCES tag(id) ON DELETE CASCADE
);

-- 7. 댓글
CREATE TABLE comment (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  entry_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  content TEXT NOT NULL,
  parent_comment_id BIGINT DEFAULT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (entry_id) REFERENCES diary_entry(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
  FOREIGN KEY (parent_comment_id) REFERENCES comment(id) ON DELETE CASCADE
);
