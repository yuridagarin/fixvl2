Include("\\script\\online_activites\\2010_04\\activities_02\\head.lua");--活动头文件
Include("\\script\\online\\plant\\fruit_baoguo.lua");
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua")
Include("\\script\\vng\\doinguyenlieu.lua")
Include("\\script\\vng\\kimxathang1.lua")

function main()
    --初始化数据
    local nDate = tonumber(date("%Y%m%d"));
    local tbSays = {};    
    if GetTask(VET_201004_02_TASK_DATE_HANDIN_FRUIT) < nDate then               --某天第一次点击初始化
        SetTask(VET_201004_02_TASK_FLAG_MULTI_REWARD, 0);
        SetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT, 0);
        SetTask(VET_201004_02_TASK_FLAG_ISHANDED, 0);
        SetTask(VET_201004_02_TASK_DATE_HANDIN_FRUIT, nDate);
    end
    
	if nDate <= 20140119 then
		tinsert(tbSays, "Kim x? th竛g 1/KimXaThang1_Menu")
		tinsert(tbSays, "Nh薾 ph莕 thng i 6 l莕 trang b? Kim X?/KimXaThang1_FinalAward")
	end
    
    --条件判断
    if GetPlayerRoute() == 0 then
       Talk(1, "", VET_201004_02_TB_STRINGS[1][3]..VET_201004_02_TB_STRINGS[2][14]); 
       return 0;
    end
    if GetLevel() < 73 then
       Talk(1, "", VET_201004_02_TB_STRINGS[1][3]..VET_201004_02_TB_STRINGS[2][13]); 
       return 0;    
    end
    --szSay
    local szSay = VET_201004_02_TB_STRINGS[1][3]..VET_201004_02_TB_STRINGS[2][1];
    --tbSays
-- фi nguy猲 li謚 b籲g Чi мnh H錸, Thi猲 Th筩h Linh Th筩h
    if nDate >= 20130515 and nDate <= 20130531 then
    		tinsert(tbSays, "Ta mu鑞 trao i m閠 輙 nguy猲 li謚/Trade_Material_Menu2")
    	end
    --tinsert(tbSays, VET_201004_02_TB_STRINGS[2][2].."/businessman_handin_fruit");
if DEBUG == 1 then
    print("TaskValue(VET_201004_02_TASK_FLAG_MULTI_REWARD) = "..GetTask(VET_201004_02_TASK_FLAG_MULTI_REWARD));
    print("TaskValue(VET_201004_02_TASK_NUM_HANDIN_FRUIT) = "..GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT));
end
    if GetTask(VET_201004_02_TASK_FLAG_MULTI_REWARD) == 0 and GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) > 1 then
        tinsert(tbSays, VET_201004_02_TB_STRINGS[2][3].."/businessman_multi_award");
    end
    --tinsert(tbSays, "T筰 h? mu鑞 trao i tr竔 c﹜/ExchangeFruit");
	--tinsert(tbSays,"T筰 h? mu鑞 mua m閠 s? lo筰 tr竔 c﹜/BuyFruit_Form")
    tinsert(tbSays, VET_201004_02_TB_STRINGS[2][4].."/businessman_guide");
    tinsert(tbSays, VET_201004_02_TB_STRINGS[2][5].."/gf_DoNothing");
    Say(szSay, getn(tbSays), tbSays);
end

function businessman_handin_fruit()
    --负重检测
    if gf_Judge_Room_Weight(2, 10, "") == 0 then
        return 0;
    end
    --tbDialogList
    local tbDialogList = {};
    ----say head
    tbDialogList[0] = VET_201004_02_TB_STRINGS[2][9];
    ----选项生成
    local nFlagIsHanded = GetTask(VET_201004_02_TASK_FLAG_ISHANDED);
	if DEBUG == 1 then
	    print("nFlagIsHanded = "..nFlagIsHanded);
	end
    for i = 1, 20 do
        if GetBit(nFlagIsHanded, i) == 0 then
            tinsert(tbDialogList, format(VET_201004_02_TB_STRINGS[2][8], VET_201004_02_TB_ITEM_LIST[i][1]).."/#businessman_handin_fruit_final("..i..")");
        end
    end
    if getn(tbDialogList) == 0 then
        Talk(1, "", VET_201004_02_TB_STRINGS[1][3]..VET_201004_02_TB_STRINGS[2][11]);
        return 1;
    end
    --tinsert(tbDialogList, VET_201004_02_TB_STRINGS[2][10].."/main");
    gf_PageSay(tbDialogList, 1, 6);
end

function businessman_multi_award()
    if GetTask(VET_201004_02_TASK_FLAG_MULTI_REWARD) == 1 then
       Talk(1, "main", VET_201004_02_TB_STRINGS[2][15]); 
       return 0; 
    end
	if gf_Judge_Room_Weight(2,100) == 0 then
		Talk(1,"","S鴆 l鵦 ho芻 h祅h trang kh玭g , vui l遪g s緋 x誴 l筰 h祅h trang.")
		return 0
	end
	local nExp = 0
    if GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) >= 20 then
    		nExp = 120000000
    		AddItem(2,1,30340,50)
    elseif GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) == 19 then
    		nExp = 80000000
    		AddItem(2,1,30340,30)
    elseif GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) == 18 then
    		nExp = 60000000
    		AddItem(2,1,30340,20)
    elseif GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) == 17 then
    		nExp = 40000000
    		AddItem(2,1,30340,10)
    elseif GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) == 16 then
    		nExp = 30000000
    		AddItem(2,1,30340,5)
    elseif GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) > 1 then
        	nExp = 1000000*GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT);
    end
    ModifyExp(nExp);
    Msg2Player(format(VET_201004_02_TB_STRINGS[2][16], nExp));
    SetTask(VET_201004_02_TASK_FLAG_MULTI_REWARD, 1);
end

function businessman_guide()
    local szTalkString = VET_201004_02_TB_STRINGS[1][3];
    szTalkString = szTalkString..VET_201004_02_TB_STRINGS[2][6]..VET_201004_02_TB_STRINGS[2][7];
    Talk(1, "main", szTalkString);
end

function businessman_handin_fruit_final(nType)
    --防止万一，再次检测
    local nFlagIsHanded = GetTask(VET_201004_02_TASK_FLAG_ISHANDED);
    if GetBit(nFlagIsHanded, nType) == 1 then
        Talk(1, "businessman_handin_fruit", format(VET_201004_02_TB_STRINGS[2][12], VET_201004_02_TB_ITEM_LIST[nType][1]));
        return 0;
    end
    --检测身上水果携带
if DEBUG ~= 1 then            --debug滤过条件
    if GetItemCount(VET_201004_02_TB_ITEM_LIST[nType][2], VET_201004_02_TB_ITEM_LIST[nType][3], VET_201004_02_TB_ITEM_LIST[nType][4]) < 10 then
        Talk(1, "", format(VET_201004_02_TB_STRINGS[2][17], VET_201004_02_TB_ITEM_LIST[nType][1], 10));
        return 0;
    end
    --删除水果
    if DelItem(VET_201004_02_TB_ITEM_LIST[nType][2], VET_201004_02_TB_ITEM_LIST[nType][3], VET_201004_02_TB_ITEM_LIST[nType][4], 10) ~= 1 then
        Talk(1, "", format(VET_201004_02_TB_STRINGS[2][17], VET_201004_02_TB_ITEM_LIST[nType][1], 10));
        return 0;
    end
end
    nFlagIsHanded = SetBit(nFlagIsHanded, nType, 1);
    SetTask(VET_201004_02_TASK_FLAG_ISHANDED, nFlagIsHanded);                   --某种水果已经上交了
    SetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT, GetTask(VET_201004_02_TASK_NUM_HANDIN_FRUIT) + 1);
    ModifyExp(500000);
    Msg2Player(format(VET_201004_02_TB_STRINGS[2][16], 500000));
    if tonumber(date("%y%m%d")) < 100709 then
    	gf_EventGiveRandAward(VET_201004_02_TB_RAND_AWARD_LIST, 100, 1, VET_201004_02_STR_LOG_TITLE, VET_201004_02_TB_LOG_ACTION_LIST[1]);
    end
end



--		LIB_Award.szLogTitle = "EVENT TRAI CAY BA MIEN"
--		LIB_Award.szLogAction = "nh薾"
--		local tbNhan = {item = {{gdp = {2, 1, 30164, 20}, name="Nh穘"}}}
--		local tbChomChom = {item = {{gdp = {2, 1, 30165, 20}, name="Ch玬 Ch玬"}}}
--		local tbCam = {item = {{gdp = {2, 1, 30166, 20}, name="Cam"}}}
--		local tbDua = {item = {{gdp = {2, 1, 30167, 20}, name="D鮝"}}}
--		local tbMangCut = {item = {{gdp = {2, 1, 30168, 20}, name="M╪g C魌"}}}
--		local tbBuoi = {item = {{gdp = {2, 1, 30169, 20}, name="Bi"}}}
--		local tbDau = {item = {{gdp = {2, 1, 30170, 20}, name="D﹗"}}}
--		local tbChuoi = {item = {{gdp = {2, 1, 30171, 20}, name="Chu鑙"}}}
--		local tbXoai = {item = {{gdp = {2, 1, 30172, 20}, name="Xo礽"}}}
--		local tbDao = {item = {{gdp = {2, 1, 30173, 20}, name="Уo"}}}
--		local tbMan = {item = {{gdp = {2, 1, 30174, 20}, name="M薾"}}}
--		local tbVai = {item = {{gdp = {2, 1, 30175, 20}, name="V秈"}}}
--		local tbTao = {item = {{gdp = {2, 1, 30176, 20}, name="T竜"}}}
--		local tbBo = {item = {{gdp = {2, 1, 30177, 20}, name="B?"}}}
--		local tbDuDu = {item = {{gdp = {2, 1, 30178, 20}, name=" я"}}}
--		local tbMangCau = {item = {{gdp = {2, 1, 30179, 20}, name="M穘g C莡"}}}
--		local tbKhom = {item = {{gdp = {2, 1, 30180, 20}, name="Kh鉳"}}}
--		local tbLe = {item = {{gdp = {2, 1, 30181, 20}, name="L?"}}}
--		local tbBonBon = {item = {{gdp = {2, 1, 30182, 20}, name="B遪 Bon"}}}
--		local tbKhe = {item = {{gdp = {2, 1, 30183, 20}, name="Kh?"}}}

tbTraiCay = {
	[1] = {"Nh穘", 30164, 5},
	[2] = {"Ch玬 Ch玬", 30165, 5},
	[3] = {"Cam", 30166, 5},
	[4] = {"D鮝", 30167, 5},
	[5] = {"M╪g C魌", 30168, 5},
	[6] = {"Bi", 30169, 5},
	[7] = {"D﹗", 30170, 5},
	[8] = {"Chu鑙", 30171, 5},
	[9] = {"Xo礽", 30172, 5},
	[10] = {"Уo", 30173, 5},
	[11] = {"M薾", 30174, 5},
	[12] = {"V秈", 30175, 5},
	[13] = {"T竜", 30176, 5},
	[14] = {"B?", 30177, 5},
	[15] = {" я", 30178, 5},
	[16] = {"M穘g C莡", 30179, 5},
	[17] = {"Kh鉳", 30180, 5},
	[18] = {"L?", 30181, 5},
	[19] = {"B遪 Bon", 30182, 5},
	[20] = {"Kh?", 30183, 5},
}
		

function BuyFruit_Form()
	tbSay = {}
	tbSay[0] = VET_201004_02_TB_STRINGS[1][3]..VET_201004_02_TB_STRINGS[2][1];
	for i=1,20 do
		tinsert(tbSay, tbTraiCay[i][1] .. "/#BuyFruit_Confirm("..  i .. ")")
	end
	--tinsert(tbSay,"Ta ch? ti謓 gh? ngang/gf_DoNothing");
	--Say(szSay,getn(tbSay),tbSay)
	gf_PageSay(tbSay, 1, 6);
end


function BuyFruit_Confirm(nFruitID)
	SetTaskTemp(TSK_TMP_FRUIT_INDEX, nFruitID)
	AskClientForNumber("BuyFruit_Done", 1, 999, "S? lng (1-999)")
end


function BuyFruit_Done(nCount)
	local nFruitID = GetTaskTemp(TSK_TMP_FRUIT_INDEX)
	SetTaskTemp(TSK_TMP_FRUIT_INDEX, 0)

	if gf_Judge_Room_Weight(2,100) == 0 then
		Talk(1,"","S鴆 l鵦 ho芻 h祅h trang kh玭g , vui l遪g s緋 x誴 l筰 h祅h trang.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < nCount*4 then
		Talk(1,"","C竎 h? kh玭g  xu v藅 ph萴, hay l? qu猲 mang theo?");
		return 0
	end
	
	LIB_Award.szLogTitle = "MUA TRAI CAY"
	LIB_Award.szLogAction = "nh薾"
	local tbAward = {item = {{gdp = {2,1,tbTraiCay[nFruitID][2], nCount}, name = tbTraiCay[nFruitID][1]}}}
	
	if DelItem(2,1,30230,nCount*4) == 1 then
		LIB_Award:Award(tbAward)
	end
end