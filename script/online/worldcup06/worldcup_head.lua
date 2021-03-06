
ANSWER610 = 1630	--记录每天回答问题的情况，如ANSWER610记录玩家6月11日回答6月10日的比赛结果的情况
ANSWER611 = 1631
ANSWER612 = 1632
ANSWER613 = 1633
ANSWER614 = 1634
ANSWER615 = 1635
ANSWER616 = 1636
ANSWER617 = 1637
ANSWER618 = 1638
ANSWER619 = 1639
ANSWER620 = 1640
ANSWER621 = 1641
ANSWER622 = 1642
ANSWER623 = 1643
ANSWER624 = 1644
ANSWER625 =	1645
ANSWER626 = 1646
ANSWER627 = 1647
ANSWER628 = 1648
ANSWER629 = 1649
ANSWER630 = 1650
ANSWER701 = 1651
ANSWER702 = 1652
ANSWER703 = 1653
ANSWER704 = 1654
ANSWER705 = 1655
ANSWER706 = 1656
ANSWER707 = 1657
ANSWER708 = 1658
ANSWER709 = 1659
ANSWER710 = 1660

FORECAST610 = 1661	--记录每天预测结果的情况，如FORECAST610记录玩家6月9日预测6月10日比赛结果的情况
FORECAST611 = 1662
FORECAST612 = 1663
FORECAST613 = 1664
FORECAST614 = 1665
FORECAST615 = 1666
FORECAST616 = 1667
FORECAST617 = 1668
FORECAST618 = 1669
FORECAST619 = 1670
FORECAST620 = 1671
FORECAST621 = 1672
FORECAST622 = 1673
FORECAST623 = 1674
FORECAST624 = 1675

AWARD_DAY = 1676
AWARD_WEEK1 = 1677	--回答问题累计奖励
AWARD_WEEK2 = 1678	--预测比赛累计奖励
AWARD_FINAL = 1679

TEAM4_1 = 1680	--记录玩家选择的四强队伍的索引
TEAM4_2 = 1681
TEAM4_3 = 1682
TEAM4_4 = 1683

TEAM2_1 = 1684	--记录玩家选择的二强队伍的索引
TEAM2_2 = 1685

TEAM_CHAMPION = 1686	--记录玩家选择的冠军队伍的索引

WEEK1 = 3; --回答问题周奖励标记。每过一周(发完每周奖励之后)更新一次这个全局变量，如第二周则变为2
WEEK2 = 2; --预测赛事周奖励标记。每过一周(发完每周奖励之后)更新一次这个全局变量，如第二周则变为2。由于第3周没有明日赛事预测了，因此不用改为３

tMatch = {
		[1] = {610,"c-Costa Rica","Ba Lan-Ecuador"},
		[2] = {611,"Anh-Paraguay","Trinidad v? Tobago-Th魕 觧","竎hentina-B? Bi觧 Ng?"},
		[3] = {612,"Nam T?-H? Lan","M? Hi C?-Iran","Angola-B? Уo Nha"},
		[4] = {613,"骳-Nh藅 B秐","M?-Ti謕 Kh綾","?-Ghana"},
		[5] = {614,"H祅 Qu鑓-Togo","Ph竝-Th魕 S?","Brazil-Croatia"},
		[6] = {615,"T﹜ Ban Nha-Ukraina","Tunisia-? R藀 X? 髏","c-Ba Lan"},
		[7] = {616,"Ecuador-Costa Rica","Anh-Trinidad v? Tobago","Th魕 觧-Paraguay"},
		[8] = {617,"竎hentina-Nam T?","H? Lan-B? Bi觧 Ng?","M? Hi C?-Angola"},
		[9] = {618,"B? Уo Nha-Iran","Ti謕 Kh綾-Ghana","?-M?"},
		[10] = {619,"Nh藅 B秐-Croatia","Brazil-骳","Ph竝-H祅 Qu鑓"},
		[11] = {620,"Togo-Th魕 S?","T﹜ Ban Nha-Tunisia","? R藀 X? 髏-Ukraina"},
		[12] = {621,"Ecuador-c","Costa Rica-Ba Lan","Th魕 觧-Anh","Paraguay-Trinidad v? Tobago"},
		[13] = {622,"B? Уo Nha-M? Hi C?","Iran-Angola","H? Lan-竎hentina","B? Bi觧 Ng?-Nam T?"},
		[14] = {623,"Ti謕 Kh綾-?","Ghana-M?","Nh藅 B秐-Brazil","Croatia-骳"},
		[15] = {624,"? R藀 X? 髏-T﹜ Ban Nha","Ukraina-Tunisia","Togo-Ph竝","Th魕 S?-H祅 Qu鑓"},
		[16] = {625,"c-Th魕 觧","竎hentina-M? Hi C?"},
		[17] = {626,"Anh-Ecuador","B? Уo Nha-H? Lan"},
		[18] = {627,"?-骳","Th魕 S?-Ukraina"},
		[19] = {628,"Brazil-Ghana","T﹜ Ban Nha-Ph竝"},
		[20] = {629},
		[21] = {630},
		[22] = {701,"c-竎hentina","?-Ukraina"},
		[23] = {702,"Anh-B? Уo Nha","Brazil-Ph竝"},
		[24] = {703},
		[25] = {704},
		[26] = {705,"c-?"},
		[27] = {706,"B? Уo Nha-Ph竝"},
		[28] = {707},
		[29] = {708},
		[30] = {709,"c-B? Уo Nha"},
		[31] = {710,"?-Ph竝"},
		};
tTeam16 = {	--十六强队伍索引Table
		"c",
		"Ecuador",
		"Anh",
		"Th魕 觧",
		"竎hentina",
		"H? Lan",
		"B? Уo Nha",
		"M? Hi C?",
		"?",
		"Ghana",
		"Brazil",
		"骳",
		"Th魕 S?",
		"Ph竝",
		"T﹜ Ban Nha",
		"Ukraina",
		}
tMatchResult = {	--每次更新时都要填写最新的比赛结果
		[1] = 21,	--"德国-哥斯达黎加","波兰-厄瓜多尔"
		[2] = 131,	--"英格兰-巴拉圭","特立尼达和多巴哥-瑞典","阿根廷-科特迪瓦"
		[3] = 212,	--"塞黑-荷兰","墨西哥-伊朗","安哥拉-葡萄牙"
		[4] = 121,	--"澳大利亚-日本","美国-捷克","意大利-加纳"
		[5] = 131,	--"韩国-多哥","法国-瑞士","巴西-克罗地亚"
		[6] = 131,	--"西班牙-乌克兰","突尼斯-沙特阿拉伯","德国-波兰"
		[7] = 111,	--"厄瓜多尔-哥斯达黎加","英格兰-特立尼达和多巴哥","瑞典-巴拉圭"
		[8] = 311,	--"阿根廷-塞黑","荷兰-科特迪瓦","墨西哥-安哥拉"
		[9] = 321,	--"葡萄牙-伊朗","捷克-加纳","意大利-美国"
		[10] = 313,	--"日本-克罗地亚","巴西-澳大利亚","法国-韩国"
		[11] = 212,	--"多哥-瑞士","西班牙-突尼斯","沙特阿拉伯-乌克兰"
		[12] = 1322,--"厄瓜多尔-德国","哥斯达黎加-波兰","瑞典-英格兰","巴拉圭-特立尼达和多巴哥"
		[13] = 1331,--"葡萄牙-墨西哥","伊朗-安哥拉","荷兰-阿根廷","科特迪瓦-塞黑"
		[14] = 3212,--"捷克-意大利","加纳-美国","日本-巴西","克罗地亚-澳大利亚"
		[15] = 1212,--"沙特阿拉伯-西班牙","乌克兰-突尼斯","多哥-法国","瑞士-韩国"
		[16] = 11,	--"德国-瑞典","阿根廷-墨西哥"
		[17] = 11,	--"英格兰-厄瓜多尔","葡萄牙-荷兰"
		[18] = 21,	--"意大利-澳大利亚","瑞士-乌克兰"
		[19] = 21,	--"巴西-加纳","西班牙-法国"
		[20] = 0,	--
		[21] = 0,	--
		[22] = 11,	--"德国-阿根廷","意大利-乌克兰"
		[23] = 22,	--"英格兰-葡萄牙","巴西-法国"
		[24] = 0,	--
		[25] = 0,	--
		[26] = 2,	--"德国-意大利"
		[27] = 2,	--"葡萄牙-法国"
		[28] = 0,	--
		[29] = 0,	--
		[30] = 1,	--"德国-葡萄牙"
		[31] = 1,	--"意大利-法国"
		};

tTeam4Result = {1,7,9,14};
tTeam2Result = {9,14};
nTeamChampion = 9;
g_DateCount = getn(tMatch);	