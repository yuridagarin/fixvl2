Include("\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua")
Include("\\script\\missions\\tong_melee\\npc\\tm_main_npc.lua")
Include("\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua")
Include("\\script\\missions\\eyt_battle\\join_npc.lua")
Include("\\settings\\static_script\\kf_newbattles\\sign_up_npc_kf.lua")
Include("\\script\\system_switch_config.lua")

function main()
	local tbSay = {}
	local szTitle = "C� th� nh�n th��ng li�n server � ��y, ng��i mu�n nh�n ph�n th��ng g�?"
	tinsert(tbSay, format("%s/#get_award(1)", "Chi�n tr��ng li�n ��u"))
	tinsert(tbSay, format("%s/#get_award(2)", "Lo�n chi�n bang h�i"))
	--tinsert(tbSay, format("%s/#get_award(3)", "����������"))
	--tinsert(tbSay, format("%s/#get_award(4)", "�����ᵥ����"))
	tinsert(tbSay, format("%s/#get_award(5)", "Chi�n Tr��ng �n O�n ��i"))
	tinsert(tbSay, format("\n%s/nothing", "Ra kh�i"))
	Say(szTitle, getn(tbSay), tbSay)
end

function get_award(nType)
	if 1 == nType then
		if IsKfNewBattleOpen() ~= 0 then
			get_kf_pt_award() --�����˿����̨ս
			return 0;
		end
		jyr_main_lingjiang()
	elseif 2 == nType then
		tm_award_tong_melee()
	elseif 3 == nType then
		SendScript2Client("Open([[XvxRank]])");
	elseif 4 == nType then
		main_bwdh_award()
	elseif 5 == nType then
		main_eyt_award()
	end
end

function nothing()
end