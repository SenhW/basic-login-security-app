DROP DATABASE  IF EXISTS `basic_login_security_app_bcrypt`;

CREATE DATABASE  IF NOT EXISTS `basic_login_security_app_bcrypt`;
USE `basic_login_security_app_bcrypt`;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: https://www.dailycred.com/article/bcrypt-calculator
--
-- Default passwords here are: pass123
--

INSERT INTO `users` 
VALUES 
('jason','{bcrypt}$2a$04$F2XeJ1tvSxtNUuHu4Y/xiO1k3FncxmRVaV3ZOvU1xL0aCMZAXB5gO',1),
('mary','{bcrypt}$2a$04$F2XeJ1tvSxtNUuHu4Y/xiO1k3FncxmRVaV3ZOvU1xL0aCMZAXB5gO',1),
('sarah','{bcrypt}$2a$04$F2XeJ1tvSxtNUuHu4Y/xiO1k3FncxmRVaV3ZOvU1xL0aCMZAXB5gO',1);


--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('jason','ROLE_EMPLOYEE'),
('mary','ROLE_EMPLOYEE'),
('mary','ROLE_MANAGER'),
('sarah','ROLE_EMPLOYEE'),
('sarah','ROLE_ADMIN');


