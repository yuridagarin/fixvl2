--自动加载NPC脚本，服务器启动时调用
Include("\\script\\online\\春节活动\\newyear_head.lua")	
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\online\\qingming\\qingming_head.lua");
function main()
	addnpc_yanmenbattle_signup();
	
	AddNpcCd();     --成都任务ADD的NPC
	AddNpcXy();    --襄阳任务ADD的NPC
	AddNpcYz();     --扬州任务ADD的NPC
	AddNpcWeekEnd();     --周末活动ADD的NPC
	AddNpcXl();     --闭关修炼ADD的NPC
	Addxinan();     --西南地图NPC
	-------------------
	AddNpcQz();     --泉州新加NPC
	AddXsTg();      --新手推广员
	AddTl();        --天牢地图添加的NPC
	Addsh();        --商会添加的NPC
	Addtj();        --通缉任务添加的NPC
	Addtaohuadao();        --进出桃花岛添加的NPC
	Addcangjian();        --藏剑使者
	Addyangmen();        --天波杨府添加的NPC
	AddChristmas()		--圣诞节活动NPC（保留给以后外国节日用）
	AddCheFu();		 --采集地图车夫
	AddDragonBoatDay()	--端午节
	
	AddTxNpc()			--太虚幻境NPC添加
	ZoneInit(1010)		--太虚幻境初始化地图Trap
	ZoneInit(2010)
	ZoneInit(3010)
	ZoneInit(4010)
	ZoneInit(5010)

	Addfengdutrap()    --丰都to鬼门回廊trap
	Addmenpaibuchong() --门派trap的补充,避免一些状态无法改变的情况
	AddXinshou()  ---新手指引的查询npc
	AddDoubleNinth()	--重阳节活动
	CreateGatherNpc()		-- 替身采集托管人
	AddNewBattle();		--新战场NPC
	ApplyBattleRank()	--更新战场排名
end;

function ApplyBattleRank()
	GetBattleRank()
end

tbGAME_SIGNMAP = {806, 808} --记录各等级报名点的地图ID号 ，等级按低级向高级排布
function addnpc_yanmenbattle_signup()
	for i = 1, getn(tbGAME_SIGNMAP) do
		CreatBattleSignNpc(tbGAME_SIGNMAP[i])
	end
end

function CreatBattleSignNpc( mapid )
	if( SubWorldID2Idx( mapid ) >= 0 ) then	--初级
		local npcindex1 = CreateNpc("V? binh th祅h m玭", "M? Binh Quan phe T鑞g", mapid, 1728, 3083)
		SetNpcScript(npcindex1, "\\script\\battles\\battlejoin1.lua")
		
		local npcindex2 = CreateNpc("Nam nh﹏ phng B綾3", "M? Binh Quan phe Li猽", mapid, 1652,3174)
		SetNpcScript(npcindex2, "\\script\\battles\\battlejoin2.lua")
		
		local npcindex3 = CreateNpc("Quan s?-trung ni猲1", "T鑞g Nhu quan", mapid, 1728,3065)
		SetNpcScript(npcindex3, "\\script\\global\\特殊用地\\宋辽报名点\\npc\\song_shop.lua")
		
		local npcindex4 = CreateNpc("Nam nh﹏ phng B綾2", "Li猽 Nhu quan", mapid, 1634,3175)
		SetNpcScript(npcindex4, "\\script\\global\\特殊用地\\宋辽报名点\\npc\\jin_shop.lua")
		------------------
		local npcindex5 = CreateNpc("Rng  Trung Nguy猲", "Th? Kh?-T鑞g", mapid, 1738,3054)
		SetNpcScript(npcindex5, "\\script\\battles\\openbox.lua")
		
		local npcindex6 = CreateNpc("Rng  Tr.Nguy猲", "Th? Kh?- Li猽", mapid, 1626,3181)
		SetNpcScript(npcindex6, "\\script\\battles\\openbox.lua")
		
		local npcindex7 = CreateNpc("Xa phu Trung Nguy猲", "Xa phu phe T鑞g", mapid, 1754,3040)
		SetNpcScript(npcindex7, "\\script\\global\\特殊用地\\宋辽报名点\\npc\\song_transport.lua")
		
		local npcindex8 = CreateNpc("Xa phu", "Xa phu phe Li猽", mapid, 1639,3200)
		SetNpcScript(npcindex8, "\\script\\global\\特殊用地\\宋辽报名点\\npc\\jin_transport.lua")
		
	end
end

function AddNpcCd()
    local npcIndexGbdz = CreateNpc("C竔 Bang m玭 nh﹏", "е t? C竔 Bang", 209,1701,3111);
    SetNpcScript(npcIndexGbdz, "\\script\\中原一区\\丐帮\\npc\\丐帮弟子.lua");
end;

function AddNpcXy()
    local npcIndexDyx_1 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1382, 3186);
    local npcIndexDyx_2 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1299, 3193);
    local npcIndexDyx_3 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1358, 3016);
    local npcIndexDyx_4 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1426, 2916);
    
    local npcIndexDyx_5 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1143, 2931);
    local npcIndexDyx_6 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1219, 2910);
    local npcIndexDyx_7 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1271, 2974);
    local npcIndexDyx_8 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1222, 2985);
    local npcIndexDyx_9 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1116, 3020);
    local npcIndexDyx_10 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1269, 3092);
    local npcIndexDyx_11 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1236, 3147);
    local npcIndexDyx_12 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1356, 3149);
    local npcIndexDyx_13 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1352, 3087);
    local npcIndexDyx_14 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1307, 3079);
    local npcIndexDyx_15 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1404, 2968);
    local npcIndexDyx_16 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1326, 2949);
    local npcIndexDyx_17 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1386, 2926);
    local npcIndexDyx_18 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1428, 2966);
    local npcIndexDyx_19 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1501, 2915);
    local npcIndexDyx_20 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1525, 2935);
    local npcIndexDyx_21 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1573, 2979);
    local npcIndexDyx_22 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1552, 3028);
    local npcIndexDyx_23 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1539, 3110);
    local npcIndexDyx_24 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1571, 3166);
    local npcIndexDyx_25 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1540, 3198);
    local npcIndexDyx_26 = CreateNpc("Rng c? th? m?", "Rng c dc", 309, 1501, 3174);
	local npcIndexJwyh = CreateNpc("Ng﹏ H?", "Ng﹏ H?", 324, 1822, 3005);
	SetNpcScript(npcIndexJwyh, "\\script\\中原二区\\七星洞一层\\npc\\九尾银狐.lua");
	
	local npcIndexYlby = CreateNpc("u l躰h S琻 t芻", "u l躰h S琻 t芻", 322, 1491, 3323);
    SetNpcScript(npcIndexYlby, "\\script\\中原二区\\龙虎洞一层\\npc\\伏牛山大王.lua");
	local npcIndexZh1 = CreateNpc("Ph竝 S? T﹜ H?", "Ph竝 S? T﹜ H?", 311, 1352, 3117);
    SetNpcScript(npcIndexZh1, "\\script\\中原二区\\伏牛山\\npc\\西夏咒师.lua");
    
	local npcIndexZh2 = CreateNpc("Ph竝 S? T﹜ H?", "Ph竝 S? T﹜ H?", 311, 1439, 3144);
    SetNpcScript(npcIndexZh2, "\\script\\中原二区\\伏牛山\\npc\\西夏咒师.lua");
    
	local npcIndexZh3 = CreateNpc("Ph竝 S? T﹜ H?", "Ph竝 S? T﹜ H?", 311, 1442, 3033);
    SetNpcScript(npcIndexZh3, "\\script\\中原二区\\伏牛山\\npc\\西夏咒师.lua");
end;

function AddNpcYz()
    local npcIndexLs = CreateNpc("x竎 L玦 Th緉g", "Thi th? c馻 L玦 Th緉g", 111, 1849, 2887);
    SetNpcScript(npcIndexLs, "\\script\\江南区\\清溪洞\\npc\\雷胜的尸体.lua");
    
    local npcIndexLshw1 = CreateNpc("X竎 h? v? L玦 Th緉g", "Thi th? h? v? c馻 L玦 Th緉g", 111, 1854, 2887);
    --SetNpcScript(npcIndexLs, "\\script\\江南区\\清溪洞\\npc\\雷胜的尸体.lua");
    local npcIndexLshw2 = CreateNpc("X竎 h? v? L玦 Th緉g", "Thi th? h? v? c馻 L玦 Th緉g", 111, 1847, 2889);
    --SetNpcScript(npcIndexLs, "\\script\\江南区\\清溪洞\\npc\\雷胜的尸体.lua");
    local npcIndexLshw3 = CreateNpc("X竎 h? v? L玦 Th緉g", "Thi th? h? v? c馻 L玦 Th緉g", 111, 1851, 2877);
    --SetNpcScript(npcIndexLs, "\\script\\江南区\\清溪洞\\npc\\雷胜的尸体.lua");
    
    local npcIndexZbh = CreateNpc("Du Phng i phu", "Trng B? H竛", 150, 1711, 3115);
    SetNpcScript(npcIndexZbh, "\\script\\江南区\\扬州\\npc\\张伯汉.lua");
    
    local npcIndexBg = CreateNpc("T骾 r竛h", "T骾 t莔 thng", 107, 1573, 2939);
    
    local npcIndexTn = CreateNpc("Hi謕 n?", "Л阯g Ninh", 107,1417,2946);
    SetNpcScript(npcIndexTn, "\\script\\江南区\\武夷山\\npc\\唐宁.lua");

    local npcIndexLjy = CreateNpc("Du Phng Tng S?","L? Ti課 D騨g",150,1767,3111);
    SetNpcScript(npcIndexLjy, "\\script\\江南区\\扬州\\npc\\李进勇.lua");
    
    local npcIndexLxq = CreateNpc("V﹏ Du Чo Nh﹏","L璾 Huy襫 Thanh",150,1579,3110);
    SetNpcScript(npcIndexLxq, "\\script\\江南区\\扬州\\npc\\刘玄清.lua");
    
    local npcIndexQr = CreateNpc("B? ch?", "Thu Dung", 150,1678,3028);
    SetNpcScript(npcIndexQr, "\\script\\江南区\\扬州\\npc\\秋蓉.lua");
    
    local npcIndexHql = CreateNpc("Thng C? H醓 K? L﹏", "Thng C? H醓 K? L﹏", 113, 1669, 3225);
    SetNpcScript(npcIndexHql, "\\script\\江南区\\两水洞二层\\npc\\火麒麟.lua");
    
    local npcIndexThj = CreateNpc("x竎 L玦 Th緉g", "Thi th? Th竔 H錸g Tuy謙", 113, 1668, 3230);
    local npcIndexJt01 = CreateNpc("X竎 h? v? L玦 Th緉g", "Thi th? Xi H醓 gi竜 ", 113, 1669, 3231);
    local npcIndexJt02 = CreateNpc("X竎 h? v? L玦 Th緉g", "Thi th? Xi H醓 gi竜 ", 113, 1664, 3225);
    local npcIndexJt03 = CreateNpc("X竎 h? v? L玦 Th緉g", "Thi th? Xi H醓 gi竜 ", 113, 1670, 3224);
    local npcIndexJt04 = CreateNpc("X竎 h? v? L玦 Th緉g", "Thi th? Xi H醓 gi竜 ", 113, 1661, 3231);
    
    local npcIndexJw = CreateNpc("Thi誹 ni猲 nam1", "Tng Duy", 150, 1679, 3237);
    SetNpcScript(npcIndexJw, "\\script\\江南区\\扬州\\npc\\蒋维.lua");
    
    local npcIndexWyq = CreateNpc("T? Ho祅 Ch﹏", "Vi詎 Tinh", 108, 1585, 3195);
    SetNpcScript(npcIndexWyq, "\\script\\江南区\\泉州府北\\npc\\邬远晴.lua");
    
    local npcIndexYg = CreateNpc("Ng? Qu竔 u M鬰", "Ng? Qu竔 u M鬰", 103, 1673, 3431);
    SetNpcScript(npcIndexYg, "\\script\\江南区\\东海海滨一\\npc\\鱼怪头目.lua");
end;

function AddNpcWeekEnd()
    local npcIndexZzd = CreateNpc("Ch﹏ T? Кn", "Ch﹏ T? Кn", 200, 1380, 2872);
    SetNpcScript(npcIndexZzd, "\\script\\task\\WeekEnd\\甄子丹.lua");
    
    local npcXyZzd = CreateNpc("Ch﹏ T? Кn", "Ch﹏ T? Кn", 350, 1452, 2967);
    SetNpcScript(npcXyZzd, "\\script\\task\\WeekEnd\\甄子丹.lua");
    
    local npcXyBm1 = CreateNpc("V? binh th祅h m玭", "Ch? huy s?", 350, 1503, 3024);
    SetNpcScript(npcXyBm1, "\\script\\task\\WeekEnd\\兵马指挥使.lua");
    
    local npcYzZzd = CreateNpc("Ch﹏ T? Кn", "Ch﹏ T? Кn", 150, 1714, 3137);
    SetNpcScript(npcYzZzd, "\\script\\task\\WeekEnd\\甄子丹.lua");
    
   	local npcYzBm1 = CreateNpc("V? binh th祅h m玭", "Ch? huy s?", 150, 1682, 3161);
    SetNpcScript(npcYzBm1, "\\script\\task\\WeekEnd\\兵马指挥使.lua");
    
    local npcIndexBm = CreateNpc("V? binh th祅h m玭", "Ch? huy s?", 100, 1423, 2985);
    SetNpcScript(npcIndexBm, "\\script\\task\\WeekEnd\\兵马指挥使.lua");
    
    --倭寇地图的初始化NPC
    local npc1 = CreateNpc("V? binh th祅h m玭", "Tng l躰h ti襫 tuy課", 951, 1333, 2844);
    SetNpcScript(npc1, "\\script\\task\\WeekEnd\\man_killwk.lua");
    local npc2 = CreateNpc("V? binh th祅h m玭", "Tng l躰h ti襫 tuy課", 952, 1333, 2844);
    SetNpcScript(npc2, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc3 = CreateNpc("V? binh th祅h m玭", "Tng l躰h ti襫 tuy課", 953, 1333, 2844);
    SetNpcScript(npc3, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc4 = CreateNpc("V? binh th祅h m玭", "Tng l躰h ti襫 tuy課", 954, 1333, 2844);
    SetNpcScript(npc4, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc5 = CreateNpc("V? binh th祅h m玭", "Tng l躰h ti襫 tuy課", 955, 1333, 2844);
    SetNpcScript(npc5, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc6 = CreateNpc("V? binh th祅h m玭", "Tng l躰h ti襫 tuy課", 956, 1333, 2844);
    SetNpcScript(npc6, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc7 = CreateNpc("V? binh th祅h m玭", "Tng l躰h ti襫 tuy課", 957, 1333, 2844);
    SetNpcScript(npc7, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc8 = CreateNpc("V? binh th祅h m玭", "Tng l躰h ti襫 tuy課", 958, 1333, 2844);
    SetNpcScript(npc8, "\\script\\task\\WeekEnd\\man_killwk.lua");
 	local npc9 = CreateNpc("V? binh th祅h m玭", "Tng l躰h ti襫 tuy課", 959, 1333, 2844);
    SetNpcScript(npc9, "\\script\\task\\WeekEnd\\man_killwk.lua");
	local npc10 = CreateNpc("V? binh th祅h m玭", "Tng l躰h ti襫 tuy課", 960, 1333, 2844);
    SetNpcScript(npc10, "\\script\\task\\WeekEnd\\man_killwk.lua");
    
	local liguan1 = CreateNpc("T? Thanh Thng Nh﹏", "L? quan", 100, 1512, 2990);
	SetNpcScript(liguan1, "\\script\\中原一区\\汴京\\npc\\大内总管.lua");
	
	local liguan2 = CreateNpc("T? Thanh Thng Nh﹏", "L? quan", 300, 1787, 3497);
	SetNpcScript(liguan2, "\\script\\中原一区\\汴京\\npc\\大内总管.lua")
    --AddWk(15, 10);
end;

function AddNpcXl()
    local npcIndexSl = CreateNpc("Thi誹 L﹎ T╪g Nh﹏","Qu? 秈 h? t鑞g nh﹏",814,1626,3149);  --修炼地图的少林传送人
    SetNpcScript(npcIndexSl, "\\script\\task\\practice\\出关传送人.lua");
    
    local npcIndexWd = CreateNpc("V? ng  m玭 nh﹏","Qu? 秈 h? t鑞g nh﹏",812,1622,3093);  --修炼地图的武当传送人
    SetNpcScript(npcIndexWd, "\\script\\task\\practice\\出关传送人.lua");
    
    local npcIndexEm = CreateNpc("Nga My m玭 nh﹏","Qu? 秈 h? t鑞g nh﹏",816,1626,3149);  --修炼地图的峨嵋传送人
    SetNpcScript(npcIndexEm, "\\script\\task\\practice\\出关传送人.lua");
    
    local npcIndexGb = CreateNpc("C竔 Bang m玭 nh﹏","Qu? 秈 h? t鑞g nh﹏",815,1373,3118);  --修炼地图的丐帮传送人
    SetNpcScript(npcIndexGb, "\\script\\task\\practice\\出关传送人.lua");
    
    local npcIndexTm = CreateNpc("Л阯g M玭 T﹏ m玭 nh﹏","Qu? 秈 h? t鑞g nh﹏",813,1677,2983);  --修炼地图的唐门传送人
    SetNpcScript(npcIndexTm, "\\script\\task\\practice\\出关传送人.lua");
    
		local npcIndexYm = CreateNpc("V? binh th祅h m玭", "Qu? 秈 h? t鑞g nh﹏", 817,1457,2972);	--修炼地图的杨门传送人
    SetNpcScript(npcIndexYm, "\\script\\task\\practice\\出关传送人.lua");   
    
    local npcIndexWp = CreateNpc("Ng? чc h? ph竝", "Qu? 秈 h? t鑞g nh﹏", 422,1628,3508);	--修炼地图五毒传送人
    SetNpcScript(npcIndexWp, "\\script\\task\\practice\\出关传送人.lua");
    
end;

function AddNpcQz()
    local npcIndexLfs = CreateNpc("Thi誹 ni猲 trong th玭", "L? Phong Thu", 100, 1607, 2970);
    SetNpcScript(npcIndexLfs, "\\script\\中原二区\\成都\\npc\\收耕学习.lua");
    
    local npcIndexLys = CreateNpc("Du Phng i phu", "L﹎ Dc S?", 100, 1558, 2958);
    SetNpcScript(npcIndexLys, "\\script\\中原一区\\汴京\\npc\\采药学习.lua");
end;
function AddXsTg()
    local npcIndexCd = CreateNpc("B竛 s竎h", "S? gi?", 300, 1638, 3575);
    SetNpcScript(npcIndexCd, "\\script\\中原二区\\成都\\npc\\新手推广员.lua");
    
    local npcIndexQz = CreateNpc("B竛 s竎h", "S? gi?", 100, 1451, 2821);
    SetNpcScript(npcIndexQz, "\\script\\江南区\\泉州\\npc\\新手推广员.lua");
    
    local npcIndexBj = CreateNpc("B竛 s竎h", "S? gi?", 200, 1159, 2839);
    SetNpcScript(npcIndexBj, "\\script\\中原一区\\汴京\\npc\\新手推广员.lua");
    
end;
function AddTl()
    local npcIndex701 = CreateNpc("Nha d辌h", "Lao u", 701, 1376, 3143);
    SetNpcScript(npcIndex701, "\\script\\task\\prison\\牢头.lua");
    
    local npcIndex702 = CreateNpc("Nha d辌h", "Lao u", 702, 1614, 3202);
    SetNpcScript(npcIndex702, "\\script\\task\\prison\\牢头.lua");
    
    local npcIndex703 = CreateNpc("Nha d辌h", "Lao u", 703, 1337, 3161);
    SetNpcScript(npcIndex703, "\\script\\task\\prison\\牢头.lua");
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
    local sp = {   --每地图的开始坐标，地图ID，NPC模板名字
        {1294, 2854, 907, "Oa Kh蕌"},
        {1294, 2854, 908, "Oa Kh蕌 Binh s?"},
        {1294, 2854, 909, "Oa Kh蕌 Th駓 Binh"},
        {1294, 2854, 910, "Oa Kh蕌 L鬰 Binh"},
        {1294, 2854, 911, "Oa Kh蕌 V? S?"}
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
    local npcIndexshxjqz = CreateNpc("G竛h h祅g", "H祅h Cc Thng Nh﹏", 100, 1462, 2922);
    SetNpcScript(npcIndexshxjqz, "\\script\\中原一区\\汴京\\npc\\行脚商人.lua");
    
    local npcIndexshxjyz = CreateNpc("G竛h h祅g", "H祅h Cc Thng Nh﹏", 150, 1698, 3203);
    SetNpcScript(npcIndexshxjyz, "\\script\\中原一区\\汴京\\npc\\行脚商人.lua");
    
    local npcIndexshxy = CreateNpc("Ch? c莔  Trung Nguy猲", "Ch? thng h閕", 350, 1456, 2925);
    SetNpcScript(npcIndexshxy, "\\script\\中原一区\\汴京\\npc\\商会老板.lua");
    
    local npcIndexshyz = CreateNpc("Ch? c莔  Trung Nguy猲", "Ch? thng h閕", 150, 1636, 3139);
    SetNpcScript(npcIndexshyz, "\\script\\中原一区\\汴京\\npc\\商会老板.lua"); 

    local npcIndexsmsr = CreateNpc("L穙 ph? h?", "Thng Nh﹏ th莕 b?", 200, 1488, 2826);
    SetNpcScript(npcIndexsmsr, "\\script\\中原一区\\汴京\\npc\\神秘商人.lua");   
end;

function Addtj()
    local npcIndextjqz = CreateNpc("Nha d辌h", "B? u", 100, 1518, 2988);
    SetNpcScript(npcIndextjqz, "\\script\\中原二区\\成都\\npc\\捕头.lua");
    
    local npcIndextjyz = CreateNpc("Nha d辌h", "B? u", 150, 1739, 3158);
    SetNpcScript(npcIndextjyz, "\\script\\中原二区\\成都\\npc\\捕头.lua");
    
    local npcIndextjxy = CreateNpc("Nha d辌h", "B? u", 350, 1507, 2997);
    SetNpcScript(npcIndextjxy, "\\script\\中原二区\\成都\\npc\\捕头.lua");
    
    local npcIndextjztx = CreateNpc("C? gi?", "Tr竎 Thi猲 H祅h", 350, 1427, 3024);
    SetNpcScript(npcIndextjztx, "\\script\\中原二区\\襄阳\\npc\\卓天行.lua");   
end;

function Addtaohuadao()
    local npcIndextaohuadao1 = CreateNpc("Xa phu Trung Nguy猲", "Thuy襫 phu H秈 T﹏", 104,1568,2975);
    SetNpcScript(npcIndextaohuadao1, "\\script\\江南区\\东海海滨二\\npc\\东海海滨2船夫.lua");

    local npcIndextaohuadao2 = CreateNpc("Xa phu Trung Nguy猲", "Thuy襫 Phu Уo Hoa o", 102,1459,3163);
    SetNpcScript(npcIndextaohuadao2, "\\script\\江南区\\桃花岛\\npc\\桃花岛船夫.lua");
end;


function Addcangjian()
    local npcIndexcangjian1 = CreateNpc("Vng An Th筩h", "S? gi? T祅g Ki誱", 300,1776,3703);
    SetNpcScript(npcIndexcangjian1, "\\script\\藏剑山庄\\task_script\\成都\\藏剑使者.lua");
    
    local npcIndexcangjian2 = CreateNpc("Vng An Th筩h", "S? gi? T祅g Ki誱", 200,1229,2762);
    SetNpcScript(npcIndexcangjian2, "\\script\\藏剑山庄\\task_script\\汴京\\藏剑使者.lua");
    
    local npcIndexcangjian3 = CreateNpc("Vng An Th筩h", "S? gi? T祅g Ki誱", 100,1510,3106);
    SetNpcScript(npcIndexcangjian3, "\\script\\藏剑山庄\\task_script\\泉州\\藏剑使者.lua");
    
    local npcIndexcangjian4 = CreateNpc("Vng An Th筩h", "S? gi? T祅g Ki誱", 350,1395,2851);
    SetNpcScript(npcIndexcangjian4, "\\script\\藏剑山庄\\task_script\\襄阳\\藏剑使者.lua");

    local npcIndexcangjian5 = CreateNpc("Vng An Th筩h", "S? gi? T祅g Ki誱", 150,1745,3119);
    SetNpcScript(npcIndexcangjian5, "\\script\\藏剑山庄\\task_script\\扬州\\藏剑使者.lua");
    
end;


function Addyangmen()
    local npcIndexyangmen1 = CreateNpc("Dng Di猲 Chi猽", "Dng Di猲 Chi猽", 219,1543,2939);
    SetNpcScript(npcIndexyangmen1, "\\script\\中原一区\\天波杨府\\npc\\杨延昭.lua");
    
    local npcIndexyangmen2 = CreateNpc("Dng B礽 Phong", "Dng B礽 Phong", 219,1454,3107);
    SetNpcScript(npcIndexyangmen2, "\\script\\中原一区\\天波杨府\\npc\\杨排风.lua");
    
    local npcIndexyangmen3 = CreateNpc("Dng T玭 B秓", "Dng T玭 B秓", 219,1559,3084);
    SetNpcScript(npcIndexyangmen3, "\\script\\中原一区\\天波杨府\\npc\\杨宗保.lua");
    
    local npcIndexyangmen4 = CreateNpc("M閏 Qu? Anh", "M閏 Qu? Anh", 219,1481,3184);
    SetNpcScript(npcIndexyangmen4, "\\script\\中原一区\\天波杨府\\npc\\穆桂英.lua");
    
    local npcIndexyangmen5 = CreateNpc("Qu秐 gia", "Dng H錸g", 219,1634,3278);
    SetNpcScript(npcIndexyangmen5, "\\script\\中原一区\\天波杨府\\npc\\杨洪.lua");
    
    local npcIndexyangmen6 = CreateNpc("Xa Th竔 Qu﹏", "Xa Th竔 Qu﹏", 219,1529,3137);
    SetNpcScript(npcIndexyangmen6, "\\script\\中原一区\\天波杨府\\npc\\佘太君.lua");
    
    local npcIndexyangmen7 = CreateNpc("Rng  Trung Nguy猲", "Th? kh?", 219,1599,3140);
    SetNpcScript(npcIndexyangmen7, "\\script\\中原一区\\天波杨府\\npc\\中原储物柜.lua");
      
end;

function AddChristmas()
	local npcIndexWilson = CreateNpc("Truy襫 gi竜 s?","Uy Nh? T鑞",100,1308,2930);	--泉州
		SetNpcScript(npcIndexWilson,"\\script\\online\\zgc_npc_dialog.lua");
	local npcIndexchurchman1 = CreateNpc("Truy襫 gi竜 s?","Gi竜 s?",200,1333,2811);
		SetNpcScript(npcIndexchurchman1,"\\script\\online\\zgc_npc_dialog.lua");
	local npcIndexchurchman2 = CreateNpc("Truy襫 gi竜 s?","Gi竜 s?",300,1707,3546);
		SetNpcScript(npcIndexchurchman2,"\\script\\online\\zgc_npc_dialog.lua");		
	local npcIndexRosa = CreateNpc("Phu nh﹏ T﹜ Dng","La Sa",100,1526,2948);
		SetNpcScript(npcIndexRosa,"\\script\\online\\圣诞节活动\\罗莎.lua");
end

function Addxinan()
    local npcIndexxinan1 = CreateNpc("Xi H醓 Чi h? ph竝", "Xi H醓 Чi h? ph竝", 417,1642,3382);
    SetNpcScript(npcIndexxinan1, "\\script\\西南区\\白水洞二层\\npc\\蚩火大护法.lua");

    local npcIndexxinan2 = CreateNpc("D? Xoa Nha", "D? Xoa", 417,1815,3412);
    SetNpcScript(npcIndexxinan2, "\\script\\西南区\\白水洞二层\\npc\\夜叉.lua");
    
    local npcIndexxinan3 = CreateNpc("T╪g 竎", "Xi H醓 竎 t╪g", 416,1724,2821);
    SetNpcScript(npcIndexxinan3, "\\script\\西南区\\白水洞一层\\npc\\蚩火僧恶.lua");   
    
    local npcIndexxinan4 = CreateNpc("Quan s?-trung ni猲1", "Cao Th╪g Tuy襫", 400,1537,3050);
    SetNpcScript(npcIndexxinan4, "\\script\\西南区\\大理府\\npc\\高升泉.lua");      
        
    local npcIndexxinan5 = CreateNpc("B? ch?", "Tr辬h Qu竛 Chi", 400,1593,2928);
    SetNpcScript(npcIndexxinan5, "\\script\\西南区\\大理府\\npc\\郑贯之.lua");      
    
    local npcIndexxinan6 = CreateNpc("C? gi?", "фng Gi? La", 400,1522,2848);
    SetNpcScript(npcIndexxinan6, "\\script\\西南区\\大理府\\npc\\董迦罗.lua");      

    local npcIndexxinan7 = CreateNpc("Qu秐 gia", "Tr莕 L藀 H祅h", 400,1470,2847);
    SetNpcScript(npcIndexxinan7, "\\script\\西南区\\大理府\\npc\\陈立衡.lua");      

    local npcIndexxinan8 = CreateNpc("Thi誹 ni猲 nam1", "L璾 觧", 400,1443,3018);
    SetNpcScript(npcIndexxinan8, "\\script\\西南区\\大理府\\npc\\刘典.lua");      

    local npcIndexxinan9 = CreateNpc("Ng鬰 H醓 Cu錸g Nh﹏", "Ng鬰 H醓 Cu錸g Nh﹏", 401,1568,3085);
    SetNpcScript(npcIndexxinan9, "\\script\\西南区\\点苍山\\npc\\狱火狂人.lua");      

    local npcIndexxinan10 = CreateNpc("Xi H醓 T鎛g n ch?", "Xi H醓 T鎛g n ch?", 413,1697,3192);
    SetNpcScript(npcIndexxinan10, "\\script\\西南区\\龙眼洞二层\\npc\\蚩火教总坛主.lua");      

    local npcIndexxinan11 = CreateNpc("A Tu La", "A Tu La", 413,1701,3474);
    SetNpcScript(npcIndexxinan11, "\\script\\西南区\\龙眼洞二层\\npc\\阿修罗.lua");      

    local npcIndexxinan12 = CreateNpc("Xi H醓 Чi trng l穙", "Xi H醓 Чi trng l穙", 412,1553,2976);
    SetNpcScript(npcIndexxinan12, "\\script\\西南区\\龙眼洞一层\\npc\\蚩火大长老.lua");
    
    local npcIndexxinan13 = CreateNpc("Mi猽 L躰h D騨g S?", "Mi猽 L躰h D騨g S?", 408,1321,3004);
    SetNpcScript(npcIndexxinan13, "\\script\\西南区\\苗岭\\npc\\苗岭勇士.lua");
    
    local npcIndexxinan14 = CreateNpc("Nam nh﹏ T﹜ Nam", "T閏 trng Mi猽 L躰h", 408,1300,3140);
    SetNpcScript(npcIndexxinan14, "\\script\\西南区\\苗岭\\npc\\苗岭族长.lua");
      
    local npcIndexxinan15 = CreateNpc("чi trng h? v?", "чi trng h? v?", 409,1820,3518);
    SetNpcScript(npcIndexxinan15, "\\script\\西南区\\千寻塔一层\\npc\\护卫队长.lua");

    local npcIndexxinan16 = CreateNpc("Ki襫 Чt B?", "Ki襫 Чt B?", 409,1849,3598);
    SetNpcScript(npcIndexxinan16, "\\script\\西南区\\千寻塔一层\\npc\\乾达婆.lua");
    
    local npcIndexxinan17 = CreateNpc("Thi猲 T莔 N筽 S?", "Thi猲 T莔 N筽 S?", 410,1694,3134);
    SetNpcScript(npcIndexxinan17, "\\script\\西南区\\千寻塔二层\\npc\\千寻衲师.lua");
        
    local npcIndexxinan18 = CreateNpc("Kh萵 Na La", "Kh萵 Na La", 410,1693,3183);
    SetNpcScript(npcIndexxinan18, "\\script\\西南区\\千寻塔二层\\npc\\紧那罗.lua");

    local npcIndexxinan19 = CreateNpc("Ng? чc  C?", "Ng? чc  C?", 419,1774,3129);
    SetNpcScript(npcIndexxinan19, "\\script\\西南区\\入门迷宫二\\npc\\驭毒阴姬.lua");
    
    local npcIndexxinan20 = CreateNpc("H? C鑤 чc Nh﹏", "H? C鑤 чc Nh﹏", 418,1512,2825);
    SetNpcScript(npcIndexxinan20, "\\script\\西南区\\入门迷宫一\\npc\\腐骨毒人.lua");

    local npcIndexxinan21 = CreateNpc("Ng鬰 H醓 Nh﹏", "Ng鬰 H醓 Nh﹏", 406,1404,2770);
    SetNpcScript(npcIndexxinan21, "\\script\\西南区\\武陵山\\npc\\狱火人.lua");

    local npcIndexxinan22 = CreateNpc("B竛 謕 Nh﹏", "B竛 謕 Nh﹏", 405,1555,2959);
    SetNpcScript(npcIndexxinan22, "\\script\\西南区\\武陵山脚\\npc\\半蝶人.lua");

    local npcIndexxinan23 = CreateNpc("Ma H? La Gi?", "Ma H? La Gi?", 402,1319,2955);
    SetNpcScript(npcIndexxinan23, "\\script\\西南区\\西双版纳北部\\npc\\摩呼罗迦.lua");

    local npcIndexxinan24 = CreateNpc("Nh? Ho祅g T鯻Чi L?", "Nh? ho祅g t? 祅 T? Thu薾", 403,1458,2842);
    SetNpcScript(npcIndexxinan24, "\\script\\西南区\\西双版纳南部\\npc\\大理二皇子.lua");

    local npcIndexxinan25 = CreateNpc("祅 Th鮝 ", "祅 Th鮝 ", 403,1537,2967);
    SetNpcScript(npcIndexxinan25, "\\script\\西南区\\西双版纳南部\\npc\\段承恩.lua");

    local npcIndexxinan26 = CreateNpc("Mi猽 L躰h Th? l躰h", "Mi猽 L躰h Th? l躰h", 421,1576,3469);
    SetNpcScript(npcIndexxinan26, "\\script\\西南区\\燕子洞二层\\npc\\苗岭首领.lua");
    
    local npcIndexxinan27 = CreateNpc("Ng? чc T﹏ Chng M玭", "B筩h Doanh Doanh", 407,1615,3182);
    SetNpcScript(npcIndexxinan27, "\\script\\西南区\\五毒教\\npc\\白莹莹.lua");    
    
    local npcIndexxinan28 = CreateNpc("Xi H醓 Y猽 N?", "Xi H醓 Y猽 N?", 404,1346,3144);
    SetNpcScript(npcIndexxinan28, "\\script\\西南区\\翠烟\\npc\\蚩火妖妇.lua");
    
    local npcIndexxinan29 = CreateNpc("T﹜ Nam Mi猽 Nh﹏", "C﹗ S竎h", 407,1572,3159);
    SetNpcScript(npcIndexxinan29, "\\script\\西南区\\五毒教\\npc\\勾册.lua");    
    
    local npcIndexxinan30 = CreateNpc("Nam nh﹏ T﹜ Nam", "Phng Vi猲", 407,1549,3184);
    SetNpcScript(npcIndexxinan30, "\\script\\西南区\\五毒教\\npc\\方猿.lua");      
    
    local npcIndexxinan31 = CreateNpc("Ng? чc gi竜 ch?", "V璾 Dung", 407,1643,3233);
    SetNpcScript(npcIndexxinan31, "\\script\\西南区\\五毒教\\npc\\尤榕.lua");    

    local npcIndexxinan32 = CreateNpc("Ng? чc gi竜 ", "T﹜ у", 407,1606,3279);
    SetNpcScript(npcIndexxinan32, "\\script\\西南区\\五毒教\\npc\\西图.lua");    

    local npcIndexxinan33 = CreateNpc("Ch? ti謒 v秈 T﹜ Nam", "Li評 T﹏ Tr骳", 407,1606,3220);
    SetNpcScript(npcIndexxinan33, "\\script\\西南区\\五毒教\\npc\\柳新竹.lua");
    
    local npcIndexxinan34 = CreateNpc("Ng? чc Ph? gi竜 ch?", "Ng? Ng玭", 407,1594,3171);
    SetNpcScript(npcIndexxinan34, "\\script\\西南区\\五毒教\\npc\\吴言.lua");   

    local npcIndexxinan35 = CreateNpc("Ng? чc Ph? gi竜 ch?", "H飊g L藀", 407,1551,3265);
    SetNpcScript(npcIndexxinan35, "\\script\\西南区\\五毒教\\npc\\熊立.lua");   

    local npcIndexxinan36 = CreateNpc("Ng? чc gi竜 ", "Th竔 Quang", 407,1556,3216);
    SetNpcScript(npcIndexxinan36, "\\script\\西南区\\五毒教\\npc\\泰光.lua");
    
    local npcIndexxinan37 = CreateNpc("L? S? S?", "S礽 Ho祅g Nhi", 404,1570,2725);
    SetNpcScript(npcIndexxinan37, "\\script\\西南区\\翠烟\\npc\\柴凰儿.lua");
    
    local npcIndexxinan38 = CreateNpc("Th髖 Y猲 h? ph竝", "H? M蒼", 404,1599,2760);
    SetNpcScript(npcIndexxinan38, "\\script\\西南区\\翠烟\\npc\\扈敏.lua");  
    
    local npcIndexxinan39 = CreateNpc("Th髖 Y猲 chng m玭", "L璾 Thanh Mi", 404,1543,2693);
    SetNpcScript(npcIndexxinan39, "\\script\\西南区\\翠烟\\npc\\刘青眉.lua");
    
    local npcIndexxinan40 = CreateNpc("Hi謕 n?", "Chu T? V╪",404,1524,2719);
    SetNpcScript(npcIndexxinan40, "\\script\\西南区\\翠烟\\npc\\周子雯.lua");
    
    local npcIndexxinan41 = CreateNpc("T? Ho祅 Ch﹏", "H? Man Th祅h", 404,1577,2784);
    SetNpcScript(npcIndexxinan41, "\\script\\西南区\\翠烟\\npc\\胡曼成.lua");
    
    local npcIndexxinan42 = CreateNpc("Th髖 Y猲 m玭 nh﹏", "H? H礽", 404,1493,2746);
    SetNpcScript(npcIndexxinan42, "\\script\\西南区\\翠烟\\npc\\何谐.lua");
   
    local npcIndexxinan43 = CreateNpc("Th髖 Y猲 h? ph竝", "X秓 X秓", 404,1474,2838);
    SetNpcScript(npcIndexxinan43, "\\script\\西南区\\翠烟\\npc\\巧巧.lua");

    local npcIndexxinan44 = CreateNpc("Xa phu T﹜ Nam", "Xa phu Чi L?", 400,1549,2882);
    SetNpcScript(npcIndexxinan44, "\\script\\西南区\\大理府\\npc\\大理车夫.lua");
    
    local npcIndexxinan45 = CreateNpc("Ch? ti謒  T﹜ Nam", "Ch? Kim ho祅", 400,1497,2940);
    SetNpcScript(npcIndexxinan45, "\\script\\西南区\\大理府\\npc\\饰品店老板.lua");
    
    local npcIndexxinan46 = CreateNpc("Rng  Trung Nguy猲", "Th? kh?", 400,1553,2914);
    SetNpcScript(npcIndexxinan46, "\\script\\西南区\\大理府\\npc\\物品保管人北.lua");
    
    local npcIndexxinan47 = CreateNpc("Ch? c莔  T﹜ Nam", "Ch? t鰑 l莡", 400,1524,2894);
    SetNpcScript(npcIndexxinan47, "\\script\\西南区\\大理府\\npc\\酒楼老板.lua");  
    
    local npcIndexxinan48 = CreateNpc("T? Thanh Thng Nh﹏", "L? quan", 400,1506,2847);
    SetNpcScript(npcIndexxinan48, "\\script\\中原一区\\汴京\\npc\\大内总管.lua");
    
    local npcIndexxinan49 = CreateNpc("Chng dc Th? Ph錸", "Ch? T筽 h鉧", 400,1511,2955);
    SetNpcScript(npcIndexxinan49, "\\script\\西南区\\大理府\\npc\\杂货店老板.lua"); 
    
    local npcIndexxinan50 = CreateNpc("Tr譶h Di", "Ch? thng h閕", 400,1486,2924);
    SetNpcScript(npcIndexxinan50, "\\script\\西南区\\大理府\\npc\\商会老板.lua");
    
    local npcIndexxinan51 = CreateNpc("Chng dc T﹜ Nam", "Ch? Dc 甶誱", 400,1522,3007);
    SetNpcScript(npcIndexxinan51, "\\script\\西南区\\大理府\\npc\\药店老板.lua");
    
    local npcIndexxinan52 = CreateNpc("V? L﹎ Minh Ch?1", "S? gi? m玭 ph竔", 400,1548,2981);
    SetNpcScript(npcIndexxinan52, "\\script\\西南区\\大理府\\npc\\门派接引人.lua");
    
    local npcIndexxinan53 = CreateNpc("Ch? ti謒 v? kh? T﹜ Nam", "Ch? Ti謒 Nam ph鬰", 400,1471,2956);
    SetNpcScript(npcIndexxinan53, "\\script\\西南区\\大理府\\npc\\男装店老板.lua");
    
    local npcIndexxinan54 = CreateNpc("Ch? ti謒 v秈 T﹜ Nam", "Ch? Ti謒 N? ph鬰", 400,1498,2969);
    SetNpcScript(npcIndexxinan54, "\\script\\西南区\\大理府\\npc\\女装店老板.lua");
    
    local npcIndexxinan55 = CreateNpc("Xa phu T﹜ Nam", "Xa phu Чi L?", 400,1574,3110);
    SetNpcScript(npcIndexxinan55, "\\script\\西南区\\大理府\\npc\\大理车夫.lua");
    
    local npcIndexxinan56 = CreateNpc("Rng  Trung Nguy猲", "Th? kh?", 400,1527,3112);
    SetNpcScript(npcIndexxinan56, "\\script\\西南区\\大理府\\npc\\物品保管人东.lua");
    
    local npcIndexxinan57 = CreateNpc("Xa phu T﹜ Nam", "Xa phu Чi L?", 400,1465,3110);
    SetNpcScript(npcIndexxinan57, "\\script\\西南区\\大理府\\npc\\大理车夫.lua");
    
    local npcIndexxinan58 = CreateNpc("Rng  Trung Nguy猲", "Th? kh?", 400,1456,3071);
    SetNpcScript(npcIndexxinan58, "\\script\\西南区\\大理府\\npc\\物品保管人南.lua");

    local npcIndexxinan59 = CreateNpc("Rng  Trung Nguy猲", "Th? kh?", 407,1621,3249);
    SetNpcScript(npcIndexxinan59, "\\script\\西南区\\五毒教\\npc\\物品保管人.lua");

    local npcIndexxinan60 = CreateNpc("Ch? V? kh? Trung Nguy猲", "Ch? Ti謒 v? kh?", 400,1566,3005);
    SetNpcScript(npcIndexxinan60, "\\script\\西南区\\大理府\\npc\\武器店老板.lua");
    
    local npcIndexxinan61 = CreateNpc("Ch? V? kh? Trung Nguy猲", "Minh S? Ph?", 350,1546,2930);
    SetNpcScript(npcIndexxinan61, "\\script\\中原二区\\襄阳\\npc\\制帽技能.lua");    

    local npcIndexxinan62 = CreateNpc("Thi誹 n? Mi猽 T閏", "T? Quy猲", 400,1409,2980);
    SetNpcScript(npcIndexxinan62, "\\script\\西南区\\大理府\\npc\\制裤技能.lua");  
                                                                   
end;

function AddCheFu()		 --采集地图车夫
	local npcIndex = CreateNpc("Xa phu Trung Nguy猲","Xa phu",714,1425,2847);
	SetNpcScript(npcIndex,"\\script\\世界地图\\南槐谷\\npc\\车夫.lua");
	npcIndex = CreateNpc("Xa phu Trung Nguy猲","Xa phu",714,1585,3166);
	SetNpcScript(npcIndex,"\\script\\世界地图\\南槐谷\\npc\\车夫.lua");
	
	npcIndex = CreateNpc("Xa phu Trung Nguy猲","Xa phu",719,1624,3269);
	SetNpcScript(npcIndex,"\\script\\世界地图\\含幽谷\\npc\\车夫.lua");
	npcIndex = CreateNpc("Xa phu Trung Nguy猲","Xa phu",719,1785,3516);
	SetNpcScript(npcIndex,"\\script\\世界地图\\含幽谷\\npc\\车夫.lua");
	
	npcIndex = CreateNpc("Xa phu Trung Nguy猲","Xa phu",724,1656,3554);
	SetNpcScript(npcIndex,"\\script\\世界地图\\轩辕谷\\npc\\车夫.lua");
	npcIndex = CreateNpc("Xa phu Trung Nguy猲","Xa phu", 724,1814,3554);
	SetNpcScript(npcIndex,"\\script\\世界地图\\轩辕谷\\npc\\车夫.lua");
end

function AddDragonBoatDay()
	local npcIndex = CreateNpc("V? L﹎ Minh Ch?1","Long Chu s? gi?",100,1465,2794);
	SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_manager.lua");
	npcIndex = CreateNpc("V? L﹎ Minh Ch?1","Long Chu s? gi?",200,1170,2828);
	SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_manager.lua");
	npcIndex = CreateNpc("V? L﹎ Minh Ch?1","Long Chu s? gi?",300,1640,3526);
	SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_manager.lua");	

	for i=0,7 do 
		npcIndex = CreateNpc("V? L﹎ Minh Ch?1","Long Chu s? gi?",1070+i,2051,3249);
		SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_worker.lua");
	end;
	for i=0,7 do 
		npcIndex = CreateNpc("V? L﹎ Minh Ch?1","Long Chu s? gi?",2070+i,2051,3249);
		SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_worker.lua");
	end;
	for i=0,7 do 
		npcIndex = CreateNpc("V? L﹎ Minh Ch?1","Long Chu s? gi?",3070+i,2051,3249);
		SetNpcScript(npcIndex,"\\script\\online\\dragonboat06\\room_worker.lua");
	end;
end;

function AddTxNpc()
	local npcIndex = CreateNpc("V? ng  chng m玭", "Th莕 Du Ch﹏ Nh﹏", 200, 1151, 2850)
	SetNpcScript(npcIndex, "\\script\\太虚幻境\\空空和尚.lua")
	npcIndex = CreateNpc("V? ng  chng m玭", "Th莕 Du Ch﹏ Nh﹏", 300, 1975, 3552)
	SetNpcScript(npcIndex, "\\script\\太虚幻境\\空空和尚.lua")
	npcIndex = CreateNpc("V? ng  chng m玭", "Th莕 Du Ch﹏ Nh﹏", 100, 1379, 2858)
	SetNpcScript(npcIndex, "\\script\\太虚幻境\\空空和尚.lua")
end

function ZoneInit(nMapid)
	--动态加上Trap
	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3235 * 32, "\\script\\太虚幻境\\trap_冰雪天地.lua")
	end

	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3330 * 32, "\\script\\太虚幻境\\trap_冰雪天地.lua")
	end

	for i = 3235, 3330 do
		AddMapTrap(nMapid, 1515 * 32, i * 32, "\\script\\太虚幻境\\trap_冰雪天地.lua")
	end

	for i = 3235, 3330 do
		AddMapTrap(nMapid, 1570 * 32, i * 32, "\\script\\太虚幻境\\trap_冰雪天地.lua")
	end

	-----------------------------------------------------------------------------------

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3230 * 32, "\\script\\太虚幻境\\trap_江南春色.lua")
	end

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3330 * 32, "\\script\\太虚幻境\\trap_江南春色.lua")
	end

	for i = 3230, 3330 do
		AddMapTrap(nMapid, 1600 * 32, i * 32, "\\script\\太虚幻境\\trap_江南春色.lua")
	end

	for i = 3230, 3330 do
		AddMapTrap(nMapid, 1650 * 32, i * 32, "\\script\\太虚幻境\\trap_江南春色.lua")
	end

	-----------------------------------------------------------------------------------

	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3395 * 32, "\\script\\太虚幻境\\trap_熔岩地狱.lua")
	end

	for i = 1515, 1570 do
		AddMapTrap(nMapid, i * 32, 3495 * 32, "\\script\\太虚幻境\\trap_熔岩地狱.lua")
	end

	for i = 3395, 3495 do
		AddMapTrap(nMapid, 1515 * 32, i * 32, "\\script\\太虚幻境\\trap_熔岩地狱.lua")
	end

	for i = 3395, 3495 do
		AddMapTrap(nMapid, 1570 * 32, i * 32, "\\script\\太虚幻境\\trap_熔岩地狱.lua")
	end

	-----------------------------------------------------------------------------------

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3390 * 32, "\\script\\太虚幻境\\trap_瀚海黄沙.lua")
	end

	for i = 1600, 1650 do
		AddMapTrap(nMapid, i * 32, 3500 * 32, "\\script\\太虚幻境\\trap_瀚海黄沙.lua")
	end

	for i = 3390, 3500 do
		AddMapTrap(nMapid, 1600 * 32, i * 32, "\\script\\太虚幻境\\trap_瀚海黄沙.lua")
	end

	for i = 3390, 3500 do
		AddMapTrap(nMapid, 1650 * 32, i * 32, "\\script\\太虚幻境\\trap_瀚海黄沙.lua")
	end
end

function Addfengdutrap()
	for i = 1587, 1592 do
		AddMapTrap(307, i * 32, 2687 * 32, "\\script\\中原二区\\丰都\\trap\\丰都to十八层地狱.lua")
	end

	for i = 1587, 1592 do
		AddMapTrap(307, i * 32, 2686 * 32, "\\script\\中原二区\\丰都\\trap\\丰都to十八层地狱.lua")
	end
end

function Addmenpaibuchong()
	for i = 1625, 1630 do
		AddMapTrap(303, i * 32, 3180 * 32, "\\script\\中原二区\\峨嵋\\trap\\进峨嵋.lua")
	end

	for i = 1571, 1577 do
		AddMapTrap(209, i * 32, 3217 * 32, "\\script\\中原一区\\丐帮\\trap\\进丐帮.lua")
	end
	
	for i = 1585, 1591 do
		AddMapTrap(407, i * 32, 3287 * 32, "\\script\\西南区\\五毒教\\trap\\入五毒教.lua")
	end
	
	for i = 1891, 1896 do
		AddMapTrap(312, i * 32, 3422 * 32, "\\script\\中原二区\\武当\\trap\\进武当.lua")
	end	
end

function AddXinshou()
	local npcIndex = CreateNpc("Thi謚 Ung", "V筺 S? Th玭g", 200, 1397, 2849)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\新手指引npc.lua")
	npcIndex = CreateNpc("Thi謚 Ung", "V筺 S? Th玭g", 300, 1750, 3524)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\新手指引npc.lua")
	npcIndex = CreateNpc("Thi謚 Ung", "V筺 S? Th玭g", 100, 1440, 2964)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\新手指引npc.lua")
	npcIndex = CreateNpc("Thi謚 Ung", "V筺 S? Th玭g", 350, 1452, 2991)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\新手指引npc.lua")
	npcIndex = CreateNpc("Thi謚 Ung", "V筺 S? Th玭g", 150, 1694, 3146)
	SetNpcScript(npcIndex, "\\script\\task\\teach\\新手指引npc.lua")		
end

function CreateGatherNpc()
	local nIndex = 0
	nIndex = CreateNpc("Du Phng i phu", "Ngi 駓 th竎 h竔 thu鑓", 724,1737,3377)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Du Phng i phu", "Ngi 駓 th竎 h竔 thu鑓", 714, 1500, 3018)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Du Phng i phu", "Ngi 駓 th竎 h竔 thu鑓", 719, 1708, 3376)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Xa phu Trung Nguy猲", "Ngi 駓 th竎 n g?", 710, 1711, 3395)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Xa phu Trung Nguy猲", "Ngi 駓 th竎 n g?", 715, 1500, 2992)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Xa phu Trung Nguy猲", "Ngi 駓 th竎 n g?", 720, 1727, 3346)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Thi誹 ni猲 trong th玭", "Ngi 駓 th竎 canh t竎", 713, 1481, 2944)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Thi誹 ni猲 trong th玭", "Ngi 駓 th竎 canh t竎", 718, 1703, 3410)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Thi誹 ni猲 trong th玭", "Ngi 駓 th竎 canh t竎", 723, 1701, 3456)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Ch? V? kh? Trung Nguy猲", "Ngi 駓 th竎 o kh鉧ng", 711, 1721, 3373)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Ch? V? kh? Trung Nguy猲", "Ngi 駓 th竎 o kh鉧ng", 716, 1707, 3038)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Ch? V? kh? Trung Nguy猲", "Ngi 駓 th竎 o kh鉧ng", 721, 1682, 3336)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Th莥 luy謓 th?", "Ngi 駓 th竎 thu th藀", 712, 1480, 2919)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Ph? n?1", "Ngi 駓 th竎 thu th藀", 717, 1744, 2957)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
	
	nIndex = CreateNpc("Th莥 luy謓 th?", "Ngi 駓 th竎 thu th藀", 722, 1755, 3430)
	SetNpcScript(nIndex, "\\script\\tishencaiji\\tishen_npc.lua")
end
--******************************重阳节活动*******************************
function AddDoubleNinth()
	local nNpcIndex = 0;
	nNpcIndex = CreateNpc("V? L﹎ Minh Ch?1","V? L﹎ truy襫 nh﹏",100,1456,2789);	--泉州：183，174
	SetNpcScript(nNpcIndex, "\\script\\江南区\\泉州\\npc\\武林盟传人.lua");
	nNpcIndex = CreateNpc("V? L﹎ Minh Ch?1","V? L﹎ truy襫 nh﹏",300,1629,3529);	--成都：205，220
	SetNpcScript(nNpcIndex, "\\script\\中原二区\\成都\\npc\\武林盟传人.lua");
	nNpcIndex = CreateNpc("V? L﹎ Minh Ch?1","V? L﹎ truy襫 nh﹏",200,1189,2835);	--汴京：146，176
	SetNpcScript(nNpcIndex, "\\script\\中原一区\\汴京\\npc\\武林盟传人.lua");
	nNpcIndex = CreateNpc("V? L﹎ Minh Ch?1","V? L﹎ truy襫 nh﹏",969,1643,3225);	
	SetNpcScript(nNpcIndex, "\\script\\中原一区\\汴京\\npc\\华山武林盟传人.lua");
end;

function AddNewBattle()
	local tChannel = 
	{								--频道名字与ID
		[1] = {"Nh筺 M玭 Quan-chi課 d辌h Th玭 trang",12},
		[2] = {"Nh筺 M玭 Quan-chi課 d辌h th秓 c鑓",13},
		[3] = {"Nh筺 M玭 Quan-chi課 d辌h ph竜 i",14},
		[4] = {"Nh筺 M玭 Quan-chi課 d辌h ch輓h",15},
		[5] = {"Nh筺 M玭 Quan-chi課 d辌h Th玭 trang phe T鑞g",16},
		[6] = {"Nh筺 M玭 Quan-chi課 d辌h Th玭 trang phe Li猽",17},
		[7] = {"Nh筺 M玭 Quan-chi課 d辌h th秓 c鑓 phe T鑞g",18},
		[8] = {"Nh筺 M玭 Quan-chi課 d辌h th秓 c鑓 phe Li猽",19},
		[9] = {"Nh筺 M玭 Quan-chi課 d辌h ph竜 i phe T鑞g",20},
		[10] = {"Nh筺 M玭 Quan-chi課 d辌h ph竜 i phe Li猽",21},
		[11] = {"Nh筺 M玭 Quan-chi課 d辌h ch輓h phe T鑞g",22},
		[12] = {"Nh筺 M玭 Quan-chi課 d辌h ch輓h phe Li猽",23},
	}
	for i=1,getn(tChannel) do
		CreateChannel(tChannel[i][1],tChannel[i][2]);
	end;
	SetGlbValue(31,0)	--开启新战场
end;