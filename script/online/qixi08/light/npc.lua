Include("\\script\\online\\qixi08\\light\\light_head.lua");

--��ƶԻ������
function aoyun_light_main()
	local szGameName,nGameID = QX08_GetTodayGame();
	if nGameID ~= GAME_ID_LIGHT then
		Talk(1,"","<color=green>��c s� ��i H�i V� l�m<color>: H�m nay <color=yellow>"..szGameName.."<color>ho�t ��ng b�t ��u, th�t th� v�.");
		return
	end;
	local strtab = {
		"H�i th�p ��n, kh�ng c� g� kh� kh�n c�, h�y th� xem./aoyun_light_try",
		"Quy t�c H�i th�p ��n/aoyun_light_rule",
		"Ta ��n nh�n ph�n th��ng H� R�n R�ng - Vui Ng�p Tr�n/aoyun_light_award",
		"�� ta chu�n b�/nothing"
	};
	Say("<color=green>��c s� ��i H�i V� l�m<color>: N�i giang h�, giang h� � trong tim. �� ch�c m�ng ��i h�i t� v� Thi�n h� �� nh�t, ch�ng t�i ��c bi�t c� h�nh H�i th�p ��n t� v� V� L�m 2 l�n th� nh�t, hoan ngh�nh m�i ng��i tham gia, c�ng ��ng c�ng vui. Ta �� chu�n b� cho m�i ng��i v�i m�n qu�, �o�n tr�ng c� l�y. Th�i gian ho�t ��ng: <color=yellow>m�i ch� nh�t<color> m� ho�t ��ng n�y.",
		getn(strtab),
		strtab)
end

function aoyun_light_try()
	local nHour = tonumber(date("%H"));
	if nHour < 9 or nHour >= 23 then
		Talk(1,"","<color=green>��c s� ��i H�i V� l�m<color>: Th�i gian ho�t ��ng l� <color=yellow>9h s�ng-11h t�i<color>, v� thi�u hi�p n�y mu�n xem gi� ch�nh x�c �.");
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d"));
	local nTeamSize = GetTeamSize();

	if nTeamSize ~= 0 and GetName() ~= GetCaptainName() then
		Talk(1,"","<color=green>��c s� ��i H�i V� l�m<color>: Tham gia H�i th�p ��n c�n ��i tr��ng kh�i ��ng.");
		return
	end
	--������0
	if nTeamSize == 0 or nTeamSize == 1 then 
		if GetTask(TSK_AOYUN_LIGHT_DATE) < nDate then
			SetTask(TSK_AOYUN_LIGHT_AWARD,0);
			SetTask(TSK_AOYUN_LIGHT_NUM,0);
			SetTask(TSK_AOYUN_LIGHT_GUAN,0);
			SetTask(TSK_AOYUN_LIGHT_DATE,nDate);
		end
	else
		local nOldPlayerIndex = PlayerIndex;
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			if GetTask(TSK_AOYUN_LIGHT_DATE) < nDate then
				SetTask(TSK_AOYUN_LIGHT_AWARD,0);
				SetTask(TSK_AOYUN_LIGHT_NUM,0);
				SetTask(TSK_AOYUN_LIGHT_GUAN,0);
				SetTask(TSK_AOYUN_LIGHT_DATE,nDate);
			end			
		end
		PlayerIndex = nOldPlayerIndex;
	end
	if nTeamSize == 0 or nTeamSize == 1 then
		local nLv = GetLevel();
		if nLv <= 30 then
			Talk(1,"","<color=green>��c s� ��i H�i V� l�m<color>: Tham gia H�i th�p ��n c�n tr�n c�p 30.");
			return
		end	
--		if GetItemCount(2,0,1069) < 1 then
--			Talk(1,"","<color=green>���ִ����ʹ<color>���μӵ�ƻ���Ҫ<color=yellow>���µ�һ�������뺯<color>��");
--			return
--		end
	else
		local nOldPlayerIndex = PlayerIndex;
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			local nLv = GetLevel(); 
			if nLv	<= 30 then
				PlayerIndex = nOldPlayerIndex;
				Talk(1,"","<color=green>��c s� ��i H�i V� l�m<color>: Tham gai H�i th�p ��n c�n t�t c� ��i vi�n tr�n c�p 30. ��i ng� c�a b�n �i�u ki�n kh�ng ph� h�p.");
				return
			end			
--			if GetItemCount(2,0,1069) < 1 then
--				local nName = GetName();
--				PlayerIndex = nOldPlayerIndex;
--				Talk(1,"","<color=green>���ִ����ʹ<color>����Ķ����� "..nName.." û��<color=yellow>���µ�һ�������뺯<color>��");
--				return
--			end
		end
		PlayerIndex = nOldPlayerIndex;
	end
	if nTeamSize == 0 or nTeamSize == 1 then
		Say("<color=green>��c s� ��i H�i V� l�m<color>: M�t ng��i s� c� ��n ��y, sao kh�ng r� th�m b�n c�ng ch�i?",
			2,
			"G�i th�m b�n/nothing",
			"��n ��c khi�u chi�n/aoyun_light_go");
	else
		aoyun_light_go();
	end
end

function aoyun_light_go()
	--ɾ����Ʊ
--	local nTeamSize = GetTeamSize();
--	if nTeamSize == 0 or nTeamSize == 1 then	
--		if DelItem(2,0,1069,1) == 1 then
--			aoyun_light_OpenMatch();
--		end
--	else
--		local nOldPlayerIndex = PlayerIndex;
--		for i=1,nTeamSize do
--			PlayerIndex = GetTeamMember(i);
--			DelItem(2,0,1069,1);
--		end
--		PlayerIndex = nOldPlayerIndex;
--		aoyun_light_OpenMatch();
--	end
		aoyun_light_OpenMatch();
end

function aoyun_light_rule()
	Talk(1,"aoyun_light_rule2","<color=green>��c s� ��i H�i V� l�m<color>: H�i th�p ��n ph�n 5 �i, ph�i th�p theo th� t� ���c th�p qua. M� v�o m�i ch� nh�t.\n�i 1: T�ng c�ng 8 ng�n, h� th�ng s� th�p 1 l��t theo th� t� ng�u nhi�n, ghi nh� v� th�p theo th� t� ��.\n�i 2: T�ng c�ng 8 ng�n, h� th�ng s� theo th� t� ng�u nhi�n th�p 8 l�n ��n, ghi nh� v� th�p theo th� t� ��.\n�i 3: T�ng c�ng 12 ng�n, h� th�ng s� th�p 1 l��t theo th� t� ng�u nhi�n, ghi nh� v� th�p theo th� t� ��.")
end

function aoyun_light_rule2()
	Talk(1,"aoyun_light_rule3","<color=green>��c s� ��i H�i V� l�m<color>: \n�i 4: T�ng c�ng 12 ng�n, h� th�ng s� theo th� t� ng�u nhi�n th�p 12 l�n ��n, ghi nh� v� th�p theo th� t� ��.\n�i 5: T�ng c�ng 16 ng�n, h� th�ng s� th�p 1 l��t theo th� t� ng�u nhi�n, ghi nh� v� th�p theo th� t� ��.")
end

function aoyun_light_rule3()
	if IB_VERSION == 0 then
		Talk(1,"aoyun_light_rule4","<color=green>��c s� ��i H�i V� l�m<color>: Ph�n th��ng nh� sau:\n    Ng��i v��t qua 5 �i c� th� nh�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*200w kinh nghi�m, c�n c� th� chuy�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*400w s�c kh�e. Ng��i ch�i c�p 99 t�ng 6 T�i b�o th�ch.\n    Ng��i v��t qua 4 �i c� th� nh�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*100w kinh nghi�m, c�n c� th� chuy�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*400w s�c kh�e. Ng��i ch�i c�p 99 t�ng 5 T�i b�o th�ch.\n    Ng��i v��t qua 3 �i c� th� nh�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*100w kinh nghi�m, c�n c� th� chuy�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*350w s�c kh�e. Ng��i ch�i c�p 99 t�ng 4 T�i b�o th�ch.")
	else
		Talk(1,"aoyun_light_rule5","<color=green>��c s� ��i H�i V� l�m<color>: Ph�n th��ng nh� sau:\n    Ng��i v��t qua 5 �i c� th� nh�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*500w kinh nghi�m, ng��i ch�i c�p 99 t�ng 6 T�i b�o th�ch.\n    Ng��i v��t qua 4 �i c� th� nh�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*420w kinh nghi�m, ng��i ch�i c�p 99 t�ng 5 T�i b�o th�ch.\n    Ng��i v��t qua 3 �i c� th� nh�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*380w kinh nghi�m, ng��i ch�i c�p 99 t�ng 4 T�i b�o th�ch.\n    Ng��i v��t qua 2 �i c� th� nh�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*350w kinh nghi�m, ng��i ch�i c�p 99 t�ng 3 T�i b�o th�ch.\n    Ng��i v��t qua 1 �i c� th� nh�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*300w kinh nghi�m, ng��i ch�i c�p 99 t�ng 2 T�i b�o th�ch.")	
	end
end

function aoyun_light_rule4()
	Talk(1,"aoyun_light_rule5","<color=green>��c s� ��i H�i V� l�m<color>: \n    Ng��i v��t qua 2 �i c� th� nh�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*100w kinh nghi�m, c�n c� th� chuy�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*300w s�c kh�e. Ng��i ch�i c�p 99 t�ng 3 T�i b�o th�ch.\n    Ng��i v��t qua 1 �i c� th� nh�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*100w kinh nghi�m, c�n c� th� chuy�n b�nh ph��ng ��ng c�p/b�nh ph��ng 80*250w s�c kh�e. Ng��i ch�i c�p 99 t�ng 2 T�i b�o th�ch.")
end

function aoyun_light_rule5()
	Talk(1,"aoyun_light_main","<color=green>��c s� ��i H�i V� l�m<color>: N�u v��t 5 �i 10 l�n li�n t�c, khi nh�n ph�n th��ng c� th� nh�n danh hi�u ��c bi�t--'Vua �o�n ��n'! <color=red>Ch� �: Ph�n th��ng tham gia ho�t ��ng h�m �� ph�i nh�n trong ng�y.<color>\n")
end

function aoyun_light_award()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TSK_AOYUN_LIGHT_DATE) < nDate then
		SetTask(TSK_AOYUN_LIGHT_AWARD,0);
		SetTask(TSK_AOYUN_LIGHT_NUM,0);
		SetTask(TSK_AOYUN_LIGHT_GUAN,0);
		SetTask(TSK_AOYUN_LIGHT_DATE,nDate);
	end	
	if GetTask(TSK_AOYUN_LIGHT_AWARD) ~= 0  then
		Talk(1,"","<color=green>��c s� ��i H�i V� l�m<color>: B�n �� nh�n ph�n th��ng tu�n n�y.");
	else
		local nGuan = GetTask(TSK_AOYUN_LIGHT_GUAN);
		local nNum = GetTask(TSK_AOYUN_LIGHT_NUM);
		if nGuan == 0 then
			Talk(1,"","<color=green>��c s� ��i H�i V� l�m<color>: �i 1 ch�a qua, ch� tr�ch kh�ng tr� l�i ���c, h�y th� l�i, qua �i r�i h�y ��n nh�n ph�n th��ng.");
		else
			QX08_GetAward(3,6-nGuan,TSK_AOYUN_LIGHT_AWARD);
		end
	end
end