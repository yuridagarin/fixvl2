--file name:boy_meet_girl.lua
--author:yanjun
--create date:2006-6-26
--describe:06����Ϧ���ţ��֯Ů�����¼������ű�
Include("\\script\\online\\qixi06\\qixi06_head.lua");

function main()
	if Get_Qixi06_State() == 1 then
		--�������ӵ�ͼ���ɷ�ͬһ������
		local nStarCount1 = GetMapTaskTemp(GALAXY_MAP1,4);
		local nStarCount2 = GetMapTaskTemp(GALAXY_MAP2,4);
		local nStarCount3 = GetMapTaskTemp(GALAXY_MAP3,4);
		local nStarCount = 0;
		local nMapID = 0;
		if type(nStarCount1) == "number" then
			nStarCount = nStarCount1;
			nMapID = GALAXY_MAP1;
		elseif type(nStarCount2) == "number" then
			nStarCount = nStarCount2;
			nMapID = GALAXY_MAP2;	
		elseif type(nStarCount3) == "number" then
			nStarCount = nStarCount3;
			nMapID = GALAXY_MAP3;	
		else
			WriteLog("[L�i ho�t ��ng Th�t T�ch]: Trong files g�c boy_meet_girl.lua kh�ng t�m kh�ng th�y map ch�nh x�c, c� kh� n�ng m�y ch� kh�ng c� map Ng�n H�.");
			return 0;
		end;
		local nDate = tonumber(date("%y%m%d"));
		if nStarCount >= REQUIRE_STAR_COUNT or nDate == 060728 then
			AddLocalNews("Ng�u Lang v� Ch�c N� s� g�p nhau � d�i Ng�n H�, c�c b�n c� th� v�o d�i Ng�n H� �� ch�ng ki�n th�i kh�c c�m ��ng n�y.")
			Msg2SubWorld("Ng�u Lang v� Ch�c N� s� g�p nhau � d�i Ng�n H�, c�c b�n c� th� v�o d�i Ng�n H� �� ch�ng ki�n th�i kh�c c�m ��ng n�y.")		
			create_meeting(nMapID);
		else
			AddLocalNews("��ng ti�c h�m nay �nh sao �m ��m, e r�ng s� kh�ng th�y c�nh Ng�u Lang v� Ch�c N� g�p nhau")
			Msg2SubWorld("��ng ti�c h�m nay �nh sao �m ��m, e r�ng s� kh�ng th�y c�nh Ng�u Lang v� Ch�c N� g�p nhau")		
		end;
	end;
end;

function create_meeting(nMapID)
	SubWorld = SubWorldID2Idx(nMapID);
	if SubWorld > 0 then
		OpenMission(MISSION_ID);
		WriteLog("[Ho�t ��ng Th�t T�ch]: Ng�u Lang �� g�p Ch�c N�, ng�y:"..date("%y%m%d"));
	else
		WriteLog("[L�i ho�t ��ng Th�t T�ch]: Trong h�m s� create_meeting, gi� tr� SubWorld sai, gi� tr� sai:"..SubWorld);
	end;
end;