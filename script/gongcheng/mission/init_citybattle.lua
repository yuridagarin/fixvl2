--date:2007-4-10
--author:yanjun
--describe:��������սMission
Include("\\script\\gongcheng\\mission\\mission_head.lua");
function main()
	local nWeek = tonumber(date("%w"));
	if nWeek ~= 6 then 	--����6�ſ���
		return 0;
	end;
	if GetGlbValue(GLB_GONGCHENG_FORBIDEN) == 0 then
		for i=2,2 do	--ֻ���ɶ�
			local nMapID = tCityInfo[i][3];
			local nCityName = tCityInfo[i][1];
			local nCityMapID = tCityInfo[i][2];
			local szGong,szShou = GetCityWarAD(nCityMapID);
			if szGong == "" then	--���û�й��Ƿ�
				if SubWorldID2Idx(nMapID) >= 0 then	--ֻ��Ŀ����е�ͼ�����ķ������Ϸ���Ϣ
					if szShou ~= "" then
						Msg2Global("Do "..nCityName.." C�ng th�nh chi�n kh�ng c� phe c�ng"..nCityName.."Th�nh ti�p t�c do "..szShou.." bang h�i chi�m l�nh");
					else
						Msg2Global("Do "..nCityName.." C�ng th�nh chi�n kh�ng c� phe c�ng v� phe th�, v� v�y "..nCityName.." C�ng th�nh chi�n t�m d�ng 1 tr�n");
					end;
				end;
				return 0;
			end;
			if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nMapID) == MS_STATE_IDEL then
				if mf_OpenMission(MISSION_ID,nMapID) == 1 then
					Msg2Global(nCityName.." khu v�c C�ng th�nh chi�n �� c� th� v�o, t� 19h ��n19h30 l� giai �o�n chu�n b�");
				end;
			end;
		end;
	end;
end;