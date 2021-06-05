Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local selTab = {
				"R�i kh�i chi�n tr��ng/ask_reason",
				"K�t th�c ��i tho�i/gf_DoNothing",
				}
	Say("<color=green>bang ch�ng h�u c�n<color>: c�c v� anh h�ng n�n �o�n k�t v�i nhau c�ng kh�ng ngo�i ��ch!",getn(selTab),selTab);
end;

function ask_reason()
	if GetMissionV(MV_TMZ_STATE) == MS_STATE_COMPLETE then
		Talk(1,"","<color=green>bang ch�ng h�u c�n<color>: Thi�n M�n Tr�n �� k�t th�c, h�y ��i h� th�ng chuy�n ra ngo�i.");
		return 0;
	end
	AskClientForString("leave","Nh� nh�ng r�i kh�i...",1,32,"Sao ph�i r�i kh�i?");
end;	

function leave(sLeaveMsg)
	local nCmap = TMZ_GetCamp();
	if GetMissionV(MV_TMZ_STATE) ~= MS_STATE_PEACE then --�ǵȴ��׶��˳�
		SetTask(TASKID_TMZ_JOIN_TIME,GetTime()); --����״̬
	end
	DelMSPlayer(MISSION_ID,nCmap);
	Msg2MSAll(MISSION_ID,GetName().."R�i kh�i �� l�i tin nh�n:"..sLeaveMsg);
end;

function nothing()

end;
