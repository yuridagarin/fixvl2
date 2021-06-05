Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED or GetMissionV(MV_ROOMSTATE) == MS_STATE_WAITCOMPLETE then
		local nCurPos = 46;
		local nGroup = floor(nCurPos/32);
		local nBit = mod(nCurPos,32)+1;
		if GetBit(GetTask(FLAG_BEGIN+nGroup),nBit) == 0 then
			Msg2Player("B�n �� v��t qua 1 c�ng c� m�u xanh.");
			if GetTask(FLAG_COLOR) ~= 0 then
				local Result = FC_BLUE + GetTask(FLAG_COLOR)*10;
				doeffect(Result);
				SetTask(FLAG_COLOR,0);
			else
				SetTask(FLAG_COLOR,FC_BLUE);
			end;
			SetTask(FLAG_BEGIN+nGroup,SetBit(GetTask(FLAG_BEGIN+nGroup),nBit,1));
		end;
	end;
end;

function doeffect(EffectType)
	local sName = GetName();
	if EffectType == MAGIC_RB then	--ը�ε�һ��
		dizzyfirst();
	elseif EffectType == MAGIC_YB then	--ȫ����ң������Լ���
		OP_AllMSPlayer(chaos,{},CAMP_PLAYER);
		Msg2MSAll(MISSION_ID,sName.." B�n li�n ti�p v��t qua c� v�ng v� c� xanh, to�n b� ng��i ch�i b� lo�n.");
	elseif EffectType == MAGIC_BB then	--ȫ�����
		speedslow();
		Msg2MSAll(MISSION_ID,sName.." V��t qua 2 l�n c� xanh, t�t c� tuy�n th� b� gi�m 40% t�c �� di chuy�n trong 5 gi�y.");
	else 
		WriteLog("blue flag effect result error,EffectType is:"..EffectType);
	end;
end;

function dizzyfirst()
	local sName = GetName();
	local tempPI = PlayerIndex;
	for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
		PlayerIndex = Get_Player_By_Rank(i);
		if PlayerIndex > 0 and GetTask(POSITION) ~= TRAPCOUNT then
			CastState("state_vertigo",1,5*18);
			Msg2MSAll(MISSION_ID,sName.." Li�n ti�p v��t qua c� �� v� c� xanh, l�m cho ng��i ��ng nh�t: "..GetName().." b� cho�ng.");
			break;
		end;
	end;
	PlayerIndex = tempPI;
end;

function chaos(tArg)
	if GetTask(POSITION) ~= TRAPCOUNT then
		CastState("state_confusion",1,5*18);
	end;
end;

function speedslow()
	local tempPI = PlayerIndex;
	local sName = GetName();
	for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
		PlayerIndex = Get_Player_By_Rank(i);
		if PlayerIndex > 0 and PlayerIndex ~= tempPI and GetTask(POSITION) ~= TRAPCOUNT then
			CastState("state_slow",40,5*18);
		end;
	end;
	PlayerIndex = tempPI;
end;