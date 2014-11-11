/*
MySQL Data Transfer
Source Host: 192.168.0.16
Source Database: player
Target Host: 192.168.0.16
Target Database: player
Date: 17/08/2013 11:22:48
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for affect
-- ----------------------------
CREATE TABLE `affect` (
  `dwPID` int(10) unsigned NOT NULL DEFAULT '0',
  `bType` smallint(5) unsigned NOT NULL DEFAULT '0',
  `bApplyOn` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `lApplyValue` int(11) NOT NULL DEFAULT '0',
  `dwFlag` int(10) unsigned NOT NULL DEFAULT '0',
  `lDuration` int(11) NOT NULL DEFAULT '0',
  `lSPCost` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dwPID`,`bType`,`bApplyOn`,`lApplyValue`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for banword
-- ----------------------------
CREATE TABLE `banword` (
  `word` varbinary(24) NOT NULL DEFAULT '',
  PRIMARY KEY (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for card
-- ----------------------------
CREATE TABLE `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cash` varchar(255) DEFAULT NULL,
  `prices` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `lock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=big5;

-- ----------------------------
-- Table structure for change_empire
-- ----------------------------
CREATE TABLE `change_empire` (
  `change_count` int(11) NOT NULL DEFAULT '0',
  `account_id` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`change_count`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for craft_item
-- ----------------------------
CREATE TABLE `craft_item` (
  `vnum` int(11) NOT NULL,
  `count` tinyint(3) NOT NULL,
  `lvl_min_craft` tinyint(3) DEFAULT NULL,
  `plvl_min` tinyint(3) DEFAULT NULL,
  `prob` tinyint(3) NOT NULL,
  `cost` int(11) DEFAULT NULL,
  `id_refine` int(11) DEFAULT NULL,
  `type` enum('Arme','Armure','Bijou','ItemShop','Autre') NOT NULL DEFAULT 'Arme',
  PRIMARY KEY (`vnum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for craft_refine
-- ----------------------------
CREATE TABLE `craft_refine` (
  `id` int(11) NOT NULL DEFAULT '0',
  `vnum1` int(11) DEFAULT NULL,
  `count1` tinyint(3) DEFAULT NULL,
  `vnum2` int(11) DEFAULT NULL,
  `count2` tinyint(3) DEFAULT NULL,
  `vnum3` int(11) DEFAULT NULL,
  `count3` tinyint(3) DEFAULT NULL,
  `vnum4` int(11) DEFAULT NULL,
  `count4` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for event071115_name
-- ----------------------------
CREATE TABLE `event071115_name` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ruid` int(11) NOT NULL DEFAULT '0',
  `account` varchar(50) NOT NULL DEFAULT '',
  `uid` int(8) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `account_id` int(8) NOT NULL DEFAULT '0',
  `player_id` int(8) NOT NULL DEFAULT '0',
  `old_name` varchar(50) NOT NULL DEFAULT '',
  `new_name` varchar(50) NOT NULL DEFAULT '',
  `ipaddress` varchar(16) NOT NULL DEFAULT '',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `old_name` (`old_name`),
  KEY `new_name` (`new_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for guild
-- ----------------------------
CREATE TABLE `guild` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(12) NOT NULL DEFAULT '',
  `sp` smallint(6) NOT NULL DEFAULT '1000',
  `master` int(10) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) DEFAULT NULL,
  `exp` int(11) DEFAULT NULL,
  `skill_point` tinyint(2) NOT NULL DEFAULT '0',
  `skill` tinyblob,
  `win` int(11) NOT NULL DEFAULT '0',
  `draw` int(11) NOT NULL DEFAULT '0',
  `loss` int(11) NOT NULL DEFAULT '0',
  `ladder_point` int(11) NOT NULL DEFAULT '0',
  `gold` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for guild_comment
-- ----------------------------
CREATE TABLE `guild_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(8) DEFAULT NULL,
  `notice` tinyint(4) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aaa` (`notice`,`id`,`guild_id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for guild_grade
-- ----------------------------
CREATE TABLE `guild_grade` (
  `guild_id` int(11) NOT NULL DEFAULT '0',
  `grade` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(8) NOT NULL DEFAULT '',
  `auth` set('ADD_MEMBER','REMOVE_MEMEBER','NOTICE','USE_SKILL') DEFAULT NULL,
  PRIMARY KEY (`guild_id`,`grade`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for guild_member
-- ----------------------------
CREATE TABLE `guild_member` (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `guild_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grade` tinyint(2) DEFAULT NULL,
  `is_general` tinyint(1) NOT NULL DEFAULT '0',
  `offer` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`guild_id`,`pid`),
  UNIQUE KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for guild_war
-- ----------------------------
CREATE TABLE `guild_war` (
  `id_from` int(11) NOT NULL DEFAULT '0',
  `id_to` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_from`,`id_to`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for guild_war_bet
-- ----------------------------
CREATE TABLE `guild_war_bet` (
  `login` varchar(24) NOT NULL DEFAULT '',
  `gold` int(10) unsigned NOT NULL DEFAULT '0',
  `guild` int(11) NOT NULL DEFAULT '0',
  `war_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`war_id`,`login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for guild_war_reservation
-- ----------------------------
CREATE TABLE `guild_war_reservation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guild1` int(10) unsigned NOT NULL DEFAULT '0',
  `guild2` int(10) unsigned NOT NULL DEFAULT '0',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `warprice` int(10) unsigned NOT NULL DEFAULT '0',
  `initscore` int(10) unsigned NOT NULL DEFAULT '0',
  `started` tinyint(1) NOT NULL DEFAULT '0',
  `bet_from` int(10) unsigned NOT NULL DEFAULT '0',
  `bet_to` int(10) unsigned NOT NULL DEFAULT '0',
  `winner` int(11) NOT NULL DEFAULT '-1',
  `power1` int(11) NOT NULL DEFAULT '0',
  `power2` int(11) NOT NULL DEFAULT '0',
  `handicap` int(11) NOT NULL DEFAULT '0',
  `result1` int(11) NOT NULL DEFAULT '0',
  `result2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for highscore
-- ----------------------------
CREATE TABLE `highscore` (
  `pid` int(11) NOT NULL DEFAULT '0',
  `board` varchar(0) DEFAULT NULL,
  `value` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for horse_name
-- ----------------------------
CREATE TABLE `horse_name` (
  `id` int(12) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for item
-- ----------------------------
CREATE TABLE `item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0',
  `window` enum('INVENTORY','EQUIPMENT','SAFEBOX','MALL','DRAGON_SOUL_INVENTORY') NOT NULL DEFAULT 'INVENTORY',
  `pos` smallint(5) unsigned NOT NULL DEFAULT '0',
  `count` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `vnum` int(11) unsigned NOT NULL DEFAULT '0',
  `socket0` int(10) unsigned NOT NULL DEFAULT '0',
  `socket1` int(10) unsigned NOT NULL DEFAULT '0',
  `socket2` int(10) unsigned NOT NULL DEFAULT '0',
  `socket3` int(10) unsigned NOT NULL DEFAULT '0',
  `socket4` int(10) unsigned NOT NULL DEFAULT '0',
  `socket5` int(10) unsigned NOT NULL DEFAULT '0',
  `attrtype0` tinyint(4) NOT NULL DEFAULT '0',
  `attrvalue0` smallint(6) NOT NULL DEFAULT '0',
  `attrtype1` tinyint(4) NOT NULL DEFAULT '0',
  `attrvalue1` smallint(6) NOT NULL DEFAULT '0',
  `attrtype2` tinyint(4) NOT NULL DEFAULT '0',
  `attrvalue2` smallint(6) NOT NULL DEFAULT '0',
  `attrtype3` tinyint(4) NOT NULL DEFAULT '0',
  `attrvalue3` smallint(6) NOT NULL DEFAULT '0',
  `attrtype4` tinyint(4) NOT NULL DEFAULT '0',
  `attrvalue4` smallint(6) NOT NULL DEFAULT '0',
  `attrtype5` tinyint(4) NOT NULL DEFAULT '0',
  `attrvalue5` smallint(6) NOT NULL DEFAULT '0',
  `attrtype6` tinyint(4) NOT NULL DEFAULT '0',
  `attrvalue6` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner_id_idx` (`owner_id`),
  KEY `item_vnum_index` (`vnum`)
) ENGINE=MyISAM AUTO_INCREMENT=30000018 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for item_attr
-- ----------------------------
CREATE TABLE `item_attr` (
  `apply` enum('MAX_HP','MAX_SP','CON','INT','STR','DEX','ATT_SPEED','MOV_SPEED','CAST_SPEED','HP_REGEN','SP_REGEN','POISON_PCT','STUN_PCT','SLOW_PCT','CRITICAL_PCT','PENETRATE_PCT','ATTBONUS_HUMAN','ATTBONUS_ANIMAL','ATTBONUS_ORC','ATTBONUS_MILGYO','ATTBONUS_UNDEAD','ATTBONUS_DEVIL','STEAL_HP','STEAL_SP','MANA_BURN_PCT','DAMAGE_SP_RECOVER','BLOCK','DODGE','RESIST_SWORD','RESIST_TWOHAND','RESIST_DAGGER','RESIST_BELL','RESIST_FAN','RESIST_BOW','RESIST_FIRE','RESIST_ELEC','RESIST_MAGIC','RESIST_WIND','REFLECT_MELEE','REFLECT_CURSE','POISON_REDUCE','KILL_SP_RECOVER','EXP_DOUBLE_BONUS','GOLD_DOUBLE_BONUS','ITEM_DROP_BONUS','POTION_BONUS','KILL_HP_RECOVER','IMMUNE_STUN','IMMUNE_SLOW','IMMUNE_FALL','SKILL','BOW_DISTANCE','ATT_GRADE_BONUS','DEF_GRADE_BONUS','MAGIC_ATT_GRADE','MAGIC_DEF_GRADE','CURSE_PCT','MAX_STAMINA','ATT_BONUS_TO_WARRIOR','ATT_BONUS_TO_ASSASSIN','ATT_BONUS_TO_SURA','ATT_BONUS_TO_SHAMAN','NORMAL_HIT_DEFEND_BONUS','SKILL_DEFEND_BONUS','NOUSE1','NOUSE2''NOUSE3','NOUSE4','NOUSE5','NOUSE6','NOUSE7','NOUSE8','NOUSE9','NOUSE10','NOUSE11','NOUSE12','NOUSE13','NOUSE14','RESIST_WARRIOR','RESIST_ASSASSIN','RESIST_SURA','RESIST_SHAMAN') NOT NULL DEFAULT 'MAX_HP',
  `prob` varchar(100) NOT NULL DEFAULT '',
  `lv1` varchar(100) NOT NULL DEFAULT '',
  `lv2` varchar(100) NOT NULL DEFAULT '',
  `lv3` varchar(100) NOT NULL DEFAULT '',
  `lv4` varchar(100) NOT NULL DEFAULT '',
  `lv5` varchar(100) NOT NULL DEFAULT '',
  `weapon` varchar(100) NOT NULL DEFAULT '',
  `body` varchar(100) NOT NULL DEFAULT '',
  `wrist` varchar(100) NOT NULL DEFAULT '',
  `foots` varchar(100) NOT NULL DEFAULT '',
  `neck` varchar(100) NOT NULL DEFAULT '',
  `head` varchar(100) NOT NULL DEFAULT '',
  `shield` varchar(100) NOT NULL DEFAULT '',
  `ear` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for item_attr_rare
-- ----------------------------
CREATE TABLE `item_attr_rare` (
  `apply` enum('MAX_HP','MAX_SP','CON','INT','STR','DEX','ATT_SPEED','MOV_SPEED','CAST_SPEED','HP_REGEN','SP_REGEN','POISON_PCT','STUN_PCT','SLOW_PCT','CRITICAL_PCT','PENETRATE_PCT','ATTBONUS_HUMAN','ATTBONUS_ANIMAL','ATTBONUS_ORC','ATTBONUS_MILGYO','ATTBONUS_UNDEAD','ATTBONUS_DEVIL','STEAL_HP','STEAL_SP','MANA_BURN_PCT','DAMAGE_SP_RECOVER','BLOCK','DODGE','RESIST_SWORD','RESIST_TWOHAND','RESIST_DAGGER','RESIST_BELL','RESIST_FAN','RESIST_BOW','RESIST_FIRE','RESIST_ELEC','RESIST_MAGIC','RESIST_WIND','REFLECT_MELEE','REFLECT_CURSE','POISON_REDUCE','KILL_SP_RECOVER','EXP_DOUBLE_BONUS','GOLD_DOUBLE_BONUS','ITEM_DROP_BONUS','POTION_BONUS','KILL_HP_RECOVER','IMMUNE_STUN','IMMUNE_SLOW','IMMUNE_FALL','SKILL','BOW_DISTANCE','ATT_GRADE_BONUS','DEF_GRADE_BONUS','MAGIC_ATT_GRADE','MAGIC_DEF_GRADE','CURSE_PCT','MAX_STAMINA','ATT_BONUS_TO_WARRIOR','ATT_BONUS_TO_ASSASSIN','ATT_BONUS_TO_SURA','ATT_BONUS_TO_SHAMAN','ATT_BONUS_TO_MONSTER','NORMAL_HIT_DEFEND_BONUS','SKILL_DEFEND_BONUS','NOUSE2''NOUSE3','NOUSE4','NOUSE5','NOUSE6','NOUSE7','NOUSE8','NOUSE9','NOUSE10','NOUSE11','NOUSE12','NOUSE13','NOUSE14','RESIST_WARRIOR','RESIST_ASSASSIN','RESIST_SURA','RESIST_SHAMAN') NOT NULL DEFAULT 'MAX_HP',
  `prob` varchar(100) NOT NULL DEFAULT '',
  `lv1` varchar(100) NOT NULL DEFAULT '',
  `lv2` varchar(100) NOT NULL DEFAULT '',
  `lv3` varchar(100) NOT NULL DEFAULT '',
  `lv4` varchar(100) NOT NULL DEFAULT '',
  `lv5` varchar(100) NOT NULL DEFAULT '',
  `weapon` varchar(100) NOT NULL DEFAULT '',
  `body` varchar(100) NOT NULL DEFAULT '',
  `wrist` varchar(100) NOT NULL DEFAULT '',
  `foots` varchar(100) NOT NULL DEFAULT '',
  `neck` varchar(100) NOT NULL DEFAULT '',
  `head` varchar(100) NOT NULL DEFAULT '',
  `shield` varchar(100) NOT NULL DEFAULT '',
  `ear` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for item_award
-- ----------------------------
CREATE TABLE `item_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `login` varchar(30) NOT NULL DEFAULT '',
  `vnum` int(6) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `given_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taken_time` datetime DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `why` varchar(128) DEFAULT NULL,
  `socket0` int(11) NOT NULL DEFAULT '0',
  `socket1` int(11) NOT NULL DEFAULT '0',
  `socket2` int(11) NOT NULL DEFAULT '0',
  `mall` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid_idx` (`pid`),
  KEY `given_time_idx` (`given_time`),
  KEY `taken_time_idx` (`taken_time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for item_proto
-- ----------------------------
CREATE TABLE `item_proto` (
  `vnum` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `subtype` tinyint(2) NOT NULL DEFAULT '0',
  `name` varbinary(24) NOT NULL DEFAULT 'Noname',
  `locale_name` varbinary(24) NOT NULL DEFAULT 'Noname',
  `gold` int(11) DEFAULT '0',
  `shop_buy_price` int(10) unsigned NOT NULL DEFAULT '0',
  `weight` tinyint(3) DEFAULT '0',
  `size` tinyint(3) DEFAULT '0',
  `flag` int(11) DEFAULT '0',
  `wearflag` int(11) DEFAULT '0',
  `antiflag` int(11) DEFAULT '0',
  `immuneflag` set('PARA','CURSE','STUN','SLEEP','SLOW','POISON','TERROR') NOT NULL DEFAULT '',
  `refined_vnum` int(10) unsigned NOT NULL DEFAULT '0',
  `refine_set` smallint(11) unsigned NOT NULL DEFAULT '0',
  `magic_pct` tinyint(4) NOT NULL DEFAULT '0',
  `socket_pct` tinyint(4) NOT NULL DEFAULT '0',
  `addon_type` smallint(6) NOT NULL DEFAULT '0',
  `limittype0` tinyint(4) DEFAULT '0',
  `limitvalue0` int(11) DEFAULT '0',
  `limittype1` tinyint(4) DEFAULT '0',
  `limitvalue1` int(11) DEFAULT '0',
  `applytype0` tinyint(4) DEFAULT '0',
  `applyvalue0` int(11) DEFAULT '0',
  `applytype1` tinyint(4) DEFAULT '0',
  `applyvalue1` int(11) DEFAULT '0',
  `applytype2` tinyint(4) DEFAULT '0',
  `applyvalue2` int(11) DEFAULT '0',
  `value0` int(11) DEFAULT '0',
  `value1` int(11) DEFAULT '0',
  `value2` int(11) DEFAULT '0',
  `value3` int(11) DEFAULT '0',
  `value4` int(11) DEFAULT '0',
  `value5` int(11) DEFAULT '0',
  PRIMARY KEY (`vnum`)
) ENGINE=MyISAM DEFAULT CHARSET=big5;

-- ----------------------------
-- Table structure for land
-- ----------------------------
CREATE TABLE `land` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `map_index` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(10) unsigned NOT NULL DEFAULT '0',
  `guild_level_limit` tinyint(4) NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `enable` enum('YES','NO') NOT NULL DEFAULT 'NO',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for lotto_list
-- ----------------------------
CREATE TABLE `lotto_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server` varchar(20) DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for marriage
-- ----------------------------
CREATE TABLE `marriage` (
  `is_married` tinyint(4) NOT NULL DEFAULT '0',
  `pid1` int(10) unsigned NOT NULL DEFAULT '0',
  `pid2` int(10) unsigned NOT NULL DEFAULT '0',
  `love_point` int(11) DEFAULT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid1`,`pid2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for messenger_list
-- ----------------------------
CREATE TABLE `messenger_list` (
  `account` varchar(12) NOT NULL DEFAULT '',
  `companion` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`account`,`companion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mob_proto
-- ----------------------------
CREATE TABLE `mob_proto` (
  `vnum` int(11) NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL DEFAULT 'Noname',
  `locale_name` varbinary(24) NOT NULL DEFAULT 'Noname',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `rank` tinyint(2) NOT NULL DEFAULT '0',
  `battle_type` tinyint(1) NOT NULL DEFAULT '0',
  `level` smallint(3) NOT NULL DEFAULT '1',
  `size` set('SMALL','MEDIUM','BIG') DEFAULT NULL,
  `ai_flag` set('AGGR','NOMOVE','COWARD','NOATTSHINSU','NOATTCHUNJO','NOATTJINNO','ATTMOB','BERSERK','STONESKIN','GODSPEED','DEATHBLOW','REVIVE') DEFAULT NULL,
  `setRaceFlag` set('ANIMAL','UNDEAD','DEVIL','HUMAN','ORC','MILGYO','INSECT','FIRE','ICE','DESERT') NOT NULL DEFAULT '',
  `setImmuneFlag` set('STUN','SLOW','FALL','CURSE','POISON','TERROR') NOT NULL DEFAULT '',
  `on_click` tinyint(4) NOT NULL DEFAULT '0',
  `empire` tinyint(4) NOT NULL DEFAULT '0',
  `drop_item` int(10) unsigned NOT NULL DEFAULT '0',
  `resurrection_vnum` int(10) unsigned NOT NULL DEFAULT '0',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `st` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dx` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ht` smallint(5) unsigned NOT NULL DEFAULT '0',
  `iq` smallint(5) unsigned NOT NULL DEFAULT '0',
  `damage_min` smallint(5) unsigned NOT NULL DEFAULT '0',
  `damage_max` smallint(5) unsigned NOT NULL DEFAULT '0',
  `max_hp` int(10) unsigned NOT NULL DEFAULT '0',
  `regen_cycle` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `regen_percent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `exp` int(10) unsigned NOT NULL DEFAULT '0',
  `gold_min` int(11) NOT NULL DEFAULT '0',
  `gold_max` int(11) NOT NULL DEFAULT '0',
  `def` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attack_speed` smallint(6) unsigned NOT NULL DEFAULT '100',
  `move_speed` smallint(6) unsigned NOT NULL DEFAULT '100',
  `aggressive_hp_pct` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `aggressive_sight` smallint(10) unsigned NOT NULL DEFAULT '0',
  `attack_range` smallint(5) unsigned NOT NULL DEFAULT '0',
  `polymorph_item` int(10) unsigned NOT NULL DEFAULT '0',
  `enchant_curse` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `enchant_slow` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `enchant_poison` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `enchant_stun` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enchant_critical` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enchant_penetrate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `resist_sword` tinyint(4) NOT NULL DEFAULT '0',
  `resist_twohand` tinyint(4) NOT NULL DEFAULT '0',
  `resist_dagger` tinyint(4) NOT NULL DEFAULT '0',
  `resist_bell` tinyint(4) NOT NULL DEFAULT '0',
  `resist_fan` tinyint(4) NOT NULL DEFAULT '0',
  `resist_bow` tinyint(4) NOT NULL DEFAULT '0',
  `resist_fire` tinyint(4) NOT NULL DEFAULT '0',
  `resist_elect` tinyint(4) NOT NULL DEFAULT '0',
  `resist_magic` tinyint(4) NOT NULL DEFAULT '0',
  `resist_wind` tinyint(4) NOT NULL DEFAULT '0',
  `resist_poison` tinyint(4) NOT NULL DEFAULT '0',
  `dam_multiply` float DEFAULT NULL,
  `summon` int(11) DEFAULT NULL,
  `drain_sp` int(11) DEFAULT NULL,
  `skill_level0` tinyint(3) unsigned DEFAULT NULL,
  `skill_vnum0` int(10) unsigned DEFAULT NULL,
  `skill_level1` tinyint(3) unsigned DEFAULT NULL,
  `skill_vnum1` int(10) unsigned DEFAULT NULL,
  `skill_level2` tinyint(3) unsigned DEFAULT NULL,
  `skill_vnum2` int(10) unsigned DEFAULT NULL,
  `skill_level3` tinyint(3) unsigned DEFAULT NULL,
  `skill_vnum3` int(10) unsigned DEFAULT NULL,
  `skill_level4` tinyint(3) unsigned DEFAULT NULL,
  `skill_vnum4` int(10) unsigned DEFAULT NULL,
  `sp_berserk` tinyint(4) NOT NULL DEFAULT '0',
  `sp_stoneskin` tinyint(4) NOT NULL DEFAULT '0',
  `sp_godspeed` tinyint(4) NOT NULL DEFAULT '0',
  `sp_deathblow` tinyint(4) NOT NULL DEFAULT '0',
  `sp_revive` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vnum`)
) ENGINE=MyISAM DEFAULT CHARSET=big5;

-- ----------------------------
-- Table structure for monarch
-- ----------------------------
CREATE TABLE `monarch` (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(16) DEFAULT 'NONAME',
  `empire` int(10) unsigned NOT NULL DEFAULT '0',
  `windate` bigint(20) unsigned DEFAULT '0',
  `money` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for monarch_candidacy
-- ----------------------------
CREATE TABLE `monarch_candidacy` (
  `vote` bigint(10) NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `account_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` bigint(10) DEFAULT '0',
  `windate` bigint(10) DEFAULT '0',
  `name` varchar(16) DEFAULT 'NONAME',
  `empire` int(1) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for monarch_election
-- ----------------------------
CREATE TABLE `monarch_election` (
  `pid2` int(10) unsigned NOT NULL DEFAULT '0',
  `account_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for myshop_pricelist
-- ----------------------------
CREATE TABLE `myshop_pricelist` (
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0',
  `item_vnum` int(11) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `list_id` (`owner_id`,`item_vnum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for object
-- ----------------------------
CREATE TABLE `object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `land_id` int(11) NOT NULL DEFAULT '0',
  `vnum` int(10) unsigned NOT NULL DEFAULT '0',
  `map_index` int(11) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `x_rot` float NOT NULL DEFAULT '0',
  `y_rot` float NOT NULL DEFAULT '0',
  `z_rot` float NOT NULL DEFAULT '0',
  `life` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for object_proto
-- ----------------------------
CREATE TABLE `object_proto` (
  `vnum` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `materials` varchar(64) NOT NULL DEFAULT '',
  `upgrade_vnum` int(10) unsigned NOT NULL DEFAULT '0',
  `upgrade_limit_time` int(10) unsigned NOT NULL DEFAULT '0',
  `life` int(11) NOT NULL DEFAULT '0',
  `reg_1` int(11) NOT NULL DEFAULT '0',
  `reg_2` int(11) NOT NULL DEFAULT '0',
  `reg_3` int(11) NOT NULL DEFAULT '0',
  `reg_4` int(11) NOT NULL DEFAULT '0',
  `npc` int(10) unsigned NOT NULL DEFAULT '0',
  `group_vnum` int(10) unsigned NOT NULL DEFAULT '0',
  `dependent_group` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`vnum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for pcbang_ip
-- ----------------------------
CREATE TABLE `pcbang_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pcbang_id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '000.000.000.000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`),
  KEY `pcbang_id` (`pcbang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for player
-- ----------------------------
CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(12) NOT NULL DEFAULT 'NONAME',
  `job` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `voice` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dir` tinyint(2) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `z` int(11) NOT NULL DEFAULT '0',
  `map_index` int(11) NOT NULL DEFAULT '0',
  `exit_x` int(11) NOT NULL DEFAULT '0',
  `exit_y` int(11) NOT NULL DEFAULT '0',
  `exit_map_index` int(11) NOT NULL DEFAULT '0',
  `hp` smallint(4) NOT NULL DEFAULT '0',
  `mp` smallint(4) NOT NULL DEFAULT '0',
  `stamina` smallint(6) NOT NULL DEFAULT '0',
  `random_hp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `random_sp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `playtime` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level_step` tinyint(1) NOT NULL DEFAULT '0',
  `st` smallint(3) NOT NULL DEFAULT '0',
  `ht` smallint(3) NOT NULL DEFAULT '0',
  `dx` smallint(3) NOT NULL DEFAULT '0',
  `iq` smallint(3) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `gold` int(11) NOT NULL DEFAULT '0',
  `stat_point` smallint(3) NOT NULL DEFAULT '0',
  `skill_point` smallint(3) NOT NULL DEFAULT '0',
  `quickslot` tinyblob,
  `ip` varchar(15) DEFAULT '0.0.0.0',
  `part_main` smallint(6) NOT NULL DEFAULT '0',
  `part_base` smallint(6) NOT NULL DEFAULT '0',
  `part_hair` smallint(6) NOT NULL DEFAULT '0',
  `skill_group` tinyint(4) NOT NULL DEFAULT '0',
  `skill_level` blob,
  `alignment` int(11) NOT NULL DEFAULT '0',
  `last_play` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `change_name` tinyint(1) NOT NULL DEFAULT '0',
  `mobile` varchar(12) DEFAULT '',
  `sub_skill_point` smallint(3) NOT NULL DEFAULT '0',
  `stat_reset_count` tinyint(4) NOT NULL DEFAULT '0',
  `horse_hp` smallint(4) NOT NULL DEFAULT '0',
  `horse_stamina` smallint(4) NOT NULL DEFAULT '0',
  `horse_level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `horse_hp_droptime` int(10) unsigned NOT NULL DEFAULT '0',
  `horse_riding` tinyint(1) NOT NULL DEFAULT '0',
  `horse_skill_point` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `account_id_idx` (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for player_deleted
-- ----------------------------
CREATE TABLE `player_deleted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(12) NOT NULL DEFAULT 'NONAME',
  `job` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `voice` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dir` tinyint(2) NOT NULL DEFAULT '0',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `z` int(11) NOT NULL DEFAULT '0',
  `map_index` int(11) NOT NULL DEFAULT '0',
  `exit_x` int(11) NOT NULL DEFAULT '0',
  `exit_y` int(11) NOT NULL DEFAULT '0',
  `exit_map_index` int(11) NOT NULL DEFAULT '0',
  `hp` smallint(4) NOT NULL DEFAULT '0',
  `mp` smallint(4) NOT NULL DEFAULT '0',
  `stamina` smallint(6) NOT NULL DEFAULT '0',
  `random_hp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `random_sp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `playtime` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level_step` tinyint(1) NOT NULL DEFAULT '0',
  `st` smallint(3) NOT NULL DEFAULT '0',
  `ht` smallint(3) NOT NULL DEFAULT '0',
  `dx` smallint(3) NOT NULL DEFAULT '0',
  `iq` smallint(3) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `gold` int(11) NOT NULL DEFAULT '0',
  `stat_point` smallint(3) NOT NULL DEFAULT '0',
  `skill_point` smallint(3) NOT NULL DEFAULT '0',
  `quickslot` tinyblob,
  `ip` varchar(15) DEFAULT '0.0.0.0',
  `part_main` smallint(6) NOT NULL DEFAULT '0',
  `part_base` smallint(6) NOT NULL DEFAULT '0',
  `part_hair` smallint(6) NOT NULL DEFAULT '0',
  `skill_group` tinyint(4) NOT NULL DEFAULT '0',
  `skill_level` blob,
  `alignment` int(11) NOT NULL DEFAULT '0',
  `last_play` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `change_name` tinyint(1) NOT NULL DEFAULT '0',
  `mobile` varchar(12) DEFAULT '',
  `sub_skill_point` smallint(3) NOT NULL DEFAULT '0',
  `stat_reset_count` tinyint(4) NOT NULL DEFAULT '0',
  `horse_hp` smallint(4) NOT NULL DEFAULT '0',
  `horse_stamina` smallint(4) NOT NULL DEFAULT '0',
  `horse_level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `horse_hp_droptime` int(10) unsigned NOT NULL DEFAULT '0',
  `horse_riding` tinyint(1) NOT NULL DEFAULT '0',
  `horse_skill_point` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `account_id_idx` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for player_index
-- ----------------------------
CREATE TABLE `player_index` (
  `id` int(11) NOT NULL DEFAULT '0',
  `pid1` int(11) NOT NULL DEFAULT '0',
  `pid2` int(11) NOT NULL DEFAULT '0',
  `pid3` int(11) NOT NULL DEFAULT '0',
  `pid4` int(11) NOT NULL DEFAULT '0',
  `empire` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid1_key` (`pid1`),
  KEY `pid2_key` (`pid2`),
  KEY `pid3_key` (`pid3`),
  KEY `pid4_key` (`pid4`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for player_secure
-- ----------------------------
CREATE TABLE `player_secure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(8) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `mot_de_passe` varchar(50) NOT NULL DEFAULT '',
  `account_id` int(8) NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for quest
-- ----------------------------
CREATE TABLE `quest` (
  `dwPID` int(10) unsigned NOT NULL DEFAULT '0',
  `szName` varchar(32) NOT NULL DEFAULT '',
  `szState` varchar(64) NOT NULL DEFAULT '',
  `lValue` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dwPID`,`szName`,`szState`),
  KEY `pid_idx` (`dwPID`),
  KEY `name_idx` (`szName`),
  KEY `state_idx` (`szState`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for refine_proto
-- ----------------------------
CREATE TABLE `refine_proto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vnum0` int(10) unsigned NOT NULL DEFAULT '0',
  `count0` smallint(6) NOT NULL DEFAULT '0',
  `vnum1` int(10) unsigned NOT NULL DEFAULT '0',
  `count1` smallint(6) NOT NULL DEFAULT '0',
  `vnum2` int(10) unsigned NOT NULL DEFAULT '0',
  `count2` smallint(6) NOT NULL DEFAULT '0',
  `vnum3` int(10) unsigned NOT NULL DEFAULT '0',
  `count3` smallint(6) NOT NULL DEFAULT '0',
  `vnum4` int(10) unsigned NOT NULL DEFAULT '0',
  `count4` smallint(6) NOT NULL DEFAULT '0',
  `cost` int(11) NOT NULL DEFAULT '0',
  `src_vnum` int(10) unsigned NOT NULL DEFAULT '0',
  `result_vnum` int(10) unsigned NOT NULL DEFAULT '0',
  `prob` smallint(6) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7004 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for safebox
-- ----------------------------
CREATE TABLE `safebox` (
  `account_id` int(10) unsigned NOT NULL DEFAULT '0',
  `size` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `password` varchar(6) NOT NULL DEFAULT '',
  `gold` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
CREATE TABLE `shop` (
  `vnum` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT 'Noname',
  `npc_vnum` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vnum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for shop_item
-- ----------------------------
CREATE TABLE `shop_item` (
  `shop_vnum` int(11) NOT NULL DEFAULT '0',
  `item_vnum` int(11) NOT NULL DEFAULT '0',
  `count` tinyint(4) unsigned NOT NULL DEFAULT '1',
  UNIQUE KEY `vnum_unique` (`shop_vnum`,`item_vnum`,`count`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for skill_proto
-- ----------------------------
CREATE TABLE `skill_proto` (
  `dwVnum` int(11) NOT NULL DEFAULT '0',
  `szName` varbinary(32) NOT NULL DEFAULT '',
  `bType` tinyint(4) NOT NULL DEFAULT '0',
  `bLevelStep` tinyint(4) NOT NULL DEFAULT '0',
  `bMaxLevel` tinyint(4) NOT NULL DEFAULT '0',
  `bLevelLimit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `szPointOn` varchar(100) NOT NULL DEFAULT '0',
  `szPointPoly` varchar(100) NOT NULL DEFAULT '',
  `szSPCostPoly` varchar(100) NOT NULL DEFAULT '',
  `szDurationPoly` varchar(100) NOT NULL DEFAULT '',
  `szDurationSPCostPoly` varchar(100) NOT NULL DEFAULT '',
  `szCooldownPoly` varchar(100) NOT NULL DEFAULT '',
  `szMasterBonusPoly` varchar(100) NOT NULL DEFAULT '',
  `szAttackGradePoly` varchar(100) NOT NULL DEFAULT '',
  `setFlag` set('ATTACK','USE_MELEE_DAMAGE','COMPUTE_ATTGRADE','SELFONLY','USE_MAGIC_DAMAGE','USE_HP_AS_COST','COMPUTE_MAGIC_DAMAGE','SPLASH','GIVE_PENALTY','USE_ARROW_DAMAGE','PENETRATE','IGNORE_TARGET_RATING','ATTACK_SLOW','ATTACK_STUN','HP_ABSORB','SP_ABSORB','ATTACK_FIRE_CONT','REMOVE_BAD_AFFECT','REMOVE_GOOD_AFFECT','CRUSH','ATTACK_POISON','TOGGLE','DISABLE_BY_POINT_UP','CRUSH_LONG') DEFAULT NULL,
  `setAffectFlag` enum('YMIR','INVISIBILITY','SPAWN','POISON','SLOW','STUN','DUNGEON_READY','FORCE_VISIBLE','BUILDING_CONSTRUCTION_SMALL','BUILDING_CONSTRUCTION_LARGE','BUILDING_UPGRADE','MOV_SPEED_POTION','ATT_SPEED_POTION','FISH_MIDE','JEONGWIHON','GEOMGYEONG','CHEONGEUN','GYEONGGONG','EUNHYUNG','GWIGUM','TERROR','JUMAGAP','HOSIN','BOHO','KWAESOK','MANASHIELD','MUYEONG','REVIVE_INVISIBLE','FIRE','GICHEON','JEUNGRYEOK') NOT NULL DEFAULT 'YMIR',
  `szPointOn2` varchar(100) NOT NULL DEFAULT 'NONE',
  `szPointPoly2` varchar(100) NOT NULL DEFAULT '',
  `szDurationPoly2` varchar(100) NOT NULL DEFAULT '',
  `setAffectFlag2` enum('YMIR','INVISIBILITY','SPAWN','POISON','SLOW','STUN','DUNGEON_READY','FORCE_VISIBLE','BUILDING_CONSTRUCTION_SMALL','BUILDING_CONSTRUCTION_LARGE','BUILDING_UPGRADE','MOV_SPEED_POTION','ATT_SPEED_POTION','FISH_MIDE','JEONGWIHON','GEOMGYEONG','CHEONGEUN','GYEONGGONG','EUNHYUNG','GWIGUM','TERROR','JUMAGAP','HOSIN','BOHO','KWAESOK','MANASHIELD') NOT NULL DEFAULT 'YMIR',
  `szPointOn3` varchar(100) NOT NULL DEFAULT 'NONE',
  `szPointPoly3` varchar(100) NOT NULL DEFAULT '',
  `szDurationPoly3` varchar(100) NOT NULL DEFAULT '',
  `szGrandMasterAddSPCostPoly` varchar(100) NOT NULL DEFAULT '',
  `prerequisiteSkillVnum` int(11) NOT NULL DEFAULT '0',
  `prerequisiteSkillLevel` int(11) NOT NULL DEFAULT '0',
  `eSkillType` enum('NORMAL','MELEE','RANGE','MAGIC') NOT NULL DEFAULT 'NORMAL',
  `iMaxHit` tinyint(4) NOT NULL DEFAULT '0',
  `szSplashAroundDamageAdjustPoly` varchar(100) NOT NULL DEFAULT '1',
  `dwTargetRange` int(11) NOT NULL DEFAULT '1000',
  `dwSplashRange` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dwVnum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sms_pool
-- ----------------------------
CREATE TABLE `sms_pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server` int(11) NOT NULL DEFAULT '0',
  `sender` varchar(32) DEFAULT NULL,
  `receiver` varchar(100) NOT NULL DEFAULT '',
  `mobile` varchar(32) DEFAULT NULL,
  `sent` enum('N','Y') NOT NULL DEFAULT 'N',
  `msg` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sent_idx` (`sent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for string
-- ----------------------------
CREATE TABLE `string` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `text` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `banword` VALUES ('ancule');
INSERT INTO `banword` VALUES ('anculer');
INSERT INTO `banword` VALUES ('anculez');
INSERT INTO `banword` VALUES ('aryan');
INSERT INTO `banword` VALUES ('asshole');
INSERT INTO `banword` VALUES ('bastard');
INSERT INTO `banword` VALUES ('bastards');
INSERT INTO `banword` VALUES ('batar');
INSERT INTO `banword` VALUES ('batard');
INSERT INTO `banword` VALUES ('bitch');
INSERT INTO `banword` VALUES ('bitches');
INSERT INTO `banword` VALUES ('bitching');
INSERT INTO `banword` VALUES ('bitchy');
INSERT INTO `banword` VALUES ('bite');
INSERT INTO `banword` VALUES ('boob');
INSERT INTO `banword` VALUES ('boobie');
INSERT INTO `banword` VALUES ('boobies');
INSERT INTO `banword` VALUES ('boobs');
INSERT INTO `banword` VALUES ('booby');
INSERT INTO `banword` VALUES ('boobys');
INSERT INTO `banword` VALUES ('branler');
INSERT INTO `banword` VALUES ('branlete');
INSERT INTO `banword` VALUES ('branlette');
INSERT INTO `banword` VALUES ('branlez');
INSERT INTO `banword` VALUES ('branller');
INSERT INTO `banword` VALUES ('branllete');
INSERT INTO `banword` VALUES ('branllette');
INSERT INTO `banword` VALUES ('branllez');
INSERT INTO `banword` VALUES ('bullshit');
INSERT INTO `banword` VALUES ('bullshitter');
INSERT INTO `banword` VALUES ('bullshitters');
INSERT INTO `banword` VALUES ('bullshitting');
INSERT INTO `banword` VALUES ('chatte');
INSERT INTO `banword` VALUES ('chickenshit');
INSERT INTO `banword` VALUES ('chickenshits');
INSERT INTO `banword` VALUES ('clit');
INSERT INTO `banword` VALUES ('clitoris');
INSERT INTO `banword` VALUES ('cock');
INSERT INTO `banword` VALUES ('cockhead');
INSERT INTO `banword` VALUES ('cocks');
INSERT INTO `banword` VALUES ('cocksuck');
INSERT INTO `banword` VALUES ('cocksucker');
INSERT INTO `banword` VALUES ('cocksucking');
INSERT INTO `banword` VALUES ('conar');
INSERT INTO `banword` VALUES ('conard');
INSERT INTO `banword` VALUES ('conase');
INSERT INTO `banword` VALUES ('conasse');
INSERT INTO `banword` VALUES ('connar');
INSERT INTO `banword` VALUES ('connard');
INSERT INTO `banword` VALUES ('connase');
INSERT INTO `banword` VALUES ('connasse');
INSERT INTO `banword` VALUES ('criss');
INSERT INTO `banword` VALUES ('cumming');
INSERT INTO `banword` VALUES ('cunt');
INSERT INTO `banword` VALUES ('cuntree');
INSERT INTO `banword` VALUES ('cuntry');
INSERT INTO `banword` VALUES ('cunts');
INSERT INTO `banword` VALUES ('dipshit');
INSERT INTO `banword` VALUES ('dipshits');
INSERT INTO `banword` VALUES ('dumbfuck');
INSERT INTO `banword` VALUES ('dumbfucks');
INSERT INTO `banword` VALUES ('dumbshit');
INSERT INTO `banword` VALUES ('dumbshits');
INSERT INTO `banword` VALUES ('encule');
INSERT INTO `banword` VALUES ('enculer');
INSERT INTO `banword` VALUES ('enculez');
INSERT INTO `banword` VALUES ('fag');
INSERT INTO `banword` VALUES ('faggot');
INSERT INTO `banword` VALUES ('faggots');
INSERT INTO `banword` VALUES ('faggy');
INSERT INTO `banword` VALUES ('fags');
INSERT INTO `banword` VALUES ('fdp');
INSERT INTO `banword` VALUES ('filsdepute');
INSERT INTO `banword` VALUES ('fuck');
INSERT INTO `banword` VALUES ('fucka');
INSERT INTO `banword` VALUES ('fucke');
INSERT INTO `banword` VALUES ('fucked');
INSERT INTO `banword` VALUES ('fucken');
INSERT INTO `banword` VALUES ('fucker');
INSERT INTO `banword` VALUES ('fuckers');
INSERT INTO `banword` VALUES ('fuckface');
INSERT INTO `banword` VALUES ('fuckhead');
INSERT INTO `banword` VALUES ('fuckheads');
INSERT INTO `banword` VALUES ('fuckhed');
INSERT INTO `banword` VALUES ('fuckin');
INSERT INTO `banword` VALUES ('fucking');
INSERT INTO `banword` VALUES ('fucks');
INSERT INTO `banword` VALUES ('fuckup');
INSERT INTO `banword` VALUES ('fuckups');
INSERT INTO `banword` VALUES ('fukk');
INSERT INTO `banword` VALUES ('fukka');
INSERT INTO `banword` VALUES ('golem');
INSERT INTO `banword` VALUES ('goniff');
INSERT INTO `banword` VALUES ('gueule');
INSERT INTO `banword` VALUES ('heb');
INSERT INTO `banword` VALUES ('hebe');
INSERT INTO `banword` VALUES ('hebes');
INSERT INTO `banword` VALUES ('kike');
INSERT INTO `banword` VALUES ('kikes');
INSERT INTO `banword` VALUES ('kunt');
INSERT INTO `banword` VALUES ('kuntree');
INSERT INTO `banword` VALUES ('kuntry');
INSERT INTO `banword` VALUES ('kunts');
INSERT INTO `banword` VALUES ('levrete');
INSERT INTO `banword` VALUES ('levrette');
INSERT INTO `banword` VALUES ('merd');
INSERT INTO `banword` VALUES ('merde');
INSERT INTO `banword` VALUES ('motherfuck');
INSERT INTO `banword` VALUES ('motherfucken');
INSERT INTO `banword` VALUES ('motherfucker');
INSERT INTO `banword` VALUES ('motherfuckers');
INSERT INTO `banword` VALUES ('motherfuckin');
INSERT INTO `banword` VALUES ('motherfucking');
INSERT INTO `banword` VALUES ('necrofile');
INSERT INTO `banword` VALUES ('necrophile');
INSERT INTO `banword` VALUES ('nigga');
INSERT INTO `banword` VALUES ('niggah');
INSERT INTO `banword` VALUES ('niggahs');
INSERT INTO `banword` VALUES ('niggard');
INSERT INTO `banword` VALUES ('niggardly');
INSERT INTO `banword` VALUES ('niggas');
INSERT INTO `banword` VALUES ('niggaz');
INSERT INTO `banword` VALUES ('nigger');
INSERT INTO `banword` VALUES ('niggers');
INSERT INTO `banword` VALUES ('pd');
INSERT INTO `banword` VALUES ('pedofile');
INSERT INTO `banword` VALUES ('pedophile');
INSERT INTO `banword` VALUES ('penis');
INSERT INTO `banword` VALUES ('petace');
INSERT INTO `banword` VALUES ('petasse');
INSERT INTO `banword` VALUES ('pettace');
INSERT INTO `banword` VALUES ('pettasse');
INSERT INTO `banword` VALUES ('piper');
INSERT INTO `banword` VALUES ('pipeuse');
INSERT INTO `banword` VALUES ('pipez');
INSERT INTO `banword` VALUES ('piss');
INSERT INTO `banword` VALUES ('porn');
INSERT INTO `banword` VALUES ('porno');
INSERT INTO `banword` VALUES ('pornography');
INSERT INTO `banword` VALUES ('pouf');
INSERT INTO `banword` VALUES ('pouff');
INSERT INTO `banword` VALUES ('pouffiace');
INSERT INTO `banword` VALUES ('pouffiasse');
INSERT INTO `banword` VALUES ('poufiace');
INSERT INTO `banword` VALUES ('poufiasse');
INSERT INTO `banword` VALUES ('prostipute');
INSERT INTO `banword` VALUES ('pussy');
INSERT INTO `banword` VALUES ('putain');
INSERT INTO `banword` VALUES ('pute');
INSERT INTO `banword` VALUES ('putin');
INSERT INTO `banword` VALUES ('puttain');
INSERT INTO `banword` VALUES ('putte');
INSERT INTO `banword` VALUES ('puttin');
INSERT INTO `banword` VALUES ('pédé');
INSERT INTO `banword` VALUES ('salaud');
INSERT INTO `banword` VALUES ('salaupe');
INSERT INTO `banword` VALUES ('salop');
INSERT INTO `banword` VALUES ('salope');
INSERT INTO `banword` VALUES ('saloppe');
INSERT INTO `banword` VALUES ('scatofile');
INSERT INTO `banword` VALUES ('scatophile');
INSERT INTO `banword` VALUES ('schlimazel');
INSERT INTO `banword` VALUES ('schlimiel');
INSERT INTO `banword` VALUES ('shit');
INSERT INTO `banword` VALUES ('shitface');
INSERT INTO `banword` VALUES ('shitfaced');
INSERT INTO `banword` VALUES ('shithead');
INSERT INTO `banword` VALUES ('shitheads');
INSERT INTO `banword` VALUES ('shithed');
INSERT INTO `banword` VALUES ('shits');
INSERT INTO `banword` VALUES ('shitting');
INSERT INTO `banword` VALUES ('shitty');
INSERT INTO `banword` VALUES ('slut');
INSERT INTO `banword` VALUES ('sluts');
INSERT INTO `banword` VALUES ('slutty');
INSERT INTO `banword` VALUES ('sodomie');
INSERT INTO `banword` VALUES ('sodomisateur');
INSERT INTO `banword` VALUES ('tabanac');
INSERT INTO `banword` VALUES ('tabarnak');
INSERT INTO `banword` VALUES ('tepu');
INSERT INTO `banword` VALUES ('tg');
INSERT INTO `banword` VALUES ('titties');
INSERT INTO `banword` VALUES ('titty');
INSERT INTO `banword` VALUES ('vagina');
INSERT INTO `banword` VALUES ('vaginal');
INSERT INTO `banword` VALUES ('whore');
INSERT INTO `banword` VALUES ('whores');
INSERT INTO `banword` VALUES ('whoring');
INSERT INTO `banword` VALUES ('yeule');
INSERT INTO `banword` VALUES ('zoofile');
INSERT INTO `banword` VALUES ('zoophile');
INSERT INTO `craft_item` VALUES ('19', '1', '10', null, '100', '1000', '2', 'Arme');
INSERT INTO `craft_item` VALUES ('28810', '1', '25', null, '60', '101325', '1', 'Autre');
INSERT INTO `craft_refine` VALUES ('1', '28710', '1', null, null, null, null, null, null);
INSERT INTO `craft_refine` VALUES ('2', '10', '1', '27987', '2', '27991', '1', '27995', '1');
INSERT INTO `item` VALUES ('30000001', '1', 'EQUIPMENT', '7', '1', '72702', '0', '3', '2984', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000002', '1', 'INVENTORY', '0', '1', '50053', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000003', '1', 'EQUIPMENT', '0', '1', '20009', '28543', '28538', '28539', '0', '0', '0', '31', '10', '33', '6', '32', '6', '1', '1500', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000004', '1', 'EQUIPMENT', '4', '1', '469', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000005', '1', 'EQUIPMENT', '2', '1', '15399', '0', '0', '0', '0', '0', '0', '1', '1500', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000006', '1', 'INVENTORY', '40', '1', '53001', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000007', '1', 'INVENTORY', '41', '1', '53002', '1378400422', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000008', '1', 'INVENTORY', '42', '1', '53003', '1387040423', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000009', '1', 'INVENTORY', '43', '1', '53005', '1387040431', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000010', '1', 'INVENTORY', '44', '1', '53006', '1387040434', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000011', '1', 'INVENTORY', '39', '1', '53012', '1387040444', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000012', '1', 'INVENTORY', '37', '1', '53011', '1387040447', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000013', '1', 'INVENTORY', '36', '1', '53010', '1387040448', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000014', '1', 'INVENTORY', '38', '1', '53013', '1387040477', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000015', '1', 'INVENTORY', '35', '1', '53007', '1387040505', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000016', '1', 'EQUIPMENT', '19', '1', '41003', '1379264561', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item` VALUES ('30000017', '1', 'EQUIPMENT', '20', '1', '45011', '1376759142', '0', '0', '0', '0', '0', '20', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('MAX_HP', '35', '500', '1000', '1500', '1500', '2000', '0', '5', '5', '5', '5', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('MAX_SP', '35', '10', '50', '80', '100', '200', '0', '0', '5', '5', '5', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('CON', '11', '2', '4', '6', '8', '12', '5', '0', '0', '0', '0', '0', '5', '0');
INSERT INTO `item_attr` VALUES ('INT', '11', '2', '4', '6', '8', '12', '5', '0', '0', '0', '0', '0', '5', '0');
INSERT INTO `item_attr` VALUES ('STR', '11', '2', '4', '6', '8', '12', '5', '0', '0', '0', '0', '0', '5', '0');
INSERT INTO `item_attr` VALUES ('DEX', '11', '2', '4', '6', '8', '12', '5', '0', '0', '0', '0', '0', '5', '0');
INSERT INTO `item_attr` VALUES ('ATT_SPEED', '8', '1', '2', '3', '5', '8', '0', '0', '0', '5', '0', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('MOV_SPEED', '18', '2', '4', '6', '10', '20', '0', '0', '0', '5', '0', '0', '0', '5');
INSERT INTO `item_attr` VALUES ('CAST_SPEED', '8', '2', '4', '6', '10', '20', '5', '5', '0', '0', '0', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('HP_REGEN', '65', '4', '8', '12', '20', '30', '0', '0', '0', '0', '5', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('SP_REGEN', '65', '4', '8', '12', '20', '30', '0', '0', '0', '0', '5', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('POISON_PCT', '8', '1', '2', '3', '5', '8', '5', '0', '0', '0', '0', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('STUN_PCT', '18', '1', '2', '3', '5', '8', '5', '0', '0', '5', '5', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('SLOW_PCT', '35', '1', '2', '3', '5', '8', '5', '0', '0', '5', '0', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('CRITICAL_PCT', '18', '1', '2', '3', '5', '10', '5', '0', '0', '5', '5', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('PENETRATE_PCT', '30', '1', '2', '3', '5', '10', '5', '0', '5', '0', '5', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('ATTBONUS_HUMAN', '10', '1', '2', '3', '5', '10', '5', '0', '5', '0', '0', '5', '5', '5');
INSERT INTO `item_attr` VALUES ('ATTBONUS_ANIMAL', '35', '2', '4', '6', '10', '20', '5', '0', '5', '0', '0', '5', '5', '5');
INSERT INTO `item_attr` VALUES ('ATTBONUS_ORC', '35', '2', '4', '6', '10', '20', '5', '0', '5', '0', '0', '5', '5', '5');
INSERT INTO `item_attr` VALUES ('ATTBONUS_MILGYO', '35', '2', '4', '6', '10', '20', '5', '0', '5', '0', '0', '5', '5', '5');
INSERT INTO `item_attr` VALUES ('ATTBONUS_UNDEAD', '35', '2', '4', '6', '10', '20', '5', '0', '5', '0', '0', '5', '5', '5');
INSERT INTO `item_attr` VALUES ('ATTBONUS_DEVIL', '35', '2', '4', '6', '10', '20', '5', '0', '5', '0', '0', '5', '5', '5');
INSERT INTO `item_attr` VALUES ('STEAL_HP', '50', '1', '2', '3', '5', '10', '0', '5', '5', '0', '0', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('STEAL_SP', '50', '1', '2', '3', '5', '10', '0', '5', '0', '0', '5', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('MANA_BURN_PCT', '18', '1', '2', '3', '5', '10', '0', '0', '5', '0', '0', '0', '0', '5');
INSERT INTO `item_attr` VALUES ('BLOCK', '10', '2', '4', '6', '10', '15', '0', '0', '0', '0', '0', '0', '5', '0');
INSERT INTO `item_attr` VALUES ('DODGE', '10', '2', '4', '6', '10', '15', '0', '0', '0', '5', '0', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('RESIST_SWORD', '18', '2', '4', '6', '10', '15', '0', '5', '0', '5', '5', '0', '0', '5');
INSERT INTO `item_attr` VALUES ('RESIST_TWOHAND', '18', '2', '4', '6', '10', '15', '0', '5', '0', '5', '5', '0', '0', '5');
INSERT INTO `item_attr` VALUES ('RESIST_DAGGER', '18', '2', '4', '6', '10', '15', '0', '5', '0', '5', '5', '0', '0', '5');
INSERT INTO `item_attr` VALUES ('RESIST_BELL', '18', '2', '4', '6', '10', '15', '0', '5', '0', '5', '5', '0', '0', '5');
INSERT INTO `item_attr` VALUES ('RESIST_FAN', '18', '2', '4', '6', '10', '15', '0', '5', '0', '5', '5', '0', '0', '5');
INSERT INTO `item_attr` VALUES ('RESIST_BOW', '18', '2', '4', '6', '10', '15', '0', '5', '0', '5', '5', '0', '0', '5');
INSERT INTO `item_attr` VALUES ('RESIST_FIRE', '18', '2', '4', '6', '10', '15', '0', '5', '5', '0', '0', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('RESIST_ELEC', '18', '2', '4', '6', '10', '15', '0', '5', '5', '0', '0', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('RESIST_MAGIC', '25', '2', '4', '6', '10', '15', '0', '5', '5', '0', '0', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('RESIST_WIND', '18', '2', '4', '6', '10', '15', '0', '5', '5', '0', '0', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('REFLECT_MELEE', '18', '1', '2', '3', '6', '10', '0', '5', '0', '0', '0', '0', '5', '0');
INSERT INTO `item_attr` VALUES ('POISON_REDUCE', '18', '1', '2', '3', '4', '5', '0', '0', '0', '0', '0', '0', '0', '5');
INSERT INTO `item_attr` VALUES ('EXP_DOUBLE_BONUS', '10', '2', '4', '6', '8', '20', '0', '0', '0', '5', '5', '0', '5', '0');
INSERT INTO `item_attr` VALUES ('GOLD_DOUBLE_BONUS', '10', '2', '4', '6', '8', '20', '0', '0', '0', '5', '5', '0', '5', '0');
INSERT INTO `item_attr` VALUES ('ITEM_DROP_BONUS', '7', '2', '4', '6', '8', '20', '0', '0', '5', '0', '0', '0', '0', '5');
INSERT INTO `item_attr` VALUES ('IMMUNE_STUN', '3', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `item_attr` VALUES ('IMMUNE_SLOW', '3', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `item_attr` VALUES ('ATT_GRADE_BONUS', '0', '5', '10', '15', '30', '50', '0', '5', '0', '0', '0', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('ATT_BONUS_TO_WARRIOR', '0', '5', '5', '6', '10', '15', '5', '0', '0', '5', '0', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('ATT_BONUS_TO_ASSASSIN', '0', '5', '5', '6', '10', '15', '5', '0', '0', '5', '0', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('ATT_BONUS_TO_SURA', '0', '5', '6', '10', '15', '20', '5', '0', '0', '5', '0', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('ATT_BONUS_TO_SHAMAN', '0', '5', '5', '6', '10', '15', '5', '0', '0', '5', '0', '5', '0', '0');
INSERT INTO `item_attr` VALUES ('RESIST_WARRIOR', '0', '5', '5', '6', '10', '15', '0', '5', '0', '0', '5', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('RESIST_ASSASSIN', '0', '5', '5', '6', '10', '15', '0', '5', '0', '0', '5', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('RESIST_SURA', '0', '5', '5', '6', '10', '15', '0', '5', '0', '0', '5', '0', '0', '0');
INSERT INTO `item_attr` VALUES ('RESIST_SHAMAN', '0', '5', '5', '6', '10', '15', '0', '5', '0', '0', '5', '0', '0', '0');
INSERT INTO `item_attr_rare` VALUES ('MAX_HP', '1', '500', '1000', '1500', '1500', '2000', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('MAX_SP', '1', '10', '50', '80', '100', '200', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('CON', '1', '2', '4', '6', '8', '12', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('INT', '1', '2', '4', '6', '8', '12', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('STR', '1', '2', '4', '6', '8', '12', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('DEX', '1', '2', '4', '6', '8', '12', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('CRITICAL_PCT', '1', '1', '2', '3', '5', '10', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('PENETRATE_PCT', '1', '1', '2', '3', '5', '10', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('ATT_GRADE_BONUS', '1', '50', '50', '50', '50', '50', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('ATT_BONUS_TO_MONSTER', '1', '10', '10', '10', '10', '10', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('ATT_BONUS_TO_WARRIOR', '1', '10', '10', '10', '10', '10', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('ATT_BONUS_TO_ASSASSIN', '1', '10', '10', '10', '10', '10', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('ATT_BONUS_TO_SURA', '1', '10', '10', '10', '10', '10', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('ATT_BONUS_TO_SHAMAN', '1', '10', '10', '10', '10', '10', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('RESIST_WARRIOR', '1', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('RESIST_ASSASSIN', '1', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('RESIST_SURA', '1', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('RESIST_SHAMAN', '1', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('ATT_SPEED', '1', '1', '2', '3', '5', '8', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `item_attr_rare` VALUES ('MOV_SPEED', '1', '2', '4', '6', '10', '20', '5', '5', '5', '5', '5', '5', '5', '5');
INSERT INTO `land` VALUES ('1', '1', '20200', '10000', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('2', '1', '23500', '13600', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('3', '1', '27600', '10900', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('4', '1', '55600', '9600', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('5', '1', '57100', '3800', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('6', '1', '60900', '5200', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('7', '1', '66100', '7900', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('8', '1', '81400', '16800', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('9', '1', '90700', '20400', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('10', '1', '94300', '23700', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('11', '1', '10800', '108500', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('12', '1', '5900', '108500', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('13', '1', '7700', '104300', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('14', '1', '23400', '46200', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('15', '1', '17200', '44400', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('16', '1', '20000', '40100', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('17', '1', '25800', '36900', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('18', '1', '16900', '35800', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('19', '21', '29400', '11400', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('20', '21', '33600', '12700', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('21', '21', '36300', '16300', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('22', '21', '55900', '17200', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('23', '21', '72800', '8500', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('24', '21', '76300', '5400', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('25', '21', '77600', '10200', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('26', '21', '84200', '47200', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('27', '21', '87800', '61000', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('28', '21', '32100', '113800', '3000', '3000', '0', '10', '45000000', 'YES');
INSERT INTO `land` VALUES ('29', '21', '28800', '117200', '3000', '3000', '0', '10', '45000000', 'YES');
INSERT INTO `land` VALUES ('30', '21', '24400', '118700', '3000', '3000', '0', '10', '45000000', 'YES');
INSERT INTO `land` VALUES ('31', '21', '22600', '114400', '3000', '3000', '0', '10', '45000000', 'YES');
INSERT INTO `land` VALUES ('32', '21', '34800', '92300', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('33', '21', '37500', '89000', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('34', '21', '35100', '73600', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('35', '21', '35400', '69200', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('36', '21', '35400', '55600', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('37', '41', '66100', '9400', '3000', '3000', '0', '10', '45000000', 'YES');
INSERT INTO `land` VALUES ('38', '41', '70300', '7900', '3000', '3000', '0', '10', '45000000', 'YES');
INSERT INTO `land` VALUES ('39', '41', '73600', '11500', '3000', '3000', '0', '10', '45000000', 'YES');
INSERT INTO `land` VALUES ('40', '41', '70900', '15100', '3000', '3000', '0', '10', '45000000', 'YES');
INSERT INTO `land` VALUES ('41', '41', '71800', '61900', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('42', '41', '77000', '64100', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('43', '41', '60700', '66800', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('44', '41', '74500', '68200', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('45', '41', '67900', '110800', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('46', '41', '67900', '115700', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('47', '41', '62800', '114800', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('48', '41', '16600', '95300', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('49', '41', '5400', '94100', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('50', '41', '18600', '89300', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('51', '41', '4600', '89800', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('52', '41', '11200', '36000', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('53', '41', '8200', '31800', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('54', '41', '12000', '29200', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('55', '4', '9600', '13100', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('56', '4', '16100', '15600', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('57', '4', '9100', '19500', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('58', '4', '14900', '19500', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('59', '4', '27700', '19500', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('60', '4', '23600', '23000', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('61', '4', '31800', '24200', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('62', '4', '27900', '27300', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('63', '4', '35500', '35400', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('64', '4', '32800', '39300', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('65', '4', '39700', '39600', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('66', '4', '36100', '42700', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('67', '4', '24400', '39000', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('68', '4', '19900', '41600', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('69', '4', '14400', '41700', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('70', '4', '10200', '39100', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('71', '4', '7700', '34600', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('72', '4', '8400', '29500', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('73', '24', '7100', '5200', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('74', '24', '12800', '4800', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('75', '24', '9700', '9900', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('76', '24', '14500', '13300', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('77', '24', '36900', '26000', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('78', '24', '38600', '29800', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('79', '24', '36500', '33900', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('80', '24', '33600', '38600', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('81', '24', '30900', '33500', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('82', '24', '25700', '33500', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('83', '24', '25600', '37800', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('84', '24', '20900', '37800', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('85', '24', '20900', '33700', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('86', '24', '14200', '33700', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('87', '24', '10000', '37100', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('88', '24', '5800', '34800', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('89', '24', '8800', '29800', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('90', '24', '10500', '26100', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('91', '44', '5400', '7700', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('92', '44', '9700', '7300', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('93', '44', '5500', '11500', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('94', '44', '5100', '15500', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('95', '44', '8900', '17900', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('96', '44', '22200', '15600', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('97', '44', '43000', '3700', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('98', '44', '38900', '27200', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('99', '44', '30200', '29900', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('100', '44', '40000', '34500', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('101', '44', '32800', '37000', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('102', '44', '40600', '39300', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('103', '44', '35600', '40600', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('104', '44', '18500', '33600', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('105', '44', '17300', '38500', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('106', '44', '13500', '39400', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('107', '44', '9100', '38700', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('108', '44', '5000', '36300', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('109', '6', '11600', '18700', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('110', '6', '11000', '14400', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('111', '6', '10700', '10600', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('112', '6', '14600', '10000', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('113', '6', '12300', '35900', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('114', '6', '16700', '38800', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('115', '6', '30700', '38900', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('116', '6', '36800', '40100', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('117', '6', '39800', '36500', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('118', '6', '32000', '35200', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('119', '6', '38500', '25300', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('120', '6', '38900', '14900', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('121', '6', '37700', '10600', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('122', '6', '32500', '9800', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('123', '6', '26700', '10000', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('124', '26', '11600', '18700', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('125', '26', '11000', '14400', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('126', '26', '10700', '10600', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('127', '26', '14600', '10000', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('128', '26', '12300', '35900', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('129', '26', '16700', '38800', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('130', '26', '30700', '38900', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('131', '26', '36800', '40100', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('132', '26', '39800', '36500', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('133', '26', '32000', '35200', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('134', '26', '38500', '25300', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('135', '26', '38900', '14900', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('136', '26', '37700', '10600', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('137', '26', '32500', '9800', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('138', '26', '26700', '10000', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('139', '46', '11600', '18700', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('140', '46', '11000', '14400', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('141', '46', '10700', '10600', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('142', '46', '14600', '10000', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('143', '46', '12300', '35900', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('144', '46', '16700', '38800', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('145', '46', '30700', '38900', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('146', '46', '36800', '40100', '3000', '3000', '0', '10', '65000000', 'YES');
INSERT INTO `land` VALUES ('147', '46', '39800', '36500', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('148', '46', '32000', '35200', '3000', '3000', '0', '10', '50000000', 'YES');
INSERT INTO `land` VALUES ('149', '46', '38500', '25300', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('150', '46', '38900', '14900', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('151', '46', '37700', '10600', '3000', '3000', '0', '10', '40000000', 'YES');
INSERT INTO `land` VALUES ('152', '46', '32500', '9800', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `land` VALUES ('153', '46', '26700', '10000', '3000', '3000', '0', '10', '70000000', 'YES');
INSERT INTO `object_proto` VALUES ('14013', '?? ???', '20000000', '90010,20/90011,30/90012,20', '0', '0', '0', '-525', '-525', '525', '525', '20044', '2', '1');
INSERT INTO `object_proto` VALUES ('14014', '??? ???', '20000000', '90010,20/90011,30/90012,20', '0', '0', '0', '-525', '-525', '525', '525', '20045', '2', '1');
INSERT INTO `object_proto` VALUES ('14015', '???? ???', '20000000', '90010,20/90011,30/90012,20', '0', '0', '0', '-525', '-525', '525', '525', '20046', '2', '1');
INSERT INTO `object_proto` VALUES ('14043', '????? ???', '20000000', '90010,15/90011,20/90012,25', '0', '0', '0', '-179', '-199', '179', '199', '20060', '3', '1');
INSERT INTO `object_proto` VALUES ('14045', '??? ???', '20000000', '90010,15/90011,20/90012,25', '0', '0', '0', '-179', '-199', '179', '199', '20062', '3', '1');
INSERT INTO `object_proto` VALUES ('14046', '?? ???', '20000000', '90010,15/90011,20/90012,25', '0', '0', '0', '-179', '-199', '179', '199', '20063', '3', '1');
INSERT INTO `object_proto` VALUES ('14047', '? ???', '20000000', '90010,15/90011,20/90012,25', '0', '0', '0', '-179', '-199', '179', '199', '20064', '3', '1');
INSERT INTO `object_proto` VALUES ('14048', '? ???', '20000000', '90010,15/90011,20/90012,25', '0', '0', '0', '-179', '-199', '179', '199', '20065', '3', '1');
INSERT INTO `object_proto` VALUES ('14049', '?? ???', '20000000', '90010,15/90011,20/90012,25', '0', '0', '0', '-179', '-199', '179', '199', '20066', '3', '1');
INSERT INTO `object_proto` VALUES ('14050', '??? ???', '20000000', '90010,15/90011,20/90012,25', '0', '0', '0', '-179', '-199', '179', '199', '20067', '3', '1');
INSERT INTO `object_proto` VALUES ('14051', '?? ???', '20000000', '90010,15/90011,20/90012,25', '0', '0', '0', '-179', '-199', '179', '199', '20068', '3', '1');
INSERT INTO `object_proto` VALUES ('14052', '?? ???', '20000000', '90010,15/90011,20/90012,25', '0', '0', '0', '-179', '-199', '179', '199', '20069', '3', '1');
INSERT INTO `object_proto` VALUES ('14053', '?? ???', '20000000', '90010,15/90011,20/90012,25', '0', '0', '0', '-179', '-199', '179', '199', '20070', '3', '1');
INSERT INTO `object_proto` VALUES ('14054', '??? ???', '20000000', '90010,15/90011,20/90012,25', '0', '0', '0', '-179', '-199', '179', '199', '20071', '3', '1');
INSERT INTO `object_proto` VALUES ('14055', '?? ???', '20000000', '90010,15/90011,20/90012,25', '0', '0', '0', '-179', '-199', '179', '199', '20072', '3', '1');
INSERT INTO `object_proto` VALUES ('14061', '?? ??', '25000000', '90010,25/90011,25/90012,25', '0', '0', '0', '-523', '-995', '527', '750', '20077', '4', '1');
INSERT INTO `object_proto` VALUES ('14062', '?? ??', '500000000', '90010,50/90011,50/90012,50', '0', '0', '0', '-586', '-995', '587', '818', '20078', '4', '4');
INSERT INTO `object_proto` VALUES ('14063', '?? ??', '750000000', '90010,75/90011,75/90012,75', '0', '0', '0', '-664', '-995', '665', '896', '20079', '4', '4');
INSERT INTO `object_proto` VALUES ('14100', '?(1)', '20000000', '90010,20/90011,30/90012,25', '0', '0', '0', '-678', '-894', '687', '749', '0', '1', '0');
INSERT INTO `object_proto` VALUES ('14110', '?(2)', '20000000', '90010,20/90011,30/90012,25', '0', '0', '0', '-678', '-894', '687', '749', '0', '1', '0');
INSERT INTO `object_proto` VALUES ('14120', '?(3)', '20000000', '90010,20/90011,30/90012,25', '0', '0', '0', '-676', '-894', '690', '749', '0', '1', '0');
INSERT INTO `object_proto` VALUES ('14200', '?? ??', '3000000', '90011,5/90012,5', '0', '0', '0', '-45', '-9', '42', '40', '0', '0', '1');
INSERT INTO `object_proto` VALUES ('14300', '?1', '300000', '90010,5', '0', '0', '0', '-116', '-118', '116', '118', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14301', '?2', '300000', '90010,5', '0', '0', '0', '-118', '-132', '118', '132', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14302', '?3', '300000', '90010,7', '0', '0', '0', '-133', '-102', '133', '102', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14303', '?4', '300000', '90010,7', '0', '0', '0', '-104', '-117', '104', '117', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14304', '?5', '300000', '90010,7', '0', '0', '0', '-171', '-145', '171', '145', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14305', '?6', '300000', '90010,8', '0', '0', '0', '-192', '-201', '192', '201', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14306', '?7', '300000', '90010,8', '0', '0', '0', '-183', '-184', '183', '184', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14307', '?8', '300000', '90010,8', '0', '0', '0', '-66', '-56', '66', '56', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14308', '?9', '300000', '90010,9', '0', '0', '0', '-65', '-53', '65', '53', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14309', '?10', '300000', '90010,9', '0', '0', '0', '-182', '-123', '182', '123', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14400', '??1', '2000000', '90011,5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14401', '??2', '2000000', '90011,5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14402', '??3', '2000000', '90011,7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14403', '??4', '2000000', '90011,7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14404', '??5', '2000000', '90011,7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14405', '??6', '2000000', '90011,9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14406', '??7', '2000000', '90011,9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14407', '??8', '2000000', '90011,9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `object_proto` VALUES ('14408', '??9', '2000000', '90011,9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `player` VALUES ('1', '1', 'Admin', '0', '0', '0', '52070', '166600', '0', '21', '52070', '166600', '21', '9176', '1944', '-31973', '4116', '1764', '0', '105', '0', '32767', '32767', '32767', '32767', '0', '1500000000', '0', '0', 0x000000000206020302020204020102050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '192.168.0.11', '32767', '0', '5002', '1', 0x000000000000032800000000032800000000032800000000032800000000032800000000032800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000032800000000000200000000000000000000032800000000032800000000011400000000011400000000011400000000032800000000011500000000000A00000000000000000000000000000000000000000000000000000000000000000000011400000000011400000000011400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '200000', '2013-08-16 19:40:16', '0', '', '46', '0', '35', '120', '21', '1376931335', '1', '0');
INSERT INTO `player_index` VALUES ('1', '1', '0', '0', '0', '2');
INSERT INTO `player_secure` VALUES ('1', '1', 'Admin', '123456789', '1', '192.168.0.11');
INSERT INTO `quest` VALUES ('0', 'oxevent_status', '', '0');
INSERT INTO `quest` VALUES ('1', 'akuma', '__status', '695801987');
INSERT INTO `quest` VALUES ('1', 'collect_quest_lv30', '__status', '695801987');
INSERT INTO `quest` VALUES ('1', 'craft', '__status', '695801987');
INSERT INTO `quest` VALUES ('1', 'give_basic_weapon', '__status', '668443392');
INSERT INTO `quest` VALUES ('1', 'his_daughters_wedding', '__status', '695801987');
INSERT INTO `quest` VALUES ('1', 'main_quest_lv1', '__status', '-596781658');
INSERT INTO `quest` VALUES ('1', 'secure_compte', 'code', '123456789');
INSERT INTO `quest` VALUES ('1', 'secure_compte', 'code_ok', '1');
INSERT INTO `quest` VALUES ('1', 'secure_compte', 'compte_secure', '1');
INSERT INTO `refine_proto` VALUES ('1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('2', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('3', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('4', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('5', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('7', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('8', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('9', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('10', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('11', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('12', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('13', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('14', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('15', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('16', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('17', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('18', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('19', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('20', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('21', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('22', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('23', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('24', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('25', '27992', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('26', '27993', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('27', '27994', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('28', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('29', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('30', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('31', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('32', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('33', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('34', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('35', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('36', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('37', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('38', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('39', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('40', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('41', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('42', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('43', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('44', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('45', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '30');
INSERT INTO `refine_proto` VALUES ('46', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '90');
INSERT INTO `refine_proto` VALUES ('47', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '80');
INSERT INTO `refine_proto` VALUES ('48', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('49', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('50', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('51', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('52', '27992', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('53', '27993', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('54', '27994', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('55', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('56', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('57', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('58', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('59', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('60', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('61', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('62', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('63', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('64', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('65', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('66', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('67', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('68', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('69', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('70', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('71', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('72', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('73', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('74', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('75', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('76', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('77', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('78', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('79', '27992', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('80', '27993', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('81', '27994', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('82', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('83', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('84', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('85', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('86', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('87', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('88', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('89', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('90', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('91', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('92', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('93', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('94', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('95', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('96', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('97', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('98', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('99', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('100', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('101', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('102', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('103', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('104', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('105', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('106', '27992', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('107', '27993', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('108', '27994', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('109', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('110', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('111', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('112', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('113', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('114', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('115', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('116', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('117', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('118', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('119', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('120', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('121', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('122', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('123', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('124', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('125', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('126', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('127', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('128', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('129', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('130', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('131', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('132', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('133', '27992', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('134', '27993', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('135', '27994', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('136', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('137', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('138', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('139', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('140', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('141', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('142', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('143', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('144', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('145', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('146', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('147', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('148', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('149', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('150', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('151', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('152', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('153', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('154', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('155', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('156', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('157', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('158', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('159', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('160', '27992', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('161', '27993', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('162', '27994', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('163', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('164', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('165', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('166', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('167', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('168', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('169', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('170', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('171', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('172', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('173', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('174', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('175', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('176', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('177', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('178', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('179', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('180', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('181', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('182', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('183', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('184', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('185', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('186', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('187', '27992', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('188', '27993', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('189', '27994', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('190', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('191', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('192', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('193', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('194', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('195', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('196', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('197', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('198', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('199', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('200', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('201', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('202', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('203', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('204', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('205', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('206', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('207', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('208', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('209', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('210', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('211', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('212', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('213', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('214', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('215', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('216', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('217', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('218', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('219', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('220', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('221', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('222', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('223', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('224', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('225', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('226', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('227', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('228', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('229', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('230', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('231', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('232', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('233', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('234', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('235', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('236', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('237', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('238', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('239', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('240', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('241', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('242', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('243', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('244', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('245', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('246', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('247', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('248', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('249', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('250', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('251', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('252', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('253', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('254', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('255', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('256', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('257', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('258', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('259', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('260', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('261', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('262', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('263', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('264', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('265', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('266', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('267', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('268', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('269', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('270', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('271', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('272', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('273', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('274', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('275', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('276', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('277', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('278', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('279', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('280', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('281', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('282', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('283', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('284', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('285', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('286', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('287', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('288', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('289', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('290', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('291', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('292', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('293', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('294', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('295', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('296', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('297', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('298', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('299', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('300', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('301', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('302', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('303', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('304', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('305', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('306', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('307', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('308', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('309', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('310', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('311', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('312', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('313', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('314', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('315', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('316', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('317', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('318', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('319', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('320', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('321', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('322', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('323', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('324', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('325', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '600', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('326', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('327', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('328', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('329', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('330', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('331', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('332', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('333', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '75000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('334', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('335', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('336', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '4000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('337', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '8000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('338', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '13000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('339', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('340', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('341', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '70000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('342', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('343', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1200', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('344', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2500', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('345', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '5000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('346', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('347', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('348', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '30000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('349', '27992', '1', '0', '1', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('350', '27993', '1', '0', '1', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('351', '27994', '1', '0', '1', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('352', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '3000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('353', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '6000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('354', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '12000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('355', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '25000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('356', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '40000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('357', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '60000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('358', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '90000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('359', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('360', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '150000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('501', '70031', '2', '0', '0', '0', '0', '0', '0', '0', '0', '2000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('502', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '120000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('503', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '140000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('504', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '170000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('505', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '200000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('506', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '240000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('507', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '290000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('508', '27992', '1', '0', '1', '0', '0', '0', '0', '0', '0', '340000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('509', '27993', '1', '0', '1', '0', '0', '0', '0', '0', '0', '410000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('510', '27994', '1', '0', '1', '0', '0', '0', '0', '0', '0', '500000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('701', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '500000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('702', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6004', '27992', '50', '27993', '50', '27994', '50', '0', '0', '0', '0', '25000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6005', '27992', '65', '27993', '65', '27994', '65', '0', '0', '0', '0', '35000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6006', '27992', '75', '27993', '75', '27994', '75', '0', '0', '0', '0', '50000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6007', '27992', '85', '27993', '85', '27994', '85', '0', '0', '0', '0', '75000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('512', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6009', '12797', '20', '12798', '20', '12799', '20', '0', '0', '0', '0', '10000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6010', '12797', '25', '12798', '25', '12799', '25', '0', '0', '0', '0', '15000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6011', '12797', '35', '12798', '35', '12799', '35', '0', '0', '0', '0', '17000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6012', '12797', '40', '12798', '40', '12799', '40', '0', '0', '0', '0', '20000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6013', '12797', '50', '12798', '50', '12799', '50', '0', '0', '0', '0', '25000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6014', '12797', '65', '12798', '65', '12799', '65', '0', '0', '0', '0', '35000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('511', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '500000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6008', '27992', '100', '27993', '100', '27994', '100', '0', '0', '0', '0', '100000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6000', '27992', '20', '27993', '20', '27994', '20', '0', '0', '0', '0', '10000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6001', '27992', '25', '27993', '25', '27994', '25', '0', '0', '0', '0', '15000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6002', '27992', '35', '27993', '35', '27994', '35', '0', '0', '0', '0', '17000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6003', '27992', '40', '27993', '40', '27994', '40', '0', '0', '0', '0', '20000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6015', '12797', '75', '12798', '75', '12799', '75', '0', '0', '0', '0', '50000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6016', '12797', '85', '12798', '85', '12799', '85', '0', '0', '0', '0', '75000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6017', '12797', '100', '12798', '100', '12799', '100', '0', '0', '0', '0', '100000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6050', '12789', '1', '0', '0', '0', '0', '0', '0', '0', '0', '50000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6018', '12794', '20', '12793', '20', '12790', '20', '0', '0', '0', '0', '10000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6019', '12794', '25', '12793', '25', '12790', '25', '0', '0', '0', '0', '15000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6020', '12794', '35', '12793', '35', '12790', '35', '0', '0', '0', '0', '17000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6021', '12794', '40', '12793', '40', '12790', '40', '0', '0', '0', '0', '20000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6022', '12794', '50', '12793', '50', '12790', '50', '0', '0', '0', '0', '25000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6023', '12794', '65', '12793', '65', '12790', '65', '0', '0', '0', '0', '35000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6024', '12794', '75', '12793', '75', '12790', '75', '0', '0', '0', '0', '50000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6025', '12794', '85', '12793', '85', '12790', '85', '0', '0', '0', '0', '75000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6026', '12794', '100', '12793', '100', '12790', '100', '0', '0', '0', '0', '100000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('6056', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('7000', '13149', '1', '13189', '1', '13179', '1', '0', '0', '0', '0', '120000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('7001', '13149', '1', '13169', '1', '13189', '1', '0', '0', '0', '0', '120000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('7002', '13149', '1', '13169', '1', '13179', '1', '0', '0', '0', '0', '120000000', '0', '0', '100');
INSERT INTO `refine_proto` VALUES ('7003', '13169', '1', '13179', '1', '13189', '1', '0', '0', '0', '0', '120000000', '0', '0', '100');
INSERT INTO `shop` VALUES ('1', '????', '9001');
INSERT INTO `shop` VALUES ('2', '?????', '9009');
INSERT INTO `shop` VALUES ('3', '????', '9003');
INSERT INTO `shop` VALUES ('4', '?????', '9002');
INSERT INTO `shop` VALUES ('5', '????2', '9007');
INSERT INTO `shop` VALUES ('6', '?????2', '9008');
INSERT INTO `shop` VALUES ('1001', 'all_sword', '0');
INSERT INTO `shop` VALUES ('1002', 'all_dualhand_sword', '0');
INSERT INTO `shop` VALUES ('1003', 'all_bow', '0');
INSERT INTO `shop` VALUES ('1004', 'all_twohand_sword', '0');
INSERT INTO `shop` VALUES ('1005', 'all_bell', '0');
INSERT INTO `shop` VALUES ('1006', 'all_fan', '0');
INSERT INTO `shop` VALUES ('1007', 'all_warrior_armour', '0');
INSERT INTO `shop` VALUES ('1008', 'all_assassin_armour', '0');
INSERT INTO `shop` VALUES ('1009', 'all_sura_armour', '0');
INSERT INTO `shop` VALUES ('1010', 'all_shaman_armour', '0');
INSERT INTO `shop` VALUES ('1011', 'all_warrior_helmet', '0');
INSERT INTO `shop` VALUES ('1012', 'all_assassin_helmet', '0');
INSERT INTO `shop` VALUES ('1013', 'all_sura_helmet', '0');
INSERT INTO `shop` VALUES ('1014', 'all_shaman_helmet', '0');
INSERT INTO `shop` VALUES ('1015', 'all_shield', '0');
INSERT INTO `shop` VALUES ('1016', 'all_bracelet', '0');
INSERT INTO `shop` VALUES ('1017', 'all_shoe', '0');
INSERT INTO `shop` VALUES ('1018', 'all_necklace', '0');
INSERT INTO `shop` VALUES ('1019', 'all_ring', '0');
INSERT INTO `shop` VALUES ('7', 'gold_bar_shop', '9005');
INSERT INTO `shop` VALUES ('8', 'firework_shop', '9004');
INSERT INTO `shop` VALUES ('9', '?? ???', '20042');
INSERT INTO `shop` VALUES ('10', 'pick_shop', '20015');
INSERT INTO `shop_item` VALUES ('1', '469', '1');
INSERT INTO `shop_item` VALUES ('1', '479', '1');
INSERT INTO `shop_item` VALUES ('1', '1349', '1');
INSERT INTO `shop_item` VALUES ('1', '2379', '1');
INSERT INTO `shop_item` VALUES ('1', '3199', '1');
INSERT INTO `shop_item` VALUES ('1', '5349', '1');
INSERT INTO `shop_item` VALUES ('1', '7379', '1');
INSERT INTO `shop_item` VALUES ('1', '8005', '200');
INSERT INTO `shop_item` VALUES ('1', '8006', '200');
INSERT INTO `shop_item` VALUES ('1', '8007', '200');
INSERT INTO `shop_item` VALUES ('1', '8008', '200');
INSERT INTO `shop_item` VALUES ('1', '8009', '200');
INSERT INTO `shop_item` VALUES ('2', '27400', '1');
INSERT INTO `shop_item` VALUES ('2', '27600', '1');
INSERT INTO `shop_item` VALUES ('2', '27610', '1');
INSERT INTO `shop_item` VALUES ('2', '27800', '5');
INSERT INTO `shop_item` VALUES ('2', '27800', '50');
INSERT INTO `shop_item` VALUES ('2', '27801', '5');
INSERT INTO `shop_item` VALUES ('2', '27801', '50');
INSERT INTO `shop_item` VALUES ('3', '25040', '1');
INSERT INTO `shop_item` VALUES ('3', '25041', '1');
INSERT INTO `shop_item` VALUES ('3', '27003', '200');
INSERT INTO `shop_item` VALUES ('3', '27006', '200');
INSERT INTO `shop_item` VALUES ('3', '27102', '200');
INSERT INTO `shop_item` VALUES ('3', '27105', '200');
INSERT INTO `shop_item` VALUES ('3', '28543', '1');
INSERT INTO `shop_item` VALUES ('3', '28630', '1');
INSERT INTO `shop_item` VALUES ('3', '28631', '1');
INSERT INTO `shop_item` VALUES ('3', '28632', '1');
INSERT INTO `shop_item` VALUES ('3', '28633', '1');
INSERT INTO `shop_item` VALUES ('3', '28634', '1');
INSERT INTO `shop_item` VALUES ('3', '28635', '1');
INSERT INTO `shop_item` VALUES ('3', '28636', '1');
INSERT INTO `shop_item` VALUES ('3', '28637', '1');
INSERT INTO `shop_item` VALUES ('3', '28638', '1');
INSERT INTO `shop_item` VALUES ('3', '28639', '1');
INSERT INTO `shop_item` VALUES ('3', '28641', '1');
INSERT INTO `shop_item` VALUES ('3', '28642', '1');
INSERT INTO `shop_item` VALUES ('3', '50200', '1');
INSERT INTO `shop_item` VALUES ('3', '50513', '1');
INSERT INTO `shop_item` VALUES ('3', '70024', '1');
INSERT INTO `shop_item` VALUES ('3', '71001', '200');
INSERT INTO `shop_item` VALUES ('3', '71002', '1');
INSERT INTO `shop_item` VALUES ('3', '71003', '1');
INSERT INTO `shop_item` VALUES ('3', '71083', '1');
INSERT INTO `shop_item` VALUES ('3', '71084', '1');
INSERT INTO `shop_item` VALUES ('3', '71085', '1');
INSERT INTO `shop_item` VALUES ('3', '71094', '200');
INSERT INTO `shop_item` VALUES ('3', '71103', '1');
INSERT INTO `shop_item` VALUES ('3', '71104', '1');
INSERT INTO `shop_item` VALUES ('3', '71105', '1');
INSERT INTO `shop_item` VALUES ('3', '71106', '1');
INSERT INTO `shop_item` VALUES ('3', '71107', '1');
INSERT INTO `shop_item` VALUES ('3', '71113', '200');
INSERT INTO `shop_item` VALUES ('3', '72726', '1');
INSERT INTO `shop_item` VALUES ('3', '72730', '1');
INSERT INTO `shop_item` VALUES ('4', '11299', '1');
INSERT INTO `shop_item` VALUES ('4', '11499', '1');
INSERT INTO `shop_item` VALUES ('4', '11699', '1');
INSERT INTO `shop_item` VALUES ('4', '11899', '1');
INSERT INTO `shop_item` VALUES ('4', '12019', '1');
INSERT INTO `shop_item` VALUES ('4', '12029', '1');
INSERT INTO `shop_item` VALUES ('4', '12039', '1');
INSERT INTO `shop_item` VALUES ('4', '12049', '1');
INSERT INTO `shop_item` VALUES ('4', '20009', '1');
INSERT INTO `shop_item` VALUES ('4', '20259', '1');
INSERT INTO `shop_item` VALUES ('4', '20509', '1');
INSERT INTO `shop_item` VALUES ('4', '20759', '1');
INSERT INTO `shop_item` VALUES ('5', '5020', '1');
INSERT INTO `shop_item` VALUES ('5', '5030', '1');
INSERT INTO `shop_item` VALUES ('5', '5040', '1');
INSERT INTO `shop_item` VALUES ('5', '5050', '1');
INSERT INTO `shop_item` VALUES ('5', '5070', '1');
INSERT INTO `shop_item` VALUES ('5', '5080', '1');
INSERT INTO `shop_item` VALUES ('5', '7020', '1');
INSERT INTO `shop_item` VALUES ('5', '7050', '1');
INSERT INTO `shop_item` VALUES ('5', '7060', '1');
INSERT INTO `shop_item` VALUES ('5', '7090', '1');
INSERT INTO `shop_item` VALUES ('5', '7100', '1');
INSERT INTO `shop_item` VALUES ('6', '14000', '1');
INSERT INTO `shop_item` VALUES ('6', '14020', '1');
INSERT INTO `shop_item` VALUES ('6', '14040', '1');
INSERT INTO `shop_item` VALUES ('6', '14060', '1');
INSERT INTO `shop_item` VALUES ('6', '14080', '1');
INSERT INTO `shop_item` VALUES ('6', '14140', '1');
INSERT INTO `shop_item` VALUES ('6', '15000', '1');
INSERT INTO `shop_item` VALUES ('6', '15020', '1');
INSERT INTO `shop_item` VALUES ('6', '15040', '1');
INSERT INTO `shop_item` VALUES ('6', '15060', '1');
INSERT INTO `shop_item` VALUES ('6', '15080', '1');
INSERT INTO `shop_item` VALUES ('6', '15160', '1');
INSERT INTO `shop_item` VALUES ('6', '16000', '1');
INSERT INTO `shop_item` VALUES ('6', '16020', '1');
INSERT INTO `shop_item` VALUES ('6', '16040', '1');
INSERT INTO `shop_item` VALUES ('6', '16060', '1');
INSERT INTO `shop_item` VALUES ('6', '16080', '1');
INSERT INTO `shop_item` VALUES ('6', '16180', '1');
INSERT INTO `shop_item` VALUES ('6', '17000', '1');
INSERT INTO `shop_item` VALUES ('6', '17020', '1');
INSERT INTO `shop_item` VALUES ('6', '17040', '1');
INSERT INTO `shop_item` VALUES ('6', '17060', '1');
INSERT INTO `shop_item` VALUES ('6', '17080', '1');
INSERT INTO `shop_item` VALUES ('6', '17180', '1');
INSERT INTO `shop_item` VALUES ('7', '80003', '1');
INSERT INTO `shop_item` VALUES ('7', '80004', '1');
INSERT INTO `shop_item` VALUES ('7', '80005', '1');
INSERT INTO `shop_item` VALUES ('7', '80006', '1');
INSERT INTO `shop_item` VALUES ('7', '80007', '1');
INSERT INTO `shop_item` VALUES ('8', '50100', '200');
INSERT INTO `shop_item` VALUES ('8', '50101', '200');
INSERT INTO `shop_item` VALUES ('8', '50102', '200');
INSERT INTO `shop_item` VALUES ('8', '50103', '200');
INSERT INTO `shop_item` VALUES ('8', '50104', '200');
INSERT INTO `shop_item` VALUES ('8', '50105', '200');
INSERT INTO `shop_item` VALUES ('8', '50107', '50');
INSERT INTO `shop_item` VALUES ('9', '11901', '1');
INSERT INTO `shop_item` VALUES ('9', '11902', '1');
INSERT INTO `shop_item` VALUES ('9', '11903', '1');
INSERT INTO `shop_item` VALUES ('9', '11904', '1');
INSERT INTO `shop_item` VALUES ('9', '50201', '1');
INSERT INTO `shop_item` VALUES ('9', '50202', '1');
INSERT INTO `shop_item` VALUES ('10', '29101', '1');
INSERT INTO `shop_item` VALUES ('1001', '10', '1');
INSERT INTO `shop_item` VALUES ('1001', '20', '1');
INSERT INTO `shop_item` VALUES ('1001', '30', '1');
INSERT INTO `shop_item` VALUES ('1001', '40', '1');
INSERT INTO `shop_item` VALUES ('1001', '50', '1');
INSERT INTO `shop_item` VALUES ('1001', '60', '1');
INSERT INTO `shop_item` VALUES ('1001', '70', '1');
INSERT INTO `shop_item` VALUES ('1001', '80', '1');
INSERT INTO `shop_item` VALUES ('1001', '90', '1');
INSERT INTO `shop_item` VALUES ('1001', '100', '1');
INSERT INTO `shop_item` VALUES ('1001', '110', '1');
INSERT INTO `shop_item` VALUES ('1001', '120', '1');
INSERT INTO `shop_item` VALUES ('1001', '130', '1');
INSERT INTO `shop_item` VALUES ('1002', '1000', '1');
INSERT INTO `shop_item` VALUES ('1002', '1010', '1');
INSERT INTO `shop_item` VALUES ('1002', '1020', '1');
INSERT INTO `shop_item` VALUES ('1002', '1030', '1');
INSERT INTO `shop_item` VALUES ('1002', '1040', '1');
INSERT INTO `shop_item` VALUES ('1002', '1050', '1');
INSERT INTO `shop_item` VALUES ('1002', '1060', '1');
INSERT INTO `shop_item` VALUES ('1002', '1070', '1');
INSERT INTO `shop_item` VALUES ('1002', '1080', '1');
INSERT INTO `shop_item` VALUES ('1002', '1090', '1');
INSERT INTO `shop_item` VALUES ('1002', '4000', '1');
INSERT INTO `shop_item` VALUES ('1002', '4010', '1');
INSERT INTO `shop_item` VALUES ('1002', '4020', '1');
INSERT INTO `shop_item` VALUES ('1003', '2000', '1');
INSERT INTO `shop_item` VALUES ('1003', '2010', '1');
INSERT INTO `shop_item` VALUES ('1003', '2020', '1');
INSERT INTO `shop_item` VALUES ('1003', '2030', '1');
INSERT INTO `shop_item` VALUES ('1003', '2040', '1');
INSERT INTO `shop_item` VALUES ('1003', '2050', '1');
INSERT INTO `shop_item` VALUES ('1003', '2060', '1');
INSERT INTO `shop_item` VALUES ('1003', '2070', '1');
INSERT INTO `shop_item` VALUES ('1003', '2080', '1');
INSERT INTO `shop_item` VALUES ('1003', '2090', '1');
INSERT INTO `shop_item` VALUES ('1003', '2100', '1');
INSERT INTO `shop_item` VALUES ('1003', '2110', '1');
INSERT INTO `shop_item` VALUES ('1003', '2120', '1');
INSERT INTO `shop_item` VALUES ('1003', '8000', '50');
INSERT INTO `shop_item` VALUES ('1003', '8000', '200');
INSERT INTO `shop_item` VALUES ('1004', '3000', '1');
INSERT INTO `shop_item` VALUES ('1004', '3010', '1');
INSERT INTO `shop_item` VALUES ('1004', '3020', '1');
INSERT INTO `shop_item` VALUES ('1004', '3030', '1');
INSERT INTO `shop_item` VALUES ('1004', '3040', '1');
INSERT INTO `shop_item` VALUES ('1004', '3050', '1');
INSERT INTO `shop_item` VALUES ('1004', '3060', '1');
INSERT INTO `shop_item` VALUES ('1004', '3070', '1');
INSERT INTO `shop_item` VALUES ('1004', '3080', '1');
INSERT INTO `shop_item` VALUES ('1004', '3090', '1');
INSERT INTO `shop_item` VALUES ('1004', '3100', '1');
INSERT INTO `shop_item` VALUES ('1004', '3110', '1');
INSERT INTO `shop_item` VALUES ('1004', '3120', '1');
INSERT INTO `shop_item` VALUES ('1005', '5000', '1');
INSERT INTO `shop_item` VALUES ('1005', '5010', '1');
INSERT INTO `shop_item` VALUES ('1005', '5020', '1');
INSERT INTO `shop_item` VALUES ('1005', '5030', '1');
INSERT INTO `shop_item` VALUES ('1005', '5040', '1');
INSERT INTO `shop_item` VALUES ('1005', '5050', '1');
INSERT INTO `shop_item` VALUES ('1005', '5060', '1');
INSERT INTO `shop_item` VALUES ('1005', '5070', '1');
INSERT INTO `shop_item` VALUES ('1005', '5080', '1');
INSERT INTO `shop_item` VALUES ('1006', '7000', '1');
INSERT INTO `shop_item` VALUES ('1006', '7010', '1');
INSERT INTO `shop_item` VALUES ('1006', '7020', '1');
INSERT INTO `shop_item` VALUES ('1006', '7030', '1');
INSERT INTO `shop_item` VALUES ('1006', '7040', '1');
INSERT INTO `shop_item` VALUES ('1006', '7050', '1');
INSERT INTO `shop_item` VALUES ('1006', '7060', '1');
INSERT INTO `shop_item` VALUES ('1006', '7070', '1');
INSERT INTO `shop_item` VALUES ('1006', '7080', '1');
INSERT INTO `shop_item` VALUES ('1006', '7090', '1');
INSERT INTO `shop_item` VALUES ('1006', '7100', '1');
INSERT INTO `shop_item` VALUES ('1006', '7110', '1');
INSERT INTO `shop_item` VALUES ('1006', '7120', '1');
INSERT INTO `shop_item` VALUES ('1007', '11200', '1');
INSERT INTO `shop_item` VALUES ('1007', '11210', '1');
INSERT INTO `shop_item` VALUES ('1007', '11220', '1');
INSERT INTO `shop_item` VALUES ('1007', '11230', '1');
INSERT INTO `shop_item` VALUES ('1007', '11240', '1');
INSERT INTO `shop_item` VALUES ('1007', '11250', '1');
INSERT INTO `shop_item` VALUES ('1007', '11260', '1');
INSERT INTO `shop_item` VALUES ('1008', '11400', '1');
INSERT INTO `shop_item` VALUES ('1008', '11410', '1');
INSERT INTO `shop_item` VALUES ('1008', '11420', '1');
INSERT INTO `shop_item` VALUES ('1008', '11430', '1');
INSERT INTO `shop_item` VALUES ('1008', '11440', '1');
INSERT INTO `shop_item` VALUES ('1008', '11450', '1');
INSERT INTO `shop_item` VALUES ('1008', '11460', '1');
INSERT INTO `shop_item` VALUES ('1009', '11600', '1');
INSERT INTO `shop_item` VALUES ('1009', '11610', '1');
INSERT INTO `shop_item` VALUES ('1009', '11620', '1');
INSERT INTO `shop_item` VALUES ('1009', '11630', '1');
INSERT INTO `shop_item` VALUES ('1009', '11640', '1');
INSERT INTO `shop_item` VALUES ('1009', '11650', '1');
INSERT INTO `shop_item` VALUES ('1009', '11660', '1');
INSERT INTO `shop_item` VALUES ('1010', '11800', '1');
INSERT INTO `shop_item` VALUES ('1010', '11810', '1');
INSERT INTO `shop_item` VALUES ('1010', '11820', '1');
INSERT INTO `shop_item` VALUES ('1010', '11830', '1');
INSERT INTO `shop_item` VALUES ('1010', '11840', '1');
INSERT INTO `shop_item` VALUES ('1010', '11850', '1');
INSERT INTO `shop_item` VALUES ('1010', '11860', '1');
INSERT INTO `shop_item` VALUES ('1011', '12200', '1');
INSERT INTO `shop_item` VALUES ('1011', '12220', '1');
INSERT INTO `shop_item` VALUES ('1011', '12240', '1');
INSERT INTO `shop_item` VALUES ('1012', '12340', '1');
INSERT INTO `shop_item` VALUES ('1012', '12360', '1');
INSERT INTO `shop_item` VALUES ('1012', '12380', '1');
INSERT INTO `shop_item` VALUES ('1013', '12480', '1');
INSERT INTO `shop_item` VALUES ('1013', '12500', '1');
INSERT INTO `shop_item` VALUES ('1013', '12520', '1');
INSERT INTO `shop_item` VALUES ('1014', '12620', '1');
INSERT INTO `shop_item` VALUES ('1014', '12640', '1');
INSERT INTO `shop_item` VALUES ('1014', '12660', '1');
INSERT INTO `shop_item` VALUES ('1015', '13000', '1');
INSERT INTO `shop_item` VALUES ('1015', '13040', '1');
INSERT INTO `shop_item` VALUES ('1016', '14000', '1');
INSERT INTO `shop_item` VALUES ('1016', '14020', '1');
INSERT INTO `shop_item` VALUES ('1016', '14040', '1');
INSERT INTO `shop_item` VALUES ('1016', '14060', '1');
INSERT INTO `shop_item` VALUES ('1016', '14080', '1');
INSERT INTO `shop_item` VALUES ('1016', '14100', '1');
INSERT INTO `shop_item` VALUES ('1016', '14120', '1');
INSERT INTO `shop_item` VALUES ('1016', '14140', '1');
INSERT INTO `shop_item` VALUES ('1016', '14160', '1');
INSERT INTO `shop_item` VALUES ('1016', '14180', '1');
INSERT INTO `shop_item` VALUES ('1016', '14200', '1');
INSERT INTO `shop_item` VALUES ('1017', '15000', '1');
INSERT INTO `shop_item` VALUES ('1017', '15020', '1');
INSERT INTO `shop_item` VALUES ('1017', '15040', '1');
INSERT INTO `shop_item` VALUES ('1017', '15060', '1');
INSERT INTO `shop_item` VALUES ('1017', '15080', '1');
INSERT INTO `shop_item` VALUES ('1017', '15100', '1');
INSERT INTO `shop_item` VALUES ('1017', '15120', '1');
INSERT INTO `shop_item` VALUES ('1017', '15140', '1');
INSERT INTO `shop_item` VALUES ('1017', '15160', '1');
INSERT INTO `shop_item` VALUES ('1017', '15180', '1');
INSERT INTO `shop_item` VALUES ('1017', '15200', '1');
INSERT INTO `shop_item` VALUES ('1017', '15220', '1');
INSERT INTO `shop_item` VALUES ('1018', '16000', '1');
INSERT INTO `shop_item` VALUES ('1018', '16020', '1');
INSERT INTO `shop_item` VALUES ('1018', '16040', '1');
INSERT INTO `shop_item` VALUES ('1018', '16060', '1');
INSERT INTO `shop_item` VALUES ('1018', '16080', '1');
INSERT INTO `shop_item` VALUES ('1018', '16100', '1');
INSERT INTO `shop_item` VALUES ('1018', '16120', '1');
INSERT INTO `shop_item` VALUES ('1018', '16140', '1');
INSERT INTO `shop_item` VALUES ('1018', '16160', '1');
INSERT INTO `shop_item` VALUES ('1018', '16180', '1');
INSERT INTO `shop_item` VALUES ('1018', '16200', '1');
INSERT INTO `shop_item` VALUES ('1019', '17000', '1');
INSERT INTO `shop_item` VALUES ('1019', '17020', '1');
INSERT INTO `shop_item` VALUES ('1019', '17040', '1');
INSERT INTO `shop_item` VALUES ('1019', '17060', '1');
INSERT INTO `shop_item` VALUES ('1019', '17080', '1');
INSERT INTO `shop_item` VALUES ('1019', '17100', '1');
INSERT INTO `shop_item` VALUES ('1019', '17120', '1');
INSERT INTO `shop_item` VALUES ('1019', '17140', '1');
INSERT INTO `shop_item` VALUES ('1019', '17160', '1');
INSERT INTO `shop_item` VALUES ('1019', '17180', '1');
INSERT INTO `shop_item` VALUES ('1019', '17200', '1');
INSERT INTO `skill_proto` VALUES ('1', '»ï¿¬Âü', '1', '1', '1', '0', 'HP', '-( 1.1*atk + (0.5*atk +  1.5 * str)*k)', '40+100*k', '', '', '12', '-( 1.1*atk + (0.5*atk +  1.5 * str)*k)', '', 'ATTACK,USE_MELEE_DAMAGE', '', 'NONE', '', '', '', '', '', '', '40+100*k', '0', '0', 'MELEE', '5', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('2', 'ÆÈ¹æÇ³¿ì', '1', '1', '1', '0', 'HP', '-(3*atk + (0.8*atk + str*5 + dex*3 +con)*k)', '50+130*k', '', '', '15', '-(3*atk + (0.8*atk + str*5 + dex*3 +con)*k)', '', 'ATTACK,USE_MELEE_DAMAGE', '', 'NONE', '', '', '', '', '', '', '50+130*k', '0', '0', 'MELEE', '12', '1', '0', '200');
INSERT INTO `skill_proto` VALUES ('3', 'Àü±ÍÈ¥', '1', '1', '1', '0', 'ATT_SPEED', '50*k', '50+140*k', '60+90*k', '', '63+90*k', '50*k', '', 'SELFONLY', 'JEONGWIHON', 'MOV_SPEED', '20*k', '60+90*k', '', '', '', '', '50+140*k', '0', '0', 'NORMAL', '1', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('4', '°Ë°æ', '1', '1', '1', '0', 'ATT_GRADE', '(100 + str + lv * 3)*k', '100+200*k', '30+50*k', '', '33+50*k', '(100 + str + lv * 3)*k', '', 'SELFONLY', 'GEOMGYEONG', 'NONE', '', '', '', '', '', '', '100+200*k', '0', '0', 'NORMAL', '1', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('5', 'ÅºÈ¯°Ý', '1', '1', '1', '0', 'HP', '-(2*atk + (atk + dex*3 + str*7 + con)*k)', '60+120*k', '', '', '12', '-(2*atk + (atk + dex*3 + str*7 + con)*k)', '', 'ATTACK,USE_MELEE_DAMAGE,SPLASH,CRUSH', '', 'MOV_SPEED', '150', '3', '', '', '', '', '60+120*k', '0', '0', 'MELEE', '4', '1', '0', '200');
INSERT INTO `skill_proto` VALUES ('6', '±âÇ÷Aë¸í', '1', '1', '1', '0', 'HP', '-(3*atk + (atk + 1.5*str)*k)*1.07', '300+150*k', '', '', '18', '-( 3*atk + (atk +  1.5 * str)*k)*1.07', '', 'ATTACK,USE_MELEE_DAMAGE', '', 'NONE', '', '', '', '', '', '', '300+150*k', '0', '0', 'MELEE', '5', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('16', '±â°øÂü', '1', '1', '1', '0', 'HP', '-(2.3*atk + (4*atk  + str*4 + con)*k)', '60+120*k', '', '', '15', '-(2.3*atk + (4*atk  + str*4 + con)*k)', '', 'ATTACK,USE_MELEE_DAMAGE', '', 'NONE', '', '', '', '', '', '', '60+120*k', '0', '0', 'MELEE', '4', '1', '0', '100');
INSERT INTO `skill_proto` VALUES ('17', '°Ý»êÅ¸¿ì', '1', '1', '1', '0', 'HP', '-(2.3*atk + (3*atk + str*4 + con*3)*k)', '60+150*k', '', '', '15', '-(2.3*atk + (3*atk + str*4 + con*3)*k)', '', 'ATTACK,USE_MELEE_DAMAGE', '', 'NONE', '', '', '', '', '', '', '60+150*k', '0', '0', 'MELEE', '8', '1', '0', '200');
INSERT INTO `skill_proto` VALUES ('18', '´ëÁø°¢', '1', '1', '1', '0', 'HP', '-(2*atk + (2*atk + 2*dex + 2*con + str*4)*k)', '50+140*k', '', '', '25', '-(2*atk + (2*atk + 2*dex + 2*con + str*4)*k)', '', 'ATTACK,USE_MELEE_DAMAGE,SELFONLY,SPLASH,ATTACK_STUN', '', 'NONE', '100+k*1000/6', '2', '', '', '', '', '50+140*k', '0', '0', 'MELEE', '10', '1', '0', '400');
INSERT INTO `skill_proto` VALUES ('19', 'Ãµ±ÙÃß', '1', '1', '1', '0', 'DEF_GRADE', '(200 + str*0.2 + con*0.5 ) *k', '80+220*k', '60+90*k', '', '63+90*k', '(200 + str*0.2 + con*0.5 ) *k', '', 'SELFONLY', 'CHEONGEUN', 'MOV_SPEED', '-(1+9*k)', '60+90*k', '', '', '', '', '80+220*k', '0', '0', 'NORMAL', '1', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('20', '°ËÇ³', '1', '1', '1', '0', 'HP', '-(2*atk + (atk + dex*3 + str*5 + con)*k)', '40+120*k', '', '', '20', '-(2*atk + (atk + dex*3 + str*5 + con)*k)', '', 'ATTACK,USE_MELEE_DAMAGE,SPLASH,CRUSH', '', 'NONE', '', '', '', '', '', '', '40+120*k', '0', '0', 'MELEE', '10', '0.5', '1200', '200');
INSERT INTO `skill_proto` VALUES ('21', '³ú°Ëµµ·¡', '1', '1', '1', '0', 'HP', '-(2*atk + (2*atk + 2*dex + 2*con + str*4)*k)*1.1', '300+180*k', '', '', '18', '-(2*atk + (2*atk + 2*dex + 2*con + str*4)*k)*1.1', '', 'ATTACK,USE_MELEE_DAMAGE', '', 'NONE', '', '', '', '', '', '', '300+180*k', '0', '0', 'MELEE', '10', '1', '0', '400');
INSERT INTO `skill_proto` VALUES ('31', '¾Ï½À', '2', '1', '1', '0', 'HP', '-(atk + (1.2 * atk + number(500, 700) + dex*4+ str*4 )*k)', '40+160*k', '', '', '15', '-(atk + (1.2 * atk + number(500, 700) + dex*4+ str*4 )*k)', '', 'ATTACK,USE_MELEE_DAMAGE', '', 'NONE', '', '', '', '', '', '', '40+160*k', '0', '0', 'MELEE', '6', '0.8', '0', '0');
INSERT INTO `skill_proto` VALUES ('32', '±Ã½ÅÅº¿µ', '2', '1', '1', '0', 'HP', '-(atk + (1.6* atk + number(200,300) + dex*7 + str*7)*k)', '40+160*k', '', '', '20', '-(atk + (1.6* atk + number(200,300) + dex*7 + str*7)*k)', '', 'ATTACK,USE_MELEE_DAMAGE', '', 'NONE', '', '', '', '', '', '', '40+160*k', '0', '0', 'MELEE', '6', '0.8', '800', '0');
INSERT INTO `skill_proto` VALUES ('33', 'Â÷·û»ì', '2', '1', '1', '0', 'HP', '-(2*atk + (0.5*atk + dex*9 + str*7)*k)', '50+140*k', '', '', '25', '-(2*atk + (0.5*atk + dex*9 + str*7)*k)', '', 'ATTACK,USE_MELEE_DAMAGE,ATTACK_POISON', '', 'NONE', '40*k', '', '', '', '', '', '50+140*k', '0', '0', 'MELEE', '12', '0.8', '0', '0');
INSERT INTO `skill_proto` VALUES ('34', 'ÀºÇü¹ý', '2', '1', '1', '0', 'NONE', '', '30+60*k', '15+30*k', '', '60', '', '', 'SELFONLY', 'EUNHYUNG', 'NONE', '', '', '', '', '', '', '30+60*k', '0', '0', 'NORMAL', '1', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('35', '»ê°øºÐ', '2', '1', '1', '0', 'HP', '-(lv*2+(atk + str*3 + dex*18)*k)', '40+130*k', '', '', '25', '-(lv*2+(atk + str*3 + dex*18)*k)', '', 'ATTACK,USE_MELEE_DAMAGE,SPLASH,ATTACK_POISON', '', 'NONE', '60*k', '5+25*k', '', '', '', '', '40+130*k', '0', '0', 'MAGIC', '0', '0.5', '800', '200');
INSERT INTO `skill_proto` VALUES ('36', 'Èæ¼¶¼ö', '2', '1', '1', '0', 'HP', '-((lv*2+(atk + str*3 + dex*18)*k)*1.1)', '300+180*k', '', '', '18', '-((lv*2+(atk + str*3 + dex*18)*k)*1.1)', '', 'ATTACK,USE_MELEE_DAMAGE', '', 'NONE', '60*k', '5+25*k', '', '', '', '', '300+180*k', '0', '0', 'MELEE', '6', '0.5', '800', '0');
INSERT INTO `skill_proto` VALUES ('46', '¿¬»ç', '2', '1', '1', '0', 'HP', '-(atk + 0.2*atk*floor(2+k*6)+ (0.8*atk+dex*8*ar) *k)', '40+130*k', '', '', '15', '-(atk + 0.2*atk*floor(2+k*6)+ (0.8*atk+dex*8*ar) *k)', '', 'ATTACK,USE_ARROW_DAMAGE', '', 'NONE', '', '', '', '', '', '', '40+130*k', '0', '0', 'RANGE', '1', '1', '2500', '0');
INSERT INTO `skill_proto` VALUES ('47', '°ü°Ý¼ú', '2', '1', '1', '0', 'HP', '-(atk + (1.7*atk + dex*2+ str*2)*k)', '30+130*k', '', '', '12', '-(atk + (1.7*atk + dex*2+ str*2)*k)', '', 'ATTACK,USE_ARROW_DAMAGE', '', 'NONE', '', '', '', '', '', '', '30+130*k', '0', '0', 'RANGE', '8', '1', '2500', '0');
INSERT INTO `skill_proto` VALUES ('48', 'È­Á¶ÆÄ', '2', '1', '1', '0', 'HP', '-(1.5*atk + (2.6*atk + number(100, 300))*k)', '50+130*k', '', '', '25', '-(1.5*atk + (2.6*atk + number(100, 300))*k)', '', 'ATTACK,SPLASH,USE_ARROW_DAMAGE', '', 'NONE', '', '', '', '', '', '', '50+130*k', '0', '0', 'RANGE', '12', '0.6', '2500', '300');
INSERT INTO `skill_proto` VALUES ('49', '°æ°ø¼ú', '2', '1', '1', '0', 'MOV_SPEED', '60*k', '30+40*k', '15+30*k', '', '30+30*k', '60*k', '', 'SELFONLY', 'GYEONGGONG', 'NONE', '', '', '', '', '', '', '30+40*k', '0', '0', 'NORMAL', '1', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('50', 'µ¶±â±Ã', '2', '1', '1', '0', 'HP', '-(atk + (1.2*atk + number(100, 200)+dex*6+str*2)*k)', '40+160*k', '', '', '25', '-(atk + (1.2*atk + number(100, 200)+dex*6+str*2)*k)', '', 'ATTACK,SPLASH,USE_ARROW_DAMAGE,CRUSH,ATTACK_POISON', '', 'NONE', '80*k', '15+30*k', '', '', '', '', '40+160*k', '0', '0', 'RANGE', '12', '0.5', '2500', '300');
INSERT INTO `skill_proto` VALUES ('51', '¼¶±¤Åº', '2', '1', '1', '0', 'HP', '-((atk + (1.2*atk + number(100, 200)+dex*6+str*2)*k)*1.1)', '200+200*k', '', '', '18', '-((atk + (1.2*atk + number(100, 200)+dex*6+str*2)*k)*1.1)', '', 'ATTACK,USE_ARROW_DAMAGE', '', 'NONE', '80*k', '15+30*k', '', '', '', '', '200+200*k', '0', '0', 'NORMAL', '5', '0.5', '0', '0');
INSERT INTO `skill_proto` VALUES ('61', '¼â·ÉÁö', '3', '1', '1', '0', 'HP', '-(atk + 2*lv + iq*2 + ( 2*atk + str*4 + iq*14) * k)', '30+140*k', '', '', '10', '-(atk + 2*lv + iq*2 + ( 2*atk + str*4 + iq*14) * k)', '', 'ATTACK,USE_MELEE_DAMAGE,PENETRATE', '', 'NONE', '1+k*9', '', '', '', '', '', '30+140*k', '0', '0', 'MELEE', '4', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('62', '¿ë±ÇÆÄ', '3', '1', '1', '0', 'HP', '-(1.1 * atk + 2*lv + iq*2+(1.5*atk + str + iq*12) * k)', '50+150*k', '', '', '15', '-(1.1 * atk + 2*lv + iq*2+(1.5*atk + str + iq*12) * k)', '', 'ATTACK,USE_MELEE_DAMAGE,SELFONLY,SPLASH,IGNORE_TARGET_RATING', '', 'NONE', '1+k*9', '', '', '', '', '', '50+150*k', '0', '0', 'MELEE', '12', '1', '0', '500');
INSERT INTO `skill_proto` VALUES ('63', '±Í°Ë', '3', '1', '1', '0', 'ATT_GRADE', '(3 * iq + 2 * lv)*k', '20+240*k', '50+100*k', '2+23*k', '0', '(3 * iq + 2 * lv)*k', '', 'SELFONLY,TOGGLE', 'GWIGUM', 'HIT_HP_RECOVER', '10*k', '50+80*k', '', '', '', '', '20+240*k', '0', '0', 'NORMAL', '1', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('64', '°øÆ÷', '3', '1', '1', '0', 'DODGE', '1 + 29 * k', '60+120*k', '60+100*k', '', '100', '1 + 29 * k', '', 'SELFONLY', 'TERROR', 'NONE', '', '', '', '', '', '', '60+120*k', '0', '0', 'NORMAL', '1', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('65', 'ÁÖ¸¶°©', '3', '1', '1', '0', 'DEF_GRADE', '(iq+30)*k', '70+170*k', '30+120*k', '', '33+140*k', '(iq+30)*k', '', 'SELFONLY', 'JUMAGAP', 'REFLECT_MELEE', '(iq/4+10)*k', '30+120*k', '', '', '', '', '70+170*k', '0', '0', 'NORMAL', '1', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('66', 'ÆÄ¹ý¼ú', '3', '1', '1', '0', 'HP', '-(40 +5*lv + 2*iq+(10*iq + 7*mwep + number(50,100) )*ar*k)', '30+120*k', '', '', '12', '-(40 +5*lv + 2*iq+(10*iq + 7*mwep + number(50,100) )*ar*k)', '', 'ATTACK,COMPUTE_MAGIC_DAMAGE,SPLASH,REMOVE_GOOD_AFFECT', '', 'NONE', '10+40*k', '7+23*k', '', '', '', '', '30+120*k', '0', '0', 'NORMAL', '5', '0.6', '1800', '200');
INSERT INTO `skill_proto` VALUES ('76', '¸¶·É', '3', '1', '1', '0', 'HP', '-(40 +5*lv + 2*iq +(13*iq + 6*mwep + number(50,100) )*ar*k)', '30+140*k', '', '', '7', '-(40 +5*lv + 2*iq +(13*iq + 6*mwep + number(50,100) )*ar*k)', '', 'ATTACK,COMPUTE_MAGIC_DAMAGE,SPLASH', '', 'NONE', '', '', '', '', '', '', '30+140*k', '0', '0', 'MAGIC', '5', '0.6', '1500', '200');
INSERT INTO `skill_proto` VALUES ('77', 'È­¿°Æø', '3', '1', '1', '0', 'HP', '-(5*lv + 2*iq+(10*iq + 6*mwep + str*4 + con*2 + number(180,200) )*k)', '60+140*k', '', '', '12', '-(5*lv + 2*iq+(10*iq + 6*mwep + str*4 + con*2 + number(180,200) )*k)', '', 'ATTACK,SELFONLY,COMPUTE_MAGIC_DAMAGE,SPLASH', '', 'NONE', '', '', '', '', '', '', '60+140*k', '0', '0', 'MAGIC', '15', '0.8', '0', '500');
INSERT INTO `skill_proto` VALUES ('78', '¹«¿µÁø', '3', '1', '1', '0', 'HP', '-(30+ 2*lv + 2*iq+(7*iq + 6*mwep + number(200,500))*ar*k)', '20+30*k', '40+30*k', '5+40*k', '43+30*k', '-(30+ 2*lv + 2*iq+(7*iq + 6*mwep + number(200,500))*ar*k)', '', 'ATTACK,COMPUTE_MAGIC_DAMAGE,SPLASH,TOGGLE', '', 'NONE', '', '', '', '', '', '', '20+30*k', '0', '0', 'MAGIC', '1', '1', '800', '0');
INSERT INTO `skill_proto` VALUES ('79', 'Èæ½Å¼öÈ£', '3', '1', '1', '0', 'DEF_GRADE', '(0.5*iq+15)*k', '20+30*k', '60+120*k', '5+10*k', '63+120*k', '(0.5*iq+15)*k', '', 'SELFONLY,TOGGLE', 'MANASHIELD', 'MANASHIELD', '100-((iq*0.84)*k)', '60+120*k', '', '', '', '', '20+30*k', '0', '0', 'MAGIC', '1', '0.8', '0', '0');
INSERT INTO `skill_proto` VALUES ('80', 'Åõ¼Ó¸¶·É', '3', '1', '1', '0', 'HP', '-(40 + 2* lv + 2*iq +(2 * con + 2 * dex + 13*iq + 6*mwep + number(180, 200))*ar*k)', '40+120*k', '', '', '12', '-(40 + 2* lv + 2*iq +(2 * con + 2 * dex + 13*iq + 6*mwep + number(180, 200))*ar*k)', '', 'ATTACK,COMPUTE_MAGIC_DAMAGE,SPLASH,ATTACK_SLOW', '', 'NONE', '333+300*k', '10+10*k', '', '', '', '', '40+120*k', '0', '0', 'MAGIC', '9', '0.8', '1200', '400');
INSERT INTO `skill_proto` VALUES ('81', '¸¶È¯°Ý', '3', '1', '1', '0', 'HP', '-(120 + 6*lv + (5 * con + 5 * dex + 29*iq + 9*mwep)*ar*k)', '80+220*k', '', '', '24', '-(120 + 6*lv + (5 * con + 5 * dex + 29*iq + 9*mwep)*ar*k)', '', 'ATTACK,COMPUTE_MAGIC_DAMAGE,SPLASH', '', 'NONE', '', '', '', '', '', '', '80+220*k', '0', '0', 'MAGIC', '9', '0.4', '1500', '200');
INSERT INTO `skill_proto` VALUES ('91', 'ºñÆÄºÎ', '4', '1', '1', '0', 'HP', '-(70 + 4*lv + (20*iq+5*mwep+50)*ar*k)', '30+160*k', '', '', '7', '-(70 + 4*lv + (20*iq+5*mwep+50)*ar*k)', '', 'ATTACK,COMPUTE_MAGIC_DAMAGE,SPLASH', '', 'NONE', '', '', '', '', '', '', '30+160*k', '0', '0', 'MAGIC', '5', '0.5', '1800', '201');
INSERT INTO `skill_proto` VALUES ('92', '¿ëÆÄ»ê', '4', '1', '1', '0', 'HP', '-(60 + 5*lv + (18*iq + 6*mwep + 120)*ar*k)', '50+160*k', '', '', '8', '-(60 + 5*lv + (18*iq + 6*mwep + 120)*ar*k)', '', 'ATTACK,ATTACK_FIRE_CONT', '', 'NONE', 'lv+5*iq *k', 'iq*0.2*k', '', '', '', '', '50+160*k', '0', '0', 'MAGIC', '10', '0.8', '0', '0');
INSERT INTO `skill_proto` VALUES ('93', 'ÆÐ·æÆø', '4', '1', '1', '0', 'HP', '-(70 + 3*lv + (22*iq+13*mwep+100)*ar*k)', '50+160*k', '', '', '20', '-(70 + 3*lv + (22*iq+13*mwep+100)*ar*k)', '', 'ATTACK,SELFONLY,SPLASH,ATTACK_FIRE_CONT', '', 'NONE', 'lv+5*iq *k', 'iq*0.2*k', '', '', '', '', '50+160*k', '0', '0', 'MAGIC', '15', '0.8', '0', '500');
INSERT INTO `skill_proto` VALUES ('94', 'È£½Å', '4', '1', '1', '0', 'RESIST_NORMAL', '(iq*0.3+5)*(2*k+0.5)/(k+1.5)', '40+160*k', '60+200*k', '', '10', '(iq*0.3+5)*(2*k+0.5)/(k+1.5)', '', '', 'HOSIN', 'NONE', '', '', '', '', '', '', '40+160*k', '0', '0', 'NORMAL', '1', '1', '800', '0');
INSERT INTO `skill_proto` VALUES ('95', '¹Ý»ç', '4', '1', '1', '0', 'REFLECT_MELEE', '5+(iq*0.3 + 5)*k', '40+160*k', '60+200*k', '', '10', '5+(iq*0.3 + 5)*k', '', '', 'BOHO', 'NONE', '', '', '', '', '', '', '40+160*k', '0', '0', 'NORMAL', '1', '1', '1000', '0');
INSERT INTO `skill_proto` VALUES ('96', '±âÃµ´ë°ø', '4', '1', '1', '0', 'CRITICAL', '(iq*0.3+5)*(2*k+0.5)/(k+1.5)', '40+160*k', '60+100*k', '', '10', '(iq*0.3+5)*(2*k+0.5)/(k+1.5)', '', '', 'GICHEON', 'NONE', '', '', '', '', '', '', '40+160*k', '0', '0', 'NORMAL', '1', '1', '1000', '0');
INSERT INTO `skill_proto` VALUES ('106', '³úÀü·É', '4', '1', '1', '0', 'HP', '-(60 + 4*lv + (7*iq+8*mwep+number(iq*5,iq*15))*ar*k)', '30+150*k', '', '', '7', '-(60 + 4*lv + (7*iq+8*mwep+number(iq*5,iq*15))*ar*k)', '', 'ATTACK,SPLASH', '', 'NONE', '', '', '', '', '', '', '30+150*k', '0', '0', 'MAGIC', '5', '0.6', '1800', '200');
INSERT INTO `skill_proto` VALUES ('107', 'º­¶ô', '4', '1', '1', '0', 'HP', '-(40 + 4*lv + (13*iq+7*mwep+number(iq*5,iq*16))*ar*k)', '50+150*k', '', '', '15', '-(40 + 4*lv + (13*iq+7*mwep+number(iq*5,iq*16))*ar*k)', '', 'ATTACK,SPLASH,ATTACK_STUN', '', 'NONE', '50+1000*k/6', '5', '', '', '', '', '50+150*k', '0', '0', 'MAGIC', '15', '0.8', '1500', '400');
INSERT INTO `skill_proto` VALUES ('108', 'Æø·Ú°Ý', '4', '1', '1', '0', 'HP', '-(50 + 5*lv + (6*iq+6*mwep+number(1,800))*ar*k) * (1-chain*0.13)', '40+180*k', '', '', '10', '-(50 + 5*lv + (6*iq+6*mwep+number(1,800))*ar*k) * (1-chain*0.13)', '', 'ATTACK', '', 'NONE', '', '', '', '', '', '', '40+180*k', '0', '0', 'MAGIC', '7', '0.8', '2500', '0');
INSERT INTO `skill_proto` VALUES ('109', 'Á¤¾÷ÀÎ', '4', '1', '1', '0', 'HP', '200+4*lv+(10*iq+6*mwep+number(600,800))*k', '40+200*k', '', '', '10', '200+4*lv+(10*iq+6*mwep+number(600,800))*k', '', 'REMOVE_BAD_AFFECT', '', 'NONE', '20+80*k', '0', '', '', '', '', '40+200*k', '0', '0', 'NORMAL', '1', '1', '1000', '0');
INSERT INTO `skill_proto` VALUES ('110', 'Äè¼Ó', '4', '1', '1', '0', 'MOV_SPEED', '5 + 35*k', '60+120*k', '60+100*k', '', '10', '5 + 35*k', '', '', 'KWAESOK', 'CASTING_SPEED', '3+33*k', '60+100*k', '', '', '', '', '60+120*k', '0', '0', 'NORMAL', '1', '1', '1000', '0');
INSERT INTO `skill_proto` VALUES ('111', 'Áõ·Â¼ú', '4', '1', '1', '0', 'ATT_GRADE', '5+(iq*0.2 +15)*k', '60+120*k', '60+100*k', '', '10', '5+(iq*0.2 +15)*k', '', '', 'JEUNGRYEOK', 'NONE', '', '', '', '', '', '', '60+120*k', '0', '0', 'NORMAL', '1', '1', '1000', '0');
INSERT INTO `skill_proto` VALUES ('121', 'Åë¼Ö·Â', '0', '1', '40', '0', 'NONE', '', '', '', '', '', '', '', 'DISABLE_BY_POINT_UP', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('122', '¿¬°è±â', '0', '1', '2', '0', 'NONE', '', '', '', '', '', '', '', 'DISABLE_BY_POINT_UP', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('124', 'Ã¤±¤¼ú', '0', '1', '40', '0', 'NONE', '', '', '', '', '', '', '', 'DISABLE_BY_POINT_UP', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('125', 'º¯½Å', '0', '1', '40', '0', 'NONE', '', '', '10+1000*k', '', '', '', '', 'DISABLE_BY_POINT_UP', 'YMIR', 'NONE', '', '', 'YMIR', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '1000', '0');
INSERT INTO `skill_proto` VALUES ('126', '½Å¼ö¾î', '0', '1', '20', '0', 'NONE', '', '', '', '', '', '', '', 'DISABLE_BY_POINT_UP', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('127', 'ÃµÁ¶¾î', '0', '1', '20', '0', 'NONE', '', '', '', '', '', '', '', 'DISABLE_BY_POINT_UP', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('128', 'Áø³ë¾î', '0', '1', '20', '0', 'NONE', '', '', '', '', '', '', '', 'DISABLE_BY_POINT_UP', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('129', 'µÐ°©¼ú', '0', '1', '40', '0', 'NONE', '', '', '', '', '', '', '', 'DISABLE_BY_POINT_UP', '', 'NONE', '', '', '', 'NONE', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('130', '½Â¸¶', '0', '1', '1', '0', 'NONE', '', '', '', '', '', '', '', 'DISABLE_BY_POINT_UP', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('131', '¸»¼ÒÈ¯', '0', '1', '10', '0', 'NONE', '', '', '', '', '', '', '', 'DISABLE_BY_POINT_UP', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('137', '³­¹«', '5', '1', '1', '50', 'HP', '-(atk+(2*atk*k))', '60+80*k', '', '', '5-(4*k)', '', '', 'ATTACK,USE_MELEE_DAMAGE,CRUSH', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'MELEE', '10', '1', '300', '0');
INSERT INTO `skill_proto` VALUES ('138', 'µ¹°Ý', '5', '1', '1', '52', 'HP', '-(2.4*(200+1.5*lv)+(3*200*k))', '60+120*k', '', '', '15', '', '', 'ATTACK,USE_MELEE_DAMAGE,SPLASH,CRUSH_LONG', '', 'MOV_SPEED', '50', '5', '', '', '', '', '', '0', '0', 'MELEE', '6', '1', '400', '100');
INSERT INTO `skill_proto` VALUES ('139', 'Å»Ãâ', '5', '1', '1', '55', 'HP', '-(2*(200+1.5*lv)+(3*200*k))', '60+160*k', '', '', '20', '', '', 'ATTACK,USE_MELEE_DAMAGE,SELFONLY,SPLASH,CRUSH', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'MELEE', '12', '1', '400', '250');
INSERT INTO `skill_proto` VALUES ('140', '³­¹«(È°)', '5', '1', '1', '50', 'HP', '-(atk+(2*atk*k))', '60+80*k', '', '', '10', '', '', 'ATTACK,USE_ARROW_DAMAGE,CRUSH', '', 'NONE', '', '', '', '', '', '', '', '0', '0', '', '5', '1', '2500', '0');
INSERT INTO `skill_proto` VALUES ('151', '¿ë¾È', '0', '1', '7', '0', 'NONE', '', '', '', '', '', '', '', '', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('152', '¿ë½ÅÀÇÇÇ', '0', '1', '7', '0', 'MAX_HP', 'maxhp*0.2*k', '150+150*k', '300', '', '600', '', '', '', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('153', '¿ë½ÅÀÇÃàº¹', '0', '1', '7', '0', 'MAX_SP', 'maxsp*0.2*k', '150+150*k', '300', '', '600', '', '', '', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('154', '¼ºÈÖ°©', '0', '1', '7', '0', 'DEF_GRADE', 'odef*0.1*k', '150+150*k', '180', '', '480', '', '', '', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('155', '°¡¼ÓÈ­', '0', '1', '7', '0', 'MOV_SPEED', '15*k', '150+150*k', '180', '', '480', '', '', '', '', 'ATT_SPEED', '15*k', '180', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('156', '¿ë½ÅÀÇºÐ³ë', '0', '1', '7', '0', 'CRITICAL', '50*k', '150+150*k', '180', '', '480', '', '', 'SELFONLY', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('157', 'ÁÖ¹®¼ú', '0', '1', '7', '0', 'CASTING_SPEED', '50*k', '150+150*k', '180', '', '480', '', '', 'SELFONLY', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('158', '±æµåÀÌµ¿', '0', '1', '3', '0', 'NONE', '', '', '', '', '', '', '', 'SELFONLY', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('159', '°ø°£ÀÇ¹®', '0', '1', '5', '0', 'NONE', '', '', '', '', '', '', '', 'SELFONLY', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('160', '°¡¼ÓÈ­', '0', '1', '5', '0', 'NONE', '3*k', '80-12*k', '300', '', '', '', '', 'SELFONLY', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('161', '°ø°£ÀÇ¹®', '0', '1', '2', '0', 'NONE', '', '50', '', '', '', '', '', '', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('162', '°ø°£ÀÌµ¿', '0', '1', '2', '0', 'NONE', '', '20', '', '', '', '', '', '', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'NORMAL', '0', '1', '0', '0');
INSERT INTO `skill_proto` VALUES ('256', 'CRUSH200½ºÅ³', '0', '1', '1', '0', 'HP', '-5*k*atk', '', '', '', '2', '', '', 'ATTACK,USE_MELEE_DAMAGE,SPLASH,CRUSH', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'MELEE', '0', '1', '0', '300');
INSERT INTO `skill_proto` VALUES ('257', 'ÀÏ¹Ý¹üÀ§350½ºÅ³', '0', '1', '1', '0', 'HP', '-5*k*atk', '', '', '', '5', '', '', 'ATTACK,USE_MELEE_DAMAGE,SPLASH', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'MELEE', '0', '1', '0', '525');
INSERT INTO `skill_proto` VALUES ('258', 'CRUSH300½ºÅ³', '0', '1', '1', '0', 'HP', '-5*k*atk', '', '', '', '7', '', '', 'ATTACK,USE_MELEE_DAMAGE,SPLASH,CRUSH', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'MELEE', '0', '1', '0', '450');
INSERT INTO `skill_proto` VALUES ('259', 'ÀÏ¹Ý¹üÀ§200½ºÅ³', '0', '1', '1', '0', 'HP', '-5*k*atk', '', '', '', '9', '', '', 'ATTACK,USE_MELEE_DAMAGE,SPLASH', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'MELEE', '0', '1', '0', '300');
INSERT INTO `skill_proto` VALUES ('260', 'CURSH400½ºÅ³', '0', '1', '1', '0', 'HP', '-5*k*atk', '', '', '', '10', '', '', 'ATTACK,USE_MELEE_DAMAGE,SPLASH,CRUSH', '', 'NONE', '', '', '', '', '', '', '', '0', '0', 'MELEE', '0', '1', '0', '600');
INSERT INTO `skill_proto` VALUES ('261', 'µ¶250½ºÅ³', '0', '1', '1', '0', 'HP', '-5*k*atk', '', '', '', '9', '', '', 'ATTACK,USE_MELEE_DAMAGE,SPLASH,ATTACK_POISON', '', 'NONE', '80', '', '', '', '', '', '', '0', '0', 'MELEE', '0', '1', '0', '375');
INSERT INTO `skill_proto` VALUES ('262', 'SLOW300½ºÅ³', '0', '1', '1', '0', 'HP', '-5*k*atk', '', '', '', '12', '', '', 'ATTACK,USE_MELEE_DAMAGE,SPLASH', '', 'MOV_SPEED', '-20', '10', '', '', '', '', '', '0', '0', 'MELEE', '0', '1', '0', '450');
