-- Created by TriHM - C�m nang ho�t ��ng - 

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

szNPCName = "<color=green>Long H� S�<color>: "
TASKTEMP_BHTA9 = 118
tbBangCaoCap = {

}
tbBangSieuCap = {

}

tbNguyenLieuVote = {

}

VET_201203_GONGLI_ID = 59
VET_201302_VALENTINE = 82
--��ʦ�ص��ID
function OnUse()
	SayPage1()
end

function buy_ttpvoz()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>��c s� v� l�m<color>: Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0
	end
	if GetCash() < 300000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co ti�n c�ng mu�n mua �!");
		return 0
	else
		if Pay(300000) == 1 then
			gf_AddItemEx2({2,0,556,1}, "Th� Th�n ph�", "Hoat dong thang 5", "mua", 7*60*60)
		else
			return 0
		end
	end
	SayPage1()
end

function buy_tktvoz()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>��c s� v� l�m<color>: Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0
	end
	if GetCash() < 50000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co ti�n c�ng mu�n mua �!");
		return 0
	else
		if Pay(50000) == 1 then
			gf_AddItemEx2({2,0,141,1}, "Ti�u ki�p t�n", "Tieu Ngao GH", "mua", 7*60*60)
		else
			return 0
		end
	end
	SayPage1()
end

function buy_bnl()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>��c s� v� l�m<color>: Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0
	end
	if GetCash() < 300000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co ti�n c�ng mu�n mua �!");
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
		Talk(1,"","<color=green>��c s� v� l�m<color>: Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0
	end
	if GetCash() < 500000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co ti�n c�ng mu�n mua �!");
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
		Talk(1,"","<color=green>��c s� v� l�m<color>: Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0
	end
	if GetCash() < 3000000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co ti�n c�ng mu�n mua �!");
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
		Talk(1,"","<color=green>��c s� v� l�m<color>: Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0
	end
	if GetCash() < 1500000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co ti�n c�ng mu�n mua �!");
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
		Talk(1,"","<color=green>��c s� v� l�m<color>: Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0
	end
	if GetCash() < 200000 then
		Talk(1,"","<color=green>Dac Su Vo Lam<color>:Nguoi khong co ti�n c�ng mu�n mua �!");
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
	SetTask(336, 15000);				--C�ng hi�n s� m�n
	ModifyReputation(15000, 0);			--Danh vong
end
function SayPage1()

	local nDate = tonumber(date("%y%m%d"))
	local nHour = tonumber(date("%H%M"))
	local tSay = {}

	local szHeader = "V� l�m l�c quy�n, ghi l�i m�i s� bi�n ��ng tr�n giang h�. Ti�u ng�o phi�u du, t� do t� t�i!"
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
--	tinsert(tSay, "Tham gia t�nh n�ng V� L�m B�o H�p/vlbh_active")
	if GetGlbValue(1023) == 80 and nDate <= 130811 then
		tinsert(tSay,"H� tr� C�n L�n �i�n/VLBH_HotroConLon")
	end

	tinsert(tSay, "Ta mu�n nh�n th��ng �i�m ch�n kh� khi s� d�ng ch�a kh�a v�ng trong tu�n(ti�u hao Xu v�t ph�m)/get_chankhi")	
	tinsert(tSay,"Mua 10 L� Th�y = 1 v�ng/BuyWater")
	tinsert(tSay, "Mua thu�c tr� b�nh/NT_Dialog2")
	tinsert(tSay,"Ta mu�n mua m�t n� S�t Th� ���ng (60 v�ng)/buy_mask")
	tinsert(tSay,"Ta mu�n mua Th� Th�n Ph� (30 v�ng)/buy_ttpvoz")
	tinsert(tSay,"Ta mu�n mua Ti�u Ki�p T�n (10 v�ng)/buy_tktvoz")
	tinsert(tSay,"Ta mu�n mua B�t nh� l�n (30 v�ng)/buy_bnl")
	tinsert(tSay,"Ta mu�n mua Tinh luy�n b�ng th�ch (50 v�ng)/buy_tlbt")
	tinsert(tSay,"Ta mu�n mua Th�i h� �a m�t qu� (100 v�ng)/buy_thdmq")
	tinsert(tSay,"Ta mu�n mua Th�n h�nh b�o �i�n  (150 v�ng)/buy_thbd")
--	tinsert(tSay,"Ta mu�n mua S� tay s�ng (20 v�ng)/buy_sotaysong")
--	tinsert(tSay, "Nh�n 1000v/vang_voz")
--	tinsert(tSay, "Nh�n 15k dv va sm/danhvong_voz")	
--	tinsert(tSay, "Nh�n L�u Ph�i Ch�n Quy�n v� Quy�t Y�u/Get_Book")	
--	tinsert(tSay, "Nh�n �� qu� VIP/Get_Gem")	
--	tinsert(tSay, "K� n�ng s�ng/Life_Skill")	
--	tinsert(tSay, "Thang cap 99/SetVozLevel")	
--	tinsert(tSay, "Nhan The GM/nhanthegm")	
	
--	tinsert(tSay,"��i v�t ph�m C�ng Th�nh/exchange_citywar")
--	tinsert(tSay,"Chu�c l�i qu�n c�ng t�n th�t trong ng�y (1 �i�m = 2 b�c)/take_jungong_back")
	
--	tinsert(tSay, "Ta mu�n nh�n nhi�m v� Ti�u Ng�o Giang H�!/accept_tngh_task")	
--	tinsert(tSay, "T�i h� mu�n mua 1 Ho�ng Kim L�nh B�i/get_golden_card")	
--	if nDate >= 110705 and nDate <= 110805 then
--		tinsert(tSay, "Nh�n th��ng ch��ng tr�nh CSM 5.0/award_CSM5")
--	end
	-- Nh�n th��ng TTGC
--	if nDate >= 111213 and nDate <= 120102 then
--		tinsert(tSay, "Nh�n th��ng Th�n T�i G� C�a/GiveAwardTTGS")
--	end	
---------------	
--	if nDate >= 121012 then
		--if (nHour >= 0800 and nHour <= 1000) or (nHour >= 1530 and nHour <= 1730) or (nHour >= 2000 and nHour <= 2200) then
			--tinsert(tSay, "Nh�n V� L�m B�o H�p/Rec_VLBH")
			--tinsert(tSay, "Nh�n V� L�m B�o H�p ti�n l�i (20 c�i - ti�u hao 20 v�ng)/Rec_VLBH_2")
		--end
--	end
--	if nDate >= 120120 and nDate <= 120122 and GetGlbValue(GLB_TSK_SERVER_ID) == 70 then
--		tinsert(tSay, "Nh�n ��n b� �i�m kinh nghi�m m�y ch� Th�nh Long/award_give_500_mil")
--	end	
--	tinsert(tSay,"Ta mu�n ��i 1 M�nh B�ch Kim (ti�u hao 1 ch�a kh�a V�ng + 599 v�ng)/#exchang_Item(1)")
--	tinsert(tSay,"Ta mu�n ��i 4 M�nh B�ch Kim (ti�u hao 1 Th�n T�i B�o R��ng + 199 v�ng/#exchang_Item(2)")	
--	if nDate >= 111111 and nDate <= 111212 then
--		tinsert(tSay,VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[153].."/check_onlinetime")
--		tinsert(tSay,VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[154].."/exchang_chip")
--		tinsert(tSay,VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[155].."/exchang_zhienbaoxiang")
--	end
--	if gf_CheckEventDateEx(VET_201302_VALENTINE) == 1 then
--		tinsert(tSay,"Event L� T�nh Nh�n/get_tinhnhan")
--	end	
	tinsert(tSay, "T�i h� s� quay l�i sau/do_nothing")
	
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
	Msg2Player("Thao t�c th�nh c�ng, h�y ��ng nh�p l�i")
	SaveNow()
	Talk(1,"ExitGame","Thao t�c th�nh c�ng, h�y ��ng nh�p l�i")	
end
function Get_Book()
	local szSay = {
		g_szTitle.."Nh�n L�u Ph�i Ch�n Quy�n v� Quy�t Y�u!",
		"Nh�n Ch�n Quy�n/Get_Book_ZhenJuan",
		"Nh�n Quy�t Y�u/Get_Book_JueYao",
		"Ra kh�i/nothing",
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
	
	if nRoute == 23 then--������ʦ
		AddItem(0, 107, 30032,5)
		AddItem(0, 107, 30032-20,5)
	end
	
	if nRoute == 29 then--����
		AddItem(0, 107, 30033,5)
	  AddItem(0, 107, 30033-20,5)
	end
	
	if nRoute == 30 then--��Ů
		AddItem(0, 107, 30034,5)
		AddItem(0, 107, 30034-20,5)
	end
	
	gf_AddItemEx({0, 112, 158,	1, 4}, "L�ng Ba Vi B� to�n t�p");
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
		gf_AddItemEx({2, 6, i, 1, 4}, "Quy�t Y�u");
	end
end


function get_chankhi()
	local tSay = {}
	local szHeader = "Nh�n th��ng �i�m Ch�n Kh� khi s� d�ng Ch�a Kh�a V�ng (<color=green>Qu� ��ng ��o ch� ���c nh�n 1 l�n trong tu�n.<color>)"
	
	--tinsert(tSay, "S� d�ng 5-9 ch�a kh�a nh�n 600 �i�m ch�n kh� (ti�u hao 33 Xu v�t ph�m)/#confirm_get_chankhi(1)")
	--tinsert(tSay, "S� d�ng 10-14 ch�a kh�a nh�n 1200 �i�m ch�n kh� (ti�u hao 66 Xu v�t ph�m)/#confirm_get_chankhi(2)")
	tinsert(tSay, "S� d�ng 15 ch�a kh�a nh�n 2500 �i�m ch�n kh� (ti�u hao 99 Xu v�t ph�m)/#confirm_get_chankhi(3)")
	tinsert(tSay, "T�i h� s� quay l�i sau/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function accept_tngh_task()
	Talk(1, "", "Nhi�m v� n�y s� m� trong th�i gian s�p t�i, c�c h� vui l�ng quay tr� l�i sau!")
	return
end

function BuyWater()
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		return
	end
	if Pay(10000) == 0 then
		Talk(1, "OnUse", "Ng�n l��ng c�a b�n kh�ng ��!");
		return
	end
		
	gf_AddItemEx({2, 0, 351, 10}, "L� th�y")
	SayPage1()
end

function exchange_citywar()
	local tSay = {
		"��i 8 D�ng S� L�nh (c�n 1 Th� ti�n c�)/exchange_warriorling",
		"��i 6 C�ng th�nh Ti�n Phong (c�n 1 Th� ti�n c�)/exchange_citywarling",
		"K�t th�c ��i tho�i/do_nothing",
	}
	Say("C�c h� mu�n ��i v�t ph�m n�o?",getn(tSay),tSay)
end

function exchange_warriorling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"","C�c h� h�nh nh� kh�ng mang Th� ti�n c� tr�n ng��i?")
		return
	end
	
	if gf_Judge_Room_Weight(8, 100, " ") == 0 then
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1201,8,1)
		Msg2Player("B�n nh�n ���c 8 D�ng S� L�nh.")
		WriteLogEx("Cong Thanh Chien","nh�n",8,"D�ng S� L�nh","",GetTongName())
	end
end

function exchange_citywarling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"","C�c h� h�nh nh� kh�ng mang Th� ti�n c� tr�n ng��i?")				
		return
	end
	
	if gf_Judge_Room_Weight(6, 100, " ") == 0 then
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1203,6,1)
		Msg2Player("B�n nh�n ���c 6 C�ng th�nh Ti�n Phong L�nh.")
		WriteLogEx("Cong Thanh Chien","nh�n",6,"C�ng th�nh Ti�n Phong L�nh","",GetTongName())
	end
end

function take_jungong_back()
	local nDay = tonumber(date("%w%H"))
	if nDay >= 620 and nDay <= 624 then
		Say("T� 20:00 - 24:00 th� 7 kh�ng th� chu�c l�i qu�n c�ng!",0)
		return
	end
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TSK_JUNGONG_PUNISH_DATE) ~= nDate then
		SetTask(TSK_JUNGONG_PUNISH_DATE,nDate)
		SetTask(TSK_JUNGONG_PUNISH,0)
		SetTask(TSK_JUNGONG_LIMIT,0)
		Msg2Player("Qu�n c�ng c� th� chu�c ng�y h�m qua �� h�y b�.")
	end	
	local nLoseJungong = abs(GetTask(TSK_JUNGONG_PUNISH))	
	if nLoseJungong == 0 then
		Say("C�c h� kh�ng c� �i�m qu�n c�ng t�n th�t!",0)
		return
	end	
	if GetTask(TSK_JUNGONG_LIMIT) >= 50000 then
		Say("�i�m qu�n c�ng chu�c l�i trong ng�y �� ��t m�c gi�i h�n 50000.",0)
		return
	end
	local nMustPay =nLoseJungong * 200
	local strMoney = gf_GetMoneyString(nMustPay)	
	Say("H�m nay c�c h� c� <color=yellow>"..nLoseJungong.."<color> �i�m qu�n c�ng b� t�n th�t. C�n ph�i c� <color=yellow>"..strMoney.."<color> �� chu�c l�i s� �i�m n�y. C�c h� c� mu�n chu�c? <color=red>L�u �: n�u c�c h� chuy�n c�ng tr�ng tr��c khi chu�c, qu�n c�ng hi�n t�i c�a c�c h� s� b� tr�.<color>",2,"Ta ��ng �/take_jungong_back_confirm","Kh�ng c�n/nothing")
end

function take_jungong_back_confirm()
	local nDay = tonumber(date("%w%H"))
	if nDay >= 620 and nDay <= 624 then
		Say("T� 20:00 - 24:00 th� 7 kh�ng th� chu�c l�i qu�n c�ng!",0)
		return
	end
	local nLoseJungong = abs(GetTask(TSK_JUNGONG_PUNISH))	
	if nLoseJungong == 0 then
		Say("C�c h� kh�ng c� �i�m qu�n c�ng t�n th�t!",0)
		return
	end	
	local nMustPay =nLoseJungong * 200	
	if GetCash() < nMustPay then
		Say("S� ti�n c�c h� mang theo kh�ng ��!",0)
		return
	end
	if Pay(nMustPay) == 1 then
		SetTask(701, GetTask(701) + GetTask(TSK_JUNGONG_PUNISH))
		SetTask(TSK_JUNGONG_PUNISH,0)
		SetTask(TSK_JUNGONG_LIMIT, GetTask(TSK_JUNGONG_LIMIT) + nLoseJungong)
		Say("C�c h� �� nh�n l�i �i�m qu�n c�ng t�n th�t th�nh c�ng!",0)
		WriteLogEx("Chuoc Quan Cong","nh�n", nLoseJungong,"�i�m qu�n c�ng")
	end
end

function vlbh_active()
	local nWeekDay = tonumber(date("%w"))
	local nHour = tonumber(date("%H%M"))
--	if GetLevel() < 79 then
--		Talk(1, "", "��ng c�p 79 tr� l�n m�i c� th� s� d�ng ch�c n�ng n�y!")
--		return
--	end
--	if gf_Check55MaxSkill() == 0 then
--		Talk(1,"","Max Skill 55 m�i c� th� tham gia ho�t ��ng  ")
--		return
--	end
	local tSay = {}
	local szHeader = "Ho�t ��ng V� L�m B�o H�p!"
	--if (nHour >= 0800 and nHour <= 1000) or (nHour >= 1530 and nHour <= 1730) or (nHour >= 2000 and nHour <= 2200) then
		tinsert(tSay, "Nh�n V� L�m B�o H�p/Rec_VLBH")
		--tinsert(tSay, "Nh�n V� L�m B�o H�p/CloseFeature")
		tinsert(tSay, "D�ng v�ng ��i c�c lo�i ch�a kh�a/vlbh_exchange_key_gold")
		tinsert(tSay, "D�ng xu v�t ph�m ��i c�c lo�i ch�a kh�a/vlbh_exchange_key_xu")
		tinsert(tSay, "Nh�n th��ng c�c lo�i ch�a kh�a/vlbh_receive_key_prize")

		tinsert(tSay, "T�i h� s� quay l�i sau/do_nothing")
	--else
		--Talk(1,"","Ch�a ��n gi� nh�n b�o h�p, c�c h� vui l�ng quay l�i sau");
		--return
	--end
--	tinsert(tSay, "Shop ch�a kh�a v�ng/gold_key_shop")	

	Say(szHeader, getn(tSay), tSay)
end
function CloseFeature()
	Talk(1, "", "T�nh n�ng V� L�m B�o H�p �ang t�m ��ng, ��i hi�p h�y quay l�i sau !!!")
end

-- Nh�n th��ng th�n t�i g� c�a
function GiveAwardTTGS()
	if gf_GetExtPointByte(1,1) <= 0 then
		Talk(1,"","��i hi�p �� nh�n ph�n th��ng n�y r�i ho�c kh�ng c� trong danh s�ch nh�n th��ng!")
		return
	end 
	if  gf_GetExtPointByte(1,1) == 1 then
		if gf_SetExtPointByte(1, 1, 0) == 1 then
			gf_AddItemEx2({2,1,1067,1,1}, "��nh H�n Thi�n Th�ch", "Phan thuong TTGC", "nh�n", 7*24*60*60)
		end
	elseif gf_GetExtPointByte(1,1) == 2 then
		if gf_SetExtPointByte(1, 1, 0) == 1 then
			gf_AddItemEx2({0,112,78,1,1}, "L�ng Ba Vi B�", "Phan thuong TTGC", "nh�n")
		end
	else
		Talk(1, "", " ��i hi�p �� nh�n ph�n th��ng n�y r�i ho�c kh�ng c� trong danh s�ch nh�n th��ng!")
		return
	end
end

function award_give_500_mil()
	tbDenBuThanhLong = {
		[1] = "nhocksockkuto1994",
		[2] = "katsumi1990",
	}
	
	if GetExtPoint(0) ~= 0 then
		Talk(1, "", "��i hi�p �� nh�n ��n b� r�i, kh�ng th� nh�n th�m!")
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
		Talk(1, "", "��i hi�p kh�ng c� trong danh s�ch nh�n th��ng!")
		return
	end
	
	if GetExp() >= 1500000000 then
		Talk(1, "", "��i hi�p c� �i�m kinh nghi�m t�n ��ng nhi�u h�n 1500000000, kh�ng th� nh�n th��ng!")
		return
	end

	if GetExtPoint(0) == 0 then
		AddExtPoint(0,1)
		ModifyExp(500000000)
		Msg2Player("B�n nh�n ���c ��n b� 500 tri�u �i�m kinh nghi�m!")
		WriteLogEx("Den bu Thanh Long 2012", "nh�n ��n b�")
	end
end

function exchang_Item(nType)
	local tbItem = {
				[1] = {1, 0, " Ch�a kh�a V�ng", 599, {2, 1, 30346, 1}, "M�nh B�ch Kim", 30133, "MBK= key v�ng 20/7", 1},
				[2] = {0, 1, " Th�n T�i B�o R��ng", 199, {2, 1, 30346, 4}, "M�nh B�ch Kim", 30344, "MBK = TTBR 20/7", 4},
			}
	if GetCash() < tbItem[nType][4] * 10000 then
		Talk(1,"","B�n kh�ng mang �� v�ng �� ��i!!!")
		return 0
	end			
	if GetItemCount(2,1,30133) < tbItem[nType][1] then
		Talk(1,"","B�n kh�ng mang theo �� "..tbItem[nType][1]..tbItem[1][3])
		return 0
	end			
	if GetItemCount(2,1,30344) < tbItem[nType][2] then
		Talk(1,"","B�n kh�ng mang theo �� "..tbItem[nType][2]..tbItem[2][3])
		return 0
	end				
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","H�nh trang c�a b�n kh�ng �� ch� tr�ng!!!")
        	return 0
	end		
	if DelItem(2,1,tbItem[nType][7],1) == 1 and Pay(tbItem[nType][4] * 10000) == 1 then
		gf_AddItemEx2(tbItem[nType][5], tbItem[nType][8], "DOI MANH BACH KIM", "��i th�nh c�ng")
		Msg2Player("B�n nh�n ���c "..tbItem[nType][9]..tbItem[nType][6])
	end	
end
function confirm_get_chankhi(nType)
	local tbCheck = {
				[1] = {5, 33, 600},
				[2] = {10, 66, 1200},
				[3] = {15, 99, 2500},
			}
	if floor(GetTask(TSK_VLBH_QI)/100) >= 1 then
		Talk(1,"","B�n �� nh�n ph�n th��ng tu�n n�y r�i, n�n kh�ng th� nh�n th��ng ���c n�a !!!")
		return 0		
	end
	if MeridianGetLevel() <= 0 then
		Talk(1,"","B�n ch�a k�ch ho�t kinh m�ch n�n kh�ng th� nh�n th��ng !!!")
		return 0
	end
	local nNumUse = mod(GetTask(TSK_VLBH_QI), 100)
	if nNumUse <tbCheck[nType][1] then
		Talk(1,"","B�n ch�a s� d�ng �� s� l��ng ch�a kh�a v�ng n�n kh�ng th� nh�n th��ng !!!")
		return 0
	end

	if GetItemCount(2,1,30230) < tbCheck[nType][2] then
		Talk(1,"","B�n kh�ng mang theo �� "..tbCheck[nType][2].." xu v�t ph�m �� nh�n th��ng !!!")
		return 0
	end		
	SetTask(TSK_VLBH_QI, GetTask(TSK_VLBH_QI) + 100)
	if DelItem(2,1,30230,tbCheck[nType][2]) == 1 then
		AwardGenuineQi(tbCheck[nType][3])
	end
	gf_WriteLogEx("Vo Lam Bao Hap", "nh�n  th�nh c�ng", 1, "Ph�n th��ng ch�n kh� 20/7")
	WriteLogEx("LOG XU VAT PHAM","S� d�ng CKV, ti�u hao 99 xu nh�n 2k5 ch�n kh�")
end

function get_tinhnhan()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem tr�n trang ch� <color=green>http://volam2.zing.vn<color>."
	--tbSayDialog, szSayHead = get_tbJNDialog_info(VET_XA_ACTIVITY_TABLE)
   	tinsert(tbSayDialog,"��i 1 Socola t�nh nh�n (5 H�t cacao + 2 Xu v�t ph�m)/VNG_DoiEventThang2_Form1")
   	tinsert(tbSayDialog,"��i 1 Socola t�nh nh�n (5 H�t cacao + 1 S�a tinh luy�n)/VNG_DoiEventThang2_Form2")
   	tinsert(tbSayDialog,"Ki�m tra s� l��ng Socola �� s� d�ng/ncheck_number_use"	)
   	tinsert(tbSayDialog,"Nh�n ph�n th��ng cu�i s� d�ng Socola/get_final_socola"	)
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/do_nothing"	)
	nSaySize = getn(tbSayDialog);	
	Say(szSayHead, nSaySize, tbSayDialog);
end
function get_final_socola()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem tr�n trang ch� <color=green>http://volam2.zing.vn<color>."	
	tinsert(tbSayDialog,"Nh�n th��ng 2 thi�n m�n kim l�nh/#confirm_get_final_socola(1)")
   	tinsert(tbSayDialog,"Nh�n th��ng 300 tri�u �i�m kinh nghi�m/#confirm_get_final_socola(2)")
	tinsert(tbSayDialog,"K�t th�c ��i tho�i/do_nothing"	)
	nSaySize = getn(tbSayDialog);	
	Say(szSayHead, nSaySize, tbSayDialog);
end
function confirm_get_final_socola(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if gf_Judge_Room_Weight(2, 50," ") ~= 1 then
        	return
    end
    if GetTask(2763) == 1 then
    		Talk(1, "", "��i hi�p �� nh�n ph�n th��ng cu�i r�i!!!")
    		return
    end   
    if GetTask(2764) < 1402 then
    		Talk(1, "", "��i hi�p ch�a s� d�ng �� 1402 v�t ph�m Valentine!!!")
    		return
    end
    SetTask(2763,1)
    if nType == 1 then
    		gf_AddItemEx2({2,1,30370,2}, "Thi�n M�n Kim L�nh", "VALENTINE 2013", "Ph�n th��ng cu�i Socola Thi�n M�n Kim L�nh", 0, 1);
    	else
    		ModifyExp(300000000)
    		gf_WriteLogEx("VALENTINE 2013", "nh�n  th�nh c�ng", 1, "Ph�n th��ng cu�i Socola exp")
    	end
    
end
function VNG_DoiEventThang2_Form1()
	AskClientForNumber("VNG_DoiEventThang2_Socola1", 1, 999, "S� l��ng (1-999)")
end
function VNG_DoiEventThang2_Socola1(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end
	if GetItemCount(2,1,30357) < (5 * nCount ) or GetItemCount(2,1,30230) < (2 * nCount)  then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n ��i.");
		return 0;
	end
	if DelItem(2,1,30357, 5 * nCount) == 1 and DelItem(2,1,30230, 2 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30495, nCount}, "Socola", "VALENTINE 2013" , "nh�n")
	end
end
function VNG_DoiEventThang2_Form2()
	AskClientForNumber("VNG_DoiEventThang2_Socola2", 1, 20, "S� l��ng (1-20)")
end
function VNG_DoiEventThang2_Socola2(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end
	if GetItemCount(2,1,30357) < (5 * nCount ) or GetItemCount(2,1,30477) < (1 * nCount)  then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n ��i.");
		return 0;
	end
	if DelItem(2,1,30357, 5 * nCount) == 1 and DelItem(2,1,30477, 1 * nCount) == 1 then
		gf_AddItemEx2({2, 1, 30495, nCount}, "Socola", "VALENTINE 2013" , "nh�n")
	end
end
function ncheck_number_use()
	local nUse = GetTask(2764)
	Talk(1, "", "S� l�n s� d�ng Socola hi�n t�i l� : "..nUse.."/10000");
end


function VLBH_HotroConLon()
	local tbSay = {}
	tinsert(tbSay,"Nh�n 900 V� L�m B�o H�p (ti�u hao 21 xu v�t ph�m)/#HoTroVLBH(1)")
	tinsert(tbSay,"Nh�n 900 V� L�m B�o H�p (ti�u hao 66 v�ng)/#HoTroVLBH(2)")
	tinsert(tbSay,"Ta ch�a mu�n nh�n b�y gi�/gf_DoNothing")
	Say("Ch� c�n t�n �t th� lao, c�c h� s� nh�n ���c nhi�u h� tr�...", getn(tbSay), tbSay)
end


function do_nothing()
	
end