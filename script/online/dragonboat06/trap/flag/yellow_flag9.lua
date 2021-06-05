Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED or GetMissionV(MV_ROOMSTATE) == MS_STATE_WAITCOMPLETE then
		local nCurPos = 33;
		local nGroup = floor(nCurPos/32);
		local nBit = mod(nCurPos,32)+1;
		if GetBit(GetTask(FLAG_BEGIN+nGroup),nBit) == 0 then
			Msg2Player("B�n �� v��t qua c� v�ng");
			if GetTask(FLAG_COLOR) ~= 0 then
				local Result = FC_YELLOW + GetTask(FLAG_COLOR)*10;
				doeffect(Result);
				SetTask(FLAG_COLOR,0);
			else
				SetTask(FLAG_COLOR,FC_YELLOW);
			end;
			SetTask(FLAG_BEGIN+nGroup,SetBit(GetTask(FLAG_BEGIN+nGroup),nBit,1));
		end;
	end;
end;

function doeffect(EffectType)
	if EffectType == MAGIC_RY then	--ը���Լ���ǰ��ѡ��
		dizzyfront();
	elseif EffectType == MAGIC_YY then	--������Լ�ת�Ƶ���һ��ѡ�ֵ����
		moveself();
	elseif EffectType == MAGIC_BY then	--�������
		accelerate();
	else
		WriteLog("yellow flag effect result error,EffectType is:"..EffectType);
	end;
end;

function dizzyfront()
	local tempPI = PlayerIndex;
	local sName = GetName();
	local nRank = Get_Self_Rank() - 1;
	PlayerIndex = Get_Player_By_Rank(nRank);
	if PlayerIndex > 0 and GetTask(POSITION) ~= TRAPCOUNT and PlayerIndex ~= tempPI then
		CastState("state_vertigo",1,4*18);
		Msg2Player("Ng��i x�p sau  "..sName.." Li�n ti�p v��t qua c� �� v� c� v�ng, b�n b� cho�ng.");
	else
		PlayerIndex = tempPI;
		Msg2Player("l�m cho�ng tuy�n th� x�p tr�n th�t b�i");
	end;
	PlayerIndex = tempPI;
end;

function moveself()
	local tempPI = PlayerIndex;
	local nRandomNum = random(1,GetMSPlayerCount(MISSION_ID,CAMP_PALYER));
	PlayerIndex = Get_Player_By_Rank(nRandomNum);
	if PlayerIndex > 0 and PlayerIndex ~= tempPI and GetTask(POSITION) ~= TRAPCOUNT then
		local MapID,MapX,MapY = GetWorldPos();
		local sName = GetName();
		local nPos = GetTask(POSITION);
		PlayerIndex = tempPI;
		NewWorld(MapID,MapX,MapY);
		SetTask(POSITION,nPos);
		Msg2MSAll(MISSION_ID,GetName().."V��t qua 2 l�n c� v�ng, di chuy�n ��n b�n c�nh "..sName.." {c�nh}");
	else
		PlayerIndex = tempPI;
		Msg2Player("Di chuy�n th�t b�i!");
	end;
end;

function accelerate()
	CastState("state_move_speed_percent_add",50,5*18)
	Msg2Player("Hi�n t�c �� di chuy�n c�a b�n t�ng 50% trong 5 gi�y.");
end;