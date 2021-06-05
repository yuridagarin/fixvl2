----------------------------------------
-- e:\src\lua\jx2_script_dbg\chaoschoice\temp_talk_.lua
-- auto create by temp_talk
-- 07/12/11 15:38:55
----------------------------------------

Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\talktmp.lua");
--Include("\\script\\lib\\xoyobi.lua");
--Include("\\script\\task\\global_task\\gtask_data.lua");
--Include("\\script\\misc\\globalflag.lua")

TMAIN = {}
SAY_1 = {}
SAY_2 = {}
SAY_3 = {}
SAY_3_1 = {}
SAY_4 = {}
SAY_4_1 = {}
SAY_4_2 = {}
SAY_4_3 = {}
SAY_5 = {}

tGtNpcMain:get_main_table("Ph�m Th�")
g_NpcName = "<color=green> V� L�m Minh Ph�m Th� <color>:"
TMAIN.msg = g_NpcName.."V� L�m Minh Gi�o Tr��ng nh�n ���c chi�u th� c�a tri�u ��nh, �� giao vi�c n�y cho ��c S� ��i H�i T� V� t�i Bi�n Kinh ch� tr�.";
TMAIN.sel = 
{
--	{"����У��", SAY_1, }, 
--	{"�ճ�����", SAY_2, }, 
--	{"��ֵ����", SAY_3, }, 
--	{"У������", SAY_4, }, 
	{"V� L�m Minh H�i Qui", SAY_5, },
	{"K�t th�c", "nothing", }, };
SAY_1.msg = g_NpcName.."Sau khi v�o V� L�m Minh Gi�o Tr��ng, nh�ng v�t ph�m kh�ng h�p v�i ti�u chu�n ta s� b�o qu�n gi�p ng��i, sau khi quay l�i ta s� tr� l�i, ta kh�ng ph�i t�n tr�m ��u! Ti�n c�a V� L�m Minh duy nh�t ch� c� Ti�n Ti�u Dao m� th�i.";
SAY_1.sel = 
{
	{"V�o ��u tr��ng T� V�", "enterNvn", },
	{"��i Ti�n Ti�u Dao (v�t ph�m mua �� d�ng t�i li�n ��u)", "tmz_Change_Xoyo_Gold", }, 
	{"��i Ng�c Ti�u Dao( ph�c v� cho vi�c t�ng tr� gi� t�i li�n ��u)", "tmz_Change_Xoyo_Yu", }, 
	{"tr� l�i", TMAIN, }, 
	{"K�t th�c ��i tho�i", "nothing", }, };
SAY_2.msg = g_NpcName.."��i hi�p t�i ��u tr��ng t� th� c� vui hay kh�ng?";
SAY_2.sel = 
{
	{"Kh�i ��ng - gi�nh chi�n th�ng 5 l�n th�ng qua "gia nh�p nhanh" m� ��u tr��ng V� L�m Minh, s� nh�n ���c ph�n th��ng.", "#task(1)", }, 
	{"Ti�u th� th�n th� - gi�nh chi�n th�ng 5 l�n th�ng qua "gia nh�p nhanh" m� ��u tr��ng V� L�m Minh, s� nh�n ���c ph�n th��ng.", "#task(2)", }, 
	{"Phong cu�ng v� gi� - gi�nh chi�n th�ng 10 l�n th�ng qua "gia nh�p nhanh" m� ��u tr��ng V� L�m Minh, s� nh�n ���c ph�n th��ng.", "#task(3)", }, 
	{"tr� l�i", TMAIN, }, 
	{"K�t th�c ��i tho�i", "nothing", }, };
		
g_tStatValueStr = {
	"jiaochang_reshen",			--��¼�����ȡ��������Ĵ���
	"jiaochang_xiaoshi",		--��¼�����ȡС����������Ĵ���
	"jiaochang_fengkuang",	--��¼����������������Ĵ���
}
	
function task(n)
	local nTaskId = 992 + n - 1;
	if GetTask(3458 + n - 1) ~= 0 then
		return Talk(1, "", g_NpcName.."H�m nay ng��i �� nh�n ph�n th��ng n�y");
	end

	if tGtTaskManage:IsGetGTaskID(nTaskId) == 0 then
		local nCanGet = tGtTask:IsTaskCanGet(nTaskId)
		if nCanGet ~= 1 then
			return Talk(1,  "",  "Ng��i kh�ng th� nh�n nhi�m v� n�y");
		else
			OpenGTask(nTaskId)
			AddStatValue(g_tStatValueStr[n], 1);
		end
	else
		local nCanOver = tGtTask:IsTaskCanOver(nTaskId)
		if nCanOver ~= 1 then
			return Talk(1, "", g_NpcName.."Ng��i v�n ch�a ho�n th�nh nhi�m v� n�y");
		else
			FinishGTask(nTaskId)
		end
	end
end

SAY_3.msg = g_NpcName.."�� tr�nh t�nh tr�ng kh�ng tu�n th� tr�t t� trong ��u tr��ng, tr��ng l�o ��c bi�t giao cho nh�ng ��i hi�p l�p k� c�ng l�nh b�i";
SAY_3.sel = 
{
	{"L�nh b�i g� ch�", SAY_3_1, }, 
--	{"��Ҫ������ƣ�����20ö��ң��", "exchangeToken", }, 
	{"tr� l�i", TMAIN, }, 
	{"K�t th�c", "nothing", }, };
SAY_3_1.msg = g_NpcName.."L�nh b�i c� th� tr�nh t�nh tr�ng trong ��u tr��ng V� L�m Minh b� t�y ti�n m�i r�i kh�i ��i, n� c� t�c d�ng trong v�ng 1 th�ng";
SAY_3_1.sel = 
{
	{"tr� l�i", SAY_3, }, };
SAY_4.msg = g_NpcName.."��u tr��ng V� L�m Minh l� do Tr��ng L�o V� L�m Minh B�ch Hi�u Sinh li�n h�p v�n s�, thi�u d��ng, c�ng nhau t� ch�c T� V�. Sau �� l� �� ��i kh�ng Thi�n Minh Gi�o. ";
SAY_4.sel = 
{
	{"Gi�i thi�u gi�o tr��ng", SAY_4_1, }, 
	{"Gi�i thi�u �i�m t�ch l�y", SAY_4_2, }, 
--	{"��������", SAY_4_3, }, 
	{"tr� l�i", TMAIN, }, 
	{"K�t th�c", "nothing", }, };
SAY_4_1.msg = "Th�i gian V� L�m Minh Gi�o Tr��ng m� l� m�i ng�y v�o l�c 18:00 - 24:00. C�c ��i hi�p c� th� trong kho�ng th�i gian n�y, do ti�u n� d�n v�o. Sau �� c� th� gia nh�p v�o ph�ng li�n quan ti�n h�nh giao tranh. n\ Hi�n t�i l� m� h�nh t� ��i V� L�m Minh, chia th�nh 2 ng��i t� ��i v� 3 ng��i t� ��i giao tranh.";
SAY_4_1.sel = 
{
	{"tr� l�i", SAY_4, }, };
SAY_4_2.msg = "Thi�u hi�p giao tranh trong V� L�m Minh Gi�o Tr��ng c� th� nh�n ���c �i�m t�ch l�y, khi �i�m t�ch l�y ��t ��n m�c nh�t ��nh, s� n�ng l�n ��n m�c kh�c v� nh�n ���c danh hi�u t��ng �ng. Danh hi�u c� th� t�ng th�m cho thu�c t�nh v�nh vi�n, t��ng �ng nh� sau: \n Nh�t V� Gi�    0           L�c V� Th�nh    18000\n Nh� V� S�    2000        Th�t V� Ho�ng    22000\n Tam V� S�    6000        B�t V� Qu�    28000\n T� V� Hi�p    10000       C�u V� T�n    35000\n Ng� V� T�ng    14000       V� Th�nh        60000";
SAY_4_2.sel = 
{
	{"tr� l�i", SAY_4, }, };
SAY_4_3.msg = "Khi ��i hi�p t�ng m�c trong V� L�m Minh Gi�o Tr��ng, s� ���c ch�ng t�i t�ng l� v�t, nh� sau\n Nh�t V� Gi�    Danh hi�u gi�o tr��ng        L�c V� Th�nh    M�t t�ch L�ng Ba\n Nh� V� S�    Thi�n Bi�n Ph�m Thi�n Quy�n      Th�t V� Ho�ng    M�t T�ch Ti�u Dao\n tam V� S�    Nh�n S�m Ng�n N�m      B�t V� Qu�    M�t t�ch m�n ph�i t��ng �ng\n T� V� Hi�p    T�y T�y Linh ��n        C�u V� T�n    Ch�n ph�i t�n quy�n ��a Huy�n Kim L�nh\n Ng� V� T�ng    B�t B�o T�y T�y Ti�n ��n      V� Th�nh      M�t t�ch cao c�p\n V� L�m Minh c�n cung c�p cho ng��i ch�i s� t�ch c�c v� c� v�.";
SAY_4_3.sel = 
{
	{"tr� l�i", SAY_4, }, };

--SAY_5.msg = g_NpcName.."�����˷��㣺�𾴵���ʿ�����ڸ�λ��������У�������ڼ��������֣��ֽ�����35���ֶһ�1���ӵı������н���������ջ�����ƺš�";
SAY_5.msg = g_NpcName.."��i hi�p, qua th��ng l��ng v�i Tr��ng l�o V� L�m Minh, quy ��i nh� sau: \n1?m�i ng��i 50 ��u Ph�ch L�nh (kh�a) \n2?c�n c� v�o �i�m t�ch l�y V� L�m Minh Gi�o Tr��ng nh�n ���c danh hi�u v�nh vi�n \n    1      V� L�m Minh V� Gi�      18000  V� L�m Minh V� Linh \n    2000   V� L�m Minh V� S�      22000  V� L�m Minh V� Ho�ng\n    6000   V� L�m Minh V� S�      28000  V� L�m Minh V� Qu�\n    10000  V� L�m Minh V� Hi�p      35000  V� L�m Minh V� T�n\n    14000  V� L�m Minh V� T�ng      60000  V� L�m Minh V� Th�nh";
SAY_5.sel = 
{
	{"Ta mu�n nh�n quy ��i", "exchangeScore", },
	{"tr� l�i", TMAIN, }, };

function main()
	return;
	local m = GetWorldPos();
	local sel = {};
	if m == 8000 then
		sel = {             
			--"\n��������/#ChangeGroupWorld(425,1762,3157)",
			"\�����꾩/#ChangeGroupWorld(200,1391,2820)",
			"\nK�t th�c ��i tho�i/nothing",
		}
		Say("<color=green>Giang Nam nh�t k� Mai Ph�m Th�<color>: ha ha, ��c S� ��i H�i T� V� �ang b�n vi�c tri�u ��nh, ta ��nh ph�i thay m�t ch� tr� l�n ��i h�i n�y r�i.",
			getn(sel), sel);
	else
		temp_Talk(TMAIN);
	end
end

function enterNvn()
	if gf_CheckPlayerRoute() ~= 1 then
		return Talk(1, "", "H�y gia nh�p m�n ph�i tr��c r�i h�y ��n tham gia t� v�");
	elseif GetLevel() < 70 then
		return Talk(1, "", "��ng c�p kh�ng �� 70 kh�ng th� tham gia t� v�");
	end
	local nHour = tonumber(date("%H"));
	if nHour < 18 or nHour > 23 then
		return Talk(1, "", "��u tr��ng m� v�o l�c 18:00 - 23:00");
	end
	SetTask(TASKID_NEED_SYNC_REALM_DATA, 1);
	ChangeGroupWorld(8000,1600,3200,1);	
end

g_tNvnRankAward = {
	[1 ] = {},
	[2 ] = {"Thi�n Bi�n Ph�m Thi�n Quy�n", {g,d,p,1,4}},
	[3 ] = {
		{"Nh�n S�m v�n n�m", {g,d,p,1,4}},
		{"Th�n h�nh b�o �i�n", {g,d,p,1,4}},
	},
	[4 ] = {
		{"T�y T�y ��n", {g,d,p,5,4}},
		{"T�y T�y linh ��n", {g,d,p,1,4}},
	},
	[5 ] = {"B�t B�o T�y T�y Ti�n ��n", {g,d,p,1,4}},
	[6 ] = {"L�ng Ba M�t T�ch", {g,d,p,1,4}},
	[7 ] = {"M�t T�ch Ti�u Dao", {g,d,p,1,4}},
	[8 ] = {"M�t t�ch m�n ph�i", {g,d,p,1,4}},
	[9 ] = {"��a Huy�n Kim L�nh", {g,d,p,1,4}}, 
	[10] = {"M�t t�ch cao c�p ng�u nhi�n", {g,d,p,1,4}}, 
}

function giveRandAward()
	local rankAward = GetTask(TASKID_NVN_RANK_AWARD);
	local nRank = GetTask(TASKID_NVN_RANK);
	if GetBit(rankAward, nRank) == 1 then return end
	rankAward = SetBit(rankAward, nRank, 1);
	local tAward = g_tNvnRankAward[nRank];
	SetTask(TASKID_NVN_RANK_AWARD, rankAward);
	if not tAward or getn(tAward) == 0 then return end
	
end

function tmz_Change_Xoyo_Gold()
	local strtab = {
		"D�ng v�ng ��i Xu Ti�u Dao (1 v�ng ��i 100 Xu Ti�u Dao)/tmz_Use_JXB",
		"tr� l�i/main",
		"K�t th�c ��i tho�i/nothing",
	};
	Say(g_NpcName,--.."������<color=yellow>��ң��<color>����Ļ��Ҷ����޷�ʹ�ã��ҿ��Խ�<color=yellow>����<color>�һ��ɿ��������ң�ҡ���������ӵ����ң��"..GetXYB().."ö���Ժ��ѯ��ͨ��F2���档����Ϊ������",
		getn(strtab),
		strtab)
end

function tmz_Use_JXB()
	local nJxb = floor(GetCash()/10000);
	AskClientForNumber("tmz_Use_JXB_Confirm",1,nJxb*100,"��i bao nhi�u Xu Ti�u Dao?");
end

function tmz_Use_JXB_Confirm(nCount)
--	local nJxb = floor(GetCash()/10000);
--	if nJxb < nCount/100 then
--		Talk(1,"",g_NpcName.."�����ϲ������Ӷһ�"..nCount.."��ң�ҡ�");
--		return 0;
--	end
--	if Pay(nCount/100*10000) == 1 then
--		EarnXYB(nCount);
----		Msg2Player("����"..nCount.."��ң�ҡ�");
--	end
end

function tmz_Change_Xoyo_Yu()
--	Say(g_NpcName.."��ȷ��ʹ��1��[�����]�һ�100��ң����",
--		2,
--		"\nȷ��/tmz_Change_Yu_Confirm",
--		"\n����/main")
end

function tmz_Change_Yu_Confirm()
	if GetItemCount(2,1,1001) < 1 then
		Talk(1,"",g_NpcName.."C�c h� kh�ng mang theo H�a Th� B�ch.");
		return 0;
	end
	if DelItem(2,1,1001,1) == 1 then
		EarnXYY(100);
	end
end

function FinishGTask(nTaskID)
	--print("in finish")
	if nTaskID == 0 or nTaskID == nil then
		nTaskID = GetTask(3401);
		if nTaskID == 0 then
			return 5
		end
	end
	
	--manage���Ƿ����
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 3
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	
	--�������
	local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	if nCanOver ~= 1 then
		return 2
	end
	
	--����ǰ�������߻��趨��ɾ�����Ի�
	if tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10]) == nil then
		return 4;
	end
	--tGtTask:SpeakFinish(nTaskID, 1);
	
	--��������
	--��Ч
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	--manage����
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--���뽱��
	tGtTask:DoPrize(nTaskID)	
	
	--������һ�¾Ϳ��Եõ���һ������
--	tGtNpcMain:npc_main(tGtNpcInfo[nTaskID].to_npc)
	
	--print("succ")
	return 1
end

g_tNvnRankTitle = {
    {1    , 67, 1, "V� L�m Minh V� Gi�",},
    {2000 , 67, 2, "V� L�m Minh V� S�",},
    {6000 , 67, 3, "V� L�m Minh V� S�",},
    {10000, 67, 4, "V� L�m Minh V� Hi�p",},
    {14000, 67, 5, "V� L�m Minh V� T�ng",},
    {18000, 67, 6, "V� L�m Minh V� Linh",},
    {22000, 67, 7, "V� L�m Minh V� Ho�ng",},
    {28000, 67, 8, "V� L�m Minh V� Qu�",},
    {35000, 67, 9, "V� L�m Minh V� T�n",},
    {60000, 67, 10, "V� L�m Minh V� Th�nh",},
}

function exchangeScore(bSure)
	if gf_CheckGlbFlag(GF_NVN_FEEDBACK) ~= 1 then
		if gf_CheckGlbFlag(GF_NVN_FEEDBACK_2) ~= 1 then
			return Talk(1, "", "Ng��i �� nh�n �i�m t�ch l�y quy ��i V� L�m Minh r�i!");			
		end
		if gf_AddGlbFlag(GF_NVN_FEEDBACK_2) ~= 1 then return end
		gf_SetLogCaption(format("[NVN ��i �i�m t�ch l�y 2]"));
		gf_AddItemEx({2,95,1511,1,4}, "��u Ph�ch L�nh", 45);
		gf_SetLogCaption("");
		return Talk(1, "", "�i�m t�ch l�y V� L�m Minh c�a ng��i �� ��i ho�n t�t, �a t� !");
	end
	if gf_JudgeRoomWeight(1,1,"") ~= 1 then return end
	
	local nScore = GetTask(TASKID_NVN_SCORE);
	if nScore <= 0 then
		return Talk(1, "", "�i�m t�ch l�y V� L�m Minh c�a ng��i l� 0, kh�ng th� nh�n!");
	end
	if gf_AddGlbFlag(GF_NVN_FEEDBACK) ~= 1 then return end
	if gf_AddGlbFlag(GF_NVN_FEEDBACK_2) ~= 1 then return end
	gf_SetLogCaption(format("[NVN ��i �i�m t�ch l�y] [%d]", nScore));
	for i = getn(g_tNvnRankTitle), 1, -1 do
		if nScore >= g_tNvnRankTitle[i][1] then
			AddTitle(g_tNvnRankTitle[i][2], g_tNvnRankTitle[i][3]);
			Msg2Player(format("Ch�c m�ng ng��i nh�n ���c [%s] danh hi�u", g_tNvnRankTitle[i][4]));
			gf_AddItemEx({2,95,1511,1,4}, "��u Ph�ch L�nh", 50);
			break;
		end
	end
	gf_SetLogCaption("");
	Talk(1, "", g_NpcName.."�i�m t�ch l�y V� L�m Minh c�a ng��i �� ��i ho�n t�t, �a t� !");
end
