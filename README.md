SpringJsonDemo
==============
copy required lib from:
https://github.com/dheeraj-sisodia/SpringMVCDemo/tree/master/lib

and download jackson 1.7 lib additionly.
=======================================================================
change the login credentials for database access in file - database.properties

and run following sql query


CREATE TABLE IF NOT EXISTS `customers` (
  `fldID` int(10) unsigned NOT NULL,
  `fldName` text,
  `fldAddress` text,
  `fldEmailId` text,
  `fldMobileNo` varchar(12) DEFAULT NULL,
  `fldPhoneNo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fldID`)
) ENGINE=InnoDB;
