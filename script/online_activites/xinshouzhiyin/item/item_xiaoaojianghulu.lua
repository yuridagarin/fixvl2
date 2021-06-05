-- Created by TriHM - CÈm nang ho¹t ®éng - 

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\golden_card\\npc_golden_saleman.lua")
Include("\\script\\online\\viet_event\\volambaohap\\head.lua")
Include("\\script\\online_activites\\2010_11\\activity_01\\head.lua")
Include("\\script\\task\\faction_boss\\wulinmeng_teshi.lua")
Include("\\script\\online\\viet_event\\firework_10\\award_csm_5.lua")
Include("\\script\\online_activites\\2011_10\\activity_03\\teacher_day.lua")
Include("\\script\\online_activites\\xinshouzhiyin\\head.lua")
Include("\\script\\online_activites\\201203\\gongli\\gongli.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online_activites\\head\\activity_normal_define.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\online_activites\\2014_01\\spring1.lua") 
Include("\\script\\online_activites\\2014_01\\valentine.lua")
Include("\\script\\online_activites\\2014_01\\spring2.lua") 

szNPCName = "<color=green>Long Hæ Sø<color>: "
TASKTEMP_BHTA9 = 118
tbBangCaoCap = {

}
tbBangSieuCap = {

}

tbNguyenLieuVote = {

}

VET_201203_GONGLI_ID = 59
VET_201302_VALENTINE = 82
--×ðÊ¦ÖØµÀ»î¶¯ID
function OnUse()
	SayPage1()
end

function buy_ttpvoz()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>§Æc sø vâ l©m<color>: Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
		return 0
	end
	if GetCash() < 300000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co tiÒn còng muèn mua µ!");
		return 0
	else
		if Pay(300000) == 1 then
			gf_AddItemEx2({2,0,556,1}, "ThÕ Th©n phï", "Hoat dong thang 5", "mua", 7*60*60)
		else
			return 0
		end
	end
	SayPage1()
end

function buy_tktvoz()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>§Æc sø vâ l©m<color>: Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
		return 0
	end
	if GetCash() < 50000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co tiÒn còng muèn mua µ!");
		return 0
	else
		if Pay(50000) == 1 then
			gf_AddItemEx2({2,0,141,1}, "Tiªu kiÕp t¸n", "Tieu Ngao GH", "mua", 7*60*60)
		else
			return 0
		end
	end
	SayPage1()
end

function buy_bnl()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>§Æc sø vâ l©m<color>: Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
		return 0
	end
	if GetCash() < 300000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co tiÒn còng muèn mua µ!");
		return 0
	else
		if Pay(300000) == 1 then
			gf_AddItemEx2({2,0,398,1}, "Bat nha lon", "Tieu Ngao GH", "mua", 7*60*60)
		else
			return 0
		end
	end
	SayPage1()
end

function buy_tlbt()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>§Æc sø vâ l©m<color>: Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
		return 0
	end
	if GetCash() < 500000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co tiÒn còng muèn mua µ!");
		return 0
	else
		if Pay(500000) == 1 then
			gf_AddItemEx2({2,1,533,1}, "Tinh luyen bang thach", "Tieu Ngao GH", "mua", 7*60*60)
		else
			return 0
		end
	end
	SayPage1()
end

function buy_thdmq()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>§Æc sø vâ l©m<color>: Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
		return 0
	end
	if GetCash() < 3000000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co tiÒn còng muèn mua µ!");
		return 0
	else
		if Pay(3000000) == 1 then
			gf_AddItemEx2({2,1,387,1}, "Thai hu da mat qua", "Tieu Ngao GH", "mua", 7*60*60)
		else
			return 0
		end
	end
	SayPage1()
end

function buy_thbd()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>§Æc sø vâ l©m<color>: Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
		return 0
	end
	if GetCash() < 1500000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co tiÒn còng muèn mua µ!");
		return 0
	else
		if Pay(1500000) == 1 then
			gf_AddItemEx2({0,200,40,1}, "Than hanh", "Tieu Ngao GH", "mua", 30*24*60*60)
		else
			return 0
		end
	end
	SayPage1()
end

function buy_sotaysong()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>§Æc sø vâ l©m<color>: Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
		return 0
	end
	if GetCash() < 200000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co tiÒn còng muèn mua µ!");
		return 0
	else
		if Pay(200000) == 1 then
			AddItem(2, 19, 1,1 , 4);
		else
			return 0
		end
	end
	SayPage1()
end

function vang_voz()
	if GetCash() < 10000000 then
		Earn(10000000 - GetCash());
	end;
end
function danhvong_voz()
	SetTask(336, 15000);				--Cèng hiÕn s­ m«n
	ModifyReputation(15000, 0);			--Danh vong
end
function SayPage1()

	local nDate = tonumber(date("%y%m%d"))
	local nHour = tonumber(date("%H%M"))
	local tSay = {}

	local szHeader = "Vâ l©m lôc quyÓn, ghi l¹i mäi sù biÕn ®éng trªn giang hå. TiÕu ng¹o phiªu du, tù do tù t¹i!"
 	 tSay  = get_tbJNDialog_info(VET_XA_ACTIVITY_TABLE);
	-----------
	if gf_CheckEventDateEx(VET_201401_SPRING1_ACTIVITYID) ==  1 then
		tinsert(tSay,VET_201401_SPRING1_MAIN);
	end
	if gf_CheckEventDateEx(VET_201401_VALENTINE_ACTIVITYID) ==  1 then
		tinsert(tSay,VET_201401_VALENTINE_MAIN);
	end
	if gf_CheckEventDateEx(VET_201401_SPRING2_ACTIVITYID) ==  1 then
		tinsert(tSay,VET_201401_SPRING2_MAIN);
	end
	---------
	if gf_CheckEventDateEx(VET_201203_GONGLI_ID) == 1 then
		tinsert(tSay,VET_201203_KuiZheng_tbMain)
	end	
--	tinsert(tSay, "Tham gia tÝnh n¨ng Vâ L©m B¶o H¹p/vlbh_active")
	if GetGlbValue(1023) == 80 and nDate <= 130811 then
		tinsert(tSay,"Hç trî C«n L«n §iÖn/VLBH_HotroConLon")
	end

	tinsert(tSay, "Ta muèn nhËn th­ëng ®iÓm ch©n khÝ khi sö dông ch×a khãa vµng trong tuÇn(tiªu hao Xu vËt phÈm)/get_chankhi")	
	tinsert(tSay,"Mua 10 Lé Thñy = 1 vµng/BuyWater")
	tinsert(tSay, "Mua thuèc trÞ bÖnh/NT_Dialog2")
	tinsert(tSay,"Ta muèn mua mÆt n¹ S¸t Thñ §­êng (60 vµng)/buy_mask")
	tinsert(tSay,"Ta muèn mua ThÕ Th©n Phï (30 vµng)/buy_ttpvoz")
	tinsert(tSay,"Ta muèn mua Tiªu KiÕp T¸n (10 vµng)/buy_tktvoz")
	tinsert(tSay,"Ta muèn mua B¸t nh· lín (30 vµng)/buy_bnl")
	tinsert(tSay,"Ta muèn mua Tinh luyÖn b¨ng th¹ch (50 vµng)/buy_tlbt")
	tinsert(tSay,"Ta muèn mua Th¸i h­ ®a mËt qu¶ (100 vµng)/buy_thdmq")
	tinsert(tSay,"Ta muèn mua ThÇn hµnh b¶o ®iÓn  (150 vµng)/buy_thbd")
--	tinsert(tSay,"Ta muèn mua Sæ tay sèng (20 vµng)/buy_sotaysong")
--	tinsert(tSay, "NhËn 1000v/vang_voz")
--	tinsert(tSay, "NhËn 15k dv va sm/danhvong_voz")	
--	tinsert(tSay, "NhËn L­u Ph¸i Ch©n QuyÓn vµ QuyÕt YÕu/Get_Book")	
--	tinsert(tSay, "NhËn ®¸ quý VIP/Get_Gem")	
--	tinsert(tSay, "Kü n¨ng sèng/Life_Skill")	
--	tinsert(tSay, "Thang cap 99/SetVozLevel")	
--	tinsert(tSay, "Nhan The GM/nhanthegm")	
	
--	tinsert(tSay,"§æi vËt phÈm C«ng Thµnh/exchange_citywar")
--	tinsert(tSay,"Chuéc l¹i qu©n c«ng tæn thÊt trong ngµy (1 ®iÓm = 2 b¹c)/take_jungong_back")
	
--	tinsert(tSay, "Ta muèn nhËn nhiÖm vô TiÕu Ng¹o Giang Hå!/accept_tngh_task")	
--	tinsert(tSay, "T¹i h¹ muèn mua 1 Hoµng Kim LÖnh Bµi/get_golden_card")	
--	if nDate >= 110705 and nDate <= 110805 then
--		tinsert(tSay, "NhËn th­ëng ch­¬ng tr×nh CSM 5.0/award_CSM5")
--	end
	-- NhËn th­ëng TTGC
--	if nDate >= 111213 and nDate <= 120102 then
--		tinsert(tSay, "NhËn th­ëng ThÇn Tµi Gâ Cöa/GiveAwardTTGS")
--	end	
---------------	
--	if nDate >= 121012 then
		--if (nHour >= 0800 and nHour <= 1000) or (nHour >= 1530 and nHour <= 1730) or (nHour >= 2000 and nHour <= 2200) then
			--tinsert(tSay, "NhËn Vâ L©m B¶o H¹p/Rec_VLBH")
			--tinsert(tSay, "NhËn Vâ L©m B¶o H¹p tiÖn lîi (20 c¸i - tiªu hao 20 vµng)/Rec_VLBH_2")
		--end
--	end
--	if nDate >= 120120 and nDate <= 120122 and GetGlbValue(GLB_TSK_SERVER_ID) == 70 then
--		tinsert(tSay, "NhËn ®Òn bï ®iÓm kinh nghiÖm m¸y chñ Thµnh Long/award_give_500_mil")
--	end	
--	tinsert(tSay,"Ta muèn ®æi 1 M¶nh B¹ch Kim (tiªu hao 1 ch×a khãa Vµng + 599 vµng)/#exchang_Item(1)")
--	tinsert(tSay,"Ta muèn ®æi 4 M¶nh B¹ch Kim (tiªu hao 1 ThÇn Tµi B¶o R­¬ng + 199 vµng/#exchang_Item(2)")	
--	if nDate >= 111111 and nDate <= 111212 then
--		tinsert(tSay,VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[153].."/check_onlinetime")
--		tinsert(tSay,VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[154].."/exchang_chip")
--		tinsert(tSay,VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[155].."/exchang_zhienbaoxiang")
--	end
--	if gf_CheckEventDateEx(VET_201302_VALENTINE) == 1 then
--		tinsert(tSay,"Event LÔ T×nh Nh©n/get_tinhnhan")
--	end	
	tinsert(tSay, "T¹i h¹ sÏ quay l¹i sau/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end
function nhanthegm()
	if GetItemCount(2,1,30644) < 1 and GetFreeItemRoom() > 0 then
    		AddItem(2,1,30644,1);
    	end
end
function SetVozLevel()
	SetLevel(99, 1);	
	PlaySound("\\sound\\sound_i016.wav");
	Msg2Player("Thao t¸c thµnh c«ng, h·y ®¨ng nhËp l¹i")
	SaveNow()
	Talk(1,"ExitGame","Thao t¸c thµnh c«ng, h·y ®¨ng nhËp l¹i")	
end
function Get_Book()
	local szSay = {
		g_szTitle.."NhËn L­u Ph¸i Ch©n QuyÓn vµ QuyÕt YÕu!",
		"NhËn Ch©n QuyÓn/Get_Book_ZhenJuan",
		"NhËn QuyÕt YÕu/Get_Book_JueYao",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end


function Get_Book_ZhenJuan()
	if gf_Judge_Room_Weight(7, 1, g_szTitle) ~= 1 then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	
	if nRoute == 2 then
		AddItem(0, 107, 30018,5)
		AddItem(0, 107, 30018-38,5)
	end
	
		if nRoute == 3 then
		AddItem(0, 107, 30020,5)
		AddItem(0, 107, 30020-38,5)
	end
	
		if nRoute == 4 then
		AddItem(0, 107, 30019,5)
		AddItem(0, 107, 30019-38,5)
	end
	
		if nRoute == 6 then
		AddItem(0, 107, 30021,5)
		AddItem(0, 107, 30021-38,5)
	end
	
		if nRoute == 8 then
		AddItem(0, 107, 30022,5)
		AddItem(0, 107, 30022-38,5)
	end
	
		if nRoute == 9 then
		AddItem(0, 107, 30023,5)
		AddItem(0, 107, 30023-38,5)
	end
	
		if nRoute == 11 then
		AddItem(0, 107, 30024,5)
		AddItem(0, 107, 30024-38,5)
	end
	
		if nRoute == 12 then
		AddItem(0, 107, 30025,5)
		AddItem(0, 107, 30025-38,5)
	end
	
		if nRoute == 14 then
		AddItem(0, 107, 30026,5)
		AddItem(0, 107, 30026-38,5)
	end
	
		if nRoute == 15 then
		AddItem(0, 107, 30027,5)
		AddItem(0, 107, 30027-38,5)
	end
	
		if nRoute == 17 then
		AddItem(0, 107, 30028,5)
		AddItem(0, 107, 30028-38,5)
	end
	
		if nRoute == 18 then
		AddItem(0, 107, 30029,5)
		AddItem(0, 107, 30029-38,5)
	end
	
		if nRoute == 20 then
		AddItem(0, 107, 30030,5)
		AddItem(0, 107, 30030-38,5)
	end
	
			if nRoute == 21 then
		AddItem(0, 107, 30031,5)
		AddItem(0, 107, 30031-38,5)
	end
	
	if nRoute == 23 then--À¥ÂØÌìÊ¦
		AddItem(0, 107, 30032,5)
		AddItem(0, 107, 30032-20,5)
	end
	
	if nRoute == 29 then--ÎèÏÉ
		AddItem(0, 107, 30033,5)
	  AddItem(0, 107, 30033-20,5)
	end
	
	if nRoute == 30 then--ÁéÅ®
		AddItem(0, 107, 30034,5)
		AddItem(0, 107, 30034-20,5)
	end
	
	gf_AddItemEx({0, 112, 158,	1, 4}, "L¨ng Ba Vi Bé toµn tËp");
end

function Get_Book_JueYao()
	local tJue ={
		[2]		={1,10},
		[3]		={21,31},
		[4]		={11,20},
		[6]		={32,46},
		[8]		={47,59},
		[9]		={60,70},
		[11]	={71,79},
		[12]	={80,88},
		[14]	={89,108},
		[15]	={109,119},
		[17]	={120,130},
		[18]	={131,141},
		[20]	={142,154},
		[21]	={155,168},
		[23]	={169,182},
		[25]	={183,194},
		[26]	={195,206},
		[27]	={207,218},
		[29]	={219,229},
		[30]	={230,240},
	};

	local nRoute = GetPlayerRoute()
	if 1 ~= gf_CheckPlayerRoute() then
		return 0;
	end

	if 1 ~= gf_Judge_Room_Weight((tJue[nRoute][2] - tJue[nRoute][1] + 1), 1, g_szTitle) then
		return 0;
	end

	for i = tJue[nRoute][1],tJue[nRoute][2] do
		gf_AddItemEx({2, 6, i, 1, 4}, "QuyÕt YÕu");
	end
end


function get_chankhi()
	local tSay = {}
	local szHeader = "NhËn th­ëng ®iÓm Ch©n KhÝ khi sö dông Ch×a Khãa Vµng (<color=green>Quý ®ång ®¹o chØ ®­îc nhËn 1 lÇn trong tuÇn.<color>)"
	
	--tinsert(tSay, "Sö dông 5-9 ch×a khãa nhËn 600 ®iÓm ch©n khÝ (tiªu hao 33 Xu vËt phÈm)/#confirm_get_chankhi(1)")
	--tinsert(tSay, "Sö dông 10-14 ch×a khãa nhËn 1200 ®iÓm ch©n khÝ (tiªu hao 66 Xu vËt phÈm)/#confirm_get_chankhi(2)")
	tinsert(tSay, "Sö dông 15 ch×a khãa nhËn 2500 ®iÓm ch©n khÝ (tiªu hao 99 Xu vËt phÈm)/#confirm_get_chankhi(3)")
	tinsert(tSay, "T¹i h¹ sÏ quay l¹i sau/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function accept_tngh_task()
	Talk(1, "", "NhiÖm vô nµy sÏ më trong thêi gian s¾p tíi, c¸c h¹ vui lßng quay trë l¹i sau!")
	return
end

function BuyWater()
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		return
	end
	if Pay(10000) == 0 then
		Talk(1, "OnUse", "Ng©n l­îng cña b¹n kh«ng ®ñ!");
		return
	end
		
	gf_AddItemEx({2, 0, 351, 10}, "Lé thñy")
	SayPage1()
end

function exchange_citywar()
	local tSay = {
		"§æi 8 Dòng SÜ LÖnh (cÇn 1 Th­ tiÕn cö)/exchange_warriorling",
		"§æi 6 C«ng thµnh Tiªn Phong (cÇn 1 Th­ tiÕn cö)/exchange_citywarling",
		"KÕt thóc ®èi tho¹i/do_nothing",
	}
	Say("C¸c h¹ muèn ®æi vËt phÈm nµo?",getn(tSay),tSay)
end

function exchange_warriorling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"","C¸c h¹ h×nh nh­ kh«ng mang Th­ tiÕn cö trªn ng­êi?")
		return
	end
	
	if gf_Judge_Room_Weight(8, 100, " ") == 0 then
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1201,8,1)
		Msg2Player("B¹n nhËn ®­îc 8 Dòng SÜ LÖnh.")
		WriteLogEx("Cong Thanh Chien","nhËn",8,"Dòng SÜ LÖnh","",GetTongName())
	end
end

function exchange_citywarling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"","C¸c h¹ h×nh nh­ kh«ng mang Th­ tiÕn cö trªn ng­êi?")				
		return
	end
	
	if gf_Judge_Room_Weight(6, 100, " ") == 0 then
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1203,6,1)
		Msg2Player("B¹n nhËn ®­îc 6 C«ng thµnh Tiªn Phong LÖnh.")
		WriteLogEx("Cong Thanh Chien","nhËn",6,"C«ng thµnh Tiªn Phong LÖnh","",GetTongName())
	end
end

function take_jungong_back()
	local nDay = tonumber(date("%w%H"))
	if nDay >= 620 and nDay <= 624 then
		Say("Tõ 20:00 - 24:00 thø 7 kh«ng thÓ chuéc l¹i qu©n c«ng!",0)
		return
	end
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TSK_JUNGONG_PUNISH_DATE) ~= nDate then
		SetTask(TSK_JUNGONG_PUNISH_DATE,nDate)
		SetTask(TSK_JUNGONG_PUNISH,0)
		SetTask(TSK_JUNGONG_LIMIT,0)
		Msg2Player("Qu©n c«ng cã thÓ chuéc ngµy h«m qua ®· hñy bá.")
	end	
	local nLoseJungong = abs(GetTask(TSK_JUNGONG_PUNISH))	
	if nLoseJungong == 0 then
		Say("C¸c h¹ kh«ng cã ®iÓm qu©n c«ng tæn thÊt!",0)
		return
	end	
	if GetTask(TSK_JUNGONG_LIMIT) >= 50000 then
		Say("§iÓm qu©n c«ng chuéc l¹i trong ngµy ®· ®¹t møc giíi h¹n 50000.",0)
		return
	end
	local nMustPay =nLoseJungong * 200
	local strMoney = gf_GetMoneyString(nMustPay)	
	Say("H«m nay c¸c h¹ cã <color=yellow>"..nLoseJungong.."<color> ®iÓm qu©n c«ng bÞ tæn thÊt. CÇn ph¶i cã <color=yellow>"..strMoney.."<color> ®Ó chuéc l¹i sè ®iÓm nµy. C¸c h¹ cã muèn chuéc? <color=red>L­u ý: nÕu c¸c h¹ chuyÓn c«ng tr¹ng tr­íc khi chuéc, qu©n c«ng hiÖn t¹i cña c¸c h¹ sÏ bÞ trõ.<color>",2,"Ta ®ång ý/take_jungong_back_confirm","Kh«ng cÇn/nothing")
end

function take_jungong_back_confirm()
	local nDay = tonumber(date("%w%H"))
	if nDay >= 620 and nDay <= 624 then
		Say("Tõ 20:00 - 24:00 thø 7 kh«ng thÓ chuéc l¹i qu©n c«ng!",0)
		return
	end
	local nLoseJungong = abs(GetTask(TSK_JUNGONG_PUNISH))	
	if nLoseJungong == 0 then
		Say("C¸c h¹ kh«ng cã ®iÓm qu©n c«ng tæn thÊt!",0)
		return
	end	
	local nMustPay =nLoseJungong * 200	
	if GetCash() < nMustPay then
		Say("Sè tiÒn c¸c h¹ mang theo kh«ng ®ñ!",0)
		return
	end
	if Pay(nMustPay) == 1 then
		SetTask(701, GetTask(701) + GetTask(TSK_JUNGONG_PUNISH))
		SetTask(TSK_JUNGONG_PUNISH,0)
		SetTask(TSK_JUNGONG_LIMIT, GetTask(TSK_JUNGONG_LIMIT) + nLoseJungong)
		Say("C¸c h¹ ®· nhËn l¹i ®iÓm qu©n c«ng tæn thÊt thµnh c«ng!",0)
		WriteLogEx("Chuoc Quan Cong","nhËn", nLoseJungong,"®iÓm qu©n c«ng")
	end
end

function vlbh_active()
	local nWeekDay = tonumber(date("%w"))
	local nHour = tonumber(date("%H%M"))
--	if GetLevel() < 79 then
--		Talk(1, "", "§¼ng cÊp 79 trë lªn míi cã thÓ sö dông chøc n¨ng nµy!")
--		return
--	end
--	if gf_Check55MaxSkill() == 0 then
--		Talk(1,"","Max Skill 55 míi cã thÓ tham gia ho¹t ®éng  ")
--		return
--	end
	local tSay = {}
	local szHeader = "Ho¹t ®éng Vâ L©m B¶o H¹p!"
	--if (nHour >= 0800 and nHour <= 1000) or (nHour >= 1530 and nHour <= 1730) or (nHour >= 2000 and nHour <= 2200) then
		tinsert(tSay, "NhËn Vâ L©m B¶o H¹p/Rec_VLBH")
		--tinsert(tSay, "NhËn Vâ L©m B¶o H¹p/CloseFeature")
		tinsert(tSay, "Dïng vµng ®æi c¸c lo¹i ch×a khãa/vlbh_exchange_key_gold")
		tinsert(tSay, "Dïng xu vËt phÈm ®æi c¸c lo¹i ch×a khãa/vlbh_exchange_key_xu")
		tinsert(tSay, "NhËn th­ëng c¸c lo¹i ch×a khãa/vlbh_receive_key_prize")

		tinsert(tSay, "T¹i h¹ sÏ quay l¹i sau/do_nothing")
	--else
		--Talk(1,"","Ch­a ®Õn giê nhËn b¶o h¹p, c¸c h¹ vui lßng quay l¹i sau");
		--return
	--end
--	tinsert(tSay, "Shop ch×a khãa vµng/gold_key_shop")	

	Say(szHeader, getn(tSay), tSay)
end
function CloseFeature()
	Talk(1, "", "TÝnh n¨ng Vâ L©m B¶o H¹p ®ang t¹m ®ãng, ®¹i hiÖp h·y quay l¹i sau !!!")
end

-- NhËn th­ëng thÇn tµi gâ cöa
function GiveAwardTTGS()
	if gf_GetExtPointByte(1,1) <= 0 then
		Talk(1,"","§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi hoÆc kh«ng cã trong danh s¸ch nhËn th­ëng!")
		return
	end 
	if  gf_GetExtPointByte(1,1) == 1 then
		if gf_SetExtPointByte(1, 1, 0) == 1 then
			gf_AddItemEx2({2,1,1067,1,1}, "§Þnh Hån Thiªn Th¹ch", "Phan thuong TTGC", "nhËn", 7*24*60*60)
		end
	elseif gf_GetExtPointByte(1,1) == 2 then
		if gf_SetExtPointByte(1, 1, 0) == 1 then
			gf_AddItemEx2({0,112,78,1,1}, "L¨ng Ba Vi Bé", "Phan thuong TTGC", "nhËn")
		end
	else
		Talk(1, "", " §¹i hiÖp ®· nhËn phÇn th­ëng nµy råi hoÆc kh«ng cã trong danh s¸ch nhËn th­ëng!")
		return
	end
end

function award_give_500_mil()
	tbDenBuThanhLong = {
		[1] = "nhocksockkuto1994",
		[2] = "katsumi1990",
	}
	
	if GetExtPoint(0) ~= 0 then
		Talk(1, "", "§¹i hiÖp ®· nhËn ®Òn bï råi, kh«ng thÓ nhËn thªm!")
		return
	end
	
	local nCheck = 0
	for i = 1, getn(tbDenBuThanhLong) do
		if GetAccount() == tbDenBuThanhLong[i] then
			nCheck = 1
			break
		end
	end
	
	if nCheck == 0 then
		Talk(1, "", "§¹i hiÖp kh«ng cã trong danh s¸ch nhËn th­ëng!")
		return
	end
	
	if GetExp() >= 1500000000 then
		Talk(1, "", "§¹i hiÖp cã ®iÓm kinh nghiÖm tån ®äng nhiÒu h¬n 1500000000, kh«ng thÓ nhËn th­ëng!")
		return
	end

	if GetExtPoint(0) == 0 then
		AddExtPoint(0,1)
		ModifyExp(500000000)
		Msg2Player("B¹n nhËn ®­îc ®Òn bï 500 triÖu ®iÓm kinh nghiÖm!")
		WriteLogEx("Den bu Thanh Long 2012", "nhËn ®Òn bï")
	end
end

function exchang_Item(nType)
	local tbItem = {
				[1] = {1, 0, " Ch×a khãa Vµng", 599, {2, 1, 30346, 1}, "M¶nh B¹ch Kim", 30133, "MBK= key vµng 20/7", 1},
				[2] = {0, 1, " ThÇn Tµi B¶o R­¬ng", 199, {2, 1, 30346, 4}, "M¶nh B¹ch Kim", 30344, "MBK = TTBR 20/7", 4},
			}
	if GetCash() < tbItem[nType][4] * 10000 then
		Talk(1,"","B¹n kh«ng mang ®ñ vµng ®Ó ®æi!!!")
		return 0
	end			
	if GetItemCount(2,1,30133) < tbItem[nType][1] then
		Talk(1,"","B¹n kh«ng mang theo ®ñ "..tbItem[nType][1]..tbItem[1][3])
		return 0
	end			
	if GetItemCount(2,1,30344) < tbItem[nType][2] then
		Talk(1,"","B¹n kh«ng mang theo ®ñ "..tbItem[nType][2]..tbItem[2][3])
		return 0
	end				
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","Hµnh trang cña b¹n kh«ng ®ñ chç trèng!!!")
        	return 0
	end		
	if DelItem(2,1,tbItem[nType][7],1) == 1 and Pay(tbItem[nType][4] * 10000) == 1 then
		gf_AddItemEx2(tbItem[nType][5], tbItem[nType][8], "DOI MANH BACH KIM", "®æi thµnh c«ng")
		Msg2Player("B¹n nhËn ®­îc "..tbItem[nType][9]..tbItem[nType][6])
	end	
end
function confirm_get_chankhi(nType)
	local tbCheck = {
				[1] = {5, 33, 600},
				[2] = {10, 66, 1200},
				[3] = {15, 99, 2500},
			}
	if floor(GetTask(TSK_VLBH_QI)/100) >= 1 then
		Talk(1,"","B¹n ®· nhËn phÇn th­ëng tuÇn nµy råi, nªn kh«ng thÓ nhËn th­ëng ®­îc n÷a !!!")
		return 0		
	end
	if MeridianGetLevel() <= 0 then
		Talk(1,"","B¹n ch­a kÝch ho¹t kinh m¹ch nªn kh«ng thÓ nhËn th­ëng !!!")
		return 0
	end
	local nNumUse = mod(GetTask(TSK_VLBH_QI), 100)
	if nNumUse <tbCheck[nType][1] then
		Talk(1,"","B¹n ch­a sö dông ®ñ sè l­îng ch×a khãa vµng nªn kh«ng thÓ nhËn th­ëng !!!")
		return 0
	end

	if GetItemCount(2,1,30230) < tbCheck[nType][2] then
		Talk(1,"","B¹n kh«ng mang theo ®ñ "..tbCheck[nType][2].." xu vËt phÈm ®Ó nhËn th­ëng !!!")
		return 0
	end		
	SetTask(TSK_VLBH_QI, GetTask(TSK_VLBH_QI) + 100)
	if DelItem(2,1,30230,tbCheck[nType][2]) == 1 then
		AwardGenuineQi(tbCheck[nType][3])
	end
	gf_WriteLogEx("Vo Lam Bao Hap", "nhËn  thµnh c«ng", 1, "PhÇn th­ëng ch©n khÝ 20/7")
	WriteLogEx("LOG XU VAT PHAM","Sö dông CKV, tiªu hao 99 xu nhËn 2k5 ch©n khÝ")
end

function get_tinhnhan()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt c¸c ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."
	--tbSayDialog, szSayHead = get_tbJNDialog_info(VET_XA_ACTIVITY_TABLE)
   	tinsert(tbSayDialog,"§æi 1 Socola t×nh nh©n (5 H¹t cacao + 2 Xu vËt phÈm)/VNG_DoiEventThang2_Form1")
   	tinsert(tbSayDialog,"§æi 1 Socola t×nh nh©n (5 H¹t cacao + 1 S÷a tinh luyÖn)/VNG_DoiEventThang2_Form2")
   	tinsert(tbSayDialog,"KiÓm tra sè l­îng Socola ®· sö dông/ncheck_number_use"	)
   	tinsert(tbSayDialog,"NhËn phÇn th­ëng cuèi sö dông Socola/get_final_socola"	)
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/do_nothing"	)
	nSaySize = getn(tbSayDialog);	
	Say(szSayHead, nSaySize, tbSayDialog);
end
function get_final_socola()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt c¸c ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."	
	tinsert(tbSayDialog,"NhËn th­ëng 2 thiªn m«n kim lÖnh/#confirm_get_final_socola(1)")
   	tinsert(tbSayDialog,"NhËn th­ëng 300 triÖu ®iÓm kinh nghiÖm/#confirm_get_final_socola(2)")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/do_nothing"	)
	nSaySize = getn(tbSayDialog);	
	Say(szSayHead, nSaySize, tbSayDialog);
end
function confirm_get_final_socola(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	if gf_Judge_Room_Weight(2, 50," ") ~= 1 then
        	return
    end
    if GetTask(2763) == 1 then
    		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng cuèi råi!!!")
    		return
    end   
    if GetTask(2764) < 1402 then
    		Talk(1, "", "§¹i hiÖp ch­a sö dông ®ñ 1402 vËt phÈm Valentine!!!")
    		return
    end
    SetTask(2763,1)
    if nType == 1 then
    		gf_AddItemEx2({2,1,30370,2}, "Thiªn M«n Kim LÖnh", "VALENTINE 2013", "PhÇn th­ëng cuèi Socola Thiªn M«n Kim LÖnh", 0, 1);
    	else
    		ModifyExp(300000000)
    		gf_WriteLogEx("VALENTINE 2013", "nhËn  thµnh c«ng", 1, "PhÇn th­ëng cuèi Socola exp")
    	end
    
end
function VNG_DoiEventThang2_Form1()
	AskClientForNumber("VNG_DoiEventThang2_Socola1", 1, 999, "Sè l­îng (1-999)")
end
function VNG_DoiEventThang2_Socola1(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if GetItemCount(2,1,30357) < (5 * nCount ) or GetItemCount(2,1,30230) < (2 * nCount)  then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn ®æi.");
		return 0;
	end
	if DelItem(2,1,30357, 5 * nCount) == 1 and DelItem(2,1,30230, 2 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30495, nCount}, "Socola", "VALENTINE 2013" , "nhËn")
	end
end
function VNG_DoiEventThang2_Form2()
	AskClientForNumber("VNG_DoiEventThang2_Socola2", 1, 20, "Sè l­îng (1-20)")
end
function VNG_DoiEventThang2_Socola2(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
		return 0;
	end
	if GetItemCount(2,1,30357) < (5 * nCount ) or GetItemCount(2,1,30477) < (1 * nCount)  then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn ®æi.");
		return 0;
	end
	if DelItem(2,1,30357, 5 * nCount) == 1 and DelItem(2,1,30477, 1 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30495, nCount}, "Socola", "VALENTINE 2013" , "nhËn")
	end
end
function ncheck_number_use()
	local nUse = GetTask(2764)
	Talk(1, "", "Sè lÇn sö dông Socola hiÖn t¹i lµ : "..nUse.."/10000");
end


function VLBH_HotroConLon()
	local tbSay = {}
	tinsert(tbSay,"NhËn 900 Vâ L©m B¶o H¹p (tiªu hao 21 xu vËt phÈm)/#HoTroVLBH(1)")
	tinsert(tbSay,"NhËn 900 Vâ L©m B¶o H¹p (tiªu hao 66 vµng)/#HoTroVLBH(2)")
	tinsert(tbSay,"Ta ch­a muèn nhËn b©y giê/gf_DoNothing")
	Say("ChØ cÇn tèn Ýt thï lao, c¸c h¹ sÏ nhËn ®­îc nhiÒu hç trî...", getn(tbSay), tbSay)
end


function do_nothing()
	
end