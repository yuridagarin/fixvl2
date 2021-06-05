Include("\\script\\lib\\writelog.lua")
--***********************************����������*****************************
--------------------------------------------����������BOSSʹ�ö���
Zgc_conf_task_boss = {			--��һ�ȼ�BOSS
	"C�n L�n N�",
	"B�i H�ng",
	"Li�u Ngh�",
	"H�ng Tuy�n",
	"H� C�nh Th�ng",
	"Nhi�p ��i Ch�y",
	"B� Phi Y�n",
}
Zgc_conf_task_box = {
	"R��ng c�a C�n L�n N� �� l�i",
	"R��ng c�a B�i H�ng �� l�i",
	"R��ng c�a Li�u Ngh� �� l�i",
	"R��ng c�a H�ng Tuy�n �� l�i",
	"R��ng s�t c�a H� C�nh Th�ng",
	"R��ng s�t c�a Nhi�p ��i Ch�y",
	"B�o r��ng c�a B� Phi Y�n",
}
Zgc_cong_task_usemapid = {
	{302,"Thanh Th�nh s�n"},		
	{327,"� M�ng B�"},
	{401,"�i�m Th��ng s�n"},
	{306,"Giang T�n Th�n"},
	{307,"Phong ��"},
	{405,"Ch�n n�i V� L�ng"},
	{406,"V� L�ng s�n"},
	{326,"M� Tuy�t s�n trang"},
	{310,"Ki�m M�n quan"},
	{311,"Ph�c Ng�u s�n"},
	{218,"Linh B�o s�n"},
	{202,"H�nh Hoa th�n"},
	{151,"V�n M�ng Tr�ch"},			
	{106,"Long Tuy�n Th�n"},
	{107,"V� Di s�n"},
	{103,"��ng H�i H�i T�n 1"},
	{104,"��ng H�i H�i T�n 2"},
	{102,"��o Hoa ��o"},
	{207,"Nh� Long s�n"},
	{217,"D� Tr� l�m"},
	{208,"L��ng S�n B�c"},
	{604,"Nh�n M�n quan"},
	{601,"��i Th�o Nguy�n 1"},
	{602,"��i Th�o Nguy�n 2"},
	{600,"B� l�c V��ng K�"},
}
TaskID_bfy_crt = 958
function OnUse(goods_index)
	SetItemUseLapse(goods_index,90)
	local mapID,X,Y = GetWorldPos()
	local chk_flag = 0
	for i = 1, getn(Zgc_cong_task_usemapid) do				--ʹ�õ�ͼ�ж�
		if Zgc_cong_task_usemapid[i][1] == mapID then
			chk_flag = 1
			break
		end
	end
	if chk_flag == 0 then
		Say("N�i ��y quan binh canh gi� nghi�m ng�t, ��m ng��i B� Phi Y�n to gan c�ch m�y c�ng kh�ng d�m b�n m�ng t�i, ng��i th� ��n ch� kh�c xem!",
			2,
			"Ta mu�n bi�t h�nh tung c�a B� Phi Y�n/Zgc_bfy_actmap_inq",
			"Ta bi�t r�i/Zgc_end_dialog"
		)		
	else
		Say("B�n mu�n d�ng hoa c��ng th�ch? N� c� th� gi�p b�n tri�u g�i B� Phi Y�n nhanh h�n",
		2,
		"S� d�ng/#jdhgs_use()",
		"�� ta suy ngh� l�i/end_dialog")
	end
end
function jdhgs_use()
	if GetItemCount(2,1,1023) < 1 then
		Talk(1,"end_dialog","Xin x�c nh�n tr�n ng��i c� Hoa c��ng th�ch v� Sinh Th�n C��ng!")
		return
	elseif GetItemCount(2,0,545) < 1 then
		Talk(1,"end_dialog","Mu�n g�t ta �?")
		return
	end
	if DelItem(2,1,1023,1) ~= 1 or DelItem(2,0,545,1) ~=1 then
		Talk(1,"end_dialog","Xin x�c nh�n tr�n ng��i c� Hoa c��ng th�ch v� Sinh Th�n C��ng!")
		return
	else
			local strLogCaption = "Nhiem vu Bang hoi"
			local boss_step = random(1,100)
			local npc_index = 0
			local boss_seq = 0
			local mapID,X,Y = GetWorldPos()
			if boss_step == 37 or boss_step == 73 then
				boss_seq	= 7
				npc_index = CreateNpc(Zgc_conf_task_boss[7],Zgc_conf_task_boss[7],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."S� d�ng Sinh Th�n Cang g�i ra B� Phi Y�n!")
				if IsTongMember() ~= 0 then
					AddGlobalNews(GetTongName().."C� tin b�n h� �ang giao ��u v�i B� Phi Y�n!")
				end
				WriteLogEx(strLogCaption, "g�i ra", "1", Zgc_conf_task_boss[boss_seq], "", GetTongName())
			elseif boss_step <= 85 then
				boss_seq = random(5,6)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				if IsTongMember() ~= 0 then
					SendTongMessage(GetName().."S� d�ng Sinh Th�n Cang g�i ra:"..Zgc_conf_task_boss[boss_seq].."!")
				end
			else
				boss_seq = random(1,4)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				if IsTongMember() ~= 0 then
					SendTongMessage(GetName().."S� d�ng Sinh Th�n Cang g�i ra:"..Zgc_conf_task_boss[boss_seq].."!")
				end
			end
			WriteLogEx(strLogCaption, "Tinh �i�u Hoa C��ng", "1", Zgc_conf_task_boss[boss_seq], "", GetTongName())			
			SetNpcScript(npc_index,"\\script\\item\\conftaskbosscreate.lua")
	end

end
--********************************�����ٿ�ʹ�õ�ͼ��ѯ*****************************
function Zgc_bfy_actmap_inq()
	local dialog_string = "  "
	for i = 1, getn(Zgc_cong_task_usemapid)do
		dialog_string = dialog_string .. Zgc_cong_task_usemapid[i][2]
		if floor(i/5)-(i/5) == 0 then
			dialog_string = dialog_string .."\n  "
		else
			for j = 1,(16-strlen(Zgc_cong_task_usemapid[i][2])) do
				dialog_string = dialog_string .." "
			end
		end
	end
	Say("B� Phi Y�n h�nh tung b�t ��nh, ng��i bi�t tung t�ch h�n ta ch� c�: \n"..dialog_string,
		1,
		"Ta bi�t r�i/Zgc_end_dialog"
	)
end
function end_dialog()
end
