--file name:award_npc.lua
--author:yanjun(yim)
--create date:2006-7-8
--describe:�佱��
Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
function handinhand_main()
	if Is_HandInHand_Open() == 0 then
		Talk(1,"main","Ho�t ��ng c�p th� gi�i �� k�t th�c, c�m �n m�i ng��i �� tham gia.");
		return 0;
	end;
	local selTab = {
				"Ta mu�n ��i/ask_for_award",
				"Xem n�i dung ho�t ��ng./know_detail",
				"L� bao k� ni�m c�p th� gi�i/know_present_bag",
				"Nh�n h��ng d�n ho�t ��ng/get_intro_book",
				"K�t th�c ��i tho�i/nothing",
				}
	Say("Ho�t ��ng c�p th� gi�i �� b�t ��u, m�i ng��i h�y c�ng nhau tham gia.",getn(selTab),selTab);
end;

function know_present_bag()
	Talk(1,"main","M� l� bao k� ni�m c�p th� gi�i c� kh� n�ng nh�n ���c c�c v�t ph�m sau: 1% �i�m kinh nghi�m (�t h�n 500000 t�nh l� 500000), nh�n ���c 4% �i�m kinh nghi�m theo t� l� nh�t ��nh (�t h�n 2 tri�u t�nh 2 tri�u), 32 ph�n T�y B�c V�ng,");
end;

function ask_for_award()
	if GetTime() - GetTask(TASK_GOTAWARD_TIME) <= GET_AWARD_INTERVAL then
		Talk(1,"handinhand_main","Xin l�i! Th�i gian ��i ph�n th��ng gi�a m�i l�n c�ch nhau <color=yellow>1 gi�<color>.");
		return 0;
	end;
	local selTab = {
				"Ta �� thu th�p �� th� c�a 1 b�ng/#want_award1(1)",
				"Ta �� thu th�p �� th� 4 ��i m�nh/want_award2",
				"Ta �� thu th�p �� th� c�a 32 ��i/want_award3",
				"B�n nh�n ���c th� ��i Trung Hoa/want_award4",
				"\nQuay l�i/handinhand_main",
				"K�t th�c ��i tho�i/nothing",
				}
	Say("Ng��i �� thu th�p ���c lo�i th� n�o? Kh�ch quan mu�n d�ng th� ��i ph�n th��ng n�o?",getn(selTab),selTab);
end;

function know_detail()
	Talk(4,"handinhand_main","Hai v� kh�c gi�i ch� c�n t�o t� ��i c� th� n�m tay c�ng c��i th�, sau <color=yellow>5 ph�t<color> s� xu�t hi�n khung ��i tho�i, y�u c�u m�i b�n ch� c�n ch�n 1 nh�m m�nh th�ch.",
							"Sau khi ch�n, ng��i ch�i s� nh�n ���c 1 t�m th� ng�u nhi�n, t� l� th�nh c�ng d�a theo ��ng c�p 2 ng��i ch�i c�ng l�i chia cho 100, n�u h�n 100% s� l�y k�t qu� ��.",
							"Ng��i ch�i c� th� d�ng th� m�nh c� ��n ��y ��i ph�n th��ng t��ng �ng.",
							"Th�ng tin chi ti�t xin tham kh�o trang ch� c�a VLTK2.");
end;

function get_intro_book()
	if GetItemCount(tItemOther["intro_book"][2],tItemOther["intro_book"][3],tItemOther["intro_book"][4]) >=1 then
		Talk(1,"handinhand_main","Kh�ng ph�i ��i hi�p �� c� 1 quy�n"..tItemOther["intro_book"][1].."?");
		return 0;
	end;
	if AddItem(tItemOther["intro_book"][2],tItemOther["intro_book"][3],tItemOther["intro_book"][4],1) == 1 then
		Msg2Player("B�n nh�n ���c 1 quy�n"..tItemOther["intro_book"][1]);
	end;
end;

tGroupName = {"B�ng A","B�ng B","B�ng C","B�ng D","B�ng E","B�ng F","B�ng G","B�ng H"};
--��ȡС�鿨Ƭ����
function want_award1(nPageNum)
	if GetTask(TASK_GOTGROUP_AWARD) >= 30 then
		Talk(1,"handinhand_main","��i hi�p �� ��i 30 l�n ph�n th��ng n�y, kh�ng th� ti�p t�c ��i n�a.");
		return 0;
	end;
	local selTab = {};
	selTab[1] = "D�ng th�"..tGroupName[(nPageNum-1)*4+1].."��i ph�n th��ng/#give_award1_confirm("..((nPageNum-1)*4+1)..")";
	selTab[2] = "D�ng th�"..tGroupName[(nPageNum-1)*4+2].."��i ph�n th��ng/#give_award1_confirm("..((nPageNum-1)*4+2)..")";
	selTab[3] = "D�ng th�"..tGroupName[(nPageNum-1)*4+3].."��i ph�n th��ng/#give_award1_confirm("..((nPageNum-1)*4+3)..")";
	selTab[4] = "D�ng th�"..tGroupName[(nPageNum-1)*4+4].."��i ph�n th��ng/#give_award1_confirm("..((nPageNum-1)*4+4)..")";
	selTab[5] = "Trang tr��c/#want_award1("..(nPageNum-1)..")";
	selTab[6] = "Trang sau/#want_award1("..(nPageNum+1)..")";
	selTab[7] = "��i ph�n th��ng kh�c/ask_for_award";
	selTab[8] = "Quay l�i ��i tho�i ch�nh./handinhand_main";
	selTab[9] = "K�t th�c ��i tho�i/nothing";
	if nPageNum == 1 then
		tremove(selTab,5);
	end;
	if nPageNum == 2 then
		tremove(selTab,6);
	end;
	Say("��i hi�p d�ng th� n�o �� ��i ph�n th��ng?",getn(selTab),selTab);
end;

function give_award1_confirm(nGroup)
	local selTab = {
				"��ng v�y!/#give_award1("..nGroup..")",
				"Ta suy ngh� l�i!/#want_award1(1)",
				}
	Say("Ph�n th��ng l� <color=yellow>1 l� bao k� ni�m c�p th� gi�i<color>. Xin x�c nh�n h�nh trang v� s�c l�c c�n �� �� tr�nh t�n th�t ��ng ti�c.B�n x�c nh�n mu�n ��i th� c�a v�ng b�ng l�y ph�n th��ng?",getn(selTab),selTab);
end;

function give_award1(nGroup)
	if have_group_card(nGroup) == 1 then
		local nRetCode = 0;
		delete_group_card(nGroup);
		nRetCode = AddItem(tItemOther["present_bag"][2],tItemOther["present_bag"][3],tItemOther["present_bag"][4],1);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 1 "..tItemOther["present_bag"][1]);
			WriteLog("[Vui ho�t ��ng c�p th� gi�i]"..GetName().."��i th� v�ng b�ng l�y ph�n th��ng, nh�n ���c 1"..tItemOther["present_bag"][1]);
		else
			WriteLog("[L�i ho�t ��ng c�p th� gi�i]"..GetName().."��i th� v�ng b�ng l�y ph�n th��ng, nh�n ���c 1"..tItemOther["present_bag"][1].."h b� l�i, tr� quay l�i AddItem:"..nRetCode);
		end;
		SetTask(TASK_GOTGROUP_AWARD,GetTask(TASK_GOTGROUP_AWARD)+1);
		SetTask(TASK_GOTAWARD_TIME,GetTime());
	end;
end;

--��ȡ4ǿ��Ƭ����
function want_award2()
	if GetTask(TASK_GOT4TEAM_AWARD) >= 5 then
		Talk(1,"handinhand_main","B�n �� ��i 5 l�n ph�n th��ng n�y, kh�ng th� ti�p t�c ��i ���c.");
		return 0;
	end;
	local selTab = {
				"��ng v�y!/give_award2",
				"Ta suy ngh� l�i!/ask_for_award",
				}
	Say("Ph�n th��ng l� <color=yellow>4 l� bao k� ni�m c�p th� gi�i<color> v� <color=yellow>1 Ti�u Ni�n Th� Ph�<color>. Xin x�c nh�n h�nh trang v� s�c l�c c�n �� �� tr�nh t�n th�t ��ng ti�c. B�n x�c nh�n mu�n ��i th� 4 ��i m�nh l�y ph�n th��ng?",getn(selTab),selTab);
end;

function give_award2()
	if have_4team_card() == 1 then
		local nRetCode = 0;
		delete_4team_card();
		nRetCode = AddItem(tItemOther["present_bag"][2],tItemOther["present_bag"][3],tItemOther["present_bag"][4],4);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 4 "..tItemOther["present_bag"][1]);
			WriteLog("[Vui ho�t ��ng c�p th� gi�i]"..GetName().."��i 4 card m�nh nh�t l�y ph�n th��ng, nh�n ���c 4"..tItemOther["present_bag"][1]);
		else
			WriteLog("[L�i ho�t ��ng c�p th� gi�i]"..GetName().."��i 4 card m�nh nh�t l�y ph�n th��ng, nh�n ���c 4"..tItemOther["present_bag"][1].."h b� l�i, tr� quay l�i AddItem:"..nRetCode);
		end;
		nRetCode = AddItem(tItemOther["monster_card"][2],tItemOther["monster_card"][3],tItemOther["monster_card"][4],1);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 1 "..tItemOther["monster_card"][1]);
			WriteLog("[Vui ho�t ��ng c�p th� gi�i]"..GetName().."��i 4 card m�nh nh�t l�y ph�n th��ng, nh�n ���c 1"..tItemOther["monster_card"][1]);
		else
			WriteLog("[L�i ho�t ��ng c�p th� gi�i]"..GetName().."��i 4 card m�nh nh�t l�y ph�n th��ng, nh�n ���c"..tItemOther["monster_card"][1].."h b� l�i, tr� quay l�i AddItem:"..nRetCode);
		end;
		SetTask(TASK_GOT4TEAM_AWARD,GetTask(TASK_GOT4TEAM_AWARD)+1);
		SetTask(TASK_GOTAWARD_TIME,GetTime());
	end;
end;
--��ȡ�׿�����
function want_award3()
	if GetTask(TASK_GOTALLTEAM_AWARD) ~= 0 then
		Talk(1,"handinhand_main","��i hi�p �� ��i 1 l�n ph�n th��ng n�y, kh�ng th� ti�p t�c ��i n�a.");
		return 0;
	end;
	local selTab = {
				"��ng v�y!/give_award3",
				"Ta suy ngh� l�i!/ask_for_award",
				}
	Say("Ph�n th��ng l� <color=yellow>10 L� bao k� ni�m c�p th� gi�i<color> v� <color=yellow>5 Ti�u Ni�n Th� Th�n Ph�<color>. Xin x�c nh�n h�nh trang v� s�c l�c c�n �� �� tr�nh t�n th�t ��ng ti�c. B�n ��ng � d�ng 32 th� ��i ph�n th��ng?",getn(selTab),selTab);	
end;

function give_award3()
	if have_series_card() == 1 then
		local nRetCode = 0;
		delete_series_card();
		nRetCode = AddItem(tItemOther["present_bag"][2],tItemOther["present_bag"][3],tItemOther["present_bag"][4],10);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 10 "..tItemOther["present_bag"][1]);
			WriteLog("[Vui ho�t ��ng c�p th� gi�i]"..GetName().."��i b� th� (32 t�m) l�y ph�n th��ng, nh�n ���c 10"..tItemOther["present_bag"][1]);
		else
			WriteLog("[L�i ho�t ��ng c�p th� gi�i]"..GetName().."��i b� th� (32 t�m) l�y ph�n th��ng, nh�n ���c 10"..tItemOther["present_bag"][1].."h b� l�i, tr� quay l�i AddItem:"..nRetCode);
		end;
		nRetCode = AddItem(tItemOther["monster_card"][2],tItemOther["monster_card"][3],tItemOther["monster_card"][4],5);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 5 "..tItemOther["monster_card"][1]);
			WriteLog("[Vui ho�t ��ng c�p th� gi�i]"..GetName().."��i b� th� (32 t�m) l�y ph�n th��ng, nh�n ���c 5"..tItemOther["monster_card"][1]);
		else
			WriteLog("[L�i ho�t ��ng c�p th� gi�i]"..GetName().."��i b� th� (32 t�m) l�y ph�n th��ng, nh�n ���c"..tItemOther["monster_card"][1].."h b� l�i, tr� quay l�i AddItem:"..nRetCode);
		end;
		SetTask(TASK_GOTALLTEAM_AWARD,GetTask(TASK_GOTALLTEAM_AWARD)+1);
		SetTask(TASK_GOTAWARD_TIME,GetTime());
	end;	
end;

--��ȡ����������
function want_award4()
	if GetTask(TASK_GOTRING_AWARD) ~= 0 then
		Talk(1,"ask_for_award","��i hi�p �� ��i 1 l�n ph�n th��ng n�y, kh�ng th� ti�p t�c ��i n�a.");
		return 0;
	end;
	if GetItemCount(tItemCard[34][2],tItemCard[34][3],tItemCard[34][4]) < 1 then
		Talk(1,"ask_for_award","Xin l�i! ��i hi�p c�n 1 t�m th� ��i Trung Hoa m�i c� th� ��i ph�n th��ng n�y.")
		return 0;
	end;
	give_award4();
end;

function give_award4()
	local nRetCode = 0;
	if DelItem(tItemCard[34][2],tItemCard[34][3],tItemCard[34][4],1) == 1 then
		nRetCode = AddItem(tItemOther["ring"][2],tItemOther["ring"][3],tItemOther["ring"][4],1,1,-1,-1,-1,-1,-1,-1);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c "..tItemOther["ring"][1]);
			WriteLog("[Vui ho�t ��ng c�p th� gi�i]"..GetName().."��i ��i L�c Th�n H�ng Li�n, nh�n ���c 1 "..tItemOther["ring"][1]);
		else
			WriteLog("[L�i ho�t ��ng c�p th� gi�i]"..GetName().."Khi ��i ��i L�c Th�n H�ng Li�n, nh�n ���c "..tItemOther["ring"][1].."h b� l�i, tr� quay l�i AddItem:"..nRetCode)
		end;
		SetTask(TASK_GOTRING_AWARD,GetTask(TASK_GOTRING_AWARD)+1);
		SetTask(TASK_GOTAWARD_TIME,GetTime());
	end;
end;

function have_group_card(nGroup)
	local nSearchFailed = 0;
	local sNeedTeamName = "";
	local sCmdStr = "";
	for i=1,4 do
		local nTeamIndex = (nGroup-1)*4+i;
		if GetItemCount(tItemCard[nTeamIndex][2],tItemCard[nTeamIndex][3],tItemCard[nTeamIndex][4]) < 1 then
			sNeedTeamName = sNeedTeamName..tItemCard[nTeamIndex][1];
			nSearchFailed = 1;
		end;
	end;
	if nGroup > 4 then
		sCmdStr = "#want_award1(2)";
	else
		sCmdStr = "#want_award1(1)";
	end;
	if nSearchFailed == 1 then
		Talk(1,sCmdStr,"��i hi�p thi�u nh�ng th� sau:"..sNeedTeamName);
		return 0;
	else
		return 1;
	end;
end;

function delete_group_card(nGroup)
	for i=1,4 do
		local nTeamIndex = (nGroup-1)*4+i;
		DelItem(tItemCard[nTeamIndex][2],tItemCard[nTeamIndex][3],tItemCard[nTeamIndex][4],1);
	end;
end;

t4TeamIndex = {1,13,17,25};

function have_4team_card()
	local nSearchFailed = 0;
	local sNeedTeamName = "";
	for i=1,getn(t4TeamIndex) do
		if GetItemCount(tItemCard[t4TeamIndex[i]][2],tItemCard[t4TeamIndex[i]][3],tItemCard[t4TeamIndex[i]][4]) < 1 then
			sNeedTeamName = sNeedTeamName..tItemCard[t4TeamIndex[i]][1];
			nSearchFailed = 1;
		end;
	end;
	if nSearchFailed == 1 then
		Talk(1,"ask_for_award","��i hi�p thi�u nh�ng th� sau:"..sNeedTeamName);
		return 0;
	else
		return 1;
	end;
end;

function delete_4team_card()
	for i=1,getn(t4TeamIndex) do
		DelItem(tItemCard[t4TeamIndex[i]][2],tItemCard[t4TeamIndex[i]][3],tItemCard[t4TeamIndex[i]][4],1);
	end;
end;

function have_series_card()
	local nSearchFailed = 0;
	local sNeedTeamName = "";
	for i=1,getn(tItemCard)-2 do
		if GetItemCount(tItemCard[i][2],tItemCard[i][3],tItemCard[i][4]) < 1 then
			sNeedTeamName = sNeedTeamName..tItemCard[i][1];
			nSearchFailed = 1;
		end;
	end;
	if nSearchFailed == 1 then
		Talk(1,"ask_for_award","��i hi�p thi�u nh�ng th� sau:"..sNeedTeamName);
		return 0;
	else
		return 1;
	end;
end;

function delete_series_card()
	for i=1,getn(tItemCard)-2 do
		DelItem(tItemCard[i][2],tItemCard[i][3],tItemCard[i][4],1);
	end;
end;