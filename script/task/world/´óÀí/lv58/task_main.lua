-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理58级任务过程处理文件
-- By StarryNight
-- 2006/01/10 PM 17:02

-- ======================================================

-- 引用剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--宋朝手信
GiftData = {
	[1] = {2,0,374,"C? s蕐 kh?"},
	[2] = {2,0,375,"V辴 quay"},
	[3] = {2,0,376,"Ng鏽g h蕄 u xanh"},
	[4] = {2,0,377,"B竛h t?"},
	[5] = {2,0,378,"B竛h 輙 m苙"},
}

--领取接孩子任务
function task_000_00()

local strTalk = {
	"Nghe n鉯 <sex> ? Чi L?  gi髉 r蕋 nhi襲 i s?! Qu鑓 s? ta c騨g v? c飊g c秏 k輈h <sex>.",
	"Qu鑓 s? qu? khen, c? g? ch? b秓 t筰 h? kh玭g?",
	"Kh玭g d竚! C? th? thay l穙 phu n Thi猲 Ba Dng Ph? m閠 chuy課 kh玭g?",
	"C? chuy謓 g? sao?",
	"Nhi t? фng Ca Minh n Dng M玭 h鋍 v?, mu鑞 v? th╩ ph? th﹏, nh璶g ch璦 quen 阯g thu閏 l鑙, phi襫 <sex> n Dng M玭 n v?.",
	"T筰 h? 甶 ngay!",
	" t? <sex>. Phi襫 <sex> n Dng M玭 b竜 l筰 cho Xa Th竔 Qu﹏ bi誸 vi謈 n祔!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV55_ID,6);
	GivePlayerExp(SkeyDali,"daliguoshi")
	CreateTrigger(4,202,TALK_DL_SHETAIJUN);
	Msg2Player("дn Dng M玭 t譵 Xa Th竔 Qu﹏ a фng c玭g t? v? Чi L?.");
	TaskTip("дn Dng M玭 t譵 Xa Th竔 Qu﹏ a фng c玭g t? v? Чi L?.");
	return
	
end

--未到佘太君处接孩子
function task_001_00()

local strTalk = {
	"Phi襫 <sex> n Dng M玭 t譵 Xa Th竔 Qu﹏",
	}

	TalkEx("",strTalk);
	--补领佘太君对话触发器
	if GetTrigger(SheTaiJun_Talk) == 0 then
		CreateTrigger(4,202,TALK_DL_SHETAIJUN);
		Msg2Player("дn Dng M玭 t譵 Xa Th竔 Qu﹏ a фng c玭g t? v? Чi L?.");
		TaskTip("дn Dng M玭 t譵 Xa Th竔 Qu﹏ a фng c玭g t? v? Чi L?.");
	end;
	return
end

--带孩子到达目的地
function task_002_00()

local nItemOk = buy_all_gift()

	if nItemOk == 1 then
		strTalk = {
			"фng Qu鑓 s?, {c玭g t鰙 b譶h an tr? v? c遪 甧m v? {v? s? v藅 ph萴} t? {Чi T鑞g}.",
			"Nh鱪g m鉵 c s秐 n祔 u do v? <sex> n祔 mua gi髉. Cha mau thng cho <sex> 甶!",
			}
  	
		KillFollower();--去掉跟随的小孩
		SetTask(TASK_DL_LV55_ID,8);
		--UseScrollEnable(1);--可以使用回程符
		--SetDeathScript("");--撤销玩家死亡脚本
		RemoveTrigger(GetTrigger(TALK_DL_SHETAIJUN));
		TalkEx("task_002_01",strTalk);

	else
		strTalk = {
			"Cha! Con c? vi謈 g蕄, s? quay l筰 sau!",
			}
		TalkEx("",strTalk);
	end
end

--护送董迦明回家后领取奖励选择
function task_002_01()

local strSay = {
	"C? ch髏 th祅h ?, xin nh薾 cho!",
	" t?!/#reward(1)",
	"Ch? l? vi謈 m鋘, s? ng﹏ lng n祔 t筰 h? kh玭g d竚 nh薾!/#reward(2)",
	}
	
	SelectSay(strSay);
	GivePlayerAward("Level_58", "xn_step_2");
	GivePlayerExp(SkeyDali,"teshecai")
end

function reward(nkind)

local strTalk = {
	"Th藅 s? c秏 琻 <sex>! Xin <sex>h穣 ngh? ng琲! Sau n祔 c遪 s? nh? n <sex>.",
	}
	TalkEx("",strTalk);
	
	if nkind == 1 then -- 给玩家金钱
		Earn(250000);
	else -- 给玩家声望
		ModifyReputation(10,0);
	end;
end


--已经完成大送名菜任务    
function task_003_00()

local strTalk = {};

	if GetLevel() >= 55 then
		strTalk = {
			"<sex> c? tin vui g? kh玭g?",
			"Tai h? c? th? gi髉 g? cho Qu鑓 s? kh玭g?",
			"C? vi謈 n祔 mu鑞 nh? <sex> gi髉 , nh璶g do m蕐 h玬 trc th蕐 <sex> v蕋 v? n猲 kh玭g d竚 nh?!",
			"T筰 h? l? ngi h鋍 v? ch? b? ch髏 c玭g s鴆 u c? ng g?, xin Qu鑓 s? c? n鉯!",
			"B筩h Th駓 ng ? V? L╪g s琻 c? r蕋 nhi襲 D琲 c. <sex> c? th? gi髉 ta b総 20 con kh玭g?",
			"Л頲! T筰 h? 甶 ngay!",
			}
		
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV55_ID,9);
		SetTask(TASK_DL_LV60_ID,1);
		CreateTrigger(0,260,KILL_DL_POISONBAT);
		Msg2Player("дn B筩h Th駓 ng gi誸 20 D琲 c.");
		TaskTip("дn B筩h Th駓 ng gi誸 20 D琲 c.");
			
	else	
		strTalk = {
			"Xin <sex> h穣 ngh? ng琲 m閠 th阨 gian!",
			}
		TalkEx("",strTalk); 

	end
end


--跟酒楼老板买手信对话
function buy_gift_talk(index)

local strSay = {
	"Kh竎h quan mu鑞 d飊g g?? "..GiftData[index][4].." kh竎h quan c? mu鑞 mua kh玭g?",
	"Mua 1 ph莕/#buy_gift("..index..")",
	"Kh玭g mua/no"
	}
	SelectSay(strSay)
	return
end

--购买手信
function buy_gift(index)

local strTalk = {};
	
	if Pay(50000) == 1 then
		AddItem(GiftData[index][1],GiftData[index][2],GiftData[index][3],1,1)
		strTalk = {" t?, 產 t?!"};
		TalkEx("",strTalk);
	else
		strTalk = {"Kh玭g c? ng﹏ lng ??"};
		TalkEx("",strTalk);
	end
end

--判断是否买到5样手信
--返回值：1 全部买到；0 没有买全
function buy_all_gift()

local	i = 0;
	
	for i = 1,5 do
		if GetItemCount(GiftData[i][1],GiftData[i][2],GiftData[i][3]) <= 0 then
			return 0
		end;
	end
	
	for i=1,5 do
		DelItem(GiftData[i][1],GiftData[i][2],GiftData[i][3],1);
	end
	return 1
end 

--领取了杀死20个毒蝠任务后
function task_009_00()

local strTalk = {
	"дn t莕g 1 B筩h Th駓 ng (V? L╪g s琻) gi誸 20 D琲 c trc !.",
	}
	
	if	GetTrigger(KILL_DL_POISONBAT) == 0 then
		CreateTrigger(0,260,KILL_DL_POISONBAT);
		Msg2Player("дn B筩h Th駓 ng gi誸 20 D琲 c.");
		TaskTip("дn B筩h Th駓 ng gi誸 20 D琲 c.");
	end;
	
	TalkEx("",strTalk);
	return
end

--已经杀死20毒蝠后
function task_010_00()

local strTalk = {
		"V? r錳 ?? C遪 vi謈 g? t筰 h? c? th? gi髉 頲 kh玭g?",
		"Xi H醓 gi竜  g莕 y l筰 xu蕋 hi謓 ? B筩h Th駓 ng, th? l躰h c馻 ch髇g l? t猲 Xi H醓 竎 T╪g v? c飊g l頸 h筰, Чi T鑞g  c? bao nhi猽 binh s? n ti猽 tr? b鋘 ch髇g u kh玭g th蕐 tr? v?.",
		"{Xi H醓 竎 T╪g}? 竎 T╪g ngh躠 l? g??",
		"Ta c騨g kh玭g r?, c? l? b鋘 ch髇g c s竎h kh玭g nhi襲 n猲 d飊g sai ch?.",
		"Qu鑓 s? c? mu鑞 ti猽 tr? t猲 {Xi H醓 竎 T╪g}  kh玭g?",
		"<sex> hi謓 ch璦 h錳 ph鬰, s? <sex> ch璦 ph秈 l? i th? c馻 Xi H醓 竎 t╪g",
		"Qu鑓 s? y猲 t﹎, c? ch? tin vui c馻 h筰 h?.",
		"N誹 v藋 th? tr玭g nh? v祇 <sex>. Xi H醓 竎 T╪g ? t莕g 1 B筩h Th駓 ng.",
		}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_ID,3);
	Msg2Player("дn B筩h Th駓 ng t莕g 1 di謙 Xi H醓 竎 T╪g.");
	TaskTip("дn B筩h Th駓 ng t莕g 1 di謙 Xi H醓 竎 T╪g.");
	GivePlayerAward("Level_60", "xn_step_1");
	GivePlayerExp(SkeyDali,"baishuidong")
	return
	
end

--未杀死蚩火僧恶对话
function task_011_00()

local strTalk = {
	"Xi H醓 竎 T╪g ? t莕g 1 B筩h Th駓 ng. <sex> nh? b秓 tr鋘g!",
	}

	TalkEx("",strTalk);	
	return
	
end

--已经杀死蚩火僧恶对话
function task_112_00()

local strTalk = {
		"<sex> v蕋 v? qu?!",
		"Kh玭g sao, t筰 h? d? s鴆  gi誸 h緉.",
		"Sau n祔 c遪 nhi襲 vi謈 nh? n <sex>, b﹜ gi? h穣 ngh? ng琲 !",
		}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_ID,5);
	GivePlayerAward("Level_60", "xn_step_2","chest","Level_61");
	GivePlayerExp(SkeyDali,"cihuoesheng")
	return
end

--领取白水洞任务
function task_013_00()

local strTalk = {
	"Qu鑓 s? c遪 c? g? ch? b秓?",
	"Xi H醓 Gi竜  產ng t? t藀 ? V? L╪g s琻. <sex> bi誸 chuy謓 n祔 ch璦?",
	"Trc y m蕐 ng祔 {Cao Qu鑓 C玭g Cao Th╪g Tuy襫} c? sai t筰 h? n .",
	"C竎h y kh玭g l﹗ B筩h Th駓 ng l筰 xu蕋 hi謓 D? Xoa, h緉  s竧 h筰 bao nhi猽 ngi 甶 qua . L莕 n祔 phi襫 b籲g h鱱 n  m閠 chuy課!",
	"B蕋 lu薾 ch髇g l頸 h筰 th? n祇, t筰 h? c騨g kh玭g ch鑙 t?.",
	"<sex> qu? l? h祇 hi謕, nh璶g n誹 <sex> c? ng i h? tr? s? t鑤 h琻!",
	"T筰 h? bi誸 r錳, l藀 t鴆 n {B筩h Th駓 ng} y.",
	"Xin <sex> b秓 tr鋘g!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_ID,6);
	Msg2Player("дn B筩h Th駓 ng t莕g 2 nh b筰 D? Xoa (227.212).");
	TaskTip("дn B筩h Th駓 ng t莕g 2 nh b筰 D? Xoa (227.212).");
	
	return
	
end

--已经领取了白水洞任务
function task_014_00()

local strTalk = {
	"D? Xoa ? t莕g 2 B筩h Th駓 ng. <sex> nh? b秓 tr鋘g!",
	}

	TalkEx("",strTalk);	
	return
end

--已经杀死夜叉对话
function task_015_00()

local strTalk = {
	"V? r錳 ??",
	"T筰 h?  nh b筰 {D? Xoa}! M謙 ch誸 甶 頲!",
	" t? <sex>, l莕 n祔 may m? nh? c? <sex> gi髉 . L莕 trc ta c遪 n? Tr辬h c? nng 10 lng. <sex> c? th? gi髉 ta 甧m n  頲 kh玭g?",
	"Л琻g nhi猲 l? 頲 r錳!",
	" t? <sex>, xin 甧m 10 lng n祔 n cho Tr辬h Qu竛 Chi!",
	}
	Earn(100000);
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_ID,8);
	Msg2Player("m ng﹏ lng n Чi L? cho Tr辬h Qu竛 Chi.");
	TaskTip("m ng﹏ lng n Чi L? cho Tr辬h Qu竛 Chi.");
	GivePlayerAward("Level_61", "xn_step_1",nil,nil,"YunTie",1);
	GivePlayerExp(SkeyDali,"cihuoyecha")
	GivePlayerEquipment("head","Level_64",1);
	GivePlayerEquipment("legs", "Level_66",1);
	return
	
end

--已经完成夜叉任务
function task_016_00()

local strTalk = {
	"Ngi Чi T鑞g th藅 bi誸 l祄 ╪!",
	}
	
	TalkEx("",strTalk);
	return
end

--已经完成蚩火教的挑战书任务
function task_017_00()

local strTalk = {};
	
	--80级方能接任务
	if GetLevel() >= 80 then
		strTalk = {
			"S? vi謈 c馻 Nh? Ho祅g T? v? c飊g c蕄 b竎h, phi襫 <sex> n Чi L? ti猽 tr? qu﹏ ph秐 lo筺.",
			"T筰 h? 甶 ngay!",
			"u l躰h qu﹏ ph秐 lo筺 c騨g l? i trng h? v? c馻 Nh? Ho祅g T? t猲 祅 Th鮝 , t猲 n祔 l? m閠 cao th? c? ti課g ? Чi L?.",
			"Hi謓 gi? h? ? u?",
			"Nh蕋 nh ph秈 nh b筰 祅 Th鮝 !",
			} 	           
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV80_ID,1);
		SetTask(TASK_DL_LV70_ID,5);
		Msg2Player("дn ph輆 nam T﹜ Song B秐 N筽 nh b筰 祅 Th鮝 .");
		TaskTip("дn ph輆 nam T﹜ Song B秐 N筽 nh b筰 祅 Th鮝 .");
	else
		strTalk = {
			"Th? l鵦 c馻 Nh? Ho祅g T? 產ng r蕋 m筺h, hi謓 gi? ta kh玭g ph秈 l? i th? c馻 ch髇g. <sex> c莕 ph秈 r蘮 luy謓 th猰 n鱝!",
			}
		TalkEx("",strTalk);
	end
end

--未打倒段承恩之前对话
function task_018_00()

local strTalk = {
	"祅 Th鮝  ? ph輆 Йng nam T﹜ Song B秐 N筽.",
	}
	
	TalkEx("",strTalk);
	return
end

--与二皇子对话后
function task_019_00()
                      
local nTime = GetTime();                      
local strTalk = {
	"<sex> v? r錳 ?? M鋓 vi謈 th? n祇?",
	"T筰 h?  g苝 {Nh? Ho祅g T鰙 nghe n鉯 l? b? oan, trong {chi誹 ch? c馻 Ti猲  Чi L齷 v蒼 mu鑞 h緉 ti誴 t鬰 k? v?.",
	"C? chuy謓 n祔 ?? Th藅 bu錸 ci, h緉 c? g?  ch鴑g minh?",
	"H緉 a cho t筰 h? {chi誹 th? c馻 Ti猲 }, kh玭g bi誸 th藅 hay gi?.",
	"Ngi a ta xem!",
	"?",
	"ng l? b髏 t輈h c馻 Ti猲 .",
	"V藋 ph秈 l祄 sao?",
	"Ta th蕐 Tam Ho祅g T? m韎 x鴑g ng l? ngi k? v?, nh璶g ? ti猲   nh? v藋 chi b籲g ph秈 xem l筰. C? tin g? ta s? b竜 l筰 ngi sau.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_ID,4);
	DelItem(2,0,381,1);--删去二皇子的信物
	SetTask(TASK_DL_LV80_TIME_ID,nTime);
	Msg2Player("ьi tin c馻 фng Qu鑓 S?");
	TaskTip("ьi tin c馻 фng Qu鑓 S?");
	GivePlayerAward("Level_76", "xn_step_2",nil,nil,"YunTie",1);
	GivePlayerEquipment("head","Level_72",1);
	GivePlayerEquipment("chest","Level_70",1);
	GivePlayerEquipment("legs","Level_74",1);
	return
end

--与董迦罗对话，领取打败乾达婆任务1
function task_019_01()

local strTalk = {};
local nTime = GetTime() - GetTask(TASK_DL_LV80_TIME_ID);

	--在线时间20分钟之后
	if nTime >= 1200 then
		strTalk = {
			"{фng Qu鑓 S瓆, s? vi謈 th? n祇 r錳?",
			"Kh玭g xong r錳, Tam Ho祅g T? kh玭g ch辵 tho竔 v?. Ta nh d飊g uy l鵦  b鴆 h緉 tho竔 v?. Kh玭g ng? h緉 l筰 頲 ngi c馻 Thi猲 T莔 Th竝 h? tr? a v祇 Thi猲 T莔 Th竝 r錳, kh玭g c遪 c竎h n祇 kh竎.",
			"V藋 gi? ph秈 l祄 sao?",
			"<sex>, Чi L? n祔 ch? c? m譶h <sex> l? v? c玭g cao cng. Mau truy b総 Tam Ho祅g T?!",
			"Л頲 th玦!",
			}
		TalkEx("task_019_02",strTalk);
	else
		strTalk = {
			"T筸 th阨 ch璦 c? tin t鴆 g?! Quay l筰 sau nh?!",
			}
		TalkEx("",strTalk);
	end
end

--与董迦罗对话，领取打败乾达婆任务2
function task_019_02()

local strTalk = {};
strTalk = {
		"Tam Ho祅g T? r蕋 th輈h ph竜, h緉 hi謓 ? t莕g cu鑙 c飊g c馻 Thi猲 T莔 Th竝. Ngi ph秈 nh b筰 C祅 Чt B? h? v? c馻 h緉 l蕐 頲 ph竜. Sau  t ph竜 l祄 t輓 hi謚 g鋓 h緉 ra.",
		"{C祅 Чt B祡 ? u?",
		"H緉 hi謓 ? t莕g 1 Thi猲 T莔 Th竝.",
	}		
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_TIME_ID,1);--已经等候20分钟标志
	Msg2Player("дn t莕g 1 Thi猲 T莔 Th竝 nh b筰 C祅 Чt B?");
	TaskTip("дn t莕g 1 Thi猲 T莔 Th竝 nh b筰 C祅 Чt B?");
end	

--未打倒乾达婆前与董迦罗对话
function task_020_00()

local strTalk = {
	"C祅 Чt B? ? t莕g 1 Thi猲 T莔 Th竝.",
	}
	
	TalkEx("",strTalk);
	return
end

--打倒乾达婆后与董迦罗对话，领取杀死紧那罗任务
function task_021_00()

local strTalk = {
	"Х l蕐 頲 {ph竜 hi謚}, nh璶g ch璦 c? {ng遡 n鎪.",
	"Ng遡 n? 產ng ? ch? Kh萵 Na La, ngi ph秈 nh b筰 h緉 m韎 l蕐 頲.",
	"{Kh萵 Na La} ? u?",
	"H緉 ? t莕g 2 Thi猲 T莔 Th竝.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_ID,6);
	DelItem(2,0,382,1);--删去乾达婆信物
	Msg2Player("дn t莕g 2 Thi猲 T莔 Th竝 nh b筰 Kh萵 Na La.");
	TaskTip("дn t莕g 2 Thi猲 T莔 Th竝 nh b筰 Kh萵 Na La.");
	GivePlayerAward("Level_81","xn_step_1");		
	GivePlayerExp(SkeyDali,"qiandapo")
	return
end

--未打倒紧那罗前与董迦罗对话
function task_022_00()

local strTalk = {
	"Kh萵 Na La ? t莕g 2 Thi猲 T莔 Th竝.",
	}
	
	TalkEx("",strTalk);
	return
end

--打倒紧那罗后与董迦罗对话，领取前往打败三皇子任务
function task_023_00()

local strTalk = {
	"T筰 h?  l蕐 頲 {ng遡 n鎪.",
	"B﹜ gi? ngi c? th? n t莕g 3 Thi猲 T莔 Th竝 t譵 Ph竜 hi謚 頲 r錳!",
	"е t? tu﹏ l謓h!",
	"<sex> ph秈 c萵 th薾, c薾 v? c馻 Tam Ho祅g T? u l? nh鱪g cao th?!",
	"Ta bi誸 r錳!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_ID,8);
	DelItem(2,0,383,1);--删去引线
	AddItem(2,0,384,1,1);--得到召唤三皇子物件
	Msg2Player("дn t莕g 3 Thi猲 T莔 Th竝 d飊g ph竜 hi謚  g鋓 Tam Ho祅g T?");
	TaskTip("дn t莕g 3 Thi猲 T莔 Th竝 d飊g ph竜 hi謚  g鋓 Tam Ho祅g T?");
	GivePlayerAward("Level_81","xn_step_2");
		GivePlayerExp(SkeyDali,"jinnaluo")
	return
end

--未打倒三皇子前与董迦罗对话（补领召唤三皇子物品）
function task_024_00()

local strTalk = {
	"<sex> n t莕g 3 Thi猲 T莔 Th竝 d飊g Ph竜 Hi謚 g鋓 Tam Ho祅g T?, nh璶g b猲 c筺h h緉 lu玭 c? nh鱪g c薾 v? c l鵦. Ph秈 b秓 tr鋘g!",
	}
	
	TalkEx("",strTalk);
	if GetItemCount(2,0,384) <= 0 then
		AddItem(2,0,384,1,1);--得到召唤三皇子物件
		Msg2Player("дn t莕g 3 Thi猲 T莔 Th竝 d飊g ph竜 hi謚  g鋓 Tam Ho祅g T?");
		TaskTip("дn t莕g 3 Thi猲 T莔 Th竝 d飊g ph竜 hi謚  g鋓 Tam Ho祅g T?");
	end
	return
end
	
--打倒三皇子后与董迦罗对话1
function task_025_00()

local strTalk = {
	"Х nh b筰 {tam Ho祅g T鰙.",
	"C薾 v? c馻 h緉 c騨g  b? kh鑞g ch?.",
	"V藋 c遪 {Xi H醓 gi竜}?",
	"Tam Ho祅g T? trc khi r阨 kh醝 Чi L? trong tay  c? b秐 S琻 H? X? T綾 v? v藋 頲 Xi H醓 Gi竜 v? Thi猲 T莔 Th竝 k誸 l祄 ng minh, Xi H醓 Gi竜 v? th? ng祔 c祅g t竎 lo筺.",
	}
	TalkEx("task_025_01",strTalk);
end

--打倒三皇子后与董迦罗对话2
function task_025_01()

local strTalk = {	
	"Qu﹏ ph秐 lo筺 c馻 {Xi H醓 gi竜}  d裵 頲 ch璦?",
	"Nh? Ho祅g T? s緋 l猲 ng玦 nh璶g Ti猲 д v? Чi Ho祅g T? hi謓 gi? kh玭g bi誸 ? u! D? sao c騨g 產 t? <sex>  qu? v蕋 v?!",
	"Ch? g鉷 ch髏 c玭g s鴆, kh玭g ng l? bao.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_ID,10);
	GivePlayerAward("Level_81","xn_step_3",nil,nil,"YunTie",1);
	GivePlayerEquipment("chest","Level_71",1);
	GivePlayerEquipment("head","Level_73",1);
	GivePlayerEquipment("legs","Level_75",1);
	GivePlayerExp(SkeyDali,"dalisanhuangzi")
end
