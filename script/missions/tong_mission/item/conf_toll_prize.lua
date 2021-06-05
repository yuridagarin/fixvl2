--�ű����ƣ����ؿ������ű�
--�ű�����:���ؿ��������ĸ��ںͿ����ű�
--�߻��ˣ����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-07-26
--�����޸ļ�¼��
--�Ի���������
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������

Tb_equip_mertiral = 		--�����б�
	{
		{"T� Quang Li�t Di�m C�m",2,0,735},
		{"T� Quang K� L�n V�",2,0,736},
		{"T� Quang Kim Thi�n Ti",2,0,737},
		{"M�nh Ti�t Ho�nh Th�",2,0,738},
		{"Th��ng C� K� L�n Huy�t",2,0,739},
	}
Tb_prize_toll = 
	{	--������š�����(��������Ʒ)
		{{{100,1}},	{{50,1}},			{{50,1}}},
		{{{100,1}},	{{60,2}},			{{40,2}}},
		{{{100,2}},	{{50,2},{100,3}},	{{50,3}}},
		{{{100,3}},	{{50,3},{100,2}},	{{50,4}}},
		{{{100,4}},	{{75,4}},			{{50,4}}},
		{{{100,5}},	{{75,5}},			{{50,5}}},
	}
Prize_box_start_id = 740
Tb_prize_box_name =
	{
	"B�o r��ng t�ng 1 T� Quang C�c",	"B�o r��ng t�ng 2 T� Quang C�c",	"B�o r��ng t�ng 3 T� Quang C�c",
	"B�o r��ng t�ng 4 T� Quang C�c",	"B�o r��ng t�ng 5 T� Quang C�c",	"B�o r��ng t�ng 6 T� Quang C�c",
	}
--ʹ������
function OnUse(goods_index)
	--ʹ��Ȩ�޼��
	local tong_att = IsTongMember()
	if tong_att ~= 1 and tong_att ~= 2 and tong_att ~= 3 then
		Talk(1,"","<color=green>Ch� �<color>: Ch� c� <color=yellow>bang ch�<color>, <color=yellow>ph� bang ch� <color>v� <color=yellow>tr��ng l�o<color> m�i c� th� s� d�ng b�o r��ng n�y!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	local goods_seq = goods_id - 739		--��Ʒ���
	--��Ʒ�ű��Ƿ���ȷ
	if goods_id < Prize_box_start_id or goods_id > (Prize_box_start_id + 6) then
		return
	end
	--����Ʒ�Ƿ��һ��ʹ��
	if GetItemParam(goods_index,0) > 5 or GetItemParam(goods_index,0) < 0 then
		for i = 0,2 do
			for j = 1,getn(Tb_prize_toll[goods_seq][i+1]) do
				local ran_num = random(1,100)
				if ran_num <= Tb_prize_toll[goods_seq][i+1][j][1] then
					SetItemParam(goods_index,i,Tb_prize_toll[goods_seq][i+1][j][2])
				else
					SetItemParam(goods_index,i,0)
				end
			end
		end
	end
	--������ĶԻ�����
	local prize_list = {}
	local dia_prize =""
	for i = 0,2 do
		local param_num = GetItemParam(goods_index,i)
		if param_num > 0 and param_num < 6 then
			tinsert(prize_list,Tb_equip_mertiral[param_num][1].."/#prize_distr("..goods_index..","..i..")")
			SendTongMessage(GetName().."B�t ��u"..Tb_prize_box_name[goods_seq]..", ph�t hi�n 2 nh�m "..Tb_equip_mertiral[param_num][1].."!")
		end
	end
	tinsert(prize_list,"Thu/end_dialog")
	--�Ѿ��������del��
	local prize_num = (getn(prize_list)-1)
	if prize_num == 0 then
		DelItemByIndex(goods_index,1)
		return
	end
	--�Ի�
	Say("<color=green>"..Tb_prize_box_name[goods_seq].."<color>: B�n �� m� ���c <color=yellow>"..prize_num.."<color>nh�m v�t ph�m, xin m�i b�m v�o �� ph�n ph�i!",
	getn(prize_list),
	prize_list
	)
end
--����������
function prize_distr(goods_index,param_seq)
	local goods_seq = GetItemParam(goods_index,param_seq)
	if GetTeamSize() == 0 then
		Say("<color=green>Ch� �<color>: Ng��i c� th� ph�n chia <color=yellow>"..Tb_equip_mertiral[goods_seq][1].."<color> cho nh�ng th�nh vi�n trong <color=yellow>t� ��i<color> c�a <color=yellow>b�n bang<color> ! Hi�n t�i ng��i ch� c� th� ph�n ph�t cho <color=red>ch�nh m�nh<color>, ng��i c� ch�c ch�n?",
			2,
			"Ta mu�n ph�n chia cho ch�nh m�nh./#prize_get("..goods_index..","..param_seq..","..PlayerIndex..")",
			"�� ta suy ngh� l�i/end_dialog"
			)
	else
		--�Ի���talble,����������Է������
		local team_member_dia = {}
		local player_index_save = PlayerIndex
		local player_tong_name = GetTongName()
		local player_name = ""
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			player_name = GetName()
			player_name = zgc_pub_name_replace(player_name,"/","-")
			player_name = zgc_pub_name_replace(player_name,"|","-")
			player_name = zgc_pub_name_replace(player_name,":","-")
			tinsert(team_member_dia,player_name.."/#prize_get("..goods_index..","..param_seq..","..PlayerIndex..")")
		end
		tinsert(team_member_dia,"�� ta suy ngh� l�i/end_dialog")
		PlayerIndex = player_index_save
		--�г��Ի�
		Say("<color=green>Ch� �<color>: Ng��i c� th� ph�n chia <color=yellow>"..Tb_equip_mertiral[goods_seq][1].."<color> cho nh�ng th�nh vi�n trong <color=yellow>t� ��i<color> c�a <color=yellow>b�n bang<color>! Xin m�i hay ch�n ng��i �� ph�n chia.",
		getn(team_member_dia),
		team_member_dia
		)
	end	
end
--��ʼ������
function prize_get(goods_index,param_seq,player_index)
	local player_index_save = PlayerIndex
	--�жϸ������Ƿ����ڸö�����
	local index_chg_chk_flag = 0
	local team_size = GetTeamSize()
	if team_size ~= 0 then
		index_chg_chk_flag = zgc_pub_same_team_chk(player_index) 
	else
		index_chg_chk_flag = 1
	end
	if index_chg_chk_flag ~= 1 then
		Talk(1,"","<color=green>Ch� �<color>: Xin m�i h�y ki�m tra l�i nh�ng ng��i m� b�n ph�n chia c� ph�i c� c�ng <color=yellow>t� ��i<color> v�i b�n!")
		return
	end
	--�������Ŀռ为�ؼ��
	PlayerIndex = player_index
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--��Ʒ��Ӧɾ��
	local goods_seq = GetItemParam(goods_index,param_seq)
	--���ݳ�����
	PlayerIndex = player_index_save
	if goods_seq < 0 or goods_seq > getn(Tb_equip_mertiral) then
		DelItemByIndex(goods_index,1)
		WriteLog("Ph�n th��ng bang h�i v��t �i: Ng��i ch�i ["..GetName().."]"..Tb_prize_box_name[GetItemParticular(goods_index)-739].."Do l�i n�n d� li�u �� b� x�a 1 c�i, d� li�u b� x�a l�:"..goods_seq)
	end
	--��ʼ���ݴ���
		--if SetItemParam(goods_index,param_seq,0) == 1 then
			SetItemParam(goods_index,param_seq,0)

			--��ʼ������Ʒ
			PlayerIndex = player_index
			local add_flag = AddItem(Tb_equip_mertiral[goods_seq][2],Tb_equip_mertiral[goods_seq][3],Tb_equip_mertiral[goods_seq][4],10)
			local prize_get_name = GetName()
			Msg2Player("Ch�c m�ng ��i hi�p �� ���c 2 	"..Tb_equip_mertiral[goods_seq][1].."!")
			PlayerIndex = player_index_save
			if add_flag == 1 then
				SendTongMessage(GetName().."2"..Tb_equip_mertiral[goods_seq][1].." ph�n chia cho:"..prize_get_name)
			else
				WriteLog("Ph�n th��ng bang h�i v��t �i: Ng��i ch�i ["..prize_get_name.."] t�ng"..Tb_equip_mertiral[goods_seq][1].." th�t b�i, k� hi�u:"..add_flag)
			end
			--������Ͼ�ɾ������Ʒ
			if prize_box_remain(goods_index) == 0 then
				return
			end
		--else
		--	return
		--end
end
--����Ƿ��н���
function prize_box_remain(box_index)
	local prize_remain = 0
	for i = 0, 2 do
		if GetItemParam(box_index,i) ~= 0 then
			prize_remain = (prize_remain + 1)
		end
	end
	if prize_remain == 0 then
		DelItemByIndex(box_index,1)
	end
	return prize_remain
end