------------------------------------------------------------
-- Ů派�ʯ�Ľű� nvwajingshi.lua
--
-- comment: ȡ���ؼ�������һ����Ҫ��
-- creator: Tony(Jizheng)
-- Date   : Jul 20th, 2006
--
-- Item ID: 2,1,504
------------------------------------------------------------

ADDENDAR_GENRE = 2
ADDENDAR_DETAIL = 6

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	if IsBookLocked() > 0 then
		Say("M�t t�ch �ang � tr�ng th�i ��ng, kh�ng th� d�ng N� Oa tinh th�ch l�y b� ki�p ra!", 0)
		return
	end
	
	strTab = {"Sau khi s� d�ng <color=yellow>N� Oa tinh th�ch<color> s� tr� 1 quy�n b� ki�p trong m�t t�ch c�a trang b� hi�n c�. B�n mu�n b� b� ki�p n�o trong m�t t�ch?",
			  "Ta kh�ng l�y--H�y b�/cancel_dialog"}
			  
	local strAddendar = {"", "", "", ""}
	local nAddendarID = {-1, -1, -1, -1}
	local nAddendarCount = 0
	for i = 0, 3 do
		strAddendar[i + 1], nAddendarID[i + 1] = GetBookAddendarName(i)
		if (nAddendarID[i + 1] ~= -1) then
			nAddendarCount = nAddendarCount + 1
		end
	end
	
	-- û�о�ҪҪȡ��
	if (nAddendarCount == 0) then
		Say("Hi�n t�i b�n kh�ng th� nh�n b� ki�p!", 0)
	end
	
	-- ֻ��һ����Ҫ����ȡ��
	if (nAddendarCount == 1) then
		if (nAddendarID[1] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu�n nh�n b� ki�p"..strAddendar[1].."/get_addendar_1",
				strTab[2])
		end
		if (nAddendarID[2] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu�n nh�n b� ki�p"..strAddendar[2].."/get_addendar_2",
				strTab[2])
		end
		if (nAddendarID[3] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu�n nh�n b� ki�p"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end
		if (nAddendarID[4] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu�n nh�n b� ki�p"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
	end
	
	-- ��������Ҫ����ȡ��
	if (nAddendarCount == 2) then
		if ((nAddendarID[1] == -1) and (nAddendarID[2] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu�n nh�n b� ki�p"..strAddendar[3].."/get_addendar_3",
				"Ta mu�n nh�n b� ki�p"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu�n nh�n b� ki�p"..strAddendar[2].."/get_addendar_2",
				"Ta mu�n nh�n b� ki�p"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu�n nh�n b� ki�p"..strAddendar[2].."/get_addendar_2",
				"Ta mu�n nh�n b� ki�p"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu�n nh�n b� ki�p"..strAddendar[1].."/get_addendar_1",
				"Ta mu�n nh�n b� ki�p"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu�n nh�n b� ki�p"..strAddendar[1].."/get_addendar_1",
				"Ta mu�n nh�n b� ki�p"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[3] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu�n nh�n b� ki�p"..strAddendar[1].."/get_addendar_1",
				"Ta mu�n nh�n b� ki�p"..strAddendar[2].."/get_addendar_2",
				strTab[2])
		end
	end
	
	-- ��������Ҫ����ȡ��
	if (nAddendarCount == 3) then
		if (nAddendarID[1] == -1) then
			Say(strTab[1],
				4,
				"Ta mu�n nh�n b� ki�p"..strAddendar[2].."/get_addendar_2",
				"Ta mu�n nh�n b� ki�p"..strAddendar[3].."/get_addendar_3",
				"Ta mu�n nh�n b� ki�p"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if (nAddendarID[2] == -1) then
			Say(strTab[1],
				4,
				"Ta mu�n nh�n b� ki�p"..strAddendar[1].."/get_addendar_1",
				"Ta mu�n nh�n b� ki�p"..strAddendar[3].."/get_addendar_3",
				"Ta mu�n nh�n b� ki�p"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if (nAddendarID[3] == -1) then
			Say(strTab[1],
				4,
				"Ta mu�n nh�n b� ki�p"..strAddendar[1].."/get_addendar_1",
				"Ta mu�n nh�n b� ki�p"..strAddendar[2].."/get_addendar_2",
				"Ta mu�n nh�n b� ki�p"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if (nAddendarID[4] == -1) then
			Say(strTab[1],
				4,
				"Ta mu�n nh�n b� ki�p"..strAddendar[1].."/get_addendar_1",
				"Ta mu�n nh�n b� ki�p"..strAddendar[2].."/get_addendar_2",
				"Ta mu�n nh�n b� ki�p"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end	
	end
	
	-- ���ĸ���Ҫ����ȡ�µ�
	if (nAddendarCount == 4) then
		Say(strTab[1],
			5,
			"Ta mu�n nh�n b� ki�p"..strAddendar[1].."/get_addendar_1",
			"Ta mu�n nh�n b� ki�p"..strAddendar[2].."/get_addendar_2",
			"Ta mu�n nh�n b� ki�p"..strAddendar[3].."/get_addendar_3",
			"Ta mu�n nh�n b� ki�p"..strAddendar[4].."/get_addendar_4",
			strTab[2])
	end
	
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ȡ�¾�Ҫ1
function get_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	Say("B�n x�c nh�n mu�n l�y <color=yellow>"..strAddendar.."<color> ch�? Xin x�c nh�n c�n �� s�c l�c v� kho�ng tr�ng trong h�nh trang k�o ��nh r�i b� ki�p!",
		2,
		"L�y b� ki�p!/confirm_get_addendar_1",
		"Ta kh�ng l�y--H�y b�/cancel_dialog")
end;
-- ȷ��ȡ�¾�Ҫ1
function confirm_get_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(0)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("B�n �� ho�n th�nh thao t�c l�y b� ki�p <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B�n �� ho�n th�nh thao t�c l�y b� ki�p!")
	end
end;


-- ȡ�¾�Ҫ2
function get_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	Say("B�n x�c nh�n mu�n l�y <color=yellow>"..strAddendar.."<color> ch�? Xin x�c nh�n c�n �� s�c l�c v� kho�ng tr�ng trong h�nh trang k�o ��nh r�i b� ki�p!",
		2,
		"L�y b� ki�p!/confirm_get_addendar_2",
		"Ta kh�ng l�y--H�y b�/cancel_dialog")
end;
-- ȷ��ȡ�¾�Ҫ2
function confirm_get_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(1)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("B�n �� ho�n th�nh thao t�c l�y b� ki�p <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B�n �� ho�n th�nh thao t�c l�y b� ki�p!")
	end
end;


-- ȡ�¾�Ҫ3
function get_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	Say("B�n x�c nh�n mu�n l�y <color=yellow>"..strAddendar.."<color> ch�? Xin x�c nh�n c�n �� s�c l�c v� kho�ng tr�ng trong h�nh trang k�o ��nh r�i b� ki�p!",
		2,
		"L�y b� ki�p!/confirm_get_addendar_3",
		"Ta kh�ng l�y--H�y b�/cancel_dialog")
end;
-- ȷ��ȡ�¾�Ҫ3
function confirm_get_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(2)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("B�n �� ho�n th�nh thao t�c l�y b� ki�p <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B�n �� ho�n th�nh thao t�c l�y b� ki�p!")
	end
end;


-- ȡ�¾�Ҫ4
function get_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	Say("B�n x�c nh�n mu�n l�y <color=yellow>"..strAddendar.."<color> ch�? Xin x�c nh�n c�n �� s�c l�c v� kho�ng tr�ng trong h�nh trang k�o ��nh r�i b� ki�p!",
		2,
		"L�y b� ki�p!/confirm_get_addendar_4",
		"Ta kh�ng l�y--H�y b�/cancel_dialog")
end;
-- ȷ��ȡ�¾�Ҫ4
function confirm_get_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(3)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("B�n �� ho�n th�nh thao t�c l�y b� ki�p <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B�n �� ho�n th�nh thao t�c l�y b� ki�p!")
	end
end;

