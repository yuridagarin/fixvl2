--�Զ�����NPC�ű�������������ʱ����
Include("\\script\\online\\���ڻ\\newyear_head.lua")
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\viet_event\\longhu\\head.lua");
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");--Խ��09��7�»����ͷ�ļ�
Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\class\\ktabfile.lua");--tab�ļ�����
Include("\\script\\system_switch_config.lua")
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")
Include("\\script\\vng\\config\\newserver.lua");
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\equip_feed\\equip_feed_npc.lua")
Include("\\script\\online\\tong_feast\\tf_head.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online\\spring2014\\sp_head.lua")
Include("\\settings\\static_script\\gem\\imp_npc_gem.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

function main()
	addnpc_yanmenbattle_signup();
	init_xc_ls_sq()

	AddNpcCd();     --�ɶ�����ADD��NPC
	AddNpcXy();    --��������ADD��NPC
	AddNpcYz();     --��������ADD��NPC
	AddNpcWeekEnd();     --��ĩ�ADD��NPC
	AddNpcXl();     --�չ�����ADD��NPC
	Addxinan();     --���ϵ�ͼNPC
	-------------------
	AddNpcQz();     --Ȫ���¼�NPC
	AddTl();        --���ε�ͼ��ӵ�NPC
	Addsh();        --�̻���ӵ�NPC
	Addtj();        --ͨ��������ӵ�NPC
	Addtaohuadao();        --�����һ�����ӵ�NPC
	Addcangjian();        --�ؽ�ʹ��
	Addyangmen();        --�첨���ӵ�NPC
	AddChristmas()		--ʥ���ڻNPC���������Ժ���������ã�
	AddCheFu();		 --�ɼ���ͼ����
--	AddDragonBoatDay()	--�����
	Addjiehun()	        --���
	Addtianshi()	        --��ʦ�ؾ�npc
	AddXiBei()	        --������Npc

	AddTxNpc()			--̫��þ�NPC���
	ZoneInit(1010)		--̫��þ���ʼ����ͼTrap
	ZoneInit(2010)
	ZoneInit(3010)
	ZoneInit(4010)
	ZoneInit(5010)

	Addfengdutrap()    --�ᶼto���Ż���trap
	Addmenpaibuchong() --����trap�Ĳ���,����һЩ״̬�޷��ı�����
	AddXinshou()  ---����ָ���Ĳ�ѯnpc
	CreateGatherNpc()		-- ����ɼ��й���
	Addmenpai();     --����bossNPC
	AddNewBattle();		--��ս��NPC
	ApplyRelayInitData()	--ȡGameser��ʼ��ʱ��Ҫ��Relay��Ϣ
	zgc_auto_fun_main()		--�峤���Զ�����
	--AddSnowWarNpc()		--ѩ��NPC
	AddKillerHall()	--ɱ����
	AddCaijiNpc()	--�ɼ���ͼ��Ʒ������,�ɶ����ż���Ʒ������
	AddGongYe(); --��ұ����
	AddTongMission();	--���ؿ�
	AddGongChengNpc();	--����ս���NPC
	AddLiuTudi();--������ͽ��NPC
--	AddTyTuzi(); --���ĺ�����СѾ
	add_biwudahui();	--������
	add_faction_back_room();	--ʦ������
	add_weizhi_npc()
	AddFirstTongNpc()	--��һ��
	addLonghuNpc();		--Խ�Ͼ�Ӣ���ս ����npc
	Add67EventNpcs();--09��7�»NPC���
	AddNpcYecao();
--	add_0908_npc();--09��8�»NPC���
	add_0908_tuoguan_plant_npc();--�����й�����NPC���
--	add_0909_npc();--09��9������NPC���
--	add_0911_npc();
	if tonumber(date("%y%m%d")) >= 101224 and tonumber(date("%y%m%d")) <= 110113 then
		add_0912_npc();--09��12��NPC���
	end
	get_server_id() -- Set server ID
	Add_ip_npc() -- IP Bonus
	VBonus_NPC() -- Add NPC VBonus
	Add_bachtiensinh() -- B�ch Ti�n Sinh
	AddTuLinhNpc() -- NPC T� Linh
	if tonumber(date("%y%m%d")) >= 100924 and tonumber(date("%y%m%d")) <= 101028 then
		AddHangNga()  -- NPC H�ng Nga 2010
	end
	if tonumber(date("%y%m%d")) >= 110519 and tonumber(date("%y%m%d")) <= 110602 then
		AddIdolNpc()  -- Th�n T��ng V� L�m
	end
	
	if tonumber(date("%y%m%d")) <= 110102 then
		AddBirthdayNpc_2010()  -- S� Gi� H�at ��ng SN JX2
	end
--	Add_1002_npc() -- Hoa ��ng T�t
	Init_newres() -- T�i Nguy�n Chi�n
	--Init_golden_chest() -- R��ng HKLB
	Init_pet_fighting() -- Pet vs pet
	Add_PetNpc() -- B�c ��u L�o Nh�n
--	if GetGlbValue(GLB_TSK_SERVER_ID) == 58 then
--		Add_HoangHuynh()  -- NPC dua top Hoang Ung
--	end
	Add_GoldenCard_Manager(); -- B�n code HKLB ingame
	Add_XaPhu() -- Thuy�n gia
	Add_Pet_TaiXu() -- NPC Th�i H� B�n ��ng H�nh
	if tonumber(date("%y%m%d")) >= 110121 and tonumber(date("%y%m%d")) <= 110220 then
		add_1101_tet_npc()  -- NPC C�y N�u T�t 2011
	end	
	Add_TianMenZhen(); --��������npc
	Liangshan_Entrance();		--2011-2-23��ɽ����NPC����
     	Add_TuBaoThuongNhan()	
	DragonBoat_2011_npc()    --201109��������ս
	--LoadNpcList();--����npc_list.txt���õ�NPC
	create_treasuer_chests();--��������
	new_task_npc_create();--������ϵͳNPC���
	Ambassador_Acitivity(); --���ʹNPC���
	new_ttd_npc_create(); --ͨ�춥NPC����
	new_task_npc_create2();--�ؿ�ϵ������Npc
	LSB_Exec_CleanData();--������������������
	shenghuotai_npc_create(); --ʥ��̨����
	Activity_Npc_Add_201209();--9�»NPC����
	Qht_Activity_Event();--��սǧѰ��
	Bkl_baoruong() --B�ch Kim L�nh b�o r��ng
	if tonumber(date("%y%m%d")) >= 140124 and tonumber(date("%y%m%d")) <= 140203 then
		tuyetanh_baoruong() --Qu� Ng�(T�) B�o R��ng
		chieuda_baoruong()
		xichtho_baoruong()
	end
	npcVanMay() --Npc t�nh n�ng V�n May ��o H�u
	wujiang_task_npc_create();--�佫����npc����
	meihuayingchun_npc_create();--÷��ӭ��npc����
	zhenqi_battle_init();--����ս����ʼ��
	--kuafu_battle_init();--���ս��������
	equip_feed_OnServerStart();--����װ������NPC
	Vip_NPC()
	dixuangong_join_npc(); --������������
	biwu_3v3_init(); --3v3
	tf_CreateChef(); --����ʢ��
	wuwang_task_createnpc(); --��������npc����
	sp_CreateDecorate();--2014���ڻ
	--tong_melee_npc_create(); --����ʹ
	--kuafu_lingjiang_npc_create(); --��������콱�˴���
	Plus123Pay();
	AddTYNpc();	--̫һ�ؿ�npc
	AddLifeSkillNpc(); --��������NPC
	gem_OnServerStart()--��ӱ�ʯϵͳNpc
	_kf_create_npc_server_start()--������NPC����
	Observer:onEvent(SYSEVENT_GAMESERVER_START, 0)
	AddHeiYiZhuangShi();
end;

function ApplyRelayInitData()
	GetBattleData(0,7)			-- ȡս����Ϣ
	ApplyCityWarData(0,0)			-- ȡ����ս��Ϣ
	ApplyCityWarData(1,0)			-- ȡ����ս��Ϣ
	ApplyBWRankInfo()
end

tbGAME_SIGNMAP = {806, 808} --��¼���ȼ�������ĵ�ͼID�� ���ȼ����ͼ���߼��Ų�
function addnpc_yanmenbattle_signup()
	for i = 1, getn(tbGAME_SIGNMAP) do
		CreatBattleSignNpc(tbGAME_SIGNMAP[i])
	end
	local npcindex7 = CreateNpc("Xa phu Trung Nguy�n", "Xa phu phe T�ng", 806, 1754,3040)
	SetNpcScript(npcindex7, "\\script\\global\\�����õ�\\���ɱ�����\\npc\\song_transport.lua")

	local npcindex8 = CreateNpc("Xa phu", "Xa phu phe Li�u", 806, 1639,3200)
	SetNpcScript(npcindex8, "\\script\\global\\�����õ�\\���ɱ�����\\npc\\jin_transport.lua")
end

function CreatBattleSignNpc( mapid )
	if( SubWorldID2Idx( mapid ) >= 0 ) then	--����
		local npcindex1 = CreateNpc("V� binh th�nh m�n", "M� Binh Quan phe T�ng", mapid, 1728, 3083)
		local npcindex2 = CreateNpc("Nam nh�n ph��ng B�c3", "M� Binh Quan phe Li�u", mapid, 1652,3174)
		if mapid == 806 then
			SetNpcScript(npcindex1, "\\script\\newbattles\\song_primary_npc.lua")
			SetNpcScript(npcindex2, "\\script\\newbattles\\liao_primary_npc.lua")
		else
			SetNpcScript(npcindex1, "\\script\\battles\\battlejoin1.lua")
			SetNpcScript(npcindex2, "\\script\\battles\\battlejoin2.lua")
		end;

		local npcindex3 = CreateNpc("Quan s�-trung ni�n1", "T�ng Nhu quan", mapid, 1728,3065)
		SetNpcScript(npcindex3, "\\script\\global\\�����õ�\\���ɱ�����\\npc\\song_shop.lua")

		local npcindex4 = CreateNpc("Nam nh�n ph��ng B�c2", "Li�u Nhu quan", mapid, 1634,3175)
		SetNpcScript(npcindex4, "\\script\\global\\�����õ�\\���ɱ�����\\npc\\jin_shop.lua")
		------------------

		local npcindex7 = CreateNpc("Xa phu Trung Nguy�n", "Xa phu phe T�ng", mapid, 1754,3040)
		SetNpcScript(npcindex7, "\\script\\global\\�����õ�\\���ɱ�����\\npc\\song_transport.lua")

		local npcindex8 = CreateNpc("Xa phu", "Xa phu phe Li�u", mapid, 1639,3200)
		SetNpcScript(npcindex8, "\\script\\global\\�����õ�\\���ɱ�����\\npc\\jin_transport.lua")

	end
end

function AddNpcCd()
    local npcIndexGbdz = CreateNpc("C�i Bang m�n nh�n", "�� t� C�i Bang", 209,1701,3111);
    SetNpcScript(npcIndexGbdz, "\\script\\��ԭһ��\\ؤ��\\npc\\ؤ�����.lua");
end;

function AddNpcXy()
    local npcIndexDyx_1 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1382, 3186);
    local npcIndexDyx_2 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1299, 3193);
    local npcIndexDyx_3 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1358, 3016);
    local npcIndexDyx_4 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1426, 2916);

    local npcIndexDyx_5 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1143, 2931);
    local npcIndexDyx_6 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1219, 2910);
    local npcIndexDyx_7 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1271, 2974);
    local npcIndexDyx_8 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1222, 2985);
    local npcIndexDyx_9 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1116, 3020);
    local npcIndexDyx_10 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1269, 3092);
    local npcIndexDyx_11 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1236, 3147);
    local npcIndexDyx_12 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1356, 3149);
    local npcIndexDyx_13 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1352, 3087);
    local npcIndexDyx_14 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1307, 3079);
    local npcIndexDyx_15 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1404, 2968);
    local npcIndexDyx_16 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1326, 2949);
    local npcIndexDyx_17 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1386, 2926);
    local npcIndexDyx_18 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1428, 2966);
    local npcIndexDyx_19 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1501, 2915);
    local npcIndexDyx_20 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1525, 2935);
    local npcIndexDyx_21 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1573, 2979);
    local npcIndexDyx_22 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1552, 3028);
    local npcIndexDyx_23 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1539, 3110);
    local npcIndexDyx_24 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1571, 3166);
    local npcIndexDyx_25 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1540, 3198);
    local npcIndexDyx_26 = CreateNpc("R��ng c� th� m�", "R��ng ��c d��c", 309, 1501, 3174);
	local npcIndexJwyh = CreateNpc("Ng�n H�", "Ng�n H�", 324, 1822, 3005);
	SetNpcScript(npcIndexJwyh, "\\script\\��ԭ����\\���Ƕ�һ��\\npc\\��β����.lua");

	local npcIndexYlby = CreateNpc("��u l�nh S�n t�c", "��u l�nh S�n t�c", 322, 1491, 3323);
    SetNpcScript(npcIndexYlby, "\\script\\��ԭ����\\������һ��\\npc\\��ţɽ����.lua");
	local npcIndexZh1 = CreateNpc("Ph�p S� T�y H�", "Ph�p S� T�y H�", 311, 1352, 3117);
    SetNpcScript(npcIndexZh1, "\\script\\��ԭ����\\��ţɽ\\npc\\������ʦ.lua");

	local npcIndexZh2 = CreateNpc("Ph�p S� T�y H�", "Ph�p S� T�y H�", 311, 1439, 3144);
    SetNpcScript(npcIndexZh2, "\\script\\��ԭ����\\��ţɽ\\npc\\������ʦ.lua");

	local npcIndexZh3 = CreateNpc("Ph�p S� T�y H�", "Ph�p S� T�y H�", 311, 1442, 3033);
    SetNpcScript(npcIndexZh3, "\\script\\��ԭ����\\��ţɽ\\npc\\������ʦ.lua");
end;

function AddNpcYz()
    local npcIndexLs = CreateNpc("x�c L�i Th�ng", "Thi th� c�a L�i Th�ng", 111, 1849, 2887);
    SetNpcScript(npcIndexLs, "\\script\\������\\��Ϫ��\\npc\\��ʤ��ʬ��.lua");

    local npcIndexLshw1 = CreateNpc("X�c h� v� L�i Th�ng", "Thi th� h� v� c�a L�i Th�ng", 111, 1854, 2887);
    local npcIndexLshw2 = CreateNpc("X�c h� v� L�i Th�ng", "Thi th� h� v� c�a L�i Th�ng", 111, 1847, 2889);
    local npcIndexLshw3 = CreateNpc("X�c h� v� L�i Th�ng", "Thi th� h� v� c�a L�i Th�ng", 111, 1851, 2877);

    local npcIndexZbh = CreateNpc("Du Ph��ng ��i phu", "Tr��ng B� H�n", 150, 1711, 3115);
    SetNpcScript(npcIndexZbh, "\\script\\������\\����\\npc\\�Ų���.lua");

    local npcIndexBg = CreateNpc("T�i r�nh", "T�i t�m th��ng", 107, 1573, 2939);

    local npcIndexTn = CreateNpc("Hi�p n�", "���ng Ninh", 107,1417,2946);
    SetNpcScript(npcIndexTn, "\\script\\������\\����ɽ\\npc\\����.lua");

    local npcIndexLjy = CreateNpc("Du Ph��ng T��ng S�","L� Ti�n D�ng",150,1767,3111);
    SetNpcScript(npcIndexLjy, "\\script\\������\\����\\npc\\�����.lua");

    local npcIndexLxq = CreateNpc("V�n Du ��o Nh�n","L�u Huy�n Thanh",150,1579,3110);
    SetNpcScript(npcIndexLxq, "\\script\\������\\����\\npc\\������.lua");

    local npcIndexQr = CreateNpc("B� ch�", "Thu Dung", 150,1678,3028);
    SetNpcScript(npcIndexQr, "\\script\\������\\����\\npc\\����.lua");

    local npcIndexHql = CreateNpc("Th��ng C� H�a K� L�n", "Th��ng C� H�a K� L�n", 113, 1669, 3225);
    SetNpcScript(npcIndexHql, "\\script\\������\\��ˮ������\\npc\\������.lua");

    local npcIndexThj = CreateNpc("x�c L�i Th�ng", "Thi th� Th�i H�ng Tuy�t", 113, 1668, 3230);
    local npcIndexJt01 = CreateNpc("X�c h� v� L�i Th�ng", "Thi th� Xi H�a gi�o ��", 113, 1669, 3231);
    local npcIndexJt02 = CreateNpc("X�c h� v� L�i Th�ng", "Thi th� Xi H�a gi�o ��", 113, 1664, 3225);
    local npcIndexJt03 = CreateNpc("X�c h� v� L�i Th�ng", "Thi th� Xi H�a gi�o ��", 113, 1670, 3224);
    local npcIndexJt04 = CreateNpc("X�c h� v� L�i Th�ng", "Thi th� Xi H�a gi�o ��", 113, 1661, 3231);

   local npcIndexJw = CreateNpc("Thi�u ni�n nam1", "T��ng Duy", 150, 1679, 3237);
   SetNpcScript(npcIndexJw, "\\script\\������\\����\\npc\\��ά.lua");

    local npcIndexWyq = CreateNpc("T� Ho�n Ch�n", "Vi�n Tinh", 108, 1585, 3195);
    SetNpcScript(npcIndexWyq, "\\script\\������\\Ȫ�ݸ���\\npc\\��Զ��.lua");

    local npcIndexYg = CreateNpc("Ng� Qu�i ��u M�c", "Ng� Qu�i ��u M�c", 103, 1673, 3431);
    SetNpcScript(npcIndexYg, "\\script\\������\\��������һ\\npc\\���ͷĿ.lua");
end;

function AddNpcWeekEnd()
    local npcIndexZzd = CreateNpc("T�ng T��ng Qu�n", "��i s� ho�t ��ng cu�i tu�n", 200, 1380, 2872);
    SetNpcScript(npcIndexZzd, "\\script\\task\\WeekEnd\\���ӵ�.lua");

    local npcXyZzd = CreateNpc("T�ng T��ng Qu�n", "��i s� ho�t ��ng cu�i tu�n", 350, 1452, 2967);
    SetNpcScript(npcXyZzd, "\\script\\task\\WeekEnd\\���ӵ�.lua");

    local npcXyBm1 = CreateNpc("V� binh th�nh m�n", "Ch� huy s�", 350, 1503, 3024);
    SetNpcScript(npcXyBm1, "\\script\\task\\WeekEnd\\����ָ��ʹ.lua");

    local npcYzZzd = CreateNpc("T�ng T��ng Qu�n", "��i s� ho�t ��ng cu�i tu�n", 150, 1714, 3137);
    SetNpcScript(npcYzZzd, "\\script\\task\\WeekEnd\\���ӵ�.lua");

   	local npcYzBm1 = CreateNpc("V� binh th�nh m�n", "Ch� huy s�", 150, 1682, 3161);
    SetNpcScript(npcYzBm1, "\\script\\task\\WeekEnd\\����ָ��ʹ.lua");

    local npcIndexBm = CreateNpc("V� binh th�nh m�n", "Ch� huy s�", 100, 1423, 2985);
    SetNpcScript(npcIndexBm, "\\script\\task\\WeekEnd\\����ָ��ʹ.lua");

    --���ܵ�ͼ�ĳ�ʼ��NPC
    local npc1 = CreateNpc("V� binh th�nh m�n", "T��ng l�nh ti�n tuy�n", 951, 1333, 2844);
    SetNpcScript(npc1, "\\script\\task\\WeekEnd\\man_killwk.lua");
    local npc2 = CreateNpc("V� binh th�nh m�n", "T��ng l�nh ti�n tuy�n", 952, 1333, 2844);
    SetNpcScript(npc2, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc3 = CreateNpc("V� binh th�nh m�n", "T��ng l�nh ti�n tuy�n", 953, 1333, 2844);
    SetNpcScript(npc3, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc4 = CreateNpc("V� binh th�nh m�n", "T��ng l�nh ti�n tuy�n", 954, 1333, 2844);
    SetNpcScript(npc4, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc5 = CreateNpc("V� binh th�nh m�n", "T��ng l�nh ti�n tuy�n", 955, 1333, 2844);
    SetNpcScript(npc5, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc6 = CreateNpc("V� binh th�nh m�n", "T��ng l�nh ti�n tuy�n", 956, 1333, 2844);
    SetNpcScript(npc6, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc7 = CreateNpc("V� binh th�nh m�n", "T��ng l�nh ti�n tuy�n", 957, 1333, 2844);
    SetNpcScript(npc7, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc8 = CreateNpc("V� binh th�nh m�n", "T��ng l�nh ti�n tuy�n", 958, 1333, 2844);
    SetNpcScript(npc8, "\\script\\task\\WeekEnd\\man_killwk.lua");
 	local npc9 = CreateNpc("V� binh th�nh m�n", "T��ng l�nh ti�n tuy�n", 959, 1333, 2844);
    SetNpcScript(npc9, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc10 = CreateNpc("V� binh th�nh m�n", "T��ng l�nh ti�n tuy�n", 960, 1333, 2844);
    SetNpcScript(npc10, "\\script\\task\\WeekEnd\\man_killwk.lua");

	local liguan1 = CreateNpc("T� Thanh Th��ng Nh�n", "L� quan", 100, 1512, 2990);
	SetNpcScript(liguan1, "\\script\\��ԭһ��\\�꾩\\npc\\�����ܹ�.lua");

	local liguan2 = CreateNpc("T� Thanh Th��ng Nh�n", "L� quan", 300, 1787, 3497);
	SetNpcScript(liguan2, "\\script\\��ԭһ��\\�꾩\\npc\\�����ܹ�.lua")
    --AddWk(15, 10);
end;

function AddNpcXl()
    local npcIndexSl = CreateNpc("Thi�u L�m T�ng Nh�n","Qu� �i h� t�ng nh�n",814,1626,3149);  --������ͼ�����ִ�����
    SetNpcScript(npcIndexSl, "\\script\\task\\practice\\���ش�����.lua");

    local npcIndexWd = CreateNpc("V� �ang  m�n nh�n","Qu� �i h� t�ng nh�n",812,1622,3093);  --������ͼ���䵱������
    SetNpcScript(npcIndexWd, "\\script\\task\\practice\\���ش�����.lua");

    local npcIndexEm = CreateNpc("Nga My m�n nh�n","Qu� �i h� t�ng nh�n",816,1626,3149);  --������ͼ�Ķ��Ҵ�����
    SetNpcScript(npcIndexEm, "\\script\\task\\practice\\���ش�����.lua");

    local npcIndexGb = CreateNpc("C�i Bang m�n nh�n","Qu� �i h� t�ng nh�n",815,1373,3118);  --������ͼ��ؤ�ﴫ����
    SetNpcScript(npcIndexGb, "\\script\\task\\practice\\���ش�����.lua");

    local npcIndexTm = CreateNpc("���ng M�n T�n m�n nh�n","Qu� �i h� t�ng nh�n",813,1677,2983);  --������ͼ�����Ŵ�����
    SetNpcScript(npcIndexTm, "\\script\\task\\practice\\���ش�����.lua");

		local npcIndexYm = CreateNpc("V� binh th�nh m�n", "Qu� �i h� t�ng nh�n", 817,1457,2972);	--������ͼ�����Ŵ�����
    SetNpcScript(npcIndexYm, "\\script\\task\\practice\\���ش�����.lua");

    local npcIndexWp = CreateNpc("Ng� ��c h� ph�p", "Qu� �i h� t�ng nh�n", 422,1628,3508);	--������ͼ�嶾������
    SetNpcScript(npcIndexWp, "\\script\\task\\practice\\���ش�����.lua");

end;

function AddNpcQz()
    local npcIndexLfs = CreateNpc("Thi�u ni�n trong th�n", "L� Phong Thu", 100, 1607, 2970);
    SetNpcScript(npcIndexLfs, "\\script\\��ԭ����\\�ɶ�\\npc\\�ո�ѧϰ.lua");

    local npcIndexLys = CreateNpc("Du Ph��ng ��i phu", "L�m D��c S�", 100, 1558, 2958);
    SetNpcScript(npcIndexLys, "\\script\\��ԭһ��\\�꾩\\npc\\��ҩѧϰ.lua");
end;
function AddXsTg()
    local npcIndexCd = CreateNpc("B�n s�ch", "S� gi�", 300, 1638, 3575);
    SetNpcScript(npcIndexCd, "\\script\\��ԭ����\\�ɶ�\\npc\\�����ƹ�Ա.lua");

    local npcIndexQz = CreateNpc("B�n s�ch", "S� gi�", 100, 1451, 2821);
    SetNpcScript(npcIndexQz, "\\script\\������\\Ȫ��\\npc\\�����ƹ�Ա.lua");

    local npcIndexBj = CreateNpc("B�n s�ch", "S� gi�", 200, 1159, 2839);
    SetNpcScript(npcIndexBj, "\\script\\��ԭһ��\\�꾩\\npc\\�����ƹ�Ա.lua");

end;
function AddTl()
    local npcIndex = CreateNpc("Nha d�ch", " Ng�c t�t", 701, 1376, 3143);
    SetNpcScript(npcIndex, "\\script\\task\\prison\\jailer_npc.lua");
 	npcIndex = CreateNpc("Nha d�ch", "B� kho�i", 200, 1397, 2653);
    SetNpcScript(npcIndex, "\\script\\task\\prison\\gaoler_npc.lua");
end;

function AddWk(nDistanceX, nDistanceY)
    rect_table = {
        {1294, 2854, 1501, 3119},
        {1294, 3119, 1482, 3169},
        {1508, 2973, 1534, 3034},
        {1534, 2842, 1578, 2894},
        {1554, 2901, 1580, 2908},
        {1519, 2913, 1538, 2926}
    };
    local sp = {   --ÿ��ͼ�Ŀ�ʼ���꣬��ͼID��NPCģ������
        {1294, 2854, 907, "Oa Kh�u"},
        {1294, 2854, 908, "Oa Kh�u Binh s�"},
        {1294, 2854, 909, "Oa Kh�u Th�y Binh"},
        {1294, 2854, 910, "Oa Kh�u L�c Binh"},
        {1294, 2854, 911, "Oa Kh�u V� S�"}
    };
    for index, v in sp do
        local nCount = getn(rect_table);
        for i = 1, nCount do
            for nX = rect_table[i][1], rect_table[i][3], nDistanceX do
                for nY = rect_table[i][2], rect_table[i][4], nDistanceY do
                    CreateNpc(v[4], v[4], v[3], nX, nY);
                end;
            end;
        end;
    end;

end;
function Addsh()
    local npcIndexshxjqz = CreateNpc("G�nh h�ng", "H�nh C��c Th��ng Nh�n", 100, 1462, 2922);
    SetNpcScript(npcIndexshxjqz, "\\script\\��ԭһ��\\�꾩\\npc\\�н�����.lua");

    local npcIndexshxjyz = CreateNpc("G�nh h�ng", "H�nh C��c Th��ng Nh�n", 150, 1698, 3203);
    SetNpcScript(npcIndexshxjyz, "\\script\\��ԭһ��\\�꾩\\npc\\�н�����.lua");

    local npcIndexshxy = CreateNpc("Ch� c�m �� Trung Nguy�n", "Ch� th��ng h�i", 350, 1456, 2925);
    SetNpcScript(npcIndexshxy, "\\script\\��ԭһ��\\�꾩\\npc\\�̻��ϰ�.lua");

    local npcIndexshyz = CreateNpc("Ch� c�m �� Trung Nguy�n", "Ch� th��ng h�i", 150, 1636, 3139);
    SetNpcScript(npcIndexshyz, "\\script\\��ԭһ��\\�꾩\\npc\\�̻��ϰ�.lua");

    local npcIndexsmsr = CreateNpc("L�o ph� h�", "Th��ng Nh�n th�n b�", 200, 1488, 2826);
    SetNpcScript(npcIndexsmsr, "\\script\\��ԭһ��\\�꾩\\npc\\��������.lua");
end;

function Addtj()
    local npcIndextjqz = CreateNpc("Nha d�ch", "B� ��u", 100, 1518, 2988);
    SetNpcScript(npcIndextjqz, "\\script\\��ԭ����\\�ɶ�\\npc\\��ͷ.lua");

    local npcIndextjyz = CreateNpc("Nha d�ch", "B� ��u", 150, 1739, 3158);
    SetNpcScript(npcIndextjyz, "\\script\\��ԭ����\\�ɶ�\\npc\\��ͷ.lua");

    local npcIndextjxy = CreateNpc("Nha d�ch", "B� ��u", 350, 1507, 2997);
    SetNpcScript(npcIndextjxy, "\\script\\��ԭ����\\�ɶ�\\npc\\��ͷ.lua");

    local npcIndextjztx = CreateNpc("C� gi�", "Tr�c Thi�n H�nh", 350, 1427, 3024);
    SetNpcScript(npcIndextjztx, "\\script\\��ԭ����\\����\\npc\\׿����.lua");
end;

function Addtaohuadao()
    local npcIndextaohuadao1 = CreateNpc("Xa phu Trung Nguy�n", "Thuy�n phu H�i T�n", 104,1568,2975);
    SetNpcScript(npcIndextaohuadao1, "\\script\\������\\����������\\npc\\��������2����.lua");

    local npcIndextaohuadao2 = CreateNpc("Xa phu Trung Nguy�n", "Thuy�n Phu ��o Hoa ��o", 102,1459,3163);
    SetNpcScript(npcIndextaohuadao2, "\\script\\������\\�һ���\\npc\\�һ�������.lua");
end;


function Addcangjian()
    local npcIndexcangjian1 = CreateNpc("V��ng An Th�ch", "S� gi� T�ng Ki�m", 300,1776,3703);
    SetNpcScript(npcIndexcangjian1, "\\script\\�ؽ�ɽׯ\\task_script\\�ɶ�\\�ؽ�ʹ��.lua");

    local npcIndexcangjian2 = CreateNpc("V��ng An Th�ch", "S� gi� T�ng Ki�m", 200,1229,2762);
    SetNpcScript(npcIndexcangjian2, "\\script\\�ؽ�ɽׯ\\task_script\\�꾩\\�ؽ�ʹ��.lua");

    local npcIndexcangjian3 = CreateNpc("V��ng An Th�ch", "S� gi� T�ng Ki�m", 100,1510,3106);
    SetNpcScript(npcIndexcangjian3, "\\script\\�ؽ�ɽׯ\\task_script\\Ȫ��\\�ؽ�ʹ��.lua");

    local npcIndexcangjian4 = CreateNpc("V��ng An Th�ch", "S� gi� T�ng Ki�m", 350,1395,2851);
    SetNpcScript(npcIndexcangjian4, "\\script\\�ؽ�ɽׯ\\task_script\\����\\�ؽ�ʹ��.lua");

    local npcIndexcangjian5 = CreateNpc("V��ng An Th�ch", "S� gi� T�ng Ki�m", 150,1745,3119);
    SetNpcScript(npcIndexcangjian5, "\\script\\�ؽ�ɽׯ\\task_script\\����\\�ؽ�ʹ��.lua");

end;


function Addyangmen()
    local npcIndexyangmen1 = CreateNpc("D��ng Di�n Chi�u", "D��ng Di�n Chi�u", 219,1543,2939);
    SetNpcScript(npcIndexyangmen1, "\\script\\��ԭһ��\\�첨�\\npc\\������.lua");

    local npcIndexyangmen2 = CreateNpc("D��ng B�i Phong", "D��ng B�i Phong", 219,1454,3107);
    SetNpcScript(npcIndexyangmen2, "\\script\\��ԭһ��\\�첨�\\npc\\���ŷ�.lua");

    local npcIndexyangmen3 = CreateNpc("D��ng T�n B�o", "D��ng T�n B�o", 219,1559,3084);
    SetNpcScript(npcIndexyangmen3, "\\script\\��ԭһ��\\�첨�\\npc\\���ڱ�.lua");

    local npcIndexyangmen4 = CreateNpc("M�c Qu� Anh", "M�c Qu� Anh", 219,1481,3184);
    SetNpcScript(npcIndexyangmen4, "\\script\\��ԭһ��\\�첨�\\npc\\�¹�Ӣ.lua");

    local npcIndexyangmen5 = CreateNpc("Qu�n gia", "D��ng H�ng", 219,1634,3278);
    SetNpcScript(npcIndexyangmen5, "\\script\\��ԭһ��\\�첨�\\npc\\���.lua");

    local npcIndexyangmen6 = CreateNpc("Xa Th�i Qu�n", "Xa Th�i Qu�n", 219,1529,3137);
    SetNpcScript(npcIndexyangmen6, "\\script\\��ԭһ��\\�첨�\\npc\\��̫��.lua");

    local npcIndexyangmen7 = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 219,1599,3140);
    SetNpcScript(npcIndexyangmen7, "\\script\\��ԭһ��\\�첨�\\npc\\��ԭ�����.lua");

end;

function AddChristmas()
		local npcIndexWilson = CreateNpc("Truy�n gi�o s�","Uy Nh� T�n",100,1308,2930);	--Ȫ��
		SetNpcScript(npcIndexWilson,"\\script\\online\\zgc_npc_dialog.lua");
		local npcIndexchurchman1 = CreateNpc("Truy�n gi�o s�","Gi�o s�",200,1333,2811);
		--SetNpcScript(npcIndexchurchman1,"\\script\\online\\zgc_npc_dialog.lua");
		--SetNpcScript(npcIndexchurchman1,"\\script\\online_activites\\2011_11\\activity_02\\missionaries_npc.lua")
		SetNpcScript(npcIndexchurchman1, "\\script\\��ԭһ��\\�꾩\\npc\\���󴫽�ʿ.lua");
		local npcIndexchurchman2 = CreateNpc("Truy�n gi�o s�","Gi�o s�",300,1707,3546);
		SetNpcScript(npcIndexchurchman2, "\\script\\��ԭһ��\\�꾩\\npc\\���󴫽�ʿ.lua");
		local npcIndexRosa = CreateNpc("Phu nh�n T�y D��ng","La Sa",100,1526,2948);
		--SetNpcScript(npcIndexRosa,"\\script\\online\\viet_event\\binhchon_sangtac\\head.lua");
		--SetNpcScript(npcIndexRosa,"\\script\\online_activites\\2011_12\\qingrenjie\\sale_chocolate.lua");
		--SetNpcScript(npcIndexRosa,"\\script\\online_activites\\201202\\zengsongpifeng\\send_pifeng.lua");
		--SetNpcScript(npcIndexRosa,"\\script\\vng\\lasa\\la_sa.lua");
		--SetNpcScript(npcIndexRosa,"\\script\\online\\viet_event\\DuaTopBangHoiLienServer\\DuaTop.lua");
		SetNpcScript(npcIndexRosa,"\\script\\������\\Ȫ��\\npc\\��ɯ.lua");
end

function Addxinan()
    local npcIndexxinan1 = CreateNpc("Xi H�a ��i h� ph�p", "Xi H�a ��i h� ph�p", 417,1642,3382);
    SetNpcScript(npcIndexxinan1, "\\script\\������\\��ˮ������\\npc\\��󻤷�.lua");

    local npcIndexxinan2 = CreateNpc("D� Xoa Nha", "D� Xoa", 417,1815,3412);
    SetNpcScript(npcIndexxinan2, "\\script\\������\\��ˮ������\\npc\\ҹ��.lua");

    local npcIndexxinan3 = CreateNpc("T�ng �c", "Xi H�a �c t�ng", 416,1724,2821);
    SetNpcScript(npcIndexxinan3, "\\script\\������\\��ˮ��һ��\\npc\\��ɮ��.lua");

    local npcIndexxinan4 = CreateNpc("Quan s�-trung ni�n1", "Cao Th�ng Tuy�n", 400,1537,3050);
    SetNpcScript(npcIndexxinan4, "\\script\\������\\����\\npc\\����Ȫ.lua");

    local npcIndexxinan5 = CreateNpc("B� ch�", "Tr�nh Qu�n Chi", 400,1593,2928);
    SetNpcScript(npcIndexxinan5, "\\script\\������\\����\\npc\\֣��֮.lua");

    local npcIndexxinan6 = CreateNpc("C� gi�", "��ng Gi� La", 400,1522,2848);
    SetNpcScript(npcIndexxinan6, "\\script\\������\\����\\npc\\������.lua");

    local npcIndexxinan7 = CreateNpc("Qu�n gia", "Tr�n L�p H�nh", 400,1470,2847);
    SetNpcScript(npcIndexxinan7, "\\script\\������\\����\\npc\\������.lua");

    local npcIndexxinan8 = CreateNpc("Thi�u ni�n nam1", "L�u �i�n", 400,1443,3018);
    SetNpcScript(npcIndexxinan8, "\\script\\������\\����\\npc\\����.lua");

    local npcIndexxinan9 = CreateNpc("Ng�c H�a Cu�ng Nh�n", "Ng�c H�a Cu�ng Nh�n", 401,1568,3085);
    SetNpcScript(npcIndexxinan9, "\\script\\������\\���ɽ\\npc\\�������.lua");

    local npcIndexxinan10 = CreateNpc("Xi H�a T�ng ��n ch�", "Xi H�a T�ng ��n ch�", 413,1697,3192);
    SetNpcScript(npcIndexxinan10, "\\script\\������\\���۶�����\\npc\\�����̳��.lua");

    local npcIndexxinan11 = CreateNpc("A Tu La", "A Tu La", 413,1701,3474);
    SetNpcScript(npcIndexxinan11, "\\script\\������\\���۶�����\\npc\\������.lua");

    local npcIndexxinan12 = CreateNpc("Xi H�a ��i tr��ng l�o", "Xi H�a ��i tr��ng l�o", 412,1553,2976);
    SetNpcScript(npcIndexxinan12, "\\script\\������\\���۶�һ��\\npc\\�����.lua");

    local npcIndexxinan13 = CreateNpc("Mi�u L�nh D�ng S�", "Mi�u L�nh D�ng S�", 408,1321,3004);
    SetNpcScript(npcIndexxinan13, "\\script\\������\\����\\npc\\������ʿ.lua");

    local npcIndexxinan14 = CreateNpc("Nam nh�n T�y Nam", "T�c tr��ng Mi�u L�nh", 408,1300,3140);
    SetNpcScript(npcIndexxinan14, "\\script\\������\\����\\npc\\�����峤.lua");

    local npcIndexxinan15 = CreateNpc("��i tr��ng h� v�", "��i tr��ng h� v�", 409,1820,3518);
    SetNpcScript(npcIndexxinan15, "\\script\\������\\ǧѰ��һ��\\npc\\�����ӳ�.lua");

    local npcIndexxinan16 = CreateNpc("Ki�n ��t B�", "Ki�n ��t B�", 409,1849,3598);
    SetNpcScript(npcIndexxinan16, "\\script\\������\\ǧѰ��һ��\\npc\\Ǭ����.lua");

    local npcIndexxinan17 = CreateNpc("Thi�n T�m N�p S�", "Thi�n T�m N�p S�", 410,1694,3134);
    SetNpcScript(npcIndexxinan17, "\\script\\������\\ǧѰ������\\npc\\ǧѰ��ʦ.lua");

    local npcIndexxinan18 = CreateNpc("Kh�n Na La", "Kh�n Na La", 410,1693,3183);
    SetNpcScript(npcIndexxinan18, "\\script\\������\\ǧѰ������\\npc\\������.lua");

    local npcIndexxinan19 = CreateNpc("Ng� ��c �m C�", "Ng� ��c �m C�", 419,1774,3129);
    SetNpcScript(npcIndexxinan19, "\\script\\������\\�����Թ���\\npc\\Ԧ������.lua");

    local npcIndexxinan20 = CreateNpc("H� C�t ��c Nh�n", "H� C�t ��c Nh�n", 418,1512,2825);
    SetNpcScript(npcIndexxinan20, "\\script\\������\\�����Թ�һ\\npc\\���Ƕ���.lua");

    local npcIndexxinan21 = CreateNpc("Ng�c H�a Nh�n", "Ng�c H�a Nh�n", 406,1404,2770);
    SetNpcScript(npcIndexxinan21, "\\script\\������\\����ɽ\\npc\\������.lua");

    local npcIndexxinan22 = CreateNpc("B�n �i�p Nh�n", "B�n �i�p Nh�n", 405,1555,2959);
    SetNpcScript(npcIndexxinan22, "\\script\\������\\����ɽ��\\npc\\�����.lua");

    local npcIndexxinan23 = CreateNpc("Ma H� La Gi�", "Ma H� La Gi�", 402,1319,2955);
    SetNpcScript(npcIndexxinan23, "\\script\\������\\��˫���ɱ���\\npc\\Ħ������.lua");

    local npcIndexxinan24 = CreateNpc("Nh� Ho�ng T�_��i L�", "Nh� ho�ng t� �o�n T� Thu�n", 403,1458,2842);
    SetNpcScript(npcIndexxinan24, "\\script\\������\\��˫�����ϲ�\\npc\\���������.lua");

    local npcIndexxinan25 = CreateNpc("�o�n Th�a �n", "�o�n Th�a �n", 403,1537,2967);
    SetNpcScript(npcIndexxinan25, "\\script\\������\\��˫�����ϲ�\\npc\\�γж�.lua");

    local npcIndexxinan26 = CreateNpc("Mi�u L�nh Th� l�nh", "Mi�u L�nh Th� l�nh", 421,1576,3469);
    SetNpcScript(npcIndexxinan26, "\\script\\������\\���Ӷ�����\\npc\\��������.lua");

    local npcIndexxinan27 = CreateNpc("Ng� ��c T�n Ch��ng M�n", "B�ch Doanh Doanh", 407,1615,3182);
    SetNpcScript(npcIndexxinan27, "\\script\\������\\�嶾��\\npc\\��ӨӨ.lua");

    local npcIndexxinan28 = CreateNpc("Xi H�a Y�u N�", "Xi H�a Y�u N�", 404,1346,3144);
    SetNpcScript(npcIndexxinan28, "\\script\\������\\����\\npc\\������.lua");

    local npcIndexxinan29 = CreateNpc("T�y Nam Mi�u Nh�n", "C�u S�ch", 407,1572,3159);
    SetNpcScript(npcIndexxinan29, "\\script\\������\\�嶾��\\npc\\����.lua");

    local npcIndexxinan30 = CreateNpc("Nam nh�n T�y Nam", "Ph��ng Vi�n", 407,1549,3184);
    SetNpcScript(npcIndexxinan30, "\\script\\������\\�嶾��\\npc\\��Գ.lua");

    local npcIndexxinan31 = CreateNpc("Ng� ��c gi�o ch�", "V�u Dung", 407,1643,3233);
    SetNpcScript(npcIndexxinan31, "\\script\\������\\�嶾��\\npc\\����.lua");

    local npcIndexxinan32 = CreateNpc("Ng� ��c gi�o ��", "T�y ��", 407,1606,3279);
    SetNpcScript(npcIndexxinan32, "\\script\\������\\�嶾��\\npc\\��ͼ.lua");

    local npcIndexxinan33 = CreateNpc("Ch� ti�m v�i T�y Nam", "Li�u T�n Tr�c", 407,1606,3220);
    SetNpcScript(npcIndexxinan33, "\\script\\������\\�嶾��\\npc\\������.lua");

    local npcIndexxinan34 = CreateNpc("Ng� ��c Ph� gi�o ch�", "Ng� Ng�n", 407,1594,3171);
    SetNpcScript(npcIndexxinan34, "\\script\\������\\�嶾��\\npc\\����.lua");

    local npcIndexxinan35 = CreateNpc("Ng� ��c Ph� gi�o ch�", "H�ng L�p", 407,1551,3265);
    SetNpcScript(npcIndexxinan35, "\\script\\������\\�嶾��\\npc\\����.lua");

    local npcIndexxinan36 = CreateNpc("Ng� ��c gi�o ��", "Th�i Quang", 407,1556,3216);
    SetNpcScript(npcIndexxinan36, "\\script\\������\\�嶾��\\npc\\̩��.lua");

    local npcIndexxinan37 = CreateNpc("S�i Ho�ng Nhi", "S�i Ho�ng Nhi", 404,1570,2725);
    SetNpcScript(npcIndexxinan37, "\\script\\������\\����\\npc\\��˶�.lua");

    local npcIndexxinan38 = CreateNpc("Th�y Y�n h� ph�p", "H� M�n", 404,1599,2760);
    SetNpcScript(npcIndexxinan38, "\\script\\������\\����\\npc\\����.lua");

    local npcIndexxinan39 = CreateNpc("Th�y Y�n ch��ng m�n", "L�u Thanh Mi", 404,1543,2693);
    SetNpcScript(npcIndexxinan39, "\\script\\������\\����\\npc\\����ü.lua");

    local npcIndexxinan40 = CreateNpc("Hi�p n�", "Chu T� V�n",404,1524,2719);
    SetNpcScript(npcIndexxinan40, "\\script\\������\\����\\npc\\������.lua");

    local npcIndexxinan41 = CreateNpc("T� Ho�n Ch�n", "H� Man Th�nh", 404,1577,2784);
    SetNpcScript(npcIndexxinan41, "\\script\\������\\����\\npc\\������.lua");

    local npcIndexxinan42 = CreateNpc("Th�y Y�n m�n nh�n", "H� H�i", 404,1493,2746);
    SetNpcScript(npcIndexxinan42, "\\script\\������\\����\\npc\\��г.lua");

    local npcIndexxinan43 = CreateNpc("Th�y Y�n h� ph�p", "X�o X�o", 404,1474,2838);
    SetNpcScript(npcIndexxinan43, "\\script\\������\\����\\npc\\����.lua");

    local npcIndexxinan44 = CreateNpc("Xa phu T�y Nam", "Xa phu ��i L�", 400,1549,2882);
    SetNpcScript(npcIndexxinan44, "\\script\\������\\����\\npc\\������.lua");

    local npcIndexxinan45 = CreateNpc("Ch� ti�m �� T�y Nam", "Ch� Kim ho�n", 400,1497,2940);
    SetNpcScript(npcIndexxinan45, "\\script\\������\\����\\npc\\��Ʒ���ϰ�.lua");

    local npcIndexxinan46 = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 400,1553,2914);
    SetNpcScript(npcIndexxinan46, "\\script\\������\\����\\npc\\��Ʒ�����˱�.lua");

    local npcIndexxinan47 = CreateNpc("Ch� c�m �� T�y Nam", "Ch� t�u l�u", 400,1524,2894);
    SetNpcScript(npcIndexxinan47, "\\script\\������\\����\\npc\\��¥�ϰ�.lua");

    local npcIndexxinan48 = CreateNpc("T� Thanh Th��ng Nh�n", "L� quan", 400,1506,2847);
    SetNpcScript(npcIndexxinan48, "\\script\\��ԭһ��\\�꾩\\npc\\�����ܹ�.lua");

    local npcIndexxinan49 = CreateNpc("Ch��ng d��c Th� Ph�n", "Ch� T�p h�a", 400,1511,2955);
    SetNpcScript(npcIndexxinan49, "\\script\\������\\����\\npc\\�ӻ����ϰ�.lua");

    local npcIndexxinan50 = CreateNpc("Tr�nh Di", "Ch� th��ng h�i", 400,1486,2924);
    SetNpcScript(npcIndexxinan50, "\\script\\������\\����\\npc\\�̻��ϰ�.lua");

    local npcIndexxinan51 = CreateNpc("Ch��ng d��c T�y Nam", "Ch� D��c �i�m", 400,1522,3007);
    SetNpcScript(npcIndexxinan51, "\\script\\������\\����\\npc\\ҩ���ϰ�.lua");

    local npcIndexxinan52 = CreateNpc("V� L�m Minh Ch�1", "S� gi� m�n ph�i", 400,1548,2981);
    SetNpcScript(npcIndexxinan52, "\\script\\������\\����\\npc\\���ɽ�����.lua");

    local npcIndexxinan53 = CreateNpc("Ch� ti�m v� kh� T�y Nam", "Ch� Ti�m Nam ph�c", 400,1471,2956);
    SetNpcScript(npcIndexxinan53, "\\script\\������\\����\\npc\\��װ���ϰ�.lua");

    local npcIndexxinan54 = CreateNpc("Ch� ti�m v�i T�y Nam", "Ch� Ti�m N� ph�c", 400,1498,2969);
    SetNpcScript(npcIndexxinan54, "\\script\\������\\����\\npc\\Ůװ���ϰ�.lua");

    local npcIndexxinan55 = CreateNpc("Xa phu T�y Nam", "Xa phu ��i L�", 400,1574,3110);
    SetNpcScript(npcIndexxinan55, "\\script\\������\\����\\npc\\������.lua");

    local npcIndexxinan56 = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 400,1527,3112);
    SetNpcScript(npcIndexxinan56, "\\script\\������\\����\\npc\\��Ʒ�����˶�.lua");

    local npcIndexxinan57 = CreateNpc("Xa phu T�y Nam", "Xa phu ��i L�", 400,1465,3110);
    SetNpcScript(npcIndexxinan57, "\\script\\������\\����\\npc\\������.lua");

    local npcIndexxinan58 = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 400,1456,3071);
    SetNpcScript(npcIndexxinan58, "\\script\\������\\����\\npc\\��Ʒ��������.lua");

    local npcIndexxinan59 = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 407,1621,3249);
    SetNpcScript(npcIndexxinan59, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua");

    local npcIndexxinan60 = CreateNpc("Ch� V� kh� Trung Nguy�n", "Ch� Ti�m v� kh�", 400,1566,3005);
    SetNpcScript(npcIndexxinan60, "\\script\\������\\����\\npc\\�������ϰ�.lua");

    local npcIndexxinan61 = CreateNpc("Ch� V� kh� Trung Nguy�n", "Minh S� Ph�", 350,1546,2930);
    SetNpcScript(npcIndexxinan61, "\\script\\��ԭ����\\����\\npc\\��ñ����.lua");

    local npcIndexxinan62 = CreateNpc("Thi�u n� Mi�u T�c", "T� Quy�n", 400,1409,2980);
    SetNpcScript(npcIndexxinan62, "\\script\\������\\����\\npc\\�ƿ㼼��.lua");

    local npcIndexxinan63 = CreateNpc("V�n Du ��o Nh�n", "M�c Qu�n ��o tr��ng", 100,1390,2965);
    SetNpcScript(npcIndexxinan63, "\\script\\������\\Ȫ��\\npc\\���鼼��.lua");

    local npcIndexxinan64 = CreateNpc("V� L�m Minh Ch�1", "S� gi� m�n ph�i", 350,1434,2963);
    SetNpcScript(npcIndexxinan64, "\\script\\������\\����\\npc\\���ɽ�����.lua");

    local npcIndexxinan65 = CreateNpc("V� L�m Minh Ch�1", "S� gi� m�n ph�i", 150,1723,3143);
    SetNpcScript(npcIndexxinan65, "\\script\\������\\����\\npc\\���ɽ�����.lua");
end;

function AddCheFu()		 --�ɼ���ͼ����
	local npcIndex = CreateNpc("Xa phu Trung Nguy�n","Xa phu",714,1425,2847);
	SetNpcScript(npcIndex,"\\script\\�����ͼ\\�ϻ���\\npc\\����.lua");
	npcIndex = CreateNpc("Xa phu Trung Nguy�n","Xa phu",714,1585,3166);
	SetNpcScript(npcIndex,"\\script\\�����ͼ\\�ϻ���\\npc\\����.lua");

	npcIndex = CreateNpc("Xa phu Trung Nguy�n","Xa phu",719,1624,3269);
	SetNpcScript(npcIndex,"\\script\\�����ͼ\\���Ĺ�\\npc\\����.lua");
	npcIndex = CreateNpc("Xa phu Trung Nguy�n","Xa phu",719,1785,3516);
	SetNpcScript(npcIndex,"\\script\\�����ͼ\\���Ĺ�\\npc\\����.lua");

	npcIndex = CreateNpc("Xa phu Trung Nguy�n","Xa phu",724,1656,3554);
	SetNpcScript(npcIndex,"\\script\\�����ͼ\\��ԯ��\\npc\\����.lua");
	npcIndex = CreateNpc("Xa phu Trung Nguy�n","Xa phu", 724,1814,3554);
	SetNpcScript(npcIndex,"\\script\\�����ͼ\\��ԯ��\\npc\\����.lua");
end

function AddDragonBoatDay()
	local npcIndex = CreateNpc("V� L�m Minh Ch�1","Long Chu s� gi�",100,1465,2794);
	SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_manager.lua");
	npcIndex = CreateNpc("V� L�m Minh Ch�1","Long Chu s� gi�",200,1170,2828);
	SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_manager.lua");
	npcIndex = CreateNpc("V� L�m Minh Ch�1","Long Chu s� gi�",300,1640,3526);
	SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_manager.lua");

	for i=0,7 do
		npcIndex = CreateNpc("V� L�m Minh Ch�1","Long Chu s� gi�",1070+i,2051,3249);
		SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_worker.lua");
	end;
	for i=0,7 do
		npcIndex = CreateNpc("V� L�m Minh Ch�1","Long Chu s� gi�",2070+i,2051,3249);
		SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_worker.lua");
	end;
	for i=0,7 do
		npcIndex = CreateNpc("V� L�m Minh Ch�1","Long Chu s� gi�",3070+i,2051,3249);
		SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_worker.lua");
	end;
end;

function AddTxNpc()
	local npcIndex = CreateNpc("V� �ang  ch��ng m�n", "Th�n Du Ch�n Nh�n", 200, 1151, 2850)
	SetNpcScript(npcIndex, "\\script\\̫��þ�\\�տպ���.lua")
	npcIndex = CreateNpc("V� �ang  ch��ng m�n", "Th�n Du Ch�n Nh�n", 300, 1975, 3552)
	SetNpcScript(npcIndex, "\\script\\̫��þ�\\�տպ���.lua")
	npcIndex = CreateNpc("V� �ang  ch��ng m�n", "Th�n Du Ch�n Nh�n", 100, 1379, 2858)
	SetNpcScript(npcIndex, "\\script\\̫��þ�\\�տպ���.lua")
end

function ZoneInit(nMapid)
	--��̬����Trap
	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3235 * 32, "\\script\\̫��þ�\\trap_��ѩ���.lua")
	end

	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3330 * 32, "\\script\\̫��þ�\\trap_��ѩ���.lua")
	end

	for i = 3235, 3330 do
		AddMapTrap(nMapid, 1515 * 32, i * 32, "\\script\\̫��þ�\\trap_��ѩ���.lua")
	end

	for i = 3235, 3330 do
		AddMapTrap(nMapid, 1570 * 32, i * 32, "\\script\\̫��þ�\\trap_��ѩ���.lua")
	end

	-----------------------------------------------------------------------------------

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3230 * 32, "\\script\\̫��þ�\\trap_���ϴ�ɫ.lua")
	end

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3330 * 32, "\\script\\̫��þ�\\trap_���ϴ�ɫ.lua")
	end

	for i = 3230, 3330 do
		AddMapTrap(nMapid, 1600 * 32, i * 32, "\\script\\̫��þ�\\trap_���ϴ�ɫ.lua")
	end

	for i = 3230, 3330 do
		AddMapTrap(nMapid, 1650 * 32, i * 32, "\\script\\̫��þ�\\trap_���ϴ�ɫ.lua")
	end

	-----------------------------------------------------------------------------------

	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3395 * 32, "\\script\\̫��þ�\\trap_���ҵ���.lua")
	end

	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3495 * 32, "\\script\\̫��þ�\\trap_���ҵ���.lua")
	end

	for i = 3395, 3495 do
		AddMapTrap(nMapid, 1515 * 32, i * 32, "\\script\\̫��þ�\\trap_���ҵ���.lua")
	end

	for i = 3395, 3495 do
		AddMapTrap(nMapid, 1570 * 32, i * 32, "\\script\\̫��þ�\\trap_���ҵ���.lua")
	end

	-----------------------------------------------------------------------------------

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3390 * 32, "\\script\\̫��þ�\\trap_嫺���ɳ.lua")
	end

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3500 * 32, "\\script\\̫��þ�\\trap_嫺���ɳ.lua")
	end

	for i = 3390, 3500 do
		AddMapTrap(nMapid, 1600 * 32, i * 32, "\\script\\̫��þ�\\trap_嫺���ɳ.lua")
	end

	for i = 3390, 3500 do
		AddMapTrap(nMapid, 1650 * 32, i * 32, "\\script\\̫��þ�\\trap_嫺���ɳ.lua")
	end
end

function Addfengdutrap()
	for i = 1587, 1592 do
		AddMapTrap(307, i * 32, 2687 * 32, "\\script\\��ԭ����\\�ᶼ\\trap\\�ᶼtoʮ�˲����.lua")
	end

	for i = 1587, 1592 do
		AddMapTrap(307, i * 32, 2686 * 32, "\\script\\��ԭ����\\�ᶼ\\trap\\�ᶼtoʮ�˲����.lua")
	end
end

function Addmenpaibuchong()
	for i = 1625, 1630 do
		AddMapTrap(303, i * 32, 3180 * 32, "\\script\\��ԭ����\\����\\trap\\������.lua")
	end

	for i = 1571, 1577 do
		AddMapTrap(209, i * 32, 3217 * 32, "\\script\\��ԭһ��\\ؤ��\\trap\\��ؤ��.lua")
	end

	for i = 1585, 1591 do
		AddMapTrap(407, i * 32, 3287 * 32, "\\script\\������\\�嶾��\\trap\\���嶾��.lua")
	end

	for i = 1891, 1896 do
		AddMapTrap(312, i * 32, 3422 * 32, "\\script\\��ԭ����\\�䵱\\trap\\���䵱.lua")
	end
end

function AddXinshou()
	local npcIndex = CreateNpc("Thi�u Ung", "V�n S� Th�ng", 200, 1397, 2849)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\����ָ��npc.lua")
	npcIndex = CreateNpc("Thi�u Ung", "V�n S� Th�ng", 300, 1750, 3524)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\����ָ��npc.lua")
	npcIndex = CreateNpc("Thi�u Ung", "V�n S� Th�ng", 100, 1440, 2964)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\����ָ��npc.lua")
	npcIndex = CreateNpc("Thi�u Ung", "V�n S� Th�ng", 350, 1452, 2991)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\����ָ��npc.lua")
	npcIndex = CreateNpc("Thi�u Ung", "V�n S� Th�ng", 150, 1694, 3146)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\����ָ��npc.lua")
end

function CreateGatherNpc()
	local nIndex = 0
	nIndex = CreateNpc("Du Ph��ng ��i phu", "Ng��i �y th�c h�i thu�c", 724,1737,3377)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Du Ph��ng ��i phu", "Ng��i �y th�c h�i thu�c", 714, 1500, 3018)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Du Ph��ng ��i phu", "Ng��i �y th�c h�i thu�c", 719, 1708, 3376)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Xa phu Trung Nguy�n", "Ng��i �y th�c thu th�p", 710, 1711, 3395)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Xa phu Trung Nguy�n", "Ng��i �y th�c thu th�p", 715, 1500, 2992)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Xa phu Trung Nguy�n", "Ng��i �y th�c thu th�p", 720, 1727, 3346)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Thi�u ni�n trong th�n", "Ng��i �y th�c canh t�c", 713, 1481, 2944)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Thi�u ni�n trong th�n", "Ng��i �y th�c canh t�c", 718, 1703, 3410)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Thi�u ni�n trong th�n", "Ng��i �y th�c canh t�c", 723, 1701, 3456)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Ch� V� kh� Trung Nguy�n", "Ng��i �y th�c ��o kh�ang", 711, 1721, 3373)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Ch� V� kh� Trung Nguy�n", "Ng��i �y th�c ��o kh�ang", 716, 1707, 3038)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Ch� V� kh� Trung Nguy�n", "Ng��i �y th�c ��o kh�ang", 721, 1682, 3336)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Th�y luy�n th�", "Ng��i �y th�c thu th�p", 712, 1480, 2919)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Ph� n�1", "Ng��i �y th�c thu th�p", 717, 1744, 2957)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")

	nIndex = CreateNpc("Th�y luy�n th�", "Ng��i �y th�c thu th�p", 722, 1755, 3430)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
end
--====================================�峤���Զ�����================================================
--*****************************�峤�Զ�ִ�к���������*************************
function zgc_auto_fun_main()
	ZgcNpcCreate()					--NPC�Զ�����
	randomseed(GetTime())		--����������
end
function ZgcNpcCreate()
	local npc_index = 0
	--******************************����ս������npc*************************
	--npc_index = CreateNpc("B�n s�ch","Tri�u Di�n Ni�n",200,1386,3076);	--�꾩��173,192
	--npc_index = CreateNpc("T� Ho�n Ch�n","Ti�u Ph��ng",350,1446,2941);	
	npc_index = CreateNpc("T� Ho�n Ch�n","Ti�u Ph��ng",200,1347,2863);		
	SetNpcScript(npc_index, "\\script\\online\\viet_event\\Battle_TieuPhuong\\TieuPhuong.lua")
	--npc_index = CreateNpc("B�n s�ch","Tri�u Di�n Ni�n",200,1466,2830);	--�꾩��183,176
	--SetNpcScript(npc_index, "\\script\\��ԭһ��\\�꾩\\npc\\������.lua")
	--npc_index = CreateNpc("Giang h� tu�n ki�t","Ti�u Vi�n L�u",200,1409,2772);	--�꾩��176,173
	--npc_index = CreateNpc("Ch� qu�n H�a Kh� ph�ng","Ti�u Ng�c",350,1469,2970);	
	npc_index = CreateNpc("Ch� qu�n H�a Kh� ph�ng","Ti�u Ng�c",200,1377,2895);		
	SetNpcScript(npc_index, "\\script\\��ԭһ��\\�꾩\\npc\\��Զ¥.lua")
	--npc_index = CreateNpc("Giang h� tu�n ki�t","Ti�u Vi�n L�u",200,1402,2918);	--�꾩��175,182
	--SetNpcScript(npc_index, "\\script\\��ԭһ��\\�꾩\\npc\\��Զ¥.lua")
	--*****************************NPC��Ϣ��*********************************
	local zgc_npc_inf = {
	--��ɽ����NPC
	--��ɫɾ������NPC
	{"Tr�ch Th�n","V� L�m �n s�",200,1313,2686,"\\script\\online\\zgc_npc_dialog.lua"},
	--������
	{"L� S� S�","X�o n�",150,1588,3143,"\\script\\task\\marriage\\qiao_girl.lua"},
	--��ṥ��ս��Դ�������NPC
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",304,1532,2892,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",304,1543,2897,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",304,1533,2913,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",304,1540,2998,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",304,1551,2997,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",304,1551,3014,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",304,1541,3015,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",304,1505,2980,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",304,1494,2980,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",304,1493,2994,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",308,1451,3180,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",308,1442,3181,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",308,1451,3167,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",308,1501,3124,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",308,1490,3122,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",308,1490,3104,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",308,1500,3104,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",308,1433,3078,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",308,1421,3076,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	-- {"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",308,1421,3058,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
	--����
	{"V� �ang  ph� ch��ng m�n","Long Quang Ch�n Nh�n",500,1633,3185,"\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect.lua"},
	{"M�t th�m ��i T�ng T�y V�c","M�t th�m ��i T�ng T�y V�c",500,1759,3142,"\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua"},
	}

	for i = 1, getn(zgc_npc_inf) do
		npc_index = CreateNpc(zgc_npc_inf[i][1],zgc_npc_inf[i][2],zgc_npc_inf[i][3],zgc_npc_inf[i][4],zgc_npc_inf[i][5])
		SetNpcScript(npc_index,zgc_npc_inf[i][6])
		--��Դ������ʱ����Ҫ������������ֵ��ʼ����Ϊ0
		if zgc_npc_inf[i][2] == "B�o r��ng T�i nguy�n" then
			SetUnitCurStates(npc_index,2,1)
			SetUnitCurStates(npc_index,4,0)
			SetUnitCurStates(npc_index,5,0)
		end
	end
		CreateNpcList({
			--�������
--			{"����","����",152,1452,3008,"\\script\\������\\����\\npc\\����.lua"},
--			{"���","���",152,1508,2956,"\\script\\������\\����\\npc\\���.lua"},
--			{"����","����",152,1560,3025,"\\script\\������\\����\\npc\\����.lua"},
--			{"ʯ��","ʯ��",152,1349,2870,"\\script\\������\\����\\npc\\ʯ��.lua"},
--			{"˾�з�","˾�з�",152,1455,3132,"\\script\\������\\����\\npc\\˾�з�.lua"},
--			{"��Ԫ��","��Ԫ��",152,1284,2748,"\\script\\������\\����\\npc\\��Ԫ��.lua"},
--			{"������","������",152,1397,3059,"\\script\\������\\����\\npc\\������.lua"},
--			{"���߷�","���߷�",152,1480,3038,"\\script\\������\\����\\npc\\���߷�.lua"},
--			{"���ٻ�","���ٻ�",152,1686,3284,"\\script\\������\\����\\npc\\���ٻ�.lua"},
--			{"���ٻ�","���ش�����",153,1779,3452,"\\script\\task\\practice\\���ش�����.lua"},
--			{"��ԭ�����","��Ʒ������",152,1508,3074,"\\script\\������\\����\\npc\\��Ʒ������.lua"},
			--�������
			{"��o Hoa th�","��o Hoa th�",404,1462,2835,"\\script\\������\\����\\npc\\�һ���.lua"},
			{"S�i Phong Nhi","S�i Phong Nhi",404,1552,2815,"\\script\\������\\����\\npc\\����.lua"},
--			{"����","���ش�����",423,1497,2950,"\\script\\task\\practice\\���ش�����.lua"},
			{"N� thi�u ni�n1","Th� kh�",404,1537,2758,"\\script\\������\\����\\npc\\��Ʒ������.lua"},
			--�������
			{"tianyuanshizhu","Thi�n Nguy�n Ph�p Tr�n Th�ch Tr�",509,1577,3098,"\\script\\������\\����\\npc\\ʯ��.lua"},
			{"tianyuanshizhu","Thi�n Nguy�n Ph�p Tr�n Th�ch Tr�",509,1587,3099,"\\script\\������\\����\\npc\\ʯ��.lua"},
			{"tianyuanshizhu","Thi�n Nguy�n Ph�p Tr�n Th�ch Tr�",509,1589,3115,"\\script\\������\\����\\npc\\ʯ��.lua"},
			{"tianyuanshizhu","Thi�n Nguy�n Ph�p Tr�n Th�ch Tr�",509,1580,3120,"\\script\\������\\����\\npc\\ʯ��.lua"},
			{"tianyuanshizhu","Thi�n Nguy�n Ph�p Tr�n Th�ch Tr�",509,1572,3112,"\\script\\������\\����\\npc\\ʯ��.lua"},
			{"H� Y�u","Y�u H�",509,1581,3109,"\\script\\������\\����\\npc\\����.lua"},
--			{"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",108,1514,3073,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",108,1522,3072,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",108,1521,3058,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",108,1485,3128,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",108,1485,3146,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",108,1473,3128,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",108,1497,3128,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",108,1538,3127,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",108,1549,3126,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
--			{"B�o r��ng T�i nguy�n","B�o r��ng T�i nguy�n",108,1549,3142,"\\script\\gongcheng\\npc\\conf_res_protect.lua"},
		});
end
--======================================����================================
function Addmenpai()
	local nNpcIndex = 0;
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1","��c s� V� L�m",150,1705,3173);	--���� 213, 198
	SetNpcScript(nNpcIndex, "\\script\\task\\faction_boss\\wulinmeng_teshi.lua");
end;

function AddNewBattle()
	local tChannel =
	{								--Ƶ��������ID
		[1] = {"Nh�n M�n Quan-chi�n d�ch Th�n trang",12},
		[2] = {"Nh�n M�n Quan-chi�n d�ch th�o c�c",13},
		[3] = {"Nh�n M�n Quan-chi�n d�ch ph�o ��i",14},
		[4] = {"Nh�n M�n Quan-chi�n d�ch ch�nh",15},
		[5] = {"Nh�n M�n Quan-chi�n d�ch Th�n trang phe T�ng",16},
		[6] = {"Nh�n M�n Quan-chi�n d�ch Th�n trang phe Li�u",17},
		[7] = {"Nh�n M�n Quan-chi�n d�ch th�o c�c phe T�ng",18},
		[8] = {"Nh�n M�n Quan-chi�n d�ch th�o c�c phe Li�u",19},
		[9] = {"Nh�n M�n Quan-chi�n d�ch ph�o ��i phe T�ng",20},
		[10] = {"Nh�n M�n Quan-chi�n d�ch ph�o ��i phe Li�u",21},
		[11] = {"Nh�n M�n Quan-chi�n d�ch ch�nh phe T�ng",22},
		[12] = {"Nh�n M�n Quan-chi�n d�ch ch�nh phe Li�u",23},
		[13] = {"Chi�n tr��ng Ng�c M�n quan",36},
		[14] = {"Chi�n tr��ng Ng�c M�n quan-T�ng",37},
		[15] = {"Chi�n tr��ng Ng�c M�n quan-Li�u-",38},
	}
	for i=1,getn(tChannel) do
		CreateChannel(tChannel[i][1],tChannel[i][2],180);
	end;
	SetGlbValue(31,0)	--������ս��
	local nNpcIdx = 0;
end;

function Addjiehun()
	local nNpcIndex = CreateNpc("B� mai", "B� mai", 150, 1600, 3136)
	SetNpcScript(nNpcIndex, "\\script\\���\\npc\\ý��.lua");
	nNpcIndex = CreateNpc("Th��ng nh�n", "S� gi� h�n l�", 150, 1711, 3046)
	SetNpcScript(nNpcIndex, "\\script\\���\\npc\\���촫����.lua");
	nNpcIndex = CreateNpc("Nguy�t L�o", "Nguy�t L�o", 404, 1642, 2603)
	SetNpcScript(nNpcIndex, "\\script\\���\\npc\\����.lua");
	--Ԥ������ý��
	nNpcIndex = CreateNpc("B� mai", "B� mai", 855, 1554, 3232)
	SetNpcScript(nNpcIndex, "\\script\\���\\npc\\ý��2.lua");
	nNpcIndex = CreateNpc("B� mai", "B� mai", 856, 1615, 3276)
	SetNpcScript(nNpcIndex, "\\script\\���\\npc\\ý��2.lua");
	nNpcIndex = CreateNpc("B� mai", "B� mai", 857, 1550, 3217)
	SetNpcScript(nNpcIndex, "\\script\\���\\npc\\ý��2.lua");
	nNpcIndex = CreateNpc("B� mai", "B� mai", 858, 1612, 3324)
	SetNpcScript(nNpcIndex, "\\script\\���\\npc\\ý��2.lua");

	CreateChannel("Khu v�c k�t h�n",26);
end

function AddSnowWarNpc()
    if tonumber(date("%y%m%d")) >= 091218 and tonumber(date("%y%m%d")) < 100117 then
	--�꾩ѩ�̴�����
	local npcIndex = CreateNpc("Giang h� h�o ki�t","Xa phu_n�m tuy�t",200,1413,3056)
	SetNpcScript(npcIndex,"\\script\\online\\���ڻ\\�꾩ѩ�̴�����in.lua")
	--�ɶ�ѩ�̴�����
	npcIndex = CreateNpc("Giang h� h�o ki�t","Xa phu_n�m tuy�t",300,1831,3577)
	SetNpcScript(npcIndex,"\\script\\online\\���ڻ\\�ɶ�ѩ�̴�����in.lua")
	--Ȫ��ѩ�̴�����
	npcIndex = CreateNpc("Giang h� h�o ki�t","Xa phu_n�m tuy�t",100,1364,2928)
	SetNpcScript(npcIndex,"\\script\\online\\���ڻ\\Ȫ��ѩ�̴�����in.lua")
    end
end;

function Addtianshi()
	local npcIndex = CreateNpc("C�n L�n T�n M�n Nh�n", "�� t� C�n L�n th�n b�", 314,1584,2856)
	SetNpcScript(npcIndex, "\\script\\��ԭ����\\��ʦ�ؾ�\\npc\\�ؾ�������.lua")
end

function AddKillerHall()
    local nNpcIdx = CreateNpc("Giang h� tu�n ki�t", "Nam nh�n th�n b�", 318,1567,2753);
    SetNpcScript(nNpcIdx, "\\script\\task\\killer_hall\\entrance_npc.lua");
end;

function AddCaijiNpc()
    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 710,1700,3391);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua");

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 711,1730,3368);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua");

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 712,1467,2926);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua");

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 713,1485,2952);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua");

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 714,1514,3018);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua");

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 715,1493,2992);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua");

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 716,1719,3037);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua");

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 717,1755,2976);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua");

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 718,1713,3394);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua");

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 719,1698,3377);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua");

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 720,1717,3342);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua");

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 721,1691,3323);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua")

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 722,1743,3427);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua")

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 723,1698,3445);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua")

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 724,1725,3384);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua")

    local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 300,1913,3615);
    SetNpcScript(nNpcIdx, "\\script\\������\\�嶾��\\npc\\��Ʒ������.lua")
end;

function AddZGDaShi()
	local nNpcIdx = CreateNpc("C� gi�","Tinh Hoa T� Quang s� gi�",200,1498,2781);
	SetNpcScript(nNpcIdx,"\\script\\online\\dragon_boat_07\\qinghuaziguangshizhe_npc.lua");
end;

function AddTongMission()	--���ؿ�
	local nNpcIdx = CreateNpc("C� gi�","T� Quang C�c L�o Nh�n",150,1651,3174);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tong_mission\\npc\\npc_mission_entrance.lua");
end;

function AddBaiHuaNpc()
	local npcIndex = CreateNpc("L� S� S�", "B�ch Hoa s� gi�", 200,1378,2854)
	SetNpcScript(npcIndex, "\\script\\online\\qixi07\\baihua_npc.lua")
	local npcIndex = CreateNpc("L� S� S�", "B�ch Hoa s� gi�", 300,1735,3523)
	SetNpcScript(npcIndex, "\\script\\online\\qixi07\\baihua_npc.lua")
	local npcIndex = CreateNpc("L� S� S�", "B�ch Hoa s� gi�", 100,1435,2988)
	SetNpcScript(npcIndex, "\\script\\online\\qixi07\\baihua_npc.lua")
end;

function AddGongChengNpc()
	local tChannel =
	{								--Ƶ��������ID
		[1] = {"Tuy�n Ch�u th�nh ",27},
		[2] = {"Th�nh �� th�nh ",28},
		[3] = {"T��ng D��ng th�nh ",29},
		[4] = {"Phe c�ng Tuy�n Ch�u",30},
		[5] = {"Phe th� Tuy�n Ch�u th�nh",31},
		[6] = {"Phe c�ng Th�nh �� th�nh",32},
		[7] = {"Phe th� Th�nh �� th�nh",33},
		[8] = {"Phe c�ng T��ng D��ng th�nh",34},
		[9] = {"Phe th� T��ng D��ng th�nh",35},
	}
	for i=1,getn(tChannel) do
		CreateChannel(tChannel[i][1],tChannel[i][2]);
	end;
	local nNpcIdx = CreateNpc("V� L�m Minh Ch�1","Th�nh �� ��i s� c�ng th�nh",300,1742,3548)
	SetNpcScript(nNpcIdx,"\\script\\gongcheng\\npc\\gongchengdashi_npc.lua");
	-- ����ս���й���,�η����NPC

	-- ����ս�η�
	local nNpcIdx = CreateNpc("Nha d�ch", "Bang h�i Ng�c t�t", 730, 1376, 3143);
    SetNpcScript(nNpcIdx, "\\script\\gongcheng\\prison\\jailer_npc.lua")
    nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 730, 1378, 3139)
    SetNpcScript(nNpcIdx, "\\script\\battles\\openbox.lua")

   	nNpcIdx = CreateNpc("Nha d�ch", "Bang h�i Ng�c t�t", 731, 1376, 3143);
    SetNpcScript(nNpcIdx, "\\script\\gongcheng\\prison\\jailer_npc.lua")
    nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 731, 1378, 3139)
    SetNpcScript(nNpcIdx, "\\script\\battles\\openbox.lua")
 	nNpcIdx = CreateNpc("Nha d�ch", "Bang h�i Ng�c t�t", 300, 1792, 3489)
    SetNpcScript(nNpcIdx, "\\script\\gongcheng\\prison\\gaoler_npc.lua")

    nNpcIdx = CreateNpc("Nha d�ch", "Bang h�i Ng�c t�t", 732, 1376, 3143);
    SetNpcScript(nNpcIdx, "\\script\\gongcheng\\prison\\jailer_npc.lua")
    nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 732, 1378, 3139)
    SetNpcScript(nNpcIdx, "\\script\\battles\\openbox.lua")

    nNpcIdx = CreateNpc("Nha d�ch", "Bang h�i Ng�c t�t", 733, 1376, 3143);
    SetNpcScript(nNpcIdx, "\\script\\gongcheng\\prison\\jailer_npc.lua")
    nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 733, 1378, 3139)
    SetNpcScript(nNpcIdx, "\\script\\battles\\openbox.lua")

    nNpcIdx = CreateNpc("Nha d�ch", "Bang h�i Ng�c t�t", 734, 1376, 3143);
    SetNpcScript(nNpcIdx, "\\script\\gongcheng\\prison\\jailer_npc.lua")
    nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Th� kh�", 734, 1378, 3139)
    SetNpcScript(nNpcIdx, "\\script\\battles\\openbox.lua")

	nNpcIdx = CreateNpc("B� ch�", "Th�nh �� Qu�n th�nh s�", 300, 1729, 3536)
	SetNpcScript(nNpcIdx, "\\script\\gongcheng\\city_manage\\manage_npc.lua")
	nNpcIdx = CreateNpc("V� binh th�nh m�n","S� gi� H�i Phong tr�i",889,1762,3805)
	SetNpcScript(nNpcIdx, "\\script\\gongcheng\\personal_task\\task_npc.lua")

	-- ��trap

	for i=1805,1821 do
		AddMapTrap(889, i * 32, 3591 * 32, "\\script\\gongcheng\\personal_task\\changefarm_trap.lua")
	end

	for i=1800,1815 do
		AddMapTrap(889, i * 32, 3584 * 32, "\\script\\gongcheng\\personal_task\\changepk_trap.lua")
	end

	for i=1728,1740 do
		AddMapTrap(889, i * 32, 3599 * 32, "\\script\\gongcheng\\personal_task\\changefarm_trap.lua")
	end

	for i=1720,1732 do
		AddMapTrap(889, i * 32, 3591 * 32, "\\script\\gongcheng\\personal_task\\changepk_trap.lua")
	end

	for i=1605,1624 do
		AddMapTrap(889, i * 32, 3774 * 32, "\\script\\gongcheng\\personal_task\\changefarm_trap.lua")
	end

	for i=1598, 1610 do
		AddMapTrap(889, i * 32, 3765 * 32, "\\script\\gongcheng\\personal_task\\changepk_trap.lua")
	end
end;

function AddXiBei()

	--���踮��

	--��������&����Npc
	local nNpcIdx = CreateNpc("�ng gi� ph��ng B�c2", "Di�p L�o", 500,1808,3125);
  SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\Ҷ��.lua");

	local nNpcIdx = CreateNpc("Tr��ng Tr�ch �oan", "�u D��ng H�a ", 500,1727,3262);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\ŷ����.lua");

	local nNpcIdx = CreateNpc("Th��ng nh�n Ba T�", "Th��ng nh�n Ba T�", 500,1686,3252);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\��˹����.lua");

	local nNpcIdx = CreateNpc("K�o h� l�", "���ng H� L�", 500,1675,3168);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\�ƺ�«.lua");

	local nNpcIdx = CreateNpc("Gi�o ch� Minh Gi�o", "T� M� Minh Phong", 500,1600,3157);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\˾������.lua");

	local nNpcIdx = CreateNpc("Du Ph��ng ��i phu", "T�n Ph��ng Nh�n ", 500,1807,3045);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\�﷽��.lua");

	local nNpcIdx = CreateNpc("���ng M�n T�n m�n nh�n", "Li�u T�ng V�n ", 500,1717,2986);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\������.lua");

	local nNpcIdx = CreateNpc("Nam nh�n ph��ng B�c3", "Th�c B�t Ho�ng ", 500,1808,2994);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\�ذκ�.lua");

	local nNpcIdx = CreateNpc("Ch� qu�n H�a Kh� ph�ng", "���ng Thi�n Thi�n", 500,1768,3256);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\��ܷܷ.lua");

	--ְ��Npc
	local nNpcIdx = CreateNpc("Th� r�n Th� Ph�n", "Ch� Ti�m v� kh�", 500,1747,3092);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\�������ϰ�.lua");

	local nNpcIdx = CreateNpc("Ch� ti�m v� kh� Th� Ph�n", "Ch� Ti�m Nam ph�c", 500,1739,3098);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\��װ���ϰ�.lua");

	local nNpcIdx = CreateNpc("Ch� ti�m v�i", "Ch� Ti�m N� ph�c", 500,1701,3114);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\Ůװ���ϰ�.lua");

	local nNpcIdx = CreateNpc("Ch� c�m �� Th� Ph�n", "Ch� T�p h�a", 500,1730,3109);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\�ӻ����ϰ�.lua");

	local nNpcIdx = CreateNpc("Ch� ti�m �� Th� Ph�n", "Ch� Kim ho�n", 500,1721,3115);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\��Ʒ���ϰ�.lua");

	local nNpcIdx = CreateNpc("Ch��ng d��c Th� Ph�n", "Ch� D��c �i�m", 500,1763,3091);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\ҩ���ϰ�.lua");

	local nNpcIdx = CreateNpc("Ch� c�m �� Th� Ph�n", "Ch� t�u l�u", 500,1700,3176);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\��¥�ϰ�.lua");

	local nNpcIdx = CreateNpc("Tr�nh Di", "Ch� th��ng h�i", 500,1772,3186);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\�̻��ϰ�.lua");

	local nNpcIdx = CreateNpc("Quan vi�n", "Ph�ng T��ng ph�Th�i th� ", 500,1886,3102);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\���踮̫��.lua");

	local nNpcIdx = CreateNpc("L�c Phi�n cao th�1", "B� ��u", 500,1893,3114);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\��ͷ.lua");

	local nNpcIdx = CreateNpc("V� L�m Minh Ch�1", "S� gi� m�n ph�i", 500,1751,3141);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\���ɽ�����.lua");

	--��������
	local nNpcIdx = CreateNpc("Xa phu", "Xa phu Ph�ng T��ng", 500,1849,3061);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\���賵��.lua");

	--���ų���
	local nNpcIdx = CreateNpc("Xa phu", "Xa phu Ph�ng T��ng", 500,1803,3220);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\���賵��.lua");

	--���ų���
	local nNpcIdx = CreateNpc("Xa phu", "Xa phu Ph�ng T��ng", 500,1671,3089);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\���賵��.lua");

	--���ų���
	local nNpcIdx = CreateNpc("Xa phu", "Xa phu Ph�ng T��ng", 500,1671,3202);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\���賵��.lua");

	--��������
	local nNpcIdx = CreateNpc("R��ng �� Tr.Nguy�n", "Th� kh�", 500,1828,3048);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\��Ʒ�����˱�.lua");

	--��������
	local nNpcIdx = CreateNpc("R��ng �� Tr.Nguy�n", "Th� kh�", 500,1798,3216);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\��Ʒ�����˶�.lua");

	--��������
	local nNpcIdx = CreateNpc("R��ng �� Tr.Nguy�n", "Th� kh�", 500,1678,3095);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\��Ʒ��������.lua");

	--��������
	local nNpcIdx = CreateNpc("R��ng �� Tr.Nguy�n", "Th� kh�", 500,1656,3214);
	SetNpcScript(nNpcIdx, "\\script\\������\\���踮\\npc\\��Ʒ��������.lua");

	--������
	local nNpcIdx = CreateNpc("Ti�u nh� Th� Ph�n", "Ti�u nh�", 507,1660,3293);
	SetNpcScript(nNpcIdx, "\\script\\������\\������\\npc\\��С��.lua");

	local nNpcIdx = CreateNpc("Thi�u ni�n nam1", "T�n Nh� Li�n", 507,1649,3293);
	SetNpcScript(nNpcIdx, "\\script\\������\\������\\npc\\�����.lua");

	local nNpcIdx = CreateNpc("Xa Lu�n B� V��ng", "Xa Lu�n B� V��ng", 507,1791,3173);
	SetNpcScript(nNpcIdx, "\\script\\������\\������\\npc\\���ְ���.lua");

	local nNpcIdx = CreateNpc("Xu�n Th�p Tam n��ng", "Xu�n Th�p Tam n��ng", 507,1884,3317);
	SetNpcScript(nNpcIdx, "\\script\\������\\������\\npc\\��ʮ����.lua");

	--����
	local nNpcIdx = CreateNpc("Chu B�t Ho�c", "Chu B�t Ho�c", 509,1597,3203);
	SetNpcScript(nNpcIdx, "\\script\\������\\����\\npc\\�ܲ���.lua");

	local nNpcIdx = CreateNpc("T�n B�t Tri", "T�n B�t Tri", 509,1578,3194);
	SetNpcScript(nNpcIdx, "\\script\\������\\����\\npc\\�ز���.lua");

	local nNpcIdx = CreateNpc("Tr�n B�t Vi", "Tr�n B�t Vi", 509,1536,3228);
	SetNpcScript(nNpcIdx, "\\script\\������\\����\\npc\\�²�Ϊ.lua");

		local nNpcIdx = CreateNpc("M� B�t Ti�n", "M� B�t Ti�n", 509,1581,3249);
	SetNpcScript(nNpcIdx, "\\script\\������\\����\\npc\\��ǰ.lua");

	local nNpcIdx = CreateNpc("V��ng B�t Ph�m", "V��ng B�t Ph�m", 509,1427,3443);
	SetNpcScript(nNpcIdx, "\\script\\������\\����\\npc\\������.lua");

	local nNpcIdx = CreateNpc("C�n L�n T�n Ph� Ch��ng M�n", "Mai B�t Dung",509,1561,3270);
	SetNpcScript(nNpcIdx, "\\script\\������\\����\\npc\\÷����.lua");

	local nNpcIdx = CreateNpc("C�n Lu�n Nam �� t�", "Di�p T� Thu", 509,1551,3214);
	SetNpcScript(nNpcIdx, "\\script\\������\\����\\npc\\Ҷ����.lua");

	local nNpcIdx = CreateNpc("C�n Lu�n Nam �� t�", "Tri�u T� B�nh", 509,1432,3305);
	SetNpcScript(nNpcIdx, "\\script\\������\\����\\npc\\����ƽ.lua");
	
	local nNpcIdx = CreateNpc("V�n Hi H�a", "V�n Hi H�a", 509,1615,3213);
	SetNpcScript(nNpcIdx, "\\script\\������\\����\\npc\\���˺�.lua");	
	
--	local nNpcIdx = CreateNpc("V�ng Th� Ki�m", "V�ng Th� Ki�m", 509,1620,3211);
--	SetNpcScript(nNpcIdx, 	
	
--	local nNpcIdx = CreateNpc("V�n V�ng Th�", "V�n V�ng Th�", 509,1618,3160);
--	SetNpcScript(nNpcIdx, 
	
	local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n","Th� kh�",509,1600,3229);
	SetNpcScript(nNpcIdx, "\\script\\������\\����\\npc\\��Ʒ������.lua");

	--������
	local nNpcIdx = CreateNpc("H� ph�p Minh Gi�o", "�n Minh ", 508,1691,2962);
	SetNpcScript(nNpcIdx, "\\script\\������\\������\\npc\\����.lua");

	local nNpcIdx = CreateNpc("Di Tu kh�ch", "Di Tu ��i h�n", 508,1792,3306);
	SetNpcScript(nNpcIdx, "\\script\\������\\������\\npc\\����.lua");

	--������һ��
	local nNpcIdx = CreateNpc("Phi Th��ng ��o nh�n", "Phi Th��ng ��o nh�n", 511,1702,3365);
	SetNpcScript(nNpcIdx, "\\script\\������\\������һ��\\npc\\�ǳ�����.lua");

	--����������
	local nNpcIdx = CreateNpc("C�n Lu�n Nam �� t�", "�� T� C�n L�n", 512,2061,3404);
	SetNpcScript(nNpcIdx, "\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua");

	--ҩ����
	local nNpcIdx = CreateNpc("Thi�u ni�n trong th�n", "L�u Tam ", 505,1482,2996);
	SetNpcScript(nNpcIdx, "\\script\\������\\ҩ����\\npc\\����.lua");

	local nNpcIdx = CreateNpc("T�y H� Ph�p v��ng", "T�y H� Ph�p v��ng", 505,1538,3146);
	SetNpcScript(nNpcIdx, "\\script\\������\\ҩ����\\npc\\���ķ���.lua");

	--ҩ����
	local nNpcIdx = CreateNpc("D��c th�t th� v�", "D��c th�t th� v�", 510,1575,2853);
	SetNpcScript(nNpcIdx, "\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua");

	--ɳĮ�Թ�
	local nNpcIdx = CreateNpc("Ng� H�nh Tr�n S�", "Ng� H�nh Tr�n S�", 506,1325,2715);
	SetNpcScript(nNpcIdx, "\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua");

	local nNpcIdx = CreateNpc("��c H�nh l�o x�", "��c H�nh l�o x�", 506,1545,2958);
	SetNpcScript(nNpcIdx, "\\script\\������\\ɳĮ�Թ�\\npc\\��������.lua");

	local nNpcIdx = CreateNpc("Nam nh�n T�y B�c", "B�ch Thi�n Th�nh", 506,1554,2658);
	SetNpcScript(nNpcIdx, "\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua");

	--��ʼ����
	local nNpcIdx = CreateNpc("��c t�", "�o�n T�", 503,1412,2742);
	SetNpcScript(nNpcIdx, "\\script\\������\\��ʼ����\\npc\\�ϱ�.lua");

	local nNpcIdx = CreateNpc("L�a ch�n", "L�a ch�n", 503,1588,2976);
	SetNpcScript(nNpcIdx, "\\script\\������\\��ʼ����\\npc\\����.lua");

	--����һ��
	local nNpcIdx = CreateNpc("Tr�o V��ng", "Tr�o V��ng", 513,1464,2998);
	SetNpcScript(nNpcIdx, "\\script\\������\\����Ĺ��һ��\\npc\\צ��.lua");

	local nNpcIdx = CreateNpc("Th� m� nh�n", "Th� m� nh�n", 513,1591,3178);
	SetNpcScript(nNpcIdx, "\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua");

	--�������
	local nNpcIdx = CreateNpc("Th� M� T��ng Qu�n", "Th� M� T��ng Qu�n", 514,1733,2863);
	SetNpcScript(nNpcIdx, "\\script\\missions\\northwest_mission\\npc\\npc_log_in.lua");

	local nNpcIdx = CreateNpc("Tr�n m� l�nh qu�n", "T�y Tr�n m� T��ng qu�n", 514,1475,2977);
	SetNpcScript(nNpcIdx, "\\script\\������\\����Ĺ�Ҷ���\\npc\\��Ĺ������.lua");

	local nNpcIdx = CreateNpc("Tr�n m� l�nh qu�n", "B�c Tr�n m� T��ng qu�n", 514,1624,2822);
	SetNpcScript(nNpcIdx, "\\script\\������\\����Ĺ�Ҷ���\\npc\\��Ĺ������.lua");

	local nNpcIdx = CreateNpc("Tr�n m� l�nh qu�n", "��ng Tr�n m� T��ng qu�n", 514,1803,2983);
	SetNpcScript(nNpcIdx, "\\script\\������\\����Ĺ�Ҷ���\\npc\\��Ĺ������.lua");

	local nNpcIdx = CreateNpc("Tr�n m� l�nh qu�n", "Nam Tr�n m� T��ng qu�n", 514,1629,3169);
	SetNpcScript(nNpcIdx, "\\script\\������\\����Ĺ�Ҷ���\\npc\\��Ĺ������.lua");

	--���Ż���
	local nNpcIdx = CreateNpc("C�n Lu�n Nam �� t�", "�� T� C�n L�n", 328,1711,3258);
	SetNpcScript(nNpcIdx, "\\script\\��ԭ����\\���Ż���\\npc\\���ص���.lua");

	--��ʦ�ؾ�
	local nNpcIdx = CreateNpc("C�n Lu�n Nam �� t�", "�� T� C�n L�n", 329,1731,3429);
	SetNpcScript(nNpcIdx, "\\script\\��ԭ����\\��ʦ�ؾ�\\npc\\���ص���.lua");

	local nNpcIdx = CreateNpc("C� L�u v��ng", "C� L�u v��ng", 329,1620,3354);
	SetNpcScript(nNpcIdx, "\\script\\��ԭ����\\��ʦ�ؾ�\\npc\\������.lua");

end
function AddGongYe()
	local npcIndex = CreateNpc("Ch� V� kh� Trung Nguy�n", "C�ng D� binh ", 350,1399,2997)
	SetNpcScript(npcIndex, "\\script\\gongyeshijia.lua")
	local npcIndex = CreateNpc("Ch� V� kh� Trung Nguy�n", "C�ng D� kh� ", 150,1647,3149)
	SetNpcScript(npcIndex, "\\script\\gongyeshijia.lua")
	local npcIndex = CreateNpc("Ch� V� kh� Trung Nguy�n", "C�ng D� c� ", 400,1493,3053)
	SetNpcScript(npcIndex, "\\script\\gongyeshijia.lua")
end

function AddLiuTudi()
	local npcIndex = CreateNpc("Thi�u ni�n trong th�n", "H�c tr� Th� r�n L�u", 350,1410,2925)
	SetNpcScript(npcIndex, "\\script\\��ԭ����\\����\\npc\\liutiejiangdizi.lua")
end


function Add3Festival()
	local npcIndex = CreateNpc("Thi�n V��ng Bang Ch�", "Chu ni�n kh�nh s�",100,1440,2785)
	SetNpcScript(npcIndex, "\\script\\online\\3festival\\emissary_npc.lua")
	npcIndex = CreateNpc("Thi�n V��ng Bang Ch�", "Chu ni�n kh�nh s�",200,1179,2845)
	SetNpcScript(npcIndex, "\\script\\online\\3festival\\emissary_npc.lua")
	npcIndex = CreateNpc("Thi�n V��ng Bang Ch�", "Chu ni�n kh�nh s�",300,1649,3537)
	SetNpcScript(npcIndex, "\\script\\online\\3festival\\emissary_npc.lua")
	npcIndex = CreateNpc("V� L�m Minh Ch�1", "��c s� V� L�m", 200,1167,2847)
	SetNpcScript(npcIndex, "\\script\\online\\3festival\\wulinmeng_npc.lua")
	npcIndex = CreateNpc("V� L�m Minh Ch�1", "��c s� V� L�m", 300,1653,3565)
	SetNpcScript(npcIndex, "\\script\\online\\3festival\\wulinmeng_npc.lua")
	npcIndex = CreateNpc("V� L�m Minh Ch�1", "��c s� V� L�m", 100,1439,2807)
	SetNpcScript(npcIndex, "\\script\\online\\3festival\\wulinmeng_npc.lua")
end;

function AddTyTuzi()
	local npcIndex = CreateNpc("Th� Ti�u Nha", "Th� Ti�u Nha",117,1663,3083)
	SetNpcScript(npcIndex, "\\script\\online\\abluemoon\\tianya_npc.lua")
end

function AddNewYearNpc()
	local npcIndex = CreateNpc("Thi�n V��ng Bang Ch�", "S� gi� ho�t ��ng t�n ni�n ",200,1167,2858)
	SetNpcScript(npcIndex, "\\script\\online\\newyear08\\newyear08_npc.lua")
	npcIndex = CreateNpc("Thi�n V��ng Bang Ch�", "S� gi� ho�t ��ng t�n ni�n ",100,1440,2808)
  SetNpcScript(npcIndex, "\\script\\online\\newyear08\\newyear08_npc.lua")
	npcIndex = CreateNpc("Thi�n V��ng Bang Ch�", "S� gi� ho�t ��ng t�n ni�n ",300,1649,3560)
  SetNpcScript(npcIndex, "\\script\\online\\newyear08\\newyear08_npc.lua")
	npcIndex = CreateNpc("Thi�n V��ng Bang Ch�", "S� gi� ho�t ��ng t�n ni�n ",350,1462,2974)
  SetNpcScript(npcIndex, "\\script\\online\\newyear08\\newyear08_npc.lua")
	npcIndex = CreateNpc("Thi�n V��ng Bang Ch�", "S� gi� ho�t ��ng t�n ni�n ",150,1679,3143)
  SetNpcScript(npcIndex, "\\script\\online\\newyear08\\newyear08_npc.lua")
	npcIndex = CreateNpc("Thi�n V��ng Bang Ch�", "S� gi� ho�t ��ng t�n ni�n ",400,1560,2963)
  SetNpcScript(npcIndex, "\\script\\online\\newyear08\\newyear08_npc.lua")
end

function add_biwudahui()
	ClearMapNpc(974)
	ClearMapNpc(975)
	ClearMapNpc(976)
	ClearMapNpc(7100)
	CreateNpcList({
		{"Ch�n T� ��n h�o hoa","��c s� ��i H�i T� V�",200,1391,2816,"\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua"},
		{"V��ng An Th�ch","Th�n V� Vi�n T� Nghi�p (Tuy�n Ch�u)",974,1620,3180,"\\script\\biwudahui\\tournament\\npc\\npc_field_keeper.lua"},
		{"V��ng An Th�ch","Th�n V� Vi�n T� Nghi�p (Bi�n Kinh)",975,1620,3180,"\\script\\biwudahui\\tournament\\npc\\npc_field_keeper.lua"},
		{"V��ng An Th�ch","Th�n V� Vi�n T� Nghi�p (Th�nh ��)",976,1620,3180,"\\script\\biwudahui\\tournament\\npc\\npc_field_keeper.lua"},
		{"V��ng An Th�ch","Th�n V� Vi�n T� Nghi�p (To�n qu�c)",7100,1404,2858,"\\script\\biwudahui\\tournament\\npc\\npc_field_keeper.lua"},
	});
end;
function add_faction_back_room()
	local nNpcIdx = 0;
	nNpcIdx = CreateNpc("Thi�u L�m Th� T�a","Huy�n Kh�ng",204,1645,3270);	--����
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_master.lua");
	nNpcIdx = CreateNpc("���ng M�n ��i �� ��","���ng T� M�c",305,1674,2936);	--����
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_master.lua");
	nNpcIdx = CreateNpc("Nga My ph� ch��ng m�n","Tu� V�n S� Th�i",303,1715,3059);	--����
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_master.lua");
	nNpcIdx = CreateNpc("C�i Bang ph� ch��ng m�n","B�ng L� V�ng",209,1530,3209);	--ؤ��
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_master.lua");
	nNpcIdx = CreateNpc("V� �ang  m�n nh�n","Ti�t V�n Tranh",312,1871,3276);	--�䵱
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_master.lua");
end;

function Add_wuyi_npc()
	local nNpcIdx = 0;
	nNpcIdx = CreateNpc("Giang h� tu�n ki�t","Hi�n Vi�n Trung",200,1176,2825);
	SetNpcScript(nNpcIdx,"\\script\\online\\laborday08\\mah_jong_npc.lua");
	nNpcIdx = CreateNpc("Giang h� tu�n ki�t","Hi�n Vi�n Nh�n",300,1649,3538);
	SetNpcScript(nNpcIdx,"\\script\\online\\laborday08\\mah_jong_npc.lua");
	nNpcIdx = CreateNpc("Giang h� tu�n ki�t","Hi�n Vi�n L�",100,1436,2791);
	SetNpcScript(nNpcIdx,"\\script\\online\\laborday08\\mah_jong_npc.lua");
end

function add_weizhi_npc()
	local n = CreateNpc("Quan s�-trung ni�n1","Qu�c T� gi�m",200,1463,2758)
	SetNpcScript(n, "\\script\\master_prentice\\���Ӽ�ѧ��.lua")
	n = CreateNpc("Ch� qu�n H�a Kh� ph�ng","L�m T�ch",106,1557,3069);
	SetNpcScript(n, "\\script\\������\\��Ȫ��\\npc\\linxi_npc.lua");
end

function init_xc_ls_sq()
	-- \script\item\xiancao.lua ע�⣺�˱�Ӧ������ļ��ڵı���һ�£�
	local tXclInfo =
	{
		{2, 1, 1012, 7200, 150, "B�ng Lai Ti�n Th�y",1},
		{2, 0, 109, 7200, 200, "B�ng Lai Ti�n L�",1.5},
		{2, 1, 1013, 7200, 300, "B�ng Lai Ti�n ��n",2},
		{2, 1, 1052, 7200, 120, "B�ng Lai L� Th�y",0},
	}
	for index, value in tXclInfo do
		InitXclSpeed(index, value[5])
	end

	-- \script\item\item_billing\shengwangwan.lua ע�⣺�˱�Ӧ������ļ��ڵı���һ�£�
	local tLsInfo =
	{
		{2, 1, 1064, 480, 1, "L�c Th�n ho�n"},
		{2, 1, 1065, 480, 2, "C��ng L�c Th�n ho�n"},
		{2, 1, 1066, 480, 3, "L�c Th�n Ti�n ��n"},
	}
	for index, value in tLsInfo do
		InitLiushenSpeed(index, value[5])
	end
	InitLiushenInterval(6)

	-- \script\item\item_billing\sanqingwan.lua ע�⣺�˱�Ӧ������ļ��ڵı���һ�£�
	local tSqInfo =
	{
		{2, 1, 1097, 480, 1, "Tam Thanh ho�n"},
		{2, 1, 1098, 480, 2, "C��ng Tam Thanh ho�n"},
		{2, 1, 1099, 480, 3, "Tam Thanh Ti�n ��n"},
	}
	for index, value in tSqInfo do
		InitSanqinSpeed(index, value[5])
	end
	InitSanqinInterval(20)
end

function Add_aoyun_npc()
	local nNpcIdx = 0;
	nNpcIdx = CreateNpc("Tr�ch Th�n","Tr��ng l�o V� L�m",200,1412,2807);
	SetNpcScript(nNpcIdx,"\\script\\online\\jiuzhuanxuangong\\jiuzhuan_head.lua");
end
function Add_AoYunQiXi08()
	local nNpcIdx = CreateNpc("V��ng An Th�ch","��c s� ��i H�i V� l�m",100,1435,2973);
	SetNpcScript(nNpcIdx,"\\script\\online\\qixi08\\npc.lua");
	nNpcIdx = CreateNpc("V��ng An Th�ch","��c s� ��i H�i V� l�m",200,1394,2874);
	SetNpcScript(nNpcIdx,"\\script\\online\\qixi08\\npc.lua");
	nNpcIdx = CreateNpc("V��ng An Th�ch","��c s� ��i H�i V� l�m",300,1752,3541);
	SetNpcScript(nNpcIdx,"\\script\\online\\qixi08\\npc.lua");
	for i=0,2 do
		nNpcIdx = CreateNpc("L� S� S�","X�o n�",966+i,1636,3300);
		SetNpcScript(nNpcIdx,"\\script\\online\\qixi06\\qiaonv_npc.lua");
	end;
end;

function AddLaborDay()
	local npcIndex = CreateNpc("G�nh h�ng","Nh� bu�n T� B�o Trai",100,1433,2792);	--Ȫ��
	SetNpcScript(npcIndex,"\\script\\online\\laborday06\\collector_npc_BJ.lua");
	npcIndex = CreateNpc("G�nh h�ng","Nh� bu�n T� B�o Trai",200,1176,2827);	--�꾩
	SetNpcScript(npcIndex,"\\script\\online\\laborday06\\collector_npc_BJ.lua");
	npcIndex = CreateNpc("G�nh h�ng","Nh� bu�n T� B�o Trai",300,1652,3540);	--�ɶ�
	SetNpcScript(npcIndex,"\\script\\online\\laborday06\\collector_npc_BJ.lua");

	npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n","�ng ch� T� B�o Trai", 350,1578,2965);	--����
	SetNpcScript(npcIndex,"\\script\\online\\laborday06\\awardprize_npc_XY.lua");
	npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n","�ng ch� T� B�o Trai", 150,1783,3148);	--����
	SetNpcScript(npcIndex,"\\script\\online\\laborday06\\awardprize_npc_XY.lua");
end;

function add_mail_carrier()
	local script_name = "\\script\\misc\\mail_carrier.lua"
	local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Ch� B�u c�c", 200, 1332, 2792);
	SetNpcScript(nNpcIdx, script_name);
	local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Ch� B�u c�c", 300, 1760, 3630);
	SetNpcScript(nNpcIdx, script_name);
	local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Ch� B�u c�c", 100, 1476, 2905);
	SetNpcScript(nNpcIdx, script_name);
	local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Ch� B�u c�c", 350, 1380, 3015);
	SetNpcScript(nNpcIdx, script_name);
	local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n", "Ch� B�u c�c", 400, 1425, 3052);
	SetNpcScript(nNpcIdx, script_name);
end

--******************************��һ��*******************************
function AddFirstTongNpc()
	local nNpcIndex = 0;
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1","V� L�m ��c S�",106,1305,2989);	--��Ȫ��163/186
	SetNpcScript(nNpcIndex, "\\script\\online\\jpz_event\\first_tong\\wulinteshi_npc.lua");

	nNpcIndex = CreateNpc("R��ng ti�n","B�o r��ng Hoa s�n",969,1597,2981,-1,1,1,100)			--����
	SetNpcScript(nNpcIndex,"\\script\\online\\jpz_event\\first_tong\\huashan_box_npc.lua")
	SetGlbValue(501,nNpcIndex)

	nNpcIndex = CreateNpc("V� L�m Minh Ch�1","V� L�m ��c S�",969,1643,3225)		--��ɽnpc
	SetNpcScript(nNpcIndex,"\\script\\online\\jpz_event\\first_tong\\huashan_npc.lua")
end;
function AddVuPhuong()
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) <= 09113024 then
	--�����䷼����NPC--NPCģ���ǣ���
		local npcIndex = 0;
		npcIndex = CreateNpc("T�ng T��ng Qu�n", "V� Ph��ng T��ng Qu�n", 200, 1412, 2864);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		npcIndex = CreateNpc("T�ng T��ng Qu�n", "V� Ph��ng T��ng Qu�n", 300, 1770, 3560);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		npcIndex = CreateNpc("T�ng T��ng Qu�n", "V� Ph��ng T��ng Qu�n", 100, 1455, 2979);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		npcIndex = CreateNpc("T�ng T��ng Qu�n", "V� Ph��ng T��ng Qu�n", 350, 1467, 2987);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		npcIndex = CreateNpc("T�ng T��ng Qu�n", "V� Ph��ng T��ng Qu�n", 150, 1709, 3161);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		npcIndex = CreateNpc("T�ng T��ng Qu�n", "V� Ph��ng T��ng Qu�n", 400, 1479, 3031);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
	end
end

function Add_0910_npc()
	if tonumber(date("%y%m%d%H")) >= 09092800 and tonumber(date("%y%m%d%H")) < 09102524 then
		local npcIndex = 0;
		npcIndex = CreateNpc("��ng n�1","Ti�u Quy�n",350,1424,2973);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_quyen.lua");
		npcIndex = CreateNpc("��ng n�2","Ti�u Ch�u",350,1428,2977);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_chau.lua");
		npcIndex = CreateNpc("��ng n�3","Ti�u Anh",350,1422,2977);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_anh.lua");
		
		npcIndex = CreateNpc("��ng n�1","Ti�u Quy�n",400,1493,3013);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_quyen.lua");
		npcIndex = CreateNpc("��ng n�2","Ti�u Ch�u",400,1498,3018);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_chau.lua");
		npcIndex = CreateNpc("��ng n�3","Ti�u Anh",400,1492,3021);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_anh.lua");
		
		npcIndex = CreateNpc("��ng n�1","Ti�u Quy�n",100,1447,2990);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_quyen.lua");
		npcIndex = CreateNpc("��ng n�2","Ti�u Ch�u",100,1450,2997);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_chau.lua");
		npcIndex = CreateNpc("��ng n�3","Ti�u Anh",100,1444,2996);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\8\\npc_xiao_anh.lua");
	end
end

----Խ��2009��6��7�·ݻNPC���
function Add67EventNpcs()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 09071924 then
		local npcIndex = 0;
	--����ҹ��NPC
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 200, 1392, 2844);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 300, 1745, 3540);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 100, 1435, 2959);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 350, 1447, 2987);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 150, 1689, 3141);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 400, 1486, 3011);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_yecao.lua");

	--����ҹ�ݽ���ϰ�NPC
		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n", "Ch� Ng�n Kh�", 200, 1402, 2854);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_jinkulaoban.lua");
		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n", "Ch� Ng�n Kh�", 300, 1760, 3550);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_jinkulaoban.lua");
		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n", "Ch� Ng�n Kh�", 100, 1445, 2969);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_jinkulaoban.lua");
		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n", "Ch� Ng�n Kh�", 350, 1457, 2997);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_jinkulaoban.lua");
		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n", "Ch� Ng�n Kh�", 150, 1699, 3151);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_jinkulaoban.lua");
		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n", "Ch� Ng�n Kh�", 400, 1491, 3031);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\2\\npc_jinkulaoban.lua");

	--������ԭ����NPC
		npcIndex = CreateNpc("V� �ang  ch��ng m�n", "Ph�c Nguy�n Ch�n Nh�n", 200, 1402, 2864);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\1\\npc_fuyuanzheren.lua");
		npcIndex = CreateNpc("V� �ang  ch��ng m�n", "Ph�c Nguy�n Ch�n Nh�n", 300, 1758, 3529);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\1\\npc_fuyuanzheren.lua");
		npcIndex = CreateNpc("V� �ang  ch��ng m�n", "Ph�c Nguy�n Ch�n Nh�n", 100, 1440, 2976);--
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\1\\npc_fuyuanzheren.lua");
		npcIndex = CreateNpc("V� �ang  ch��ng m�n", "Ph�c Nguy�n Ch�n Nh�n", 350, 1442, 2997);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\1\\npc_fuyuanzheren.lua");
		npcIndex = CreateNpc("V� �ang  ch��ng m�n", "Ph�c Nguy�n Ch�n Nh�n", 150, 1699, 3161);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\1\\npc_fuyuanzheren.lua");
		npcIndex = CreateNpc("V� �ang  ch��ng m�n", "Ph�c Nguy�n Ch�n Nh�n", 400, 1494, 3016);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\1\\npc_fuyuanzheren.lua");
		--����������NPC
				
		local nSets1 = {{1691, 3081}, {1644, 3124}, {1688, 3194}, {1643, 3282}, {1718, 3263}};
		for i = 1, 5 do--ǧѰ��һ�� Thi�n T�m Th�p 
			local nRand = random(1, getn(nSets1));
			CreateNpc("Th� M�p", "Th� M�p", 116, nSets1[nRand][1], nSets1[nRand][2]);
		end
		
		local nSets2 = {{1500, 2903}, {1424, 2896}, {1387, 3053}, {1443, 3066}, {1532, 3153}};
		for i = 1, 5 do--ǧѰ��һ�� Thi�n T�m Th�p 
			local nRand = random(1, getn(nSets2));
			CreateNpc("Th� M�p", "Th� M�p", 403, nSets2[nRand][1], nSets2[nRand][2]);
		end
		
		local nSets3 = {{1528, 3115}, {1584, 2912}, {1488, 2646}, {1390, 2702}, {1392, 2912}};
		for i = 1, 5 do--ǧѰ��һ�� Thi�n T�m Th�p 
			local nRand = random(1, getn(nSets3));
			CreateNpc("Th� M�p", "Th� M�p", 102, nSets3[nRand][1], nSets3[nRand][2]);
		end
		
		local nSets4 = {{1664, 3424}, {1728, 3504}, {1872, 3264}, {2064, 3456}, {1776, 3696}};
		for i = 1, 5 do--ǧѰ��һ�� Thi�n T�m Th�p 
			local nRand = random(1, getn(nSets4));
			CreateNpc("Th� M�p", "Th� M�p", 409, nSets4[nRand][1], nSets4[nRand][2]);
		end
		
		local nSets5 = {{1552, 2752}, {1496, 3056}, {1456, 2864}, {1392, 3087}, {1376, 2752}};
		for i = 1, 5 do--ǧѰ��һ�� Thi�n T�m Th�p 
			local nRand = random(1, getn(nSets5));
			CreateNpc("Th� M�p", "Th� M�p", 151, nSets5[nRand][1], nSets5[nRand][2]);
		end
	end

	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 09080224 then
	--�����䷼����NPC--NPCģ���ǣ���
		local npcIndex = 0;
		npcIndex = CreateNpc("T�ng T��ng Qu�n", "V� Ph��ng T��ng Qu�n", 200, 1412, 2864);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		npcIndex = CreateNpc("T�ng T��ng Qu�n", "V� Ph��ng T��ng Qu�n", 300, 1770, 3560);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		npcIndex = CreateNpc("T�ng T��ng Qu�n", "V� Ph��ng T��ng Qu�n", 100, 1455, 2979);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		npcIndex = CreateNpc("T�ng T��ng Qu�n", "V� Ph��ng T��ng Qu�n", 350, 1467, 2987);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		npcIndex = CreateNpc("T�ng T��ng Qu�n", "V� Ph��ng T��ng Qu�n", 150, 1709, 3161);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
		npcIndex = CreateNpc("T�ng T��ng Qu�n", "V� Ph��ng T��ng Qu�n", 400, 1479, 3031);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\6\\npc_wufangjiangjun.lua");
	end
	
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 09080524 then
	--������ңʹ��NPC
		npcIndex = CreateNpc("V� L�m Minh Ch�1", "S� Gi� Ti�u Giao", 200, 1422, 2874);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\7\\npc_xiaoyaoshizhe.lua");
		npcIndex = CreateNpc("V� L�m Minh Ch�1", "S� Gi� Ti�u Giao", 300, 1750, 3570);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\7\\npc_xiaoyaoshizhe.lua");
		npcIndex = CreateNpc("V� L�m Minh Ch�1", "S� Gi� Ti�u Giao", 100, 1465, 2989);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\7\\npc_xiaoyaoshizhe.lua");
		npcIndex = CreateNpc("V� L�m Minh Ch�1", "S� Gi� Ti�u Giao", 350, 1447, 3007);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\7\\npc_xiaoyaoshizhe.lua");
		npcIndex = CreateNpc("V� L�m Minh Ch�1", "S� Gi� Ti�u Giao", 150, 1689, 3171);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\7\\npc_xiaoyaoshizhe.lua");
		npcIndex = CreateNpc("V� L�m Minh Ch�1", "S� Gi� Ti�u Giao", 400, 1501, 3005);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200907\\7\\npc_xiaoyaoshizhe.lua");
	end
end

function AddNpcYecao()
--	if tonumber(date("%y%m%d%H")) >= 09073100 and tonumber(date("%y%m%d%H")) <= 09090624 then
		local npcIndex = 0;
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 200, 1392, 2844);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 300, 1745, 3540);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 100, 1435, 2959);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 350, 1447, 2987);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 150, 1689, 3141);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 400, 1486, 3011);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
		npcIndex = CreateNpc("Ch� T� l�a Trung Nguy�n", "D� Th�o", 500, 1733, 3142);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200908\\yecao\\npc_yecao.lua");
--	end
end
--Խ��09��8��NPC���
function add_0908_npc()
	local nDate = tonumber(date("%y%m%d"));
	local npcIndex = 0;
	if nDate >= 090807 and nDate < 090907 then
		npcIndex = CreateNpc("Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 500, 1774, 3124);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200908\\6\\npc_mijishoucangjia.lua");
	end
	if nDate >= 090830 and nDate < 090907 then
		npcIndex = CreateNpc("B� mai", "B� x� Th� r�n L�u", 350, 1412, 2928);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200908\\quockhanh\\npc_quockhanh.lua");
	end
end

--Խ��09��8�µ����������й�����NPC���
function add_0908_tuoguan_plant_npc()
	local nNpcIndex = 0;
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1", "V� L�m S� Gi�", 200, 1433, 2857);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1", "V� L�m S� Gi�", 300, 1747, 3490);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1", "V� L�m S� Gi�", 350, 1358, 2907);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1", "V� L�m S� Gi�", 150, 1668, 3133);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1", "V� L�m S� Gi�", 100, 1464, 2987);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1", "V� L�m S� Gi�", 500, 1729, 3161);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1", "V� L�m S� Gi�", 400, 1523, 2974);
	SetNpcScript(nNpcIndex, "\\script\\task\\plant_tuoguan\\npc_wulinshizhe.lua");
end

--Խ��09��9������NPC���
function add_0909_npc()
	local nDate = tonumber(date("%y%m%d"));
	local npcIndex = 0;
	if nDate >= 090918 and nDate < 091026 then
		--�������
--		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n", "Qu�n L� B�o R��ng", 100, 1443, 2975);
--		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\7\\npc_baoxiangguanli.lua");
--		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n", "Qu�n L� B�o R��ng", 200, 1405, 2858);
--		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\7\\npc_baoxiangguanli.lua");
--		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n", "Qu�n L� B�o R��ng", 150, 1697, 3159);
--		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\7\\npc_baoxiangguanli.lua");
--		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n", "Qu�n L� B�o R��ng", 350, 1462, 2980);
--		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\7\\npc_baoxiangguanli.lua");
--		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n", "Qu�n L� B�o R��ng", 300, 1758, 3529);
--		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\7\\npc_baoxiangguanli.lua");
--		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n", "Qu�n L� B�o R��ng", 500, 1743, 3122);
--		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\7\\npc_baoxiangguanli.lua");
		--���ĵ���
		npcIndex = CreateNpc("��n K�o Qu�n","��n K�o Qu�n", 100,1439,2993);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua");
		npcIndex = CreateNpc("��n K�o Qu�n","��n K�o Qu�n", 300,1728,3516);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua");
		npcIndex = CreateNpc("��n K�o Qu�n","��n K�o Qu�n", 200,1378,2854);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua");
		npcIndex = CreateNpc("��n K�o Qu�n","��n K�o Qu�n", 400,1486,3025);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua");
		npcIndex = CreateNpc("��n K�o Qu�n","��n K�o Qu�n", 150,1683,3134);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua");
		npcIndex = CreateNpc("��n K�o Qu�n","��n K�o Qu�n", 350,1419,2981);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200909\\6\\npc_zhongxindenglong.lua");
	end
end


--Խ��09��11��NPC���
function add_0911_npc()
	local nDate = tonumber(date("%y%m%d"));
	local npcIndex = 0;
	if nDate >= 091113 and nDate < 091130 then
		npcIndex = CreateNpc("Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 500, 1774, 3124);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
		npcIndex = CreateNpc("Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 200,1376,2862);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
		npcIndex = CreateNpc("Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 300,1731,3511);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
		npcIndex = CreateNpc("Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 100,1420,2975);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
		npcIndex = CreateNpc("Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 150,1693,3137);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
		npcIndex = CreateNpc("Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 350,1441,2959);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
		npcIndex = CreateNpc("Ch� c�m �� Th� Ph�n", "Nh� S�u T�m M�t T�ch", 400,1507,2982);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\4\\npc_mijishoucangjia.lua");
	end
end

function Add_ip_npc()
		local npcIndex = 0;
		npcIndex = CreateNpc("Phu nh�n-ph� th�ng","Ch� Ch� Ph�ng M�y", 200,1372,2865);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");		
		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n","Anh Ch� Ph�ng M�y", 300,1732,3517);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");		
		npcIndex = CreateNpc("Phu nh�n-ph� th�ng","Ch� Ch� Ph�ng M�y", 100,1432,2994);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");		
		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n","Anh Ch� Ph�ng M�y", 350,1431,2973);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");		
		npcIndex = CreateNpc("Phu nh�n-ph� th�ng","Ch� Ch� Ph�ng M�y", 150,1688,3169);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");		
		npcIndex = CreateNpc("Ch� c�m �� Trung Nguy�n","Anh Ch� Ph�ng M�y", 400,1547,2991);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");		
end

function Add_bachtiensinh()
		local npcIndex = 0
		npcIndex = CreateNpc("Nguy�t L�o", "B�ch Ti�n Sinh", 200, 1372, 2851);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
		npcIndex = CreateNpc("Nguy�t L�o", "B�ch Ti�n Sinh", 300, 1726, 3522);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
		npcIndex = CreateNpc("Nguy�t L�o", "B�ch Ti�n Sinh", 350, 1426, 2982);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
		npcIndex = CreateNpc("Nguy�t L�o", "B�ch Ti�n Sinh", 150, 1694, 3161);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
		npcIndex = CreateNpc("Nguy�t L�o", "B�ch Ti�n Sinh", 100, 1441, 2983);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
		npcIndex = CreateNpc("Nguy�t L�o", "B�ch Ti�n Sinh", 400, 1531, 2964);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
		npcIndex = CreateNpc("Nguy�t L�o", "B�ch Ti�n Sinh", 500, 1743, 3152);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua");
end

--Խ��09��12��NPC���
function add_0912_npc()
	local nDate = tonumber(date("%y%m%d"));
	local npcIndex = 0;
	if nDate >= 091218 and nDate < 100117 then
		npcIndex = CreateNpc("Nguy�t L�o", "V�n Ni�n Gia", 200, 1402, 2863);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		npcIndex = CreateNpc("Nguy�t L�o", "V�n Ni�n Gia", 300, 1741, 3513);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		npcIndex = CreateNpc("Nguy�t L�o", "V�n Ni�n Gia", 100, 1439, 2964);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		npcIndex = CreateNpc("Nguy�t L�o", "V�n Ni�n Gia", 150, 1696, 3140);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		npcIndex = CreateNpc("Nguy�t L�o", "V�n Ni�n Gia", 350, 1427, 2972);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		npcIndex = CreateNpc("Nguy�t L�o", "V�n Ni�n Gia", 400, 1510, 2988);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
		npcIndex = CreateNpc("Nguy�t L�o", "V�n Ni�n Gia", 500, 1742, 3138);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\200912\\2\\npc_wannianjia.lua");
	end
end
function Add_TianMenZhen()
	local tNpcInfo = {
		"D��ng V�n Si�u",
		"Phi�u k� t��ng qu�n Qu�ch Qu�n B�ng ",
		{
			{350,1429,2816},
			{300,1855,3672},
			{400,1437,2869},
		},
		"\\script\\missions\\tianmenzhen\\tmz_npc.lua"
	}
	for i = 1,getn(tNpcInfo[3]) do
		local nNpcIndex = CreateNpc(tNpcInfo[1],tNpcInfo[2],tNpcInfo[3][i][1],tNpcInfo[3][i][2],tNpcInfo[3][i][3])
		SetNpcScript(nNpcIndex,tNpcInfo[4])
	end
	local nNpcIndex = CreateNpc("D� Lu�t B�o ��","Li�u Qu�n Quan",604,1554,3125);
	SetNpcDeathScript(nNpcIndex,"\\script\\missions\\tianmenzhen\\tmz_task_npc.lua");
end

--��ɽ����NPC����
function Liangshan_Entrance()
		local tPoes = {
		{200, 1161, 2862},
		{100, 1368, 2873},
		{300, 1967, 3537},
	}
	for _, tPos in tPoes do
		local npcIndex = CreateNpc("Th�n H�nh Th�i B�o ��i T�ng", "Th�n H�nh Th�i B�o ��i T�ng", tPos[1], tPos[2], tPos[3])
		AddUnitStates(npcIndex, 7, 0);
		AddUnitStates(npcIndex, 8, -GetUnitCurStates(npcIndex, 8));
		SetNpcScript(npcIndex, "\\script\\missions\\liangshan\\npc\\entrynpc_.lua");
	end
end

function Add_TuBaoThuongNhan()
  	local npcIndex111 = CreateNpc("Ch��ng d��c Th� Ph�n", "T� B�o Th��ng Nh�n", 200, 1449, 2911);
    	SetNpcScript(npcIndex111, "\\script\\vng\\saleoff\\proday.lua");
end

--����npc_list.txt���õ�NPC
function LoadNpcList()
	
	--------------------------------------------------------------------
	do
		--��ʱ�Ѵ����̵�NPC�����ﴴ����
    	local npcIndex111 = CreateNpc("Ch��ng d��c Th� Ph�n", "T� B�o Th��ng Nh�n", 200, 1449, 2911);
    	SetNpcScript(npcIndex111, "\\script\\equip_shop\\bianjing_npc.lua");
    	return
	end
	--------------------------------------------------------------------
	
	
	---���»�����ʱ�Ȳ����Ű��Ժ�������
	local SZ_NPC_LIST_FILE = "\\settings\\npc\\npc_list.txt"
	local tbNpcListFile = new(KTabFile, SZ_NPC_LIST_FILE);
	if tbNpcListFile then
		if tbNpcListFile.__bOpen ~= 0 then
			local nRowCnt = tbNpcListFile:getRow() or 0;
			local nCurDate = tonumber(date("%Y%m%d"));
			
			local szTemplateName, szNpcName = "", "";
			local nCreateStartDate, nCreateEndDate = 0, 0;
			local nMapId, nPosX, nPosY = 0, 0, 0;
			local szScript = "";
			for i = 3, nRowNum do
				nCreateStartDate = tonumber(tbNpcListFile:getCell(i, "CreateStartDate")) or 0;
				nCreateEndDate = tonumber(tbNpcListFile:getCell(i, "CreateEndDate")) or 0;
				if _IsInCreateDate(nCurDate, nCreateStartDate, nCreateEndDate) == 1 then--ֻ������Ч�ڵ�NPC�Ŵ���
					szTemplateName = tbNpcListFile:getCell(i, "TemplateName");
					szNpcName = tbNpcListFile:getCell(i, "NpcName");
					szScript = tbNpcListFile:getCell(i, "DialogScript");
					nMapId = tonumber(tbNpcListFile:getCell(i, "MapId")) or 0 
					nPosX = tonumber(tbNpcListFile:getCell(i, "MapX")) or 0 
					nPosY = tonumber(tbNpcListFile:getCell(i, "MapY")) or 0 
					
					local nNpcIndex = CreateNpc(szTemplateName, szNpcName, nMapId, nPosX, nPosY);
					if szScript and szScript ~= "" and nNpcIndex > 0 then
						SetNpcScript(nNpcIndex, szScript);
					end
				end
			end
		end
		tbNpcListFile:close();--�ر��ļ�
	end
end

--�жϵ�ǰ�����Ƿ�����Ч��
function _IsInCreateDate(nCurDate, nStartDate, nFinishDate)
	if  not nCurDate or nCurDate <= 0 then
		return 0;
	end
	if nStartDate and nStartDate > 0 and nCurDate < nStartDate then
		return 0;
	end
	if nFinishDate and nFinishDate > 0 and nCurDate >= nFinishDate then
		return 0;
	end
	return 1;
end

function DragonBoat_2011_npc()
	local tPos = {
			{150,1691,3159}, --{300,1648,3534} ������û�д˵�ͼ
		}
	local tPosinfo
	for _,tPosinfo in tPos do
		local nNpcIndex = CreateNpc("Thi�n V��ng Bang ��","H�i Chi�n Ti�p D�n S�",tPosinfo[1],tPosinfo[2],tPosinfo[3])
		SetNpcScript(nNpcIndex,"\\script\\missions\\dragonboat2011\\npc_entrance.lua")
	end
end

function Init_newres()
--	if SubWorldID2Idx(606) >= 0 then	
	if mf_GetMissionV(24, 1,606) == 0 then			
    		mf_OpenMission(24, 606)
    		AddGlobalNews("Thi�n M�n Tr�n-T�i nguy�n chi�n �� b�t ��u. M�i c�c v� anh h�ng mau ch�ng ��n T��ng D��ng t�m T� M� T�n Nguy�n �� tham gia!")
    		Msg2SubWorld("Thi�n M�n Tr�n-T�i nguy�n chi�n �� b�t ��u. M�i c�c v� anh h�ng mau ch�ng ��n T��ng D��ng t�m T� M� T�n Nguy�n �� tham gia!")
    	end
--    	end
end

function Init_pet_fighting()
	if mf_GetMissionV(44, 1,101) == 0 then			
    		mf_OpenMission(44, 101)    		    		
    	end
end

function Init_golden_chest()
	local tPos = 	{
							{513,1645,2983},{513,1649,2979},{513,1636,2993},{513,1642,2972},{513,1666,2772},{513,1666,2780},{513,1666,2786},{513,1665,2790},{513,1558,3090},{513,1567,3084},{513,1573,3093},{513,1567,3108},{513,1627,3160},{513,1621,3172},{513,1632,3177},{513,1604,3158},
							{514,1721,3074},{514,1715,3080},{514,1728,3067},{514,1721,3056},{514,1742,2887},{514,1736,2892},{514,1743,2899},{514,1752,2895},{514,1809,2987},{514,1808,2995},{514,1820,2990},{514,1822,2981},{514,1819,2971},{514,1814,2958},{514,1824,2961},{514,1836,2972},
							{108,1422,3187},{108,1425,3180},{108,1434,3187},{108,1471,3004},
							{301,1565,3110},{301,1569,3102},{301,1564,3090},{301,1510,2977},
						}											
	local nNpcIndex = 0;	
	for i=1, getn(tPos) do 	
		nNpcIndex = CreateNpc("R��ng n�t", "R��ng Ho�ng Kim", tPos[i][1],  tPos[i][2],  tPos[i][3]);
		SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\golden_card\\npc_golden_chest.lua");
		SetUnitCurStates(nNpcIndex,2,i)
	end
end

function AddTuLinhNpc()
	local nNation =GetGlbValue(GLB_TSK_SERVER_ID)
	local szName = ""
	local nDate = tonumber(date("%Y%m%d"))
	local nGroup = 2
	for i = 1, getn(tb_server_group) do
		for j = 1, getn(tb_server_group[i]) do
			if nNation == tb_server_group[i][j] then
				nGroup = i
				break 
			end
		end
	end
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if nNation == TB_NATION_SERVERLIST[i][1] then
			szName = TB_NATION_SERVERLIST[i][2]
			break
		end
	end
	
	npcIndex = CreateNpc(tb_npc_type[nGroup], szName, 100, 1416, 2965)
	AddUnitStates(npcIndex, 6, nGroup)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\tulinhthu_npc\\head.lua")
	-- Add NPC dua top
	if tbNPC_TopServer[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbNPC_TopServer[GetGlbValue(GLB_TSK_SERVER_ID)] then
			npcIndex = CreateNpc(tb_npc_type[nGroup], szName, 200,1405,2840)
			SetNpcScript(npcIndex, "\\script\\online\\viet_event\\top_server\\npc_top.lua")
		end
	end
end


function AddIdolNpc()
	local nNpcIndex = CreateNpc("C�n L�n T�n Ph� Ch��ng M�n", "Th�n T��ng V� L�m", 300, 1789, 3534)
	SetNpcScript(nNpcIndex, "\\script\\online\\viet_event\\karaoke\\head.lua")
end

function get_server_id()
	if GetGlbValue(GLB_TSK_SERVER_ID) == 0 then
		local fileName = ""
		if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
			fileName = "data\\serverid.txt";
		else
			fileName = "data/serverid.txt";
		end		
		local pf = openfile(fileName, "r");
		if not pf then 			
			return
		end		
		local str = read(pf, "*l");
		if not str then
			closefile(pf);
			return 
		end
		local nsid = tonumber(str) or 1;
		closefile(pf);
		SetGlbValue(GLB_TSK_SERVER_ID,nsid)
	end
end

function Add_HoangHuynh()
	local nDate = tonumber(date("%y%m%d"))
	local npcIndex = 0
	if nDate >= 100716 then
		npcIndex = CreateNpc("Tr�n B�t Vi", "Ho�ng Huynh", 200,1407,2857);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\top_server\\npc_top.lua");
	end
end

function Add_GoldenCard_Manager()
	local nDate = tonumber(date("%y%m%d"))
	local npcIndex = 0
--	if nDate >= 100928 and nDate <= 121231 then
		npcIndex = CreateNpc("Nh� Ho�ng T�_��i L�", "L�i H� Th��ng Nh�n", 200,1378,2857);
		SetNpcScript(npcIndex, "\\script\\online\\viet_event\\golden_card\\npc_golden_saleman.lua");
--	end
end

function Add_XaPhu()
    local npcIdx = CreateNpc("Xa phu Trung Nguy�n", "Thuy�n phu ��ng H�i", 200,1396,2874);
    SetNpcScript(npcIdx, "\\script\\online\\viet_event\\oversea\\oversea_npc.lua");
    
    local tFighting_pos = {
			{101, 1656, 3081},
			{101, 1638, 3146},
			{101, 1600, 3183},
			{101, 1573, 3176},
			{101, 1543, 3195},
			{101, 1516, 3309},
			{101, 1526, 3244},
			{101, 1547, 3272},
			{101, 1506, 3116},
			{101, 1544, 3131},
    }
    
    for i=1,getn(tFighting_pos) do
    		npcIdx = CreateNpc("Ti�u s�-��i tho�i", "T� th� k�", tFighting_pos[i][1],tFighting_pos[i][2],tFighting_pos[i][3]);
    		SetNpcScript(npcIdx, "\\script\\online\\viet_event\\pet_fighting\\fighting_npc.lua");
    		SetUnitCurStates(npcIdx,2,i)
    end    
end


function Add_PetNpc()
	local npcIndex = 0
--	npcIndex = CreateNpc("Chu B�t Ho�c","B�c ��u L�o Nh�n",  300, 1786, 3532)
--	SetNpcScript(npcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
--	npcIndex = CreateNpc("Chu B�t Ho�c","B�c ��u L�o Nh�n",  200, 1392, 2810)
--	SetNpcScript(npcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
	npcIndex = CreateNpc("Chu B�t Ho�c","B�c ��u L�o Nh�n",  100, 1453, 2939)
	SetNpcScript(npcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
--	npcIndex = CreateNpc("Chu B�t Ho�c","B�c ��u L�o Nh�n",  150, 1731, 3151)
--	SetNpcScript(npcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
--	npcIndex = CreateNpc("Chu B�t Ho�c","B�c ��u L�o Nh�n",  350, 1428, 2940)
--	SetNpcScript(npcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
--	npcIndex = CreateNpc("Chu B�t Ho�c","B�c ��u L�o Nh�n",  400, 1565, 2978)
--	SetNpcScript(npcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
--	npcIndex = CreateNpc("Chu B�t Ho�c","B�c ��u L�o Nh�n",  500, 1747, 3129)
--	SetNpcScript(npcIndex, "\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
end

function AddHangNga()
	local npcIndex = 0
	npcIndex = CreateNpc("Phi Y�n Ti�n T�","H�ng Nga Ti�n T�",  100, 1428, 2939)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\nop_event\\hangnga.lua")
end

function AddBirthdayNpc_2010()
	local npcIndex = 0
	npcIndex = CreateNpc("V� L�m Minh Ch�1","S� Gi� Ho�t ��ng",  100, 1426, 3012)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\birthday\\sugia.lua")
end

function Add_Pet_TaiXu()
	local npcIndex = CreateNpc("V� �ang  ch��ng m�n", "V�n Du Ch�n Nh�n", 200, 1387, 2879)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\pet_instance\\reg_npc.lua")
	local npcIndex = CreateNpc("V� �ang  ch��ng m�n", "V�n Du Ch�n Nh�n", 300, 1749, 3535)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\pet_instance\\reg_npc.lua")
end

function Add_TianMenZhen()
	local nNpcIndex = 0;
	--nNpcIndex = CreateNpc("D��ng V�n Si�u","Phi�u k� t��ng qu�n Qu�ch Qu�n B�ng ",350,1429,2816);
	nNpcIndex = CreateNpc("D��ng V�n Si�u","Phi�u k� t��ng qu�n Qu�ch Qu�n B�ng ",300,1854,3672);
	SetNpcScript(nNpcIndex,"\\script\\missions\\tianmenzhen\\tmz_npc.lua");
	nNpcIndex = CreateNpc("D��ng V�n Si�u","Phi�u k� t��ng qu�n Qu�ch Qu�n B�ng ",400,1435,2864);
	SetNpcScript(nNpcIndex,"\\script\\missions\\tianmenzhen\\tmz_npc.lua");
	nNpcIndex = CreateNpc("D� Lu�t B�o ��","Li�u Qu�n Quan",604,1554,3125);
	SetNpcDeathScript(nNpcIndex,"\\script\\missions\\tianmenzhen\\tmz_task_npc.lua");
end

--��������
function create_treasuer_chests()
	local tPos = {
		{300,1723,3537},
		{350,1453,2974},
		{150,1675,3153},
		{200,1379,2852},
		{500,1760,3131},
		{100,1413,2975},
		{400,1517,2968},
	}
	local tPosinfo
	for _,tPosinfo in tPos do
		local nNpcIndex = CreateNpc("Ch� c�m �� T�y Nam","Th��ng Nh�n B�o R��ng",tPosinfo[1],tPosinfo[2],tPosinfo[3])
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\treasure_box\\npc_treasuer_chests.lua")
	end
end

function dialog_npc_create()
	local nNpcIndex;
	--�Ի�NPC����
	nNpcIndex = CreateNpc("Tr��ng ��i H�u","Tr��ng ��i H�u",106,1307,2983);
	SetNpcScript(nNpcIndex,"\\script\\������\\��Ȫ��\\npc\\�Ŵ���.lua");
	nNpcIndex = CreateNpc("C�ng t�c nguy�t l��ng","C�ng t�c nguy�t l��ng",111,1665,2826);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��������.lua");
	nNpcIndex = CreateNpc("Nh�c B�t Qu�n","Nh�c B�t Qu�n",502,1682,3102);
	SetNpcScript(nNpcIndex,"\\script\\������\\��ɽ\\npc\\����Ⱥ.lua");
	nNpcIndex = CreateNpc("D��ng M�n �� t�","D��ng M�n �� t�",6012,1588,3207);
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\����������\\���ŵ���.lua");
	nNpcIndex = CreateNpc("Nh�n Kha","Nh�n Kha",218,1627,3245);
	SetNpcScript(nNpcIndex,"\\script\\��ԭһ��\\�鱦ɽ\\npc\\�տ�.lua");
	nNpcIndex = CreateNpc("H��ng V�n Thi�n","H��ng V�n Thi�n",6009,1598,3200);
	SetNpcScript(nNpcIndex,"\\script\\������\\�һ���\\������.lua");
	nNpcIndex = CreateNpc("H��ng V�n Thi�n","H��ng V�n Thi�n",6010,1598,3200);
	SetNpcScript(nNpcIndex,"\\script\\������\\�һ���\\������.lua");
	nNpcIndex = CreateNpc("H��ng V�n Thi�n","H��ng V�n Thi�n",6011,1598,3200);
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\�һ�Сջ\\������.lua");
	nNpcIndex = CreateNpc("Ng� ��c �� t�","Ng� ��c �� t�",6012,1591,3204);
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\����������\\�嶾����.lua");
	nNpcIndex = CreateNpc("V� �ang �� t�","V� �ang �� t�",6012,1595,3202);
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\����������\\�䵱����.lua");
	nNpcIndex = CreateNpc("V� Danh T�ng","V� Danh T�ng",6012,1601,3200);
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\����������\\����ɮ.lua");
	nNpcIndex = CreateNpc("C�ng t�c � ya","C�ng t�c � ya",111,1698,3114);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��ѻ����.lua");
	nNpcIndex = CreateNpc("T� B�t �ng","T� B�t �ng",6016,1562,2938);
	SetNpcScript(nNpcIndex,"\\script\\������\\÷ׯ\\ͺ����.lua");
	nNpcIndex = CreateNpc("���ng M�n �� t�","���ng M�n �� t�",6012,1598,3211);
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\����������\\���ŵ���.lua");
	nNpcIndex = CreateNpc("C�ng t�c th�i d��ng","C�ng t�c th�i d��ng",111,1862,3040);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\̫������.lua");
	nNpcIndex = CreateNpc("Nh�m Doanh Doanh","Nh�m Doanh Doanh",6014,1580,3115);
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\����\\��ӯӯ.lua");
	nNpcIndex = CreateNpc("Nh�m Doanh Doanh","Nh�m Doanh Doanh",6011,1602,3204);
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\�һ�Сջ\\��ӯӯ.lua");
	nNpcIndex = CreateNpc("Nh�m Ng� H�nh","Nh�m Ng� H�nh",6013,1634,3216);
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\÷ׯ����\\������.lua");
	nNpcIndex = CreateNpc("Nh�m Ng� H�nh","Nh�m Ng� H�nh",6010,1600,3202);
	SetNpcScript(nNpcIndex,"\\script\\������\\�һ���\\������.lua");
	nNpcIndex = CreateNpc("Nh�m Ng� H�nh","Nh�m Ng� H�nh",6011,1600,3201)
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\�һ�Сջ\\������.lua")
	nNpcIndex = CreateNpc("L�c Tr�c �ng","L�c Tr�c �ng",350,1574,2904)
	SetNpcScript(nNpcIndex,"\\script\\��ԭ����\\����\\npc\\������.lua")
	nNpcIndex = CreateNpc("L� L�o","L� L�o",507,1686,3322)
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\����.lua")
	nNpcIndex = CreateNpc("Ho�ng Chung C�ng","Ho�ng Chung C�ng",6016,1488,2938)
	SetNpcScript(nNpcIndex,"\\script\\������\\÷ׯ\\���ӹ�.lua")
	nNpcIndex = CreateNpc("H�c T�ng Qu�n","H�c T�ng Qu�n",6015,1503,3179)
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\���ܹ�.lua")
	nNpcIndex = CreateNpc("H�c B�ch T�","H�c B�ch T�",6016,1460,2988)
	SetNpcScript(nNpcIndex,"\\script\\������\\÷ׯ\\�ڰ���.lua")
	nNpcIndex = CreateNpc("H�n T� Phi","H�n T� Phi",400,1587,3081)
	SetNpcScript(nNpcIndex,"\\script\\������\\����\\npc\\������.lua")
	nNpcIndex = CreateNpc("�� t� C�i Bang","�� t� C�i Bang",6012,1596,3214)
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\����������\\ؤ�����.lua")
	nNpcIndex = CreateNpc("Nga Mi �� t�","Nga Mi �� t�",6012,1601,3209)
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\����������\\��ü����.lua")
	nNpcIndex = CreateNpc("�an Thanh Sinh","�an Thanh Sinh",6016,1517,3003)
	SetNpcScript(nNpcIndex,"\\script\\������\\÷ׯ\\������.lua")
	nNpcIndex = CreateNpc("Th�n tr��ng","Th�n tr��ng",202,1411,2997)
	SetNpcScript(nNpcIndex,"\\script\\��ԭһ��\\�ӻ���\\npc\\�峤.lua")
	nNpcIndex = CreateNpc("B� t�nh Ti�u Th�y","Ti�u Th�y",507,1706,3384)
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\����С��.lua")
	nNpcIndex = CreateNpc("B� t�nh L� Hoa","L� Hoa",507,1632,3374)
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\�����.lua")
	nNpcIndex = CreateNpc("C�ng t�c b�ch v�n","C�ng t�c b�ch v�n",111,1830,2849)
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\���ƻ���.lua")
	nNpcIndex = CreateNpc("Nh�m Ng� H�nh","Nh�m Ng� H�nh",6017,1631,3270);
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\������.lua");
	nNpcIndex = CreateNpc("H��ng V�n Thi�n","H��ng V�n Thi�n",6017,1628,3274);
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\������.lua");
	nNpcIndex = CreateNpc("Nh�m Doanh Doanh","Nh�m Doanh Doanh",6017,1636,3273);
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\��ӯӯ.lua");
	nNpcIndex = CreateNpc("Nh�m Ng� H�nh","Nh�m Ng� H�nh",6018,1621,2897);
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��2\\������.lua");
	nNpcIndex = CreateNpc("H��ng V�n Thi�n","H��ng V�n Thi�n",6018,1596,3040);
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��2\\������.lua");
	nNpcIndex = CreateNpc("Nh�m Doanh Doanh","Nh�m Doanh Doanh",6018,1581,2889);
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��2\\��ӯӯ.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch Lam K�","B� c� Nh�m Ng� H�nh",6017,1623,3285);
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\�����оɲ�.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch B�ch K�","B� c� Nh�m Ng� H�nh",6017,1619,3281);
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\�����оɲ�.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch H�c K�","B� c� Nh�m Ng� H�nh",6017,1633,3286);
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\�����оɲ�.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch H�ng K�","B� c� Nh�m Ng� H�nh",6017,1639,3277);
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\�����оɲ�.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch Lam K�","N�i �ng",6017,1715,2957);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��Ӧ.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch B�ch K�","N�i �ng",6017,1726,2967);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��Ӧ.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch H�c K�","N�i �ng",6017,1734,2979);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��Ӧ.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch H�ng K�","N�i �ng",6017,1743,2985);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��Ӧ.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch Ho�ng K�","N�i �ng",6017,1752,2992);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��Ӧ.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch Lam K�","N�i �ng",6017,1764,2996);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��Ӧ.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch B�ch K�","N�i �ng",6017,1744,3005);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��Ӧ.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch H�c K�","N�i �ng",6017,1731,3011);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��Ӧ.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch H�ng K�","N�i �ng",6017,1716,3017);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��Ӧ.lua");
	nNpcIndex = CreateNpc("��i tho�i Th�ch Kh�ch Ho�ng K�","N�i �ng",6017,1699,3001);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��Ӧ.lua");
	nNpcIndex = CreateNpc("D��ng Li�n ��nh","D��ng Li�n ��nh",6017,1622,2897);
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\����ͤ.lua");
	nNpcIndex = CreateNpc("D��ng Li�n ��nh","D��ng Li�n ��nh",105,1555,3040)
	SetNpcScript(nNpcIndex,"\\script\\������\\Ȫ�ݸ���\\npc\\����ͤ.lua")
	nNpcIndex = CreateNpc("Bao tr��ng l�o","Bao tr��ng l�o",215,1748,3066)
	SetNpcScript(nNpcIndex,"\\script\\��ԭһ��\\�ڷ綴\\npc\\������.lua")
	--����
	local nMapInfo;
	local tbPos = {
		{6017,1730,3139},		{6017,1736,3146},
		{6017,1741,3157},		{6017,1747,3164},
		{6017,1721,3185},		{6017,1715,3191},
		{6017,1700,3182},		{6017,1676,3164},
		{6017,1680,3148},		{6017,1691,3139},
		{6017,1702,3138},		{6017,1711,3130},
		{6017,1720,3135},		{6017,1718,3156},
		{6017,1716,3171},		{6017,1702,3163},
	}
	for _,nMapInfo in tbPos do
		nNpcIndex = CreateNpc("Nhi�m v� v�t ch�t","Tr� b� v�t t�",nMapInfo[1],nMapInfo[2],nMapInfo[3])
		SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��������.lua")
	end
end

function fight_npc_create()
	--ս��NPC����
	local nNpcIndex;
	nNpcIndex = CreateNpc("Nhi�m v� Huy�t L�n ��c M�ng","Huy�t L�n ��c M�ng",6013,1636,3147)
	--СҰ����
	local nMapInfo,nMapInfo1,nMapInfo2;
	local tbPos = {
		{420, 1611, 3573},
		{420, 1512, 3308},
		{420, 1492, 3316},
		{420, 1473, 3643},
		{420, 1430, 3611},
		{420, 1717, 3590},
		{420, 1658, 3655},
		{420, 1730, 3432},
		{420, 1669, 3343},
		{420, 1573, 3573},
	}
	for _,nMapInfo in tbPos do
		CreateNpc("H�c d� tr�","Ti�u H�c tr�",nMapInfo[1],nMapInfo[2],nMapInfo[3],0,3,1,6)
	end
	--�������
	local tbPos1 = {
		{412, 1719, 3002},
		{412, 1572, 2976},
		{412, 1778, 2910},
		{412, 1769, 3051},
		{412, 1680, 3133},
		{412, 1597, 3238},
		{412, 1707, 3243},
		{412, 1778, 3135},
		{412, 1740, 3257},
		{412, 1868, 3064},
	}
	for _,nMapInfo1 in tbPos1 do
		CreateNpc("H�a h�","H�a h�",nMapInfo1[1],nMapInfo1[2],nMapInfo1[3],0,3,1,6)
	end
	--��ͽ
	local tbPos2 = {
		{6014, 1547, 3088},
		{6014, 1536, 3136},
		{6014, 1598, 3155},
		{6014, 1559, 3214},
		{6014, 1542, 3197},
		{6014, 1606, 3130},
		{6014, 1563, 3204},
		{6014, 1540, 3202},
		{6014, 1609, 3135},
	}
	for _,nMapInfo2 in tbPos2 do
		CreateNpc("Gi�o ��","Gi�o ��",nMapInfo2[1],nMapInfo2[2],nMapInfo2[3],0,3,1,6)
	end
	--Ȫ�ݸ�������ͽ
	nNpcIndex = CreateNpc("Gi�o ��","Gi�o ��",105,1557,3027,0,6,1,6);
	nNpcIndex = CreateNpc("Ho�ng Tr��ng L�o","Ho�ng Tr��ng L�o",6015,1744,3155)
	nNpcIndex = CreateNpc("��ng Ph��ng B�t B�i","��ng Ph��ng B�t B�i",6015,1626,2896)
	nNpcIndex = CreateNpc("Ho�ng K� K� Ch�","Tr��ng l�o Ho�ng H�u Vi",6017,1509,3218);
	nNpcIndex = CreateNpc("H�ng K� K� Ch�","Tr��ng l�o Ti�u Nh� H�ng",6017,1601,3048);
	nNpcIndex = CreateNpc("T� h� ph�p M� L�p �ao","T� h� ph�p M� L�p �ao",6017,1624,3056);
	nNpcIndex = CreateNpc("Lam K� K� Ch�","Tr��ng l�o Phi Thi�n Lam Mi�u",6017,1709,3161);
	nNpcIndex = CreateNpc("B�chK� K� Ch�","Tr��ng l�o B�ch Linh Linh",6017,1720,2980);
	nNpcIndex = CreateNpc("H�c K� K� Ch�","Tr��ng l�o H�c V� Th��ng",6017,1487,3029);
	SetNpcDeathScript(nNpcIndex,"\\script\\task\\npc\\���޳�.lua");
end

function trap_npc_create()
	--��ͼ����NPC
	local nNpcIndex;
	nNpcIndex = CreateNpc("Nh�c Linh San","Nh�c Linh San",502,1645,3224)
	SetNpcScript(nNpcIndex,"\\script\\������\\��ɽ\\npc\\����ɺ.lua")
	nNpcIndex = CreateNpc("��ng t� 3","M�n ��ng",102,1456,3066)
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\�һ�Сջ\\ͯ��3.lua")
	nNpcIndex = CreateNpc("��ng t�2","M�n ��ng",6009,1579,3218)
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\�һ�Сջ\\ͯŮ2.lua")
	nNpcIndex = CreateNpc("��ng t�2","M�n ��ng",6010,1579,3218)
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\�һ�Сջ\\ͯŮ2.lua")
	nNpcIndex = CreateNpc("��ng t�2","M�n ��ng",6011,1579,3218)
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\�һ�Сջ\\ͯŮ2.lua")
	nNpcIndex = CreateNpc("Thi�u L�m T�ng Nh�n","T�nh T�",6012,1579,3218)
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\����������\\����.lua")
	nNpcIndex = CreateNpc("Giang h� tu�n ki�t","Gi�o �� th�n b�",504,1343,2840)
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\���ؽ�ͽ.lua")
	nNpcIndex = CreateNpc("Xa phu","Th�n gi�o gi�o �� m�i",6015,1632,3242)
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\�����½�ͽ.lua")
	nNpcIndex = CreateNpc("Xa phu","Th�n gi�o gi�o �� m�i",6017,1632,3242)
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\�����½�ͽ.lua")
	nNpcIndex = CreateNpc("Xa phu","Th�n gi�o gi�o �� m�i",6018,1632,3242)
	SetNpcScript(nNpcIndex,"\\script\\������\\��ľ��\\�����½�ͽ.lua")
	nNpcIndex = CreateNpc("��ng t�1","Mai Trang Th� ��ng",106,1300,3110)
	SetNpcScript(nNpcIndex,"\\script\\������\\÷ׯ\\÷ׯ��ͯ1.lua")
	nNpcIndex = CreateNpc("��ng t�1","Mai Trang Th� ��ng",6016,1490,3094)
	SetNpcScript(nNpcIndex,"\\script\\������\\÷ׯ\\÷ׯ��ͯ2.lua")
	nNpcIndex = CreateNpc("Thi�n V��ng Bang ��","Canh gi�",6016,1586,3140)
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\÷ׯ����\\����1.lua")
	nNpcIndex = CreateNpc("Thi�n V��ng Bang ��","Canh gi�",6013,1606,3206)
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\÷ׯ����\\����2.lua")
	nNpcIndex = CreateNpc("Xa phu","Thuy�n phu",6014,1536,3291)
	SetNpcScript(nNpcIndex,"\\script\\�����ͼ\\����\\����.lua")
end

function new_task_npc_create()
	--gtask�ر�
	if IsNewTaskSystemOpen() ~= 1 then
		return 1;
	end
	dialog_npc_create();
	fight_npc_create();
	trap_npc_create();
end

function Ambassador_Acitivity()
	local tPos = {
		{300,1734,3523},
		{350,1441,2954},
		{100,1427,2958},
		{200,1382,2845},
	}
	local tPosinfo
	for _,tPosinfo in tPos do
		local nNpcIndex = CreateNpc("V� L�m Minh Ch�1","��i S� ho�t ��ng",tPosinfo[1],tPosinfo[2],tPosinfo[3])
		SetNpcScript(nNpcIndex,"\\script\\online\\activity_ambassador.lua")
	end
end

function CreateNpcList(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);
		SetNpcScript(npc, tNpc[6] or "");
		if npc > 0 then
		else
			WriteLogEx(format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or ""))
		end
		
	end
end

function new_ttd_npc_create()
	--��ӯӯ
	local nNpcIndex = CreateNpc("Nh�m Doanh Doanh","Th�nh N� Nh�m Doanh Doanh",150,1664,3165);
	SetNpcScript(nNpcIndex, "\\script\\������\\����\\npc\\renyingying.lua");
	--��ӯӯλ���ƶ�
	nNpcIndex = CreateNpc("Nh�m Doanh Doanh","Th�nh N� Nh�m Doanh Doanh",500, 1742, 3039);
	SetNpcScript(nNpcIndex,"\\script\\missions\\hunduantongtianding\\ttd_mission_entry_npc.lua");
end

function new_task_npc_create2()
	local nNpcIndex = CreateNpc("��i tho�i v�i Giang Bi�t H�c","Giang Bi�t H�c",500,1745,3123);
	SetNpcScript(nNpcIndex,"\\script\\������\\���踮\\npc\\�����.lua");
	nNpcIndex = CreateNpc("L� S� S�","L�u T� Anh",150,1668,3225);
	SetNpcScript(nNpcIndex,"\\script\\������\\����\\npc\\��˼Ӣ.lua");
	nNpcIndex = CreateNpc("Th�n gi�o H�c T�ng Qu�n","Th�n gi�o H�c T�ng Qu�n",500,1699,3059);
	--SetNpcScript(nNpcIndex,"\\script\\������\\���踮\\npc\\������̺��ܹ�.lua");
	SetNpcScript(nNpcIndex,"\\script\\missions\\cangjianshanzhuang\\wjz_mission_entry_npc.lua");
	
	nNpcIndex = CreateNpc("H�m S�n ��i v��ng","H�m S�n ��i v��ng",508,1750,3331);
	SetNpcScript(nNpcIndex,"\\script\\task\\npc\\��ɽ����Death.lua");
end

function shenghuotai_npc_create()
	if oly_IsActivityOpen() == 1 then
		local npcIndex = CreateNpc("aoyunshenghuotai","Th�nh H�a Tuy�n Ch�u",100,1327,3077);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\red_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai","Th�nh H�a ��i L�",400,1444,2876);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\black_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai","Th�nh H�a Th�nh ��",300,1853,3553);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\green_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai","Th�nh H�a Ph��ng T��ng",500,1768,3136);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\yellow_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai","Th�nh H�a T��ng D��ng ",350,1431,2810);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\blue_sh.lua");
		local npcIndex = CreateNpc("aoyunshenghuotai","Th�nh H�a Bi�n Kinh",200,1470,2778);
		SetNpcScript(npcIndex,"\\script\\online\\olympic\\npc\\wuhuan_sh.lua");
	end
end

function Activity_Npc_Add_201209()
	--NPC create time��test modify
	if gf_CheckEventDateEx(71) == 1 then
		local npcIndex = CreateNpc("change","H�ng Nga",400,1480,3024);
		SetNpcScript(npcIndex,"\\script\\online_activites\\201208\\change.lua");
	end
end

function Qht_Activity_Event()
	--NPC����
	qht_create_npc_ds();
	--����
	qht_gs_daily_clean();
	--����mission
	qht_create_mission();
end

function Bkl_baoruong()
	local tbBKL_BaoRuong_Pos = {
					{508,1622,3247},	--Quang Minh ��nh
					{508,1622,3238},
					{508,1632,3257},
					{508,1641,3259},
					{508,1632,3230},
					{508,1640,3229},
					{508,1649,3237},
					{508,1650,3247},
					{507,1614,3224},	--Long M�n Tr�n
					{507,1609,3230},
					{507,1614,3236},
					{507,1618,3230},
					{403,1478,2939},	--T�y Song B�n N�p Nam
					{403,1473,2947},
					{403,1478,2957},
					{403,1482,2947},
					{402,1493,2987},	--T�y Song B�n N�p B�c
					{402,1475,3024},
					{402,1464,3012},
					{513,1472,2989},	--Ho�ng L�ng 1
					{513,1477,2983},
					{513,1482,2990},
					{514,1478,2984},	--Ho�ng L�ng 2
					{514,1485,2975},
					{514,1492,2967},
					{514,1471,2990},
					{410,1647,3278},	--Thi�n T�m Th�p 2
					{410,1631,3295},
					{410,1647,3310},
					{410,1662,3295},
					{411,1619,3269},	--Thi�n T�m Th�p 3
					{411,1611,3276},
					{411,1611,3261},
					{411,1603,3284},					
					{411,1603,3252},					
					{411,1603,3269},	
					{506,1375,2748},	--M� Cung Sa M�c
					{506,1367,2732},
					{506,1382,2763},
					{506,1357,2721},
					{510,1506,3025},	--D��c V��ng ��ng
					{510,1506,3037},
					{510,1498,3025},
					{510,1514,3025},
		}
	for i = 1, getn(tbBKL_BaoRuong_Pos) do
		local npcIndex = CreateNpc("R��ng ti�n","V� L�m B�ch Kim R��ng",tbBKL_BaoRuong_Pos[i][1],tbBKL_BaoRuong_Pos[i][2],tbBKL_BaoRuong_Pos[i][3]);
	--	local npcIndex = CreateNpc("R��ng ti�n","B�o r��ng B�ch Kim L�nh",507,1614,3224)
		SetNpcScript(npcIndex,"\\script\\vng\\bkl_box\\bkl_box_npc.lua");
	end
end

function tuyetanh_baoruong()	--QuyTy_baoruong
	local tbQT_BaoRuong_Pos = {
					{100, 1289, 3105},	--Tuy�t �nh
					{100, 1294, 3109}, 
					{100, 1302, 3115},
					{100, 1304, 3101},
					{500, 1810, 3014},
					{500, 1810, 2996},
					{500, 1803, 3007},
					{500, 1816, 3003},
					{400, 1400, 2934},
			}
	for i = 1, getn(tbQT_BaoRuong_Pos) do
		local npcIndex = CreateNpc("R��ng ti�n","Tuy�t �nh B� B�o",tbQT_BaoRuong_Pos[i][1],tbQT_BaoRuong_Pos[i][2],tbQT_BaoRuong_Pos[i][3]);
		SetNpcScript(npcIndex,"\\script\\vng\\quyty_box\\quyty2013_box_npc.lua");
	end
end
function chieuda_baoruong()	
	local tbQT_BaoRuong_Pos = {
					{300, 1824, 3670},	--Chi�u D�
					{300, 1836, 3666},
					{300, 1829, 3660},
					{300, 1829, 3675},
					{350, 1603, 2935},
					{350, 1603, 2945},
					{350, 1613, 2948},
					{350, 1612, 2935},		
					{400, 1406, 2925},		
			}
	for i = 1, getn(tbQT_BaoRuong_Pos) do
		local npcIndex = CreateNpc("R��ng ti�n","Chi�u D� Ph�p B�o",tbQT_BaoRuong_Pos[i][1],tbQT_BaoRuong_Pos[i][2],tbQT_BaoRuong_Pos[i][3]);
		SetNpcScript(npcIndex,"\\script\\vng\\quyty_box\\quyty2013_box_npc.lua");
	end
end
function xichtho_baoruong()	
	local tbQT_BaoRuong_Pos = {
					{200, 1439, 2716},	-- X�ch Th�
					{200, 1445, 2722},
					{200, 1438, 2728},
					{200, 1430, 2722},	
					{150, 1772, 3118}, 		
					{150, 1772, 3129}, 		
					{150, 1784, 3129}, 		
					{150, 1783, 3116}, 		
					{400, 1412, 2915},		
			}
	for i = 1, getn(tbQT_BaoRuong_Pos) do
		local npcIndex = CreateNpc("R��ng ti�n","X�ch Th� C� V�t",tbQT_BaoRuong_Pos[i][1],tbQT_BaoRuong_Pos[i][2],tbQT_BaoRuong_Pos[i][3]);
		SetNpcScript(npcIndex,"\\script\\vng\\quyty_box\\quyty2013_box_npc.lua");
	end
end
function npcVanMay()
    local npcIndexVanMay = CreateNpc("Du Ph��ng T��ng S�", "Th�y B�i Si�u H�ng",100,1274,2962);
    SetNpcScript(npcIndexVanMay, "\\script\\vng\\vanmay_daohuu\\vanmay_npc.lua");
end

function wujiang_task_npc_create()
	local npcIndex;
	local tbNpcPos = {
		{218, 1767, 3567},
		{218, 1778, 3562},
		{218, 1781, 3581},
		{218, 1731, 3550},
		{218, 1744, 3531},
		{218, 1749, 3502},
		{218, 1766, 3517},
		{218, 1775, 3486},
		{218, 1760, 3637},
		{218, 1769, 3564},
		{218, 1788, 3573},
		{218, 1805, 3535},
		{218, 1696, 3573},
		{218, 1663, 3589},
		{218, 1645, 3613},
		{218, 1695, 3556},
		{218, 1756, 3540},
		{218, 1711, 3530},
		{218, 1683, 3536},
		{218, 1810, 3523},
	};
	for i = 1, getn(tbNpcPos) do
			CreateNpc("shenmigongjianshou", "Th�n b� cung ti�n th�", tbNpcPos[i][1], tbNpcPos[i][2], tbNpcPos[i][3]);
	end
	CreateNpc("chunyizhang", "Thu�n Nh�t Ch��ng", 107, 1453, 3006, 6);
	CreateNpc("chengfeng", "Tr�nh Phong", 304, 1463, 2844);
	npcIndex = CreateNpc("Nh�c B�t Qu�n", "(Nh�c B�t Qu�n)", 6024, 1658, 3094);
	SetNpcScript(npcIndex, "\\script\\�����ͼ\\����ɽׯ\\npc\\yuebuqun.lua");
	npcIndex = CreateNpc("jiguan1", "C� quan", 6024, 1610, 2984);
	SetNpcScript(npcIndex, "\\script\\task\\npc\\jiguan1.lua");
	npcIndex = CreateNpc("jiguan2", "C� quan", 6024, 1503, 3099);
	SetNpcScript(npcIndex, "\\script\\task\\npc\\jiguan2.lua");
	npcIndex = CreateNpc("juchihu", "C� X� H�", 6024, 1603, 2982);
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\juchihu.lua");
	npcIndex = CreateNpc("shouwei", "Th� V� th� 1", 6024, 1528, 3140);
	SetNpcScript(npcIndex, "\\script\\task\\npc\\shouwei.lua");
	npcIndex = CreateNpc("shouwei", "Th� v� th� 2", 6024, 1451, 3065);
	SetNpcScript(npcIndex, "\\script\\task\\npc\\shouwei.lua");
	npcIndex = CreateNpc("shouwei", "Th� v� th� 3", 6024, 1370, 2986);
	SetNpcScript(npcIndex, "\\script\\task\\npc\\shouwei.lua");
	npcIndex = CreateNpc("shouwei", "Th� v� th� 4", 6024, 1441, 2912);
	SetNpcScript(npcIndex, "\\script\\task\\npc\\shouwei.lua");
	npcIndex = CreateNpc("shouwei", "Th� v� th� 5", 6024, 1516, 2837);
	SetNpcScript(npcIndex, "\\script\\task\\npc\\shouwei.lua");
	npcIndex = CreateNpc("shouwei", "Th� v� th� 6", 6024, 1593, 2909);
	SetNpcScript(npcIndex, "\\script\\task\\npc\\shouwei.lua");
	npcIndex = CreateNpc("shouwei", "Th� v� th� 7", 6024, 1681, 2989);
	SetNpcScript(npcIndex, "\\script\\task\\npc\\shouwei.lua");
	npcIndex = CreateNpc("shouwei", "Th� v� th� 8", 6024, 1600, 3070);
	SetNpcScript(npcIndex, "\\script\\task\\npc\\shouwei.lua");
	npcIndex = CreateNpc("linqinghai", "L�m Thanh H�i", 502, 1579, 3218);
	SetNpcScript(npcIndex, "\\script\\������\\��ɽ\\npc\\linqinghai.lua");
	npcIndex = CreateNpc("Nh�c Linh San", "(Nh�c Linh San)", 6025, 1588, 3172);
	SetNpcScript(npcIndex, "\\script\\�����ͼ\\���\\npc\\yuelingshan.lua");
	tbNpcPos = {
		{6025, 1599, 3156},
		{6025, 1591, 3161},
		{6025, 1606, 3163},
		{6025, 1602, 3172},
		{6025, 1609, 3175},
		{6025, 1563, 3190},
		{6025, 1573, 3197},
		{6025, 1572, 3181},
		{6025, 1585, 3195},
		{6025, 1587, 3211},
		{6025, 1594, 3226},
		{6025, 1586, 3219},
		{6025, 1611, 3209},
		{6025, 1599, 3204},
		{6025, 1630, 3186},
		{6025, 1623, 3206},
		{6025, 1613, 3192},
		{6025, 1622, 3177},
		{6025, 1606, 3198},
		{6025, 1600, 3206},
		}
	for i = 1, getn(tbNpcPos) do
			CreateNpc("tiezhangyinshi", "Thi�t Ch��ng �n S�", tbNpcPos[i][1], tbNpcPos[i][2], tbNpcPos[i][3]);
	end
end

function meihuayingchun_npc_create()
	if gf_CheckEventDateEx(81) ~= 1 then
		return 0;
	end
	local npcIdnex;
	npcIndex = CreateNpc("C�y T� Linh 3_2", "Mai V�ng", 300, 1768, 3536);
	SetNpcScript(npcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
	npcIndex = CreateNpc("C�y T� Linh 3_2", "Mai V�ng", 200, 1407, 2832);
	SetNpcScript(npcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
	npcIndex = CreateNpc("C�y T� Linh 3_2", "Mai V�ng", 100, 1401, 2992);
	SetNpcScript(npcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
	npcIndex = CreateNpc("C�y T� Linh 3_2", "Mai V�ng", 150, 1703, 3136);
	SetNpcScript(npcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
	npcIndex = CreateNpc("C�y T� Linh 3_2", "Mai V�ng", 350, 1464, 2960);
	SetNpcScript(npcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
	npcIndex = CreateNpc("C�y T� Linh 3_2", "Mai V�ng", 400, 1512, 2977);
	SetNpcScript(npcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
	npcIndex = CreateNpc("C�y T� Linh 3_2", "Mai V�ng", 500, 1768, 3136);
	SetNpcScript(npcIndex, "\\script\\online_activites\\201212\\meihuashu.lua");
end

function zhenqi_battle_init()
	ZQ_NpcCreate();
	ZQ_CreateChannel();
end

--function kuafu_battle_init()
--	KF_Battle_BMR();
--end
function VBonus_NPC()
	local nVBONUS_STARTDATE = 13062000
	local nVBONUS_ENDDATE = 13080900
	local nDate = tonumber(date("%y%m%d%H"))
	if nDate >= nVBONUS_STARTDATE and nDate <= nVBONUS_ENDDATE then
		if GetGlbValue(1023) == 80 then
			npcIndex = CreateNpc("R��ng ti�n","B�o R��ng Ph�ng M�y Th�n Thi�n",200,1433,2866)
			SetNpcScript(npcIndex, "\\script\\vng\\vbonus\\top_chuyensinh.lua");
		end
	end
end


function Vip_NPC()
	if CFG_VipCare == 1 then
		local npcIndex = CreateNpc("Nh� Ho�ng T�_��i L�", "��i S� Vip", 300,1776,3552);
		SetNpcScript(npcIndex, "\\script\\vng\\vipcare\\daisuvip.lua");	
	end
end

function dixuangong_join_npc()
	local npcIndex = CreateNpc("KLyunxihe", "C�n L�n Ph�i V�n Hi H�a", 500, 1778, 3097);
	SetNpcScript(npcIndex, "\\script\\missions\\dixuangong\\npc\\entrynpc.lua");
end

function biwu_3v3_init()
	if Is3v3SystemOpen() ~= 1 then
		return 0;
	end
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		ClearMapNpc(8000)
		P3v3_Enable(1);
		local npcIndex = CreateNpc("KLyunxihe", "��c s� ��i H�i T� V�", 8000,1404,2858);
		SetNpcScript(npcIndex, "\\script\\missions\\nvn\\3v3npc.lua");
	end
end

--��������
function wuwang_task_createnpc()
	local npcIndex;
	npcIndex = CreateNpc("Chu B�t Ho�c", "Chu B�t Ho�c", 6073, 1589, 3213);
	SetNpcScript(npcIndex, "\\script\\�����ͼ\\������\\zhoubuhuo.lua");
	npcIndex = CreateNpc("S�i Ho�ng Nhi", "S�i Ho�ng Nhi", 6073, 1592, 3213)
	SetNpcScript(npcIndex, "\\script\\�����ͼ\\������\\caifenger.lua");
end

----����ʹ
--function tong_melee_npc_create()
--	local nVersion,nCurGs = GetRealmType();
--	if SubWorldID2Idx(6028) ~= -1 and nCurGs == 1 then
--		local nNpcIndex = CreateNpc("�ν���", "����ʹ", 6028, 1624, 3221);
--		SetNpcScript(nNpcIndex, "\\script\\�����ͼ\\������䳡\\npc\\tong_ambassagor.lua");
--	end
--end

----�ڳɶ�������������콱��npc
--function kuafu_lingjiang_npc_create()
--	local nVersion,nCurGs = GetRealmType();
--	if SubWorldID2Idx(300) ~= -1 and nCurGs == 0 then
--			local nNpcIndex = CreateNpc("ZM_jieyingren", "����콱��", 300, 1855, 3556);
--			SetNpcScript(nNpcIndex, "\\script\\��ԭ����\\�ɶ�\\npc\\kuafu_lingjiang_npc.lua");
--	end
--end

function AddTYNpc()
	--�ȷ����ڱ���200 1378 3063�� ��100 1430 2791����300,1807,3349����350��1407��2853��
	--�ȷ��¹�Ӣ��200 1372 3068����100 1436 2784����300,1803,3353����350��1413��2856��
	local tNpcs = {
		{"TYT_XianfengYZB", "Ti�n Phong D��ng T�n B�o", {350, 1407, 2853}, "\\script\\missions\\taiyi\\yangzongbao_npc.lua"},
		{"TYT_XianfengYZB", "Ti�n Phong D��ng T�n B�o", {300, 1807, 3349}, "\\script\\missions\\taiyi\\yangzongbao_npc.lua"},
		{"TYT_XianfengYZB", "Ti�n Phong D��ng T�n B�o", {200, 1378, 3063}, "\\script\\missions\\taiyi\\yangzongbao_npc.lua"},
		{"TYT_XianfengYZB", "Ti�n Phong D��ng T�n B�o", {100, 1430, 2791}, "\\script\\missions\\taiyi\\yangzongbao_npc.lua"},
		{"TYT_XianfengMGY", "Ti�n Phong M�c Qu� Anh", {350, 1413, 2856}, "\\script\\missions\\taiyi\\muguiying_npc.lua"},
		{"TYT_XianfengMGY", "Ti�n Phong M�c Qu� Anh", {300, 1803, 3353}, "\\script\\missions\\taiyi\\muguiying_npc.lua"},
		{"TYT_XianfengMGY", "Ti�n Phong M�c Qu� Anh", {200, 1372, 3068}, "\\script\\missions\\taiyi\\muguiying_npc.lua"},
		{"TYT_XianfengMGY", "Ti�n Phong M�c Qu� Anh", {100, 1436, 2784}, "\\script\\missions\\taiyi\\muguiying_npc.lua"},
	};
	for i = 1, getn(tNpcs) do
		if SubWorldID2Idx(tNpcs[i][3][1]) ~= -1 then
			local nIndex = CreateNpc(tNpcs[i][1], tNpcs[i][2], tNpcs[i][3][1], tNpcs[i][3][2], tNpcs[i][3][3]);
			SetNpcScript(nIndex, tNpcs[i][4]);
		end
	end
end

function AddLifeSkillNpc()
	local npcIdx = CreateNpc("B� ch�", "�� T� N��ng", 350, 1441, 2914);
	SetNpcScript(npcIdx, "\\script\\��ԭ����\\�ɶ�\\npc\\������.lua");
end

function Plus123Pay()
	local npcIndexZzd = CreateNpc("V� L�m Minh Ch�1", "Ng��i V�n Chuy�n", 100, 1408, 3008);
    SetNpcScript(npcIndexZzd, "\\script\\vng\\plus123pay.lua");
end

function AddHeiYiZhuangShi()
	local tPos = {
		{219, 1671, 3217},
		{219, 1666, 3222},
		{219, 1663, 3229},
		{219, 1656, 3235},
		{219, 1663, 3246},
		{219, 1671, 3258},
		{219, 1682, 3249},
		{219, 1690, 3239},
		{219, 1683, 3226},
		{219, 1675, 3219},
	}
	for i =1, getn(tPos) do
		CreateNpc("heiyizhuangshi", "H�c Y Tr�ng S�", tPos[i][1], tPos[i][2], tPos[i][3]);
	end
	tPos = {
		{413,1863,3269},
		{8010,1601,3222},
	}
	for i =1, getn(tPos) do
		local npcIndex =CreateNpc("Thi�n V��ng Bang ��", "Xi H�a Gi�o Kh�n Th�", tPos[i][1], tPos[i][2], tPos[i][3])
		SetNpcScript(npcIndex, "\\script\\������\\���۶�����\\npc\\��̿���.lua");
	end
	CreateNpc("Th��ng �ng", "Th��ng �ng", 8010, 1599, 3188, 6);
end