
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���ι�Ա�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua")

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
			
	if (IsFreeze() == 1) then  --�����WG����
	    Talk(1,"lua_clear","<color=yellow>B�o v� t�i kho�n, tr�nh ph�n m�m hack!<color>");
	    WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount().."["..GetName().."]", "Kh�ng s� d�ng ph�n m�m hack");
	    return
	end;
	
	if (nState==13) then
		task_013();
		return
	else
		--Talk(1,"","L�m ng��i, tr��c khi nh�m m�t xu�i tay, c� th� c�ng hi�n cho Qu�c gia c�ng l� vi�c n�n l�m!");
		Msg2Player("L�m ng��i, tr��c khi nh�m m�t xu�i tay, c� th� c�ng hi�n cho Qu�c gia c�ng l� vi�c n�n l�m !!!!")
	end;
    ----------- Chu�i nhi�m v� Chuy�n Sinh 6
    	local szNpcName = "<color=green>Vi�n Quan Tho�i Nhi�m<color>: "
	local tSay = {}
	local tHeader = szNpcName.."B� k�p <color=yellow>T� Linh Ph�c Sinh<color> l� g�, ta m�i nghe l�n ��u. !!! Ai n�i v�i ��i hi�p l� t�i h� �ang n�m gi� b� k�p n�y ?"
 	local nDate = tonumber(date("%Y%m%d"))
	tSay = aah_GetSayDialog(86);
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");		
	Say(tHeader, getn(tSay), tSay)   	
	if nDate >= 20130427 and nDate <= 20130505 then
 		tinsert(tSay, "�ng h� Bi�n ��o n��c nh� (10 Hu�n Ch��ng JXII + 10 v�ng)/#vng_ungho(1)")		
		tinsert(tSay, "�ng h� Bi�n ��o n��c nh� (10 B�ng Khen JXII + 10 v�ng)/#vng_ungho(2)")
		tinsert(tSay, "�ng h� Bi�n ��o n��c nh� (10 �n L�nh Th� + 10 v�ng)/#vng_ungho(3)")
		tinsert(tSay, "Nh�n th��ng nhi�t t�nh �ng h� (m�i lo�i �ng h� 50 l�n)/vng_ungho_finish")					
		tinsert(tSay, "Kh�ng ��ng ph�i l�m/nothing")	
		Say(tHeader, getn(tSay), tSay)   
	end
    --if GetTranslifeCount() < 6 and GetTaskTrans() < 38 then
    if GetTask(TSK_CS6_TULINH) < 2 then
    		--Talk(1,"","��i hi�p ch�a l�nh ng� ���c ph�n 1 c�a b� k�p T� Linh Ph�c Sinh");		-- check �k l�nh ng� ph�n 1 � npc B�c ��u l�o nh�n xong r�i m�i l�m ti�p ph�n d��i
    		return 0
    end

	--if GetTranslifeCount() < 6 and GetTaskTrans() == 39 then		
	if GetTask(TSK_CS6_TULINH) == 3 then
		tinsert(tSay, "Th� th�ch nhi�m v� T� Linh Ph�c Sinh/cs6_npc2_infor1")		
		tinsert(tSay, "Kh�ng ��ng ph�i l�m/nothing")	
	elseif GetTask(TSK_CS6_TULINH) == 4 then
		tinsert(tSay, "Th� th�ch nhi�m v� T� Linh Ph�c Sinh/cs6_npc2_infor1")		
		tinsert(tSay, "Kh�ng ��ng ph�i l�m/nothing")			
	elseif GetTask(TSK_CS6_TULINH) == 2 then
		tinsert(tSay, "B�c ��u l�o nh�n k�u ta ��n vi�ng th�m c�c h�/cs6_infor_talk_1")		
		tinsert(tSay, "Ng��i trong giang h� �i�u n�i c�c h� �ang n�m gi� b� k�p/nothing_do_nothing")
		tinsert(tSay, "Kh�ng ��ng ph�i l�m/nothing")	
	end
	
	Say(tHeader, getn(tSay), tSay)   
    
end;
function cs6_infor_talk_1()
 	local szNpcName = "<color=green>Vi�n Quan Tho�i Nhi�m<color>: "
	local tSay = {}
	local tHeader = szNpcName.." nh� ta m�c d� bao ��i l�m quan V�n, nh�ng t� xa x�a c� n�a quy�n s�ch ���c truy�n t� ��i n�y sang ��i kh�c v� ���c coi l� b�o v�t gia truy�n, T� ti�n n�i n�a quy�n s�ch n�y c� th� g�y ch�n ��ng to�n c�i v� l�m v� ch� truy�n th� cho ng��i h�u duy�n, c� t�i c� ��c. ��i hi�p h�y l�m c�c nhi�m v�: C�ng hi�n cho qu�c gia, gi�t y�u qu�i v� di�t qu�n x�m l�ng"
		
	tinsert(tSay, "Ch�p nh�n th� th�ch/cs6_npc2_infor1")		
	tinsert(tSay, "Kh�ng ��ng ph�i l�m/nothing")
	Say(tHeader, getn(tSay), tSay)   
end

function lua_clear()
    ModifyReputation(-50, 0);
    ClearFreeze();  --���
end;

function nothing_do_nothing()
	Talk(1,"","Th�t m�c c��i, nh� ta bao ��i ��u l�m quan V�n, ��u c� luy�n v� c�ng n�n l�m g� c� b� k�p nh� ��i hi�p n�i !!!!");
	return 0
end

function vng_ungho(nType)
	local nExp = 39000000
	local tCheck = {
				[1] = {"Hu�n Ch��ng JXII", 30502},
				[2] = {"B�ng Khen JXII", 30503},
				[3] = {"�n L�nh Th�", 30504},
			}
	local tUngHo_Award = { --kinh nghi�m, ch�n kh�, c�ng tr�ng
				[1] = {15000000, 150, 150},
				[2] = {15000000, 150, 150},
				[3] = {39000000, 390, 390},
			}
--	local tBanhIt_Award = {
--					{1, 666, "Thi�n Th�ch Tinh Th�ch", {2,1,1009,1}},
--					{1, 2000, "M�nh Thi�n Cang", {2,1,30390, 10}},
--					{1, 1400, "B�nh �t ng�i h��ng", {2,1,1123,2,4}},
--					{1, 2000, "B�nh �t ch�n g�", {2,1,1124,2,4}},
--					{1, 1000, "B�nh �t b�t b�o", {2,1,1125,2,4}},					
--					{3, 2934, 100000,1},
--			}	
	if gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,nType) >= 50 then
		Talk(1,"","��i hi�p �� ��i th��ng 50 l�n r�i !!!");
		return 0;
	end	
	if GetCash() < 100000 then
		Talk(1,"","��i hi�p kh�ng mang theo �� 10 v�ng �� ��i th��ng");
		return 0;
	end	
	if GetItemCount(2,1,tCheck[nType][2]) < 10 then
		Talk(1,"","��i hi�p kh�ng mang theo �� nguy�n li�u ��i th��ng");
		return 0;
	end
	if gf_Judge_Room_Weight(10,200," ") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end
	if GetPlayerRebornParam(0) < 1 then
		if  nExp > (2000000000 - GetExp()) then
			Talk(1,"", "C�c h� kh�ng nh�n ���c �i�m kinh nghi�m v� s� v��t qu� 2 t� �i�m !!!!")
		end
	end	
	if DelItem(2,1,tCheck[nType][2],10) == 1 and Pay(100000) == 1 then
		gf_SetTaskByte(TSK_EVENT_PHU_MOI_THANG,nType,gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,nType) + 1)
		ModifyExp(tUngHo_Award[nType][1])
		Msg2Player("B�n nh�n ���c "..tUngHo_Award[nType][1].." �i�m kinh nghi�m")	
		if MeridianGetLevel() >= 1 then
			AwardGenuineQi(tUngHo_Award[nType][2])
		else
			Talk(1,"","��i hi�p ch�a kich ho�t kinh m�ch n�n kh�ng th� nh�n ���c �i�m ch�n kh� !!")
		end
		if GetTask(701) >= 0 then
			SetTask(701,GetTask(701) + tUngHo_Award[nType][3])
		else
			SetTask(701,GetTask(701) - tUngHo_Award[nType][3])
		end		
		Msg2Player("B�n nh�n ���c "..tUngHo_Award[nType][3].." �i�m c�ng tr�ng�")
		if nType == 1 or nType == 2 then		
			gf_AddItemEx2({2,0,1082,15},"��i th��ng lo�i "..nType, "UNG HO BIEN DAO BK","Nh�n th�nh c�ng T� T�m")
			Msg2Player("B�n nh�n ���c 15 m�nh Th�i D�ch H�n Nguy�n C�ng")
		else
			local nAwardRand = mod(random(1,1000),20)
			gf_AddItemEx2({2,1,(30164+nAwardRand),39}, "Item Tr�i c�y", "UNG HO BIEN DAO BK", "nh�n th�nh c�ng")    
		end
		gf_WriteLogEx("UNG HO BIEN DAO", "nh�n th��ng th�nh c�ng", 1, "Nh�n th��ng lo�i "..nType)		
	end
end
function vng_ungho_finish()
	local nValue1 = gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,1)
	local nValue2 = gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,2)
	local nValue3 = gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,3)
	local nValue4 = gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,4)
	local nExp = 100000000
	if nValue1 < 50 or nValue2 < 50 or nValue3 < 50 then
		Talk(1,"", "��i hi�p ch�a ho�n th�nh �ng h� m�i lo�i 50 l�n n�n kh�ng th� nh�n th��ng !!")
		return 0
	end
	if nValue4 >= 1 then
		Talk(1,"", "��i hi�p �� nh�n th��ng r�i !!")
		return 0
	end
	if gf_Judge_Room_Weight(10,100," ") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end	
	if GetPlayerRebornParam(0) < 1 then
		if  nExp > (2000000000 - GetExp()) then
			Talk(1,"", "C�c h� kh�ng nh�n ���c �i�m kinh nghi�m v� s� v��t qu� 2 t� �i�m !!!!")
		end
	end		
	gf_SetTaskByte(TSK_EVENT_PHU_MOI_THANG,4,gf_GetTaskByte(TSK_EVENT_PHU_MOI_THANG,4) + 1)	
	ModifyExp	(nExp)
	if MeridianGetLevel() >= 1 then
		AwardGenuineQi(10000)
	else
		Talk(1,"","��i hi�p ch�a kich ho�t kinh m�ch n�n kh�ng th� nh�n ���c �i�m ch�n kh� !!")
	end	
	gf_AddItemEx2({2,1,30340,6789},"��i th��ng lo�i ho�n th�nh 50 l�n ","UNG HO BIEN DAO BK","Nh�n th�nh c�ng 4 Huy Ho�ng")
	gf_WriteLogEx("UNG HO BIEN DAO", "nh�n th��ng th�nh c�ngi", 1, "Nh�n th��ng ho�n th�nh 50 l�n")		
	
end