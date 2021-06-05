Include([[\script\lib.lua]]);
TI_LE_NAP=1000
MAX_KIM_PHIEU = 999999;
function main()
	do
		Say("Chuc nang tien trang dong!!", 0);
		return
	end
	local nGoldCoin = GetGoldCoin()-Coin_GS();
	if nGoldCoin <= 0 then
		Say("Mu�n r�t Kim Phi�u h�y ��n ��y!!", 0);
		return
	end
	Msg2Player("Kim Phi�u H�nh Trang:"..GetVipJinJuan())
	Say("B�n �ang c�: <color=yellow>"..(nGoldCoin*TI_LE_NAP).."<color> Kim Phi�u g�i t�i ��y<enter>L�o c� th� gi�p g� cho qu� kh�ch ��y??", 2,
		"Ta mu�n r�t Kim Phi�u/RutKimPhieu",
		"Ta nh�n ti�n gh� th�m �ng th�i m�!/nothing" )
	return
end
function Coin_GS()
	local pf = openfile("data/coin/"..GetAccount()..".txt", "r");
	if not pf then 
		return 0
	else
		local str = read(pf, "*l");
		if not str then
			Say( "Xin l�i! Kh�ch quan <color=red>"..GetName().."<color> kh�ng th� ��c d� li�u vui l�ng li�n h� GM!", 0);
			closefile(pf);
			return nil
		end
		if tonumber(str)=="" or tonumber(str)==nil then
			Say( "Xin l�i! Kh�ch quan <color=red>"..GetName().."<color> kh�ng th� ��c d� li�u vui l�ng li�n h� GM!", 0);
			closefile(pf);
			return nil
		end
		nCoinGS= tonumber(str)--Lay gia tri 
	   closefile(pf);
	   return nCoinGS
	end
end
function RutKimPhieu()
local nGoldCoin = GetGoldCoin()-Coin_GS();
Say("B�n �ang c�: <color=yellow>"..(nGoldCoin*TI_LE_NAP).."<color> Kim Phi�u t�i ��y<enter>B�n mu�n r�t bao nhi�u??", 6,
		"Ta mu�n r�t 1000 Kim Phi�u/#AddKimPhieu(1)",
		"Ta mu�n r�t 5000 Kim Phi�u/#AddKimPhieu(5)",
		"Ta mu�n r�t 10000 Kim Phi�u/#AddKimPhieu(10)",
		"Ta mu�n r�t 50000 Kim Phi�u/#AddKimPhieu(50)",
		"Ta mu�n r�t t�t c� Kim Phi�u/#AddKimPhieu("..nGoldCoin..")",
		"Ta nh�n ti�n gh� th�m �ng th�i m�!/nothing" )
end

function AddKimPhieu(nSoLuong)
	local nCoinWeb = GetGoldCoin();
	local nID=GetAccount()
	local nCoinGS=Coin_GS()
	local nKimPhieu=nCoinWeb-nCoinGS
	local nKimPhieuAdd=nSoLuong*TI_LE_NAP
	if not nSoLuong or tonumber(nSoLuong) < 0 then
		return 0;
	end
	local nValueAfter = GetVipJinJuan() + tonumber(nKimPhieuAdd);
	if nValueAfter >= MAX_KIM_PHIEU then
		Say( "S� l��ng r�t qu� gi�i h�n "..MAX_KIM_PHIEU.."!", 0);
		return 0;
	end
	if nKimPhieu<=0 then
		Say( "B�n kh�ng c� Kim Phi�u l�u t�i ��y!", 0);
		return
	end
	if nKimPhieu>=nSoLuong then
		if -1 == ModifyJinJuan(nKimPhieuAdd, 1)then
			return 0
		end
		Say("B�n nh�n ���c <color=yellow>"..(nKimPhieuAdd).."<color> Kim Phi�u", 0);
		WriteLogInfo("data/coin/", ""..nID..".txt", nCoinGS+nSoLuong)
		WriteLog("["..date("%y%m%d%H%M").."]\t[R�t Kim Phi�u]\t"..nID.."\t"..GetName().."\tr�t\t"..(nKimPhieuAdd).." kim phi�u")
		KP_WriteLog("%s\tAccount:%s\tRoleName:%s\tr�t\t%d",date("%y%m%d%H%M%S"),GetAccount(), GetName(),nKimPhieuAdd);
	else
		Say( "S� Kim Phi�u l�u t�i ��y ch� c� "..nKimPhieu.." th�p h�n so v�i l�nh r�t !", 0);
	end
end
function WriteLogInfo(filePath, strFileName, strString)	
	local file = openfile(filePath..strFileName,  "w+")
	if file == nil then
		execute(format("mkdir -p %s", filePath))
		file = openfile(filePath..strFileName,  "w+")
	end
	write(file,tostring(strString));
	closefile(file);
end
function KP_WriteLog(strFormat, ...)
	local strLogPath = "logs/kim_phieu/"
	local strLog = format(strFormat, unpack(arg));
	local strDate = date("%Y_%m_%d");
	local strLogFile = format("rut_kim_phieu_%s.log", strDate);
	local strLogFilePath = format("%s%s",strLogPath, strLogFile);

	local hFile = openfile(strLogFilePath, "a+");
	if (hFile == nil) then
		execute(format("mkdir \"%s\"", strLogPath));
		hFile = openfile(strLogFilePath, "a+");
	end
	if (hFile ~= nil) then
		write (hFile, strLog .. "\n");
		closefile (hFile);
	end
end
function nothing()
end