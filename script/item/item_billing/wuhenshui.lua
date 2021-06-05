------------------------------------------------------------
-- �޺�ˮ�Ľű� wuhenshui.lua
--
-- comment: ϴ���ؼ�������һ����Ҫ��
-- creator: Tony(Jizheng)
-- Date   : Jul 20th, 2006
--
-- Item ID: 2,1,503
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	if IsBookLocked() > 0 then
		Say("M�t t�ch trang b� �ang � tr�ng th�i kh�a, kh�ng th� d�ng V� Ng�n th�y h�y b� ki�p!", 0)
		return
	end
	
	strTab = {"Sau khi d�ng <color=yellow>V� Ng�n Th�y<color> s� s� h�y b� m�t quy�n b� ki�p b�t k� trong m�t t�ch trang b� c�a b�n hi�n t�i. B�n mu�n h�y b� b� ki�p n�o?",
			  "Ta kh�ng mu�n h�y b�--H�y b�/cancel_dialog"}
			  
	local strAddendar = {"", "", "", ""}
	local nAddendarID = {-1, -1, -1, -1}
	local nAddendarCount = 0
	for i = 0, 3 do
		strAddendar[i + 1], nAddendarID[i + 1] = GetBookAddendarName(i)
		if (nAddendarID[i + 1] ~= -1) then
			nAddendarCount = nAddendarCount + 1
		end
	end
	
	-- û�о�ҪҪ����
	if (nAddendarCount == 0) then
		Say("Hi�n b�n kh�ng th� h�y b� b� ki�p!", 0)
	end
	
	-- ֻ��һ����Ҫ��������
	if (nAddendarCount == 1) then
		if (nAddendarID[1] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[1].."/clear_addendar_1",
				strTab[2])
		end
		if (nAddendarID[2] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[2].."/clear_addendar_2",
				strTab[2])
		end
		if (nAddendarID[3] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end
		if (nAddendarID[4] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
	end
	
	-- ��������Ҫ��������
	if (nAddendarCount == 2) then
		if ((nAddendarID[1] == -1) and (nAddendarID[2] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[3].."/clear_addendar_3",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[2].."/clear_addendar_2",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[2].."/clear_addendar_2",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[1].."/clear_addendar_1",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[1].."/clear_addendar_1",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[3] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[1].."/clear_addendar_1",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[2].."/clear_addendar_2",
				strTab[2])
		end
	end
	
	-- ��������Ҫ��������
	if (nAddendarCount == 3) then
		if (nAddendarID[1] == -1) then
			Say(strTab[1],
				4,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[2].."/clear_addendar_2",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[3].."/clear_addendar_3",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if (nAddendarID[2] == -1) then
			Say(strTab[1],
				4,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[1].."/clear_addendar_1",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[3].."/clear_addendar_3",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if (nAddendarID[3] == -1) then
			Say(strTab[1],
				4,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[1].."/clear_addendar_1",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[2].."/clear_addendar_2",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if (nAddendarID[4] == -1) then
			Say(strTab[1],
				4,
				"Ta mu�n h�y b� b� ki�p"..strAddendar[1].."/clear_addendar_1",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[2].."/clear_addendar_2",
				"Ta mu�n h�y b� b� ki�p"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end	
	end
	
	-- ���ĸ���Ҫ����������
	if (nAddendarCount == 4) then
		Say(strTab[1],
			5,
			"Ta mu�n h�y b� b� ki�p"..strAddendar[1].."/clear_addendar_1",
			"Ta mu�n h�y b� b� ki�p"..strAddendar[2].."/clear_addendar_2",
			"Ta mu�n h�y b� b� ki�p"..strAddendar[3].."/clear_addendar_3",
			"Ta mu�n h�y b� b� ki�p"..strAddendar[4].."/clear_addendar_4",
			strTab[2])
	end
	
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ������Ҫ1
function clear_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	Say("Ng��i x�c ��nh mu�n h�y b� <color=yellow>"..strAddendar.."<color> ch�? Sau khi h�y b�, b� ki�p n�y s� bi�n m�t!",
		2,
		"��ng �/confirm_clear_addendar_1",
		"Ta kh�ng mu�n h�y b�--H�y b�/cancel_dialog")
end;
-- ȷ��������Ҫ1
function confirm_clear_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(0)
		Say("B�n �� x�a th�nh c�ng <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B�n �� x�a b� ki�p th�nh c�ng!")
	end
end;


-- ������Ҫ2
function clear_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	Say("Ng��i x�c ��nh mu�n h�y b� <color=yellow>"..strAddendar.."<color> ch�? Sau khi h�y b�, b� ki�p n�y s� bi�n m�t!",
		2,
		"��ng �/confirm_clear_addendar_2",
		"Ta kh�ng mu�n h�y b�--H�y b�/cancel_dialog")
end;
-- ȷ��������Ҫ2
function confirm_clear_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(1)
		Say("B�n �� x�a th�nh c�ng <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B�n �� x�a b� ki�p th�nh c�ng!")
	end
end;


-- ������Ҫ3
function clear_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	Say("Ng��i x�c ��nh mu�n h�y b� <color=yellow>"..strAddendar.."<color> ch�? Sau khi h�y b�, b� ki�p n�y s� bi�n m�t!",
		2,
		"��ng �/confirm_clear_addendar_3",
		"Ta kh�ng mu�n h�y b�--H�y b�/cancel_dialog")
end;
-- ȷ��������Ҫ3
function confirm_clear_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(2)
		Say("B�n �� x�a th�nh c�ng <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B�n �� x�a b� ki�p th�nh c�ng!")
	end
end;


-- ������Ҫ4
function clear_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	Say("Ng��i x�c ��nh mu�n h�y b� <color=yellow>"..strAddendar.."<color> ch�? Sau khi h�y b�, b� ki�p n�y s� bi�n m�t!",
		2,
		"��ng �/confirm_clear_addendar_4",
		"Ta kh�ng mu�n h�y b�--H�y b�/cancel_dialog")
end;
-- ȷ��������Ҫ4
function confirm_clear_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(3)
		Say("B�n �� x�a th�nh c�ng <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B�n �� x�a b� ki�p th�nh c�ng!")
	end
end;

