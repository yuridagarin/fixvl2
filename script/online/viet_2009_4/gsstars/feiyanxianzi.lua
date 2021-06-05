--=============================================
--create by baiyun 2009.4.12
--describe:Խ�ϰ�4�·ݽ����������ǻ ��������
--=============================================

Include("\\script\\online\\viet_2009_4\\gsstars\\gsstars_head.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua")

GS_AWARD_PARAM = {
							"D��c th�o qu�n d�ng",
							"L�a m�ch qu�n d�ng",
							"Kho�ng th�ch qu�n d�ng",
							"Linh huy�t qu�n d�ng",
							"T� t�m qu�n d�ng",
							"G� qu�n d�ng",
							"Thu�c da qu�n d�ng",
							"Phong l�nh-trung c�p",
							"Phong th��ng l�nh_T�ng (�� Th�ng)",
							"Phong th��ng l�nh_Li�u (�� Th�ng)",
							"Phong th��ng l�nh_T�ng (Ti�n Phong)",
							"Phong th��ng l�nh_Li�u (Ti�n Phong)",
							"Qu�n C�ng ��i",
							"S� tay s�ng",
							"T�y T�y linh ��n",
							"B�t B�o T�y T�y Ti�n ��n",
							"Phong th��ng l�nh_T�ng (T��ng Qu�n)",
							"Phong th��ng l�nh_Li�u (T��ng Qu�n)"
};

--------------------------------------
--main()
--������
--------------------------------------
function main()
	if tonumber(date("%y%m%d%H")) >= 09053124 then
			Talk(1, "", "Th�i gian ho�t ��ng �� h�t.");
			return 0;
	end
	if tonumber(date("%y%m%d%H")) < 09042400 then
		Talk(1, "", "Ho�t ��ng n�y v�n ch�a m�.");
		return 0;
	end
-----�жϵȼ�----------------------------------------------------
	if GetLevel() < GSSTARS_ROLE_LEVEL_LIMIT then
		Talk(1, "", "V�n ch�a ��t ��n c�p <color=yellow>" .. GSSTARS_ROLE_LEVEL_LIMIT .. "<color> c�p kh�ng th� tham d� ho�t ��ng.");
		return 0;
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ph�i gia nh�p m�n ph�i m�i c� th� tham gia ho�t ��ng.")
		return 0;
	end
	
-----����һ��������----------------------------------------------
	Say(
		"Phi Y�n Ti�n T�: Trong kho�ng th�i gian 24-04-2009 ��n 24:00 31-05-2009, c�c h� c� th� ��n g�p ta �� n�ng c�p c�c Ng�i Sao B�c th�nh Ng�i Sao V�ng, chi ph� cho m�i l�n n�ng c�p l� 20 b�c.",
		7,
		"N�ng c�p Ng�i Sao B�c th�nh Ng�i Sao V�ng (C�n 30 ng�i sao b�c v� 20 b�c)/GSStarsLevelSToG",
		"200" .. "D��c th�o qu�n d�ng" .. "(C�n 1 Ng�i Sao V�ng)/#GSStarsGetReward(1, 2, 0, 312, 200, 1, 0)",
		"200" .. "L�a m�ch qu�n d�ng" .. "(C�n 1 Ng�i Sao V�ng)/#GSStarsGetReward(2, 2, 0, 309, 200, 1, 0)",
		"200" .. "Kho�ng th�ch qu�n d�ng" .. "(C�n 1 Ng�i Sao V�ng)/#GSStarsGetReward(3, 2, 0, 307, 200, 1, 0)",
		"200" .. "Linh huy�t qu�n d�ng" .. "(C�n 1 Ng�i Sao V�ng)/#GSStarsGetReward(4, 2, 0, 313, 200, 1, 0)",
		"Trang k�.../Feiyanxianzi_talk_1",
		"T�i h� ch� gh� ngang!/GSStarsDoNothing"
	)
end

--------------------------------------
--GSStarsLevelSToG()
--�������������ɽ�����
--------------------------------------
function GSStarsLevelSToG()
-----�жϱ����͸���------------------------
	if gf_Judge_Room_Weight(1, 0, "Xin l�i, ") == 0 then
		return 0
	end
-----Ǯ����--------	
	if GetCash() < GSSTARS_LEVEL_TO_GSTAR_MONEY then
		Talk(1, "", "Ng�n l��ng c�a b�n kh�ng ��!");
		return 0;
	end
-----�����ǲ���-------
	if DelItem(2, 1, 30077, GSSTARS_LEVEL_TO_GSTAR_NUM) ~= 1 then
		Say("Nguy�n li�u mang theo kh�ng ��!", 1, "Th�t ng�i qu�! T�i h� s� quay l�i sau./GSStarsDoNothing");
		return 0;
	end
	if Pay(GSSTARS_LEVEL_TO_GSTAR_MONEY) ~= 1 then
		WriteLog("[Ho�t ��ng ng�i sao v�ng ng�i sao b�c th�ng 4]:" .. GetName() .. "Chi tr�".. GSSTARS_LEVEL_TO_GSTAR_MONEY .. " xu th�t b�i");
		return 0;
	end
	
	local nRand = 0;
	nRand = random(1, 100);
	if nRand > 0 and nRand <= 80 then --80%�ĸ��������ɹ�
		if AddItem(2, 1, 30076, 1) == 1 then
			Msg2Player("Thu ���c 1 Ng�i Sao V�ng");			
			WriteLogEx("Hoat dong thang 4","n�ng c�p",1,"Ng�i Sao V�ng")
		end
	else
		WriteLogEx("Hoat dong thang 4","n�ng c�p th�t b�i",1,"Ng�i Sao V�ng")
		Msg2Player("N�ng c�p th�nh Ng�i Sao V�ng th�t b�i!");
	end
	
	
end

--------------------------------------
--GSStarsGetReward()
--��ȡ����
--------------------------------------
function GSStarsGetReward(nID, nMainType, nSecondryType, nDetailType, nCount, nGStars, nTimeLimit)
--	if GSStarsGetCurDay() == 0 or GSStarsGetCurDay() == 6 then 
--		Say("Hi�n t�i ch�a th� ��i Ng�i Sao V�ng", 1, "T�i h� s� quay l�i sau/GSStarsDoNothing");
--		return 0;
--	end
-----�жϱ����͸���------------------------
	if gf_Judge_Room_Weight(1, 200, "Xin l�i, ") == 0 then
		return 0
	end
	
	if nGStars > 0 then
		if DelItem(2, 1, 30076, nGStars) ~= 1 then
			Say("Ng�i Sao V�ng mang theo kh�ng ��!", 1, "Th�t ng�i qu�! T�i h� s� quay l�i sau./GSStarsDoNothing");
			return 0;
		end
	end
	local sItemName = GS_AWARD_PARAM[nID];
	local nResult, nIndex = AddItem(nMainType, nSecondryType, nDetailType, nCount);
	if nResult == 1 then
		if nTimeLimit == 1 then --�����ʹ������ 7 ��
			SetItemExpireTime(nIndex, 7 * 24 * 60 * 60);
		end
		Msg2Player("B�n nh�n ���c ".. nCount .. "c�i" .. sItemName);
		WriteLogEx("Hoat dong thang 4","Ng�i Sao V�ng",nCount,sItemName)
	end
end

function GSStarsDoNothing()
end

function Feiyanxianzi_talk_1()
	Say("", 11, 
			"200" .. "T� t�m qu�n d�ng" .. "(C�n 1 Ng�i Sao V�ng)/#GSStarsGetReward(5, 2, 0, 311, 200, 1, 0)",
			"200" .. "G� qu�n d�ng" .. "(C�n 1 Ng�i Sao V�ng)/#GSStarsGetReward(6, 2, 0, 308, 200, 1, 0)",
			"200" .. "Thu�c da qu�n d�ng" .. "(C�n 1 Ng�i Sao V�ng)/#GSStarsGetReward(7, 2, 0, 310, 200, 1, 0)",
			"��i th�nh " .. "Phong l�nh-trung c�p" .. "(C�n 50 Ng�i Sao V�ng)/#GSStarsGetReward(8, 2, 1, 1054, 1, 50, 1)",
			"��i th�nh " .. "Phong th��ng l�nh_T�ng (�� Th�ng)" .. "(C�n 100 Ng�i Sao V�ng)/#GSStarsGetReward(9, 2, 1, 9990, 1, 100, 1)",
			"��i th�nh " .. "Phong th��ng l�nh_Li�u (�� Th�ng)" .. "(C�n 100 Ng�i Sao V�ng)/#GSStarsGetReward(10, 2, 1, 9989, 1, 100, 1)",
			"��i th�nh " .. "Phong th��ng l�nh_T�ng (Ti�n Phong)" .. "(C�n 300 Ng�i Sao V�ng)/#GSStarsGetReward(11, 2, 1, 9986, 1, 300, 1)",
			"��i th�nh " .. "Phong th��ng l�nh_Li�u (Ti�n Phong)" .. "(C�n 300 Ng�i Sao V�ng)/#GSStarsGetReward(12, 2, 1, 9985, 1, 300, 1)",
			"Trang k�.../Feiyanxianzi_talk_2",
			"tr� l�i/main",
			"T�i h� ch� gh� ngang!/GSStarsDoNothing"
			);
end

function Feiyanxianzi_talk_2()
	Say("", 8, 
			"��i th�nh " .. "Qu�n C�ng ��i" .. "(C�n 200 Ng�i Sao V�ng)/#GSStarsGetReward(13, 2, 1, 9998, 1, 200, 1)",
			"��i th�nh " .. "S� tay s�ng" .. "(C�n 500 Ng�i Sao V�ng)/#GSStarsGetReward(14, 2, 19, 1, 1, 500, 1)",
			"��i th�nh " .. "T�y T�y linh ��n" .. "(C�n 600 Ng�i Sao V�ng)/#GSStarsGetReward(15, 2, 0, 137, 1, 600, 1)",
			"��i th�nh " .. "B�t B�o T�y T�y Ti�n ��n" .. "(C�n 800 Ng�i Sao V�ng)/#GSStarsGetReward(16, 2, 0, 138, 1, 800, 1)",
			"��i th�nh " .. "Phong th��ng l�nh_T�ng (T��ng Qu�n)" .. "(C�n 400 Ng�i Sao V�ng)/#GSStarsGetReward(17, 2, 1, 9984, 1, 400, 1)",
			"��i th�nh " .. "Phong th��ng l�nh_Li�u (T��ng Qu�n)" .. "(C�n 400 Ng�i Sao V�ng)/#GSStarsGetReward(18, 2, 1, 9983, 1, 400, 1)",
			"tr� l�i/main",
			"T�i h� ch� gh� ngang!/GSStarsDoNothing"
			);
end