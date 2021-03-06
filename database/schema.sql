DROP DATABASE IF EXISTS photo_gallery;

CREATE DATABASE photo_gallery;

USE photo_gallery;

CREATE TABLE products (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  detail VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE images (
  id INT NOT NULL AUTO_INCREMENT,
  img_path VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE product_images (
  id INT NOT NULL AUTO_INCREMENT,
  product_id INT NOT NULL,
  image_id INT NOT NULL,
  PRIMARY KEY (id)
);

SET GLOBAL local_infile = 'ON';

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/products.csv' INTO TABLE products
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/product_images.csv' INTO TABLE product_images
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/images.csv' INTO TABLE images
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';
