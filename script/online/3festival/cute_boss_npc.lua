--File name:little_boss_npc.lua 
--Describe:����������СBOSS���Ի�NPC��
--Create Date:2006-8-22
--Author:yanjun

Include("\\script\\online\\3festival\\3festival_head.lua")
function main()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	if GetUnitCurStates(nNpcIndex,0) == 1 then
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIndex);
	if GetLevel() < 30 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: ��ng c�p c�a ng��i qu� th�p, ta kh�ng th� giao b�o v�t cho ng��i. Xung quanh ��y c� r�t nhi�u k� gian, h�y �i d�y b�o h�, khi ��t c�p <color=yellow>30<color> h�y ��n t�m ta.");
		return 0;
	end;
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	if Get_Distance(nMapX,nMapY) >= 10 then
		Msg2Player("B�n v�"..sNpcName.." c�ch nhau qu� xa");
		return 0;
	end;
	if GetTask(TASK_GOT_ITEM_TIME) ~= 0 and GetTime() - GetTask(TASK_GOT_ITEM_TIME) <= 60*60 then	--���������εõ���Ʒ��ʱ�����С��60����
		if random(1,50) == 11 then
			Talk(1,"","<color=green>"..sNpcName.."<color>: C� nhi�u �� th�i sao?");
		else
			Talk(1,"","<color=green>"..sNpcName.."<color>: Ng��i �� l�y 1 b�o v�t, m�i ti�ng m�t ng��i ch� ���c l�y 1 b�o v�t m� th�i.");
		end;
		return 0;
	end;
	
	local nItemID = 0;
	for i=1,getn(tBossInfo) do
		if sNpcName == tBossInfo[i][4] then
			nItemID = i;
			break;
		end;
	end;
	if nItemID == 0 then
		WriteLog("[L�i Tam ti�t li�n th�ng]: Nh�p chu�t v�o Boss nh� kh�ng t�m th�y th�ng tin v�t ph�m");
		return 0;
	end;
	setunit_curstates(nNpcIndex,0,1);
	SetNpcLifeTime(nNpcIndex,0);
	SetTask(TASK_GOT_ITEM_TIME,GetTime());
	local nRand = random(1,1000);
	if nRand <= 920 then
		AddItem(tItemInfo[17][2],tItemInfo[17][3],tItemInfo[17][4],1);
		Msg2Player("B�n nh�n ���c 1 "..tItemInfo[17][1]);
	elseif nRand <= 974 then
		AddItem(tItemInfo[22][2],tItemInfo[22][3],tItemInfo[22][4],1);
		Msg2Player("B�n nh�n ���c 1 "..tItemInfo[22][1]);
		Msg2Global(GetName().."Tham gia ho�t ��ng, nh�n ���c 1 quy�n "..tItemInfo[22][1]);
	elseif nRand <= 999 then
		AddItem(tItemInfo[18][2],tItemInfo[18][3],tItemInfo[18][4],1);
		Msg2Player("B�n nh�n ���c 1 "..tItemInfo[18][1]);
		Msg2Global(GetName().."Tham gia ho�t ��ng, nh�n ���c 1 "..tItemInfo[18][1]);
		WriteLog("[08 Tam ti�t li�n th�ng]: Ng��i ch�i"..GetName().."Tham gia ho�t ��ng nh�n ���c 1 "..tItemInfo[18][1]);
	else
		AddItem(tItemInfo[23][2],tItemInfo[23][3],tItemInfo[23][4],1);
		Msg2Player("B�n nh�n ���c 1 "..tItemInfo[23][1]);
		Msg2Global(GetName().."Tham gia ho�t ��ng, nh�n ���c 1 quy�n "..tItemInfo[23][1]);
		WriteLog("[08 Tam ti�t li�n th�ng]: Ng��i ch�i"..GetName().."Tham gia ho�t ��ng nh�n ���c 1 "..tItemInfo[23][1]);
	end;
	if random(1,100) == 11 then
		Say("<color=green>"..sNpcName.."<color>: "..tRandString[random(1,getn(tRandString))],0);
	end;
end;

function setunit_curstates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("Thi�t l�p tr� s� NPC nh�m: V� tr�:"..att_seq.."Tr�:"..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end

tRandString = {
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"VLTK2 ch�c b�n n�m m�i vui v�!",
			"Qu�c Kh�nh vui v�!",
			"Trung Thu vui v�!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			"S� qu�! Sau n�y kh�ng d�m ��n ph� n�a!",
			}