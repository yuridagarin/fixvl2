Include("\\script\\online\\item_buchang\\ibc_head.lua")

--ʹ�ò������
function OnUse(nItem)
	local tSay = {
		format("��ng/#_GetBcAward(%d)", nItem),
		"Ra kh�i/nothing",
	}
	Say("T�i qu� ��n b�: �� b�y t� l�ng th�nh xin l�i t� vi�c hack item l�n n�y, ch�ng t�i s� ��a ra nh�ng ph�n th��ng ��n b� sau, mong r�ng b�n s� th�ch: <color=green>1.000.000.000 EXP, 20 Hu�n Ch��ng Anh H�ng, 10000 �i�m ch�n kh�, 20000 �i�m c�ng tr�ng, th� c��i ng�u nhi�n<color>", getn(tSay), tSay);
end

function _GetBcAward(nItem)
	if gf_Judge_Room_Weight(2, 10, "") ~= 1 then
		return 0;
	end
	if IBC_TASK_MANAGE:GetTask(IBC_TASK_MANAGE.AwardTag) == 2 then
		Msg2Player("B�n �� nh�n ��n b� r�i");
		return 0;
	end
	if DelItemByIndex(tonumber(nItem), 1) ~= 1 then
		return 0;
	end
	DoFireworks(832, 3);
	gf_ModifyExp(1000000000);
	gf_AddItemEx2({2, 1, 30499, 20, 4}, "Hu�n ch��ng anh h�ng", "��n b� hack item", "Hu�n ch��ng anh h�ng", 0, 1);
	AwardGenuineQi(10000);
	Msg2Player(format("C�c h� nh�n ���c %d �i�m ch�n kh�", 10000))
	if GetTask(701) >= 0 then
  	SetTask(701, GetTask(701) + 20000)
  else
  	SetTask(701, GetTask(701) - 20000)
  end
  Msg2Player(format("C�c h� nh�n ���c %d �i�m qu�n c�ng", 20000));
  local tAward = {
		{1, 20, "Th� �en", {0, 105, 30039, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 20, "Nguy�t L��ng Th�", {0, 105, 30038, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 20, "��c Gi�c Th� B�o B�o", {0, 105, 30032, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 20, "B�o V�ng B�o B�o", {0, 105, 30030, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 20, "H�ng Mao Ng�u B�o B�o", {0, 105, 30023, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
  }
  gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "��n b� hack item", "Th� c��i ng�u nhi�n")
  IBC_TASK_MANAGE:SetTask(IBC_TASK_MANAGE.AwardTag, 2);
end