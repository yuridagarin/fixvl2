
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��¥�ϰ�ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

--Խ�ϸ��
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv58\\task_main.lua");
Include("\\script\\online\\dragon_boat_07\\dragon_boat_08_head.lua")

--201207������ϯ�
Include("\\script\\online_activites\\201206\\haibianyanxi.lua")
--201208��������
Include("\\script\\online_activites\\201207\\sushipan.lua")
--201209��Ů�ڻ
Include("\\script\\online_activites\\201209\\send_gif.lua")

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if CanAcceptTask(TASK_LOVESTORY2,3) == 1 then
		Talk(1,"selbuy","Xin h�i n�i ��y c� b�n H�ng Ho�ng T�u kh�ng?")
		return 
	end
	if (nState==12) then
		task_012_00();
		return
	end;
	
	if GetTask(TASK_DL_LV55_ID) == 7 and GetItemCount(2,0,376) < 1 then
		--��Ȫ�ݾ�¥�ϰ����ƶ���
		buy_gift_talk(3);
		return
	end;
	local sal_num = 97
	if dragon_boat_08_time_chk() ~= 1 then
		sal_num = 98
	end
	
	local tSel = {};
	
	--201207������ϯ�
	if gf_CheckEventDateEx(VET_201206_ACITIVITY_ID) ~= 0 then
		for i=1,getn(VET_201206_Say_Tb) do
			tinsert(tSel,VET_201206_Say_Tb[i]);
		end
	end
	
	--201208��������
	if gf_CheckEventDateEx(VET_201207_ACITIVITY_ID) ~= 0 then
		for i=1,getn(VET_201207_Say_Tb) do
			tinsert(tSel,VET_201207_Say_Tb[i]);
		end
	end
	
	--201209��Ů�ڻ
	if gf_CheckEventDateEx(VET_201209_ACITIVITY_ID) ~= 0 then
		for i=1,getn(VET_201209_Say_Tb) do
			tinsert(tSel,VET_201209_Say_Tb[i]);
		end
	end
	
	--���
	if gf_CheckEventDateEx(75) ~= 0 then
		local tSayDialog = aah_GetSayDialog();
		if tSayDialog then
			for i=1, getn(tSayDialog) do
				tinsert(tSel, tSayDialog[i]);
			end
		end
	end
	-- Event nh� th�ng 3
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20130326 and nDate <= 20130331 then
		tinsert(tSel,"Quy�n g�p 1 Long Huy�t Ho�n/#vng_quyengop(1)");
		tinsert(tSel,"Quy�n g�p 1 K� L�n Ho�n/#vng_quyengop(2)");
		tinsert(tSel,"Quy�n g�p 1 Ph�ng Huy�t Ho�n/#vng_quyengop(3)");
		tinsert(tSel,"Quy�n g�p 1 Chi�n Th�n Ho�n/#vng_quyengop(4)");
	end
	--tinsert(tSel, "����Щ���Ӳ���/#Sale("..sal_num..")")
	tinsert(tSel,	"Ta ch� �i ngang th�i/end_dialog");
	Say("<color=green>Ch� T�u l�u<color>: R��u v� th�c �n � ch� ta r�t ngon, c�n c� nguy�n li�u l�m b�nh �t n�a, kh�ch quan c� mu�n gh� qua kh�ng?",
		getn(tSel), tSel)
end
function selbuy()
	local selTab = {
		"Mua 1 b�nh/buy",
		"K�t th�c ��i tho�i./nothing"
		}
	Say("Ch� t�u l�u: N�i n�y r��u g� c�ng c�! H�ng Ho�ng m� t�u 20 l��ng m�t b�nh!",2,selTab)
end

function buy()
	if CanAcceptTask(TASK_LOVESTORY2,3) == 1 then
		if Pay(2000) == 1 then
			if AddItem(2,0,359,1) == 1 then
				Say("Ch� t�u l�u: �a t� kh�ch quan chi�u c�! R�nh r�i h�y quay l�i nh�!",0)
				local OldPlayerIndex = PlayerIndex
				for i=1,2 do
					PlayerIndex = GetTeamMember(i)
					SetTask(TASK_LOVESTORY2,4)
					TaskTip("Mang H�ng Ho�ng T�u v� g�p H�a Ti�n!")
				end
				PlayerIndex = OldPlayerIndex
			end
		else
			Say("Ch� t�u l�u: Ai da! Ti�n kh�ng c� m� ��i u�ng r��u ngon �!",0)
		end
	else
		Say("Ng��i kh�ng gi�p n�i ta ��u! C�n ph�i c� s�c m�nh c�a t�nh y�u m�i c� th� gi�p ���c ta!",0)
	end
end

function vng_quyengop(nType)
	local tHorse = {
				[1] = {"Long Huy�t ho�n", 1002},
				[2] = {"K� L�n ho�n", 1003},
				[3] = {"Ph�ng Huy�t ho�n", 1004},
				[4] = {"Chi�n Th�n ho�n", 1005},
			}
	local tNhonNhip_Award = {
					{1, 888, "Thi�n Th�ch Tinh Th�ch", {2,1,1009,2}},
					{1, 10, "Chuy�n Sinh ��n", {2,1,30345,1}, 30 * 24 * 3600},
					{1, 50, "��i ��nh H�n", {2,1,1113,1}, 30 * 24 * 3600},
					{1, 1212, "Ma �ao Th�ch 1", {2,1,30428,3}, 15 * 24 * 3600},
					{1, 1212, "Ma �ao Th�ch 2", {2,1,30429,3}, 15 * 24 * 3600},					
					{1, 1500, "Ma �ao Th�ch 3", {2,1,30430,3}, 15 * 24 * 3600},
					{1, 1000, "C��ng h�a quy�n 12", {2,1,30424,1}, 15 * 24 * 3600},
					{1, 1000, "C��ng h�a quy�n 13", {2,1,30425,1}, 15 * 24 * 3600},
					{1, 1515, "C��ng h�a quy�n 14", {2,1,30426,1}, 15 * 24 * 3600},
					{1, 1613, "C��ng h�a quy�n 15", {2,1,30427,1}, 15 * 24 * 3600},
			}	
	if gf_GetTaskByte(TSK_LUCKY_DAOHUU,nType) >= 1 then
		Talk(1,"","��i hi�p �� ��i th��ng lo�i n�y r�i. H�y ch�n ��i th��ng lo�i kh�c ho�c quay l�i v�o ng�y mai !!!");
		return 0;
	end	
	if GetItemCount(2,1,tHorse[nType][2]) < 1 then
		Talk(1,"","��i hi�p kh�ng mang theo "..tHorse[nType][1].." �� ��i th��ng");
		return 0;
	end
	if gf_Judge_Room_Weight(14,600," ") ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0;
	end
	if DelItem(2,1,tHorse[nType][2],1) == 1 then
		gf_SetTaskByte(TSK_LUCKY_DAOHUU,nType,gf_GetTaskByte(TSK_LUCKY_DAOHUU,nType) + 1)
		gf_AddItemEx2({2,1,30230,500},"��i th��ng lo�i "..tHorse[nType][1],"THANG 3 NHON NHIP BK","Nh�n th�nh c�ng xu v�t ph�m")
		ModifyExp(200000000)
		if GetTask(701) >= 0 then
			SetTask(701,GetTask(701) + 1000)
		else
			SetTask(701,GetTask(701) - 1000)
		end		
		gf_AddItemEx2({2,1,30390,30},"��i th��ng lo�i "..tHorse[nType][1],"THANG 3 NHON NHIP BK","Nh�n th�nh c�ng m�nh thi�n cang")
		for i = 1, 3 do
			gf_EventGiveRandAward(tNhonNhip_Award,10000,1, "THANG 3 NHON NHIP BK", "nh�n 3 ph�n th��ng ng�u nhi�n")
		end
		gf_WriteLogEx("THANG 3 NHON NHIP", "nh�n th��ng th�nh c�ngi", 1, "Nh�n th��ng lo�i "..tHorse[nType][1])		
	end
end

function nothing()

end

