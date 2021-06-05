--Create date:2008-1-9 17:37
--Author:yanjun
--Description:���ؿ����˽ű�
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_szInfoHead = "<color=green>Th�n V� Vi�n T� Nghi�p<color>:";

function main()
	local selTab = {
--				"���뿴��ÿ����̨����Щ���ڽ���/know_matches",
				"Ta mu�n thi�t l�p l�i �i�m s� t� v�/reset_point",
				"Ta mu�n r�i kh�i n�i n�y/leave",
				"Kh�ng c� g�/nothing",
				}
--	if GetMaskStatus() == 0 then
--		tinsert(selTab,1,"��Ҫ����/#hide_name(1)");
--	else
--		tinsert(selTab,1,"��Ҫ��ʾ����/#hide_name(0)");
--	end;
	Say(g_szInfoHead.."Sau khi ho�n th�nh t� v�, ng��i ch�i ph�i quay v� server hi�n t�i m�i ���c h� th�ng ��ng k� t�ch �i�m",getn(selTab),selTab);
end;

function know_matches()
	local selTab = {
				"Ta mu�n xem L�i ��i h��ng ��ng/#list_matches(1)",
				"Ta mu�n xem L�i ��i h��ng nam/#list_matches(2)",
				"Ta mu�n xem L�i ��i h��ng t�y/#list_matches(3)",
				"Ta mu�n xem L�i ��i h��ng b�c/#list_matches(4)",
				"Kh�ng c� g�/nothing",
				}
	Say(g_szInfoHead.."Ng��i mu�n xem L�i ��i n�o?",getn(selTab),selTab);
end;

function list_matches(nDirection)
	local nPIdx1,nPIdx2 = 0,0;
	local nState = 0;
	local szString = "";
	local nCityID = 0;
	local nCurMapID = GetWorldPos();
	for i,v in TB_MAPID do
		if v[1] == nCurMapID then
			nCityID = i;
			break;
		end;
	end;
	local szStr = "";
	local szName1,szName2 = "","";
	for i=1,8 do
		nPIdx1,nPIdx2,nState,bAllow = BWT_GetMatchInfo(nCityID,nDirection,i);
		if bAllow == 1 then
			szStr = ", cho ph�p xem ";
		else
			szStr = ", kh�ng cho ph�p xem ";
		end;
		if nPIdx1 == 0 then
			szString = szString.."khu v�c "..i..": hi�n t�i kh�ng c� ng��i t� v�\n";
		elseif nState <= MS_STATE_READY then
			szString = szString.."khu v�c "..i..": hi�n t�i �ang trong giai �o�n chu�n b� t� v� "..szStr.."\n";
		else
			szName1,szName2 = BWT_GetName(nPIdx1),BWT_GetName(nPIdx2);
			szString = szString.."khu v�c "..i..": hai b�n l� ["..szName1.."] v� ["..szName2.."]"..szStr.."\n";
		end;
	end;
	local tbDirection = {"H��ng ��ng","H��ng nam","H��ng T�y","H��ng B�c"};
	Talk(1,"know_matches",g_szInfoHead..tbDirection[nDirection].."T�nh h�nh t� v�:\n"..szString);
end;

function leave()
	if BWDH_DEBUG_VERSION == 1 then
		BWDH_Change_Map(200,1392,2817);
	else
		local selTab = {
					--"Ȫ��/#leave_confirm(100)",
					"Bi�n Kinh/#leave_confirm(200)",
					--"�ɶ�/#leave_confirm(300)",
					"T�m th�i kh�ng r�i kh�i/nothing",
					}
		Say(g_szInfoHead.."Ng��i mu�n �i ��u?",getn(selTab),selTab);
	end;
end;

function leave_confirm(nCityID)
	GLB_BW_LEAVE(nCityID);
end;

function hide_name(nType)
	UseMask(nType,0);
end;

function reset_point()
--	local selTab = {
--		"���÷���(��ձ���ʤ������)����Ҫ100��ң�� /reset_point_1",
--		"���÷���(����ձ���ʤ����)����Ҫ300��ң�� /reset_point_2",
--		"���÷���(�û����ܵǼǷ���)����Ҫ500��ң�� /reset_point_3",
--		"ûʲô��/nothing",
--	}
--	Say(g_szInfoHead.."ȫ�µ����ñ������������԰���ѷ������õ�һ���ϸ߷����Σ��������ֱ��������ǿ��Ķ��֣�׼���ã����ܸ߷ֶ�ǿ�ߵ���սû��",getn(selTab),selTab);
end

function reset_point_1(bConfirm)
--	bConfirm = bConfirm or 0;
--
--	if 1 ~= bConfirm then
--		local selTab = {
--			"��Ҫ���ã���Ҫ100��ң�� /#reset_point_1(1)",
--			"���� /main",
--			"�����Ի� /nothing",
--		};
--		Say(g_szInfoHead.."�÷���Ὣ��ı������ֱ�����õ�320�֣���������㱾�ܵ�ʤ�����Σ������㴫�ر�����<color=yellow>����Ҫ�ص���������ٽ���10�����ϵı���������µǼǷ�����<color>",getn(selTab),selTab);
--		return
--	end
--
--	if 1 == PayXYY(100) then
--		GLB_BW_SetTask(0,3);--ͬ����ң��
--		BWDH_SetTask(TSK_CURREALRESULT,	320);
--		BWDH_SetTask(TSK_CURWEEKMATCH,	0);
--		BWDH_SetTask(TSK_CURWEEKWIN,		0);
--		BWDH_SetTask(TSK_CURWEEKLOSE,	0);
--		GLB_BW_SetTask(0,0,tRelayTask);
--		GLB_BW_LEAVE(200);
--	end

end

function reset_point_2(bConfirm)
--	bConfirm = bConfirm or 0;
--
--	if 1 ~= bConfirm then
--	local selTab = {
--			"��Ҫ���ã���Ҫ300��ң�� /#reset_point_2(1)",
--			"���� /main",
--			"�����Ի� /nothing",
--		};
--		Say(g_szInfoHead.."�÷���Ὣ��ı������ֱ�����õ�320-350�֣���������������㱾�ܵ�ʤ�����θ�5�������Ǽ���ı�����֣����㴫�ر�����",getn(selTab),selTab);
--		return
--	end
--
--	if 1 == PayXYY(300) then
--		GLB_BW_SetTask(0,3);--ͬ����ң��
--		BWDH_SetTask(TSK_CURREALRESULT,	320 + random(0, 30));
--		BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
--		BWDH_SetTask(TSK_CURWEEKMATCH,	GetTask(TSK_CURWEEKMATCH) + 10);
--		BWDH_SetTask(TSK_CURWEEKWIN,		GetTask(TSK_CURWEEKWIN) + 5);
--		BWDH_SetTask(TSK_CURWEEKLOSE,	GetTask(TSK_CURWEEKLOSE) + 5);
--		BWDH_SetTask(TASK_BIWU_WIN_10,	10);
--		BWDH_SetTask(TASK_BIWU_LOSE_10,	0);
--		GLB_BW_SetTask(0,0,tRelayTask);
--		SignUpGestResult();
--		GLB_BW_LEAVE(200);
--	end

end

function reset_point_3(bConfirm)
--	bConfirm = bConfirm or 0;
--
--	if 1 ~= bConfirm then
--	local selTab = {
--			"��Ҫ���ã���Ҫ500��ң�� /#reset_point_3(1)",
--			"���� /main",
--			"�����Ի� /nothing",
--		};
--		Say(g_szInfoHead.."�÷���Ὣ��ı������ֱ�����õ����ܵı���ǼǷ������������㱾�ܵ�ʤ�����θ�5�������Ǽ���ı�����֣����㴫�ر�������ֻ���ڱ��ܲμӹ�10������ǰ�ſ�����ʹ�ø÷�������㱾�����Զ��Ǽ��˱�����֣�������ʹ�ø÷���",getn(selTab),selTab);
--		return
--	end
--
--	if 10 <= GetTask(TSK_CURWEEKMATCH) then
--		Talk(1, "", "�������Ѿ�����10��������ʹ�ø÷���");
--		return
--	end
--
--	if 1 == PayXYY(500) then
--		GLB_BW_SetTask(0,3);--ͬ����ң��
--		BWDH_SetTask(TSK_CURREALRESULT,	GetTask(TSK_CURSIGNEDRESULT));
--		BWDH_SetTask(TSK_CURWEEKMATCH,	GetTask(TSK_CURWEEKMATCH) + 10);
--		BWDH_SetTask(TSK_CURWEEKWIN,		GetTask(TSK_CURWEEKWIN) + 5);
--		BWDH_SetTask(TSK_CURWEEKLOSE,	GetTask(TSK_CURWEEKLOSE) + 5);
--		BWDH_SetTask(TASK_BIWU_WIN_10,	10);
--		BWDH_SetTask(TASK_BIWU_LOSE_10,	0);
--		GLB_BW_SetTask(0,0,tRelayTask);
--		SignUpGestResult();
--		GLB_BW_LEAVE(200);
--	end

end

