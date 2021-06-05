Include("\\script\\lib\\globalfunctions.lua");

function DenBuThang4()
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	
	local TSK_DENBU = 2700
	local nFreeSlotRequire = 3
	local nWeightRequire = 200
	
	--local nCountry = GetByte(GetTask(2280),1)
	local nServerID =  GetGlbValue(GLB_TSK_SERVER_ID)
	local szAccount = GetAccount()
	local szRole = GetName()
	local nCheckListMatTich = 0
	local nCheckListBKL = 0
	local nCheckListViemDe = 0
	local nCheckListTrangSuc = 0
	
	-- Danh sach nhan den bu mat tich
	local tbNhanMatTich = {
			{66, 'depzai2906', 's2ChamHet'},
			{35, 'luctieuphung202', 'J2xKuLak'},
			{8, 'anhkhoa0988350778', 'zIoChemMuonoooo'},
			{9, 'volam2247684', 'oozLouisXaVizoo'},
			{62, 'conag1102', 'xYzSirAlanzYx'},
			{50, 'trieulongphi037374', 'TrungSieuCuiChuoi'},
			{62, 'coolnt0317', 'oLangTuMienTay'},
			{16, 'hoangkim721', 'jZoThanhLongNhi'},
			{32, 'slowlove0407', 's2T�mB�ngL�ng'},
			{24, 'hoithegiantienlagi12', 'ChienthanNo1'},
			{10, 'volam2192620', 'oMightyMouse'},
			{17, 'danhvahuy95', 'RuuQuenSau'},
			{5, 'trungkhoa8888', 'XxCarloTevezxX'},
			{47, 'a2hoanghuy', 'o0oLongextended'}
		}
		
	-- Danh sach nhan den bu BKL
	local tbNhanBKL = {
			{50, 'bklb160hcm', 'VoBeHoaAnhHung'},
			{24, 'ferrari4500', 'LamborGhini49PL'},
			{33, 'nh0ck0n129', 'zPinez'},
			{24, 'becayacc2013', 'RNeverGrief'},
			{60, 'meoyeu140593', 'oMeoSieuNhan'},
			{24, 'truongthison0199', 'zINiKiTa'},
			{33, 'tuanmobi1259', 'oITuongTu'},
			{43, 'luckyluckylove', 'RhythmOfTheKiss'},
			{19, 'caytkiem010', 'iiKiemKhach'},
			{43, 'votinhcuocmc9x', 'IzoBeKhang'},
			{63, 'volam2366206', 'zIzCrazylnLove'},
			{53, 'brazil', 'IzPeOiYeuAnhNaz'},
			{62, 'volam2361483', 'BachLienThanhNu'},
			{58, 'hongthitandat1988', 'iZBeLun902'},
			{43, 'thichduthu007', 'oBaByNgaMiLoVe'},
			{32, 'papadepdzaiz', 'iDeTuHoaAnhHung'},
			{24, 'dilamtien1', 'NguyenVuTueNhi'},
			{43, 'vietnamno1', 'IzoBeDep'},
			{16, 'vl2thanhtv01', 'xxAljsa'},
			{16, 'vanminh8318', 'jzoshina'},
			{16, 'h�angkiml?nh721', 'jzoThanhLong Nhi'},
			{16, 'volam2126707', 'izPechandai1m20'},
			{16, 'denis7', 'oVuaBoCap'},
			{50, 'thientv108406', 'AzPhatxjtzAz'},
			{16, 'hoangkimlenh', 'YogoWolves'},
			{16, 'letuyetnhi10', 'mrsonglong'},
			{28, 'phanthanhhuong22485', 'PhanThanhH��ng'},
			{28, 'koluadoiphunu', 'B�iTh�ThanhNh�n'},
			{28, 'drhoangky', 'hoangky'},
			{14, 'volam2361483', 'xXxBachYenxXx'},
			{50, 'anhtunhtq1', 'iLacThan'},
			{50, 'heavenm', 'iHoaDaQuy'},
			{50, 'thientv108406', 'AzPhatxjtzAz'},
			{50, 'nltl004830', 'onggiahamzui'},
			{43, 'ngocnhu', 'zIzEiveMsTrang'},
			{22, 'nambep85', 'z7zHungThanz7z'},
			{43, 'haclonghoangkim', '��cKh�nN�n'},
			{26, 'subakhatmau1405', 'iiPessSj'},
			{12, 'thienbao2192', 'oS2oPeMioX3oo'},
			{32, 'colam2061632206', 'oooNgheTiengGio'},
			{6, 'nhtl044567', 'xxxPhungTienxxx'},
			{2, 'daituongquan198300', 'buonlaumatuy'},
			{6, 'tieuthuutle', 'o8oKwonYuri'},
			{6, 'congtan', '011087'},
			{6, 'tieuthienlum', '080HyoYeon'},
			{6, 'longuy191179', 'longuy'},
			{6, 'dulichle', 'thi�ndi'},
			{22, 'tieumai768 ', 'x0xMrHAOCUTEx0x'},
			{22, 'canhcut88', 'canhcut88'},
			{22, 'nhutnam4', 'Ti�uCh�nhNam'},
			{13, 'elnino779', 'mrskasekell'},
			{13, 'xyzphongthancueczyx', 'joophoykk'},
			{13, 'handoivodolithu91', 'oLongHoTanSat'},
			{62, 'trungticts', 'BachSau'},
			{62, 'kiki12345678910vn', 'zzTienPhong'},
			{62, 'biwantuando', 'jDiepMocSon'},
			{47, 'tkh999', 'izBachQuanLang'},
			{47, 'khongconaidedanh', 'IzTonNgoKhongIz'},
			{19, 'minchan1211', 'ooTieuBaoBoi'},
			{7, 'chungtancan01', 'sososos1'},
			{1, 'ammacong25', 'zzCryForYouzz'},
			{63, 'colamdenhi871', 'ZAthena'},
			{63, 'emansuongdem2009', 'LazyOldmanCbb'},
			{8, 'zzzrognxinhzzz', '01dancerock10'},
			{33, 'tyxixon', 'KyNuThaoCam'},
			{33, 'benu1009', 'iDaiKaRan'},
--			{29, 'comalop2210', 'ZoZl�ngt?ZoZ'},
			{4, 'hoohodiep218', 'Boomerang'},
			{4, 'tinhyeucuatoithatdep', 'kyvophong'},
--			{35, 'ttnh1977', 'Phongbathi�ns?999'},
			{35, 'ttuhihcm', 'phongbahasu999'},
			{35, 'dungcodongtuesss', 'ThieuThan999'},
			{39, 'maingoccanh', 'IIzVoTinh'},
			{39, 'volam2280604', 'szWhyAlwayMe'},
			{47, 'giangsinhdautienhappy', 'GenjuroKibagami'},
			{21, 'nhh199999', 'Lukass2'},
			{12, 'hositientrangbang', 'TiquiTaka'},
			{21, 'tienlong5039610450', 'xzxBangBCSzx'}
		}

	-- Danh sach nhan den bu trang bi Viem De
	local tbNhanViemDe = {
				{serverid = 32, account = 'anchau9454', role = 'zKi�pC�mCaz', item = {{0, 100, 8057}, {0 ,101, 8057}, {0, 103, 8057}}, nLevel = 10, nDinhhon = 0},
				{serverid = 70, account = 'motcuocdoituoidep', role = 'VangB�ngM�tTh�i', item = {{0, 100, 8055}, {0, 101, 8055}, {0, 103, 8055}}, nLevel =12, nDinhhon = 1},
				{serverid = 70, account = 'soemden007', role = 'xIPhuDuIx',  item = {{0, 100, 8055}, {0, 101, 8055}, {0, 103, 8055}}, nLevel =7, nDinhhon = 1},
				{serverid = 70, account = 'legiahienyeudau', role = '1stOneOne', item = {{0, 100, 8001}, {0, 101, 8001}, {0, 103, 8001}}, nLevel = 14, nDinhhon = 1},
				{serverid = 70, account = 'hisumit', role = 'zGiangH�B�tB�iz', item = {{0, 100, 8001}, {0, 101, 8001}, {0, 103, 8001}}, nLevel = 12, nDinhhon = 1},
				{serverid = 70, account = 'duytan93cz', role = 'Thi�uTi�n', item = {{0, 100, 8055}, {0, 101, 8055}, {0, 103, 8055}}, nLevel = 7, nDinhhon = 1},
				{serverid = 70, account = 'tuoitrecuoi3008', role = 'KetGiao', item = {{0, 100, 8001}, {0, 101, 8001}, {0, 103, 8001}}, nLevel = 0, nDinhhon = 0}
		}

	-- Danh sach nhan den bu trang suc mon phai
	local tbNhanTrangSuc = {
			{serverid = 55, account = '123chivianhyeuem', role = 'ooS2oDionysus'},
			{serverid = 29, account = 'htvqa1718', role = 'OoQu�nhAnhoO'},
			{serverid = 38, account = 'vanthichnmdnhe', role = 'iIIMusicStyle'},
			{serverid = 14, account = 'procailaytgvt', role = 'iiiR��uQu�nS�u'},
			{serverid = 63, account = 'lekhaihung2012', role = 'o�i�uThuy�no'},
			{serverid = 7, account = 'dinhthiluyen102', role = '��pT�ngDecimet'},
			{serverid = 5, account = 'mrnguyenkgvn', role = 'oLanAnh'},
			{serverid = 3, account = 'aslong113vn', role = 'TonyTran'}
		}
	-- Check da nhan den bu
	if GetTask(TSK_DENBU)~=0 then
		Talk(1,"","C�c h� �� nh�n �� ph�n th��ng r�i, ta kh�ng th� giao th�m.");
		return
	end
	
	-- Check hanh trang & suc luc
	if gf_Judge_Room_Weight(nFreeSlotRequire, nWeightRequire)==0 then
		Talk(1,"","H�nh trang c�c h� kh�ng �� "..nFreeSlotRequire.." ch� tr�ng ho�c s�c l�c kh�ng ��, xin h�y s�p x�p l�i h�nh trang.")
		return
	end
	
	-- Truong hop dac biet k0 trong danh sach
	if nServerID==70 and szAccount=="olay2012" and szRole=="GioLanhMuaDong" then
		SetTask(TSK_DENBU,1)
		AddItem(2,1,1068,3);
		gf_WriteLogEx("DENBUTHANG4", "nh�n th�nh c�ng", 3, "Thi�n th�ch linh th�ch")
		nDenbu = 1
		Talk(1,"","V�t ph�m ��n b� �� ���c chuy�n v�o h�nh trang c�c h�");
		return
	end
		
	-- Check danh sach
	for i=1, getn(tbNhanMatTich) do
		if tbNhanMatTich[i][1]==nServerID and tbNhanMatTich[i][2]==szAccount and tbNhanMatTich[i][3]==szRole then
			nCheckListMatTich = 1
			break
		end
	end
	for i=1, getn(tbNhanBKL) do
		if tbNhanBKL[i][1]==nServerID and tbNhanBKL[i][2]==szAccount and tbNhanBKL[i][3]==szRole then
			nCheckListBKL = 1
			break
		end
	end
	for i=1,getn(tbNhanViemDe) do
		if tbNhanViemDe[i]["serverid"]==nServerID and tbNhanViemDe[i]["account"]==szAccount and tbNhanViemDe[i]["role"]==szRole then
			nCheckListViemDe = i
			break
		end
	end
	for i=1,getn(tbNhanTrangSuc) do
		if tbNhanTrangSuc[i]["serverid"]==nServerID and tbNhanTrangSuc[i]["account"]==szAccount and tbNhanTrangSuc[i]["role"]==szRole then
			nCheckListTrangSuc = 1
			break
		end
	end
	
	if nCheckListMatTich==0 and nCheckListBKL==0 and nCheckListViemDe==0 and nCheckListTrangSuc==0 then
		Talk(1,"","C�c h� kh�ng c� t�n trong danh s�ch nh�n ��n b�.")
		return
	end
	
-- Thuc hien den bu
	local nDenbu = 0
	-- Set task den bu
	SetTask(TSK_DENBU,1)
	
	-- Den bu mat tich
	if nCheckListMatTich==1 then
		nDenbu = DenBu_NhanMatTich()
	end
	
	-- Den bu BKL
	if nCheckListBKL==1 then
		nDenbu = DenBu_BKL()
	end
	
	--Den Bu Viem De
	if nCheckListViemDe>0 then
		nDenbu = DenBu_ViemDe(tbNhanViemDe[nCheckListViemDe])
	end
	
	if nCheckListTrangSuc==1 then
		nDenbu = DenBu_TrangSuc()
	end
	
	-- Truong hop rieng
	if nServerID==14 and szAccount=="procailaytgvt" and szRole=="iiiR��uQu�nS�u" then
		local tbTangKiemKyThach = {[1] = 30002, [2] = 30005, [3] = 30008, [4] = 30011}
		AddItem(0, 102, tbTangKiemKyThach[GetBody()], 1,1,-1,-1,-1,-1,-1,-1,-1,0);
		gf_WriteLogEx("DENBUTHANG4", "nh�n th�nh c�ng", 1, "T�ng ki�m k� th�ch")
		nDenbu = 1
	end
	
	if nServerID==29 and szAccount=="htvqa1718" and szRole=="OoQu�nhAnhoO" then
		nDenbu = DenBu_TrangSuc()
	end
	
	if nDenbu == 1 then
		Talk(1,"","V�t ph�m ��n b� �� ���c chuy�n v�o h�nh trang c�c h�");
	end
end
	
	
function DenBu_NhanMatTich()
	local nFaction = GetPlayerRoute()
	local tblMatTichCaoCap = {
			[2] = {item = {0, 107, 204, 1}, name ="Kim Cang B�t Nh� Ch�n Quy�n"},
			[3] = {item = {0, 107, 206, 1}, name ="V� Tr�n B� �� Ch�n Quy�n"},
			[4] = {item = {0, 107, 205, 1}, name ="Ti�m Long T�c Di�t Ch�n Quy�n"},
			[6] = {item = {0, 107, 207, 1}, name ="Thi�n La Li�n Ch�u Ch�n Quy�n"},
			[8] = {item = {0, 107, 208, 1}, name ="Nh� � Kim ��nh Ch�n Quy�n"},
			[9] = {item = {0, 107, 209, 1}, name ="B�ch H�i Tuy�t �m Ch�n Quy�n"},
			[11] = {item = {0, 107, 210, 1}, name ="H�n ��n Tr�n Nh�c Ch�n Quy�n"},
			[12] = {item = {0, 107, 211, 1}, name ="Qu� Thi�n Du Long Ch�n Quy�n"},
			[14] = {item = {0, 107, 212, 1}, name ="Huy�n �nh M� T�ng Ch�n Quy�n"},
			[15] = {item = {0, 107, 213, 1}, name ="Qu�n T� ��i Phong Ch�n Quy�n"},
			[17] = {item = {0, 107, 214, 1}, name ="Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
			[18] = {item = {0, 107, 215, 1}, name ="Xuy�n V�n L�c H�ng Ch�n Quy�n"},
			[20] = {item = {0, 107, 216, 1}, name ="Huy�n Minh Phong Ma Ch�n Quy�n"},
			[21] = {item = {0, 107, 217, 1}, name ="Linh C� Huy�n T� Ch�n Quy�n"},
			[23] = {item = {0, 107, 218, 1}, name ="C�u Thi�n Phong L�i Ch�n Quy�n"},
			[29] = {item = {0, 107, 222, 1}, name ="H�ng Tr�n T�y M�ng Ch�n Quy�n"},
			[30] = {item = {0, 107, 223, 1}, name ="Phong Hoa Thi�n Di�p Ch�n Quy�n"},
		}
	AddItem(tblMatTichCaoCap[nFaction]["item"][1], tblMatTichCaoCap[nFaction]["item"][2], tblMatTichCaoCap[nFaction]["item"][3], 1);
	gf_WriteLogEx("DENBUTHANG4", "nh�n th�nh c�ng", 1, "M�t t�ch cao c�p")
	return 1
end


function DenBu_BKL()
	local nBKL_End = GetTime()
	if nBKL_End - GetTask(TSK_BKLB_START) < 5270400 then
		Msg2Player("B�ch Kim L�nh v�n c�n �ang hi�u l�c. ��i hi�p kh�ng th� k�ch ho�t th�m ���c n�a.")
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: B�ch Kim L�nh v�n c�n �ang hi�u l�c. ��i hi�p kh�ng th� k�ch ho�t th�m ���c n�a.")
		return
	end
		
	local nCreateTime = GetCreateTime()		
	if nCreateTime >= 1332370895 and GetTask(TSK_BKLB_COUNT) == 0 then
		SetTask(TSK_BKLB_START, GetTime())
		SetTask(TSK_BKLB_ACTIVE,1)
		WriteLogEx("DENBUTHANG4", "kich hoat TNAH",1);
		Msg2Player("K�ch ho�t B�ch Kim L�nh th�nh c�ng tr� th�nh Thi�u Ni�n Anh H�ng. Vui l�ng k�ch ho�t nh�n th��ng Thi�u Ni�n Anh H�ng.")
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: K�ch ho�t B�ch Kim L�nh th�nh c�ng tr� th�nh Thi�u Ni�n Anh H�ng. Vui l�ng k�ch ho�t nh�n th��ng Thi�u Ni�n Anh H�ng.")
	else
		SetTask(TSK_BKLB_START, GetTime())
		SetTask(TSK_BKLB_ACTIVE,2)
		WriteLogEx("DENBUTHANG4", "kich hoat VLTB",1);
		Msg2Player("K�ch ho�t B�ch Kim L�nh th�nh c�ng tr� th�nh V� L�m Ti�n B�i. Vui l�ng k�ch ho�t nh�n th��ng V� L�m Ti�n B�i.")
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: K�ch ho�t B�ch Kim L�nh th�nh c�ng tr� th�nh V� L�m Ti�n B�i. Vui l�ng k�ch ho�t nh�n th��ng V� L�m Ti�n B�i.")
	end
	
	SetTask(TSK_BKLB_COUNT, GetTask(TSK_BKLB_COUNT) + 1)
	gf_WriteLogEx("Bach Kim Lenh Bai", "T�ng s� k�ch ho�t")
	gf_WriteLogEx("DENBUTHANG4", "add th�nh c�ng", 1, "B�ch Kim L�nh")
	return 1
end


function DenBu_ViemDe(tbdenbu)
	for i=1,getn(tbdenbu["item"]) do
		local _, nItemIdx = AddItem(tbdenbu["item"][i][1], tbdenbu["item"][i][2], tbdenbu["item"][i][3],1,1,-1,-1,-1,-1,-1,-1,0,tbdenbu["nLevel"],0);
		if tbdenbu["nDinhhon"]==1 then
			SetItemSpecialAttr(nItemIdx, "DING7", 1)
		end
	end
	gf_WriteLogEx("DENBUTHANG4", "nh�n th�nh c�ng", 1, "b� Vi�m ��")
	return 1
end



function DenBu_TrangSuc()
	local tbTrangSucSuMon = {
		[2] = {[1]={{0,102,231},{0,102,235}}, [2]={{0,102,232},{0,102,236}}},
		[3] = {[1]={{0,102,331},{0,102,335}}, [2]={{0,102,332},{0,102,336}}},
		[4] = {[1]={{0,102,431},{0,102,435}}, [2]={{0,102,432},{0,102,436}}},
		[6] = {[1]={{0,102,631},{0,102,635}}, [2]={{0,102,632},{0,102,636}}, [3]={{0,102,633},{0,102,637}}, [4]={{0,102,634},{0,102,638}}},
		[8] = {[3]={{0,102,831},{0,102,835}}, [4]={{0,102,832},{0,102,836}}},
		[9] = {[3]={{0,102,931},{0,102,935}}, [4]={{0,102,932},{0,102,936}}},
		[11] = {[1]={{0,102,1131},{0,102,1135}}, [2]={{0,102,1132},{0,102,1136}}, [3]={{0,102,1133},{0,102,1137}}, [4]={{0,102,1134},{0,102,1138}}},
		[12] = {[1]={{0,102,1231},{0,102,1235}}, [2]={{0,102,1232},{0,102,1236}}, [3]={{0,102,1233},{0,102,1237}}, [4]={{0,102,1234},{0,102,1238}}},
		[14] = {[1]={{0,102,1431},{0,102,1435}}, [2]={{0,102,1432},{0,102,1436}}, [3]={{0,102,1433},{0,102,1437}}, [4]={{0,102,1434},{0,102,1438}}},
		[15] = {[1]={{0,102,1531},{0,102,1535}}, [2]={{0,102,1532},{0,102,1536}}, [3]={{0,102,1533},{0,102,1537}}, [4]={{0,102,1534},{0,102,1538}}},
		[17] = {[1]={{0,102,1731},{0,102,1735}}, [2]={{0,102,1732},{0,102,1736}}, [3]={{0,102,1733},{0,102,1737}}, [4]={{0,102,1734},{0,102,1738}}},
		[18] = {[1]={{0,102,1831},{0,102,1835}}, [2]={{0,102,1832},{0,102,1836}}, [3]={{0,102,1833},{0,102,1837}}, [4]={{0,102,1834},{0,102,1838}}},
		[20] = {[1]={{0,102,2031},{0,102,2035}}, [2]={{0,102,2032},{0,102,2036}}, [3]={{0,102,2033},{0,102,2037}}, [4]={{0,102,2034},{0,102,2038}}},
		[21] = {[1]={{0,102,2131},{0,102,2135}}, [2]={{0,102,2132},{0,102,2136}}, [3]={{0,102,2133},{0,102,2137}}, [4]={{0,102,2134},{0,102,2138}}}
	}
	local nRand = mod(random(1,100),2)+1
	local nFaction = GetPlayerRoute()
	local nBody = GetBody()
	AddItem(tbTrangSucSuMon[nFaction][nBody][nRand][1], tbTrangSucSuMon[nFaction][nBody][nRand][2], tbTrangSucSuMon[nFaction][nBody][nRand][3],1,1,-1,-1,-1,-1,-1,-1,-1,0);
	--AddItem(0, 102, 2131,1,1,-1,-1,-1,-1,-1,-1,-1,0)
	gf_WriteLogEx("DENBUTHANG4", "nh�n th�nh c�ng", 1, "trang s�c s� m�n")
	return 1
end