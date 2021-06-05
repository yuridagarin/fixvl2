--File name:room.lua
--Describe:������������ű�
--Create Date:2006-4-18
--Author:yanjun
Include("\\script\\class\\mem.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
--========================================================================================
KSRoom = {
--==========��Ա����================
m_MapID = 0,
m_OldSubWorld = 0,
m_SubWorld = 0,--Mission����Ӧ�ĵ�ͼ����
--==========��Ա����=================
--���캯������������Mission����Ӧ�ĳ��ص�
__new = function(self,arg)
	self.m_MapID = arg[1];
	self.m_OldSubWorld = SubWorld;
	local MapID = GetWorldPos();
	if MapID == 100 then
		MapID = 300;
	elseif MapID == 300 then
		MapID = 100;
	end;
	self.m_SubWorld = SubWorldID2Idx(MapID*10+70+arg[1]-1);
end,
--�õ���ǰ��������������
GetPlayerNum = function(self)
	SubWorld = self.m_SubWorld;
	if SubWorld < 0 then
		SubWorld = self.m_OldSubWorld;
		Write_Log("L�i t�m b�n ��","L�i n�y s� l�m server t�m ng�ng v�n h�nh, r�t nguy hi�m, mau t�m nguy�n nh�n! ! ! Tr� h��ng d�n tra c�u ��a ��:"..self.m_SubWorld);
		return 0;
	end;
	local nPlayerNum = GetMSPlayerCount(MISSION_ID,CAMP_PLAYER);
	SubWorld = self.m_OldSubWorld;
	return nPlayerNum;
end,
--������ҽ��볡��
AddPlayer = function(self)
	SubWorld = self.m_SubWorld;
	if SubWorld < 0 then
		SubWorld = self.m_OldSubWorld;
		Write_Log("L�i t�m b�n ��","L�i n�y s� l�m server t�m ng�ng v�n h�nh, r�t nguy hi�m, mau t�m nguy�n nh�n! ! ! Tr� h��ng d�n tra c�u ��a ��:"..self.m_SubWorld);
		return 0;
	end;
	local nPlayerNum = GetMSPlayerCount(MISSION_ID,CAMP_PLAYER)
	if GetMissionV(MV_ROOMSTATE) <= MS_STATE_WAITSIGNUP then
		if GetMissionV(MV_ROOMSTATE) == MS_STATE_IDLE then	--��һ����ȥ
			Msg2Player("Ch�o m�ng b�n v�o tr��ng ��u, xin h�y ��i tuy�n th� kh�c v�o.");
			OpenMission(MISSION_ID);
		elseif nPlayerNum == MAXPLAYER-1 then	--���һ����ȥ
			StopMissionTimer(MISSION_ID,READY_TIMER_ID);
			SetMissionV(MV_TIMELEFT,WAITSTART_TIMER_LOOP);
			SetMissionV(MV_ROOMSTATE,MS_STATE_WAITSTART);
			StartMissionTimer(MISSION_ID,WAITSTART_TIMER_ID,WAITSTART_TIME);
		end;
		SetMissionV(MV_ENTERORDER,GetMissionV(MV_ENTERORDER)+1);
		SetTask(ENTERORDER,GetMissionV(MV_ENTERORDER));	--��¼����˳��
		local MapID = GetWorldPos();
		local MapID = GetWorldPos();
		if MapID == 100 then
			MapID = 300;
		elseif MapID == 300 then
			MapID = 100;
		end;
		CleanInteractive();
		NewWorld(MapID*10+70+self.m_MapID-1,2051,3257);
		JoinMission(MISSION_ID,CAMP_PLAYER);	--ȫ���ӵ���Ӫ2
		SetTask(CURMAP,self.m_MapID);
		Msg2MSAll(MISSION_ID,"Tuy�n th� "..GetName().." �� v�o tr��ng ��u. Hi�n trong tr��ng ��u c� t�t c� "..(nPlayerNum+1).." ng��i");
		if nPlayerNum == MAXPLAYER-1 then
			Msg2MSAll(MISSION_ID,"Th�ng b�o c�c tuy�n th� chu�n b�, 30 gi�y sau ch�nh th�c thi ��u.");
		end;
	end;
	SubWorld = self.m_OldSubWorld;
end,
--�õ���ǰ���ص�״̬
GetRoomState = function(self)
	SubWorld = self.m_SubWorld;
	if SubWorld < 0 then
		SubWorld = self.m_OldSubWorld;
		Write_Log("L�i t�m b�n ��","L�i n�y s� l�m server t�m ng�ng v�n h�nh, r�t nguy hi�m, mau t�m nguy�n nh�n! ! ! Tr� h��ng d�n tra c�u ��a ��:"..self.m_SubWorld);
		return 0;
	end;
	local nState = GetMissionV(MV_ROOMSTATE);
	SubWorld = self.m_OldSubWorld;
	return nState;
end,
--���õ�ǰ���ص�״̬
SetRoomState = function(self,State)
	SubWorld = self.m_SubWorld;
	if SubWorld < 0 then
		SubWorld = self.m_OldSubWorld;
		Write_Log("L�i t�m b�n ��","L�i n�y s� l�m server t�m ng�ng v�n h�nh, r�t nguy hi�m, mau t�m nguy�n nh�n! ! ! Tr� h��ng d�n tra c�u ��a ��:"..self.m_SubWorld);
		return 0;
	end;
	SetMissionV(MV_ROOMSTATE,State);
	SubWorld = self.m_OldSubWorld;
end,

}

function Init_Room()	--ֻҪʹ�õ�KSRoom�ĵط���Ҫ�������ʼ��
	local RoomTab = {};
	for i=1,g_TotalRoomNum do			
		RoomTab[i] = new(KSRoom,i);
	end;
	return RoomTab;
end;