
Include("\\script\\battles\\butcher\\head.lua")

function main()
	openbattlemain(1, 807, 20, 1, 1)
	openbattlemain(1, 809, 20, 2, 1)
end

function openbattlemain(battleid, mapid, ruleid, level, seriesid)

	oldSubWorld = SubWorld
	if (GetGlbValue(GLB_FORBIDBATTLE) == 1) then 
		print("any battle would be forbided, so this battle is ignored.");
		return
	end

	SetGlbValue(GLB_BATTLESTATE, 1) --���ø�ȫ�ֱ���Ϊ1����־��ǰ�������������ν�ս�۽׶Σ���ʱ������������ĳ��ڵ��Զ������ν�ս�۵ı����㣬����������ԭ�ν�ս����ͼ
	idx = SubWorldID2Idx(mapid);
	if (idx == -1) then 
		return
	end;
	if (level < 1 or level > 2) then
		print("battle level must 1 to 2, but now is "..level..", so it is error!");
		return
	end;
	battlekey = date("%m%d") * 100000 + random(100000)
	signidx = SubWorldID2Idx(tbGAME_SIGNMAP[level]);

	SubWorld = idx
	OpenMission(ruleid)

--	bt_setnormaltask2type()
	BT_SetView(PL_TOTALPOINT);--��ʾ��ͳ����ս��
	BT_SetView(PL_KILLPLAYER);--ɱ�����Ŀ
	BT_SetView(PL_BEKILLED);--����ұ�ɱ����
	BT_SetView(PL_MAXSERIESKILL);--��ն����
	
	BT_SetGameData(GAME_CAMP1, 0) --���õ�ǰ�η�����
	BT_SetGameData(GAME_CAMP2, 0) --���õ�ǰ�ɷ�����
	
	round = BT_GetGameData(GAME_ROUND)

	--���ø�ս�ֵ�����
	BT_SetGameData(GAME_KEY, battlekey) --��ű���ս�۵�Key��
	BT_SetGameData(GAME_BATTLEID, battleid);
	BT_SetGameData(GAME_MAPID, mapid);
	BT_SetGameData(GAME_RULEID, ruleid);
	BT_SetGameData(GAME_LEVEL, level)
	BT_SetGameData(GAME_BATTLESERIES, seriesid)
	BT_SetGameData(GAME_ROUND, round)
	
	level = BT_GetGameData(GAME_LEVEL);
	
	if (level <= 0) then
		print("Error!!!can not start battle because battlelevel <= 0")
		return
	end

	subworldid = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(subworldid);	
	ClearMapTrap(subworldid); 
	ClearMapObj(subworldid);
		
	--��õ�ͼ���Ӧ���趨�ļ���
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	
	--�õ��õ�ͼ�м�������
	areacount = tonumber(GetIniFileData(mapfile, "MapInfo", "Area_Count"))
	if (areacount <= 1) then
		print("battle"..BT_GetGameData(GAME_RULEID).." error! areacount <= 1");
		return
	end
	
	--��������������г�ȡ��������Ϊ˫����������
	s_area, j_area = bt_autoselectmaparea(mapfile,areacount)

	BT_SetGameData(GAME_CAMP1AREA, s_area);
	BT_SetGameData(GAME_CAMP2AREA, j_area);
	
	area_section1 = "Area_"..s_area;
	area_section2 = "Area_"..j_area;
-------------------------------------------------------------------------
--��ȡ��������Ĵ�Ӫ�ڵ�����
	--�Ӵ�Ӫ����Ӫʱ�������
    file = GetIniFileData(mapfile, area_section1 , "centertohomepos")
    x,y =bt_getadata(file)
	SetMissionV(MS_HOMEIN_X1, floor(x/32))
	SetMissionV(MS_HOMEIN_Y1, floor(y/32))

	file = GetIniFileData(mapfile, area_section2 , "centertohomepos")
    x,y = bt_getadata(file)
	SetMissionV(MS_HOMEIN_X2, floor(x/32))
	SetMissionV(MS_HOMEIN_Y2, floor(y/32))
	
	--�Ӻ�Ӫ����Ӫ�������
	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos")
	SetMissionS(1, file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X1, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y1, floor(y/32))

 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos")
	SetMissionS(2,file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X2, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y2, floor(y/32))
	
	--��Ӫ��ǰӪ�������
 	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos2")
	SetMissionS(3,file)
	x,y = bt_getadata(file)
	
 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos2")
	SetMissionS(4,file)
	x,y = bt_getadata(file)
-------------------------------------------------------------------------
	
	--�ڷ�Trap��
	--�ڷ�˫����Ӫ��Trap��

	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap")
	bt_addtrap(hometrapfile, FILE_HOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap");
	bt_addtrap(hometrapfile, FILE_HOMETRAP2)


	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertohometrap")
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertohometrap");
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP2)
	
	
	--�ڷ�˫����Ӫ��trap��

	centertrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	centertrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	
	--�ڷ�˫����Ӫ��ǰӪ��trap��
	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap2");
	bt_addtrap(hometrapfile, FILE_HOME2CENTERTRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap2");
	bt_addtrap(hometrapfile, FILE_HOME2CENTERTRAP2)

	--�ڷŶԻ�����Npc
	--��ҽ�İڷ�
	doctorxy = GetIniFileData(mapfile, "Area_"..s_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR1, TNPC_DOCTOR1, x * 32 ,y * 32 , "T�ng Nhu quan");


	doctorxy = GetIniFileData(mapfile, "Area_"..j_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR2, TNPC_DOCTOR2, x * 32, y * 32, "Li�u Nhu quan");
	
	
	--˧��İڷ�
--	symbolnpcfile = GetIniFileData(mapfile, "Area_"..s_area, "symbolnpc");
--	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL1, " ");
--	symbolnpcfile = GetIniFileData(mapfile, "Area_"..j_area, "symbolnpc");
--	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL2, " ");
	
	
	--������İڷ�
	depositxy = GetIniFileData(mapfile, "Area_"..s_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT1, x * 32,y * 32, "Th� kh�_T�ng");
	

	
	depositxy = GetIniFileData(mapfile, "Area_"..j_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT2, x * 32, y * 32, "Th� kh� Li�u");
	
	
	StartMissionTimer(MISSIONID, 40, TIMER_2);
	--���ģ����Ҫ��ÿX���Ӵ���һ�εĴ��������Բ�������
	StartMissionTimer(MISSIONID, 39, TIMER_1);
	
	SetMissionV(MS_STATE, 1);--��������
	
	if (level == 1) then
		lvlstr = "Khu v�c s� c�p"
		lvllimit = 40
	else
		lvlstr = "Khu v�c cao c�p"
		lvllimit = 70
	end
	
	RestMin, RestSec = GetMinAndSec(900);
	local str1 = lvlstr.."Thi�n M�n tr�n t�i Nh�n M�n quan hi�n �ang trong giai �o�n b�o danh. C�c t��ng s� mau ch�ng mang Anh h�ng l�nh ��n Nh�n M�n quan b�o danh tham chi�n! Th�i gian b�o danh c�n:"..RestMin.." ph�t. �i�u ki�n tham chi�n: ��ng c�p t�"..lvllimit.." tr� l�n.";
	
	AddGlobalNews(str1);
	Msg2Global(str1)
	CreateChannel("T�ng"..szGAME_GAMELEVEL[level].."D�ng th�c c�u s�t", 9)
	CreateChannel("Li�u"..szGAME_GAMELEVEL[level].."D�ng th�c c�u s�t", 10)

	BT_SetMissionName("D�ng th�c c�u s�t")
	BT_SetMissionDesc("B�i c�nh: N�m 1160 C�ng nguy�n, Li�u ch� Ho�n Nhan L��ng t�p h�p qu�n l�c, quy�t ��nh Nam h�, ti�u di�t T�ng tri�u. T��ng D��ng l� tr� ng�i ��u ti�n c�a qu�n Li�u, Th�nh T��ng D��ng s�p ng�p ch�m trong kh�i l�a binh �ao! <enter><enter><color=yellow>D�ng th�c C�u s�t: Tr�n chi�n tr��ng, ti�u di�t c�ng nhi�u qu�n ��ch c�ng nh�n ���c nhi�u ph�n th��ng �i�m chi�n c�ng cho phe m�nh. Phe n�o nhi�u �i�m chi�n c�ng s� gi�nh chi�n th�ng chung cu�c. <enter> Ng��i ch�i kh�ng ���c � l�i h�u doanh qu� 2 ph�t. Trong chi�n tr��ng kh�ng c� NPC chi�n ��u.")


	if (signidx >= 0) then
		SubWorld = signidx
	end

	local logstr_d = "Battle Start battleid\t"..battleid.."\trule\t"..ruleid.."\tIssue"..seriesid;
	print(logstr_d);
	WriteLog(logstr_d,"Nh�t k� T�ng Li�u");
	SubWorld = oldSubWorld
end;