-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北任务触发器处理
-- By StarryNight
-- 2007/06/06 PM 3:49

-- 什么时候可以做个单纯的策划，不用写脚本呢，郁闷ing

-- ======================================================
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\g_random_head.lua");
Include("\\script\\task\\world\\task_award.lua");

---------------------------------------------------杀怪触发器-----------------------------------------------

--杀死波斯妖姬取得衣服
function bosihanfu_killed_1()

	if g_probability(5,100) then
   	AddItem(2,0,686,1,1);--得到波斯妖姬衣服一套
  	if GetItemCount(2,0,686) >= 1 and GetItemCount(2,0,687) >= 1 then
   		TaskTip("Х nh薾 頲 Y猽 C? Ba T? v? trang ph鬰 ph? n? T﹜ V鵦, m鏸 th? m閠 b?, mau a cho  Dng H鋋. ");
   		Msg2Player("Х nh薾 頲 Y猽 C? Ba T? v? trang ph鬰 ph? n? T﹜ V鵦, m鏸 th? m閠 b?, mau a cho  Dng H鋋. ");
  	end;
	end;
end;

--杀死西域悍妇取得衣服
function xiyuhanfu_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,687,1,1);--得到西域悍妇衣服一套
  	if GetItemCount(2,0,686) >= 1 and GetItemCount(2,0,687) >= 1 then
    	TaskTip("Х nh薾 頲 Y猽 C? Ba T? v? trang ph鬰 ph? n? T﹜ V鵦, m鏸 th? m閠 b?, mau a cho  Dng H鋋. ");
    	Msg2Player("Х nh薾 頲 Y猽 C? Ba T? v? trang ph鬰 ph? n? T﹜ V鵦, m鏸 th? m閠 b?, mau a cho  Dng H鋋. ");
  	end;
	end;
end;

--杀死一品堂密使取得一品堂令牌
function yipintangmishi_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,688,1,1);--得到一品堂令牌
  	if GetItemCount(2,0,688) >= 1 then
  		TaskTip("Х nh薾 頲 ch鴑g c? c馻 m藅 s? Nh蕋 ph萴 阯g, mau a cho  Dng H鋋. ");
  		Msg2Player("Х nh薾 頲 ch鴑g c? c馻 m藅 s? Nh蕋 ph萴 阯g, mau a cho  Dng H鋋. ");
  	end;
	end;
end


--杀死西北壮汉取得醒酒药
function xibeizhuanghan_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,689,1,1);--得到醒酒药
  	if GetItemCount(2,0,689) >= 10 then
  		TaskTip("Х nh薾 頲 10 l? thu鑓 gi秈 ru, mau a cho Ti觰 Nh? t苙g T玭 Nh? Li詎. ");
  		Msg2Player("Х nh薾 頲 10 l? thu鑓 gi秈 ru, mau a cho Ti觰 Nh? t苙g T玭 Nh? Li詎. ");
  	end;
	end;

end

--杀死关外高手取得一品堂邀请函
function guanwaigaoshou_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,691,1,1);--得到一品堂邀请函
  	if GetItemCount(2,0,691) >= 1 then
  		TaskTip("L蕐 頲 1 th? m阨 c馻 Nh蕋 ph萴 阯g tr猲 ngi cao th? quan ngo筰, mau ch鉵g quay v? Long M玭 tr蕁 b竜 cho T玭 Nh? Li詎. ");
  		Msg2Player("L蕐 頲 1 th? m阨 c馻 Nh蕋 ph萴 阯g tr猲 ngi cao th? quan ngo筰, mau ch鉵g quay v? Long M玭 tr蕁 b竜 cho T玭 Nh? Li詎. ");
  	end;
	end;

end

--刷出袁飞云劫囚
function yuanfeiyun_talk()

local nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
local nMapName = Map_Data[nMapDataID][1];
local nMapID,nXworldpos,nYworldpos,nXpos,nYpos = Map_Data[nMapDataID][2],Map_Data[nMapDataID][3],Map_Data[nMapDataID][4],Map_Data[nMapDataID][5],Map_Data[nMapDataID][6];
local nNpcIndex = 0;
local	strTalk = {
	"Theo b秐  ch? 阯g c馻 Vi猲 B? u, ch綾 ch緉 thi猲 lao ? v飊g "..nXpos..", "..nYpos.." n祔. "
	}

	nNpcIndex = CreateNpc("","Danh b? Vi猲 Phi V﹏ ",nMapID,nXworldpos,nYworldpos);
	SetNpcLifeTime(nNpcIndex,1200);
	SetNpcScript(nNpcIndex,"Л韓g d蒼 file");
	SetTask(YUANFEIYUN_NPCINDEX,nNpcIndex);--记录袁飞云NpcIndex
	TalkEx("",strTalk);
	RemoveTrigger(GetRunningTrigger());--删去该触发器

end

--杀死暗日使取得硫磺
function anrishi_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,695,1,1);--得到硫磺
  	if GetItemCount(2,0,695) >= 10 then
  		TaskTip("Х thu th藀 10 vi猲 L璾 hu鷑h, mau a cho Tri謚 T? B譶h. ");
  		Msg2Player("Х thu th藀 10 vi猲 L璾 hu鷑h, mau a cho Tri謚 T? B譶h. ");
  	end;
	end;

end

--杀死明月使取得硝石
function mingyueshi_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,696,1,1);--得到硝石
  	if GetItemCount(2,0,696) >= 10 then
  		TaskTip("Х thu th藀 10 vi猲 Ti猽 Th筩h, mau a cho Tri謚 T? B譶h. ");
  		Msg2Player("Х thu th藀 10 vi猲 Ti猽 Th筩h, mau a cho Tri謚 T? B譶h. ");
  	end;
	end;

end

--刷出袁飞云
function CreateYuanFeiYun()

local nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
local nMapName = Map_Data[nMapDataID][1];
local nMapID,nXworldpos,nYworldpos,nXpos,nYpos = Map_Data[nMapDataID][2],Map_Data[nMapDataID][3],Map_Data[nMapDataID][4],Map_Data[nMapDataID][5],Map_Data[nMapDataID][6];
local nNpcIndex = CreateNpc("Vi猲 Phi V﹏ ","Danh b? Vi猲 Phi V﹏ ",nMapID,nXworldpos,nYworldpos);

	SetNpcLifeTime(nNpcIndex,1200);
	SetNpcScript(nNpcIndex,"\\script\\西北区\\凤翔府\\npc\\袁飞云.lua");
	SetTask(YUANFEIYUN_NPCINDEX,nNpcIndex);--记录袁飞云NpcIndex
	RemoveTrigger(GetRunningTrigger());

end

--杀死西北烟汉取得葡萄酒
function xibeiyanhan_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,708,1,1);--得到葡萄酒
  	if GetItemCount(2,0,708) >= 10 then
  		TaskTip("Х thu th藀 10 h? ru nho, mau a cho  Minh gi秈 ru 甶. ");
  		Msg2Player("Х thu th藀 10 h? ru nho, mau a cho  Minh gi秈 ru 甶. ");
  	end;
	end;

end

--杀死明教奸细取得蚩火教令牌
function mingjiaojianxi_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,709,1,1);--得到蚩火教令牌
  	if GetItemCount(2,0,709) >= 1 then
  		TaskTip("Х nh薾 頲 ch鴑g c? c馻 Xi H醓 Gi竜, a cho  T? S? xem c? gi髉 頲 g? kh玭g. ");
  		Msg2Player("Х nh薾 頲 ch鴑g c? c馻 Xi H醓 Gi竜, a cho  T? S? xem c? gi髉 頲 g? kh玭g. ");
  	end;
	end;

end

--杀死30明教叛徒
function mingjiaopantu_killed_30()

	SetTask(TASK_XB_ID_01,6);
	RemoveTrigger(GetRunningTrigger());
	TaskTip("Х gi誸 ch誸 30 t猲 ph秐  Minh Gi竜. ");
	Msg2Player("Х gi誸 ch誸 30 t猲 ph秐  Minh Gi竜. ");

end

--杀死30一品堂暗杀使
function yipintanganshashi_killed_30()

	AddItem(2,0,711,1,1);--得到大宋密探书函
	SetTask(TASK_XB_ID_01,11);
	RemoveTrigger(GetRunningTrigger());
	TaskTip("Х gi誸 ch誸 30 t猲 竚 s竧 s? c馻 Nh蕋 ph萴 阯g, nh薾 頲 c玭g h祄 Чi T鑞g. ");
	Msg2Player("Х gi誸 ch誸 30 t猲 竚 s竧 s? c馻 Nh蕋 ph萴 阯g, nh薾 頲 c玭g h祄 Чi T鑞g. ");

end

--杀死盗墓人取得金丝面罩
function daomuren_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,710,1,1);--得到金丝面罩
  	if GetItemCount(2,0,710) >= 10 then
  		TaskTip("Х thu th藀 10 t蕀 m苩 n? kim lo筰, a cho Xa Lu﹏ B? Vng. ");
  		Msg2Player("Х thu th藀 10 t蕀 m苩 n? kim lo筰, a cho Xa Lu﹏ B? Vng. ");
  	end;
	end;

end

--杀死25空手兵马俑
function kongshoubingmayong_killed_25()

	SetTask(KONGSHOU25_STATE,1);
	
	if GetTask(CHINU25_STATE) == 1 then
		CreateBingMaYongTongLing();
	end
	
	RemoveTrigger(GetRunningTrigger());

end

--杀死25持弩兵马俑
function chinubingmayong_killed_25()

	SetTask(CHINU25_STATE,1);
	
	if GetTask(KONGSHOU25_STATE) == 1 then
		CreateBingMaYongTongLing();
	end
	
	RemoveTrigger(GetRunningTrigger());

end

--杀死西夏武士获得断水杵
function xixiawushi_killed_1()

	if g_probability(10,100) then
  	AddItem(2,0,713,1,1);--得到断水杵
  	if GetItemCount(2,0,713) >= 4 then
  		TaskTip("Х nh薾 頲 4 秐 Thu? Ch?. ");
  		Msg2Player("Х nh薾 頲 4 秐 Thu? Ch?. ");
  	end;
	end;

end 

--杀死西夏勇士获得断罗庚
function xixiayongshi_killed_1()

	if g_probability(5,100) then
  	AddItem(2,0,714,1,1);--得到罗庚
  	if GetItemCount(2,0,714) >= 1 then
  		TaskTip("Х nh薾 頲 1 La Canh. ");
  		Msg2Player("Х nh薾 頲 1 La Canh. ");
  	end;
	end;

end

--杀死30药人的触发器
function yaoren_killed_30()

local strTalk = {
	"(Qu竔 l?, ta  ti猽 di謙 30 t猲 Dc Nh﹏, t筰 sao s? lng dc nh﹏ trong ng n祔 dng nh? ch糿g h? gi秏?)",
	"(C蕄 t鑓 甧m tin n祔 b竜 cho  Dng H鋋 ti襫 b鑙 qu? l? cao ki課. )"
	}

	SetTask(TASK_XB_ID_01,33);
	RemoveTrigger(GetRunningTrigger());
	TaskTip("H錳 b竜  Dng H鋋, v? t譶h h譶h Dc Nh﹏ trong Dc Vng ng. ");
	Msg2Player("H錳 b竜  Dng H鋋, v? t譶h h譶h Dc Nh﹏ trong Dc Vng ng. ");

end

--杀死千年树人触发器
function qiannianshuren_killed_1()

	if g_probability(15,100) then
  	AddItem(2,0,720,1,1);--得到千年乌木
  	if GetItemCount(2,0,720) >= 20 then
  		TaskTip("Х thu th藀 頲 20 m秐h ? M閏 ng祅 n╩. ");
  		Msg2Player("Х thu th藀 頲 20 m秐h ? M閏 ng祅 n╩. ");
  	end;
	end;

end

--杀死沙漠行者触发器
function shamoxingzhe_killed_1()

	if g_probability(10,100) then
  	AddItem(2,0,722,1,1);--得到《千金翼方》残卷
  	if GetItemCount(2,0,722) >= 10 then
  		TaskTip("Х thu th藀 頲 10 m秐h \'Thi猲 Kim D鵦 Phng\'. ");
  		Msg2Player("Х thu th藀 頲 10 m秐h \'Thi猲 Kim D鵦 Phng\'. ");
  	end;
	end;

end

--杀死寻宝人取糖葫芦触发器
function xunbaoren_killed_1()

local strTalk = {
	"Х nh薾 頲 k裲 h? l?, Vi猲 b? u n鉯 l蕐 m? dc tr閚 v祇 k裲 h? l? s? th祅h k裲 h? l? (m?). ",
	"Ch? c莕 n C? Dng ng s? d鬾g k裲 h? l? (m?) n祔, S竧 Th? Oa Oa l祄 sao kh玭g m綾 b蓎 cho 頲, ha ha. "
	}

	if g_probability(15,100) then
  	AddItem(2,0,729,1,1);--得到冰糖葫芦
  	if GetItemCount(2,0,729) >= 10 and GetItemCount(2,0,730) < 1 then
  		TalkEx("",strTalk);
  		DelItem(2,0,729,10);--删去糖葫芦
  		AddItem(2,0,730,1,1);--得到召唤杀手娃娃用的迷魂冰糖葫芦
  		TaskTip("Х nh薾 頲 k裲 h? l? (m?), mau n C? Dng ng di謙 S竧 Th? Oa Oa. ");
  		Msg2Player("Х nh薾 頲 k裲 h? l? (m?), mau n C? Dng ng di謙 S竧 Th? Oa Oa. ");
  	end;
	end;

end


------------------------------------分支2触发器函数--------------------------------------

--锁魂樽时间触发器
function Suohunzun_OnTimer()

	TaskTip("H誸 th阨 gian nhi謒 v? th蕋 b筰, tr? v? nh薾 l筰 nhi謒 v?")
	DelItem(2,0,699,1);--删去锁魂樽
	SetTask(TASK_XB_ID_02,1);--重置任务步骤
	RemoveTrigger(GetRunningTrigger());

end

--欧阳画对话触发器
function ouyanghua_talk()

	--询问欧阳画司马鸣风的背景
	if GetTask(TASK_XB_ID_02) == 0 then
		task_024_01_0();
	elseif GetTask(TASK_XB_ID_02) == 11 then
		task_026_01_0();
	end
	
	RemoveTrigger(GetRunningTrigger());

end

--裂岩螭龙死亡触发器
function lieyanchilong_killed_1()
	
	if g_probability(10,100) then
  	AddItem(2,0,703,1,1);--得到螭龙须
  	if GetItemCount(2,0,703) >= 10 then
  		TaskTip("Х thu th藀 頲 10 m秐h Li Long Tu. ");
  		Msg2Player("Х thu th藀 頲 10 m秐h Li Long Tu. ");
  	end;
	end;
	
end

--赤炼火狐死亡触发器
function chilianhuohu_killed_1()
	
	if g_probability(10,100) then
  	AddItem(2,0,702,1,1);--得到火狐尾
  	if GetItemCount(2,0,702) >= 10 then
  		TaskTip("Х thu th藀 頲 10 m秐h H醓 H? V?. ");
  		Msg2Player("Х thu th藀 頲 10 m秐h H醓 H? V?. ");
  	end;
	end;
	
end