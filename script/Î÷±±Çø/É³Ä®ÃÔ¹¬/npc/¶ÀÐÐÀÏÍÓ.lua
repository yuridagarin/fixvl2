-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 沙漠迷宫NPC独行老陀Script
-- By StarryNight
-- 2007/08/07 AM 11:58

-- 不要欺负人驼背啊！

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIndex = 0;
local t = 0;
local strTalk = {
	"<sex> ch髇g ta l筰 g苝 nhau r錳. Ta truy b総 t猲 чc H祅h L穙 У m蕐 ng祔 nay, kh玭g ng? r籲g h緉 tr鑞 n sa m筩 v蒼 b? b総 b雐 <sex>, th藅 產 t?.",
	"ng kh竎h s竜, v? ta c? chuy謓 mu鑞 th豱h gi竜 Vi猲 B? kho竔 m? nha m玭 cho bi誸 玭g n sa m筩 b総 t猲 чc H祅h L穙 У, v鮝 may ta g苝 頲 n猲 ra tay trc, kh玭g bi誸 c? l祄 l? k? ho筩h c馻 玭g kh玭g?",
	"T猲 n祔 r蕋 gian manh, nh蕋 th阨 ta v蒼 ch璦 t譵 頲 k? hay, t鉳 l筰 b総 頲 ngi v? quy 竛 l? 頲. <sex> t譵 ta c? chuy謓 g??",
	}

	--SetNpcLifeTime(index,15);--使得尸体消失
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_XB_ID_01) == 53 then
			TalkEx("talk_01",strTalk);
			nNpcIndex = CreateNpc("Vi猲 Phi V﹏ ","Vi猲 Phi V﹏ ",nMapId,nX,nY,-1,1,1,30);
			SetNpcLifeTime(nNpcIndex,180);
			SetNpcScript(nNpcIndex,"\\script\\西北区\\沙漠迷宫\\npc\\袁飞云.lua");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 53 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				SetPlayerScript("\\script\\西北区\\沙漠迷宫\\npc\\独行老陀.lua");
				TalkEx("talk_01",strTalk);
				if t==0 then
					nNpcIndex = CreateNpc("Vi猲 Phi V﹏ ","Vi猲 Phi V﹏ ",nMapId,nX,nY,-1,1,1,30);
					SetNpcLifeTime(nNpcIndex,180);
					SetNpcScript(nNpcIndex,"\\script\\西北区\\沙漠迷宫\\npc\\袁飞云.lua");
					t=1;
				end
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end

--续对话
function talk_01()

local strTalk = {
	"Trc y ch髇g ta  di詎 m閠 m祅 k辌h hay, gi? ta 產ng mu鑞 ti猽 di謙 S竧 Th? Oa Oa. D? g? t猲  c騨g l? Th藀 Чi Kim Cang r蕋 kh? nh b筰, n猲 ta n h醝 玭g xem c? c竎h g? kh玭g.",
	"Chuy謓 <sex> o lo筺 Nh蕋 Ph萴 阯g c騨g c? ch髏 th祅h t輈h, gi? ph秈 tr鵦 ti誴 i u v韎 Th藀 Чi Kim Cang r錳. S竧 Th? Oa Oa nham hi觤 c 竎, nh璶g nhc 甶觤 c馻 h緉 ch輓h l? K裲 H? L?.",
	"K裲 H? L?? Ta nh? h緉 t鮪g n鉯 k裲 h? l? c馻 h緉 b? 玭g cp m蕋, sau n祔 s? m韎 ta ╪ k裲 h? l?.",
	}

	TalkEx("talk_02",strTalk);

end

--续对话
function talk_02()

local strTalk = {
	"Khi nh薾 th蕐 S竧 Th? Oa Oa th輈h nh蕋 k裲 h? l? n猲 ta  b? lo筰 Thu鑓 m? kh玭g m祏 kh玭g m飅 v祇 K裲 H? L? v? gi? l祄 ngi b竛 k裲  b竛 cho h緉, nh﹏ l骳 h緉 h玭 m? b総 v? quy 竛. Ngi c? th? ti課 h祅h theo c竎h n祔, v? ngi  t鮪g c鴘 h緉 n猲 d? h祅h ng h琻.",
	"Th? ra l? v藋, Vi猲 B? kho竔 qu? l? cao minh.",
	"Vi謈 g? c騨g ng v? l鵦 th? qu? l? h? s竎h. Ch? ta c遪 輙 Thu鑓 m? ngi h穣 l蕐 d飊g, S竧 Th? Oa Oa th輈h nh蕋 K裲 H? L? c馻 Л阯g H? L? ? Ph鬾g Tng ph? ngi c? th? 甶 mua. Ta ph秈 竝 gi秈 чc H祅h L穙 У v? nha m玭, sau khi xong chuy謓 ch髇g ta s? n﹏g ly ch骳 m鮪g v? ngi ph秈 k? cho ta di詎 bi課 s? vi謈. B秓 tr鋘g v? h裯 g苝 l筰.",
	"Ta nh蕋 nh s? gi? m筺g s鑞g  t竔 nh? c飊g Vi猲 B? kho竔, h裯 g苝 l筰.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,54);
	AddItem(2,0,753,1,1);--得到迷药
	TaskTip("дn Ph鬾g Tng ph? t譵 mua K裲 H? L? c馻 Л阯g H? L?  d? S竧 Th? Oa Oa.");
	Msg2Player("дn Ph鬾g Tng ph? t譵 mua K裲 H? L? c馻 Л阯g H? L?  d? S竧 Th? Oa Oa.");
	GivePlayerAward("Award_XB_47","Easy");

end

