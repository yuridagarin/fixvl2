--File name:	xmas_tree_npc.lua
--Describe:		圣诞树(野外地图)npc脚本
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")


g_szLogTitle = "Giang Sinh 2008"		--此处分为2段只是为了不增加新的翻译
g_szFileName = "xmas_tree_npc.lua"						--文件名


function main()
	if is_xmas_08_viet_open() == 0 then
		return
	end

	local nNpcIndex = GetTargetNpc()
	if nNpcIndex <= 0 then
		WriteLogEx(g_szLogTitle, "C﹜ Th玭g Gi竛g Sinh (ngo筰 th祅h)", "NULL", "NULL", "NULL", GetTongName(), "In file "..g_szFileName..", function GetTargetNpc() return value <= 0")
		return
	end
	SetTaskTemp(TREE_INDEX_08_XMAS_VIET, nNpcIndex)

	if gf_Judge_Room_Weight(1, 20) == 0 then
		Msg2Player("Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end

	if GetLevel() < 10 then
		Msg2Player("Ph秈 t ng c蕄 10 tr? l猲 m韎 c? th? trang tr? c﹜ th玭g")
		return
	end

	if GetPlayerRoute() == 0 then
		Msg2Player("Ch璦 v祇 m玭 ph竔 kh玭g th? trang tr? c﹜ th玭g.")
		return
	end

	if GetFightState() ~= 1 or GetPKFlag() == 0 then
		Msg2Player("Ngi ch琲 ph秈 ? tr筺g th竔 chi課 u m韎 c? th? trang tr? c﹜ th玭g.")
		return
	end

	local nDate = tonumber(date("%Y%m%d"))
	if nDate > GetTask(TREE_DATE_08_XMAS_VIET) then
		SetTask(TREE_DATE_08_XMAS_VIET, nDate)
		SetTask(TREE_NUM_08_XMAS_VIET, 0)
	end

	if GetTask(TREE_NUM_08_XMAS_VIET) >= 10 then
		Msg2Player("M鏸 ng祔 m鏸 ngi ch? 頲 trang tr? nhi襲 nh蕋 10 c﹜ th玭g.")
		return
	end

	if GetItemCount(2,1,30043) < 1 then
		Msg2Player("H祅h trang  c馻 i hi謕 v蒼 ch璦 c? C﹜ K裲 Gi竛g Sinh n猲 kh玭g th? trang tr?  c﹜ th玭g gi竛g sinh 頲.")
		return
	end

	if GetUnitCurStates(nNpcIndex,2) ~= 1 or (GetTime() - GetUnitCurStates(nNpcIndex,1)) > PICK_TIME_08_XMAS_VIET then
		SetUnitCurStates(nNpcIndex,1,GetTime())
		SetUnitCurStates(nNpcIndex,2,1)
		DoWait(7,8,PICK_TIME_08_XMAS_VIET)				--进入调用
	else
		Talk(1,"","Hi謓 t筰 c﹜ th玭g n祔  c? ngi trang tr?.")
		return
	end
end

