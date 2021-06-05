Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")

GK_SWITCH = 1

DXG_NPC_NAME = "<color=green> C�n L�n Ph�i V�n Hi H�a: <color>"

function main()
	local tSay = {
		"Gi�i thi�u ��a Huy�n Cung/dxg_info",
		--format("%s/%s","Nhi�m v� ng�y","dxg_daily_task_menu"),
		--"V��t �i th��ng/entry_jingli",
		--"V��t �i Thi�n Ki�u/#entry_tianjiaoling(0)",
		"\nK�t th�c ��i tho�i/nothing",
	}	
	Say(DXG_NPC_NAME.."Kh�ng ng� c�c b�ng h�u v� l�m v� ��n ch�c m�ng ph�i K�n L�n ta m� g�p n�n, ta th�t �y n�y. Nh�t ��nh ph�i c�u h� ra, ti�u di�t Thi�n �m gi�o. \n s� l�u ph�i trong t� ��i c�ng nhi�u gi�i th��ng c�ng t�t.", getn(tSay), tSay);
end

function entry_jingli()
	join_dxg(0)
end
function entry_tianjiaoling(bSure)
	if not bSure or 0 == bSure then
		local tSay = {
				"��ng �/#entry_tianjiaoling(1)",
				"Ta ch� gh� qua th�i/nothing",
				}
			Say(format("D�ng Thi�n Ki�u c�n <color=red>%d c�i %s (C� th� mua trong Ng� C�c)<color> ��ng � kh�ng?",N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4]),getn(tSay),tSay)
		return
	end
	join_dxg(1)
end

function nothing()
end

function dxg_info()
	local tbBody = "��a Huy�n Cung l� c� �i�m ti�n duy�n c�a Thi�n �m Gi�o Th�c S�n Qu�n Phong, c� �i�m n�y l� c� quan v� kh� do Thi�n �m Gi�o thi�t l�p, d�ng �� giam c�m c�c v� l�m nh�n s� v� c�t gi�u c�c b�o v�t v� l�m. \n c�p = c�p 80, th�nh vi�n m�n ph�i trong t� ��i = 3 , �� gia nh�p m�n ph�i 4-8 ng��i h�p th�nh t� ��i, ��i tr��ng b�o danh t�i ch� c�a ta c� th� d�n d�t t� ��i �i v�o c�a �i.";
	local tbSay = {};
	tbSay.msg = DXG_NPC_NAME..tbBody;
	tbSay.sel = {
		{"Ta mu�n t�m hi�u v��t �i nh� th� n�o", "dxg_info1"},
		{"\n Ph�n h�i","main"},
		{"Ra kh�i","nothing"},
	};
	temp_Talk(tbSay);
end

function dxg_info1()
	local tbBody = "��a Huy�n Cung chia th�nh Ti�n �i�n, Trung �i�n v� H�u �i�n. \n Ti�n �i�n do Thi�n �m Ph�p S� ph�ng v�, trong tay �ng ta �i�u khi�n Thi�n Qu�n V�n M�. ��nh b�i Thi�n �m Ph�p S� c� c� h�i nh�n ���c R��ng Thi�n �m Th�nh V�t ho�c Thi�n �m M�t R��ng. N�u nh� ��nh b�i Thi�n Qu�n V�n M� tr��c, chi�n l�i ph�m s� c�ng phong ph� h�n. \n Trung �i�n l� n�i giam gi� c�c v� l�m nh�n s� c�a Thi�n �m Gi�o, c�c ng��i �i v�o Trung �i�n gi�i c�u c�c v� l�m nh�n s� b� giam c�m t�i ��y, c�u c�ng nhi�u v� l�m nh�n s� s� nh�n ���c c�ng hi�u ph�n th��ng, sau khi c�u h�t v� l�m nh�n s�, ��nh b�i Cai Ng�c Thi�n �m s� c� c� h�i nh�n ���c R��ng Thi�n �m Th�nh V�t ho�c Thi�n �m M�t R��ng. \n H�u �i�n l� ��a Huy�n Cung Cung Ch� s� t�i, t��ng truy�n r�ng Cung Ch� d�ng m�nh d� th��ng, c�c ng��i c�n ph�i c�n th�n ��i ph�. ��nh b�i Cung Ch� s� c� c� h�i nh�n ���c R��ng Thi�n �m Th�nh V�t ho�c Thi�n �m M�t R��ng. \n N�u nh� c�m th�y qu� ph�c t�p, c�ng c� th� mua Th�ng Thi�n Minh Gi�o L�u La, tr�c ti�p thay c�c ng��i �i v�o ��i �i�n.";
	tbBody = format("%s\nV��t �i th��ng: M�i th�nh vi�n c�n ti�u hao <color=yellow>%d �i�m tinh l�c<color>\nV��t �i Thi�n Ki�u: ��i tr��ng c�n ti�u hao <color=yellow>%d c�i %s<color>"
		, tbBody, N_JOIN_ENERGY_NEED, N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4])
	local tbSay = {};
	tbSay.msg = DXG_NPC_NAME..tbBody;
	tbSay.sel = {
		{"\n Ph�n h�i","main"},
		{"Ra kh�i","nothing"},
	};
	temp_Talk(tbSay);
end

function join_dxg(bTianJiaolingMode)
	if GK_SWITCH ~= 1 then
		Talk(1, "", DXG_NPC_NAME.."��a Huy�n Cung b�y gi� �ang r�t h�n lo�n, �ang thanh l�c, s� ���c m� trong th�i gian s�p t�i!")
		return
	end
	if GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "", DXG_NPC_NAME.."G�i ��i tr��ng c�a c�c ng��i l�i ��y. �i v�o �i, c�n ph�i <color=yellow> c�p = 80 c�p, m�n ph�i trong t� ��i = 3, ��i ng� ph�i �� = 4, th�nh vi�n ��u �� nh�p ph�i. <color>")
		return
	end
	if check() == 1 and join_consume(bTianJiaolingMode, 0)==1 then
		entry(bTianJiaolingMode);
	end
end

tState = {}
function check()
---����������/��ʷ��
---�ȼ���lv80
---��������
---��ӽ��룬��ӳ�Ա4��
---��������3

	local bResult			= 1;
	local szMsg				= "�i v�o ��a Huy�n Cung th�t b�i.";
	local nMapID			= GetWorldPos();
	local nTeamID			= GetTeamID();

	for i = 1, 1 do
		nRetCode, szRetName	= gf_team_check_gs(nTeamID);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."Kh�ng th� �i v�o ��a Huy�n Cung ( kh�ng c�ng m�t th�nh th� )");
				szMsg = szMsg..szRetName.."Kh�ng th� �i v�o ��a Huy�n Cung ( kh�ng c�ng m�t th�nh th� )";
			end
			break;
		end

		nRetCode, szRetName	= gf_team_check_level(nTeamID, 80, 99);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."Kh�ng th� �i v�o ��a Huy�n Cung ( ��ng c�p kh�ng �� 80 )");
				szMsg = szMsg..szRetName.."Kh�ng th� �i v�o ��a Huy�n Cung ( ��ng c�p kh�ng �� 80 ).";
			end
			break;
		end

		nRetCode, szRetName	= gf_team_check_map(nTeamID, nMapID);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."Kh�ng th� �i v�o ��a Huy�n Cung ( kh�ng c�ng m�t th�nh th� )");
				szMsg = szMsg..szRetName.."Kh�ng th� �i v�o ��a Huy�n Cung ( kh�ng c�ng m�t th�nh th� )";
			end
			break;
		end

		nRetCode, szRetName	= gf_team_check_sleep(nTeamID);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."Kh�ng th� �i v�o ��a Huy�n Cung ( �ang ng� ).");
				szMsg = szMsg..szRetName.."Kh�ng th� �i v�o ��a Huy�n Cung ( �ang ng� say )";
			end
			break;
		end

		nRetCode, szRetName	= gf_team_check_route(nTeamID);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."Kh�ng th� �i v�o ��a Huy�n Cung ( ch�a gia nh�p m�n ph�i ).");
				szMsg = szMsg..szRetName.."Kh�ng th� �i v�o ��a Huy�n Cung ( ch�a gia nh�p m�n ph�i )";
			end
			break;
		end

		nRetCode = gf_team_get_route_count(nTeamID);
		if 3 > nRetCode then
			bResult = 0;
			szMsg = szMsg.."M�n ph�i trong t� ��i kh�ng �� 3 ph�i.";
			break;
		end

		nRetCode = GetTeamSize();
		if 4 > nRetCode then
			bResult = 0;
			szMsg = szMsg.."Nh�n s� t� ��i kh�ng �� 4 ng��i.";
			break;
		end
	end

	if 1 ~= bResult then
		Talk(1, "", DXG_NPC_NAME..szMsg);
	end

	return bResult;
end

function entry(bTianJiaolingMode)
	SendScript2VM("\\script\\missions\\dixuangong\\mission.lua", format("createMission(%d)",bTianJiaolingMode));
end

