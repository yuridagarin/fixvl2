Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");

function main()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	if BT_GetTempData(PTT_LOCK) == 1 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Gi� l�y m�ng s�ng r�i m�i n�i.");
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local sSubString = sNpcName;
	if sSubString == "N�n d�n T�ng" and nCamp ~= SONG_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: H�! D�u ta c� b� gi�t c�ng kh�ng theo ng��i!");
		return 0;
	elseif sSubString == "N�n d�n Li�u" and nCamp ~= LIAO_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>: H�! D�u ta c� b� gi�t c�ng kh�ng theo ng��i!");
		return 0;
	end;
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ng��i ��a b�n ta ��n ch� an to�n r�i quay l�i ��y.");
		return 0;
	end
	local selTab = {
				"Mau theo ta ��n n�i an to�n/get_refugee",
				"��i gi�y l�t s� c� ng��i ��n c�u/nothing",
				}
	Say("<color=green>N�n d�n<color>:"..tSexName[GetSex()].."Xin c�u m�ng!",getn(selTab),selTab);
end;

function get_refugee()
	local nCamp = BT_GetCamp();
	if nCamp == 0 then
		return 0;
	end;
	local nNpcIndex = GetTargetNpc();
	local bExist = GetUnitCurStates(nNpcIndex,0);	--ʹ�õȼ��������Ƿ���ڵı��
	if bExist ~= 99 then
		return 0;
	end;
	SetNpcLifeTime(nNpcIndex,0);
	AddUnitStates(nNpcIndex,0,-bExist);	--��0
	local tRefugeeModel = {"N�n d�n-T�ng ���c c�u tho�t","N�n d�n-Li�u ���c c�u tho�t"};
	local tRefugeeName = {"N�n d�n T�ng","N�n d�n Li�u"};
	SummonNpc(tRefugeeModel[nCamp],tRefugeeName[nCamp]);
	BT_AddBattleActivity(BA_MAIN_HELP_NATIVE);
	BT_SetTempData(PTT_FOLLOWER,1);
end;