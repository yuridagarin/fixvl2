--�ļ����������þ�������
--���������������õ�����������ؽ�����
--�����д�ˣ��峤
--�����дʱ�䣺2007-01-28
--�޸ļ�¼��С���򲹶�
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
--=============================��������������=================================
goods_and_prize_list = {
	--id-----------------------����---------------ʦ����������--����1-4����/����----ת��������������--�������鱶��--����--˵��
	{601,"��ʿ֤��","","",5,15,25,50,10,1600000,1.5,40,"Ϊ�������ռ� �����Ҫ5�š�ɱ�ֲر�ͼ1����̫�������-Ǭ������������ ��1��\n<color=yellow>����̶�����<color>���õ� [����x����x����x1.5] �㾭�顣\n<color=yellow>�����������1<color>���õ� [����x����x����x1.5] �㾭�� 50%����\n<color=yellow>�����������2<color>������10�� 25%����\n<color=yellow>�����������3<color>������40�� 10%����\n<color=yellow>�����������4<color>�����ʦ���ؼ�1�� 10%����\n<color=yellow>�����������5<color>��������������1�� 5%����"},
	{600,"��ʿ֤��","","",4,12,30,50,8,1200000,1.2,30,"Ϊ�������ռ� �ߴ����ɵ�ʦ�����Ƹ�1�������߾�ľ/ɽʨ��Ƥ/���پ�ʯ/������� ��10�ݡ�\n<color=yellow>����̶�����<color>���õ� [����x����x����x1.2] �㾭�顣\n<color=yellow>�����������1<color>���õ� [����x����x����x1.2] �㾭��		50%����\n<color=yellow>�����������2<color>������8��					20%����\n<color=yellow>�����������3<color>������30��					18%����\n<color=yellow>�����������4<color>�����ʦ���ؼ�1��			8%����\n<color=yellow>�����������5<color>��������������1��			4%����"},
	{599,"����֤��","","",3,8,30,50,5,1000000,1,20,"Ϊ�������ռ� ���˿/ɽʨ֮Ƥ/����/������ ���� ����ʯ/����ľ/����/������ ��222��\n<color=yellow>����̶�����<color>���õ� [����x����x����] �㾭�顣\n<color=yellow>�����������1<color>���õ� [����x����x����] �㾭��		50%����\n<color=yellow>�����������2<color>������5��					20%����\n<color=yellow>�����������3<color>������20��					22%����\n<color=yellow>�����������4<color>�����ʦ���ؼ�1��			5%����\n<color=yellow>�����������5<color>��������������1��			3%����"},
	{598,"���֤��","","",2,5,30,50,3,800000,0.8,10,"Ϊ�������ռ� ���˿/�������/��ɽ�� ���� ����ľ/������/����ʯ ��222��\n<color=yellow>����̶�����<color>���õ� [����x����x����x0.8] �㾭�顣\n<color=yellow>�����������1<color>���õ� [����x����x����x0.8] �㾭��		50%����\n<color=yellow>�����������2<color>������3��					20%����\n<color=yellow>�����������3<color>������10��					25%����\n<color=yellow>�����������4<color>�����ʦ���ؼ�1��			3%����\n<color=yellow>�����������5<color>��������������1��			2%����"},
	{597,"��Ա֤��","","",1,3,33,50,2,500000,0.5,5,"Ϊ�������ռ� ����˿/��Ƥ/���� ���� ����/��ľ/�Ӿ��� ��222��\n<color=yellow>����̶�����<color>���õ� [����x����x����x0.5] �㾭�顣\n<color=yellow>�����������1<color>���õ� [����x����x����x0.5] �㾭��		50%����\n<color=yellow>�����������2<color>������2��					17%����\n<color=yellow>�����������3<color>������5��					30%����\n<color=yellow>�����������4<color>�����ʦ���ؼ�1��			2%����\n<color=yellow>�����������5<color>��������������1��			1%����"},
}
token_list ={205,206,207,208,209,350,390}	
--==============================�ű����߼���================================
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	local goods_types = {
		{},
		{},
		{"���˿��ɽʨ֮Ƥ�����㡢������ ��222��","����ʯ������ľ�����㡢������ ��222��"},
		{"���˿�������������ɽ�� ��222��","����ʯ������ľ�������� ��222��"},
		{"����˿����Ƥ������ ��222��","��������ľ���Ӿ��� ��222��"}
	}
	for i = 1,getn(goods_and_prize_list) do
		if goods_id == goods_and_prize_list[i][1] then
			goods_diff = i
		end
	end
	if goods_diff == 1 then
		Say("��<color=red>"..goods_and_prize_list[goods_diff][2].."<color>��:"..goods_and_prize_list[goods_diff][13],
		3,
		"��Ҫ�Ķ����Ѿ��ռ�����/#goods_need_chk("..goods_diff..",1)",
		"���뿴����Ҫ�ľ�Ҫ�б�/book_need_jue",
		"����ȥ׼��һ��/end_dialog")		
	elseif goods_diff == 2 then  
		Say("��<color=red>"..goods_and_prize_list[goods_diff][2].."<color>��:"..goods_and_prize_list[goods_diff][13],
		2,
		"��Ҫ�Ķ����Ѿ��ռ�����/#goods_need_chk("..goods_diff..",1)",
		"����ȥ׼��һ��/end_dialog")
	else
		Say("��<color=red>"..goods_and_prize_list[goods_diff][2].."<color>��:"..goods_and_prize_list[goods_diff][13],
		3,
		"���Ѿ�׼����"..goods_types[goods_diff][1].."/#goods_need_chk("..goods_diff..",1)",
		"���Ѿ�׼����"..goods_types[goods_diff][2].."/#goods_need_chk("..goods_diff..",2)",
		"����ȥ׼��һ��/end_dialog")		
	end
end
--*****************************������Ʒ���������*****************************
function goods_need_chk(goods_diff,goods_type)
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local jifenLV = jifen2level(jifen)
	if jifenLV < (getn(goods_and_prize_list)+2-goods_diff) then 
		Say("��Ŀƿ��ƺŻ�û�дﵽ<color=yellow>"..tTitle[(getn(goods_and_prize_list)+2-goods_diff)][3].."<color>������ʹ�ø�֤�飡",0)
		return
	end
	if Zgc_pub_goods_add_chk(5,20) ~= 1 then		--�ռ�/�����ж�
		Talk(1,"","��ȷ�����ı������㹻�ĸ��غͿռ䣡")
		return
	end

	if task_metiral_deal(goods_diff,1,goods_type) ~= 1 then		--��Ʒ�������
		return
	end
	if DelItem(2,0,goods_and_prize_list[goods_diff][1],1) ~= 1 then  --ɾ��֤��
		Talk(1,"","��ȷ������������Ӧ��֤�飡")
		return
	end
	if task_metiral_deal(goods_diff,2,goods_type) ~= 1 then		--��Ʒɾ��
		return
	end
	 
	local palyer_level = GetLevel()
	local exp_num = floor((palyer_level*palyer_level*palyer_level)*goods_and_prize_list[goods_diff][11])
		ModifyExp(exp_num)
		Msg2Player("��ϲ������"..exp_num.."�㾭�飡")
	local ran_num = random(1,100)
	if ran_num <= goods_and_prize_list[goods_diff][5] then
		ran_prize(goods_diff,1)
	elseif ran_num <= goods_and_prize_list[goods_diff][6] then
		ran_prize(goods_diff,2)
	elseif ran_num <= goods_and_prize_list[goods_diff][7] then
		ran_prize(goods_diff,3)
	elseif ran_num <= goods_and_prize_list[goods_diff][8] then
		ran_prize(goods_diff,4)
	else
		ran_prize(goods_diff,5)
	end
end
--*******************************������ϼ��********************************
function task_metiral_deal(task_diff,deal_flag,goods_type)		--deal_flag:Ϊ1��ʾ��⣬Ϊ2��ʾɾ��
	local task_goods_need_list = {
		{  --��ʿ֤����Ҫ�Ĳ���
			{{2,14,1,1,"ɱ�ֲر�ͼ"},{2,1,469,1,"̫�������-Ǭ"},{2,1,470,1,"̫�������-��"},{2,1,471,1,"̫�������-��"},{2,1,472,1,"̫�������-��"}}
		},
		{  --��ʿ֤����Ҫ�Ĳ���
			{{2,0,205,1,"����ʦ������"},{2,0,206,1,"�䵱ʦ������"},{2,0,207,1,"����ʦ������"},{2,0,208,1,"ؤ��ʦ������"},{2,0,209,1,"����ʦ������"},{2,0,350,1,"����ʦ������"},{2,0,390,1,"�嶾ʦ������"},{2,2,67,10,"���߾�ľ"},{2,2,68,10,"ɽʨ��Ƥ"},{2,2,66,10,"���پ�ʯ"},{2,2,69,10,"�������"}},
		},
		{  --����֤����Ҫ�Ĳ���
--			{{2,9,4,200,"���˿"},{2,2,47,200,"ɽʨ֮Ƥ"},{2,2,37,200,"����ʯ"},{2,2,11,200,"����ľ"},{1,2,4,200,"����"},{1,3,16,200,"������"}},
			{{2,9,4,222,"���˿"},{2,2,47,222,"ɽʨ֮Ƥ"},{1,2,4,222,"����"},{1,3,16,222,"������"}},
			{{2,2,11,222,"����ľ"},{2,2,37,222,"����ʯ"},{1,2,4,222,"����"},{1,3,16,222,"������"}},
		},
		{  --���֤����Ҫ�Ĳ���
--			{{2,2,55,99,"���˿"},{2,10,7,99,"�������"},{2,2,36,99,"����ʯ"},{2,2,10,99,"����ľ"},{1,2,11,99,"��ɽ��"},{1,3,15,99,"������"}},
			{{2,2,55,222,"���˿"},{2,10,7,222,"�������"},{1,2,11,222,"��ɽ��"},},
			{{2,2,10,222,"����ľ"},{2,2,36,222,"����ʯ"},{1,3,15,222,"������"}},
		},
		{  --��Ա֤����Ҫ�Ĳ���
--			{{2,2,54,99,"����˿"},{2,2,20,99,"��Ƥ"},{2,2,6,99,"����"},{2,2,9,99,"��ľ"},{1,2,10,99,"����"},{1,3,14,99,"�Ӿ���"}},
			{{2,2,54,222,"����˿"},{2,2,20,222,"��Ƥ"},{1,2,10,222,"����"},},
			{{2,2,9,222,"��ľ"},{2,2,6,222,"����"},{1,3,14,222,"�Ӿ���"}},
		},
	}
	local cangbaotu_num = 0;
	if deal_flag == 1 then							--���
		for i = 1,getn(task_goods_need_list[task_diff][goods_type]) do
			if task_goods_need_list[task_diff][goods_type][i][2] == 14 then   --����Ǹ����Ĳر�ͼ
				for i = 1,117 do
					if GetItemCount(2,14,i) > 0 then
						cangbaotu_num = 1;
						break
					end
				end
				if cangbaotu_num == 0 then
					Talk(1,"","�����ϵġ�<color=red>ɱ�ֲر�ͼ<color>������<color=red>1<color>����")
					return 0
				end
			else
				if GetItemCount(task_goods_need_list[task_diff][goods_type][i][1],task_goods_need_list[task_diff][goods_type][i][2],task_goods_need_list[task_diff][goods_type][i][3]) < task_goods_need_list[task_diff][goods_type][i][4] then
					Talk(1,"","�����ϵġ�<color=red>"..task_goods_need_list[task_diff][goods_type][i][5].."<color>������<color=red>"..task_goods_need_list[task_diff][goods_type][i][4].."<color>����")
					return 0
				end
			end
		end
		if task_diff > 1 or abluemoon_check_jue(deal_flag) == 1 then
			return 1	
		else
			return 0	
		end
	else
		for i = 1,getn(task_goods_need_list[task_diff][goods_type]) do
			if task_goods_need_list[task_diff][goods_type][i][2] == 14 then   --����Ǹ����Ĳر�ͼ
				for i = 1,117 do
					if DelItem(2,14,i,1) ~= 0 then
						cangbaotu_num = 1;
						break
					end
				end
				if cangbaotu_num == 0 then
					Talk(1,"","�����ϵġ�<color=red>ɱ�ֲر�ͼ<color>������<color=red>1<color>����")
					return 0
				end				
			else
				if DelItem(task_goods_need_list[task_diff][goods_type][i][1],task_goods_need_list[task_diff][goods_type][i][2],task_goods_need_list[task_diff][goods_type][i][3],task_goods_need_list[task_diff][goods_type][i][4]) ~= 1 then
					Talk(1,"","�����ϵġ�<color=red>"..task_goods_need_list[task_diff][goods_type][i][5].."<color>������<color=red>"..task_goods_need_list[task_diff][goods_type][i][4].."<color>����")
					return 0
				end
			end
		end
		if task_diff > 1 or abluemoon_check_jue(deal_flag) == 1 then
			return 1	
		else
			return 0	
		end
	end	
end
--*******************************�����������*********************************
function ran_prize(goods_diff,ran_diff)
	if ran_diff == 1 then			--���������ñ���
		local add_flag = AddItem(2,0,606,1)		
		if add_flag == 1 then
			Msg2Player("��ϲ������һ�������������䣡")
			Msg2SubWorld(GetName().."����˿ƿ����񣬻����һ���������������䡱��")		--test
			WriteLog(GetName().."���һ��������������")
		else
			WriteLog(GetName().."���������ñ���ʧ�ܣ�ʧ�ܱ�־��"..add_flag)
		end
	elseif ran_diff == 2 then		--ʦ���ؼ�����
		local book_name = {"��շ�ħ��","Ǳ���ؼ�","�޳��ؼ�","�����ؼ�","�����ؼ�","�̺���","�����ؼ�",
						"�����ؼ�","��Ӱ�ؼ�","�����ؼ�","����ؼ�","�����ؼ�","��ڤ��¼","����ؼ�"}
		local book_seq = random(1,getn(book_name))
		local book_id = ((book_seq - 1) * 2) + 1
		local add_flag = AddItem(0,107,book_id,1)
		if add_flag == 1 then
			Msg2Player("��ϲ����á�"..book_name[book_seq].."����")
			Msg2SubWorld("��ң�"..GetName().."����˿ƿ���������һ����"..book_name[book_seq].."����")	--test
		else		--test
			WriteLog("�ƿ���������ң�"..GetName().."����"..book_name[book_seq].."ʧ�ܣ�ʧ�ܱ�־��"..add_flag)
		end
	elseif ran_diff == 3 then		--��������
		local add_flag = AddItem(2,2,8,goods_and_prize_list[goods_diff][9])
		if add_flag == 1 then
			Msg2Player("��ϲ������"..goods_and_prize_list[goods_diff][9].."��������")
		end
	elseif ran_diff == 4 then		--��������
		ModifyReputation(goods_and_prize_list[goods_diff][12],0)
	else							--������
		local palyer_level = GetLevel()
		local exp_num = floor((palyer_level*palyer_level*palyer_level)*goods_and_prize_list[goods_diff][11])
		ModifyExp(exp_num)
		Msg2Player("��ϲ������"..exp_num.."�㾭�飡")
	end
end
--*************************************��ʿ֤����Ҫ�ľ�Ҫ�б�*******************************
function book_need_jue()
	Talk(1,"","<color=yellow>��������ϡ�о�Ҫ���������5�ž�Ҫ�����ԣ�<color>"..
			"<enter>    ����ϡ�о�Ҫ����Ħ�侭���������ƣ�ʨ�Ӻ𣬴������ָ"..
			"<enter>    ����ϡ�о�Ҫ�����컨�꣬�����绨��"..
			"<enter>    ����ϡ�о�Ҫ�������ľ�������Ʈ��������ˮ�ķ�"..
			"<enter>    ؤ��ϡ�о�Ҫ����ȭ����������������򹷹���"..
			"<enter>    �䵱ϡ�о�Ҫ�����������������߽ؽ������������������������޼�����������"..
			"<enter>    ����ϡ�о�Ҫ����ҵ���ǹ���������������������������������"..
			"<enter>    �嶾ϡ�о�Ҫ����ʬа�����ùƣ�Ԧʬ�������ƣ����ʴ��"
	)
end

function abluemoon_check_jue(deal_flag)
	local tNormalPage = {  --��ʿ֤����Ҫ�ľ�Ҫ
		1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,19,20,21,22,23,24,25,26,27,28,30,32,
		33,34,35,36,37,38,39,40,41,42,44,45,47,48,49,50,51,53,54,55,56,57,58,59,60,
		61,62,63,64,65,66,68,69,71,72,73,74,75,76,77,80,81,82,84,85,86,87,89,
		90,91,92,93,94,95,96,97,98,100,102,103,104,105,106,107,109,110,111,
		113,115,116,117,118,120,121,122,123,124,125,126,127,130,131,132,133,134,
		135,136,138,139,141,142,143,144,145,146,149,150,151,152,153,154,155,156,
		157,158,159,160,161,162,163,165,168}
	local jue_count = 0;
	if deal_flag == 1 then      --���
		for i = 1,getn(tNormalPage) do 
			if GetItemCount(2,6,tNormalPage[i]) > 0 then
				jue_count = jue_count + GetItemCount(2,6,tNormalPage[i])
			end
		end
		if jue_count ~= 5 then
			Talk(1,"","������<color=yellow>����Ҫ��<color>�ľ�Ҫ����<color=yellow>������5��<color>�����ȱ�ٵĲ�����߰Ѷ���ķŵ��ֿ���˵��")
			return 0
		end
		return 1
	else
		for i = 1,getn(tNormalPage) do 
			if GetItemCount(2,6,tNormalPage[i]) > 0 then
				DelItem(2,6,tNormalPage[i],GetItemCount(2,6,tNormalPage[i]))
			end
		end
		return 1
	end
end

