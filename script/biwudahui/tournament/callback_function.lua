--Create date:2008-1-9 10:29
--Author:yanjun
--Description:ϵͳ�Ļص��ű�
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_szInfoHead = "";

--��ť�ص�����
function OnButton(nBtID)
	local nSignUpInfo = GetTask(TSK_SIGN_UP);
	local nCurRealResult = GetTask(TSK_CURREALRESULT);	--��ǰ���ջ���
	BWT_WeeklyClear();
	local nVersion,nCurGs = GetRealmType();
	if GetTaskTemp(TSK_TEMP_CAMP) ~= 0 then
		Talk(1,"","Kh�ng th� th�c hi�n thao t�c n�y!");
		return 0;
	end;
	local nLevel = GetLevel();
	if nBtID == 1 then	--���ۿ����ա�
		if nCurGs == 1 then
			Talk(1,"","Kh�ng th� th�c hi�n thao t�c n�y � ��y.");
			return 0;
		end
		GLB_BW_ChangeItem();
		return 1;
	end;
	if nBtID == 2 then	--�μӽ���
		if nCurGs == 1 then --�ڿ����
			local selTab = {
				"Ta ch� mu�n tham gia 1 l�n t� v� to�n qu�c/#join_list_confirm(1)",
				"T�i ch� mu�n lu�n tham gia t� v� to�n qu�c/#join_list_confirm(2)",
				"T�m th�i kh�ng tham gia/nothing",
			};
			Say("B�n mu�n <color=yellow>tham gia 1 l�n t� v� to�n qu�c<color> hay l� <color=yellow>lu�n tham gia t� v� to�n qu�c<color>?",
				getn(selTab),
				selTab)
		else --�ڱ���
			go_to_biwu_npc();
			return 1;
		end
	end;
	if nBtID == 3 then	--�˳�����
		BWT_QuitGestConvention();
		Talk(1,"","Ng��i �� ng�ng so t�i.");
		return 1;
	end;
	if nBtID == 4 then	--��ȡ����
		if nCurGs == 1 then
			Talk(1,"","Kh�ng th� th�c hi�n thao t�c n�y � ��y.");
			return 0;
		end
		BWT_GetAward();
		return 1;
	end;
	if nBtID == 5 then	--�Ǽǻ���
		if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then
			local nCurSignedResult = GetTask(TSK_CURSIGNEDRESULT);
			if nCurSignedResult ~= 0 and nCurRealResult <= nCurSignedResult then
				Talk(1,"","�i�m so t�i hi�n gi� c�a ng��i th�p h�n �i�m ng��i ��ng k� tr��c ��y, luy�n t�p th�m r�i h�n ��n ��ng k�. <color=red>Nh�ng c�n l�u �: Khi �i�m th�c t� c�a ng��i th�p h�n �i�m ��ng k� 30 ho�c nhi�u h�n n�a, th� h� th�ng s� c��ng ch� ��ng k�. Cho n�n, kh�ng n�n �� cho �i�m th�c t� th�p h�n �i�m ��ng k� qu� nhi�u.<color>");
				return 0;
			end;
			local selTab = {
						"��ng � ��ng k�/register_point_confirm",
						"T�m th�i kh�ng ��ng k�/nothing",
						}
			local szString1,szString2,szString3 = "","","";
			local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
			local nCount = 0;
			if nGetXinDeState == 30 then
				szString1 = "<color=red>�� l�nh<color>";
				szString2 = "<color=red>�� l�nh<color>";
				szString3 = "<color=red>�� l�nh<color>";
			elseif nGetXinDeState == 20 then
				szString1 = "<color=red>�� l�nh<color>";
				szString2 = "<color=red>�� l�nh<color>";
				szString3 = "<color=yellow>Ch�a l�nh<color>";
			elseif nGetXinDeState == 10 then
				szString1 = "<color=red>�� l�nh<color>";
				szString2 = "<color=yellow>Ch�a l�nh<color>";
				szString3 = "<color=yellow>Ch�a l�nh<color>";
			else
				szString1 = "<color=yellow>Ch�a l�nh<color>";
				szString2 = "<color=yellow>Ch�a l�nh<color>";
				szString3 = "<color=yellow>Ch�a l�nh<color>";
			end;
			Say("120 �i�m ��ng k� ��i ���c 10 quy�n Th�c Chi�n T�m ��c       "..szString1.."\n150 �i�m ��ng k� ��i th�m ���c 10 quy�n Th�c Chi�n T�m ��c     "..szString2.."\n200 �i�m ��ng k� c� th� ��i th�m 10 quy�n Th�c Chi�n T�m ��c     "..szString3.."\n�i�m ��ng k� hi�n gi� c�a ng��i l� <color=yellow>"..nCurSignedResult.."<color>, �i�m so t�i hi�n gi� c�a ng��i l� <color=yellow>"..nCurRealResult.."<color>, 11 gi� 30 t�i ch� nh�t s� ti�n h�nh x�p h�ng d�a theo �i�m ��ng k�, ng��i x�c nh�n mu�n ��ng k� �i�m so t�i hi�n gi� c�a m�nh ch�?",getn(selTab),selTab);
			return 1;
		else
			Talk(1,"","S� l�n ng��i tham gia so t�i tu�n n�y �t h�n <color=yellow>"..REQUIRE_MATCH_TIME.."<color>, kh�ng th� ��ng k� �i�m.");
			return 0;
		end;
	end;
	if nBtID == 6 then	--����˵��
		know_detail();
		return 1;
	end;
	if nBtID == 7 then	--���ղ�ѯ
		if SubWorldID2Idx(100) < 0 then
			Talk(1,"","N�i n�y kh�ng th� ki�m tra th�ng tin so t�i, h�y ��n <color=yellow>Tuy�n Ch�u ho�c g�n Tuy�n Ch�u<color> ch�n v�o ph�m n�y �� ki�m tra.");
			return 0;
		end;
		local nPIdx = 0;
		local nPoint = 0;
		local nLevel = 0;
		local szString = "Ng��i c� �i�m cao nh�t trong cu�c t� v� � th�nh n�y:\n"..gf_FormatStringLength("",20)..gf_FormatStringLength("�i�m cao nh�t",12)..gf_FormatStringLength("C�p",4).."\n";
		nPIdx = GetPlayerByGestQueueIndex(GetGestQueueSize()-1);
		if nPIdx == 0 then
			szString = szString.."<color=yellow>"..gf_FormatStringLength("��i h�i t� v� Thi�n H� �� Nh�t: ",20,0).."<color>"..gf_FormatStringLength("Ch�a",12)..gf_FormatStringLength("Ch�a",4).."\n";
		else
			nPoint = GetTask(TSK_CURREALRESULT,nPIdx);
			nLevel = GetLevel(nPIdx);
			szString = szString.."<color=yellow>"..gf_FormatStringLength(TB_BIWU_NAME[2]..": ",20,0).."<color>"..gf_FormatStringLength(nPoint,12)..gf_FormatStringLength(nLevel,4).."\n";
		end;
		Talk(1,"",szString);
		return 1;
	end;
end;

function OnOpenUI()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= g_nBWAwardBeginDate and GetTask(TSK_FIRST_OPEN_UI) ~= g_nBWAwardDate then
		local nYear,nMonth,nDay,nHour = gf_GetDateData(g_nBWAwardDate);
		--Say("    ���ڷ������µ�һ����������������\n    ����<color=green>���������ʸ�����а���ߵõ��ʸ��<color>����ң�����һ�ݷ��Ľ�����������ȡһ��������<color=green>"..g_szGloryAwardName.."<color>��ͬʱ������ʸ�֡�\n    ���������200�����µ���ң���������100�֣����Ӻ�Ļ�����಻����200��\n    �Ժ�Ҳ������ʸ�ֲ����ڷ��Ž�����\n    ����<color=yellow>"..nYear.."��"..nMonth.."��"..nDay.."��"..nHour.."��ǰ<color>��<color=green>�꾩��������ʹ[173,176]<color>����ȡ��Ľ�����",0);
		BWDH_SetTask(TSK_FIRST_OPEN_UI,g_nBWAwardDate);
	end;
end;
--=========================================================================================
function register_point_confirm()
	BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
	local nRegPoint = GetTask(TSK_CURSIGNEDRESULT);
	local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
	local nCount = 0;
	if nRegPoint >= 200 and nGetXinDeState < 30 then
		BWDH_SetTask(TSK_GET_XINDE_STATE,30);
		nCount = 30 - nGetXinDeState;
	elseif nRegPoint >= 150 and nGetXinDeState < 20 then
		nCount = 20 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,20);
	elseif nRegPoint >= 120 and nGetXinDeState < 10 then
		nCount = 10 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,10);
	end;
	if nCount > 0 then
		AddItem(2,1,1101,nCount);
		Msg2Player("B�n nh�n ���c "..nCount.." quy�n Th�c Chi�n T�m ��c");
	end;
	SignUpGestResult();	--�����ֵǼ���ȥ
	WriteLog("["..LOG_HEAD.."]:"..GetName().."�i�m ��ng k� t� v�:"..nRegPoint.."Nh�n ���c"..nCount.." quy�n Th�c Chi�n T�m ��c");
	Talk(1,"","�i�m c�a ng��i �� ��ng k�.");
end;

function go_to_watch_confirm(nMapID)
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= 100 and nCurMapID ~= 200 and nCurMapID ~= 300 then
		Talk(1,"","Ch� c� th� � Tuy�n Ch�u v�o xem t� v� ")
		return 0;
	end;
	if GetTaskTemp(TSK_TEMP_CAMP) ~= 0 or GetFightState() == 1 then
		Talk(1,"","Tr�ng th�i hi�n gi� c�a ng��i kh�ng th� th�c hi�n thao t�c n�y!");
		return 0;
	end;
	Pay(5000);
	UseScrollEnable(0);	--��ֹʹ�ûسǷ�
--	SetLogoutRV(1);	--���õ�½��Ϊ����������
--	UseMask(1,0);	--��Ϊ������
	NewWorld(TB_MAPID[nMapID][1],1620,3180);
end;

function go_to_biwu_npc()
	if GetTaskTemp(TSK_TEMP_CAMP) ~= 0 or GetFightState() == 1 then
		Talk(1,"","Tr�ng th�i hi�n gi� c�a ng��i kh�ng th� th�c hi�n thao t�c n�y!");
		return 0;
	end;
--	if GetCash() < 5000 then
--		Talk(1,"","������Ҫ����50���������ϲ�����");
--		return 0
--	end
--	if Pay(500) == 1 then
		NewWorld(200,1390,2823);
--	end
end

function join_list_confirm(nType)
	if nType == 1 then	--ֻ�μ�1��
		BWDH_SetTask(TSK_JOIN_LIST_TYPE,1);
		gf_ShowMsg("Ng��i ��ng k� tham gia <color=yellow>so t�i m�t l�n<color>, sau khi so t�i k�t th�c ng��i s� t� ��ng <color=red>tho�t ra<color>.");
	elseif nType == 2 then	--һֱ�μ�
		BWDH_SetTask(TSK_JOIN_LIST_TYPE,-1);
		gf_ShowMsg("Ng��i �� ��ng k� <color=yellow>tham gia so t�i li�n t�c<color>.");
	end;
	BWT_JoinGestConvention();
end;

function realm_kick_player()
	local nHour = tonumber(date("%H%M"));
	local nVersion,nCurGs = GetRealmType();	
	if nCurGs == 1 then
		if nHour >= 2310 then
			local nOldIndex = PlayerIndex;			
			local tPlayers = GetMapPlayer(7100);
			for i = 1, getn(tPlayers) do
				PlayerIndex = tPlayers[i];
				ExitGame();
			end
			PlayerIndex = nOldIndex;
		end		
	end
end
--=========================================================================

function callback_open_biwudahui()
	if SubWorldID2Idx(7100) < 0 then return end
	--local nHour = tonumber(date("%H"));
	if BWT_CheckBiWuTime() == 1 then
		BWT_InitOneRound();
		local szMsg = "open a new biwudahui round..."
		gf_ShowDebugInfor(szMsg);
		if BWDH_DEBUG_VERSION == 1 then
			print(szMsg)
		end
	end;
	realm_kick_player();
end

callback_open_biwudahui();

