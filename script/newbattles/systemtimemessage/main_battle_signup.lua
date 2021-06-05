
Include("\\script\\newbattles\\head.lua");
function main()
	local _,nCurGs = GetRealmType();
	if nCurGs ~= 1 then
		return 0;
	end
	WriteLog("[NewBattle]:Initialize Main-Battle");
	if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
		local nHour = tonumber(date("%H"));
		if SubWorldID2Idx(200) >= 0 then
			AddGlobalNews("Th�m m� h�i b�o, Nh�n M�n Quan-chi�n d�ch ch�nh s�p khai chi�n, m�i c�c v� anh h�ng nhanh ch�ng b�o danh.");
			Msg2Global("Th�m m� h�i b�o, Nh�n M�n Quan-chi�n d�ch ch�nh s�p khai chi�n, m�i c�c v� anh h�ng nhanh ch�ng b�o danh.");
		end;
		local nOldSubWorld = SubWorld;
		SetGlbValue(GLB_NEW_BATTLESTATE,nHour*10+3);	--��ΪXX3��ע�⣬�����XX���ܺ͸�ս����XX��һ��Ŷ
		SubWorld = SubWorldID2Idx(tBTMSInfo[MAINBATTLE_ID][2]);
		if RANDOM_CAMP_PLACE == 1 then
			SetGlbValue(GLB_RANDOM_PLACE_MAIN,random(0,1));
		end;
		if SubWorld >= 0 then
			WriteLog("[NewBattle]:Opening Main-Battle");
			OpenMission(tBTMSInfo[MAINBATTLE_ID][1]);
		else
			WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:"..tostring(tBTMSInfo[MAINBATTLE_ID][2])..",SubWorld ID:"..tostring(SubWorld));
		end;
		SubWorld = nOldSubWorld;
	end;
end;