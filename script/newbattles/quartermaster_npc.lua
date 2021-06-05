Include("\\script\\newbattles\\functions.lua");

function main()
	local selTab = {
				"M� r��ng ch�a ��/open_box",
				"S�a ch�a/repair",
				"Nh�n d��c ph�m chi�n tr��ng/want_medicine",
				"��i �i�m t�ch l�y l�y d��c ph�m/buy_medicine",
				"K�t th�c ��i tho�i/nothing",
				}
	local szSaySth = "";
	local nCurMapID = GetWorldPos();
	if nCurMapID == VILLAGE_MAP_ID then

	elseif nCurMapID == RESOURCE_MAP_ID then
		tremove(selTab,3);	--�ݹȳ�սû����ȡҩƷ�ͻ��ֻ�ҩ����
		tremove(selTab,3);
	elseif nCurMapID == EMPLACEMENT_MAP_ID then
		
	elseif nCurMapID == MAIN_MAP_ID then	--��ս���Ի�ѡ���ж�

	end;
	szSaySth = "C� c�n gi�p g� kh�ng?";
	Say("<color=green>Qu�n nhu quan<color>:"..szSaySth,getn(selTab),selTab);
end;

function want_medicine()
	if BT_GetData(PTNC_GOT_MEDICINE) == 1 then
		--Talk(1,"","<color=green>�����<color>������ҩƷ�������࣬ÿ��ս��ÿ��ֻ����ȡһ��ҩƷ��");
		--return 0;
	end;
	local nCount = 0;
	local nCurMapID = GetWorldPos();
	if nCurMapID == MAIN_MAP_ID then
		local nPlayerCamp = BT_GetCamp();
		local nResourceCamp = GetGlbValue(GLB_RESOURCE);
		if nPlayerCamp == nResourceCamp then
			nCount = 50;	--ʤ���ɻ�50��
		elseif nResourceCamp == 0 then
			nCount = 40;	--ƽ�ֿɻ�40��
		else
			nCount = 25;	--�ܷ��ɻ�25��
		end;
	else
		nCount = 30;
	end;
	if gf_Judge_Room_Weight(3,300) == 1 then	
		BT_SetData(PTNC_GOT_MEDICINE,1);
		AddItem(tBattleItem[9][2],tBattleItem[9][3],tBattleItem[9][4],nCount);
		Msg2Player("B�n nh�n ���c "..nCount.."c�i"..tBattleItem[9][1]);	
		AddItem(tBattleItem[10][2],tBattleItem[10][3],tBattleItem[10][4],nCount);
		Msg2Player("B�n nh�n ���c "..nCount.."c�i"..tBattleItem[10][1]);	
		AddItem(tBattleItem[11][2],tBattleItem[11][3],tBattleItem[11][4],nCount);
		Msg2Player("B�n nh�n ���c "..nCount.."c�i"..tBattleItem[11][1]);	
	else
		Talk(1,"","H�nh trang ho�c s�c l�c c�a ng��i kh�ng ��, xin ki�m tra l�i tr��c!");
	end;
end;

function buy_medicine()
	local selTab = {
				"Ta mu�n ��i d��c ph�m chi�n tr��ng/want_battle_medicine",
				"Ta mu�n ��i d��c ph�m th�ng d�ng/want_pk_medicine",
				"Kh�ng c�n/nothing",
				}
	Say("Ng��i mu�n ��i d��c ph�m n�o?",getn(selTab),selTab);
end;
--===========================================================================================
function want_battle_medicine()
	list_battle_medicine(1,getn(tBattleMed));
end;

function list_battle_medicine(nPageNum,nCount)
	local tMedList = get_battle_medicine_list();
	local selTab = {};
	local nItemPerPage = 4;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--���������������õ�ǰҳ���������ʾ��Ŀ����
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nCount);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("Trang tr��c \n /#list_battle_medicine(%d,%d)",nPageNum-1,nCount));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tMedList[i]);
	end;
	if nPageNum ~= ceil(nCount/nItemPerPage) then
		tinsert(selTab,format("\n Trang sau/#list_battle_medicine(%d,%d)",nPageNum+1,nCount));	
	end;
	tinsert(selTab,"\n Ta mu�n xem d��c ph�m kh�c/buy_medicine");
	tinsert(selTab,"�� ta ngh� l�i/nothing");
	Say("Ng��i mu�n ��i d��c ph�m n�o?",getn(selTab),selTab);
end;

function get_battle_medicine_list()
	local tSelTab = {};
	for i=1,getn(tBattleMed) do
		tinsert(tSelTab,format(tBattleMed[i][1].."/#select_battle_medicine(%d)",i));
	end;
	return tSelTab;
end;

function select_battle_medicine(nMedIdx)
	local selTab = {
					format("Ta mu�n ��i 1/#get_battle_medicine(%d,%d)",nMedIdx,1),
					format("Ta mu�n ��i 2/#get_battle_medicine(%d,%d)",nMedIdx,2),
					format("Ta mu�n ��i 5/#get_battle_medicine(%d,%d)",nMedIdx,5),
					format("Ta mu�n ��i 10/#get_battle_medicine(%d,%d)",nMedIdx,10),
					format("Ta mu�n ��i 20/#get_battle_medicine(%d,%d)",nMedIdx,20),
					"\nTa mu�n xem d��c ph�m chuy�n d�ng kh�c/want_battle_medicine",
					"Kh�ng c�n/nothing",
					}
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local szItemName = tBattleMed[nMedIdx][1];
	local nNeedPoint = tBattleMed[nMedIdx][5];
	local nMaxCount = floor(nCurPoint/nNeedPoint);
	local szEffect = tBattleMed[nMedIdx][6];
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	local nNeedRank = tBattleMed[nMedIdx][7];
	if nCurRank < nNeedRank then
		Talk(1,"want_battle_medicine","Qu�n h�m c�a ng��i qu� th�p, c�n ph�i ��t ��n c�p <color=yellow>"..tRankName[nNeedRank].."<color> tr� l�n m�i c� th� ��i nh�ng d��c ph�m n�y.");
		return 0;
	end;
	Say("M�i <color=yellow>"..szItemName.."<color> c�n <color=yellow>"..nNeedPoint.."<color> �i�m t�ch l�y chi�n tr��ng, b�n hi�n c� <color=yellow>"..nCurPoint.."<color> �i�m t�ch l�y chi�n tr��ng, t�i �a c� th� ��i <color=yellow>"..nMaxCount.."<color> c�i"..szItemName..". Hi�u qu� d��c ph�m: <color=yellow>"..szEffect.."<color>.",getn(selTab),selTab);
end;

function get_battle_medicine(nMedIdx,nCount)
	local nNeedPoint = tBattleMed[nMedIdx][5];
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local szItemName = tBattleMed[nMedIdx][1];
	if gf_JudgeRoomWeight(2,nCount*2) == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c c�a ng��i kh�ng ��, xin ki�m tra l�i tr��c!");
		return 0;
	end;
	local nNeedTotalPoint = nNeedPoint*nCount;
	if nCurPoint < nNeedTotalPoint then
		Talk(1,"","�i�m t�ch l�y c�a ng��i kh�ng ��!");
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedTotalPoint);
	AddItem(tBattleMed[nMedIdx][2],tBattleMed[nMedIdx][3],tBattleMed[nMedIdx][4],nCount);
	Msg2Player("B�n ti�u hao"..nNeedTotalPoint.." �i�m t�ch l�y chi�n tr��ng")
	Msg2Player("B�n nh�n ���c "..nCount.."c�i"..szItemName);
end;
--===========================================================================================
function want_pk_medicine()
	list_pk_medicine(1,getn(tPKMed));
end;

function list_pk_medicine(nPageNum,nCount)
	local tMedList = get_pk_medicine_list();
	local selTab = {};
	local nItemPerPage = 4;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--���������������õ�ǰҳ���������ʾ��Ŀ����
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nCount);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("Trang tr��c \n /#list_pk_medicine(%d,%d)",nPageNum-1,nCount));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tMedList[i]);
	end;
	if nPageNum ~= ceil(nCount/nItemPerPage) then
		tinsert(selTab,format("\n Trang sau/#list_pk_medicine(%d,%d)",nPageNum+1,nCount));	
	end;
	tinsert(selTab,"\n Ta mu�n xem d��c ph�m kh�c/buy_medicine");
	tinsert(selTab,"�� ta ngh� l�i/nothing");
	Say("Ng��i mu�n ��i d��c ph�m n�o?",getn(selTab),selTab);
end;

function get_pk_medicine_list()
	local tSelTab = {};
	for i=1,getn(tPKMed) do
		tinsert(tSelTab,format(tPKMed[i][1].."/#select_pk_medicine(%d)",i));
	end;
	return tSelTab;
end;

function select_pk_medicine(nMedIdx)
	local selTab = {
					format("Ta mu�n ��i 1/#get_pk_medicine(%d,%d)",nMedIdx,1),
					format("Ta mu�n ��i 2/#get_pk_medicine(%d,%d)",nMedIdx,2),
					format("Ta mu�n ��i 5/#get_pk_medicine(%d,%d)",nMedIdx,5),
					format("Ta mu�n ��i 10/#get_pk_medicine(%d,%d)",nMedIdx,10),
					format("Ta mu�n ��i 20/#get_pk_medicine(%d,%d)",nMedIdx,20),
					"\n Ta mu�n xem d��c ph�m th�ng d�ng kh�c/want_pk_medicine",
					"Kh�ng c�n/nothing",
					}
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local szItemName = tPKMed[nMedIdx][1];
	local nNeedPoint = tPKMed[nMedIdx][5];
	local nMaxCount = floor(nCurPoint/nNeedPoint);
	local szEffect = tPKMed[nMedIdx][6];
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	local nNeedRank = tPKMed[nMedIdx][7];
	if nCurRank < nNeedRank then
		Talk(1,"want_pk_medicine","Qu�n h�m c�a ng��i qu� th�p, c�n ph�i ��t ��n c�p <color=yellow>"..tRankName[nNeedRank].."<color> tr� l�n m�i c� th� ��i nh�ng d��c ph�m n�y.");
		return 0;
	end;
	Say("M�i <color=yellow>"..szItemName.."<color> c�n <color=yellow>"..nNeedPoint.."<color> �i�m t�ch l�y chi�n tr��ng, b�n hi�n c� <color=yellow>"..nCurPoint.."<color> �i�m t�ch l�y chi�n tr��ng, t�i �a c� th� ��i <color=yellow>"..nMaxCount.."<color> c�i"..szItemName..". Hi�u qu� d��c ph�m: <color=yellow>"..szEffect.."<color>.",getn(selTab),selTab);
end;

function get_pk_medicine(nMedIdx,nCount)
	local nNeedPoint = tPKMed[nMedIdx][5];
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local szItemName = tPKMed[nMedIdx][1];
	if gf_JudgeRoomWeight(2,nCount*2) == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c c�a ng��i kh�ng ��, xin ki�m tra l�i tr��c!");
		return 0;
	end;
	local nNeedTotalPoint = nNeedPoint*nCount;
	if nCurPoint < nNeedTotalPoint then
		Talk(1,"","�i�m t�ch l�y c�a ng��i kh�ng ��!");
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedTotalPoint);
	AddItem(tPKMed[nMedIdx][2],tPKMed[nMedIdx][3],tPKMed[nMedIdx][4],nCount);
	Msg2Player("B�n ti�u hao"..nNeedTotalPoint.." �i�m t�ch l�y chi�n tr��ng")
	Msg2Player("B�n nh�n ���c "..nCount.."c�i"..szItemName);
end;
--===========================================================================================
function open_box()
	if GetTask(805) == 0 then
		Talk(1,"","Xin l�i! Ng��i ch�a c� r��ng ch�a ��.");
		return 0;
	end;
	OpenBox();
end;

function repair()
	local selTab = {
			"S�a mi�n ph� (�� b�n tr��c ��y =0)/repair1",
			"T�ng c�p/repair2",
			"S�a mi�n ph� (�� b�n tr��c ��y =0)/repair3",
			"tr� l�i/main"
			};
	Say("Kh�ch quan xem k� trang b� khi s�a ch�a.",getn(selTab),selTab)
end;

function repair1()
	AdvanceRepair(1);
end;

function repair2()
	AdvanceRepair(2);
end;

function repair3()
	AdvanceRepair(3);
end;

function nothing()

end;