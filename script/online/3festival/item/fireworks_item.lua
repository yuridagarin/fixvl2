--File name:fireworks_item.lua 
--Describe:三节连过，烟火物品脚本
--Create Date:2006-9-9
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse()
	if tonumber(date("%y%m%d")) > 061008 then
		Talk(1,"","Xin l鏸! Ph竜 hoa c馻 b筺  h誸 h筺 s? d鬾g.");
		return 0;
	end;
	if GetLevel() <= 10 then
		Talk(1,"","Xin l鏸! Ch? c? ngi ch琲 tr猲 <color=yellow>c蕄 10<color> m韎 c? th? t Ph竜 hoa");
		return 0;
	end;
	if GetTaskTemp(TT_TIMER_LOOP) ~= 0 then
		Talk(1,"","B筺  t 1 c﹜ Ph竜 hoa, m閠 l莕 ch? c? th? t <color=yellow>1 <color> Ph竜 hoa.");
		return 0;
	end;
	local selTab = {
				"цt ph竜 hoa/confirm",
				"Xem thuy誸 minh/know_detail",
				"K誸 th骳 i tho筰/nothing",
				}
	Say("Th阨 gian s? d鬾g ph竜 hoa l? <color=yellow>28/9-8/10<color>. B筺 mu鑞 l祄 g??",getn(selTab),selTab);
end;

function confirm()
	if DelItem(tItemInfo[10][2],tItemInfo[10][3],tItemInfo[10][4],1) == 1 then
		local nMapID,nMapX,nMapY = GetWorldPos();
		local nNpcIndex = CreateNpc("Ngi V? h譶h",GetName().." ph竜 hoa",nMapID,nMapX,nMapY);
		SetNpcLifeTime(nNpcIndex,15*60);	--15分钟，比10分钟长一点
		SetCurrentNpcSFX(nNpcIndex,936,1,1);
		SetTaskTemp(TT_FIREWORKS_MAPID,nMapID);
		SetTaskTemp(TT_FIREWORKS_MAPX,nMapX);
		SetTaskTemp(TT_FIREWORKS_MAPY,nMapY);
		SetTaskTemp(TT_FIREWORKS_Time,GetTime());
		SetTaskTemp(TT_FIREWORKS_INDEX,nNpcIndex);
		SetTaskTemp(TT_TIMER_LOOP,TIMER_LOOP);
		CreateTrigger(1,TRIGGER_TIMER,TRIGGER_TIMER_CID);
		ContinueTimer(GetTrigger(TRIGGER_TIMER_CID));
		CreateTrigger(3,TRIGGER_LOGOUT,TRIGGER_LOGOUT_CID);
	end;
end;

function know_detail()
	Talk(1,"OnUse","Th阨 gian s? d鬾g ph竜 hoa l? <color=yellow>28-09 n 08-10<color>,  ngi ch琲 c蕄 10 tr? l猲 u c? th? tham gia.Th阨 gian b緉 Ph竜 hoa l? 10 ph髏. Ngi ch琲 s? d鬾g ph竜 hoa m鏸 ph髏 nh薾 頲 50000 甶觤 s鴆 kh醗. C? th? m阨 ngi ch琲 kh竎 v祇 i ho芻 s? c? ngi r阨 kh醝 i.");
end;