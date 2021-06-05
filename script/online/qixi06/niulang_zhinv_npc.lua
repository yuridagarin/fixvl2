--file name:niulang_zhinv_npc.lua
--author:yanjun
--create date:2006-6-26
--describe:06����Ϧ���ţ��֯Ů�ű�
Include("\\script\\online\\qixi06\\qixi06_head.lua");

function main()
	local nDate = tonumber(date("%y%m%d"));
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIndex);
	if GetTask(TASK_GOTPRESENT_DATE) >= nDate then
		Talk(1,"","<color=green>"..sNpcName.."<color>: H�m nay b�n �� nh�n ph�n th��ng*2 t�nh nh�n trong thi�n h� b�n nhau m�i m�i.");
		return 0;
	end;
	if GetTask(TASK_PLANTSTAR_DATE) == nDate then
		local selTab = {
				"Ta mu�n nh�n l� ph�m/get_award_confirm",
				"Ta ��n �� ch�c m�ng/nothing",
				}
		Say("<color=green>"..sNpcName.."<color>: Ch�c c�c ��i t�nh nh�n trong thi�n h� m�i m�i b�n nhau. Ch�ng t�i c� chu�n b� 1 m�n qu� nh�, xin h�y nh�n l�y.",getn(selTab),selTab);
	else
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ch�c c�c ��i t�nh nh�n trong thi�n h� m�i m�i b�n nhau.");
	end;
end;

function get_award_confirm()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIndex);
	local selTab = {
				"��ng �/give_award",
				"Ta s� quay l�i sau/nothing",
				}
	Say("<color=green>"..sNpcName.."<color>:"..tSexName[GetSex()].."h�y x�c nh�n ch� tr�ng trong h�nh trang v� s�c l�c c�n �� �� tr�nh t�n th�t ��nh ti�c, b�n x�c nh�n mu�n nh�n ph�n th��ng?",getn(selTab),selTab);
end;

function give_award()
	local nDate = tonumber(date("%y%m%d"));
	local nOldPlayerIndex = PlayerIndex;
	local nRandomNum = 0;
	local nLevel = 0;
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIndex);
	if Is_Lovers_Team() == 1 then
		for i=1,2 do
			PlayerIndex = GetTeamMember(i);
			if GetTask(TASK_GOTPRESENT_DATE) < nDate and GetTask(TASK_PLANTSTAR_DATE) == nDate then	--�����ȡ���˵Ļ�û���������ǵľͲ�����
				give_expiation_award();
				SetTask(TASK_GOTPRESENT_DATE,nDate);
				ModifyGoldenExp(700000);
				Msg2Player("B�n nh�n ���c 700000 �i�m s�c kh�e");
				ModifyReputation(15,0);
				nLevel = GetLevel();
				if nLevel < 30 then
					give_random_page(20);
				elseif nLevel < 40 then
					give_random_page(30);				
				elseif nLevel < 50 then
					give_random_page(75);
				else
					give_random_page(100);
				end;
				if GetLevel() < 50 then
					AddItem(2,2,7,8)
					Msg2Player("B�n nh�n ���c 8 m�nh Thi�n th�ch");
				else
					AddItem(2,2,8,8)
					Msg2Player("B�n nh�n ���c 8 Thi�n th�ch");		
				end;
				WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."�� nh�n ph�n th��ng song nh�n Ng�u Lang Ch�c N�");
				Talk(1,"","<color=green>"..sNpcName.."<color>: Ch�c c�c ��i t�nh nh�n trong thi�n h� m�i m�i b�n nhau.");
			else
				Msg2Player("H�m nay b�n �� nh�n qua ph�n th��ng ho�c qu�n ch�a th�p s�ng sao, b�n kh�ng th� nh�n ph�n th��ng.")
			end;
		end;
		PlayerIndex = nOldPlayerIndex;
	else
		give_expiation_award();
		SetTask(TASK_GOTPRESENT_DATE,nDate);
		ModifyGoldenExp(500000);
		Msg2Player("B�n nh�n ���c 500000 �i�m s�c kh�e");
		ModifyReputation(10,0);
		if GetLevel() < 50 then
			AddItem(2,2,7,5)
			Msg2Player("B�n nh�n ���c 5 m�nh Thi�n th�ch");
		else
			AddItem(2,2,8,5)
			Msg2Player("B�n nh�n ���c 5 Thi�n th�ch");		
		end;
		nLevel = GetLevel();
		if nLevel < 30 then
			give_random_page(20);
		elseif nLevel < 40 then
			give_random_page(30);				
		elseif nLevel < 50 then
			give_random_page(75);
		else
			give_random_page(100);
		end;
		WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."�� nh�n ph�n th��ng c� nh�n ho�t ��ng Th�t T�ch-Ng�u Lang Ch�c N�");
		Talk(1,"","<color=green>"..sNpcName.."<color>: Ch�c c�c ��i t�nh nh�n trong thi�n h� m�i m�i b�n nhau.");
	end;
end;

tSpecialPage = {10,18,29,43,52,70,78,88,99,114,128,137,147,167}	--�����Ҫ��ϸ���
tNormalPage = {1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,19,20,21,22,23,24,25,26,27,28,30,31,32,
			   33,34,35,36,37,38,39,40,41,42,44,45,46,47,48,49,50,51,53,54,55,56,57,58,59,60,
			   61,62,63,64,65,66,67,68,69,71,72,73,74,75,76,77,79,80,81,82,83,84,85,86,87,89,
			   90,91,92,93,94,95,96,97,98,100,101,102,103,104,105,106,107,108,109,110,111,112,
			   113,115,116,117,118,119,120,121,122,123,124,125,126,127,129,130,131,132,133,134,
			   135,136,138,139,140,141,142,143,144,145,146,148,149,150,151,152,153,154,155,156,
			   157,158,159,160,161,162,163,164,165,166,168}
function give_random_page(nProbability)
	local nRandomNum = random(1,100);
	if nRandomNum <= nProbability then
		nRandomNum = random(1,322);
		if nRandomNum <= 14 then
			AddItem(2,6,tSpecialPage[random(1,getn(tSpecialPage))],1);
		else
			AddItem(2,6,tNormalPage[random(1,getn(tNormalPage))],1);
		end;
		Msg2Player("B�n nh�n ���c 1 quy�n b� ki�p");
	end;
end;

function give_expiation_award()
	if GetTask(TASK_EXPIATION_AWARD) == 1 then
		return 0;
	end;
	SetTask(TASK_EXPIATION_AWARD,1);
	local nMultiple = 0;
	local nPlantCount = GetTask(TASK_PLANT_STAR_COUNT);
	if nPlantCount == 1 then
		return 0;
	elseif nPlantCount == 2 and GetTask(TASK_GOTPRESENT_DATE) == 060729 then
		return 0;
	elseif nPlantCount == 2 and GetTask(TASK_GOTPRESENT_DATE) ~= 060729 then
		nMultiple = 1;
	elseif nPlantCount == 3 and GetTask(TASK_GOTPRESENT_DATE) == 060729 then
		nMultiple = 1
	elseif nPlantCount == 3 and GetTask(TASK_GOTPRESENT_DATE) ~= 060729 then
		nMultiple = 2
	end;
	if nMultiple == 0 then
		return 0;
	end;
	for i=1,nMultiple do
		ModifyGoldenExp(700000);
		Msg2Player("B�n nh�n ���c 700000 �i�m s�c kh�e");
		ModifyReputation(15,0);
		nLevel = GetLevel();
		if nLevel < 30 then
			give_random_page(20);
		elseif nLevel < 40 then
			give_random_page(30);				
		elseif nLevel < 50 then
			give_random_page(75);
		else
			give_random_page(100);
		end;
		if GetLevel() < 50 then
			AddItem(2,2,7,8)
			Msg2Player("B�n nh�n ���c 8 m�nh Thi�n th�ch");
		else
			AddItem(2,2,8,8)
			Msg2Player("B�n nh�n ���c 8 Thi�n th�ch");		
		end;
	end;
	WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."�� nh�n ph�n th��ng b�i th��ng ho�t ��ng Th�t T�ch, b�i s�:"..nMultiple);
	local sNpcName = GetTargetNpcName();
	Say("<color=green>"..sNpcName.."<color>: Do 2 ng�y 28 v� 29 c� ch�t tr�c tr�c, ch�ng t�i quy�t ��nh b�i th��ng ph�n th��ng 2 ng�y n�y cho b�n, xin h�y th�ng c�m.",0);
end;