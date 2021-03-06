-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北任务NPC怨魂之王召唤和死亡Script
-- By StarryNight
-- 2007/08/07 PM 10:23

-- ======================================================
-- 引用剧情任务文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
local nTime = GetTime() - GetTask(CREAT_YUANHUNZHIWANG_TIME);
	
	if nMapID == 328 and GetFightState() == 1 then
		if GetTask(TASK_XB_ID_02) == 4 then
			if nTime >= 1800 then
				local nYHIndex = CreateNpc("Ch骯 O竛 H錸","Ch骯 O竛 H錸",nMapID,nWx,nWy,-1,1,1,50);
				SetNpcLifeTime(nYHIndex,900); 
				SetNpcScript(nYHIndex,"\\script\\中原二区\\鬼门回廊\\npc\\怨魂之王.lua");
				TaskTip("Ngi  d蒼 Ch骯 O竛 H錸 ra th祅h c玭g, mau gi誸 n?");
				Msg2Player("Ngi  d蒼 Ch骯 O竛 H錸 ra th祅h c玭g, mau gi誸 n?");
				DelItem(2,0,757,1);--孤魂樽
				SetTask(CREAT_YUANHUNZHIWANG_TIME,GetTime());
				return
			else
				strTalk = {
					"C竎h 30 ph髏 l? d蒼 Ch骯 O竛 H錸 ra m閠 l莕!"
				};
				TalkEx("",strTalk);
			end
		else
			strTalk = {
				"Xem ra t竎 d鬾g c馻 b譶h n祔 kh玭g l韓, hay l? v鴗 n? 甶.",
				}	
			TalkEx("",strTalk);
			DelItem(2,0,757,1);--孤魂樽
			return
		end
	elseif GetTask(TASK_XB_ID_02) == 4 then
		strTalk = {
			"H譶h nh? kh玭g c? hi謚 qu? g?, theo C玭 L玭 m玭 nh﹏ n鉯, b譶h n祔 n猲 m? t筰 Qu? M玭 H錳 Lang, ph遪g C? H錸 s? d蒼 Ch骯 O竛 H錸 ra."
			};
			TalkEx("",strTalk);
	else
		strTalk = {
				"Xem ra t竎 d鬾g c馻 b譶h n祔 kh玭g l韓, hay l? v鴗 n? 甶.",
				}	
		TalkEx("",strTalk);
		DelItem(2,0,757,1);--孤魂樽
	end
	
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
		
	SetNpcLifeTime(index,15);--使得尸体消失
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_XB_ID_02) == 4 then
			AddItem(2,0,717,1,1);--非常道符
			SetTask(TASK_XB_ID_02,5);
			SetTask(CREAT_YUANHUNZHIWANG_TIME,0);--清空时间记录
			TaskTip("Gi誸 Ch骯 O竛 H錸 th祅h c玭g, mau n鉯 cho е t? C玭 L玭 b? thng bi誸.");
			Msg2Player("Gi誸 Ch骯 O竛 H錸 th祅h c玭g, mau n鉯 cho е t? C玭 L玭 b? thng bi誸.");
		end;	
  else
    for i=1,nMemCount do
       PlayerIndex = GetTeamMember(i);
       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
       if GetTask(TASK_XB_ID_02) == 4 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
       	SetTask(TASK_XB_ID_02,5);
       	AddItem(2,0,717,1,1);--非常道符
				SetTask(CREAT_YUANHUNZHIWANG_TIME,0);--清空时间记录
				TaskTip("Gi誸 Ch骯 O竛 H錸 th祅h c玭g, mau n鉯 cho е t? C玭 L玭 b? thng bi誸.");
				Msg2Player("Gi誸 Ch骯 O竛 H錸 th祅h c玭g, mau n鉯 cho е t? C玭 L玭 b? thng bi誸.");
       end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end