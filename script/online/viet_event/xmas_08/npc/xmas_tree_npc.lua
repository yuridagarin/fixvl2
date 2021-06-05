--File name:	xmas_tree_npc.lua
--Describe:		ʥ����(Ұ���ͼ)npc�ű�
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")


g_szLogTitle = "Giang Sinh 2008"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szFileName = "xmas_tree_npc.lua"						--�ļ���


function main()
	if is_xmas_08_viet_open() == 0 then
		return
	end

	local nNpcIndex = GetTargetNpc()
	if nNpcIndex <= 0 then
		WriteLogEx(g_szLogTitle, "C�y Th�ng Gi�ng Sinh (ngo�i th�nh)", "NULL", "NULL", "NULL", GetTongName(), "In file "..g_szFileName..", function GetTargetNpc() return value <= 0")
		return
	end
	SetTaskTemp(TREE_INDEX_08_XMAS_VIET, nNpcIndex)

	if gf_Judge_Room_Weight(1, 20) == 0 then
		Msg2Player("Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end

	if GetLevel() < 10 then
		Msg2Player("Ph�i ��t ��ng c�p 10 tr� l�n m�i c� th� trang tr� c�y th�ng")
		return
	end

	if GetPlayerRoute() == 0 then
		Msg2Player("Ch�a v�o m�n ph�i kh�ng th� trang tr� c�y th�ng.")
		return
	end

	if GetFightState() ~= 1 or GetPKFlag() == 0 then
		Msg2Player("Ng��i ch�i ph�i � tr�ng th�i chi�n ��u m�i c� th� trang tr� c�y th�ng.")
		return
	end

	local nDate = tonumber(date("%Y%m%d"))
	if nDate > GetTask(TREE_DATE_08_XMAS_VIET) then
		SetTask(TREE_DATE_08_XMAS_VIET, nDate)
		SetTask(TREE_NUM_08_XMAS_VIET, 0)
	end

	if GetTask(TREE_NUM_08_XMAS_VIET) >= 10 then
		Msg2Player("M�i ng�y m�i ng��i ch� ���c trang tr� nhi�u nh�t 10 c�y th�ng.")
		return
	end

	if GetItemCount(2,1,30043) < 1 then
		Msg2Player("H�nh trang  c�a ��i hi�p v�n ch�a c� C�y K�o Gi�ng Sinh n�n kh�ng th� trang tr�  c�y th�ng gi�ng sinh ���c.")
		return
	end

	if GetUnitCurStates(nNpcIndex,2) ~= 1 or (GetTime() - GetUnitCurStates(nNpcIndex,1)) > PICK_TIME_08_XMAS_VIET then
		SetUnitCurStates(nNpcIndex,1,GetTime())
		SetUnitCurStates(nNpcIndex,2,1)
		DoWait(7,8,PICK_TIME_08_XMAS_VIET)				--�������
	else
		Talk(1,"","Hi�n t�i c�y th�ng n�y �� c� ng��i trang tr�.")
		return
	end
end

