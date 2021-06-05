--file name:star_item.lua
--author:yanjun
--create date:2006-6-26
--describe:06����Ϧ����ǣ���Ʒ���ű�
Include("\\script\\online\\qixi08\\star\\head.lua");
Include("\\script\\lib\\globalfunctions.lua")
function OnUse()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TSK_AOYUN_PLANT_STAR) >= nDate then
		Talk(1,"","H�m nay ng��i �� th�p s�ng c�c ng�i sao, m�i ng��i m�i ng�y ch� c� th� th�p s�ng 1 l�n.");
		return 0;
	end;
	local nMapID = GetWorldPos()
	if nMapID ~= GALAXY_MAP1 and nMapID ~= GALAXY_MAP2 and nMapID ~= GALAXY_MAP3 then
		Talk(1,"","B�n ch� c� th� ch�m v�o m�t ng�i sao s�ng tr�n Ng�n H�.");
		return 0;
	end;
	if gf_JudgeRoomWeight(5,20) == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c c�a ng��i kh�ng ��, xin ki�m tra l�i tr��c!");
		return 0;
	end;
	AskClientForString("create_star","",1,14,"H�y nh�p t�n c�a ng�i sao:");
end;

function create_star(sName)
	local nMapID = GetWorldPos();
	local nDate = tonumber(date("%Y%m%d"));
	local nOldPlayerIndex = PlayerIndex;
	local nRandomNum = 0;
	if nMapID ~= GALAXY_MAP1 and nMapID ~= GALAXY_MAP2 and nMapID ~= GALAXY_MAP3 then
		Talk(1,"","B�n ch� c� th� th�p s�ng sao tr�n d�i Ng�n H�");
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	if DelItem(2,0,1071,1) == 1 then
		local nMapID,nMapX,nMapY = GetWorldPos();
		local nNpcIndex = CreateNpc("Ng��i V� h�nh",sName,nMapID,nMapX,nMapY);
		local nTimeLeft = get_time_left();
		SetNpcLifeTime(nNpcIndex,nTimeLeft);
		SetCurrentNpcSFX(nNpcIndex,935,1,1);
		for i=1,7 do	--������һ��Ҫ8����Ч
			nNpcIndex = CreateNpc("Ng��i V� h�nh"," ",nMapID,nMapX,nMapY);
			SetNpcLifeTime(nNpcIndex,nTimeLeft);
			SetCurrentNpcSFX(nNpcIndex,935,1,1);
		end;
		SetTask(TSK_AOYUN_PLANT_STAR,nDate);
		local nLevel = GetLevel();
		local nExpAward = floor((nLevel^2)/(80^2)*2000000);
		if nLevel ~= 99 then
			ModifyExp(nExpAward);
			Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m");
			AddItem(2,1,2642,2);
			Msg2Player("B�n nh�n ���c 2 T�i b�o th�ch");
			WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."Lo�i Tinh Tinh Chi V��ng, nh�n ���c "..nExpAward.." �i�m kinh nghi�m v� 2 T�i b�o th�ch");
		else
			AddItem(2,1,2642,4);
			Msg2Player("B�n nh�n ���c 4 T�i b�o th�ch");
			WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."Tr�ng Tinh Tinh Chi V��ng nh�n ���c 4 T�i b�o th�ch");
		end;
		if GetSex() == 1 then
			AddItem(2,0,352,1);
			Msg2Player("B�n nh�n ���c 1 H�t gi�ng hoa h�ng");
			WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."Tr�ng Tinh Tinh Chi V��ng nh�n ���c 1 H�t gi�ng hoa h�ng");
		end;
		Msg2Player("Sao c�a ng��i �� th�p s�ng, th�i gian t�t hi�n gi� c�n "..tf_GetTimeString(nTimeLeft));
	end;
end;

function get_time_left()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nTimeLeft = (23-nHour)*3600+(59-nMin)*60+(59-nSec)
	return nTimeLeft;
end;
