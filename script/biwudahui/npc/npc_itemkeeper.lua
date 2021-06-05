--Create Date:2008-1-11 14:46
--Author:yanjun
--Description:item keeper
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_szInfoHead = "<color=green>Th� kh�<color>:";

function main()
	local selTab = {
				"M� r��ng ch�a ��/open_box",
				--"����ҵ�װ���Ƿ���Ϲ涨/check_equipment",
				}
	local nState = GetMissionV(MV_MISSION_STATE);
	local nGetReadyState = GetMissionV(MV_GET_READY);
	local nOppIdx = BWT_GetOpponentIndex();
--	if nGetReadyState == 0 then
--		tinsert(selTab,3,"��׼������/get_ready");
--	elseif nGetReadyState == nOppIdx then
--		tinsert(selTab,3,"��׼�����ˣ�������׼���ã�/get_ready");
--	end;
--	if GetMaskStatus() == 0 then
--		tinsert(selTab,3,"��Ҫ��������/#hide_name(1)");
--	else
--		tinsert(selTab,3,"��Ҫ����������/#hide_name(0)");
--	end;
	if nState ~= MS_STATE_CHECK_EQUIPMENT then
		while getn(selTab) >= 3 do
			tremove(selTab,3);
		end;
	end;
	tinsert(selTab,"Kh�ng c� g�/nothing");
	Say(g_szInfoHead.."C� c�n gi�p g� kh�ng?",getn(selTab),selTab);
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_szInfoHead.."Ng��i v�n ch�a thu�c v� r��ng c�a m�nh.");
		return 0;
	end;
	OpenBox();
end;

function check_equipment()
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

function hide_name(nType)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState ~= MS_STATE_CHECK_EQUIPMENT then
		return 0;
	end;
	if nType == 1 then
		UseMask(1,0);
	else
		UseMask(0,0);
	end;
end;

function get_ready()
	local nPIdx1 = GetMissionV(MV_PLAYERINDEX1);
	local nPIdx2 = GetMissionV(MV_PLAYERINDEX2);
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState ~= MS_STATE_CHECK_EQUIPMENT then
		return 0;
	end;
	local nRetCode = BWT_CheckEquipment();
	if nRetCode ~= 1 then
		Talk(1,"",g_szInfoHead.."Xin l�i, trang b� c�a b�n kh�ng ph� h�p quy ��nh t� v�, h�y ki�m tra trang b�.");
		return 0;
	end;
	local nGetReadyState = GetMissionV(MV_GET_READY);
	local nOppIdx = BWT_GetOpponentIndex();
	BWT_SetPlayerFightState();	--ֻҪ׼�����˾ͽ���׼��״̬��
	if nGetReadyState ~= 0 then
		BWT_SetPlayerFightState(1,nPIdx1);
		BWT_SetPlayerFightState(2,nPIdx2);
--		Msg2MSAll(MISSION_ID,"װ�����ʱ���������������׼��ʱ�䡣");
		Talk2SomeOne(nPIdx1,1,"","L�u ph�i ��i th� l� <color=yellow>"..BWT_GetPlayerRouteName(nPIdx2).."<color>. Ti�p theo l� th�i gian chu�n b�.");
		Talk2SomeOne(nPIdx2,1,"","L�u ph�i ��i th� l� <color=yellow>"..BWT_GetPlayerRouteName(nPIdx1).."<color>. Ti�p theo l� th�i gian chu�n b�.");
		Msg2SomeOne(nPIdx1,"L�u ph�i ��i th� l� :"..BWT_GetPlayerRouteName(nPIdx2)..". Ti�p theo l� th�i gian chu�n b�.");
		Msg2SomeOne(nPIdx2,"L�u ph�i ��i th� l� :"..BWT_GetPlayerRouteName(nPIdx1)..". Ti�p theo l� th�i gian chu�n b�.");
		BWT_ChangeMSState(MS_STATE_READY);
	else
		SetMissionV(MV_GET_READY,PlayerIndex);
		Talk(1,"",g_szInfoHead.."��i ��i th� ch�n b� ho�n t�t.");
		Msg2SomeOne(nOppIdx,"��i th� �� chu�n b� xong")
	end;
end;
