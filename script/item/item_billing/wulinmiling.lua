--IB��Ʒʦ��Ұ��boss�ٻ���Ʒ�ű�
--���ߣ��Թ�
--��ʼʱ�䣺2007-01-16
--����ʱ�䣺
--��ע�����ε�ͼ������:
--�η�,701��702��703
--���˹�,708
--��̨,801,802,803,805,810,811
--ս��,807,809,881,882,883,884
--ʦ��������ͼ,812,813,814,815,816,817,422
--������̨,821,822,823,824,825,826
--�����̨,827,828,829,830,831,832,833,834
Include("\\script\\online\\zgc_public_fun.lua")
--======================================================�������ݷ�װ=================================================================================
--�������ƣ���������get
--��        �ܣ���λȡ�ð����������
File_name = "\\script\\item\\item_billing\\wulinmiling.lua"
function Zgc_pub_getwrdtask(id,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData("S� li�u ID th� gi�i",0,0,File_name,"CallBackGetWrdTask")
end
function CallBackGetWrdTask(szKey, nKey1, nKey2, nCount)
	local id = (GetTaskTemp(158)-1)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10)+1)
	local wrd_data	= {}
	wrd_data[0],wrd_data[1],wrd_data[2],wrd_data[3],wrd_data[4],wrd_data[5],wrd_data[6],wrd_data[7],wrd_data[8],wrd_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	local save_id = (id - (floor(id/10)*10))
	if wrd_data[save_id] == nil then
		wrd_data[save_id] = 0 
	end
	local return_fun = "WrdDataGetReturn_"..fun_id.."("..wrd_data[save_id]..")"
	dostring(return_fun)
end
--�������ƣ���������set
--��        �ܣ���λ������������
function Zgc_pub_setwrdtask(id,value,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(159,value)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData("S� li�u ID th� gi�i",0,0,File_name,"CallBackSetWrdTask")
end
function CallBackSetWrdTask(szKey, nKey1, nKey2, nCount)
	local id =(GetTaskTemp(158)-1)
	local value = GetTaskTemp(159)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10) + 1)			--�����λ��
	local wrd_data	= {}
	wrd_data[0],wrd_data[1],wrd_data[2],wrd_data[3],wrd_data[4],wrd_data[5],wrd_data[6],wrd_data[7],wrd_data[8],wrd_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	for i = 0, 9 do
		if wrd_data[i] == nil then
			wrd_data[i] = 0 
		end
	end
	local save_id = (id - (floor(id/10)*10))
	wrd_data[save_id] = value
	local rtn_flag = AddRelayShareData("S� li�u ID th� gi�i",0,0, File_name, "end_dialog", 0,suit_id, "dddddddddd", wrd_data[0],wrd_data[1],wrd_data[2],wrd_data[3],wrd_data[4],wrd_data[5],wrd_data[6],wrd_data[7],wrd_data[8],wrd_data[9])
	local return_fun = "WrdDataSetReturn_"..fun_id.."()"
	dostring(return_fun)
end
--=============================������������======================
	boss_list = {
		{},
		{},
		{},
		{"Huy�n Ch�n","Huy�n Ch�n",1015,"V� L�m b� l�nh",3,"\\script\\task\\faction_boss\\xuanzhen.lua"},			--boss���ƣ�ģ��������Ӧ��ƷID����Ӧ��Ʒ���ƣ�ÿ������ٻ������������NPC�ҵ������ű�
		{"���ng H�","���ng H�",1015,"V� L�m b� l�nh",3,"\\script\\task\\faction_boss\\tangxi.lua"},
		{"Tu� Minh","Tu� Minh",1015,"V� L�m b� l�nh",3,"\\script\\task\\faction_boss\\huiming.lua"},
		{"Ho�ng Ch�nh Nh�t","Ho�ng Ch�nh Nh�t",1015,"V� L�m b� l�nh",3,"\\script\\task\\faction_boss\\huangzhengjian.lua"},
		{"Thanh Th�","Thanh Th�",1015,"V� L�m b� l�nh",3,"\\script\\task\\faction_boss\\qingshu.lua"},
		{"D��ng Di�n ��c","D��ng Di�n ��c",1015,"V� L�m b� l�nh",3,"\\script\\task\\faction_boss\\yangwulang.lua"},
		{"C� M�c","C� M�c",1015,"V� L�m b� l�nh",3,"\\script\\task\\faction_boss\\gumo.lua"},
	}
--================================���߼�=========================
--**************************��Ʒʹ��������************************
function OnUse(goods_index)
	SetItemUseLapse(id,90)
	if GetFightState() == 0 then
		Talk(1,"end_dialog","N�i ��y kh�ng ���c s� d�ng v�t ph�m n�y!")
		return
	end
	local MapID,Att_X,Att_Y = GetWorldPos()
	if MapID > 700 then
		Talk(1,"end_dialog","N�i ��y kh�ng ���c s� d�ng v�t ph�m n�y!")
		return
	end
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog"," � tr�ng th�i so t�i kh�ng cho ph�p d�ng v�t ph�m n�y!")
		return
	end
	if city_map_chk() == 1 then
		return
	end
	Say("B�n mu�n d�ng V� L�m b� l�nh tri�u g�i cao th� m�n ph�i?",
		8,
		"Ta mu�n s� d�ng M�t l�nh thi�u l�m g�i h�n Huy�n Ch�n [Thi�u L�m]/#boss_create(4)",
		"Ta mu�n s� d�ng M�t l�nh thi�u l�m g�i h�n ���ng H� [���ng M�n]/#boss_create(5)",
		"Ta mu�n s� d�ng M�t l�nh thi�u l�m g�i h�n Tu� Minh [Nga Mi]/#boss_create(6)",
		"Ta mu�n s� d�ng M�t l�nh thi�u l�m g�i h�nV�ng Ch�nh Nh�t [C�i Bang]/#boss_create(7)",
		"Ta mu�n s� d�ng M�t l�nh thi�u l�m g�i h�n Thanh Th� [V� �ang]/#boss_create(8)",
		"Ta mu�n s� d�ng M�t l�nh thi�u l�m g�i h�n D��ng Di�n ��c [D��ng M�n]/#boss_create(9)",
		"Ta mu�n s� d�ng M�t l�nh thi�u l�m g�i h�n C� M�c [Ng� ��c]/#boss_create(10)",
		"�� ta suy ngh� l�i/end_dialog"
		)
end
--***************************boss����ͳһ������װ*************************
function boss_create(boss_diff)
	SetTaskTemp(164,boss_diff)
	Zgc_pub_getwrdtask(11,11)
end
function WrdDataGetReturn_11(date_seq)
	local boss_diff = GetTaskTemp(164)
	if date_seq > zgc_pub_day_turn(1) then
		Talk(1,"end_dialog",boss_list[boss_diff][1].."c� ch�t nghi ng�, ng�y mai h�y quay l�i!")
		return
	elseif date_seq == zgc_pub_day_turn(1) then
		Zgc_pub_getwrdtask(boss_diff,1)
	else
		Zgc_pub_setwrdtask(11,zgc_pub_day_turn(1),11)
	end
end
--*********************************boss��������********************************
function WrdDataSetReturn_11()
	local boss_diff = GetTaskTemp(164)
	boss_num_set(boss_diff)
end
--*********************************boss��������********************************
function boss_num_set(boss_diff)
	SetTaskTemp(158,boss_diff)
	ApplyRelayShareData("S� li�u ID th� gi�i",0,0,File_name,"CallBackBossNumSet")
end
function CallBackBossNumSet(szKey, nKey1, nKey2, nCount)			--boss�������ûص�
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	local boss_diff = GetTaskTemp(158)
	local boss_num = {}
	for i = 1,10 do
		if i == boss_diff then
			boss_num[i] = 1
		else
			boss_num[i] = 0
		end
	end
	AddRelayShareData("S� li�u ID th� gi�i",0,0,File_name,"end_dialog",0,1,"dddddddddd",boss_num[1],boss_num[2],boss_num[3],boss_num[4],boss_num[5],boss_num[6],boss_num[7],boss_num[8],boss_num[9],boss_num[10])
	boss_crt_finish(boss_diff,0)
end
--*******************************Ұ��boss�����ж�*******************************
function WrdDataGetReturn_1(boss_crt_num)
	local boss_diff = GetTaskTemp(164)
	if boss_crt_num >= boss_list[boss_diff][5] then
		Talk(1,"end_dialog",boss_list[boss_diff][1].."c� ch�t nghi ng�, ng�y mai h�y quay l�i!")
		return
	else
		boss_crt_finish(boss_diff,boss_crt_num)
	end
end
--****************************�ٻ�bossִ�к���**********************************
function boss_crt_finish(boss_diff,boss_crt_num)
	if GetFightState() == 0 then
		Talk(1,"end_dialog","N�i ��y kh�ng ���c s� d�ng v�t ph�m n�y!")
		return
	end
	local MapID,Att_X,Att_Y = GetWorldPos()
	if MapID > 700 then
		Talk(1,"end_dialog","N�i ��y kh�ng ���c s� d�ng v�t ph�m n�y!")
		return
	end
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog"," � tr�ng th�i so t�i kh�ng cho ph�p d�ng v�t ph�m n�y!")
		return
	end
	if city_map_chk() == 1 then
		return
	end
	if DelItem(2,1,boss_list[boss_diff][3],1) ~= 1 then
		Talk(1,"end_dialog","Xin x�c nh�n tr�n ng��i c� <color=red>"..boss_list[boss_diff][4].."<color>!")
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	local npc_index = CreateNpc(boss_list[boss_diff][1],boss_list[boss_diff][2],map_ID,att_X,att_Y,-1,1,1,0)
	if boss_list[boss_diff][1] ~= "" then
		SetNpcScript(npc_index,boss_list[boss_diff][6])
	end
	Zgc_pub_setwrdtask(boss_diff,(boss_crt_num + 1),2)
end
--*************************boss�������ӻص��������գ�******************************
function WrdDataSetReturn_2()
end
--2008-05-14���ӳ��е�ͼ����ʹ��
Tb_city_map_id = {100,150,200,300,350,400,500}
function city_map_chk()
	local map_id = GetWorldPos()
	for i = 1,getn(Tb_city_map_id) do
		if map_id == Tb_city_map_id[i] then
			Talk(1,"","<color=green>Nh�c nh�<color>: kh�ng th� d�ng v�t n�y trong th�nh!")
			return 1
		end
	end
	return 0
end

