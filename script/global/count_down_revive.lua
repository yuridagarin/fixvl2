--����ʱ����
--ֱ�Ӹ���ص��ű�
--nReviveID������ԭ�ظ�������

--�Զ��庯��ʵ��---------------------
function dr_revive_deal_1()
	RevivePlayer(0, PlayerIndex, 1); --��Ѫ����
end

function dr_revive_deal_2()
	SendScript2VM("\\script\\missions\\eyt_battle\\eyt_head.lua", "eyt_Revive()");
end

--------------------------------------------
--nReviveID���ֲ�ͬ�ĸ������ͣ����ж��壩
--�����������ģ�״̬�ȶ���_g_table_revive����ĺ��������
--�ɹ�����1������ʧ��
_g_table_revive = {
	--[nReviveID] = {count, function}
	[1] = {dr_revive_deal_1, {2, 97, 236, 1, "Thi�n Ki�u L�nh"}},  --���������ؿ�
	[2] = {dr_revive_deal_2, {2, 97, 236, 1, "Thi�n Ki�u L�nh"}},  --��Թ̨
}

function OnRevive(nReviveID)
	--print(nReviveID);
	if not _g_table_revive[nReviveID] or getn(_g_table_revive[nReviveID]) ~= 2 then
		Say("Tr�ng th�i hi�n t�i kh�ng th� h�i sinh!", 0);
		return 0;
	end
	
	local func = _g_table_revive[nReviveID][1];
	if type(func) ~= "function" then
		Say("Tr�ng th�i hi�n t�i kh�ng th� h�i sinh!", 0);
		return 0;
	end	
	
	local tItem = _g_table_revive[nReviveID][2];
	if not tItem or type(tItem) ~= "table" or getn(tItem) ~= 5 then
		Say("Tr�ng th�i hi�n t�i kh�ng th� h�i sinh!", 0);
		return 0;
	end

	local tSay = {
		format("\nX�c nh�n/#dr_item_tjl_do(%d)", nReviveID),
		"\n h�y b�/nothing",
	}
	Say(format("��ng � ti�u hao <color=gold>%s<color>*%d l�p t�c h�i sinh kh�ng?", tItem[5], tItem[4]), getn(tSay), tSay);
end

function dr_item_tjl_do(nReviveID)
	local tItem = _g_table_revive[nReviveID][2];
	if GetItemCount(tItem[1], tItem[2], tItem[3]) < tItem[4] then
		Say(format("��o c� %s trong t�i kh�ng �� %d", tItem[5], tItem[4]), 0);
		return 0;
	end
	if DelItem(tItem[1], tItem[2], tItem[3], tItem[4]) ~= 1 then
		return 0;
	end
	Msg2Player(format("�� ti�u hao %s*%d", tItem[5], tItem[4]));
	
	--����֮��
	_g_table_revive[nReviveID][1]();

	return 1;
end

function nothing()
	--do nothing()
end
