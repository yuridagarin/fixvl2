--function main()
--	Talk(1,"","<color=green>��̨�ϰ�<color>����·Ӣ�ۺú�������������ڸ�̨�ӣ������Ǯ���ǻ���ӵľ�����ˣ��·������̨��������ľ���������ţ������˳���")
--end;

Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\task\\world\\task_head.lua");--�����ַ�������֧��
Include("\\script\\lib\\offline_head.lua");
Include("\\script\\missions\\bw\\siege\\siege_arena_mission.lua")

function main()
	do
		Talk(1,"","L�i ��i hi�n t�i ch�a m�!");
		return
	end
    --���÷��ص�
    if IsFreeze() == 1 then  --�����WG����
        Talk(1,"","<color=yellow>Kh�ng th� v�o l�i ��i! T�i kho�n n�y �ang b� x� l�! <color>");
        return
    end;
	
	x,y,z = GetWorldPos();
	SetTask(MS_POS, x);
	SetTask(MS_POS+1, y);
	SetTask(MS_POS+2, z);
	
	if x == 150 then    --����
	    Talk(1,"","Tri�u ��nh �ang t� ch�c v� l�m ��i h�i � n�i n�y! Anh h�ng h�o ki�t xin ch� b� qua!");
	    return
	elseif x == 350 then    -- ����
	    Talk(1,"","Tri�u ��nh �ang t� ch�c v� l�m ��i h�i � n�i n�y! Anh h�ng h�o ki�t xin ch� b� qua!");
	    return
	end;
	
	if (GetTaskTemp(JOINROOMINDEX)>0) then
	    OnChanceRoom(GetTaskTemp(JOINROOMINDEX));
	    return
	end;
	
	--��ѯ��Ч���ضԻ�
	SelectGameStyle()
	
end

function SelectGameStyle()

local strSelect = {
	"L�i ��i li�n ��u s� m�n (c� nh�n)/#SearchValidRoom(1)",
	"Li�n quan L�i ��i th� luy�n s� m�n/AboutShiMenGame",
	"R�i kh�i/OnCancel_Talk"
	};
	
	Say("L�i ��i l� n�i anh h�ng h�o h�n t� th� v� c�ng. Nay ���c s� t�n nhi�m c�a c�c m�n ph�i d�ng l�n <color=yellow>l�i ��i s� m�n<color>. Xin ch�n h�nh th�c t� v�:",
		getn(strSelect),
		strSelect
		);

end

function SearchValidRoom(nType)

local nMapId = GetWorldPos();

	--ѡ�� ���˵�����̨ ����
	if nType == 1 then
		local room_num = 0;
    local room_tab = {}
    local szSay = "";
    
    for index, value in MapTab do
        room_tab[index] = 0
        if nMapId == value[2] then
    	    idx = SubWorldID2Idx(value[1]);
    	    if (idx~=-1) then
                room_num = room_num+1;
                room_tab[index] = 1;
    	    end;
    	end;
    end;

    if room_num > 0 and room_num <= MAX_ROOM_COUNT then
        szSay = "Say("..format("%q","��y l� l�i ��i ��n ��u c� nh�n, hi�n t�i c� t�ng c�ng "..room_num.." tr�n ��a. C�c h� h�y ch�n tr�n ��a mu�n v�o!<color=yellow>");
        szSay = szSay..","..(room_num+1);   --Ϊ�������ϵ��˳�ѡ��
        for index, value in room_tab do
            if value == 1 then
                szSay = szSay..","..format("%q", MapTab[index][3].."/#OnChanceRoom("..index..")");
            end;
        end;
        szSay = szSay..","..format("%q", "R�i kh�i/OnCancel_Talk")..")";
        dostring(szSay);
    elseif room_num > MAX_ROOM_COUNT then
        ErrorMsg(12);
    else
        ErrorMsg(2);
    end
    return
   end

	--ѡ�� ��ӵ�����̨ ����
	if nType == 2 then
		local room_num = 0;
    local room_tab = {}
    local szSay = "";
    local nMapIdx = 0;
    local nMapState = 0;
    local nCaptainName_1 = "";
    local nCaptainName_2 = "";
    local nTeamSize_1 = 0;
    local nTeamSize_2 = 0;
    local nPlayerMSIndex = 0;
    local nCamp = 0;
    
    for i=1,getn(SingleTeamMapTab) do
      room_tab[i] = 0;
      if nMapId == SingleTeamMapTab[i][2] then
    	  nMapIdx = SubWorldID2Idx(SingleTeamMapTab[i][1]);
    	  if nMapIdx ~= -1 then
          room_num = room_num+1;
          room_tab[i] = 1;
    	  end
    	end
    end
    
    szSay = "Say("..format("%q","N�i ��y c� t� ��i ��i chi�n l�i ��i gi�a <color=yellow>2 ��i ng�<color> th� luy�n t� v�. Ch� c�n ��i ng� c� <color=yellow>2 ng��i tr� l�n<color> do <color=yellow>��i tr��ng b�o danh<color> l� c� th� tham gia. Hi�n t�i m� t�ng c�ng <color=yellow>"..room_num.." tr�n ��a<color> cho c�c giang h� hi�p kh�ch t� th�. C�c h� h�y ch�n tr�n ��a mu�n v�o!");
    szSay = szSay..","..(room_num+1);   --Ϊ�������ϵ��˳�ѡ��
    
    for i=1,getn(room_tab) do
   		if room_tab[i] == 1 then
   			OldWorld = SubWorld;
   			SubWorld = SubWorldID2Idx(SingleTeamMapTab[i][1]);
   			if SubWorld ~= -1 then
   				nMapState = GetMissionV(TEAM_GAME_STATE);
   				--����û����
   				if nMapState == 0 then
   					szSay = szSay..","..format("%q", SingleTeamMapTab[i][3].."(Tr�ng th�i: b� tr�ng)/#OpenSingleTeamRoomRequest("..i..")");
   				elseif nMapState == 1 then	
   					--������֧����
   					if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
   						OldPlayer = PlayerIndex;				
   						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
   						if PlayerIndex > 0 then
   							nCaptainName_1 = gf_GetCaptainName();
   							nTeamSize_1 = gf_GetTeamSize();
   						end
   						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
   						if PlayerIndex > 0 then
   							nCaptainName_2 = gf_GetCaptainName();
   							nTeamSize_2 = gf_GetTeamSize();
   						end
   						PlayerIndex = OldPlayer;
   						szSay = szSay..","..format("%q", SingleTeamMapTab[i][3].."(Tr�ng th�i: ��i khai chi�n, hai phe ��i chi�n l� ��i "..nCaptainName_1.." v� ��i "..nCaptainName_2.." )/#OpenSingleTeamRoom("..i..")");
   					--����һ֧���飬�ȴ������������
   					elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
   						if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 then
   							nCamp = 1;
   						else
   							nCamp = 2;
   						end
   						OldPlayer = PlayerIndex;
   						nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,nCamp);
   						if PlayerIndex > 0 then
   							nCaptainName_1 = gf_GetCaptainName();
   							nTeamSize_1 = gf_GetTeamSize();
   						end
   						PlayerIndex = OldPlayer;
   						szSay = szSay..","..format("%q", SingleTeamMapTab[i][3].."(Tr�ng th�i: ��i thi ��u, tin t�c ��i ng�:"..nCaptainName_1..", c� "..nTeamSize_1.." ng��i.)/#OpenSingleTeamRoom("..i..")");
   					end
   				--�����Ѿ���ʼ
   				elseif nMapState == 2 then
   					OldPlayer = PlayerIndex;
   					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
   					if PlayerIndex > 0 then
   						nCaptainName_1 = gf_GetCaptainName();
   						nTeamSize_1 = gf_GetTeamSize();
   					end
   					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
   					if PlayerIndex > 0 then
   						nCaptainName_2 = gf_GetCaptainName();
   						nTeamSize_2 = gf_GetTeamSize();
   					end
   					PlayerIndex = OldPlayer;
   					szSay = szSay..","..format("%q", SingleTeamMapTab[i][3].."(Tr�ng th�i: �ang thi ��u, hai phe ��i chi�n l� ��i "..nCaptainName_1.." v� ��i "..nCaptainName_2.." )/#OpenSingleTeamRoom("..i..")");
   				elseif nMapState == 3 then
   					szSay = szSay..","..format("%q", SingleTeamMapTab[i][3].."(Tr�ng th�i: Thi ��u k�t th�c)/#GameOverTalk");
   				end
   			end   			
   			SubWorld = OldWorld;	   					
   		end 			
   	end
   	szSay = szSay..","..format("%q", "R�i kh�i/OnCancel_Talk")..")";
   	dostring(szSay);
		return
	end
	
	--ѡ�� ���˻�ս��̨ ����
	if nType == 3 then
		local multi_room_num = 0;
    local multi_room_tab = {};--��������ͼ������MultiMapTab��index��λ��
    local i=0;
    local j=1;
    local nRandomNum = 0;
    local multiroom_book_tab = {};--��������ͼ������Ԥ��������MultiMapTab��index��λ��
    local multiroom_nobook_tab = {};--�����õ�MultiMapTab��index��λ��
    local nMapBookState = 0;
    local nFighterNum = 0;
    local nAudienceNum = 0;
    local nMapState = 0;
    local lacknum = 0;
    local hundred_room_tab = {};
    local szSay = "";
    local room_num = 0;
    
    --��ȡ������̨��������
    for i=1,getn(MultiMapTab) do
    	if MultiMapTab[i][2] == nMapId then
    		multi_room_tab[j] = i
    		j=j+1
    		multi_room_num = multi_room_num + 1
    	end
    end
     
    --�жϵ�ǰ������̨����״̬		
    for i=1,multi_room_num do
    	OldSubWorld = SubWorld;
    	SubWorld = SubWorldID2Idx(MultiMapTab[multi_room_tab[i]][1]);
    	
    	if SubWorld <= 0 then
				WriteLog("[Qu�n h�ng chi�n]T�nh h�nh ��u tr��ng hi�n t�i SubWorld b�o l�i, b�o l�i nMapIndex l�"..MultiMapTab[multi_room_tab[i]][1]..", SubWorld l�"..SubWorld..".");
				SubWorld = OldWorld;
				return 0
			end
    	
    	nMapBookState = GetMissionV(MULTIMAP_STATE)
    	
    	--���Ѿ������õĳ��ؽ��д���
    	if nMapBookState == 0 then
    		tinsert(multiroom_nobook_tab,multi_room_tab[i])
    	end
    	
    	--���Ѿ���Ԥ���ĳ��ؽ��д���
    	if nMapBookState >= 1 then
    		tinsert(multiroom_book_tab,multi_room_tab[i]);
    	end
    	
    	SubWorld = OldSubWorld;
    end
    
    if getn(multiroom_book_tab) > MAX_MULTIMAP_NUM then			--�Ѿ�Ԥ���ĳ���������Ŀǰ���Ŷ�����̨������
    	Msg2Player("S� tr�n ��a ��nh tr��c nhi�u h�n s� tr�n ��a Qu�n h�ng chi�n hi�n m�.")
    else --�Ѿ�Ԥ���ĳ��������ڵ���Ŀǰ���Ŷ�����̨������
    	lacknum = MAX_MULTIMAP_NUM - getn(multiroom_book_tab);
    	for i=1,lacknum do
    		nRandomNum = random(1,getn(multiroom_nobook_tab));
    		tinsert(multiroom_book_tab,multiroom_nobook_tab[nRandomNum]);
    		tremove(multiroom_nobook_tab,nRandomNum);
    	end
    end

    szSay = "Say("..format("%q","G�n ��y ���c �ng ch� ��i Tuy�n Ch�u t��ng tr� m� l�i ��i th� luy�n ��n nh�n h�n chi�n. Ngo�i ra, m�i ng�y �ng ch� ��i b� ti�n t�i tr� m� <color=yellow>Qu�n h�ng chi�n<color> � <color=yellow>Th�nh ��<color> v�o <color=yellow>11:00<color>, <color=yellow>11:30<color>, <color=yellow>17:00<color>, <color=yellow>17:30<color>, <color=yellow>21:00<color> v� <color=yellow>21:30<color>. C�c anh h�ng tham gia thi ��u tr�n th� 1 ��u nh�n ���c ph�n th��ng nh�t ��nh (m�i ng�y ch� nh�n 1 l�n); Ph� v�o tr�n � tr�n th� 2 l� 2 l��ng, ng��i chi�n th�ng s� nh�n ���c ph�n th��ng ti�n phong ph�!");
		szSay = szSay..","..2;--Ϊ�������ϵ��˳�ѡ��                        

   	for i=1,getn(multiroom_book_tab) do
    	OldSubWorld = SubWorld;
    	SubWorld = SubWorldID2Idx(MultiMapTab[multiroom_book_tab[i]][1]);
    	
    	if SubWorld <= 0 then
					WriteLog("[Qu�n h�ng chi�n]Th�ng th��ng, khi ��i tho�i Qu�n h�ng chi�n, c�a s� t�y ch�n SubWorld b�o l�i, b�o l�i nMapIndex l�"..MultiMapTab[multiroom_book_tab[i]][1]..", SubWorld l�"..SubWorld..".");
					SubWorld = OldSubWorld;
					return 0
			end
    
    	nFighterNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
    	nAudienceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
    	nMapState = GetMissionV(MULTIMAP_STATE);

    	if nMapState == 0 then
    		szSay = szSay..","..format("%q", MultiMapTab[multiroom_book_tab[i]][3].."(Tr�ng th�i hi�n t�i: Ch�a thi ��u)/#RequestGame("..multiroom_book_tab[i]..")");
    	elseif nMapState == 1 then
    		szSay = szSay..","..format("%q", MultiMapTab[multiroom_book_tab[i]][3].."(Tr�ng th�i hi�n t�i: Ch�a khai tr�n. S� ng��i tham d�:"..nFighterNum.." :"..MAX_MULTIMAP_FIGTHER_NUM.." S� kh�n gi�:"..nAudienceNum..":"..MAX_MULTIMAP_AUDIENCE_NUM..")/#RequestGame("..multiroom_book_tab[i]..")");
    	elseif nMapState >= 2 then
    		szSay = szSay..","..format("%q", MultiMapTab[multiroom_book_tab[i]][3].."(Tr�ng th�i hi�n t�i: �ang ti�n h�nh thi ��u)/#RequestGame("..multiroom_book_tab[i]..")");
    	end
    		SubWorld = OldSubWorld 
    end
 
    szSay = szSay..","..format("%q", "R�i kh�i/OnCancel_Talk")..")";
    dostring(szSay);
		return
	end
	
	--ѡ�� ��ӻ�ս��̨ ����
	if nType == 4 then
		local nTeamNum = 0;		
		local szSay = "Say("..format("%q","G�n ��y ���c �ng ch� ��i Tuy�n Ch�u t��ng tr� m� l�i ��i th� luy�n ��n nh�n h�n chi�n. Ngo�i ra, m�i ng�y �ng ch� ��i b� ti�n t�i tr� m� <color=yellow>��i chi�n<color> � <color=yellow>Th�nh ��<color> v�o <color=yellow>12:00<color>, <color=yellow>12:30<color>, <color=yellow>18:00<color>, <color=yellow>18:30<color>, <color=yellow>23:00<color> v� <color=yellow>23:30<color>. C�c anh h�ng tham gia thi ��u tr�n th� 1 ��u nh�n ���c ph�n th��ng nh�t ��nh (m�i ng�y ch� nh�n 1 l�n); Ph� v�o tr�n � tr�n th� 2 l� 10 l��ng, ng��i chi�n th�ng s� nh�n ���c ph�n th��ng ti�n phong ph�!"); 
			szSay = szSay..","..2;--Ϊ�������ϵ��˳�ѡ��  
		 	for i=1,getn(TeamMapTab) do
     		if GetWorldPos() == TeamMapTab[i][2] then
     			OldSubWorld = SubWorld;
     			SubWorld = SubWorldID2Idx(TeamMapTab[i][1]);
     			if SubWorld > 0 then
     				if GetMissionV(TEAM_GAME_STATE) == 0 then
     					szSay = szSay..","..format("%q","Tr�n ��a t� ��i h�n chi�n (Tr�ng th�i hi�n t�i: B� tr�ng)/#RequestTeamGame("..i..")");
     				elseif GetMissionV(TEAM_GAME_STATE) == 1 then
     					nTeamNum = GetGameTeamNum();
     					szSay = szSay..","..format("%q","Tr�n ��a t� ��i h�n chi�n (Tr�ng th�i hi�n t�i: Ch�a khai tr�n. ��i ng� tham d�:"..nTeamNum.." :"..MAX_TEAM_NUM..")/#RequestTeamGame("..i..")");
     				elseif GetMissionV(TEAM_GAME_STATE) > 1 then
     					szSay = szSay..","..format("%q","Tr�n ��a t� ��i h�n chi�n(Tr�ng th�i hi�n t�i: �ang ti�n h�nh thi ��u)/#RequestTeamGame("..i..")");
     				end
     			end
     			SubWorld = OldSubWorld;
     		end
     	end	
     		
     	szSay = szSay..","..format("%q", "R�i kh�i/OnCancel_Talk")..")";
     	dostring(szSay);
		return
	end

end

function OnChanceRoom(index)
    if (GetTaskTemp(JOINROOMINDEX)>0 and GetTaskTemp(JOINROOMINDEX)~=index) then
        Say("Ng��i �� ��t tr�n ��a "..GetTaskTemp(JOINROOMINDEX)..", h�y ch�n v�o tr�n ��a �� ��t!",0);
    else
        SetTaskTemp(JOINROOMINDEX,index);
        OldSubWorld = SubWorld;
	    SubWorld = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	    ms_state = GetMissionV(MS_STATE);
	    if (ms_state <= 0) then
		    Say("N�i ��y l� ��u tr��ng ��n ��u l�i ��i cho c�c Nh�n s� giang h� tham gia ��n ��u t� th�. Hi�n ch�a c� ��u th� n�o ��ng k� thi ��u, c�c h� c� h�ng th� kh�ng? <color=yellow>Tr�n ��n ��u l�i ��i hi�n m� mi�n ph�, h�y ch�p l�y th�i c�!", 3, "���c/OnRegister", "Quy t�c t� v� l� g�?/OnHelp", "�� ta chu�n b� th�m/OnCancel");
	    elseif (ms_state == 1) then
		    OnReady();
	    elseif (ms_state == 2) then
		    OnFighting();
		  ----------------------------------------��������������-----------------------------
	    else
	        OldPlayer = PlayerIndex;
	        for i = 1, 2 do
		        PlayerIndex = gf_GetTeamMember(i);
			    SetTaskTemp(JOINROOMINDEX,0);
	        end;
	        PlayerIndex = OldPlayer;
		    ErrorMsg(2)
	    end;
    	
	    SubWorld = OldSubWorld;
    end;
end

function OnHelp()
    SetTaskTemp(JOINROOMINDEX,0);
	Talk(7, "",	"��n ��u l�i ��i l� n�i c�c ��i hi�p cao th� tr�n giang h� t� th� v� ngh�, ph�n t�i cao th�p. L�i ��i l� tr�n ��a thi ��u c�ng b�ng cho hai phe tham d�!",	"Mu�n ti�n h�nh tr�n t� v� l�i ��i c�n ��n ��ng k� thi ��u v�i ta!",	"Sau khi hai phe tham d� t� ��i, ��i tr��ng ��n b�o danh xin tham gia thi ��u!",	"Do tr�n ��a h�n h�p, khi m�t l�i ��i n�o �� �ang ti�n h�nh thi ��u th� l�i ��i kh�ng ti�p nh�n b�o danh!",	"B�o danh th�nh c�ng, hai phe b�t ��u chu�n b� thi ��u. Th�i gian v�o tr�n c�a hai phe l� 3 ph�t. Trong v�ng 3 ph�t, c�c ��u th� ph�i kh�n tr��ng v�o ��u tr��ng ti�n h�nh thi ��u!" , 	"Th�i gian thi ��u l� 10ph�t. Trong 10 ph�t, hai phe ch�a ph�n th�ng b�i s� ���c x� h�a!",	"Trong l�c thi ��u, b�t k� b�n n�o b� r�t m�ng ho�c v� th�nh s� b� x� b�i!");
end;

function OnRegister()
--����
	if (gf_GetTeamSize()  ~= 2) then
		ErrorMsg(1)
		SetTaskTemp(JOINROOMINDEX,0);
		return
	else
		if (PlayerIndex ~= gf_GetTeamMember(0)) then --GetName() == gf_GetCaptainName()
			ErrorMsg(5)
			SetTaskTemp(JOINROOMINDEX,0);
			return
		end;
	end;
	
	OldPlayer = PlayerIndex;
	for i = 1, 2 do
		PlayerIndex = gf_GetTeamMember(i);
		CleanInteractive();
	    if (GetPlayerRoute() == 0) then
		    PlayerIndex = gf_GetTeamMember(0);
			SetTaskTemp(JOINROOMINDEX,0);
	        PlayerIndex = OldPlayer;
			ErrorMsg(10);
	        return
	    end;
	    if (GetTaskTemp(JOINROOMINDEX) ~= 0 and PlayerIndex~=gf_GetTeamMember(0)) then
		    PlayerIndex = gf_GetTeamMember(0);
			SetTaskTemp(JOINROOMINDEX,0);
	        PlayerIndex = OldPlayer;
			ErrorMsg(11);
	        return
	    end;
	end;
	PlayerIndex = OldPlayer;
	
--	AskClientForNumber("SignUpFinal", 100000, 99999999, "�������ע���:");
    SignUpFinal();
end;

function SignUpFinal(V)
	x = GetTask(MS_POS);
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	ms_state = GetMissionV(MS_STATE);
	SubWorld = OldSubWorld;

	if (ms_state > 0) then 
		ErrorMsg(8);
		SetTaskTemp(JOINROOMINDEX,0);
		return
	end;
	
	local ChoiceRoom = GetTaskTemp(JOINROOMINDEX);
	OldPlayer = PlayerIndex;
	for i = 1, 2 do
		PlayerIndex = gf_GetTeamMember(i);
		SetMissionS(i, GetName());
		if (PlayerIndex ~= gf_GetTeamMember(0)) then
		    SetTaskTemp(JOINROOMINDEX,ChoiceRoom)
		end;
--		if (GetCash() < V) then 
--			PlayerIndex = OldPlayer
--			ErrorMsg(2)
--			return
--		end;
	end;
	PlayerIndex = OldPlayer;

	OldSubWorld = SubWorld;
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	SubWorld = idx;

	OpenMission(MISSIONID);

    SetMissionV(MS_ROOMINDEX,GetTaskTemp(JOINROOMINDEX));
    
	SetMissionV(BW_SIGN_MONEY,V);
	if x == 300 then
        SetMissionS(CITYID,"Th�nh ��")
	elseif x == 350 then
		SetMissionS(CITYID,"T��ng D��ng")
	elseif x == 150 then
		SetMissionS(CITYID,"D��ng Ch�u")
	elseif x == 100 then
	    SetMissionS(CITYID,"Tuy�n Ch�u")
	end;

	local nCountPlayerLevel = 0;
    OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		PlayerIndex = gf_GetTeamMember(i);
--		Pay(V);
        TaskTip("��i ng� c�a ng��i �� b�o danh tham gia tr�n ��a"..MapTab[GetTaskTemp(JOINROOMINDEX)][3].."thi ��u PK!");
		SetMissionV(MS_PLAYER1ID + i -1, PlayerIndex);
		SetMissionS(i, GetName());
		SetMissionS(i+2, GetPlayerInfo(PlayerIndex));
		
		------------------�ж��Ƿ���Ϸ����----------------
		if GetLevel() >= 70 then
			nCountPlayerLevel = nCountPlayerLevel + 1
		end;
		--branchTask_BW1()
	end;
	PlayerIndex = OldPlayer;
	
--	if nCountPlayerLevel == 2 then	--˫��������70��
--		SetMissionV(GLOBAL_NEWS_SHOW, 1);
--	end;
	
	str = "Hi�n t�i"..GetMissionS(CITYID).." - "..MapTab[GetTaskTemp(JOINROOMINDEX)][3].."��n ��u t� v� l�i ��i b�t ��u chu�n b� v�o tr�n, hai phe l� "..GetMissionS(1).."("..GetMissionS(3)..")".." c�ng v�i  "..GetMissionS(2).."("..GetMissionS(4)..")"..", Hi�n ��n ��u l�i ��i �ang m� mi�n ph�! Hoan ngh�nh m�i ng��i ��n xem thi ��u!";
	if GetMissionV(GLOBAL_NEWS_SHOW) == 1 then
	    AddGlobalNews(str);
	end;
	SubWorld = OldSubWorld;
	--Msg2Team("�����Ѿ������˱������뾡�����׼�����볡����������1���Ӻ���ʽ��ʼ��");
	Say("C�c ng��i �� ��ng k� thi ��u, h�y mau chu�n b� v�o ��u tr��ng, tr�n ��u s� ch�nh th�c b�t ��u sau 1 ph�t n�a.",0);
end;

function OnReady()

	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);

	if (GetName() == GetMissionS(1)) or (GetName() == GetMissionS(2)) then 
	    if (GetName() == GetMissionS(1)) then
		    SetMissionV(MS_PLAYER1ID, PlayerIndex);
		end;
	    if (GetName() == GetMissionS(2)) then
		    SetMissionV(MS_PLAYER1ID+1, PlayerIndex);
		end;
		
		SubWorld = OldSubWorld
		OnJoin()
	else
		V = GetMissionV(BW_KEY);
		if GetTask(DUZHU+2) == V then
			str = "Hi�n t�i "..GetMissionS(1).."("..GetMissionS(3)..")".." c�ng v�i  "..GetMissionS(2).."("..GetMissionS(4)..")".."  l�i ��i t� v� trong giai �o�n v�o tr��ng ��u, s� ng��i xem trong tr��ng ��u l� <color=yellow>"..GetMSPlayerCount(MISSIONID,3).."<color>, s� ng��i t�i �a l� 100 ng��i, b�n �� b�o danh xem thi ��u";
			SubWorld = OldSubWorld

			Say(str, 2, "Ta mu�n v�o xem thi ��u!/OnLooking","Ta kh�ng mu�n v�o n�a!/OnCancel");
		else
			str = "Hi�n t�i "..GetMissionS(1).."("..GetMissionS(3)..")".." c�ng v�i  "..GetMissionS(2).."("..GetMissionS(4)..")".."  l�i ��i t� v� trong giai �o�n v�o tr��ng ��u, s� ng��i xem trong tr��ng ��u l� <color=yellow>"..GetMSPlayerCount(MISSIONID,3).."<color>, s� ng��i t�i �a l� 100 ng��i, b�n c� th� <color=red>v�o tr��ng ��u xem mi�n ph�<color>, t� v� s�p b�t ��u.";
			SubWorld = OldSubWorld
			Say(str, 2, "Ta mu�n v�o xem thi ��u!/OnLook","Ta kh�ng c� h�ng th�!/OnCancel");
		end;
	end;
end;

function ErrorMsg(ErrorId)
    if (ErrorId == 1) then 
	    Say("Hai phe c�n t� ��i tr��c khi ��ng k� thi ��u!",0)
    elseif (ErrorId == 2) then 
	    Say("Xin l�i! Tr�n ��a thi ��u kh�ng ��. T�m th�i kh�ng th� tham gia thi ��u!",0)
    elseif (ErrorId == 3) then 
	    Say("B�o danh c� v�n ��! H�y li�n h� nh� cung c�p!",0);
    elseif (ErrorId == 4) then 
	    Say("Ng��i kh�ng ph�i l� ��u th� tham gia thi ��u! Kh�ng th� v�o ��u tr��ng thi ��u, ch� ���c l�m kh�n gi�!", 0);
    elseif (ErrorId == 5) then 
	    Say("Ng��i b�o danh ph�i l� ���ng kim ��i tr��ng!",0);
    elseif (ErrorId == 6) then 
	    Say("Ng��i kh�ng mang �� ng�n l��ng!",0);
    elseif (ErrorId == 7) then 
	    Say("Xin l�i! Ng��i ch�a b�o danh v�o xem!",0);
    elseif (ErrorId == 8) then
	    Say("Xin l�i! Tr�n ��a thi ��u �� ���c ng��i kh�c thu� r�i!",0);
    elseif (ErrorId == 9) then 
	    Say("Xin l�i! Thi ��u �� b�t ��u! Kh�ng th� ��ng k� n�a!",0);
    elseif (ErrorId == 10) then 
	    Say("Xin l�i! Trong ��i c� t�n th�, kh�ng th� tham gia PK!",0);
    elseif (ErrorId == 11) then 
	    Say("Xin l�i! ��i vi�n ng��i �� tham gia thi ��u PK kh�c!",0);
	elseif ErrorId == 12 then
	    --����������ʱ��ʹ�ã����󱨸�
	    Say("S� l��ng l�i ��i c�a server �� v��t m�c t�i �a!!!",0);
    else
    	
    end;
    return 
end;


function OnLook()

	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	
	str = GetMissionS(1).." c�ng v�i  "..GetMissionS(2).."  b�t ��u thi ��u t� v� l�i ��i! Ng��i �o�n xem ai chi�n th�ng?";
	str1 = "Ta cho r�ng "..GetMissionS(1).."("..GetMissionS(3)..")".."  s� th�ng!/OnCas1";
	str2 = "Ta cho r�ng "..GetMissionS(2).."("..GetMissionS(4)..")".."  s� th�ng!/OnCas2";
	Say(str, 3, str1, str2, "Ta kh�ng bi�t! Ta kh�ng v�o ��u!/OnCancel");

	SubWorld=OldSubWorld;
end;

function OnLooking()
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	if (idx == -1) then 
		return
	end;

	OldSubWorld = SubWorld;
	SubWorld = idx;
	
	--���ƹ�������Ϊ100��
	if GetMSPlayerCount(MISSIONID,3) >= 100 then
		Talk(1,"","Xin l�i! S� ng��i xem trong tr��ng ��u �� �� <color=yellow>100 ng��i<color>, xin h�y ��i tr�n thi ��u sau v�y");
		SubWorld=OldSubWorld;
		return
	end

	V = GetMissionV(BW_KEY);
	if GetTask(DUZHU+2) == V and V ~= 0 then
		JoinCamp(3);
	else
		ErrorMsg(7);
	end;

	SubWorld=OldSubWorld;
end;

function OnCas1()
    OnCas(0);
end;

function OnCas2()
    OnCas(1);
end;

function OnCas(nSel)
	SetTask(DUZHU,nSel + 1);
	SignUpFinalx(  )
--	AskClientForNumber("SignUpFinalx", 10000, 10000000, "�������ע���:");
end;


--�������Ͷ��������
function SignUpFinalx( )
--	if (GetCash() < V) then 
--		ErrorMsg(6)
--		return
--	end;

	OldSubWorld = SubWorld;
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	SubWorld = idx;

	ms_state = GetMissionV(MS_STATE);
	if (ms_state ~= 1) then
		SubWorld = OldSubWorld
		ErrorMsg(9)
		return
	end

--	Pay(V);		--����ע
--	nSel = GetTask(DUZHU) - 1;	--ѡ������ķ��أ�
--	V1 = GetMissionV(BW_MONEY1 + nSel) + V;		--��ע�ӵ�ѡ���������
--	SetMissionV(BW_MONEY1 + nSel, V1);		
--	SetTask(DUZHU+1,V);
	SetTask(DUZHU+2,GetMissionV(BW_KEY));		--��ǣ��ǹۿ����α���
	
	--���ƹ�������Ϊ100��
	if GetMSPlayerCount(MISSIONID,3) >= 100 then
		Talk(1,"","Xin l�i! S� ng��i xem trong tr��ng ��u �� �� <color=yellow>100 ng��i<color>, xin h�y ��i tr�n thi ��u sau v�y");
		SubWorld=OldSubWorld;
		return
	end
	
	JoinCamp(3);
	SubWorld = OldSubWorld;

end;

function OnJoin()
	idx = SubWorldID2Idx(MapTab[GetTaskTemp(JOINROOMINDEX)][1]);
	
	OldSubWorld = SubWorld;
	SubWorld = idx;

	if (GetName() == GetMissionS(1)) then 
		JoinCamp(1)
	elseif (GetName() == GetMissionS(2)) then 
		JoinCamp(2)
	else
		ErrorMsg(4)
	end;
	SubWorld=OldSubWorld;
	
end;

function OnFighting()
	str = "Hi�n t�i "..GetMissionS(1).." c�ng v�i  "..GetMissionS(2).."  �ang ti�n h�nh thi ��u l�i ��i!";
	Say(str, 2, "Ta mu�n v�o xem thi ��u./OnLooking", "Ta kh�ng mu�n v�o ��u./OnCancel");
end;

function OnCancel()
    SetTaskTemp(JOINROOMINDEX,0);
end;

function OnCancel_Talk()

end;

------------------------------------------------������̨���ֺ���-------------------------------------

--ѡ��������߹�ս���߿���
function RequestGame(nMapIndex)

local nMapState = 0;
local str = "";

	--�Ѿ�Ԥ���˵�����̨����Ҹ���֪ͨ���������������	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("Ng��i �� ��ng k� tr�n ��a ��n nh�n l�i ��i, kh�ng th� v�o Qu�n h�ng chi�n.",0)
		return
	end

	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
	if SubWorld <= 0 then
		WriteLog("[Qu�n h�ng chi�n]Khi RequestGame SubWorld b�o l�i, b�o l�i nMapIndex l�"..nMapIndex..", SubWorld l�"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
	
	nMapState = GetMissionV(MULTIMAP_STATE);
	nGameType = GetMissionV(GAME_TYPE);
	SubWorld = OldSubWorld
	
	if nMapState == 0 then
		Say("L�i ��i n�y ch�a c� ng��i ��ng k�. Ng��i mu�n ��ng k� tr�n ��a kh�ng?",
				2,
				"��ng k�/#OpenMultiRoom("..nMapIndex..")",
				"R�i kh�i/OnCancel_Talk"
		)
		
	elseif nMapState == 1 then
		if nGameType == 1  then
			str = "Tuy�n th� tham gia <color=yellow>tr�n th� 1<color> Qu�n h�ng chi�n c� th� b�o danh thi ��u mi�n ph�. Thi ��u k�t th�c, ng��i tham d� ��u nh�n ���c <color=yellow>�i�m s�c kh�e v� ph�n th��ng kh�c<color>. Ch�ng hay c�c h� c� mu�n tham gia?";
		elseif nGameType == 2 then
			str = "Tuy�n th� tham gia <color=yellow>tr�n th� 2<color> Qu�n h�ng chi�n ph�i n�p <color=yellow>2 l��ng<color> ph� b�o danh thi ��u. S� ng��i thi ��u t�i �a l� <color=yellow>100 ng��i<color>. Tuy�n th� chi�n th�ng cu�i c�ng c� th� nh�n ���c ph�n th��ng ti�n phong ph�. Ch�ng hay c�c h� c� mu�n tham gia?";
		else
			str = "Tr�n ��a thi ��u n�y ch�a b�t ��u. Ng��i mu�n v�o xem hay tham gia thi ��u?";
		end
		
		Say(str,
				3,
				"Tham gia t� v�/#SelectMultiRoom("..nMapIndex..")",
				"V�o xem thi ��u/#View_Game("..nMapIndex..")",
				"R�i kh�i/OnCancel_Talk"
		)
		
	elseif nMapState == 2 then
	
		Say("Tr�n ��a thi ��u l�i ��i n�y �� b�t ��u. Ng��i mu�n v�o xem kh�ng?",
				2,
				"V�o xem thi ��u/#View_Game("..nMapIndex..")",
				"R�i kh�i/OnCancel_Talk"
		)
	end

end

--��ʼһ��������̨��������
function OpenMultiRoom(nMapIndex)

local i = 0;
local BookedTab = {};
local nNpcIndex = 0;
local nMapState = 0;
local nMapID = GetWorldPos();
local str_news = "";

	--�鿴��ǰ����Ԥ�����
	for i=1,getn(MultiMapTab) do
		if nMapID == MultiMapTab[i][2] and nMapIndex ~= i then
			OldSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(MultiMapTab[i][1]);
			
			if SubWorld <= 0 then
				WriteLog("[Qu�n h�ng chi�n]Khi OpenMultiRoom SubWorld b�o l�i. B�o l�i nMapIndex l�"..nMapIndex..", SubWorld l�"..SubWorld..".");
				SubWorld = OldSubWorld;
				return 0
			end
			
			nMapState = GetMissionV(MULTIMAP_STATE);
			SubWorld = OldSubWorld
			if nMapState ~= 0 then
				tinsert(BookedTab,i)
			end
		end
	end
	
		--�ж��Ѿ�Ԥ���ĳ����Ƿ�ﵽ�����������
	if getn(BookedTab) > MAX_MULTIMAP_NUM then
		Say("Xin l�i! Tr�n ��a n�y �� ���c ng��i kh�c ��t tr��c! Xin ch�n tr�n ��a kh�c!",0)
		return
	elseif	getn(BookedTab) == MAX_MULTIMAP_NUM then
		nMapIndex = BookedTab[random(1,getn(BookedTab))]
	end
	
	--�ж��Ƿ���ϱ����ʸ�
	if JoinConditionCheck(1) == 0 then		
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
	if SubWorld <= 0 then
		WriteLog("[Qu�n h�ng chi�n]Khi OpenMultiRoom SubWorld b�o l�i. B�o l�i nMapIndex l�"..nMapIndex..", SubWorld l�"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
	
	nMapState = GetMissionV(MULTIMAP_STATE);
	SubWorld = OldSubWorld
	
	if nMapState == 0 then
		SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1])
  	OpenMission(MULIT_MISSION_ID);--����һ������
  	nNpcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n","��i Ch� C��ng",MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][6],MultiMapTab[nMapIndex][7]);--���һ�����ͳ������õ�Npc
  	SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\multimap_npc.lua")
  	SetMissionV(MULTIMAP_NPC_INDEX,nNpcIndex)
		CleanInteractive();
		NewWorld(MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][4],MultiMapTab[nMapIndex][5]);
		SCCheckOfflineExp(4)
		AddMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);--��������
		SetPlayerState(1,1);--����׼��״̬
		SetTaskTemp(PLAYER_CAMP,MULIT_FIGTHER_CAMP);--��¼�������
		SetTask(MULTIMAP_PLAYER_STATE,1);--��־��ɫ���ڶ�����̨
		StartMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID1, MULTI_TIMER_1);
		str_news = GetPlayerInfo(PlayerIndex)..GetName().."�ang �"..MultiMapTab[nMapIndex][9].."L�i ��i s�p x�p Qu�n h�ng chi�n. M�i c�c anh h�ng tham gia th� luy�n!",
		Msg2Global(str_news);
	
	elseif nMapState == 1 then
		Say("Xin l�i! Tr�n ��a n�y �� ���c ng��i kh�c ��t tr��c! Ng��i mu�n v�o xem hay tham gia thi ��u?",
				3,
				"Tham gia t� v�/#SelectMultiRoom("..nMapIndex..")",
				"V�o xem thi ��u/#View_Game("..nMapIndex..")",
				"R�i kh�i/OnCancel_Talk"
		)
		
	elseif nMapState == 2 then
		Say("L�i ��i �ang ti�n h�nh thi ��u! Ng��i c� th� v�o xem!",
				2,
				"V�o xem thi ��u/#View_Game("..nMapIndex..")",
				"R�i kh�i/OnCancel_Talk"
		)
	end
	
end

--ѡ����������̨����
function SelectMultiRoom(nMapIndex)

local nTotalFigtherNum = 0;
local nTotalAudicnceNum = 0;
local nGameType = 0;

	OldSubWorld = SubWorld;
  SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
  
  if SubWorld <= 0 then
		WriteLog("[Qu�n h�ng chi�n]Khi SelectMultiRoom SubWorld b�o l�i. B�o l�i nMapIndex l�"..nMapIndex..", SubWorld l�"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
  
  nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
  nTotalAudicnceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
  nGameType = GetMissionV(GAME_TYPE); 
  SubWorld = OldSubWorld
  
  --������Ա��δ��Ա
	if nTotalFigtherNum < MAX_MULTIMAP_FIGTHER_NUM then
			JoinMultiMap(nMapIndex)
	--��ս��Ա��δ��Ա
	elseif nTotalAudicnceNum < MAX_MULTIMAP_AUDIENCE_NUM then
		Say("S� ng��i tham gia thi ��u �� ��t m�c t�i �a. Ng��i c� th� v�o xem thi ��u!",
		2,
		"V�o xem thi ��u/#View_Game("..nMapIndex..")",
		"R�i kh�i/OnCancel_Talk"
		)
	else
		Say("Xin l�i! S� ng��i trong tr�n ��a �� ��! Sau n�y h�y t�i nh�!",0)
	end
	
end

--���������̨����
function JoinMultiMap(nMapIndex)

local news_str = "";
local nMapState = 0;
local nTotalFigtherNum = 0;
local nTotalAudicnceNum = 0;
local nGameType = 0;

	OldSubWorld = SubWorld;
  SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
  
  if SubWorld <= 0 then
		WriteLog("[Qu�n h�ng chi�n]Khi JoinMultiMap SubWorld b�o l�i. B�o l�i nMapIndex l�"..nMapIndex..", SubWorld l�"..SubWorld..".");
		SubWorld = OldSubWorld;
		return 0
	end
  
  nMapState = GetMissionV(MULTIMAP_STATE);
  nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
  nTotalAudicnceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);
  nGameType = GetMissionV(GAME_TYPE)
		
	if nMapState == 1 and nTotalFigtherNum < MAX_MULTIMAP_FIGTHER_NUM then
		--���˴����볡�����ж�
		if nGameType == 1 then
			--�ж��Ƿ���ϱ����ʸ�
			if JoinConditionCheck(2) == 0 then		
				return
			end
		elseif nGameType == 2 then
			if Pay(HUNDRED_MONEY) ~= 1 then
				Say("Tham gia tr�n th� 2 Qu�n h�ng chi�n c�n n�p <color=yellow>2 l��ng<color> ph� b�o danh. Ng��i kh�ng mang �� ti�n!",0)
				return
			else
				SetMissionV(MULTIMAP_BONUS,GetMissionV(MULTIMAP_BONUS)+HUNDRED_MONEY)
			end
		--�ж��Ƿ���ϱ����ʸ�
		elseif JoinConditionCheck(1) == 0 then		
			return
		end
		
		CleanInteractive();
		NewWorld(MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][4],MultiMapTab[nMapIndex][5]);
		SCCheckOfflineExp(4)
		SetPlayerState(1,1);--����׼��״̬
		AddMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);--��������
		SetTaskTemp(PLAYER_CAMP,MULIT_FIGTHER_CAMP);--��¼�������
		SetTask(MULTIMAP_PLAYER_STATE,1);--��־��ɫ���ڶ�����̨
		news_str = GetPlayerInfo(PlayerIndex)..GetName().."�� v�o L�i ��i. Hi�n s� ng��i l�"..GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP).." ng��i."
		Msg2MSAll(MULIT_MISSION_ID,news_str);
	elseif nTotalFigtherNum >= MAX_MULTIMAP_FIGTHER_NUM and nTotalAudicnceNum < MAX_MULTIMAP_AUDIENCE_NUM then
		Say("S� ng��i tham gia thi ��u �� ��t m�c t�i �a. Ng��i c� th� v�o xem thi ��u!",
		2,
		"V�o xem thi ��u/#View_Game("..nMapIndex..")",
		"R�i kh�i/OnCancel_Talk"
		)
	else
		Say("Xin l�i! S� ng��i trong tr�n ��a �� ��! Sau n�y h�y t�i nh�!",0)
	end

	SubWorld = OldSubWorld
	
end

--���˴��ޱ������سﱸ�жԻ�
function MapPreparingTalk()

local nHour = GetLocalTime()

	if nHour >= 10 and nHour <= 12 then
		Say("Xin l�i! Tr�n ��a �ang chu�n b�. <color=yellow>Tr�n th� 1<color> Qu�n h�ng chi�n b�t ��u b�o danh v�o <color=yellow>11:00<color>; <color=yellow>Tr�n th� 2<color> b�t ��u b�o danh v�o<color=yellow>11:30<color>.",0)
	elseif nHour >= 16 and nHour <= 18 then
		Say("Xin l�i! Tr�n ��a �ang chu�n b�. <color=yellow>Tr�n th� 1<color> Qu�n h�ng chi�n b�t ��u b�o danh v�o <color=yellow>17:00<color>; <color=yellow>Tr�n th� 2<color> b�t ��u b�o danh v�o <color=yellow>17:30<color>.",0)
	elseif nHour >= 20 and nHour <= 22 then
		Say("Xin l�i! Tr�n ��a �ang chu�n b�. <color=yellow>Tr�n th� 1<color> Qu�n h�ng chi�n b�t ��u b�o danh v�o <color=yellow>21:00<color>; <color=yellow>Tr�n th� 2<color> b�t ��u b�o danh v�o <color=yellow>21:30<color>.",0)
	end
end

--�μӱ��������ж�
--������nType 1����ͨ������̨��2������Ӣ�۴��ޣ�3����ͨ��ӻ�ս��̨��4���ŶӼ�ս����

function JoinConditionCheck(nType)

	if nType == 1 then
		if GetLevel() <10 or GetPlayerRoute() == 0 then
			Say("��ng c�p tham gia Qu�n h�ng chi�n th�ng th��ng ph�i ��t <color=yellow>c�p 10 tr� l�n<color> v� l� nh�n v�t <color=yellow>�� gia nh�p m�n ph�i<color>.",0);
			return 0 
		else
			return 1
		end
	end
	
	if nType == 2 then
		if GetLevel() <60 or GetPlayerRoute() == 0 then
			Say("��ng c�p tham gia Qu�n h�ng chi�n th�ng th��ng ph�i ��t <color=yellow>c�p 60 tr� l�n<color> v� l� nh�n v�t <color=yellow>�� gia nh�p m�n ph�i<color>.",0);
			return 0
		else
			return 1
		end
	end
	
end

--��������˵��ѡ��
function GameRuleTalk()

	Say("H�y ch�n t�m hi�u quy t�c l�i ��i t��ng quan!",
	5,
	"��n ��u L�i ��i/#GameRule(1)",
	"T� ��i ��i chi�n L�i ��i/#GameRule(2)",
	"H�n chi�n ��n ��u L�i ��i/#GameRule(3)",
	"T� ��i h�n chi�n l�i ��i/#GameRule(4)",
	"Tho�t/OnCancel_Talk"
	)
end

function GameRule(nType)

local strTalk = {};
	
	if nType == 1 then
		OnHelp();
	elseif nType == 2 then
		strTalk = {
			"L�i ��i T� ��i t� v� l� n�i c�c ��i hi�p cao th� trong giang h� t� ��i th� luy�n v� ngh�, ph�n t�i cao th�p v�i nhau. L�i ��i l� tr�n ��a c�ng b�ng cho hai phe thi ��u!",	
			"Mu�n ti�n h�nh t� v� l�i ��i, tr��c ti�n c�n ��ng k� v�i ta. �i�u ki�n c�n 2 ng��i tr� l�n �� gia nh�p m�n ph�i ���c ��i tr��ng y�u c�u!",	
			"Sau khi ��ng k� th�nh c�ng, phe ��ng k� v�o ��u tr��ng ��i ��i ng� kh�c khi�u chi�n!",
			}
		TalkEx("#GameRule_1("..nType..")",strTalk)
	elseif nType == 3 then
		Rule_Multi();
	elseif nType == 4 then
		strTalk = {
			"T� ��i h�n chi�n l�i ��i l� tr�n ��a t� v� c�a 2 ��i ng� tr� l�n. C�c ��i ���c t� m�nh l�m ch�. T� ��i d�ng c�m chi�n ��u ��n c�ng l� phe gi�nh chi�n th�ng!",
			"L�i ��i th� luy�n t� v� l�n n�y theo h�nh th�c t� ��i 1 ��i 1. Ngo�i vi�c th�m nghi�m c�ng l�c b�n th�n c�n c�n n�m b�t thay ��i c�a tr�n ��a, ��i th� m�nh y�u v� s�ch l��c kh�c nhau �� gi�nh th�ng l�i chung cu�c. N�u c�c h� kh�ng t�m ���c ��i th� t��ng x�ng, sao kh�ng th� tham gia Qu�n h�ng chi�n?",
			"Qu�n h�ng chi�n cho ph�p ��i ng� c� 2 ng��i tr� l�n ��t c�p 10 tr� l�n �� gia nh�p m�n ph�i tham gia mi�n ph�. ���ng nhi�n, ng��i chi�n th�ng c�ng kh�ng ���c nh�n b�t c� ph�n th��ng n�o. Sau khi ��ng k� th�nh c�ng, th�i gian chu�n b� l� 3 ph�t. N�u s� ��i trong tr�n ��a �t h�n 2 ��i, thi ��u s� b� h�y b�!",
			}
		TalkEx("#GameRule_1("..nType..")",strTalk);
	end
end

function GameRule_1(nType)

local strTalk = {}; 

	if nType == 2 then
		strTalk = {
			"Phe ��ng k� �� v�o ��u tr��ng m�i phe khi�u chi�n t� v�, thi ��u m�i ch�nh th�c b�t ��u. Hai phe tham chi�n c� th�i gian chu�n b� thi ��u l� 3 ph�t!",
			"Sau 3 ph�t, thi ��u s� b�t ��u. Th�i gian thi ��u l� 15 ph�t. Trong v�ng 15 ph�t ch�a ti�u di�t h�t ��i ph��ng, thi ��u s� ���c x� h�a.",	                                                      
			"Ngo�i ra, ��i tr��ng b� r�t m�ng ho�c v� th�nh khi �ang trong giai �o�n thi ��u, ��i m�nh s� b� x� thua!",                                                     
			}
	elseif nType == 4 then
		strTalk = {
			"M�i tr�n, s� ��i tham chi�n t�i �a l� 10 ��i, th�i gian thi ��u l� 15 ph�t. N�u th�i gian k�t th�c, s� ��i thi ��u c�n l�i h�n 1 ��i s� l�y s� tuy�n th� c�a ��i ng� b� ti�u di�t �t nhi�u �� quy�t ��nh phe chi�n th�ng!",
			"Ngo�i ra, ��i tr��ng b� r�t m�ng ho�c v� th�nh khi �ang trong giai �o�n thi ��u, ��i m�nh s� b� x� thua!",
			"Ngo�i tr�n ��a Qu�n h�ng chi�n, trong th�i gian nh�t ��nh, t�i Th�nh �� c�n t� ch�c ��i chi�n. Th�i gian chia th�nh 12:00, 12:30, 18:00, 18:30 v� 23:00, 23:30.",
			}
	end
	
	TalkEx("#GameRule_2("..nType..")",strTalk);
end

function GameRule_2(nType)

local strTalk = {};

	if nType == 4 then
		strTalk = {
			"��i chi�n y�u c�u ��i ng� c� 2 ng��i tr� l�n ��t c�p 60 tr� l�n �� gia nh�p m�n ph�i. M�i tuy�n th� tham gia tr�n thi ��u th� 1 t�y � trong 3 th�i �i�m ��u c� th� nh�n ���c ph�n th��ng nh�t ��nh (m�i ng�y ch� c� th� nh�n ���c 1 l�n); ��n tr�n thi ��u th� 2, y�u c�u ��i tr��ng n�p 10 l��ng ph� v�o tr�n. ���ng nhi�n, ��i ng� chi�n th�ng s� nh�n ���c ph�n th��ng v� ti�n phong ph�.",
			"Hy v�ng l�n n�y ���c ch�ng ki�n b�n l�nh c�a ��i hi�p!",
			}
		TalkEx("",strTalk);
	end
end

--������̨����˵��
function Rule_Multi()

local strTalk = {
	"H�n chi�n ��n ��u L�i ��i l� tr�n ��a th� luy�n t� v� c�a 2 ho�c nhi�u h�n c�c giang h� hi�p kh�ch. M�i ��u th� tham chi�n s� t� m�nh l�m ch�. ��u th� m�nh m� chi�n ��u ��n cu�i c�ng s� l� ng��i chi�n th�ng!",
	"H�n chi�n ��n ��u L�i ��i l�n n�y theo h�nh th�c t� v� 1 ��i 1. Ngo�i vi�c th�m nghi�m c�ng l�c b�n th�n c�n c�n n�m b�t thay ��i c�a tr�n ��a, ��i th� m�nh y�u v� s�ch l��c kh�c nhau �� gi�nh th�ng l�i chung cu�c. N�u c�c h� kh�ng t�m ���c ��i th� t��ng x�ng, sao kh�ng th� tham gia v�o tr�n Qu�n h�ng chi�n?",
	"H�n chi�n ��n ��u L�i ��i cho ph�p hi�p kh�ch giang h� t� c�p 10 tr� l�n �� gia nh�p m�n ph�i tham gia mi�n ph�. ���ng nhi�n, ng��i chi�n th�ng c�ng kh�ng ���c nh�n b�t c� ph�n th��ng n�o. Sau khi ��ng k� th�nh c�ng, th�i gian chu�n b� l� 3 ph�t. N�u s� ng��i tham chi�n trong tr�n ��a �t h�n 1 ng��i, thi ��u s� b� h�y b�!",
	}

	TalkEx("Rule_Multi_1",strTalk)

end

function Rule_Multi_1()

local strTalk = {
	"M�i tr�n, s� ng��i tham chi�n t�i �a l� 100 ng��i, th�i thi ��u l� 15ph�t. Khi th�i gian k�t th�c, ��u th� tham chi�n c�n l�i �t h�n 1 ng��i s� l�y ti�u ch� s� ng��i tham chi�n nhi�u �t �� quy�t ��nh phe chi�n th�ng.",
	"Ngo�i thi ��u H�n chi�n ��n ��u L�i ��i, trong th�i gian nh�t ��nh, t�i Th�nh �� c�n t� ch�c Qu�n h�ng chi�n. Th�i gian chia th�nh 11:00, 11:30, 17:00, 17:30 v� 21:00, 21:30.",
	"Y�u c�u hi�p kh�ch giang h� ��t c�p 60 tr� l�n �� gia nh�p m�n ph�i tham gia. M�i tuy�n th� tham gia tr�n thi ��u th� 1 t�y � trong 3 th�i �i�m ��u c� th� nh�n ���c ph�n th��ng nh�t ��nh (m�i ng�y ch� c� th� nh�n ���c 1 l�n); ��n tr�n thi ��u th� 2, y�u c�u n�p 2 l��ng ph� v�o tr�n. ���ng nhi�n, ng��i chi�n th�ng s� nh�n ���c ph�n th��ng v� ti�n phong ph�.",
	"Hy v�ng l�n n�y ���c ch�ng ki�n b�n l�nh c�a ��i hi�p!",
	}

	TalkEx("",strTalk)
	
end

---------------������ӵ�����̨---------------------
function OpenSingleTeamRoomRequest(nMapIndex)

	Say("Tr�n ��a n�y ch�a c� thi ��u. Ng��i c� mu�n ��ng k� v� xin chuy�n v�o ��u tr��ng kh�ng?",
			2,
			"��ng k�/#OpenSingleTeamRoom("..nMapIndex..")",
			"R�i kh�i/OnCancel_Talk"
			)

end
--����һ����ӵ�����̨����
function OpenSingleTeamRoom(nMapIndex)

local i = 0;
local x,y,z = 0,0,0;
local nMapState = 0;
local nTeamSize = 0;
local strSay = "";
local nCaptainName = "";

	--�Ѿ�Ԥ���˵�����̨����Ҹ���֪ͨ���������������	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("Ng��i �� ��ng k� tr�n ��a ��n nh�n l�i ��i, kh�ng th� v�o l�i ��i kh�c!",0)
		return
	end

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);
		--��δ�б���
		if nMapState == 0 then
			--�ж��Ƿ���ϱ����ʸ�
			if HaveSingleTemaGameTitle() == 1 then
				OpenMission(SINGLE_TEAM_MISSION_ID);
  			OldPlayer = PlayerIndex; 			
  			for i=1,gf_GetTeamSize() do
  				PlayerIndex = gf_GetTeamMember(i);
  				if PlayerIndex > 0 then
  					CleanInteractive();
  					x,y,z = GetWorldPos();
						SetTask(MS_POS,x);
						SetTask(MS_POS+1,y);
						SetTask(MS_POS+2,z);
  					NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
  					SCCheckOfflineExp(4)
						AddMSPlayer(SINGLE_TEAM_MISSION_ID,1);--������Ӫ
						SetPlayerState(1,1,2);--����׼��״̬
						SetTaskTemp(PLAYER_CAMP,1);--��¼�������
						SetTask(MULTIMAP_PLAYER_STATE,1);--��־��ɫ���ڶ�����̨
					end
  			end
  			PlayerIndex = OldPlayer;
  			--SetMissionV(TEAM_GAME_STATE,1); 			
  			SetMissionS(CAPTAIN_NAME,gf_GetCaptainName());
  			SetMissionV(CAPTAIN_ID,gf_GetTeamMember(0)); 			
				--StartMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID,SINGLE_TEAM_TIMER);		
			end
		--�����Ѿ���ʼ����֧��������׼����	
		elseif nMapState == 2 or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0) then
			Say("Tr�n ��a n�y �� b�t ��u thi ��u, ��i ng� hai phe do <color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color> v� <color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color> d�n d�t. C� mu�n v�o tr�n ��a n�y xem thi ��u?",
			2,
			"Xem thi ��u/#RequestViewSingleTeamGame("..nMapIndex..")",
			"R�i kh�i/OnCancel_Talk"
			)
		--������δ��ʼ
		elseif nMapState == 1 and (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 ) or (GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 ) then
			OldPlayer = PlayerIndex;
			PlayerIndex = GetMissionV(CAPTAIN_ID);
			if PlayerIndex > 0 then
				nCaptainName = gf_GetCaptainName();
				nTeamSize = gf_GetTeamSize();
			end
			PlayerIndex = OldPlayer;
			Say("C� ph�i ng��i mu�n ch�n <color=yellow>"..nCaptainName.."<color> d�n d�t (g�m c�"..nTeamSize.." ng��i) m�i t� v� ho�c v�o ��u tr��ng xem thi ��u?",
				3,
				"G�i l�i khi�u chi�n/#RequestGame2Captian("..nMapIndex..")",
				"Xem thi ��u/#RequestViewSingleTeamGame("..nMapIndex..")",
				"R�i kh�i/OnCancel_Talk"
				)
		elseif nMapState == 3 then
			GameOverTalk();
		end
	end
	
	SubWorld = OldWorld;
	
end

function RequestGame2Captian(nMapIndex)

local nMapState = 0;
local strSay = "";
local nTeamNum = 0;
local nCaptainName = "";

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		nMapState = GetMissionV(TEAM_GAME_STATE);		
		--��δ�б���
		if nMapState == 0 then
			Say("Tr�n ��a n�y ch�a c� thi ��u. Ng��i c� mu�n ��ng k� v� xin chuy�n v�o ��u tr��ng kh�ng?",
				2,
				"��ng k�/#OpenSingleTeamRoom("..nMapIndex..")",
				"R�i kh�i/OnCancel_Talk"
				)		
		--�����Ѿ���ʼ����֧��������׼����		
		elseif nMapState >= 2 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			Say("Tr�n ��a n�y �� b�t ��u thi ��u, ��i ng� hai phe do <color=yellow>"..GetMissionS(CAPTAIN_NAME).."<color> v� <color=yellow>"..GetMissionS(CAPTAIN_NAME+1).."<color> d�n d�t. C� mu�n v�o tr�n ��a n�y xem thi ��u?",
				2,
				"Xem thi ��u/#RequestViewSingleTeamGame("..nMapIndex..")",
				"R�i kh�i/OnCancel_Talk"
				)
		--������δ��ʼ
		elseif nMapState == 1 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
			if HaveSingleTemaGameTitle() == 1 then
				--if GetMissionS(CAPTAIN_NAME) == "" then
					--nCaptainName = GetMissionS(CAPTAIN_NAME+1);
				--else
					nCaptainName = GetMissionS(CAPTAIN_NAME);
				--end
				Talk(1,"","B�n �� g�i l�i th�nh c�u t� v� ��n ��i"..nCaptainName..", h�y ki�n nh�n ch� ��i ��i ph��ng tr� l�i!");
				SendChallenge2Captain(nMapIndex,PlayerIndex,gf_GetTeamSize());
			end
		end 
	end

	SubWorld = OldWorld;

end

--��ӳ�����������
function SendChallenge2Captain(nMapIndex,nChallengeIndex,nChallengeTeamSize)

local nChallengeName = "";

	OldPlayer = PlayerIndex;
	
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		nChallengeName = GetName();
	end
	
	PlayerIndex = OldPlayer;
	
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		OldPlayer = PlayerIndex;
		PlayerIndex = GetMissionV(CAPTAIN_ID);
		if PlayerIndex > 0 then
			for i=3,10 do
				if GetMissionS(i) == "" then
					SetPlayerScript("\\script\\��ԭ����\\�ɶ�\\npc\\��̨�ϰ�.lua");
					SetMissionS(i,nChallengeName);
					Say("Do <color=yellow>"..nChallengeName.."<color> d�n d�t (g�m: <color=yellow>"..nChallengeTeamSize.."<color> ng��i) m�i ng��i t� v�. Ng��i ��ng � kh�ng?",
					2,
					"��ng �/#AG("..nMapIndex..","..nChallengeIndex..","..i..")",
					"C� tuy�t/#RG("..nMapIndex..","..nChallengeIndex..","..i..")"
					)
					break
				end
			end
		end
		PlayerIndex = OldPlayer;
	end
	SubWorld = OldWorld;

end

--˫��ͬ�����
--���� nMapIndex������������SingleTeamMapTab�е�index��nChallengeIndex����ս�ߵ�PlayerIndex��nChallengeNameIndex����ս��������Mission�е�index��
function AG(nMapIndex,nChallengeIndex,nChallengeNameIndex)

local i = 0;
local x,y,z = 0,0,0;
local nCamp = 0;
local str_news = "";

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
	if SubWorld ~= -1 then
		--��֤�����ڻ�δ��������ս�߽����ұ�����δ��ʼ
		if GetMissionV(TEAM_GAME_STATE) == 1 then
			if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) > 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) == 0 then
				nCamp = 2;
			elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) == 0 and GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) > 0 then
				nCamp = 1;
			end
			
			if nCamp == 1 or nCamp == 2 then			
			OldPlayer = PlayerIndex;
			PlayerIndex = nChallengeIndex;
			if PlayerIndex > 0 then
				if GetName() == GetMissionS(nChallengeNameIndex) then
						--�����߲��ڵ�ǰ��̨��ͼ�����򷵻�
						if GetWorldPos() ~= SingleTeamMapTab[nMapIndex][2] then
							return
						end
					SetMissionS(nChallengeNameIndex,"");--�������������
					if HaveSingleTemaGameTitle() == 1 then
						SetMissionV(CAPTAIN_ID+1,gf_GetTeamMember(0));
						SetMissionS(CAPTAIN_NAME+1,gf_GetCaptainName());
						for i=1,gf_GetTeamSize() do
							PlayerIndex = gf_GetTeamMember(i);
  						if PlayerIndex > 0 then
  							x,y,z = GetWorldPos();
								SetTask(MS_POS,x);
								SetTask(MS_POS+1,y);
								SetTask(MS_POS+2,z);
	  						CleanInteractive();
  							NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
  							SCCheckOfflineExp(4)
								AddMSPlayer(SINGLE_TEAM_MISSION_ID,2);--������Ӫ
								SetPlayerState(1,1,3);--����׼��״̬
								SetTaskTemp(PLAYER_CAMP,2);--��¼�������
								SetTask(MULTIMAP_PLAYER_STATE,1);--��־��ɫ���ڶ�����̨
							end
  					end
  					str_news = "Do"..gf_GetCaptainName().."d�n d�t (g�m c�"..gf_GetTeamSize().." ng��i) v�o tr�n."
						Msg2MSAll(SINGLE_TEAM_MISSION_ID,str_news);
  				end
  			end
  		end
			PlayerIndex = OldPlayer;
			end
		end
	end
	SubWorld = OldWorld;
end

--�ܾ���ս�ߵ�����
--���� nMapIndex������������SingleTeamMapTab�е�index��nChallengeIndex����ս�ߵ�PlayerIndex��nChallengeNameIndex����ս��������Mission�е�index��
function RG(nMapIndex,nChallengeIndex,nChallengeNameIndex)

local nRejectorName = "";
local nChallengeName = GetMissionS(nChallengeNameIndex);

	SetMissionS(nChallengeNameIndex,"");--�������������
	OldPlayer = PlayerIndex;
	PlayerIndex = nChallengeIndex;
	if PlayerIndex > 0 then
		--OldWorld = SubWorld;
		--SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]);
		--if SubWorld ~= -1 then
			if GetName() == nChallengeName then
				nRejectorName = GetMissionS(CAPTAIN_NAME);
				TalkEx("",{"Ch� l�i ��i:"..nRejectorName.."�� t� ch�i l�i khi�u chi�n c�a b�n!"});
			end
		--end
		--SubWorld = OldWorld;
	end
	PlayerIndex = OldPlayer;
end

--���������ս����
function RequestViewSingleTeamGame(nMapIndex)

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SingleTeamMapTab[nMapIndex][1]); 
	
	if GetMissionV(TEAM_GAME_STATE) == 0 then
		Say("Xin l�i! Tr�n ��a n�y ch�a b�t ��u! L�n sau h�y ��n nh�!",0);
	elseif GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,3) < MAX_MULTIMAP_AUDIENCE_NUM then
		CleanInteractive();
		NewWorld(SingleTeamMapTab[nMapIndex][1],SingleTeamMapTab[nMapIndex][4],SingleTeamMapTab[nMapIndex][5]);
		SetPlayerState(1,2);--���ù�ս״̬
		AddMSPlayer(SINGLE_TEAM_MISSION_ID,3);--��������
		SetTaskTemp(PLAYER_CAMP,3);--��¼�������
	else 
		Say("Xin l�i! Kh�n gi� �� ��y. L�n sau nhanh ch�n nh�!",0);
	end
	
	SubWorld = OldWorld;
	
end

---------------������ӻ�ս��̨----------------------------
function RequestTeamGame(nMapIndex)

local nMapState = 0;
local strSay = "";

	--�Ѿ�Ԥ���˵�����̨����Ҹ���֪ͨ���������������	
	if GetTaskTemp(JOINROOMINDEX) ~= 0 then
		Say("Ng��i �� ��ng k� tr�n ��a ��n nh�n l�i ��i, kh�ng th� v�o l�i ��i kh�c!",0)
		return
	end

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(TeamMapTab[nMapIndex][1]);
	
	if SubWorld ~= -1 then
		if GetMissionV(TEAM_GAME_STATE) == 0 then
			Say("L�i ��i n�y ch�a c� ng��i ��ng k�. Ng��i mu�n ��ng k� tr�n ��a kh�ng?",
					2,
					"��ng k�/#JoinTeamRoom("..nMapIndex..")",
					"R�i kh�i/OnCancel_Talk"
			)
		elseif GetMissionV(TEAM_GAME_STATE) == 1 then
			if GetGameTeamNum() < MAX_TEAM_NUM then
				strSay = "L�i ��i n�y hi�n c� <color=yellow>"..GetGameTeamNum().."<color> �ang chu�n b� thi ��u. C�c h� mu�n thi ��u hay v�o xem?";
				Say(strSay,
						3,
						"Tham gia t� v�/#JoinTeamRoom("..nMapIndex..")",
						"V�o xem thi ��u/#RequestViewTeamGame("..nMapIndex..")",
						"R�i kh�i/OnCancel_Talk"
				)
			else
				Say("S� ��i ng� b�o danh tr�n ��a n�y �� ��t"..MAX_TEAM_NUM..", ng��i mu�n v�o xem thi ��u kh�ng?",
					2,
					"V�o xem thi ��u/#RequestViewTeamGame("..nMapIndex..")",
					"R�i kh�i/OnCancel_Talk"
				)
			end
		elseif GetMissionV(TEAM_GAME_STATE) == 2 then
		
			Say("Tr�n ��a thi ��u l�i ��i n�y �� b�t ��u. Ng��i mu�n v�o xem kh�ng?",
					2,
					"V�o xem thi ��u/#RequestViewTeamGame("..nMapIndex..")",
					"R�i kh�i/OnCancel_Talk"
			)
		end
	end
	
	SubWorld = OldWorld;
end

function JoinTeamRoom(nMapIndex)

local i = 0;
local x,y,z = 0,0,0;
local nGameTeamIndex = 0;
local news_str = "";

	
	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(TeamMapTab[nMapIndex][1]);
	
	if SubWorld < 0 then
		WriteLog("[�a nh�n t� ��i l�i ��i]T�nh tr�ng ��u tr��ng hi�n t�i SubWorld b�o l�i. B�o l�i MapID l�"..TeamMapTab[nMapIndex][1]..", SubWorld l�"..SubWorld..".");
		SubWorld = OldWorld;
		return 0
	end
	
	if HaveTemaGameTitle(GetMissionV(GAME_TYPE)) == 0 then
		return
	end
	
		nGameState = GetMissionV(TEAM_GAME_STATE);
		
		--������û����
		if nGameState == 0 then
			OpenMission(TEAM_MISSION_ID);
  		nNpcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n","��i Ch� C��ng",TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][6],TeamMapTab[nMapIndex][7]);--���һ�����ͳ������õ�Npc
  		SetNpcScript(nNpcIndex,"\\script\\missions\\bw\\team_game_npc.lua")
  		SetMissionV(NPC_INDEX,nNpcIndex)
  		
  		OldPlayer = PlayerIndex;
  		
  		for i=1,gf_GetTeamSize() do
  			PlayerIndex = gf_GetTeamMember(i);
  			if PlayerIndex > 0 then
  				x,y,z = GetWorldPos();
					SetTask(MS_POS,x);
					SetTask(MS_POS+1,y);
					SetTask(MS_POS+2,z);
  				CleanInteractive();
  				NewWorld(TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][4],TeamMapTab[nMapIndex][5]);
  				SCCheckOfflineExp(4)
					AddMSPlayer(TEAM_MISSION_ID,1);--������Ӫ
					SetPlayerState(1,1,1);--����׼��״̬
					SetTaskTemp(PLAYER_CAMP,1);--��¼�������
					SetTask(MULTIMAP_PLAYER_STATE,1);--��־��ɫ���ڶ�����̨
					AddTitle(21,1);
					SetCurTitle(21,1);
				end
  		end
  		
  		PlayerIndex = OldPlayer;
  		
  		SetMissionS(CAPTAIN_NAME,gf_GetCaptainName());
  		SetMissionV(CAPTAIN_ID,gf_GetTeamMember(0));
  		
			StartMissionTimer(TEAM_MISSION_ID, TEAM_TIME_ID1, TEAM_TIMER_1);
			news_str = GetPlayerInfo(gf_GetTeamMember(0))..gf_GetCaptainName().."c�ng n� b�c �ang �"..TeamMapTab[nMapIndex][9].."l�i ��i s�p x�p T� ��i h�n chi�n l�i ��i! M�i c�c anh h�ng tham gia th� luy�n!";
			SubWorld = OldWorld;
			Msg2SubWorld(news_str);
		
		--�����׶�	
		elseif nGameState == 1 then
		
			if GetGameTeamNum() >= MAX_TEAM_NUM then	
				TalkEx("",{"��i ng� �� v��t qu� 10 ��i! L�t sau h�y quay l�i!"});
				SubWorld = OldWorld;
				return
			end
		
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) == 0 then
					SetMissionS(CAPTAIN_NAME + i - 1,gf_GetCaptainName());
  				SetMissionV(CAPTAIN_ID + i - 1,gf_GetTeamMember(0));
					nGameTeamIndex = i;
					break;
				end
			end
  		
  		OldPlayer = PlayerIndex;
  		
  		for i=1,gf_GetTeamSize() do
  			PlayerIndex = gf_GetTeamMember(i);
  			if PlayerIndex > 0 then
  				x,y,z = GetWorldPos();
					SetTask(MS_POS,x);
					SetTask(MS_POS+1,y);
					SetTask(MS_POS+2,z);
  				CleanInteractive();
  				NewWorld(TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][4],TeamMapTab[nMapIndex][5]);
  				SCCheckOfflineExp(4)
					AddMSPlayer(TEAM_MISSION_ID,nGameTeamIndex);--������Ӫ
					SetPlayerState(1,1,1);--����׼��״̬
					SetTaskTemp(PLAYER_CAMP,nGameTeamIndex);--��¼�������
					SetTask(MULTIMAP_PLAYER_STATE,1);--��־��ɫ���ڶ�����̨
					AddTitle(21,nGameTeamIndex);
					SetCurTitle(21,nGameTeamIndex);
				end
  		end
  		
  		PlayerIndex = OldPlayer;
  		news_str = "Do "..GetName().." d�n d�t (g�m c�"..gf_GetTeamSize().." ng��i) �� �� v�o l�i ��i. S� ��i hi�n t�i l�"..GetGameTeamNum()..". "
  		
  		if GetMissionV(TEAM_NEWS_STATE) > 3 then
				SetMissionV(TEAM_NEWS_STATE,GetMissionV(TEAM_NEWS_STATE)-3);
				news_str = news_str.."Do c� ��i m�i v�o tr�n, th�i gian chu�n b� s� k�o d�i th�m 1 ph�t!";
			end
			Msg2MSAll(TEAM_MISSION_ID,news_str);
		
		--�����׶� 
		elseif nGameState >= 2 then
			TalkEx("",{"Thi ��u �� b�t ��u! L�t sau h�y ��n!"});
		end
	
	SubWorld = OldWorld;

end

--�����ս��ս����
function RequestViewTeamGame(nMapIndex)

	OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(TeamMapTab[nMapIndex][1]); 
	
	if SubWorld ~= -1 then
		if GetMissionV(TEAM_GAME_STATE) == 0 then
			Say("Xin l�i! Tr�n ��a n�y ch�a b�t ��u! L�n sau h�y ��n nh�!",0);
		elseif GetMSPlayerCount(TEAM_MISSION_ID,1) < MAX_MULTIMAP_AUDIENCE_NUM then
			CleanInteractive();
			NewWorld(TeamMapTab[nMapIndex][1],TeamMapTab[nMapIndex][4],TeamMapTab[nMapIndex][5]);
			SetPlayerState(1,2);--���ù�ս״̬
			AddMSPlayer(TEAM_MISSION_ID,11);--��������
			SetTaskTemp(PLAYER_CAMP,11);--��¼�������
		else
			Say("Xin l�i! Kh�n gi� �� ��y. L�n sau nhanh ch�n nh�!",0);
		end
	end
	
	SubWorld = OldWorld;
	
end

function TeamGamePreparingTalk()
	
local nHour = GetLocalTime()

	if nHour >= 11 and nHour <= 12 then
		Say("Xin l�i! Tr�n ��a �ang chu�n b�. <color=yellow>Tr�n th� 1<color> ��i chi�n b�t ��u b�o danh v�o <color=yellow>12:00<color>; <color=yellow>Tr�n th� 2<color> b�t ��u b�o danh v�o<color=yellow>12:30<color>.",0)
	elseif nHour >= 17 and nHour <= 18 then
		Say("Xin l�i! Tr�n ��a �ang chu�n b�. <color=yellow>Tr�n th� 1<color> ��i chi�n b�t ��u b�o danh v�o <color=yellow>18:00<color>; <color=yellow>Tr�n th� 2<color> b�t ��u b�o danh v�o<color=yellow>18:30<color>.",0)
	elseif nHour >= 22 and nHour <= 23 then
		Say("Xin l�i! Tr�n ��a �ang chu�n b�. <color=yellow>Tr�n th� 1<color> ��i chi�n b�t ��u b�o danh v�o <color=yellow>23:00<color>; <color=yellow>Tr�n th� 2<color> b�t ��u b�o danh v�o<color=yellow>23:30<color>.",0)
	end
	
end
function GameOverTalk()
	Say("L�i ��i �� k�t th�c! Xin ��i trong gi�y l�t!",0)
end

--51�ʦ��������̨˵��
function AboutShiMenGame()

local nSZNum = 0;
local nGZNum = 0;

	if GetTask(PLAYERAWARD_DATE) == Zgc_pub_week_seq() then
		nSZNum = GetTask(PLAYERAWARD_TIMES);
	end
	
	if GetTask(AUDIENCEAWARD_DATE) == Zgc_pub_week_seq() then
		nGZNum = GetTask(AUDIENCEAWARD_TIMES);
	end

	strTalk = {
		"Ng��i ch�i tr�n c�p 75, l�ch nhau kh�ng qu� 5 c�p ��u c� th� tham gia thi ��u. Chi�n th�ng s� nh�n ���c 1 quy�n Th�c Chi�n t�m ��c. Ng��i ch�i tr�n c�p 10 quan kh�n s� nh�n ���c 1 quy�n Quan Chi�n t�m ��c. M�i ng��i m�i tu�n c� th� nh�n t�i �a 20 quy�n Th�c Chi�n t�m ��c v� 40 quy�n Quan Chi�n t�m ��c. Ng��i tu�n n�y �� nh�n "..nSZNum.." quy�n Th�c Chi�n T�m ��c v� "..nGZNum.." quy�n Quan Chi�n T�m ��c.",
		}

	TalkEx("",strTalk);
	
end