--�ű����ܣ�20011��6����ٻ�ű�
--������ƣ�Խ�Ϸ�ͬ��
--���ܿ������峤
--����ʱ�䣺2011-5-16
--�޸ļ�¼������
--2011��6����ٻ��ʼͨ�����ñ���������Ϣ
--<���Ʒ>��Ӧ�ű�
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
function OnUse(nItemIndex)
	if gf_CheckEventDateEx(138) ~= 1 then
		Talk(1,"","Event �� h�t n�n ��i hi�p kh�ng th� s� d�ng v�t ph�m n�y ���c n�a!")
		return 0;
	end
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)	

---- M� r�ng event
--
--	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
--	if tbActivity then
--		local nCheckMaxEvent = gf_GetTaskByte(2731, 1)
--		local tbPrizeItemInfo = tbActivity.tbPrizeItemInfo[nItemSeq]
--		--local nTask = Vet_Activity_GetItemUseInfo(tbActivity.tbTaskGroup[1],tbActivity.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdGetFinalPrize)
--		local nUseTimes = Vet_Activity_GetItemUseInfo(tbActivity.tbTaskGroup[1],tbActivity.tbTaskGroup[2],tbPrizeItemInfo.nTaskIdUseItemTimes)
--		if nUseTimes >= 2000 and nUseTimes < 4000 then
--			if GetTask(2785) < 1 or GetTask(2786) < 1 or GetTask(2787) < 1 then
--				Talk(1,"","��i hi�p ch�a nh�n ph�n th��ng cu�i m�c 2000 n�n kh�ng th� s� d�ng ti�p v�t ph�m event !!!!")
--				return 0
--			end
--			tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
----			if GetTask(2788) == 4000 and GetTask(2789) == 4000 and GetTask(2790) == 4000 and nCheckMaxEvent == 0 then
----				--SetTask(2731,1)
----				gf_SetTaskByte(2731, 1, 1)
----			end
----		elseif nUseTimes >= 3000 and nUseTimes < 4000 then
----			if nCheckMaxEvent < 2 then
----				Talk(1,"","��i hi�p ch�a nh�n ph�n th��ng cu�i m�c 3000 v�t ph�m n�n kh�ng th� s� d�ng ti�p!!!!")
----				return 0
----			end
----			tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
----			if GetTask(2836) == 4000 and GetTask(2837) == 4000 and GetTask(2838) == 4000 and nCheckMaxEvent == 2 then
----				--SetTask(2731,3)
----				gf_SetTaskByte(2731, 1, 3)
----			end
--		else
--			tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
--		end
--	end
	
	
end
