
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 退任官员脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua")

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
			
	if (IsFreeze() == 1) then  --如果用WG被封
	    Talk(1,"lua_clear","<color=yellow>B秓 v? t礽 kho秐, tr竛h ph莕 m襪 hack!<color>");
	    WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount().."["..GetName().."]", "Kh玭g s? d鬾g ph莕 m襪 hack");
	    return
	end;
	
	if (nState==13) then
		task_013();
		return
	else
		--Talk(1,"","L祄 ngi, trc khi nh緈 m総 xu玦 tay, c? th? c鑞g hi課 cho Qu鑓 gia c騨g l? vi謈 n猲 l祄!");
		Msg2Player("L祄 ngi, trc khi nh緈 m総 xu玦 tay, c? th? c鑞g hi課 cho Qu鑓 gia c騨g l? vi謈 n猲 l祄 !!!!")
	end;
    ----------- Chu鏸 nhi謒 v? Chuy觧 Sinh 6
    	local szNpcName = "<color=green>Vi猲 Quan Tho竔 Nhi謒<color>: "
	local tSay = {}
	local tHeader = szNpcName.."B? k輕 <color=yellow>T? Linh Ph鬰 Sinh<color> l? g?, ta m韎 nghe l莕 u. !!! Ai n鉯 v韎 i hi謕 l? t筰 h? 產ng n緈 gi? b? k輕 n祔 ?"
 	local nDate = tonumber(date("%Y%m%d"))
	tSay = aah_GetSayDialog(86);
	tinsert(tSay, "T筰 h? ch? xem qua th玦/nothing");		
	Say(tHeader, getn(tSay), tSay)   	
	if nDate >= 20130427 and nDate <= 20130505 then
 		tinsert(tSay, "駈g h? Bi觧 Фo nc nh? (10 Hu﹏ Chng JXII + 10 v祅g)/#vng_ungho(1)")		
		tinsert(tSay, "駈g h? Bi觧 Фo nc nh? (10 B籲g Khen JXII + 10 v祅g)/#vng_ungho(2)")
		tinsert(tSay, "駈g h? Bi觧 Фo nc nh? (10 蕁 L穘h Th? + 10 v祅g)/#vng_ungho(3)")
		tinsert(tSay, "Nh薾 thng nhi謙 t譶h 駈g h? (m鏸 lo筰 駈g h? 50 l莕)/vng_ungho_finish")					
		tinsert(tSay, "Kh玭g ng ph秈 l祄/nothing")	
		Say(tHeader, getn(tSay), tSay)   
	end
    --if GetTranslifeCount() < 6 and GetTaskTrans() < 38 then
    if GetTask(TSK_CS6_TULINH) < 2 then
    		--Talk(1,"","Чi hi謕 ch璦 l躰h ng? 頲 ph莕 1 c馻 b? k輕 T? Linh Ph鬰 Sinh");		-- check 甼 l躰h ng? ph莕 1 ? npc B綾 u l穙 nh﹏ xong r錳 m韎 l祄 ti誴 ph莕 di
    		return 0
    end

	--if GetTranslifeCount() < 6 and GetTaskTrans() == 39 then		
	if GetTask(TSK_CS6_TULINH) == 3 then
		tinsert(tSay, "Th? th竎h nhi謒 v? T? Linh Ph鬰 Sinh/cs6_npc2_infor1")		
		tinsert(tSay, "Kh玭g ng ph秈 l祄/nothing")	
	elseif GetTask(TSK_CS6_TULINH) == 4 then
		tinsert(tSay, "Th? th竎h nhi謒 v? T? Linh Ph鬰 Sinh/cs6_npc2_infor1")		
		tinsert(tSay, "Kh玭g ng ph秈 l祄/nothing")			
	elseif GetTask(TSK_CS6_TULINH) == 2 then
		tinsert(tSay, "B綾 u l穙 nh﹏ k猽 ta n vi課g th╩ c竎 h?/cs6_infor_talk_1")		
		tinsert(tSay, "Ngi trong giang h? 甶襲 n鉯 c竎 h? 產ng n緈 gi? b? k輕/nothing_do_nothing")
		tinsert(tSay, "Kh玭g ng ph秈 l祄/nothing")	
	end
	
	Say(tHeader, getn(tSay), tSay)   
    
end;
function cs6_infor_talk_1()
 	local szNpcName = "<color=green>Vi猲 Quan Tho竔 Nhi謒<color>: "
	local tSay = {}
	local tHeader = szNpcName.." nh? ta m芻 d? bao i l祄 quan V╪, nh璶g t? xa x璦 c? n鯽 quy觧 s竎h 頲 truy襫 t? i n祔 sang i kh竎 v? 頲 coi l? b秓 v藅 gia truy襫, T? ti猲 n鉯 n鯽 quy觧 s竎h n祔 c? th? g﹜ ch蕁 ng to祅 c鈏 v? l﹎ v? ch? truy襫 th? cho ngi h鱱 duy猲, c? t礽 c? c. Чi hi謕 h穣 l祄 c竎 nhi謒 v?: C鑞g hi課 cho qu鑓 gia, gi誸 y猽 qu竔 v? di謙 qu﹏ x﹎ l╪g"
		
	tinsert(tSay, "Ch蕄 nh薾 th? th竎h/cs6_npc2_infor1")		
	tinsert(tSay, "Kh玭g ng ph秈 l祄/nothing")
	Say(tHeader, getn(tSay), tSay)   
end

function lua_clear()
    ModifyReputation(-50, 0);
    ClearFreeze();  --解封
end;

function nothing_do_nothing()
	Talk(1,"","Th藅 m綾 ci, nh? ta bao i u l祄 quan V╪, u c? luy謓 v? c玭g n猲 l祄 g? c? b? k輕 nh? i hi謕 n鉯 !!!!");
	return 0
end

function vng_ungho(nType)
	local nExp = 39000000
	local tCheck = {
				[1] = {"Hu﹏ Chng JXII", 30502},
				[2] = {"B籲g Khen JXII", 30503},
				[3] = {"蕁 L穘h Th?", 30504},
			}
	local tUngHo_Award = { --kinh nghi謒, ch﹏ kh?, c玭g tr筺g
				[1] = {15000000, 150, 150},
				[2] = {15000000, 150, 150},
				[3] = {39000000, 390, 390},
			}
--	local tBanhIt_Award = {
--					{1, 666, "Thi猲 Th筩h Tinh Th筩h", {2,1,1009,1}},
--					{1, 2000, "M穘h Thi猲 Cang", {2,1,30390, 10}},
--					{1, 1400, "B竛h 輙 ng穒 hng", {2,1,1123,2,4}},
--					{1, 2000, "B竛h 輙 ch﹏ g?", {2,1,1124,2,4}},
--					{1, 1000, "B竛h 輙 b竧 b秓", {2,1,1125,2,4}},					
--					{3, 2934, 100000,1},
--			}	
	if gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,nType) >= 50 then
		Talk(1,"","Чi hi謕  i thng 50 l莕 r錳 !!!");
		return 0;
	end	
	if GetCash() < 100000 then
		Talk(1,"","Чi hi謕 kh玭g mang theo  10 v祅g  i thng");
		return 0;
	end	
	if GetItemCount(2,1,tCheck[nType][2]) < 10 then
		Talk(1,"","Чi hi謕 kh玭g mang theo  nguy猲 li謚 i thng");
		return 0;
	end
	if gf_Judge_Room_Weight(10,200," ") ~= 1 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
		return 0;
	end
	if GetPlayerRebornParam(0) < 1 then
		if  nExp > (2000000000 - GetExp()) then
			Talk(1,"", "C竎 h? kh玭g nh薾 頲 甶觤 kinh nghi謒 v? s? vt qu? 2 t? 甶觤 !!!!")
		end
	end	
	if DelItem(2,1,tCheck[nType][2],10) == 1 and Pay(100000) == 1 then
		gf_SetTaskByte(TSK_EVENT_PHU_MOI_THANG,nType,gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,nType) + 1)
		ModifyExp(tUngHo_Award[nType][1])
		Msg2Player("B筺 nh薾 頲 "..tUngHo_Award[nType][1].." 甶觤 kinh nghi謒")	
		if MeridianGetLevel() >= 1 then
			AwardGenuineQi(tUngHo_Award[nType][2])
		else
			Talk(1,"","Чi hi謕 ch璦 kich ho箃 kinh m筩h n猲 kh玭g th? nh薾 頲 甶觤 ch﹏ kh? !!")
		end
		if GetTask(701) >= 0 then
			SetTask(701,GetTask(701) + tUngHo_Award[nType][3])
		else
			SetTask(701,GetTask(701) - tUngHo_Award[nType][3])
		end		
		Msg2Player("B筺 nh薾 頲 "..tUngHo_Award[nType][3].." 甶觤 c玭g tr筺g?")
		if nType == 1 or nType == 2 then		
			gf_AddItemEx2({2,0,1082,15},"фi thng lo筰 "..nType, "UNG HO BIEN DAO BK","Nh薾 th祅h c玭g T? T籱")
			Msg2Player("B筺 nh薾 頲 15 m秐h Th竔 D辌h H鏽 Nguy猲 C玭g")
		else
			local nAwardRand = mod(random(1,1000),20)
			gf_AddItemEx2({2,1,(30164+nAwardRand),39}, "Item Tr竔 c﹜", "UNG HO BIEN DAO BK", "nh薾 th祅h c玭g")    
		end
		gf_WriteLogEx("UNG HO BIEN DAO", "nh薾 thng th祅h c玭g", 1, "Nh薾 thng lo筰 "..nType)		
	end
end
function vng_ungho_finish()
	local nValue1 = gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,1)
	local nValue2 = gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,2)
	local nValue3 = gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,3)
	local nValue4 = gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,4)
	local nExp = 100000000
	if nValue1 < 50 or nValue2 < 50 or nValue3 < 50 then
		Talk(1,"", "Чi hi謕 ch璦 ho祅 th祅h 駈g h? m鏸 lo筰 50 l莕 n猲 kh玭g th? nh薾 thng !!")
		return 0
	end
	if nValue4 >= 1 then
		Talk(1,"", "Чi hi謕  nh薾 thng r錳 !!")
		return 0
	end
	if gf_Judge_Room_Weight(10,100," ") ~= 1 then
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , vui l遪g s緋 x誴 l筰.")
		return 0;
	end	
	if GetPlayerRebornParam(0) < 1 then
		if  nExp > (2000000000 - GetExp()) then
			Talk(1,"", "C竎 h? kh玭g nh薾 頲 甶觤 kinh nghi謒 v? s? vt qu? 2 t? 甶觤 !!!!")
		end
	end		
	gf_SetTaskByte(TSK_EVENT_PHU_MOI_THANG,4,gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,4) + 1)	
	ModifyExp	(nExp)
	if MeridianGetLevel() >= 1 then
		AwardGenuineQi(10000)
	else
		Talk(1,"","Чi hi謕 ch璦 kich ho箃 kinh m筩h n猲 kh玭g th? nh薾 頲 甶觤 ch﹏ kh? !!")
	end	
	gf_AddItemEx2({2,1,30340,6789},"фi thng lo筰 ho祅 th祅h 50 l莕 ","UNG HO BIEN DAO BK","Nh薾 th祅h c玭g 4 Huy Ho祅g")
	gf_WriteLogEx("UNG HO BIEN DAO", "nh薾 thng th祅h c玭gi", 1, "Nh薾 thng ho祅 th祅h 50 l莕")		
	
end