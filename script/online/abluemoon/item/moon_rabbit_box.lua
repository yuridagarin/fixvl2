--�ű����ƣ��������������䡱ʹ�ýű�
--�ű����ܣ�ʹ�á������������䡱�Ľ�������
--�����д�ˣ��峤
--�����дʱ�䣺2007-01-28
--�޸ļ�¼��С���򲹶�
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
--============================��������������============================
	moon_rabbit_box_prize_list = {
	--��������--��������--��������
	{353,2,"jue_bag_add()"},						--��Ҫ��
	--{200,2,"2����������",2,0,392},				--���������� IB��û�У�����
	{250,2,"shimen_book()"},					--ʦ���ؼ�
	{100,1,"1�������ؼ�",0,107,155},				--�����ؼ�
	{60,2,"labor_head_add()"},					--��һͷ
	{60,2,"labor_trouers_add()"},				--��һ����
	{60,2,"labor_weapon_add()"},					--��һ����
	{40,1,"1������֮��",0,102,21},					--������
	{20,1,"1ƥ���ײ�",0,105,12},					--���ײ�
	{20,1,"1��������ҩ��",0,102,41},				--������ҩ��				
	{15,1,"1����ԭ����",0,102,27},				--��ԭ����
	{5,1,"1ƥ����",0,105,13},					--����
	{5,1,"1������������",0,102,28},				--������
	{4,1,"1���϶������",0,102,42},				--�϶����
	{4,1,"1����������",0,102,24},				--��������
	{4,1,"1���������ջ�",0,102,43}				--�������ջ�
	}
--=============================�ű����߼���=============================


function OnUse(goods_index)
	Say("��ȷ��Ҫʹ�á������������䡱�𣿴򿪴˱��佫��õ�����ϡ���䱦�е�����һ�������ɾ�Ҫ����ʦ���ؼ��������ؼ���2006�����һ�Ͷ���ͷ/����/����������֮�䡢���ײ���������ҩ������ԭ���塢�������������������϶���������������顢�������ջ���ף����ˣ���",
	3,
	"��ȷ��Ҫʹ��/moon_rabbit_box_use",
	"���뿴��ÿ�ֱ���ĳ��ָ���/show_all",
	"���ٿ��ǿ���/end_dialog")
end


--****************************����ȷ��ʹ�ú���**************************
function moon_rabbit_box_use()
	if Zgc_pub_goods_add_chk(1,300) ~= 1 then		--�ռ�/�����ж�
		Talk(1,"","��ȷ�����ı������㹻�ĸ��غͿռ䣡")
		return
	end
	if GetItemCount(2,0,606) == 0 then					--��Ʒ�ж�
		Talk(1,"","��ȷ�����ı�������<color=red>������������<color>��")
		return
	end
	if DelItem(2,0,606,1) ~= 1 then					--ɾ����Ʒ�ж�
		Talk(1,"","��ȷ�����ı�������<color=red>������������<color>��")
		return
	end
	local num_count = 0
	for i = 1,getn(moon_rabbit_box_prize_list) do
		num_count = num_count + moon_rabbit_box_prize_list[i][1]
	end
	local ran_num = random(1,num_count)
	for i = 1 ,getn(moon_rabbit_box_prize_list) do
		if ran_num <= moon_rabbit_box_prize_list[i][1] then
			if getn(moon_rabbit_box_prize_list[i]) > 3 then
				local add_flag = AddItem(moon_rabbit_box_prize_list[i][4],moon_rabbit_box_prize_list[i][5],moon_rabbit_box_prize_list[i][6],moon_rabbit_box_prize_list[i][2],1,-1,-1,-1,-1,-1,-1)
				if add_flag == 1 then
					Msg2Player("��ϲ������"..moon_rabbit_box_prize_list[i][3].."��")
					Msg2SubWorld(GetName().."ʹ������������������"..moon_rabbit_box_prize_list[i][3].."��")
					WriteLog("[abluemoon]"..GetName().."ʹ������������������"..moon_rabbit_box_prize_list[i][3].."��")
				else
					WriteLog("[abluemoon]������������ʹ�ã����["..GetName().."]ʹ����������������"..moon_rabbit_box_prize_list[i][3].."ʧ�ܣ�ʧ�ܱ�־��"..add_flag)
				end	
				break
			else
				dostring(moon_rabbit_box_prize_list[i][3])
				break
			end
		else
			ran_num = ran_num - moon_rabbit_box_prize_list[i][1]
		end
	end
end
--*******************************��Ҫ������********************************
function jue_bag_add()
	local jue_id = {{607,"���־�Ҫ��"},
					{608,"���ž�Ҫ��"},
					{609,"���Ҿ�Ҫ��"},
					{610,"ؤ���Ҫ��"},
					{611,"�䵱��Ҫ��"},
					{612,"���ž�Ҫ��"},
					{613,"�嶾��Ҫ��"}}
	local bag_diff = random(1,getn(jue_id))
	local add_flag = AddItem(2,0,jue_id[bag_diff][1],1)
	if add_flag == 1 then
		Msg2Player("��ϲ������һ��"..jue_id[bag_diff][2].."��")
		Msg2SubWorld(GetName().."ʹ������������������һ��"..jue_id[bag_diff][2].."��")
		WriteLog("[abluemoon]"..GetName().."ʹ������������������һ��"..jue_id[bag_diff][2].."��")		
	else
		WriteLog("[abluemoon]������������ʹ�ã����["..GetName().."]ʹ����������������"..jue_id[bag_diff][2].."ʧ�ܣ�ʧ�ܱ�־��"..add_flag)
	end	

end
--*****************************��һͷ����*********************************
function labor_head_add()
	local HatTab = {
		{0,103,17},	
		{0,103,18},
		{0,103,35},
		{0,103,36},
		{0,103,53},
		{0,103,54},
		{0,103,71},
		{0,103,72}
		}
	local nRandomNum = random(1,getn(HatTab))
	local add_flag = AddItem(HatTab[nRandomNum][1],HatTab[nRandomNum][2],HatTab[nRandomNum][3],1,1,2,random(131,132),2,102,-1,-1)
	if add_flag  == 1 then
		Msg2Player("��ϲ������һ����һñ��")
		Msg2SubWorld(GetName().."ʹ������������������һ����һñ��")
		WriteLog("[abluemoon]"..GetName().."ʹ������������������һ�����0,103,"..HatTab[nRandomNum][3].."��һñ��")
	else
		WriteLog("[abluemoon]������������ʹ�ã����["..GetName().."]ʹ������������������һñʧ�ܣ�ʧ�ܱ�־��"..add_flag)
	end
end
--****************************��һ��������*******************************
function labor_trouers_add()
	local TrousersTab = {
		{0,101,17},
		{0,101,18},
		{0,101,35},
		{0,101,36},
		{0,101,53},
		{0,101,54},
		{0,101,71},
		{0,101,72},
		}
	local nRandomNum = random(1,getn(TrousersTab))
	local add_flag = AddItem(TrousersTab[nRandomNum][1],TrousersTab[nRandomNum][2],TrousersTab[nRandomNum][3],1,1,3,random(131,132),2,102,-1,-1)
	if add_flag  == 1 then
		Msg2Player("��ϲ������һ����һ�㣡")
		Msg2SubWorld(GetName().."ʹ������������������һ����һ�㣡")	
		WriteLog("[abluemoon]"..GetName().."ʹ������������������һ�����0,101,"..TrousersTab[nRandomNum][3].."��һ�㣡")
	else
		WriteLog("[abluemoon]������������ʹ�ã����["..GetName().."]ʹ������������������һ��ʧ�ܣ�ʧ�ܱ�־��"..add_flag)
	end
end
--****************************��һ��������*******************************
function labor_weapon_add()
	local WeaponTab = {
		{0,0,13},	--1��
		{0,2,26},	--2��
		{0,5,39},	--3��
		{0,1,52},	--4����
		{0,3,63},	--5����
		{0,10,74},	--6��
		{0,9,85},	--7��
		{0,8,96},	--8��
		{0,6,107},	--9ǹ
		{0,4,118},	--10��
		{0,11,11},	--11צ
		{0,7,11},	--12˫��
		}
	local nRandomNum = random(1,getn(WeaponTab))
	
	if nRandomNum == 3 or nRandomNum == 4 or nRandomNum == 5 or nRandomNum == 7 or nRandomNum == 9 or nRandomNum == 10 or nRandomNum == 12 then
		nAttribute = 131	--��,����,����,��,ǹ,��,˫��
	elseif nRandomNum == 2 or nRandomNum == 6 or nRandomNum == 8 or nRandomNum == 11 then
		nAttribute = 132	--��,��,��,צ
	else	--��
		nAttribute = random(131,132)
	end

	local add_flag = AddItem(WeaponTab[nRandomNum][1],WeaponTab[nRandomNum][2],WeaponTab[nRandomNum][3],1,1,3,nAttribute,3,102,2,251)

	if add_flag  == 1 then
		Msg2Player("��ϲ������һ��������")
		Msg2SubWorld(GetName().."ʹ������������������һ����һ������")	
		WriteLog("[abluemoon]"..GetName().."ʹ������������������һ�����"..WeaponTab[nRandomNum][1]..","..WeaponTab[nRandomNum][2]..","..WeaponTab[nRandomNum][3].."��һ������")
	else
		WriteLog("[abluemoon]������������ʹ�ã����["..GetName().."]ʹ������������������һ����ʧ�ܣ�ʧ�ܱ�־��"..add_flag)
	end
end
--***************************ʦ���ؼ�����*********************************
function shimen_book()
	local book_name = {"��շ�ħ��","Ǳ���ؼ�","�޳��ؼ�","�����ؼ�","�����ؼ�","�̺���","�����ؼ�",
					"�����ؼ�","��Ӱ�ؼ�","�����ؼ�","����ؼ�","�����ؼ�","��ڤ��¼","����ؼ�"}
	local book_seq = random(1,getn(book_name))
	local book_id = ((book_seq - 1) * 2) + 1
	local add_flag = AddItem(0,107,book_id,1)
	if add_flag == 1 then
		Msg2Player("��ϲ����á�"..book_name[book_seq].."����")
		Msg2SubWorld(GetName().."ʹ������������������һ����"..book_name[book_seq].."����")	
		WriteLog("[abluemoon]".."ʹ������������������һ����"..book_name[book_seq].."����")
	else		--test
		WriteLog("[abluemoon]������������ʹ�ã���ң�"..GetName().."����"..book_name[book_seq].."ʧ�ܣ�ʧ�ܱ�־��"..add_flag)
	end
end

--***************************��ʾÿ������ĳ��ָ���*************************
function show_all()
	Talk(1,"",
	"�������������ܿ����ı�������������ģ�"..
	"<enter>  ��Ҫ��            35.3%"..
	"<enter>  ʦ���ؼ�          25%"..
	"<enter>  �����ؼ�          10%"..
	"<enter>  ��һװ��          18%"..
	"<enter>  ϡ����Ʒ          11.7%"
	)
end
