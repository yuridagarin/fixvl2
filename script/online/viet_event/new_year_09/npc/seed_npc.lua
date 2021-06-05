--File name:	seed_npc.lua
--Describe:		���ڻ�Ҹ�����npc�ű�
--Create Date:	2008-12-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\new_year_09\\new_year_func.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")


g_szLogTitle = "Hoat dong Tet 2009"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szFileName = "seed_npc.lua"						--�ļ���


function main()
	if is_new_year_09_viet_open() == 0 then
		Msg2Player("Ho�t ��ng t�t �� k�t th�c.")
		return
	end

	local nNpcIndex = GetTargetNpc()
	if nNpcIndex <= 0 then
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "In file "..g_szFileName..", function GetTargetNpc() return value <= 0")
		return
	end
	SetTaskTemp(SEED_INDEX_09_NEWYEAR_VIET, nNpcIndex)

	if gf_Judge_Room_Weight(1, 20) == 0 then
		Msg2Player("Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end

	if GetLevel() < 10 then
		Msg2Player("Ch� c� ng��i ch�i c�p 10 tr� l�n m�i thu th�p ���c h�t gi�ng h�nh ph�c.")
		return
	end

	if GetPlayerRoute() == 0 then
		Msg2Player("Ng��i ch�i kh�ng m�n ph�i kh�ng th� thu th�p h�t gi�ng h�nh ph�c.")
		return
	end

	if GetItemCount(2,1,30058) < 1 then
		Msg2Player("��i hi�p v�n ch�a c� bao tay thu th�p n�n kh�ng th� ��o h�t gi�ng h�nh ph�c ���c.")
		return
	end

	if GetUnitCurStates(nNpcIndex,2) ~= 1 or (GetTime() - GetUnitCurStates(nNpcIndex,1)) > PICK_TIME_09_NEWYEAR_VIET then
		SetUnitCurStates(nNpcIndex,1,GetTime())
		SetUnitCurStates(nNpcIndex,2,1)
		DoWait(7,8,PICK_TIME_09_NEWYEAR_VIET)				--�������
	else
		Talk(1,"","Hi�n t�i �� c� ng��i ch�i �ang thu th�p h�t gi�ng h�nh ph�c n�y.")
		return
	end
end

