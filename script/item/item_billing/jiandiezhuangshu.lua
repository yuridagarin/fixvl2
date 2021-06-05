Include("\\script\\newbattles\\functions.lua");

function OnUse(nItemIdx)
	local nCurJunGongMul = BT_GetData(PT_MULTIPLE_JUNGONG);
	if nCurJunGongMul ~= 0 then	--��ǰ�о�����Ч��
		Talk(1,"","Huy hi�u chi�n c�ng v� m�t n� gian �i�p kh�ng th� c�ng s� d�ng, n�u mu�n s� d�ng m�t n� gi�n �i�p ph�i h�y t�c c�ng hi�u c�a huy hi�u chi�n c�ng");
		return 0;
	end;
	local nLastTime = BT_GetData(PT_SPYCLOTH_TIME)
	local nTimePassed = GetTime() - nLastTime;
	local selTab = {
				format("��ng �/#use(%d)",nItemIdx),
				"H�y b�",
				}
	local sString = "";
	if nTimePassed >= ITEM_SPYCLOTH_TIME then
		sString = "M�t n� gi�n �i�p hi�n c�n: <color=yellow>0 gi�y<color>.";
	else
		sString = "M�t n� gi�n �i�p c�n: <color=yellow>"..tf_GetTimeString(ITEM_SPYCLOTH_TIME-nTimePassed).."<color>.";
	end;
	Say("Ng��i mu�n s� d�ng m�t n� gi�n �i�p ch�?"..sString.."S� d�ng ch� �:\n1: <color=red>Th�i gian k�o d�i hi�u qu� c�a Gi�n �i�p trang l� 3h, kh�ng c�ng d�n<color>\n2: <color=red>Trong th�i gian Gi�n �i�p trang c�n hi�u qu� kh�ng �nh h��ng qu�n c�ng c�a b�t k� phe n�o, b�n c� th� v�o phe ��ch.<color>\n3: <color=red>Nh�n ph�n th��ng chi�n tr��ng s� h�y hi�u qu� c�a Gi�n �i�p trang.<color>",getn(selTab),selTab);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		BT_SetData(PT_SPYCLOTH_TIME,GetTime());
		Say("B�n �� d�ng Gi�n �i�p trang, <color=yellow>trong 3h<color> kh�ng �nh h��ng qu�n c�ng c�a b�t k� phe n�o, b�n c� th� v�o phe ��ch.",0);
		Msg2Player("B�n s� d�ng m�t n� gi�n �i�p")
		WriteLog("[Chi�n tr��ng Nh�n M�n Quan]:"..GetName().." s� d�ng m�t n� gi�n �i�p");
	end;
end;