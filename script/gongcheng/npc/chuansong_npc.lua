--create date:07-04-23
--author:yanjun
--describe:战场里面的墓地送传人
Include("\\script\\gongcheng\\gongcheng_function.lua");
g_InfoHeader = "<color=green>T藀 k誸 quan<color>: ";
function main()
	local nNpcIdx = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	if gf_GetDistance(nMapX,nMapY) >= 15 then
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local selTab = {};
	local tGraveyardName = {"C玭g th祅h T﹜ Nam doanh a","C玭g th祅h Йng Nam doanh a","觤 t藀 k誸 ngo礽 th祅h m玭 ph輆 T﹜","觤 t藀 k誸 ngo礽 th祅h m玭 ph輆 Йng","觤 t藀 k誸 trong th祅h m玭 ph輆 T﹜","觤 t藀 k誸 trong th祅h m玭 ph輆 Йng","觤 t藀 k誸 H藆 cung T﹜ th祅h","觤 t藀 k誸 H藆 cung Йng th祅h ","觤 t藀 k誸 Ti襫 cung T﹜ th祅h","觤 t藀 k誸 Ti襫 cung Йng th祅h"};
	for i=1,getn(tGraveyardName) do
		if GetMissionV(MV_GRAVEYARD_A1+i-1) == 0 or GetMissionV(MV_GRAVEYARD_A1+i-1) == nPlayerCamp then
			tinsert(selTab,format("%s/#go_to(%d)",tGraveyardName[i],i));
		end;		
	end;
	tinsert(selTab,"в ta ngh? l筰 /nothing");
	Say(g_InfoHeader.."B筺 mu鑞 ph鬰 sinh ? 甶觤 t藀 k誸 n祇?",getn(selTab),selTab);
end;

function go_to(nPosIdx)
	local nRand = random(1,getn(tGraveyardPos[nPosIdx]));
	SetPos(tGraveyardPos[nPosIdx][nRand][1],tGraveyardPos[nPosIdx][nRand][2]);
	SetFightState(1);
	CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	GCZ_RestoreAll();
end;
