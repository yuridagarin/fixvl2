--by liubo
--�������˽ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\vng\\config\\newserver.lua");
Include("\\script\\equip_feed\\feed_up_attr_recoup.lua")
Include("\\script\\vng\\weapon_upgrade\\trangbichiencuong.lua")
Include("\\script\\vng\\doinguyenlieu.lua")

FILE_NAME = "\\script\\online_activites\\treasure_box\\npc_treasuer_chests.lua";	
NANGCAPDIEUDUONG_F1 = "\\script\\vng\\weapon_upgrade\\dieuduongcongthuc1.lua";
NANGCAPDIEUDUONG_F2 = "\\script\\vng\\weapon_upgrade\\dieuduongcongthuc2.lua";
NANGCAPDIEUDUONG_NGOCBOI = "\\script\\vng\\weapon_upgrade\\dieuduong_nangcapngocboi.lua"
g_szNpcName = "<color=green>Th��ng Nh�n B�o R��ng: <color>";

TSK_TMP_CHANGE_BKVD = 206
function main()
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	--�Ƿ����ж�
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[5])
		return 0
	end
	--�ж��Ƿ��Ѿ�ת��
	--
	--
--	if GetTask(1538) == 0 then
--		Talk(1,"",tSTRING_TREASUER_NPC[1])
--		return 0
--	end
	local tbSay = {}
	if nDate < 20130904 then
		tinsert(tbSay,"Nh�n h� tr� trang b� Kim X�/_On_Repair")
	end
--	tinsert(tbSay, "Ta mu�n ��i nguy�n li�u l�y kinh nghi�m/Trade_Material2Exp_Menu")
	if tbGioiHanThanTaiBaoRuong[nNation] == nil or nDate >= tbGioiHanThanTaiBaoRuong[nNation] then
--		tinsert(tbSay,tSTRING_TREASUER_NPC[3].."/get_wooden")
--		tinsert(tbSay,"Ta mu�n ��i 1 B�ch Kim R��ng (ti�u hao 5 T�ng R��ng)/get_BKR")
--		tinsert(tbSay,"Ta mu�n ��i 1 Th�n T�i B�o R��ng (ti�u hao 55 T�ng R��ng)/get_TTBR")
	end
--	tinsert(tbSay,"��i trang b� H�o Nguy�t/get_haonguyet")
--	tinsert(tbSay,"��i trang b� Di�u D��ng/NangCapDieuDuong")
--	tinsert(tbSay,"N�ng c�p ng�c b�i Di�u D��ng 6% th�nh 8%/NangCapDieuDuong_NgocBoi")
--		"N�ng c�p B�ch Kim Vi�m ��/get_BKVD",
--		tSTRING_TREASUER_NPC[4].."/get_treasure",
--	tinsert(tbSay, "��i trang b� Chi�n Cu�ng/TrangBiChienCuong_Form")
	tinsert(tbSay,"R�i kh�i/do_nothing")
	
	Say(tSTRING_TREASUER_NPC[2], getn(tbSay), tbSay)
end

function get_wooden()
	local nNum = GetTask(VET_TREASURE_BOX_MNUM)
	local tNumWooden = {2,5,1}
	local nIndex = floor(nNum/20)+1
--	if nIndex < 3 then
--		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[5],tNumWooden[nIndex],nIndex*20-nNum),2,format("Ta mu�n mua/#pay_award(%d,0,%d)",nIndex*20-nNum,tNumWooden[nIndex]),"Kh�ng c�n ��u/do_nothing")
--	else
		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[6],tNumWooden[3]),2,format("Ta mu�n mua/#pay_award(%d,0,%d)",999,tNumWooden[3]),"Kh�ng c�n ��u/do_nothing")
--	end
end

function get_treasure()
	local nNum = GetTask(VET_TREASURE_BOX_CNUM)	
	local tNumTreasure = {66,135,300}
	
	local nIndex = 0
	if nNum < 5 then
		nIndex = 1
	elseif nNum >= 5 and nNum < 20 then
		nIndex = 2
	else
		nIndex = 3
	end
	
	local tboxremain = {5, 20}
	if nIndex < 3 then
		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[5],tNumTreasure[nIndex],tboxremain[nIndex] - nNum),2,format("Ta mu�n mua/#pay_award(%d,1,%d)",tboxremain[nIndex] - nNum,tNumTreasure[nIndex]),"Kh�ng c�n ��u/do_nothing")
		print("So ruong con lai: "..tboxremain[nIndex] - nNum)
	else
		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[6],tNumTreasure[3]),2,format("Ta mu�n mua/#pay_award(%d,1,%d)",999,tNumTreasure[3]),"Kh�ng c�n ��u/do_nothing")
	end
end

function pay_award(nNum1,nNum2,nNum3)
	local nNum = GetItemCount(2,1,30230)
	if nNum2 == 0 then
		if nNum < nNum1 * nNum3 then nNum1 = floor(nNum / nNum3) end
		AskClientForNumber("pay_wooden",1,nNum1,"H�y nh�p s� l��ng","")
	end
	if nNum2 == 1 then
		if nNum < nNum1 * nNum3 then nNum1 = floor(nNum / nNum3) end
		AskClientForNumber("pay_treasure",1,nNum1,"H�y nh�p s� l��ng","")
	end
end

function pay_wooden(nNum)
	local nNumTask = GetTask(VET_TREASURE_BOX_MNUM)
	local tNumWooden = {2,5,1}
	local nIndex = floor(nNumTask/20)+1
	if nIndex > 3 then nIndex = 3 end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        Talk(1,"",tSTRING_TREASUER_BOX[4])
		return 0
    end
	if GetItemCount(2,1,30230) < nNum * tNumWooden[3] then
		Talk(1,"",format(tSTRING_TREASUER_NPC[7],nNum * tNumWooden[3]))
		return 0 
	end
	if DelItem(2,1,30230,nNum * tNumWooden[3]) == 1 then
		if gf_AddItemEx2({2,1,30340,nNum},"��i M�c R��ng lo�i "..tNumWooden[3].." xu","Than Tai Bao Ruong","��i M�c R��ng th�nh c�ng",0,1) ~= 1 then
			return 0
		end
  		gf_WriteLogEx("Than Tai Bao Ruong", "��i th�nh c�ng", nNum, "Xu ��i M�c R��ng")   		
		SetTask(VET_TREASURE_BOX_MNUM,nNumTask+nNum)
		return 1
	end
	return 0
end

function pay_treasure(nNum)
	local nNumTask = GetTask(VET_TREASURE_BOX_CNUM)
	local tNumTreasure = {66,135,300}
	--local nIndex = floor(nNumTask/20)+1
	--if nIndex > 3 then nIndex = 3 end
	local nIndex = 0
	if nNumTask < 5 then
		nIndex = 1
	elseif nNumTask >= 5 and nNumTask < 20 then
		nIndex = 2
	else
		nIndex = 3
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        Talk(1,"",tSTRING_TREASUER_BOX[4])
		return 0
  	end
	if GetItemCount(2,1,30230) < nNum * tNumTreasure[nIndex] then
		Talk(1,"",format(tSTRING_TREASUER_NPC[7],nNum * tNumTreasure[nIndex]))
		return 0 
	end	
	if DelItem(2,1,30230,nNum * tNumTreasure[nIndex]) == 1 then
		if gf_AddItemEx2({2,1,30341,nNum},"��i T�ng R��ng lo�i "..tNumTreasure[nIndex].." xu","Than Tai Bao Ruong","��i T�ng R��ng th�nh c�ng",0,1) ~= 1 then
			return 0
		end
		SetTask(VET_TREASURE_BOX_CNUM,nNumTask+nNum)
		return 1
	end
	return 0
end

function do_nothing()
end

function get_BKVD()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n trang b� c�n n�ng c�p."
	
	tinsert(tbSayDialog, "- Ta c�n ��i 1 B�ch Kim Vi�m �� Kh�i (100 M�nh B�ch Kim + 3 B�ch Kim H�ng Bao (c� ch�a 4000 v�ng + 1 Thi�n Chi Vi�m �� Kh�i[+12])/#get_BKVD_confirm(1,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i 1 B�ch Kim Vi�m �� Gi�p (100 M�nh B�ch Kim + 3 B�ch Kim H�ng Bao (c� ch�a 4000 v�ng + 1 Thi�n Chi Vi�m �� Gi�p[+12])/#get_BKVD_confirm(2,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i 1 B�ch Kim Vi�m �� Trang (100 M�nh B�ch Kim + 3 B�ch Kim H�ng Bao (c� ch�a 4000 v�ng + 1 Thi�n Chi Vi�m �� Trang[+12])/#get_BKVD_confirm(3,0)")
	tinsert(tbSayDialog, "Tr� l�i/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_haonguyet()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n trang b� c�n ��i."
	
	tinsert(tbSayDialog, "- Ta c�n ��i N�n H�o Nguy�t (8 M�nh B�ch Kim + 1 N� Oa Tinh Th�ch + 1 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(1,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i �o H�o Nguy�t (6 M�nh B�ch Kim + 1 N� Oa Tinh Th�ch + 1 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(2,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i Qu�n H�o Nguy�t (6 M�nh B�ch Kim + 1 N� Oa Tinh Th�ch + 1 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(3,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i Trang S�c H�o Nguy�t (12 M�nh B�ch Kim + 2 N� Oa Tinh Th�ch + 2 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/get_haonguyet_trangsuc")
	tinsert(tbSayDialog, "- Ta c�n ��i V� Kh� H�o Nguy�t (16 M�nh B�ch Kim + 4 N� Oa Tinh Th�ch + 4 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(5,0)")
	tinsert(tbSayDialog, "Tr� l�i/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function get_haonguyet_trangsuc()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n trang b� c�n ��i."
	
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-X�ch T��c Ho�n (12 M�nh B�ch Kim + 2 N� Oa Tinh Th�ch + 2 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(4,1)")
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-T� Giao Ng�c B�i (12 M�nh B�ch Kim + 2 N� Oa Tinh Th�ch + 2 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(4,2)")
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-V�n H� L�nh (12 M�nh B�ch Kim + 2 N� Oa Tinh Th�ch + 2 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(4,3)")
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-� L�n B�o Gi�i (12 M�nh B�ch Kim + 2 N� Oa Tinh Th�ch + 2 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(4,4)")
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-B�ch Quy Li�n (12 M�nh B�ch Kim + 2 N� Oa Tinh Th�ch + 2 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(4,5)")
	tinsert(tbSayDialog, "Tr� l�i/get_haonguyet")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_BKVD_confirm(nGetType, nSelected)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "","Ph�i gia nh�p h� ph�i m�i n�ng c�p trang b� ���c!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
    	local nItemNum1 = tItem_need[1][3]
	if GetItemCount(2,1,30346) < nItemNum1 then
		Talk(1, "", "B�n kh�ng �� "..tItem_need[1][1].." �� ��i trang b� B�ch Kim Vi�m ��")
		return 0
	end
	    	local nItemNum2 = tItem_need[2][3]
	if GetItemCount(2,1,30229) < nItemNum2 then
		Talk(1, "", "B�n kh�ng �� "..tItem_need[2][1].." �� ��i trang b� B�ch Kim Vi�m ��")
		return 0
	end
	SetTaskTemp(TSK_TMP_CHANGE_BKVD,nGetType)
	local nSlot = BKVD_need[nGetType][1]		
	PutinItemBox("��i trang b�" ,nSlot , "X�c nh�n mu�n th�c hi�n n�ng c�p trang b�?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local nGetType = GetTaskTemp(TSK_TMP_CHANGE_BKVD)
	if nGetType == 0 then
		return 0;
	end
	
	local tb_item = BKVD_need[nGetType][3]
	local tItem = {}
	local check = 0

	for i = 1, getn(tb_item) do
		tinsert(tItem,tb_item[i])
	end
	for i=1,getn(tItem) do
		local nG, nD, nP = gf_UnPack(tb_item[i])
		if (GetEquipAttr(idx,2) < 12) and genre == 0 then
			Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 12 tr� l�n");
			return 0;		
		end
		if (genre == nG and detail == nD and particular == nP) then	
			check = 1	
		end
	end
	if check == 1 then
		return 1
	end
	Talk(1, "", g_szNpcName.."Ch� c� th� b� v�o "..BKVD_need[nGetType][2]);
	return 0;
end

function OnPutinComplete(param)
	local nGetType = GetTaskTemp(TSK_TMP_CHANGE_BKVD)
	if nGetType == 0 then
		Talk(1, "", g_szNpcName.."B� v�o v�t ph�m kh�ng ��ng");
		return 0;
	end
	if param ~= 1 then
		Talk(1, "", g_szNpcName.."B� v�o v�t ph�m kh�ng ��ng");
		return 0;
	end
	local t = GetPutinItem()
	if getn(t) ~= BKVD_need[nGetType][1] then
		Talk(1, "", g_szNpcName.."B� v�o v�t ph�m kh�ng ��ng");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
    	local nItemNum1 = tItem_need[1][3]
	if GetItemCount(2,1,30346) < nItemNum1 then
		Talk(1, "", "B�n kh�ng �� "..tItem_need[1][1].." �� ��i trang b� B�ch Kim Vi�m ��")
		return 0
	end
	    	local nItemNum2 = tItem_need[2][3]
	if GetItemCount(2,1,30229) < nItemNum2 then
		Talk(1, "", "B�n kh�ng �� "..tItem_need[2][1].." �� ��i trang b� B�ch Kim Vi�m ��")
		return 0
	end
	local nResult = 1
	for i = 1, getn(t) do		
		if DelItemByIndex(t[i][1], -1) ~= 1 then
			nResult = 0;
			break;
		end
	end
	local nItemNum1 = tItem_need[1][3]
	local nItemNum2 = tItem_need[2][3]
	local nbody = GetBody()
	if nResult ==1 then
		if DelItem(2,1,30346, nItemNum1) == 1 and DelItem(2,1,30229, nItemNum2) == 1 then
			SetTaskTemp(TSK_TMP_CHANGE_BKVD,0)
			local nItem = BKVD_suc[nGetType][2][nbody]
			gf_AddItemEx2(nItem, "N�ng c�p trang b� th�nh c�ng", "NANG CAP TRANG BI BKVD", "n�ng c�p th�nh c�ng")
			Talk(1,"","Ch�c m�ng b�n nh�n ���c 1 trang b� B�ch Kim Vi�m ��!")
		end
	end
end

function get_haonguyet_confirm(nGetType, nSelected)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "","Ph�i gia nh�p h� ph�i m�i n�ng c�p trang b� ���c!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
     if nGetType == 1 then
    		if GetItemCount(2,1,30346) < 8 then
			Talk(1, "", "B�n kh�ng �� 8 m�nh B�ch Kim �� ��i trang b� H�o Nguy�t")
			return 0
		end
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B�n kh�ng �� 1 B�ch Kim ��i H�ng Bao �� ��i trang b� H�o Nguy�t")
			return 0
		end		
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B�n kh�ng �� 1 N� Oa Tinh Th�ch �� ��i trang b� H�o Nguy�t")
			return 0
		end			
     end
     if nGetType == 2 then
    		if GetItemCount(2,1,30346) < 6 then
			Talk(1, "", "B�n kh�ng �� 6 m�nh B�ch Kim �� ��i trang b� H�o Nguy�t")
			return 0
		end
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B�n kh�ng �� 1 B�ch Kim ��i H�ng Bao �� ��i trang b� H�o Nguy�t")
			return 0
		end	
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B�n kh�ng �� 1 N� Oa Tinh Th�ch �� ��i trang b� H�o Nguy�t")
			return 0
		end					
     end
     if nGetType == 3 then
     		if GetItemCount(2,1,30346) < 6 then
			Talk(1, "", "B�n kh�ng �� 6 m�nh B�ch Kim �� ��i trang b� H�o Nguy�t")
			return 0
		end   
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B�n kh�ng �� 1 B�ch Kim ��i H�ng Bao �� ��i trang b� H�o Nguy�t")
			return 0
		end	
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B�n kh�ng �� 1 N� Oa Tinh Th�ch �� ��i trang b� H�o Nguy�t")
			return 0
		end							
     end     
     if nGetType == 4 then
    		if GetItemCount(2,1,30346) < 12 then
			Talk(1, "", "B�n kh�ng �� 12 m�nh B�ch Kim �� ��i trang b� H�o Nguy�t")
			return 0
		end    	
    		if GetItemCount(2,1,30229) < 2 then
			Talk(1, "", "B�n kh�ng �� 2 B�ch Kim ��i H�ng Bao �� ��i trang b� H�o Nguy�t")
			return 0
		end		
    		if GetItemCount(2,1,504) < 2 then
			Talk(1, "", "B�n kh�ng �� 2 N� Oa Tinh Th�ch �� ��i trang b� H�o Nguy�t")
			return 0
		end					
     end
     if nGetType == 5 then
    		if GetItemCount(2,1,30346) < 16 then
			Talk(1, "", "B�n kh�ng �� 16 m�nh B�ch Kim �� ��i trang b� H�o Nguy�t")
			return 0
		end    	
    		if GetItemCount(2,1,30229) < 4 then
			Talk(1, "", "B�n kh�ng �� 4 B�ch Kim ��i H�ng Bao �� ��i trang b� H�o Nguy�t")
			return 0
		end		
    		if GetItemCount(2,1,504) < 4 then
			Talk(1, "", "B�n kh�ng �� 4 N� Oa Tinh Th�ch �� ��i trang b� H�o Nguy�t")
			return 0
		end					
     end          

	local nbody = GetBody()
	local nfaction = GetPlayerRoute()
     if nGetType == 1 then	
     		if DelItem(2,1,30346, 8) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nNon = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nNon, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng")
			Talk(1,"","��i trang b� th�nh c�ng!")
     		end
     end
	if nGetType == 2 then	
     		if DelItem(2,1,30346, 6) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nAo = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nAo, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng")
			Talk(1,"","��i trang b� th�nh c�ng!")
     		end
     end
     if nGetType == 3 then	
     		if DelItem(2,1,30346, 6) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nQuan = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nQuan, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng")
			Talk(1,"","��i trang b� th�nh c�ng!")
     		end
     end
     if nGetType == 4 then
          	if DelItem(2,1,30346, 12) == 1 and DelItem(2,1,30229, 2) == 1 and DelItem(2,1,504, 2) == 1 then
			local nTrangsuc = tHaoNguyet_suc[nGetType][nSelected][2]
			gf_AddItemEx2(nTrangsuc, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng ")
			Talk(1,"","��i trang b� th�nh c�ng!")
		end
	end
	if nGetType == 5 then
	 	if DelItem(2,1,30346, 16) == 1 and DelItem(2,1,30229, 4) == 1 and DelItem(2,1,504, 4) == 1 then
			local nVukhi = tHaoNguyet_suc[nGetType][nfaction][2]
			gf_AddItemEx2(nVukhi, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng ")
			Talk(1,"","��i trang b� th�nh c�ng!")
		end
	end
	
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then  
			nCount = nCount + 1
		end
	end
	return nCount
end

function get_BKR()
	AskClientForNumber("Confirm_get_BKR", 1, 999, "B�ch Kim R��ng")
end
function get_TTBR()
	AskClientForNumber("Confirm_get_TTBR", 1, 999, "Th�n T�i R��ng")
end

function Confirm_get_BKR(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if gf_Judge_Room_Weight(5, 50," ") ~= 1 then
        	return
    end
	if GetItemCount(2,1,30341) < 5 * nCount then
		Talk(1, "", "B�n kh�ng �� T�ng R��ng �� ��i B�ch Kim R��ng")
		return 0
	end    	
	if DelItem(2,1,30341, 5 * nCount) == 1 then
		gf_AddItemEx2({2,1,30343,nCount}, "B�ch Kim R��ng", "Than Tai Bao Ruong", "nh�n th�nh c�ng")
        gf_WriteLogEx("Than Tai Bao Ruong", "��i th�nh c�ng", nCount, "S� l��ng B�ch Kim R��ng")			
	end
end

function Confirm_get_TTBR(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if gf_Judge_Room_Weight(5, 50," ") ~= 1 then
        	return
    end
	if GetItemCount(2,1,30341) < 55 * nCount then
		Talk(1, "", "B�n kh�ng �� T�ng R��ng �� ��i Th�n T�i B�o R��ng")
		return 0
	end    	
	if DelItem(2,1,30341, 55 * nCount) == 1 then
		gf_AddItemEx2({2,1,30344,nCount}, "Th�n T�i R��ng", "Than Tai Bao Ruong", "nh�n th�nh c�ng")
		gf_WriteLogEx("Than Tai Bao Ruong", "��i th�nh c�ng", nCount, "S� l��ng Th�n T�i R��ng")	
	end
end


function NangCapDieuDuong()
	local tbSay = {
		"N�ng c�p b�ng Thi�n M�n Kim L�nh v� trang b� H�o Nguy�t/NangCapDieuDuong_CongThuc1_Form",
		"N�ng c�p b�ng Thi�n M�n Kim L�nh, C� Linh Ng�c v� trang b� H�o Nguy�t/NangCapDieuDuong_CongThuc2_Form",
	}
	Say("N�ng c�p trang b� H�o Nguy�t th�nh Di�u D��ng", getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc1_Form()
	local szTitle = "N�ng c�p trang b� H�o Nguy�t th�nh Di�u D��ng c�n:\n- N�n: 5 Thi�n M�n Kim L�nh\n- �o: 6 Thi�n M�n Kim L�nh\n- Qu�n: 7 Thi�n M�n Kim L�nh\n- Trang s�c: 6 Thi�n M�n Kim L�nh\n- V� Kh�: 11 Thi�n M�n Kim L�nh"
	local tbSay = {
		"Ta mu�n n�ng c�p/NangCapDieuDuong_CongThuc1",
		"Ta ch� gh� xem th�i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc2_Form()
	local szTitle = "N�ng c�p trang b� H�o Nguy�t th�nh Di�u D��ng c�n:\n- N�n: 3 Thi�n M�n Kim L�nh, 500 C� Linh Ng�c\n- �o: 3 Thi�n M�n Kim L�nh, 500 C� Linh Ng�c\n- Qu�n: 3 Thi�n M�n Kim L�nh, 500 C� Linh Ng�c\n- Trang s�c: 3 Thi�n M�n Kim L�nh, 500 C� Linh Ng�c\n- V� Kh�: 6 Thi�n M�n Kim L�nh, 1000 C� Linh Ng�c"
	local tbSay = {
		"Ta mu�n n�ng c�p/NangCapDieuDuong_CongThuc2",
		"Ta ch� gh� xem th�i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc1()
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", NANGCAPDIEUDUONG_F1, 1)
end


function NangCapDieuDuong_CongThuc2()
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", NANGCAPDIEUDUONG_F2, 1)
end


function NangCapDieuDuong_NgocBoi()
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", NANGCAPDIEUDUONG_NGOCBOI, 1)
end