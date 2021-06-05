--Code by PhucnG 23-10-2014
--Event Den Bu Server Hoa Phung
Include("\\script\\newbattles\\sign_up_npc.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\lib\\globalfunctions.lua");


--g_sNpcName = "Ti�u Vi�n L�u";
g_sNpcName = "Ti�u Ng�c";
g_nNpcCamp = LIAO_ID;
szNpcName = "<color=green>Ti�u Vi�n L�u: <color>"

function main()

		if GetTargetNpcName() == "Ti�u Vi�n L�u" then
			-- if GetGlbValue(GLB_TSK_SERVER_ID) == 92 then -- Server H�a Ph�ng
				local tbSay = {}
				local nDate = tonumber(date("%Y%m%d"))
				if nDate >= 20141121 then
					--tinsert(tbSay,"Ta mu�n nh�n �i�m c�a chi�n tr��ng 4x/Denbu_NhanThuong4x")
					--tinsert(tbSay,"Ta mu�n nh�n �i�m c�a chi�n tr��ng 6x/Denbu_NhanThuong6x")
				end
				
				tinsert(tbSay,"R�i kh�i/gf_DoNothing")
				Say(szNpcName.."�� c� th� b� ��p h�t m�i l�i l�m, c�c h� h�y ch�n ph�n th��ng cho m�nh. \n",getn(tbSay),tbSay)
				return
			-- else
				--Talk(1,"",szNpcName.."Tr�ng thanh gi� m�t, c�c h� c� vi�c c�n chi?")
				--return
			-- end
		end		
		
		if random(1,50) == 1 then
				NpcChat(GetTargetNpc(),"�� kh�ch l� t��ng s� ��i Li�u ta anh d�ng gi�t gi�c, nh�ng ai tham gia tr�n ��nh Nh�n m�n quan ��u ���c nh�n Linh Th�ch!");
		end;
		battle_main();			
end;

function Denbu_NhanThuong4x()
	local tbSay = {}
	tinsert(tbSay,"Nh�n 600 �i�m c�ng tr�ng v� 10.000.000 �i�m kinh nghi�m/#Denbu_NhanThuong4x_01(1)")
	tinsert(tbSay,"Nh�n 1200 �i�m c�ng tr�ng v� 15.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng ch��ng)/#Denbu_NhanThuong4x_01(2)")
	tinsert(tbSay,"Nh�n 3000 �i�m c�ng tr�ng v� 20.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng ��i)/#Denbu_NhanThuong4x_01(3)")
	tinsert(tbSay,"Nh�n 6000 �i�m c�ng tr�ng v� 30.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng huy ho�ng)/#Denbu_NhanThuong4x_01(4)")
	tinsert(tbSay,"Nh�n 8400 �i�m c�ng tr�ng v� 45.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng vinh d�)/#Denbu_NhanThuong4x_01(5)")
	tinsert(tbSay,"R�i kh�i/gf_DoNothing")
	Say(szNpcName.."C�c h� mu�n nh�n g� n�o? \n",getn(tbSay),tbSay)
end

function Denbu_NhanThuong4x_01(nChoice)
	if gf_GetTaskByte(TSK_DENBU_HOAPHUNG,3) == 1 then
		Talk(1,"",szNpcName.."C�c h� �� nh�n ph�n th��ng trong ng�y. Xin vui l�ng quay l�i ng�y h�m sau!")
		return
	end
	
	if nChoice == 1 then
		gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
		--Nh�n C�ng tr�ng
		gf_EventGiveCustomAward(31, 600, 1, "DenBuHoaPhung", "Nhan")
		
		--Nh�n kinh nghi�m
		gf_EventGiveCustomAward(1, 10000000, 1, "DenBuHoaPhung", "Nhan")
	elseif nChoice == 2 then
		if GetItemCount(2,1,9999) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng Ch��ng trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		if DelItem(2,1,9999,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
			
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 1200, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 15000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 3 then
		if GetItemCount(2,1,9998) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng ��i trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		
		if DelItem(2,1,9998,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
			
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 3000, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 20000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 4 then
		if GetItemCount(2,1,9977) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng Huy Ho�ng trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		
		if DelItem(2,1,9977,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
			
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 6000, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 30000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 5 then
		if GetItemCount(2,1,30642) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng Ch��ng Vinh D� trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		
		if DelItem(2,1,30642,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
		
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 8400, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 45000000, 1, "DenBuHoaPhung", "Nhan")
		end
	end
end

function Denbu_NhanThuong6x()
	local tbSay = {}
	tinsert(tbSay,"Nh�n 1200 �i�m c�ng tr�ng v� 20.000.000 �i�m kinh nghi�m/#Denbu_NhanThuong6x_01(1)")
	tinsert(tbSay,"Nh�n 2400 �i�m c�ng tr�ng v� 30.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng ch��ng)/#Denbu_NhanThuong6x_01(2)")
	tinsert(tbSay,"Nh�n 6000 �i�m c�ng tr�ng v� 40.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng ��i)/#Denbu_NhanThuong6x_01(3)")
	tinsert(tbSay,"Nh�n 12000 �i�m c�ng tr�ng v� 60.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng huy ho�ng)/#Denbu_NhanThuong6x_01(4)")
	tinsert(tbSay,"Nh�n 16800 �i�m c�ng tr�ng v� 90.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng vinh d�)/#Denbu_NhanThuong6x_01(5)")
	tinsert(tbSay,"R�i kh�i/gf_DoNothing")
	Say(szNpcName.."C�c h� mu�n nh�n g� n�o? \n",getn(tbSay),tbSay)
end

function Denbu_NhanThuong6x_01(nChoice)
	if gf_GetTaskByte(TSK_DENBU_HOAPHUNG,4) == 1 then
		Talk(1,"",szNpcName.."C�c h� �� nh�n ph�n th��ng trong ng�y. Xin vui l�ng quay l�i ng�y h�m sau!")
		return
	end

	if nChoice == 1 then
		gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
		--Nh�n C�ng tr�ng
		gf_EventGiveCustomAward(31, 1200, 1, "DenBuHoaPhung", "Nhan")
		
		--Nh�n kinh nghi�m
		gf_EventGiveCustomAward(1, 20000000, 1, "DenBuHoaPhung", "Nhan")
	elseif nChoice == 2 then
		if GetItemCount(2,1,9999) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng Ch��ng trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		if DelItem(2,1,9999,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 2400, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 30000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 3 then
		if GetItemCount(2,1,9998) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng ��i trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		
		if DelItem(2,1,9998,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 6000, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 40000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 4 then
		if GetItemCount(2,1,9977) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng Huy Ho�ng trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		
		if DelItem(2,1,9977,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 12000, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 60000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 5 then
		if GetItemCount(2,1,30642) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng Ch��ng Vinh D� trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		
		if DelItem(2,1,30642,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 16800, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 90000000, 1, "DenBuHoaPhung", "Nhan")
		end
	end
end


