--=============================================
--create by baiyun 2009.8.24
--describe:Խ�ϰ�9�·������������ű�
--=============================================
Include("\\script\\online\\viet_event\\200909\\event_head.lua")
function main()
	do return end
	local tb_dialog = {
		"T�i h� mu�n nh�n B�ch B�o R��ng/get_baibaoxiang",
		"T�i h� mu�n nh�n 1 C�m nang ��i s� ki�n/get_jinnang",
		"K�t th�c ��i tho�i/nothing",
	};
	Say("<color=green>Qu�n l� b�o r��ng: <color>S� ki�n B�ch B�o R��ng di�n ra t� 19-09-2009 ��n 24:00 25-10-2009. Trong th�i gian ho�t ��ng, m�i ng�y c�c h� c� th� nh�n mi�n ph� 1 B�ch B�o R��ng. R��ng th� c� th� mua th�m t� Ng� C�c . B�ch B�o R��ng l� n�i c�t gi� t�an b� nh�ng v�t ph�m c�a v� l�m t� nguy�n li�u, v�t ph�m thu th�p, d��c ph�m, trang b�, v� kh� �<enter>L�u � l� m�i nh�n v�t ch� c� th� nh�n mi�n ph� 1 B�ch B�o R��ng trong 1 ng�y v� m�i ng�y ch� c� th� m� t�i �a 8 B�ch B�o R��ng", getn(tb_dialog), tb_dialog);
end

function get_baibaoxiang()
	local nDate = tonumber(date("%y%m%d"));
	if GetLevel() < 70 then
		Talk(1, "", "<color=green>Qu�n l� b�o r��ng: <color>C�p 70 tr� l�n m�i c� th� nh�n B�ch B�o R��ng. Thi�u hi�p h�y c� g�ng th�m nh�!");
		return 0;
	end
	if GetTask(VIET_0909_TASK_GET_BOX_DATE) >= nDate then
		Talk(1, "", "<color=green>Qu�n l� b�o r��ng: <color>H�m nay thi�u hi�p �� nh�n R��ng r�i, kh�ng th� nh�n th�m ���c n�a.");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1, "<color=green>Qu�n l� b�o r��ng: <color>") ~= 1 then 
		return 0;
	end
	local nRetCode, nIndex = gf_AddItemEx({2, 1, 30111, 1}, "B�ch B�o R��ng");
	if nRetCode == 1 then
		SetItemExpireTime(nIndex, 15 * 24 * 3600);
		SetTask(VIET_0909_TASK_GET_BOX_DATE, nDate);
	end
end

function get_jinnang()
	if GetItemCount(2, 1, 30045) >= 1 then
		Talk(1, "", "<color=green>Qu�n l� b�o r��ng:<color>C�c h� �� nh�n C�m nang ��i s� ki�n r�i, kh�ng th� nh�n th�m ���c n�a.");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1, "<color=green>Qu�n l� b�o r��ng: <color>") ~= 1 then 
		return 0;
	end
	gf_AddItemEx({2, 1, 30045, 1}, "C�m Nang ��i S� Ki�n");
end

function nothing()

end