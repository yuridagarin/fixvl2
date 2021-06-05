Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua")

PROMOTION_EVERYDAY = "KHUYEN MAI MOI NGAY"
SALEOFF_START_DATE = 20130102
SALEOFF_END_DATE = 20130217
SALEOFF_START_TIME = 1945
SALEOFF_END_TIME = 2130
szNpcName = "<color=green>T� B�o Th��ng Nh�n: <color>"

--tbItemSaleOff = {
--	{"H�a Th� B�ch",2,1,1001,1,{2,1,1001,1}, 30*24*60*60},	
--	{"T�i Thi�n Th�ch Tinh Th�ch",2,1,3356,1,{2,1,3356,1}, 30*24*60*60},
--	{"Bao Th�ng Thi�n L�nh L�n",2,1,30412,1,{2,1,30412,1}, 30*24*60*60},
--	{"Bao T� Ngh�a L�nh L�n",2,95,211,1,{2,95,211,1}, 30*24*60*60},
--	{"T�i H�t Gi�ng",2,1,30087,1,{2,1,30087,1}, 7*24*60*60},
--	{"Chuy�n Sinh ��n",2,1,30345,1,{2,1,30345,1}, 30*24*60*60},
--}

tbThuCuoi = {
		[1] = {"��c Gi�c Th� B�o B�o", 0,105,30032},
		[2] = {"Kim K� L�n B�o B�o", 0,105,30017},
		[3] = {"Kim Mao Ng�u B�o B�o", 0,105,30022},
		[4] = {"B�o V�ng B�o B�o", 0,105,30030},
}

function main()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = ""
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= SALEOFF_START_DATE and nDate <= SALEOFF_END_DATE then
		local tbSay = {}
		for i=1, getn(tbThuCuoi) do
			tinsert(tbSay, "Mua "..tbThuCuoi[i][1].." gi� r� (999 v�ng)/#MuaThuCuoi("..i..")")
		end
		tinsert(tbSay,"Ta ch� gh� xem/gf_Nothing")
		Say("Ta c� v�i con k� tr�n d� th�, ng��i c� mu�n mua l�m th� c��i kh�ng?", getn(tbSay), tbSay)
	else
		Say("Ta th��ng c� nh�ng m�t h�ng qu� hi�m, gi� c� l�i v� c�ng r�, ng��i h�y th��ng xuy�n gh� th�m nh�...",1,"T�i h� bi�t r�i/gf_Nothing")
	end
	
	--:::::::::::::::::: Sieu Khuyen Mai :::::::::::::::::::::::::::
--	local nDate = tonumber(date("%Y%m%d"))
--	local nTime = tonumber(date("%H%M"))
--	if nDate >= SALEOFF_START_DATE and nDate <=SALEOFF_END_DATE then
--		if nTime >= SALEOFF_START_TIME and nTime <= SALEOFF_END_TIME then
--			tbSayDialog = SaleOff_CreateMenu()
--		else
--			Talk(1,"",szNpcName.."C�a ti�m c�a ta ch� m� c�a t� 19:45 ��n 21:30, c�c h� h�y tranh th� ��n v�o ��ng th�i �i�m.!")
--			return 0
--		end
--	end
--	gf_PageSay(tbSayDialog, 1, 6)
	--------------------------------------------------------------
end

function MuaThuCuoi(nOption)
	if gf_JudgeRoomWeight(1,200) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	if GetCash() < 9990000 then
		Talk(1,"",szNpcName.."Thu�n mua v�a b�n, <color=yellow>999<color> v�ng c�a ng��i ��u? �� ti�n ta m�i giao h�ng nh�!!");
		return 0
	end
	if Pay(9990000) == 1 then
		local tbAward = {item={{gdp={tbThuCuoi[nOption][2],tbThuCuoi[nOption][3],tbThuCuoi[nOption][4],1,1,-1,-1,-1,-1,-1,-1,-1}, name= tbThuCuoi[nOption][1], nExpired = 7*24*60*60}}}
		LIB_Award.szLogTitle = "BAN THU CUOI GIA RE"
		LIB_Award.szLogAction = "mua"
		LIB_Award:Award(tbAward)
	end
end

--****************************************************************
--			Si�u khuy�n m�i - BEGIN
--****************************************************************
--function SaleOff_CreateMenu()
--	local tSay = {}
--	local szFileName = date("%Y%m%d") .. ".txt"
--	LIB_txtData:Init(szFileName)
--	local nRet = LIB_txtData:LoadMultiColumn();
--	if nRet > 0 then	
--		tSay[0] =  szNpcName.."Ta m�i �em v� l� h�ng gi� ��c bi�t, m�i v� l�m h�o ki�t ��n xem th�!!!"
--		for i = 1, getn(LIB_txtData.tbTextData) do
--			local szItem = tbItemSaleOff[i][1]
--			local nQty = tonumber(LIB_txtData.tbTextData[i][1])
--			local nPrize = tonumber(LIB_txtData.tbTextData[i][2])
--			local szExpired = ""
--			if tonumber(LIB_txtData.tbTextData[i][3]) > 0 then
--				szExpired = ", h�n s� d�ng ".. LIB_txtData.tbTextData[i][3] .. "ng�y"
--			end
--			tinsert(tSay ,szItem..": Gi� " .. nPrize  .. " xu v�t ph�m" .. szExpired .." (c�n l�i " .. nQty ..")/#MuaSieuKhuyenMai("..i..")")
--		end
--	else
--		tSay[0] =  szNpcName.."H�ng h�a h�m nay kh�ng c�, khi kh�c c�c h� ��n nh�!!!"
--	end
--	return tSay
--end
--
--
--function MuaSieuKhuyenMai(nOption)
--	if gf_JudgeRoomWeight(1,100) == 0 then
--		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
--		return 0
--	end
--	local nTime = GetTime()
--	if nTime < (GetGlbValue(GLB_TASK_PROMOTION) + 6) then
--		local nTimeRemain = (GetGlbValue(GLB_TASK_PROMOTION) + 6) - GetTime()
--		Talk(1,"","Nhi�u ng��i mua qu�, cho ta ngh� m�t m�t t�. H�y quay l�i sau "..nTimeRemain.." gi�y n�a !!!")
--		return 0
--	end
--	
--	local szFileName = date("%Y%m%d") .. ".txt"
--	LIB_txtData:Init(szFileName)
--	local nRet = LIB_txtData:LoadMultiColumn();
--	if nRet == 0 then
--		return 0
--	end
--	local nQty = tonumber(LIB_txtData.tbTextData[nOption][1])
--	if nQty <= 0 then
--		Talk(1,"",szNpcName.."<color=yellow>"..tbItemSaleOff[nOption][1].." �� h�t, hay l� c�c h� h�y ch�n m�n kh�c nh�!.")
--		return 0
--	end
--	if GetItemCount(2,1,30230) <  tonumber(LIB_txtData.tbTextData[nOption][2]) then
--		Talk(1,"",szNpcName.."C�c h� kh�ng �� xu v�t ph�m �� ��i m�n n�y, hay ch�n m�n kh�c r� h�n?.")
--		return 0
--	end
--	LIB_txtData.tbTextData[nOption][1] = nQty - 1
--	LIB_txtData:SaveMultiColumn()
--	
--	LIB_Award.szLogTitle = "SIEU KHUYEN MAI THANG 11"
--	LIB_Award.szLogAction = "mua"
--	local nHSD = tonumber(LIB_txtData.tbTextData[nOption][3]) * 24*60*60
--	local tbAward = {
--			item={gdp={tbItemSaleOff[nOption][2],tbItemSaleOff[nOption][3],tbItemSaleOff[nOption][4],1}, name = tbItemSaleOff[nOption][1], nExpired = nHSD}
--	}
--	if DelItem(2,1,30230,tonumber(LIB_txtData.tbTextData[nOption][2])) == 1 then
--		LIB_txtData.tbTextData[nOption][1] = nQty - 1
--		LIB_txtData:SaveMultiColumn()
--		--LIB_Award:Award(tbAward)
--		SetGlbValue(GLB_TASK_PROMOTION, GetTime())
--		--Talk(1,"","Thanh cong - " ..nHSD)
--		gf_AddItemEx2(tbItemSaleOff[nOption][6], tbItemSaleOff[nOption][1], PROMOTION_EVERYDAY, "mua "..tbItemSaleOff[nOption][1], tbItemSaleOff[nOption][7])
--		
--	end
--end
--****************************************************************
--			Si�u khuy�n m�i - END
--****************************************************************









--function get_selloff()
--	local nTime = tonumber(date("%H%M"))
--	if nTime < 0800 or nTime > 2400 then
--		Talk(1,"","Hi�n t�i ch�a ��n gi� b�n, ��i hi�p h�y quay l�i sau nha !!!")		
--		return
--	end
--	local tbSayDialog = {};
--	tinsert(tbSayDialog, "��ng � /confirm_buy")
--	tinsert(tbSayDialog, "Ta ch� gh� ngang /do_nothing")	
--	Say("Ch��ng tr�nh khuy�n m�i gi� r�", getn(tbSayDialog), tbSayDialog);
--end
--function get_infor()
--	proday:load()
--	local nNumremain = 0
--	local nDate = tonumber(date("%Y%m%d"))
--	if nDate ~= proday.tList["baothienthach"][2] then
--		nNumremain = 500
--	else
--		nNumremain = proday.tList["baothienthach"][1]
--	end
--	Talk(1,"","S� l��ng c�n c� th� mua trong ng�y hi�n t�i l�: "..nNumremain.." c�i")	
--end
--
--function confirm_buy()
--	proday:load()
--	---------------------------------
--	local nDate = tonumber(date("%Y%m%d"))
--	local nTime = GetTime()
--	print(proday.tList["baothienthach"][2])
--	if nDate ~= proday.tList["baothienthach"][2] then
--		proday.tList["baothienthach"][1] = 500
--	end
--	
--	if nTime < (GetGlbValue(GLB_TASK_PROMOTION) + 6) then
--		local nTimeRemain = (GetGlbValue(GLB_TASK_PROMOTION) + 6) - GetTime()
--		Talk(1,"","Nhi�u ng��i mua qu�, cho ta ngh� m�t m�t t�. H�y quay l�i sau "..nTimeRemain.." gi�y n�a !!!")
--		return
--	end
--	---------------------------------
--	if proday.tList["baothienthach"][1] <= 0 then
--		Talk(1,"","Th�t ��ng ti�c! �� h�t h�ng gi�m gi� r�i. Ng�y mai ��i hi�p nh� gh� s�m nh�  !!!")
--		return
--	end
--	if IsPlayerDeath() ~= 0 then 
--		Talk(1, "", "Hi�n t�i kh�ng th� mua !!!")
--		return
--	end
--	if gf_Judge_Room_Weight(2, 100," ") ~= 1 then
--        	return
--    end
--	if GetItemCount(2,1,30230) < 500 then
--		Talk(1,"","Hi�n kh�ng c� �� Xu, ��i hi�p vui l�ng quay l�i v�o l�c kh�c!")
--		return
--	end
--
--	SetGlbValue(GLB_TASK_PROMOTION, GetTime())
--	gf_WriteLogEx("THAM GIA KHUYEN MAI", "mua th�nh c�ng")
--	proday:register()
--	if DelItem(2, 1, 30230, 500) == 1  then
----		gf_WriteLogEx("THAM GIA KHUYEN MAI", "mua th�nh c�ng")
--		gf_AddItemEx2({2, 1, 1001, 1}, "Hoa Thi Bich", PROMOTION_EVERYDAY, "mua H�a Th� B�ch", 7*24*60*60)
--		Talk(1,"","C�c h� �� mua th�nh c�ng 1 H�a Th� B�ch")
--		Msg2Player("C�c h� �� mua th�nh c�ng 1 H�a Th� B�ch")
--	--	AddGlobalNews("Ch�c m�ng ��i hi�p <color=yellow>"..GetName().."<color> �� mua th�nh c�ng 1 Bao Thi�n Th�ch Tinh Th�ch v�i gi� r�.")
--	end
--end
--
--function do_nothing()
--
--end
