Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");

PROMOTION_EVERYDAY = "Khuyen Mai Moi Ngay"


tb_Saleoff =
{
	[1] = {"baothienthach","H�a Th� B�ch"},
}

proday =
{
	fileName = "data/proday.txt",
	count = 0,
	listFormat = "(.+)	(.+)	(.+)",
	tList = {},
}

if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
	proday.fileName = "data\\proday.txt"
else
	proday.fileName = "data/proday.txt"
end

function proday:load()
	local pf = openfile(self.fileName, "r");
	if not pf then 
		proday:save()
		return
	end
	local str = ""	
	self.count  = 0
	self.tList = {}
	while 1 do
		str = read(pf, "*l");
		if not str then break end
		local _,_,sItemName, nNum, nNgay = strfind(str, self.listFormat)
--		print(sItemName)
--		print(nNum)
		self.tList[sItemName] = {tonumber(nNum), tonumber(nNgay)}
--		print(self.tList[sItemName][1])
	end
	closefile(pf);
end

function proday:save()
	local pf = openfile(self.fileName, "w")
--	print("qua day chua")
	if not pf then return end
--	print("qua day roi")
--	print(getn(self.tList))
	for i = 1, 1 do
		local nItemSale = tb_Saleoff[i][1]
		local nDate = tonumber(date("%Y%m%d"))		
--		print("Gia tri truoc khi ghi file"..self.tList[nItemSale][1])
		write(pf, format("%s	%d	%d\n", tb_Saleoff[i][1], self.tList[nItemSale][1], nDate));
	end
	closefile(pf);
end

function proday:register()
	local nItemSale = tb_Saleoff[1][1];
	if self.tList[nItemSale][1] >= 1 then
--		print("Gia tri truoc khi tru"..self.tList[nItemSale][1])
		self.tList[nItemSale][1] = self.tList[nItemSale][1] - 1;
--		print("Gia tri sau khi tru"..self.tList[nItemSale][1])
		self:save();
		return 1
	end
	return 0
end

function main()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Ch��ng tr�nh khuy�n m�i gi� r�, v�t ph�m �ang gi�m gi� <color=green>H�a Th� B�ch<color> gi� <color=yellow>500 V�t ph�m Xu (h�n s� d�ng 7 ng�y)<color> ."
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20120425 and nDate <=20120502 then
		tinsert(tbSayDialog, "Mua H�a Th� B�ch /get_selloff")
		tinsert(tbSayDialog, "Xem s� l��ng c�n l�i trong ng�y /get_infor")
	end
	tinsert(tbSayDialog, "Ta ch� gh� ngang /do_nothing")
	
	nSaySize = getn(tbSayDialog)
	Say(szSayHead, nSaySize, tbSayDialog);
end

function get_selloff()
	local nTime = tonumber(date("%H%M"))
	if nTime < 0800 or nTime > 2400 then
		Talk(1,"","Hi�n t�i ch�a ��n gi� b�n, ��i hi�p h�y quay l�i sau nha !!!")		
		return
	end
	local tbSayDialog = {};
	tinsert(tbSayDialog, "��ng � /confirm_buy")
	tinsert(tbSayDialog, "Ta ch� gh� ngang /do_nothing")	
	Say("Ch��ng tr�nh khuy�n m�i gi� r�", getn(tbSayDialog), tbSayDialog);
end
function get_infor()
	proday:load()
	local nNumremain = 0
	local nDate = tonumber(date("%Y%m%d"))
	if nDate ~= proday.tList["baothienthach"][2] then
		nNumremain = 500
	else
		nNumremain = proday.tList["baothienthach"][1]
	end
	Talk(1,"","S� l��ng c�n c� th� mua trong ng�y hi�n t�i l�: "..nNumremain.." c�i")	
end

function confirm_buy()
	proday:load()
	---------------------------------
	local nDate = tonumber(date("%Y%m%d"))
	local nTime = GetTime()
	print(proday.tList["baothienthach"][2])
	if nDate ~= proday.tList["baothienthach"][2] then
		proday.tList["baothienthach"][1] = 500
	end
	
	if nTime < (GetGlbValue(GLB_TASK_PROMOTION) + 6) then
		local nTimeRemain = (GetGlbValue(GLB_TASK_PROMOTION) + 6) - GetTime()
		Talk(1,"","Nhi�u ng��i mua qu�, cho ta ngh� m�t m�t t�. H�y quay l�i sau "..nTimeRemain.." gi�y n�a !!!")
		return
	end
	---------------------------------
	if proday.tList["baothienthach"][1] <= 0 then
		Talk(1,"","Th�t ��ng ti�c! �� h�t h�ng gi�m gi� r�i. Ng�y mai ��i hi�p nh� gh� s�m nh�  !!!")
		return
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� mua !!!")
		return
	end
	if gf_Judge_Room_Weight(2, 100," ") ~= 1 then
        	return
    end
	if GetItemCount(2,1,30230) < 500 then
		Talk(1,"","Hi�n kh�ng c� �� Xu, ��i hi�p vui l�ng quay l�i v�o l�c kh�c!")
		return
	end

	SetGlbValue(GLB_TASK_PROMOTION, GetTime())
	gf_WriteLogEx("THAM GIA KHUYEN MAI", "mua th�nh c�ng")
	proday:register()
	if DelItem(2, 1, 30230, 500) == 1  then
--		gf_WriteLogEx("THAM GIA KHUYEN MAI", "mua th�nh c�ng")
		gf_AddItemEx2({2, 1, 1001, 1}, "Hoa Thi Bich", PROMOTION_EVERYDAY, "mua H�a Th� B�ch", 7*24*60*60)
		Talk(1,"","C�c h� �� mua th�nh c�ng 1 H�a Th� B�ch")
		Msg2Player("C�c h� �� mua th�nh c�ng 1 H�a Th� B�ch")
	--	AddGlobalNews("Ch�c m�ng ��i hi�p <color=yellow>"..GetName().."<color> �� mua th�nh c�ng 1 Bao Thi�n Th�ch Tinh Th�ch v�i gi� r�.")
	end
end

function do_nothing()

end
