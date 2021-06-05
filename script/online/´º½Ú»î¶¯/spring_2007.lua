--�ű����ܣ�2007�괺�ڻ
--�ű��������Թ�
--�ű��漰����ID��������1275-����������
Include("\\script\\online\\zgc_public_fun.lua")
--2007�괺�ڻTaskID��¼
TaskID_spring2007_pig_color =976
TaskID_spring2007_pig_sex = 977
TaskID_spring2007_pig_level = 978
TaskID_spring2007_pig_feedtime = 979
TaskID_spring2007_pig_handtime = 980
TaskID_spring2007_pig_borntotal = 981
TaskID_spring2007_pig_bornseq = 982
TaskID_spring2007_pig_bornnumtoday = 983
TaskID_spring2007_pig_backcode1 = 984
TaskID_spring2007_pig_backcode2 = 985
--2007�괺�ڻʱ������
spring_2007_date_min = 13552
spring_2007_date_max = 13569
--***************************��Ʒʹ��������****************************
function OnUse(goods_index)
	if Zgc_pub_action_level_chk() ~= 1 then		--�ȼ��ж�
		return
	end
	if zspring_2007_date_chk() ~= 1 then		--�ʱ���ж�
		return
	end
	local goods_id = GetItemParticular(goods_index)
	Msg2Player(goods_id)
	if goods_id >= 546 and goods_id <= 551 then		--����
		--test
		--�޸�Ϊ�����������Ƿ��и�����
		if GetTask(TaskID_spring2007_pig_color) == nil or GetTask(TaskID_spring2007_pig_color) == 0 then
			pig_baby_use(goods_id)
		else
			Talk(1,"end_dialog","Ng��i �� c� Pet r�i, mu�n g�i l�i Pet m�i ph�i d�ng XXX ph�ng th�ch!")
		end
	elseif goods_id == 552 then						--�ͷ���������
		Say("D�ng v�t ph�m <color=red>ph�ng th�ch<color> pet, sau �� g�i l�i pet m�i.",
		2,
		"��i/pig_delete_chk",
		"�� ta suy ngh� l�i/end_dialog")
	elseif goods_id == 553 then						--������			--test:�����жϲ��㡣�����⡣
		local dialog_pig = {}				--���ǷŻ����յĶԻ�
		if GetFollower() == 0 then
			dialog_pig[1] = "Ta mu�n ��a th� c�ng/pig_out"
			dialog_pig[2] = "R�i kh�i/end_dialog"
		else
			local follower_name = GetNpcName(GetFollower())
			if  follower_name ~= "��ng Ca Minh" and follower_name ~= "Chung Th�" then
				dialog_pig[1] = "Ta mu�n thu h�i th� c�ng/pig_in"
				local pig_level = GetTask(978)
				if pig_level ~= 4 then
					local pig_foods = {"10 b�nh ng�","20 m�n th�u"," 50 B�nh x�p"}
					dialog_pig[2] = "Ta mu�n ch�m s�c th� c�ng (c�n"..pig_foods[pig_level]..")/pig_feed"
				else
					dialog_pig[2] = "Ta c�n th� c�ng/pig_use"
				end
			else
				Talk(1,"end_dialog","Ho�n th�nh nhi�m v�"..follower_name.."m�i c� th� g�i th� c�ng")
				return
			end
			dialog_pig[3] = "Ta c�n ��t t�n cho th� c�ng/pig_rename"
			dialog_pig[4] = "R�i kh�i/end_dialog"
		end
		Say("Xin l�a ch�n nh�ng ��ng t�c cho th� c�ng:",
			getn(dialog_pig),
			dialog_pig
		)
	end	
end
--*************************������ʹ��********************************
function pig_baby_use(goods_id)						--������ʹ��
	if goods_id == 546 then
		Say("S� d�ng v�t ph�m n�y c� th� g�i ���c th� c�ng m�u s�c t�y �, ng��i ��ng � ch�?",
		2,
		"Ta ��ng �/#pig_create(0,0,"..goods_id..")",		--�Ա���ɫ����Ʒ����
		"�� ta suy ngh� l�i/end_dialog")		
	elseif goods_id == 547 then
		Say("S� d�ng v�t ph�m n�y c� th� g�i H�c tr�, ng��i ��ng � ch�?",
		2,
		"Ta ��ng �/#pig_create(1,0,"..goods_id..")",
		"�� ta suy ngh� l�i/end_dialog")
	elseif goods_id == 548 then
		Say("S� d�ng v�t ph�m n�y c� th� g�i ���c B�ch tr�, ng��i ��ng � ch�?",
		2,
		"Ta ��ng �/#pig_create(2,0,"..goods_id..")",
		"�� ta suy ngh� l�i/end_dialog")
	elseif goods_id == 549 then
		Say("S� d�ng v�t ph�m n�y c� th� g�i th� c�ng _H�c tr�, ng��i ��ng � s� d�ng kh�ng?",
		3,
		"Ta mu�n g�i th� c�ng_H�c Tr� (b�)/#pig_create(1,1,"..goods_id..")",
		"Ta mu�n g�i th� c�ng_H�c Tr� (m�)/#pig_create(1,2,"..goods_id..")",
		"�� ta suy ngh� l�i/end_dialog")
	elseif goods_id == 550 then
		Say("s� d�ng v�t ph�m n�y c� th� g�i th� c�ng_B�ch tr�, ng��i ��ng � ch�?",
		3,
		"Ta mu�n g�i th� c�ng_B�ch Tr� (b�)/#pig_create(2,1,"..goods_id..")",
		"Ta mu�n g�i th� c�ng_B�ch Tr� (m�)/#pig_create(2,2,"..goods_id..")",
		"�� ta suy ngh� l�i/end_dialog")
	elseif goods_id == 551 then
		Say("S� d�ng v�t ph�m n�y c� th� g�i ���c Ho�ng kim tr�, ng��i ��ng � ch�?",
		3,
		"Ta mu�n g�i Ho�ng kim tr� (b�)/#pig_create(3,1,"..goods_id..")",
		"Ta mu�n g�i Ho�ng kim tr� (m�)/#pig_create(3,2,"..goods_id..")",
		"�� ta suy ngh� l�i/end_dialog")
	end
end
--*****************************ι������******************************
function pig_feed()
	local feed_distance = (GetTime() - GetTask(TaskID_spring2007_pig_feedtime))
	if feed_distance < 3600 then
		Talk(1,"end_dialog","Ng��i mu�n cho th� c�ng b�i th�c �? C�n"..Zgc_pub_time_sec_change(feed_distance,1).." m�i c� th� cho �n!")
		return
	end
	local pig_level = GetTask(TaskID_spring2007_pig_level)
	local pig_foods = {	{1,1,1,10,"10","B�nh Ng�"},
						{1,1,3,20,"20","M�n th�u"},
						{1,1,4,50," 50 ","B�nh x�p"}}
	if GetItemCount(pig_foods[pig_level][1],pig_foods[pig_level][2],pig_foods[pig_level][3]) < pig_foods[pig_level][4] then
		Talk(1,"end_dialog","<color=red>"..pig_foods[pig_level][6].." H�nh nh� kh�ng �� "..pig_foods[pig_level][5].."�?")
		return
	end
	if DelItem(pig_foods[pig_level][1],pig_foods[pig_level][2],pig_foods[pig_level][3],pig_foods[pig_level][4]) ~= 1 then
		Talk(1,"end_dialog","<color=red>"..pig_foods[pig_level][6].." H�nh nh� kh�ng �� "..pig_foods[pig_level][5].."�?")
		return		
	else
		SetTask(978,(pig_level + 1))
		pig_create_rtn(GetNpcName(GetFollower()))
	end
end
--*************************�����Ĵ���********************************
function pig_create(pig_color,pig_sex,goods_id)
	SetTask(TaskID_spring2007_pig_color,pig_color)			--�����ɫ
	SetTask(TaskID_spring2007_pig_sex,pig_sex)			--����Ա�
	SetTask(TaskID_spring2007_pig_level,1)					--��ĵȼ�
	SetTaskTemp(165,goods_id)
	--��ɾ��Ŀǰ�ĸ��裬Ȼ������µĸ��裬����976�м�¼�¸�����Ϣ
	AskClientForString("pig_create_rtn","",0,16,"Xin nh�p t�n c�a th� c�ng")
end
--****************************�ջ�����*******************************
function pig_in()
	KillFollower()
	Talk(1,"end_dialog","Th� c�ng c�a b�n �� thu h�i, c� th� m� B�o �i�n ra �� g�i l�i.")
end
--****************************�ų�����*******************************
function pig_out()
	AskClientForString("pig_create_rtn","",0,16,"Xin nh�p t�n c�a th� c�ng")
end
--****************************������������***************************
function pig_rename()
	AskClientForString("pig_create_rtn","",0,16,"Xin nh�p l�i t�n th� c�ng")
end
--****************************�����Ĵ����ص�*************************
function pig_create_rtn(pig_name)
	--if GetNpcName(GetFollower()) ~= "" then			--test
	--	Talk(1,"end_dialog","��Ŀǰ�Ѿ�����һ�����裬�������������ٻ�������")
	--	return
	--end
	--**************************���ֹ���****************************
	local pigname_forbid_chr = {"C�u","B�","Qu�n","L�i","Qu�n","Kim S�n","ch�n","Tuy�t","JS","��ng Ca Minh","Chung Th�"}
	for i = 1,getn(pigname_forbid_chr) do
		local startS,endS = strfind(pig_name,pigname_forbid_chr[i])
		if startS then
			Talk(1,"pig_rename","T�n c�a th� c�ng kh�ng ��ng, xin nh�p l�i!")
			return
		end
	end
	local pig_color = GetTask(TaskID_spring2007_pig_color)
	local pig_sex = GetTask(TaskID_spring2007_pig_sex)
	local pig_level = GetTask(TaskID_spring2007_pig_level)
	local goods_id = GetTaskTemp(165)
	if DelItem(2,0,goods_id,1) ~= 1 then					--�ж�ɾ�������Ƿ�ɹ�
		Talk(1,"end_dialog","Xin x�c nh�n trong h�nh trang c�a b�n c� th� c�ng <color=red>Ti�u Tr�<color>!")
		return
	end
	local pig_table = {			--�ĸ��ȼ�����
		{{"S�t th�10","S�t th�11"},{"S�t th�12","S�t th�13"},{"S�t th�14","S�t th�15"}},
		{{"S�t th�20","S�t th�21"},{"S�t th�22","S�t th�23"},{"S�t th�24","S�t th�25"}},
		{{"S�t th�30","S�t th�31"},{"S�t th�32","S�t th�33"},{"S�t th�34","S�t th�35"}},
		{{"S�t th�40","S�t th�41"},{"S�t th�42","S�t th�43"},{"S�t th�44","S�t th�45"}},
	}
	if pig_sex == 0 then
		pig_sex = random(1,2)
	end
	if pig_color == 0 then
		pig_color = random(1,2)
	end
	SetTask(976,pig_color)
	SetTask(977,pig_sex)
	SetTask(979,GetTime())
	SummonNpc(pig_table[pig_level][pig_color][pig_sex],pig_name)
end
--**************************������ɾ����ʾ***************************
function pig_delete_chk()
	Say("B�n x�c ��nh s� d�ng v�t ph�m n�y?",
	2,
	"��i/pig_delete_determine",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--**************************������ɾ��*******************************
function pig_delete_determine()
	if GetItemCount(2,0,552) == 0 then
		Talk(1,"end_dialog","Xin x�c nh�n b�n c� XXX!")  --test
		return
	end
	if DelItem(2,0,552,1) ~= 1 then
		Talk(1,"end_dialog","Xin x�c nh�n b�n c� XXX!")  --test
		return		
	end
	--ɾ������
	KillFollower()
	for i = 974,979 do
		SetTask(i,0)
	end
end
--***********************��С��Ĵ�������******************************
function pig_born_timer()
	local time_distance = GetTime() - GetTask(TaskID_spring2007_pig_handtime)
	if (time_distance + 56) < 600 then			--��������ʱ�仹û�е��������
		return
	end
	if time_distance > 600 then					--��������ʱ���Ѿ������ˣ�����Ĵ���
		RemoveTrigger(GetTrigger(900))
		return
	end
	local player_index_ask = PlayerIndex		--�����˵�����
	local player_pig_sex_ask = GetTask(TaskID_spring2007_pig_sex)		-- 1Ϊ����2Ϊĸ
	local player_pig_level_ask = GetTask(TaskID_spring2007_pig_level)
	local Player_hand_start_time_ask = GetTask(TaskID_spring2007_pig_handtime)
	
	if GetInteractivePlayerIndex() <= 0 then
		RemoveTrigger(GetTrigger(900))
		return
	end
	PlayerIndex = GetInteractivePlayerIndex()	--�����˵�����
	local player_index_accept = PlayerIndex		
	local player_pig_sex_accept = GetTask(TaskID_spring2007_pig_sex)
	local player_pig_level_accept = GetTask(TaskID_spring2007_pig_level)
	local Player_hand_start_time_accept = GetTask(TaskID_spring2007_pig_handtime)
	
	PlayerIndex = player_index_ask
	
	if Player_hand_start_time_accept - Player_hand_start_time_ask > 1 then
		RemoveTrigger(GetTrigger(900))
		return
	end
	
	if (player_pig_sex_ask + player_pig_sex_accept) ~= 3 then
		RemoveTrigger(GetTrigger(900))
		return
	end
	if (palyer_pig_level_ask + player_pig_level_accept) ~= 8 then
		RemoveTrigger(GetTrigger(900))
		return
	end
	--�ҵ�ĸ�������ڵ���ң��������Ƿ�������������޵��ж�
	if player_pig_sex_accept == 1 then									--�ҵ�Я��ĸ��������ң��ж����������޵�������
		PlayerIndex = player_index_ask
		if GetTask(TaskID_pig_born_date) > zgc_pub_day_turn(1) then
			return
		elseif GetTask(TaskID_pig_born_date) == zgc_pub_day_turn(1) and GetTask(TaskID_pig_born_num_today) >= 2 then
			return
		end
		if GetTask(TaskID_pig_born_num_total) >= 6 then
			return
		end
	end	
	--���ǰ��ĸ��Я���˵����ݴ���
	if GetTask(TaskID_spring2007_pig_bornseq) < zgc_pub_day_turn(1) then
		SetTask(TaskID_pig_born_date,zgc_pub_day_turn(1))
		SetTask(TaskID_spring2007_pig_bornnumtoday,1)
	else
		SetTask(TaskID_spring2007_pig_bornnumtoday,2)
	end
	SetTask(TaskID_spring2007_pig_borntotal,(GetTask(TaskID_spring2007_pig_borntotal) + 1))
	--�����޵�����
	PlayerIndex = player_index_ask
	local pig_ID = random(546,560)
	if random(1,10) > 5 then
		local add_flag = AddItem(2,0,pig_ID,1)
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Ti�u Tr�")
			local player_name = GetName()
			PlayerIndex = player_index_accept
			Msg2Player("Ch�c m�ng b�n v�"..player_name.."Nh�n ���c 1 Ti�u Tr�!")
		else
			--д��־
		end
	else
		PlayerIndex = player_index_accept
		local player_name = GetName()
		local add_flag = AddItem(2,0,pig_ID,1)
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Ti�u Tr�")
			local player_name = GetName()
			PlayerIndex = player_index_ask
			Msg2Player("Ch�c m�ng b�n v�"..player_name.."Nh�n ���c 1 Ti�u Tr�!")
		else
			--д��־
		end
	end
	PlayerIndex = player_index_ask
end
