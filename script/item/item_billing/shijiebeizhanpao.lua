------------------------------------------------------------
-- ���籭ս�۵Ľű� shijiebeizhanpao.lua
--
-- comment: �򿪺���һ��ָ�������籭ս��
-- creator: Tony(Jizheng)
-- Date   : Jul 31st, 2006
--
-- Item ID:  2,1,505
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("Ng��i mu�n m� tay n�i l�y <color=yellow>Th� Gi�i chi�n b�o<color> ra kh�ng? Xin h�i ng��i c�n lo�i chi�n b�o n�o?",
		5,
		"Ta c�n Ti�u Chu�n chi�n b�o/need_normal_suit",
		"Ta c�n Kh�i Ng� chi�n b�o/need_strong_suit",
		"Ta c�n G�i C�m chi�n b�o/need_sexy_suit",
		"Ta c�n Ki�u n� chi�n b�o/need_amortta_suit",
		"T�m th�i kh�ng m�--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ��Ҫ��׼���͵�ս��
function need_normal_suit()
	Say("Ng��i c�n lo�i chi�n b�o n�o? T�t c� c� 10 b� chi�n b�o �� ch�n:",
		7,
		"T�m th�i kh�ng c�n/cancel_dialog",
		"��c � chi�n b�o/need_normal_germany",
		"Tang Ba chi�n b�o/need_normal_brazil",
		"A C�n chi�n b�o/need_normal_argentina",
		"B�t Di�t chi�n b�o/need_normal_england",
		"T� T�t chi�n b�o/need_normal_italy",
		"C�n 5 b�, xin xem trang sau/need_normal_suit_page2")
end;
function need_normal_suit_page2()
	Say("Ng��i c�n lo�i chi�n b�o n�o? T�t c� c� 10 b� chi�n b�o �� ch�n:",
		7,
		"C�n 5 b�, xin xem trang tr��c/need_normal_suit",
		"�i Phi chi�n b�o/need_normal_france",
		"Phong Xa chi�n b�o/need_normal_holland",
		"��u Ng�u chi�n b�o/need_normal_spain",
		"B� Qu�c chi�n b�o/need_normal_portugel",
		"Ti�p Kh�ch chi�n b�o/need_normal_szech",
		"T�m th�i kh�ng c�n/cancel_dialog")
end;
-- ��׼�͵�10���·�
function need_normal_germany()
	-- ����ս��	0, 109, 133
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 133, 1)
		Say("B�n nh�n ���c <color=yellow>��c � chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c ��c � chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_normal_brazil()
	-- ɣ��ս��	0, 109, 137
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 137, 1)
		Say("B�n nh�n ���c <color=yellow>Tang Ba chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c Tang Ba chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_normal_argentina()
	-- ����ս��	0, 109, 141
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 141, 1)
		Say("B�n nh�n ���c <color=yellow>A C�n chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c A C�n chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_normal_england()
	-- ���е�ս�� 0, 109, 145
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 145, 1)
		Say("B�n nh�n ���c <color=yellow>B�t Di�t chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c B�t Di�t chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_normal_italy()
	-- ����ս��	0, 109, 149
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 149, 1)
		Say("B�n nh�n ���c <color=yellow>T� T�t chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c T� T�t chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_normal_france()
	-- ���ƶ�ս�� 0, 109, 153
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 153, 1)
		Say("B�n nh�n ���c <color=yellow>�i Phi chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c �i Phi chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_normal_holland()
	-- �糵ս��	0, 109, 157
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 157, 1)
		Say("B�n nh�n ���c <color=yellow>Phong Xa chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c Phong Xa chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_normal_spain()
	-- ��ţս��	0, 109, 161
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 161, 1)
		Say("B�n nh�n ���c <color=yellow>��u Ng�u chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c ��u Ng�u chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_normal_portugel()
	-- �Ϲ�ս��	0, 109, 165
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 165, 1)
		Say("B�n nh�n ���c <color=yellow>B� Qu�c chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c B� Qu�c chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_normal_szech()
	-- �ݿ�ս��	0, 109, 169
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 169, 1)
		Say("B�n nh�n ���c <color=yellow>Ti�p Kh�ch chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c Ti�p Kh�ch chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;



-- ��Ҫ�������͵�ս��
function need_strong_suit()
	Say("Ng��i c�n lo�i chi�n b�o n�o? T�t c� c� 10 b� chi�n b�o �� ch�n:",
		7,
		"T�m th�i kh�ng c�n/cancel_dialog",
		"��c � chi�n b�o/need_strong_germany",
		"Tang Ba chi�n b�o/need_strong_brazil",
		"A C�n chi�n b�o/need_strong_argentina",
		"B�t Di�t chi�n b�o/need_strong_england",
		"T� T�t chi�n b�o/need_strong_italy",
		"C�n 5 b�, xin xem trang sau/need_strong_suit_page2")
end;
function need_strong_suit_page2()
	Say("Ng��i c�n lo�i chi�n b�o n�o? T�t c� c� 10 b� chi�n b�o �� ch�n:",
		7,
		"C�n 5 b�, xin xem trang tr��c/need_strong_suit",
		"�i Phi chi�n b�o/need_strong_france",
		"Phong Xa chi�n b�o/need_strong_holland",
		"��u Ng�u chi�n b�o/need_strong_spain",
		"B� Qu�c chi�n b�o/need_strong_portugel",
		"Ti�p Kh�ch chi�n b�o/need_strong_szech",
		"T�m th�i kh�ng c�n/cancel_dialog")
end;
-- �����͵�10���·�
function need_strong_germany()
	-- ����ս��	0, 109, 134
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 134, 1)
		Say("B�n nh�n ���c <color=yellow>��c � chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c ��c � chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_strong_brazil()
	-- ɣ��ս��	0, 109, 138
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 138, 1)
		Say("B�n nh�n ���c <color=yellow>Tang Ba chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c Tang Ba chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_strong_argentina()
	-- ����ս��	0, 109, 142
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 142, 1)
		Say("B�n nh�n ���c <color=yellow>A C�n chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c A C�n chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_strong_england()
	-- ���е�ս�� 0, 109, 146
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 146, 1)
		Say("B�n nh�n ���c <color=yellow>B�t Di�t chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c B�t Di�t chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_strong_italy()
	-- ����ս��	0, 109, 150
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 150, 1)
		Say("B�n nh�n ���c <color=yellow>T� T�t chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c T� T�t chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_strong_france()
	-- ���ƶ�ս�� 0, 109, 154
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 154, 1)
		Say("B�n nh�n ���c <color=yellow>�i Phi chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c �i Phi chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_strong_holland()
	-- �糵ս��	0, 109, 158
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 158, 1)
		Say("B�n nh�n ���c <color=yellow>Phong Xa chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c Phong Xa chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_strong_spain()
	-- ��ţս��	0, 109, 162
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 162, 1)
		Say("B�n nh�n ���c <color=yellow>��u Ng�u chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c ��u Ng�u chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_strong_portugel()
	-- �Ϲ�ս��	0, 109, 166
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 166, 1)
		Say("B�n nh�n ���c <color=yellow>B� Qu�c chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c B� Qu�c chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_strong_szech()
	-- �ݿ�ս��	0, 109, 170
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 170, 1)
		Say("B�n nh�n ���c <color=yellow>Ti�p Kh�ch chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c Ti�p Kh�ch chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;



-- ��Ҫ�Ը����͵�ս��
function need_sexy_suit()
	Say("Ng��i c�n lo�i chi�n b�o n�o? T�t c� c� 10 b� chi�n b�o �� ch�n:",
		7,
		"T�m th�i kh�ng c�n/cancel_dialog",
		"��c � chi�n b�o/need_sexy_germany",
		"Tang Ba chi�n b�o/need_sexy_brazil",
		"A C�n chi�n b�o/need_sexy_argentina",
		"B�t Di�t chi�n b�o/need_sexy_england",
		"T� T�t chi�n b�o/need_sexy_italy",
		"C�n 5 b�, xin xem trang sau/need_sexy_suit_page2")
end;
function need_sexy_suit_page2()
	Say("Ng��i c�n lo�i chi�n b�o n�o? T�t c� c� 10 b� chi�n b�o �� ch�n:",
		7,
		"C�n 5 b�, xin xem trang tr��c/need_sexy_suit",
		"�i Phi chi�n b�o/need_sexy_france",
		"Phong Xa chi�n b�o/need_sexy_holland",
		"��u Ng�u chi�n b�o/need_sexy_spain",
		"B� Qu�c chi�n b�o/need_sexy_portugel",
		"Ti�p Kh�ch chi�n b�o/need_sexy_szech",
		"T�m th�i kh�ng c�n/cancel_dialog")
end;
-- �����͵�10���·�
function need_sexy_germany()
	-- ����ս��	0, 109, 135
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 135, 1)
		Say("B�n nh�n ���c <color=yellow>��c � chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c ��c � chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_sexy_brazil()
	-- ɣ��ս��	0, 109, 139
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 139, 1)
		Say("B�n nh�n ���c <color=yellow>Tang Ba chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c Tang Ba chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_sexy_argentina()
	-- ����ս��	0, 109, 143
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 143, 1)
		Say("B�n nh�n ���c <color=yellow>A C�n chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c A C�n chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_sexy_england()
	-- ���е�ս�� 0, 109, 147
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 147, 1)
		Say("B�n nh�n ���c <color=yellow>B�t Di�t chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c B�t Di�t chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_sexy_italy()
	-- ����ս��	0, 109, 151
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 151, 1)
		Say("B�n nh�n ���c <color=yellow>T� T�t chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c T� T�t chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_sexy_france()
	-- ���ƶ�ս�� 0, 109, 155
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 155, 1)
		Say("B�n nh�n ���c <color=yellow>�i Phi chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c �i Phi chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_sexy_holland()
	-- �糵ս��	0, 109, 159
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 159, 1)
		Say("B�n nh�n ���c <color=yellow>Phong Xa chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c Phong Xa chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_sexy_spain()
	-- ��ţս��	0, 109, 163
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 163, 1)
		Say("B�n nh�n ���c <color=yellow>��u Ng�u chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c ��u Ng�u chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_sexy_portugel()
	-- �Ϲ�ս��	0, 109, 167
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 167, 1)
		Say("B�n nh�n ���c <color=yellow>B� Qu�c chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c B� Qu�c chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_sexy_szech()
	-- �ݿ�ս��	0, 109, 171
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 171, 1)
		Say("B�n nh�n ���c <color=yellow>Ti�p Kh�ch chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c Ti�p Kh�ch chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;



-- ��Ҫ��С���͵�ս��
function need_amortta_suit()
	Say("Ng��i c�n lo�i chi�n b�o n�o? T�t c� c� 10 b� chi�n b�o �� ch�n:",
		7,
		"T�m th�i kh�ng c�n/cancel_dialog",
		"��c � chi�n b�o/need_amortta_germany",
		"Tang Ba chi�n b�o/need_amortta_brazil",
		"A C�n chi�n b�o/need_amortta_argentina",
		"B�t Di�t chi�n b�o/need_amortta_england",
		"T� T�t chi�n b�o/need_amortta_italy",
		"C�n 5 b�, xin xem trang sau/need_amortta_suit_page2")
end;
function need_amortta_suit_page2()
	Say("Ng��i c�n lo�i chi�n b�o n�o? T�t c� c� 10 b� chi�n b�o �� ch�n:",
		7,
		"C�n 5 b�, xin xem trang tr��c/need_amortta_suit",
		"�i Phi chi�n b�o/need_amortta_france",
		"Phong Xa chi�n b�o/need_amortta_holland",
		"��u Ng�u chi�n b�o/need_amortta_spain",
		"B� Qu�c chi�n b�o/need_amortta_portugel",
		"Ti�p Kh�ch chi�n b�o/need_amortta_szech",
		"T�m th�i kh�ng c�n/cancel_dialog")
end;
-- �����͵�10���·�
function need_amortta_germany()
	-- ����ս��	0, 109, 136
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 136, 1)
		Say("B�n nh�n ���c <color=yellow>��c � chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c ��c � chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_amortta_brazil()
	-- ɣ��ս��	0, 109, 140
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 140, 1)
		Say("B�n nh�n ���c <color=yellow>Tang Ba chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c Tang Ba chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_amortta_argentina()
	-- ����ս��	0, 109, 144
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 144, 1)
		Say("B�n nh�n ���c <color=yellow>A C�n chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c A C�n chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_amortta_england()
	-- ���е�ս�� 0, 109, 148
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 148, 1)
		Say("B�n nh�n ���c <color=yellow>B�t Di�t chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c B�t Di�t chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_amortta_italy()
	-- ����ս��	0, 109, 152
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 152, 1)
		Say("B�n nh�n ���c <color=yellow>T� T�t chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c T� T�t chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_amortta_france()
	-- ���ƶ�ս�� 0, 109, 156
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 156, 1)
		Say("B�n nh�n ���c <color=yellow>�i Phi chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c �i Phi chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_amortta_holland()
	-- �糵ս��	0, 109, 160
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 160, 1)
		Say("B�n nh�n ���c <color=yellow>Phong Xa chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c Phong Xa chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_amortta_spain()
	-- ��ţս��	0, 109, 164
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 164, 1)
		Say("B�n nh�n ���c <color=yellow>��u Ng�u chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c ��u Ng�u chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_amortta_portugel()
	-- �Ϲ�ս��	0, 109, 168
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 168, 1)
		Say("B�n nh�n ���c <color=yellow>B� Qu�c chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c B� Qu�c chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;
function need_amortta_szech()
	-- �ݿ�ս��	0, 109, 172
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 172, 1)
		Say("B�n nh�n ���c <color=yellow>Ti�p Kh�ch chi�n b�o<color>!", 0)
		Msg2Player("B�n nh�n ���c Ti�p Kh�ch chi�n b�o!")
	else
		Say("B�n kh�ng c� <color=yellow>Tay n�i th� gi�i chi�n b�o<color>, kh�ng th� ��i ���c!", 0)
	end
end;


