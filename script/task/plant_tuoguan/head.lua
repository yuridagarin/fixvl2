--=============================================
--create by baiyun 2009.8.25
--describe:Խ�ϰ�8�·ݵ��� �����й�����ͷ�ļ�
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--���л���й������Ͻ�����֤�齱����ͳһͷ�ļ�
Include("\\script\\lib\\writelog.lua");
Include("\\script\\online_activites\\award.lua")
						--����������Ļ���
TASK_TUOGUAN_PLANT_POINT = 2255;				
TASK_TUOGUAN_PLANT_WANT_ACTIVE_TIME = 2256;	--���NPC���󼤻��ʱ��
TASK_TUOGUAN_PLANT_ACTIVE_TIME = 2257;			--��Ҽ����йܵ�ʱ��
TASK_TUOGUAN_PLANT_HAS_ACTIVE = 2258;				--����Ƿ��Ѿ������й�����
TASK_TUOGUAN_PLANT_DATE = 2259;							--��ҽ����йܵ�����
TASK_TUOGUAN_PLANT_COUNT = 2260;						--��ҽ����Ѿ��йܵĴ���
TASK_TUOGUAN_PLANT_TYPE = 2261;							--����йܵ����ͣ��Լ��йܻ��ǰ��������
TASK_TUOGUAN_GIVE_BANRUO_DATE = 2272;				--�й������Ͻ�����֤�������
TASK_TUOGUAN_GIVE_BANRUO_COUNT = 2273;			--�й������Ͻ�����֤�������
TASK_TUOGUAN_GET_AWARD_DATE = 2274;					--�й�������ȡ����������
TASK_TUOGUAN_GET_AWARD_FLAG = 2275;					--�й�������ȡ�����ļ�¼���

str_TUOGUAN_LOG = "[�y th�c tr�ng c�y:]";

--�йܳɹ��ĸ���
t_TUOGUAN_PLANT_RAND = {75, 75, 50, 75, 50};

--�����������õĻ���
t_TUOGUAN_HELP_POINT = {
	{1, 46},
	{2, 46},
	{3, 7},
	{4, 1},
};
t_ZONE = {"HCM 1", "HCM 2", "HCM 3", "HN 1", "HN 2"};

--�йܵľ��齱��
t_TUOGUAN_EXP = {
	--�й�����
	{
		{200000, 40},
		{300000, 20},
		{400000, 20},
		{500000, 20},
	},
	--���������
	{
		{600000, 30},
		{700000, 40},
		{800000, 30},
	}
};

--�йܵõĽ���
t_TUOGUAN_AWARD = {
--�й�����
--���������,������ͬ
	--{"Th�i H� �a M�t Qu� ", 	60, {2,1,387,1}},
	{"V�ng Th�i H� B�t Qu�i - C�n", 354, {2,1,469,3}},
	{"V�ng Th�i H� B�t Qu�i - Kh�n", 290, {2,1,470,3}},
	{"V�ng Th�i H� B�t Qu�i - Kh�m", 60, {2,1,471,3}},
	{"V�ng Th�i H� B�t Qu�i - �o�i", 40, {2,1,472,3}},
	{"V�ng Th�i H� B�t Qu�i - Ly", 40, {2,1,473,3}},
--	{"V�ng Th�i H� B�t Qu�i - Ch�n", 1, {2,1,474,1}},
--	{"V�ng Th�i H� B�t Qu�i - C�n", 100, {2,1,475,1}},
--	{"V�ng Th�i H� B�t Qu�i - T�n", 3, {2,1,476,1}},
	{"Ng� H�nh M�t t�ch", 			4, {0,107,155,1}},
	{"Nguy�t Hoa Chi Tinh", 			3, {2,1,3219,1}},
	{"Nguy�t Hoa ", 					4, {2,1,2002,1}},
	{"X�ch Thi�t Tinh", 				204, {2,1,2652,1}},
	{"N�ng Tang ph�", 			1, {2,1,1056,1}},
--	{"Long Huy�t ho�n", 				1, {2,1,1002,1}},
--	{"K� L�n ho�n", 				1, {2,1,1003,1}},
--	{"Ph�ng Huy�t ho�n", 				1, {2,1,1004,1}},
--	{"Chi�n Th�n ho�n", 				1, {2,1,1005,1}},
};

--����8������֤���õ��Ľ���
t_TUOGUAN_8_AWARD = {
	-- {"B�n Long b�ch", 10, {2,1,1000,1}, 15*24*3600},
	{"M�t n� S�t Th� ���ng", 10, {2,1,1087,1}, 15*24*3600},
	{"Th�n N�ng ��n", 10, {2,1,343,1}, 15*24*3600},
	{"Th� Th�n ph�", 10, {2,0,556,1}, 15*24*3600},
	{"Tu Ch�n Y�u Quy�t", 10, {2,0,554,1}, 15*24*3600},
	-- {"T�ng Ki�m anh h�ng thi�p", 10, {2,0,31,1}, 15*24*3600},
	{"S� m�n m�t h�m", 10, {2,1,1020,1}, 15*24*3600},
--	{"��i Nh�n s�m", 10, {2,0,553,1}, 15*24*3600},
	{"Th�n h�nh b� ph�", 10, {0,200,39,1}, 15*24*3600},
	-- {"Tinh �i�u hoa c��ng th�ch", 10, {2,1,1023,1}, 15*24*3600},
};


--���ֻ�ȡ�����Ľ����б�
t_TUOGUAN_POINT_TO_AWARD = {
	{"M�t t�ch m�n ph�i cao c�p 70", nil},
	{"Nh�n S�m V�n N�m", {2,1,30071,6}},
	{"Tr�i c�y", nil},
	{"Thi�n Th�ch linh th�ch", {2,1,1068,1}, 30 * 24 * 3600},
	{"Nh�n S�m V�n N�m", {2,1,30071,6}},
	{"H�a Th� B�ch", {2,1,1001,2}, 7 * 24 * 3600},
	{"Tr�i c�y", nil},
	{"Nh�n S�m V�n N�m", {2,1,30071,6}},
	{"��nh H�n Thi�n Th�ch Th�n Th�ch", {2,1,1067,1}, 30 * 24 * 3600},
	{"Thi�n Cang L�nh",{2, 95, 204,2}}, 
	{"Nh�n S�m V�n N�m", {2,1,30071,6}},
	{"��i ��nh H�n", {2,1,1113,1}, 30 * 24 * 3600},
	{"Thi�n M�n Kim L�nh", {2,1,30370,2}},
	{"Nh�n S�m V�n N�m", {2,1,30071,6}},
	{"L�ng Ba Vi B�", {0,112,78,1}},
	{"T�i Thi�n Th�ch Tinh Th�ch", {2,1,3356,1}, 30 * 24 * 3600},
	{"Tr�i c�y", nil},
	{"Chuy�n Sinh ��n", {2,1,30345,1}, 30 * 24 * 3600},
	{"Thi�n Th�ch linh th�ch", {2,1,1068,1}, 30 * 24 * 3600},
	{"H�a Th� B�ch", {2,1,1001,2}, 7 * 24 * 3600},
	{"Nh�n S�m V�n N�m", {2,1,30071,6}},
	{"��nh H�n Thi�n Th�ch Th�n Th�ch", {2,1,1067,1}, 30 * 24 * 3600},
	{"T�i Thi�n Th�ch Tinh Th�ch", {2,1,3356,1}, 30 * 24 * 3600},
	{"L�ng Ba Vi B� to�n t�p", {0,112,158,1}},
	{"Tr�i c�y", nil},
	{"H�a Th� B�ch", {2,1,1001,2}, 7 * 24 * 3600},
	{"Nh�n S�m V�n N�m", {2,1,30071,6}},
	{"Chuy�n Sinh ��n", {2,1,30345,1}, 30 * 24 * 3600},
	{"Thi�n M�n Kim L�nh", {2,1,30370,2}},
	{"Nh�n S�m V�n N�m", {2,1,30071,18}},
}

-- M�t t�ch cao c�p 70
t_TUOGUAN_HIG = {
	[2] = {"Kim Cang B�t Nh� Ch�n Quy�n", {0,107,204,2,4}},
	[3] = {"V� Tr�n B� �� Ch�n Quy�n",{0,107,206,2,4}},
	[4] = {"Ti�m Long T�c Di�t Ch�n Quy�n",{0,107,205,2,4}},
	[6] = {"Thi�n La Li�n Ch�u Ch�n Quy�n",{0,107,207,2,4}},
	[8] = {"Nh� � Kim ��nh Ch�n Quy�n",{0,107,208,2,4}},
	[9] = {"B�ch H�i Tuy�t �m Ch�n Quy�n",{0,107,209,2,4}},
	[11] = {"H�n ��n Tr�n Nh�c Ch�n Quy�n",{0,107,210,2,4}},
	[12] = {"Qu� Thi�n Du Long Ch�n Quy�n",{0,107,211,2,4}},
	[14] = {"Huy�n �nh M� T�ng Ch�n Quy�n",{0,107,212,2,4}},
	[15] = {"Qu�n T� ��i Phong Ch�n Quy�n",{0,107,213,2,4}},
	[17] = {"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n",{0,107,214,2,4}},
	[18] = {"Xuy�n V�n L�c H�ng Ch�n Quy�n",{0,107,215,2,4}},
	[20] = {"Huy�n Minh Phong Ma Ch�n Quy�n",{0,107,216,2,4}},
	[21] = {"Linh C� Huy�n T� Ch�n Quy�n",{0,107,217,2,4}},
	[23] = {"C�u Thi�n Phong L�i Ch�n Quy�n", {0,107, 218,2,4}},		
	[29] = {"H�ng Tr�n T�y M�ng Ch�n Quy�n", {0,107, 222,2,4}},		
	[30] = {"Phong Hoa Thi�n Di�p Ch�n Quy�n", {0,107, 223,2,4}},			
};
--���ֻ�ȡ�������ؼ�
-- M�t t�ch 70
t_TUOGUAN_MIJI = {
	[2] = {"Kim Cang B�t Nh� Kinh", {0,107,166,2}},
	[3] = {"V� Tr�n B� �� Kinh",{0,107,168,1}},
	[4] = {"Ti�m Long T�ch Di�t Kinh",{0,107,167,1}},
	[6] = {"Thi�n La Li�n Ch�u L�c",{0,107,169,1}},
	[8] = {"Nh� � Kim ��nh M�t T�ch",{0,107,170,1}},
	[9] = {"B�ch H�i Tuy�t �m Ph�",{0,107,171,1}},
	[11] = {"H�n ��n Tr�n Nh�c M�t T�ch"	,{0,107,172,1}},
	[12] = {"Qu� Thi�n Du Long M�t T�ch",{0,107,173,1}},
	[14] = {"Huy�n �nh M� Tung M�t T�ch",{0,107,174,1}},
	[15] = {"Qu�n T� Ti�t Phong M�t T�ch",{0,107,175,1}},
	[17] = {"Tr�n Qu�n Phi Long Th��ng Ph�"	,{0,107,176,1}},
	[18] = {"Xuy�n V�n L�c H�ng M�t T�ch",{0,107,177,1}},
	[20] = {"U Minh Phong Ma L�c",{0,107,178,1}},
	[21] = {"Linh C� Huy�n T� L�c",{0,107,179,1}},
	[23] = {"C�u Thi�n Phong L�i Quy�t",{0,107,198,1}},	
	[29] = {"H�ng Tr�n T�y M�ng Ph�",{0,107,202,1}},
	[30] = {"Phong Hoa Thi�n Di�p Ph�",{0,107,203,1}},
};

t_TUOGUAN_MIJI2 = {
	[2] = {"Kim Cang B�t Nh� Kinh", {0,107,166,2}},
	[3] = {"V� Tr�n B� �� Kinh",{0,107,168,2}},
	[4] = {"Ti�m Long T�ch Di�t Kinh",{0,107,167,2}},
	[6] = {"Thi�n La Li�n Ch�u L�c",{0,107,169,2}},
	[8] = {"Nh� � Kim ��nh M�t T�ch",{0,107,170,2}},
	[9] = {"B�ch H�i Tuy�t �m Ph�",{0,107,171,2}},
	[11] = {"H�n ��n Tr�n Nh�c M�t T�ch"	,{0,107,172,2}},
	[12] = {"Qu� Thi�n Du Long M�t T�ch",{0,107,173,2}},
	[14] = {"Huy�n �nh M� Tung M�t T�ch",{0,107,174,2}},
	[15] = {"Qu�n T� Ti�t Phong M�t T�ch",{0,107,175,2}},
	[17] = {"Tr�n Qu�n Phi Long Th��ng Ph�"	,{0,107,176,2}},
	[18] = {"Xuy�n V�n L�c H�ng M�t T�ch",{0,107,177,2}},
	[20] = {"U Minh Phong Ma L�c",{0,107,178,2}},
	[21] = {"Linh C� Huy�n T� L�c",{0,107,179,2}},
	[23] = {"C�u Thi�n Phong L�i Quy�t",{0,107,198,2}},	
	[29] = {"H�ng Tr�n T�y M�ng Ph�",{0,107,202,2}},
	[30] = {"Phong Hoa Thi�n Di�p Ph�",{0,107,203,2}},	
};
-- M�t t�ch 45
t_TUOGUAN_LOW = {
	[2] = {"Kim Cang Ph�c Ma kinh",{0,107, 1,2}},
	[3] = {"V� Tr�n M�t t�ch",{0,107, 5,2}},
	[4] = {"Ti�m Long M�t t�ch",	{0,107, 3,2}},
	[6] = {"Thi�n La M�t T�ch",{0,107, 7,2}},
	[8] = {"Nh� � M�t T�ch",{0,107, 9,2}},
	[9] = {"B�ch H�i Ph�",{0,107,11,2}},
	[11] = {"H�n ��n M�t t�ch",{0,107,13,2}},
	[12] = {"Qu� Thi�n M�t t�ch",{0,107,15,2}},
	[14] = {"Huy�n �nh M�t t�ch",{0,107,17,2}},
	[15] = {"Qu�n T� M�t t�ch",{0,107,19,2}},
	[17] = {"Tr�n Qu�n M�t t�ch",{0,107,21,2}},
	[18] = {"Xuy�n V�n M�t t�ch",{0,107,23,2}},
	[20] = {"U Minh Qu� L�c",{0,107,25,2}},
	[21] = {"Linh C� M�t t�ch",{0,107,27,2}},
	[23] = {"Kinh Phong M�t T�ch",{0,107,180,2}},
	[29] = {"T�y M�ng M�t t�ch",{0,107,188,2}},
	[30] = {"Ph�n Hoa M�t t�ch",{0,107,190,2}},			
};

--���ֻ���Ҫ����
t_TUOGUAN_JUEYAO = {
	[2] = {"T�i b� ki�p Thi�u L�m", {2,0,607,1}},
	[3] = {"T�i b� ki�p Thi�u L�m",{2,0,607,1}},
	[4] = {"T�i b� ki�p Thi�u L�m",{2,0,607,1}},
	[6] = {"T�i b� ki�p ���ng M�n",{2,0,608,1}},
	[8] = {"T�i b� ki�p Nga My",{2,0,609,1}},
	[9] = {"T�i b� ki�p Nga My",{2,0,609,1}},
	[11] = {"T�i b� ki�p C�i Bang"	,{2,0,610,1}},
	[12] = {"T�i b� ki�p C�i Bang",{2,0,610,1}},
	[14] = {"T�i b� ki�p V� �ang",{2,0,611,1}},
	[15] = {"T�i b� ki�p V� �ang",{2,0,611,1}},
	[17] = {"T�i b� ki�p D��ng M�n"	,{2,0,612,1}},
	[18] = {"T�i b� ki�p D��ng M�n",{2,0,612,1}},
	[20] = {"T�i b� ki�p Ng� ��c",{2,0,613,1}},
	[21] = {"T�i b� ki�p Ng� ��c",{2,0,613,1}},
};

function plant_tuoguan(nType, nPay, nZone)
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE) == 1 then
		if GetTask(TASK_TUOGUAN_PLANT_TYPE) == 1 then
			Talk(1, "", "Thi�u hi�p �� nh� ng��i tr�ng c�y gi�p, 900 gi�y sau h�y ��n S� Gi� V� L�m �� nh�n th��ng.");
			return 0;
		else
			Talk(1, "", "Thi�u hi�p �� ��ng k� th�nh c�ng tr�ng c�y gi�p ng��i kh�c, 360 gi�y sau h�y quay l�i nh�n th��ng.");
			return 0;
		end
	end
	if GetTask(TASK_TUOGUAN_PLANT_DATE) ~= nDate then
		SetTask(TASK_TUOGUAN_PLANT_COUNT, 0);
	end
	if GetTask(TASK_TUOGUAN_PLANT_COUNT) >= 5 then
		Talk(1, "", "H�m nay thi�u hi�p �� �y th�c tr�ng c�y v� gi�p ng��i kh�c tr�ng c�y th�nh c�ng, kh�ng th� �y th�c th�m ho�c gi�p ng��i kh�c tr�ng c�y n�a.");
		return 0;
	end
	local nDiff = GetTime() - GetTask(TASK_TUOGUAN_PLANT_WANT_ACTIVE_TIME);
	if nDiff < 60 then
		Talk(1, "", "Thi�u hi�p c�n ph�i ��i th�m"..(60 - nDiff).." gi�y m�i c� th� ti�p t�c �y th�c tr�ng c�y.");
		return 0;
	end
	if nType == 1 then
		if GetItemCount(2, 0, 398) == 0 or GetItemCount(2, 0, 351) < 7 or GetItemCount(2, 1, 509) == 0 then
			Talk(1, "", "Nguy�n li�u tr�n ng��i kh�ng ��, kh�ng th� �y th�c tr�ng c�y");
			return 0;
		end
	elseif nType == 2 then
		if GetItemCount(2, 1, 30114) == 0 then
			Talk(1, "", "Tr�n ng��i kh�ng c� b�t nh� ch�ng th�, kh�ng th� �y th�c tr�ng c�y");
			return 0;
		end
	end
	if nType == 1 then
		if random(1, 100) > t_TUOGUAN_PLANT_RAND[nType] then
			Talk(1, "", "Hi�n t�i � server �� ch�n ch�a c� ng��i nh�n tr�ng c�y/ �� �� s� l��ng c�ng vi�c. Xin h�y ��ng k� l�i trong 60 gi�y n�a");
			SetTask(TASK_TUOGUAN_PLANT_WANT_ACTIVE_TIME, GetTime());
			return 0;
		end
	elseif nType == 2 then
		if random(1, 100) > 75 then
			Talk(1, "", "Hi�n t�i � server �� ch�n ch�a c� ng��i nh�n tr�ng c�y/ �� �� s� l��ng c�ng vi�c. Xin h�y ��ng k� l�i trong 60 gi�y n�a");
			SetTask(TASK_TUOGUAN_PLANT_WANT_ACTIVE_TIME, GetTime());
			return 0;
		end
	end
	if Pay(nPay * 10000) == 0 then
		Talk(1, "", "Ng�n l��ng c�a b�n kh�ng ��!");
		return 0;
	end
	if nType == 1 then
		if DelItem(2, 0, 398, 1) == 1 and DelItem(2, 0, 351, 7) == 1 and DelItem(2, 1, 509, 1) == 1 then
			SetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE, 1);
			SetTask(TASK_TUOGUAN_PLANT_DATE, nDate);
			SetTask(TASK_TUOGUAN_PLANT_COUNT, GetTask(TASK_TUOGUAN_PLANT_COUNT) + 1);
			SetTask(TASK_TUOGUAN_PLANT_ACTIVE_TIME, GetTime());
			SetTask(TASK_TUOGUAN_PLANT_TYPE, nType);
			Talk(1, "", "��i hi�p �� �y th�c tr�ng c�y th�nh c�ng, xin m�i ��i 900 gi�y sau ��n <color=green>V� L�m S� Gi�<color> nh�n th��ng.");
			Msg2Player("��i hi�p �� �y th�c tr�ng c�y th�nh c�ng, xin m�i ��i 900 gi�y sau ��n V� L�m S� Gi� nh�n th��ng.");
			if nZone ~= 0 then 
				WriteLogEx("Uy thac trong cay", "Uy Thac", 1, t_ZONE[nZone]);
			end
		end
	elseif nType == 2 then
		if DelItem(2, 1, 30114, 1) == 1 then
			SetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE, 1);
			SetTask(TASK_TUOGUAN_PLANT_DATE, nDate);
			SetTask(TASK_TUOGUAN_PLANT_COUNT, GetTask(TASK_TUOGUAN_PLANT_COUNT) + 1);
			SetTask(TASK_TUOGUAN_PLANT_ACTIVE_TIME, GetTime());
			SetTask(TASK_TUOGUAN_PLANT_TYPE, nType);
			if GetTask(TASK_TUOGUAN_GIVE_BANRUO_DATE) ~= nDate then
				SetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT, 0);
			end
			SetTask(TASK_TUOGUAN_GIVE_BANRUO_DATE, nDate);
			SetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT, GetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT) + 1);
                        give_tuoguan_activity_award()    --by xiongyizhi 2010��ʥ���¼ӻ��Ʒ����
			Talk(1, "", "C�c h� �� b�o danh th�nh c�ng gi�p ng��i kh�c tr�ng c�y, ��i 360 gi�y ��n nh�n th��ng.");
			Msg2Player("C�c h� �� b�o danh th�nh c�ng gi�p ng��i kh�c tr�ng c�y, ��i 360 gi�y ��n nh�n th��ng.");			
			WriteLogEx("Uy thac trong cay", "Nhan Trong Cay");
		end
	end
end
-- ph�n th��ng n�p b�t nh� ch�ng th� th� 16
function Give_BNCT_16_Award()
	local rand =  random(1,100)
	if rand <= 50 then
		local nAwardRand = mod(random(1,1000),20)
		gf_AddItemEx2({2,1,(30164+nAwardRand),4}, "Tr�i C�y", "Nop bat nha chung thu 16", "B�t Nh� Ch�ng Th�")
	elseif rand <= 55 then
		Earn(300000)
		WriteLogEx("Nop bat nha chung thu 16","Nhan 30 vang")	
	elseif rand <= 75 then	
		gf_AddItemEx2({2,1,30086,1}, "H�t Gi�ng", "Nop bat nha chung thu 16", "B�t Nh� Ch�ng Th�",7*24*60*60)
	elseif rand <= 85 then
		gf_AddItemEx2({2,0,504,1}, "C�y B�t Nh� Nh�", "Nop bat nha chung thu 16", "B�t Nh� Ch�ng Th�",7*24*60*60)
	elseif rand <= 90 then
		gf_AddItemEx2({2,0,398,1}, "C�y B�t Nh� ", "Nop bat nha chung thu 16", "B�t Nh� Ch�ng Th�",7*24*60*60)
	elseif rand <= 95 then
		gf_AddItemEx2({2,1,30269,1}, "C�y T� Linh", "Nop bat nha chung thu 16", "B�t Nh� Ch�ng Th�",7*24*60*60)
	else
		ModifyExp(1000000)
		WriteLogEx( "Nop bat nha chung thu 16","Nhan 1000000 diem kinh nghiem")
	end
end