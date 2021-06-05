--���ڸ��4
Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua")

VET_201401_SPRING2_ACTIVITYID = 111;

VET_201401_SPRING2_MAIN = "T�t n�m 2014/Vet_201401_sprint2_main";

VET_201401_SPRING2_TASK = TaskManager:Create(2, 14)
VET_201401_SPRING2_TASK.DaySeq = 1
VET_201401_SPRING2_TASK.TaskStep = 2
VET_201401_SPRING2_TASK.Award = 3
VET_201401_SPRING2_TASK.WildPig = 4
VET_201401_SPRING2_TASK.WildPigCount = 5

function Vet_201401_sprint2_main()
	if gf_GetPlayerRebornCount() < 1 then
		Talk(1,"","Nh�n v�t chuy�n sinh 1 tr� l�n m�i tham gia ���c ho�t ��ng");
		return 0;
	end
	if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.DaySeq,zgc_pub_day_turn());
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.TaskStep,0);
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.Award,0);
	end
	local tTask = {
		[1] = "Ti�u hao 1 V�ng + 1 gi� ��ng h� l�n m�ng",
		[2] = "Giao n�p 240 G� Qu�n D�ng",
		[3] = "Giao n�p 240 L� Dong",
		[4] = "Tr� l�i 3 c�u h�i",
		[5] = "��nh b�i 240 con Heo R�ng",
		[6] = "Ho�n th�nh nhi�m v�",
	}
	local nStep = VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.TaskStep)
	local tSay = {
		format("Nhi�m v� ng�y T�t (%s)/#Vet_201401_sprint2_task(%d)", tTask[min(nStep + 1, 6)], nStep),
		"Nh�n ph�n th��ng nhi�m v�/Vet_201401_sprint2_award",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("Ch�c M�ng N�m M�i ! ! !", getn(tSay), tSay);
end

function Vet_201401_sprint2_task(nStep, nTalk, nAns)
	if nStep == 0 then
		if GetCash() < 10000 then
			Talk(1,"",format("H�nh trang kh�ng gian %s kh�ng �� %d", "V�ng", 1).." Kim ");
			return 0;
		end
--		if GetGameTime() < 3600 then
--			Talk(1,"","Th�i gian tr�n m�ng li�n t�c kh�ng �� 1 ti�ng ��ng h�");
--			return 0;
--		end
		if GetOnlineTime() < 1 * 3600 then
			Talk(1,"IpBonus","Th�i gian tr�n m�ng c�a c�c h� ch�a �� 1 gi�!")
			return
		end		
		if SetOnlineTime(3600,2) < 0 then	
			return 0
		end
		if Pay(10000) ~= 1 then
			return 0;
		end
	end
	if nStep == 1 then
		if GetItemCount(2, 0, 308) < 240 then
			Talk(1,"",format("H�nh trang kh�ng gian %s kh�ng �� %d", "G� qu�n d�ng", 240));
			return 0;
		end
		if DelItem(2, 0, 308, 240) ~= 1 then
			return 0;
		end
	end
	if nStep == 2 then
		if GetItemCount(2, 1, 30619) < 240 then
			Talk(1,"",format("H�nh trang kh�ng gian %s kh�ng �� %d", "L� Dong", 240));
			return 0;
		end
		if DelItem(2, 1, 30619, 240) ~= 1 then
			return 0;
		end
	end
	if nStep == 3 then
		if nTalk == nil then
			Say("M�ng 1 T�t __, M�ng 3 T�t __.", 4, 
				format("M�, Cha/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 1, 1),
				format("Cha, M�/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 1, 2),
				format("Cha, Th�y/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 1, 3),
				format("�ng, B�/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 1, 4)
			)
			return 0;
		end
		if nTalk == 1 then
			if nAns ~= 3 then
				Talk(1,"","Tr� l�i sai!");
				return 0;
			end 
			Say("M�n �a Kh�ch ��o Thi�n T�i ��o, Gia H�u Nh�n Lai V�n V�t Lai ( c�u ��i n�y d�n � ��u trong nh� ?)", 4, 
				format("T��ng nh�/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 2, 1),
				format("S�n nh�/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 2, 2),
				format("S�n Nh�/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 2, 3),
				format("D�n ��u c�ng ���c/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 2, 4)
			)
			return 0;
		end
		if nTalk == 2 then
			if nAns ~= 3 then
				Talk(1,"","Tr� l�i sai!");
				return 0;
			end 
			Say("Ph�c Nh� __,Th� T� Nam S�n.", 4, 
				format("Nam H�i/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 3, 1),
				format("B�c H�i/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 3, 2),
				format("��ng H�i/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 3, 3),
				format("Long H�i/#Vet_201401_sprint2_task(%d, %d, %d)", nStep, 3, 4)
			)
			return 0;
		end
		if nTalk == 3 then
			if nAns ~= 3 then
				Talk(1,"","Tr� l�i sai!");
				return 0;
			end 
		end
	end
	if nStep == 4 then
		if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.WildPig) == 0 then
			VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.WildPig, 1);
			Talk(1,"","��i hi�p nhanh ch�ng �i t�m Heo R�ng v� ti�u di�t n�!");
			Msg2Player(format("Nhi�m v� ng�y T�t: Ti�u di�t %d/%d con Heo R�ng", 0, 240));
			return 0;
		end
		local nCount = VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.WildPigCount);
		if nCount < 240 then
			Talk(1,"",format("Nhi�m v� ng�y T�t: Ti�u di�t %d/%d con Heo R�ng", nCount, 240));
			return 0;
		end
	end
	if nStep + 1 <= 5 then
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.TaskStep, nStep + 1);
		Vet_201401_sprint2_main();
	else
		Msg2Player("Ng��i �� ho�n th�nh t�t c� nhi�m v� ng�y T�t, nhanh ch�n �i l�nh th��ng �i!");
		Talk(1,"","Ng��i �� ho�n th�nh t�t c� nhi�m v� ng�y T�t, nhanh ch�n �i l�nh th��ng �i!");
	end
	return 0;
end

function Vet_201401_sprint2_trigger(sName)
	if gf_CheckEventDateEx(VET_201401_SPRING2_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.WildPig) ~= 1 then
		return 0;
	end
	local nCount = VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.WildPigCount);
	if nCount >= 240 then
		return 0;
	end
	if sName == "Heo r�ng" then
		VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.WildPigCount, nCount + 1);
		Msg2Player(format("Nhi�m v� ng�y T�t: Ti�u di�t %d/%d con Heo R�ng", min(nCount + 1, 240), 240));
	end
end


function Vet_201401_sprint2_award()
	if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.Award) ~= 0 then
		Talk(1,"","Ng��i �� nh�n th��ng r�i");
		return 0;
	end
	if VET_201401_SPRING2_TASK:GetTask(VET_201401_SPRING2_TASK.TaskStep) ~= 5 then
		Talk(1,"","Ng��i ch�a ho�n th�nh nhi�m v� ng�y T�t");
		return 0;
	end
	if gf_Judge_Room_Weight(4, 10," ") ~= 1 then
		return 0;
	end
	VET_201401_SPRING2_TASK:SetTask(VET_201401_SPRING2_TASK.Award, 1);
	gf_ModifyExp(20142014);
	gf_AddItemEx2({2, 1, 30167, 39}, "D�a", "Event phu 4 thang 1");
	gf_AddItemEx2({2, 1, 30172, 39}, "Xo�i", "Event phu 4 thang 1");
	gf_AddItemEx2({2, 1, 30178, 39}, "�u ��", "Event phu 4 thang 1");
	gf_AddItemEx2({2, 1, 30179, 39}, "M�ng C�u", "Event phu 4 thang 1");
	-------------------------------------------------
	--Complete By Veit
	--Update Value of Pet : 100 point
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurPetLevel >= 1 then
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (100 * 100)) --�i�m n�ng c�p
		WriteLogEx("Event phu 4 thang 1", "nh�n th��ng s� d�ng v�t ph�m event ", 1, "100 �i�m n�ng c�p")
		Msg2Player("B�n nh�n ���c 100 �i�m N�ng C�p B�n ��ng H�nh")
	end
	if nCurPetLevel >= 2 then
		--Pet's psychic value: 20 piont
		Pet_AddGP(20)
		WriteLogEx("Event phu 4 thang 1", "nh�n th��ng s� d�ng v�t ph�m event ", 1, "20 �i�m linh l�c")
		Msg2Player("B�n nh�n ���c 20 �i�m Linh L�c B�n ��ng H�nh")
	end
	--
	-------------------------------------------------
end