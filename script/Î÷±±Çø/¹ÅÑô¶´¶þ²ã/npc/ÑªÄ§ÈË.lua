-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北任务NPC血魔人召唤和死亡Script
-- By StarryNight
-- 2007/08/08 AM 10:31

-- ======================================================
-- 引用剧情任务文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
local nTime = GetTime() - GetTask(CREAT_XUEMOREN_TIME);
local strTalk = {};

	if nMapID == 512 and GetFightState() == 1 then
		if GetTask(TASK_XB_ID_02) == 19 then
			if nTime >= 1800 then
				local nYHIndex = CreateNpc("Huy誸 Ma Nh﹏","Huy誸 Ma Nh﹏",nMapID,nWx,nWy,-1,1,1,50);
				SetNpcLifeTime(nYHIndex,900); 
				SetNpcScript(nYHIndex,"\\script\\西北区\\古阳洞二层\\npc\\血魔人.lua");
				TaskTip("B筺  tri謚 g鋓 Huy誸 Ma Nh﹏ h穣 ti猽 di謙 n?.");
				Msg2Player("B筺  tri謚 g鋓 Huy誸 Ma Nh﹏ h穣 ti猽 di謙 n?.");
				DelItem(2,0,706,1);--聚灵匕首
				SetTask(CREAT_XUEMOREN_TIME,GetTime());
				return
			else
				strTalk = {
					"Sau m鏸 l莕 tri謚 g鋓 Huy誸 Ma Nh﹏ ch? 30 ph髏 m韎 頲 l苝 l筰."
				};
				TalkEx("",strTalk);
			end
		else
			strTalk = {
				"Xem ra con dao n祔 kh玭g c遪 t竎 d鬾g r錳 chi b籲g v鴗 甶. ",
				}	
			TalkEx("",strTalk);
			DelItem(2,0,706,1);--聚灵匕首
			return
		end
	elseif GetTask(TASK_XB_ID_02) == 19 then
		strTalk = {
			"Theo l阨 c馻 Di謕 T? Thu th? con dao n祔 ph秈 h頿 v韎 Huy誸 H錸 Tinh Ph竎h trong C? Dng ng_2 m韎 c? th? tri謚 g鋓 Ma v藅 trong b鬾g C? Dng Th?."
			};
			TalkEx("",strTalk);
	else
		strTalk = {
				"Xem ra con dao n祔 kh玭g c遪 t竎 d鬾g r錳 chi b籲g v鴗 甶. ",
				}	
		TalkEx("",strTalk);
		DelItem(2,0,706,1);--聚灵匕首
	end
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
		
	SetNpcLifeTime(index,15);--使得尸体消失
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_XB_ID_02) == 19 then
			DelItem(2,0,705,1);--血魂晶魄
			AddItem(2,0,707,1,1);--半块玉佩
			SetTask(TASK_XB_ID_02,20);
			SetTask(CREAT_YUANHUNZHIWANG_TIME,0);--清空时间记录
			TaskTip("Х ti猽 di謙 Huy誸 Ma Nh﹏, v? C玭 L玭 b竜 cho Di謕 T? Thu.");
			Msg2Player("Х ti猽 di謙 Huy誸 Ma Nh﹏, v? C玭 L玭 b竜 cho Di謕 T? Thu.");
		end;	
  else
    for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_02) == 19 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				DelItem(2,0,705,1);--血魂晶魄
				AddItem(2,0,707,1,1);--半块玉佩
				SetTask(TASK_XB_ID_02,20);
				SetTask(CREAT_YUANHUNZHIWANG_TIME,0);--清空时间记录
				TaskTip("Х ti猽 di謙 Huy誸 Ma Nh﹏, v? C玭 L玭 b竜 cho Di謕 T? Thu.");
				Msg2Player("Х ti猽 di謙 Huy誸 Ma Nh﹏, v? C玭 L玭 b竜 cho Di謕 T? Thu.");
      end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end