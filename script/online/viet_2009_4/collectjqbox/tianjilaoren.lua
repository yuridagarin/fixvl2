--=============================================
--create by baiyun 2009.4.12
--describe:Խ�ϰ�4�·ݽ����������ǻ �������
--=============================================

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_2009_4\\collectjqbox\\jiaoqi_head.lua")
Include("\\script\\lib\\writelog.lua")

--------------------------------------
--main()
--������
--------------------------------------
function main()
	----���ʱ��
	if JQ_CheckEventDate() ~= 1 then
		Talk(1, "", "Th�i gian ho�t ��ng �� h�t.");
		return 0;
	end
	
	Say(
			"Thi�n C� L�o Nh�n: Ta chuy�n ph� tr�ch c�c v�n �� n�ng c�p Lam K� th�nh H�ng K�, gh�p H�ng K� v�i Ho�ng Kim K� Th�ch",
			4,
			"T�i h� mu�n n�ng c�p Lam K� (C�n 3 Lam K� v� 10 b�c)/JQ_LevelBToRFlag",
			"T�i h� c�n gh�p H�ng K� v�i Ho�ng Kim Th�ch (nh�n ���c Ho�ng Kim K� ho�c B�ch Kim K�)/JQ_GroupRedAndStone",
			"T�i h� c�n 1 C�m nang ��i s� ki�n./JQ_GetJinNang",
			"T�i h� ch� gh� ngang!/JQ_DoNothing"
		)
end


--------------------------------------
--JQ_LevelBToRFlag()
--�����������ɺ���
--------------------------------------
function JQ_LevelBToRFlag()
-----�жϱ����͸���------------------------
	if gf_Judge_Room_Weight(2, 0, "Xin l�i, ") == 0 then
		return 0
	end
-----Ǯ����--------	
	if GetCash() < JQ_LEVEL_B_TO_R_FLAG_MONEY then
		Talk(1, "", "Ng�n l��ng c�a b�n kh�ng ��!");
		return 0;
	end

	if DelItem(2, 1, 30081, JQ_LEVEL_B_TO_R_FLAG_BFLAG_NUM) ~= 1 then
		Say("Nguy�n li�u mang theo kh�ng ��", 1, "K�t th�c ��i tho�i/JQ_DoNothing");
		return 0;
	end
	if Pay(JQ_LEVEL_B_TO_R_FLAG_MONEY) ~= 1 then
		WriteLog("[Ho�t ��ng thu th�p hi�u k� th�ng 4]:" .. GetName() .. "Chi tr�".. JQ_LEVEL_B_TO_R_FLAG_MONEY .. " xu th�t b�i");
		return 0;
	end
	
	local nRand = 0;
	nRand = random(1, 100);
	if nRand > 0 and nRand <= 75 then --75%�ĸ��ʵ�һ������
		if AddItem(2, 1, 30080, 1) == 1 then
			Msg2Player("��i hi�p nh�n ���c 1 H�ng K�");
			WriteLogEx("Hoat dong thang 4","nh�n ���c",1,"H�ng K�");			
		end
	else
		if AddItem(2, 1, 30081, 2) == 1 then
			Say("Qu� tr�nh n�ng c�p th�t b�i, c�c h� ch� nh�n l�i ���c 2 Lam K�..", 1, "K�t th�c ��i tho�i/main");
		end
	end
end

--------------------------------------
--JQ_GroupRedAndStone()
--�Ѻ���ͻƽ�ʯ�ϳɰ׽����ƽ���
--------------------------------------
function JQ_GroupRedAndStone()
-----�жϱ����͸���------------------------
	if gf_Judge_Room_Weight(1, 0, "Xin l�i, ") == 0 then
		return 0;
	end
-----ԭ�ϲ���------------------------------
	if GetItemCount(2, 1, 30080) < 2 or GetItemCount(2, 1, 30082) == 0 then
		Say("Nguy�n li�u mang theo kh�ng ��", 1, "K�t th�c ��i tho�i/JQ_DoNothing");
		return 0;
	end

	if DelItem(2, 1, 30080, 2) == 1 and DelItem(2, 1, 30082, 1) == 1 then
		local nRand = 0;
		nRand = random(1, 100);
		if nRand == 1 then
			if AddItem(2, 1, 30083, 1) == 1 then
				Msg2Player("B�n nh�n ���c " .. "1" .. "c�i" .. "B�ch Kim K�");
				WriteLogEx("Hoat dong thang 4","nh�n ���c",1,"B�ch Kim K�");
			end
		else
			if AddItem(2, 1, 30084, 1) == 1 then
				Msg2Player("B�n nh�n ���c " .. "1" .. "c�i" .. "Ho�ng Kim K�");
				WriteLogEx("Hoat dong thang 4","nh�n ���c",1,"Ho�ng Kim K�");
			end
		end	
	end
end

--------------------------------------
--JQ_GetJinNang()
--��ȡ���Ҵ��¼�
--------------------------------------
function JQ_GetJinNang()
	if GetItemCount(2, 1, 30045) ~= 0 then
		Say("C�c h� �� nh�n C�m nang ��i s� ki�n r�i, kh�ng th� nh�n th�m ���c n�a.", 1, "K�t th�c ��i tho�i!/JQ_DoNothing");
		return 0;	
	else
		-----�жϱ����͸���------------------------
		if gf_Judge_Room_Weight(1, 1, "Xin l�i, ") == 0 then
			return 0;
		end
		if AddItem(2, 1, 30045, 1) == 1 then
			Say("Ng��i nh�n ���c 1 C�m Nang ��i S� Ki�n.", 1, "�a t� ti�n b�i.!/JQ_DoNothing");
		end
	end
end