--�ű����ƣ�������ʹ�ýű�
--�ű����ܣ������׵�ʹ�ýű�������������Ƭ���ꡢ�ϳɱ���ȹ���
--�߻��ˣ�����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-05-17
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\task\\marriage\\map_att_head.lua")					--������ͷ�ļ�
--================================��������������================================
	task_map_id_TaskID = 1217
	task_att_seq_TaskID = 1218
	Frag_att_num_TaskID = 1220
	Tb_goods_compose = {}
	Tb_goods_compose[583] = {{573,"��ng T�m Ho�n","S� d�ng tr� ��ng t�m t�ng <color=yellow>125<color> �i�m!","tr� ��ng t�m t�ng 125 �i�m"},{568,6,"Gi�p M�c d��ng"},{569,2,"�t M�c �m"},{570,1,"B�nh h�a d��ng"}}
	Tb_goods_compose[584] = {{574,"��i ��ng T�m Ho�n","S� d�ng tr� ��ng t�m t�ng <color=yellow>300<color> �i�m!","tr� ��ng t�m t�ng 300 �i�m"},{568,9,"Gi�p M�c d��ng"},{569,5,"�t M�c �m"},{570,2,"B�nh h�a d��ng"}}
	Tb_goods_compose[585] = {{575,"��ng T�m ��n","S� d�ng tr� ��ng t�m t�ng <color=yellow>125<color> �i�m!","Tr� ��ng T�m t�ng t�i �a 125 �i�m"},{568,3,"Gi�p M�c d��ng"},{569,4,"�t M�c �m"},{570,2,"B�nh h�a d��ng"}}
	Tb_goods_compose[586] = {{576,"��i ��ng T�m ��n","S� d�ng tr� ��ng t�m t�ng <color=yellow>300<color> �i�m!","Tr� ��ng T�m t�ng t�i �a 300 �i�m"},{568,4,"Gi�p M�c d��ng"},{569,8,"�t M�c �m"},{570,4,"B�nh h�a d��ng"}}
	Tb_goods_compose[587] = {{577,"T� t��ng b�n quy�n","S� d�ng s� <color=red>h�c ���c<color>: <color=yellow>k� n�ng Truy�n t�ng<color>!","H�c ���c phu th� truy�n t�ng"},{568,4,"Gi�p M�c d��ng"},{569,4,"�t M�c �m"},{570,8,"B�nh h�a d��ng"}}
	Tb_goods_compose[588] = {{578,"T� t��ng t�n quy�n","S� d�ng s� <color=red>th�ng c�p<color>: <color=yellow>k� n�ng Truy�n t�ng<color>!","Th�ng c�p k� n�ng phu th� truy�n t�ng"},{568,5,"Gi�p M�c d��ng"},{569,2,"�t M�c �m"},{570,8,"B�nh h�a d��ng"},{571,5,"�inh H�a �m"}}
	Tb_goods_compose[589] = {{579,"H�a �i�p b�n quy�n","S� d�ng s� <color=red>h�c ���c<color>: <color=yellow>k� n�ng h�i sinh<color>!","H�c ���c k� n�ng phu th� h�i sinh"},{568,2,"Gi�p M�c d��ng"},{569,5,"�t M�c �m"},{570,9,"B�nh h�a d��ng"}}
	Tb_goods_compose[590] = {{580,"H�a �i�p t�n quy�n","S� d�ng s� <color=red>th�ng c�p<color>: <color=yellow>k� n�ng h�i sinh<color>!","Th�ng c�p k� n�ng phu th� h�i sinh"},{568,2,"Gi�p M�c d��ng"},{569,5,"�t M�c �m"},{570,8,"B�nh h�a d��ng"},{571,5,"�inh H�a �m"}}
	Tb_goods_compose[591] = {{581,"�i�p Luy�n b�n quy�n","S� d�ng s� <color=red>h�c ���c<color>: <color=yellow>k� n�ng H� tr�<color>!","H�c ���c k� n�ng phu th� c��ng h�a"},{568,5,"Gi�p M�c d��ng"},{569,3,"�t M�c �m"},{570,6,"B�nh h�a d��ng"},{571,9,"�inh H�a �m"}}
	Tb_goods_compose[592] = {{582,"�i�p Luy�n t�n quy�n","S� d�ng s� <color=red>th�ng c�p<color>: <color=yellow>k� n�ng H� tr�<color>!","Th�ng c�p k� n�ng phu th� c��ng h�a"},{568,3,"Gi�p M�c d��ng"},{569,5,"�t M�c �m"},{570,5,"B�nh h�a d��ng"},{571,10,"�inh H�a �m"}}
	Tb_player_sex_att = {
		{"X","Y"},
		{"Y","X"},
	}
	goods_id_tasktempID = 167
	Tb_frag = {}
	Tb_frag[568] = "Gi�p M�c d��ng"
	Tb_frag[569] = "�t M�c �m"
	Tb_frag[570] = "B�nh h�a d��ng"
	Tb_frag[571] = "�inh H�a �m"
--===============================���߼���============================
function OnUse()
	if GetMateName() == "" or GetMateName() == nil then
		Talk(1,"","<color=green>Ch� �<color>: Ch�a k�t h�n ch�a th� s� d�ng v�t ph�m n�y!")
		return
	end
	Say("<color=green>Ch� �<color>: <color=yellow>Khi�n V�n Phi Tinh ph�<color> l� B�o v�t ph�i t�m trong <color=yellow>B�o V�t phu th�<color>, n� s� ch� ra <color=yellow>t�a �� L�u tinh �� ��n �� t�m L�u tinh to�i phi�n<color>, c�ng c� th� d�ng n� �� t�m L�u tinh to�i phi�n<color=yellow> h�p th�nh B�o V�t phu th�<color>. C�c h� mu�n <color=yellow>t�m to�i phi�n<color> hay <color=yellow>h�p th�nh B�o v�t<color>",
	8,
	"Nhi�m v� Phu th�/get_att_dia",
	"H�p th�nh b�o v�t/#cowry_comp_dia(583)",
	"L�y ra To�i phi�n /ma_frag_get_out",
	"Tra xem s� to�i phi�n ph�/get_frag_num",
	"Tra xem s� l�n nhi�m v� c�n d�/get_att_num",
	"Thuy�t minh Nhi�m v� Phu th�/get_att_info",
	"Thuy�t minh tr� ��ng t�m/same_heart_value_info",
	"Tho�t/end_dialog"
	)
end
--**********************��ȡ��������Ի�***********************
function get_att_dia()
	local task_num_remain = GetTask(Frag_att_num_TaskID)
	if task_num_remain <= 0 or task_num_remain == nil then
		Talk(1,"","<color=green>Ch� �<color>: S� l�n nh�n nhi�m v� c�a ng��i �� h�t. Xin ��n ch� <color=green>X�o N�<color> �� nh�n ti�p nhi�m v�!")
		return
	elseif task_num_remain >= 200 then
		SetTask(Frag_att_num_TaskID,200)
	end
	local map_ID_save = GetTask(task_map_id_TaskID)
	if map_ID_save == nil or map_ID_save == 0 then
		Say("<color=green>Ch� �<color>: B�n x�c ��nh s� d�ng <color=yellow>Khi�n V�n Phi Tinh ph�<color> �� nh�n ���c <color=yellow>t�a �� to�i phi�n<color>. L�n n�y s� khi�n s� l�n t�a �� trong Khi�n V�n Phi Tinh ph� <color=green>gi�m xu�ng 1 l�n<color>. B�n s� nh�n ���c t�a �� <color=red>"..Tb_player_sex_att[GetSex()][1].."<color>, � trung nh�n c�a b�n s� nh�n ���c t�a �� <color=red>"..Tb_player_sex_att[GetSex()][2].."<color>",
		2,
		"��ng �/get_att",
		"H�y b�/end_dialog"
		)
	else
		Say("<color=green>Ch� �<color>: <color=yellow>Khi�n V�n Phi Tinh ph�<color> m�i l�n ch� ch� ra 1 t�a ��, n�u nh� qu�n t�a ��, c� th� tra l�i t�i ��y. C�ng c� th� s� d�ng <color=yellow>Khi�n V�n Phi Tinh ph�<color> �� nh�n ���c <color=yellow>t�a �� L�u tinh<color> m�i! Nh�ng s� khi�n cho t�a �� c�a to�i phi�n l�n tr��c m�t t�c d�ng",
		3,
		"Ta mu�n nh�n ���c t�a �� L�u tinh m�i/get_att",
		"Ta mu�n t�m l�i t�a �� L�u tinh l�n tr��c/star_att_inq",
		"H�y b�/end_dialog"
		)
	end
end
--**********************���������ѯ***************************
function star_att_inq()
	local map_ID_save = GetTask(task_map_id_TaskID)
	local att_seq_save = GetTask(task_att_seq_TaskID)
	--û�����걣������
	if map_ID_save == 0 or map_ID_save == nil or att_seq_save == 0 or att_seq_save == nil then
		Talk(1,"","<color=green>Ch� �<color>: <color=yellow>L�u tinh to�i phi�n<color> l�n n�y �� t�m th�y, hay l� �i t�m <color=yellow>to�i phi�n<color> k� ti�p �i!")
		return
	end
	--������Ӳ���
	local mate_name = GetMateName()
	local team_member_num = GetTeamSize()
	local player_index_save = PlayerIndex
	local player_mate_index = 0
	local player_mate_mapID = 0
	if team_member_num ~= 2 then
		if team_member_num == 0 then
			Talk(1,"","<color=green>Ch� �<color>: Xin x�c nh�n b�n v� � trung nh�n �� t� ��i!" )
			return
		else
			Talk(1,"","<color=green>Ch� �<color>: Xin x�c nh�n trong t� ��i ch� c� <color=yellow>� trung nh�n c�a b�n<color>!" )
			return
		end
	else
		for i = 1 , 2 do
			PlayerIndex = GetTeamMember(i)
			if mate_name == GetName() then
				player_mate_index = PlayerIndex
				player_mate_mapID = GetWorldPos()
				PlayerIndex = player_index_save
				break
			end
		end
		PlayerIndex = player_index_save
	end
	if player_mate_index == 0 then
		Talk(1,"","<color=green>Ch� �<color>: Xin x�c nh�n b�n v� � trung nh�n �� t� ��i!" )
		return
	end
	local map_ID = GetWorldPos()
	if player_mate_mapID ~= map_ID then
		Talk(1,"","<color=green>Ch� �<color>: Xin x�c nh�n b�n v� � trung nh�n � c�ng m�t khu v�c!")
		return
	end
	local player_sex = GetSex()
	Talk(1,"","<color=green>Ch� �<color>: Hi�n t�i <color=yellow>Khi�n V�n Phi Tinh ph�<color>-t�a �� L�u tinh l�:? (<color=red>"..Tb_task_reel_att[map_ID_save].map_att[1].."<color>,<color=yellow>"..Tb_player_sex_att[player_sex][1].."<color> t�a �� l� <color=red>"..Tb_task_reel_att[map_ID_save][att_seq_save][player_sex].."<color>),<color=yellow>"..Tb_player_sex_att[player_sex][2].."<color>, �i h�i l�i � trung nh�n th�i! ��n ���c t�a �� th� hai ng��i l�m 1 ��ng t�c t�nh t�, s� nh�n ���c to�i phi�n!")
	PlayerIndex = player_mate_index
	player_sex = GetSex()
	Talk(1,"","<color=green>Ch� �<color>: � trung nh�n c�a b�n s� d�ng <color=yellow>Khi�n V�n Phi Tinh ph�<color> t�m th�y 1 t�a �� L�u tinh: <color=yellow>"..Tb_player_sex_att[player_sex][1].."<color> t�a �� l� <color=red>"..Tb_task_reel_att[map_ID_save][att_seq_save][player_sex].."<color>. ��n ���c t�a �� nh� nh�c � trung nh�n l�m 1 ��ng t�c t�nh t�, s� nh�n ���c to�i phi�n!")
	PlayerIndex = player_index_save	
end
--*************************��Ƭȡ��****************************
function ma_frag_get_out()
	Say("<color=green>Ch� �<color>: B�n c� th� l�y <color=yellow>to�i phi�n<color> trong <color=yellow>Khi�n V�n Phi Tinh ph�<color> ��t trong ng��i. Xin h�i mu�n l�y ra <color=yellow>to�i phi�n<color> n�o?",
	5,
	"L�y ra Gi�p M�c D��ng/#get_out_num_in(568)",
	"L�y ra �t M�c �m/#get_out_num_in(569)",
	"L�y ra B�nh H�a D��ng/#get_out_num_in(570)",
	"L�y ra �inh H�a �m/#get_out_num_in(571)",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--**********************ȡ����������***************************
function get_out_num_in(goods_id)
	local goods_num_save = GetTask(goods_id + 653)
	if goods_num_save <= 0 then
		Talk(1,"","<color=green>Ch� �<color>: Trong <color=yellow>Khi�n V�n Phi Tinh ph�<color> c�a b�n c� b�n kh�ng c� <color=yelllow>"..Tb_frag[goods_id].."<color>!")
		return
	end
	SetTaskTemp(goods_id_tasktempID,goods_id)
	AskClientForNumber("put_out",1,goods_num_save,"Xin nh�p s� l��ng mu�n l�y!")
end
--**************************ȡ������***************************
function put_out(goods_num)
	--�������0��ֱ�ӷ���
	if goods_num == 0 then
		return
	end
	local goods_id = GetTaskTemp(goods_id_tasktempID)
	SetTaskTemp(goods_id_tasktempID,0)
	--�����ж�
	local goods_num_save = GetTask(goods_id + 653)
	if goods_num_save < goods_num then
		Talk(1,"","<color=green>Ch� �<color>: Trong <color=yellow>Khi�n V�n Phi Tinh ph�<color> c�a b�n kh�ng c� �� <color=yelllow>"..Tb_frag[goods_id].."<color>!")
		return
	end
	--�ռ为���ж�
	if Zgc_pub_goods_add_chk(1,goods_num) ~= 1 then
		return
	end
	--�����������
	SetTask((goods_id + 653),(goods_num_save - goods_num))
	--��Ʒ����
	if AddItem(2,1,goods_id,goods_num) == 1 then
		Msg2Player("B�n l�y ra th�nh c�ng "..goods_num.."c�i"..Tb_frag[goods_id].."!")
	end
end
--**********************��ȡ��������***************************
function get_att()
	--���ڵ�ͼ����
	local map_id = GetWorldPos()
	if Tb_task_reel_att[map_id] == nil then
		Talk(1,"","<color=green>Ch� �<color>: Khu v�c n�y kh�ng c� L�u tinh to�i phi�n")
		return
	end
	--������Ӳ���
	local mate_name = GetMateName()
	local team_member_num = GetTeamSize()
	local player_index_save = PlayerIndex
	local player_mate_index = 0
	local player_mate_mapID = 0
	if team_member_num ~= 2 then
		if team_member_num == 0 then
			Talk(1,"","<color=green>Ch� �<color>: Xin x�c nh�n b�n v� � trung nh�n �� t� ��i!" )
			return
		else
			Talk(1,"","<color=green>Ch� �<color>: Xin x�c nh�n trong t� ��i ch� c� <color=yellow>� trung nh�n c�a b�n<color>!" )
			return
		end
	else
		for i = 1 , 2 do
			PlayerIndex = GetTeamMember(i)
			if mate_name == GetName() then
				player_mate_index = PlayerIndex
				player_mate_mapID = GetWorldPos()
				PlayerIndex = player_index_save
				break
			end
		end
		PlayerIndex = player_index_save
	end
	if player_mate_index == 0 then
		Talk(1,"","<color=green>Ch� �<color>: Xin x�c nh�n b�n v� � trung nh�n �� t� ��i!" )
		return
	end
	local map_ID = GetWorldPos()
	if player_mate_mapID ~= map_ID then
		Talk(1,"","<color=green>Ch� �<color>: Xin x�c nh�n b�n v� � trung nh�n � c�ng m�t khu v�c!")
		return
	end
	--������������������
	local fra_att_num = GetTask(Frag_att_num_TaskID) - 1
	SetTask(Frag_att_num_TaskID , fra_att_num)
	--д�벢��������
	local att_seq = random(1,getn(Tb_task_reel_att[map_id]))
	SetTask(task_map_id_TaskID,map_id)
	SetTask(task_att_seq_TaskID,att_seq)
	local player_sex = GetSex()
	TaskTip("Nh�n ���c t�a �� 2 vi�n L�u Tinh"..Tb_player_sex_att[player_sex][1].." t�a �� l�: "..Tb_task_reel_att[map_id][att_seq][player_sex])
	Talk(1,"","<color=green>Ch� �<color>: Hi�n t�i t�a �� L�u tinh trong <color=yellow>Khi�n V�n Phi Tinh ph�<color> s� l��ng c�n <color=yellow>"..fra_att_num.."<color>, l�n n�y t�m th�y to�i phi�n <color=yellow>"..Tb_player_sex_att[player_sex][1].." (t�a ��) <color> l� <color=red>"..Tb_task_reel_att[map_id][att_seq][player_sex].."<color>,<color=yellow>"..Tb_player_sex_att[player_sex][2].."<color>, �i h�i l�i � trung nh�n th�i! ��n ���c t�a �� th� hai ng��i l�m 1 ��ng t�c t�nh t�, s� nh�n ���c to�i phi�n!")
	Msg2Player("Nhi�m v� l�n n�y-"..Tb_player_sex_att[player_sex][1].." t�a �� l�: "..Tb_task_reel_att[map_id][att_seq][player_sex].."��n ���c t�a �� th� l�m 1 ��ng t�c t�nh t�, s� nh�n ���c to�i phi�n!")
	PlayerIndex = player_mate_index
	player_sex = GetSex()
	Talk(1,"","<color=green>Ch� �<color>: � trung nh�n c�a b�n s� d�ng <color=yellow>Khi�n V�n Phi Tinh ph�<color>, nh�n ���c 1 t�a �� to�i phi�n, <color=yellow>"..Tb_player_sex_att[player_sex][1].."<color> t�a �� l� <color=yellow>"..Tb_task_reel_att[map_id][att_seq][player_sex].."<color> ��n ���c t�a �� xin nh�c � trung nh�n c�a b�n <color=yellow>l�m 1 ��ng t�c t�nh t� b�t k�<color> s� <color=yellow> nh�n ���c To�i phi�n<color>")
	Msg2Player("� trung nh�n c�a b�n s� d�ng Khi�n V�n Phi Tinh ph�, nh�n ���c 1 t�a �� to�i phi�n, "..Tb_player_sex_att[player_sex][1].." t�a �� l� "..Tb_task_reel_att[map_id][att_seq][player_sex].."��n ���c t�a �� nh� nh�c � trung nh�n l�m 1 ��ng t�c t�nh t�, s� nh�n ���c to�i phi�n!")
	PlayerIndex = player_index_save	
end
--***********************����ϳɶԻ�**************************
function cowry_comp_dia(page_diff)
	local tb_dia = {}
	local dia_add_num = 3
	if page_diff == 587 then
		dia_add_num = 5
	end
	for i = page_diff,(page_diff + dia_add_num) do
		tinsert(tb_dia,Tb_goods_compose[i][1][2].."("..Tb_goods_compose[i][1][4]..")/#cowry_comp_dtm("..i..")")
	end
	if page_diff == 583 then
		tinsert(tb_dia,"Trang k�/#cowry_comp_dia(587)")
	else
		tinsert(tb_dia,"Trang tr��c/#cowry_comp_dia(583)")
	end
		tinsert(tb_dia,"Tho�t/end_dialog")
	Say("<color=green>G�i �<color>: M�i lo�i b�o v�t s� ti�u hao s� l��ng <color=yellow>m�nh nh�t ��nh<color>, ch�n chu�t ph�i <color=yellow>m�nh<color> �� cho v�o <color=yellow>Khi�n V�n Phi Tinh Ph�<color>. B�n mu�n h�p th�nh b�o v�t n�o?",
		getn(tb_dia),
		tb_dia
	)
end
--*******************����ϳ�ȷ��******************************
function cowry_comp_dtm(cowry_id)
	local compose_goods_need_dia = ""
	local compose_goods_save_dia = ""
	for i = 2 ,getn(Tb_goods_compose[cowry_id]) do
		local color = "<color=green>"
		local num_save = GetTask(Tb_goods_compose[cowry_id][i][1] + 653)
		if num_save < Tb_goods_compose[cowry_id][i][2] then
			color = "<color=red>"
		end
		compose_goods_need_dia = compose_goods_need_dia.."<color=yellow>"..Tb_goods_compose[cowry_id][i][2].."<color> c�i"..Tb_goods_compose[cowry_id][i][3]..";"
		compose_goods_save_dia = compose_goods_save_dia..color..GetTask(Tb_goods_compose[cowry_id][i][1] + 653).."<color> c�i"..Tb_goods_compose[cowry_id][i][3]..";"
	end
	Say("<color=green>G�i �<color>: B�n mu�n d�ng nguy�n li�u trong <color=yellow>Khi�n V�n Phi Tinh Ph�<color> h�p th�nh 1 <color=yellow>"..Tb_goods_compose[cowry_id][1][2].."<color>? \n Nguy�n li�u c�n �� h�p th�nh:"..compose_goods_need_dia.."\n Nguy�n li�u hi�n t�i trong Khi�n V�n Phi Tinh Ph�:"..compose_goods_save_dia.."\n Hi�u qu� s� d�ng:"..Tb_goods_compose[cowry_id][1][3],
		2,
		"T�i mu�n h�p th�nh/#cowry_comp("..cowry_id..")",
		"T�i ch�a chu�n b� xong/end_dialog"
	)	
end
--*****************************��ʼ�ϳ�************************
function cowry_comp(goods_id)
	--��Ҫ����Ʒ�Ի�
	--local goods_need_dia = ""
	--for i = 2,getn(Tb_goods_compose[goods_id]) do
	--	goods_need_dia = goods_need_dia.."<color=yellow>"..Tb_goods_compose[goods_id][i][2].."<color>��<color=yellow>"..Tb_goods_compose[goods_id][i][3].."<color>��"
	--end
	--����Ҫ�Ĳ��ϼ��
	for i = 2 ,getn(Tb_goods_compose[goods_id]) do
		if GetTask(Tb_goods_compose[goods_id][i][1] + 653) < Tb_goods_compose[goods_id][i][2] then
			Talk(1,"","<color=green>G�i �<color>: Xin x�c nh�n c� �� nguy�n li�u trong <color=yellow>Khi�n V�n Phi Tinh Ph�<color> <color=yellow>"..Tb_goods_compose[goods_id][i][3].."<color>!")
			return
		end
	end
	--�ռ为�ؼ��
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--�ϳ��������ɾ�����
	for i = 2, getn(Tb_goods_compose[goods_id]) do
		SetTask((Tb_goods_compose[goods_id][i][1] + 653),(GetTask((Tb_goods_compose[goods_id][i][1] + 653))-Tb_goods_compose[goods_id][i][2]))
	end
	--��Ӧ��������
	if AddItem(2,1,Tb_goods_compose[goods_id][1][1],1) == 1 then
		Msg2Player("Ch�c m�ng b�n �� h�p th�nh 1"..Tb_goods_compose[goods_id][1][2].."!")
	end
end
--*****************************����Ԫ�ز�ѯ********************
function get_frag_num()
	Talk(1,"OnUse","<color=green>G�i �<color>: T�nh tr�ng hi�n t�i m�nh v� trong <color=yellow>Khi�n V�n Phi Tinh Ph�<color> l�: \n s� l��ng <color=yellow>Gi�p M�c D��ng<color> <color=yellow>"..GetTask(1221).."<color>\n s� l��ng <color=yellow>�t M�c �m<color>: <color=yellow>"..GetTask(1222).."<color>\n s� l��ng <color=yellow>B�nh H�a D��ng<color> <color=yellow>"..GetTask(1223).."<color>\n s� l��ng <color=yellow>�inh H�a D��ng<color>: <color=yellow>"..GetTask(1224).."<color>")
end
--**************************������ʣ��������ѯ*****************
function get_att_num()
	Talk(1,"OnUse","<color=green>G�i �<color>: Hi�n t�i s� l��ng t�a �� L�u tinh trong <color=yellow>Khi�n V�n Phi Tinh Ph�<color> l�: <color=yellow>"..GetTask(Frag_att_num_TaskID).."<color>!")
end
--**************************���ǲɼ�˵��************************
function get_att_info()
	Talk(2,"get_att_info_1",	"<color=green>G�i �<color>: T�c d�ng c�a <color=yellow>Nhi�m v� Phu th�<color> l� nh�n ���c <color=yellow>B�o v�t Phu th�<color>, c� <color=yellow>2 b��c<color> �� ��t ���c b�o v�t .<color=yellow> B��c 1<color> nh�n ���c <color=yellow>m�nh L�u tinh<color> trong r�ng; <color=yellow>B��c 2<color> d�ng nh�ng m�nh n�y <color=yellow>h�p th�nh B�o v�t Phu th�<color>.",
					"<color=green>G�i �<color>: �a s� <color=yellow>Ngo�i th�nh<color> ��u c� L�u tinh r�i xu�ng, b�n ��ng ng�i th� s� d�ng <color=yellow>Khi�n V�n Phi Tinh Ph�<color>, xem n�i n�o c� m�nh L�u tinh. <color=yellow>M�nh L�u tinh<color> t�m ���c � <color=yellow>m�i khu v�c<color> kh�ng gi�ng nhau, <color=green>khu v�c c� ��ng c�p c�ng cao th� c� th� t�m ���c to�i phi�n c� ��ng c�p c�ng cao<color>."
		)
end
function get_att_info_1()
	Talk(1,"OnUse","<color=green>G�i �<color>: Nhi�m v� Phu th� y�u c�u <color=yellow>phu th� ph�i t� ��i<color>, kh�ng c� ng��i kh�c trong ��i. Sau �� 1 ng��i d�ng Khi�n V�n Phi Tinh Ph� kh�i x��ng Nhi�m v� Phu th�, <color=yellow>M�i ng��i c� th� nh�n ���c m�t n�a ��a �i�m t�a �� L�u tinh<color>. <color=red>Ch�ng nh�n ���c t�a �� X, v� nh�n ���c t�a �� Y<color>. <color=yellow>Ng��i d�ng Khi�n V�n Phi Tinh Ph�<color> t�y � th�c hi�n 1 <color=yellow>��ng t�c<color> trong t�a �� m�nh �� nh�n ���c <color=yellow>m�nh L�u tinh<color>. Ch� �: <color=yellow>khi nh�n t�a �� m�nh v�, ph�i l� ��i v� ch�ng , c�ng � trong 1 khu v�c<color>, kh�ng ���c gia nh�p ��i kh�c."
		)
end
--**************************ͬ��ֵ˵��***********************
function same_heart_value_info()
	Talk(2,"same_heart_value_info_2",	"<color=green>G�i �<color>: <color=yellow>Tr� s� ��ng t�m<color> t��ng tr�ng cho t�nh c�m v� ch�ng, t�nh c�m v� ch�ng c�ng s�u n�ng <color=yellow>�i�m Tr� s� ��ng t�m<color> c�ng cao. S� d�ng <color=yellow>Khi�n V�n Phi Tinh Ph�<color> h�p th�nh <color=yellow>��ng T�m ��n<color>, <color=yellow>��i ��ng T�m ��n<color>, <color=yellow>��ng T�m Ho�n<color>, <color=yellow>��i ��ng T�m Ho�n<color> ��u c� th� l�m t�ng Tr� s� ��ng t�m",
					"<color=green>G�i �<color>: T�c d�ng c�a <color=yellow>��ng T�m ��n<color> v� <color=yellow>��i ��ng T�m ��n<color> l� <color=green>t�ng gi�i h�n Tr� s� ��ng t�m<color>, <color=yellow>��ng T�m Ho�n<color> v� <color=yellow>��i ��ng T�m Ho�n<color> l�m t�ng <color=green>�i�m Tr� s� ��ng t�m<color>. S� d�ng ph�i h�p m�y lo�i ��ng T�m ��n n�y s� li�n t�c t�ng Tr� s� ��ng t�m l�n ��n <color=green>5000<color>."
	)
end
function same_heart_value_info_2()
	Talk(2,"OnUse",	"<color=green>G�i �<color>: Tr� s� ��ng t�m <color=green>d��i 500<color>: ��i v� ch�ng T�n H�n Y�n Nh�, Tr� s� ��ng t�m s� kh�ng ng�ng t�ng tr��ng, ch� c� qua 1 ng�y s� gi�m 4 �i�m, ch� c�n Tr� s� ��ng t�m <color=green>v��t qua 500<color> s� kh�ng t�ng theo th�i gian n�a, ph�i h�p th�nh ��ng T�m ��n ��ng T�m Ho�n �� gia t�ng. M�i tu�n gi�m <color=green>6%<color>; m�t khi <color=green>v��t qu� 2000<color>, Tr� s� ��ng t�m gi�m <color=green>12%<color> m�i tu�n",
					"<color=green>G�i �<color>: T�t c� <color=yellow>k� n�ng Phu th�<color> ��u ph�t huy t�c d�ng theo t�nh c�m v� ch�ng, n�u <color=yellow>Tr� s� ��ng t�m<color> kh�ng ��t t�i �i�m nh�t ��nh s� <color=yellow>kh�ng ph�t huy ���c<color> c�c k� n�ng ��. C� k� n�ng <color=yellow>c�n c� v�o m�c cao th�p c�a Tr� s� ��ng t�m ph�t huy s�c m�nh<color>. �� k� n�ng Phu th� c�ng m�nh. Ph�i n� l�c n�ng cao <color=yellow>Tr� s� ��ng t�m<color>."
		)
end
