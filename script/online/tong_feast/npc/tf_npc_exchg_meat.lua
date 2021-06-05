Include("\\script\\online\\tong_feast\\tf_define.lua")
Include("\\script\\lib\\globalfunctions.lua")

T_EXCHG_ITEM = {
		TF_ITEM_SHEEP,
		TF_ITEM_PIG,
		TF_ITEM_COW,
		TF_ITEM_BACON,
}
		
function npc_talk_exchg_meat()
--	local nDate = tonumber(date("%Y%m%d"))
--	if nDate < 20140315 or nDate > 20140430 then
--		Talk(1, "", format("Ph��ng th�c ��i �� qu� h�n"));
--		return
--	end
	local tSay = {
		"���c/_confirm_exchg",
		"H�y b�/nothing",
	}
	Say("C� th� s� d�ng 1 th�t l�n, 1 th�t b�, 1 th�t hun kh�i ��i 3 th�t d�, mu�n ��i kh�ng?", getn(tSay), tSay);
end


function _confirm_exchg()
	local nCount = _get_max_exchg_cnt()
	AskClientForNumber("_confirm_exchg_num", 1, nCount, "H�y nh�p s� l��ng d�ng t�ng:", "");
end

function _confirm_exchg_num(nNum)
	local nCount = _get_max_exchg_cnt()
	if nCount < nNum then
		return
	end
	if gf_Judge_Room_Weight(getn(T_EXCHG_ITEM)-1, 0, " ") ~= 1 then
		return 0;
	end
	for i= 2, getn(T_EXCHG_ITEM) do
		if DelItem(T_EXCHG_ITEM[i][1], T_EXCHG_ITEM[i][2], T_EXCHG_ITEM[i][3], nNum) ~= 1 then
			Talk(1, "", format("Kh�ng �� %s",T_EXCHG_ITEM[i][4]));
			return 0;
		end
	end
	local nGain = nNum*(getn(T_EXCHG_ITEM)-1)
	AddItem(T_EXCHG_ITEM[1][1], T_EXCHG_ITEM[1][2], T_EXCHG_ITEM[1][3], nGain)
	Msg2Player(format("��i th�nh c�ng %d%s",nGain, T_EXCHG_ITEM[1][4]))
	WriteLog(GetName().." exchange tong_frest yangrou: "..nGain);
end

function _get_max_exchg_cnt()
	local nCount = 999
	for i= 2, getn(T_EXCHG_ITEM) do
		local _nCnt = GetItemCount(T_EXCHG_ITEM[i][1], T_EXCHG_ITEM[i][2], T_EXCHG_ITEM[i][3])
		if _nCnt < nCount then
			nCount = _nCnt
		end
	end
	return nCount
end

function nothing()
end