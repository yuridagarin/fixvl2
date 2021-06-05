--�ű����ܣ�2007�괺�ڻ
--�ű��������Թ�
--�ű��漰����ID��������1275-����������
Include("\\script\\online\\zgc_public_fun.lua")
--2007�괺�ڻTaskID��¼
TaskID_spring2007_pig_color =976
TaskID_spring2007_pig_sex = 977

TaskID_spring2007_create_time = 978

TaskID_spring2007_pig_feedtime = 979
TaskID_spring2007_pig_handtime = 980
TaskID_spring2007_pig_borntotal = 981
TaskID_spring2007_pig_bornseq = 982
TaskID_spring2007_pig_bornnumtoday = 983
TaskID_spring2007_pig_backcode1 = 984
TaskID_spring2007_pig_backcode2 = 985
Goods_Id_feed_pig_book = 615
Goods_Id_pig_ran_color_sex = 616
Goods_Id_pig_black_ran_sex = 618
Goods_Id_pig_white_ran_sex = 620
Goods_Id_pig_any_color_sex = 622
Goods_Id_golden_pig = 624
Goods_Id_catch_pig_stick = 626
--***************************��Ʒʹ��������****************************
function OnUse(goods_index)
	if zgc_pub_day_turn(1) > 13576 then			--�ʱ���ж�
		return
	end
	local goods_id = GetItemParticular(goods_index)
	if goods_id == Goods_Id_feed_pig_book then
		pig_book_use()
	else
		pig_baby_use(goods_id)
	end
end
--*************************������ʹ��********************************
function pig_baby_use(goods_id)					--������ʹ��
	if goods_id == Goods_Id_pig_ran_color_sex then
		Say("S� d�ng v�t ph�m n�y c� th� g�i ���c th� c�ng m�u s�c t�y �, ng��i ��ng � ch�?",
		2,
		"Ta ��ng �/#pig_create(0,0,"..goods_id..")",		--�Ա���ɫ����Ʒ����
		"�� ta suy ngh� l�i/end_dialog")		
	elseif goods_id == Goods_Id_pig_black_ran_sex then
		Say("S� d�ng v�t ph�m n�y c� th� g�i H�c tr�, ng��i ��ng � ch�?",
		2,
		"Ta ��ng �/#pig_create(1,0,"..goods_id..")",
		"�� ta suy ngh� l�i/end_dialog")
	elseif goods_id == Goods_Id_pig_white_ran_sex then
		Say("S� d�ng v�t ph�m n�y c� th� g�i ���c B�ch tr�, ng��i ��ng � ch�?",
		2,
		"Ta ��ng �/#pig_create(2,0,"..goods_id..")",
		"�� ta suy ngh� l�i/end_dialog")
	elseif goods_id == Goods_Id_pig_any_color_sex then
		Say("S� d�ng v�t ph�m n�y c� th� g�i ���c th� c�ng t�y �, ng��i ��ng � ch�?",
		5,
		"Ta mu�n g�i B�ch Tr� (b�)/#pig_create(2,1,"..goods_id..")",
		"Ta mu�n g�i B�ch Tr� (m�)/#pig_create(2,2,"..goods_id..")",		
		"Ta mu�n g�i H�c tr� (b�)/#pig_create(1,1,"..goods_id..")",
		"Ta mu�n g�i H�c tr� (m�)/#pig_create(1,2,"..goods_id..")",
		"�� ta suy ngh� l�i/end_dialog")
	elseif goods_id == Goods_Id_golden_pig then
		Say("S� d�ng v�t ph�m n�y c� th� g�i ���c Ho�ng kim tr�, ng��i ��ng � ch�?",
		3,
		"Ta mu�n g�i Ho�ng kim tr� (b�)/#pig_create(3,1,"..goods_id..")",
		"Ta mu�n g�i Ho�ng kim tr� (m�)/#pig_create(3,2,"..goods_id..")",
		"�� ta suy ngh� l�i/end_dialog")
	end
end
--*************************�������ʹ��******************************
function pig_book_use()
	if GetFollower() == 0 or GetFollower() == nil then
		Say("Ng��i mu�n th� c�ng c� nh�ng ��ng t�c g�?",
		2,
		"Ta mu�n ��a th� c�ng/pig_out",
		"R�i b�o �i�n/end_dialog")
	else
		Say("Ng��i mu�n th� c�ng c� nh�ng ��ng t�c g�?",
		2,
		"Ta mu�n thu h�i th� c�ng/pig_in",
		"R�i b�o �i�n/end_dialog")
	end
end
--*************************�ջ�����*********************************
function pig_in()
	KillFollower()
	Talk(1,"","B�n �� thu h�i ���c th� c�ng, sau n�y c� th� m� B�o �i�n ra �� g�i l�i.")
end
--*************************�����Ĵ���********************************
function pig_create(pig_color,pig_sex,goods_id)
	SetTask(TaskID_spring2007_pig_color,pig_color)			--�����ɫ
	SetTask(TaskID_spring2007_pig_sex,pig_sex)			--����Ա�
	SetTaskTemp(165,goods_id)
	--��ɾ��Ŀǰ�ĸ��裬Ȼ������µĸ��裬����976�м�¼�¸�����Ϣ
	AskClientForString("pig_create_rtn","",0,16,"Xin nh�p t�n c�a th� c�ng")
end
--****************************�ų�����*******************************
function pig_out()
	local pig_clolor = GetTask(TaskID_spring2007_pig_color)
	local pig_sex = GetTask(TaskID_spring2007_pig_color)
	if pig_clolor == 0 or pig_sex == 0 then
		Talk(1,"","B�n kh�ng c� th� c�ng!")
		return
	end
	AskClientForString("pig_out_rtn","",0,16,"Xin nh�p t�n c�a th� c�ng")
end
--********************************�����Ĵ���**************************
function pig_create_rtn(pig_name)
	if pig_name == "" then
		Talk(1,"","T�n c�a th� c�ng kh�ng th� b� tr�ng!")
		return
	end
	if pig_name_chk(pig_name) == 0 then
		return
	end
	local goods_id = GetTaskTemp(165)
	if DelItem(2,0,goods_id,1) ~= 1 then					--�ж�ɾ�������Ƿ�ɹ�
		Talk(1,"end_dialog","Xin x�c nh�n trong h�nh trang c�a b�n c� th� c�ng <color=red>Ti�u Tr�<color>!")
		return
	end
	local pig_diff = pig_crt(pig_name)
	if pig_diff ~= 0 then
		SetTask(TaskID_spring2007_create_time,GetTime())
		AddItem(2,0,615,1)
		Talk(1,"","Ch�c m�ng b�n �� g�i ���c m�t <color=green>"..pig_diff.."<color>, v� nh�n ���c m�t quy�n B�o �i�n")
	end
end
--****************************�����ų�*******************************
function pig_out_rtn(pig_name)
	if pig_name_chk(pig_name) == 0 then
		return
	end
	local pig_diff = pig_crt(pig_name)
	if pig_diff ~= 0  then
		Talk(1,"","B�n �� g�i ���c <color=green>"..pig_diff.."<color>!")
	end
end
--****************************�����Ĵ����ص�*************************
function pig_crt(pig_name)
	local pig_color = GetTask(TaskID_spring2007_pig_color)
	local pig_sex = GetTask(TaskID_spring2007_pig_sex)
	local pig_level = 1
	local pig_table = {			--�ĸ��ȼ�����
		{{"Ti�u H�c tr� (b�)","Ti�u H�c tr� (m�)"},{"Ti�u B�ch tr� (b�)","Ti�u B�ch tr� (m�)"},{"Ti�u Kim tr� (b�)","Ti�u Kim tr� (m�)"}},
	}
	if pig_sex == 0 then
		pig_sex = random(1,2)
	end
	if pig_color == 0 then
		pig_color = random(1,2)
	end
	SetTask(976,pig_color)
	SetTask(977,pig_sex)
	SummonNpc(pig_table[pig_level][pig_color][pig_sex],pig_name)
	return pig_table[pig_level][pig_color][pig_sex]
end
--**************************���������ּ��**************************
function pig_name_chk(pig_name)
	if pig_name == "" then
		Talk(1,"","T�n c�a th� c�ng kh�ng th� b� tr�ng!")
		return 0
	end
	--**************************���ֹ���****************************
	local pigname_forbid_chr = {"C�u","B�","Qu�n","L�i","Qu�n","Kim S�n","ch�n","Tuy�t","JS","��ng Ca Minh","Chung Th�"}
	for i = 1,getn(pigname_forbid_chr) do
		local startS,endS = strfind(pig_name,pigname_forbid_chr[i])
		if startS then
			Talk(1,"pig_rename","T�n c�a th� c�ng kh�ng ��ng, xin nh�p l�i!")
			return 0
		end
	end
	
end
