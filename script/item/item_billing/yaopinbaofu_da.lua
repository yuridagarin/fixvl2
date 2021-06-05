------------------------------------------------------------
-- ҩƷ�������󣩵Ľű� yaopinbaofu_da.lua
--
-- comment: ������250ƿ�߼�ҩƷ�����
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,1,478
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("B�n mu�n ��ng g�i lo�i bao d��c ph�m n�o?",
		4,
		"Sinh l�c d��c/pack_life_bottles",
		"N�i l�c d��c/pack_energy_bottles",
		"Song b� d��c/pack_both_bottles",
		"T�m th�i kh�ng ��ng g�i--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- �������ҩˮ
function pack_life_bottles()
		
	local bHaveBaiyunsan = GetItemCount(1, 0, 4)			-- ����ɢ
	local bHaveTianxiangyunjingxu = GetItemCount(1, 0, 5)	-- �����ƽ���
	local bHaveHeiyuduanxugao = GetItemCount(1, 0, 6)		-- ���������

	-- ������250ƿ
	if ((bHaveBaiyunsan < 250) and 
		(bHaveTianxiangyunjingxu < 250) and 
		(bHaveHeiyuduanxugao < 250)) then
		Say("Bao sinh l�c d��c c�: <color=yellow>B�ch V�n t�n, Thi�n H��ng C�m T�c, H�c Ng�c �o�n T�c Cao<color>, 3 lo�i mang theo kh�ng �� 250 b�nh, kh�ng th� ��ng g�i!", 0)
		return
	end
	
	strTab = {"Bao sinh l�c d��c c�: <color=yellow>B�ch V�n t�n, Thi�n H��ng C�m T�c, H�c Ng�c �o�n T�c Cao<color>, b�n mu�n ��ng g�i lo�i n�o?",
			  "Ta mu�n ��ng g�i 250 b�nh B�ch V�n t�n!/pack_250_baiyunsan",
			  "Ta mu�n ��ng g�i 250 b�nh Thi�n H��ng C�m T�c!/pack_250_tianxiangyunjingxu",
			  "Ta mu�n ��ng g�i 250 b�nh H�c Ng�c �o�n T�c Cao!/pack_250_heiyuduanxugao",
			  "T�m th�i kh�ng ��ng g�i--H�y b�/cancel_dialog"}
			  
	-- ���ֶ���
	if ((bHaveBaiyunsan >= 250) and 
		(bHaveTianxiangyunjingxu >= 250) and 
		(bHaveHeiyuduanxugao >= 250)) then
		Say(strTab[1], 4, strTab[2], strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- ȱ����ɢ
	if ((bHaveBaiyunsan < 250) and 
		(bHaveTianxiangyunjingxu >= 250) and 
		(bHaveHeiyuduanxugao >= 250)) then
		Say(strTab[1], 3, strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- ȱ�����ƽ���
	if ((bHaveBaiyunsan >= 250) and 
		(bHaveTianxiangyunjingxu < 250) and 
		(bHaveHeiyuduanxugao >= 250)) then
		Say(strTab[1], 3, strTab[2], strTab[4], strTab[5])
		return
	end
	
	-- ȱ���������
	if ((bHaveBaiyunsan >= 250) and 
		(bHaveTianxiangyunjingxu >= 250) and 
		(bHaveHeiyuduanxugao < 250)) then
		Say(strTab[1], 3, strTab[2], strTab[3], strTab[5])
		return
	end
	
	-- ֻ�а���ɢ
	if ((bHaveBaiyunsan >= 250) and 
		(bHaveTianxiangyunjingxu < 250) and 
		(bHaveHeiyuduanxugao < 250)) then
		Say(strTab[1], 2, strTab[2], strTab[5])
		return
	end
	
	-- ֻ�������ƽ���
	if ((bHaveBaiyunsan < 250) and 
		(bHaveTianxiangyunjingxu >= 250) and 
		(bHaveHeiyuduanxugao < 250)) then
		Say(strTab[1], 2, strTab[3], strTab[5])
		return
	end
	
	-- ֻ�к��������
	if ((bHaveBaiyunsan < 250) and 
		(bHaveTianxiangyunjingxu < 250) and 
		(bHaveHeiyuduanxugao >= 250)) then
		Say(strTab[1], 2, strTab[4], strTab[5])
		return
	end
	
end;
-- ȷ�ϴ��250ƿ����ɢ
function pack_250_baiyunsan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 4, 250) == 1) then
			AddItem(2, 1, 486, 1)
			Say("B�n ��ng g�i 250 b�nh <color=yellow>B�ch V�n t�n<color>, nh�n ���c 1 <color=yellow>B�ch V�n t�n (��i)<color>!", 0)
			Msg2Player("B�n ��ng g�i 250 b�nh B�ch V�n t�n, nh�n ���c 1 B�ch V�n t�n (��i)!")
		else
			Say("<color=yellow>B�ch V�n t�n<color> mang theo kh�ng �� 250 b�nh!", 0)
		end
	else
		Say("B�n kh�ng mang theo t�i d��c ph�m l�n!", 0)
	end
end;
-- ȷ�ϴ��250ƿ�����ƽ���
function pack_250_tianxiangyunjingxu()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 5, 250) == 1) then
			AddItem(2, 1, 488, 1)
			Say("B�n ��ng g�i 250 b�nh <color=yellow>Thi�n H��ng C�m T�c<color>, nh�n ���c 1 <color=yellow>Thi�n H��ng C�m T�c (��i)<color>!", 0)
			Msg2Player("B�n ��ng g�i 250 b�nh Thi�n H��ng C�m T�c, nh�n ���c 1 Thi�n H��ng C�m T�c (��i)!")
		else
			Say("<color=yellow>Thi�n H��ng C�m T�c<color> mang theo kh�ng �� 250 b�nh!", 0)
		end
	else
		Say("B�n kh�ng mang theo t�i d��c ph�m l�n!", 0)
	end
end;
-- ȷ�ϴ��250ƿ���������
function pack_250_heiyuduanxugao()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 6, 250) == 1) then
			AddItem(2, 1, 490, 1)
			Say("B�n ��ng g�i 250 b�nh <color=yellow>H�c Ng�c �o�n T�c Cao<color>, nh�n ���c 1 <color=yellow>H�c Ng�c �o�n T�c Cao (��i)<color>!", 0)
			Msg2Player("B�n ��ng g�i 250 b�nh H�c Ng�c �o�n T�c Cao, nh�n ���c 1 H�c Ng�c �o�n T�c Cao (��i)!")
		else
			Say("<color=yellow>H�c Ng�c �o�n T�c Cao<color> mang theo kh�ng �� 250 b�nh!", 0)
		end
	else
		Say("B�n kh�ng mang theo t�i d��c ph�m l�n!", 0)
	end
end;



-- �������ҩˮ
function pack_energy_bottles()
	local bHavedahuandan = GetItemCount(1, 0, 9)			-- �󻹵�
	local bHaveyiyuanfushidan = GetItemCount(1, 0, 10)		-- һԪ��ʼ��
	local bHavewanwuguiyuandan = GetItemCount(1, 0, 11)		-- �����Ԫ��

	-- ������250ƿ
	if ((bHavedahuandan < 250) and 
		(bHaveyiyuanfushidan < 250) and 
		(bHavewanwuguiyuandan < 250)) then
		Say("Bao n�i l�c d��c c�: <color=yellow>��i Ho�n ��n, Nh�t Nguy�n Ph�c Th�y ��n, V�n V�t Quy Nguy�n ��n<color>, 3 lo�i mang theo kh�ng �� 250 b�nh, kh�ng th� ��ng g�i!", 0)
		return
	end
	
	strTab = {"Bao n�i l�c d��c c�: <color=yellow>��i Ho�n ��n, Nh�t Nguy�n Ph�c Th�y ��n, V�n V�t Quy Nguy�n ��n<color>, b�n mu�n ��ng g�i lo�i n�o?",
			  "Ta mu�n ��ng g�i 250 b�nh ��i Ho�n ��n!/pack_250_dahuandan",
			  "Ta mu�n ��ng g�i 250 b�nh Nh�t Nguy�n Ph�c Th�y ��n!/pack_250_yiyuanfushidan",
			  "Ta mu�n ��ng g�i 250 b�nh V�n V�t Quy Nguy�n ��n!/pack_250_wanwuguiyuandan",
			  "T�m th�i kh�ng ��ng g�i--H�y b�/cancel_dialog"}
			  
	-- ���ֶ���
	if ((bHavedahuandan >= 250) and 
		(bHaveyiyuanfushidan >= 250) and 
		(bHavewanwuguiyuandan >= 250)) then
		Say(strTab[1], 4, strTab[2], strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- ȱ�󻹵�
	if ((bHavedahuandan < 250) and 
		(bHaveyiyuanfushidan >= 250) and 
		(bHavewanwuguiyuandan >= 250)) then
		Say(strTab[1], 3, strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- ȱһԪ��ʼ��
	if ((bHavedahuandan >= 250) and 
		(bHaveyiyuanfushidan < 250) and 
		(bHavewanwuguiyuandan >= 250)) then
		Say(strTab[1], 3, strTab[2], strTab[4], strTab[5])
		return
	end
	
	-- ȱ�����Ԫ��
	if ((bHavedahuandan >= 250) and 
		(bHaveyiyuanfushidan >= 250) and 
		(bHavewanwuguiyuandan < 250)) then
		Say(strTab[1], 3, strTab[2], strTab[3], strTab[5])
		return
	end
	
	-- ֻ�д󻹵�
	if ((bHavedahuandan >= 250) and 
		(bHaveyiyuanfushidan < 250) and 
		(bHavewanwuguiyuandan < 250)) then
		Say(strTab[1], 2, strTab[2], strTab[5])
		return
	end
	
	-- ֻ��һԪ��ʼ��
	if ((bHavedahuandan < 250) and 
		(bHaveyiyuanfushidan >= 250) and 
		(bHavewanwuguiyuandan < 250)) then
		Say(strTab[1], 2, strTab[3], strTab[5])
		return
	end
	
	-- ֻ�������Ԫ��
	if ((bHavedahuandan < 250) and 
		(bHaveyiyuanfushidan < 250) and 
		(bHavewanwuguiyuandan >= 250)) then
		Say(strTab[1], 2, strTab[4], strTab[5])
		return
	end
	
end;
-- ȷ�ϴ��250ƿ�󻹵�
function pack_250_dahuandan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 9, 250) == 1) then
			AddItem(2, 1, 492, 1)
			Say("B�n ��ng g�i 250 b�nh <color=yellow>��i Ho�n ��n<color>, nh�n ���c 1 <color=yellow>��i Ho�n ��n (��i)<color>!", 0)
			Msg2Player("B�n ��ng g�i 250 b�nh ��i Ho�n ��n, nh�n ���c 1 ��i Ho�n ��n (��i)!")
		else
			Say("<color=yellow>��i Ho�n ��n<color> mang theo kh�ng �� 250 b�nh!", 0)
		end
	else
		Say("B�n kh�ng mang theo t�i d��c ph�m l�n!", 0)
	end
end;
-- ȷ�ϴ��250ƿһԪ��ʼ��
function pack_250_yiyuanfushidan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 10, 250) == 1) then
			AddItem(2, 1, 494, 1)
			Say("B�n ��ng g�i 250 b�nh <color=yellow>Nh�t Nguy�n Ph�c Th�y ��n<color>, nh�n ���c 1 <color=yellow>Nh�t Nguy�n Ph�c Th�y ��n (��i)<color>!", 0)
			Msg2Player("B�n ��ng g�i 250 b�nh Nh�t Nguy�n Ph�c Th�y ��n, nh�n ���c 1 Nh�t Nguy�n Ph�c Th�y ��n (��i)!")
		else
			Say("<color=yellow>Nh�t Nguy�n Ph�c Th�y ��n<color> mang theo kh�ng �� 250 b�nh!", 0)
		end
	else
		Say("B�n kh�ng mang theo t�i d��c ph�m l�n!", 0)
	end
end;
-- ȷ�ϴ��250ƿ�����Ԫ��
function pack_250_wanwuguiyuandan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 11, 250) == 1) then
			AddItem(2, 1, 496, 1)
			Say("B�n ��ng g�i 250 b�nh <color=yellow>V�n V�t Quy Nguy�n ��n<color>, nh�n ���c 1 <color=yellow>V�n V�t Quy Nguy�n ��n (��i)<color>!", 0)
			Msg2Player("B�n ��ng g�i 250 b�nh V�n V�t Quy Nguy�n ��n, nh�n ���c 1 V�n V�t Quy Nguy�n ��n (��i)!")
		else
			Say("<color=yellow>V�n V�t Quy Nguy�n ��n<color> mang theo kh�ng �� 250 b�nh!", 0)
		end
	else
		Say("B�n kh�ng mang theo t�i d��c ph�m l�n!", 0)
	end
end;



-- ���˫��ҩˮ
function pack_both_bottles()
	local bHaveyulingsan = GetItemCount(1, 0, 14)			-- ����ɢ
	local bHavewuhuayuluwan = GetItemCount(1, 0, 15)		-- �廨��¶��
	local bHaveshengshengzaohuasan = GetItemCount(1, 0, 16)	-- �����컯ɢ

	-- ������100ƿ
	if ((bHaveyulingsan < 250) and 
		(bHavewuhuayuluwan < 250) and 
		(bHaveshengshengzaohuasan < 250)) then
		Say("Bao song b� d��c c�: <color=yellow>Ng�c Linh t�n, Ng� Hoa Ng�c L� Ho�n, Sinh Sinh H�a T�n<color>, 3 lo�i mang theo kh�ng �� 250 b�nh, kh�ng th� ��ng g�i!", 0)
		return
	end
	
	strTab = {"Bao song b� d��c c�: <color=yellow>Ng�c Linh t�n, Ng� Hoa Ng�c L� Ho�n, Sinh Sinh H�a T�n<color>, b�n Mu�n ��ng g�i lo�i n�o?",
			  "Ta mu�n ��ng g�i 250 b�nh Ng�c Linh t�n!/pack_250_yulingsan",
			  "Ta mu�n ��ng g�i 250 b�nh Ng� Hoa Ng�c L� Ho�n!/pack_250_wuhuayuluwan",
			  "Ta mu�n ��ng g�i 250 b�nh Sinh Sinh H�a T�n!/pack_250_shengshengzaohuasan",
			  "T�m th�i kh�ng ��ng g�i--H�y b�/cancel_dialog"}
			  
	-- ���ֶ���
	if ((bHaveyulingsan >= 250) and 
		(bHavewuhuayuluwan >= 250) and 
		(bHaveshengshengzaohuasan >= 250)) then
		Say(strTab[1], 4, strTab[2], strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- ȱ����ɢ
	if ((bHaveyulingsan < 250) and 
		(bHavewuhuayuluwan >= 250) and 
		(bHaveshengshengzaohuasan >= 250)) then
		Say(strTab[1], 3, strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- ȱ�廨��¶��
	if ((bHaveyulingsan >= 250) and 
		(bHavewuhuayuluwan < 250) and 
		(bHaveshengshengzaohuasan >= 250)) then
		Say(strTab[1], 3, strTab[2], strTab[4], strTab[5])
		return
	end
	
	-- ȱ�����컯ɢ
	if ((bHaveyulingsan >= 250) and 
		(bHavewuhuayuluwan >= 250) and 
		(bHaveshengshengzaohuasan < 250)) then
		Say(strTab[1], 3, strTab[2], strTab[3], strTab[5])
		return
	end
	
	-- ֻ������ɢ
	if ((bHaveyulingsan >= 250) and 
		(bHavewuhuayuluwan < 250) and 
		(bHaveshengshengzaohuasan < 250)) then
		Say(strTab[1], 2, strTab[2], strTab[5])
		return
	end
	
	-- ֻ���廨��¶��
	if ((bHaveyulingsan < 250) and 
		(bHavewuhuayuluwan >= 250) and 
		(bHaveshengshengzaohuasan < 250)) then
		Say(strTab[1], 2, strTab[3], strTab[5])
		return
	end
	
	-- ֻ�������컯ɢ
	if ((bHaveyulingsan < 250) and 
		(bHavewuhuayuluwan < 250) and 
		(bHaveshengshengzaohuasan >= 250)) then
		Say(strTab[1], 2, strTab[4], strTab[5])
		return
	end
	
end;
-- ȷ�ϴ��250ƿ����ɢ
function pack_250_yulingsan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 14, 250) == 1) then
			AddItem(2, 1, 480, 1)
			Say("B�n ��ng g�i 250 b�nh <color=yellow>Ng�c Linh t�n<color>, nh�n ���c 1 <color=yellow>Ng�c Linh t�n (��i)<color>!", 0)
			Msg2Player("B�n ��ng g�i 250 b�nh Ng�c Linh t�n, nh�n ���c 1 Ng�c Linh t�n (��i)!")
		else
			Say("<color=yellow>Ng�c Linh t�n<color> mang theo kh�ng �� 250 b�nh!", 0)
		end
	else
		Say("B�n kh�ng mang theo t�i d��c ph�m l�n!", 0)
	end
end;
-- ȷ�ϴ��250ƿ�廨��¶��
function pack_250_wuhuayuluwan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 15, 250) == 1) then
			AddItem(2, 1, 482, 1)
			Say("B�n ��ng g�i 250 b�nh <color=yellow>Ng� Hoa Ng�c L� Ho�n<color>, nh�n ���c 1 <color=yellow>Ng� Hoa Ng�c L� Ho�n (��i)<color>!", 0)
			Msg2Player("B�n ��ng g�i 250 b�nh Ng� Hoa Ng�c L� Ho�n, nh�n ���c 1 Ng� Hoa Ng�c L� Ho�n (��i)!")
		else
			Say("<color=yellow>Ng� Hoa Ng�c L� Ho�n<color> mang theo kh�ng �� 250 b�nh!!", 0)
		end
	else
		Say("B�n kh�ng mang theo t�i d��c ph�m l�n!", 0)
	end
end;
-- ȷ�ϴ��250ƿ�����컯ɢ
function pack_250_shengshengzaohuasan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 16, 250) == 1) then
			AddItem(2, 1, 484, 1)
			Say("B�n ��ng g�i 250 b�nh <color=yellow>Sinh Sinh H�a T�n<color>, nh�n ���c 1 <color=yellow>Sinh Sinh H�a T�n (��i)<color>!", 0)
			Msg2Player("B�n ��ng g�i 250 b�nh Sinh Sinh H�a T�n, nh�n ���c 1 Sinh Sinh H�a T�n (��i)!")
		else
			Say("<color=yellow>Sinh Sinh H�a T�n<color> mang theo kh�ng �� 250 b�nh!", 0)
		end
	else
		Say("B�n kh�ng mang theo t�i d��c ph�m l�n!", 0)
	end
end;


