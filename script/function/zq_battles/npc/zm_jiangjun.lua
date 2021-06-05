Include("\\script\\function\\zq_battles\\zq_define.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")

--���ɽ���
function main()
	local tSay = {};
	local nCamp = ZQ_GetCamp();
	local tName = {
		[SONG_ID] = "T�ng T��ng Qu�n",
		[LIAO_ID] = "Li�u T��ng Qu�n",
	}
	if tName[nCamp] ~= GetNpcName(GetTargetNpc()) then
		return 0;
	end
	if nCamp == SONG_ID then
		tSay = ZQ_TaskDialog(1, 3);
	elseif nCamp == LIAO_ID then
		tSay = ZQ_TaskDialog(2, 3);
	end
	tinsert(tSay, "\nTa mu�n r�i kh�i ��y/leave_zq_battle");
	tinsert(tSay,	"T�i h� ch� xem qua th�i/do_nothing");
	Say(format("<color=green>%s:<color>",GetNpcName(GetTargetNpc())).."Thi�u hi�p c�n gi�p �� g� kh�ng?", getn(tSay), tSay);
end

function leave_zq_battle()
	Say(format("<color=green>%s:<color>",GetNpcName(GetTargetNpc())).."X�c ��nh r�i kh�i n�i n�y?", 2, "\nX�c nh�n/leave_ensure", "\n r�t lui/do_nothing");
end

function leave_ensure()
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	local nCamp = ZQ_GetCamp();
	if nCamp == LIAO_ID or nCamp == SONG_ID then
		DelItem(ZQ_ITEM_FLAG[nCamp][1], ZQ_ITEM_FLAG[nCamp][2], ZQ_ITEM_FLAG[nCamp][3], 1);
	end
	if 1 == NewWorld(ZQ_EXIT_POS[1], ZQ_EXIT_POS[2], ZQ_EXIT_POS[3]) then
		ZQ_ResetPlayerState();
	end
end

function do_nothing()
	--do nothing
end