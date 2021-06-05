---------------------------------------------------------
--�峤˵�������ŷ��¶��н���İ취
--���ܽ��������ֻ�����Ķ��ѡ�--2006-12-04
---------------------------------------------------------
--�������ƣ��ִη��غ���
--��       �ܣ����ص�ǰ���ִ�
function zgc_pub_day_turn(day_num)
	if day_num == nil then day_num = 1 end
	if day_num <= 0 then day_num = 1 end
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400 * day_num))
	return time_return
end
--�������ƣ����ڷ��غ���
--�������ܣ����ص�ǰ�����ڣ��죩
function zgc_pub_date_num()
	return tonumber(date("%Y%m%d"))
end
--�������ƣ���Ʒ��Ӽ�麯��
--��        �ܣ��Ե�ǰ��ҿɷ����������Ʒ���м�� 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"end_dialog","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
			Talk (1,"end_dialog","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
			return 0
		else 
			return 1
		end
end
--���ܺ��������ְ�λ����
--��        �ܣ������ְ�λ����,λ�ü��㣺......3<--2<--1<--
function Zgc_pub_num_apart(num,num_att)
	local num_return = 0
	local num_att = strlen(tostring(num)) - num_att + 1
	if num_att <= 0 or strlen(tostring(num)) < num_att then
		return 10
	else
		return tonumber(strsub(tostring(num),num_att,num_att))
	end
end
--�������ƣ����ִ����� 
--��       �ܣ��������ֺ��ַ�����ת����ĳλ���ִ�ĸ���ݵİ���,λ�ü��㣺--> 1-->2-->3........
function Zgc_pub_num_peel(num,num_att)
	local num_return = 0
	local str_num = tostring(num)
	if num_att <= 0 or strlen(str_num) < num_att then
		return "erro"
	else
		if num_att ~= 1 and num_att ~= strlen(str_num) then
			num_return = strsub(str_num,1,num_att - 1)..strsub(str_num,num_att +1,strlen(str_num))
		elseif num_att == 1 then
			num_return = strsub(str_num,2,strlen(str_num))
		elseif num_att == strlen(str_num) then
			num_return = strsub(str_num,1,(strlen(str_num)-1))
		end
	end
	return tonumber(num_return)
end
--ʱ�䴦������1��
function Zgc_pub_time_sec_change(sec_num,flag)
	--flag = 1 ��ʾ������Сʱ�����Ӻ���
	--flag = 0 ��ʾ��ֻ���ط��Ӻ���
	if sec_num <= 0 or (flag ~=0 and flag ~= 1) then
		return 0
	end
	local num_h = 0
	local num_m = 0
	local num_s = 0
	if flag == 0 then
		if sec_num > 3600 then
			num_h = floor(sec_num/3600)
			sec_num = sec_num - (num_h *3600)
		end
		if sec_num > 60 then
			num_m = floor(sec_num/60)
			sec_num = sec_num - (num_m * 60)
		end
		num_s = sec_num
	elseif flag == 1 then
		if sec_num > 60 then
			num_m = floor(sec_num/60)
			sec_num = sec_num - (num_m * 60)
		end
		num_s = sec_num
	end
	local dialog_rtn = ""
	if num_h ~= 0 then
		dialog_rtn = dialog_rtn..num_h.."h "
	end
	if num_m ~= 0 then
		dialog_rtn = dialog_rtn..num_m.." ph�t "
	end
	if num_s ~= 0 then
		dialog_rtn = dialog_rtn..num_s.." Gi�y "
	end
	return dialog_rtn
end
--�������ƣ��ܼ����㺯��
--��        �ܣ����ؽ��������ڼ�
function Zgc_pub_week_day()
	local num_return = 0
	num_return = floor((GetTime() - 57600)/86400)
	num_return = num_return - (floor(num_return/7) * 7)
	if num_return >= 2 then
		num_return = num_return - 2
	else
		num_return = num_return + 5
	end
	return num_return
end
--�������ƣ����������㺯��
--�������ܣ������ܵ�����
function Zgc_pub_week_seq()
	return floor((zgc_pub_day_turn(1) - 2)/7)
end

--�������ƣ�NPC����ֵ�趨
--��        �ܣ�ֱ���趨NPC����λ�õ�ֵ
function SetUnitCurStates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end
--�������ƣ�����������
--��        �ܣ��ж�Ϊ��������Ů��
function Zgc_pub_sex_name()
	local sex_name = ""
	if GetSex() == 1 then
		sex_name = "Thi�u hi�p"
	else
		sex_name = "N� hi�p "
	end
	return sex_name
end
--�������ƣ���ȼ��ж�
--��        �ܣ��ж���ҵȼ��Ƿ�ﵽ11��
function Zgc_pub_action_level_chk()
	local npc_name = GetNpcName(GetTaskTemp(164))
	if npc_name == "" then
		npc_name = "nh�c nh�"
	end
	if GetLevel() < 11 then
		Talk(1,"end_dialog","<color=green>"..npc_name.."<color>: "..Zgc_pub_sex_name().."c�n r�n luy�n th�m m�t th�i gian!")
		SetTaskTemp(164,0)
		return 0
	else
		SetTaskTemp(164,0)
		return 1
	end
end
--�������ƣ���ͼ���Ʒ��غ���
--��        �ܣ��ѵ�ͼID�͵�ͼ���ƽ����໥ת��
function Zgc_pub_mapID_name_change(data_in,change_flag)
	--change_flagΪ1��ʱ��ID->����
	--change_flagΪ2��ʱ������->ID
	local find_flag = 0
	for i = 1,getn(Zgc_pub_table_map_name) do
		if Zgc_pub_table_map_name[i][change_flag] == data_in then
			if change_flag == 1 then
				return Zgc_pub_table_map_name[i][2]
			elseif change_flag == 2 then
				return Zgc_pub_table_map_name[i][1]
			end
			find_flag = 1
			break
		end
	end
	if find_flag == 0 then
		return 0 
	end
end
--�������ƣ���ͼ���Ʒ��غ���
--��        �ܣ��ѵ�ͼID�͵�ͼ���ƽ����໥ת��
function Zgc_pub_money_name_change(money)
	if money == 0 then
		return "0 l��ng"
	end
	local money_gold = floor(money/10000)
	local money_silver = floor((money-(money_gold*10000))/100)
	local money_copper = floor(money-(money_gold*10000)-(money_silver*100))
	local money_name = ""
	if money_gold ~= 0 then
		money_name = money_gold.." Kim "
	end
	if money_silver ~= 0 then
		money_name = money_name..money_silver.." b�c "
	end
	if money_copper ~= 0 then
		money_name = money_name..money_copper.." ��ng "
	end
	return money_name
end
--�������ƣ����ص�ǰʱ�䣨������
--��       �ܣ����ص�ǰʱ���ǽ���ĵڶ�����
function Zgc_pub_today_sec_num_rtn()
	local sec_num = (GetTime() - 57600)
	sec_num = sec_num - ((floor(sec_num/86400))*86400)
	return sec_num
end
--�������ƣ����������Ϣ
--��	    �ܣ�������ҵ�ǰ��������Ҫ�ľ���͵�ǰ�ȼ��ɻ�õ�Ǳ�ܵ���
--��        ע��num_diffΪ1ʱ���ؾ��������Ϊ2ʱ����Ǳ�ܵ���
function Zgc_pub_player_uplevel(num_diff)
	local player_uplevel_num = {
	{10,3},{20,3},{40,3},{80,3},{140,3},
	{245,3},{429,3},{643,3},{965,4},{1302,4},
	{1758,4},{2373,4},{3086,4},{3857,4},{4725,4},
	{5670,4},{6662,4},{7661,4},{8695,5},{9782,5},
	{11005,5},{12381,5},{13928,5},{15669,5},{17628,5},
	{19832,5},{22311,5},{25099,5},{28237,6},{32049,6},
	{36375,6},{41286,6},{46860,6},{53186,6},{60366,6},
	{68515,6},{77765,6},{88263,6},{100178,7},{117710,7},
	{138309,7},{162513,7},{190953,7},{224369,7},{263634,7},
	{309770,7},{363980,7},{427676,7},{502519,8},{585435,8},
	{682032,8},{794567,8},{925671,8},{1078406,8},{1256343,8},
	{1463640,8},{1705140,8},{1986489,8},{2314259,9},{2672969,9},
	{3087280,9},{3565808,9},{4118508,9},{4756877,9},{5494193,9},
	{6345793,9},{7329390,9},{8465446,9},{9777590,10},{12710867,10},
	{16524127,10},{21481365,10},{27925775,10},{37699796,10},{50894725,10},
	{68707878,10},{92755636,10},{125220108,10},{169047146,11},{196094689,11},
	{227469839,11},{263865014,11},{306083416,11},{355056762,11},{411865844,11},
	{477764379,11},{554206680,11},{642879749,11},{745740509,12},{857601585,12},
	{986241823,12},{1134178096,12},{1304304811,12},{1499950532,12},{1724943112,12},
	{1950000000,12},{1950000000,12},{1950000000,12},{1950000000,12}
	}
	if num_diff == 1 then
		return player_uplevel_num[GetLevel()][1]
	elseif num_diff == 2 then
		return player_uplevel_num[GetLevel()][2]
	else
		return 0
	end
end
--�������ƣ�NPC������㺯��
--�������ܣ���������뵱ǰNPC��X+Y�ľ���ֵ
function Zgc_pub_npc_distance()
	local npc_index = GetTargetNpc()
	local npc_map_id,npc_att_x,npc_att_y = GetNpcWorldPos(npc_index)
	local player_map_id,player_att_x,player_att_y = GetWorldPos()
	return (abs(npc_att_x - player_att_x) + abs(npc_att_y - player_att_y))
end
--�������ƣ��������get
--��        �ܣ���λȡ�ð������
function Zgc_pub_getconftask(id,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackGetConfTask")
end
function CallBackGetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10)+1)
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	if conf_data[id] == nil then
		conf_data[id] = 0 
	end
	local return_fun = "ConfDataGetReturn_"..fun_id.."("..conf_data[id]..")"
	dostring(return_fun)
end
--�������ƣ��������set
--��        �ܣ���λ���ð������
function Zgc_pub_setconftask(id,value,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(159,value)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackSetConfTask")
end
function CallBackSetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local value = GetTaskTemp(159)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = ""
	suit_id = tostring(floor(id/10) + 1)			--�����λ��
													--ȡֵ]
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	for i = 0, 9 do
		if conf_data[i] == nil then
			conf_data[i] = 0 
		end
	end
	local save_id = (id - (floor(id/10)*10))
	conf_data[save_id] = value
	local rtn_flag = AddRelayShareData(GetTongName(),0,0, File_name, "end_dialog", 0,suit_id, "dddddddddd", conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9])
	local return_fun = "ConfDataSetReturn_"..fun_id.."()"
	dostring(return_fun)
end
--�������ƣ��Ի������ķ�ҳͳһ����
--�������ܣ�������Ҫ����ĶԻ����ԶԻ������Զ���ҳ�Ĵ���
--���������tb_deal:��Ҫ�����table��page_seq:��Ҫ�����ҳ����npp:ÿҳ��������fun_str��ԭ�����ĺ������ƣ�add_dia�����������ĶԻ����������ӱ����˳������˳�/end_dialog������ɶԻ�
function zgc_pub_dialog_page_deal(tb_deal,page_seq,npp,fun_str,add_dia)
	local tb_dia_rtn = {}
	--�жϴ�������Ƿ���ȷ
	if getn(tb_deal) <= ((page_seq-1) * npp) or page_seq < 1 then
		tb_dia_rtn = {"err"}
	else
		--��ʼ����
		local num_this_page = (getn(tb_deal) - ((page_seq-1) * npp))
		local next_page_flag = 0
		--�жϱ�ҳ��ʾ�Ĵ���
		if num_this_page > npp then
			num_this_page = npp
			next_page_flag = 1
		end
		--�ж��Ƿ���Ҫ��һҳ
		--if (num_this_page) > (2 * npp) then
		--	next_page_flag = 1
		--end
		--д�롱��һҳ��
		if page_seq > 1 then
			tinsert(tb_dia_rtn,"Trang tr��c/#"..fun_str.."("..(page_seq-1)..")")
		end
		--д������
		for i = 1,num_this_page do
			tinsert(tb_dia_rtn,tb_deal[((page_seq-1) * npp)+i])
		end
		--д�롱��һҳ��
		if next_page_flag == 1 then
			tinsert(tb_dia_rtn,"Trang k�/#"..fun_str.."("..(page_seq+1)..")")
		end
		if add_dia ~= "" then
			tinsert(tb_dia_rtn,add_dia)
		end
	end
	return tb_dia_rtn
end
--�������ƣ�table�ķ��ظ������ѡ��
--�������ܣ��Դ����table���ƶ��ĸ������з��ظ������ѡȡ
function zgc_pub_table_sel_norepeat(table_name,sel_num)
	table_length = getn(table_name)
	local table_temp = zgc_pub_table_copy(table_name)
	local table_return = {}
	if  not(table_length < sel_num) then
		--��ʼ��ʽ����
		for i = table_length ,(table_length - sel_num + 1), -1 do
			local insert_seq = random(1,i)
			tinsert(table_return,table_temp[insert_seq])
			table_temp[insert_seq] = table_temp[i]
		end
	end
	return table_return
end
--�������ƣ�table���ƺ���
--�������ܣ�����һ���µ�һ����table���������table��copy
function zgc_pub_table_copy(table_name)
	local table_rtn = {}
	for i = 1,getn(table_name) do
		tinsert(table_rtn,table_name[i])
	end
	return table_rtn
end
--�������ƣ���Ӽ�⺯��
--�������ܣ���⴫���player_index�Ƿ�͵�ǰ��PlayerIdex��ͬһ��������
function zgc_pub_same_team_chk(player_index)
	local team_member_num = GetTeamSize()
	local chk_flag = 0
	if team_member_num ~= 0 then
		for i = 1, team_member_num do
			if GetTeamMember(i) == player_index then
				chk_flag = 1
			end
		end
	end	
	return chk_flag
end
--�������ƣ�������ƹ��˺���
--�������ܣ��滻��������еķǷ��ַ�
function zgc_pub_name_replace(str,pattern,s)
	local startS,endS = strfind(str,pattern)
	while(startS) do
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern)
	end
	return str
end
--�������ƣ��Ի��պ���
--��        �ܣ��Ի��պ�������ݽ���
function end_dialog()

end
--==================================================================��������Ժ���=======================================================================
--����ʹ��ʱ���ж�
function Xmas_goods_use_date_chk()
	if zgc_pub_day_turn(1) < Xmas_start_day or zgc_pub_day_turn(1) > Xmas_end_day then
		Talk(1,"end_dialog","    V�t ph�m n�y ch� c� th� s� d�ng v�o ho�t ��ng Gi�ng sinh.")
		return 0
	end
	return 1
end
--����ʥ���������ж�
function Xmas_tree_name_chk(Xmas_tree_index)
	local name_len = strlen(GetName())
	local Xmas_tree_name = strsub(GetNpcName(Xmas_tree_index),1,name_len)
	if GetName() == Xmas_tree_name and strlen(GetName()) == GetUnitCurStates(Xmas_tree_index,8) then
		return 1
	end
	return 0
end
--���ʥ���������ж�
function Conf_Xmas_tree_name_chk(conf_Xmas_tree_index)
	local name_long = strlen(GetTongName())
	local conf_Xmas_tree_name = strsub(GetNpcName(conf_Xmas_tree_index),1,name_long)
	if GetTongName() == conf_Xmas_tree_name and strlen(GetTongName()) == GetUnitCurStates(conf_Xmas_tree_index,8) then
		return 1
	end
	return 0
end
--�Ƿ�����������ж�
function Xmas_tree_create_time_con()
	local old_time = GetTask(962)
	local old_index = GetTask(963)
	if old_time == 0 or old_index == 0 then
		return 1
	elseif (GetTime() - old_time) > 900 then
		return 1
	end
	return 0
end
--****************************���ڻ*****************************
function spring_2007_date_chk()
	local date_seq = zgc_pub_day_turn(1)
	if date_seq < 13552 or date_seq > 13569 then
		return 0
	else
		return 1
	end
end
--****************************�������Ӻ���*************************
function spring2007_spring_goods_add()
	local add_odds_coat = 25
	local add_flag = AddItem(0,105,33,1,1,-1,-1,-1,-1,-1,-1)
	if add_flag == 1 then
	Msg2Player("Ch�c m�ng b�n �� nh�n ���c th� c��i: Ni�n Th�!")
	end
	if random(1,100) >= add_odds_coat then
		local TaskID_spring2007_cap = 973
		local TaskID_spring2007_coat = 974
		local TaskID_spring2007_trou = 975
		local coat_id_list = {
		{{"Thu Thi qu�n",0,108,195},{"��ng H�n m�o",0,108,196},{"H� Vinh k�t",0,108,197},{"Xu�n No�n tr�m",0,108,198}},
		{{"Thu Thi b�o",0,109,255},{"��ng H�n gi�p",0,109,256},{"H� Vinh trang",0,109,257},{"Xu�n No�n th��ng",0,109,258}},
		{{"Thu Thi ngoa",0,110,85},{"��ng H�n ngoa",0,110,86},{"H� Vinh qu�n",0,110,87},{"Xu�n No�n qu�n",0,110,88}},	
		}
		local not_get = {}
		local not_get_num = 1
		for i = TaskID_spring2007_cap,TaskID_spring2007_trou do
			if GetTask(i) ~= 1 then
				not_get[not_get_num] = i
				not_get_num = not_get_num + 1
			end
		end
		if getn(not_get) <= 0 then
			return
		else
			local coat_seq = random(1,getn(not_get))
			coat_seq = not_get[coat_seq]
			local player_body = GetBody()
			local add_flag = AddItem(coat_id_list[coat_seq - 972][player_body][2],coat_id_list[coat_seq - 972][player_body][3],coat_id_list[coat_seq - 972][player_body][4],1)
			if add_flag == 1 then
				Msg2Player("Ch�c m�ng b�n �� nh�n ���c 1:"..coat_id_list[coat_seq - 972][player_body][1].."!")
			end
			SetTask(coat_seq,1)
		end
	end
	return
end
--*******************************2007�������ڻ************************
function tomb_sweep_2007_date_chk()
	local date_save = zgc_pub_day_turn(1)
	if date_save >= 13601 and date_save <= 13610 then
		return 1
	elseif date_save < 13601 then
		return -1
	else
		return 0
	end
end
--*****************************2007����һ�ʱ��*************************
function labor_day_2007_date_chk()
	local date_seq = zgc_pub_day_turn(1)
	if date_seq < 13628 then
		return -1
	elseif date_seq >= 13628 and date_seq <=13642 then
		return 0
	else
		return 1
	end
end
--*****************************��һ�ʦ������ʱ��*************************
function labor_2007_teach_date_chk()
	local date_seq = zgc_pub_day_turn(1)
	if date_seq < 13628 then
		return -1
	elseif date_seq >= 13628 and date_seq <=13649 then
		return 0
	else
		return 1
	end
end
--******************************���������******************************

--***************************��һ�ʦ����������Ի�**********************
TaskID_up_book_week_seq = 1202
TaskID_up_book_diff = 1245
TaskID_up_book_num = 1246
TaskID_Temp_book_diff = 173
Tb_teacher_name = {"<color=green>Huy�n T�<color>:","<color=green>T� H�c Ch�n Nh�n<color>:","<color=green>Ch�n Nh� S� Th�i<color>:","<color=green>Long T�i Thi�n<color>:","<color=green>���ng S� H�ng<color>:","<color=green>Xa Th�i Qu�n<color>:","<color=green>B�ch Doanh Doanh<color>:",}
Tb_teacher_name[0] = "<color=green>��c s� V� L�m<color>:"
Tb_book = {	{75,"Th�c chi�n t�m ��c",1101,20},
			{10,"Quan chi�n t�m ��c",1102,40},
			{10,"Th�c chi�n kinh nghi�m t�p",1103,6},
			}
Sever_diff_lilian = 2
function labor_07_dia_main(sver_flag)
	do
		Say(Tb_teacher_name[GetPlayerFaction()].."Ho�t ��ng S� m�n r�n luy�n hi�n ch�a b�t ��u!",
		1,
		"K�t th�c ��i tho�i/end_dialog"
		);
		return
	end
	Sever_diff_lilian = sver_flag
	if GetPlayerFaction() ~= 0 then
		Say(Tb_teacher_name[GetPlayerFaction()].."Ng��i �� h�c v� ngh� nhi�u n�m r�i, b�y gi� ��ng ng�i h� s�n t�m ng��i kh�c �� tu luy�n v� h�c, ho�c t� th� v� c�ng v�i ng��i kh�c. X�a nay �� h�c ���c nhi�u r�i, n�u trong tay ng��i v�n c�n '<color=yellow>Quan Chi�n T�m ��c<color>', th� c� th� ��n ch� ta �� ��i ph�n th��ng.",
		6,
		--"��Ҫ�Ͻ���ʵս�ĵá�/#book_hand_in(1)",
		"Ta ph�i n�p'Quan Chi�n T�m ��c'/#book_hand_in(2)",
		"Ta ph�i n�p 'Th�c chi�n kinh nghi�m t�p'/#book_hand_in(3)",
		"L�m sao �� nh�n ���c Th�c chi�n t�m ��c v� Quan chi�n t�m ��c/how_2_get_book",
		"T�c d�ng c�a Th�c chi�n kinh nghi�m t�p/fight_exp_book_inf",
		"C� th� nh�n ���c nh�ng ph�n th��ng /what_prize",
		"Ta ch� ��n xem th�/end_dialog"
		)
		return
	else
		Say(Tb_teacher_name[GetPlayerFaction()].."Ng��i tuy v� m�n v� ph�i, nh�ng c�ng l� nh�n s� giang h�, b�y gi� ng��i ��ng ng�i tu luy�n v� c�ng ho�c t� th� v� ngh� v�i ng��i kh�c. X�a nay �� h�c ���c nhi�u r�i, n�u trong tay ng��i v�n c�n '<color=yellow>Quan Chi�n T�m ��c<color>', th� c� th� ��n ch� ta �� ��i ph�n th��ng.",
		6,
		"Ta ph�i n�p'Quan Chi�n T�m ��c'/#book_hand_in(2)",
		"Ta ph�i n�p 'Th�c chi�n kinh nghi�m t�p'/#book_hand_in(3)",
		"L�m sao �� nh�n ���c Th�c chi�n t�m ��c v� Quan chi�n t�m ��c/how_2_get_book",
		"T�c d�ng c�a Th�c chi�n kinh nghi�m t�p/fight_exp_book_inf",
		"C� th� nh�n ���c nh�ng ph�n th��ng /what_prize",
		"Ta ch� ��n xem th�/end_dialog"
		)
	end
end
--*************************�Ͻ��ĵ�*********************
function book_hand_in(book_diff)
	local player_level = GetLevel()
	--�ȼ��ж�
	if player_level < Tb_book[book_diff][1] then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."<color=yellow>"..Tb_book[book_diff][1].."<color>�� t� tr�n c�p<color=yellow>"..Tb_book[book_diff][2].."<color> m�i c� th� giao n�p!")
		return
	end
	--�����Ƿ��Ѿ��������ĵ�
	local book_uped_diff = GetTask(TaskID_up_book_diff)
	if GetTask(TaskID_up_book_week_seq) == Zgc_pub_week_seq() and (book_uped_diff ~= 0 and book_uped_diff ~= nil)then
		if GetTask(TaskID_up_book_num) >= Tb_book[book_uped_diff][4] then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."Ng��i �� �� b�n l�nh h�y t� m�nh r�n luy�n th�m, kh�ng c�n ��a nh�ng th� �� cho ta n�a")
			return
		end
		if book_diff ~= book_uped_diff then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."Tu�n n�y ng��i �� n�p <color=yellow>"..Tb_book[book_uped_diff][2].."<color>, kh�ng th� n�p n�a.")
			return
		end
	end
	--�����Ͻ��ı���
	local book_num_get = GetItemCount(2,1,Tb_book[book_diff][3])
	if book_num_get <= 0 then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H�y mau ho�n th�nh nhi�m v�, ng��i ch�a c� <color=yellow>"..Tb_book[book_diff][2].."<color>!")
		return
	end
	local book_num_need = Tb_book[book_diff][4]
	if GetTask(TaskID_up_book_week_seq) == Zgc_pub_week_seq() then
		book_num_need = book_num_need - GetTask(TaskID_up_book_num)
	end
	local book_num_up = min(book_num_need,book_num_get)
	SetTaskTemp(TaskID_Temp_book_diff,book_diff)
	AskClientForNumber("prize_get",1,book_num_up,"Xin nh�p th� b�n mu�n n�p"..Tb_book[book_diff][2].."!")
end
--**************************��������************************
function prize_get(book_num)
	local book_diff = GetTaskTemp(TaskID_Temp_book_diff)
	if book_diff == 0 or book_diff == nil then
		return
	end
	SetTaskTemp(TaskID_Temp_book_diff,0)
	if Sever_diff_lilian ~= 2 then
		local golden_exp_num = GetGoldenExp()
		if golden_exp_num == 0 then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."Hi�n <color=yellow>kinh nghi�m s�c kh�e<color> l� <color=red>0<color>, kh�ng chuy�n ���c!")
			return
		end
	end
	--Я�����
	if GetItemCount(2,1,Tb_book[book_diff][3]) < book_num then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H�y mau ho�n th�nh nhi�m v�, ng��i ch�a c� <color=yellow>"..Tb_book[book_diff][2].."<color>!")
		return
	end
	--��������
	local player_level = GetLevel()
	local chg_num = floor((player_level * player_level * player_level * player_level) * 0.1953125 * book_num/Tb_book[book_diff][4])
	if Sever_diff_lilian == 2 then				--IB������
		--ɾ�����
		if DelItem(2,1,Tb_book[book_diff][3],book_num) ~= 1 then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H�y mau ho�n th�nh nhi�m v�, ng��i ch�a c� <color=yellow>"..Tb_book[book_diff][2].."<color>!")
			return
		end
		chg_num = floor((player_level * player_level * player_level * player_level) * book_num /(20 * Tb_book[book_diff][4]))
		ModifyExp(chg_num)
		Msg2Player("Ch�c m�ng b�n nh�n ���c "..chg_num.." �i�m kinh nghi�m!")
	else								--�շѷ�����
		local golden_exp_num = GetGoldenExp()
		if chg_num > golden_exp_num then
			Say(Tb_teacher_name[GetPlayerFaction()].."C�n c� ��ng c�p hi�n t�i c�a b�n, b�n c� th� ��i <color=yellow>"..chg_num.."<color> �i�m s�c kh�e th�nh �i�m kinh nghi�m nh�ng �i�m s�c kh�e c�a b�n kh�ng ��, b�n x�c nh�n mu�n ��i?",
			2,
			"Ta x�c nh�n/#chg_dtm("..golden_exp_num..","..book_diff..","..book_num..")",
			"�� ta suy ngh� l�i/end_dialog")
			return
		end
		--ɾ�����
		if DelItem(2,1,Tb_book[book_diff][3],book_num) ~= 1 then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H�y mau ho�n th�nh nhi�m v�, ng��i ch�a c� <color=yellow>"..Tb_book[book_diff][2].."<color>!")
			return
		end
		ModifyGoldenExp(-chg_num)
		ModifyExp(chg_num)
		Msg2Player("Ch�c m�ng b�n chuy�n"..chg_num.."�i�m s�c kh�e th�nh �i�m kinh nghi�m!")
	end
	--��ɺ�Ĵ���
	finish_deal(book_diff,book_num)
end
function chg_dtm(golden_exp_num,book_diff,book_num)
	if DelItem(2,1,Tb_book[book_diff][3],book_num) ~= 1 then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H�y mau ho�n th�nh nhi�m v�, ng��i ch�a c� <color=yellow>"..Tb_book[book_diff][2].."<color>!")
		return
	end
	ModifyGoldenExp(-golden_exp_num)
	ModifyExp(golden_exp_num)
	Msg2Player("Ch�c m�ng b�n chuy�n"..golden_exp_num.."�i�m s�c kh�e th�nh �i�m kinh nghi�m!")
	finish_deal(book_diff,book_num)
end
--*************************��ɺ�Ĵ���*****************
function finish_deal(book_diff,book_num)
	local week_save = GetTask(TaskID_up_book_week_seq)
	local week_now = Zgc_pub_week_seq()
	local book_uped_num = GetTask(TaskID_up_book_num)
	if week_save >= week_now then
		SetTask(TaskID_up_book_num,(book_uped_num+book_num))
		SetTask(TaskID_up_book_diff,book_diff)			--���ﱣ���Ͻ���������Ϊ�˱��������Ѿ���������ҳ������ݴ���
	else
		SetTask(TaskID_up_book_week_seq,week_now)
		SetTask(TaskID_up_book_num,book_num)
		SetTask(TaskID_up_book_diff,book_diff)
		book_uped_num = 0
	end
	local num_remain = (Tb_book[book_diff][4]-(book_uped_num+book_num))
	if num_remain ~= 0 then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."L�n n�y ng��i �� n�p <color=yellow>"..book_num.."<color> quy�n <color=yellow>"..Tb_book[book_diff][2].."<color>, tu�n n�y ng��i c� th� n�p <color=yellow>"..num_remain.."<color> quy�n!")
	else
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."L�n n�y ng��i �� n�p <color=yellow>"..book_num.."<color> quy�n <color=yellow>"..Tb_book[book_diff][2].."<color>, tu�n n�y ng��i kh�ng th� n�p n�a!")
	end
end
--*************************�����б�*********************
function what_prize()
	if Sever_diff_lilian == 2 then				--IB������
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."Ho�n th�nh nhi�m v� <color=yellow>Th� luy�n s� m�n<color> ng��i c� th� ��n ch� ta nh�n ph�n th��ng �i�m kinh nghi�m")
	else	
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].." Ho�n th�nh nhi�m v� <color=yellow>Th� luy�n s� m�n<color> ng��i c� th� ��n ch� ta nh�n ph�n th��ng �i�m s�c kh�e chuy�n sang �i�m kinh nghi�m")
	end
end
--*************************��λ����*******************
function how_2_get_book()
	Talk(2,"",	Tb_teacher_name[GetPlayerFaction()].."Tham gia t� v� ��i h�i s� c� c� h�i nh�n ���c '<color=yellow>Th�c Chi�n T�m ��c<color>'. B�y gi� kh�ng th� nh�n '<color=yellow>Quan Chi�n T�m ��c<color>', n�u c�n Quan Chi�n T�m ��c, th� c� th� ��n ch� ta �� ��i ph�n th��ng. Th�c Chi�n T�m ��c c� th� nh�n chu�t ph�i �� s� d�ng.",
				Tb_teacher_name[GetPlayerFaction()].."N�n nh� ph�i giao ��u tr��c <color=red>24h th� 7 m�i tu�n<color>"
	)
end
--**********************ʵս�ĵü�������******************
function fight_exp_book_inf()
	Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."N�u kh�ng c� th�i gian c� th� ��n Ng� c�c mua <color=yellow>Th�c Chi�n Kinh Nghi�m T�p<color> c�a c�c b�c ti�n b�i, xem xong ��a ta c�ng ���c. Nh�ng <color=yellow>Th�c Chi�n Kinh Nghi�m T�p<color> ch� c� th� l�nh m�i tu�n do ng��i ch�a n�p <color=yellow>Th�c Chi�n T�m ��c<color> v� <color=yellow>Quan Chi�n T�m ��c<color> ph�n th��ng s�t l�i kh�ng th� nh�n ngo�i ��nh m�c. N�u mu�n nh�n ph�n th��ng tu�n n�y, <color=yellow>Th�c Chi�n Kinh Nghi�m T�p<color> c�ng ph�i n�p tr��c <color=red>24 gi� Th� 7<color>.")
end 
--====================================2007��������=============================
--*********************�Ƿ��ǻ�ڼ�*********************
function dragon_boat_date_chk()
	--if zgc_pub_day_turn(1) >= 13681 then
		return 1
	--else
	--	return 0
	--end
end
-- append by lizhi
-- �������
function distance_between_points(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
		local dx = MapX2 - MapX1
		local dy = MapY2 - MapY1
		local nDist = (dx * dx + dy * dy)^(1/2)
		return nDist
	end
end

function mp_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Msg2Player("H�nh trang c�a b�n kh�ng �� ch� tr�ng!")					-- һ��Ҫ��Msg2Player
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
		Msg2Player("S�c l�c c�a b�n kh�ng ��, h�y thu x�p l�i �i.")
		return 0
	else
		return 1
	end
end
