--���鶦�ű�
--by vivi
--09/14/2007

Include("\\script\\lib\\lingshi_info.lua")
Include("\\script\\lib\\lingshipeifang_info.lua")
Include("\\script\\class\\ktabfile.lua")

lingshi_pf = new(KTabFile,"\\settings\\item\\lingshipeifang.txt")
--��ʱ����
TT_LINGSHI_LV = 120; --��¼���ѡ��ȡ����ʯ�ĵȼ�
TT_LINGSHI_PF_LV = 121; --��¼���ѡ��ȡ����ʯ�䷽�ĵȼ�
TT_LINGSHI_CHANGE_LV = 123; --��¼���ѡ��һ��߼���ʯʱ�����ĵ���ʯ�ȼ�
TT_LSPF_CHANGE_LV = 124; --��¼���ѡ��һ��߼���ʯ�䷽ʱ�����ĵ���ʯ�䷽�ȼ�

--�������
TASK_LINGSHI_QINGLING = 2335; --����ʯ������0����ִ��һ��
TASK_PF_QINGLING = 2336; --����ʯ�䷽������0����ִ��һ��
--�����������Ȩֵ��
tRandNum ={--������	id	λ��	��͵ȼ�	�Ƿ����	�����������	�ȼ�1-7Ȩֵ
{"T� l� m�i m�n v� kh� gi�m",9,2,1,0,1,1,1,1,1,2,2,2},
{"S�c l�c t�ng",110,2,1,0,1,1,1,1,1,2,2,2},
{"S�c l�c t�ng",110,0,1,0,1,1,1,1,1,2,2,2},
{"S�c l�c t�ng",110,1,1,0,1,1,1,1,1,2,2,2},
{"S�c l�c t�ng",110,3,1,0,1,1,1,1,1,2,2,2},
{"Sinh l�c +",11,0,1,0,3,1,1,1,1,2,2,2},
{"Sinh l�c +",11,1,1,0,3,1,1,1,1,2,2,2},
{"Sinh l�c +",11,3,1,0,3,1,1,1,1,2,2,2},
{"H� g�c ��i ph��ng sinh l�c h�i ph�c " ,333,2,1,0,2,1,1,1,1,2,2,2},
{"600 gi�y �� b�n v� kh� h�i ph�c",43,2,1,1,2,1,1,1,1,2,2,2},
{"600 gi�y �� b�n th��ng y h�i ph�c ",112,1,1,1,2,1,1,1,1,2,2,2},
{"600 gi�y �� b�n n�n h�i ph�c ",113,0,1,1,2,1,1,1,1,2,2,2},
{"600 gi�y �� b�n h� y h�i ph�c ",114,3,1,1,2,1,1,1,1,2,2,2},
{"y�u c�u ��ng c�p gi�m ",334,0,6,1,3,1,1,1,1,2,2,2},
{"y�u c�u ��ng c�p gi�m "	,334,1,6,1,3,1,1,1,1,2,2,2},
{"y�u c�u ��ng c�p gi�m "	,334,3,6,1,3,1,1,1,1,2,2,2},
{"T� l� ��nh ph�m vi",335,2,1,0,3,1,1,1,1,2,2,2},
{"V� kh� ��nh ngo�i l�n nh�t t�ng ",65,2,1,0,3,1,1,1,1,2,2,2},
{"V� kh� ��nh ngo�i th�p nh�t t�ng "	,66,2,1,0,3,1,1,1,1,2,2,2},
{"V� kh� ��nh n�i l�n nh�t t�ng"	,67,2,1,0,3,1,1,1,1,2,2,2},
{"V� kh� ��nh n�i th�p nh�t t�ng "	,68,2,1,0,3,1,1,1,1,2,2,2},
{"D��c hi�u k�o d�i",39,0,1,0,2,1,1,2,2,3,3,4},
{"Th� l�c t�i �a t�ng",336,1,1,0,4,1,1,2,2,3,3,4},
{"T�n c�ng t�ng ",77,2,1,1,3,1,1,2,2,3,3,4},
{"Ch�nh x�c t�ng",337,2,1,0,4,1,1,2,2,3,3,4},
{"N� tr�nh t�ng",338,3,1,0,5,1,1,2,2,3,3,4},
{"Ph�n ��n",339,1,1,0,5,1,1,2,2,3,3,4},
{"M�i 10 gi�y n�i l�c h�i ph�c",340,0,5,1,5,1,1,2,2,3,3,4},
{"M�i 10 gi�y n�i l�c h�i ph�c",340,1,5,1,5,1,1,2,2,3,3,4},
{"M�i 10 gi�y n�i l�c h�i ph�c",340,3,5,1,5,1,1,2,2,3,3,4},
{"M�i 10 gi�y sinh l�c h�i ph�c",341,0,5,1,5,1,1,2,2,3,3,4},
{"M�i 10 gi�y sinh l�c h�i ph�c",341,1,5,1,5,1,1,2,2,3,3,4},
{"M�i 10 gi�y sinh l�c h�i ph�c",341,3,5,1,5,1,1,2,2,3,3,4},
{"��nh t�p trung t�ng",342,2,1,0,4,1,1,2,2,3,3,4},
{"N�i ph�ng t�ng ",343,0,1,0,4,1,1,2,2,3,3,4},
{"N�i ph�ng t�ng ",343,1,1,0,4,1,1,2,2,3,3,4},
{"N�i ph�ng t�ng ",343,3,1,0,4,1,1,2,2,3,3,4},
{"Ph�ng th� ngo�i c�ng t�ng",344,0,1,0,4,1,1,2,2,3,3,4},
{"Ph�ng th� ngo�i c�ng t�ng",344,1,1,0,4,1,1,2,2,3,3,4},
{"Ph�ng th� ngo�i c�ng t�ng",344,3,1,0,4,1,1,2,2,3,3,4},
{"V� c�ng hao n�i gi�m",345,0,1,0,5,1,1,2,2,3,3,4},
{"Ph�t huy c�ng k�ch l�n nh�t",346,2,1,0,5,1,1,2,2,3,3,4},
{"T� l� nh�t ��nh l�m ��i ph��ng kh� huy�t hao t�n",53,2,4,0,5,1,1,2,2,3,3,4},
{"T� l� nh�t ��nh l�m ��i ph��ng ch�n nguy�n hao t�n",54,2,4,0,5,1,1,2,2,3,3,4},
{"��c s�t gi�m",347,0,1,0,4,1,1,2,2,3,3,4},
{"��c s�t gi�m",347,1,1,0,4,1,1,2,2,3,3,4},
{"��c s�t gi�m",347,3,1,0,4,1,1,2,2,3,3,4},
{"T�n c�ng l�m s�c m�nh ��i ph��ng gi�m",348,2,1,0,5,1,1,2,2,3,3,4},
{"T�n c�ng l�m g�n c�t ��i ph��ng gi�m",349,2,1,0,5,1,1,2,2,3,3,4},
{"T�n c�ng l�m n�i c�ng ��i ph��ng gi�m",350,2,1,0,5,1,1,2,2,3,3,4},
{"Khi�n ��i ph��ng gi�m Linh ho�t ",351,2,1,0,5,1,1,2,2,3,3,4},
{"T�n c�ng l�m th�n ph�p ��i ph��ng gi�m",352,2,1,0,5,1,1,2,2,3,3,4},
{"T�n c�ng l�m ph�ng ngo�i ��i ph��ng gi�m",353,2,1,0,5,1,1,2,2,3,3,4}, 
{"T�n c�ng l�m gi�m n�i ph�ng ��i ph��ng",354,2,1,0,5,1,1,2,2,3,3,4},
{"Gi�m th�i gian tr�ng th��ng	",355,1,1,0,5,1,1,2,2,3,3,4},
{"T� l� ��nh ch�n xu�t chi�u c�a ��i ph��ng	",356,1,3,0,6,1,1,2,2,3,3,4},
{"G�n c�t t�ng",357,2,1,0,5,1,1,2,2,3,3,4},
{"G�n c�t t�ng",357,0,1,0,5,1,1,2,2,3,3,4},
{"G�n c�t t�ng",357,1,1,0,5,1,1,2,2,3,3,4},
{"G�n c�t t�ng",357,3,1,0,5,1,1,2,2,3,3,4},
{"S�c m�ng t�ng",358,2,1,0,5,1,1,2,2,3,3,4},
{"S�c m�ng t�ng",358,0,1,0,5,1,1,2,2,3,3,4},
{"S�c m�ng t�ng",358,1,1,0,5,1,1,2,2,3,3,4},
{"S�c m�ng t�ng",358,3,1,0,5,1,1,2,2,3,3,4},
{"Th�n ph�p t�ng",359,2,1,0,5,1,1,2,2,3,3,4},
{"Th�n ph�p t�ng",359,0,1,0,5,1,1,2,2,3,3,4},
{"Th�n ph�p t�ng",359,1,1,0,5,1,1,2,2,3,3,4},
{"Th�n ph�p t�ng",359,3,1,0,5,1,1,2,2,3,3,4},
{"Linh ho�t t�ng",360,2,1,0,5,1,1,2,2,3,3,4},
{"Linh ho�t t�ng",360,0,1,0,5,1,1,2,2,3,3,4},
{"Linh ho�t t�ng",360,1,1,0,5,1,1,2,2,3,3,4},
{"Linh ho�t t�ng",360,3,1,0,5,1,1,2,2,3,3,4},
{"N�i c�ng t�ng ",361,2,1,0,5,1,1,2,2,3,3,4},
{"N�i c�ng t�ng ",361,0,1,0,5,1,1,2,2,3,3,4},
{"N�i c�ng t�ng ",361,1,1,0,5,1,1,2,2,3,3,4},
{"N�i c�ng t�ng ",361,3,1,0,5,1,1,2,2,3,3,4},
{"Kh�ng ��c",100,0,1,0,6,1,1,2,2,3,3,4},
{"Kh�ng ��c",100,1,1,0,6,1,1,2,2,3,3,4},
{"Kh�ng ��c",100,3,1,0,6,1,1,2,2,3,3,4},
{"Chuy�n h�a s�t th��ng th�nh n�i l�c",46,0,5,1,6,1,1,2,2,3,3,4},
{"Chuy�n h�a s�t th��ng th�nh n�i l�c",46,1,5,1,6,1,1,2,2,3,3,4},
{"T�n c�ng l�m ��i ph��ng hao t�n n�i l�c",49,2,5,0,6,1,2,2,3,3,4,5},
{"Ph� ph�ng th� ��i ph��ng",362,2,5,0,7,1,2,2,3,3,4,5},
{"T�n c�ng k�m ��c s�t",363,2,1,0,7,1,2,2,3,3,4,5},
{"Sinh l�c t�i �a t�ng-%",79,2,1,0,7,1,2,2,3,3,4,5},
{"Sinh l�c t�i �a t�ng-%",79,0,1,0,7,1,2,2,3,3,4,5},
{"Sinh l�c t�i �a t�ng-%",79,1,1,0,7,1,2,2,3,3,4,5},
{"Sinh l�c t�i �a t�ng-%",79,3,1,0,7,1,2,2,3,3,4,5},
{"N�i l�c t�i �a t�ng-%",80,2,1,0,6,1,2,2,3,3,4,5},
{"N�i l�c t�i �a t�ng-%",80,0,1,0,6,1,2,2,3,3,4,5},
{"N�i l�c t�i �a t�ng-%",80,1,1,0,6,1,2,2,3,3,4,5},
{"N�i l�c t�i �a t�ng-%",80,3,1,0,6,1,2,2,3,3,4,5},
{"Kh�c n�",364,1,3,0,6,1,2,2,3,3,4,5},
{"H� tr� t�n c�ng  duy tr� ",41,0,1,0,7,1,2,2,3,3,4,5},
{"H� tr� t�n c�ng  duy tr� ",41,2,1,0,7,1,2,2,3,3,4,5},
{"H� tr� t�n c�ng  duy tr� ",41,1,1,0,7,1,2,2,3,3,4,5},
{"H� tr� t�n c�ng  duy tr� ",41,3,1,0,7,1,2,2,3,3,4,5},
{"H� tr� ph�ng th� duy tr� ",42,0,1,0,7,1,2,2,3,3,4,5},
{"H� tr� ph�ng th� duy tr� ",42,2,1,0,7,1,2,2,3,3,4,5},
{"H� tr� ph�ng th� duy tr� ",42,1,1,0,7,1,2,2,3,3,4,5},
{"H� tr� ph�ng th� duy tr� ",42,3,1,0,7,1,2,2,3,3,4,5},
{"C�ng k�ch khi�n ngo�i ph�ng c�a ��i ph��ng gi�m",382,2,1,0,7,1,2,2,3,3,4,5},
{"C�ng k�ch khi�n n�i l�c c�a ��i ph��ng gi�m ",383,2,1,0,7,1,2,2,3,3,4,5},
{"T� l� ch�u ��n gi�m n�a	",365,0,5,0,7,1,2,2,3,3,4,5},
{"T� l� ch�u ��n gi�m n�a	",365,1,5,0,7,1,2,2,3,3,4,5},
{"T� l� ch�u ��n gi�m n�a	",365,3,5,0,7,1,2,2,3,3,4,5},
{"Kinh nghi�m nh�n ���c t�ng",366,2,5,1,5,2,2,3,3,3,4,5},
{"Kinh nghi�m nh�n ���c t�ng",366,0,5,1,5,2,2,3,3,3,4,5},
{"Kinh nghi�m nh�n ���c t�ng",366,1,5,1,5,2,2,3,3,3,4,5},
{"Kinh nghi�m nh�n ���c t�ng",366,3,5,1,5,2,2,3,3,3,4,5},
{"L�m gi�m n� tr�nh c�a ��i ph��ng",373,3,4,0,8,2,2,3,3,3,4,5},
{"L�m ch�m n� tr�nh c�a ��i ph��ng",374,3,4,0,8,2,2,3,3,3,4,5},
{"T� l� n� tr�nh ��nh lui",375,3,4,0,8,2,2,3,3,3,4,5},
{"T� l� n� tr�nh ��nh ng�",376,3,4,0,8,2,2,3,3,3,4,5},
{"B� qua n� tr�nh ��i ph��ng",377,0,4,0,8,2,2,3,3,3,4,5},
{"G�y m�",378,0,4,0,8,2,2,3,3,3,4,5},
{"G�y cho�ng",379,0,4,0,8,2,2,3,3,3,4,5},
{"G�y h�n lo�n n� tr�nh",380,1,4,0,8,2,2,3,3,3,4,5},
{"G�y ng� m� gi�m n� tr�nh",381,1,4,0,8,2,2,3,3,3,4,5},
{"Ngo�i ph�ng gi�m, ngo�i k�ch t�ng",18,1,1,0,8,2,2,3,3,3,4,5},
{"N�i ph�ng gi�m, N�i c�ng t�ng",19,1,1,0,8,2,2,3,3,3,4,5},
{"S�t th��ng t�ng ",372,2,3,0,7,2,2,3,3,3,4,5},
{"T�t c� thu�c t�nh t�ng",367,2,3,0,8,2,2,3,3,3,4,5},
{"T�t c� thu�c t�nh t�ng",367,0,3,0,8,2,2,3,3,3,4,5},
{"T�t c� thu�c t�nh t�ng",367,1,3,0,8,2,2,3,3,3,4,5},
{"T�t c� thu�c t�nh t�ng",367,3,3,0,8,2,2,3,3,3,4,5},
{"Ngo�i k�ch + ",368,2,3,0,8,2,2,3,3,3,4,5},
{"N�i k�ch t�ng ",369,2,3,0,8,2,2,3,3,3,4,5},
{"T� l� xu�t chi�u t�ng",370,2,4,0,8,2,2,3,3,3,4,5},
{"T�c �� thi tri�n v� c�ng t�ng",371,0,3,0,8,2,2,3,3,4,5,6}
}
function OnUse()
	local strtab = {
		"T�i c� Linh th�ch n�o /which_lingshi",
		"T�i c� Linh th�ch ph�i ph��ng n�o/which_lingshi_pf",
		"Ch�n Linh th�ch ph�i ph��ng �� ��i /zhiding_main",
		"C�ch ��i nh� th� n�o /how_change",
		"Kh�ng c� g�/nothing"}
	Say("V�t ti�n c�nh n�y h�p th� linh kh� tr�i ��t, b�n mu�n bi�t �i�u g�? ",
		getn(strtab),
		strtab)
end

function which_lingshi()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","M� kh�a r��ng tr��c.");
		return 0;
	end;
	local strtab = {};
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}
	if GetTask(TASK_LINGSHI_QINGLING) == 0 then
		for j=1,getn(tLingshiTask) do
			if GetTask(tLingshiTask[j]) < 0 then
				SetTask(tLingshiTask[j],0);
			end
		end
		SetTask(TASK_LINGSHI_QINGLING,1);
	end
	for i=1,getn(tLingshiTask) do
		if GetTask(tLingshiTask[i]) > 0 then
			tinsert(strtab,i.." (c�p) Linh th�ch"..GetTask(tLingshiTask[i])..". /#quchu_lingshi("..i..")");
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"","Hi�n t�i ng��i kh�ng c� Linh th�ch �� � ch� ta. ");
	else
		tinsert(strtab,"tr� l�i/OnUse")
		Say("Xin ch�n lo�i Linh th�ch b�n mu�n t�ch ra",
			getn(strtab),
			strtab)
	end
end

function quchu_lingshi(nLv)	
	Say("B�n ch�p nh�n t�ch linh th�ch c�p "..nLv.." ??",
		2,
		"Ph�i, ta mu�n t�ch /#lingshi_num("..nLv..")",
		"Kh�ng, ta nh�m!/which_lingshi")
end

function lingshi_num(nLv)
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}	
	local nNum = GetTask(tLingshiTask[nLv]);
	SetTaskTemp(TT_LINGSHI_LV,nLv);
	AskClientForNumber("confirm_give_lingshi", 1, tonumber(nNum), "T�ch ra bao nhi�u "..nLv.." Linh th�ch?");
end

function confirm_give_lingshi(nCount)
	if Zgc_pub_goods_add_chk(nCount,nCount) ~= 1 then
		return
	end
	local nLv = GetTaskTemp(TT_LINGSHI_LV);
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}	
	if nCount > GetTask(tLingshiTask[nLv]) then
		return
	else
		for i=1,nCount do
			ls_AddRandomLingShi(SYS_TB_LINGSHI_MINLEVEL,nLv,nLv);
		end
		Msg2Player("B�n l�y ra "..nLv.." (c�p) Linh Th�ch"..nCount.." ");
		if nLv >= 6 then
			WriteLog("Ng��i ch�i"..GetName().."L�y"..nLv.." (c�p) Linh Th�ch"..nCount.." ");
		end
		SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nCount);
		SetTaskTemp(TT_LINGSHI_LV,0);
	end		
end

function which_lingshi_pf()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","M� kh�a r��ng tr��c.");
		return 0;
	end;
	local strtab = {};
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if GetTask(TASK_PF_QINGLING) == 0 then
		for i=1,getn(tPeifangTask) do
			if GetTask(tPeifangTask[i]) == -1 then
				SetTask(tPeifangTask[i],1);
				WriteLog("T� Linh ��nh b� l�i: Ng��i ch�i"..GetName().." -S� l��ng 1"..i.." (c�p) Linh th�ch ph�i ph��ng tr� th�nh s� l��ng 1")
			end
		end		
		for j=1,getn(tPeifangTask) do
			if GetTask(tPeifangTask[j]) < 0 then
				SetTask(tPeifangTask[j],0);
			end
		end
		SetTask(TASK_PF_QINGLING,1);
	end 
	for i=1,getn(tPeifangTask) do
		if GetTask(tPeifangTask[i]) > 0 then
			tinsert(strtab,i.."(c�p) Linh th�ch ph�i ph��ng"..GetTask(tPeifangTask[i]).." ./#quchu_peifang("..i..")");
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"","<color=green>T� Linh ��nh<color>: Hi�n t�i ng��i kh�ng c� Linh th�ch �� � ch� ta. ");
	else
		tinsert(strtab,"tr� l�i/OnUse")
		Say("<color=green>T� Linh ��nh<color>: Xin ch�n lo�i Linh th�ch ph�i ph��ng b�n mu�n t�ch ra",
			getn(strtab),
			strtab)
	end
end

function quchu_peifang(nLv)
	Say("B�n ch�p nh�n t�ch linh th�ch c�p "..nLv.." (c�p) Linh th�ch ph�i ph��ng?",
		2,
		"Ph�i, ta mu�n t�ch /#peifang_num("..nLv..")",
		"Kh�ng, ta nh�m!/which_lingshi_pf")	
end

function peifang_num(nLv)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	local nNum = GetTask(tPeifangTask[nLv]);
	SetTaskTemp(TT_LINGSHI_PF_LV,nLv);
	AskClientForNumber("confirm_give_peifang", 1, tonumber(nNum), "T�ch l�y bao nhi�u "..nLv.." Linh th�ch ph�i ph��ng?");												
end

function confirm_give_peifang(nCount)
	if Zgc_pub_goods_add_chk(nCount,nCount) ~= 1 then
		return
	end
	local nLv = GetTaskTemp(TT_LINGSHI_PF_LV);
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if nCount > GetTask(tPeifangTask[nLv]) then
		return
	else
		for i=1,nCount do
			lspf_AddRandomPeiFang(SYS_TB_LINGSHI_PF_LEVEL,nLv,nLv);
		end
		Msg2Player("B�n l�y ra "..nLv.." (c�p)-linh th�ch ph�i ph��ng."..nCount.."Tr��ng");
		if nLv >= 6 then
			WriteLog("Ng��i ch�i"..GetName().."L�y"..nLv.." (c�p)-linh th�ch ph�i ph��ng."..nCount.." ");
		end		
		SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nCount);
		SetTaskTemp(TT_LINGSHI_PF_LV,0);															
	end
end
function zhiding_main()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","M� kh�a r��ng tr��c.");
		return 0;
	end;
	local strtab = {
		"S� l�n ng�u nhi�n ta ph�i ti�u hao �� nh�n ���c Linh th�ch ch� ��nh/zhiding_lingshi",
		"S� l�n ng�u nhi�n ta ph�i ti�u hao �� nh�n ���c Linh th�ch ph�i ph��ng ch� ��nh/zhiding_peifang",
		"S� l�n ng�u nhi�n ta ph�i ti�u hao �� nh�n ���c v�t ph�m qu� hi�m (nh� Nguy�t Hoa)/zhiding_yuehua",
		"Ta mu�n ��i s� l�n ng�u nhi�n c�a ph�i ph��ng v� linh th�ch c�p th�p th�nh c�p cao. /zhiding_gaoji",
		"tr� l�i/OnUse",
		"T�m th�i kh�ng th� ��i ���c./nothing"
		}
	Say("B�n b� qua nhi�u c� h�i nh�n linh th�ch �� l�y Linh th�ch ch� ��nh v� Linh th�ch ph�i ph��ng v�i 1 s� v�t ph�m qu� kh�c. ",
		getn(strtab),
		strtab)
end

function zhiding_lingshi()
	local strtab = {
		"Linh th�ch c�p 1 mang thu�c t�nh ��c bi�t/#lingshi_zhiding_lv(1)",
		"Linh th�ch c�p 2 mang thu�c t�nh ��c bi�t/#lingshi_zhiding_lv(2)",
		"Linh th�ch c�p 3 mang thu�c t�nh ��c bi�t/#lingshi_zhiding_lv(3)",
		"Linh th�ch c�p 4 mang thu�c t�nh ��c bi�t/#lingshi_zhiding_lv(4)",
		"Linh th�ch c�p 5 mang thu�c t�nh ��c bi�t/#lingshi_zhiding_lv(5)",
		"tr� l�i/zhiding_main"
		}
	Say("Xin ch�n ��ng c�p linh th�ch ch� ��nh",
		getn(strtab),
		strtab)	
end

function lingshi_zhiding_lv(nLv)
	local strtab = {
		"M�o/#lingshi_zhiding_wz("..nLv..",0,0)",
		"Y ph�c/#lingshi_zhiding_wz("..nLv..",1,0)",
		"V� kh�/#lingshi_zhiding_wz("..nLv..",2,0)",
		"Qu�n /#lingshi_zhiding_wz("..nLv..",3,0)",
		"tr� l�i/zhiding_lingshi",
		"T�m th�i kh�ng ��i. /nothing"
		}
	Say("Xin ch�n v� tr� kh�m linh th�ch ch� ��nh. ",
		getn(strtab),
		strtab)
end

function lingshi_zhiding_wz(nLv,nWz,nPage)
	local tAttri = {};
	local tIdx = {}; --��ӦtRandNum�������
	for i = 1,getn(tRandNum) do
		if tRandNum[i][3] == nWz and tRandNum[i][4] <= nLv then
			tinsert(tAttri,tRandNum[i]);
			tinsert(tIdx,i)
		end
	end
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tAttri)-nPageNum*nPage;
	local nDiaNum = 6;
	if nRemaid < nDiaNum then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tAttri[nPage*nPageNum+i][1].."/#confirm_lingshi_zhiding("..tAttri[nPage*nPageNum+i][2]..","..nLv..","..nWz..","..tIdx[nPage*nPageNum+i]..")");
	end
	if nPage > 0 then
		tinsert(strtab,"Trang tr��c/#lingshi_zhiding_wz("..nLv..","..nWz..","..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"Trang k�/#lingshi_zhiding_wz("..nLv..","..nWz..","..(nPage+1)..")");
	end
	tinsert(strtab,"tr� l�i/#lingshi_zhiding_lv("..nLv..")");
	tinsert(strtab,"T�m th�i kh�ng ��i. /nothing");
	Say("Xin ch�n thu�c t�nh linh th�ch mu�n ��i. ",
		getn(strtab),
		strtab);	
end

function confirm_lingshi_zhiding(nId,nLv,nWz,nIdx)
	local tWz = {"M�o","Y ph�c","V� kh�","Qu�n "};
	Say("S� l�n b�n ti�u hao <color=yellow>"..nLv*tRandNum[nIdx][nLv+6].."<color> l�n"..nLv.." (c�p) Linh th�ch ng�u nhi�n �� ��i thu�c t�nh Linh th�ch l� <color=yellow>"..tRandNum[nIdx][1].."<color>, v� tr� kh�m l� 1 <color=yellow> "..tWz[nWz+1].."<color> "..nLv.." (c�p) Linh th�ch, ��ng � ch�?",
		2,
		"�, ta mu�n ��i./#give_lingshi_zhiding("..nId..","..nLv..","..nWz..","..nIdx..")",
		"T�m th�i kh�ng ��i. /nothing")
end

function give_lingshi_zhiding(nId,nLv,nWz,nIdx)
	local nNum = nLv*tRandNum[nIdx][nLv+6];
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[nLv]) < nNum then
		Talk(1,"","B�n kh�ng �� s� l�n ng�u nhi�n �� ��i l�y lo�i �� b�n c�n. ");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nNum);
	AddLingShi(nId,nWz,nLv);
	Msg2Player("B�n nh�n ���c "..nLv.."(c�p) Linh Th�ch!");
	if nLv >= 6 then
		WriteLog("Ng��i ch�i"..GetName().."S� l�n ng�u nhi�n ti�u hao "..nNum.." l�n nh�n ���c "..nLv.."(c�p) Linh Th�ch!");
	end
end

function zhiding_peifang()
	local strtab = {
		"Linh th�ch ph�i ph��ng mang thu�c t�nh ��c bi�t c�p 1/#lspf_zhiding_lv(1)",
		"Linh th�ch ph�i ph��ng mang thu�c t�nh ��c bi�t c�p 2/#lspf_zhiding_lv(2)",
		"Linh th�ch ph�i ph��ng mang thu�c t�nh ��c bi�t c�p 3/#lspf_zhiding_lv(3)",
		"Linh th�ch ph�i ph��ng mang thu�c t�nh ��c bi�t c�p 4/#lspf_zhiding_lv(4)",
		"Linh th�ch ph�i ph��ng mang thu�c t�nh ��c bi�t c�p 4/#lspf_zhiding_lv(5)",
		"Linh th�ch ph�i ph��ng mang thu�c t�nh ��c bi�t c�p 6/#lspf_zhiding_lv(6)",
		"tr� l�i/zhiding_main"
		}
	Say("Xin ch�n c�p thu�c t�nh Linh th�ch ph�i ph��ng ch� ��nh. ",
		getn(strtab),
		strtab)		
end

function lspf_zhiding_lv(nLv)
	local strtab = {
		"M�o/#lspf_zhiding_wz("..nLv..",0,0)",
		"Y ph�c/#lspf_zhiding_wz("..nLv..",1,0)",
		"V� kh�/#lspf_zhiding_wz("..nLv..",2,0)",
		"Qu�n /#lspf_zhiding_wz("..nLv..",3,0)",
		"tr� l�i/zhiding_peifang",
		"T�m th�i kh�ng ��i. /nothing"
		}
	Say("Xin ch�n v� tr� kh�m Linh th�ch ph�i ph��ng ch� ��nh. ",
		getn(strtab),
		strtab)	
end

function lspf_zhiding_wz(nLv,nWz,nPage)
	local tAttri = {};
	local tIdx = {}; --��ӦtRandNum�������
	for i = 22,getn(tRandNum) do --ע�����tRandNum���ǰ21��������û���䷽�ģ�
		if tRandNum[i][3] == nWz and tRandNum[i][4] <= nLv then
			tinsert(tAttri,tRandNum[i]);
			tinsert(tIdx,i)
		end
	end
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tAttri)-nPageNum*nPage;
	local nDiaNum = 6;
	if nRemaid < nDiaNum then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tAttri[nPage*nPageNum+i][1].."/#confirm_lspf_zhiding("..tAttri[nPage*nPageNum+i][2]..","..nLv..","..nWz..","..tIdx[nPage*nPageNum+i]..")");
	end
	if nPage > 0 then
		tinsert(strtab,"Trang tr��c/#lspf_zhiding_wz("..nLv..","..nWz..","..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"Trang k�/#lspf_zhiding_wz("..nLv..","..nWz..","..(nPage+1)..")");
	end
	tinsert(strtab,"tr� l�i/#lspf_zhiding_lv("..nLv..")");
	tinsert(strtab,"T�m th�i kh�ng ��i. /nothing");
	Say("Xin ch�n thu�c t�nh Linh th�ch ph�i ph��ng mu�n ��i. ",
		getn(strtab),
		strtab);	
end

function confirm_lspf_zhiding(nId,nLv,nWz,nIdx)
	local tWz = {"M�o","Y ph�c","V� kh�","Qu�n "};
	Say("S� l�n b�n ti�u hao <color=yellow>"..nLv*tRandNum[nIdx][nLv+6].."<color> l�n"..nLv.." (c�p) Linh th�ch ph�i ph��ng ng�u nhi�n ��i th�nh <color=yellow>1"..tRandNum[nIdx][1].."<color>, v� tr� kh�m l� 1 <color=yellow> "..tWz[nWz+1].."<color> "..nLv.." (c�p) Linh th�ch ph�i ph��ng, b�n ch�p nh�n?",
		2,
		"�, ta mu�n ��i./#give_lspf_zhiding("..nId..","..nLv..","..nWz..","..nIdx..")",
		"T�m th�i kh�ng ��i. /nothing")	
end

function give_lspf_zhiding(nId,nLv,nWz,nIdx)
	local nNum = nLv*tRandNum[nIdx][nLv+6];
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if GetTask(tPeifangTask[nLv]) < nNum then
		Talk(1,"","B�n kh�ng �� s� l�n ng�u nhi�n �� ��i th�nh th�ch ph�i ph��ng. ");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local nPfid1,nPfid2,nPfid3 = 0,0,0;		
	for i=2,lingshi_pf:getRow() do
		if tonumber(lingshi_pf:getCell(i,44)) == nId and tonumber(lingshi_pf:getCell(i,45)) == nWz and tonumber(lingshi_pf:getCell(i,46)) == nLv then
			if lingshi_pf:getCell(i,43) ~= "" then
				nPfid1 = tonumber(lingshi_pf:getCell(i,41));
				nPfid2 = tonumber(lingshi_pf:getCell(i,42));
				nPfid3 = tonumber(lingshi_pf:getCell(i,43));
				break
			end
		end
	end
	SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nNum);
	if AddItem(nPfid1,nPfid2,nPfid3,1) == 1 then
		Msg2Player("B�n nh�n ���c "..nLv.."(c�p)thu�c t�nh Linh th�ch ph�i ph��ng");
		if nLv >= 6 then
			WriteLog("Ng��i ch�i"..GetName().."ti�u hao "..nNum.." l�n ng�u nhi�n, nh�n ���c 1 "..nLv.." (c�p)thu�c t�nh Linh th�ch ph�i ph��ng");
		end
	else
		WriteLog("Ng��i ch�i"..GetName().."ti�u hao "..nNum.." l�n ng�u nhi�n, nh�n ���c 1 "..nLv.." (c�p)thu�c t�nh Linh th�ch ph�i ph��ng �� th�t b�i! ")
	end
end

function zhiding_gaoji()
	local strtab = {
		"Ta mu�n ��i Linh th�ch ng�u nhi�n c�p th�p th�nh c�p cao. /zhiding_lingshi_gaoji",
		"Ta mu�n ��i Linh th�ch ph�i ph��ng ng�u nhi�n c�p th�p th�nh c�p cao. /zhiding_lspf_gaoji",
		"tr� l�i/zhiding_main",
		"T�m th�i kh�ng ��i. /nothing"
		}
	Say("Ng��i mu�n ��i Linh th�ch hay Linh th�ch ph�i ph��ng?",
		getn(strtab),
		strtab)	
end

function zhiding_lingshi_gaoji()
	local strtab = {
		"Ta mu�n ti�u hao Linh th�ch ng�u nhi�n c�p 1 ��i th�nh linh th�ch c�p 2/#ls_change_high(1)",
		"Ta mu�n ti�u hao Linh th�ch ng�u nhi�n c�p 2 ��i l�y Linh th�ch c�p 3/#ls_change_high(2)",
		"Ta mu�n ti�u hao Linh th�ch ng�u nhi�n c�p 3 ��i l�y Linh th�ch c�p 4/#ls_change_high(3)",
		"Ta mu�n ti�u hao Linh th�ch ng�u nhi�n c�p 4 ��i l�y Linh th�ch c�p 5/#ls_change_high(4)",
		"tr� l�i/zhiding_gaoji",
		"T�m th�i kh�ng ��i. /nothing"
		}
	Say("Xin ch�n c�p linh th�ch mu�n ��i. (s� l��ng ��i s� x�c nh�n � b��c sau)",
		getn(strtab),
		strtab)		
end

function ls_change_high(nLv)
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}
	local tNum = {3,3,5,5};
	if GetTask(tLingshiTask[nLv]) < tNum[nLv] then
		Talk(1,"","B�n kh�ng �� s� l�n ng�u nhi�n �� ��i");
		return
	end	
	local nCount = floor(GetTask(tLingshiTask[nLv])/tNum[nLv]);
	SetTaskTemp(TT_LINGSHI_CHANGE_LV,nLv);
	AskClientForNumber("confirm_ls_change_high", 1, tonumber(nCount), "B�n mu�n ��i bao nhi�u "..(nLv+1).." (c�p) Linh th�ch?");
end

function confirm_ls_change_high(nCount)
	local nLv = GetTaskTemp(TT_LINGSHI_CHANGE_LV);
	local tNum = {3,3,5,5};
	local nNum = tNum[nLv]*nCount;
	Say("B�n ch�p nh�n ti�u hao "..nNum.." l�n"..nLv.." (c�p) Linh th�ch ng�u nhi�n �� ��i l�y"..nCount.." "..(nLv+1).." (c�p) Linh th�ch?",
		3,
		"��ng �/#give_ls_change_high("..nLv..","..nNum..","..nCount..")",
		"Ch�n sai. Tr� v�/zhiding_lingshi_gaoji",
		"T�m th�i kh�ng ��i. /nothing")
end

function give_ls_change_high(nLv,nNum,nCount)  --���ĵĵȼ�  ���ĵĵȼ����� �һ��ĵȼ�����
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[nLv]) < nNum then
		Talk(1,"","B�n kh�ng �� s� l�n ng�u nhi�n �� ��i l�y lo�i �� b�n c�n. ");
		return
	end
	SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nNum);
	SetTask(tLingshiTask[nLv+1],GetTask(tLingshiTask[nLv+1])+nCount);
	Msg2Player("B�n nh�n ���c "..(nLv+1).." (c�p) Linh Th�ch"..nCount.." , b�n c� th� t�ch l�y n� t� T� Linh ��nh. ");	
end

function zhiding_lspf_gaoji()
	local strtab = {
		"Ta mu�n ti�u hao Linh th�ch ph�i ph��ng c�p 1 ng�u nhi�n ��i l�y Linh th�ch ph�i ph��ng c�p 2. /#lspf_change_high(1)",
		"Ta mu�n ti�u hao Linh th�ch ph�i ph��ng c�p 2 ng�u nhi�n ��i l�y Linh th�ch ph�i ph��ng c�p 3./#lspf_change_high(2)",
		"Ta mu�n ti�u hao Linh th�ch ph�i ph��ng c�p 3 ng�u nhi�n ��i l�y Linh th�ch ph�i ph��ng c�p 4. /#lspf_change_high(3)",
		"Ta mu�n ti�u hao Linh th�ch ph�i ph��ng c�p 4 ng�u nhi�n ��i l�y Linh th�ch ph�i ph��ng c�p 5. /#lspf_change_high(4)",
		"Ta mu�n ti�u hao Linh th�ch ph�i ph��ng c�p 5 ng�u nhi�n ��i l�y Linh th�ch ph�i ph��ng c�p 6./#lspf_change_high(5)",
		"tr� l�i/zhiding_gaoji",
		"T�m th�i kh�ng ��i. /nothing"
		}
	Say("Xin ch�n ��ng c�p Linh th�ch ph�i ph��ng mu�n ��i! (s� l��ng ��i s� x�c nh�n � b��c sau)",
		getn(strtab),
		strtab)		
end

function lspf_change_high(nLv)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	local tNum = {3,3,5,5,5};
	if GetTask(tPeifangTask[nLv]) < tNum[nLv] then
		Talk(1,"","B�n kh�ng �� s� l�n ng�u nhi�n �� ��i l�y Linh th�ch ph�i ph��ng.");
		return
	end
	local nCount = floor(GetTask(tPeifangTask[nLv])/tNum[nLv]);
	SetTaskTemp(TT_LSPF_CHANGE_LV,nLv);
	AskClientForNumber("confirm_lspf_change_high", 1, tonumber(nCount), "B�n mu�n ��i bao nhi�u "..(nLv+1).." (c�p) Linh th�ch ph�i ph��ng? ");
end

function confirm_lspf_change_high(nCount)
	local nLv = GetTaskTemp(TT_LSPF_CHANGE_LV);
	local tNum = {3,3,5,5,5};
	local nNum = tNum[nLv]*nCount;
	Say("B�n ch�p nh�n ti�u hao "..nNum.." l�n"..nLv.." (c�p) Linh th�ch ph�i ph��ng ng�u nhi�n ��i l�y "..nCount.."Tr��ng"..(nLv+1).." (c�p) Linh th�ch ph�i ph��ng? ",
		3,
		"��ng �/#give_lspf_change_high("..nLv..","..nNum..","..nCount..")",
		"Ch�n sai. Tr� v�/zhiding_lspf_gaoji",
		"T�m th�i kh�ng ��i. /nothing")
end

function give_lspf_change_high(nLv,nNum,nCount)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}	
	if GetTask(tPeifangTask[nLv]) < nNum then
		Talk(1,"","B�n kh�ng �� s� l�n ng�u nhi�n �� ��i l�y Linh th�ch ph�i ph��ng.");
		return
	end
	SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nNum);
	SetTask(tPeifangTask[nLv+1],GetTask(tPeifangTask[nLv+1])+nCount);
	Msg2Player("B�n nh�n ���c "..(nLv+1).." (c�p)-linh th�ch ph�i ph��ng."..nCount.." , b�n c� th� t�ch n� t� T� Linh ��nh. ");	
end

function zhiding_yuehua()
	local strtab = {
		"Ta ph�i ti�u hao 5 l�n Linh th�ch c�p 5 ng�u nhi�n ��i l�y Nguy�t Hoa. /lingshi_change_yuehua",
--		"��Ҫ����5��5����ʯ�䷽��������һ�1���������ʯ/lspf_change_stone",
		"tr� l�i/zhiding_main",
		"T�m th�i kh�ng ��i. /nothing"
		}
	Say("Xin ch�n v�t ph�m b�n mu�n ��i. ",
		getn(strtab),
		strtab)	
end

function lingshi_change_yuehua()
	Say("B�n ch�p nh�n ti�u hao 5 l�n Linh th�ch c�p 5 ng�u nhi�n ��i l�y Nguy�t Hoa?",
		3,
		"��ng �/confirm_lingshi_yuehua",
		"tr� l�i/zhiding_yuehua",
		"T�m th�i kh�ng ��i. /nothing")
end

function confirm_lingshi_yuehua()
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[5]) < 5 then
		Talk(1,"","B�n kh�ng �� s� l�n ng�u nhi�n �� ��i l�y lo�i �� b�n c�n. ");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tLingshiTask[5],GetTask(tLingshiTask[5])-5);
	if AddItem(2,1,2002,1) == 1 then
		Msg2Player(" B�n nh�n ���c 1 Nguy�t Hoa ");
	end		
end

function lspf_change_stone()
	Say("B�n ch�p nh�n ti�u hao 5 l�n Linh th�ch ph�i ph��ng c�p 5 ng�u nhi�n ��i l�y 1 Huy�n Ho�ng Th�ch? ",
		3,
		"��ng �/confirm_lspf_stone",
		"tr� l�i/zhiding_yuehua",
		"T�m th�i kh�ng ��i. /nothing")
end

function confirm_lspf_stone()
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}	
	if GetTask(tPeifangTask[5]) < 5 then
		Talk(1,"","B�n kh�ng �� s� l�n ng�u nhi�n �� ��i l�y Linh th�ch ph�i ph��ng.");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tPeifangTask[5],GetTask(tPeifangTask[5])-5);
	if AddItem(2,1,1151,1) == 1 then
		Msg2Player("B�n nh�n ���c 1 Huy�n Ho�ng Th�ch ");
	end		
end

function how_change()
	Talk(1,"how_change2","Linh th�ch trong T� Linh ��nh �� x�c ��nh thu�c t�nh hay ch�a, t�ch ra c� th� ���c 1 thu�c t�nh ng�u nhi�n. B�n c� th� th�ng qua s� l��ng linh th�ch c�ng c�p �� ti�u hao trong T� Linh ��nh �� ch� ��nh nh�n ���c 1 thu�c t�nh linh th�ch c�ng c�p. Ph�i ph��ng ch� ��nh c�ng l�m nh� v�y.")
end

function how_change2()
	Talk(1,"how_change3","B�n c� th� linh th�ch c�p th�p trong T� Linh ��nh chuy�n h�a th�nh Linh th�ch c�p cao. V� d� cho v�o T� Linh ��nh 10 Linh th�ch c�p 4 �� chuy�n h�a th�nh 2 Linh th�ch c�p 5. S� l��ng linh th�ch kh�ng c�ng ��ng c�p c�n �� chuy�n h�a c�ng kh�ng gi�ng nhau. ")
end

function how_change3()
	Talk(1,"OnUse","Linh th�ch v� Linh th�ch ph�i ph��ng trong T� Linh ��nh, ngo�i vi�c t�ch l�y v� chuy�n h�a ra, c�n c� th� chuy�n h�a ch�ng th�nh Nguy�t Hoa v� Huy�n Ho�ng Th�ch c� hi�u qu� ��c bi�t. ")
end

function nothing()

end

--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м��
--�峤 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
			Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
			return 0
		else 
			return 1
		end
end