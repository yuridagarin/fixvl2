Include("\\script\\online\\春节活动\\snowwar\\snowwar_head.lua");
function OnDeath(Launcher)
	local KillerIndex = NpcIdx2PIdx(Launcher);
	local EntryNo = random(1,getn(tBORN_POS))
	local MapID = GetWorldPos()
	SetTempRevPos(MapID,tBORN_POS[EntryNo][1]*32,tBORN_POS[EntryNo][2]*32)	--随机重生点
	SetDeathScript("\\script\\online\\春节活动\\playerdeath.lua")
	if GetMissionV(MV_FIELD_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	SetTask(PT_POINT,GetTask(PT_POINT,KillerIndex)+1, 0, KillerIndex);
	SetTask(PT_KILL_COUNT,GetTask(PT_KILL_COUNT,KillerIndex)+1, 0, KillerIndex);
	if GetTask(PT_POINT,KillerIndex) > LIMIT_POINT then
		SetTask(PT_POINT,LIMIT_POINT, 0, KillerIndex);
		Msg2SomeOne(KillerIndex,"觤 t輈h l騳 c馻 b筺 t m鴆 t鑙 產:"..LIMIT_POINT.." Ph髏 ");
	end;
	Msg2SomeOne(KillerIndex,"B筺 d飊g Tuy誸 c莡 nh ng?"..GetName(PlayerIndex)..", nh薾 頲 m閠 甶觤 t輈h l騳 n衜 tuy誸. Hi謓 s? 甶觤 t輈h l騳 c馻 b筺 l?:"..GetTask(PT_POINT,KillerIndex));
	if GetTask(PT_POINT,KillerIndex) > LIMIT_POINT then
		SetTask(PT_POINT,LIMIT_POINT, 0, KillerIndex);
	end;
	SetTask(PT_POINT,GetTask(PT_POINT,PlayerIndex)-1, 0, PlayerIndex);
	SetTask(PT_DEATH_COUNT,GetTask(PT_DEATH_COUNT)+1, 0, PlayerIndex);
	if GetTask(PT_POINT,PlayerIndex) < 0 then
		SetTask(PT_POINT,0, 0, PlayerIndex);
	end;
	RestoreAll()
	CastState("state_dispear",0, 5*18)
	Msg2Player("B筺 b? "..GetName(KillerIndex).." d飊g Tuy誸 c莡 nh ng?, m蕋 m閠 甶觤 t輈h l騳, hi謓 s? 甶觤 t輈h l騳 c馻 b筺 l?:"..GetTask(PT_POINT,PlayerIndex))
end