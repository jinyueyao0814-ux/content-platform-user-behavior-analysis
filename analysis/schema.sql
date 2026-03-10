内容平台用户行为与商业化转化分析
建表语句

CREATE DATABASE content_platform;
USE content_platform;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    register_date DATE,
    city VARCHAR(50),
    age_group VARCHAR(20),
    device VARCHAR(20)
);

CREATE TABLE videos (
    video_id INT PRIMARY KEY,
    author_id INT,
    category VARCHAR(50),
    duration_sec INT,
    publish_date DATE
);

CREATE TABLE user_actions (
    action_id BIGINT PRIMARY KEY,
    user_id INT,
    video_id INT,
    action_date DATE,
    watch_sec INT,
    is_liked TINYINT,
    is_commented TINYINT,
    is_shared TINYINT
);

CREATE TABLE travel_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    destination VARCHAR(50),
    product_type VARCHAR(30),
    status VARCHAR(20),
    gmv DECIMAL(10,2)
);

CREATE TABLE funnel_events (
    event_id BIGINT PRIMARY KEY,
    user_id INT,
    event_date DATE,
    step VARCHAR(30)
);

CREATE TABLE ab_test (
    user_id INT,
    group_name VARCHAR(10),
    is_clicked TINYINT,
    is_converted TINYINT
);
