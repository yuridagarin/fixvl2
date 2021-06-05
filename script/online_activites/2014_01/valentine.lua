--���ڸ��3
Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201401_VALENTINE_ACTIVITYID = 110;

VET_201401_VALENTINE_MAIN = "L� T�nh Nh�n 2014/Vet_201401_Valentine_Main";

VET_201401_VALENTINE_TASK = TaskManager:Create(1, 15)
VET_201401_VALENTINE_TASK.DaySeq = 1
VET_201401_VALENTINE_TASK.HuiTuZi = 2
VET_201401_VALENTINE_TASK.BaiTuZi = 3
VET_201401_VALENTINE_TASK.Task = 4
VET_201401_VALENTINE_TASK.Present = 5
VET_201401_VALENTINE_TASK.Award = 6
VET_201401_VALENTINE_TASK.MaleTimes = 7

function Vet_201401_Valentine_Main()
	if gf_GetPlayerRebornCount() < 1 then
		Talk(1,"","Nh�n v�t chuy�n sinh 1 tr� l�n m�i tham gia ���c ho�t ��ng");
		return 0;
	end
	if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.DaySeq, zgc_pub_day_turn());
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Present, 0);
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Award, 0);
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.MaleTimes, 0);
	end
	local tSay = {
		"Nh�n nhi�m v� L� T�nh Nh�n/Vet_201401_Valentine_Task",
		"Nh�n th��ng L� T�nh Nh�n/Vet_201401_Valentine_Award",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("Nguy�n cho th� gian h�u t�nh nh�n duy�n!", getn(tSay), tSay);
end

function Vet_201401_Valentine_Task(bAccept)
	if GetSex() ~= 2 then
		Talk(1,"","Ch� c� n� nh�n v�t m�i c� th� nh�n nhi�m v�");
		return 0;
	end
	if bAccept and tonumber(bAccept) == 1 then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Task, 1);
		Msg2Player("��i hi�p nhanh ch�ng �i t�m Th� X�m v� Th� Tr�ng �� ti�u di�t n�!");
		return 1;
	end
	local nHuituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.HuiTuZi);
	local nBaituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.BaiTuZi);
	local msg = format("1: ��nh b�i %d Th� X�m <color=yellow>(%d/%d)<color>\n2: ��nh b�i %d Th� Tr�ng <color=yellow>(%d/%d)<color>",
		 1402, nHuituzi, 1402, 1402, nBaituzi, 1402);
	local tSay = {};
	if nBaituzi >= 1402 and nHuituzi >=1402 then
		tinsert(tSay, "�� ho�n th�nh nhi�m v� n�y/nothing");
	else
		if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Task) == 0 then
			tinsert(tSay, "Nh�n nhi�m v� L� T�nh Nh�n/#Vet_201401_Valentine_Task(1)");
			tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
		else
			tinsert(tSay, "Nhi�m v� ch�a ho�n th�nh/nothing");
		end
	end
	Say(msg, getn(tSay), tSay);
end

function Vet_201401_Valentine_Trigger(sName)
	if gf_CheckEventDateEx(VET_201401_VALENTINE_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Task) ~= 1 then
		return 0;
	end
	local nHuituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.HuiTuZi);
	local nBaituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.BaiTuZi);
	if nHuituzi >= 1402 and nBaituzi >= 1402 then
		return 0;
	end
	if sName == "Th� x�m" and nHuituzi < 1402 then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.HuiTuZi, nHuituzi + 1);
		Msg2Player(format("Nhi�m v� L� T�nh Nh�n: ��nh b�i %s%d/%d", sName, nHuituzi + 1, 1402));
	end
	if sName == "Th� r�ng" and nBaituzi < 1402 then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.BaiTuZi, nBaituzi + 1);
		Msg2Player(format("Nhi�m v� L� T�nh Nh�n: ��nh b�i %s%d/%d", sName, nBaituzi + 1, 1402));
	end
end

function Vet_201401_Valentine_Award()
	if GetSex() ~= 2 then
		Talk(1,"","Ph�n th��ng n�y ch� c� nh�n v�t n� s� d�ng");
		return 0;
	end
	local nHuituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.HuiTuZi);
	local nBaituzi = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.BaiTuZi);
	if nHuituzi < 1402 or nBaituzi < 1402 then
		Talk(1,"","Ng��i ch�a ho�n th�nh nhi�m v� L� T�nh Nh�n");
		return 0;
	end
	local nUseTime = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Present);
	local tSay = {
		format("Ti�u hao 1402 Ti�u Dao Ng�c + 999 T�ng H�ng Hoa �� nh�n v�t nam trong t� ��i nh�n th��ng (%d/%d)/#Vet_201401_Valentine_Present(%d)", nUseTime, 3, nUseTime),
		"Ta mu�n nh�n ph�n th��ng L� T�nh Nh�n 2014/Vet_201401_Valentine_Award_deal",
		"T�i h� ch� xem qua th�i/nothing"
	}
	Say("Nguy�n cho th� gian h�u t�nh nh�n duy�n!", getn(tSay), tSay);
end

function Vet_201401_Valentine_Present(nUseTime)
	if tonumber(nUseTime) >= 3 then
		Talk(1,"",format("M�i ng�y m�i nh�n v�t nhi�u nh�t ch� c� th� s� d�ng ph�n th��ng %d l�n", 3));
		return 0;
	end
	if GetCaptainName() ~= GetName() then
		Talk(1,"","Ng��i kh�ng ph�i ��i tr��ng, kh�ng th� s� d�ng t�nh n�ng n�y!");
		return 0;
	end
	local oldPlayerIdx = PlayerIndex;
	local malePlayerIdx = nil
	local maleName = nil
	local maleCount = 0;
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i);
		if GetSex() == 1 then
			maleCount = maleCount + 1;
			malePlayerIdx = PlayerIndex;
			maleName = GetName();
		end
	end
	PlayerIndex = oldPlayerIdx;
	if maleCount == 0 then
		Talk(1,"","T� ��i kh�ng c� nh�n v�t nam");
		return 0;
	end
	if maleCount > 1 then
		Talk(1,"",format("Trong t� ��i s� l��ng nh�n v�t nam v��t qu� %d ng��i", 1));
		return 0;
	end
	if GetItemCount(2, 1, 30603) < 1402 then
		Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "Ti�u Dao Ng�c", 1402));
		return 0;
	end
	if GetItemCount(1, 2, 1) < 999 then
		Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "T�ng H�ng Hoa", 999));
		return 0;
	end
	--------------------------
	PlayerIndex = malePlayerIdx;
	if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.DaySeq, zgc_pub_day_turn());
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Present, 0);
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Award, 0);
		VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.MaleTimes, 0);
	end
	local nMaleTimes = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.MaleTimes);
	PlayerIndex = oldPlayerIdx;
	if nMaleTimes ~= 0 then
		Talk(1,"","Nh�n v�t nam n�y �� nh�n l� v�t L� T�nh Nh�n r�i");
		return 0;
	end
	---------------------------
	if DelItem(2, 1, 30603, 1402) ~= 1 or DelItem(1, 2, 1, 999) ~= 1 then
		return 0;
	end
	VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Present, tonumber(nUseTime) + 1);
	----------------------------------------------
	PlayerIndex = malePlayerIdx;
	VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.MaleTimes, 1);
	gf_ModifyExp(520520520);
	gf_EventGiveCustomAward(4, 520, 1, "Event ph� 3 th�ng 1");
  gf_EventGiveCustomAward(3, 520, 1, "Event ph� 3 th�ng 1");
  gf_EventGiveCustomAward(31, 520, 1, "Event ph� 3 th�ng 1");
  AwardGenuineQi(520);
  PlayerIndex = oldPlayerIdx;
  ----------------------------------------------
  local msg = format("[%s] h��ng v� [%s] d�ng t�ng l� v�t t�nh nh�n, nguy�n cho th� gian h�u t�nh nh�n duy�n!", GetName(), maleName);
  Msg2Global(msg);
end

function Vet_201401_Valentine_Award_deal()
	if VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Award) ~= 0 then
		Talk(1,"","�� nh�n th��ng L� T�nh Nh�n");
		return 0;
	end 
	local nUseTime = VET_201401_VALENTINE_TASK:GetTask(VET_201401_VALENTINE_TASK.Present);
	if nUseTime < 3 then
		Talk(1,"",format("S� l�n d�ng t�ng qu� L� T�nh Nh�n cho nam s� kh�ng �� %d", 3));
		return 0;
	end
	if gf_Judge_Room_Weight(5, 100, "") ~= 1 then
		return 0;
	end
	VET_201401_VALENTINE_TASK:SetTask(VET_201401_VALENTINE_TASK.Award, 1);
	gf_ModifyExp(25251325);
	AwardGenuineQi(1402);
	local tAward = {
		{"Nh�n", 2,	1,	30164},
		{"Ch�m Ch�m", 2,	1,	30165},
		{"Cam", 2,	1,	30166},
		{"D�a", 2,	1,	30167},
		{"M�ng c�t", 2,	1,	30168},
		{"B��i", 2,	1,	30169},
		{"D�u", 2,	1,	30170},
		{"Chu�i", 2,	1,	30171},
		{"Xo�i", 2,	1,	30172},
		{"��o", 2,	1,	30173},
		{"M�n", 2,	1,	30174},
		{"V�i", 2,	1,	30175},
		{"T�o", 2,	1,	30176},
		{"B�", 2,	1,	30177},
		{"�u ��", 2,	1,	30178},
		{"M�ng C�u", 2,	1,	30179},
		{"Kh�m", 2,	1,	30180},
		{"L�", 2,	1,	30181},
		{"B�n Bon", 2,	1,	30182},
		{"Kh�", 2,	1,	30183},		
	}
--	for i = 1, 87 do
--		local nRand = random(getn(tAward));
--		AddItem(tAward[nRand][2], tAward[nRand][3], tAward[nRand][4], 16);
--	end
		local nRandom = mod(random(1,10000),20)
		AddItem(2,1,(30164 + nRandom), 1402)
end