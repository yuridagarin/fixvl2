Include("\\script\\vng\\trangbikimxa.lua");
--Create date:2007-3-2
--Author:yanjun
--Describe:ս������ģ��
--note:�˽ű������ұ�Include
SONG_ID = 1;
LIAO_ID = 2;

if IB_VERSION == 1 then
	g_szNeedItemName = "N� Oa Tinh Th�ch";
	g_nItemID = 504;
else
	g_szNeedItemName = "N� Oa Tinh Th�ch";
	g_nItemID = 504;
end;

tEquipInfo = 
{
	[1] = 	{	--��ͳװ			
		[SONG_ID] = {--װ����Ϣ,��Ҫ����,���Ļ���,���Ľ���,������Ʒ��Ϣ
					{{"T�ng �� th�ng chi�n kh�i",0,103,2231},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					{{"T�ng �� th�ng chi�n b�o",0,100,2231},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					{{"T�ng �� th�ng chi�n ph�c",0,101,2231},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					},
		[LIAO_ID] = {
					{{"Li�u �� th�ng chi�n kh�i",0,103,2235},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					{{"Li�u �� th�ng chi�n b�o",0,100,2235},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},
					{{"Li�u �� th�ng chi�n ph�c",0,101,2235},3,15000,500,{g_szNeedItemName,2,1,g_nItemID,1}},					
					}
			},
	[2] = 	{	--�ȷ�װ			
		[SONG_ID] = {--װ����Ϣ,��Ҫ����,���Ļ���,���Ľ���,������Ʒ
					{{"T�ng ti�n phong hi�u k�",0,102,2261},4,30000,1300,{g_szNeedItemName,2,1,g_nItemID,4}},
					{{"T�ng ti�n phong hi�u ph�",0,102,2265},4,30000,1300,{g_szNeedItemName,2,1,g_nItemID,4}},
					},
		[LIAO_ID] = {
					{{"Li�u ti�n phong hi�u k�",0,102,2271},4,30000,1300,{g_szNeedItemName,2,1,g_nItemID,4}},
					{{"Li�u ti�n phong hi�u ph�",0,102,2275},4,30000,1300,{g_szNeedItemName,2,1,g_nItemID,4}},
					}
			},
	[3] = 	{	--����װ			
		[SONG_ID] = {--װ����Ϣ,��Ҫ����,���Ļ���,���Ľ���,������Ʒ
					{{"T�ng t��ng qu�n ��u kh�i",0,103,2241},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"T�ng t��ng qu�n chi�n b�o",0,100,2241},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"T�ng t��ng qu�n chi�n ph�c",0,101,2241},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"T�ng t��ng qu�n l�nh b�i",0,102,2281},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"T�ng t��ng qu�n c� l�nh",0,102,2285},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"T�ng l�nh ph�",0,102,2521},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					},
		[LIAO_ID] = {
					{{"Li�u t��ng qu�n ��u kh�i",0,103,2245},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Li�u t��ng qu�n chi�n b�o",0,100,2245},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Li�u t��ng qu�n chi�n ph�c",0,101,2245},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Li�u t��ng qu�n l�nh b�i",0,102,2291},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Li�u t��ng qu�n c� l�nh",0,102,2295},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					{{"Li�u l�nh ph�",0,102,2531},5,60000,2500,{g_szNeedItemName,2,1,g_nItemID,10}},
					}
			},
	[4] = 	{	--Ԫ˧װ
		[SONG_ID] = {
					{{"T�ng nguy�n so�i ��u kh�i",0,103,2251},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"T�ng nguy�n so�i chi�n b�o",0,100,2251},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"T�ng nguy�n so�i chi�n ph�c",0,101,2251},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"T�ng nguy�n so�i h� ph�",0,102,2301},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"T�ng nguy�n so�i l�nh k�",0,102,2305},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"T�ng so�i ph�",0,102,2501},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"T�ng so�i k�",0,102,2505},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					},
		[LIAO_ID] = {
					{{"Li�u nguy�n so�i ��u kh�i",0,103,2255},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Li�u nguy�n so�i chi�n b�o",0,100,2255},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Li�u nguy�n so�i chi�n ph�c",0,101,2255},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Li�u nguy�n so�i h� ph�",0,102,2311},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Li�u nguy�n so�i l�nh k�",0,102,2315},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Li�u so�i ph�",0,102,2511},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					{{"Li�u so�i k�",0,102,2515},6,100000,4000,{g_szNeedItemName,2,1,g_nItemID,20}},
					}	
			}
}
--ս�����������
function BTA_Main()
	CalcBattleRank();
	local nCurRank = BT_GetData(PT_CURRANK);
	local selTab = {
			"Ta mu�n ��i trang b� �� th�ng/#BTA_WantEquip(1)",
			"Ta mu�n ��i trang b� Ti�n phong/#BTA_WantEquip(2)",
			"Ta mu�n ��i trang b� T��ng qu�n/#BTA_WantEquip(3)",
			"Ta mu�n ��i trang b� Nguy�n so�i/#BTA_WantEquip(4)",
			"Ta mu�n bi�t quy t�c ��i ph�n th��ng/BTA_KnowRule",
			"Ta s� quay l�i sau!/nothing",
			}
	if abs(nCurRank) <= 2 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Qu�n h�m c�a ng��i c�n th�p, kh�ng th� ��i ph�n th��ng.");
		return 0;
	end;
	for i=1,6-abs(nCurRank) do	--���������ȥ��һЩѡ��ģ��������ȽϹ֣�������������
		tremove(selTab,abs(nCurRank)-1);	
	end;
	tinsert(selTab, 1, "Ta mu�n ��i trang b� Kim X� - Nguy�n So�i/DoiTrangBiKimXa_NguyenSoai_Menu")
--	tinsert(selTab, 1, "Ta mu�n ��i trang b� Kim X� - T��ng Qu�n/DoiTrangBiKimXa_TuongQuan_Menu")
	if (g_nNpcCamp == SONG_ID and nCurRank <= 0) or (g_nNpcCamp == LIAO_ID and nCurRank >= 0) then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng��i kh�ng �� �i�u ki�n ��i trang b� phe <color=yellow>"..tCampNameZ[g_nNpcCamp].."<color> . Xin x�c nh�n l�i qu�n h�m c� ph�i l� phe <color=yellow>"..tCampNameZ[g_nNpcCamp].."<color>.a");
		return 0;
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Ng��i c�n ��i ph�n th��ng g�?",getn(selTab),selTab);
end;
--ս�������һ�����˵��
function BTA_KnowRule()
	Talk(1,"BTA_KnowRule2","<color=green>"..g_sNpcName.."<color>: <enter> ��i <color=yellow>Trang b� �� th�ng<color> qu�n h�m ph�i t� <color=yellow>T�ng �� Th�ng<color> tr� l�n. M�i trang b� c�n <color=yellow>500 v�ng<color>, <color=yellow>15000 �i�m t�ch l�y<color> v� <color=yellow>"..g_szNeedItemName.."<color><enter>��i <color=yellow>Trang b� Ti�n phong<color> qu�n h�m ph�i t� <color=yellow>T�ng Ti�n Phong<color> tr� l�n. M�i trang b� c�n <color=yellow>1300 v�ng<color>, <color=yellow>30000 �i�m t�ch l�y<color>; v� <color=yellow>"..g_szNeedItemName.."<color> 40!");
end;

function BTA_KnowRule2()
	Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: <enter>��i <color=yellow>Trang b� T��ng qu�n<color> qu�n h�m ph�i t� <color=yellow>T�ng T��ng Qu�n<color> tr� l�n. M�i trang b� c�n <color=yellow>2500 v�ng<color>, <color=yellow>60000 �i�m t�ch l�y<color> v� <color=yellow>"..g_szNeedItemName.."<color> 10!<enter> ��i <color=yellow>Trang b� Nguy�n so�i <color> qu�n h�m ph�i t� <color=yellow>T�ng Nguy�n So�i<color> tr� l�n. M�i trang b� c�n <color=yellow>4000 v�ng<color>, <color=yellow>100000 �i�m t�ch l�y<color> v� <color=yellow>"..g_szNeedItemName.."<color> 20!");
end;

function BTA_WantEquip(nType)
	local selTab = {};
	for i=1,getn(tEquipInfo[nType][1]) do
		tinsert(selTab,format(tEquipInfo[nType][g_nNpcCamp][i][1][1].."/#BTA_AffirmEquip(%d,%d)",nType,i));
	end;
	tinsert(selTab,"Ta mu�n xem trang b� kh�c/BTA_Main");
	tinsert(selTab,"Ta s� quay l�i sau!/nothing");
	Say("<color=green>"..g_sNpcName.."<color>: Ng��i c�n ��i trang b� n�o",getn(selTab),selTab);
end;

function BTA_AffirmEquip(nType,nEquipIndex)
	local tEquip = tEquipInfo[nType][g_nNpcCamp][nEquipIndex][1];
	local selTab = {
				format("��ng � ��i /#BTA_AffirmEquipFinal(%d,%d)",nType,nEquipIndex),
				"�� ta suy ngh� l�i/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>: Ng��i ��ng � ��i <color=yellow>"..tEquip[1].."<color> ch�?",getn(selTab),selTab);
end;

function BTA_AffirmEquipFinal(nType,nEquipIndex)
	if BTA_CheckCondition(nType,nEquipIndex) == 1 then
		local tEquip = tEquipInfo[nType][g_nNpcCamp][nEquipIndex][1];
		local nBody = GetBody();
		local nRetCode = AddItem(tEquip[2],tEquip[3],tEquip[4]-1+nBody,1,1,-1,-1,-1,-1,-1,-1);
		if nRetCode == 1 then
			Msg2Player("B�n nh�n ���c 1 trang b�:"..tEquip[1]);
			WriteLog("[ph�n th��ng chi�n tr�n]:"..GetName().."nh�n ���c trang b� chi�n tr��ng:"..tEquip[1]);
		else
			WriteLog("[ph�n th��ng b� l�i]:"..GetName().."nh�n ���c trang b� ("..tEquip[1]..") l�i, nRetCode:"..nRetCode);
		end;
	end;
end;
--����Ƿ�����һ�ս��װ��������Ҫ��
function BTA_CheckCondition(nType,nEquipIndex)
	if gf_JudgeRoomWeight(2,200) == 1 then
		local t = tEquipInfo[nType][g_nNpcCamp][nEquipIndex];
		local nNeedRank = t[2];
		local nNeedPoint = t[3];
		local nNeedMoney = t[4];
		local nNeedItemCount = t[5][5];
		local nCurRank = abs(BT_GetData(PT_CURRANK));	--��Ϊ��ڴ���֤����Ӧ������ȡ��Ӧװ�����������ﲻ���ж�������Ӫ��
		local nCurPoint = BT_GetData(PT_TOTALPOINT);
		local nCurMoney = GetCash();
		local szItemName,nItemID1,nItemID2,nItemID3 = t[5][1],t[5][2],t[5][3],t[5][4];
		local nCurItemCount = GetItemCount(nItemID1,nItemID2,nItemID3);
		local szEquipName = t[1][1];
		if nCurRank < nNeedRank then
			Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: Qu�n h�m c�a b�n c�n th�p kh�ng th� ��i <color=yellow>"..szEquipName.."<color>.");
			return 0;
		end;
		if nCurPoint < nNeedPoint then
			Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: �i�m t�ch l�y c�a b�n c�n th�p qu�, kh�ng th� ��i <color=yellow>"..szEquipName.."<color>. B�n c�n c� th�m <color=red>"..nNeedPoint.."<color> �i�m t�ch l�y");
			return 0;
		end;
		if nCurMoney < nNeedMoney*10000 then
			Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: Ti�n v�ng kh�ng ��, kh�ng th� ��i <color=yellow>"..szEquipName.."<color>. B�n c�n c� th�m <color=red>"..nNeedMoney.."<color> v�ng");
			return 0;
		end;
		if nCurItemCount < nNeedItemCount then
			Talk(1,"BTA_Main","<color=green>"..g_sNpcName.."<color>: B�n c�n <color=yellow>"..nNeedItemCount.."<color> <color=yellow>"..szItemName.."<color> m�i c� th� ��i<color=yellow>"..szEquipName.."<color>.");
			return 0;
		end;
		BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);	--�ۻ���
		Pay(nNeedMoney*10000);	--�۽���
		DelItem(nItemID1,nItemID2,nItemID3,nNeedItemCount);	--����Ʒ
		return 1;
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Kho�ng tr�ng trong h�nh trang kh�ng ��!");
		return 0;
	end;
end;
