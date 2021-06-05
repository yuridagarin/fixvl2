Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua");
--Include("\\script\\online\\viet_event\\golden_card\\golden_head.lua");
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
GOLDENCARD_PRICE = 2400
szName = "<color=green>Ho�ng Kim Th��ng Nh�n<color> :"

golden_code = {
	fileName = "data/golden_code/code.txt",
	count = 0,
	listFormat = "(.+)	(.+)	(.+)",
	tList = {},
}

if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
	golden_code.fileName = "data\\golden_code\\"..GetGlbValue(GLB_TSK_SERVER_ID)..".txt";
else
	golden_code.fileName = "data/golden_code/"..GetGlbValue(GLB_TSK_SERVER_ID)..".txt";
end

function get_linux_id()
	if SubWorldID2Idx(300) >= 0 then
		return 1
	elseif SubWorldID2Idx(200) >= 0 then
		return 2
	elseif SubWorldID2Idx(100) >= 0 then
		return 3
	elseif SubWorldID2Idx(350) >= 0 then
		return 4
	elseif SubWorldID2Idx(150) >= 0 then
		return 5
	else
		return 0
	end
end

function golden_code:load()
	local pf = openfile(self.fileName, "r");
	if not pf then 
		golden_code:save()
		return
	end
	
	local str =""	
	self.count  = 0
	self.tList = {}
	while 1 do
		str = read(pf, "*l");
		if not str then break end
		local _,_,code, sid, lid = strfind(str, self.listFormat);
		if tonumber(sid) == GetGlbValue(GLB_TSK_SERVER_ID) and tonumber(lid) == get_linux_id()  then
			self.count = self.count + 1;			
			self.tList[self.count] = tostring(code);			
		end
	end

	closefile(pf);
end

function golden_code:save()
	local pf = openfile(self.fileName, "w");
	if not pf then return end
	local serverid = GetGlbValue(GLB_TSK_SERVER_ID) 
	local lid = get_linux_id()
	
	for i=1,getn(self.tList) do
		write(pf, format("%s	%d	%d\n", self.tList[i],serverid, lid));
	end
	closefile(pf);
end

function golden_code:substract()		
		if self.count >= 1 then
			tremove(self.tList,1)
			self:save();
			return 1
		end
		return 0
end

function main()
	local nDate = tonumber(date("%y%m%d"))
	local nNation = GetGlbValue(1023)
	if random(1,100) <= 10 then
		NpcChat(GetTargetNpc(),"Ta m�i gom ���c c�c v�t ph�m tr�n qu�, m�i ��ng ��o gh� mua!")
	end
	local tSay = 	{}
	if nDate >= 120404 and nDate <= 120408 and nNation == 70 then
		tinsert(tSay, "Ta mu�n nh�n ph�n th��ng �ua Top Chuy�n Sinh 1/get_award_CS1")
	end
	--tinsert(tSay, "C�a hi�u L�nh B�i Ho�ng Kim/#get_card(1)")
	if nDate >= 121129 then
		tinsert(tSay, "C�a hi�u L�nh B�i L�i H�/#get_card(2)")
	end
	tinsert(tSay,"Ta mu�n mua v�t ph�m V� L�m Ho�ng Kim L�nh (ti�u hao V�ng)/#buy_HKL(1)")
	tinsert(tSay,"Ta mu�n mua v�t ph�m V� L�m Ho�ng Kim L�nh (ti�u hao Xu V�t Ph�m)/#buy_HKL(2)")			
	tinsert(tSay, "Ta ch� gh� qua!/hklb_DoNothing")	
	
	Say(szName.."Ch�o ��i hi�p, t�i h� c� b�n <color=yellow>L�nh B�i B�ch Kim v� c�c v�t ph�m<color> n�i ti�ng trong v� l�m v�i gi� c�c r�. M�i ��i hi�p xem qua!",getn(tSay),tSay)
end

function get_card(nSelect)
	local nDate = tonumber(date("%y%m%d"))
	local tSay = 	{}	
	
	if nSelect == 1 then
		tinsert(tSay, "C�a hi�u L�nh B�i Ho�ng Kim/get_golden_card")
		tinsert(tSay, "Ta mu�n ��i 2400 Xu v�t ph�m v� 200000 �i�m t�ch l�y l�y Chi�n T��ng nguy�n so�i/get_zhanxiang")
		if nDate >= 110307 and nDate <= 110311 then
			tinsert(tSay, "Ta mu�n ��i Chi�n T��ng nguy�n so�i c� l�y con m�i/change_zhanxiang")
		end
		tinsert(tSay, "Ta mu�n ��i �i�m t�ch l�y/ChangeAccumulate")
		tinsert(tSay, "C�a H�ng V� L�m Ti�n B�i/ChangeVLTBShop")
		tinsert(tSay, "Ta mu�n mua 1 b� Ngo�i Trang T� Linh/get_cloth_tulinh")	
		tinsert(tSay, "Ta ch� gh� qua!/hklb_DoNothing")	
		Say(szName.."Ch�o ��i hi�p, t�i h� c� b�n <color=yellow>L�nh B�i Ho�ng Kim v� c�c v�t ph�m<color> n�i ti�ng trong v� l�m v�i gi� c�c r�. M�i ��i hi�p xem qua!",getn(tSay),tSay)
	else
		tinsert(tSay, "��i �i�m t�ch l�y (t�n 2 xu v�t ph�m + 22222222 �i�m kinh nghi�m)/#ChangeAccumulateBKL(1)")
		tinsert(tSay, "��i �i�m t�ch l�y (t�n 2 m�nh thi�n cang + 2 m�nh thi�n m�n + 22 m�c r��ng + 22 v�ng)/#ChangeAccumulateBKL(2)")
		tinsert(tSay, "C�a H�ng Tuy�t Th� Cao Nh�n/ChangeVLTBShopBKL")
		tinsert(tSay, "M� kh�a L�ng Ba Vi B� to�n t�p (ti�u hao 2 C�u Thi�n V� C�c ��n)/Unlocl_LangBa_BKL")
		tinsert(tSay, "Ta ch� gh� qua!/hklb_DoNothing")	
		Say(szName.."Ch�o ��i hi�p, t�i h� c� b�n <color=yellow>C�c v�t ph�m<color> n�i ti�ng trong v� l�m v�i gi� c�c r�. M�i ��i hi�p xem qua!",getn(tSay),tSay)
	end
	
	
end
function get_golden_card()
--	if GetLevel() < 77 then 
--		Talk(1,"",szName.."L�nh B�i Ho�ng Kim l� v�t qu� c�a v� l�m, t�i h� kh�ng th� t�y ti�n b�n ���c. ��i hi�p ph�i c� ��ng c�p 77 tr� l�n m�i c� th� mua!")
--		return
--	end
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 120229 then
		Talk(1,"","T�nh n�ng n�y t�m ��ng !")
		return
	end
	if nDate >= 120210 and nDate <= 120229 then
		GOLDENCARD_PRICE = 600
	end
	golden_code:load()
	local tSay = 	{}
--	if nDate <= 110331 then
	tinsert(tSay, "Ta mu�n mua 1 L�nh B�i Ho�ng Kim (c�n "..GOLDENCARD_PRICE.." v�t ph�m Xu)/confirm_get_golden_card")
--	end
	tinsert(tSay, "Ki�m tra L�nh B�i Ho�ng Kim �� mua/check_golden_code")
	tinsert(tSay, "Ta s� mua sau/hklb_DoNothing")
						
	Say(szName.."T�i h� b�n <color=yellow>L�nh B�i Ho�ng Kim<color> gi� <color=red>"..GOLDENCARD_PRICE.." Xu<color> ��n khi h�t h�ng. Hi�n t�i c�n <color=yellow>"..golden_code.count.." L�nh B�i Ho�ng Kim<color>. Do s� ng��i ��t mua r�t nhi�u n�n t�i h� ch� c� th� b�n cho ��i hi�p t�i �a <color=yellow>2 L�nh B�i Ho�ng Kim<color>!",getn(tSay),tSay)
end

function confirm_get_golden_card()
--	if GetLevel() < 77 then 
--		Talk(1,"",szName.."L�nh B�i Ho�ng Kim l� v�t qu� c�a v� l�m, t�i h� kh�ng th� t�y ti�n b�n ���c. ��i hi�p ph�i c� ��ng c�p 77 tr� l�n m�i c� th� mua!")
--		return
--	end
--	local nDate = tonumber(date("%Y%m%d"))
--	if nDate > 20101219 then
--		Talk(1,"",szName.."L�nh B�i Ho�ng Kim ��t n�y ch� b�n ��n h�t ng�y 19/12/2010. M�i ��i hi�p gh� mua l�n sau nh�!")
--		return
--	end
	if GetTask(TSK_BUY_GOLDEN_CARD) >= 2 then
		Talk(1,"",szName.."��i hi�p �� mua 2 L�nh B�i Ho�ng Kim r�i. M�i ��i hi�p gh� mua l�n sau nh�!")
		return
	end	
	golden_code:load()
	if  golden_code.count <= 0 then
		Talk(1,"",szName.."Th�t ��ng ti�c! T�i h� v�a b�n h�t L�nh B�i Ho�ng Kim r�i. M�i ��i hi�p gh� mua l�n sau nh�!")
		return
	end
	if GetItemCount(2,1,30230) < GOLDENCARD_PRICE then
		Talk(1,"",szName.."��i hi�p h�nh nh� kh�ng mang �� "..GOLDENCARD_PRICE.." ti�n Xu th� ph�i?")
		return
	end
	local nSec = random(5,100)
	CastState("state_fetter",1,nSec*18)
	ProgressSlot(nSec*18);	--5��
	Msg2Player("�ang truy xu�t d� li�u, vui l�ng ch� gi�y l�t...")
end

function OnProgressCallback()
	if GetTask(TSK_BUY_GOLDEN_CARD) >= 2 then
		Talk(1,"",szName.."��i hi�p �� mua 2 L�nh B�i Ho�ng Kim r�i. M�i ��i hi�p gh� mua l�n sau nh�!")
		return
	end
	if GetItemCount(2,1,30230) < GOLDENCARD_PRICE then
		Talk(1,"",szName.."��i hi�p h�nh nh� kh�ng mang �� "..GOLDENCARD_PRICE.." ti�n Xu th� ph�i?")
		return
	end
	golden_code:load()
	if  golden_code.count <= 0 then
		Talk(1,"",szName.."Th�t ��ng ti�c! T�i h� v�a b�n h�t L�nh B�i Ho�ng Kim r�i. M�i ��i hi�p gh� mua l�n sau nh�!")
		return
	end
	if DelItem(2,1,30230,GOLDENCARD_PRICE) == 1 then
		local szCode = golden_code.tList[1]
		if golden_code:substract() == 1 then
			SetTask(TSK_BUY_GOLDEN_CARD,GetTask(TSK_BUY_GOLDEN_CARD) + 1)
			local szCodeSold = CustomDataRead("code_hklb") or ""
			if szCodeSold == "" then
				szCodeSold = szCode
			else
				szCodeSold = szCodeSold.." "..szCode
			end
			CustomDataSave("code_hklb","s",szCodeSold)
			Talk(1,"",szName.."Ch�c m�ng ��i hi�p �� mua th�nh c�ng. M� th� L�nh B�i Ho�ng Kim c�a ��i hi�p l�: <color=yellow>"..szCode.."<color>. <color=red>L�u �: n�u ��i hi�p nh�p m� v�o t�i kho�n t�o tr��c ng�y 14/06/2011, ��i hi�p s� l� V� L�m Ti�n B�i. N�u nh�p m� v�o t�i kho�n t�o sau ng�y 14/06/2011, ��i hi�p s� l� Thi�u Ni�n Anh H�ng.<color>. Chi ti�t c�a ho�t ��ng vui l�ng xem t�i trang ch� <color=green>http://volam2.zing.vn<color>.")			
			WriteLogEx("Ban HKLB","mua code",1,szCode)
		end
	end	
end

function get_cloth_tulinh()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20111231 then
		Talk(1,"",szName.."B�n trang ch� b�n v�t ph�m n�y ��n h�t ng�y 31 th�ng 12 n�m 2011, ��i hi�p vui l�ng quay l�i v�o l�c kh�c!")
		return
	end
	local tSay = {}
	local szHeader = "B�n trang hi�n c� c�c lo�i trang ph�c sau, m�i ��i hi�p ch�n:"

	tinsert(tSay, "Ta mu�n mua T� Linh Vi�t Ph�c ngo�i trang (V�ng) (gi� 2400 v�t ph�m Xu, theo gi�i t�nh)/#confirm_get_cloth_tulinh(0)")
	tinsert(tSay, "Ta mu�n mua T� Linh Vi�t Ph�c ngo�i trang (Xanh) (gi� 2400 v�t ph�m Xu, theo gi�i t�nh)/#confirm_get_cloth_tulinh(8)")
	tinsert(tSay, "Ta mu�n mua T� Linh Vi�t Ph�c ngo�i trang (T�m) (gi� 2400 v�t ph�m Xu, theo gi�i t�nh)/#confirm_get_cloth_tulinh(4)")
	tinsert(tSay, "Quay tr� v� trang tr��c/main")
	
	Say(szHeader, getn(tSay), tSay)
end

function confirm_get_cloth_tulinh(nType)
	local nBody = GetBody()
	if GetItemCount(2,1,30230) < 2400 then
		Talk(1,"",szName.."Hi�n kh�ng c� �� Xu, ��i hi�p vui l�ng quay l�i v�o l�c kh�c!")
		return
	end
	if gf_Judge_Room_Weight(4, 200, szName) == 0 then
		return
	end
	if DelItem(2,1,30230,2400) == 1 then
		gf_AddItemEx2({0, 108, 30000 + nBody + nType, 1}, "T� Linh M�o", "Ban ngoai trang Tu Linh", "nh�n lo�i "..nType, 60 * 24 * 3600)
		gf_AddItemEx2({0, 109, 30000 + nBody + nType, 1}, "T� Linh Y", "Ban ngoai trang Tu Linh", "nh�n lo�i "..nType, 60 * 24 * 3600)
		gf_AddItemEx2({0, 110, 30000 + nBody + nType, 1}, "T� Linh Trang", "Ban ngoai trang Tu Linh", "nh�n lo�i "..nType, 60 * 24 * 3600)
		Talk(1,"",szName.."��i hi�p �� mua th�nh c�ng ngo�i trang T� Linh!")
	end
end

function check_golden_code()
	local szCode = CustomDataRead("code_hklb") or ""
	if szCode == "" then
		Talk(1,"",szName.."��i hi�p ch�a mua � ch� t�i h� L�nh B�i Ho�ng Kim n�o! ��i hi�p c� ch�c �� mua r�i kh�ng?")
		return
	end
	Talk(1,"",szName.."L�nh B�i Ho�ng Kim c�a ��i hi�p l�: <color=yellow>"..szCode.."<color>. <color=red>L�u �: n�u ��i hi�p nh�p m� v�o t�i kho�n t�o tr��c ng�y 14/06/2011, ��i hi�p s� l� V� L�m Ti�n B�i. N�u nh�p m� v�o t�i kho�n t�o sau ng�y 14/06/2011, ��i hi�p s� l� Thi�u Ni�n Anh H�ng.<color>. Chi ti�t c�a ho�t ��ng vui l�ng xem t�i trang ch� <color=green>http://volam2.zing.vn<color>.")
end

function get_zhanxiang()
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        	return 0
    	end
    
    	if GetItemCount(2, 1, 30230) < 2400 or (GetTask(704) ~= 6 and GetTask(704) ~= -6) or GetTask(707) < 200000 then
    		Talk(1, "", "V�t ph�m Xu, �i�m t�ch l�y ho�c qu�n h�m c�a c�c h� ch�a �� �� ��i!")
    		return 0
    	end
    	
    	if DelItem(2, 1, 30230, 2400) == 1 then
    		SetTask(707, GetTask(707) - 200000)
    		gf_AddItemEx2({0, 105, 30033, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n T��ng", "Hoang Kim Thuong Nhan", "mua Chi�n T��ng nguy�n so�i", 90 * 24 * 3600)
    	end
end

function change_zhanxiang()
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        	return 0
    	end
    	
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nMountIndex = GetPlayerEquipIndex(10)
	
	if GetTask(704) ~= 6 and GetTask(704) ~= -6 then
    		Talk(1, "", "Qu�n h�m c�a c�c h� kh�ng ph�i l� nguy�n so�i n�n kh�ng th� ��i!")
    		return 0
    	end 
	
	if nMountIndex == 0 or nG ~= 0 or nD ~= 105 or nP ~= 30033 then
		Talk(1, "", "Vui l�ng trang b� Chi�n T��ng nguy�n so�i �� ��i!")
    		return 0
	end
	
	for i = 1, 3 do
		local nAttr,nLv = GetItemAttr(nMountIndex, i)
		if nAttr ~= 0 and nLv ~= 0 then
			Talk(1, "", "Chi�n T��ng nguy�n so�i n�y �� c� t�c �� di chuy�n, kh�ng th� d�ng �� ��i!")
    			return 0
		end
	end
	
	local nExpire = GetItemExpireTime(nMountIndex) + (60 * 24 * 3600)
	if nExpire <= 0 or nExpire == nil then
		nExpire = 90 * 24 * 3600
	end
	UnEquipAtPosition(10)
	if DelItemByIndex(nMountIndex, -1) == 1 then
		gf_AddItemEx2({0, 105, 30033, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n T��ng", "Hoang Kim Thuong Nhan", "��i Chi�n T��ng nguy�n so�i", nExpire)
	end
end
-- ��i �i�m kinh nghi�m l�y �i�m t�ch l�y 
function ChangeAccumulate()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	if GetLevel() < 74 then
		Talk(1,"","Level c�a b�n d��i 74")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","B�n ch�a gia nh�p m�n ph�i")
		return 0
	end
	-- Ki�m tra k�ch ho�t ho�ng kim l�nh b�i ch�a
	if CheckActivated() ~= 2 then
		Talk(1,"","B�n kh�ng ph�i V� l�m ti�n b�i")
		return 0
	end
	
	local nDate = tonumber(date("%y%m%d"))
	local nDay = mod(GetTask(TSK_HKLB_POINT),1000000)	
	--local nSel = floor(GetTask(TSK_HKLB_POINT)/1000000)
	
	if nDate ~= nDay then
		SetTask(TSK_HKLB_POINT,nDate)
	end
	
--	if nSel >= 5 then
--		Talk(1,"","H�m nay b�n �� ��i h�n 5 �i�m t�ch l�y.")
--		return 0
--	end
	
	local tSay = 	{}	
	tinsert(tSay, "Ta mu�n ��i 1 �i�m t�ch l�y/#DoChangeAccumulate(1)")
	tinsert(tSay, "Ta mu�n ��i 5 �i�m t�ch l�y/#DoChangeAccumulate(5)")
	tinsert(tSay, "Xem �i�m t�ch l�y/DisplayPoint")
	tinsert(tSay, "Quay l�i trang tr��c  /main")		
	Say("Ta mu�n ��i �i�m t�ch l�y. ", getn(tSay)  ,tSay)
	
end
------

function DoChangeAccumulate(nzType)
	-- D� �o�n fix l�i hack shop v� l�m ti�n b�i
		if  IsPlayerDeath() ~= 0 then
			Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c nh�n th��ng")
			return
		end
	local nSel = floor(GetTask(TSK_HKLB_POINT)/1000000)
	if nSel >= 5 then
			Talk(1,"","H�m nay ��i hi�p �� ��i h�n 5 �i�m t�ch l�y.")
			return 0
	end
	
	if nzType == 1 then
		if GetExp() < 20000000 then
			Talk(1,"","��i hi�p ch�a �� �i�m kinh nghi�m �� ��i �i�m t�ch l�y")
			return 0
		end
		ModifyExp(-20000000)
		SetTask(TSK_HKLB_POINT, GetTask(TSK_HKLB_POINT)+ 1000000)
		SetTask(TSK_HKLB_REWARD , GetTask(TSK_HKLB_REWARD) + 1)
		Msg2Player("��i hi�p �� nh�n ���c  1 �i�m t�ch l�y")
	end
	
	if nzType == 5 then
		if nSel >= 1 then
			Talk(1,"","B�n kh�ng �� �ii�u ki�n ��i 5 �i�m t�ch l�y h�m nay")
			return 0
		end
		if GetExp() < 5*20000000 then
			Talk(1,"","��i hi�p ch�a �� �i�m kiinh nghi�m �� ��i �i�m t�ch l�y")
			return 0
		end
		ModifyExp(-5*20000000)
		SetTask(TSK_HKLB_POINT, GetTask(TSK_HKLB_POINT)+ 5000000)
		SetTask(TSK_HKLB_REWARD , GetTask(TSK_HKLB_REWARD) + 5)
		Msg2Player("��i hi�p �� nh�n ���c  5 �i�m t�ch l�y")
	end
	
end


function ChangeVLTBShop()
	
	if GetLevel() < 74 then
		Talk(1,"","Level c�a b�n d��i 74")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","B�n ch�a gia nh�p m�n ph�i")
		return 0
	end
	-- Ki�m tra k�ch ho�t ho�ng kim l�nh b�i ch�a
	if CheckActivated() ~= 2 then
		Talk(1,"","B�n kh�ng ph�i V� l�m ti�n b�i")
		return 0
	end
	
	local tSay = 	{}	
	tinsert(tSay, "��i �inh H�n Thi�n Th�ch Th�n Th�ch/#ChangeVLTBShopType(1)")
	tinsert(tSay, "��i L�ng Ba Vi B�/#ChangeVLTBShopType(2)")
	tinsert(tSay, "��i 8 N� Oa Tinh Th�ch /#ChangeVLTBShopType(3)")	
	tinsert(tSay, "��i N�n S� M�n 4/#ChangeVLTBShopType(4)")
	tinsert(tSay, "��i A� S� M�n 4 /#ChangeVLTBShopType(5)")
	tinsert(tSay, "��iQu�n S� M�n 4 /#ChangeVLTBShopType(6)")	
	tinsert(tSay, "��i Trang S�c 1 S� M�n 4 /#ChangeVLTBShopType(7)")
	tinsert(tSay, "��iTrang S�c 2 S� M�n 4 /#ChangeVLTBShopType(8)")	
	tinsert(tSay, "��i 3 Thi�n Th�ch Qu�i Th�ch /#ChangeVLTBShopType(9)")
	tinsert(tSay, "��i Thi�n Th�ch Linh Th�ch /#ChangeVLTBShopType(10)")
	tinsert(tSay, "��i 5  Phi Y�n Th�ch /#ChangeVLTBShopType(11)")
	tinsert(tSay, "Quay l�i trang tr��c /main")
	
	Say("C�a H�ng V� L�m Ti�n B�i. ", getn(tSay),tSay)
end

function ChangeVLTBShopType(nType)
		if gf_Judge_Room_Weight(8, 500, "Ho�ng Kim Th��ng Nh�n : ") == 0 then
			return
		end
		
		if (gf_GetTaskBit(TSK_HKLB_EXCHANGE, nType) == 1) then
			Talk(1,"","B�n �� ��i v�t ph�m n�y r�i")
			return 0
		end
		
		if  (GetTask(TSK_HKLB_REWARD) >= tbChangeAccumulateVLTB[nType][1])  then
			SetTask(TSK_HKLB_REWARD, GetTask(TSK_HKLB_REWARD) - tbChangeAccumulateVLTB[nType][1])
			if ( nType < 4 ) or (nType > 8 ) then
				gf_AddItemEx2(tbChangeAccumulateVLTB[nType][3], tbChangeAccumulateVLTB[nType][2], szHKLBLogHeader,szHKLBLogAction, tbChangeAccumulateVLTB[nType][4])
				Msg2Player("B�n nh�n ���c "..tbChangeAccumulateVLTB[nType][3][4].." "..tbChangeAccumulateVLTB[nType][2])
			else
				Confirm_make_shimen_tier4HKLB(nType-3)
			end 
			gf_SetTaskBit(TSK_HKLB_EXCHANGE, nType,1)
		else
			Talk(1,"","B�n kh�ng �� �i�m t�ch l�y.")
		end
end

function DisplayPoint()
	Talk(1,"","�i�m t�ch l�y c�a b�n "..GetTask(TSK_HKLB_REWARD))
end

function buy_HKL(nSelected)
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead ="Hi�n t�i ch� c�a ta c� b�n V� L�m Ho�ng Kim L�nh"
	if nSelected == 1 then
		tinsert(tbSayDialog,"Ta mu�n mua 1 V� L�m Ho�ng Kim L�nh (8 v�ng)/#confirm_buy_HKL(1)")
		tinsert(tbSayDialog,"Ta mu�n mua 10 V� L�m Ho�ng Kim L�nh (80 v�ng)/#confirm_buy_HKL(2)")	
		tinsert(tbSayDialog,"Ta mu�n mua 100 V� L�m Ho�ng Kim L�nh(800 v�ng)/#confirm_buy_HKL(3)")
		tinsert(tbSayDialog,"T�i h� ch� gh� ngang!/main")
	end
	if nSelected == 2 then
		tinsert(tbSayDialog,"Ta mu�n mua 1 V� L�m Ho�ng Kim L�nh (2 Xu v�t ph�m)/#confirm_buy_HKL(4)")
		tinsert(tbSayDialog,"Ta mu�n mua 10 V� L�m Ho�ng Kim L�nh (20 Xu v�t ph�m)/#confirm_buy_HKL(5)")	
		tinsert(tbSayDialog,"Ta mu�n mua 100 V� L�m Ho�ng Kim L�nh(200 Xu v�t ph�m)/#confirm_buy_HKL(6)")
		tinsert(tbSayDialog,"T�i h� ch� gh� ngang!/main")
	end
	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

tbHKLPrice = {
	[1] = {80000, 0, 1},
	[2] = {800000, 0, 10},
	[3] = {8000000, 0, 100},
	[4] = {0, 2, 1},
	[5] = {0, 20, 10},
	[6] = {0, 200, 100},
}

function confirm_buy_HKL(nSelected)
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		Talk(1,"","H�nh trang kh�ng �� � tr�ng ho�c �� n�ng")
		return
	end
	if GetCash() < tbHKLPrice[nSelected][1] then
		Talk(1, "", "B�n kh�ng mang theo �� V�ng!")
		return
	end
	if GetItemCount(2, 1, 30230) < tbHKLPrice[nSelected][2] then
		Talk(1, "", "B�n kh�ng mang theo �� Xu v�t ph�m!")
		return
	end
	
	if nSelected <= 3 then
		Pay(tbHKLPrice[nSelected][1])
	else
		DelItem(2, 1, 30230, tbHKLPrice[nSelected][2])
	end

	gf_AddItemEx2({2,1,30284,tbHKLPrice[nSelected][3]}, "Ho�ng Kim L�nh", "MUA HOANG KIM LENH", "th�nh c�ng")
end

-- ��i �i�m kinh nghi�m l�y �i�m t�ch l�y 
function ChangeAccumulateBKL(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	if GetLevel() < 74 then
		Talk(1,"","Level c�a b�n d��i 74")
		return 0
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1,"","B�n ch�a gia nh�p m�n ph�i")
		return 0
	end
	-- Ki�m tra k�ch ho�t b�ch kim l�nh b�i ch�a
	if CheckActivatedExt_BKL() ~= 2 then
		Talk(1,"","B�n kh�ng ph�i Tuy�t Th� Cao Nh�n")
		return 0
	end
	
	local nDate = tonumber(date("%y%m%d"))
	local nDay = mod(GetTask(TSK_BKLB_POINT),1000000)	
	--local nSel = floor(GetTask(TSK_BKLB_POINT)/1000000)
	
	if nDate ~= nDay then
		SetTask(TSK_BKLB_POINT,nDate)
	end
	
--	if nSel >= 5 then
--		Talk(1,"","H�m nay b�n �� ��i h�n 5 �i�m t�ch l�y.")
--		return 0
--	end
	
	local tSay = 	{}	
	tinsert(tSay, "Ta mu�n ��i 1 �i�m t�ch l�y/#DoChangeAccumulateBKL("..nType..",1)")
	tinsert(tSay, "Ta mu�n ��i 5 �i�m t�ch l�y/#DoChangeAccumulateBKL("..nType..",2)")
	tinsert(tSay, "Ta mu�n ��i 50 �i�m t�ch l�y/#DoChangeAccumulateBKL("..nType..",5)")
--	tinsert(tSay, "Ta mu�n ��i 100 �i�m t�ch l�y/#DoChangeAccumulateBKL(3)")
--	tinsert(tSay, "Ta mu�n ��i 200 �i�m t�ch l�y/#DoChangeAccumulateBKL(4)")
--	tinsert(tSay, "Ta mu�n ��i 500 �i�m t�ch l�y/#DoChangeAccumulateBKL(6)")
	
	tinsert(tSay, "Xem �i�m t�ch l�y/DisplayPointBKL")
	tinsert(tSay, "Quay l�i trang tr��c  /main")		
	Say("Ta mu�n ��i �i�m t�ch l�y. ", getn(tSay)  ,tSay)
	
end
function DisplayPointBKL()
	Talk(1,"","�i�m t�ch l�y c�a b�n "..GetTask(TSK_BKLB_REWARD))
end
tbChange = {
		[1] = {1, 0, 2},
		[2] = {5, 0, 10},
		[3] = {100, 0, 200},
		[4] = {200, 0, 400},
		[5] = {50, 0, 100},
		[6] = {500, 0, 1000},
	}
function DoChangeAccumulateBKL(nType, nzType) --nType: lo�i ti�u hao, nzType: lo�i �i�m ��i
	-- D� �o�n fix l�i hack shop v� l�m ti�n b�i
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c nh�n th��ng")
		return
	end
	local nSel = floor(GetTask(TSK_BKLB_POINT)/1000000)
	if nSel + tbChange[nzType][1] > 856 then
			Talk(1,"","M�i ng�y ch� ��i ���c 856 �i�m t�ch l�y.")
			return 0
	end
	if nType == 1 then
		if GetExp() < tbChange[nzType][1] * 22222222 then
			Talk(1,"","��i hi�p ch�a �� �i�m kinh nghi�m �� ��i �i�m t�ch l�y")
			return 0
		end
		if GetItemCount(2,1,30230) < tbChange[nzType][3] then
			Talk(1,"","��i hi�p kh�ng c� �� Xu v�t ph�m �� ��i �i�m t�ch l�y")
			return 0
		end
	elseif nType == 2 then
		if GetItemCount(2,1,30390) < 2*tbChange[nzType][1] then		--m�nh thi�n cang
			Talk(1,"","��i hi�p kh�ng c� �� M�nh thi�n cang �� ��i �i�m t�ch l�y")
			return 0
		end
		if GetItemCount(2,1,30410) < 2*tbChange[nzType][1] then
			Talk(1,"","��i hi�p kh�ng c� �� M�nh Thi�n M�n �� ��i �i�m t�ch l�y")
			return 0
		end
		if GetItemCount(2,1,30340) < 22*tbChange[nzType][1] then
			Talk(1,"","��i hi�p kh�ng c� �� M�c R��ng �� ��i �i�m t�ch l�y")
			return 0
		end
		if GetCash() < 220000*tbChange[nzType][1] then
			Talk(1,"","��i hi�p kh�ng c� �� V�ng �� ��i �i�m t�ch l�y")
			return 0
		end
	end
	local nCheckDel = 0
	if nType == 1 then
		DelItem(2,1,30230, tbChange[nzType][3])
		ModifyExp(-tbChange[nzType][1] * 22222222)
		nCheckDel = 1
		gf_WriteLogEx("Loi Ho Lenh", "��i th�nh c�ng", 1, "��i "..tbChange[nzType][1].."�i�m theo hu�ng 2 xu + Exp")
	elseif nType == 2 then
		DelItem(2,1,30390, 2*tbChange[nzType][1])
		DelItem(2,1,30410, 2*tbChange[nzType][1])
		DelItem(2,1,30340, 22*tbChange[nzType][1])
		Pay(220000*tbChange[nzType][1])
		nCheckDel = 1
		gf_WriteLogEx("Loi Ho Lenh", "��i th�nh c�ng", 1,  "��i "..tbChange[nzType][1].."�i�m theo hu�ng 2mtc + 2mtm + 22 m?c ruong + 22 v�ng")
	end
	if nCheckDel == 1 then
		SetTask(TSK_BKLB_POINT, GetTask(TSK_BKLB_POINT)+ (tbChange[nzType][1] * 1000000)) --task ��i �i�m trong ng�y
		SetTask(TSK_BKLB_REWARD , GetTask(TSK_BKLB_REWARD) + tbChange[nzType][1])	--task t�ng �i�m
		Msg2Player("��i hi�p �� nh�n ���c "..tbChange[nzType][1].." �i�m t�ch l�y")
	 	gf_WriteLogEx("Loi Ho Lenh", "��i th�nh c�ng", 1, "�i�m t�ch l�y lo�i "..tbChange[nzType][1])
	 end

end

function ChangeVLTBShopBKL()
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c nh�n th��ng")
		return
	end
	if GetLevel() < 74 then
		Talk(1,"","Level c�a b�n d��i 74")
		return 0
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","B�n ch�a gia nh�p m�n ph�i")
		return 0
	end
	-- Ki�m tra k�ch ho�t ho�ng kim l�nh b�i ch�a
	if CheckActivatedExt_BKL() ~= 2 then
		Talk(1,"","B�n kh�ng ph�i Tuy�t Th� Cao Th�")
		return 0
	end
	
	local tSay = 	{}	
--	if GetExtPoint(1) == 1 then
--		tinsert(tSay, "��i 45 Ch�a Kh�a V�ng (480 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(28)")	
--	end
	tinsert(tSay, "��i 50 Ch�a Kh�a V�ng (1350 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(1)")	
	tinsert(tSay, "��i Th� �en (400 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(2)")		
	tinsert(tSay, "��i B�o �en B�o B�o (600 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(3)")	
	tinsert(tSay, "��i Ti�n Du Ki�m (600 �i�m - kh�ng th� giao d�ch)/#ChangeVLTBShopTypeBKL(4)")		
--	tinsert(tSay, "��i Th��ng �ng �� Th�ng - N�n (290 �i�m - kh�ng th� giao d�ch)/#ChangeVLTBShopTypeBKL(7)")	
--	tinsert(tSay, "��i Th��ng �ng �� Th�ng - A� (290 �i�m - kh�ng th� giao d�ch)/#ChangeVLTBShopTypeBKL(8)")	
--	tinsert(tSay, "��i Th��ng �ng �� Th�ng - Qu�n (290 �i�m - kh�ng th� giao d�ch)/#ChangeVLTBShopTypeBKL(9)")	
--	tinsert(tSay, "��i Th��ng �ng Ti�n Phong - Ph� (450 �i�m - kh�ng th� giao d�ch)/#ChangeVLTBShopTypeBKL(10)")	
--	tinsert(tSay, "��i Th��ng �ng Ti�n Phong - K� (450 �i�m - kh�ng th� giao d�ch)/#ChangeVLTBShopTypeBKL(11)")	
	tinsert(tSay, "��i Thi�n Th�ch Linh Th�ch (660 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(5)")		
	tinsert(tSay, "��i �inh H�n Thi�n Th�ch Th�n Th�ch (880 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(6)")
	tinsert(tSay, "��i ��i ��nh H�n l�n 1 (1100 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(7)")		
	tinsert(tSay, "��i 12 N� Oa Tinh Th�ch (390 �i�m - kh�ng giao d�ch)/#ChangeVLTBShopTypeBKL(8)")		
--	tinsert(tSay, "��i �inh H�n Thi�n Th�ch Th�n Th�ch (150 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(9)")
	tinsert(tSay, "��i 15 M�t t�ch m�n ph�i 70 cao c�p (100 �i�m - c� th� giao d�ch)/ChangeVLTBShopBKL_Mattich70")	---------- Bit 10	

	tinsert(tSay, "Trang k� /ChangeVLTBShopBKL2")
	tinsert(tSay, "Quay l�i trang tr��c /main")
	
	Say("C�a H�ng V� L�m Ti�n B�i. ", getn(tSay),tSay)
end

function ChangeVLTBShopBKL2()
	
	local tSay = 	{}		

	tinsert(tSay, "��i Chuy�n Sinh ��n l�n 1 (300 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(11)")	
	tinsert(tSay, "��i L�ng Ba Vi B� (50 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(12)")	
	tinsert(tSay, "��i 500 Ma Tinh (1650 �i�m - kh�ng th� giao d�ch)/#ChangeVLTBShopTypeBKL(13)")
	tinsert(tSay, "��i 200 C� Linh Th�ch (200 �i�m - kh�ng th� giao d�ch)/#ChangeVLTBShopTypeBKL(14)")
	tinsert(tSay, "��i 200 C� Linh Ng�c (300 �i�m - kh�ng th� giao d�ch)/#ChangeVLTBShopTypeBKL(15)")	
	tinsert(tSay, "��i 10 C��ng H�a Quy�n C�p 12 (110 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(16)")
	tinsert(tSay, "��i 10 C��ng H�a Quy�n C�p 13 (250 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(17)")
	tinsert(tSay, "��i 10 C��ng H�a Quy�n C�p 14 (550 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(18)")
	tinsert(tSay, "��i 10 C��ng H�a Quy�n C�p 15 (1200 �i�m - c� th� giao d�ch)/#ChangeVLTBShopTypeBKL(19)")	
	tinsert(tSay, "��i Danh hi�u Tuy�t Th� Cao Nh�n (200 �i�m - c� th� giao d�ch)/ChangeVLTBShopBKL_DanhHieu")			---------- Bit 120

	tinsert(tSay, "Quay l�i trang tr��c /ChangeVLTBShopBKL")
	Say("C�a H�ng V� L�m Ti�n B�i. ", getn(tSay),tSay)
end
--function ChangeVLTBShopTypeBKL_Select()
--	local nRoute = GetPlayerRoute()	
--	if nRoute == 2 then
--		local tSay = 	{}		
--		tinsert(tSay, "��i V� Kh�  �ao (80 �i�m - kh�ng giao d�ch) /#ChangeVLTBShopTypeBKL_SelectType(1)")		
--		tinsert(tSay, "��i V� Kh�  B�ng (80 �i�m - kh�ng giao d�ch) /#ChangeVLTBShopTypeBKL_SelectType(2)")		
--		Say("C�a H�ng V� L�m Ti�n B�i. ", getn(tSay),tSay)
--		return
--	else
--		ChangeVLTBShopTypeBKL(11)
--	end
--end
--function ChangeVLTBShopTypeBKL_SelectType(nType)
--	if  IsPlayerDeath() ~= 0 then
--			Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c nh�n th��ng")
--	return
--	end
--	if gf_Judge_Room_Weight(8, 500, "Ho�ng Kim Th��ng Nh�n : ") == 0 then
--		return
--	end
--	
--	if (gf_GetTaskBit(TSK_BKLB_EXCHANGE, 11) == 1) then
--		Talk(1,"","B�n �� ��i v�t ph�m n�y r�i")
--		return 0
--	end
--	if  GetTask(TSK_BKLB_REWARD) < 80  then
--			Talk(1,"","B�n kh�ng �� �i�m t�ch l�y.")
--			return
--	end
--	local nRoute = GetPlayerRoute()	
--	local nBody = GetBody();
--	SetTask(TSK_BKLB_REWARD, GetTask(TSK_BKLB_REWARD) - 80)
--	gf_AddItemEx2(tb_VK_SuMon_DB[nRoute][2][nBody][nType], tb_VK_SuMon_DB[nRoute][1], szBKLBLogHeader, "nh�n ���c")			
--	gf_SetTaskBit(TSK_BKLB_EXCHANGE, 11,1)
--end
function ChangeVLTBShopTypeBKL(nType)
		if  IsPlayerDeath() ~= 0 then
				Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c nh�n th��ng")
		return
		end
		if gf_Judge_Room_Weight(15, 500, "Ho�ng Kim Th��ng Nh�n : ") == 0 then
			return
		end
		if nType == 1 then
			if gf_Judge_Room_Weight(55, 500, "Ho�ng Kim Th��ng Nh�n : ") == 0 then
				return
			end
		end
--		if (gf_GetTaskBit(TSK_BKLB_EXCHANGE, nType) == 1) then
--			Talk(1,"","B�n �� ��i v�t ph�m n�y r�i")
--			return 0
--		end
		local nRoute = GetPlayerRoute()	
		local nBody = GetBody();
		if GetTask(TSK_BKLB_REWARD) >= tbChangeAccumulateVLTBBKL[nType][1] then
			SetTask(TSK_BKLB_REWARD, GetTask(TSK_BKLB_REWARD) - tbChangeAccumulateVLTBBKL[nType][1])
			gf_AddItemEx2(tbChangeAccumulateVLTBBKL[nType][3], tbChangeAccumulateVLTBBKL[nType][2], szBKLBLogHeader,szBKLBLogAction, tbChangeAccumulateVLTBBKL[nType][4])
			Msg2Player("B�n nh�n ���c "..tbChangeAccumulateVLTBBKL[nType][3][4].." "..tbChangeAccumulateVLTBBKL[nType][2])		
			 gf_WriteLogEx("Loi Ho Lenh", "��i th�nh c�ng", 1, "��i th�nh c�ng lo�i "..tbChangeAccumulateVLTBBKL[nType][2])	
--			if ( nType < 7 ) or (nType > 11 ) then
--				gf_AddItemEx2(tbChangeAccumulateVLTBBKL[nType][3], tbChangeAccumulateVLTBBKL[nType][2], szBKLBLogHeader,szBKLBLogAction, tbChangeAccumulateVLTBBKL[nType][4])
--				Msg2Player("B�n nh�n ���c "..tbChangeAccumulateVLTBBKL[nType][3][4].." "..tbChangeAccumulateVLTBBKL[nType][2])
--			elseif nType == 7 or nType == 8 or nType == 9 then
--				local nGenre = 0
--				local szItemName = "Th��ng �ng �� Th�ng "
--				local nID = 30028
--				local szPhe = "T�ng "
--				if GetTask(701) < 0 then
--					nID = 30040
--					szPhe = "Li�u "
--				end
--				if nType == 8 then
--					nGenre = 100
--					szItemName = szPhe .. szItemName .. "Gi�p"
--				elseif nType == 9 then
--					nGenre = 101
--					szItemName = szPhe .. szItemName .. "Trang"
--				elseif nType == 7 then
--					nGenre = 103
--					szItemName = szPhe .. szItemName .. "Kh�i"
--				end
--				local tbAward = {item = {{gdp={0,nGenre,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = szItemName}}}
--				LIB_Award.szLogTitle = szBKLBLogHeader
--				LIB_Award.szLogAction = "nh�n"
--				LIB_Award:Award(tbAward)
--				--gf_AddItemEx2(tb_VK_SuMon0[nRoute][2][nBody], tb_VK_SuMon0[nRoute][1], szBKLBLogHeader, "nh�n ���c")						
--			elseif nType == 10 or nType == 11 then
--				local szItemName = "Th��ng �ng Ti�n Phong "
--				local nID = 30043
--				local szPhe = "T�ng "
--				if GetTask(701) < 0 then
--					nID = 30079
--					szPhe = "Li�u "
--				end
--				
--				if nType == 11 then
--					szItemName = szPhe .. szItemName .. "K�"
--				elseif nType == 10 then
--					szItemName = szPhe .. szItemName .. "Ph�"
--					nID = nID + 4
--				end
--				local tbAward = {item = {{gdp={0,102,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = szItemName}}}
--				LIB_Award.szLogTitle = szBKLBLogHeader
--				LIB_Award.szLogAction = "nh�n"
--				LIB_Award:Award(tbAward)
--			end 
--			gf_SetTaskBit(TSK_BKLB_EXCHANGE, nType,1)
		else
			Talk(1,"","B�n kh�ng �� �i�m t�ch l�y.")
			return
		end
end

function get_award_CS1()
	local tbPhanThuongCS1 ={
		[1] = {"c0000099999", "Ibrahim"},
		[2] = {"thinhdance18", "zS2zHDCafe"},
		[3] = {"motcuocdoituoidep", "VangB�ngM�tTh�i"},
		[4] = {"soemden007", "xIPhuDuIx"},
		[5] = {"heomoiquay6699", "TrumMaFiA"},
		[6] = {"riverplate6868", "zzTieuLongNuzz"},
		[7] = {"zkhoaipro", "zKhoaiProz"},
}
local VD =
	{
		{0,103,8000,"Vi�m �� Kh�i"},
		{0,100,8000,"Vi�m �� Gi�p"},
		{0,101,8000,"Vi�m �� Trang"},
	}
	if GetTask(2701) == 1 then
		Talk(1, "", "B�n �� nh�n ph�n th��ng n�y r�i !!!")
		return
	end
	if gf_Judge_Room_Weight(4,100, "Ph�n th��ng �ua TOP") == 0 then
		return
	end
	local nCheckHaveList = 0
	local nHaveInList = 0
	local nLv = 0
	for i = 1, getn(tbPhanThuongCS1) do
		if GetAccount() == tbPhanThuongCS1[i][1] or GetName() == tbPhanThuongCS1[i][2] then
			nCheckHaveList = nCheckHaveList + 1
			nHaveInList = i
		end
	end

	if nCheckHaveList == 0 then
		Talk(1, "", "B�n kh�ng c� t�n trong danh s�ch nh�n th��ng !!!")
		return	
	end
	if GetTask(1538) < 1 then
		Talk(1, "", "B�n ch�a ho�n th�nh vi�c �ua TOP n�n kh�ng th� nh�n th��ng !!!")
		return	
	end
	if GetTask(2701) == 0 and GetGlbValue(1023) == 70 and GetAccount() == tbPhanThuongCS1[nHaveInList][1] and GetName() == tbPhanThuongCS1[nHaveInList][2] then
		Msg2Player("B�n �� nh�n ph�n th��ng �ua TOP c�a Chuy�n Sinh 1 th�nh c�ng !!!")
		Talk(1, "", "B�n �� nh�n ph�n th��ng �ua TOP c�a Chuy�n Sinh 1 th�nh c�ng !!!")
		SetTask(2701, 1)
		WriteLogEx("DUA TOP CS1 THANH LONG", "nh�n th�nh c�ng")
		if nHaveInList >= 1 and nHaveInList <= 3 then
			nLv = 12
		elseif nHaveInList >= 4 and nHaveInList <= 10 then
			nLv = 9
		elseif nHaveInList >= 11 and nHaveInList <= 19 then
			nLv = 7
		else
			nLv = 0
		end
		local nBody = GetBody()
		for i = 1 , getn(VD) do
			gf_AddItemEx2({VD[i][1],VD[i][2],VD[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nLv},VD[i][4],"DUA TOP CS1 THANH LONG","nh�n")
		end
	end
end
function ChangeVLTBShopBKL_Mattich70()
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c nh�n th��ng")
		return
	end
	if gf_Judge_Room_Weight(16, 100, "Ho�ng Kim Th��ng Nh�n : ") == 0 then
		return
	end
	
--	if (gf_GetTaskBit(TSK_BKLB_EXCHANGE, 10) == 1) then
--		Talk(1,"","B�n �� ��i v�t ph�m n�y r�i")
--		return 0
--	end
	if GetTask(TSK_BKLB_REWARD) < 100  then
			Talk(1,"","B�n kh�ng �� �i�m t�ch l�y.")
			return
	end
	local nRoute = GetPlayerRoute()	
	local nBody = GetBody();
	SetTask(TSK_BKLB_REWARD, GetTask(TSK_BKLB_REWARD) - 100)
	for i = 1, 5 do
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][13] , tb_golden_faction_tree[nRoute][12], szBKLBLogHeader, "nh�n ���c")
		gf_WriteLogEx("Loi Ho Lenh", "��i th�nh c�ng", 1, "��i th�nh c�ng lo�i m�t t�ch")
	end
--	gf_SetTaskBit(TSK_BKLB_EXCHANGE, 10,1)
end

function ChangeVLTBShopBKL_DanhHieu()
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c nh�n th��ng")
		return
	end
	if GetTask(TSK_BKLB_REWARD) < 200  then
		Talk(1,"","B�n kh�ng �� �i�m t�ch l�y.")
		return
	end	
	SetTask(TSK_BKLB_REWARD, GetTask(TSK_BKLB_REWARD) - 200)	
	AddTitle(22,15)
	SetTitleTime(22, 15, GetTime() + 3600 * 24 * 30)
	gf_WriteLogEx("Loi Ho Lenh", "��i th�nh c�ng", 1, "��i th�nh c�ng lo�i danh hi�u ")
end

function Unlocl_LangBa_BKL()
	if GetItemCount(0,112,158) < 1 then
		Talk(1,"","B�n kh�ng c� L�ng Ba Vi B� to�n t�p �� m� kh�a")
		return	
	end
	if GetItemCount(2,1,1006) < 2 then
		Talk(1,"","B�n kh�ng c� 2 C�u Thi�n V� C�c ��n �� m� kh�a L�ng Ba Vi B� to�n t�p")
		return	
	end
	if DelItem(0,112,158,1) == 1 and DelItem(2,1,1006,2) == 1 then
		gf_AddItemEx2({0,112,158,1,1}, "L�ng Ba Vi B� to�n t�p", szBKLBLogHeader, "M� kh�a")
	end
end

function hklb_DoNothing()

end