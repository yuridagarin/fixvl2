--��������
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if gf_GetTaskBit(ZQ_BATTLE_TASK11, 17) ~= 1 then
		return 0;
	end
	local tSay = {
		"B�t ��u tu s�a/begin_repair_real",
		"\nT� b�/give_up_exit",
		"T�i h� ch� xem qua th�i/do_nothing",
	}
	if GetTrigger(1523 * 2) ~= 0 then
		tremove(tSay, 1);
	end
	Say(format("<color=green>C�nh M�n Tr�n Linh: <color>Phong �n tr�n C�nh M�n �� v� c�ng y�u r�i, n�u kh�ng tu s�a l�i, ma kh� s� tr�n ra ngo�i. Hi�n ta kh�ng th� r�i kh�i �� thu th�p c�c nguy�n li�u tu s�a, %s c� th� gi�p ta t�m c�c nguy�n li�u kh�ng? N�u c�c h� c� mang theo Ma Th�ch, c� th� d�ng Ma Th�ch k�o d�i th�i gian t�m nguy�n li�u. Nguy�n li�u d�ng �� tu s�a r�i r�i r�c xung quanh tr�n nh�n, tr��c ti�n c�n t�m hi�u ��i kh�i v� c�c nguy�n li�u ph�n b� r�i r�c n�y, sau �� h�y b�t ��u h� tr� tu s�a, t� l� th�nh c�ng s� cao h�n.", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function begin_repair_real()
	ZQ_RepairReal();
end

function give_up_exit()
	ZQ_RepairReal_GiveUp()
end

function do_nothing()
end