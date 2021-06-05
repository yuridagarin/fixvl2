--�Զ�����NPC�ű�������������ʱ����
Include("\\script\\online\\���ڻ\\newyear_head.lua")	
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\online\\qingming\\qingming_head.lua");
function main()
	addnpc_yanmenbattle_signup();
	
	AddNpcCd();     --�ɶ�����ADD��NPC
	AddNpcXy();    --��������ADD��NPC
	AddNpcYz();     --��������ADD��NPC
	AddNpcWeekEnd();     --��ĩ�ADD��NPC
	AddNpcXl();     --�չ�����ADD��NPC
	Addxinan();     --���ϵ�ͼNPC
	-------------------
	AddNpcQz();     --Ȫ���¼�NPC
	AddXsTg();      --�����ƹ�Ա
	AddTl();        --���ε�ͼ��ӵ�NPC
	Addsh();        --�̻���ӵ�NPC
	Addtj();        --ͨ��������ӵ�NPC
	Addtaohuadao();        --�����һ�����ӵ�NPC
	Addcangjian();        --�ؽ�ʹ��
	Addyangmen();        --�첨���ӵ�NPC
	AddChristmas()		--ʥ���ڻNPC���������Ժ���������ã�
	AddCheFu();		 --�ɼ���ͼ����
	AddDragonBoatDay()	--�����
	
	AddTxNpc()			--̫��þ�NPC���
	ZoneInit(1010)		--̫��þ���ʼ����ͼTrap
	ZoneInit(2010)
	ZoneInit(3010)
	ZoneInit(4010)
	ZoneInit(5010)

	Addfengdutrap()    --�ᶼto���Ż���trap
	Addmenpaibuchong() --����trap�Ĳ���,����һЩ״̬�޷��ı�����
	AddXinshou()  ---����ָ���Ĳ�ѯnpc
	AddDoubleNinth()	--�����ڻ
	CreateGatherNpc()		-- ����ɼ��й���
	AddNewBattle();		--��ս��NPC
	ApplyBattleRank()	--����ս������
end;

function ApplyBattleRank()
	GetBattleRank()
end

tbGAME_SIGNMAP = {806, 808} --��¼���ȼ�������ĵ�ͼID�� ���ȼ����ͼ���߼��Ų�
function addnpc_yanmenbattle_signup()
	for i = 1, getn(tbGAME_SIGNMAP) do
		CreatBattleSignNpc(tbGAME_SIGNMAP[i])
	end
end

function CreatBattleSignNpc( mapid )
	if( SubWorldID2Idx( mapid ) >= 0 ) then	--����
		local npcindex1 = CreateNpc("V� binh th�nh m�n", "M� Binh Quan phe T�ng", mapid, 1728, 3083)
		SetNpcScript(npcindex1, "\\script\\battles\\battlejoin1.lua")
		
		local npcindex2 = CreateNpc("Nam nh�n ph��ng B�c3", "M� Binh Quan phe Li�u", mapid, 1652,3174)
		SetNpcScript(npcindex2, "\\script\\battles\\battlejoin2.lua")
		
		local npcindex3 = CreateNpc("Quan s�-trung ni�n1", "T�ng Nhu quan", mapid, 1728,3065)
		SetNpcScript(npcindex3, "\\script\\global\\�����õ�\\���ɱ�����\\npc\\song_shop.lua")
		
		local npcindex4 = CreateNpc("Nam nh�n ph��ng B�c2", "Li�u Nhu quan", mapid, 1634,3175)
		SetNpcScript(npcindex4, "\\script\\global\\�����õ�\\���ɱ�����\\npc\\jin_shop.lua")
		------------------
		local npcindex5 = CreateNpc("R��ng �� Trung Nguy�n", "Th� Kh�-T�ng", mapid, 1738,3054)
		SetNpcScript(npcindex5, "\\script\\battles\\openbox.lua")
		
		local npcindex6 = CreateNpc("R��ng �� Tr.Nguy�n", "Th� Kh�- Li�u", mapid, 1626,3181)
		SetNpcScript(npcindex6, "\\script\\battles\\openbox.lua")
		
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
    --SetNpcScript(npcIndexLs, "\\script\\������\\��Ϫ��\\npc\\��ʤ��ʬ��.lua");
    local npcIndexLshw2 = CreateNpc("X�c h� v� L�i Th�ng", "Thi th� h� v� c�a L�i Th�ng", 111, 1847, 2889);
    --SetNpcScript(npcIndexLs, "\\script\\������\\��Ϫ��\\npc\\��ʤ��ʬ��.lua");
    local npcIndexLshw3 = CreateNpc("X�c h� v� L�i Th�ng", "Thi th� h� v� c�a L�i Th�ng", 111, 1851, 2877);
    --SetNpcScript(npcIndexLs, "\\script\\������\\��Ϫ��\\npc\\��ʤ��ʬ��.lua");
    
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
    local npcIndexZzd = CreateNpc("Ch�n T� ��n", "Ch�n T� ��n", 200, 1380, 2872);
    SetNpcScript(npcIndexZzd, "\\script\\task\\WeekEnd\\���ӵ�.lua");
    
    local npcXyZzd = CreateNpc("Ch�n T� ��n", "Ch�n T� ��n", 350, 1452, 2967);
    SetNpcScript(npcXyZzd, "\\script\\task\\WeekEnd\\���ӵ�.lua");
    
    local npcXyBm1 = CreateNpc("V� binh th�nh m�n", "Ch� huy s�", 350, 1503, 3024);
    SetNpcScript(npcXyBm1, "\\script\\task\\WeekEnd\\����ָ��ʹ.lua");
    
    local npcYzZzd = CreateNpc("Ch�n T� ��n", "Ch�n T� ��n", 150, 1714, 3137);
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
    local npcIndex701 = CreateNpc("Nha d�ch", "Lao ��u", 701, 1376, 3143);
    SetNpcScript(npcIndex701, "\\script\\task\\prison\\��ͷ.lua");
    
    local npcIndex702 = CreateNpc("Nha d�ch", "Lao ��u", 702, 1614, 3202);
    SetNpcScript(npcIndex702, "\\script\\task\\prison\\��ͷ.lua");
    
    local npcIndex703 = CreateNpc("Nha d�ch", "Lao ��u", 703, 1337, 3161);
    SetNpcScript(npcIndex703, "\\script\\task\\prison\\��ͷ.lua");
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
		SetNpcScript(npcIndexchurchman1,"\\script\\online\\zgc_npc_dialog.lua");
	local npcIndexchurchman2 = CreateNpc("Truy�n gi�o s�","Gi�o s�",300,1707,3546);
		SetNpcScript(npcIndexchurchman2,"\\script\\online\\zgc_npc_dialog.lua");		
	local npcIndexRosa = CreateNpc("Phu nh�n T�y D��ng","La Sa",100,1526,2948);
		SetNpcScript(npcIndexRosa,"\\script\\online\\ʥ���ڻ\\��ɯ.lua");
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
    
    local npcIndexxinan37 = CreateNpc("L� S� S�", "S�i Ho�ng Nhi", 404,1570,2725);
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
	
	nIndex = CreateNpc("Xa phu Trung Nguy�n", "Ng��i �y th�c ��n g�", 710, 1711, 3395)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Xa phu Trung Nguy�n", "Ng��i �y th�c ��n g�", 715, 1500, 2992)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Xa phu Trung Nguy�n", "Ng��i �y th�c ��n g�", 720, 1727, 3346)
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
--******************************�����ڻ*******************************
function AddDoubleNinth()
	local nNpcIndex = 0;
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1","V� L�m truy�n nh�n",100,1456,2789);	--Ȫ�ݣ�183��174
	SetNpcScript(nNpcIndex, "\\script\\������\\Ȫ��\\npc\\�����˴���.lua");
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1","V� L�m truy�n nh�n",300,1629,3529);	--�ɶ���205��220
	SetNpcScript(nNpcIndex, "\\script\\��ԭ����\\�ɶ�\\npc\\�����˴���.lua");
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1","V� L�m truy�n nh�n",200,1189,2835);	--�꾩��146��176
	SetNpcScript(nNpcIndex, "\\script\\��ԭһ��\\�꾩\\npc\\�����˴���.lua");
	nNpcIndex = CreateNpc("V� L�m Minh Ch�1","V� L�m truy�n nh�n",969,1643,3225);	
	SetNpcScript(nNpcIndex, "\\script\\��ԭһ��\\�꾩\\npc\\��ɽ�����˴���.lua");
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
	}
	for i=1,getn(tChannel) do
		CreateChannel(tChannel[i][1],tChannel[i][2]);
	end;
	SetGlbValue(31,0)	--������ս��
end;