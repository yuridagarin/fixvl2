--file name:star_item.lua
--author:yanjun
--create date:2006-6-26
--describe:06����Ϧ����ǣ���Ʒ���ű�
Include("\\script\\online\\qixi06\\qixi06_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnUse()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(1981) >= nDate then
		Talk(1,"","H�m nay ng��i �� th�p s�ng c�c ng�i sao, m�i ng��i m�i ng�y ch� c� th� th�p s�ng 1 l�n.");
		return 0;
	end;
	local nMapID = GetWorldPos()
	if nMapID ~= GALAXY_MAP1 and nMapID ~= GALAXY_MAP2 and nMapID ~= GALAXY_MAP3 then
		Talk(1,"","B�n ch� c� th� th�p s�ng sao tr�n d�i Ng�n H�");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,10) == 0 then
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
	if DelItem(t7XiItem["star"][2],t7XiItem["star"][3],t7XiItem["star"][4],1) == 1 then
		local nNpcIndex = CreateNpc("Ng��i V� h�nh",sName,GetWorldPos());
		local nTimeLeft = get_time_left();
		SetNpcLifeTime(nNpcIndex,nTimeLeft);
		SetCurrentNpcSFX(nNpcIndex,935,1,1);
		SetTask(1981,nDate);
		local nLevel = GetLevel();
		if nLevel ~= 99 then
			local nExpAward = floor((nLevel^2)/(80^2)*1000000);
			ModifyExp(nExpAward);
			Msg2Player("B�n nh�n ���c "..nExpAward.." �i�m kinh nghi�m");
			WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."Th�p sao nh�n ���c "..nExpAward.." �i�m kinh nghi�m");
		else
			AddItem(2,1,2642,2);
			Msg2Player("B�n nh�n ���c 2 T�i b�o th�ch");
			WriteLog("[Ho�t ��ng Th�t T�ch]:"..GetName().."Th�p sao nh�n ���c 2 T�i b�o th�ch");		
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
