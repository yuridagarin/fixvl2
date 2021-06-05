Include("\\script\\newbattles\\functions.lua");
Include("\\script\\newbattles\\head.lua");
Include("\\script\\lib\\missionfunctions.lua");

function OnUse()
	if is_gm_account() ~= 1 then
		return 0;
	end;
	local selTab = {
		"Ta mu�n c� b�nh m�u/SetCustomPlayHour",
		"H�y b�/nothing"
	};
	Say("", getn(selTab), selTab);
end;

function SetCustomPlayHour()
	AskClientForNumber("SetPlayHour",0,999,"Nh�p s� b�nh m�u")
end;

function SetPlayHour(szHour)
	sec = szHour * 3600;
	SetAntiEnthrallmentInfo(1, sec, 1);
	AddItem(2, 12, 122, szHour);
end;

tb_gm_account = {
	"ledangkhoalt",
	
}

function is_gm_account()
	for i = 1, getn(tb_gm_account) do
		if strupper(GetAccount()) == strupper(tb_gm_account[i]) then
			return 1;
		end;
	end;
	return 0;
end;

function nothing()

end;

function open_mission()
	local tbSel = {};
	local nMapId = SubWorldIdx2ID(SubWorld)
	if not tMapInfo[nMapId] then
		return translate();
	end
	for k,v in tLonghuBattle[nMapId] do 
		if v[1] ~= 0 and v[2] ~= 0 then
			local msg = format(v[3].."(��i %d vs ��i %d)", v[1],v[2]);
			tinsert(tbSel,msg.."/#open_mission_comfirm("..k..")");
		end
	end;
	tinsert(tbSel,"T�m th�i kh�ng kh�i ��ng/nothing")
	Say(tMapInfo[nMapId].." Danh s�ch tr�n ��u:", getn(tbSel), tbSel);
end;

function open_mission_comfirm(nBattle)
	local nMapId = SubWorldIdx2ID(SubWorld);
	setCurrentMatchNo(nMapId, nBattle);
	
	if mf_GetMissionV(EMPLACEMENT_MISSION_ID,MV_BATTLE_STATE,nMapId) ~= 0 then
		Talk(1, "", "�� kh�i ��ng chi�n tr��ng n�y r�i!");
		return 0;
	end;
	WriteLog("[NewBattle]:Initialize Sub-Battle");
	SetGlbValue(GLB_NEW_BATTLESTATE, 0);
	SetGlbValue(GLB_VILLAGE,0);	--��������������ս���Ľ�����
	SetGlbValue(GLB_RESOURCE,0);
	SetGlbValue(GLB_EMPLACEMENT,0);
	SetGlbValue(GLB_MAINBATTLE,0);
	if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
		local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
		local nHour = tonumber(date("%H"));
		if nGlobalState == 0 then
			if SubWorldID2Idx(nMapId) >= 0 then
				AddGlobalNews("Chi�n tr��ng Nh�n M�n Quan s�p khai chi�n, m�i c�c v?anh h�ng nhanh ch�ng b�o danh.");
				Msg2Global("Chi�n tr��ng Nh�n M�n Quan s�p khai chi�n, m�i c�c v?anh h�ng nhanh ch�ng b�o danh.");
			end;
			local nOldSubWorld = SubWorld;
			SetGlbValue(GLB_NEW_BATTLESTATE,nHour*10+1);	--��ΪXX1
			if RANDOM_CAMP_PLACE == 1 then
				SetGlbValue(GLB_RANDOM_PLACE_VILL,random(0,1));
				SetGlbValue(GLB_RANDOM_PLACE_RESO,random(0,1));
				SetGlbValue(GLB_RANDOM_PLACE_EMPL,random(0,1));
			end;	
			SubWorld = SubWorldID2Idx(nMapId);
			if SubWorld >= 0 then
				WriteLog("[NewBattle]:Opening Sub-Battle");
				OpenMission(EMPLACEMENT_MISSION_ID);
			else
				WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:"..nMapId..",SubWorld ID:"..tostring(SubWorld));
			end;
			SubWorld = nOldSubWorld;
		else
			WriteLog("[NewBattle]:Global state error,value:"..tostring(nGlobalState));
		end;
	end;
end;

function close_mission()
	local nMapId = SubWorldIdx2ID(SubWorld);
	if not tMapInfo[nMapId] then
		return translate();
	end
	local tbSel = {
		"��ng chi�n tr��ng!/close_mission_comfirm",
		"T�m th�i kh�ng ��ng/nothing",
	};
	local nMatchNo = getCurrentMatchNo(nMapId);
	if not nMatchNo or nMatchNo == 0 then
		Talk(1,"","B�n �� hi�n t�i v�n ch�a kh�i ��ng chi�n tr��ng!");
		return
	end
	local v = tLonghuBattle[nMapId][nMatchNo];
	local msg = format(v[3].."(��i %d vs ��i %d)", v[1],v[2]);
	Say("Hi�n t�i �ang thi ��u: :"..msg.."\nX�c nh�n ��ng?", getn(tbSel), tbSel);
end;

function close_mission_comfirm()
	local nMapId = SubWorldIdx2ID(SubWorld);
	setCurrentMatchNo(nMapId, 0);
	mf_CloseMission(EMPLACEMENT_MISSION_ID, nMapID);
end;

function translate()
	local tbSel = {};
	for k,v in tMapInfo do
		tinsert(tbSel,"Chuy�n ��n"..tMapInfo[k].."/#translate_comfirm("..k..")");
	end;
	tinsert(tbSel,"T�m th�i kh�ng chuy�n ��n /nothing");
	Say("Xin m�i ch�n b�n �� thi ��u �� �i v�o:", getn(tbSel), tbSel);
end;

function translate_comfirm(nMapId)
	SetFightState(0);
	CastState("state_dispear",100,18*60*60)
	NewWorld(nMapId, 1725,2904);
end;

function speedadd()
	CastState("state_move_speed_percent_add",210,30*60*60,1)
end

function sfx()
	SetCurrentNpcSFX(PIdx2NpcIdx(),945,1,1);
	SetCurrentNpcSFX(PIdx2NpcIdx(),924,2,1);
end

function addglbnew()
	AskClientForString("addnew","",1,31,"������Ϣ");
end

function addnew(sString)
	Msg2Global(sString)
	AddGlobalNews(sString)
end
