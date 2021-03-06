-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北NPC娃娃杀手召唤和死亡Script
-- By StarryNight
-- 2007/08/07 PM 3:39

-- ======================================================
-- 引用剧情任务文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
local nTime = GetTime() - GetTask(CREAT_SHASHOUWAWA_TIME);
local strTalk = {
	"Th? ra l? ngi, t? xa ta  ng鮥 th蕐 m飅 th琺 c馻 K裲 H? L?, quay l筰 xem th? qu? nhi猲 l? K裲 H? L? c馻 Л阯g H? L? b竛. L﹗ kh玭g g苝  l? V? V? r錳, t鑤 l緈. Ngi n y n c飊g ta gi髉 Phi Thng Чo Nh﹏ thu ph鬰 D? th? sao? T鑤, Trng Sinh B蕋 L穙 n n祔 n緈 ch綾 trong tay r錳.",
	"Xa Lu﹏ B? Vng sai ta n c飊g ngi gi髉 Phi Thng Чo Nh﹏ thu ph鬰 Th? C? Dng, nh璶g ta kh玭g t譵 頲, sau nh? ra ngi t鮪g n鉯 th輈h K裲 H? L? n猲  mua m閠 輙 n y hy v鋘g ngi s? xu蕋 hi謓.",
	"Hay l緈, ngi hi觰 ta kh玭g ai ngo礽 ngi. Ti觰 t? th藅 c? l遪g, th? ngi mua l? k裲 h? l? ngon nh蕋 Чi T鑞g. Ch糿g qua ta nh蕋 th阨 t譵 kh玭g ra n琲 萵 n竨 c馻 Phi Thng Чo Nh﹏ th玦, t猲 Xa Lu﹏ l筰 lo chuy謓 bao ng r錳. Nh璶g ngi n y c騨g t鑤, h穣 a k裲 h? l? cho ta ph秈 ╪ xong r錳 m韎 c? s鴆 l祄.",
	"Ngi v蒼 ch璦 bi誸 n琲 萵 n竨 c馻 Phi Thng Чo Nh﹏ sao? Ta m閠 l遪g mu鑞 thu ph鬰 Th? C? Dng, ch? s? sau khi thu ph鬰 Th? C? Dng ch璦 ch綾 s? h頿 t竎 v韎 Nh蕋 Ph萴 阯g.",
	}

	if ( nMapID == 512 )and GetFightState() == 1 then
		if GetTask(TASK_XB_ID_01) == 55 then
			if nTime >= 1800 then
				local nNpcIndex = CreateNpc("S竧 Th? Oa Oa","S竧 Th? Oa Oa",nMapID,nWx,nWy,-1,1,1,70);
				TalkEx("#OnUse_1("..nNpcIndex..")",strTalk);
				SetNpcLifeTime(nNpcIndex,900); 
				SetNpcScript(nNpcIndex,"\\script\\西北区\\古阳洞一层\\npc\\娃娃杀手.lua");				
				SetTask(CREAT_SHASHOUWAWA_TIME,GetTime());
				return
			else
				strTalk = {
					"Th阨 gian gi穘 c竎h  g鋓 S竧 Th? Oa Oa l? 30 ph髏."
				};
				TalkEx("",strTalk);
			end
		else	
			return
		end
	else
		strTalk = {
			"N誹 S竧 Th? Oa Oa kh玭g tim th蕐 Phi Thng Чo Nh﹏ ? T莕g 1 th? s? ch箉 l猲 T莕g 2, hay l? l猲 T莕g 2 xem th? g鋓 頲 S竧 Th? Oa Oa kh玭g."
		};
		TalkEx("",strTalk);
		end;
	return
end;

function OnUse_1(nNpcIndex)

local strTalk = {
	"Th鵦 ra ch? l? l頸 d鬾g l蒼 nhau th玦. Ch髇g ta  kh玭g s? Th? C? Dng d? Phi Thng Чo Nh﹏ c? tr? m苩 th? ch髇g ta c騨g kh玭g n? m苩. H譶h nh? ngi  t鮪g n C? Dng ng, sao ngi bi誸 N琲 萵 n竨 c馻 h緉? Ti觰 t? th藅 hi觰 ? ta, 甧m nhi襲 k裲 h? l? n y.",
	"N琲 萵 n竨 c馻 Phi Thng Чo Nh﹏ l? m閠 m藅 th蕋, nh蕋 th阨 th? kh? c? th? t譵 頲, i ngi ╪ xong k裲 h? l? ta c飊g nhau 甶 t譵.",
	"Л頲, Xa Lu﹏ ph竔 ngi n c騨g c? ch髏 h鱱 d鬾g. ?, sao l筰 c? tri謚 ch鴑g nh? v藋? N鉯 mau, ngi v? Vi猲 Phi V﹏ c? quan h? g?? 祬 th? ra chuy謓 ngi c鴘 ngi trong tay Vi猲 Phi V﹏ l? gi秴 r鑤 cu閏 ngi l? ai? Sao d竚 nh藀 v祇 Nh蕋 Ph萴 阯g?",
	"Ngi ch? c? nhi襲 l阨, theo quy nh c馻 Nh蕋 Ph萴 阯g th? chuy謓 kh玭g n猲 bi誸 ng h醝. Ngi c馻 Nh蕋 Ph萴 阯g nham hi觤 c 竎 s韒 mu閚 c馻 s? b? di謙 t薾 g鑓, nh﹏ d﹏ Чi T鑞g sao l筰  c竎 ngi t飝 ti猲 鴆 hi誴. Ti誴 chi猽 y.",
	"Th? ra ngi l? ?",
	}
	
	TalkEx("#OnUse_2("..nNpcIndex..")",strTalk);

end

function OnUse_2(nNpcIndex)

	ChangeNpcToFight(nNpcIndex);
	TaskTip("B筺  tri謚 g鋓 S竧 Th? Oa Oa, h穣 ti猽 di謙 n?.");
	Msg2Player("B筺  tri謚 g鋓 S竧 Th? Oa Oa, h穣 ti猽 di謙 n?.");
	DelItem(2,0,730,1);--迷魂冰糖葫芦

end

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local strTalk = {
	"S竧 Th? Oa Oa qu? kh玭g d? i ph?, nay  l蕐 頲 L謓h b礽, l祄 sao  c? th? qua m苩 Xa Lu﹏ Ph竝 Vng."
	}
	SetNpcLifeTime(index,15);--使得尸体消失
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_XB_ID_01) == 55 then
			TalkEx("",strTalk);
			SetTask(CREAT_SHASHOUWAWA_TIME,0);--变量清空
			SetTask(TASK_XB_ID_01,56);
			RemoveTrigger(GetTrigger(KILL_XB_XUNBAOREN));--删去寻宝人触发器
			AddItem(2,0,754,1,1);--得到娃娃令牌
			DelItem(2,0,753,1);--删去迷药
			TaskTip("Х gi誸 ch誸 S竧 Th? Oa Oa, v? ch? c馻 Xa Lu﹏ Ph竝 Vng t譵 c竎h che gi蕌 qu? kh?.");
			Msg2Player("Х gi誸 ch誸 S竧 Th? Oa Oa, v? ch? c馻 Xa Lu﹏ Ph竝 Vng t譵 c竎h che gi蕌 qu? kh?.");
			GivePlayerAward("Award_XB_48","Easy");
		end;	
  else
    for i=1,nMemCount do
       PlayerIndex = GetTeamMember(i);
       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
       if GetTask(TASK_XB_ID_01) == 55 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
       	TalkEx("",strTalk);
       	SetTask(TASK_XB_ID_01, 56);
       	SetTask(CREAT_SHASHOUWAWA_TIME,0);--变量清空
       	RemoveTrigger(GetTrigger(KILL_XB_XUNBAOREN));--删去寻宝人触发器
       	AddItem(2,0,754,1,1);--得到娃娃令牌
       	DelItem(2,0,753,1);--删去迷药
				TaskTip("Х gi誸 ch誸 S竧 Th? Oa Oa, v? ch? c馻 Xa Lu﹏ Ph竝 Vng t譵 c竎h che gi蕌 qu? kh?.");
				Msg2Player("Х gi誸 ch誸 S竧 Th? Oa Oa, v? ch? c馻 Xa Lu﹏ Ph竝 Vng t譵 c竎h che gi蕌 qu? kh?.");
				GivePlayerAward("Award_XB_48","Easy");
       end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end