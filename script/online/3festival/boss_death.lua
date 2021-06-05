--File name:boss_death.lua 
--Describe:�����������߻�BOSS�����ű�
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex,20);
	SetNpcDeathScript(nNpcIndex,"");
	local sNpcName = GetNpcName(nNpcIndex);
	local sCuteBossName = "";
	local nNpcPosID = GetNpcWorldPos(nNpcIndex);
	local nBossID = 0;
	local nPosIndex = get_pos_index(nNpcPosID);
	for i=1,getn(tBossInfo) do 
		if sNpcName == tBossInfo[i][3] then
			nBossID = i;
			break;
		end;
	end;
	Msg2SubWorld(tBossPos[nPosIndex][1].." giang h� �c nh�n "..sNpcName.."�� b� m�i ng��i h�p s�c ��nh b�i!")
	AddGlobalNews(tBossPos[nPosIndex][1].." giang h� �c nh�n "..sNpcName.."�� b� m�i ng��i h�p s�c ��nh b�i!");
	if nBossID == 0 then
		WriteLog("[L�i Tam ti�t li�n th�ng]: Sau khi Boss ch�t kh�ng t�m th�y th�ng tin t��ng �ng c�a Boss");
		nBossID = 9;	--�ݴ���
	end;
	local nCuteBossIndex = 0;
	for i=1,CUTE_BOSS_COUNT do
		nCuteBossIndex = CreateNpc(tBossInfo[nBossID][2],tBossInfo[nBossID][4],tBossPos[nPosIndex][2],tBossPos[nPosIndex][3],tBossPos[nPosIndex][4],6,1,1,1500);	--���������Ϊ��ͼ����
		SetNpcScript(nCuteBossIndex,"\\script\\online\\3festival\\cute_boss_npc.lua");
		SetNpcLifeTime(nCuteBossIndex,60*60);	--60��������ʱ��
	end;
	if random(1,100) == 11 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: "..tRandString[random(1,getn(tRandString))]);
	end;
end;

tRandString = {
			"�i chao! ��nh ta �au qu�!",
			"Ng��i h�y nh� k�",
			"L�n sau ��nh ti�p.",
			"VLTK2 ch�c b�n n�m m�i vui v�!",
			"Qu�c Kh�nh vui v�!",
			"Trung Thu vui v�!",
			"�i chao! ��nh ta �au qu�!",
			"�i chao! ��nh ta �au qu�!",
			"�i chao! ��nh ta �au qu�!",
			"�i chao! ��nh ta �au qu�!",
			"�i chao! ��nh ta �au qu�!",
			"�i chao! ��nh ta �au qu�!",
			"�i chao! ��nh ta �au qu�!",
			"�i chao! ��nh ta �au qu�!",
			"�i chao! ��nh ta �au qu�!",
			"�i chao! ��nh ta �au qu�!",
			"�i chao! ��nh ta �au qu�!",
			"�i chao! ��nh ta �au qu�!",
			}
			
function get_pos_index(nMapID)
	for i=1,getn(tBossPos) do
		if nMapID == tBossPos[i][2] then
			return i
		end;
	end;
	return 0;
end;