DebugOutput = nothing
--当前使用的武林vip卡索引
--\settings\vip_card.txt
--VC_CURRENT_ID = 1;
--VC_CURRENT_ID = 2;
--VC_CURRENT_ID = 3;
--VC_CURRENT_ID = 4;
VC_CURRENT_ID = 5;


--贡献度奖励（根据奖励表序号按位标记）
TASKID_VC_VALUE_FLAG = 3239;

--每日清理任务变量
--记录自动完成次数
TASKID_VC_AUTO_FINISH_TIMES = 3241;
--记录日常任务完成情况（根据以下序号按位标记，31位表示是否领取精力）
TASKID_VC_DAILY_TASK_FLAG = 3240;
--日常完成次数记录
TASKID_VC_DAILY_TASK_1 = 3242;
TASKID_VC_DAILY_TASK_2 = 3243;
TASKID_VC_DAILY_TASK_3 = 3253;

--记录具体任务完成情况（按字节记录）(VIP_CARD_ID索引)
VC_DAILY_TASK = {
	[1] = 
	{
		[1] = {
			Options = "Ph? b秐" ,
			Content = {
				{"Lng S琻 B筩 秈 8", 2, "Ho祅 th祅h 秈 8 c馻 Lng S琻 B筩, s? nh薾 頲 ph莕 thng 20 甶觤 c鑞g hi課 v? 甶觤 kinh nghi謒"},
				{"мa Huy襫 Cung 秈 7", 2, "Ho祅h th祅h 7 秈 мa Huy襫 Cung, ho祅h th祅h xong nh薾 頲 20 甶觤 c鑞g hi課 v? 甶觤 kinh nghi謒"},
				{"V筺 Ki誱 Tr騨g 秈 4", 3, "Ho祅 th祅h 秈 4 c馻 V筺 Ki誱 Tr騨g, ho祅 th祅h s? nh薾 頲 ph莕 thng 20 甶觤 c鑞g hi課 v? 甶觤 kinh nghi謒"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 25, "Thi猲 Ki猽 L謓h"},
			Award = "vc_AwardCopy()",
		},	
		[2] = {
			Options = "Tr錸g c﹜" ,
			Content = {
				{"Tr錸g C﹜ B竧 Nh? Nh?", 3, "Tr錸g 3 l莕 C﹜ B竧 Nh? Nh?, ho祅 th祅h s? nh薾 頲 ph莕 thng 20 甶觤 c鑞g hi課 v? 甶觤 kinh nghi謒"},
				{"Tr錸g C﹜ B竧 Nh?", 3, "Tr錸g 3 l莕 C﹜ B竧 Nh?, ho祅 th祅h s? nh薾 頲 ph莕 thng 20 甶觤 c鑞g hi課 v? 甶觤 kinh nghi謒"},
				{"M? T骾 H箃 Gi鑞g", 3, "M? T骾 H箃 Gi鑞g 3 l莕, ho祅 th祅h s? nh薾 頲 ph莕 thng 20 甶觤 c鑞g hi課 v? 甶觤 kinh nghi謒"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 10, "Thi猲 Ki猽 L謓h"},
			Award = "vc_AwardPlant()",
		},	
		[3] = {
			Options = "Thi猲 M玭 tr薾" ,
			Content = {
				{"Chi課 th緉g trong thi猲 m玭 tr薾 v? nh薾 ph莕 thng", 1, "Trong chi課 trng Thi猲 M玭 Tr薾 gi祅h chi課 th緉g 1 l莕 v? nh薾 thng, ho祅 th祅h s? nh薾 頲 ph莕 thng 20 甶觤 c鑞g hi課 v? 甶觤 kinh nghi謒"},
				{"Tham gia Thi猲 M玭 Tr薾 v? nh薾 thng", 2, "Tham gia 2 tr薾 Thi猲 M玭 Tr薾 v? nh薾 thng, ho祅 th祅h s? nh薾 頲 ph莕 thng 20 甶觤 c鑞g hi課 v? 甶觤 kinh nghi謒"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 15, "Thi猲 Ki猽 L謓h"},
			Award = "vc_AwardTmz()",
		},	
		[4] = {
			Options = "Chi課 trng" ,
			Content = {
				{"Tham gia chi課 trng l韓 Nh筺 M玭 Quan v? nh薾 thng", 1, "Tham gia 1 tr薾 chi課 trng Nh筺 M玭 Quan v? nh薾 thng, ho祅 th祅h s? nh薾 頲 ph莕 thng 20 甶觤 c鑞g hi課 v? 甶觤 kinh nghi謒"},
				{"Tham gia chi課 trng nh? b蕋 k? v? nh薾 thng", 1, "Tham gia v? ho祅 th祅h 1 Lng Th秓 Chi課, Th玭 L祅g Chi課, Ph竜 Уi Chi課 b蕋 k? v? nh薾 thng, ho祅 th祅h s? nh薾 頲 ph莕 thng 20 甶觤 c鑞g hi課 v? 甶觤 kinh nghi謒"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 4,
			AutoFinish = {2, 97, 236, 15, "Thi猲 Ki猽 L謓h"},
			Award = "vc_AwardBattle()",
		},	
		[5] = {
			Options = "T輓h n╪g" ,
			Content = {
				{"Ti課 h祅h cng h鉧 trang b?", 1, "Ti課 h祅h 1 l莕 cng h鉧 trang b?, b蕋 k? th祅h c玭g hay kh玭g, ho祅 th祅h s? nh薾 頲 ph莕 thng 20 甶觤 c鑞g hi課 v? 甶觤 kinh nghi謒"},
				{"Ti課 h祅h dng th祅h trang b?", 1, "Ti課 h祅h 1 l莕 dng th祅h trang b?, b蕋 k? th╪g c蕄 hay kh玭g, ho祅 th祅h s? nh薾 頲 ph莕 thng 20 甶觤 c鑞g hi課 v? 甶觤 kinh nghi謒"},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_3,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_3,
			Byte = 2,
			AutoFinish = {2, 97, 236, 10, "Thi猲 Ki猽 L謓h"},
			Award = "vc_AwardEquip()",
		},	
	},
	[2] = 
	{
		[1] = {
			Options = "Ph? b秐" ,
			Content = {
				{"Lng S琻 B筩 秈 8", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Lng S琻 B筩 秈 8", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"мa Huy襫 Cung 秈 7", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "мa Huy襫 Cung 秈 7", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"V筺 Ki誱 Tr騨g 秈 4", 3, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "V筺 Ki誱 Tr騨g 秈 4", "Hu﹏ chng anh h飊g", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "Chi課 trng" ,
			Content = {
				{"Chi課 th緉g trong Thi猲 M玭 Tr薾", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Chi課 th緉g trong Thi猲 M玭 Tr薾", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{"Tham gia Thi猲 M玭 Tr薾", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia Thi猲 M玭 Tr薾", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{"Tham gia chi課 trng l韓 Nh筺 M玭 Quan v? nh薾 thng", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia chi課 trng l韓 Nh筺 M玭 Quan v? nh薾 thng", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{"Tham gia chi課 trng nh? b蕋 k? v? nh薾 thng", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia chi課 trng nh? b蕋 k? v? nh薾 thng", "Hu﹏ chng anh h飊g", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T╪g th猰" ,
			Content = {
				{"T╪g c蕄 trang b?", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "T╪g c蕄 trang b?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"Dng th祅h trang b?", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Dng th祅h trang b?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"Tr錸g C﹜ B竧 Nh? Nh?", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tr錸g C﹜ B竧 Nh? Nh?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"Tr錸g C﹜ B竧 Nh?", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tr錸g C﹜ B竧 Nh?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"M? T骾 H箃 Gi鑞g", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "M? T骾 H箃 Gi鑞g", "Hu﹏ chng anh h飊g", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_3()",
		},	
	},
	[3] = 
	{
		[1] = {
			Options = "Ph? b秐" ,
			Content = {
				{"Lng S琻 B筩 秈 8", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Lng S琻 B筩 秈 8", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"мa Huy襫 Cung 秈 7", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "мa Huy襫 Cung 秈 7", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"V筺 Ki誱 Tr騨g 秈 4", 3, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "V筺 Ki誱 Tr騨g 秈 4", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"Vt qua Ph莕 Thi猲 L﹎-Th竔 Nh蕋 Th竝_Thng", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Vt qua Ph莕 Thi猲 L﹎-Th竔 Nh蕋 Th竝_Thng", "Hu﹏ chng anh h飊g", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "Chi課 trng" ,
			Content = {
				{"Chi課 th緉g trong Thi猲 M玭 Tr薾", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Chi課 th緉g trong Thi猲 M玭 Tr薾", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{"Tham gia Thi猲 M玭 Tr薾", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia Thi猲 M玭 Tr薾", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{"Tham gia chi課 trng l韓 Nh筺 M玭 Quan v? nh薾 thng", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia chi課 trng l韓 Nh筺 M玭 Quan v? nh薾 thng", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{"Tham gia chi課 trng nh? b蕋 k? v? nh薾 thng", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia chi課 trng nh? b蕋 k? v? nh薾 thng", "Hu﹏ chng anh h飊g", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T╪g th猰" ,
			Content = {
				{"T╪g c蕄 trang b?", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "T╪g c蕄 trang b?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"Dng th祅h trang b?", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Dng th祅h trang b?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"Tr錸g C﹜ B竧 Nh? Nh?", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tr錸g C﹜ B竧 Nh? Nh?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"Tr錸g C﹜ B竧 Nh?", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tr錸g C﹜ B竧 Nh?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"M? T骾 H箃 Gi鑞g", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "M? T骾 H箃 Gi鑞g", "Hu﹏ chng anh h飊g", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_3()",
		},	
	},
	[4] = 
	{
		[1] = {
			Options = "Ph? b秐" ,
			Content = {
				{"Lng S琻 B筩 秈 8", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Lng S琻 B筩 秈 8", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"мa Huy襫 Cung 秈 7", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "мa Huy襫 Cung 秈 7", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"V筺 Ki誱 Tr騨g 秈 4", 3, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "V筺 Ki誱 Tr騨g 秈 4", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"Vt qua Ph莕 Thi猲 L﹎-Th竔 Nh蕋 Th竝_Thng", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Vt qua Ph莕 Thi猲 L﹎-Th竔 Nh蕋 Th竝_Thng", "Hu﹏ chng anh h飊g", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "Chi課 trng" ,
			Content = {
				{"Chi課 th緉g trong Thi猲 M玭 Tr薾", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Chi課 th緉g trong Thi猲 M玭 Tr薾", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{"Tham gia Thi猲 M玭 Tr薾", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia Thi猲 M玭 Tr薾", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{"Tham gia chi課 trng l韓 Nh筺 M玭 Quan v? nh薾 thng", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia chi課 trng l韓 Nh筺 M玭 Quan v? nh薾 thng", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{"Tham gia chi課 trng nh? b蕋 k? v? nh薾 thng", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia chi課 trng nh? b蕋 k? v? nh薾 thng", "Hu﹏ chng anh h飊g", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T╪g th猰" ,
			Content = {
				{"T╪g c蕄 trang b?", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "T╪g c蕄 trang b?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"Dng th祅h trang b?", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Dng th祅h trang b?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"Tr錸g C﹜ B竧 Nh? Nh?", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tr錸g C﹜ B竧 Nh? Nh?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"Tr錸g C﹜ B竧 Nh?", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tr錸g C﹜ B竧 Nh?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"M? T骾 H箃 Gi鑞g", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "M? T骾 H箃 Gi鑞g", "Hu﹏ chng anh h飊g", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_3()",
		},	
	},
	[5] = 
	{
		[1] = {
			Options = "Ph? b秐" ,
			Content = {
				{"Lng S琻 B筩 秈 8", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Lng S琻 B筩 秈 8", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"мa Huy襫 Cung 秈 7", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "мa Huy襫 Cung 秈 7", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"V筺 Ki誱 Tr騨g 秈 4", 3, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "V筺 Ki誱 Tr騨g 秈 4", "Hu﹏ chng anh h飊g", 60, 6000000)},
				{"Vt qua Ph莕 Thi猲 L﹎-Th竔 Nh蕋 Th竝_Thng", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Vt qua Ph莕 Thi猲 L﹎-Th竔 Nh蕋 Th竝_Thng", "Hu﹏ chng anh h飊g", 60, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 2,
			AutoFinish = {2, 97, 236, 5, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_1()",
		},	
		[2] = {
			Options = "Chi課 trng" ,
			Content = {
				{"Chi課 th緉g trong Thi猲 M玭 Tr薾", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Chi課 th緉g trong Thi猲 M玭 Tr薾", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{"Tham gia Thi猲 M玭 Tr薾", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia Thi猲 M玭 Tr薾", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{"Tham gia chi課 trng l韓 Nh筺 M玭 Quan v? nh薾 thng", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia chi課 trng l韓 Nh筺 M玭 Quan v? nh薾 thng", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{"Tham gia chi課 trng nh? b蕋 k? v? nh薾 thng", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia chi課 trng nh? b蕋 k? v? nh薾 thng", "Hu﹏ chng anh h飊g", 40, 6000000)},
				{" O竛 Уi_Gi祅h th緉g l頸 v? nh薾 thng", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tham gia  O竛 Уi gi祅h th緉g l頸 v? nh薾 thng", "Hu﹏ chng anh h飊g", 40, 6000000)},
			},
			RandType = 2,
			TaskIndex = TASKID_VC_DAILY_TASK_1,
			ByteIndex = 3,
			Task = TASKID_VC_DAILY_TASK_1,
			Byte = 4,
			AutoFinish = {2, 97, 236, 3, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_2()",
		},	
		[3] = {
			Options = "T╪g th猰" ,
			Content = {
				{"T╪g c蕄 trang b?", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "T╪g c蕄 trang b?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"Dng th祅h trang b?", 1, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Dng th祅h trang b?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"Tr錸g C﹜ B竧 Nh? Nh?", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tr錸g C﹜ B竧 Nh? Nh?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"Tr錸g C﹜ B竧 Nh?", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "Tr錸g C﹜ B竧 Nh?", "Hu﹏ chng anh h飊g", 50, 6000000)},
				{"M? T骾 H箃 Gi鑞g", 2, format("Ho祅 th祅h %s, ho祅 th祅h xong 頲 thng %s,  c鑞g hi課 %d 甶觤, EXP %d", "M? T骾 H箃 Gi鑞g", "Hu﹏ chng anh h飊g", 50, 6000000)},
			},
			RandType = 1,
			TaskIndex = TASKID_VC_DAILY_TASK_2,
			ByteIndex = 1,
			Task = TASKID_VC_DAILY_TASK_2,
			Byte = 2,
			AutoFinish = {2, 97, 236, 2, "Thi猲 Ki猽 L謓h"},
			Award = "vc_Award_2_3()",
		},	
	},
}

VC_VALUE_AWARD = {
	[1] = {
		[1]  = {300, 1, {2, 1, 30498, 10, 4},  "Hu﹏ chng d騨g s?"},
		[2]  = {500, 1, {2, 1, 30535, 10, 4}, "Thi誸 Tinh c蕄 3"},
		[3]  = {700, 1, {2, 1, 30499, 10, 4},  "Hu﹏ chng anh h飊g"},
		[4]  = {1000,3, "vc_Rand_3_4_JS_foot()", "Gi莥 3-4 sao ng蓇 nhi猲"},
		[5]  = {1300,1, {2, 1, 30614, 1, 1},  "L玦 H? Tinh Ph竎h"},
		[6]  = {1600,3, "vc_Rand_3_4_JS_cape()", "竜 cho祅g 3-4 sao ng蓇 nhi猲"},
		[7]  = {1900,1, {2, 1, 30614, 2, 1}, "L玦 H? Tinh Ph竎h"},
		[8]  = {2200,3, "vc_Rand_3_4_JS_badge()", "Huy chng 3-4 sao ng蓇 nhi猲"},
		[9]  = {2500,1, {2, 1, 30614, 3, 1}, "L玦 H? Tinh Ph竎h"},
		[10] = {3000,2, 10000000, "Kinh nghi謒"},
	},
	[2] = {
		[1]  = {200, 1, {2, 1, 30499, 2, 4},  "Hu﹏ chng anh h飊g"},
		[2]  = {400, 1, {2, 1, 30535, 10, 4}, "Thi誸 Tinh c蕄 3"},
		[3]  = {700, 1, {2, 1, 30499, 3, 4},  "Hu﹏ chng anh h飊g"},
		[4]  = {1000,3, "vc_Rand_3_4_JS_foot()", "Gi莥 3-4 sao ng蓇 nhi猲"},
		[5]  = {1300,1, {2, 1, 30499, 5, 4},  "Hu﹏ chng anh h飊g"},
		[6]  = {1600,3, "vc_Rand_3_4_JS_cape()", "竜 cho祅g 3-4 sao ng蓇 nhi猲"},
		[7]  = {1900,1, {2, 1, 30614, 1, 1}, "L玦 H? Tinh Ph竎h"},
		[8]  = {2200,3, "vc_Rand_3_4_JS_badge()", "Huy chng 3-4 sao ng蓇 nhi猲"},
		[9]  = {2500,1, {2, 1, 30614, 2, 1}, "L玦 H? Tinh Ph竎h"},
		[10] = {3000,2, 10000000, "Kinh nghi謒"},
	},
	[3] = {
		[1]  = {200, 1, {2, 1, 30499, 2, 4},  "Hu﹏ chng anh h飊g"},
		[2]  = {400, 1, {2, 1, 30535, 10, 4}, "Thi誸 Tinh c蕄 3"},
		[3]  = {700, 1, {2, 1, 30499, 3, 4},  "Hu﹏ chng anh h飊g"},
		[4]  = {1000,3, "vc_Rand_2_4_Gem(1)", "Ц qu? c蕄 2-4 (Ng蓇 nhi猲)"},
		[5]  = {1300,1, {2, 1, 30499, 5, 4},  "Hu﹏ chng anh h飊g"},
		[6]  = {1600,3, "vc_Rand_2_4_Gem(2)", "Ц qu? c蕄 2-4 (Ng蓇 nhi猲)"},
		[7]  = {1900,1, {2, 1, 30614, 1, 1}, "L玦 H? Tinh Ph竎h"},
		[8]  = {2200,3, "vc_Rand_2_4_Gem(3)", "Ц qu? c蕄 2-4 (Ng蓇 nhi猲)"},
		[9]  = {2500,1, {2, 1, 30614, 2, 1}, "L玦 H? Tinh Ph竎h"},
		[10] = {3000,2, 10000000, "Kinh nghi謒"},
	},
	[4] = {
		[1]  = {200, 1, {2, 1, 30499, 2, 4},  "Hu﹏ chng anh h飊g"},
		[2]  = {400, 1, {2, 1, 30535, 10, 4}, "Thi誸 Tinh c蕄 3"},
		[3]  = {700, 1, {2, 1, 30499, 3, 4},  "Hu﹏ chng anh h飊g"},
		[4]  = {1000,3, "vc_Rand_2_4_Gem(1)", "Ц qu? c蕄 2-4 (Ng蓇 nhi猲)"},
		[5]  = {1300,1, {2, 1, 30499, 5, 4},  "Hu﹏ chng anh h飊g"},
		[6]  = {1600,3, "vc_Rand_2_4_Gem(2)", "Ц qu? c蕄 2-4 (Ng蓇 nhi猲)"},
		[7]  = {1900,1, {2, 1, 30614, 1, 1}, "L玦 H? Tinh Ph竎h"},
		[8]  = {2200,3, "vc_Rand_2_4_Gem(3)", "Ц qu? c蕄 2-4 (Ng蓇 nhi猲)"},
		[9]  = {2500,1, {2, 1, 30614, 2, 1}, "L玦 H? Tinh Ph竎h"},
		[10] = {3000,2, 10000000, "Kinh nghi謒"},
	},
	[5] = {
		[1]  = {200, 1, {2, 1, 30499, 2, 4},  "Hu﹏ chng anh h飊g"},
		[2]  = {400, 1, {2, 1, 30535, 10, 4}, "Thi誸 Tinh c蕄 3"},
		[3]  = {700, 1, {2, 1, 30499, 3, 4},  "Hu﹏ chng anh h飊g"},
		[4]  = {1000,3, "vc_Rand_2_4_Gem(1)", "Ц qu? c蕄 2-4 (Ng蓇 nhi猲)"},
		[5]  = {1300,1, {2, 1, 30499, 5, 4},  "Hu﹏ chng anh h飊g"},
		[6]  = {1600,3, "vc_Rand_2_4_Gem(2)", "Ц qu? c蕄 2-4 (Ng蓇 nhi猲)"},
		[7]  = {1900,1, {2, 1, 30614, 1, 1}, "L玦 H? Tinh Ph竎h"},
		[8]  = {2200,3, "vc_Rand_2_4_Gem(3)", "Ц qu? c蕄 2-4 (Ng蓇 nhi猲)"},
		[9]  = {2500,1, {2, 1, 30614, 2, 1}, "L玦 H? Tinh Ph竎h"},
		[10] = {3000,2, 10000000, "Kinh nghi謒"},
	},
}