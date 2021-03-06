--NPC默认对话脚本
Include("\\settings\\static_script\\meridian\\npc_meridian_level_update.lua")
Include("\\script\\meridian\\npc_meridian_restore.lua")
Include("\\settings\\static_script\\meridian\\meridian_title.lua")



function main()
	local tbSay = {};
	--tinsert(tbSay, format("Ta c莕 k輈h ho箃 c秐h gi韎 kinh m筩h/onNpcTalkToUpdateMeridianLevel"))	--is KS
		tinsert(tbSay, format("Ta c莕 k輈h ho箃 c秐h gi韎 kinh m筩h/onNpcTalkToUpdateMeridianLevel_vng"))
	--tinsert(tbSay, format("我要洗髓易筋/OnNpcTalkToRestore"))
	tinsert(tbSay, format("Ta mu鑞 nh薾 danh hi謚 c秐h gi韎/#merdiantitle_check_add_title(1)"))
	tinsert(tbSay, "Ta ch? gh? ch琲/no")
	Say("<color=green>Nh筩 B蕋 Qu莕: <color> ta c? th? gi髉 頲 甶襲 g??",getn(tbSay),tbSay);
end

function no()
end

function onNpcTalkToUpdateMeridianLevel_vng()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("H? th鑞g kinh m筩h v蒼 ch璦 khai th玭g"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("Nh筩 B蕋 Qu莕: L穙 phu c? th? gi髉 thi誹 hi謕 k輈h ho箃 khai th玭g kinh m筩h, nh璶g  k輈h ho箃 c秐h gi韎 kh竎 nhau c? y猽 c莡 ti猽 hao kh竎 nhau, thi誹 h頿 c莕 khai th玭g c秐h gi韎 n祇?")
	
	local nCurOpenCount = 4
	for i = 1, nCurOpenCount do
		if i ~= 4 then
			local szTalk = format("K輈h ho箃 %s c秐h gi韎 %s", meridianlevel_getname(i), format("/#_onTalkToUpdateLevel(%d)", i))
			tinsert(tbSay, szTalk)
		else
			tinsert(tbSay, "K輈h ho箃 V? T玭/vjw_MerdianIBActivate");
		end
	end

	tinsert(tbSay, "Ta ch? gh? ch琲/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _onTalkToUpdateLevel(nNewLevel)
	if not nNewLevel or nNewLevel < 1 or nNewLevel > 6 then
		return
	end
	local tbSay = {}
	local szTitle = format("Nh筩 B蕋 Qu莕: t n %s ng th阨  t c秐h gi韎 %s, c? th? t譵 ta khai th玭g c秐h gi韎 %s. C莕 ti猽 hao <color=yellow>%s<color>. X竎 nh th鵦 hi謓?"
		, meridianlevel_get_require_desc(nNewLevel)
		, meridianlevel_getname(nNewLevel - 1)
		, meridianlevel_getname(nNewLevel)
		, meridianlevel_get_ib_consume_desc(nNewLevel)
		)
	tinsert(tbSay, format("X竎 nh/#_DoUpdateLevel(%d)", nNewLevel))
	tinsert(tbSay, format("tr? l筰/onNpcTalkToUpdateMeridianLevel_vng"))
	tinsert(tbSay, "Ta ch? gh? ch琲/no")
	Say(szTitle, getn(tbSay), tbSay)
end