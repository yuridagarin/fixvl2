--create date:07-04-10
--author:yanjun
--describe:����ʹ�߽ű�
Include("\\script\\gongcheng\\gongcheng_function.lua")
Include("\\script\\online\\zgc_public_fun.lua")

g_InfoHeader = "<color=green>��i s� c�ng th�nh<color>: .";

function main()
	if GetGlbValue(GLB_GONGCHENG_FORBIDEN) == 1 then
		Talk(1,"",g_InfoHeader.."Th�nh n�y t�m th�i do tri�u ��nh ti�p qu�n");
		return 0;
	end;
	local selTab = {
				"* Gi�i thi�u l�u tr�nh v� quy t�c C�ng th�nh/know_rule",
				"* Ta mu�n v�o Khu v�c C�ng th�nh/enter_battle",
				"* Ta mu�n xem tin t�c chi�n b�o C�ng th�nh hi�n t�i/view_gongcheng_info",
--				"* Ph�n th��ng C�ng th�nh chi�n/get_award",
				"Ta ch� ti�n ���ng h�i ch�i!/nothing",
				}
	Say(g_InfoHeader.."M�i tu�n th�nh th� ��u m� 'Bang h�i C�ng th�nh chi�n', l�y chi�m l�nh v� ti�u h�y ��i k� c�a ��ch l�m m�c ti�u. Bang ph�i l�m Th�nh Ch� s� ���c ph�n th��ng c�a tri�u ��nh",getn(selTab),selTab);
end;

function view_gongcheng_info()
	local nCityMapID = GetWorldPos();
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	local nGTotal,nGNormal,nGRfm = GCZ_GetCampPlayerCount(GONG_ID,nBattleMapID);
	local nSTotal,nSNormal,nSRfm = GCZ_GetCampPlayerCount(SHOU_ID,nBattleMapID);
	local szGong,szShou = GCZ_GetCampNameFromRelay(nCityMapID,ALL_ID);
	if szGong == "" then
		szGong = "Ch�a";
	end;
	if szShou == "" then
		szShou = "Ch�a";
	end;
	szGong = replace(szGong, "/" ,"-")
	szGong = replace(szGong, "|" ,"-")
	szGong = replace(szGong, ":" ,"-")
	szShou = replace(szShou, "/" ,"-")
	szShou = replace(szShou, "|" ,"-")
	szShou = replace(szShou, ":" ,"-")
	Say(g_InfoHeader.."\nPhe th� th�nh: <color=yellow>"..szShou.."<color>, Phe c�ng th�nh: <color=red>"..szGong.."<color>\nT�nh h�nh chi�n s� hi�n t�i: \nT�ng nh�n s� phe c�ng: <color=yellow>"..nGTotal.."<color> Nh�n s� ngo�i vi�n phe c�ng: <color=yellow>"..nGRfm.."<color>\nT�ng nh�n s� phe th�: <color=yellow>"..nSTotal.."<color> Nh�n s� ngo�i vi�n phe th�: <color=yellow>"..nSRfm.."<color>",0);
end;

function know_rule()
	local selTab = {
				"* Tranh �o�t t� c�ch C�ng th�nh/introduce_qualification",
				"* Gi�i thi�u chi ti�t C�ng th�nh chi�n/introduce_detail",
				--"�� ����˰��/introduce_tax",
				"* Quay l�i/main",
				"Ta ch� ti�n ���ng h�i ch�i!/nothing",
				}
	Say(g_InfoHeader,getn(selTab),selTab);
end;

function introduce_qualification()
	Talk(1,"know_rule",g_InfoHeader.."M�i <color=yellow>t�i th� S�u<color> s� ti�n h�nh thi ��u L�i ��i theo th� th�c lo�i tr�c ti�p, bang h�i qu�n qu�n s� gi�nh ���c t� c�ch tham gia c�ng th�nh chi�n th�nh th� t��ng �ng? (Khi th�nh thu�c v� Trung l�p s� tr�c ti�p th�nh Th�nh Ch� c�a th�nh ��). <enter>H�n ch� L�i ��i: bang ph�i �� chi�m ���c th�nh th� kh�ng c�n tham mgia thi ��u L�i ��i, m� m�c nhi�n l� Th�nh Ch� phe th�, v� c�ng kh�ng ���c tranh �o�t t� c�ch c�ng th�nh th�nh kh�c. M�i bang ph�i tham gia L�i ��i ph�i do <color=yellow>Bang ch� l�nh ��i<color> v� bang ch� �� ph�i l�nh ��o bang ph�i <color=yellow>�t nh�t 7 ng�y<color>, ��ng th�i <color=yellow>t�t c� th�nh vi�n trong ��i ��u ph�i tr�n c�p 80 v� ph�i gia nh�p bang h�i �t nh�t 7 ng�y<color>");
end;

function introduce_detail()
	Talk(1,"introduce_detail_2",g_InfoHeader.."M�i 7h t�i th� S�u, bang h�i gi�nh ���c t� c�ch C�ng th�nh s� ph�t ��ng C�ng th�nh chi�n ��n th�nh th� t��ng �ng<enter> <color=yellow>�i�u ki�n v�o Khu v�c C�ng th�nh<color>: Nh�m ph�ng ch�ng gian t�, ch� th�nh vi�n �� gia nh�p bang ph�i tr�n 7 ng�y m�i ���c tr�c ti�p tham gia c�ng th�nh chi�n. Nh�ng ng��i kh�c (c� th� kh�ng ph�i l� th�nh vi�n bang h�i) mu�n v�o khu v�c c�n ph�i t� ��i v�i ng��i c� ch�c v� t� ���ng ch� tr� l�n, ��i tr��ng c� s� l��ng <color=yellow>D�ng S� l�nh<color> t��ng ���ng l� ���c. Sau khi th�nh ngo�i vi�n, trong th�i gian C�ng th�nh chi�n c� th� t�y � ra v�o khu v�c chi�n ��u. T�i �a ch� c� <color=yellow>150 ng��i c�ng (th�) th�nh<color>, ng��i ch�i ch�a gia nh�p m�n ph�i kh�ng th� v�o khu v�c n�y<enter> <color=yellow>Khu an to�n<color>: Ng��i ch�i t� vong s� ���c h�i sinh trong Khu an to�n. C�c �i�m truy�n t�ng trong Khu an to�n kh�c nhau s� truy�n t�ng ��n c�c �i�m t�p k�t kh�c nhau trong th�nh");
end;

function introduce_detail_2()
	Talk(1,"introduce_detail_3",g_InfoHeader.."<enter> <color=yellow>�i�m t�p k�t<color>: T� Khu an to�n v�o Khu v�c C�ng th�nh ph�i qua �i�m t�p k�t.<enter> <color=yellow>Th�nh th� ��i k�<color>: Trong th�nh c� <color=yellow>3 ��i k�<color>, c� th� b� ph� h�ng v�nh vi�n. ��i k� m�t khi b� ph� h�ng th� phe c�ng s� ���c t�ng �i�m t�ch l�y c�ng th�nh<enter> <color=yellow>C�c ki�n tr�c c� th� chi�m l�nh<color>: trong th�nh c� <color=yellow>7 ki�n tr�c c� th� chi�m l�nh<color>, khai cu�c do phe th� chi�m l�nh. Khi Phe c�ng ph� h�y th�nh c�ng s� chuy�n quy�n chi�m l�nh v� t�ng �i�m t�ch l�y. Khi phe th� chi�m l�i ���c th� �i�m t�ch l�y c�a phe c�ng c�ng s� b� tr� �i");
end;

function introduce_detail_3()
	Talk(2,"introduce_detail_4",g_InfoHeader.."<enter> <color=yellow>Th�i gian C�ng th�nh v� quy t�c th�ng thua<color>: Th�i gian C�ng th�nh chi�n l� 2 ti�ng, m�i t�i th� B�y t� 19-21h. 19h Khu v�c C�ng th�nh s� v�o giai �o�n chu�n b�, th�i gian chu�n b� 30 ph�t. N�u trong th�i gian chi�n ��u, Phe c�ng gi�nh ���c <color=yellow>8 ph�n �i�m t�ch ph�n th� C�ng th�nh chi�n k�t th�c<color>, n�u h�t th�i gian, Phe c�ng ���c <color=yellow>t� 6 ph�n �i�m t�ch l�y tr� l�n l� chi�n th�ng<color> v� ng��c l�i",g_InfoHeader.."<enter> <color=yellow>Th� v� th�nh m�n v� C�ng th�nh ti�n phong<color>: Bang h�i phe th� c�n thi�t l�p Th� v� th�nh m�n, thi�t l�p xong c�c th�nh m�n ��i �ng trong th�nh th� s� v�o tr�ng th�i ��ng. Ng��i ch�i phe c�ng s� d�ng C�ng th�nh Ti�n phong l�nh c� th� khi�u chi�n ng��i ch�i Th� v� th�nh m�n. Th� V� l�nh v� C�ng th�nh Ti�n phong l�nh c� b�n � Th� th�nh Tham m�u v� C�ng th�nh Tham M�u. Gi�nh th�ng l�i trong khi�u chi�n ��n ��u s� tr� th�nh T�n Th� v� th�nh m�n, th�nh m�n s� t�m th�i m� ra. Sau �� phe th� c� th� l�i s� d�ng C�ng th�nh Ti�n phong l�nh �� khi�u chi�n, �o�t l�i th�nh m�n.");
end;

function introduce_detail_4()
	Talk(1,"know_rule",g_InfoHeader.."<enter> <color=yellow>khi�u chi�n ��n ��u<color>: th�nh th� c� 3 th�nh m�n c� th� t�n c�ng. N�u phe th� ��m nhi�m ch�c Th� v� th� th�nh m�n s� v�o tr�ng th�i ��ng, giai �o�n n�y th�nh vi�n phe th� c� th� t� do ra v�o th�nh m�n, phe c�ng kh�ng th�. C� hai c�ch �� m� th�nh m�n.1. c�ng k�ch ph� h�y th�nh m�n, 2.S� d�ng C�ng th�nh Ti�n phong l�nh ph�t khi�u chi�n ��n ��u t�i Th� v� th�nh m�n v� ph�i gi�nh chi�n th�ng th� th�nh m�n s� ���c m� t�m th�i, t�t c� ng��i ch�i ��u c� th� t�y � ra v�o. L�c n�y kh� n�ng ph�ng ng� c�a th�nh m�n gi�m ��ng k�. ���ng nhi�n Phe th� th�nh c�ng c� th� th�ng qua khi�u chi�n ��n ��u �� �o�t l�i th�nh m�n.");
end;

function introduce_tax()
	Talk(2,"know_rule",g_InfoHeader.."Bang ph�i Th�nh Ch� c� th� thu thu� trong chi�m ���c<enter>* Thu� mua b�n: ng��i ch�i mua ho�c b�n b�t c� v�t ph�m n�o cho NPC trong th�nh ��u s� b� tr�ng thu m�t ph�n thu�<enter>* Thu� b�y b�n: ng��i ch�i b�y b�n trong th�nh th�, s� b� tr�ng thu thu� n�p cho Bang ph�i Th�nh Ch�",g_InfoHeader.."<enter># Thu� su�t: Th�nh Ch� c� th� t� do s�a thu� su�t (<color=yellow>Trong gi�i h�n thu� su�t 10%<color>). ��i v�i h�nh th�c thu� b�y b�n s� t�nh theo th�i gian thu.<enter># T�t c� thu� su�t s� ���c gi� t�i c�ng th�nh ��i s�, th�i gian thu thu� l� th�i gian th�c, <color=yellow> v�o 0 gi� th� 7 s� x�a v� 0<color>, qu� h�n kh�ng tr� l�i. <color=yellow> Th�i gian thu thu� s� l� t� 0 gi� ch� nh�t ��n 24 gi� th� 6<color>, ch�a ph�i th�i gian thu thu� ho�c ch�a m� c�ng th�nh th� t�t c� thu� su�t s� ��nh 10%.<enter> Nh�ng thu� su�t tr�n ��i v� hi�u v�i th�nh vi�n b�n bang.");
end;

function enter_battle()
	local nCityMapID = GetWorldPos();
	local selTab = {
			"* Ta mu�n v�o C�ng th�nh /#single_enter(1)",
			"* Ta mu�n d�n ngo�i vi�n v�o C�ng th�nh /#reinforcement_enter(1)",
			"* Ta mu�n v�o Th� th�nh/#single_enter(2)",
			"* Ta mu�n d�n ngo�i vi�n v�o Th� th�nh/#reinforcement_enter(2)",
			"Ta ch� ��n xem/nothing",
			}			
	if GetPKValue() >= 4 then
		Talk(1,"",g_InfoHeader.."Ng��i �� l�m nhi�u �i�u �c, �ang b� truy n� th� l�m sao ti�n v�o chi�n tr��ng?");
		return 0;
	end
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	local nGTotal,nGNormal,nGRfm = GCZ_GetCampPlayerCount(GONG_ID,nBattleMapID);
	local nSTotal,nSNormal,nSRfm = GCZ_GetCampPlayerCount(SHOU_ID,nBattleMapID);
	local szGong,szShou = GCZ_GetCampNameFromRelay(nCityMapID,ALL_ID);
	szGong = replace(szGong, "/" ,"-")
	szGong = replace(szGong, "|" ,"-")
	szGong = replace(szGong, ":" ,"-")
	szShou = replace(szShou, "/" ,"-")
	szShou = replace(szShou, "|" ,"-")
	szShou = replace(szShou, ":" ,"-")
	if szGong == "" then
		szGong = "Ch�a";
	end;
	if szShou == "" then
		szShou = "Ch�a";
	end;
	Say(g_InfoHeader.."\nPhe th� th�nh: <color=yellow>"..szShou.."<color>, Phe c�ng th�nh: <color=red>"..szGong.."<color>\nT�nh h�nh chi�n s� hi�n t�i: \nT�ng nh�n s� phe c�ng: <color=yellow>"..nGTotal.."<color> Nh�n s� ngo�i vi�n phe c�ng: <color=yellow>"..nGRfm.."<color>\nT�ng nh�n s� phe th�: <color=yellow>"..nSTotal.."<color> Nh�n s� ngo�i vi�n phe th�: <color=yellow>"..nSRfm.."<color>",getn(selTab),selTab);
end;

function single_enter(nCamp)
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1,"",g_InfoHeader.."Ch�a gia nh�p m�n ph�i, kh�ng th� v�o chi�n tr��ng");
		return 0;
	end;
	local nCityMapID = GetWorldPos();
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	if nBattleMapID == 0 then
		Talk(1,"",g_InfoHeader.."���ng �i ph�a tr��c kh�ng th�ng!");
		return 0;
	end;
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nBattleMapID) == MS_STATE_IDEL then
		Talk(1,"",g_InfoHeader.."Giai �o�n n�y b�t c� ai c�ng kh�ng ���c v�o!");
		return 0;
	end;
	local nPlayerCount = GCZ_GetCampPlayerCount(nCamp,nBattleMapID);
	if nPlayerCount >= MAX_TOTAL_PLAYER then
		Talk(1,"",g_InfoHeader.."Nh�n s� trong chi�n tr��ng hi�n �� ��. Xin h�y ��i sau�");
		return 0;
	end;
	local nCurBattleMUID = mf_GetMissionV(MISSION_ID,MV_MISSION_UID,nBattleMapID);
	local nMyBattleMUID = GetTask(TNC_MUID);
	if nMyBattleMUID ~= 0 and nMyBattleMUID == nCurBattleMUID and GetTask(TNC_CAMP) == nCamp then	--���֮ǰ��ȥ����ֱ�ӽ�ȥ��
		transmit_single_man(nCamp,nBattleMapID);
		return 0;
	end;
	--���û��ȥ�����ж����Ƿ������������
	if (GCZ_GetJoinTongDayCount() < LEAST_STAY_DAY or GetTongName() ~= GCZ_GetCampNameFromRelay(nCityMapID,nCamp)) and LIMIT_IGNORE == 0 then
		Talk(1,"",g_InfoHeader.."Ch� c� th�nh vi�n �� tham gia bang h�i tr�n <color=yellow>"..LEAST_STAY_DAY.."<color> ng�y m�i ���c t�c ti�p v�o")
		return 0;
	end;
	transmit_single_man(nCamp,nBattleMapID);
end;

function reinforcement_enter(nCamp)
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1,"",g_InfoHeader.."Ch�a gia nh�p m�n ph�i, kh�ng th� v�o chi�n tr��ng");
		return 0;
	end;
	local nCityMapID = GetWorldPos();
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nBattleMapID) == MS_STATE_IDEL then
		Talk(1,"",g_InfoHeader.."Giai �o�n n�y b�t c� ai c�ng kh�ng ���c v�o!");
		return 0;
	end;
	local nPlayerCount = GCZ_GetCampPlayerCount(nCamp,nBattleMapID);
	local nTeamSize = GetTeamSize();
	if nTeamSize == 0 then
		Talk(1,"enter_battle",g_InfoHeader.."B�n kh�ng d�n theo vi�n binh n�o!");
		return 0;
	end;
	if nPlayerCount + nTeamSize > MAX_TOTAL_PLAYER then
		Talk(1,"",g_InfoHeader.."Nh�n s� trong chi�n tr��ng hi�n �� ��. Xin h�y ��i sau�");
		return 0;
	end;
	if GetCaptainName() ~= GetName() then	--������Ƕӳ�
		Talk(1,"enter_battle",g_InfoHeader.."Ch� c� ��i tr��ng m�i c� t� c�ch n�i chuy�n v�i ta!");
		return 0;
	end;
	if (GCZ_CheckPlayerRight(4,LEAST_STAY_DAY) == 0 or GetTongName() ~= GCZ_GetCampNameFromRelay(nCityMapID,nCamp)) and LIMIT_IGNORE == 0 then
		Talk(1,"enter_battle",g_InfoHeader.."Ng��i ph�i l� "..tCampNameZ[nCamp].." ���ng ch� ho�c tr�n ���ng ch� v� �� nh�n ch�c "..LEAST_STAY_DAY.." ng�y m�i c� th� d�n vi�n binh v�o chi�n tr��ng");
		return 0;
	end;
	local nRoute0Count = GCZ_GetTeamRouteCount(0);
	if nRoute0Count ~= 0 then
		Talk(1,"",g_InfoHeader.."��i c�a ng��i c� <color=red>"..nRoute0Count.."<color> ng��i ch�a gia nh�p m�n ph�i�");
		return 0;
	end;
	local nRfmCount,nNeedTokenCount = GCZ_GetTeamReinforcementCount(nCamp,nBattleMapID);
	local _,_,nRfmInBattleCount = GCZ_GetCampPlayerCount(nCamp,nBattleMapID);
	local nRfmLeft = MAX_REINFORCEMENT - nRfmInBattleCount;	--�ɽ�����Ԯ��
	if nRfmCount > nRfmLeft then
		Talk(1,"",g_InfoHeader.."Ngo�i vi�n c�a ng��i qu� ��ng, Hi�n phe c�a ng��i �� c� <color=yellow>"..nRfmInBattleCount.."<color> ngo�i vi�n v�o chi�n tr��ng, b�y gi� ch� c� th� v�o th�m <color=yellow>"..nRfmLeft.."<color> ng��i n�a th�i!");
		return 0;
	end;
	local nCurTokenCount = GetItemCount(tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4]);
	local szToken = tItemInfo[3][1];
	if nCurTokenCount < nNeedTokenCount then
		Talk(1,"",g_InfoHeader.."<color=yellow>"..szToken.."<color> kh�ng ��! ��i ng��i hi�n c� <color=yellow>"..nNeedTokenCount.."<color> ng��i m�i gia nh�p vi�n binh, c�n c� <color=yellow>"..nNeedTokenCount.."<color> "..szToken..".");
		return 0;
	end;
	if DelItem(tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4],nNeedTokenCount) == 1 then
		transmit_team(nCamp,nBattleMapID);
	end;
end;
--���͵������
function transmit_single_man(nCamp,nBattleMapID)
	GCZ_NewBattleClear();
	CleanInteractive();
	mf_JoinMission(MISSION_ID,nCamp,nBattleMapID);
end;
--����һ�����
function transmit_team(nCamp,nBattleMapID)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local tbPlayer = {};
	for i=1,nTeamSize do
		tbPlayer[i] = GetTeamMember(i)
	end;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		transmit_single_man(nCamp,nBattleMapID);
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function get_award()
	local nWinBag = GetTask(TASK_AWARD_WIN);
	local nLoseBag = GetTask(TASK_AWARD_LOST);
	local selTab = {
				"Ta mu�n l�nh t�t c� ph�n th��ng C�ng th�nh chi�n! (��i bao)/#get_bag(1)",
				"Ta mu�n l�nh t�t c� ph�n th��ng C�ng th�nh chi�n! (ti�u bao)/#get_bag(2)",
				"Quay l�i n�i dung tr��c./main",
				"K�t th�c ��i tho�i/nothing",
				}
--	if tonumber(date("%w")) == 4 then
--		tinsert(selTab, 3, "Ta mu�n nh�n ph�n th��ng Qu�n S�/get_junshi_award");
--	end
	Say(g_InfoHeader.."Ng��i hi�n c�n c� <color=yellow>"..nWinBag.." ph�n th��ng C�ng th�nh chi�n! (��i bao)<color> v� <color=yellow>"..nLoseBag.." ph�n th��ng C�ng th�nh chi�n! (ti�u bao)<color> ch�a l�nh! B�y gi� l�nh ch�?",getn(selTab),selTab);
end;
--ʹ�ü���ƫ�����ķ�ʽ����������������
--���ַ������Դ�������if elseif else�ṹ�����Ǹ��������Ķ�����������������Ķ�����ID
function get_bag(nType)
	local nBagCount = GetTask(TASK_AWARD_WIN+nType-1);
	if gf_JudgeRoomWeight(2,nBagCount) == 0 then
		Talk(1,"",g_InfoHeader.."R��ng ho�c s�c l�c c�a ng��i kh�ng ��! H�y quay l�i sau nh�!");
		return 0;
	end;
	local nItemIndex = 4+nType;	--��Ʒ��tItemInfo�е�����
	if nBagCount <= 0 then
		Talk(1,"get_award",g_InfoHeader.."Ng�i qu�! <color=yellow>"..tItemInfo[nItemIndex][1].."<color> ng��i mu�n l�nh ch� c�n <color=red>0<color>. Ch� nh�ng ai tham gia to�n tr�n C�ng th�nh chi�n m�i ���c nh�n ph�n th��ng");
		return 0;
	end;	
	SetTask(TASK_AWARD_WIN+nType-1,0);
	AddItem(tItemInfo[nItemIndex][2],tItemInfo[nItemIndex][3],tItemInfo[nItemIndex][4],nBagCount);
	WriteLog("[c�ng th�nh C�ng th�nh chi�n]:"..GetName().."�� nh�n "..nBagCount.."c�i"..tItemInfo[nItemIndex][1]);	
end;

function get_junshi_award()
	do return end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say(g_InfoHeader.."Ng��i kh�ng ph�i l� Qu�n S� th�nh th� n�y, kh�ng th� nh�n th��ng ���c.", 0)
		return 0;
	end
	if GetTask(2546) == 0 then
		Say(g_InfoHeader.."Ng��i �� nh�n ph�n th��ng n�y r�i, kh�ng th� nh�n th�m ���c n�a.", 0);
		return 0;
	end
	if gf_JudgeRoomWeight(15, 100) == 0 then
		Talk(1,"",g_InfoHeader.."R��ng ho�c s�c l�c c�a ng��i kh�ng ��! H�y quay l�i sau nh�!");
		return 0;
	end;
	
	local nRetCode, nIndex;
	for i = 1, 8 do
		nRetCode, nIndex = gf_AddItemEx({2,1,1001,1}, "H�a Th� B�ch");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 7 * 24 * 3600);
		end
	end
	nRetCode, nIndex = gf_AddItemEx({2,1,1067,1}, "��nh H�n Thi�n Th�ch Th�n Th�ch");
	if nRetCode == 1 then
		SetItemExpireTime(nIndex, 7 * 24 * 3600);
	end
	for i = 1, 2 do
		nRetCode, nIndex = gf_AddItemEx({2,1,1049,1}, "Bao m�nh Thi�n Th�ch");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 7 * 24 * 3600);
		end
	end
	for i = 1, 2 do
		nRetCode, nIndex = gf_AddItemEx({2,1,1050,1}, "Bao Thi�n Th�ch");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 7 * 24 * 3600);
		end
	end
	gf_AddItemEx({0,107,155,2}, "Ng� H�nh M�t t�ch");
	
	SetTask(2546, 0);
end