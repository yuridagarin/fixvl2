--2014��2�¸��2
Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201402_ACTIVITYID = 114;

VET_201402_MAIN = "Sa Trung Kim /Vet_201402_main";

VET_201402_TASK = TaskManager:Create(6, 8)
VET_201402_TASK.DaySeq = 1;
VET_201402_TASK.TASK = 2;
VET_201402_TASK.AWARD = 3;
VET_201402_TASK.KILL1 = 4;
VET_201402_TASK.KILL2 = 5;
VET_201402_TASK.KILL3 = 6;


function Vet_201402_main()
	if VET_201402_TASK:GetTask(VET_201402_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201402_TASK:SetTask(VET_201402_TASK.DaySeq,zgc_pub_day_turn());
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK,0);
		VET_201402_TASK:SetTask(VET_201402_TASK.AWARD,0);
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL1,0);
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL2,0);
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL3,0);
	end
	local tSay = {
		"nh�n nhi�m v� 'Sa Trung Kim'/Vet_201402_AcceptTask",
		"Nh�n ph�n th��ng nhi�m v� 'Sa Trung Kim'(ti�u hao 199 v�ng v� 99 Ti�u Dao Ng�c )/Vet_201402_Award",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("<color=green>L�c Tr�c �ng: <color>���ng ph� h�m nay th�t n�o nhi�t.", getn(tSay), tSay);
end

function Vet_201402_AcceptTask()
	local nStep = VET_201402_TASK:GetTask(VET_201402_TASK.TASK);
	if nStep ~= 0 then
		Talk(1,"","B�n �� nh�n nhi�m v� 'Sa Trung Kim'");
		if nStep == 1 then
			Msg2Player("��n Quang Minh ��nh t�m �n Minh");
		elseif nStep == 2 then
			Msg2Player("��n m� cung sa m�c t�m B�ch Ti�n Th�nh");
		elseif nStep == 3 then
			Msg2Player("ti�u di�t 333 Sa M�c H�nh Nh�n, ti�u di�t 555 T�m B�o Nh�n");
		elseif nStep == 4 then
			Msg2Player("��n D��c V��ng ��ng t�m D��c Th�t Th� V�");
		elseif nStep == 5 then
			Msg2Player("Ti�u di�t 99 ng��i c�y");
		elseif nStep == 6 then
			Msg2Player("B�n �� ho�n th�nh nhi�m v� 'Sa Trung Kim'");
		end
		return 0;
	end
	VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 1);
	Msg2Player("��n Quang Minh ��nh t�m �n Minh".."Th�nh gi�o gi� kim m�t thu�t");
	TaskTip("��n Quang Minh ��nh t�m �n Minh".."Th�nh gi�o gi� kim m�t thu�t");
end

function Vet_201402_Award()
	if VET_201402_TASK:GetTask(VET_201402_TASK.AWARD) ~= 0 then
		Talk(1,"","B�n �� s� d�ng ph�n th��ng 'Sa Trung Kim'");
		return 0;
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) ~= 6 then
		Talk(1,"","B�n ch�a ho�n th�nh xong nhi�m v� 'Sa Trung Kim', kh�ng th� s� d�ng ph�n th��ng ");
		return 0;
	end
	if gf_Judge_Room_Weight(21, 100, " ") ~= 1 then
		return 0;
	end
	if GetCash() < 199*10000 then
		Talk(1,"",format("Ng�n l��ng kh�ng �� %d v�ng", 199));
		return 0;
	end
	if GetItemCount(2,1,30603) < 99 then
		Talk(1,"",format("S� l��ng Ti�u Dao Ng�c trong t�i kh�ng �� %d ", 99));
		return 0;
	end
	if Pay(199*10000) ~= 1 or DelItem(2,1,30603,99) ~= 1 then
		return 0;
	end
	VET_201402_TASK:SetTask(VET_201402_TASK.AWARD, 1);
	gf_ModifyExp(1234567890);
	local tFruitAward = {
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
	for i = 1, getn(tFruitAward) do
		gf_AddItemEx2({tFruitAward[i][2],tFruitAward[i][3],tFruitAward[i][4], 12}, tFruitAward[i][1], "Event phu 2 thang 2 nam 2014", "Nhi�m v� 'Sa Trung Kim'", 0, 1);
	end
	local tAward = {
		{31, 40000, "Vet_201402_70Book()", 1},
		{1, 15550, "Ch�a Kh�a V�ng", {2, 1, 30133, 1}, 0},
		{32, 4000, 6789, 1},
		{1, 15000, "Ma Tinh", {2, 1, 30497, 50}, 0},
		{1, 1, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 0},
		{1, 1, "T�i Thi�n Th�ch Tinh Th�ch", {2, 1, 3356, 1}, 7 * 24 * 3600},
		{1, 15998, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
		{1, 7250, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 2200, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		--{1, 100, "14��ǿ����", {2, 1, 30426, 1}, 7 * 24 * 3600},
		--{1, 500, "15��ǿ����", {2, 1, 30427, 1}, 7 * 24 * 3600},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event phu 2 thang 2 nam 2014", "Nhi�m v� 'Sa Trung Kim'");
end

function Vet_201402_70Book()
	local tBook = {
		[2] =  {0, 107, 204, "Kim Cang B�t Ch�n Quy�n"},
		[4] =  {0, 107, 205, "Ti�m Long T�ch Di�t Ch�n Quy�n"},
		[3] =  {0, 107, 206, "V� Tr�n B� �� Ch�n Quy�n"},
		[6] =  {0, 107, 207, "Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] =  {0, 107, 208, "Nh� � Kim ��nh M�t Ch�n Quy�n"},
		[9] =  {0, 107, 209, "B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0, 107, 210, "H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0, 107, 211, "Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0, 107, 212, "Huy�n �nh M� Tung Ch�n Quy�n"},
		[15] = {0, 107, 213, "Qu�n T� Ti�t Phong Ch�n Quy�n"},
		[17] = {0, 107, 214, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0, 107, 215, "Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0, 107, 216, "Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0, 107, 217, "Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0, 107, 218, "C�u Thi�n Phong L�i Ch�n Quy�n"},
		[29] = {0, 107, 222, "H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0, 107, 223, "Phong Hoa Thi�n Di�p Ch�n Quy�n"},
	}
	local nRoute = GetPlayerRoute();
	if not tBook[nRoute] then return 0; end
	gf_AddItemEx2({tBook[nRoute][1],tBook[nRoute][2],tBook[nRoute][3], 1}, tBook[nRoute][4], "Event phu 2 thang 2 nam 2014", "Nhi�m v� 'Sa Trung Kim'", 0, 1);
end

function Vet_201402_KillNpc1(szName)
	if gf_CheckEventDateEx(VET_201402_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) ~= 3 then
		return 0;
	end
	if szName == "Sa M�c H�nh Nh�n" and VET_201402_TASK:GetTask(VET_201402_TASK.KILL1) < 333 then
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL1, VET_201402_TASK:GetTask(VET_201402_TASK.KILL1) + 1);
		Msg2Player(format("Ti�u di�t Sa M�c H�nh Nh�n %d/333", VET_201402_TASK:GetTask(VET_201402_TASK.KILL1)));
	elseif szName == "T�m B�o Nh�n" and VET_201402_TASK:GetTask(VET_201402_TASK.KILL2) < 555 then
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL2, VET_201402_TASK:GetTask(VET_201402_TASK.KILL2) + 1);
		Msg2Player(format("Ti�u di�t T�m B�o Nh�n %d/555", VET_201402_TASK:GetTask(VET_201402_TASK.KILL2)));
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.KILL1) >= 333 and VET_201402_TASK:GetTask(VET_201402_TASK.KILL2) >= 555 then
		Talk(1,"","��n D��c V��ng ��ng t�m D��c Th�t Th� V�, th�nh gi�o m�t thu�t (196/178)");
		TaskTip("��n D��c V��ng ��ng t�m D��c Th�t Th� V�, th�nh gi�o m�t thu�t (196/178)");
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 4);
	end
end

function Vet_201402_KillNpc2(szName)
	if gf_CheckEventDateEx(VET_201402_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) ~= 5 then
		return 0;
	end
	if szName == "Ng��i c�y" and VET_201402_TASK:GetTask(VET_201402_TASK.KILL3) < 99 then
		VET_201402_TASK:SetTask(VET_201402_TASK.KILL3, VET_201402_TASK:GetTask(VET_201402_TASK.KILL3) + 1);
		Msg2Player(format("Ti�u di�t ng��i c�y %d/99", VET_201402_TASK:GetTask(VET_201402_TASK.KILL3)));
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.KILL3) >= 99 then
		Talk(1,"","Ho�n th�nh nhi�m v�, Thao Xuy�n Kim-trang s�c v�ng-gi� kim thu�t t�ng ng��i, quay v� t�m L�u Tr�c �ng �� nh�n th��ng.");
		Msg2Player("Ho�n th�nh nhi�m v�, Thao Xuy�n Kim-trang s�c v�ng-gi� kim thu�t t�ng ng��i, quay v� t�m L�u Tr�c �ng �� nh�n th��ng.");
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 6);
	end
end