-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 药王谷NPC西夏法王Script
-- By StarryNight
-- 2007/08/07 PM 05:51

-- 我不是金轮法王啊，不要认错人！

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
	"Xem ra Ph竝 kh? n祔 l? v藅 Di謕 T? Thu nh綾 n c? th? khi課 cho Nguy猲 h譶h 秓 秐h_Th莕 hi謓 nguy猲 h譶h, mau n M? cung sa m筩 t譵 B筩h Thi猲 Th祅h  bi誸 n琲 秓 秐h."
	}

	--SetNpcLifeTime(index,15);--使得尸体消失
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_XB_ID_01) == 63 then
			AddItem(2,0,733,1,1);--幻象法器
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,64);
			TaskTip("L蕐 頲 ph竝 kh? 秓 秐h, h穣 n M? cung sa m筩 nh? B筩h Thi猲 Th祅h t譵 秓 秐h.");
			Msg2Player("L蕐 頲 ph竝 kh? 秓 秐h, h穣 n M? cung sa m筩 nh? B筩h Thi猲 Th祅h t譵 秓 秐h.");
			GivePlayerAward("Award_XB_53","Easy");
			return
		end
		if GetTask(TASK_XB_ID_01) >= 64 and GetTask(TASK_XB_ID_01) <= 66 then --还没打败幻象前掉落幻象法器
			if GetItemCount(2,0,733) == 0 then
				AddItem(2,0,733,1,1);--幻象法器
				return
			end
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_01) >= 64 and GetTask(TASK_XB_ID_01) <= 66 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then --还没打败幻象前掉落幻象法器
				if GetItemCount(2,0,733) == 0 then
				AddItem(2,0,733,1,1);--幻象法器
				return
			end
			end;
			if GetTask(TASK_XB_ID_01) == 63 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,733,1,1);--幻象法器
				TalkEx("",strTalk);
				SetTask(TASK_XB_ID_01,64);
				TaskTip("L蕐 頲 ph竝 kh? 秓 秐h, h穣 n M? cung sa m筩 nh? B筩h Thi猲 Th祅h t譵 秓 秐h.");
				Msg2Player("L蕐 頲 ph竝 kh? 秓 秐h, h穣 n M? cung sa m筩 nh? B筩h Thi猲 Th祅h t譵 秓 秐h.");
				GivePlayerAward("Award_XB_53","Easy");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end
