--���ߣ��Ͼ�
--�������ڣ�07��11��13��14:50
--�������ӽű�
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
g_szInforHeader = "<color=green>Ti�p d�n �� t�<color>: ";

function main()
	local nPlayerState = GetMissionV(MV_MISSION_STATE);
	local nDiff = BR_GetCurDiff();
	local nStage = BR_GetCurStage();
	local selTab = {
				"M� r��ng ch�a ��/open_box",
				"Xem trang b� hi�n t�i c� th� v�o �i k� ti�p hay kh�ng /#check_equipment("..nDiff..","..nStage..")",
				"Xem h�n ch� khi�u chi�n/BR_KnowLimit",
				"\nB�t ��u v��t �i/start_stage",
				"Ta mu�n r�i kh�i m�t th�t/leave_stage",
				}
	local szSay = "";
	if nPlayerState == MS_STATE_END_WAITING then
		tremove(selTab,1);
		tremove(selTab,1);
		tremove(selTab,1);
		tremove(selTab,1);
		szSay = "B�n mu�n r�i kh�i n�i v��t �i ph�i kh�ng?";
	else
		szSay = "B�n s�p v�o <color=yellow>"..TB_DIFF_NAME[nDiff].."<color> �i <color=yellow>"..nStage.." <color>."
	end;
	if DEBUG_VERSION == 1 and nPlayerState == MS_STATE_STARTED then
		tinsert(selTab,"V�o �i k� ti�p (th� luy�n)/next_stage");
	end;
	tinsert(selTab,"Kh�ng c� g�/nothing");
	Say(g_szInforHeader..szSay,getn(selTab),selTab);
end;

function next_stage()
	BR_EndStage();
end;

function leave_stage()
	local selTab = {
				"��ng! Ta mu�n r�i kh�i/leave_confirm",
				"Ta mu�n ti�p t�c � l�i ��y/nothing",
				}
	Say(g_szInforHeader.."B�n mu�n r�i kh�i m�t th�t?",getn(selTab),selTab);				
end;

function start_stage()
	local nDiff,nStage = 0,0;
	nDiff = BR_GetCurDiff();
	nStage = BR_GetCurStage();
	if BR_EnterNextStageCheck(nDiff,nStage) == 0 then
		Say("Tr�ng th�i hi�n t�i c�a b�n kh�ng �� �i�u ki�n �� v�o �i, xin h�y ki�m tra gi�i h�n v��t �i.",0)
		return 0;
	end;
	local nPlayerState = GetMissionV(MV_MISSION_STATE);
	if nPlayerState == MS_STATE_READY or DEBUG_VERSION == 1 then
		BR_NextStage();
	end;
end;

function leave_confirm()
	local nPlayerState = GetMissionV(MV_MISSION_STATE);
	if nPlayerState == MS_STATE_END_WAITING then

	end;
	BR_CloseStage();
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_szInforHeader.."Ng��i v�n ch�a thu�c v� r��ng c�a m�nh.");
		return 0;
	end;
	OpenBox();
end;

function check_equipment(nDiff,nStage)
	if BR_EnterNextStageCheck(nDiff,nStage) == 0 then
		Say("Tr�ng th�i hi�n t�i c�a b�n kh�ng �� �i�u ki�n �� v�o �i, xin h�y ki�m tra gi�i h�n v��t �i.",0)
	else
		Say("Tr�ng th�i hi�n t�i c�a b�n kh�ng �� �i�u ki�n �� v�o �i.",0);
	end;
end;
