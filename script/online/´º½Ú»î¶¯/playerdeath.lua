Include("\\script\\online\\���ڻ\\snowwar\\snowwar_head.lua");
function OnDeath(Launcher)
	local KillerIndex = NpcIdx2PIdx(Launcher);
	local EntryNo = random(1,getn(tBORN_POS))
	local MapID = GetWorldPos()
	SetTempRevPos(MapID,tBORN_POS[EntryNo][1]*32,tBORN_POS[EntryNo][2]*32)	--���������
	SetDeathScript("\\script\\online\\���ڻ\\playerdeath.lua")
	if GetMissionV(MV_FIELD_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	SetTask(PT_POINT,GetTask(PT_POINT,KillerIndex)+1, 0, KillerIndex);
	SetTask(PT_KILL_COUNT,GetTask(PT_KILL_COUNT,KillerIndex)+1, 0, KillerIndex);
	if GetTask(PT_POINT,KillerIndex) > LIMIT_POINT then
		SetTask(PT_POINT,LIMIT_POINT, 0, KillerIndex);
		Msg2SomeOne(KillerIndex,"�i�m t�ch l�y c�a b�n ��t m�c t�i �a:"..LIMIT_POINT.." Ph�t ");
	end;
	Msg2SomeOne(KillerIndex,"B�n d�ng Tuy�t c�u ��nh ng�"..GetName(PlayerIndex)..", nh�n ���c m�t �i�m t�ch l�y n�m tuy�t. Hi�n s� �i�m t�ch l�y c�a b�n l�:"..GetTask(PT_POINT,KillerIndex));
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
	Msg2Player("B�n b� "..GetName(KillerIndex).." d�ng Tuy�t c�u ��nh ng�, m�t m�t �i�m t�ch l�y, hi�n s� �i�m t�ch l�y c�a b�n l�:"..GetTask(PT_POINT,PlayerIndex))
end