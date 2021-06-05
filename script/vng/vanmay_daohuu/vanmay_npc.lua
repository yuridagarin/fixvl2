Include("\\script\\lib\\globalfunctions.lua");

tVanMay_change = {
		[1] = { --20 l��t ��u ti�n
					[1] = {1000,100,100},
					[2] = {1000,101,101},
					[3] = {1000,102,102},
					[4] = {1000,103,103},
					[5] = {1000,104,104},
					[6] = {1000,105,105},
					[7] = {1000,106,106},
					[8] = {1000,107,107},
					[9] = {1000,108,108},
					[10] = {1000,109,109},
			},
		[2] = { --l��t 21 - 40
					[1] = {1000,100,100},
					[2] = {1000,105,105},
					[3] = {1000,110,110},
					[4] = {1000,111,111},
					[5] = {1000,113,113},
					[6] = {1000,114,114},
					[7] = {1000,115,115},
					[8] = {1000,111,120},
					[9] = {1000,111,130},
					[10] = {1000,120,140},
			},		
		[3] = { --l��t 41 - 100
					[1] = {2000,100,100},
					[2] = {2000,111,111},
					[3] = {2000,110,130},
					[4] = {2000,120,150},
					[5] = {2000,130,150},
				},		
		[4] = { --l��t 101 tr� �i
					[1] = {3900,100,100},
					[2] = {1100,105,105},
					[3] = {1100,107,107},
					[4] = {600,111,130},
					[5] = {600,131,150},
					[6] = {600,151,170},
					[7] = {600,171,190},
					[8] = {300,191,191},
					[9] = {300,192,192},
					[10] = {300,193,193},
					[11] = {300,195,195},
					[12] = {100,200,220},
					[13] = {100,221,240},
					[14] = {50,245,245},
					[15] = {50,250,250},
			},					
	}
	
function main()
	Talk(1, "", "Ta �ang chu�n b� l�n ���ng �� t�m s� h�c ��o, ��i hi�p h�y quay l�i sau nha !!!!")
	do return end
	
	local nDate = tonumber(date("%Y%m%d"))
--	if nDate > 20130421 then
--		return 0
--	end
	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--	Talk(1, "",  "<color=green>"..szName.." :<color> �i�m may m�n h�m nay c�a ��i hi�p l� <color=green>"..nPointVM.."<color> �i�m.\n ��i hi�p c� mu�n ta xem th�m 1 qu� kh�c kh�ng ???? 	")		
	local tbSayDialog = {};
	local nSaySize = 0;
	local szName = "Th�y B�i Si�u H�ng"	
	local szHeader = "<color=green>"..szName.." :<color> M�i ng�y m�i ng��i ��u mang 1 v�n m�nh kh�c nhau, c� l�c may m�n, c� l�c kh�ng may, m�i chuy�n ��u do � tr�i v� c� duy�n. C�ng th�c t�nh �i�m kinh nghi�m khi c� �i�m v�n may: �i�m KN + [(�i�m v�n may - 100)/100 x �i�m KN].\n�i�m may m�n h�m nay c�a ��i hi�p l� <color=green>"..nPointVM.."<color> �i�m. ��i hi�p c� mu�n ta xem th�m 1 qu� kh�c kh�ng ???? "

	tinsert(tbSayDialog, "Xem v�n may h�m nay c�a ta/vanmay_show")
	if nDate > 20130423 then
		tinsert(tbSayDialog, "Gi�i v�n xui (ti�u hao 2 v�ng s� c� �i�m v�n may ng�u nhi�n t� 100 ��n 250)/vanmay_change")		--vanmay_list
	end
	tinsert(tbSayDialog, "Ta ch� gh� qua/do_nothing")	

	Say(szHeader, getn(tbSayDialog), tbSayDialog)		
end
function vanmay_show()
	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
	local szName = "Th�y B�i Si�u H�ng"		
	if nPointVM <= 96 then
		Talk(1, "", "<color=green>"..szName.." :<color> �i�m may m�n h�m nay c�a ��i hi�p l� <color=green>"..nPointVM.."<color> �i�m.\nH�m nay kh�ng ph�i l� ng�y may m�n �� l�m m�i vi�c, ��nh ��u thua ��, l�m �n th�t b�t. Ph�i b�i 1 qu� �� gi�i v�n th�i")
	elseif nPointVM == 250 then
		Talk(1, "",  "<color=green>"..szName.." :<color> �i�m may m�n h�m nay c�a ��i hi�p l� <color=green>"..nPointVM.."<color> �i�m.\nH�m nay l� ng�y ��i C�t �� l�m m�i vi�c, ��nh ��u th�ng ��, ph�i tham gia c�c ho�t ��ng ngay m�i ���c. Ni�m vui ���c nh�n ��i.")
	else
		Talk(1, "", "<color=green>"..szName.." :<color> �i�m may m�n h�m nay c�a ��i hi�p l� <color=green>"..nPointVM.."<color> �i�m.\nM�t ng�y nh� m�i ng�y, lao ��ng nhi�u th� ni�m vui ��n nhi�u. ��i hi�p c� th� th� b�i 1 qu� �� gi�i v�n.")
	end	
end
function vanmay_list()
	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
	if nPointVM == 250 then
		Talk(1, "", "<color=green>Th�y B�i Si�u H�ng<color>: �i�m may m�n h�m nay c�a ��i hi�p l� <color=green>"..nPointVM.."<color> �i�m n�n kh�ng c�n ph�i gi�i v�n xui ��u.\nH�m nay l� ng�y ��i C�t �� l�m m�i vi�c, ��nh ��u th�ng ��, ph�i tham gia c�c ho�t ��ng ngay m�i ���c. Ni�m vui ���c nh�n ��i..")
		return
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szName = "Th�y B�i Si�u H�ng"	
	local szHeader = "<color=green>"..szName.." :<color> Thay ��i v�n m�nh �� ��t ���c nhi�u th�nh t�u trong V� L�m"

--	tinsert(tbSayDialog, "V�n kh� b�nh b�nh (t�n1 xu v�t ph�m, �i�m v�n may ng�u nhi�n t� 101 ��n 120)/#vanmay_change(1)")
--	tinsert(tbSayDialog, "Ph�c Tinh Cao Chi�u (t�n 6 xu v�t ph�m, �i�m v�n may ng�u nhi�n t� 110 ��n 124)/#vanmay_change(2)")
--	tinsert(tbSayDialog, "V��ng Nguy�t Ch�c Th� (t�n 9 xu v�t ph�m, �i�m v�n may ng�u nhi�n t� 125 ��n 139)/#vanmay_change(3)")
--	tinsert(tbSayDialog, "Th�i D��ng T� T�m (t�n 39 xu v�t ph�m, �i�m v�n may ng�u nhi�n t� 140 ��n 175)/#vanmay_change(4)")
--	tinsert(tbSayDialog, "Thi�n ��a ��ng Thu�n (t�n 79 xu v�t ph�m, �i�m v�n may ng�u nhi�n t� 176 ��n 199)/#vanmay_change(5)")			
--	tinsert(tbSayDialog, "Ph�c Nh� ��ng H�i (t�n 179 v�t ph�m xu, �i�m v�n may ��t t�i �a 200 �i�m)/#vanmay_change(6)")	
	tinsert(tbSayDialog, "Gi�i v�n xui (t�n 2 v�ng s� c� �i�m v�n may ng�u nhi�n t� 100 ��n 250)/vanmay_change")
--	tinsert(tbSayDialog, "Ph�c Nh� ��ng H�i (t�n 11 v�t ph�m xu, �i�m v�n may ��t t�i �a 250 �i�m)/#vanmay_change(2)")		
	tinsert(tbSayDialog, "Ta ch� gh� qua/do_nothing")	
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)			
end


function vanmay_change()
	--local tbItem = {1, 6, 9, 39, 79, 179}
	local tbItem = {1, 11}
	local szName = "Th�y B�i Si�u H�ng"
	local nPointVM = 0
	if GetCash() < 20000 then
		Talk(1, "", "<color=green>"..szName.."<color>: ��i hi�p kh�ng �� 2 v�ng �� thay ��i v�n m�nh.");
		return
	end
	Pay(20000)

--	if nType == 2 then --gi� tr� 250 �i�m v�n may
--		gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY, 250)
--		nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--		Talk(1, "",  "<color=green>"..szName.." :<color> �i�m may m�n h�m nay c�a ��i hi�p l� <color=green>"..nPointVM.."<color> �i�m.\nH�m nay l� ng�y ��i C�t �� l�m m�i vi�c, ��nh ��u th�ng ��, ph�i tham gia c�c ho�t ��ng ngay m�i ���c. Ni�m vui ���c nh�n ��i.")	
--	else
	local nRan_table = 1
	local nTime_first = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_TIME_VM)	--s� l�n thay ��i v�n may
	if nTime_first < 105 then
		gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_TIME_VM, nTime_first + 1) --s� l�n thay ��i v�n may
	end
	local nTime_second = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_TIME_VM)
	if nTime_second > 100 then
		nRan_table = 4
	elseif nTime_second > 40 and nTime_second < 101 then
		nRan_table = 3
	elseif nTime_second > 20 and nTime_second < 41 then
		nRan_table = 2
	else
		nRan_table = 1
	end
	
	local nRan_vanmay_change = get_random_vanmay(tVanMay_change[nRan_table], 10000, 1)
	local nRan_vanmay_finish = random(tVanMay_change[nRan_table][nRan_vanmay_change][2], tVanMay_change[nRan_table][nRan_vanmay_change][3])
	
	gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY, nRan_vanmay_finish)
--	nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--	Talk(1, "",  "<color=green>"..szName.." :<color> �i�m may m�n h�m nay c�a ��i hi�p l� <color=green>"..nPointVM.."<color> �i�m.\n ��i hi�p c� mu�n ta xem th�m 1 qu� kh�c kh�ng ???? 	")		
	--Msg2Player("L�n thay ��i v�n may th�: "..nTime_second)		
	--Msg2Player("B�ng ph�n th��ng th�: "..nRan_table)	

--	end
	gf_WriteLogEx("VAN MAY DAO HUU","��i th�nh c�ng", 1, "��i �i�m v�n may b�ng v�ng")
	main()
end

-- V�n may ��o h�u
function vanmay_daohuu()
	----��ng v�n may ph�i set �i�m v�n may v� 100
	gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY, 100)
	do return end
	-----
 	local nFlag = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_ACCEPT_LUCKY)	
 	if nFlag == 1 then
 		return
 	end
	local tVanMay = { 
				[1] = {13000,50},
				[2] = {13000,69},
				[3] = {13000,75},
				[4] = {13000,88},
				[5] = {13000,96},
				[6] = {8550,100},
				[7] = {5750,103},
				[8] = {6000,106},
				[9] = {6000,110},
				[10] = {6000,113},
				[11] = {500,115},
				[12] = {500,120},
				[13] = {500,122},
				[14] = {300,130},
				[15] = {300,133},
				[16] = {300,140},
				[17] = {150,143},
				[18] = {101,150},
				[19] = {10,160},
				[20] = {10,170},
				[21] = {10,180},
				[22] = {10,190},
				[23] = {5,200},
				[24] = {3,222},
				[25] = {1,250},
			}
	local nRan_vanmay = get_random_vanmay(tVanMay, 100000, 1)
	local nPoint = tVanMay[nRan_vanmay][2]
	--Msg2Player("Gia tri Random: "..nRan_vanmay)
	--Msg2Player("Diem VM: "..nPoint)
	gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY, nPoint)
	gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_ACCEPT_LUCKY, 1)	
	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
	gf_WriteLogEx("VAN MAY DAO HUU","nh�n th�nh c�ng", 1, "Nh�n �i�m v�n may")
	--Msg2Player("Diem VM 1 = Diem VM: "..nPointVM)	--------------------------------------------------------------------------
	local szName = "V�n May ��o H�u"

	local tbSayDialog = {};
	local nSaySize = 0;
	local szHeader = ""
	if nPointVM <= 96 then
		szHeader = "<color=green>"..szName.." :<color> �i�m may m�n h�m nay c�a ��i hi�p l� <color=green>"..nPointVM.."<color> �i�m.\nH�m nay kh�ng ph�i l� ng�y may m�n �� l�m m�i vi�c, ��nh ��u thua ��, l�m �n th�t b�t. Ph�i �i t�m Th�y B�i Si�u H�ng �� gi�i v�n xui m�i ���c."
		tinsert(tbSayDialog, "�i ��n Th�y B�i Si�u H�ng gi�i v�n/goThayBoi")
	elseif nPointVM == 250 then
		szHeader = "<color=green>"..szName.." :<color> �i�m may m�n h�m nay c�a ��i hi�p l� <color=green>"..nPointVM.."<color> �i�m.\nH�m nay l� ng�y ��i C�t �� l�m m�i vi�c, ��nh ��u th�ng ��, ph�i tham gia c�c ho�t ��ng ngay m�i ���c. Ni�m vui ���c nh�n ��i."
	else
		szHeader = "<color=green>"..szName.." :<color> �i�m may m�n h�m nay c�a ��i hi�p l� <color=green>"..nPointVM.."<color> �i�m.\nM�t ng�y nh� m�i ng�y, lao ��ng nhi�u th� ni�m vui ��n nhi�u.Hay l� ��n g�p Th�y B�i Si�u H�ng �� xem th� 1 qu� coi nh� th� n�o. Bi�t ��u Th�n T�i l�i m�m c��i v�i m�nh."
		tinsert(tbSayDialog, "�i ��n Th�y B�i Si�u H�ng gi�i v�n/goThayBoi")
	end
	tinsert(tbSayDialog, "Ta lu�n thu�n theo t� nhi�n/do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)		
end	
function goThayBoi()
	NewWorld(100,1274,2960)
end	
function get_random_vanmay(tVanMay, nMaxPE, nDefault)
	local nPos = 0;
	local nRand = random(1, nMaxPE);
	for i = 1, getn(tVanMay) do
		if nRand > nPos and nRand <= nPos + tVanMay[i][1] then
			return i;
		end
		nPos = nPos + tVanMay[i][1];
	end
	return nDefault;
end

function vanmay_daohuu_denbu()
	local szName = "V�n May ��o H�u"
	local nFlag = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_ACCEPT_LUCKY)	
 	if nFlag == 1 then
 		return
 	end
	gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY, 150)
	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
	gf_SetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_ACCEPT_LUCKY, 1)	
	Talk(1, "",  "<color=green>"..szName.." :<color> �i�m may m�n h�m nay c�a ��i hi�p l� <color=green>"..nPointVM.."<color> �i�m.\nH�m nay l� ng�y ��i C�t �� l�m m�i vi�c, ��nh ��u th�ng ��, ph�i tham gia c�c ho�t ��ng ngay m�i ���c.")	

end

function do_nothing()

end