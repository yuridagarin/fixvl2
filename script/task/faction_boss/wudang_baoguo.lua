-- =============================================================
-- FileName : wudang_baoguo.lua
-- Desc     : �䵱boss����İ����Ľű�������boss�����е���İ��������ʹ�ÿ��Ի�úö�good�����Ĺ���
-- Date     : Dec 26 2006
-- Creator  : Tony(Jizheng)
-- ID       : 2, 1, 958
-- =============================================================

-- �䵱����Ľű�������ͨ��
Include("\\script\\task\\faction_boss\\boss_baoxiang_wudang.lua");

-- Ĭ��ʹ�õĺ���
function OnUse()
	-- û�������ɾͲ��ܿ�����
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("B�n v�n ch�a b�i s� h�c v�, t�i qu� n�y kh�ng th� m�!", 0)
		return
	end

	Say("B�n x�c ��nh m� t�i th� t�nh n�y ch�?",
		2,
		"��ng �/confirm_get",
		"H�y b�/cancel_dialog")
end;

-- �˳��Ի�
function cancel_dialog()
end;

-- ȷ�ϴ򿪰���
function confirm_get()
	local nSel = random(1, 100)					-- ����������ĸ���
	
	if (DelItem(2, 1, 958, 1) == 1) then		-- ���Լ�ɾ��
		local nRand = random(1,1000);
		if nRand <= 300 then
		local nRandIdx = random(1,getn(tGaojiMiji[13]));
			AddItem(tGaojiMiji[13][nRandIdx][2],tGaojiMiji[13][nRandIdx][3],tGaojiMiji[13][nRandIdx][4],1);
			Msg2Player("��i hi�p m� T�i t�y th�n, nh�n ���c "..tGaojiMiji[13][nRandIdx][1]);
		else	
	
			if (nSel <= 37) then			-- 37%�ĸ��ʣ��õ�δ�����76������
				get_76_weapon()
				ModifyExp(3000000)
				Msg2Player("B�n m� ���c t�i qu�, nh�n ���c m�t v� kh� c�p 76 v� 3000000 �i�m kinh nghi�m!")
			elseif (nSel <= 52) then		-- 15%   �ĸ��ʣ��õ�ʦ�ž���
				get_faction_misbook(0)
			elseif (nSel <= 61) then		-- 9%    �ĸ��ʣ��õ�ʦ�ž���
				get_faction_misbook(1)
			elseif (nSel <= 64) then		-- 3%    �ĸ��ʣ��õ�ʦ�ž���
				get_faction_misbook(2)
			elseif (nSel <= 88) then		-- 24%   �ĸ��ʣ��õ�ʦ����װ������
				get_suit_2_shoe()
				ModifyExp(3000000)
				Msg2Player("B�n m� ���c t�i qu�, nh�n ���c trang ph�c c�a s� m�n v� 3000000 �i�m kinh nghi�m.")
			elseif (nSel <= 91) then		-- 3%    �ĸ��ʣ��õ�ʦ����װ��ͷ
				get_suit_3_head()
				Msg2Player("B�n m� ���c t�i qu�, nh�n ���c trang ph�c c�a s� m�n")
			elseif (nSel <= 97) then		-- 6%    �ĸ��ʣ��õ�ʦ����װ������
				get_suit_3_deco()
				Msg2Player("B�n m� ���c t�i qu�, nh�n ���c b� trang s�c c�a s� m�n!")
			elseif (nSel <= 100) then		-- 3%    �ĸ��ʣ��õ���ʦ����
				AddItem(2, 0, 397, 1)
				Msg2Player("B�n m� ���c t�i qu�, nh�n ���c quy�n m�t t�ch!")
			end
		end
	end
end;
