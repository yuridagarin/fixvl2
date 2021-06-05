Include("\\settings\\static_script\\kf_newbattles\\head.lua");
Include("\\script\\system_switch_config.lua")

function main()
	if IsKfNewBattleOpen() ~= 1 then
		return 0;
	end
	local _,nCurGs = GetRealmType();
	if nCurGs ~= 1 then
		return 0;
	end
	WriteLog("[NewBattle]:Initialize Sub-Battle");
	SetGlbValue(GLB_VILLAGE,0);	--��������������ս���Ľ�����
	SetGlbValue(GLB_RESOURCE,0);
	SetGlbValue(GLB_EMPLACEMENT,0);
	SetGlbValue(GLB_MAINBATTLE,0);
	if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
		local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
		local nHour = tonumber(date("%H"));
		if nGlobalState == 0 then
			AddGlobalNews("Ph�o ��i Chi�n Li�n Server s�p khai chi�n, m�i c�c v� anh h�ng nhanh ch�ng b�o danh.");
			Msg2Global("Ph�o ��i Chi�n Li�n Server s�p khai chi�n, m�i c�c v� anh h�ng nhanh ch�ng b�o danh.");
			local nOldSubWorld = SubWorld;
			SetGlbValue(GLB_NEW_BATTLESTATE,nHour*10+1);	--��ΪXX1
			if RANDOM_CAMP_PLACE == 1 then
				SetGlbValue(GLB_RANDOM_PLACE_VILL,random(0,1));
				SetGlbValue(GLB_RANDOM_PLACE_RESO,random(0,1));
				SetGlbValue(GLB_RANDOM_PLACE_EMPL,random(0,1));
			end;	
			for i=1,3 do
				SubWorld = SubWorldID2Idx(tBTMSInfo[i][2]);
				if SubWorld >= 0 then
					WriteLog("[NewBattle]:Opening Sub-Battle");
					OpenMission(tBTMSInfo[i][1]);
				else
					WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:"..tostring(tBTMSInfo[i][2])..",SubWorld ID:"..tostring(SubWorld));
				end;
			end;
			SubWorld = nOldSubWorld;
		else
			WriteLog("[NewBattle]:Global state error,value:"..tostring(nGlobalState));
		end;
	end;
end;