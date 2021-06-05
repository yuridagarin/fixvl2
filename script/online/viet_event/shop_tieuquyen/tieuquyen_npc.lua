-- Created by TuanNA5
-- 17-03-2010
-- Shop ti�n l�

Include("\\script\\online\\viet_event\\shop_tieuquyen\\shop_head.lua");

function talk_exchange()
	local tSay ={
		"D�ng Ng�n Phi�u c�a D� T�u ��i 20 Ti�n L�/#exchange_sliver(1)",
		"D�ng ��i Ng�n Phi�u ��i 105 Ti�n L�/#exchange_sliver(2)",
		"D�ng Ti�n L� ��i �i�m kinh nghi�m/silver_2_exp",
--		"D�ng Ti�n L� ��i v�t ph�m/silver_2_item",
		"Ta ch� gh� qua!/gf_DoNothing",	
	}
	Say("C�c h� c� th� d�ng <color=yellow>Ti�n L�<color> �� ��i c�c v�t ph�m c�n thi�t t�i ��y. <color=yellow>Ti�n L�<color> c� th� ��i b�ng <color=yellow>��i Ng�n Phi�u, Ng�n Phi�u c�a D� T�u mua t� Ng� C�c<color>.",getn(tSay),tSay)
end
	
function silver_2_item()
	local tSay ={
		"��i 5 Ti�n L� l�y 1 Th�i H� �a M�t Qu�/#get_sliver_item(2)",
--		"��i 5 Ti�n L� l�y 1 T�ng Ki�m Anh H�ng Thi�p/#get_sliver_item(3)",
		"��i 20 Ti�n L� l�y 1 V�n C�m H�p/#get_sliver_item(4)",
		"��i 40 Ti�n L� l�y 1 Thi�n Th�ch Tinh Th�ch/#get_sliver_item(1)",
		"��i 160 Ti�n L� l�y 1 Qu�n C�ng Huy Ho�ng/#get_sliver_item(5)",
		"Ta ch� gh� qua!/gf_DoNothing",	
	}	
	if IsTitleExist(51, 1) > 0 or IsTitleExist(51, 2) > 0 or IsTitleExist(51, 5) > 0 or IsTitleExist(51, 6) > 0 or IsTitleExist(51, 9) > 0 or IsTitleExist(51, 10) > 0 then
		tinsert(tSay,1,	"��i 40 Ti�n L� l�y 1 Ho�ng Kim ��i H�ng Bao (tr�ng)/#get_sliver_item(7)")
		tinsert(tSay,1,"��i 15 Ti�n L� l�y 1 T� Kim H�ng Bao (tr�ng)/#get_sliver_item(6)")
	end	
	Say("C�c h� c� th� d�ng <color=yellow>Ti�n L�<color> �� ��i c�c v�t ph�m c�n thi�t t�i ��y. <color=yellow>Ti�n L�<color> c� th� ��i b�ng <color=yellow>��i Ng�n Phi�u, Ng�n Phi�u c�a D� T�u mua t� Ng� C�c<color>.",getn(tSay),tSay)
end

function silver_2_exp()
	local tSay ={
		"��i 1 Ti�n L� l�y 240.000 kinh nghi�m/#get_sliver_exp(1)",
		"��i 5 Ti�n L� l�y 1.200.000 kinh nghi�m/#get_sliver_exp(2)",
		"��i 25 Ti�n L� l�y 6.000.000 kinh nghi�m/#get_sliver_exp(3)",
		"��i 125 Ti�n L� l�y 30.000.000 kinh nghi�m/#get_sliver_exp(4)",
		"��i 250 Ti�n L� l�y 62.500.000 kinh nghi�m/#get_sliver_exp(5)",
		"��i 500 Ti�n L� l�y 125.000.000 kinh nghi�m/#get_sliver_exp(6)",
		"��i 1000 Ti�n L� l�y 250.000.000 kinh nghi�m/#get_sliver_exp(7)",
		"��i 2000 Ti�n L� l�y 500.000.000 kinh nghi�m/#get_sliver_exp(8)",
		"Ta ch� gh� qua!/gf_DoNothing",	
	}
	Say("C�c h� c� th� d�ng <color=yellow>Ti�n L�<color> �� ��i �i�m kinh nghi�m. Ch� c� th� ��i ���c nhi�u nh�t <color=yellow>500.000.000 �i�m kinh nghi�m<color>.",getn(tSay),tSay)
end


function get_sliver_exp(nSelect)
	if nSelect == 0 then return end	
	local nCurExp = GetTask(TSK_SILVER_2_EXP)
	if nCurExp == 500000 then
		Talk(1,"","B�n �� ��i t�i �a 500000000 �i�m kinh nghi�m!")
		return
	end
	if nCurExp + tSilver_Exp[nSelect][2] <= 500000 then
		if Check_Silver(tSilver_Exp[nSelect][1]) ~= 1 then
			Talk(1,"","Kh�ng �� Ti�n L� �� ��i v�t ph�m!")
			return
		end
		if DelItem(2,1,198,tSilver_Exp[nSelect][1]) == 1 then
			SetTask(TSK_SILVER_2_EXP,nCurExp + tSilver_Exp[nSelect][2])
			gf_EventGiveCustomAward(1,tSilver_Exp[nSelect][2] * 1000,1,"Shop Tien Le","��i")			
		end	
	else	
		Talk(1,"","�i�m kinh nghi�m t�ch l�y v��t qu� 500000000 �i�m, h�y ��i m�c th�p h�n!")
	end
end

function get_sliver_item(nSelect)
	if nSelect == 0 then return end	
	local nDay = tonumber(date("%d"))
	if gf_GetTaskByte(TASK_LIMIT_JUNGONG,1) ~= nDay then
		gf_SetTaskByte(TASK_LIMIT_JUNGONG,1,nDay)
		gf_SetTaskByte(TASK_LIMIT_JUNGONG,2,0)
	end
	if gf_GetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_DATE) ~= nDay then
		gf_SetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_DATE,nDay)
		gf_SetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_SMALL,0)
		gf_SetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_BIG,0)		
	end
	if Check_Silver(tSliver_Exchange[nSelect][1]) ~= 1 then
		Talk(1,"","Kh�ng �� Ti�n L� �� ��i v�t ph�m!")
		return
	end
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return
	end
	if nSelect == 5 then
		if gf_GetTaskByte(TASK_LIMIT_JUNGONG,2) >= 2 then
			Talk(1,"","H�m nay c�c h� �� ��i Qu�n C�ng Huy Ho�ng 2 l�n r�i! Ng�y mai ��i ti�p nh�!")
			return
		end
	elseif nSelect == 6 or nSelect == 7 then
		local nSmallCount = gf_GetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_SMALL)
		local nBigCount = gf_GetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_BIG)
		if nSmallCount >= 10 and nSelect == 6  then
			Talk(1,"","H�m nay c�c h� �� ��i 10 l�n r�i! Ng�y mai ��i ti�p nh�!")
			return
		end
		if nBigCount >= 10 and nSelect == 7  then
			Talk(1,"","H�m nay c�c h� �� ��i 10 l�n r�i! Ng�y mai ��i ti�p nh�!")
			return
		end		
	end
	if DelItem(2,1,198,tSliver_Exchange[nSelect][1]) == 1 then
		if nSelect == 5 then
			gf_SetTaskByte(TASK_LIMIT_JUNGONG,2,gf_GetTaskByte(TASK_LIMIT_JUNGONG,2) + 1)
		elseif nSelect == 6 then
			gf_SetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_SMALL,gf_GetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_SMALL) + 1)
		elseif nSelect == 7 then
			gf_SetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_BIG,gf_GetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_BIG) + 1)		
		end
		gf_AddItemEx2(tSliver_Exchange[nSelect][3],tSliver_Exchange[nSelect][2],"Shop Tien Le","��i",tSliver_Exchange[nSelect][4])	
	end
end


function exchange_sliver(nSelect)
	if nSelect == 0 then return end	
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return
	end
	if nSelect == 1 then
		if GetItemCount(2,0,1) < 1 then
			Talk(1,"","H�nh nh� c�c h� kh�ng mang theo Ng�n Phi�u c�a D� T�u trong ng��i!")
			return
		end
		if DelItem(2,0,1,1) ==1 then
			gf_AddItemEx2({2,1,198,EXCHANGE_RATE},"Ti�n L�","Shop Tien Le","��i")
		end	
	elseif nSelect == 2 then
		if GetItemCount(2,1,199) < 1 then
			Talk(1,"","H�nh nh� c�c h� kh�ng mang theo ��i Ng�n Phi�u trong ng��i!")
			return
		end
		if DelItem(2,1,199,1) ==1 then
			gf_AddItemEx2({2,1,198,BIG_EXCHANGE_RATE},"Ti�n L�","Shop Tien Le","��i")
		end	
	else
		return
	end
end
