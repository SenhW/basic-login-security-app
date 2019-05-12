DROP DATABASE  IF EXISTS `basic_login_security_app_custom_user`;

CREATE DATABASE  IF NOT EXISTS `basic_login_security_app_custom_user`;
USE `basic_login_security_app_custom_user`;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(80) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: https://www.dailycred.com/article/bcrypt-calculator
--
-- Default passwords here are: pass123
--

INSERT INTO `user` (username,password,first_name,last_name,email)
VALUES 
('jason','{bcrypt}$2a$04$F2XeJ1tvSxtNUuHu4Y/xiO1k3FncxmRVaV3ZOvU1xL0aCMZAXB5gO','Jason','Daniels','jason@gmail.com'),
('mary','{bcrypt}$2a$04$F2XeJ1tvSxtNUuHu4Y/xiO1k3FncxmRVaV3ZOvU1xL0aCMZAXB5gO','Mary','Perkins','mary@gmail.com'),
('sarah','{bcrypt}$2a$04$F2XeJ1tvSxtNUuHu4Y/xiO1k3FncxmRVaV3ZOvU1xL0aCMZAXB5gO','Sarah','Appleseed','susan@gmail.com');


--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `role` (name)
VALUES 
('ROLE_EMPLOYEE'),('ROLE_MANAGER'),('ROLE_ADMIN');

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;

CREATE TABLE `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  
  PRIMARY KEY (`user_id`,`role_id`),
  
  KEY `FK_ROLE_idx` (`role_id`),
  
  CONSTRAINT `FK_USER_05` FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT `FK_ROLE` FOREIGN KEY (`role_id`) 
  REFERENCES `role` (`id`) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (user_id,role_id)
VALUES 
(1, 1),
(2, 1),
(2, 2),
(3, 1),
(3, 3)