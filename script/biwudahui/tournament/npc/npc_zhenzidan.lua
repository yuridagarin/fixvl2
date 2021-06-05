Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\define.lua")
Include("\\settings\\static_script\\lib\\itemfunctions.lua")
--Include("\\script\\misc\\soul\\soul.lua")--���
--Include("\\script\\misc\\hello_gm.lua")
Include("\\script\\missions\\nvn\\3v3npc.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")

g_szInfoHead = "<color=green> ��c S� ��i H�i T� V� <color>:";
g_szThisFile = "\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua";
g_bInit = 0;		--����Ƿ񾭹���ʼ��
g_tbZiGeRank = {};

tbJUNGONGZHANG =
{
	[1] = {"Qu�n C�ng Ch��ng",2,1,9999,2},
	[2] = {"Qu�n C�ng ��i",2,1,9998,5},
	[3] = {"Qu�n C�ng Huy Ho�ng",2,1,9977,10},
}

function main()
	local tSel = {
		"��i H�i T� V�-��n ��u\n/main_bwdh",
		"��i H�i T� V�-Li�n ��u\n/main_3v3",
		--"������Ҷһ�/exchangeMoney",
		--"��Խ�Կ�������ѡ�������/gotoUrl",
		"Kh�ng c� g�!/nothing",
	}
	Say(g_szInfoHead.."Nh�ng n�m g�n ��y bi�n c��ng li�n ti�p x�y ra chi�n tranh, tri�u ��nh h� ch�, s�p x�p ��i H�i T� V� ��n ��u v� ��i h�i t� th� li�n ��u. H�o ki�t c�c m�n ph�i ��u c� th� tham gia ��ng k�. Ng��i gi�nh th�ng l�i c�ng c� th� ���c n��c nh� tr�ng d�ng, x�ng pha tr�n m�c. H�i hi�p s�, b�n c� mu�n tham gia kh�ng?",
		getn(tSel), tSel);
	local today = gf_TodayDate()
end

function exchangeMoney()
	local tSel = {
		"��i Xu Ti�u Dao (Mua v�t ph�m t� v� li�n server)/GLB_BW_Change_Xoyo_Gold",
		"��i Ti�u Dao Ng�c (D�ch v� tr� gia t�ng li�n server) /GLB_BW_Change_Xoyo_Yu",
		"tr� l�i/main",
		"Kh�ng c� g�!/nothing",
	}
	Say(g_szInfoHead.."Sau khi v�o khu v�c li�n server, m�t s� v�t ph�m s� kh�ng ���c s� d�ng, v� t�m th�i bi�n m�t (quay v� s� ���c nh�n l�i). Ti�n t� duy nh�t ���c s� d�ng l� <color=yellow>Xu Ti�u Dao<color>.", getn(tSel), tSel);
end

function main_bwdh_award()
	local tbSay = {}
	local szTitle = format("")
	szTitle = format("C� th� nh�n th��ng li�n server � ��y, ng��i mu�n nh�n ph�n th��ng g�?")
	tinsert(tbSay, format("\n%s/BWT_GetAward", "Nh�n ph�n th��ng ��i h�i t� v� tu�n tr��c "))
	tinsert(tbSay, format("\n%s/season_award", "thi qu� ��i H�i T� V� li�n quan "))
	tinsert(tbSay, format("\n%s/nothing", "Ra kh�i"))
	Say(szTitle, getn(tbSay), tbSay)
end

function nothing()
end

function main_bwdh()
	init_zige_rank();
	BWT_WeeklyClear();
	local nDate = tonumber(date("%Y%m%d%H"));
	local selTab = {
				"Ta mu�n v�o khu v�c ��n ��u /GLB_BW_Goto_Field",
				--"��ȡ���ܱ����ά��/BWT_GetAward",
				--"�ñ��������ƻ�ȡ����/xunzhang_award",
				--"���˱�����ֵ��������/GLB_BW_Services_Set",
				"Ph�n th��ng ��i H�i T� V�/main_bwdh_award",
				"Ph� bi�n ��i h�i t� v�/know_detail",
				"Kh�ng c� g�!/nothing",
--				"����ս��/clear_biwu_result",
				}
	local nYear,nMonth,nDay,nHour = gf_GetDateData(g_nBWAwardDate);
	if nDate >= g_nBWAwardBeginDate and nDate <= g_nBWAwardDate then
		tinsert(selTab,2,"Nh�n ["..g_szGloryAwardName.."] (Th�i gian d�ng nh�n th��ng:"..nYear.."ni�n"..nMonth.."Nguy�t"..nDay.."Nh�t"..nHour.." gi�)/get_glory_bag");
	end;
	if GLB_BW_BiWuCheck() ~= 1 then --�Ƿ����˿������
		tremove(selTab,1)
	end
--	if nDate > g_nBWAwardDate then
--		tinsert(selTab,5,"�������������/season_award")
--	end
--	if nDate >= 2010082616 and nDate < 2010090123 then
--		tinsert(selTab,6,"��������һ���ʸ�ֲ�������ȡ��ֹ���ڣ�2010��9��1��23ʱ��/bw_buchang")
--	end
--	if BWDH_DEBUG_VERSION == 1 then
--		tinsert(selTab,"�������/test_entry");
--	end;
	Say(g_szInfoHead.."Tri�u ��nh h� ch�, chu�n b� ��i H�i T� V� ��n ��u, h�o ki�t c�c m�n ph�i ��u c� th� ��ng k� tham gia. Hi�n t�i � v�o giai �o�n v�ng ch�n, so t�i v� ngh� nh�n s� v� l�m, ch�n ra danh s�ch ng��i v�o chung k�t. V� thi�u hi�p n�y, b�n mu�n tham gia ��i H�i T� V� ��n ��u kh�ng.",getn(selTab),selTab);
end;

function clear_biwu_result()
	local selTab = {
				"X�a s� l�n tham gia so t�i c�a ta th�nh 0/clear_biwu_times",
				"K�t th�c ��i tho�i/nothing",
				}
	Say(g_szInfoHead.."N�u ng��i kh�ng h�i l�ng v�i th�nh t�ch hi�n gi� c�a m�nh, th� c� th� t�y m�t s� chi�n t�ch. V� d� ng��i c� th� x�a s� l�n so t�i c�a ng��i, bao g�m c� tr�n th�ng l�n tr�n thua th�nh 0. Ng��i mu�n t�y chi�n t�ch kh�ng? ",getn(selTab),selTab);
end;

function clear_biwu_times()
	local selTab = {
			"��ng �/clear_biwu_times_confirm",
			"H�y b�/nothing",
			}
	local szItemName = "";
	if IB_VERSION == 1 then
		szItemName = "1 quy�n S� m�n ��i s� h�m";
	else
		szItemName = "3 c�i Ti�u Ki�p t�n";
	end;
	Say(g_szInfoHead.."X�a s� l�n so t�i s� nh�n ���c <color=yellow>"..szItemName.."<color>, v� <color=yellow>bao g�m s� l�n trong tu�n v� t�ng s� l�n c�ng v�i t�t c� s� tr�n th�ng v� thua, l�u �: Sau khi x�a s� l�n thi ��u th� c�n ph�i ��nh �� 10 tr�n m�i c� th� ��ng k� �i�m.<color> Ng��i x�c ��nh mu�n x�a ch�?",getn(selTab),selTab);
end;

function clear_biwu_times_confirm()
	local szItemName = "";
	local nNeedItemNum = 0;
	local nID1,nID2,nID3 = 0,0,0;
	if IB_VERSION == 1 then
		szItemName = "1 quy�n S� m�n ��i s� h�m";
		nNeedItemNum = 1;
		nID1,nID2,nID3 = 2,1,1021;
	else
		szItemName = "3 c�i Ti�u Ki�p t�n";
		nNeedItemNum = 3;
		nID1,nID2,nID3 = 2,0,141;
	end;
	if DelItem(nID1,nID2,nID3,nNeedItemNum) == 1 then
		BWDH_SetTask(TSK_CURWEEKMATCH,0);
		BWDH_SetTask(TSK_CURWEEKWIN,0);
		BWDH_SetTask(TSK_CURWEEKLOSE,0);
		BWDH_SetTask(TSK_TOTALMATCH,0);
		BWDH_SetTask(TSK_TOTALLOSE,0);
		BWDH_SetTask(TSK_TOTALWIN,0);
		Say(g_szInfoHead.."S� l�n so t�i c�a ng��i �� ���c x�a.",0);
		WriteLog("["..LOG_HEAD.."]"..GetName().."�� x�a s� l�n so t�i c�a m�nh. ");
	else
		Talk(1,"",g_szInfoHead.."Ng��i c�n <color=yellow>"..szItemName.."<color> m�i c� th� x�a s� l�n so t�i.");
	end;
end;

function get_award()
	get_biwu_award();
end;

function resetBiwuTV()
	BWDH_SetTask(TSK_CURLADDERVALUE,0);	--�ʸ������0
	BWDH_SetTask(TSK_CURSIGNEDRESULT,0);	--�Ǽǻ�����0
	BWDH_SetTask(TSK_LASTWEEKLADDER,0);	--��������
	BWDH_SetTask(TSK_HIGHESTWEEKLADDER,0);	--���������
	BWDH_SetTask(TSK_CURREALRESULT,200);	--�ó�200
	BWT_QuitGestConvention();	--����ʱҪ�˳�����б�
	BWDH_SetTask(TSK_SIGN_UP,2);	--��Ϊ�ϲ��ˣ���Ϊ1�Ѿ�û�����塣����һ��Ҫ��Ϊ2���ܱ�ʾ��ұ�����
end;

--����Ϊ����ר��=================================================================================
function test_entry()
	local selTab = {
				"Ta mu�n gia nh�p v�o danh s�ch ��u ��i/join_peidui",
				"Ta mu�n r�i kh�i danh s�ch ��u ��i/quit_peidui",
				"Ch�n ra m�t c�p tuy�n th�/get_random_pair",
				"B�t ��u tr�n t� v�/init_one_round",
				"L�p nh�m m� t� v�/test_enter_field",
				"Ta mu�n xem t� v�/go_to_watch",
				"Ki�m tra trang b� c�a ta/check_equip",
				"Ki�m tra x�p h�ng �i�m t� c�ch tr��c khi h�p nh�t/see_rank_before",
				"Kh�ng c� g�/nothing",
				}
	Say(g_szInfoHead.."Ng��i mu�n g�?",getn(selTab),selTab);
end;

function test_enter_field()
	----------------------------------------
	if 1 ~= gf_team_check_gs(GetTeamID()) then
		Talk(1,"",g_szInfoHead.."C�n l�p nh�m hai ng��i!");
		return 0;
	end
	----------------------------------------

	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then
		Talk(1,"",g_szInfoHead.."C�n l�p nh�m hai ng��i!");
		return 0;
	end;
	BWT_OpenMatch(GetTeamMember(1),GetTeamMember(2));
end;

function init_one_round()
	local nCount = BWT_InitOneRound();
	Talk(1,"",g_szInfoHead.."Ch�n ra tuy�n th� t� v�"..nCount.."��ng.");
end;

function join_peidui()
	BWT_JoinGestConvention();
	Talk(1,"",g_szInfoHead.."B�y gi� b�n �� tham gia t� v�, m�i ��n <color=yellow>Tuy�n Ch�u ho�c g�n ��<color> ��i th�ng b�o t� v� c�a h� th�ng.");
	Msg2Player("Ng��i �� tham gia so t�i, h�y ��i th�ng b�o t� h� th�ng");
end;

function quit_peidui()
	BWT_QuitGestConvention();
	Talk(1,"",g_szInfoHead.."Ng��i �� r�i kh�i danh s�ch ��u ��i.");
end;

function get_random_pair()
	if BWT_SentInviteToPlayer() == 1 then
		Talk(1,"",g_szInfoHead.."C�p ��i th�nh c�ng!");
		return 1;
	else
		Talk(1,"",g_szInfoHead.."C�p ��i th�t b�i!");
		return 0;
	end;
end;

function go_to_watch()
	local selTab = {
				"Tuy�n Ch�u/#go_to_watch_confirm(100)",
				"Bi�n Kinh/#go_to_watch_confirm(200)",
				"Th�nh ��/#go_to_watch_confirm(300)",
				"Kh�ng c� g�/nothing",
				}
	Say(g_szInfoHead.."Ng��i mu�n xem t� v� � th�nh n�o?",getn(selTab),selTab);
end;

function go_to_watch_confirm(nMapID)
	NewWorld(TB_MAPID[nMapID][1],1620,3180);
end;

function check_equip()
	local nRetCode,tbEquip = BWT_CheckEquipment();
	local szHint = "";
	if nRetCode == 1 then
		Talk(1,"",g_szInfoHead.."Trang b� c�a b�n ph� h�p quy ��nh t� v�");
	else
		for i=1,getn(tbEquip) do
			if tbEquip[i] ~= 1 then
				szHint = szHint.."<color=yellow>"..TB_EquipPosName[i].."<color> v�o,";
			end;
		end;
		Talk(1,"",g_szInfoHead.."Trang b� kh�ng ph� h�p quy ��nh t� v� l�"..szHint.."H�y ki�m tra trang b� c�a b�n.");
	end;
end;

function xunzhang_award()
	local selTab = {
				"��i ph�n th��ng s� m�n/xz_award_shimen",
				"��i ph�n th��ng Linh th�ch/xz_award_lingshi",
				"��i ph�n th��ng kinh nghi�m/xz_award_jingyan",
				"\nT�m th�i kh�ng ��i/nothing",
				}
if _JX2WZ ~= 1 then
	tinsert(selTab, "��i ph�n th��ng chi�n tr�n/xz_award_battle");
end

	Say(g_szInfoHead.."Ng��i mu�n ��i ph�n th��ng g�?",getn(selTab),selTab);
end;

function xz_award_shimen()
	local nWeekNum = GetTask(TSK_XZ_AWARD_SHIMEN);
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",g_szInfoHead.."Ng��i ph�i gia nh�p m�n ph�i m�i c� th� ��i ph�n th��ng n�y.");
		return 0;
	end;
	local szItemName = TB_TOTEM_INFO[nFaction][2][4];
	local selTab = {
				"��ng �/xz_award_shimen_confirm",
				"\nT�m th�i kh�ng ��i/xunzhang_award",
				}
	Say(g_szInfoHead.."1 T� v� ��i h�i b�i c� th� ��i <color=yellow>1 "..szItemName.."v� 10 �i�m c�ng hi�n S� M�n<color>, m�i tu�n nhi�u nh�t <color=red>c� th� ��i 20 l�n<color>Ph�n th��ng n�y, tu�n n�y ng��i c�n c� th� ��i <color=yellow>"..(20-nWeekNum).."<color> l�n.",getn(selTab),selTab);
end;

function xz_award_shimen_confirm()
	local nItemNum = GetItemCount(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3]);
	if nItemNum <= 0 then
		Talk(1,"main",g_szInfoHead.."Tr�n ng��i ng��i kh�ng c�n T� v� ��i h�i b�i.");
		return 0;
	end;
	AskClientForNumber("xz_award_shimen_confirm_1",1,min(nItemNum,20),"Ng��i mu�n ��i m�y l�n?");
end;

function xz_award_shimen_confirm_1(nNum)
	local nWeekNum = GetTask(TSK_XZ_AWARD_SHIMEN);
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",g_szInfoHead.."Ng��i ph�i gia nh�p m�n ph�i m�i c� th� ��i ph�n th��ng n�y.");
		return 0;
	end;
	if nWeekNum >= 20 then
		Talk(1,"",g_szInfoHead.."Tu�n n�y ng��i �� ��i <color=yellow>20<color> l�n ph�n th��ng S� M�n, tu�n sau l�i ��n.");
		return 0;
	end;
	if nWeekNum + nNum > 20 then
		Talk(1,"xz_award_shimen",g_szInfoHead.."Tu�n n�y ng��i c� th� ��i nhi�u nh�t <color=yellow>"..(20-nWeekNum).."<color> l�n ph�n th��ng n�y.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,10,g_szInfoHead) == 0 then
		return 0;
	end;
	local nID1 = TB_TOTEM_INFO[nFaction][2][1];
	local nID2 = TB_TOTEM_INFO[nFaction][2][2];
	local nID3 = TB_TOTEM_INFO[nFaction][2][3];
	local szItemName = TB_TOTEM_INFO[nFaction][2][4];
	if DelItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nNum) == 1 then
		AddItem(nID1,nID2,nID3,nNum);
		BWDH_SetTask(336,GetTask(336)+nNum*10);
		BWDH_SetTask(TSK_XZ_AWARD_SHIMEN,nWeekNum+nNum);
		Msg2Player("B�n nh�n ���c "..nNum.."c�i"..szItemName.." v�"..(nNum*10).." �i�m c�ng hi�n S� M�n, tu�n n�y ng��i c�n c� th� ��i "..(20-nWeekNum-nNum).." l�n ph�n th��ng n�y.");
	else
		Talk(1,"xunzhang_award",g_szInfoHead.."Ph�i c� <color=yellow>"..nNum.." T� v� ��i h�i b�i<color> m�i c� th� ��i ph�n th��ng n�y.");
	end;
end;

function xz_award_lingshi()
	local nWeekNum = GetTask(TSK_XZ_AWARD_LINGSHI);
	local szIntro = "";
	if IB_VERSION == 1 then
		local selTab = {
					"Ta mu�n s� d�ng 1 M�t h�m s� m�n (c�n 1 T� v� ��i h�i b�i)/#xz_award_lingshi_confirm(1)",
					"Ta mu�n s� d�ng 3 M�t h�m s� m�n (c�n 1 T� v� ��i h�i b�i)/#xz_award_lingshi_confirm(2)",
					"Ta mu�n s� d�ng 1 S� m�n ��i s� h�m (c�n 1 T� v� ��i h�i b�i)/#xz_award_lingshi_confirm(3)",
					"\nT�m th�i kh�ng ��i/xunzhang_award",
					}
		szIntro = "D�ng <color=yellow>1<color> M�t h�m s� m�n ng��i s� ��i ���c 3 vi�n Linh th�ch; d�ng <color=yellow>3<color> M�t h�m s� m�n ng��i s� ��i ���c 10 vi�n Linh th�ch; d�ng <color=yellow>1<color> S� m�n ��i s� h�m ng��i s� ��i ���c 36 vi�n Linh th�ch, Linh th�ch ��i ���c s� �� trong T� Linh ��nh.\nT� l� ��ng c�p c�a m�i vi�n Linh th�ch l�: c�p 7 l� 0.1%, c�p 6 l� 1%, c�p 5 l� 5%, t� c�p 1 ��n c�p 4 l� 93.9%.\nTu�n n�y ng��i �� ��i <color=yellow>"..(nWeekNum+1).."<color> l�n ph�n th��ng n�y, m�i tu�n nhi�u nh�t <color=red>c� th� ��i 100 l�n<color>.";
		Say(g_szInfoHead..szIntro,getn(selTab),selTab);
	else
		local selTab = {
					"Ta mu�n s� d�ng 1 Tinh Luy�n B�ng Th�ch (c�n 1 T� v� ��i h�i b�i)/#xz_award_lingshi_confirm(1)",
					"Ta mu�n s� d�ng 3 Tinh Luy�n B�ng Th�ch (c�n 1 T� v� ��i h�i b�i)/#xz_award_lingshi_confirm(2)",
					"Ta mu�n s� d�ng 10 Tinh Luy�n B�ng Th�ch (c�n 1 T� v� ��i h�i b�i)/#xz_award_lingshi_confirm(3)",
					"\nT�m th�i kh�ng ��i/xunzhang_award",
					}
		szIntro = "D�ng <color=yellow>1<color> Tinh Luy�n B�ng Th�ch ng��i s� ��i ���c 3 vi�n Linh th�ch; d�ng <color=yellow>3<color> Tinh Luy�n B�ng Th�ch ng��i s� ��i ���c 10 vi�n Linh th�ch; d�ng <color=yellow>10<color> Tinh Luy�n B�ng Th�chng��i s� ��i ���c 36 vi�n Linh th�ch, Linh th�ch ��i ���c s� �� trong T� Linh ��nh.\nT� l� ��ng c�p c�a m�i vi�n Linh th�ch l�: c�p 7 l� 0.1%, c�p 6 l� 1%, c�p 5 l� 5%, t� c�p 1 ��n c�p 4 l� 93.9%.\nTu�n n�y ng��i �� ��i <color=yellow>"..(nWeekNum+1).."<color> l�n ph�n th��ng n�y, m�i tu�n nhi�u nh�t <color=red>c� th� ��i 100 l�n<color>.";
		Say(g_szInfoHead..szIntro,getn(selTab),selTab);
	end;
end;

function xz_award_lingshi_confirm(nUseType)
	local nWeekNum = GetTask(TSK_XZ_AWARD_LINGSHI);
	if nWeekNum >= 100 then
		Talk(1,"",g_szInfoHead.."Tu�n n�y ng��i �� ��i <color=yellow>100<color> l�n ph�n th��ng Linh th�ch, tu�n sau l�i ��n.");
		return 0;
	end;
	local tbNeedItemInfo = {};
	local tbLingShiNum = {3,10,36};
	if IB_VERSION == 1 then
		tbNeedItemInfo =
		{
			[1] = {2,1,1020,1,"M�t h�m s� m�n"},
			[2] = {2,1,1020,3,"M�t h�m s� m�n"},
			[3] = {2,1,1021,1,"S� m�n ��i s� h�m"},
		}
	else
		tbNeedItemInfo =
		{
			[1] = {2,1,533,1,"Tinh luy�n B�ng Th�ch"},
			[2] = {2,1,533,3,"Tinh luy�n B�ng Th�ch"},
			[3] = {2,1,533,10,"Tinh luy�n B�ng Th�ch"},
		}
	end;
	local nNeedNum = tbNeedItemInfo[nUseType][4];
	if GetItemCount(tbNeedItemInfo[nUseType][1],tbNeedItemInfo[nUseType][2],tbNeedItemInfo[nUseType][3]) < nNeedNum then
		Talk(1,"xunzhang_award",g_szInfoHead.."<color=yellow>"..tbNeedItemInfo[nUseType][5].."<color> s� l��ng kh�ng ��, ng��i c�n <color=yellow>"..nNeedNum.."<color> c�i"..tbNeedItemInfo[nUseType][5]..".");
		return 0;
	end;
	if DelItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],1) == 1 then
		DelItem(tbNeedItemInfo[nUseType][1],tbNeedItemInfo[nUseType][2],tbNeedItemInfo[nUseType][3],nNeedNum);
		BWDH_SetTask(TSK_XZ_AWARD_LINGSHI,nWeekNum+1);
		give_lingshi(tbLingShiNum[nUseType]);
		Msg2Player("Trong tu�n n�y ��i hi�p ��y l� l�n th� "..(nWeekNum+1).." l�n ph�n th��ng Linh th�ch");
		WriteLog("[Ph�n th��ng ��i h�i t� v�]"..GetName().."��i ph�n th��ng Linh th�ch");
	else
		Talk(1,"xunzhang_award",g_szInfoHead.."Ng��i c�n <color=yellow>1 T� v� ��i h�i b�i<color> m�i c� th� ��i ph�n th��ng n�y.");
	end;
end;

function give_lingshi(nCount)
	local tbNum = {0,0,0,0,0,0,0};
	local nRand = 0;
	for i=1,nCount do
		nRand = random(1,1000);
		if nRand <= 1 then
			tbNum[7] = tbNum[7]+1;
		elseif nRand <= 11 then
			tbNum[6] = tbNum[6]+1;
		elseif nRand <= 61 then
			tbNum[5] = tbNum[5]+1;
		else
			nRand = random(1,4);
			tbNum[nRand] = tbNum[nRand]+1;
		end;
	end;
	local szString = "";
	for i=1,getn(tbNum) do
		if tbNum[i] ~= 0 then
			szString = szString.."B�n nh�n ���c "..i.." (c�p) Linh Th�ch"..tbNum[i].." vi�n,";
			lspf_AddLingShiInBottle(i,tbNum[i]);
		end;
	end;
	Msg2Player(szString.." �� cho v�o T� Linh ��nh");
	WriteLog("[Ph�n th��ng ��i h�i t� v�]:"..GetName().."Nh�n ���c"..nCount.." vi�n Linh th�ch: "..szString);
end;
--���齱��================================================================================
function xz_award_jingyan()
	local nWeekNum = GetTask(TSK_XZ_AWARD_JINGYAN);
	local nLevel = GetLevel();
	local szIntro = "";
	if IB_VERSION == 1 then
		local nExp = floor(nLevel^4/200);--�ȼ����Ĵη�/200
		local selTab = {
					"Ta mu�n s� d�ng 1 M�t h�m s� m�n (c�n 1 T� v� ��i h�i b�i)/#xz_award_jingyan_confirm(1)",
					"Ta mu�n s� d�ng 3 M�t h�m s� m�n (c�n 1 T� v� ��i h�i b�i)/#xz_award_jingyan_confirm(2)",
					"Ta mu�n s� d�ng 1 S� m�n ��i s� h�m (c�n 1 T� v� ��i h�i b�i)/#xz_award_jingyan_confirm(3)",
					"\nT�m th�i kh�ng ��i/xunzhang_award",
					}
		szIntro = "Kinh nghi�m ng��i c� th� nh�n ���c l� <color=yellow>"..nExp.."<color>.\nD�ng 1 M�t h�m s� m�n ��i kinh nghi�m x2, c� 10% c� ���c kinh nghi�m x4\nD�ng 3 M�t h�m s� m�n ��i kinh nghi�m x3, c� 10% c� ���c kinh nghi�m x6\nD�ng 1 S� m�n ��i s� h�m ��i kinh nghi�m x4, c� 10% c� ���c kinh nghi�m x8.\nTu�n n�y ng��i �� ��i <color=yellow>"..(nWeekNum+1).."<color> l�n ph�n th��ng n�y, m�i tu�n nhi�u nh�t <color=red>c� th� ��i 100 l�n<color>.";
		Say(g_szInfoHead..szIntro,getn(selTab),selTab);
	else
		local nCurGoldenExp = GetGoldenExp();
		local nGoldenExp = floor((nLevel^4)*300000/(80^4));	--��ҵȼ����Ĵη�*30w/80��
		local selTab = {
					"Ta mu�n s� d�ng 1 Tinh Luy�n B�ng Th�ch (c�n 1 T� v� ��i h�i b�i)/#xz_award_jingyan_confirm(1)",
					"Ta mu�n s� d�ng 3 Tinh Luy�n B�ng Th�ch (c�n 1 T� v� ��i h�i b�i)/#xz_award_jingyan_confirm(2)",
					"Ta mu�n s� d�ng 10 Tinh Luy�n B�ng Th�ch (c�n 1 T� v� ��i h�i b�i)/#xz_award_jingyan_confirm(3)",
					"\nT�m th�i kh�ng ��i/xunzhang_award",
					}
		szIntro = "�i�m s�c kh�e hi�n gi� c�a ng��i l� <color=yellow>"..nCurGoldenExp.."<color>. �i�m s�c kh�e ng��i c� th� chuy�n l� <color=yellow>"..nGoldenExp.."<color> �i�m.\nD�ng 1 Tinh Luy�n B�ng Th�ch c� th� ��i �i�m s�c kh�e x2, c� 10% c� �i�m s�c kh�e x4\nD�ng 3 Tinh Luy�n B�ng Th�ch c� th� ��i �i�m s�c kh�e x2, c� 10% c� �i�m s�c kh�e x6\nD�ng 10 Tinh Luy�n B�ng Th�ch ��i �i�m s�c kh�e x4, c� 10% c� �i�m s�c kh�e x8.\nTu�n n�y ng��i �� ��i <color=yellow>"..(nWeekNum+1).."<color> l�n ph�n th��ng n�y, m�i tu�n nhi�u nh�t <color=red>c� th� ��i 100 l�n<color>.";
		Say(g_szInfoHead..szIntro,getn(selTab),selTab);
	end;
end;

function xz_award_jingyan_confirm(nUseType)
	local nLevel = GetLevel();
	if IB_VERSION == 1 then	--�����ֱ�ӵ���xz_award_jingyan_confirm_final
		xz_award_jingyan_confirm_final(nUseType);
	else	--�շ����жϵ�ǰ�������鹻����
		local nCurGoldenExp = GetGoldenExp();
		local tbMutiple = {2,3,4};
		local nMutiple = tbMutiple[nUseType];
		local nGoldenExp = floor((nLevel^4)*300000/(80^4))*nMutiple;
		if nGoldenExp > nCurGoldenExp then	--����������鲻����������ʾ
			local selTab = {
					"��ng �/#xz_award_jingyan_confirm_final("..nUseType..")",
					"T�m th�i kh�ng ��i/nothing",
					}
			Say(g_szInfoHead.."S�c kh�e hi�n gi� c�a ng��i l� <color=yellow>"..nCurGoldenExp.."<color> �i�m, kh�ng �� <color=yellow>"..nGoldenExp.."<color> �i�m, ng��i x�c nh�n mu�n ��i ch�?",getn(selTab),selTab);
		else
			xz_award_jingyan_confirm_final(nUseType);
		end;
	end;
end;

function xz_award_jingyan_confirm_final(nUseType)
	local nWeekNum = GetTask(TSK_XZ_AWARD_JINGYAN);
	if nWeekNum >= 100 then
		Talk(1,"",g_szInfoHead.."Tu�n n�y ng��i �� ��i <color=yellow>100<color> l�n ph�n th��ng kinh nghi�m, tu�n sau l�i ��n.");
		return 0;
	end;
	local nLevel = GetLevel();
	local tbNeedItemInfo = {};
	local tbExpMultiple = {2,3,4};
	local nExp = 0;
	local nGoldenExp = 0;
	if IB_VERSION == 1 then
		nExp = floor(nLevel^4/200);--�ȼ����Ĵη�/200
		tbNeedItemInfo =
		{
			[1] = {2,1,1020,1,"M�t h�m s� m�n"},
			[2] = {2,1,1020,3,"M�t h�m s� m�n"},
			[3] = {2,1,1021,1,"S� m�n ��i s� h�m"},
		}
	else
		nGoldenExp = floor((nLevel^4)*300000/(80^4));	--��ҵȼ����Ĵη�*30w/80���Ĵη�
		tbNeedItemInfo =
		{
			[1] = {2,1,533,1,"Tinh luy�n B�ng Th�ch"},
			[2] = {2,1,533,3,"Tinh luy�n B�ng Th�ch"},
			[3] = {2,1,533,10,"Tinh luy�n B�ng Th�ch"},
		}
	end;
	local nRand = 0;
	local nNeedNum = tbNeedItemInfo[nUseType][4];
	if GetItemCount(tbNeedItemInfo[nUseType][1],tbNeedItemInfo[nUseType][2],tbNeedItemInfo[nUseType][3]) < nNeedNum then
		Talk(1,"xunzhang_award",g_szInfoHead.."<color=yellow>"..tbNeedItemInfo[nUseType][5].."<color> s� l��ng kh�ng ��, ng��i c�n <color=yellow>"..nNeedNum.."<color> c�i"..tbNeedItemInfo[nUseType][5]..".");
		return 0;
	end;
	if DelItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],1) == 1 then
		DelItem(tbNeedItemInfo[nUseType][1],tbNeedItemInfo[nUseType][2],tbNeedItemInfo[nUseType][3],nNeedNum);
		nRand = random(1,100);
		BWDH_SetTask(TSK_XZ_AWARD_JINGYAN,nWeekNum+1);
		if IB_VERSION == 1 then
			if nRand <= 10 then
				nExp = floor(2*nExp*tbExpMultiple[nUseType]);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..(2*tbExpMultiple[nUseType]).." l�n kinh nghi�m");
			else
				nExp = floor(nExp*tbExpMultiple[nUseType]);
			end;
			ModifyExp(nExp);
			Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
		else
			if nRand <= 10 then
				nGoldenExp = floor(2*nGoldenExp*tbExpMultiple[nUseType]);
				Msg2Player("Ch�c m�ng ng��i �� ��i"..(2*tbExpMultiple[nUseType]).." l�n �i�m s�c kh�e");
			else
				nGoldenExp = floor(nGoldenExp*tbExpMultiple[nUseType]);
			end;
			gf_GoldenExp2Exp(nGoldenExp);
		end;
		Msg2Player("Trong tu�n n�y ��i hi�p ��y l� l�n th� "..(nWeekNum+1).." l�n ph�n th��ng kinh nghi�m");
		WriteLog("[Ph�n th��ng ��i h�i t� v�]"..GetName().."��i ph�n th��ng kinh nghi�m");
	else
		Talk(1,"xunzhang_award",g_szInfoHead.."Ng��i c�n <color=yellow>1 T� v� ��i h�i b�i<color> m�i c� th� ��i ph�n th��ng n�y.");
	end;
end;
--========ս������========================================================================
function xz_award_battle()
	local nWeekNum = GetTask(TSK_XZ_AWARD_JUNGONG);
	local nLevel = GetLevel();
	local nRoute = GetPlayerRoute();
	local nCurDate = tonumber(date("%Y%m%d%H"));
	if nRoute == 0 then
		Talk(1,"",g_szInfoHead.."Ng��i ph�i gia nh�p m�n ph�i m�i c� th� ��i ph�n th��ng chi�n tr��ng.");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"",g_szInfoHead.."��ng c�p c�a ng��i qu� th�p, ph�i ��t ��n c�p 60 m�i c� th� ��i ph�n th��ng n�y.");
		return 0;
	end;
	local selTab = {
				"Ta mu�n d�ng Qu�n C�ng Ch��ng (qu�n c�ng x2, kinh nghi�m x1.5)/#give_battle_award_confirm(1)",
				"Ta mu�n d�ng ��i Qu�n C�ng Ch��ng (qu�n c�ng x5, kinh nghi�m x2)/#give_battle_award_confirm(2)",
				"Ta mu�n d�ng Huy ho�ng ch��ng (qu�n c�ng x10, kinh nghi�m x2.5)/#give_battle_award_confirm(3)",
				"Kh�ng d�ng/#give_battle_award_confirm(0)",
				"Hi�n gi� ta ch�a mu�n ��i ph�n th��ng/xunzhang_award",
				}
	local tbExpX = {1,1,1,2,2,3};	--����ζ�Ӧ�ľ���ϵ��
	local nCurRank = abs(GetTask(704));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--���û�о��λ���γ���
		nCurRank = 1;	--��Ϊ1
	end;
	local nExpMultiple = 0;
	local nExpMultiple = tbExpX[nCurRank];
	if nCurRank == 3 and GetTask(764) <= 100 then
		nExpMultiple = 1.5;	--�߼���ͳ��1.5��
	end;
	local nLevelX = 0;
	local nCurGoldenExp = 0;
	local szAddedCompensation = "";
	if IB_VERSION == 0 then
		nLevelX = 75;
		nCurGoldenExp = GetGoldenExp();
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*nExpMultiple);	--40000*����ҵȼ�ƽ��/75��*���ε���ϵ��
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	local szGoldenExp = "";
	if IB_VERSION == 0 then
		szGoldenExp = "S�c kh�e ��i kinh nghi�m <color=yellow>"..nGoldenExpAward.."<color> �i�m (�i�m s�c kh�e c�a ng��i hi�n gi� l�: <color=yellow>"..nCurGoldenExp.."<color>),";
	end;
	Say(g_szInfoHead.."��i ph�n th��ng chi�n tr��ng c�n c� <color=yellow>30 T� v� ��i h�i b�i<color>. Ph�n th��ng chi�n tr��ng ng��i c� th� ��i hi�n gi� l� �i�m qu�n c�ng <color=yellow>"..nJunGong.."<color> �i�m, �i�m kinh nghi�m <color=yellow>"..nExpAward.." �i�m<color>,"..szGoldenExp.."Tu�n n�y ng��i �� ��i <color=yellow>"..(nWeekNum+1).."<color> l�n ph�n th��ng n�y, m�i ng��i m�i tu�n c� th� ��i <color=yellow>1<color> l�n. Ng��i mu�n nh�n tr�c ti�p, hay l� s� d�ng Qu�n C�ng Ch��ng �� nh�n?",getn(selTab),selTab);
end;

function give_battle_award_confirm(nType)
	if nType == 0 then
		local selTab = {
					"S� d�ng qu�n c�ng ch��ng/xz_award_battle",
					"Kh�ng mu�n d�ng qu�n c�ng n�o h�t/#give_battle_award(0)",
					}
		Say(g_szInfoHead.."Ng��i x�c nh�n kh�ng s� d�ng Qu�n C�ng Ch��ng ch�?",getn(selTab),selTab);
	else
		local selTab = {
					format("��ng �/#give_battle_award(%d)",nType),
					"�� ta suy ngh�/nothing",
					}
		Say(g_szInfoHead.."Ng��i x�c nh�n mu�n s� d�ng <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> ch�?",getn(selTab),selTab);
	end;
end;

function give_battle_award(nType)
	local nWeekNum = GetTask(TSK_XZ_AWARD_JUNGONG);
	if nWeekNum >= 1 then
		Talk(1,"",g_szInfoHead.."Tu�n n�y ng��i �� ��i 1 l�n ph�n th��ng chi�n tr��ng.");
		return 0;
	end;
	if GetItemCount(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3]) < 30 then
		Talk(1,"",g_szInfoHead.."Ng��i ph�i c� <color=yellow>30 T� v� ��i h�i b�i<color> m�i c� th� ��i ph�n th��ng.");
		return 0;
	end;
	local nLevel = GetLevel();
	local tbExpX = {1,1,1,2,2,3};	--����ζ�Ӧ�ľ���ϵ��
	local nCurRank = abs(GetTask(704));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--���û�о��λ���γ���
		nCurRank = 1;	--��Ϊ1
	end;
	local nExpMultiple = 0;
	local nExpMultiple = tbExpX[nCurRank];
	if nCurRank == 3 and GetTask(764) <= 100 then
		nExpMultiple = 1.5;	--�߼���ͳ��1.5��
	end;
	local tbJZGJunGong = {2,5,10};
	local tbJGZExp = {1.5,2,2.5};
	local nLevelX = 0;
	if IB_VERSION == 0 then
		nLevelX = 75;
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*nExpMultiple);	--40000*����ҵȼ�ƽ��/75��*���ε���ϵ��
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	if nType ~= 0 then
		if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) ~= 1 then
			Talk(1,"",g_szInfoHead.."Ng��i kh�ng c� <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>!");
			return 0;
		end;
		nExpAward = nExpAward*tbJGZExp[nType];
		nJunGong = nJunGong*tbJZGJunGong[nType];
		Msg2Player("Ng��i d�ng 1 "..tbJUNGONGZHANG[nType][1]);
	end;
	DelItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],30);
	BWDH_SetTask(TSK_XZ_AWARD_JUNGONG,nWeekNum+1);
	SetRankPoint(5,701,1);	--��˥��
	local nCurJunGong = GetTask(701);
	if nCurJunGong >= 0 then
		SetTask(701,nCurJunGong+nJunGong);
		Msg2Player("Phe T�ng, b�n nh�n ���c "..nJunGong.." �i�m c�ng tr�ng");
	else
		SetTask(701,nCurJunGong-nJunGong);
		Msg2Player("Phe Li�u, b�n nh�n ���c "..nJunGong.." �i�m c�ng tr�ng");
	end;
	SetRankPoint(5,701,1);	--����������а�
	ModifyExp(nExpAward);
	Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m chi�n tr��ng ");
	if IB_VERSION == 0 then
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	WriteLog("[Ph�n th��ng ��i h�i t� v�]"..GetName().." ��i ph�n th��ng chi�n tr��ng. ��ng c�p:"..nLevel..", lo�i Qu�n C�ng Ch��ng:"..nType..", qu�n h�m:"..nCurRank..", qu�n c�ng: "..nJunGong);
end;

function get_glory_bag()
	local szName = GetName();
	local nRoute = GetPlayerRoute();
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."B�n v�n ch�a ra nh�p m�n ph�i, kh�ng c� t� c�ch nh�n th��ng "..g_szGloryAwardName..".");
		return 0;
	end;
	local tbRankInfo = {};
	local nBagNum = 0;
	local szMsg = "Kh�ng v�o ���c danh s�ch Top 10, v� �i�m t� c�ch l� 0";
	local szMsg1 = "Kh�ng v�o top 10 m�n ph�i, nh�ng �i�m t� c�ch l�n h�n 0";
	local tbBagInfo = {100,40,40,20,20,20,20,20,20,20};
--	local tbRoute = gf_GetRouteTable();
--	for i=0,1 do
--		for j=1,getn(tbRoute) do
--			for k,v in g_tbZiGeRank[i][tbRoute[j]] do
--				print(i,k,v[1],v[2]);
--			end;
--		end;
--	end;
	local nBWLevel,nBWRank = get_rank_before();
	if nBWRank > 0 then
		nBagNum = tbBagInfo[nBWRank];
		if nBWLevel == 0 then
			nBagNum = floor(nBagNum/2);
		end;
		szMsg = TB_BIWU_NAME[nBWLevel+1].."("..gf_GetRouteName(nRoute)..") "..nBWRank.."Danh";
	elseif GetTask(TSK_OLD_ZIGE_POINT) > 0 then	--���û�����а񣬵�ֻҪ����0�־Ϳɻ�10����
		szMsg = szMsg1;
		nBagNum = 10;
	end;
	local selTab = {
				"Ta mu�n nh�n!/#get_glory_bag_1("..nBagNum..")",
				"Ki�m tra x�p h�ng t�ch �i�m t� c�ch /see_rank_before",
				g_szGloryAwardName.."Thuy�t minh/know_glory_bag",
				"T�m th�i kh�ng nh�n/nothing",
				}
	Say(g_szInfoHead.."Ng��i ch�i ���c <color=green>v�o b�ng x�p h�ng �i�m t� c�ch m�n ph�i <color>, s� nh�n ���c m�t ph�n qu� h�p d�n, c� th� nh�n ���c m�t s� l��ng nh�t ��nh<color=green>"..g_szGloryAwardName.."<color>. ��ng th�i �i�m t� c�ch s� b� x�a s�ch.\n  ng��i ch�i c� t�ch �i�m t� v� d��i 200 �i�m, t�ch �i�m t�ng th�m 100 �i�m, t�ch �i�m sau khi t�ng xong nhi�u nh�t kh�ng qu� 200.\n  Sau n�y c�ng s� c�n c� theo s� �i�m t� c�ch kh�ng ��nh k� ph�t ph�n th��ng.\n  C�n c� v�o chi�n t�ch tr��c kia c�a b�n:<color=yellow>"..szMsg.."<color>, c� th� nh�n ���c <color=yellow>"..nBagNum.."<color> c�i"..g_szGloryAwardName..". B�n mu�n nh�n th��ng ngay kh�ng?",getn(selTab),selTab);
end;

function know_glory_bag()
if _JX2WZ == 1 then
	Talk(2,"get_glory_bag",g_szInfoHead.."Trong b�ng x�p h�ng t� v� ��n ��u tr��c kia, c� th� nh�n ph�n th��ng <color=yellow>"..g_szGloryAwardName.."<color>.\n    <color=yellow> �i�m t� c�ch ��ng top 10 b�ng x�p h�ng m�n ph�i <color>: ��ng th� nh�t c� th� nh�n ���c <color=yellow>100<color> t�i, ��ng th� 2, ��ng th� ba c� th� nh�n ���c <color=yellow>40<color> t�i, ��ng th� 4 ��n th� 10 c� th� nh�n ���c <color=yellow>20<color> t�i#\n    <color=yellow> �i�m t� c�ch kh�ng ��ng trong b�ng x�p h�ng <color>: ch� c�n �i�m t� c�ch l�n h�n 0, s� t�ng <color=yellow>10<color> t�i.",g_szInfoHead.."M�i c�i <color=yellow>"..g_szGloryAwardName.."<color> c� th� m� ra v�t ph�m sau:\n    4 quy�n th�c chi�n t�m ��c, 20 �i�m c�ng hi�n s� m�n, 1 t�i ng� h�nh nguy�n th�ch \n    1 ti�u ki�p t�n (x�c su�t nh�t ��nh nh�n ���c, c� m� 5 t�i nh�t ��nh s� ���c)\n    1 b�n long b�ch (x�c su�t nh�t ��nh nh�n ���c, c� m� 10 t�i nh�t ��nh nh�n ���c)\n    1 b�o r��ng ng� h�nh th�ch cao c�p (x�c su�t nh�t ��nh nh�n ���c, c� m� 5 t�i nh�t ��nh s� ���c)\n    Ngo�i ra, m�i l�n m� 40 t�i s� nh�n ���c 3 M�t T�ch S� M�n-Cao, m� 100 t�i nh�n ���c 1 C�u Ch�u Long Ph�ng T��ng Bao.");
else
	Talk(2,"get_glory_bag",g_szInfoHead.."Trong b�ng x�p h�ng t� v� ��n ��u tr��c kia, c� th� nh�n ph�n th��ng <color=yellow>"..g_szGloryAwardName.."<color>.\n    <color=yellow> �i�m t� c�ch ��ng top 10 b�ng x�p h�ng m�n ph�i <color>: ��ng th� nh�t c� th� nh�n ���c <color=yellow>100<color> t�i, ��ng th� 2, ��ng th� ba c� th� nh�n ���c <color=yellow>40<color> t�i, ��ng th� 4 ��n th� 10 c� th� nh�n ���c <color=yellow>20<color> t�i#\n    <color=yellow> �i�m t� c�ch kh�ng ��ng trong b�ng x�p h�ng <color>: ch� c�n �i�m t� c�ch l�n h�n 0, s� t�ng <color=yellow>10<color> t�i.",g_szInfoHead.."M�i c�i "..g_szGloryAwardName.." C� th� m� ra v�t ph�m sau:\n4 quy�n th�c chi�n t�m ��c, 20 �i�m c�ng hi�n s� m�n, 1 t�i b�o th�ch \n1 ti�u ki�p t�n (x�c su�t nh�t ��nh nh�n ���c, c� m� 5 t�i nh�t ��nh s� ���c)\n1 b�n long b�ch (x�c su�t nh�t ��nh nh�n ���c, c� m� 10 t�i nh�t ��nh nh�n ���c)\n 1 vi�n linh th�ch c�p 6 (x�c su�t nh�t ��nh nh�n ���c, c� m� 10 t�i nh�t ��nh nh�n ���c)\n 1 k� n�ng ph�i ch� linh th�ch c�p 7 (x�c su�t nh�t ��nh nh�n ���c, c� m� 10 t�i nh�t ��nh nh�n ���c)\nNgo�i ra, m�i l�n m� 40 t�i s� nh�n ���c 3 M�t T�ch S� M�n-Cao, m� 100 t�i nh�n ���c 1 Vi�m Ho�ng Thi�t H�n. Ng��i ch�i c�p 99 m�i l�n m� 20 t�i s� nh�n ���c 50 Th�i D�ch H�n Nguy�n C�ng �� Gi�m.");
end
end;

function get_glory_bag_1(nBagNum)
	local nBWLevel,nBWRank = get_rank_before();
	local nPoint = GetTask(TSK_OLD_ZIGE_POINT);
	if nBagNum == 0 then
		Talk(1,"",g_szInfoHead.."�i�m t� c�ch tr��c ��y c�a b�n l� <color=yellow>"..nPoint.."<color>, kh�ng v�o top 10 m�n ph�i t�ch �i�m t� c�ch, kh�ng th� nh�n th��ng , kh�ng th� nh�n ���c "..g_szGloryAwardName..".");
		return 0;
	end;
	if GetTask(TSK_GET_GLORY) == g_nBWAwardDate then
		Talk(1,"",g_szInfoHead.."B�n �� nh�n qua r�i "..g_szGloryAwardName.."1 l�n r�i.");
		return 0;
	end;
	local nNum = 0;
	if gf_JudgeRoomWeight(2,nNum,g_szInfoHead) == 0 then
		return 0;
	end;
	if GetTask(TSK_GET_GLORY) ~= g_nBWAwardDate then
		BWDH_SetTask(TSK_GET_GLORY,g_nBWAwardDate);
		AddItem(g_tbGloryAwardItem[1],g_tbGloryAwardItem[2],g_tbGloryAwardItem[3],nBagNum);
		Msg2Player("B�n nh�n ���c "..nBagNum.."c�i"..g_szGloryAwardName);
		if nBWRank > 0 then
			Msg2Global(GetName().."trong ��i H�i T� V� thi qu� ���c ��ng th� "..nBWRank..", nh�n ���c r�i "..nBagNum.."c�i"..g_szGloryAwardName..",, ��ng m�ng ��ng m�ng !");
		end
		WriteLog("[��i h�i t� v�]:"..GetName().."�� nh�n "..nBagNum.." (H�ng "..nBWRank..", th�)"..g_szGloryAwardName);
	end;
end;

function init_zige_rank()
	if GetTime() - g_bInit < 3600 then
		return 0;
	end;
	local tbRoute = gf_GetRouteTable();
	local nRoute = 0;
	for nLevel=0,1 do
		g_tbZiGeRank[nLevel] = {};
		for i=1,getn(tbRoute) do
			nRoute = tbRoute[i];
			g_tbZiGeRank[nLevel][nRoute] = {};
			DelRelayShareDataCopy("GestConvention_Zige_Last", nLevel, nRoute);
			ApplyRelayShareData("GestConvention_Zige_Last", nLevel, nRoute, g_szThisFile, "init_zige_rank_callback");
		end;
	end;
end;

function init_zige_rank_callback(szKey,nLevel,nRoute,nRecordCount)
	if nRecordCount == 0 then
		return 0;
	end;
	nRecordCount = min(nRecordCount,10);
	local szName,nPoint = "",0;
	for i=1,nRecordCount do
		--����ֵ����������ʸ���֣����ɣ��ȼ�����ʤ���ܸ�����ʤ���ܸ�
		szName,nPoint = GetRelayShareDataByIndex(szKey,nLevel,nRoute,i-1);
		g_tbZiGeRank[nLevel][nRoute][szName] = {i,nPoint};
	end;
	g_bInit = GetTime();
end;

function see_rank_before()
	local nPoint = GetTask(TSK_OLD_ZIGE_POINT);
	local _,_,nRankPoint = get_rank_before();	--���û�����а�nRankPoint����0
	if nPoint < nRankPoint then
		nPoint = nRankPoint;	--��ΪnPoint��nRankPoint�᲻һ�£����ﱣ֤�������а�����ķ���Ϊ׼
	end;
	local selTab = {
				--"�������ִ��/#see_rank_before_1(0)",
				" ��i H�i T� V� ��n ��u /#see_rank_before_1(1)",
				"K�t th�c ��i tho�i/nothing",
				}
	Say(g_szInfoHead.."�i�m t� c�ch tr��c ��y c�a b�n l� <color=yellow>"..nPoint.."<color>. B�n mu�n xem th�ng tin b�n x�p h�ng t� c�ch c�a ��i h�i t� v� n�o?",getn(selTab),selTab);
end;

function see_rank_before_1(nLevel)
	local tbRoute = gf_GetRouteTable();
	list_route_page(1,getn(tbRoute),nLevel);
end;

MAX_SEL_PER_PAGE = 5;

function list_route_page(nPageNum,nRecordCount,nLevel)
	local tbAllSelTab = get_route_list(nLevel);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--���������������õ�ǰҳ���������ʾ��Ŀ����
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbAllSelTab[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,format("\n Trang tr��c/#list_route_page(%d,%d,%d)",nPageNum-1,nRecordCount,nLevel));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("\n Trang sau/#list_route_page(%d,%d,%d)",nPageNum+1,nRecordCount,nLevel));
	end;
	tinsert(selTab,"\nQuay l�i/see_rank_before");
	Say(g_szInfoHead.."<color=yellow>"..TB_BIWU_NAME[nLevel+1].."<color>X�p h�ng t�ch l�y t� c�ch. H�y ch�n l�u ph�i:",getn(selTab),selTab);
end

function get_route_list(nLevel)
	local tSelTab = {};
	local tbRoute = gf_GetRouteTable();
	for i=1,getn(tbRoute) do
		tinsert(tSelTab,gf_GetRouteName(tbRoute[i]).."/#view_route_rank_info("..nLevel..","..tbRoute[i]..")");
	end;
	return tSelTab;
end;

function view_route_rank_info(nLevel,nRoute)
	local tbRankInfo = g_tbZiGeRank[nLevel][nRoute];
	local tbSorted = {};
	local szMsgHead = "<color=yellow>"..TB_BIWU_NAME[nLevel+1].."<color>:<color=green>"..gf_GetRouteName(nRoute).."<color>10 h�ng ��u b�ng x�p h�ng t�ch l�y t� c�ch<color>: \n"..gf_FormatStringLength("H�ng",10)..gf_FormatStringLength("T�n",20)..gf_FormatStringLength("�i�m t�ch l�y t� c�ch",8).."\n";
	local szMsgBody = "";
	for i,v in tbRankInfo do
		tbSorted[v[1]] = {i,v[2]};
	end;
	local nPlayerNum = getn(tbSorted);
	if nPlayerNum == 0 then
		Talk(1,"#list_route_page(1,"..getn(gf_GetRouteTable())..","..nLevel..")",g_szInfoHead.."L�u ph�i n�y kh�ng c� th�ng tin x�p h�ng.");
		return 0;
	end;
	if nPlayerNum <= 5 then
		for i=1,nPlayerNum do
			szMsgBody = szMsgBody..gf_FormatStringLength(i,10)..gf_FormatStringLength(tbSorted[i][1],20)..gf_FormatStringLength(tbSorted[i][2],8).."\n";
		end;
		Talk(1,"#list_route_page(1,"..getn(gf_GetRouteTable())..","..nLevel..")",szMsgHead..szMsgBody);
	else
		local szMsgBody2 = "";
		for i=1,5 do
			szMsgBody = szMsgBody..gf_FormatStringLength(i,10)..gf_FormatStringLength(tbSorted[i][1],20)..gf_FormatStringLength(tbSorted[i][2],8).."\n";
		end;
		for i=6,nPlayerNum do
			szMsgBody2 = szMsgBody2..gf_FormatStringLength(i,10)..gf_FormatStringLength(tbSorted[i][1],20)..gf_FormatStringLength(tbSorted[i][2],8).."\n";
		end;
		Talk(2,"#list_route_page(1,"..getn(gf_GetRouteTable())..","..nLevel..")",szMsgHead..szMsgBody,szMsgHead..szMsgBody2);
	end;
end;
--�������������ߵͼ����������ʸ��
function get_rank_before()
	local nRoute = GetPlayerRoute();
	local szName = GetName();
	local nOldSignUpInfo = GetTask(TSK_OLD_SIGN_UP);
	for i=0,1 do
		local tbRankInfo = nil
		if g_tbZiGeRank[i] and g_tbZiGeRank[i][nRoute] then
			tbRankInfo = g_tbZiGeRank[i][nRoute][szName];
		end
		if tbRankInfo then
			return i,tbRankInfo[1],tbRankInfo[2];
		end;
	end;
	return -1,0,0;
end;

function season_modify_exp(nExp,nCount)
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --�ڼ�����
	for i=1,nCount do
		ModifyExp(nExp);
		Msg2Player("B�n nh�n ���c "..nExp.."Kinh nghi�m");
	end
	WriteLog(format("[��i H�i T� V� th� "..(nCurSeason-1).."thi qu� ] [Sucess] [ModifyExp] [role:%s(acc:%s)] [Nh�n ���c kinh nghi�m %d]", GetName(), GetAccount(), nExp*nCount));
end

function season_award_title(nRank)
	local szTitleName = {
		[1] = "��i S� T�",
        [2] = "Nh� S� T�",
        [3] = "Tam S� T�",
        [11] = "��i S� Huynh",
        [12] = "Nh� S� Huynh",
        [13] = "Tam S� Huynh",
	}
	local nSex = mod(GetSex(),2)
	local nG = 67
	local nDetal = 10*nSex + nRank
	local szName = szTitleName[nDetal] or ""
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --�ڼ�����
	for i=1,13 do
		RemoveTitle(nG,i);
	end
	if IsTitleExist(nG,nDetal) <= 0 then
		if AddTitle(nG,nDetal) > 0 then
			SetTitleTime(nG,nDetal, GetTime() + g_nBWWeeks*7*24*3600);
			SetCurTitle(nG,nDetal)
			Msg2Player("B�n nh�n ���c ["..szName.."] danh hi�u");
			WriteLog("[��i H�i T� V� th� "..(nCurSeason-1).."thi qu� ]:"..GetName().." nh�n ���c ["..szName.."] danh hi�u");
		end
	end
end

function season_add_title(nID1,nID2,sName)
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --�ڼ�����
	for i=2,5 do
		RemoveTitle(5,i);
	end
	if IsTitleExist(nID1,nID2) <= 0 then
		if AddTitle(nID1,nID2) > 0 then
			SetTitleTime(nID1,nID2, GetTime() + g_nBWWeeks*7*24*3600);
			SetCurTitle(nID1,nID2)
			Msg2Player("B�n nh�n ���c ["..sName.."] danh hi�u");
			WriteLog("[��i H�i T� V� th� "..(nCurSeason-1).."thi qu� ]:"..GetName().." nh�n ���c ["..sName.."] danh hi�u");
		end
	end
end

tGJJingQi = {
	{{"Thi�u L�m Tinh K� (Kh�i Th�)",{0,120,42,1}},{"Thi�u L�m Tinh K� (Ki�u S�)",{0,120,43,1}},{"Thi�u L�m Tinh K� (Anh Ki�t)",{0,120,44,1}},},
	{{"V� �ang Tinh K� (Kh�i Th�)",{0,120,54,1}},{"V� �ang Tinh K� (Ki�u S�)",{0,120,55,1}},{"V� �ang Tinh K� (Anh Ki�t)",{0,120,56,1}},},
	{{"Nga My Tinh K� (Kh�i Th�)",{0,120,48,1}},{"Nga My Tinh K� (Ki�u S�)",{0,120,49,1}},{"Nga My Tinh K� (Anh Ki�t)",{0,120,50,1}},},
	{{"C�i Bang Tinh K� (Kh�i Th�)",{0,120,51,1}},{"C�i Bang Tinh K� (Ki�u S�)",{0,120,52,1}},{"C�i Bang Tinh K� (Anh Ki�t)",{0,120,53,1}},},
	{{"���ng M�n Tinh K� (Kh�i Th�)",{0,120,45,1}},{"���ng M�n Tinh K� (Ki�u S�)",{0,120,46,1}},{"���ng M�n Tinh K� (Anh Ki�t)",{0,120,47,1}},},
	{{"D��ng M�n Tinh K� (Kh�i Th�)",{0,120,57,1}},{"D��ng M�n Tinh K� (Ki�u S�)",{0,120,58,1}},{"D��ng M�n Tinh K� (Anh Ki�t)",{0,120,59,1}},},
	{{"Ng� ��c Tinh K� (Kh�i Th�)",{0,120,60,1}},{"Ng� ��c Tinh K� (Ki�u S�)",{0,120,61,1}},{"Ng� ��c Tinh K� (Anh Ki�t)",{0,120,62,1}},},
	{{"C�n L�n Tinh K� (Kh�i Th�)",{0,120,63,1}},{"C�n L�n Tinh K� (Ki�u S�)",{0,120,64,1}},{"C�n L�n Tinh K� (Anh Ki�t)",{0,120,65,1}},},
	{{"Minh gi�o Tinh K� (Kh�i Th�)",{0,120,66,1}},{"Minh gi�o Tinh K� (Ki�u S�)",{0,120,67,1}},{"Minh gi�o Tinh K� (Anh Ki�t)",{0,120,68,1}},},
	{{"Th�y Y�n Tinh K� (Kh�i Th�)",{0,120,69,1}},{"Th�y Y�n Tinh K� (Ki�u S�)",{0,120,70,1}},{"Th�y Y�n Tinh K� (Anh Ki�t)",{0,120,71,1}},},
}

function season_add_guajian(nType)
	local nFaction = GetPlayerFaction();
	gf_SetLogCaption("Ph�n th��ng ��i H�i T� V� ��n ��u thi qu� ");
	local nRet,nIndex = gf_AddItemEx(tGJJingQi[nFaction][nType][2],tGJJingQi[nFaction][nType][1]);
	if nRet == 1 then
		SetItemExpireTime(nIndex,g_nBWWeeks*7*24*3600);
	end
	gf_SetLogCaption("");
end

tSeasonAward = {
	{
		{"1 t� �i�m kinh nghi�m","season_modify_exp(10*10000*10000,1)"},
		{"10 R��ng Phong Th��ng S� M�n","gf_AddItemEx({2,1,30693,10},'R��ng Phong Th��ng S� M�n')"},
		{"Danh hi�u x�p h�ng t� v�","season_award_title(1)"},
		
--		{"ǧ��׷��(��)","gf_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'ǧ��׷��(��)')"},
--		{"�����Ҽ������(����)������3���£�","season_add_guajian(1)"},
--		{"�±�����������40��","gf_AddItemEx({2,95,820,40,1},'�±�����������')"},
--		{"�ƺţ���������������Ч��","season_add_title(5,2,'��������')"},
	},
	{
		{"500 tri�u �i�m kinh nghi�m","season_modify_exp(5*10000*10000,1)"},
		{"5 R��ng Phong Th��ng S� M�n","gf_AddItemEx({2,1,30693,5},'R��ng Phong Th��ng S� M�n')"},
		{"Danh hi�u x�p h�ng t� v�","season_award_title(2)"},
--		{"ǧ��׷��(��)","gf_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'ǧ��׷��(��)')"},
--		{"�����Ҽ������(�̳�)������3���£�","season_add_guajian(2)"},
--		{"�±�����������40��","gf_AddItemEx({2,95,820,40,1},'�±�����������')"},
--		{"�ƺţ�������ʥ��������Ч��","season_add_title(5,3,'������ʥ')"},
	},
	{
		{"300 tri�u �i�m kinh nghi�m","season_modify_exp(3*10000*10000,1)"},
		{"3 R��ng Phong Th��ng S� M�n","gf_AddItemEx({2,1,30693,3},'R��ng Phong Th��ng S� M�n')"},
		{"Danh hi�u x�p h�ng t� v�","season_award_title(3)"},
--		{"�����Ҽ������(Ӣ��)������3���£�","season_add_guajian(3)"},
--		{"�±�����������40��","gf_AddItemEx({2,95,820,40,1},'�±�����������')"},
--		{"�ƺţ��������������Ч��","season_add_title(5,4,'�������')"},
	},
	{
		{"200 tri�u �i�m kinh nghi�m","season_modify_exp(2*10000*10000,1)"},
		{"2 R��ng Phong Th��ng S� M�n","gf_AddItemEx({2,1,30693,2},'R��ng Phong Th��ng S� M�n')"},
--		{"�±�����������40��","gf_AddItemEx({2,95,820,40,1},'�±�����������')"},
--		{"�ƺţ�����������������Ч��","season_add_title(5,5,'��������')"},
	},
	{
		{"100 tri�u �i�m kinh nghi�m","season_modify_exp(1*10000*10000,1)"},
		{"1 R��ng Phong Th��ng S� M�n","gf_AddItemEx({2,1,30693,1},'R��ng Phong Th��ng S� M�n')"},
--		{"�±�����������20��","gf_AddItemEx({2,95,820,20,1},'�±�����������')"},
	},
};

function season_award()
	local strtab = {
		"H��ng d�n thi qu� /season_detail",
		"Ki�m tra ph�n th��ng thi qu� /season_see_award",
		"tr� l�i/main",
		"K�t th�c ��i tho�i/nothing"
	};
--if _JX2WZ == 2 then
--	tinsert(strtab, 2, "���������еķǷ���Ʒ/repairItem");
--end
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --�ڼ�����
	local nSeasonWeek = mod(nWeek,g_nBWWeeks); --��ǰ�����ĵڼ���
	if nSeasonWeek == 0 then
		nSeasonWeek = g_nBWWeeks;
	end
	if nCurSeason > 1 then
		tinsert(strtab,3,"Nh�n ph�n th��ng thi qu� tr��c (Ng�y k�t th�c: tr��c khi thi qu� n�y k�t th�c)/season_get_award");
	end
	Say(g_szInfoHead.."B�n mu�n t�m hi�u th�ng tin n�o ? ",
	getn(strtab),
	strtab);
end

function season_detail()
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --�ڼ�����
	local nSeasonWeek = mod(nWeek,g_nBWWeeks); --��ǰ�����ĵڼ���
	if nSeasonWeek == 0 then
		nSeasonWeek = g_nBWWeeks;
	end
	Talk(1,"season_award",g_szInfoHead.."T� ng�y 12 th�ng 5 n�m 2014 b�t ��u ��i H�i T� V� <color=yellow> m�i"..g_nBWWeeks.." tu�n l� m�t thi qu�<color>, tr��c khi k�t th�c cu�c thi qu� ti�p theo d�a v�o s� �i�m t� c�ch k� thi qu� l�n tr��c nh�n ���c ph�n th��ng thi qu� tr��c, �i�m t� c�ch c� m�i tu�n d�a v�o t�ch �i�m h� ph�i x�p h�ng, t� 1-10 c� th� nh�n ���c 100, 90, 85, 80, 75, 70, 65, 60, 55, 50 �i�m. Hi�n t�i �ang ti�n h�nh <color=yellow>k�"..nCurSeason.."Thi qu� tu�n th� "..nSeasonWeek.."<color> t� v�, ph�n th��ng thi qu� tr��c v�o sau 10h m�i ng�y tr��c khi thi qu� n�y k�t th�c ��u c� th� nh�n th��ng, qu� h�n kh�ng ph�t b�!");
end

function season_see_award()
	local strtab = {
		"Gi�i 1 (�i�m t� c�ch k� thi qu� tr��c 370-400)/#season_see_award_detail(1)",
		"Gi�i 2  (�i�m t� c�ch k� thi qu� tr��c 330-369)/#season_see_award_detail(2)",
		"Gi�i 3  (�i�m t� c�ch k� thi qu� tr��c 270-329)/#season_see_award_detail(3)",
		"Gi�i 4  (�i�m t� c�ch k� thi qu� tr��c 200-269)/#season_see_award_detail(4)",
		"Gi�i khuy�n kh�ch (�i�m t� c�ch k� thi qu� tr��c 100-199)/#season_see_award_detail(5)",
		"tr� l�i/season_award",
		"K�t th�c ��i tho�i/nothing",
	}
	Say(g_szInfoHead.."M�i role m�i k� thi qu� ch� nh�n ���c m�t l�n th��ng.",
	getn(strtab),
	strtab);
end

function season_see_award_detail(nType)
	local stalk = "";
	for i = 1,getn(tSeasonAward[nType]) do
		stalk = stalk.."\n    "..tSeasonAward[nType][i][1];
	end
	Talk(1,"season_see_award",g_szInfoHead..stalk);
end

function season_get_award()
	local nDate = tonumber(date("%Y%m%d"))
--	if nDate >= 20110131 and nDate <= 20110213 then
--		Talk(1,"",g_szInfoHead.."�����ڼ���ͣ���������������������������ᷢ�����ڵ�2��14�շ��ţ��������������ճ����С����������Ĳ��������½⡣");
--		return 0;
--	end
	local nHour = tonumber(date("%H"));
	if nHour < 10 then
		Talk(1,"",g_szInfoHead.."M�i c�c b�n ��n nh�n th��ng v�o sau 10h s�ng.");
		return 0;
	end
	local szName = GetName();
	local nRoute = GetPlayerRoute();
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."B�n v�n ch�a nh�p m�n ph�i, kh�ng c� t� c�ch nh�n ph�n th��ng thi qu� tr��c.");
		return 0;
	end;
	local tbRankInfo = {{370/4*g_nBWWeeks,"Gi�i 1"},{330/4*g_nBWWeeks,"Gi�i 2"},{270/4*g_nBWWeeks,"Gi�i 3"},{200/4*g_nBWWeeks,"Gi�i 4"},{100/4*g_nBWWeeks,"Gi�i khuy�n kh�ch"}};
	local nType = 0;
	local szMsg = "";
	local nBWLevel,nBWRank,nRankPoint = get_rank_before();--���û�����а�nRankPoint����0
	local nPoint = GetTask(TSK_OLD_ZIGE_POINT);
	if nPoint < nRankPoint then
		nPoint = nRankPoint;	--��ΪnPoint��nRankPoint�᲻һ�£����ﱣ֤�������а�����ķ���Ϊ׼
	end;
	for i=1,getn(tbRankInfo) do
		if nPoint >= tbRankInfo[i][1] then
			nType = i;
			break;
		end
	end;
	if nPoint > 400 or nPoint < 100/4*g_nBWWeeks then
		Talk(1,"",g_szInfoHead.."�i�m t� c�ch c�a ng��i trong ��i H�i T� V� qu� tr��c kh�ng �� 100 �i�m, kh�ng �� �i�u ki�n nh�n th��ng.K� thi qu� n�y ti�p t�c c� g�ng.");
		return 0;
	end
	BWDH_SetTask(TSK_SEASON_ZIGE_LAST,nPoint);
	local selTab = {
				"Ta mu�n nh�n!/#season_confirm_award("..nType..")",
--				"������������˵��/season_bag_detail",
				"T�m th�i kh�ng nh�n/nothing",
				}
	Say(g_szInfoHead.."Trong ��i H�i T� V� k� thi qu� tr��c �i�m t� c�ch l�:<color=yellow>"..nPoint.."<color>, nh�n ���c <color=yellow>"..tbRankInfo[nType][2].."<color>, b�n c� nh�n th��ng b�y gi� kh�ng ? M�i k� thi qu� m�i nh�n v�t ch� ���c nh�n th��ng m�t l�n. ",
	getn(selTab),
	selTab);
end

function season_confirm_award(nType)
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --�ڼ�����
	if GetTask(TSK_SEASON_GET_AWARD) >= nCurSeason then
		Talk(1,"",g_szInfoHead.."B�n �� nh�n ph�n th��ng k� thi qu� tr��c.");
		return 0;
	end
	if gf_Judge_Room_Weight(3,200,g_szInfoHead) ~= 1 then
		return 0;
	end
	BWDH_SetTask(TSK_SEASON_GET_AWARD,nCurSeason);
	gf_SetLogCaption("��i H�i T� V� thi qu� th� "..(nCurSeason-1)..".");
	for i=1,getn(tSeasonAward[nType]) do
		dostring(tSeasonAward[nType][i][2]);
	end
	AddRuntimeStat(20, 3, nType - 1, 1) --ͳ��
	local tStat = {10, 5, 3, 2, 1}
	AddRuntimeStat(20, 6, 0, tStat[nType]) --ʦ�ŷ��ͱ����������
	gf_SetLogCaption("");
	local tbRankInfo = {"Gi�i 1","Gi�i 2","Gi�i 3","Gi�i 4","Gi�i khuy�n kh�ch"};
	Msg2Global("��i hi�p"..GetName().."Nh�n ��i h�i t� th� k� thi qu� tr��c "..tbRankInfo[nType].."!");
	WriteLog(format("[��i H�i T� V� th� %d thi qu� ] [Sucess][role:%s(acc:%s)] [ Nh�n ��i h�i t� th� k� thi qu� tr��c %s!]",(nCurSeason-1), GetName(), GetAccount(), tbRankInfo[nType]));
end

function repairItem(bSure)
	if not bSure then
		local tSel = {
			"��ng �/#repairItem(1)",
			"tr� l�i/season_award",
		}
		Say(g_szInfoHead.."Trong ph�n th��ng ��i H�i T� V� l�n n�y m� t�i thi qu� ��i H�i T� V� nh�n ���c v�t ph�m phi ph�p, h�y �� v�t ph�m phi ph�p n�y v�o trong t�i, click x�c nh�n, ��i n� th�nh t� ngh�a l�nh t�i l�n (ch� c� hi�u qu� khi m� v�t ph�m phi ph�p trong t�i k� thi qu� ��i H�i T� V� l�n n�y)",
			getn(tSel), tSel);
		return
	end

	local nCount = GetItemCount(2,1,3356);
	if nCount <= 0 then
		Talk(1, "", "Tr�n ng��i b�n kh�ng c� ��o c� phi ph�p ");
		return
	end
	DelItem(2,1,3356, nCount);
	AddItem(2,95,211, nCount);
end

--������������䳡��
function GLB_BW_Goto_Field(bConfirm)
	bConfirm = bConfirm or 0;

	if 1 ~= bConfirm then
		local tBlockRoute	= GLB_BW_Get_Block_Route();
		local szInfo		= "B�n s� v�o t� v� li�n server ,";

		if getn(tBlockRoute) > MAXNUM_BLOCK_ROUTE then
			BWDH_SetTask(TASKID_BIWU_BLOCK_ROUTE, 0);
			tBlockRoute = {};
		end

		if 0 < getn(tBlockRoute) then
			if 1 == getn(tBlockRoute) then
				szInfo = szInfo .."D�ch v� tr� gia t�ng l�n n�y ch�n ��ng 1 m�n ph�i, l�:";
			else
				szInfo = szInfo .. format("D�ch v� tr� gia t�ng l�n n�y ch�n ��ng %d m�n ph�i, l�:", getn(tBlockRoute));
			end

			for _, nRoute in tBlockRoute do
				szInfo = szInfo .. gf_GetRouteName(nRoute) .. ", ";
			end

			szInfo = strsub(szInfo, 1, strlen(szInfo) - 2) .. ".";
			szInfo = szInfo .. format("C� v�o 1 tr�n ��i H�i T� V� li�n server s� b� tr� %d <color=yellow>Ti�u Dao Ng�c <color>.", TB_BW_BLOCK_ROUTE_COST[getn(tBlockRoute)]);
		else
			szInfo = szInfo .."D�ch v� tr� gia t�ng l�n n�y ch�n ��ng 0 m�n ph�i.";
		end

		--szInfo = szInfo .. format("��������ӵ����ң��%dö����ң��%dö��ȷ��Ҫǰ���������ô��", GetXYB(), GetXYY());

		local strtab = {
			"Ta �� chu�n b� xong!			/#GLB_BW_Goto_Field(1)",
			--"��Ҫ�޸��ҵ���ֵ������	/GLB_BW_Services_Set",
			"tr� l�i/main",
			"K�t th�c ��i tho�i/nothing",
		};
		Say(g_szInfoHead.."C� th� gi�p g� ���c b�n ?",
		getn(strtab),
		strtab)

		return
	end

	if GetTask(TSK_SIGN_UP) ~= 2 then
		resetBiwuTV();
	end
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."Xin l�i, ng��i ph�i gia nh�p m�n ph�i m�i c� th� ��ng k� tham gia.");
		return 0;
	end;
--	if GetLevel() < 80 then
--		Talk(1,"",g_szInfoHead.."���ĵȼ�����80���������ڽ����ж�����Щ�ɡ�");
--		return 0;
--	end
	if BWT_CheckBiWuTime() ~= 1 then
		Talk(1,"",g_szInfoHead..format("Hi�n nay kh�ng ph�i th�i gian cu�c d� tuy�n c�a ��i h�i t� v� to�n qu�c, xin ��i hi�p m�i ng�y trong %s ��n ��y.", "20:00-22:00"));
		return 0;
	end
--	if GetXYB() <= 0 then
--		Talk(1,"",g_szInfoHead.."����Ŀǰû����ң�ң������ڳ������޷�����ҩƷʹ�á�");
--		return 0;
--	end
	if gf_JudgeRoomWeight(15,100,"") == 0 then
		return 0;
	end;
	if GetPKValue() >= 10 then
		Talk(1,"",g_szInfoHead.."S�t � c�a ng��i qu� cao ( PK>=10), kh�ng th� �i v�o ��i H�i T� V�.");
		return 0;		
	end
	
	if 1 == _check_to_kuafu_condition() then
		SetTask(TASKID_EXCHG_SVR_TAG, 1, TASK_ACCESS_CODE_EXGSVR);
		BWT_WeeklyClear();
		--BWDH_SetTask(TASKID_BIWU_IS_REALM,1);
		local nDirection = random(1,getn(TB_EXIT));
		BWDH_Change_Map(7100,TB_EXIT[nDirection][2],TB_EXIT[nDirection][3]) --1399,2847
	else
		return 0;
	end
	
	--cdkey�
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(1)");	
end

function GLB_BW_Change_Xoyo_Gold()
	local strtab = {
		"D�ng v�ng ��i Xu Ti�u Dao (1 v�ng ��i 100 Xu Ti�u Dao)/GLB_BW_Use_JXB",
--		"ʹ��ҩƷ�һ���ң��/GLB_BW_Use_Medicine",
		"tr� l�i/main",
		"K�t th�c ��i tho�i/nothing",
	};
	Say(g_szInfoHead.."Sau khi v��t server ngo�i <color=yellow>Xu Ti�u Dao<color> ra nh�ng ti�n t� kh�c ��u kh�ng th� s� d�ng, ta c� th� gi�p chuy�n <color=yellow>v�ng<color> th�nh Xu Ti�u Dao. Thi�u hi�p hi�n �ang s� h�u "..GetXYB().." Xu Ti�u Dao, v� sau c� th� ki�m trang th�ng qua giao di�n F2 (c� th� l� s� �m)",
		getn(strtab),
		strtab)
end

function GLB_BW_Change_Xoyo_Yu()
	local strtab = {
		"S� d�ng H�a Th� B�ch ��i Ti�u Dao Ng�c (1 H�a Th� B�ch ��i 100 Ti�u Dao Ng�c)/GLB_BW_Use_HSB",
		"tr� l�i/main",
		"K�t th�c ��i tho�i/nothing",
	};
	Say(g_szInfoHead.."T� v� li�n server ��a ra d�ch v� tr� gia t�ng m�i nh�t, thi�t k� nh�ng h�ng m�c d�ch v� tr� gia t�ng m� b�n c�n, khi t� v� li�n server s� t�n h��ng ���c c�ng nhi�u c�i m�i. C� v�o m�t tr�n thi ��u c� �em theo ph�c v� n�p th�m ti�n s� b� tr� m�t s� l��ng nh�t ��nh <color=yellow>Ti�u Dao Ng�c<color> (S� l��ng ti�u hao t�y theo lo�i d�ch v� m� quy�t ��nh), t�i ��y c� th� d�ng <color=yellow>H�a Th� B�ch<color> ��i th�nh <color=yellow>Ti�u Dao Ng�c<color>. Thi�u hi�p hi�n c� "..GetXYB().." Xu Ti�u Dao, <color=yellow>Ti�u Dao Ng�c<color> "..GetXYY().." xu, c� th� s� d�ng ph�m F2 �� ki�m tra. (c� th� c� gi� tr� �m)",
	getn(strtab),
	strtab)
end

function GLB_BW_Use_JXB()
	local nJxb = floor(GetCash()/10000);
	AskClientForNumber("GLB_BW_Use_JXB_Confirm",1,nJxb*100,"��i bao nhi�u Xu Ti�u Dao?");
end

function GLB_BW_Use_HSB()
	local nHsb = GetItemCount(2,1,1001);
	AskClientForNumber("GLB_BW_Use_HSB_Confirm",1,nHsb,"��i bao nhi�u H�a Th� B�ch ?");
end

function GLB_BW_Use_JXB_Confirm(nCount)
	local nJxb = floor(GetCash()/10000);
	if nJxb < nCount/100 then
		Talk(1,"",g_szInfoHead.."Ti�n v�ng c�c h� mang theo kh�ng ��"..nCount.."Xu Ti�u Dao.");
		return 0;
	end
	if Pay(nCount/100*10000) == 1 then
		EarnXYB(nCount);
--		Msg2Player("����"..nCount.."��ң�ҡ�");
	end
end

function GLB_BW_Use_HSB_Confirm(nCount)
	local nHsb = GetItemCount(2,1,1001);
	if nHsb < nCount then
		Talk(1,"",g_szInfoHead.."Tr�n ng��i b�n c� �� <color=yellow> H�a Th� B�ch kh�ng<color>.");
		return 0;
	end
	if DelItem(2,1,1001,nCount) == 1 then
		EarnXYY(nCount*100);
--		Msg2Player("����"..nCount.."<color=yellow>��ң��<color>��");
	end
end

tMedicineInfo = {
	{{"B�ch V�n t�n",1,0,4},7},
	{{"��i Ho�n ��n",1,0,9},7},
	{{"Ng�c Linh t�n",1,0,14},10},
	{{"Thi�n H��ng C�m T�c",1,0,5},9},
	{{"Nh�t Nguy�n Ph�c Th�y ��n",1,0,10},9},
	{{"H�c Ng�c �o�n T�c Cao",1,0,6},10},
	{{"V�n V�t Quy Nguy�n ��n",1,0,11},10},
	{{"Ng� Hoa Ng�c L� Ho�n",1,0,15},10},
	{{"Sinh Sinh H�a T�n",1,0,16},15},
};
g_MaxChangeXYB = 7000000;

function GLB_BW_Use_Medicine()
	local strtab = {};
	for i = 1,getn(tMedicineInfo) do
		tinsert(strtab,format("S� d�ng %s ��i Xu Ti�u Dao (t� l� ��i:1:%d)/#GLB_BW_Use_Medicine_Ask(%d)",tMedicineInfo[1][1][1],tMedicineInfo[1][2],i))
	end
	tinsert(strtab,"K�t th�c ��i tho�i/nothing")
	Say(g_szInfoHead.."B�n c�n d�ng v�t ph�m g� �� ��i Ti�u Dao Xu?",
		getn(strtab),
		strtab)
end

function GLB_BW_Use_Medicine_Ask(nIdx)
	local nCount = GetItemCount(tMedicineInfo[nIdx][1][2],tMedicineInfo[nIdx][1][3],tMedicineInfo[nIdx][1][4]);
	if nCount < 1 then
		Talk(1,"",g_szInfoHead.."Tr�n ng��i b�n kh�ng c� "..tMedicineInfo[nIdx][1][1]);
		return 0;
	end
	SetTaskTemp(206,nIdx);
	local nCurXyb = GetXYB();
	nCount = min(nCount,floor((g_MaxChangeXYB-nCurXyb)/tMedicineInfo[nIdx][2]));
	if nCount <= 0 then
		Talk(1,"",g_szInfoHead.."C� Ti�u Dao xu l�n nh�t l�:"..g_MaxChangeXYB..", b�n �� ��n ��n m�c gi�i h�n, kh�ng th� ��i th�m n�a.");
		return 0;
	end
	AskClientForNumber("GLB_BW_Use_Medicine_Confirm",1,nCount,"��i bao nhi�u c�i "..tMedicineInfo[nIdx][1][1]);
end

function GLB_BW_Use_Medicine_Confirm(nCount)
	local nIdx = GetTaskTemp(206);
	if GetItemCount(tMedicineInfo[nIdx][1][2],tMedicineInfo[nIdx][1][3],tMedicineInfo[nIdx][1][4]) < nCount then
		Talk(1,"",g_szInfoHead.."Tr�n ng��i b�n "..tMedicineInfo[nIdx][1][1].."Kh�ng ��"..nCount..".");
		return 0;
	end
	if DelItem(tMedicineInfo[nIdx][1][2],tMedicineInfo[nIdx][1][3],tMedicineInfo[nIdx][1][4],nCount) == 1 then
		EarnXYB(nCount*tMedicineInfo[nIdx][2]);
	end
end

function GLB_BW_Services_Set()
	local strtab = {
		"T�i mu�n ch�n ��i th� m�n ph�i (nhi�u nh�t c� th� ch�n 5 m�n ph�i)	/GLB_BW_Block_Route_Set",
		"tr� l�i/main",
		"K�t th�c ��i tho�i/nothing",
	};
	Say(g_szInfoHead.."T� v� li�n server ��a ra ph�c v� n�p th�m ti�n phong ph� �a d�ng m�i nh�t, trong server c� thi�t k� c�c m�c ph�c v� c�n n�p th�m ti�n m� b�n c�n , khi t� v� li�n server s� h��ng th� ���c nhi�u tr�i nghi�m m�i. C� v�o m�t tr�n  t� v� c� �em theo ph�c v� n�p th�m ti�n ��u b� tr� m�t s� l��ng nh�t ��nh <color=yellow>Ti�u Dao Ng�c<color> (L��ng ti�u hao c�n c� v�o lo�i h�nh ph�c v� ��nh ra m� c� s� kh�c nhau). Khi <color=yellow>Ti�u Dao Ng�c<color> l� 0 ho�c �t h�n, h� th�ng s� d�ng vi�c b�t c�p t� v� cho ng��i ch�i, ��ng th�i nh�c nh� ng��i ch�i quay v� server �� s�a h�ng m�c d�ch v� tr� gia t�ng. �� ��m b�o b�n c� th� tr�i nghi�m t�t h�n th� tr��c khi v�o t� v� li�n server, b�n h�y ��i �� s� l��ng <color=yellow>Ti�u Dao Ng�c<color>.",
	getn(strtab),
	strtab)
end

function GLB_BW_Block_Route_Set()
	local tBlockRoute	= GLB_BW_Get_Block_Route();
	local szBlockInfo	= "";

	if getn(tBlockRoute) > MAXNUM_BLOCK_ROUTE then
		BWDH_SetTask(TASKID_BIWU_BLOCK_ROUTE, 0);
		tBlockRoute = {};
	end

	if 0 < getn(tBlockRoute) then
		if 1 == getn(tBlockRoute) then
			szBlockInfo = szBlockInfo .."B�n �� ch�n 1 m�t m�n ph�i, l�:";
		else
			szBlockInfo = szBlockInfo .. format("B�n �� ch�n %d m�n ph�i, l�:", getn(tBlockRoute));
		end

		for _, nRoute in tBlockRoute do
			szBlockInfo = szBlockInfo .. gf_GetRouteName(nRoute) .. ", ";
		end

		szBlockInfo = strsub(szBlockInfo, 1, strlen(szBlockInfo) - 2) .. ".";
		szBlockInfo = szBlockInfo .. format("B�n c� v�o 1 tr�n ��i H�i T� V� li�n server s� b� tr� %d <color=yellow>Ti�u Dao Ng�c<color>. Khi <color=yellow>Ti�u Dao Ng�c<color> l� 0 ho�c �t h�n, h� th�ng s� ng�ng ti�n h�nh ph�i ��i t� v� li�n server cho ng��i ch�i, v� nh�c ng��i ch�i quay v� server c�a m�nh �� s�a h�ng m�c d�ch v� tr� gia t�ng.", TB_BW_BLOCK_ROUTE_COST[getn(tBlockRoute)]);
	end

	local strtab = {
		"�� x�a m�n ph�i ���c ch�n l�a 	/#BWDH_SetTask(TASKID_BIWU_BLOCK_ROUTE, 0);",
		"T�ng th�m m�n ph�i ch�n m�i 	/GLB_BW_Block_Route_Add_Set",
		"tr� l�i/main",
		"K�t th�c ��i tho�i/nothing",
	};
	Say(g_szInfoHead.."Ch�n m�n ph�i nh�t ��nh c� th� tr�nh tr��ng h�p b�n trong ��i H�i T� V� g�p ph�i m�n ph�i n�y. Nhi�u nh�t b�n c� th� ch�n <color=yellow>"..MAXNUM_BLOCK_ROUTE.."<color> kh�ng c�ng m�n ph�i."..szBlockInfo,
	getn(strtab),
	strtab)
end

function GLB_BW_Block_Route_Add_Set()
	local tSay = {};
	tSay.sel = {
		{"tr� l�i",	"main"},
		{"K�t th�c ��i tho�i",	"nothing"},
	};

	local tBlockRoute	= GLB_BW_Get_Block_Route();

	if MAXNUM_BLOCK_ROUTE <= getn(tBlockRoute) then
		tSay.msg = g_szInfoHead.."B�n �� ch�n "..getn(tBlockRoute).." m�t m�n ph�i, kh�ng th� ch�n n�a.";
		temp_Talk(tSay);
		return
	end
	
--	tinsert(tBlockRoute, GetPlayerRoute());

--	tBlockRoute.n = nil;
--	for _, nRoute in tBlockRoute do
--		if tRouteName[nRoute] then
--			tRouteName[nRoute] = nil;
--		end
--	end

	local tbRoute = gf_GetRouteTable();
	for k, v in tbRoute do
		if GetPlayerRoute() ~= v then
			tinsert(tSay.sel, 1, {tRouteName[v], format("#GLB_BW_Block_Route_Add(%d)", k)});
		end
	end

	tSay.msg = g_szInfoHead.."Ch�n m�n ph�i b�n mu�n ch�n, b�n kh�ng th� ch�n m�n ph�i c�a ch�nh m�nh.";
	temp_Talk(tSay);
end

function GLB_BW_Block_Route_Add(nRouteIdx)
	local strtab = {
		"tr� l�i/main",
		"K�t th�c ��i tho�i/nothing",
	};

	local tbRoute = gf_GetRouteTable();
	local tBlockRoute	= GLB_BW_Get_Block_Route();

	if MAXNUM_BLOCK_ROUTE <= getn(tBlockRoute) then
		Say(g_szInfoHead.."B�n �� ch�n "..getn(tBlockRoute).." m�t m�n ph�i, kh�ng th� ch�n n�a.",
		getn(strtab),
		strtab)
		return
	end

	if tbRoute[nRouteIdx] == GetPlayerRoute() then
		Say(g_szInfoHead.."B�n kh�ng th� ch�n m�n ph�i c�a ch�nh m�nh.",
		getn(strtab),
		strtab)
		return
	end
	
	gf_SetTaskBit(TASKID_BIWU_BLOCK_ROUTE, nRouteIdx, 1);

	tinsert(strtab, 1, "Ti�p t�c ch�n  /GLB_BW_Block_Route_Add_Set");
	Say(g_szInfoHead.."B�n �� ch�n th�nh c�ng "..gf_GetRouteName(tbRoute[nRouteIdx])..".",
	getn(strtab),
	strtab)
end

function bw_buchang()
	Say(g_szInfoHead.."C�n c� v�o th�ng b�o c�a qu�c v� vi�n ng�y 15 th�ng 8 n�m 2010 l� ng�y c� n��c t��ng nh�. Trong th�i gian n�y, �� t��ng nh� ��n nh�ng ��ng b�o g�p n�n n�i n� � Ch�u Kh�c Cam T�c, server ngh� m�t ng�y 15 th�ng 8 n�m 2010.\n  Vi�c ng�ng server s� l�m gi�m �i�m t� c�ch c�a c�c ng��i ch�i ��i H�i T� V� trong tu�n n�y, v� s� c� m�t s� ng��i ch�i nh�n t�i ��i h�i t� th� k� thi qu� tr��c, v� th� ph�t b� cho c�c hi�p s� t�i ��i H�i T� V� thi qu�.",
		3,
		"\nNh�n b�i th��ng /bw_buchang_1",
		"\nPh��ng �n b�i th��ng /bw_buchang_2",
		"\nK�t th�c ��i tho�i/nothing")
end

function bw_buchang_1()
	if GetTask(TASKID_BIWU_BUCHANG) ~= 0 then
		Talk(1,"",g_szInfoHead.."B�n �� nh�n qua b�i th��ng r�i.");
		return 0;
	end
	local szName = GetName();
	local nRoute = GetPlayerRoute();
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."B�n v�n ch�a gia nh�p m�n ph�i, kh�ng c� t� c�ch nh�n b� ph�n th��ng thi qu� tr��c.");
		return 0;
	end;
	if gf_Judge_Room_Weight(2,100,g_szInfoHead) ~= 1 then
		return 0;
	end
	local tBuChangAward = {
		{
			{"1000 v�n kinh nghi�m ","season_modify_exp(10000000,1)"},
			{"T�i ��i H�i T� V� thi qu� 20 c�i","gf_AddItemEx({2,95,171,20,1}, 'T�i thi qu� ��i H�i T� V� thi qu�')"},
			{"Danh hi�u: C�u Ch�u V� Th�n (�n v�n c� hi�u l�c)","season_add_title(5,2,'c�u ch�u v� th�n')"},
		},
		{
			{"500 v�n kinh nghi�m ","season_modify_exp(5000000,1)"},
			{"Th� c��i chuy�n d�ng cho ��i H�i T� V� ","gf_AddItemEx({0,105,106,1,1,-1,-1,-1,-1,-1,-1}, 'Vi�t �nh')"},
			{"T�i ��i H�i T� V� thi qu� 20 c�i","gf_AddItemEx({2,95,171,20,1}, 'T�i thi qu� ��i H�i T� V� thi qu�')"},
			{"Danh hi�u: C�u Ch�u V� Th�nh (�n v�n c� hi�u l�c)","season_add_title(5,3,'c�u ch�u v� th�nh')"},
		},
		{
			{"500 v�n kinh nghi�m ","season_modify_exp(5000000,1)"},
			{"T�i ��i H�i T� V� thi qu� 20 c�i","gf_AddItemEx({2,95,171,20,1}, 'T�i thi qu� ��i H�i T� V� thi qu�')"},
			{"Danh hi�u: C�u Ch�u V� Cu�ng (�n v�n c� hi�u l�c)","season_add_title(5,4,' c�u ch�u v� cu�ng')"},
		},
		{
			{"500 v�n kinh nghi�m ","season_modify_exp(5000000,1)"},
			{"T�i ��i H�i T� V� thi qu� 20 c�i","gf_AddItemEx({2,95,171,20,1}, 'T�i thi qu� ��i H�i T� V� thi qu�')"},
			{"Danh hi�u: C�u Ch�u V� Hi�p (�n v�n c� hi�u l�c)","season_add_title(5,5,'c�u ch�u v� hi�p')"},
		},
		{
			{"T�i ��i H�i T� V� thi qu� 20 c�i","gf_AddItemEx({2,95,171,20,1}, 'T�i thi qu� ��i H�i T� V� thi qu�')"},
			{"2500 v�n kinh nghi�m ","season_modify_exp(25000000,1)"},
		},
	};

	local tbRankInfo = {{1000,1100},{800,880},{680,750},{450,500},{180,200}};
	local nType = 0;
	local szMsg = "";
	local nBWLevel,nBWRank,nRankPoint = get_rank_before();--���û�����а�nRankPoint����0
	for i=1,getn(tbRankInfo) do
		if nRankPoint >= tbRankInfo[i][1] and nRankPoint < tbRankInfo[i][2] then
			nType = i;
			break;
		end
	end;
	if nType == 0 then
		Talk(1,"bw_buchang",g_szInfoHead.."�i�m t� c�ch k� thi qu� tr��c c�a b�n l�:"..nRankPoint..", kh�ng th�a m�n �i�u ki�n nh�n th��ng b�, chi ti�t c� th� xem ph��ng �n b�i th��ng.");
		return 0;
	end

	BWDH_SetTask(TASKID_BIWU_BUCHANG,1);
	gf_SetLogCaption("B�i th��ng ��i H�i T� V� ");
	for i=1,getn(tBuChangAward[nType]) do
		dostring(tBuChangAward[nType][i][2]);
	end
	gf_SetLogCaption("");
end

function bw_buchang_2()
	local strMsg = [[
		�������򣺰�����������ʸ������1/11��������������ȡ�Ľ���������ߣ����������������û�е��½������θı䣬���������ȡ�����������������ɣ�������в�����
		��ϸ�������£�
		1000<=�������ʸ��<1100��������������20�� �����飺10000000���ƺţ���������
		880<=�������ʸ��<1000����Ӱ�죬��������
		\p800<=�������ʸ��<880��������������20�������飺5000000���ƺţ�������ʥ��������ר����
		750<=�������ʸ��<800����Ӱ�죬��������
		680<=�������ʸ��<750��������������20�������飺5000000���ƺţ��������
		500<=�������ʸ��<680����Ӱ�죬��������
		450<=�������ʸ��<500��������������20�������飺5000000���ƺţ�����������
		200<=�������ʸ��<450����Ӱ�죬��������
		180<=�������ʸ��<200��������������20�������飺25000000��
	]]
	suTalk("bw_buchang",g_szInfoHead..strMsg);
end

function gotoUrl()
	local URL = "http://jx2.xoyo.com/zt/2013/08/26/zy2ndpk/";
	SendScript2Client(format("URL([[%s]], '');", URL));
end