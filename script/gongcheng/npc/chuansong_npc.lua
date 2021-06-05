--create date:07-04-23
--author:yanjun
--describe:ս�������Ĺ���ʹ���
Include("\\script\\gongcheng\\gongcheng_function.lua");
g_InfoHeader = "<color=green>T�p k�t quan<color>: ";
function main()
	local nNpcIdx = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	if gf_GetDistance(nMapX,nMapY) >= 15 then
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local selTab = {};
	local tGraveyardName = {"C�ng th�nh T�y Nam doanh ��a","C�ng th�nh ��ng Nam doanh ��a","�i�m t�p k�t ngo�i th�nh m�n ph�a T�y","�i�m t�p k�t ngo�i th�nh m�n ph�a ��ng","�i�m t�p k�t trong th�nh m�n ph�a T�y","�i�m t�p k�t trong th�nh m�n ph�a ��ng","�i�m t�p k�t H�u cung T�y th�nh","�i�m t�p k�t H�u cung ��ng th�nh ","�i�m t�p k�t Ti�n cung T�y th�nh","�i�m t�p k�t Ti�n cung ��ng th�nh"};
	for i=1,getn(tGraveyardName) do
		if GetMissionV(MV_GRAVEYARD_A1+i-1) == 0 or GetMissionV(MV_GRAVEYARD_A1+i-1) == nPlayerCamp then
			tinsert(selTab,format("%s/#go_to(%d)",tGraveyardName[i],i));
		end;		
	end;
	tinsert(selTab,"�� ta ngh� l�i ��/nothing");
	Say(g_InfoHeader.."B�n mu�n ph�c sinh � �i�m t�p k�t n�o?",getn(selTab),selTab);
end;

function go_to(nPosIdx)
	local nRand = random(1,getn(tGraveyardPos[nPosIdx]));
	SetPos(tGraveyardPos[nPosIdx][nRand][1],tGraveyardPos[nPosIdx][nRand][2]);
	SetFightState(1);
	CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	GCZ_RestoreAll();
end;
