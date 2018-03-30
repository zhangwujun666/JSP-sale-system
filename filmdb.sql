/*
MySQL Data Transfer
Source Host: localhost
Source Database: filmdb
Target Host: localhost
Target Database: filmdb
Date: 2013-1-29 13:52:41
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
CREATE TABLE `admin` (
  `adminId` varchar(10) NOT NULL,
  `adminPwd` varchar(10) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for admin_showing
-- ----------------------------
CREATE TABLE `admin_showing` (
  `id` int(1) NOT NULL,
  `filmId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filmId` (`filmId`),
  CONSTRAINT `admin_showing_ibfk_1` FOREIGN KEY (`filmId`) REFERENCES `filmshow` (`filmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for admin_will
-- ----------------------------
CREATE TABLE `admin_will` (
  `id` int(1) NOT NULL,
  `filmId` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filmId` (`filmId`),
  CONSTRAINT `admin_will_ibfk_1` FOREIGN KEY (`filmId`) REFERENCES `film` (`filmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for film
-- ----------------------------
CREATE TABLE `film` (
  `filmId` int(10) NOT NULL AUTO_INCREMENT,
  `filmName` varchar(20) NOT NULL,
  `filmLong` int(11) NOT NULL,
  `director` varchar(20) NOT NULL,
  `actor` varchar(20) NOT NULL,
  `filmType` varchar(20) DEFAULT NULL,
  `filmLanguage` varchar(10) NOT NULL DEFAULT '国语',
  `filmImg` varchar(20) DEFAULT NULL,
  `filmJianJie` varchar(1000) DEFAULT NULL,
  `filmState` int(1) NOT NULL DEFAULT '0',
  `filmScore` int(10) DEFAULT '0',
  PRIMARY KEY (`filmId`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for filmshow
-- ----------------------------
CREATE TABLE `filmshow` (
  `showId` int(10) NOT NULL AUTO_INCREMENT,
  `filmId` int(10) NOT NULL,
  `roomId` int(3) NOT NULL,
  `showDate` date NOT NULL,
  `showTime` time NOT NULL,
  `filmPrice` double DEFAULT NULL,
  PRIMARY KEY (`showId`),
  KEY `filmId` (`filmId`),
  KEY `roomId` (`roomId`),
  CONSTRAINT `filmshow_ibfk_1` FOREIGN KEY (`filmId`) REFERENCES `film` (`filmId`),
  CONSTRAINT `filmshow_ibfk_2` FOREIGN KEY (`roomId`) REFERENCES `seat` (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for haibao
-- ----------------------------
CREATE TABLE `haibao` (
  `filmId` int(10) NOT NULL,
  `haibao` varchar(20) NOT NULL,
  PRIMARY KEY (`filmId`),
  CONSTRAINT `haibao_ibfk_1` FOREIGN KEY (`filmId`) REFERENCES `film` (`filmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for huodong
-- ----------------------------
CREATE TABLE `huodong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show` varchar(100) NOT NULL,
  `img` varchar(50) NOT NULL,
  `biaoshi` int(1) NOT NULL DEFAULT '0',
  `starttime` date NOT NULL,
  `stoptime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pingjia
-- ----------------------------
CREATE TABLE `pingjia` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filmId` int(10) NOT NULL,
  `userId` varchar(20) NOT NULL,
  `pingJia` varchar(200) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filmId` (`filmId`),
  KEY `userId` (`userId`),
  CONSTRAINT `pingjia_ibfk_1` FOREIGN KEY (`filmId`) REFERENCES `film` (`filmId`),
  CONSTRAINT `pingjia_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for room
-- ----------------------------
CREATE TABLE `room` (
  `roomId` int(2) NOT NULL,
  `seatRows` int(2) NOT NULL,
  `seatCols` int(2) NOT NULL,
  PRIMARY KEY (`roomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for seat
-- ----------------------------
CREATE TABLE `seat` (
  `seatId` int(10) NOT NULL AUTO_INCREMENT,
  `roomId` int(2) NOT NULL,
  `seatNum` int(2) NOT NULL,
  `seatState` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seatId`),
  KEY `roomId` (`roomId`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
CREATE TABLE `ticket` (
  `ticketId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `showId` int(10) NOT NULL,
  `seatNum` int(2) NOT NULL,
  `price` double NOT NULL,
  `orderTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ticketId`),
  KEY `userId` (`userId`),
  KEY `showId` (`showId`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`showId`) REFERENCES `filmshow` (`showId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_guanzhu
-- ----------------------------
CREATE TABLE `user_guanzhu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filmId` int(10) NOT NULL,
  `userId` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filmId` (`filmId`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_guanzhu_ibfk_1` FOREIGN KEY (`filmId`) REFERENCES `film` (`filmId`),
  CONSTRAINT `user_guanzhu_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_showing
-- ----------------------------
CREATE TABLE `user_showing` (
  `id` int(1) NOT NULL,
  `filmId` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filmId` (`filmId`),
  CONSTRAINT `user_showing_ibfk_1` FOREIGN KEY (`filmId`) REFERENCES `filmshow` (`filmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_will
-- ----------------------------
CREATE TABLE `user_will` (
  `id` int(1) NOT NULL,
  `filmId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filmId` (`filmId`),
  CONSTRAINT `user_will_ibfk_1` FOREIGN KEY (`filmId`) REFERENCES `film` (`filmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
CREATE TABLE `userinfo` (
  `userId` varchar(20) NOT NULL,
  `userName` varchar(20) NOT NULL DEFAULT 'wang',
  `userSex` varchar(20) NOT NULL DEFAULT '男',
  `userPwd` varchar(20) NOT NULL DEFAULT '0',
  `userEmail` varchar(20) NOT NULL DEFAULT 'wang@163.com',
  `userTelephone` varchar(20) NOT NULL DEFAULT '2156565',
  `userIdCard` varchar(20) NOT NULL DEFAULT '48713245698',
  `userScore` int(10) NOT NULL DEFAULT '0',
  `userMoney` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vip
-- ----------------------------
CREATE TABLE `vip` (
  `vip` int(2) NOT NULL,
  `start` int(10) NOT NULL,
  `stop` int(10) NOT NULL,
  `zheKou` int(2) NOT NULL,
  PRIMARY KEY (`vip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', '111111');
INSERT INTO `admin_showing` VALUES ('1', '4');
INSERT INTO `admin_showing` VALUES ('2', '5');
INSERT INTO `admin_showing` VALUES ('4', '7');
INSERT INTO `admin_showing` VALUES ('3', '8');
INSERT INTO `admin_showing` VALUES ('5', '11');
INSERT INTO `admin_showing` VALUES ('6', '12');
INSERT INTO `admin_will` VALUES ('1', '25');
INSERT INTO `admin_will` VALUES ('2', '26');
INSERT INTO `admin_will` VALUES ('3', '27');
INSERT INTO `admin_will` VALUES ('4', '28');
INSERT INTO `admin_will` VALUES ('5', '29');
INSERT INTO `admin_will` VALUES ('6', '30');
INSERT INTO `film` VALUES ('1', '人在囧途之泰囧', '120', '徐峥', '徐峥/王宝强', '喜剧/剧情', '国语', 'Image/f2.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '2', '66701');
INSERT INTO `film` VALUES ('2', '十二生肖', '120', '成龙', '成龙,权相宇', '喜剧/剧情', '国语', 'Image/f2.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '2', '32375');
INSERT INTO `film` VALUES ('3', '艺术家', '120', '成龙', '成龙,权相宇', '艺术', '国语', 'Image/f2.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '365467');
INSERT INTO `film` VALUES ('4', '凶间雪山', '120', '成龙', '成龙,权相宇', '剧情', '国语', 'Image/f5.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '12550');
INSERT INTO `film` VALUES ('5', '夺宝幸运星', '120', '成龙', '成龙,权相宇', '喜剧/剧情', '国语', 'Image/ff2.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '25756');
INSERT INTO `film` VALUES ('6', '大上海', '120', '成龙', '成龙,权相宇', '动作/剧情', '国语', 'Image/ff4.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '548767');
INSERT INTO `film` VALUES ('7', '血滴子', '120', '成龙', '成龙,权相宇', '动作/剧情', '国语', 'Image/ff7.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '23680');
INSERT INTO `film` VALUES ('8', '我老公不靠谱', '120', '成龙', '成龙,权相宇', '动作/剧情', '国语', 'Image/ff8.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '45879');
INSERT INTO `film` VALUES ('9', '太极', '120', '成龙', '成龙,权相宇', '动作/剧情', '国语', 'Image/ff11.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '365845');
INSERT INTO `film` VALUES ('10', '一代宗师', '120', '成龙', '成龙,权相宇', '动作/剧情', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '12363');
INSERT INTO `film` VALUES ('11', '敢死队2', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/ff10.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '12365');
INSERT INTO `film` VALUES ('12', '十二生肖', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/17.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '455543');
INSERT INTO `film` VALUES ('13', '十二生肖2', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/f2.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '126569');
INSERT INTO `film` VALUES ('14', '十二生肖3', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/ff6.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '59623');
INSERT INTO `film` VALUES ('15', '十二生肖4', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/ff7.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '13359');
INSERT INTO `film` VALUES ('16', '十二生肖5', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/21.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '265965');
INSERT INTO `film` VALUES ('17', '十二生肖6', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/20.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '235696');
INSERT INTO `film` VALUES ('18', '十二生肖7', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/ff2.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '568466');
INSERT INTO `film` VALUES ('19', '十二生肖8', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '0');
INSERT INTO `film` VALUES ('20', '十二生肖9', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/22.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '0');
INSERT INTO `film` VALUES ('21', '十二生肖10', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/24.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '0');
INSERT INTO `film` VALUES ('22', '十二生肖11', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/25.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '1');
INSERT INTO `film` VALUES ('23', '十二生肖12', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/26.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '1');
INSERT INTO `film` VALUES ('24', '十二生肖13', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/28.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '1');
INSERT INTO `film` VALUES ('25', '十二生肖14', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/f4.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '1');
INSERT INTO `film` VALUES ('26', '十二生肖15', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/f5.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '1');
INSERT INTO `film` VALUES ('27', '十二生肖16', '120', '成龙', '成龙,权相宇', '喜剧', '国语', 'Image/ff9.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `film` VALUES ('28', '人在囧途之泰囧2', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff4.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `film` VALUES ('29', '人在囧途之泰囧3', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff6.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '1');
INSERT INTO `film` VALUES ('30', '人在囧途之泰囧4', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff4.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '1');
INSERT INTO `film` VALUES ('31', '人在囧途之泰囧5', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `film` VALUES ('32', '人在囧途之泰囧6', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `film` VALUES ('33', '人在囧途之泰囧7', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `film` VALUES ('34', '人在囧途之泰囧8', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `film` VALUES ('35', '人在囧途之泰囧9', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `film` VALUES ('36', '人在囧途之泰囧10', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '1');
INSERT INTO `film` VALUES ('37', '人在囧途之泰囧11', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '1');
INSERT INTO `film` VALUES ('38', '人在囧途之泰囧12', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `film` VALUES ('39', '人在囧途之泰囧13', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '1');
INSERT INTO `film` VALUES ('40', '人在囧途之泰囧14', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `film` VALUES ('41', '人在囧途之泰囧15', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `film` VALUES ('42', '人在囧途之泰囧16', '120', '徐峥', '徐峥,王宝强', '喜剧', '国语', 'Image/ff1.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `film` VALUES ('43', '无间道', '123', '冯小刚', '朱青林，黄俊涛', '爱情片', '国语', 'Image/26.jpg', '朱青林，黄俊涛的凄美爱情故事', '1', '0');
INSERT INTO `film` VALUES ('44', '半夜不要照镜子', '120', '那个谁', '谁捏', '恐怖片', '日韩', 'Image/ff15.jpg', '半夜不要照镜子', '2', '0');
INSERT INTO `film` VALUES ('45', '大圣娶亲', '123', '周星驰', '周星驰，朱茵', '科幻片', '英语', 'Image/t4.jpg', '猴子娶媳妇', '1', '0');
INSERT INTO `film` VALUES ('46', '林忆莲', '123', '林忆莲', '林忆莲', '科幻片', '英语', 'Image/23.jpg', '林忆莲', '1', '0');
INSERT INTO `film` VALUES ('47', '3113', '321321321', '3123213', '32132', '科幻片', '英语', 'Image/ff14.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `film` VALUES ('48', '1', '1', '1', '1', '科幻片', '英语', 'Image/ff14.jpg', '1商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '0', '0');
INSERT INTO `film` VALUES ('49', '111', '111', 'asd', 'lsm', '科幻片', '英语', 'Image/ff14.jpg', '商业成功人士徐朗（徐峥 饰）用了五年时间发明了一种叫“油霸”的神奇产品——每次汽车加油只需加到三分之一，再滴入2滴“油霸”，油箱的汽油就会变成满满一箱。徐朗的同学，兼项目有分歧的竞争对手高博（黄渤 饰）想把这个发明一次性卖给法国人。但徐朗坚决不同意，他希望深入开发研究， 把“油霸”发扬光大，得到更远的收益。两个人各抒己见，争论不休，一直无果；由于两人股份相同，唯有得到公司最大股东周扬的授权书，方可达到各自目的。', '1', '0');
INSERT INTO `filmshow` VALUES ('1', '1', '1', '2013-01-29', '09:00:00', '55');
INSERT INTO `filmshow` VALUES ('2', '2', '2', '2013-01-29', '14:23:00', '55');
INSERT INTO `filmshow` VALUES ('3', '3', '3', '2012-11-29', '16:00:00', '55');
INSERT INTO `filmshow` VALUES ('4', '4', '4', '2013-01-29', '15:00:00', '55');
INSERT INTO `filmshow` VALUES ('5', '5', '5', '2013-01-29', '15:00:00', '55');
INSERT INTO `filmshow` VALUES ('6', '6', '6', '2013-01-29', '14:30:00', '55');
INSERT INTO `filmshow` VALUES ('7', '7', '1', '2013-01-30', '14:23:00', '55');
INSERT INTO `filmshow` VALUES ('8', '8', '2', '2013-01-30', '09:30:00', '55');
INSERT INTO `filmshow` VALUES ('9', '9', '3', '2013-01-30', '09:00:00', '55');
INSERT INTO `filmshow` VALUES ('10', '10', '4', '2013-01-30', '14:00:00', '55');
INSERT INTO `filmshow` VALUES ('11', '11', '5', '2013-01-30', '15:00:00', '55');
INSERT INTO `filmshow` VALUES ('12', '12', '6', '2013-01-30', '16:00:00', '55');
INSERT INTO `filmshow` VALUES ('13', '1', '1', '2013-01-31', '14:12:14', '55');
INSERT INTO `filmshow` VALUES ('14', '27', '1', '2013-01-31', '11:31:00', '10');
INSERT INTO `filmshow` VALUES ('15', '26', '2', '2013-01-31', '09:00:00', '10');
INSERT INTO `filmshow` VALUES ('16', '27', '3', '2013-01-31', '08:00:00', '22.5');
INSERT INTO `filmshow` VALUES ('17', '28', '2', '2013-01-31', '12:00:00', '10');
INSERT INTO `filmshow` VALUES ('18', '29', '2', '2013-01-31', '12:00:00', '12');
INSERT INTO `filmshow` VALUES ('19', '27', '2', '2013-01-31', '10:00:00', '10');
INSERT INTO `filmshow` VALUES ('20', '28', '2', '2013-01-31', '10:00:00', '10');
INSERT INTO `filmshow` VALUES ('21', '26', '2', '2013-01-28', '10:00:00', '10');
INSERT INTO `filmshow` VALUES ('22', '29', '1', '2013-01-28', '14:10:00', '12');
INSERT INTO `filmshow` VALUES ('23', '25', '1', '2013-01-28', '14:10:00', '10');
INSERT INTO `filmshow` VALUES ('24', '25', '2', '2013-01-28', '08:00:00', '12');
INSERT INTO `filmshow` VALUES ('25', '26', '2', '2013-01-28', '08:00:00', '1');
INSERT INTO `filmshow` VALUES ('26', '27', '2', '2013-01-28', '04:00:00', '23');
INSERT INTO `filmshow` VALUES ('27', '25', '6', '2013-01-28', '10:10:00', '10');
INSERT INTO `filmshow` VALUES ('28', '26', '4', '2013-01-28', '10:10:00', '10');
INSERT INTO `filmshow` VALUES ('29', '25', '2', '2013-01-28', '08:00:00', '52');
INSERT INTO `filmshow` VALUES ('30', '26', '5', '2013-01-28', '10:10:00', '10');
INSERT INTO `filmshow` VALUES ('31', '26', '2', '2013-01-28', '01:01:00', '1');
INSERT INTO `filmshow` VALUES ('32', '27', '6', '2013-01-28', '12:50:00', '12');
INSERT INTO `filmshow` VALUES ('33', '30', '1', '2013-01-28', '17:30:00', '35');
INSERT INTO `filmshow` VALUES ('34', '31', '2', '2013-01-28', '10:00:00', '12');
INSERT INTO `filmshow` VALUES ('35', '24', '2', '2013-01-28', '10:10:00', '10');
INSERT INTO `filmshow` VALUES ('44', '28', '1', '2013-01-28', '20:11:00', '12');
INSERT INTO `filmshow` VALUES ('45', '25', '1', '2013-01-28', '20:11:00', '12');
INSERT INTO `filmshow` VALUES ('46', '1', '1', '2013-01-29', '12:12:00', '10');
INSERT INTO `haibao` VALUES ('1', 'Image/haibao1.jpg');
INSERT INTO `haibao` VALUES ('2', 'Image/haibao2.jpg');
INSERT INTO `haibao` VALUES ('3', 'Image/haibao3.jpg');
INSERT INTO `huodong` VALUES ('1', '特价优惠活动开始啦', 'Image/1.jpg', '0', '2013-01-23', '2013-01-31');
INSERT INTO `pingjia` VALUES ('42', '4', '002', '&lt;script&gt;alert(\"laile\");&lt;/script&gt;', '2013-01-28 08:38:14');
INSERT INTO `room` VALUES ('1', '9', '9');
INSERT INTO `room` VALUES ('2', '9', '9');
INSERT INTO `room` VALUES ('3', '9', '9');
INSERT INTO `room` VALUES ('4', '9', '9');
INSERT INTO `room` VALUES ('5', '9', '9');
INSERT INTO `room` VALUES ('6', '9', '9');
INSERT INTO `seat` VALUES ('3', '1', '1', '0');
INSERT INTO `seat` VALUES ('4', '1', '2', '0');
INSERT INTO `seat` VALUES ('5', '1', '3', '0');
INSERT INTO `seat` VALUES ('6', '1', '4', '0');
INSERT INTO `seat` VALUES ('7', '1', '5', '0');
INSERT INTO `seat` VALUES ('8', '1', '6', '0');
INSERT INTO `seat` VALUES ('9', '1', '7', '0');
INSERT INTO `seat` VALUES ('10', '1', '8', '0');
INSERT INTO `seat` VALUES ('11', '1', '9', '0');
INSERT INTO `seat` VALUES ('12', '1', '10', '0');
INSERT INTO `seat` VALUES ('13', '1', '11', '0');
INSERT INTO `seat` VALUES ('14', '1', '12', '0');
INSERT INTO `seat` VALUES ('15', '1', '13', '0');
INSERT INTO `seat` VALUES ('16', '1', '14', '0');
INSERT INTO `seat` VALUES ('17', '1', '15', '0');
INSERT INTO `seat` VALUES ('18', '1', '16', '0');
INSERT INTO `seat` VALUES ('19', '1', '17', '0');
INSERT INTO `seat` VALUES ('20', '1', '18', '0');
INSERT INTO `seat` VALUES ('21', '1', '19', '0');
INSERT INTO `seat` VALUES ('22', '1', '20', '0');
INSERT INTO `seat` VALUES ('23', '1', '21', '0');
INSERT INTO `seat` VALUES ('24', '1', '22', '0');
INSERT INTO `seat` VALUES ('25', '1', '23', '0');
INSERT INTO `seat` VALUES ('26', '1', '24', '0');
INSERT INTO `seat` VALUES ('27', '1', '25', '0');
INSERT INTO `seat` VALUES ('28', '1', '26', '0');
INSERT INTO `seat` VALUES ('29', '1', '27', '0');
INSERT INTO `seat` VALUES ('30', '1', '28', '0');
INSERT INTO `seat` VALUES ('31', '1', '29', '0');
INSERT INTO `seat` VALUES ('32', '1', '30', '0');
INSERT INTO `seat` VALUES ('33', '1', '31', '0');
INSERT INTO `seat` VALUES ('34', '1', '32', '0');
INSERT INTO `seat` VALUES ('35', '1', '33', '0');
INSERT INTO `seat` VALUES ('36', '1', '34', '0');
INSERT INTO `seat` VALUES ('37', '1', '35', '0');
INSERT INTO `seat` VALUES ('38', '1', '36', '0');
INSERT INTO `seat` VALUES ('39', '1', '37', '0');
INSERT INTO `seat` VALUES ('40', '1', '38', '0');
INSERT INTO `seat` VALUES ('41', '1', '39', '0');
INSERT INTO `seat` VALUES ('42', '1', '40', '0');
INSERT INTO `seat` VALUES ('43', '1', '41', '0');
INSERT INTO `seat` VALUES ('44', '1', '42', '0');
INSERT INTO `seat` VALUES ('45', '1', '43', '0');
INSERT INTO `seat` VALUES ('46', '1', '44', '0');
INSERT INTO `seat` VALUES ('47', '1', '45', '0');
INSERT INTO `seat` VALUES ('48', '1', '46', '0');
INSERT INTO `seat` VALUES ('49', '1', '47', '0');
INSERT INTO `seat` VALUES ('50', '1', '48', '0');
INSERT INTO `seat` VALUES ('51', '1', '49', '0');
INSERT INTO `seat` VALUES ('52', '1', '50', '0');
INSERT INTO `seat` VALUES ('53', '1', '51', '0');
INSERT INTO `seat` VALUES ('54', '1', '52', '0');
INSERT INTO `seat` VALUES ('55', '1', '53', '0');
INSERT INTO `seat` VALUES ('56', '1', '54', '0');
INSERT INTO `seat` VALUES ('57', '1', '55', '0');
INSERT INTO `seat` VALUES ('58', '1', '56', '0');
INSERT INTO `seat` VALUES ('59', '1', '57', '0');
INSERT INTO `seat` VALUES ('60', '1', '58', '0');
INSERT INTO `seat` VALUES ('61', '1', '59', '0');
INSERT INTO `seat` VALUES ('62', '1', '60', '0');
INSERT INTO `seat` VALUES ('63', '1', '61', '0');
INSERT INTO `seat` VALUES ('64', '1', '62', '0');
INSERT INTO `seat` VALUES ('65', '1', '63', '0');
INSERT INTO `seat` VALUES ('66', '1', '64', '0');
INSERT INTO `seat` VALUES ('67', '1', '65', '0');
INSERT INTO `seat` VALUES ('68', '1', '66', '0');
INSERT INTO `seat` VALUES ('69', '1', '67', '0');
INSERT INTO `seat` VALUES ('70', '1', '68', '0');
INSERT INTO `seat` VALUES ('71', '1', '69', '0');
INSERT INTO `seat` VALUES ('72', '1', '70', '0');
INSERT INTO `seat` VALUES ('73', '1', '71', '0');
INSERT INTO `seat` VALUES ('74', '1', '72', '0');
INSERT INTO `seat` VALUES ('75', '1', '73', '0');
INSERT INTO `seat` VALUES ('76', '1', '74', '0');
INSERT INTO `seat` VALUES ('77', '1', '75', '0');
INSERT INTO `seat` VALUES ('78', '1', '76', '0');
INSERT INTO `seat` VALUES ('79', '1', '77', '0');
INSERT INTO `seat` VALUES ('80', '1', '78', '0');
INSERT INTO `seat` VALUES ('81', '1', '79', '0');
INSERT INTO `seat` VALUES ('82', '1', '80', '0');
INSERT INTO `seat` VALUES ('83', '1', '81', '0');
INSERT INTO `seat` VALUES ('84', '2', '1', '0');
INSERT INTO `seat` VALUES ('85', '2', '2', '0');
INSERT INTO `seat` VALUES ('86', '2', '3', '0');
INSERT INTO `seat` VALUES ('87', '2', '4', '0');
INSERT INTO `seat` VALUES ('88', '2', '5', '0');
INSERT INTO `seat` VALUES ('89', '2', '6', '0');
INSERT INTO `seat` VALUES ('90', '2', '7', '0');
INSERT INTO `seat` VALUES ('91', '2', '8', '0');
INSERT INTO `seat` VALUES ('92', '2', '9', '0');
INSERT INTO `seat` VALUES ('93', '2', '10', '0');
INSERT INTO `seat` VALUES ('94', '2', '11', '0');
INSERT INTO `seat` VALUES ('95', '2', '12', '0');
INSERT INTO `seat` VALUES ('96', '2', '13', '0');
INSERT INTO `seat` VALUES ('97', '2', '14', '0');
INSERT INTO `seat` VALUES ('98', '2', '15', '0');
INSERT INTO `seat` VALUES ('99', '2', '16', '0');
INSERT INTO `seat` VALUES ('100', '2', '17', '0');
INSERT INTO `seat` VALUES ('101', '2', '18', '0');
INSERT INTO `seat` VALUES ('102', '2', '19', '0');
INSERT INTO `seat` VALUES ('103', '2', '20', '0');
INSERT INTO `seat` VALUES ('104', '2', '21', '0');
INSERT INTO `seat` VALUES ('105', '2', '22', '0');
INSERT INTO `seat` VALUES ('106', '2', '23', '0');
INSERT INTO `seat` VALUES ('107', '2', '24', '0');
INSERT INTO `seat` VALUES ('108', '2', '25', '0');
INSERT INTO `seat` VALUES ('109', '2', '26', '0');
INSERT INTO `seat` VALUES ('110', '2', '27', '0');
INSERT INTO `seat` VALUES ('111', '2', '28', '0');
INSERT INTO `seat` VALUES ('112', '2', '29', '0');
INSERT INTO `seat` VALUES ('113', '2', '30', '0');
INSERT INTO `seat` VALUES ('114', '2', '31', '0');
INSERT INTO `seat` VALUES ('115', '2', '32', '0');
INSERT INTO `seat` VALUES ('116', '2', '33', '0');
INSERT INTO `seat` VALUES ('117', '2', '34', '0');
INSERT INTO `seat` VALUES ('118', '2', '35', '0');
INSERT INTO `seat` VALUES ('119', '2', '36', '0');
INSERT INTO `seat` VALUES ('120', '2', '37', '0');
INSERT INTO `seat` VALUES ('121', '2', '38', '0');
INSERT INTO `seat` VALUES ('122', '2', '39', '0');
INSERT INTO `seat` VALUES ('123', '2', '40', '0');
INSERT INTO `seat` VALUES ('124', '2', '41', '0');
INSERT INTO `seat` VALUES ('125', '2', '42', '0');
INSERT INTO `seat` VALUES ('126', '2', '43', '0');
INSERT INTO `seat` VALUES ('127', '2', '44', '0');
INSERT INTO `seat` VALUES ('128', '2', '45', '0');
INSERT INTO `seat` VALUES ('129', '2', '46', '0');
INSERT INTO `seat` VALUES ('130', '2', '47', '0');
INSERT INTO `seat` VALUES ('131', '2', '48', '0');
INSERT INTO `seat` VALUES ('132', '2', '49', '0');
INSERT INTO `seat` VALUES ('133', '2', '50', '0');
INSERT INTO `seat` VALUES ('134', '2', '51', '0');
INSERT INTO `seat` VALUES ('135', '2', '52', '0');
INSERT INTO `seat` VALUES ('136', '2', '53', '0');
INSERT INTO `seat` VALUES ('137', '2', '54', '0');
INSERT INTO `seat` VALUES ('138', '2', '55', '0');
INSERT INTO `seat` VALUES ('139', '2', '56', '0');
INSERT INTO `seat` VALUES ('140', '2', '57', '0');
INSERT INTO `seat` VALUES ('141', '2', '58', '0');
INSERT INTO `seat` VALUES ('142', '2', '59', '0');
INSERT INTO `seat` VALUES ('143', '2', '60', '0');
INSERT INTO `seat` VALUES ('144', '2', '61', '0');
INSERT INTO `seat` VALUES ('145', '2', '62', '0');
INSERT INTO `seat` VALUES ('146', '2', '63', '0');
INSERT INTO `seat` VALUES ('147', '2', '64', '0');
INSERT INTO `seat` VALUES ('148', '2', '65', '0');
INSERT INTO `seat` VALUES ('149', '2', '66', '0');
INSERT INTO `seat` VALUES ('150', '2', '67', '0');
INSERT INTO `seat` VALUES ('151', '2', '68', '0');
INSERT INTO `seat` VALUES ('152', '2', '69', '0');
INSERT INTO `seat` VALUES ('153', '2', '70', '0');
INSERT INTO `seat` VALUES ('154', '2', '71', '0');
INSERT INTO `seat` VALUES ('155', '2', '72', '0');
INSERT INTO `seat` VALUES ('156', '2', '73', '0');
INSERT INTO `seat` VALUES ('157', '2', '74', '0');
INSERT INTO `seat` VALUES ('158', '2', '75', '0');
INSERT INTO `seat` VALUES ('159', '2', '76', '0');
INSERT INTO `seat` VALUES ('160', '2', '77', '0');
INSERT INTO `seat` VALUES ('161', '2', '78', '0');
INSERT INTO `seat` VALUES ('162', '2', '79', '0');
INSERT INTO `seat` VALUES ('163', '2', '80', '0');
INSERT INTO `seat` VALUES ('164', '2', '81', '0');
INSERT INTO `seat` VALUES ('165', '3', '1', '0');
INSERT INTO `seat` VALUES ('166', '3', '2', '0');
INSERT INTO `seat` VALUES ('167', '3', '3', '0');
INSERT INTO `seat` VALUES ('168', '3', '4', '0');
INSERT INTO `seat` VALUES ('169', '3', '5', '0');
INSERT INTO `seat` VALUES ('170', '3', '6', '0');
INSERT INTO `seat` VALUES ('171', '3', '7', '0');
INSERT INTO `seat` VALUES ('172', '3', '8', '0');
INSERT INTO `seat` VALUES ('173', '3', '9', '0');
INSERT INTO `seat` VALUES ('174', '3', '10', '0');
INSERT INTO `seat` VALUES ('175', '3', '11', '0');
INSERT INTO `seat` VALUES ('176', '3', '12', '0');
INSERT INTO `seat` VALUES ('177', '3', '13', '0');
INSERT INTO `seat` VALUES ('178', '3', '14', '0');
INSERT INTO `seat` VALUES ('179', '3', '15', '0');
INSERT INTO `seat` VALUES ('180', '3', '16', '0');
INSERT INTO `seat` VALUES ('181', '3', '17', '0');
INSERT INTO `seat` VALUES ('182', '3', '18', '0');
INSERT INTO `seat` VALUES ('183', '3', '19', '0');
INSERT INTO `seat` VALUES ('184', '3', '20', '0');
INSERT INTO `seat` VALUES ('185', '3', '21', '0');
INSERT INTO `seat` VALUES ('186', '3', '22', '0');
INSERT INTO `seat` VALUES ('187', '3', '23', '0');
INSERT INTO `seat` VALUES ('188', '3', '24', '0');
INSERT INTO `seat` VALUES ('189', '3', '25', '0');
INSERT INTO `seat` VALUES ('190', '3', '26', '0');
INSERT INTO `seat` VALUES ('191', '3', '27', '0');
INSERT INTO `seat` VALUES ('192', '3', '28', '0');
INSERT INTO `seat` VALUES ('193', '3', '29', '0');
INSERT INTO `seat` VALUES ('194', '3', '30', '0');
INSERT INTO `seat` VALUES ('195', '3', '31', '0');
INSERT INTO `seat` VALUES ('196', '3', '32', '0');
INSERT INTO `seat` VALUES ('197', '3', '33', '0');
INSERT INTO `seat` VALUES ('198', '3', '34', '0');
INSERT INTO `seat` VALUES ('199', '3', '35', '0');
INSERT INTO `seat` VALUES ('200', '3', '36', '0');
INSERT INTO `seat` VALUES ('201', '3', '37', '0');
INSERT INTO `seat` VALUES ('202', '3', '38', '0');
INSERT INTO `seat` VALUES ('203', '3', '39', '0');
INSERT INTO `seat` VALUES ('204', '3', '40', '0');
INSERT INTO `seat` VALUES ('205', '3', '41', '0');
INSERT INTO `seat` VALUES ('206', '3', '42', '0');
INSERT INTO `seat` VALUES ('207', '3', '43', '0');
INSERT INTO `seat` VALUES ('208', '3', '44', '0');
INSERT INTO `seat` VALUES ('209', '3', '45', '0');
INSERT INTO `seat` VALUES ('210', '3', '46', '0');
INSERT INTO `seat` VALUES ('211', '3', '47', '0');
INSERT INTO `seat` VALUES ('212', '3', '48', '0');
INSERT INTO `seat` VALUES ('213', '3', '49', '0');
INSERT INTO `seat` VALUES ('214', '3', '50', '0');
INSERT INTO `seat` VALUES ('215', '3', '51', '0');
INSERT INTO `seat` VALUES ('216', '3', '52', '0');
INSERT INTO `seat` VALUES ('217', '3', '53', '0');
INSERT INTO `seat` VALUES ('218', '3', '54', '0');
INSERT INTO `seat` VALUES ('219', '3', '55', '0');
INSERT INTO `seat` VALUES ('220', '3', '56', '0');
INSERT INTO `seat` VALUES ('221', '3', '57', '0');
INSERT INTO `seat` VALUES ('222', '3', '58', '0');
INSERT INTO `seat` VALUES ('223', '3', '59', '0');
INSERT INTO `seat` VALUES ('224', '3', '60', '0');
INSERT INTO `seat` VALUES ('225', '3', '61', '0');
INSERT INTO `seat` VALUES ('226', '3', '62', '0');
INSERT INTO `seat` VALUES ('227', '3', '63', '0');
INSERT INTO `seat` VALUES ('228', '3', '64', '0');
INSERT INTO `seat` VALUES ('229', '3', '65', '0');
INSERT INTO `seat` VALUES ('230', '3', '66', '0');
INSERT INTO `seat` VALUES ('231', '3', '67', '0');
INSERT INTO `seat` VALUES ('232', '3', '68', '0');
INSERT INTO `seat` VALUES ('233', '3', '69', '0');
INSERT INTO `seat` VALUES ('234', '3', '70', '0');
INSERT INTO `seat` VALUES ('235', '3', '71', '0');
INSERT INTO `seat` VALUES ('236', '3', '72', '0');
INSERT INTO `seat` VALUES ('237', '3', '73', '0');
INSERT INTO `seat` VALUES ('238', '3', '74', '0');
INSERT INTO `seat` VALUES ('239', '3', '75', '0');
INSERT INTO `seat` VALUES ('240', '3', '76', '0');
INSERT INTO `seat` VALUES ('241', '3', '77', '0');
INSERT INTO `seat` VALUES ('242', '3', '78', '0');
INSERT INTO `seat` VALUES ('243', '3', '79', '0');
INSERT INTO `seat` VALUES ('244', '3', '80', '0');
INSERT INTO `seat` VALUES ('245', '3', '81', '0');
INSERT INTO `seat` VALUES ('246', '4', '1', '0');
INSERT INTO `seat` VALUES ('247', '4', '2', '0');
INSERT INTO `seat` VALUES ('248', '4', '3', '0');
INSERT INTO `seat` VALUES ('249', '4', '4', '0');
INSERT INTO `seat` VALUES ('250', '4', '5', '0');
INSERT INTO `seat` VALUES ('251', '4', '6', '0');
INSERT INTO `seat` VALUES ('252', '4', '7', '0');
INSERT INTO `seat` VALUES ('253', '4', '8', '0');
INSERT INTO `seat` VALUES ('254', '4', '9', '0');
INSERT INTO `seat` VALUES ('255', '4', '10', '0');
INSERT INTO `seat` VALUES ('256', '4', '11', '0');
INSERT INTO `seat` VALUES ('257', '4', '12', '0');
INSERT INTO `seat` VALUES ('258', '4', '13', '0');
INSERT INTO `seat` VALUES ('259', '4', '14', '0');
INSERT INTO `seat` VALUES ('260', '4', '15', '0');
INSERT INTO `seat` VALUES ('261', '4', '16', '0');
INSERT INTO `seat` VALUES ('262', '4', '17', '0');
INSERT INTO `seat` VALUES ('263', '4', '18', '0');
INSERT INTO `seat` VALUES ('264', '4', '19', '0');
INSERT INTO `seat` VALUES ('265', '4', '20', '0');
INSERT INTO `seat` VALUES ('266', '4', '21', '0');
INSERT INTO `seat` VALUES ('267', '4', '22', '0');
INSERT INTO `seat` VALUES ('268', '4', '23', '0');
INSERT INTO `seat` VALUES ('269', '4', '24', '0');
INSERT INTO `seat` VALUES ('270', '4', '25', '0');
INSERT INTO `seat` VALUES ('271', '4', '26', '0');
INSERT INTO `seat` VALUES ('272', '4', '27', '0');
INSERT INTO `seat` VALUES ('273', '4', '28', '0');
INSERT INTO `seat` VALUES ('274', '4', '29', '0');
INSERT INTO `seat` VALUES ('275', '4', '30', '0');
INSERT INTO `seat` VALUES ('276', '4', '31', '0');
INSERT INTO `seat` VALUES ('277', '4', '32', '0');
INSERT INTO `seat` VALUES ('278', '4', '33', '0');
INSERT INTO `seat` VALUES ('279', '4', '34', '0');
INSERT INTO `seat` VALUES ('280', '4', '35', '0');
INSERT INTO `seat` VALUES ('281', '4', '36', '0');
INSERT INTO `seat` VALUES ('282', '4', '37', '0');
INSERT INTO `seat` VALUES ('283', '4', '38', '0');
INSERT INTO `seat` VALUES ('284', '4', '39', '0');
INSERT INTO `seat` VALUES ('285', '4', '40', '0');
INSERT INTO `seat` VALUES ('286', '4', '41', '0');
INSERT INTO `seat` VALUES ('287', '4', '42', '0');
INSERT INTO `seat` VALUES ('288', '4', '43', '0');
INSERT INTO `seat` VALUES ('289', '4', '44', '0');
INSERT INTO `seat` VALUES ('290', '4', '45', '0');
INSERT INTO `seat` VALUES ('291', '4', '46', '0');
INSERT INTO `seat` VALUES ('292', '4', '47', '0');
INSERT INTO `seat` VALUES ('293', '4', '48', '0');
INSERT INTO `seat` VALUES ('294', '4', '49', '0');
INSERT INTO `seat` VALUES ('295', '4', '50', '0');
INSERT INTO `seat` VALUES ('296', '4', '51', '0');
INSERT INTO `seat` VALUES ('297', '4', '52', '0');
INSERT INTO `seat` VALUES ('298', '4', '53', '0');
INSERT INTO `seat` VALUES ('299', '4', '54', '0');
INSERT INTO `seat` VALUES ('300', '4', '55', '0');
INSERT INTO `seat` VALUES ('301', '4', '56', '0');
INSERT INTO `seat` VALUES ('302', '4', '57', '0');
INSERT INTO `seat` VALUES ('303', '4', '58', '0');
INSERT INTO `seat` VALUES ('304', '4', '59', '0');
INSERT INTO `seat` VALUES ('305', '4', '60', '0');
INSERT INTO `seat` VALUES ('306', '4', '61', '0');
INSERT INTO `seat` VALUES ('307', '4', '62', '0');
INSERT INTO `seat` VALUES ('308', '4', '63', '0');
INSERT INTO `seat` VALUES ('309', '4', '64', '0');
INSERT INTO `seat` VALUES ('310', '4', '65', '0');
INSERT INTO `seat` VALUES ('311', '4', '66', '0');
INSERT INTO `seat` VALUES ('312', '4', '67', '0');
INSERT INTO `seat` VALUES ('313', '4', '68', '0');
INSERT INTO `seat` VALUES ('314', '4', '69', '0');
INSERT INTO `seat` VALUES ('315', '4', '70', '0');
INSERT INTO `seat` VALUES ('316', '4', '71', '0');
INSERT INTO `seat` VALUES ('317', '4', '72', '0');
INSERT INTO `seat` VALUES ('318', '4', '73', '0');
INSERT INTO `seat` VALUES ('319', '4', '74', '0');
INSERT INTO `seat` VALUES ('320', '4', '75', '0');
INSERT INTO `seat` VALUES ('321', '4', '76', '0');
INSERT INTO `seat` VALUES ('322', '4', '77', '0');
INSERT INTO `seat` VALUES ('323', '4', '78', '0');
INSERT INTO `seat` VALUES ('324', '4', '79', '0');
INSERT INTO `seat` VALUES ('325', '4', '80', '0');
INSERT INTO `seat` VALUES ('326', '4', '81', '0');
INSERT INTO `seat` VALUES ('327', '5', '1', '0');
INSERT INTO `seat` VALUES ('328', '5', '2', '0');
INSERT INTO `seat` VALUES ('329', '5', '3', '0');
INSERT INTO `seat` VALUES ('330', '5', '4', '0');
INSERT INTO `seat` VALUES ('331', '5', '5', '0');
INSERT INTO `seat` VALUES ('332', '5', '6', '0');
INSERT INTO `seat` VALUES ('333', '5', '7', '0');
INSERT INTO `seat` VALUES ('334', '5', '8', '0');
INSERT INTO `seat` VALUES ('335', '5', '9', '0');
INSERT INTO `seat` VALUES ('336', '5', '10', '0');
INSERT INTO `seat` VALUES ('337', '5', '11', '0');
INSERT INTO `seat` VALUES ('338', '5', '12', '0');
INSERT INTO `seat` VALUES ('339', '5', '13', '0');
INSERT INTO `seat` VALUES ('340', '5', '14', '0');
INSERT INTO `seat` VALUES ('341', '5', '15', '0');
INSERT INTO `seat` VALUES ('342', '5', '16', '0');
INSERT INTO `seat` VALUES ('343', '5', '17', '0');
INSERT INTO `seat` VALUES ('344', '5', '18', '0');
INSERT INTO `seat` VALUES ('345', '5', '19', '0');
INSERT INTO `seat` VALUES ('346', '5', '20', '0');
INSERT INTO `seat` VALUES ('347', '5', '21', '0');
INSERT INTO `seat` VALUES ('348', '5', '22', '0');
INSERT INTO `seat` VALUES ('349', '5', '23', '0');
INSERT INTO `seat` VALUES ('350', '5', '24', '0');
INSERT INTO `seat` VALUES ('351', '5', '25', '0');
INSERT INTO `seat` VALUES ('352', '5', '26', '0');
INSERT INTO `seat` VALUES ('353', '5', '27', '0');
INSERT INTO `seat` VALUES ('354', '5', '28', '0');
INSERT INTO `seat` VALUES ('355', '5', '29', '0');
INSERT INTO `seat` VALUES ('356', '5', '30', '0');
INSERT INTO `seat` VALUES ('357', '5', '31', '0');
INSERT INTO `seat` VALUES ('358', '5', '32', '0');
INSERT INTO `seat` VALUES ('359', '5', '33', '0');
INSERT INTO `seat` VALUES ('360', '5', '34', '0');
INSERT INTO `seat` VALUES ('361', '5', '35', '0');
INSERT INTO `seat` VALUES ('362', '5', '36', '0');
INSERT INTO `seat` VALUES ('363', '5', '37', '0');
INSERT INTO `seat` VALUES ('364', '5', '38', '0');
INSERT INTO `seat` VALUES ('365', '5', '39', '0');
INSERT INTO `seat` VALUES ('366', '5', '40', '0');
INSERT INTO `seat` VALUES ('367', '5', '41', '0');
INSERT INTO `seat` VALUES ('368', '5', '42', '0');
INSERT INTO `seat` VALUES ('369', '5', '43', '0');
INSERT INTO `seat` VALUES ('370', '5', '44', '0');
INSERT INTO `seat` VALUES ('371', '5', '45', '0');
INSERT INTO `seat` VALUES ('372', '5', '46', '0');
INSERT INTO `seat` VALUES ('373', '5', '47', '0');
INSERT INTO `seat` VALUES ('374', '5', '48', '0');
INSERT INTO `seat` VALUES ('375', '5', '49', '0');
INSERT INTO `seat` VALUES ('376', '5', '50', '0');
INSERT INTO `seat` VALUES ('377', '5', '51', '0');
INSERT INTO `seat` VALUES ('378', '5', '52', '0');
INSERT INTO `seat` VALUES ('379', '5', '53', '0');
INSERT INTO `seat` VALUES ('380', '5', '54', '0');
INSERT INTO `seat` VALUES ('381', '5', '55', '0');
INSERT INTO `seat` VALUES ('382', '5', '56', '0');
INSERT INTO `seat` VALUES ('383', '5', '57', '0');
INSERT INTO `seat` VALUES ('384', '5', '58', '0');
INSERT INTO `seat` VALUES ('385', '5', '59', '0');
INSERT INTO `seat` VALUES ('386', '5', '60', '0');
INSERT INTO `seat` VALUES ('387', '5', '61', '0');
INSERT INTO `seat` VALUES ('388', '5', '62', '0');
INSERT INTO `seat` VALUES ('389', '5', '63', '0');
INSERT INTO `seat` VALUES ('390', '5', '64', '0');
INSERT INTO `seat` VALUES ('391', '5', '65', '0');
INSERT INTO `seat` VALUES ('392', '5', '66', '0');
INSERT INTO `seat` VALUES ('393', '5', '67', '0');
INSERT INTO `seat` VALUES ('394', '5', '68', '0');
INSERT INTO `seat` VALUES ('395', '5', '69', '0');
INSERT INTO `seat` VALUES ('396', '5', '70', '0');
INSERT INTO `seat` VALUES ('397', '5', '71', '0');
INSERT INTO `seat` VALUES ('398', '5', '72', '0');
INSERT INTO `seat` VALUES ('399', '5', '73', '0');
INSERT INTO `seat` VALUES ('400', '5', '74', '0');
INSERT INTO `seat` VALUES ('401', '5', '75', '0');
INSERT INTO `seat` VALUES ('402', '5', '76', '0');
INSERT INTO `seat` VALUES ('403', '5', '77', '0');
INSERT INTO `seat` VALUES ('404', '5', '78', '0');
INSERT INTO `seat` VALUES ('405', '5', '79', '0');
INSERT INTO `seat` VALUES ('406', '5', '80', '0');
INSERT INTO `seat` VALUES ('407', '5', '81', '0');
INSERT INTO `seat` VALUES ('408', '6', '1', '0');
INSERT INTO `seat` VALUES ('409', '6', '2', '0');
INSERT INTO `seat` VALUES ('410', '6', '3', '0');
INSERT INTO `seat` VALUES ('411', '6', '4', '0');
INSERT INTO `seat` VALUES ('412', '6', '5', '0');
INSERT INTO `seat` VALUES ('413', '6', '6', '0');
INSERT INTO `seat` VALUES ('414', '6', '7', '0');
INSERT INTO `seat` VALUES ('415', '6', '8', '0');
INSERT INTO `seat` VALUES ('416', '6', '9', '0');
INSERT INTO `seat` VALUES ('417', '6', '10', '0');
INSERT INTO `seat` VALUES ('418', '6', '11', '0');
INSERT INTO `seat` VALUES ('419', '6', '12', '0');
INSERT INTO `seat` VALUES ('420', '6', '13', '0');
INSERT INTO `seat` VALUES ('421', '6', '14', '0');
INSERT INTO `seat` VALUES ('422', '6', '15', '0');
INSERT INTO `seat` VALUES ('423', '6', '16', '0');
INSERT INTO `seat` VALUES ('424', '6', '17', '0');
INSERT INTO `seat` VALUES ('425', '6', '18', '0');
INSERT INTO `seat` VALUES ('426', '6', '19', '0');
INSERT INTO `seat` VALUES ('427', '6', '20', '0');
INSERT INTO `seat` VALUES ('428', '6', '21', '0');
INSERT INTO `seat` VALUES ('429', '6', '22', '0');
INSERT INTO `seat` VALUES ('430', '6', '23', '0');
INSERT INTO `seat` VALUES ('431', '6', '24', '0');
INSERT INTO `seat` VALUES ('432', '6', '25', '0');
INSERT INTO `seat` VALUES ('433', '6', '26', '0');
INSERT INTO `seat` VALUES ('434', '6', '27', '0');
INSERT INTO `seat` VALUES ('435', '6', '28', '0');
INSERT INTO `seat` VALUES ('436', '6', '29', '0');
INSERT INTO `seat` VALUES ('437', '6', '30', '0');
INSERT INTO `seat` VALUES ('438', '6', '31', '0');
INSERT INTO `seat` VALUES ('439', '6', '32', '0');
INSERT INTO `seat` VALUES ('440', '6', '33', '0');
INSERT INTO `seat` VALUES ('441', '6', '34', '0');
INSERT INTO `seat` VALUES ('442', '6', '35', '0');
INSERT INTO `seat` VALUES ('443', '6', '36', '0');
INSERT INTO `seat` VALUES ('444', '6', '37', '0');
INSERT INTO `seat` VALUES ('445', '6', '38', '0');
INSERT INTO `seat` VALUES ('446', '6', '39', '0');
INSERT INTO `seat` VALUES ('447', '6', '40', '0');
INSERT INTO `seat` VALUES ('448', '6', '41', '0');
INSERT INTO `seat` VALUES ('449', '6', '42', '0');
INSERT INTO `seat` VALUES ('450', '6', '43', '0');
INSERT INTO `seat` VALUES ('451', '6', '44', '0');
INSERT INTO `seat` VALUES ('452', '6', '45', '0');
INSERT INTO `seat` VALUES ('453', '6', '46', '0');
INSERT INTO `seat` VALUES ('454', '6', '47', '0');
INSERT INTO `seat` VALUES ('455', '6', '48', '0');
INSERT INTO `seat` VALUES ('456', '6', '49', '0');
INSERT INTO `seat` VALUES ('457', '6', '50', '0');
INSERT INTO `seat` VALUES ('458', '6', '51', '0');
INSERT INTO `seat` VALUES ('459', '6', '52', '0');
INSERT INTO `seat` VALUES ('460', '6', '53', '0');
INSERT INTO `seat` VALUES ('461', '6', '54', '0');
INSERT INTO `seat` VALUES ('462', '6', '55', '0');
INSERT INTO `seat` VALUES ('463', '6', '56', '0');
INSERT INTO `seat` VALUES ('464', '6', '57', '0');
INSERT INTO `seat` VALUES ('465', '6', '58', '0');
INSERT INTO `seat` VALUES ('466', '6', '59', '0');
INSERT INTO `seat` VALUES ('467', '6', '60', '0');
INSERT INTO `seat` VALUES ('468', '6', '61', '0');
INSERT INTO `seat` VALUES ('469', '6', '62', '0');
INSERT INTO `seat` VALUES ('470', '6', '63', '0');
INSERT INTO `seat` VALUES ('471', '6', '64', '0');
INSERT INTO `seat` VALUES ('472', '6', '65', '0');
INSERT INTO `seat` VALUES ('473', '6', '66', '0');
INSERT INTO `seat` VALUES ('474', '6', '67', '0');
INSERT INTO `seat` VALUES ('475', '6', '68', '0');
INSERT INTO `seat` VALUES ('476', '6', '69', '0');
INSERT INTO `seat` VALUES ('477', '6', '70', '0');
INSERT INTO `seat` VALUES ('478', '6', '71', '0');
INSERT INTO `seat` VALUES ('479', '6', '72', '0');
INSERT INTO `seat` VALUES ('480', '6', '73', '0');
INSERT INTO `seat` VALUES ('481', '6', '74', '0');
INSERT INTO `seat` VALUES ('482', '6', '75', '0');
INSERT INTO `seat` VALUES ('483', '6', '76', '0');
INSERT INTO `seat` VALUES ('484', '6', '77', '0');
INSERT INTO `seat` VALUES ('485', '6', '78', '0');
INSERT INTO `seat` VALUES ('486', '6', '79', '0');
INSERT INTO `seat` VALUES ('487', '6', '80', '0');
INSERT INTO `seat` VALUES ('488', '6', '81', '0');
INSERT INTO `ticket` VALUES ('23', '001', '1', '4', '55', '2013-01-28 20:05:12');
INSERT INTO `ticket` VALUES ('24', '001', '1', '5', '55', '2013-01-28 20:05:13');
INSERT INTO `ticket` VALUES ('25', '001', '2', '4', '55', '2013-01-28 21:29:56');
INSERT INTO `ticket` VALUES ('26', '001', '35', '4', '10', '2013-01-28 21:47:37');
INSERT INTO `ticket` VALUES ('27', '001', '35', '5', '10', '2013-01-28 21:47:37');
INSERT INTO `user_guanzhu` VALUES ('4', '1', '001');
INSERT INTO `user_guanzhu` VALUES ('5', '2', '001');
INSERT INTO `user_guanzhu` VALUES ('6', '5', '001');
INSERT INTO `user_guanzhu` VALUES ('7', '9', '001');
INSERT INTO `user_guanzhu` VALUES ('8', '6', '001');
INSERT INTO `user_guanzhu` VALUES ('9', '26', '001');
INSERT INTO `user_guanzhu` VALUES ('10', '24', '001');
INSERT INTO `user_guanzhu` VALUES ('11', '4', '001');
INSERT INTO `user_guanzhu` VALUES ('12', '8', '001');
INSERT INTO `user_guanzhu` VALUES ('13', '7', '001');
INSERT INTO `user_guanzhu` VALUES ('14', '3', '001');
INSERT INTO `user_guanzhu` VALUES ('15', '18', '001');
INSERT INTO `user_guanzhu` VALUES ('16', '13', '001');
INSERT INTO `user_guanzhu` VALUES ('17', '23', '001');
INSERT INTO `user_guanzhu` VALUES ('18', '22', '001');
INSERT INTO `user_guanzhu` VALUES ('19', '29', '001');
INSERT INTO `user_guanzhu` VALUES ('20', '30', '001');
INSERT INTO `user_guanzhu` VALUES ('21', '39', '001');
INSERT INTO `user_guanzhu` VALUES ('22', '37', '001');
INSERT INTO `user_guanzhu` VALUES ('23', '36', '001');
INSERT INTO `user_guanzhu` VALUES ('24', '25', '001');
INSERT INTO `user_guanzhu` VALUES ('25', '1', '002');
INSERT INTO `user_guanzhu` VALUES ('26', '6', '002');
INSERT INTO `user_guanzhu` VALUES ('27', '8', '002');
INSERT INTO `user_guanzhu` VALUES ('28', '3', '002');
INSERT INTO `user_showing` VALUES ('1', '5');
INSERT INTO `user_showing` VALUES ('2', '6');
INSERT INTO `user_showing` VALUES ('3', '7');
INSERT INTO `user_showing` VALUES ('4', '8');
INSERT INTO `user_showing` VALUES ('5', '9');
INSERT INTO `user_will` VALUES ('1', '29');
INSERT INTO `user_will` VALUES ('2', '30');
INSERT INTO `user_will` VALUES ('3', '31');
INSERT INTO `user_will` VALUES ('4', '32');
INSERT INTO `user_will` VALUES ('5', '33');
INSERT INTO `userinfo` VALUES ('001', 'fghgf', '女', '111111', 'dsfdf2@.jkf', '24564745', 'fdgfhfhjhjh', '10', '565');
INSERT INTO `userinfo` VALUES ('002', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('003', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('004', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('005', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('006', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('007', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('008', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('009', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('010', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('011', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('012', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('013', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('014', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('015', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('016', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('017', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('018', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('019', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('020', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('021', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('022', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('023', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('024', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('025', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('026', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('027', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('028', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('029', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('030', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('031', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('032', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('033', 'wang', '男', '0', 'wang@163.com', '2156565', '48713245698', '0', '0');
INSERT INTO `userinfo` VALUES ('111', '111', '男', '111111', '111@.11', '111', '111', '0', '0');
INSERT INTO `userinfo` VALUES ('1111', '1111', '女', '111111', '1111@.1111', '1111', '1111', '0', '0');
INSERT INTO `vip` VALUES ('1', '0', '100', '10');
INSERT INTO `vip` VALUES ('2', '101', '200', '9');
INSERT INTO `vip` VALUES ('3', '201', '400', '8');
INSERT INTO `vip` VALUES ('4', '401', '800', '7');
INSERT INTO `vip` VALUES ('5', '801', '1600', '6');
INSERT INTO `vip` VALUES ('6', '1601', '3200', '5');
