
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ʦ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03
--Changed by joker(zhaoguichun)
--2006/09/04
--Changed point: add random boss

-- ======================================================

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")
Include("\\script\\task\\teach\\teach_main.lua");

g_InfoHeader_BSh = "<color=green>Ti�u S�<color>: "
g_szThisFile = "\\script\\��ԭһ��\\�꾩\\npc\\��ʦ.lua"

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==13) then
		task_013_00();
		return
	else
		Say("<color=green>Ti�u s�<color>: Huhu, ng�y ��y mai ��, kh�ng bi�t khi n�o t�m x��ng kh� n�y c� ch� d�ng ch�n.",
			2,
			"Nh�n ph�n th��ng ho�t ��ng bang h�i tinh anh/first_tong_event",
			"K�t th�c ��i tho�i/no"
		)
	end;
end;

function first_tong_event()
	if IsTongMember() == 0 then
		Say(g_InfoHeader_BSh.."Ng��i kh�ng gia nh�p bang h�i, v� v�y kh�ng th� nh�n ph�n th��ng ho�t ��ng bang h�i tinh anh!", 0)
		return
	end
	ApplyRelayShareData(RELAY_DB_FIRSTTONG_JPZ, 0, 0, g_szThisFile, "first_tong_prize_cb")
end

function first_tong_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say(g_InfoHeader_BSh.."V� ��i hi�p n�y kh�ng ph� h�p v�i �i�u ki�n nh�n th��ng!", 0)
		return
	end
	local nDateStart, nPrizeFlag, szTongName = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if szTongName ~= GetTongName() then
		Say(g_InfoHeader_BSh.."V� ��i hi�p n�y kh�ng ph� h�p v�i �i�u ki�n nh�n th��ng!", 0)
		return
	end

	local selTab = {
--				format("��ȡ��������/#get_first_tong_reward_1(%d,%d,\"%s\")",nDateStart, nPrizeFlag, szTongName),
				format("Nh�n ph�n th��ng bang ch�ng/#get_first_tong_reward_2(%d,\"%s\")",nDateStart, szTongName),
				"Redeem later/no",
				}
	Say(g_InfoHeader_BSh.."Xin m�i ch�n ph�n th��ng!",getn(selTab),selTab)
end

function get_first_tong_reward_1(nDateStart, nPrizeFlag, szTongName)
	if IsTongMember() ~= 1 then
		Say(g_InfoHeader_BSh.."Ch� c� bang ch� m�i c� th� nh�n ph�n th��ng n�y.", 0)
		return
	end
	if nPrizeFlag == 0 then
		Say(g_InfoHeader_BSh.."��i hi�p �� nh�n qua ph�n th��ng bang ch� r�i, ng��i ch� ���c nh�n 1 l�n.", 0)
		return
	end
	local selTab = {
				format("Ta mu�n l�nh ngay/#obtain_first_tong_reward_1(%d,%d,\"%s\")",nDateStart, nPrizeFlag, szTongName),
				"��i ta ki�m tra l�i!/no",
				}
	Say(g_InfoHeader_BSh.."Ng��i c� ch�c b�y gi� mu�n nh�n ph�n th��ng bang h�i?",getn(selTab),selTab)
end

function obtain_first_tong_reward_1(nDateStart, nPrizeFlag, szTongName)
	if IsTongMember() == 0 then
		Say(g_InfoHeader_BSh.."Ng��i kh�ng gia nh�p bang h�i, v� v�y kh�ng th� nh�n ph�n th��ng ho�t ��ng bang h�i tinh anh!", 0)
		return
	end
	if szTongName ~= GetTongName() then
		Say(g_InfoHeader_BSh.."V� ��i hi�p n�y kh�ng ph� h�p v�i �i�u ki�n nh�n th��ng!", 0)
		return
	end
	if IsTongMember() ~= 1 then
		Say(g_InfoHeader_BSh.."Ch� c� bang ch� m�i c� th� nh�n ph�n th��ng n�y.", 0)
		return
	end
	if nPrizeFlag == 0 then
		Say(g_InfoHeader_BSh.."��i hi�p �� nh�n qua ph�n th��ng bang ch� r�i, ng��i ch� ���c nh�n 1 l�n.", 0)
		return
	end
	
	if gf_Judge_Room_Weight(9,50) == 0 then
		Say(g_InfoHeader_BSh.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!", 0)
		return
	end
	
	Earn(50000000)--��Ϊ�ƽ�5000��
	WriteLog("[Jx2 First Guild]: [Role Name:"..GetName().."]  Obtain 5000 gold.")

	if random(1, 100) > 50 then
		if AddItem(0,107,155,1,1) == 1 then			--�����ؼ�
			Msg2Player("B�n nh�n ���c 1 quy�n  ".."Ng� H�nh M�t t�ch");
			WriteLog("[Jx2 First Guild]:"..GetName().." B�n nh�n ���c 1 quy�n  ".."Ng� H�nh M�t t�ch");
		else
			WriteLog("[Jx2 First Guild]:"..GetName().." B�n nh�n ���c 1 quy�n  ".."Ng� H�nh M�t t�ch");
		end
	else
		local tBookList = {
			--  "����",						G1,G2,G3,����
			[1] = { "Kim Cang Ph�c Ma T�m Ph�p",	0,107, 2,1},
			[2] = { "Ti�m Long T�m Ph�p",		0,107, 4,1},
			[3] = { "V� Tr�n T�m Ph�p",		0,107, 6,1},
			[4] = { "Thi�n La T�m Ph�p",		0,107, 8,1},
			[5] = { "Nh� � T�m Ph�p",		0,107,10,1},
			[6] = { "B�ch H�i T�m Ph�p",		0,107,12,1},
			[7] = { "H�n ��n T�m Ph�p",		0,107,14,1},
			[8] = { "Qu� Thi�n T�m Ph�p",		0,107,16,1},
			[9] = { "Huy�n �nh T�m Ph�p",		0,107,18,1},
			[10] = {"Qu�n T� T�m Ph�p",		0,107,20,1},
			[11] = {"Tr�n Qu�n T�m Ph�p",		0,107,22,1},
			[12] = {"Xuy�n V�n T�m Ph�p",		0,107,24,1},
			[13] = {"U Minh T�m Ph�p",		0,107,26,1},
			[14] = {"Linh C� T�m Ph�p",		0,107,28,1},
			[15] = {"Kim Cang Ph�c Ma kinh",	0,107, 1,1},
			[16] = {"Ti�m Long M�t t�ch",		0,107, 3,1},
			[17] = {"V� Tr�n M�t t�ch",		0,107, 5,1},
			[18] = {"Thi�n La M�t T�ch",		0,107, 7,1},
			[19] = {"Nh� � M�t T�ch",		0,107, 9,1},
			[20] = {"B�ch H�i Ph�",		0,107,11,1},
			[21] = {"H�n ��n M�t t�ch",		0,107,13,1},
			[22] = {"Qu� Thi�n M�t t�ch",		0,107,15,1},
			[23] = {"Huy�n �nh M�t t�ch",		0,107,17,1},
			[24] = {"Qu�n T� M�t t�ch",		0,107,19,1},
			[25] = {"Tr�n Qu�n M�t t�ch",		0,107,21,1},
			[26] = {"Xuy�n V�n M�t t�ch",		0,107,23,1},
			[27] = {"U Minh Qu� L�c",		0,107,25,1},
			[28] = {"Linh C� M�t t�ch",		0,107,27,1},
		}

		gf_SetLogCaption("Jx2 First Guild")
		local nRandom = random(1,28)
		gf_AddItemEx({tBookList[nRandom][2],tBookList[nRandom][3],tBookList[nRandom][4],tBookList[nRandom][5],1}, tBookList[nRandom][1]);
		gf_SetLogCaption("")
	end
	
	local nPrizeFlagNew = 0;
	AddRelayShareData(RELAY_DB_FIRSTTONG_JPZ, 0, 0, g_szThisFile, "", 0, "0", "dds", nDateStart, nPrizeFlagNew, szTongName)
end

function get_first_tong_reward_2(nDateStart, szTongName)
	local nDateNow = tonumber(date("%y%m%d"))
	if nDateNow <= nDateStart then
		Say(g_InfoHeader_BSh.."V� ��i hi�p n�y kh�ng ph� h�p v�i �i�u ki�n nh�n th��ng!", 0)
		return
	end

	local selTab = {
				format("Ta mu�n l�nh ngay/#obtain_first_tong_reward_2(%d,\"%s\")",nDateStart, szTongName),
				"��i ta ki�m tra l�i!/no",
				}
	Say(g_InfoHeader_BSh.."Ng��i c� ch�c b�y gi� mu�n nh�n ph�n th��ng bang ch�ng?",getn(selTab),selTab)
end

function obtain_first_tong_reward_2(nDateStart, szTongName)
	if IsTongMember() == 0 then
		Say(g_InfoHeader_BSh.."Ng��i kh�ng gia nh�p bang h�i, v� v�y kh�ng th� nh�n ph�n th��ng ho�t ��ng bang h�i tinh anh!", 0)
		return
	end
	if szTongName ~= GetTongName() then
		Say(g_InfoHeader_BSh.."V� ��i hi�p n�y kh�ng ph� h�p v�i �i�u ki�n nh�n th��ng!", 0)
		return
	end
	local nDateNow = tonumber(date("%y%m%d"))
	if nDateNow <= nDateStart then
		Say(g_InfoHeader_BSh.."V� ��i hi�p n�y kh�ng ph� h�p v�i �i�u ki�n nh�n th��ng!", 0)
		return
	end
	if nDateNow <= GetTask(2446) then
		Say(g_InfoHeader_BSh.."Ng��i �� nh�n h�t ph�n th��ng h�m nay r�i, ng�y mai l�i ��n nh�!",0)
		return
	end

	local tItemInfo = {"B�ng Lai L� Th�y", "B�ng Lai Ti�n Th�y", "B�ng Lai Ti�n L�", "B�ng Lai Ti�n ��n"}
	local nType, nTime, nSpeed = GetExistXclInfo()
	if nTime > 0 then
		if nSpeed == 300 then
			Say("B�n nh�n ���c hi�u qu� "..tItemInfo[4].."  c�a hi�u qu�, kh�ng th� ��i b�ng  "..tItemInfo[3], 0)
		elseif nSpeed == 200 then
			obtain_xcl_reward();
		elseif nSpeed == 150 then
			Say(g_InfoHeader_BSh.."Hi�n b�n b�n c�  "..tItemInfo[2].." , mu�n ��i th�nh "..tItemInfo[3].."?\n<color=red>Ch� �: Sau khi thay ��i th�i gian hi�u qu� ban ��u s� tr� v� 0<color>", 2, "Yes/obtain_xcl_reward", "No/no")
		elseif nSpeed == 120 then
			Say(g_InfoHeader_BSh.."Hi�n b�n b�n c�  "..tItemInfo[1].." , mu�n ��i th�nh "..tItemInfo[3].."?\n<color=red>Ch� �: Sau khi thay ��i th�i gian hi�u qu� ban ��u s� tr� v� 0<color>", 2, "Yes/obtain_xcl_reward", "No/no")
		end
	else
		obtain_xcl_reward()
	end
end

function obtain_xcl_reward()
	local nDate = tonumber(date("%y%m%d"))
	if EatXcl(2,3600) == 1 then
		SetTask(2446,nDate)
		Say(g_InfoHeader_BSh.."Ng��i nh�n ���c 1 gi� ��nh qu�i nh�n ��i kinh nghi�m",0)
		Msg2Player("Ng��i nh�n ���c 1 gi� ��nh qu�i nh�n ��i kinh nghi�m")
		WriteLog("[Jx2 First Guild]: [Role Name:"..GetName().."] obtained 1 hours of 2 times EXP effect.");
	end
end

function no()
end

