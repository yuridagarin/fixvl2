-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 光明顶NPC虬须大汉Script
-- By StarryNight
-- 2007/06/20 PM 2:29

-- 一步一个天涯

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local strTalk = {
	"(Ta kh玭g ph秈 th祅h t﹎ gia nh藀 Nh蕋 Ph萴 阯g, sao ph秈 l祄 chuy謓 h筰 ngi? Nh蕋 Ph萴 阯g ng l? t閕 竎 c馻 v? l﹎, coi m筺g ngi nh? c? r竎. N誹 kh玭g di謙 t薾 g鑓 s? g﹜ h鋋 kh玭 lng.)",
	"(Ngi n祔 ph筸 ph竝 tr鑞 ch箉  nh, l筰 c遪 c藋 th? Nh蕋 Ph萴 阯g t祅 h筰 v? l﹎ Чi T鑞g, l? ngi T鑞g m? ph秐 b閕 nc nh?, kh玭g c? l遪g y猽 nc, th藅 l? ng khinh? Ta n猲 tr? v? t譵 Xa Lu﹏ B? Vng trc.",
	}

	--SetNpcLifeTime(index,15);--使得尸体消失
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_XB_ID) == 32 then
			AddItem(2,0,697,1,1);--打倒虬须大汉得到虬须大汉首级一个
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID,33);
			TaskTip("L蕐 頲 th? c蕄 c馻 Di Tu Чi H竛, l? l骳 v? ph鬰 m謓h v韎 Xa Lu﹏ Ph竝 Vng.");
			Msg2Player("L蕐 頲 th? c蕄 c馻 Di Tu Чi H竛, l? l骳 v? ph鬰 m謓h v韎 Xa Lu﹏ Ph竝 Vng.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID) == 32 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,697,1,1);--打倒虬须大汉得到虬须大汉首级一个
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID,33);
				TaskTip("L蕐 頲 th? c蕄 c馻 Di Tu Чi H竛, l? l骳 v? ph鬰 m謓h v韎 Xa Lu﹏ Ph竝 Vng.");
				Msg2Player("L蕐 頲 th? c蕄 c馻 Di Tu Чi H竛, l? l骳 v? ph鬰 m謓h v韎 Xa Lu﹏ Ph竝 Vng.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end
