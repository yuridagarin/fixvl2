Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if ZQ_GetCamp() ~= LIAO_ID then
		return 0;
	end
	if GetItemCount(ZQ_ITEM_FLAG[LIAO_ID][1], ZQ_ITEM_FLAG[LIAO_ID][2], ZQ_ITEM_FLAG[LIAO_ID][3]) < 1 then
		Say(format("<color=green>T�ng Ti�n Phong:<color> Thi�u hi�p tr�n ng��i kh�ng mang %s, kh�ng th� tr� v� doanh tr�i. C�c h� x�c ��nh b�t ��u chi�n ��u?", ZQ_ITEM_FLAG[LIAO_ID][4]), 2, "��ng �/xianfeng_dialog", "Ra khi/do_nothing")
		return 0;
	end
	xianfeng_dialog();
end

function xianfeng_dialog()
	local tSay = {
		"Ta mu�n l�n chi�n tr��ng t� c�a ch�nh/#fighting_start(1)",
		"Ta mu�n l�n chi�n tr��ng t� c�a ph�/#fighting_start(2)",
		"Ra khi/do_nothing",
	}
	Say("<color=green>Li�u Ti�n Phong:<color> thi�u hi�p mu�n �i ��nh 1 tr�n ho�nh tr�ng ch� kh�ng?", getn(tSay), tSay);
end

function fighting_start(nIndex)
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	local tPos = {
		{1850, 3360},
		{1843, 3243},
	};
	if nIndex < 1 or nIndex > getn(tPos) then return 0; end
	SetPos(tPos[nIndex][1], tPos[nIndex][2]);
	RestoreAll();
	SetFightState(1);
end

function do_nothing()
	--do nothing()
end