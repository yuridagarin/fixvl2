-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务触发器处理
-- By StarryNight
-- 2005/12/30 PM 10:48

--乙酉年 戊子月 戊子日 
--宜: 合帐 裁衣 教牛马 馀事勿取 
--忌: 入宅 动土 破土 嫁娶 作灶 造船 
--吉神宜趋: 官日 敬安 金匮  
--凶神宜忌: 月建 小时 土府 月厌 地火  
--五行: 霹雳火  建执位  
--彭祖百忌: 戊不受田田主不祥 子不问卜自惹祸殃 

-- ======================================================
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--杀死毒峰收集药材
function PoisonBee_Killed_1()

	  if g_probability(50, 100) then
        AddItem(2,0,362,1,1);--得到药材
    		if GetItemCount(2,0,362) >= 15 then
      		TaskTip("Х thu th藀  15 dc li謚 quay v? t譵 Tr辬h Qu竛 Chi.");
      		Msg2Player("Х thu th藀  15 dc li謚 quay v? t譵 Tr辬h Qu竛 Chi.");
    		end;
		end;
end;

--杀死20个毒蜈蚣
function PoisonSco_Killed_20()
	
	RemoveTrigger(GetRunningTrigger());
	SetTask(TASK_DL_LV20_ID,2);
	TaskTip("Ho祅 th祅h nhi謒 v? quay v? g苝 Cao Th╪g Tuy襫.");
	Msg2Player("Ho祅 th祅h nhi謒 v? quay v? g苝 Cao Th╪g Tuy襫.");
	
end;

--杀死剧毒食人草收集毒种
function AnPlant_Killed_1()    
    
    if g_probability(50, 100) then
      AddItem(2,0,364,1,1);--得到药材
      if GetItemCount(2,0,364) >= 20 then
    		RemoveTrigger(GetRunningTrigger());
      	TaskTip("Х thu th藀  20 h箃, quay v? g苝 B筩h Doanh Doanh.");
      	Msg2Player("Х thu th藀  20 h箃, quay v? g苝 B筩h Doanh Doanh.");
    	end; 
		end;
end;

--杀死10个蚩火白教徒
function ChiHuoWhite_Killed_10()

local nSate = GetTask(TASK_DL_LV35_01_ID);

	--之前已杀死10个蚩火黑教徒
	if nSate == 10 then
		local strTalk = {
			"C? chuy謓 g? v藋?",
			"Kh玭g li猲 quan g? n ngi!",
			"Cho d? l? chuy謓 c馻 c竎 ngi 甶 ch╪g n鱝 th? c騨g kh玭g 頲 n竜 lo筺 i T鑞g c馻 ta!",
			"Ta c秐h b竜 ngi ng xen v祇 vi謈 c馻 Xi H醓 gi竜 ta!",
			"Chuy謓 n祔 c? li猲 quan n vi謈 l猲 ng玦 c馻 Ho祅g t? ch╪g!?",
			"Kh玭g li猲 quan g? n ngi",
			"厖厖",
			"{(Ngh? th莔) Hay l? quay v? g苝 {Cao Th╪g Tuy襫}}",
			}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV35_ID,2);
    TaskTip("Quay v? g苝 Cao Th╪g Tuy襫");
    Msg2Player("Quay v? g苝 Cao Th╪g Tuy襫");
    	
	--未杀死10个蚩火黑教徒
	else
		SetTask(TASK_DL_LV35_01_ID,10);
	end;
	RemoveTrigger(GetRunningTrigger());
end

--杀死10个蚩火黑教徒
function ChiHuoBlack_Killed_10()

local nSate = GetTask(TASK_DL_LV35_01_ID);
	--之前已杀死10个蚩火白教徒
	if nSate == 10 then
	local strTalk = {
		"C? chuy謓 g? v藋?",
		"Kh玭g li猲 quan g? n ngi!",
		"Cho d? l? chuy謓 c馻 c竎 ngi 甶 ch╪g n鱝 th? c騨g kh玭g 頲 n竜 lo筺 i T鑞g c馻 ta!",
		"Ta c秐h b竜 ngi ng xen v祇 vi謈 c馻 Xi H醓 gi竜 ta!",
		"Chuy謓 n祔 c? li猲 quan n vi謈 l猲 ng玦 c馻 Ho祅g t? ch╪g!?",
		"Kh玭g li猲 quan g? n ngi",
		"厖厖",
		"{(Ngh? th莔) Hay l? quay v? g苝 {Cao Th╪g Tuy襫}}",
		}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV35_ID,2);
    TaskTip("Quay v? g苝 Cao Th╪g Tuy襫");
    Msg2Player("Quay v? g苝 Cao Th╪g Tuy襫");
    	
	--未杀死10个蚩火白教徒
	else
		SetTask(TASK_DL_LV35_01_ID,10);
	end;
	RemoveTrigger(GetRunningTrigger());
end

--杀死15个蚩火赤教徒
function ChiHuoRed_Killed_15()
local strTalk = {
	"C? chuy謓 g? v藋?",
	"Kh玭g li猲 quan g? n ngi!",
	"Cho d? l? chuy謓 c馻 c竎 ngi 甶 ch╪g n鱝 th? c騨g kh玭g 頲 n竜 lo筺 i T鑞g c馻 ta!",
	"Ta c秐h b竜 ngi ng xen v祇 vi謈 c馻 Xi H醓 gi竜 ta!",
	"Chuy謓 n祔 c? li猲 quan n vi謈 l猲 ng玦 c馻 Ho祅g t? ch╪g!?",
	"Kh玭g li猲 quan g? n ngi",
	"厖厖",
	"(Ngh? th莔) (Hay l? quay v? g苝 {Cao Th╪g Tuy襫})",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV35_ID,2);
	SetTask(TASK_DL_LV35_ID_ZX,2);
  TaskTip("Quay v? g苝 Cao Th╪g Tuy襫");
  Msg2Player("Quay v? g苝 Cao Th╪g Tuy襫");
  RemoveTrigger(GetRunningTrigger());
end

--与赵延年对话1
function Zhaoyannian_Talk()

local nTask_DL_State_40 = GetTask(TASK_DL_LV40_ID);

	if nTask_DL_State_40 == 1 then
		local strTalk = {
			"B竎h Hi觰 Sinh sai ngi n ??",
			"T筰 h? mu鑞 bi誸 v? vi謈 l猲 ng玦 c馻 Ho祅g T?.",
			"Th? ra l? chuy謓 n祔.",
			"Ti課g n kh玭g sai",
			"Л琻g tri襲 Ho祅g  {Чi L齷 l? {祅 T? Th玭g}",
			"Ho祅g  khai qu鑓 l藀 n猲 {Чi L齷 ch糿g ph秈 l? {祅 T? B譶h} sao? {祅 T? Th玭g} l? ho祅g  ??",
			"Th祅h ph莕 qu? t閏 ? {Чi L齷 n祔 u l? {B筩h T閏}, d遪g h? 祅 c騨g thu閏 B筩h T閏, v? v藋 m? c竎h t t猲 c騨g gi鑞g ngi H竛 ch髇g ta. M韎 nghe qua {祅 T? B譶h} v? {祅 T? Th玭g} gi鑞g nh? l? huynh  nh璶g ho祅 to祅 kh玭g ph秈, gi鱝 h? c竎h nhau n 3 i!",
			"Th? ra l? v藋!"
			}
			TalkEx("Zhaoyannian_Talk_01",strTalk);
			RemoveTrigger(GetRunningTrigger());
		  return
	end;
	
	if nTask_DL_State_40 == 5 then
		local strTalk = {
			"Tri謚 ti襫 b鑙, t筰 h? 頲 bi誸 {Xi H醓 gi竜} t竎 lo筺 l? v? mu鑞 tru蕋 ng玦 琻g kim Ho祅g thng, ngo礽 ra c遪 g? n鱝 kh玭g?",
			"Ta c騨g kh玭g r?, ngi n {Чi L齷 h醝 nh鱪g ngi H竛 ?  may ra c? ch髏 manh m鑙.",
			" t? ti襫 b鑙 ch? gi竜!",
			"(Ngi H竛 ? {Чi L齷匵em ra ph秈 t譵 {Tr辬h Qu竛 Chi} r錳!)",
			}
		  TalkEx("",strTalk);
			SetTask(TASK_DL_LV40_ID,6);
		  TaskTip("дn Чi L? t譵 Tr辬h Qu竛 Chi");
		  Msg2Player("дn Чi L? t譵 Tr辬h Qu竛 Chi");
		  GivePlayerAward("Level_40","xn_step_4","chest","Level_44");
		  GivePlayerExp(SkeyDali,"chihuojiaoyinmou")
		  RemoveTrigger(GetRunningTrigger());
		  return
	end
end;

--与赵延年对话2
function Zhaoyannian_Talk_01()

local strTalk	= {
	"Ho祅g  {祅 T? Th玭g} trc khi b╪g h? c?  l筰 th竛h ch? truy襫 ng玦 cho m閠 trong {ba v? ho祅g t鰙, nh璶g c? ba v? u mu鑞 tranh ng玦 b竨. Sau  th? Ho祅g t? c? m蕋 t輈h, nh? ho祅g t? ph秐 lo筺, cu鑙 c飊g Tam Ho祅g t? 祅 T? Kh竛h l猲 ng玦.",
	"{Xi H醓 gi竜} t竎 lo筺 c騨g v? chuy謓 n祔? Sao t筰 h? kh玭g nghe {Cao Th╪g Tuy襫} n鉯 g??",
	"Sau khi {Tam Ho祅g t鰙 l猲 ng玦 m韎 c? chuy謓 {Xi H醓 gi竜} ph秐 lo筺, nh璶g c? li猲 quan n chuy謓 n祔 hay kh玭g ta c騨g kh玭g r?. Зy ch? l? chuy謓 n閕 b? n猲 Cao ti襫 b鑙 c騨g kh玭g ti謓 n鉯 ra.",
	}
	TalkEx("Zhaoyannian_Talk_02",strTalk);
end

--与赵延年对话3
function Zhaoyannian_Talk_02()	

local strTalk	=	{
	"T筰 h? mu鑞 甶襲 tra m閠 ch髏 manh m鑙 v? {Xi H醓 gi竜}, ti襫 b鑙 n鉯 xem t筰 h? ph秈 l祄 th? n祇?",
	"T閏 trng Mi猽 L躰h trc y c? qua l筰 v韎 Xi H醓 gi竜 ngi th? n  h醝 xem.",
	" t? ti襫 b鑙 ch? gi竜!"
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ID,2);
	TaskTip("дn g苝 T閏 trng Mi猽 L躰h");
	Msg2Player("дn g苝 T閏 trng Mi猽 L躰h");
	GivePlayerAward("Level_40","xn_step_2");
	GivePlayerExp(SkeyDali,"dalihuangzu")
	return
end

--杀死苗岭护印
function MLHY_Killed_1()

  if g_probability(30, 100) then
  	AddItem(2,0,366,1,1);--得到麂皮
  	if GetItemCount(2,0,366) >= 10 then
  		TaskTip("Х t譵  10 t蕀 Da hu, quay v? g苝 Tr辬h Qu竛 Chi");
  		Msg2Player("Х t譵  10 t蕀 Da hu, quay v? g苝 Tr辬h Qu竛 Chi");
  	end;
	end;
end;

--杀死苗岭土司
function MLTS_Killed_1()

    if g_probability(30, 100) then
      AddItem(2,0,368,1,1);--得到土司佩刀
      if GetItemCount(2,0,368) >= 10 then
      	TaskTip("Х l蕐 頲 10 B閕 o quay v? g苝 Tr莕 L藀 Ho祅h");
      	Msg2Player("Х l蕐 頲 10 B閕 o quay v? g苝 Tr莕 L藀 Ho祅h");
    	end;
		end;
end;

--杀死子夜虎
function MidnightTiger_Killed_1()
   
    if g_probability(40, 100) then
      AddItem(2,0,371,1,1);--得到子夜虎牙
      if GetItemCount(2,0,371) >= 10 then
      	TaskTip("Х t譵 頲 10 nanh D? H?!");
      	Msg2Player("Х t譵 頲 10 nanh D? H?!");
    	end;
		end;
end;

--杀死白头雕
function BaldEagle_Killed_1()
    
    if g_probability(40, 100) then
      AddItem(2,0,372,1);--得到白头雕羽
      if GetItemCount(2,1,372) >= 10 then
      	TaskTip("Х t譵 頲 10 l玭g B筩h u 猽");
      	Msg2Player("Х t譵 頲 10 l玭g B筩h u 猽");
    	end;
		end;
end;

--与莫三对话
function MoSan_Talk()

	--未领取凤凰翎
	if GetTask(TASK_DL_LV55_ID) == 2 then

		local strTalk = {};
		
		--莫三徒弟对话
		if GetLifeSkillLevel(1,4) ~= 0 then
		
			strTalk = {
				"M筩 s? b?, t筰 h? c? vi謈 mu鑞 nh? ngi.",
				"Cao Th╪g Tuy襫 ph竔 ngi n ?? Ta bi誸 r錳, t譵  v藅 li謚 ta s? gi髉 cho.",
				"M筩 s? b? bi誸 h誸 r錳 ??",
				"Ta v? Cao huynh 琻 ngh躠 s﹗ n苙g, l莕 n祔 huynh 蕐 c? vi謈 l? n祇 ta l筰 t? ch鑙?",
				"Th? ra l? v藋!",
				"Kh玭g c莕 kh竎h s竜.",
				"uh!!",
				"?",
				"Xong r錳! Nh璶g Ph鬾g Ho祅g Linh n祔 r蕋 mau m蕋 t竎 d鬾g! H穣 mau n Ph鬾g Nh穘 ng g鋓 ra v? nh b筰 Ph鬾g Ho祅g!",
				"T筰 h? bi誸 r錳, 產 t? Tam s? b?.",
				}
		else
			strTalk = {
				"{M筩 s? b竲, t筰 h? 頲 Cao Qu鑓 C玭g sai n t譵 ngi.",
				"дn nh? ta ch? t筼 Ph鬾g Ho祅g Linh ?? ьi m閠 l竧 nh?!",
				"Xin 產 t?!",
				"?",
				"Xong r錳! Nh璶g Ph鬾g Ho祅g Linh n祔 r蕋 mau m蕋 t竎 d鬾g! H穣 mau n Ph鬾g Nh穘 ng g鋓 ra v? nh b筰 Ph鬾g Ho祅g!",
				"T筰 h? bi誸 r錳, 產 t? Tam s? b?.",
				}		
  	end;
  	
		TalkEx("",strTalk);
		DelItem(2,0,371,10);--删去10个虎牙
		DelItem(2,0,372,10);--删去10个雕羽
		AddItem(2,0,373,1,1)--得到召唤迦楼罗物品凤凰翎
		SetTask(TASK_DL_LV55_ID,3);
		CreateTrigger(1,450,TIME_DL_PHENIX);
		ContinueTimer(GetTrigger(TIME_DL_PHENIX));
		local	nTime = GetTime();
		SetTask(TASK_DL_LV55_TIME,nTime);--记录得到凤凰翎时间
		Msg2Player("D飊g Ph鬾g Ho祅g Linh g鋓 v? nh b筰 Ph鬾g Ho祅g (trong 30 ph髏)!");
		TaskTip("D飊g Ph鬾g Ho祅g Linh g鋓 v? nh b筰 Ph鬾g Ho祅g (trong 30 ph髏)!");
		GivePlayerExp(SkeyDali,"tiejiangmoshan")
		return
	end
	
	--补领道具凤凰翎和对话触发器
	if GetTask(TASK_DL_LV55_ID) == 3 then
		local nTime = GetTime();
		local nTaskTime = GetTask(TASK_DL_LV55_TIME);
		if GetItemCount(2,0,373) <= 0 and nTime - nTaskTime >= 1800 then
			CreateTrigger(4,201,TALK_DL_MOSAN);
			CreateTrigger(1,450,TIME_DL_PHENIX);
			ContinueTimer(GetTrigger(TIME_DL_PHENIX));
			nTime = GetTime();
			SetTask(TASK_DL_LV55_TIME,nTime);--记录得到凤凰翎时间
			AddItem(2,0,373,1,1)--得到召唤迦楼罗物品凤凰翎
			Msg2Player("D飊g Ph鬾g Ho祅g Linh g鋓 v? nh b筰 Ph鬾g Ho祅g (trong 30 ph髏)!");
			TaskTip("D飊g Ph鬾g Ho祅g Linh g鋓 v? nh b筰 Ph鬾g Ho祅g (trong 30 ph髏)!");
		end;
		local strTalk = {
			"C莔 Phng Ho祅g Linh n Phng Nh穘 ng s? d鬾g, n誹 th蕋 b筰 ho芻 m蕋 Phng Ho祅g Linh, th? n ch? ta l蕐 1 c竔 m韎, nh璶g m? ch? t筼 Phng Ho祅g Linh c遪 c莕 m閠 輙 th阨 gian, c莕 30 ph髏  l祄 th猰 m閠 c竔 kh竎, <sex> ph秈 gi? g譶 c萵 th薾. ",
			}
		
		TalkEx("",strTalk);
		return
	end
	
	--确保删掉对话触发器
	if GetTask(TASK_DL_LV55_ID) >= 4 then
		RemoveTrigger(GetRunningTrigger());
	end
end

--凤凰翎时间超时
function Phenix_TimeOut()

local strTalk = {
	"Х qu? 30 ph髏, Ph鬾g Ho祅g Linh   h誸 hi謚 l鵦 quay l筰 Tng Dng t譵 M筩 Tam."
}

	TalkEx("",strTalk);
	if GetTrigger(TALK_DL_MOSAN) == 0 then
		CreateTrigger(4,201,TALK_DL_MOSAN);
	end;
	DelItem(2,0,373,1);--删去凤凰翎
	RemoveTrigger(GetRunningTrigger());
	Msg2Player("Quay l筰 t譵 M筩 tam nh薾 Ph鬾g Ho祅g Linh m韎.");
	TaskTip("Quay l筰 t譵 M筩 tam nh薾 Ph鬾g Ho祅g Linh m韎.");

end

--58级任务佘太君对话触发器
function SheTaiJun_Talk()

local strTalk = {};
	
	--领取小孩
	if GetTask(TASK_DL_LV55_ID) == 6 then
		if GetPlayerFaction() == 6 then
			strTalk = {
				"L穙 Th竔 Qu﹏, t筰 h? tu﹏ l謓h {фng Qu鑓 S瓆 n n c玭g t? {фng Ca Minh} v? {Чi L齷.",
				"Х nh薾 nhi謒 v? th? l祄 cho t鑤, ng  m蕋 m苩 ngi c馻 Dng M玭.",
				"uh!!",
				"фng Ca Minh n y ch璦 l﹗, v? c玭g h鋍 頲 c騨g ch璦 nhi襲, ngi a thi誹 gia v? th╩ ph? m蓇 v礽 h玬 r錳 quay l筰 ti誴 t鬰 luy謓 v? nh?!",
				"uh!!",
				"фng Ca Minh, chu萵 b? xong ch璦? Tng s? n祔 s? a con v? th╩ ph? th﹏, huynh 蕐 c騨g l?  t? Dng gia ch髇g ta.",
				"Ta mu鑞 mua m閠 v礽 m鉵 c s秐 ? Чi T鑞g v? cho ph? m蓇 nh璶g kh玭g bi誸 ch鋘 m鉵 n祇, n猲  c to祅 b? m鉵 ╪ ngon ? nh鱪g L鰑 l莡 trong c竎 th祅h th?!",
				"C? hi誹 nh? v藋 th藅 l? t鑤. Phi襫 b籲g h鱱 gi髉 thi誹 gia nh?!"
				}
		else 
			strTalk = {
				"L穙 Th竔 Qu﹏ t筰 h? tu﹏ l謓h {фng Qu鑓 S瓆 n n c玭g t? {фng Ca Minh} v? {Чi L齷.",
				"<sex> v蕋 v? qu?! L莕 n祔 c玭g t? v? th╩ ph? m蓇 r錳 s韒 quay l筰 y ti誴 t鬰 luy謓 v? nh?!",
				"T筰 h? s? b竜 l筰 v韎 {фng Qu鑓 S瓆.",
				"фng Ca Minh ch萵 b? xong h誸 ch璦? Theo <sex> v? Чi L? nh?!",
				"Ta mu鑞 mua m閠 v礽 m鉵 c s秐 ? Чi T鑞g v? cho ph? m蓇 nh璶g kh玭g bi誸 ch鋘 m鉵 n祇, n猲  c to祅 b? m鉵 ╪ ngon ? nh鱪g L鰑 l莡 trong c竎 th祅h th?!",
				"C? hi誹 nh? v藋 th藅 l? t鑤. Phi襫 b籲g h鱱 gi髉 thi誹 gia nh?!",
				}
		end
	TalkEx("SheTaiJun_Talk_01",strTalk);
end
	
	--未将小孩送回去
	if GetTask(TASK_DL_LV55_ID) == 7 then
		local strTalk = {
			"Л阯g 甶 r蕋 nguy hi觤, nh? b秓 tr鋘g nh?!",
			}
			
		TalkEx("",strTalk);
		--RemoveTrigger(GetRunningTrigger())
		return
	end;
end


function SheTaiJun_Talk_01()

local strTalk = {
				"C?: B祇 Ng? (Bi謓 Kinh), V辴 quay (Dng Ch﹗), Long Ch﹗ (Tuy襫 Ch﹗), b竛h t? (Tng Dng), b竛h 輙 (Th祅h Й)",
				"C騨g 頲! Mau mua nhanh r錳 v? th╩ ph? th﹏ nh?!",
				}
	TalkEx("",strTalk);
	SummonNpc("фng Ca Minh","фng Ca Minh");
	SetTask(TASK_DL_LV55_ID,7);
	--UseScrollEnable(0);--屏蔽回程符使用
	--SetDeathScript("\\script\\task\\world\\大理\\Lv58\\playerdeath.lua");--设置带小孩过程中的玩家死亡脚本
	Msg2Player("Лa фng Ca Minh n c竎 th祅h th?  mua v藅 ph萴");
	TaskTip("Лa фng Ca Minh n c竎 th祅h th?  mua v藅 ph萴");
	GivePlayerAward("Level_58", "xn_step_1");
	GivePlayerExp(SkeyDali,"yangmenxuexi")
	
end

--杀死20个毒蝠
function PoisonBat_Killed_20()
	
	RemoveTrigger(GetRunningTrigger());
	SetTask(TASK_DL_LV60_ID,2);
	TaskTip("Х gi誸 頲 20 d琲 c, quay v? g苝 фng Gi? La");
	Msg2Player("Х gi誸 頲 20 d琲 c, quay v? g苝 фng Gi? La");
	
end

--夜啼血鸦死亡触发器
function BloodCrow_Killed_1()
  
    if g_probability(40, 100) then
      AddItem(2,0,197,1,1);--得到血鸦羽
    	if GetItemCount(2,0,197) >= 10 then
      	TaskTip("Х l蕐  10 Huy誸 Nha V?");
      	Msg2Player("Х l蕐  10 Huy誸 Nha V?");
    	end;
		end;
end

--杀死15个傀儡毒人
function CreatureMan_Killed_15()
	
	RemoveTrigger(GetRunningTrigger());
	if GetTask(TASK_DL_LV35_ID_ZX) == 100 and GetTask(TASK_DL_LV62_ID) == 3 then
		SetTask(TASK_DL_LV62_ID,4);
		TaskTip("Gi誸 頲 15 Kh玦 L鏸 чc Nh﹏ v? Xi H醓 Trng l穙, quay v? g苝 Tr辬h Qu竛 Chi.");
		Msg2Player("Gi誸 頲 15 Kh玦 L鏸 чc Nh﹏ v? Xi H醓 Trng l穙, quay v? g苝 Tr辬h Qu竛 Chi.");
	else
		SetTask(TASK_DL_LV35_ID_ZX,100);--借用1304号变量标记
		TaskTip("Gi誸 頲 15 Kh玦 L鏸 чc Nh﹏");
		Msg2Player("Gi誸 頲 15 Kh玦 L鏸 чc Nh﹏");
	end;
end

--杀死15个蚩火长老
function ChiHuoElder_Killed_15()
	
	RemoveTrigger(GetRunningTrigger());
	if GetTask(TASK_DL_LV35_ID_ZX) == 100 and GetTask(TASK_DL_LV62_ID) == 3 then
		SetTask(TASK_DL_LV62_ID,4);
		TaskTip("Gi誸 頲 15 Kh玦 L鏸 чc Nh﹏ v? Xi H醓 Trng l穙, quay v? g苝 Tr辬h Qu竛 Chi.");
		Msg2Player("Gi誸 頲 15 Kh玦 L鏸 чc Nh﹏ v? Xi H醓 Trng l穙, quay v? g苝 Tr辬h Qu竛 Chi.");
	else
		SetTask(TASK_DL_LV35_ID_ZX,100);--借用1304号变量标记
		TaskTip("Gi誸 頲 15 Xi H醓 Trng L穙");
		Msg2Player("Gi誸 頲 15 Xi H醓 Trng L穙");
	end;
end

--百晓生对话触发器
function BaiXiaoSheng_Talk()

local strTalk = {};
	--完成五毒教的怒火任务后
	if GetTask(TASK_DL_LV75_ID) == 3 then
		strTalk = {
			"Ti襫 b鑙, c? vi謈 nh? ti襫 b鑙 ch? gi竜.",
			"Ch? ph秈 l莕 trc ta  n鉯 r錳, sao l筰 n n鱝?",
			"L莕 n祔 l? chuy謓 kh竎?",
			"Nh鱪g 甶襲 ngi quan t﹎ u c? h誸 trong t蕀 Чi L? C鵸 Ch?. Hi謓 gi? L璾 觧 產ng gi?, mau n Чi L? t譵 玭g 蕐 甶.",
			" t? ti襫 b鑙!",
			}
		
		TalkEx("",strTalk);
		CreateTrigger(4,203,TALK_DL_BAIXIAOSHENG);
		Msg2Player("дn Чi L? t譵 L璾 觧");
		TaskTip("дn Чi L? t譵 L璾 觧");
		SetTask(TASK_DL_LV75_ID,4);
		GivePlayerExp(SkeyDali,"qiyi")
		--RemoveTrigger(GetTrigger(TALK_DL_BAIXIAOSHENG));
		return
	end
	--未与刘典对话
	if GetTask(TASK_DL_LV75_ID) == 4 then
		strTalk = {
		"Ngi c? th? n Чi L? t譵 L璾 觧  h醝 v? t蕀 Чi L? C鵸 Ch?."
		}
		TalkEx("",strTalk);
		return
	end
end

--黑猩猩死亡触发脚本
function Jocko_Killed_1()

    if g_probability(40, 100) then
      AddItem(2,0,379,1,1);--得到大理旧志残片
      if GetItemCount(2,0,379) >= 10 then
      	TaskTip("Х thu th藀 頲 10 t蕀 Чi L? C鵸 Ch?");
      	Msg2Player("Х thu th藀 頲 10 t蕀 Чi L? C鵸 Ch?");
    	end;
		end;
end

--蚩火刀客死亡触发脚本
function DaoKe_Killer_10()

local strTalk = {
	"C遪 nh tr鋘g thng ngi c馻 b鋘 ta, chuy謓 n祔 l? th? n祇?",
	"Nh? v? ch? hi觰 l莔, ta kh玭g c遪 c竎h n祇 kh竎 m韎 ph秈 l祄 nh? v藋.",
	"Ta n t譵 t猲 ti觰 t? m? ngi v鮝 nh綾 n, h緉 h裯 h? v韎 t譶h nh﹏ b? tr鑞 nh璶g b? c竎 ngi b総 gi?.",
	"H鮩卙裯 h? gi鱝 m h玬 v莥 ??",
	"(Ngh? th莔) (Ta c騨g ch璦 g苝 A M閚g l莕 n祇, chi b籲g quay v? g苝 A Ch﹗ v藋)"
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ZX_ID,5);
	TaskTip("Quay l筰 Mi猽 L躰h b竜 l筰 t譶h h譶h cho A Ch﹗");
	Msg2Player("Quay l筰 Mi猽 L躰h b竜 l筰 t譶h h譶h cho A Ch﹗");
end


	