-- =====================================================
-- File : �������
-- Desc : �����̻��ϰ���Ҫ����Ʒ����������ڸ������еġ�
-- Creator : Tony(Jizheng)
-- =====================================================
Include("\\script\\lib\\globalfunctions.lua");
-- Ĭ����ں���
function main()
	local nDate = tonumber(date("%y%m%d"));
	local tb_dialog = {
		"��ng � mua/open_shop",
		"Ng��i �� �i nh�ng n�i ��u?/query_pos",
		"L�n sau l�i ��n nh�!/exit_dialog"
	};
--	if nDate >= 091218 and nDate < 100117 then
--		tinsert(tb_dialog, 3, "Mua 1 ph�o hoa (c�n 1 ��ng)/buy_yanhuo");
--	end
	Say("H�ng h�a � ��y ���c �em v� t� T�y V�c, kh�ch quan xin c� t�y � l�a ch�n.",
		getn(tb_dialog),
		tb_dialog
	);
end;

-- ȡ��������Ʒ
function open_shop()
	-- ��һ���߻�ר���ƶ����̵�
	Sale(88)
end;

-- ��ͨ�����������
function query_pos()
	Say("Ta th��ng d�ng ch�n t�i c�c ��i th�nh th�: <color=green>Tuy�n Ch�u (187.191), Bi�n Kinh (179.184), Th�nh �� (224.225), T��ng D��ng (187.180), D��ng Ch�u (206.194), ��i L� (178.187)<color>", 0)
end;

-- �´��л�������
function exit_dialog()
end;

-- ���̻�
function buy_yanhuo()
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then 
		return 0;
	end
	if Pay(1) == 1 then
		AddItem(2, 1, 30137, 1);
		WriteLogEx("Giang Sinh","mua ph�o hoa")
	else
		Talk(1, "", "<color=green>Th��ng Nh�n T�y V�c<color>: Tr�n h�nh trang kh�ng �� ti�n.");
	end
end
