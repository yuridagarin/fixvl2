Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\resourcebattle_head.lua");
function main()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Say("Ta th�t ��ng th��ng l�m sao!",0);
		return 0;
	end;
	local selTab = {
				"Th�t t�i nghi�p, t�ng h�n 10 bao l��ng th�o/#give_resource(1,10)",
				"Th�t t�i nghi�p, t�ng h�n 10 bao l��ng th�o-trung c�p/#give_resource(2,10)",
				"Th�t t�i nghi�p, t�ng h�n 10 bao l��ng th�o-cao c�p/#give_resource(3,10)",
				"Kh�ng gi�p ��/nothing",
				}
	Say("M�y ng�y tr��c quan binh kh�ng bi�t t� ��u �p ��n ��i b�t th� l�nh th� d�n, ch�ng ��p ph�, l�c x�t t�ng c�n nh�, ta ph�i tr�n ch�y ��n ��y.",getn(selTab),selTab);
end;

function give_resource(nType,nCount)
	local nRand = random(1,100);
	local nTime = GetTime();
	if DelItem(tBattleItem[nType][2],tBattleItem[nType][3],tBattleItem[nType][4],nCount) == 1 then	
		if nType == 1 then
			if nRand <= 30 then
				BT_AddBattleEvenPoint(BP_RESOURCE_HAND_IN_RES1_REFUGEE);
			elseif nRand <= 50 then
				clear_all_state();
				BT_SetData(PT_1MIN2TYPE,nTime);--�����һ���������ڵ��������ݶ����м�����
				Msg2Player("B�n s� ��o ���c l��ng th�o-trung c�p trong 1 ph�t, xin tranh th�!");
			elseif nRand <= 60 then
				clear_all_state();
				BT_SetData(PT_1MINDOUBLE,nTime);--�����һ���������ڵ�������������x2
				Msg2Player("B�n s� ��o ���c s� l��ng l��ng th�o g�p ��i trong 1 ph�t, xin tranh th�!");
			else	
				AddItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],1);
				Msg2Player("B�n nh�n ���c 1 Huy�n thi�t kho�ng th�ch");
			end;
		elseif nType == 2 then
			if nRand <= 20 then
				BT_AddBattleEvenPoint(BP_RESOURCE_HAND_IN_RES2_REFUGEE);
			elseif nRand <= 50 then
				clear_all_state();
				BT_SetData(PT_1MINDOUBLE,nTime);--�����һ���������ڵ�������������x2
				Msg2Player("B�n s� ��o ���c s� l��ng l��ng th�o g�p ��i trong 1 ph�t, xin tranh th�!");
			elseif nRand <= 60 then
				clear_all_state();
				BT_SetData(PT_1MIN3TYPE,nTime);--�����һ���������ڵ��������ݶ��Ǹ߼�����
				Msg2Player("B�n s� ��o ���c l��ng th�o-cao c�p trong 1 ph�t, xin tranh th�!");
			else
				AddItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],2);
				Msg2Player("B�n nh�n ���c 2 vi�n Huy�n thi�t kho�ng th�ch");
			end;
		elseif nType == 3 then
			if nRand <= 15 then
				BT_AddBattleEvenPoint(BP_RESOURCE_HAND_IN_RES3_REFUGEE);
			elseif nRand <= 50 then
				clear_all_state();
				BT_SetData(PT_3MINDOUBLE,nTime);--����������������ڵ�������������x2
				Msg2Player("B�n s� ��o ���c s� l��ng l��ng th�o g�p ��i trong 3 ph�t, xin tranh th�!");
			elseif nRand <= 60 then
				clear_all_state();
				BT_SetData(PT_1MIN3TYPEDOUBLE,nTime);--�����һ���������ڵ��������ݶ��Ǹ߼�������������������x2
				Msg2Player("B�n s� ��o ���c s� l��ng l��ng th�o-cao c�p g�p ��i trong 1 ph�t, xin tranh th�!");
			else
				AddItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],6);
				Msg2Player("B�n nh�n ���c 6 vi�n Huy�n thi�t kho�ng th�ch");
			end;	
		end;
	else
		Talk(1,"main","H�! S� l��ng th�o c�a ng��i mang theo kh�ng ��!");
	end;
end;

function clear_all_state()
	for i=PT_1MIN2TYPE,PT_3MINDOUBLE do
		BT_SetData(i,0);
	end;
end;