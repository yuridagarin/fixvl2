--NPCĬ�϶Ի��ű�
Include("\\settings\\static_script\\meridian\\npc_meridian_level_update.lua")
Include("\\script\\meridian\\npc_meridian_restore.lua")
Include("\\settings\\static_script\\meridian\\meridian_title.lua")



function main()
	local tbSay = {};
	--tinsert(tbSay, format("Ta c�n k�ch ho�t c�nh gi�i kinh m�ch/onNpcTalkToUpdateMeridianLevel"))	--is KS
		tinsert(tbSay, format("Ta c�n k�ch ho�t c�nh gi�i kinh m�ch/onNpcTalkToUpdateMeridianLevel_vng"))
	--tinsert(tbSay, format("��Ҫϴ���׽�/OnNpcTalkToRestore"))
	tinsert(tbSay, format("Ta mu�n nh�n danh hi�u c�nh gi�i/#merdiantitle_check_add_title(1)"))
	tinsert(tbSay, "Ta ch� gh� ch�i/no")
	Say("<color=green>Nh�c B�t Qu�n: <color> ta c� th� gi�p ���c �i�u g�?",getn(tbSay),tbSay);
end

function no()
end

function onNpcTalkToUpdateMeridianLevel_vng()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("H� th�ng kinh m�ch v�n ch�a khai th�ng"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("Nh�c B�t Qu�n: L�o phu c� th� gi�p thi�u hi�p k�ch ho�t khai th�ng kinh m�ch, nh�ng �� k�ch ho�t c�nh gi�i kh�c nhau c� y�u c�u ti�u hao kh�c nhau, thi�u h�p c�n khai th�ng c�nh gi�i n�o?")
	
	local nCurOpenCount = 4
	for i = 1, nCurOpenCount do
		if i ~= 4 then
			local szTalk = format("K�ch ho�t %s c�nh gi�i %s", meridianlevel_getname(i), format("/#_onTalkToUpdateLevel(%d)", i))
			tinsert(tbSay, szTalk)
		else
			tinsert(tbSay, "K�ch ho�t V� T�n/vjw_MerdianIBActivate");
		end
	end

	tinsert(tbSay, "Ta ch� gh� ch�i/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _onTalkToUpdateLevel(nNewLevel)
	if not nNewLevel or nNewLevel < 1 or nNewLevel > 6 then
		return
	end
	local tbSay = {}
	local szTitle = format("Nh�c B�t Qu�n: ��t ��n %s ��ng th�i �� ��t c�nh gi�i %s, c� th� t�m ta khai th�ng c�nh gi�i %s. C�n ti�u hao <color=yellow>%s<color>. X�c ��nh th�c hi�n?"
		, meridianlevel_get_require_desc(nNewLevel)
		, meridianlevel_getname(nNewLevel - 1)
		, meridianlevel_getname(nNewLevel)
		, meridianlevel_get_ib_consume_desc(nNewLevel)
		)
	tinsert(tbSay, format("X�c ��nh/#_DoUpdateLevel(%d)", nNewLevel))
	tinsert(tbSay, format("tr� l�i/onNpcTalkToUpdateMeridianLevel_vng"))
	tinsert(tbSay, "Ta ch� gh� ch�i/no")
	Say(szTitle, getn(tbSay), tbSay)
end