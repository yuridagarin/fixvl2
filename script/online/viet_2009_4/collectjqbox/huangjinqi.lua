--=============================================
--create by baiyun 2009.4.13
--describe:Խ�ϰ�4�·��ռ�У���� �ƽ���
--=============================================
Include("\\script\\online\\viet_2009_4\\collectjqbox\\jiaoqi_head.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua")

function OnUse()
	----���ʱ��
	if tonumber(date("%Y%m%d%H")) > 2009060724 then
		Talk(1, "", "Th�i h�n s� d�ng v�t ph�m n�y �� h�t!");
		return 0;
	end
	
	-----�жϱ����͸���------------------------
	if gf_Judge_Room_Weight(5, 50, "Xin l�i, ") == 0 then
		return 0
	end
	
	if DelItem(2, 1, 30084, 1) ~= 1 then
		return 0;
	end
	
	--�������Ƿ��еõ�����
	--���õ��ľ����Ƿ񵽴�����
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(JQ_TASK_GET_GOLDEN_FLAG_REWARD_DATE) < nDate then --��������һ�λ�þ���
		SetTask(JQ_TASK_GET_GOLDEN_FLAG_REWARD_DATE, nDate);
	end;
	
	--������
	if GetTask(JQ_TASK_GOLDEN_FLAG_EXP_MAX) < JQ_GOLDEN_FLAG_EXP_MAX then
		ModifyExp(JQ_GOLDEN_FLAG_EACH_EXP);
		SetTask(JQ_TASK_GOLDEN_FLAG_EXP_MAX, GetTask(JQ_TASK_GOLDEN_FLAG_EXP_MAX) + JQ_GOLDEN_FLAG_EACH_EXP);
		Msg2Player("B�n nh�n ���c " .. JQ_GOLDEN_FLAG_EACH_EXP .. "Kinh nghi�m");
		WriteLog("[Ho�t ��ng thu th�p hi�u k� th�ng 4]:" .. GetName() .. "Nh�n ���c" .. JQ_GOLDEN_FLAG_EACH_EXP .. "Kinh nghi�m");
	else
		Msg2Player("H�m nay �� s� d�ng Ho�ng Kim K� ��t ��n kinh nghi�m cao nh�t r�i!");
	end
	
	--�õ������Ʒ
	local nItem = JQ_GetRandItem(JQ_YG_FLAG_ITEM_PARAM);
	
	--�������
	if nItem >= 8 and nItem <= 11 then 
		ModifyReputation(JQ_YG_FLAG_ITEM_PARAM[nItem][7], 0);
		Msg2Player("B�n nh�n ���c " .. JQ_YG_FLAG_ITEM_PARAM[nItem][7] .. " �i�m" .. "Danh v�ng");		
		WriteLogEx("Hoat dong thang 4","Ho�ng Kim K�",JQ_YG_FLAG_ITEM_PARAM[nItem][7],JQ_YG_FLAG_ITEM_PARAM[nItem][1]);		
		return 1;
	end
	--�����Ϊ
	if nItem == 12 then
		ModifyPopur(20);
		Msg2Player("B�n nh�n ���c " .. JQ_YG_FLAG_ITEM_PARAM[nItem][7] .. " �i�m" .. "Luy�n");
		WriteLogEx("Hoat dong thang 4","Ho�ng Kim K�",JQ_YG_FLAG_ITEM_PARAM[nItem][7],JQ_YG_FLAG_ITEM_PARAM[nItem][1]);		
		return 1;
	end
	--��òؽ���
	if nItem == 13 then
		SetTask(1801, GetTask(1801) + JQ_YG_FLAG_ITEM_PARAM[nItem][7]);
		Msg2Player("B�n nh�n ���c " .. JQ_YG_FLAG_ITEM_PARAM[nItem][7] .. " �i�m" .. "�i�m t�ng ki�m");
		WriteLogEx("Hoat dong thang 4","Ho�ng Kim K�",JQ_YG_FLAG_ITEM_PARAM[nItem][7],JQ_YG_FLAG_ITEM_PARAM[nItem][1]);
		return 1;
	end
	--������Ʒ����
	local nResult, nIndex = AddItem(JQ_YG_FLAG_ITEM_PARAM[nItem][3], JQ_YG_FLAG_ITEM_PARAM[nItem][4], JQ_YG_FLAG_ITEM_PARAM[nItem][5], JQ_YG_FLAG_ITEM_PARAM[nItem][7]);
	if nResult == 1 then
		if JQ_YG_FLAG_ITEM_PARAM[nItem][6] ~= 0 then
			SetItemExpireTime(nIndex, JQ_YG_FLAG_ITEM_PARAM[nItem][6]);
		end
		Msg2Player("B�n nh�n ���c " .. JQ_YG_FLAG_ITEM_PARAM[nItem][7] .. "c�i" .. JQ_YG_FLAG_ITEM_PARAM[nItem][1]);
		WriteLogEx("Hoat dong thang 4","Ho�ng Kim K�",JQ_YG_FLAG_ITEM_PARAM[nItem][7],JQ_YG_FLAG_ITEM_PARAM[nItem][1]);
	end
	
end