--��ƻ�ʥ��̨npc
--by vivi
--2008/07/21

Include("\\script\\online\\qixi08\\light\\light_head.lua");

function main()
	if GetMissionV(AOYUN_LIGHT_MISSION_STATE) ~= AOYUN_LIGHT_STATE_STARTED then
		Talk(1,"","Th�p ��n ch�a b�t ��u, xin chu�n b�.");
		return
	end
	local nNpcIdx = GetTargetNpc();
	local nNpcName = GetNpcName(nNpcIdx);
	local sPlyLetter = GetMissionS(AOYUN_LIGHT_PLAYER_SEQ);
	local tLetter = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"};
	SetCurrentNpcSFX(nNpcIdx,909,2,0);
	for i=1,getn(tLightNpc) do
		if tLightNpc[i][2] == nNpcName then
			sPlyLetter = sPlyLetter..tLetter[i];
			SetMissionS(AOYUN_LIGHT_PLAYER_SEQ,sPlyLetter);
			Msg2MSAll(AOYUN_LIGHT_MISSION_ID,GetName().." �� th�p ��n "..i..".");
			break;
		end
	end
	if strlen(GetMissionS(AOYUN_LIGHT_PLAYER_SEQ)) >= strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ)) then
		if GetMissionS(AOYUN_LIGHT_PLAYER_SEQ) == GetMissionS(AOYUN_LIGHT_DENG_SEQ) then
			local nGuanType = GetMissionV(AOYUN_LIGHT_GUAN_TYPE);
			aoyun_light_tongguan(nGuanType,1);
			if nGuanType < 5 then
				Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Ch�c m�ng b�n v��t qua �i th� "..nGuanType.." H�i th�p ��n. Sau 20 gi�y b�t ��u �i k� ti�p.");
				SetMissionS(AOYUN_LIGHT_PLAYER_SEQ,"");
				SetMissionV(AOYUN_LIGHT_GUAN_TYPE,GetMissionV(AOYUN_LIGHT_GUAN_TYPE)+1);
				aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_READY);
			else
				Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Ch�c m�ng b�n v��t qua �i th� "..nGuanType.." H�i th�p ��n. Sau 20 gi�y d�n khu thi ��u.");
				aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_ENDING);
			end
		else
			local nGuanType = GetMissionV(AOYUN_LIGHT_GUAN_TYPE);
			aoyun_light_tongguan(nGuanType,0);
			local sSeq = aoyun_light_right_seq(1);
			local sPlySeq = aoyun_light_right_seq(2);
			Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Th�t ��ng ti�c b�n v�n ch�a v��t qua �i n�y. Th� t� ch�nh x�c ph�i l�: "..sSeq);
			Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Th� t� th�p ��n c�a ��i b�n l�: "..sPlySeq);
			Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"K�t th�c th�p ��n, ��i ng� s� chuy�n ra ngo�i �i sau 20 gi�y.");
			aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_ENDING);		
		end		
	end	
end

function aoyun_light_tongguan(nType,nSuc)
	local nTeamSize = GetTeamSize();
	local nOldPIdx = PlayerIndex;
	if nTeamSize == 0 or nTeamSize == 1 then
		if nSuc == 1 then
			if GetTask(TSK_AOYUN_LIGHT_GUAN) <= nType then 
				SetTask(TSK_AOYUN_LIGHT_GUAN,nType);
			end
			if nType == 5 then
				SetTask(TSK_AOYUN_LIGHT_NUM,GetTask(TSK_AOYUN_LIGHT_NUM)+1);
			end
		else
			if GetTask(TSK_AOYUN_LIGHT_NUM) < 10 then --ʮ�κ�Ͳ�����
				SetTask(TSK_AOYUN_LIGHT_NUM,0);
			end
		end
	else	
		for i=1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if nSuc == 1 then
				if GetTask(TSK_AOYUN_LIGHT_GUAN) <= nType then 
					SetTask(TSK_AOYUN_LIGHT_GUAN,nType);
				end
				if nType == 5 then
					SetTask(TSK_AOYUN_LIGHT_NUM,GetTask(TSK_AOYUN_LIGHT_NUM)+1);
				end
			else
				if GetTask(TSK_AOYUN_LIGHT_NUM) < 10 then --ʮ�κ�Ͳ�����
					SetTask(TSK_AOYUN_LIGHT_NUM,0);
				end
			end
		end
	end
	PlayerIndex = nOldPIdx;
end
