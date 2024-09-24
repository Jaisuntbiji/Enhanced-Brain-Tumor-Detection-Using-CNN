/*
SQLyog Community
MySQL - 10.4.25-MariaDB : Database - brain_tumor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`brain_tumor` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `brain_tumor`;

/*Table structure for table `disease` */

DROP TABLE IF EXISTS `disease`;

CREATE TABLE `disease` (
  `disease_id` int(11) NOT NULL AUTO_INCREMENT,
  `disease` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `disease` */

insert  into `disease`(`disease_id`,`disease`) values 
(1,'glioma'),
(2,'meningioma'),
(5,'notumor'),
(6,'pituitary');

/*Table structure for table `enquiry` */

DROP TABLE IF EXISTS `enquiry`;

CREATE TABLE `enquiry` (
  `complaints_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `complaints` varchar(100) DEFAULT NULL,
  `reply` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`complaints_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `enquiry` */

insert  into `enquiry`(`complaints_id`,`user_id`,`complaints`,`reply`,`date`) values 
(2,2,'sdfghjjiu','hai','2022-11-18 15:57:08'),
(3,4,'hai','pending','2023-02-08 20:19:24');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(3,'sara','sara@123','user'),
(4,'anna','anna@1233','user'),
(5,'user1','user1','user');

/*Table structure for table `medicine` */

DROP TABLE IF EXISTS `medicine`;

CREATE TABLE `medicine` (
  `medicine_id` int(11) NOT NULL AUTO_INCREMENT,
  `disease_id` int(11) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `medicine` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `medicine` */

insert  into `medicine`(`medicine_id`,`disease_id`,`age`,`medicine`) values 
(4,1,'22',' cyclophosphamide'),
(5,2,'10','etoposide'),
(6,5,'19','teniposide');

/*Table structure for table `predict_medicine` */

DROP TABLE IF EXISTS `predict_medicine`;

CREATE TABLE `predict_medicine` (
  `pmedicine_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `disease_id` int(11) DEFAULT NULL,
  `p_age` varchar(100) DEFAULT NULL,
  `out` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pmedicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `predict_medicine` */

insert  into `predict_medicine`(`pmedicine_id`,`user_id`,`disease_id`,`p_age`,`out`) values 
(4,4,1,'10','etoposide'),
(5,4,1,'Select Your age','no specific medicine for this age'),
(6,4,1,'Select Your age','no specific medicine for this age'),
(7,4,1,'Select Your age','no specific medicine for this age'),
(8,4,1,'Select Your age','no specific medicine for this age'),
(9,4,1,'Select Your age','no specific medicine for this age'),
(10,4,1,'Select Your age','no specific medicine for this age'),
(11,4,1,'Select Your age','no specific medicine for this age'),
(12,4,1,'Select Your age','no specific medicine for this age'),
(13,4,1,'Select Your age','no specific medicine for this age'),
(14,4,1,'Select Your age','no specific medicine for this age'),
(15,4,1,'Select Your age','no specific medicine for this age'),
(16,4,1,'Select Your age','no specific medicine for this age'),
(17,4,1,'Select Your age','no specific medicine for this age'),
(18,4,1,'Select Your age','no specific medicine for this age'),
(19,4,1,'Select Your age','no specific medicine for this age'),
(20,4,1,'22',' cyclophosphamide');

/*Table structure for table `symptoms` */

DROP TABLE IF EXISTS `symptoms`;

CREATE TABLE `symptoms` (
  `symptom_id` int(11) NOT NULL AUTO_INCREMENT,
  `disease_id` int(11) DEFAULT NULL,
  `symptoms` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`symptom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `symptoms` */

insert  into `symptoms`(`symptom_id`,`disease_id`,`symptoms`) values 
(2,1,'pain and fractures, when cancer has spread to the bone.'),
(3,2,'Changes in vision, such as seeing double or blurriness.');

/*Table structure for table `upload_file` */

DROP TABLE IF EXISTS `upload_file`;

CREATE TABLE `upload_file` (
  `uploadfile_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `output` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uploadfile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `upload_file` */

insert  into `upload_file`(`uploadfile_id`,`user_id`,`image`,`output`) values 
(6,4,'static/uploads64c56df5-5757-4814-b4fe-a2af9f5a1897Tr-me_0010.jpg','glioma'),
(7,4,'static/uploadsbc18ee1a-83ab-4113-819a-8b8a0f550cd5Tr-pi_0011.jpg','notumor'),
(8,2,'static/uploads55b251cd-e313-4df5-9c95-ff83a3366bcbTr-gl_0011.jpg','Normal'),
(9,2,'static/uploadsb26447a1-6ff4-4b59-976b-38b27376f161Tr-gl_0741.jpg','Normal'),
(10,2,'static/uploads127185e8-cf5d-480b-b2d9-85f154c46457Tr-gl_0011.jpg','Normal'),
(11,2,'static/uploadsdcf199e8-efd5-44d0-ba1e-ef14c044ce85Tr-gl_0011.jpg','Normal'),
(12,2,'static/uploads1fdc7316-197c-4273-a351-519e8b11f1f2Tr-me_0013.jpg','glioma'),
(13,2,'static/uploads4b0f12eb-9841-433b-9a36-6c8464310638Tr-pi_0020.jpg','notumor');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`user_id`,`login_id`,`fname`,`lname`,`place`,`phone`,`email`) values 
(2,3,'Sara','Mary','kochi','9812345678','marysara@gmail.com'),
(3,4,'Anna','Rose','Kochin','9812345678','anju@gmail.com'),
(4,5,'annmary','ann','kollam','9874561230','ann@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
