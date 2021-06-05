--Create Date:2007��ڶ���
--Describe:�����괺��ѩ�̴����˽ű�������������
--Author:yanjun
Include("\\script\\online\\���ڻ\\snowwar\\snowwar_head.lua");
--==============================================���벿��===================================
function snowwar_enter_main()
        local nDate = tonumber(date("%y%m%d"));
	local strSex = gf_GetPlayerSexName();
	if nDate < 091218 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: M�y h�m nay tuy�t ch�a r�i n�n khu n�m tuy�t ch�a th� m�"..strSex.."l�n sau quay l�i nh�!");
		return 0;
	elseif nDate > 100117 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Xu�n ��n hoa n�, tuy�t b�t ��u tan, e r�ng kh�ng th�c hi�n ���c k� ho�ch r�i."..strSex.."N�m t�i c�c v� nh� ��n ��y ch�i ti�p nh�!");
		return 0;
	end;
	local MapID, nX, nY = GetWorldPos()
	if MapID ~= 300 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>:Khu v�c n�m tuy�t ch� m� � Th�nh ��!");
		return 0;
	end	
	local selTab = {
				"H�y mau ��a ta ��n ��!/go",
				"T�m hi�u ho�t ��ng./SW_KnowSnowWar",
				"Ta �� qua tu�i n�y r�i �!/nothing"
				}
	Say("<color=green>"..g_sNpcName.."<color>: V� "..strSex.."l� n�o kh�ng mu�n nh�n c� h�i ch�i ��a th�a th�ch m�t l�n hay sao?",getn(selTab),selTab)	
end

function go()
	local strSex = gf_GetPlayerSexName();
	local nFieldID = SW_GetFieldIDFromMapID(g_CurMapID);
	if GetPlayerRoute() == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: V� "..strSex.."<color=yellow>gia nh�p m�n ph�i<color> m�i ���c tham gia n�m tuy�t.");
		return 0;
	end;
	if GetLevel() <= 10 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: V� "..strSex.."��i ��n c�p <color=yellow>11<color> r�i h�y quay l�i nh�!");
		return 0;
	end;
	if mf_GetPlayerCount(MISSION_ID,nFieldID) > MAX_PLAYER then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>: S� ng��i v�o khu n�m tuy�t �� ��, xin"..strSex.."��i m�t ch�t nh�!");
		return 0;
	end;
	if SW_CheckEquipment() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: �� cho c�ng b�ng, xin m�i ng��i t�m th�i kh�ng s� d�ng t�t c� Trang B�");
		return 0;
	end;
	if mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nFieldID) == MS_STATE_PEACE then
		--mf_OpenMission(MISSION_ID,nFieldID)
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Th�i gian n�m tuy�t v�n ch�a ��n, m�i ng�y khu n�m tuy�t s� ho�t ��ng v�o c�c gi� 11, 17, v� 21 gi�.");
		return 0;
	end;
	mf_JoinMission(MISSION_ID,0,nFieldID);
end;
--==============================================�뿪����===================================
function snowwar_leave_main()
	local selTab = {
			"Ta mu�n r�i kh�i khu n�m tuy�t/leave",
			"Ta mu�n d�ng �i�m t�ch l�y ��i ph�n th��ng/want_award",
			"Ta mu�n mua tuy�t c�u./buysnowball",
			"Xem �i�m t�ch l�y/see_my_point",
			"Xem s� ng��i b� ta n�m ng�/see_rank",
			"Ta qu�n c�ch ch�i r�i, h�y n�i l�i l�n n�a./SW_KnowSnowWar",
			"Th�t v�t v� cho ng��i!/nothing"
			}
	if GetMissionV(MV_FIELD_STATE) ~= MS_STATE_COMPLETE then
		tremove(selTab,1);
		tremove(selTab,1);
	end;
	Say("<color=green>"..g_sNpcName.."<color>: Ch�i vui kh�ng? C� c�n ta gi�p g� kh�ng?",getn(selTab),selTab)
end;

function see_my_point()
	Talk(1,"main","<color=green>"..g_sNpcName.."<color>: �i�m t�ch l�y c�a b�n hi�n l� <color=yellow>"..GetTask(PT_POINT).."<color>");
end;

function leave()
	local selTab = {
			"R�i kh�i/leave_confirm",
			"Ch�a mu�n r�i kh�i/nothing",
			}
	local sSayContent = "Ch� �, sau khi th�i gian n�m tuy�t k�t th�c. <color=yellow>n�i trong 20 ph�t<color> c� th� ��n g�p <color=yellow>Tuy�t Gi�<color> �� nh�n ph�n th��ng. ��ng l�ng ph� �i�m t�ch l�y. Ng��i mu�n r�i kh�i ch�?";
	if GetMissionV(MV_FIELD_STATE) == MS_STATE_FIGHT then
		sSayContent = "Th�i gian n�m tuy�t k�t th�c, ng��i c� th� d�ng �i�m t�ch l�y n�m tuy�t �� ��i ph�n th��ng. C� mu�n ��i ph�n th��ng kh�ng?";
	end;
	Say("<color=green>"..g_sNpcName.."<color>: "..sSayContent,getn(selTab),selTab);
end;

function leave_confirm()
	DelMSPlayer(MISSION_ID,0);
end

function buysnowball()
	Sale(52)
end

function want_award()
	local selTab = {
			"Ta mu�n ��i ph�n th��ng/get_award",
			"Quay l�i nh�n sau/nothing",
			}
	local nPoint = GetTask(PT_POINT);
	local nExp = 0;
	if nPoint > LIMIT_POINT then
		nPoint = LIMIT_POINT;
	end;
	if nPoint < 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng��i c� t�t c� <color=yellow>"..nPoint.."<color> �i�m. Th�t ��ng ti�c! �i�m t�ch l�y kh�ng �� kh�ng th� nh�n �i�m kinh nghi�m.");
		return 0;
	end;
	nExp = nPoint * 45000;
	Say("<color=green>"..g_sNpcName.."<color>: Ng��i c� t�t c� <color=yellow>"..nPoint.."<color> �i�m t�ch l�y, c� th� ��i <color=yellow>"..nExp.."<color> �i�m kinh nghi�m, ng��i c� mu�n ��i kh�ng?",getn(selTab),selTab);
end;

function get_award()
	local nPoint = GetTask(PT_POINT);
	local nExp = 0;
	if nPoint > LIMIT_POINT then
		nPoint = LIMIT_POINT;
	end;
	if nPoint < 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng��i c� t�t c� <color=yellow>"..nPoint.."<color> �i�m. Th�t ��ng ti�c! �i�m t�ch l�y kh�ng �� kh�ng th� nh�n �i�m kinh nghi�m.");
		return 0;
	end;
	SetTask(PT_POINT,0);
	nExp = nPoint * 45000
	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
	WriteLogEx("Hoat dong thang 12","��i �i�m n�m tuy�t", nExp, "�i�m kinh nghi�m")
end;

function see_rank()
	Talk(1,"main","<color=green>"..g_sNpcName.."<color>: b�n �� n�m ng� <color=yellow>"..GetTask(PT_KILL_COUNT).."<color> ng��i, b� ng�<color=yellow>"..GetTask(PT_DEATH_COUNT).."<color> l�n.");
end;
--=========================================================================================
