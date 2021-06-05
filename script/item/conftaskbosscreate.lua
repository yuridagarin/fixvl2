Include("\\script\\lib\\writelog.lua")
strLogCaption = "Nhiem vu Bang hoi"
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
	{601,"��i Th�o Nguy�n 1"},
	{602,"��i Th�o Nguy�n 2"},
	{103,"��ng H�i H�i T�n 1"},
	{104,"��ng H�i H�i T�n 2"},
	{102,"��o Hoa ��o"},
	{207,"Nh� Long s�n"},
	{217,"D� Tr� l�m"},
	{208,"L��ng S�n B�c"},
	{604,"Nh�n M�n quan"},
	{106,"Long Tuy�n Th�n"},
	{107,"V� Di s�n"},
	{600,"B� l�c V��ng K�"},
}
--======================================ʹ���������ٻ�BOSS==============================
function OnUse(id)
	SetItemUseLapse(id,90)
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
	else														--����BOSS	
		local del_flag = DelItemByIndex(id,1)
		if del_flag ~= 1 then
			WriteLogEx(strLogCaption, "", "", "", "", GetTongName(),"x�a Sinh Th�n Cang th�t b�i, ID th�t b�i:"..del_flag)
		else
			local boss_step = random(1,100)
			local npc_index = 0
			local boss_seq = 0
			if boss_step == 37 then
				boss_seq = 7
				npc_index = CreateNpc(Zgc_conf_task_boss[7],Zgc_conf_task_boss[7],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."S� d�ng Sinh Th�n Cang g�i ra B� Phi Y�n!")
				AddGlobalNews(GetTongName().."C� tin b�n h� �ang giao ��u v�i B� Phi Y�n!")
				WriteLogEx(strLogCaption, "g�i ra", "1", "B� Phi Y�n", "", GetTongName())
			elseif boss_step <= 85 then
				local boss_seq = random(5,6)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."S� d�ng Sinh Th�n Cang g�i ra:"..Zgc_conf_task_boss[boss_seq].."!")
				WriteLogEx(strLogCaption, "g�i ra", "1", Zgc_conf_task_boss[boss_seq], "", GetTongName())
			else
				boss_seq = random(1,4)
				npc_index = CreateNpc(Zgc_conf_task_boss[boss_seq],Zgc_conf_task_boss[boss_seq],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."S� d�ng Sinh Th�n Cang g�i ra:"..Zgc_conf_task_boss[boss_seq].."!")
				WriteLogEx(strLogCaption, "g�i ra", "1", Zgc_conf_task_boss[boss_seq], "", GetTongName())
			end
			SetNpcScript(npc_index,"\\script\\item\\conftaskbosscreate.lua")			
		end
	end
end
--********************************�����ٿ�ʹ�õ�ͼ��ѯ*****************************
function Zgc_bfy_actmap_inq()
	local dialog_string = "  "
	for i = 1, getn(Zgc_cong_task_usemapid) do
		dialog_string = dialog_string .. Zgc_cong_task_usemapid[i][2]
		if floor(i/4)-(i/4) == 0 then
			dialog_string = dialog_string .."\n  "
		else
			for j = 1,(19-strlen(Zgc_cong_task_usemapid[i][2])) do
				dialog_string = dialog_string .." "
			end
		end
	end
	Say("B� Phi Y�n h�nh tung b�t ��nh, ng��i bi�t tung t�ch h�n ta ch� c�: \n"..dialog_string,
		1,
		"Ta bi�t r�i/Zgc_end_dialog"
	)
end
--**********************************BOSS��������***********************************
function OnDeath(index)
	SetNpcLifeTime(index,0)
	local npc_name = GetNpcName(index)
	local npc_level = 0
	local MapID,X,Y	= GetNpcWorldPos(index)
	---------------------------------�ж����ĸ�BOSS����------------------------------
	for i = 1, 7 do
		if Zgc_conf_task_boss[i] == npc_name then
			box_index = CreateNpc(Zgc_conf_task_box[i],Zgc_conf_task_box[i],MapID,X,Y,-1,1,0,0)
			SetNpcScript(box_index,"\\script\\item\\zgcconftaskboxdialog.lua")
			local num_save = GetUnitCurStates(box_index,2)
			AddUnitStates(box_index,2,-num_save)
			WriteLog("Nhi�m v� Bang H�i B� Phi Y�n: BOSS ["..npc_name.."] CH�T!")
			break
		end
	end
end

function Zgc_end_dialog()

end