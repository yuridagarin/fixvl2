Include("\\script\\lib\\globalfunctions.lua");
function OnPutinCheck(param, idx, genre, detail, particular)
	local tbDanhSachLHTD = {
		[1] = {"angelkaka20589" ,"S2joKeoSuaojS2" ,32,8054,14,2},
		[2] = {"mighty00"       ,"oKPPzTheMythz"  ,43,8054,10,2},
		[3] = {"thinmeo88"      ,"ZhWoongCuiBap"  ,32,8054,0 ,1},
		[4] = {"quanbatai2006"  ,"zIzBachCotTinh" ,23,8054,0 ,1},
		[5] = {"doibonba83"     ,"iS2iBomPiit"    ,1 ,8000,10,4},
		[6] = {"nhocvip14"      ,"XxXnuconuongXxX",7 ,8000,10,4},
		[7] = {"giaosi1"        ,"zIzCafe"        ,23,8000,10,1},
		[8] = {"ppppppppp1701"  ,"zConHeoCon"     ,23,8000,10,1},
		[9] = {"supperbom200283","iPeMaiAnh"      ,1 ,8000,10,1},
		[10] = {"kecodonvtvn"   ,"oIzZHeoSuaZzIo" ,22,8000,10,1},
		[11] = {"sangnghi2008"  ,"iZDauKhoViAi"   ,52,8000,10,2},
		[12] = {"volam2192620"  ,"oMightyMouse"   ,10,8000,10,4},
		[13] = {"luyencap12"    ,"IzThietCamLam"  ,33,8000,10,1},
		[14] = {"yndtmndhp"     ,"NungTriCao"     ,2 ,8000,10,4},
		[15] = {"duylong91x"    ,"izMrDiana"      ,32,8000,10,3},
		[16] = {"kissdo37"      ,"cChiPheo"       ,3 ,8000,10,1},
	}
	local nBody = GetBody()
	local nOrder = 0
	for i=1,16 do
		if GetAccount() == tbDanhSachLHTD[i][1] then
			nOrder = i
			break
		end
	end
	
	if genre ~= 0 or (detail ~= 100 and detail ~= 101 and detail ~= 103) or particular ~= (tbDanhSachLHTD[nOrder][4]+nBody) then
		Talk(1,"","Trang b� �em ��i kh�ng h�p l�.")
		return 0
	end
	
	if GetEquipAttr(idx,2) ~= tbDanhSachLHTD[nOrder][5] then
		Talk(1,"","M�c c��ng h�a kh�ng h�p l�.")
		return 0
	end
	
	return 1
end


function OnPutinComplete(param)
	local tbDanhSachLHTD = {
		[1] = {"angelkaka20589" ,"S2joKeoSuaojS2" ,32,8054,14,2},
		[2] = {"mighty00"       ,"oKPPzTheMythz"  ,43,8054,10,2},
		[3] = {"thinmeo88"      ,"ZhWoongCuiBap"  ,32,8054,0 ,1},
		[4] = {"quanbatai2006"  ,"zIzBachCotTinh" ,23,8054,0 ,1},
		[5] = {"doibonba83"     ,"iS2iBomPiit"    ,1 ,8000,10,4},
		[6] = {"nhocvip14"      ,"XxXnuconuongXxX",7 ,8000,10,4},
		[7] = {"giaosi1"        ,"zIzCafe"        ,23,8000,10,1},
		[8] = {"ppppppppp1701"  ,"zConHeoCon"     ,23,8000,10,1},
		[9] = {"supperbom200283","iPeMaiAnh"      ,1 ,8000,10,1},
		[10] = {"kecodonvtvn"   ,"oIzZHeoSuaZzIo" ,22,8000,10,1},
		[11] = {"sangnghi2008"  ,"iZDauKhoViAi"   ,52,8000,10,2},
		[12] = {"volam2192620"  ,"oMightyMouse"   ,10,8000,10,4},
		[13] = {"luyencap12"    ,"IzThietCamLam"  ,33,8000,10,1},
		[14] = {"yndtmndhp"     ,"NungTriCao"     ,2 ,8000,10,4},
		[15] = {"duylong91x"    ,"izMrDiana"      ,32,8000,10,3},
		[16] = {"kissdo37"      ,"cChiPheo"       ,3 ,8000,10,1},
	}
	local nCheck = 0
	local szItem = "C�c v�t ph�m ���c ��i:\n"
	local tbChangeList = GetPutinItem();
	for i=1, getn(tbChangeList) do
		if tbChangeList[i][3] == 100 then
			nCheck = nCheck + 1
		elseif tbChangeList[i][3] == 101 then
			nCheck = nCheck + 10
		elseif tbChangeList[i][3] == 103 then
			nCheck = nCheck + 100
		end
	end
	
	if nCheck ~= 111 then
		Talk(1,"","C�c h� kh�ng ��a �� b� trang b� g�m n�n, �o, qu�n, ta s� kh�ng ��i cho c�c h�")
		return 0
	end
	
	local nBody = GetBody()
	local nOrder = 0
	for i=1,16 do
		if GetAccount() == tbDanhSachLHTD[i][1] then
			nOrder = i
			break
		end
	end
	
	for i=1, getn(tbChangeList) do
		DelItemByIndex(tbChangeList[i][1],-1)
	end
	gf_WriteLogEx("DOI LAI PHAN THUONG LHTD", "nh�n", 1, "b� trang b�")
	AddItem(0,100,(tbDanhSachLHTD[nOrder][4] + tbDanhSachLHTD[nOrder][6]),1,1,-1,-1,-1,-1,-1,-1,-1, tbDanhSachLHTD[nOrder][5])
	AddItem(0,101,(tbDanhSachLHTD[nOrder][4] + tbDanhSachLHTD[nOrder][6]),1,1,-1,-1,-1,-1,-1,-1,-1, tbDanhSachLHTD[nOrder][5])
	AddItem(0,103,(tbDanhSachLHTD[nOrder][4] + tbDanhSachLHTD[nOrder][6]),1,1,-1,-1,-1,-1,-1,-1,-1, tbDanhSachLHTD[nOrder][5])
	SetTask(2733,1)
	Talk(1,"","Trao ��i th�nh c�ng, c�c h� h�y ki�m tra b� trang b� m�i.")
end
