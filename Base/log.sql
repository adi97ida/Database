/*
MySQL Data Transfer
Source Host: 192.168.56.101
Source Database: log
Target Host: 192.168.56.101
Target Database: log
Date: 02/07/2013 21:45:24
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bootlog
-- ----------------------------
CREATE TABLE `bootlog` (
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hostname` char(128) NOT NULL DEFAULT 'UNKNOWN',
  `channel` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for change_name
-- ----------------------------
CREATE TABLE `change_name` (
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `old_name` varchar(30) NOT NULL,
  `new_name` varchar(30) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` char(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for command_log
-- ----------------------------
CREATE TABLE `command_log` (
  `userid` varchar(70) DEFAULT NULL,
  `server` varchar(70) DEFAULT NULL,
  `ip` char(15) NOT NULL DEFAULT '',
  `port` varchar(70) DEFAULT NULL,
  `username` varchar(70) DEFAULT NULL,
  `command` varchar(70) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cube
-- ----------------------------
CREATE TABLE `cube` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `x` int(11) unsigned NOT NULL DEFAULT '0',
  `y` int(11) unsigned NOT NULL DEFAULT '0',
  `item_vnum` int(11) unsigned NOT NULL DEFAULT '0',
  `item_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_count` int(5) unsigned NOT NULL DEFAULT '0',
  `success` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `item_vnum` (`item_vnum`),
  KEY `item_uid` (`item_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dragon_slay_log
-- ----------------------------
CREATE TABLE `dragon_slay_log` (
  `1` varchar(16) NOT NULL,
  `2` varchar(16) NOT NULL,
  `3` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `4` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for fish_log
-- ----------------------------
CREATE TABLE `fish_log` (
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `player_id` int(10) unsigned NOT NULL DEFAULT '0',
  `map_index` tinyint(4) NOT NULL DEFAULT '0',
  `fish_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fishing_level` int(11) NOT NULL DEFAULT '0',
  `waiting_time` int(11) NOT NULL DEFAULT '0',
  `success` tinyint(4) NOT NULL DEFAULT '0',
  `size` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for goldlog
-- ----------------------------
CREATE TABLE `goldlog` (
  `date` varchar(10) NOT NULL DEFAULT '0000-00-00',
  `time` varchar(8) NOT NULL DEFAULT '00:00:00',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `what` int(11) NOT NULL DEFAULT '0',
  `how` set('BUY','SELL','SHOP_SELL','SHOP_BUY','EXCHANGE_TAKE','EXCHANGE_GIVE','QUEST') DEFAULT NULL,
  `hint` varchar(50) DEFAULT NULL,
  KEY `date_idx` (`date`),
  KEY `pid_idx` (`pid`),
  KEY `what_idx` (`what`),
  KEY `how_idx` (`how`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hack_crc_log
-- ----------------------------
CREATE TABLE `hack_crc_log` (
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login` char(16) NOT NULL DEFAULT '',
  `name` char(24) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `server` char(100) NOT NULL DEFAULT '',
  `why` char(255) NOT NULL DEFAULT '',
  `crc` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hack_log
-- ----------------------------
CREATE TABLE `hack_log` (
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login` char(16) NOT NULL DEFAULT '',
  `name` char(24) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `server` char(100) NOT NULL DEFAULT '',
  `why` char(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hackshield_log
-- ----------------------------
CREATE TABLE `hackshield_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `account_id` int(20) DEFAULT NULL,
  `login` char(16) NOT NULL DEFAULT '',
  `pid` int(20) DEFAULT NULL,
  `name` char(24) NOT NULL DEFAULT '',
  `reason` varchar(20) DEFAULT NULL,
  `ip` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for levellog
-- ----------------------------
CREATE TABLE `levellog` (
  `name` char(24) NOT NULL DEFAULT '',
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `account_id` int(20) DEFAULT NULL,
  `pid` int(20) DEFAULT NULL,
  `playtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for log
-- ----------------------------
CREATE TABLE `log` (
  `type` enum('ITEM','CHARACTER') NOT NULL DEFAULT 'ITEM',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `who` int(10) unsigned NOT NULL DEFAULT '0',
  `x` int(10) unsigned NOT NULL DEFAULT '0',
  `y` int(10) unsigned NOT NULL DEFAULT '0',
  `what` int(11) NOT NULL DEFAULT '0',
  `how` varchar(50) NOT NULL DEFAULT '',
  `hint` varchar(50) DEFAULT NULL,
  `ip` char(15) NOT NULL DEFAULT '',
  `vnum` int(11) NOT NULL DEFAULT '0',
  KEY `who_idx` (`who`),
  KEY `what_idx` (`what`),
  KEY `how_idx` (`how`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for loginlog
-- ----------------------------
CREATE TABLE `loginlog` (
  `type` enum('LOGIN','LOGOUT') DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `channel` tinyint(4) DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `job` tinyint(4) DEFAULT NULL,
  `playtime` int(10) unsigned DEFAULT NULL,
  KEY `pid` (`pid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for loginlog2
-- ----------------------------
CREATE TABLE `loginlog2` (
  `id` int(20) DEFAULT NULL,
  `type` enum('VALID','INVALID') DEFAULT NULL,
  `is_gm` int(11) DEFAULT NULL,
  `login_time` datetime DEFAULT '0000-00-00 00:00:00',
  `channel` tinyint(4) DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT NULL,
  `ip` char(15) NOT NULL DEFAULT '',
  `client_version` varchar(20) DEFAULT NULL,
  `logout_time` datetime DEFAULT '0000-00-00 00:00:00',
  `playtime` int(10) unsigned DEFAULT NULL,
  KEY `pid` (`pid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for money_log
-- ----------------------------
CREATE TABLE `money_log` (
  `time` datetime DEFAULT NULL,
  `type` enum('MONSTER','SHOP','REFINE','QUEST','GUILD','MISC','KILL','DROP') DEFAULT NULL,
  `vnum` int(11) NOT NULL DEFAULT '0',
  `gold` int(11) NOT NULL DEFAULT '0',
  KEY `type` (`type`,`vnum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for pcbang_loginlog
-- ----------------------------
CREATE TABLE `pcbang_loginlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `pcbang_id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '000.000.000.000',
  `pid` int(10) unsigned DEFAULT NULL,
  `play_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `pcbang_id` (`pcbang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for quest_reward_log
-- ----------------------------
CREATE TABLE `quest_reward_log` (
  `quest_name` varchar(32) DEFAULT NULL,
  `player_id` int(10) unsigned DEFAULT NULL,
  `player_level` tinyint(4) DEFAULT NULL,
  `reward_type` enum('EXP','ITEM') DEFAULT NULL,
  `reward_value1` int(10) unsigned DEFAULT NULL,
  `reward_value2` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  KEY `player_id` (`player_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for refinelog
-- ----------------------------
CREATE TABLE `refinelog` (
  `pid` int(10) unsigned DEFAULT NULL,
  `item_name` varchar(24) NOT NULL DEFAULT '',
  `item_id` int(11) NOT NULL DEFAULT '0',
  `step` varchar(50) NOT NULL DEFAULT '',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_success` tinyint(1) NOT NULL DEFAULT '0',
  `setType` set('SOCKET','POWER','ROD','GUILD','SCROLL','HYUNIRON','GOD_SCROLL') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for shout_log
-- ----------------------------
CREATE TABLE `shout_log` (
  `time` datetime DEFAULT '0000-00-00 00:00:00',
  `channel` tinyint(4) DEFAULT NULL,
  `empire` tinyint(4) DEFAULT NULL,
  `shout` varchar(64) DEFAULT NULL,
  KEY `time_idx` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for speed_hack
-- ----------------------------
CREATE TABLE `speed_hack` (
  `pid` int(10) unsigned DEFAULT NULL,
  `time` datetime DEFAULT '0000-00-00 00:00:00',
  `x` int(10) unsigned NOT NULL DEFAULT '0',
  `y` int(10) unsigned NOT NULL DEFAULT '0',
  `hack_count` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for vcard_log
-- ----------------------------
CREATE TABLE `vcard_log` (
  `vcard_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `x` int(11) unsigned NOT NULL DEFAULT '0',
  `y` int(11) unsigned NOT NULL DEFAULT '0',
  `hostname` char(128) NOT NULL DEFAULT 'UNKNOWN',
  `giver_name` varchar(30) NOT NULL,
  `giver_ip` char(15) NOT NULL DEFAULT '',
  `taker_name` varchar(30) NOT NULL,
  `taker_ip` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`vcard_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
