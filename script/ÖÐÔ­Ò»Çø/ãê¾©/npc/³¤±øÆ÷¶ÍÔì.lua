-- =========================================
-- File : ��ԭһ�����꾩������������.lua
-- Name : Ī��
-- ID   : 1, 2

--�峤��2007-06-25����IB�汾���׵���װת����ع���
--�߻��ˣ�С����
--���뿪���ˣ��峤
--�����޸ļ�¼��2008-02-26���׵�װת���޸�λ���ÿ���

-- =========================================
Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua")
Include("\\script\\task\\lingshi_task.lua")
--==============================�׵���װ���===============================
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
task_start_date = 20080128				--�һ����ʼ����
task_end_date = 20080218					--�һ���������
TaskID_yandi_chg_num = 1288
--������Ҫ�����б�
Tb_refound_mertiral = {
	{
	{2,1,504,4,"N� Oa Tinh Th�ch"},
	{2,0,555,2,"C�n Kh�n ph�"},
	{2,1,503,5,"V� Ng�n Th�y"},
	{2,1,1009,100,"Thi�n Th�ch Tinh Th�ch"},
	{2,1,1145,1,"B�n v� Ch� t�o Vi�m ��"},
	},
	{
		{2,1,504,4,"N� Oa Tinh Th�ch"},
		{2,0,555,2,"C�n Kh�n ph�"},
		{2,1,503,5,"V� Ng�n Th�y"},
		{2,1,1009,200,"Thi�n Th�ch Tinh Th�ch"},
		{2,1,1190,1,"B�n v� Ch� t�o Ho�ng ��"},
	},
}
--������Ҫװ���б�
Tb_refound_att = {}
Tb_refound_att[0]	= {0,103,8000,"Vi�m �� kh�i"}
Tb_refound_att[1]	= {0,100,8000,"Vi�m �� gi�p"}
Tb_refound_att[3]	= {0,101,8000,"Vi�m �� trang"}
--�׻�������Ϣ
Tb_yanhuang_stone = {2,1,1146,"Vi�m Ho�ng Thi�t H�n"}
--�����Ӧ�ĶԻ���Ϣ
Tb_refound_get_dia = {
	{
		"Vi�m �� gi�p","","Vi�m �� trang"
	},
	{	
		"","Hi�n Vi�n v� kh�","","Hi�n Vi�n Chi�n","Hi�n Vi�n ��u",
	}
}
Tb_refound_get_dia[1][0] = "Vi�m �� kh�i"
--�Ƶ�װ��Ӧװ��
Tb_huandi_position = {1,2,3}
Tb_huandi_equip = {}
Tb_huandi_equip[2] = {
	{},
	{},
	{0,8,8803,"Hi�n Vi�n C�u Nh� Tr��ng"},
	{0,0,8804,"Hi�n Vi�n H�o Nhi�n Th�"},
	{},
	{0,1,8805,"Hi�n Vi�n ch�m v� h�nh"},
	{},
	{0,2,8806,"Hi�n Vi�n T� Tinh Ki�m"},
	{0,10,8807,"Hi�n Vi�n Ph�ng Ho�ng C�m"},
	{},
	{0,0,8808,"Hi�n Vi�n Ng� Nh�c Th�"},
	{0,5,8809,"Hi�n Vi�n Ph� Thi�n C�n"},
	{},
	{0,2,8810,"Hi�n Vi�n H�ng Qu�n Ki�m"},
	{0,9,8811,"Hi�n Vi�n Sinh T� B�t"},
	{},
	{0,6,8812,"Hi�n Vi�n Ph� Qu�n Th��ng"},
	{0,4,8813,"Hi�n Vi�n Khai Thi�n Cung"},
	{},
	{0,7,8814,"Hi�n Vi�n �m D��ng Nh�n"},
	{0,11,8815,"Hi�n Vi�n U Minh Tr�o"},
}
Tb_huandi_equip[4] = {
	{},
	{0,102,8801,"Hi�n Vi�n Chi�n"},
	{0,102,8803,"Hi�n Vi�n Chi�n"},
	{0,102,8805,"Hi�n Vi�n Chi�n"},
	{},
	{0,102,8807,"Hi�n Vi�n Chi�n"},
	{},
	{0,102,8809,"Hi�n Vi�n Chi�n"},
	{0,102,8811,"Hi�n Vi�n Chi�n"},
	{},
	{0,102,8813,"Hi�n Vi�n Chi�n"},
	{0,102,8815,"Hi�n Vi�n Chi�n"},
	{},
 	{0,102,8817,"Hi�n Vi�n Chi�n"},
	{0,102,8819,"Hi�n Vi�n Chi�n"},
	{},
	{0,102,8821,"Hi�n Vi�n Chi�n"},
	{0,102,8823,"Hi�n Vi�n Chi�n"},
	{},
	{0,102,8825,"Hi�n Vi�n Chi�n"},
	{0,102,8827,"Hi�n Vi�n Chi�n"},
} 
Tb_huandi_equip[5] = {
  {},
  {0,102,8802,"Hi�n Vi�n ��u"},
  {0,102,8804,"Hi�n Vi�n ��u"},
  {0,102,8806,"Hi�n Vi�n ��u"},
  {},
  {0,102,8808,"Hi�n Vi�n ��u"},
  {},
  {0,102,8810,"Hi�n Vi�n ��u"},
  {0,102,8812,"Hi�n Vi�n ��u"},
  {},
  {0,102,8814,"Hi�n Vi�n ��u"},
  {0,102,8816,"Hi�n Vi�n ��u"},
  {},
  {0,102,8818,"Hi�n Vi�n ��u"},
  {0,102,8820,"Hi�n Vi�n ��u"},
  {},
  {0,102,8822,"Hi�n Vi�n ��u"},
  {0,102,8824,"Hi�n Vi�n ��u"},
  {},
  {0,102,8826,"Hi�n Vi�n ��u"},
  {0,102,8828,"Hi�n Vi�n ��u"},
}
Tb_huandi_sushao_weapon = {
	{0,3,8801,"Hi�n Vi�n To�i V� �ao"},
	{0,5,8802,"Hi�n Vi�n To�i V� C�n"},
}
Tb_equip_position_info = {}
Tb_equip_position_info[0] = {"Vi�m �� kh�i",1}
Tb_equip_position_info[1] = {"Vi�m �� gi�p",1}
Tb_equip_position_info[2] = {"Hi�n Vi�n v� kh�",2}
Tb_equip_position_info[3] = {"Vi�m �� trang",1}
Tb_equip_position_info[4] = {"Hi�n Vi�n Chi�n",2}
Tb_equip_position_info[5] = {"Hi�n Vi�n ��u",2}
Refound_level_max = 15			--����������ǿ����
--2007-11-19
--���ӻƵ�װ�����������ܣ�
Tb_refound_att_name ={"Trang b� Vi�m ��","Trang b� Ho�ng ��"}
Tb_refound_paper_info = {
	{1145,"B�n v� Ch� t�o Vi�m ��"},
	{1190,"B�n v� Ch� t�o Ho�ng ��"}
}
--================================����====================================
--*****************************************���峣����Ԥ����***************************************
ID_LEARNLIFESKILL		= 1925		-- �䷽ѧϰ�������
LEVELTASKID49			= 517		-- ������������
TASK49_BEGGING			= 1933		-- 49����������ʼ��ʾ
FORGETMAIN_NUM			= 1940		-- ���������ܴ���
FORGETOHTER_NUM			= 1941		-- ���������ܴ���
LEV_LEARNRECIPE			= 1926
HaveWeekend				= 9001		-- ��ĩ�䷽ѧϰ�������
strName = "";
strTitle = "";

--*****************************************MAIN����*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","�� qu� 5 gi� ch�i, h�y ngh� ng�i �� gi� g�n s�c kh�e!")
	 	return
	 end
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Tuy ng��i c� th� theo ta h�c c�ch ch� t�o trang b� c� linh kh�, nh�ng mu�n t�m hi�u trang b� B�t Qu�i, ng��i n�n �i t�m ng��i c�a C�ng D� Th� Gia!");
	end;
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	-----------------------------------------��������-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
		Say(strTitle.."��n <color=yellow>C�p 10<color> c� th� ��n <color=yellow>Th�nh ��<color> g�p <color=yellow>Du Ph��ng ��i phu<color> t�m hi�u <color=yellow>k� n�ng s�ng<color>!",0)
		TaskTip("��n c�p 10 c� th� ��n Th�nh �� t�m Du Ph��ng ��i phu.")        
		return 
	end
	---------------------------------------------���Ի�-------------------------------------------
	--local date_now = zgc_pub_date_num()
	--if date_now >= task_start_date and date_now <= task_end_date then
		local strtab = {
--		"�׵�װ���ͻƵ�װ�����������/yandi_chg_dia_main",
		"Nh�ng �i�u li�n quan v� r�n binh kh� d�i/old_dia",
--		"Nh�ng �i�u li�n quan v� trang b� B�t Qu�i/bagua",
		"H�c c�ch l�m v� kh� linh kh� c�p 76/xinwuqi"
		}
		if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
			tinsert(strtab,"ti�p t�c nhi�m v� h�c t�p Linh Th�ch B�t Qu�i/task_new3");
		end
		if GetLifeSkillMaxLevel(1, 2) == 79 then
			tinsert(strtab, "Mu�n h�ck� n�ng cao c�p h�n/update_max_skill_level");
		end 
		tinsert(strtab,"R�i kh�i/SayHello")
		Say("Ta t�n M�c ��i, truy�n nh�n ��i th� 73 c�a Can T��ng M�c T�, s� tr��ng r�n c�c lo�i v� kh� Th�n Binh, nh�t l� nh�ng binh kh� d�i nh�: c�n, tr��ng. Trong thi�n h� kh�ng th� t�m ra ng��i th� hai. V�i l�i g�n ��y ta ph�t hi�n ra ph��ng ph�p ch� t�o <color=red>trang b� Vi�m ��<color> nh� trong truy�n thuy�t n�i, ng��i c� mu�n nghe kh�ng?",
			getn(strtab),
			strtab)
	--else
	--	Say("<color=green>Ī��<color>�����Ǹɽ�Īа�ĵ���ʮ�������ˣ�Ī���ó����������������������ǳ��������죬��������ȡ������޳����ң���ʲô���ܰ�æ��ģ����������Щ���У����԰�����Щ�׵�װ�����������������Ҫ�Ļ�������ϸ�����ɡ�",
	--	    3,
	--	    "�׵�װ�����������/yandi_att_chg",
	--	    "������������������/old_dia",
	--	    "�뿪/SayHello")
	--end
end

--============================================�׵�װת���Ի�����====================================
--�׵�װ�����Ի�
function yandi_chg_dia_main()
	Say("<color=red>Trang b� Vi�m �� v� trang b� Ho�ng ��<color> l� v�t ph�m phi ph�m, ta nghi�n c�u c� ��i ph�t hi�n ra n�u th�m 1 v�i nguy�n li�u, s� ��c 1 <color=yellow>trang b� Vi�m �� ho�c trang b� Ho�ng ��<color> th�nh 1 <color=yellow>trang b� Vi�m �� ho�c trang b� Ho�ng ��<color> kh�c, t�nh n�ng ���c t�ng c�p. N�u kh�ng mu�n ti�u hao<color=yellow>trang b� Vi�m �� ho�c trang b� Ho�ng ��<color>, th� c� th� xem qua, c� m�t s�<color=yellow>Vi�m Ho�ng Thi�t H�n<color> trong cung. Ta �� t�m ra c�ch thay ��i<color=yellow>thu�c t�nh trang b� Vi�m ��<color>, c� th� chuy�n t�ng n�i ngo�i c�ng c�a<color=yellow>trang b� Vi�m ��<color> th�nh t�ng s�t th��ng, nh�ng m�i ng��i ch� ��i ���c <color=red>1<color> l�n.",
	7,
	"Ta �� t�m �� nguy�n li�u, ta mu�n ��c trang b� Vi�m ��/#yandi_att_chk(1)",
	"Ta �� t�m �� nguy�n li�u, ta mu�n ��c trang b� Ho�ng ��/#yandi_att_chk(2)",
	"Ta mu�n l�y Vi�m �� Trang v� t�ng t�n c�ng gia c�ng th�nh t�ng s�t th��ng/yandi_att_chg",
	"Ta mu�n l�y 1 b�n v� Ch� t�oVi�m ��/#refound_paper_chg(1)",
	"Ta mu�n l�y 1 b�n v� Ch� t�o Ho�ng ��/#refound_paper_chg(2)",
	"Sau khi ch� t�o c� g� thay ��i/refuond_info",
	"��n h�i th�m th�i m�!/SayHello"
	)
end
-----------------------------------װ��ת��----------------------------
--���ϼ��
function yandi_att_chk(equip_diff)
	if equip_diff == 2 then
		if GetPlayerRoute() == 0 then
			Talk(1,"","Ta kh�ng th� gi�p ng��i ch�a nh�p m�n ph�i n�o ch� t�o <color=red>trang b� Ho�ng ��<color>!")
			return
		end
		if Tb_huandi_equip[4][GetPlayerRoute()] [1]== nil  then
		Talk(1,"","Ta kh�ng th� gi�p ng��i ch�a nh�p m�n ph�i n�o ch� t�o <color=red>trang b� Ho�ng ��<color>!")
		return
		end
	end
	--����Я�����
	if refound_mertiral_chk(equip_diff,1) ~= 1 then
		return
	end
	local equipment_num = 0
	local equipment_position = 0
	local yanhuang_stone_chk_flag = GetItemCount(Tb_yanhuang_stone[1],Tb_yanhuang_stone[2],Tb_yanhuang_stone[3])
	if yanhuang_stone_chk_flag ~= 0 then
		if equip_diff == 1 then
			Say("Ng��i mu�n d�ng <color=yellow>Vi�m Ho�ng Thi�t H�n<color> ��c th�nh g�?"..Tb_refound_att_name[equip_diff].."?",
			4,
			"Ta mu�n ��c"..Tb_refound_get_dia[equip_diff][0].."/#stone_chg_dtm("..equip_diff..",0)",
			"Ta mu�n ��c"..Tb_refound_get_dia[equip_diff][1].."/#stone_chg_dtm("..equip_diff..",1)",
			"Ta mu�n ��c"..Tb_refound_get_dia[equip_diff][3].."/#stone_chg_dtm("..equip_diff..",3)",
			"�� ta suy ngh� l�i/end_dialog"
			)
		else
			Say("Ng��i mu�n d�ng <color=yellow>Vi�m Ho�ng Thi�t H�n<color> ��c th�nh g�?"..Tb_refound_att_name[equip_diff].."?",
			4,
			"Ta mu�n ��c"..Tb_refound_get_dia[equip_diff][2].."/#stone_chg_dtm("..equip_diff..",2)",
			"Ta mu�n ��c"..Tb_refound_get_dia[equip_diff][4].."/#stone_chg_dtm("..equip_diff..",4)",
			"Ta mu�n ��c"..Tb_refound_get_dia[equip_diff][5].."/#stone_chg_dtm("..equip_diff..",5)",
			"�� ta suy ngh� l�i/end_dialog"
			)
		end
	else
		local sel_dia = {}
		for i = 0 ,getn(Tb_equip_position_info) do
			if Tb_equip_position_info[i][2] == equip_diff then
				tinsert(sel_dia,"Ta mu�n l�y  "..Tb_equip_position_info[i][1].." ��c/#refoud_dia("..i..")")
			end
		end
		tinsert(sel_dia,"�� ta suy ngh� l�i/end_dialog")
		Say("B�n mu�n l�y trang b� n�o <color=red>�ang mang tr�n ng��i<color> �� ch� t�o?",
			getn(sel_dia),
			sel_dia
		)
	end
end
--�׻�����ת��ȷ�϶Ի�
function stone_chg_dtm(equip_diff,part_diff)
	Say("B�n x�c nh�n mu�n l�y <color=yellow>Vi�m Ho�ngThi�t H�n<color> ��c 1 <color=red>"..Tb_refound_get_dia[equip_diff][part_diff].."<color> ch�?",
	2,
	"Ta x�c nh�n/#stone_chg("..equip_diff..","..part_diff..")",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--�׻����껻
function stone_chg(equip_diff,part_diff)
	if refound_mertiral_chk(equip_diff,1) ~= 1 then
		return
	end
	--�׻�����Я�����
	if GetItemCount(Tb_yanhuang_stone[1],Tb_yanhuang_stone[2],Tb_yanhuang_stone[3]) == 0 then
		Talk(1,"","H�y x�c nh�n ng��i c� �em <color=yellow>Vi�m Ho�ngThi�t H�n<color> theo!")
		return
	end
	--�ռ为�ؼ��
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end	
	--�������⴦��
	if GetPlayerRoute() == 2 and part_diff == 2 then
		Say("Ng��i mu�n ��c �ao hay ��c c�n?",
		3,
		"Ta mu�n ��c �ao/#huangdi_ws_weapon(1)",
		"Ta mu�n ��c c�n/#huangdi_ws_weapon(2)",
		"�� ta suy ngh� l�i/end_dialog"
		)
		return
	end
	--����Я�����
	if refound_mertiral_chk(equip_diff,2) ~= 1 then
		return
	end
	--�׻�����ɾ�����
	if DelItem(Tb_yanhuang_stone[1],Tb_yanhuang_stone[2],Tb_yanhuang_stone[3],1) ~= 1 then
		Talk(1,"","H�y x�c nh�n ng��i c� �em <color=yellow>Vi�m Ho�ngThi�t H�n<color> theo!")
		WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."Khi �ang x�a Vi�m Ho�ng Thi�t H�n nguy�n li�u kh�ng ��!")
		return
	end	
	--����װ��
	local add_flag = 0
	if equip_diff == 1 then		--�׵�
		add_flag =AddItem(Tb_refound_att[part_diff][1],Tb_refound_att[part_diff][2],(Tb_refound_att[part_diff][3]+GetBody()),1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			Talk(1,"","<color=yellow>"..Tb_refound_att[part_diff][4].."<color> ��c xong r�i, ng��i c� th� c�m v�!")
			WriteLog("��c trang b� Vi�m Ho�ng:"..GetName().."�� ��c xong 1 "..Tb_refound_att[part_diff][4])
		else
			WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."T�ng"..Tb_refound_att[part_diff][4].." th�t b�i, k� hi�u:"..add_flag)
		end
	else		--�Ƶ�
		add_flag =AddItem(Tb_huandi_equip[part_diff][GetPlayerRoute() ][1],Tb_huandi_equip[part_diff][GetPlayerRoute() ][2],Tb_huandi_equip[part_diff][GetPlayerRoute() ][3],1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			Talk(1,"","<color=yellow>"..Tb_huandi_equip[part_diff][GetPlayerRoute() ][4].."<color> ��c xong r�i, ng��i c� th� c�m v�!")
			WriteLog("��c trang b� Vi�m Ho�ng:"..GetName().."�� ��c xong 1 "..Tb_huandi_equip[part_diff][GetPlayerRoute() ][4])
		else
			WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."T�ng"..Tb_huandi_equip[part_diff][GetPlayerRoute() ][4].." th�t b�i, k� hi�u:"..add_flag)
		end	end
end
--WS������ѡ�����⴦��
function huangdi_ws_weapon(weapon_diff)
	--����Я�����
	if refound_mertiral_chk(2,2) ~= 1 then
		return
	end
	--�׻�����ɾ�����
	if DelItem(Tb_yanhuang_stone[1],Tb_yanhuang_stone[2],Tb_yanhuang_stone[3],1) ~= 1 then
		Talk(1,"","H�y x�c nh�n ng��i c� �em <color=yellow>Vi�m Ho�ngThi�t H�n<color> theo!")
		WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."Khi �ang x�a Vi�m Ho�ng Thi�t H�n nguy�n li�u kh�ng ��!")
		return
	end
	local add_flag = AddItem(Tb_huandi_sushao_weapon[weapon_diff][1],Tb_huandi_sushao_weapon[weapon_diff][2],Tb_huandi_sushao_weapon[weapon_diff][3],1,1,-1,-1,-1,-1,-1,-1)
	if add_flag == 1 then
		Talk(1,"","<color=yellow>"..Tb_huandi_sushao_weapon[weapon_diff][4].."<color> ��c xong r�i, ng��i c� th� c�m v�!")
		WriteLog("��c trang b� Vi�m Ho�ng:"..GetName().."�� ��c xong 1 "..Tb_huandi_sushao_weapon[weapon_diff][4])
		return
	else
		WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."T�ng"..Tb_huandi_sushao_weapon[weapon_diff][4].." th�t b�i, k� hi�u:"..add_flag)
	end
end
--ת��ȷ��
function refoud_dia(equip_seq)
	--����Ƿ���
	if equipmen_deal_chk(equip_seq,1) ~= 1 then
		return
	end
	local tb_dia = {}
	for i = 0 ,5 do
		if strsub(Tb_equip_position_info[equip_seq][1],1,2) == strsub(Tb_equip_position_info[i][1],1,2) and equip_seq ~= i then
			tinsert(tb_dia,"Ta mu�n ��c "..Tb_equip_position_info[i][1].."/#refound_dtm("..equip_seq..","..i..")")
		end
	end
	tinsert(tb_dia,"�� ta suy ngh� l�i/end_dialog")
	Say("Ng��i mu�n l�y trang b� �ang m�c <color=red>"..Tb_equip_position_info[equip_seq][1].."<color> ch� t�o th�nh c�i n�o <color=yellow>"..Tb_refound_att_name[Tb_equip_position_info[equip_seq][2]].."<color>?",
	getn(tb_dia),
	tb_dia
	)
end
--�׵�װ��ת��
function refound_dtm(old_seq,new_seq)
	if GetPlayerRoute() == 2 and new_seq == 2 then		--ss��bug��һ��Ҫ���ѽ��
		Say("��i hi�p l� �� t� thi�u l�m, kh�ng bi�t ��i hi�p mu�n l�y <color=red>"..Tb_equip_position_info[old_seq][1].."<color> l� v� kh� Hi�n Vi�n n�o?",
		3,
		"Ta mu�n Hi�n Vi�n To�i V� �ao/#ss_refoud_dtm("..old_seq..",1)",
		"Ta mu�n Hi�n Vi�n To�i V� C�n/#ss_refoud_dtm("..old_seq..",2)",
		"�� ta suy ngh� l�i/end_dialog"
		)
	else
		Say("Ng��i mu�n l�y trang b� �ang m�c <color=red>"..Tb_equip_position_info[old_seq][1].."<color> ch� t�o th�nh <color=red>"..Tb_equip_position_info[new_seq][1].."<color> ch�?",
		2,
		"Ta x�c nh�n mu�n ch� t�o/#refound_deal("..old_seq..","..new_seq..")",
		"�� ta suy ngh� l�i/end_dialog"
		)
	end
end
--ss����ת��ȷ��
function ss_refoud_dtm(old_seq,weapon_diff)
	Say("��i hi�p x�c nh�n mu�n l�y <color=red>"..Tb_equip_position_info[old_seq][1].."<color> ch� t�o th�nh <color=red>"..Tb_huandi_sushao_weapon[weapon_diff][4].."<color> ch�?",
	2,
	"Ta x�c nh�n mu�n ch� t�o/#ss_refoud_deal("..old_seq..","..weapon_diff..")",
	"�� ta suy ngh� l�i/end_dialog"
	)
	end
--ss������������
function ss_refoud_deal(old_seq,weapon_diff)
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	--����Я�����
	if refound_mertiral_chk(Tb_equip_position_info[old_seq][2],1) ~= 1 then
		return
	end
	--װ�����ż��
	if equipmen_deal_chk(old_seq,1) ~= 1 then
		return
	end
	--װ����Ϣ��ȡ
	local att_step = 1
	if old_seq < 4 then
		att_step = (GetEquipAttr(GetPlayerEquipIndex(old_seq),2)+1)
	end
	if att_step > Refound_level_max then
		att_step = Refound_level_max
	end
	--����ɾ�����
	if refound_mertiral_chk(Tb_equip_position_info[old_seq][2],2) ~= 1 then
		return
	end
	--װ��ɾ�����
	if equipmen_deal_chk(old_seq,2) ~=1 then
		return
	end
	local add_flag = 0
	local equip_index = 0
	add_flag,equip_index = AddItem(Tb_huandi_sushao_weapon[weapon_diff][1],Tb_huandi_sushao_weapon[weapon_diff][2],Tb_huandi_sushao_weapon[weapon_diff][3],1,1,-1,-1,-1,-1,-1,-1,0,att_step)
	if ding_flag == 1 then
		SetItemSpecialAttr(equip_index,"DING7",1)
	end
	if add_flag == 1 then
		Talk(1,"","Cu�i c�ng �� th�nh c�ng, v�t n�y kh�ng b�nh th��ng ��u, "..Zgc_pub_sex_name().."h�y d�ng v�t n�y h�nh hi�p tr��ng ngh�a!")
	else
		WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."D�ng th�"..Tb_equip_position_info[old_seq][1].."Ch� t�o "..Tb_equip_position_info[new_seq][1].." th�t b�i, k� hi�u:"..add_flag)
	end
end
--װ������
function refound_deal(old_seq,new_seq)
	local player_route = GetPlayerRoute()
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	--����Я�����
	if refound_mertiral_chk(Tb_equip_position_info[old_seq][2],1) ~= 1 then
		return
	end
	--װ�����ż��
	if equipmen_deal_chk(old_seq,1) ~= 1 then
		return
	end
	--װ����Ϣ��ȡ
	local att_step = 1
	local ding_flag = 0
	if old_seq < 4 then 
		att_step = (GetEquipAttr(GetPlayerEquipIndex(old_seq),2)+1)
		ding_flag = GetItemSpecialAttr(GetPlayerEquipIndex(old_seq),"DING7")
end
	if att_step > Refound_level_max then
		att_step = Refound_level_max
	end
	--����ɾ�����
	if refound_mertiral_chk(Tb_equip_position_info[old_seq][2],2) ~= 1 then
		return
	end
	--װ��ɾ�����
	if equipmen_deal_chk(old_seq,2) ~=1 then
		return
	end
	--��ʼ������Ʒ
	local add_flag = 0
	local equip_index = 0
	if new_seq < 4 then	--��������װ������ǿ����
		if Tb_equip_position_info[old_seq][2] == 1 then	--�׵�
			add_flag,equip_index = AddItem(Tb_refound_att[new_seq][1],Tb_refound_att[new_seq][2],(Tb_refound_att[new_seq][3]+GetBody()),1,1,-1,-1,-1,-1,-1,-1,0,att_step)
		else	--�Ƶ�
			add_flag,equip_index = AddItem(Tb_huandi_equip[new_seq][player_route][1],Tb_huandi_equip[new_seq][player_route][2],Tb_huandi_equip[new_seq][player_route][3],1,1,-1,-1,-1,-1,-1,-1,0,att_step)
		end
	else	--�����࣬��ǿ����
		add_flag = AddItem(Tb_huandi_equip[new_seq][player_route][1],Tb_huandi_equip[new_seq][player_route][2],Tb_huandi_equip[new_seq][player_route][3],1,1,-1,-1,-1,-1,-1,-1)
	end
	if add_flag == 1 then
		Talk(1,"","Cu�i c�ng �� th�nh c�ng, v�t n�y kh�ng b�nh th��ng ��u, "..Zgc_pub_sex_name().."h�y d�ng v�t n�y h�nh hi�p tr��ng ngh�a!")
		if ding_flag == 1 then
			SetItemSpecialAttr(equip_index,"DING7",1)
		end
		WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."Th�nh c�ng nh�n ���c m�c t�ng c�p l�:"..att_step.."-"..Tb_equip_position_info[new_seq][1].."Trang b�")
	else
		WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."D�ng th�"..Tb_equip_position_info[old_seq][1].."Ch� t�o "..Tb_equip_position_info[new_seq][1].." th�t b�i, k� hi�u:"..add_flag)
	end
end
--װ�����š�ɾ�����
function equipmen_deal_chk(equip_seq,deal_diff)
	local player_route = GetPlayerRoute()
	local equip_id ={}
	equip_id[1],equip_id[2],equip_id[3]= GetPlayerEquipInfo(equip_seq)
	if deal_diff == 1 then		--���ż��
		if Tb_equip_position_info[equip_seq][2] == 1 then		--�׵�
			if equip_id[1] == Tb_refound_att[equip_seq][1]  and  equip_id[2] == Tb_refound_att[equip_seq][2] and (equip_id[3] == Tb_refound_att[equip_seq][3]+GetBody()) then
				return 1
			else
				Talk(1,"","H�y x�c nh�n ng��i �ang m�c <color=red>"..Tb_equip_position_info[equip_seq][1].."<color>!")
				return 0
			end
		else
			if player_route == 2 and equip_seq == 2then
				if (equip_id[1] ==Tb_huandi_sushao_weapon[1][1] and equip_id[2] ==Tb_huandi_sushao_weapon[1][2] and equip_id[3] ==Tb_huandi_sushao_weapon[1][3] ) or 
					(equip_id[1] ==Tb_huandi_sushao_weapon[2][1] and equip_id[2] ==Tb_huandi_sushao_weapon[2][2] and equip_id[3] ==Tb_huandi_sushao_weapon[2][3] ) then
					return 1
				else
					Talk(1,"","H�y x�c nh�n ng��i �ang m�c <color=red>v� kh� Hi�n Vi�n<color>!")
					return 0
				end
			elseif equip_seq == 4 or equip_seq == 5 then
				equip_id[1],equip_id[2],equip_id[3]= GetPlayerEquipInfo(4)
				equip_id[11],equip_id[12],equip_id[13]= GetPlayerEquipInfo(5)
				if (equip_id[1] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[2] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[3] == Tb_huandi_equip[equip_seq][player_route][3])
				or (equip_id[11] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[12] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[13] == Tb_huandi_equip[equip_seq][player_route][3])
				then
					return 1
				else
					Talk(1,"","H�y x�c nh�n ng��i �ang m�c <color=red>"..Tb_equip_position_info[equip_seq][1].."<color>!")
				end
			else
				if equip_id[1] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[2] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[3] == Tb_huandi_equip[equip_seq][player_route][3] then
					return 1
				else
					Talk(1,"","H�y x�c nh�n ng��i �ang m�c <color=red>".. Tb_huandi_equip[equip_seq][player_route][4] .."<color>!")
					return 0
				end
			end
		end
	else							--ɾ�����
		local equip_index = 0
		if equip_seq == 4 or equip_seq == 5 then
			equip_id[1],equip_id[2],equip_id[3]= GetPlayerEquipInfo(4)
			equip_id[11],equip_id[12],equip_id[13]= GetPlayerEquipInfo(5)
			if (equip_id[1] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[2] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[3] == Tb_huandi_equip[equip_seq][player_route][3]) then
				equip_index = GetPlayerEquipIndex(4)
			elseif (equip_id[11] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[12] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[13] == Tb_huandi_equip[equip_seq][player_route][3]) then
				equip_index = GetPlayerEquipIndex(5)
			else
				Talk(1,"","H�y x�c nh�n ng��i �ang m�c trang b� mu�n ch� t�o!")
				return 0
			end
		else
			equip_index = GetPlayerEquipIndex(equip_seq)
		end
		if equip_index == 0 then
			Talk(1,"","H�y x�c nh�n ng��i �ang m�c trang b� mu�n ch� t�o!")
			return 0
		else
			local del_flag = DelItemByIndex(equip_index,-1)
			if del_flag == 1 then
				return 1
			else
				Talk(1,"","H�y x�c nh�n ng��i �ang m�c trang b� mu�n ch� t�o!")
				WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."X�a:"..equip_id[1]..":"..equip_id[2]..":"..equip_id[3].." th�t b�i, k� hi�u:"..del_flag)
				return 0
			end
		end
	end
end
--����Я�����
function refound_mertiral_chk(equip_diff,deal_flag)
	for i = 1, getn(Tb_refound_mertiral[equip_diff]) do
		if deal_flag == 1 then	--Я�����
			if GetItemCount(Tb_refound_mertiral[equip_diff][i][1],Tb_refound_mertiral[equip_diff][i][2],Tb_refound_mertiral[equip_diff][i][3]) < Tb_refound_mertiral[equip_diff][i][4] then
				Talk(1,"","Ch� t�o <color=yellow>"..Tb_refound_att_name[equip_diff].."<color> c�n <color=yellow>"..Tb_refound_mertiral[equip_diff][i][4].."<color> <color=yellow>"..Tb_refound_mertiral[equip_diff][i][5].."<color> Ng��i mang theo kh�ng ��, tr��c ti�n ng��i m� b�n v� ra xem c�n c�n nguy�n li�u g� sau �� th� l�i.")
				return 0
			end
		else 	--ɾ�����
			if DelItem(Tb_refound_mertiral[equip_diff][i][1],Tb_refound_mertiral[equip_diff][i][2],Tb_refound_mertiral[equip_diff][i][3] ,Tb_refound_mertiral[equip_diff][i][4]) ~= 1 then
				Talk(1,"","Ch� t�o <color=yellow>"..Tb_refound_att_name[equip_diff].."<color> c�n <color=yellow>"..Tb_refound_mertiral[equip_diff][i][4].."<color> <color=yellow>"..Tb_refound_mertiral[equip_diff][i][5].."<color> Ng��i mang theo kh�ng ��, tr��c ti�n ng��i m� b�n v� ra xem c�n c�n nguy�n li�u g� sau �� th� l�i.")
				WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."�ang x�a"..Tb_refound_mertiral[equip_diff][i][5].." nguy�n li�u kh�ng ��!")
				return 0
			end
		end
	end
	return 1
end
------------------------------------------------����ת��--------------------------------
--2007-12-11�ٴε���
TaskID_yandi_att_chg_num = 1289
function yandi_att_chg()
	Say("B�y gi� ta kh�ng c�n �� Tinh L�c �� l�m <color=yellow>trang b� Vi�m ��<color>, c� �i�u ta c� th� gi�p c�c ng��i ch�nh s�a nh�ng trang b� n�y, ta c� th� ��i v�i gi� th�p cho ng��i <color=yellow>3<color> l�n <color=yellow>trang b� Vi�m ��<color>, m�i l�n ch� thu <color=yellow>1 V� Ng�n Th�y<color>, n�u thay ��i ti�p, m�i l�n ��u c�n <color=yellow>1 N� Oa tinh th�ch<color> m�i c� th� ��i cho ng��i. Kh�ng bi�t "..Zgc_pub_sex_name().."Mu�n ��i thu�c t�nh n�o c�a <color=yellow>trang b� Vi�m ��<color>?? (<color=yellow>Vi�m �� Gi�p<color> chuy�n ��i th�nh t�ng <color=red>100<color> �i�m s�t th��ng, <color=yellow>Vi�m �� Trang<color> chuy�n ��i th�nh t�ng <color=red>60<color> �i�m s�t th��ng)",
	6,
	"Ta mu�n t�ng �i�m t�n c�ng c�a Vi�m �� Gi�p/#yandi_atti_chg(1,1)",
	"Ta mu�n t�ng �i�m s�t th��ng c�a Vi�m �� Gi�p/#yandi_atti_chg(1,2)",
	"Ta mu�n t�ng �i�m t�n c�ng c�a Vi�m �� Trang/#yandi_atti_chg(3,1)",
	"Ta mu�n t�ng �i�m s�t th��ng c�a Vi�m �� Trang/#yandi_atti_chg(3,2)",
	"��i trang b� Vi�m �� c� g� kh�c/chg_atti_info",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--ת���Ժ�����Ա仯
function chg_atti_info()
	Talk(1,"yandi_att_chg","Khi ng��i kh�ng h�i l�ng thu�c t�nh c�a <color=yellow>trang b� Vi�m ��<color> c� th� ��n ch� ta ��i. T�ng t�n c�ng l� thu�c t�nh ngo�i c�ng/ n�i c�ng t�ng##? (<color=red>Vi�m �� Gi�p<color> t�ng n�i ngo�i c�ng <color=yellow>11%<color>, <color=red>Vi�m �� Trang<color> t�ng n�i ngo�i c�ng <color=yellow>5%<color>), t�ng s�t th��ng l� t�ng thu�c t�nh s�t th��ng? (<color=red>Vi�m �� Gi�p<color> t�ng <color=yellow>100<color> �i�m s�t th��ng, <color=red>Vi�m �� Trang<color> t�ng <color=yellow>60<color> �i�m s�t th��ng). Nh�ng ta n�i tr��c, sau khi ��i<color=yellow>thu�c t�nh ph�ng ng�<color> �i�m ph�ng th� s� thay ��i, tr��c khi ��i ph�i c�n nh�c c�n th�n. Nh�ng ��i trang b� <color=yellow>�� c��ng h�a<color> v�n gi� nguy�n, v� �i�m n�y ng��i c� y�n t�m.")
end
Tb_attitude_chg_info = {
	{2,268},
	{},
	{4,331}
}
--�׵�װ������ת���Ի�
function yandi_atti_chg(equip_diff,chg_flag)
	local chg_att = {
		{"T�ng thu�c t�nh s�t th��ng","T�ng t�n c�ng"},
		{"T�ng thu�c t�nh t�n c�ng","T�ng s�t th��ng"},
	}
	local chg_num  = GetTask(TaskID_yandi_att_chg_num)
	local need_goods = ""
	if chg_num < 3 then
		need_goods = "V� Ng�n Th�y"
	else
		need_goods = "N� Oa Tinh Th�ch"
	end
	Say("B�y gi� ng��i c�n ��i 1<color=yellow>"..need_goods.."<color> v�o,"..Zgc_pub_sex_name().."X�c nh�n mu�n ng��i m�c <color=yellow>"..Tb_refound_att[equip_diff][4].."<color> thu�c t�nh th� nh�t chuy�n th�nh <color=yellow>"..chg_att[chg_flag][2].."<color> ��ng kh�ng?",
		2,
		"Ta mu�n ��i/#yandi_atti_chg_deal("..equip_diff..","..chg_flag..")",
		"�� ta suy ngh� l�i/end_dialog"
		)

end
--�׵�װ������ת������
function yandi_atti_chg_deal(equip_diff,chg_flag)
	local chg_num  = GetTask(TaskID_yandi_att_chg_num)
	--�ռ为�ؼ��
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	--װ�����ż��
	if equipmen_deal_chk(equip_diff,1) ~= 1 then
		return
	end
	--װ���Ƿ�����
	local equip_index = GetPlayerEquipIndex(equip_diff)
	local equip_level = GetEquipAttr(equip_index,2)
	if GetItemSpecialAttr(equip_index,"LOCK") == 1 then
		Talk(1,"","Trang b� �ang kh�a kh�ng th� ��i thu�c t�nh, sau khi m� kh�a h�y th� l�i.")
		return
	end
	if chg_num < 3 then
		if GetItemCount(2,1,503) == 0 then
			Talk(1,"","��i thu�c t�nh c�a <color=yellow>Vi�m �� Thao Trang<color> s� t�n m�t �t nguy�n li�u, l�n n�y thu <color=yellow>"..Zgc_pub_sex_name().."<color> B�n c� m�t <color=yellow>V� Ng�n Th�y<color> �ang c�n thanh l�!")
			return
		end
		if DelItem(2,1,503,1) ~= 1 then
			Talk(1,"","��i thu�c t�nh c�a <color=yellow>Vi�m �� Thao Trang<color> s� t�n m�t �t nguy�n li�u, l�n n�y thu <color=yellow>"..Zgc_pub_sex_name().."<color> B�n c� m�t <color=yellow>V� Ng�n Th�y<color> �ang c�n thanh l�!")
			return
		end
	else
		if GetItemCount(2,1,504) == 0 then
			Talk(1,"","��i thu�c t�nh c�a <color=yellow>Vi�m �� Thao Trang<color> s� t�n m�t �t nguy�n li�u, l�n n�y thu <color=yellow>"..Zgc_pub_sex_name().."<color> B�n c� m�t <color=yellow>N� Oa tinh th�ch<color> �ang c�n thanh l�!")
			return
		end
		if DelItem(2,1,504,1) ~= 1 then
			Talk(1,"","��i thu�c t�nh c�a <color=yellow>Vi�m �� Thao Trang<color> s� t�n m�t �t nguy�n li�u, l�n n�y thu <color=yellow>"..Zgc_pub_sex_name().."<color> B�n c� m�t <color=yellow>N� Oa tinh th�ch<color> �ang c�n thanh l�!")
			return
		end
	end	
	--װ���Ƿ񶨻�
	local ding_flag = GetItemSpecialAttr(equip_index,"DING7")
	--װ��ɾ�����
	if equipmen_deal_chk(equip_diff,2) ~= 1 then
		return
	else
		WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."X�a 1 �� c��ng h�a l�:"..equip_level.."-"..Tb_refound_att[equip_diff][4])
	end
	--װ������
	local add_flag = 0
	local new_equip_index = 0
	local attribute_level = 5
	if equip_diff == 3 then
		attribute_level = 1
	end
	if chg_flag == 2 then
		add_flag,new_equip_index = AddItem(Tb_refound_att[equip_diff][1],Tb_refound_att[equip_diff][2],(Tb_refound_att[equip_diff][3]+GetBody()),1,1,Tb_attitude_chg_info[equip_diff][1],Tb_attitude_chg_info[equip_diff][2],-1,-1,-1,-1,0,equip_level)
	else
		add_flag,new_equip_index = AddItem(Tb_refound_att[equip_diff][1],Tb_refound_att[equip_diff][2],(Tb_refound_att[equip_diff][3]+GetBody()),1,1,-1,-1,-1,-1,-1,-1,0,equip_level)
	end
	if add_flag == 1 then
		local dialog_remain_time = ""
		local remain_time = 2 - chg_num
		if remain_time <= 0 then
			dialog_remain_time = "B�n kh�ng c�n c� h�i s� d�ng <color=yellow>V� Ng�n Th�y<color> �� ��i n�a, l�n sau mu�n ��i c�n ph�i c� 1 <color=yellow>N� Oa tinh th�ch<color>!"
		else
			dialog_remain_time = "B�n v�n c�n <color=yellow>"..remain_time.."<color> l�n s� d�ng <color=yellow>V� Ng�n Th�y<color> ��i, l�n sau mu�n ��i c�n ph�i c� 1 <color=yellow>N� Oa tinh th�ch<color>!"
		end
		if ding_flag == 1 then
			SetItemSpecialAttr(new_equip_index,"DING7",1)
		end
		Talk(1,"","��i ���c r�i, "..Zgc_pub_sex_name().."C�m l�y!"..dialog_remain_time)
		WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."Nh�n ���c 1 �� c��ng h�a:"..equip_level.."-"..Tb_refound_att[equip_diff][4])
	else
		WriteLog("��c trang b� Vi�m Ho�ng: Ng��i ch�i"..GetName().."�ang thay ��i c��ng ��"..equip_level.."-"..Tb_refound_att[equip_diff][3].."Khi thu�c t�nh t�ng trang b� th�t b�i, k� hi�u th�t b�i:"..add_flag)
	end
	SetTask(TaskID_yandi_chg_num,(GetTask(TaskID_yandi_chg_num)+equip_diff))
	SetTask(TaskID_yandi_att_chg_num,(GetTask(TaskID_yandi_att_chg_num)+1))
end
-----------------------------------------------ͼֽ����---------------------------------
--����10��Ǯ������һ��paper
function refound_paper_chg(paper_diff)
	if paper_diff == 2 then
		if GetPlayerRoute() == 0 then
			Talk(1,"","Ta kh�ng th� gi�p ng��i ch�a nh�p m�n ph�i n�o ch� t�o <color=red>trang b� Ho�ng ��<color>!")
			return
		end
		if Tb_huandi_equip[4][GetPlayerRoute()] [1]== nil  then
		Talk(1,"","Ta kh�ng th� gi�p ng��i ch�a nh�p m�n ph�i n�o ch� t�o <color=red>trang b� Ho�ng ��<color>!")
		return
		end
	end
	Say("Ng��i mu�n ch� t�o <color=red>"..Tb_refound_att_name[paper_diff].."<color>? K� n�ng ph�i ch� n�y ta c�c kh� t�m ra, mu�n ta ch� kh�ng ng��i sao, c�n mu�n ta gi�p ng��i ch� t�o n�a �? Kh�ng d� th� ��u. Ta c�n <color=yellow>10<color> vi�n <color=yellow>B�ng th�ch tinh luy�n<color> �� ch� t�o, ng��i h�y �em ��n ��y ta m�i cho ng��i k� n�ng ph�i ch�. Th� n�o, ng��i c�n t�m <color=yellow>k� n�ng ph�i ch�<color> n�y kh�ng? Qua kh�i th�n n�y kh�ng c�n qu�n tr� n�o ��u.",
	2,
	"Ta c�n 1 t�m b�n v�/#paper_chg("..paper_diff..")",
	"M�c th�, th�i, ta kh�ng c�n n�a/end_dialog"
	)
end
--��Ǯ
function paper_chg(paper_diff)
	--��ƷЯ�����
	if GetItemCount(2,1,533) < 10 then
		Talk(1,"","Ch� c� ngh� ��n chuy�n l�a ta <color=yellow>b�n v�<color>, ta t�n r�t nhi�u c�ng s�c m�i nghi�n c�u ra.")
		return
	end
	--�ռ为�ؼ��
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--��Ʒɾ�����
	if DelItem(2,1,533,10) ~= 1 then
		Talk(1,"","Ch� c� ngh� ��n chuy�n l�a ta <color=yellow>b�n v�<color>, ta t�n r�t nhi�u c�ng s�c m�i nghi�n c�u ra.")
		return
	else
		local add_flag = AddItem(2,1,Tb_refound_paper_info[paper_diff][1],1)
		if add_flag == 1 then
			Talk(1,"","C�m l�y, ��y l� <color=yellow>b�n v� ch� t�o<color> ng��i c�n, t�m �� <color=yellow>nguy�n li�u<color> ghi tr�n b�n v�, mang theo b�n v�, m�c <color=red> mu�n ch� t�o l�n ng��i"..Tb_refound_att_name[paper_diff].."<color> ho�c mang <color=yellow>Vi�m Ho�ng Thi�t H�n<color>, ��n t�m ta l� ch� t�o ���c!")
			return
		else
			WriteLog("Th�ng c�p Vi�m �� Trang: Ng��i ch�i "..GetName().."Nh�n b�n v� th�t b�i, k� hi�u th�t b�i:"..add_flag)
		end
	end
end
function refuond_info()
	Talk(1,"","<color=green>M�c ��i<color>: Ta c� th� gi�p ng��i chuy�n ho� <color=yellow>trang b� Vi�m �� ho�c trang b� Ho�ng ��<color> th�nh <color=red><color><color=yellow>trang b� Vi�m �� ho�c trang b� Ho�ng ��<color> t��ng �ng<color=red><color> b�t k�. Sau khi suy ngh� xong, h�y mang 1 b�n v� ��n ch� ta, chu�n b� ��c <color=yellow>trang b� Vi�m �� ho�c trang b� Ho�ng ��<color>. N�u ng��i kh�ng c� <color=yellow>trang b� Vi�m �� ho�c trang b� Ho�ng ��<color>, th� c�ng c� th� ��n <color=yellow>Ng� C�c<color> th� v�n may, r�i mang <color=yellow>Vi�m Ho�ng thi�t h�n<color> ��n cho ta c�ng ���c. Nh�ng n�u nh� v�y, th� trang b� ch� t�o ra <color=yellow>s� kh�ng c� hi�u qu� c��ng ho�<color> ��u.")
end
--�ϵĶԻ�
function old_dia()
	local strtab = {
		"H�c k� n�ng ch� t�o binh kh� d�i/luaLearnLifeSkill",
		"H�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�/learn_all_recipe",
		"Qu�n k� n�ng ch� t�o binh kh� d�i/forget_life_skill",
--		"Nh�ng �i�u li�n quan v� trang b� B�t Qu�i/bagua",
		"H�c c�ch l�m v� kh� linh kh� c�p 76/xinwuqi",
		"T�m hi�u v�t ph� gia/Dating",
	}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"ti�p t�c nhi�m v� h�c t�p Linh Th�ch B�t Qu�i/task_new3");
	end
	tinsert(strtab,"R�i kh�i/SayHello")
    Say(strTitle.."K� n�ng ch� t�o v� kh� c�a ta v�ng n�y c� m�t kh�ng hai, ��c bi�t l� binh kh� d�i, th� n�o c� mu�n mua m�t c�i kh�ng?",
    getn(strtab),strtab)
end
--============================================�׵�װת���Ի�����====================================
-- �����䷽��ص�����
function learn_all_recipe()
	Say(strTitle.."Ng��i mu�n h�c c�ch ph�i ch� ho�c l�m nhi�m v� ph�i ch�?",
		7,
			"H�c c�ch ph�i ch� m�i/luaLearnRecipe",
			"H�c ph�i ch� trang b� Linh ��/learnLtEquip",
    	"H�c c�ch ph�i ch� d�nh cho ho�t ��ng cu�i tu�n/Weekend",
    	"Xem nh�n ���c nhi�m v� v� kh� c�p 76 kh�ng/get_76_task",
    	"H�c c�ch ph�i ch� c�p 76/relearn_76_recipe",
    	"Kh�ng h�c ���c s�a c�ch gh�p/LearnRecipe",
    	"R�i kh�i/SayHello")
end;


-- ����76���䷽����
function get_76_task()
 	-------------------------------------76�������䷽����-------------------------------------
	local nSkillGenre,nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre,nSkillDetail);
	local nTaskState_76 = GetTask(TASK_76WEAPON);
	local nTaskState_heiwu = GetTask(TASK_MEDICINE_HEIWU);
		
	--����������ϵ�䷽����
	if (nSkillGenre == 1 and nSkillDetail == 2 and nSkillLevel >= 79) then
		--��δ�����䷽����
		if nTaskState_76 == 0 then
			weapon_76_001(1)
			return
		--�Ͻ�����
		elseif nTaskState_76 == 1 then
			weapon_76_002(1)
			return
		--δ����λ���ŶԻ�
		elseif nTaskState_76 == 2 then
			weapon_76_004(1)
			return
		--�Ѿ�����λ���ŶԻ�
		elseif nTaskState_76 == 3 then
			weapon_76_005(1)
			return
		--ѡ��ѧϰ����ķ���
		elseif nTaskState_76 == 4 then
			weapon_76_choice(1)
			return
		end			
	end
	
	--��ҩϵ���پ�ʯ�䷽����
	if nSkillGenre == 1 and nSkillDetail == 6 and nSkillLevel >= 79 then
		--ȡ����ʯ
		if nTaskState_heiwu == 3 then
			medicine_heiwu_007()
			return
		--δ����ʯ�����η�ҽ��
		elseif nTaskState_heiwu == 4 then
			medicine_heiwu_008()
			return
		end
	end
		
	--��ʾ���76�������䷽����
	if nSkillGenre == 1 and nSkillDetail ~= 2 and nSkillLevel >= 79 and GetTask(1600) == 0 and GetTask(1602) == 0 and GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0 then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	
	Say("B�n ch�a �� �i�u ki�n nh�n nhi�m v� ph�i ch� c�p 76.", 0)
end;

-- ��ѧ76���䷽
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 2)
	if (nGene == 1 and nSkillID == 2) then
		if (GetTask(1600) == 5 and nLevel >= 79) then
			if (HaveLearnRecipe(795) == 0 and HaveLearnRecipe(800) == 0 and HaveLearnRecipe(801) == 0) then
				Say("H�y ch�n 1 lo�i v� kh� b�n mu�n h�c c�ch ch� t�o:",
					4,
					"Tr��ng/learn_long_1",   
					"c�n b�ng/learn_long_2",  
					"Th��ng/learn_long_3",    
					"Ta suy ngh� l�i/SayHello")
			else
				Say("B�n �� h�c ���c ph��ng ph�p ph�i ch� m�i!", 0)
			end
		else
			Say("Ng��i v�n ch�a ho�n th�nh nhi�m v� ch� t�o binh kh� d�i c�p 67", 0)
		end
	else
		Say("B�n v�n ch�a ho�n th�nh k� n�ng: <color=yellow>Ch� t�o Binh kh� d�i<color>!", 0)
	end
end;
-- ��
function learn_long_1()
	AddRecipe(800)
	Msg2Player("B�n h�c ���c ph�i ch�: A La H�n Tr��ng")
end;
-- ����
function learn_long_2()
	AddRecipe(795)
	Msg2Player("B�n h�c ���c ph�i ch�: Li�t Di�m")
end;
-- ǹ
function learn_long_3()
	AddRecipe(801)
	Msg2Player("B�n h�c ���c ph�i ch�: ��i H�o L�i Th��ng")
end;


-- ���������
function forget_life_skill()
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 2) then
		local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- ������
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."��y l� l�n th� "..(nForgetTimes + 1).." l�n b� k� n�ng s�n xu�t, m�t "..nShouldPay.." l��ng, ng��i suy ngh� k� ch�a?",
			2,
			"Ta �� quy�t ��nh r�i!/forget_now",
			"Khoan ��! Ch� ta suy ngh� l�i!/SayHello")
	else
		Say(strTitle.."K� n�ng ch� t�o binh kh� d�i ng��i v�n ch�a h�c, ta s� gi�p ng��i.", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- ������
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 2) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 2)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
				SetTask(1600,0);--���79�������䷽����
				SetTask(1601,0);--���79�������䷽����
				Msg2Player("Ng��i qu�n k� n�ng ch� t�o binh kh� d�i r�i")				
			end
		else
			Say(strTitle.."Ng��i kh�ng mang theo �� ti�n! L�y ti�n r�i h�y ��n nh�!", 0)
		end
	end
end;


------------------------------------------ʱ���ж�--------------------------------------------
 --�������ڼ���0����������
function GetWeekDay()
	return tonumber(date("%w"))
end;

--���ص�ǰСʱ�ͷ���
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23��59��
function CheckTime(day)
	if WEEKEND_SWITCH == 0 then
		return 0
	end;
	if day ~= GetWeekDay() then
		return 0
	end;

	--����19:00 - 24:00��ʲô����
	local nBegin = 19 * 60;
	local nEnd = 24 * 60;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end;
end;




--**********************************************����ѧϰ����***************************************
--����ѧϰѡ��
function luaLearnLifeSkill()
	if (GetLevel() < 10) then
		Say (strTitle.."B�n kh�ng �� <color=yellow>c�p 10<color> ch�?th� h�c k� n�ng s�ng.", 0)
    	return
	end

    if (GetLifeSkillsNum(1) == 2) then
		Say (strTitle.."Ng��i c�n h�y k� n�ng s�n xu�t m�i h�c ti�p k� n�ng ch� t�o binh kh� d�i.", 0)
		return
	end
    
	Say(strTitle.."<color=yellow>Ch� t�o Binh kh� d�i<color> s� thay th� k� n�ng s�n xu�t, c� mu�n h�c kh�ng?",
    	2,
    	"Ta mu�n h�c/LearnYes",
    	"�� ta suy ngh� l�i/LearnNo")
end

--ѧϰ����
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if (LearnLifeSkill(1, 2, 1, 79, 1)) then
        	Msg2Player("B�n h�c ���c k� n�ng ch� t�o binh kh� d�i, nh�n ���c 3 H�c Kim Ph�n.")
        	AddItem(2, 2, 59, 3)
    	end
    	
    	AddRecipe(86)
        Msg2Player("B�n h�c ���c ph�i ch�: Th�y H�a C�n")
    	AddRecipe(87)
    	Msg2Player("B�n h�c ���c ph�i ch�: T� B�nh C�n")
    	AddRecipe(97)
    	Msg2Player("B�n h�c ���c ph�i ch�: T�ch Tr��ng")
    	AddRecipe(98)
    	Msg2Player("B�n h�c ���c ph�i ch�: Ho�ng Ph�p Tr��ng")
        AddRecipe(749)
        Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
    	AddRecipe(750)
    	Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
    	SetTask(LEV_LEARNRECIPE, 10)
    	
	else
		Say (strTitle.."B�n �� h�c k� n�ng s�ng, kh�ng th� h�c th�m k� n�ng kh�c.",0)
	end
end;

--ȡ��ѧϰ����
function LearnNo()
    Say(strTitle.."H�y suy ngh� k� r�i quay l�i ��y nh�!", 0)
end
--�������䷽����ѧϰ�Ĵ����޸�
function LearnRecipe()
    SetTask(LEV_LEARNRECIPE, 0)
end


--**********************************************�䷽ѧϰ����***************************************
--ѧϰ�µ��䷽
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 2)
	if (GetLifeSkillLevel(1, 2) > 1) then
		if (GetTask(LEV_LEARNRECIPE) == 10 and HaveLearnRecipe(749) == 0) then
        	AddRecipe(749)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        	AddRecipe(750)
        	Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        	AddRecipe(751)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        	AddRecipe(752)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
       	elseif (GetTask(LEV_LEARNRECIPE) == 20 and HaveLearnRecipe(749) == 0) then
        	AddRecipe(749)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        	AddRecipe(750)
        	Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        	AddRecipe(751)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        	AddRecipe(752)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        	AddRecipe(753)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
       elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(749)==0 then
       		AddRecipe(749)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        	AddRecipe(750)
        	Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        	AddRecipe(751)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        	AddRecipe(752)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        	AddRecipe(753)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
        	AddRecipe(754)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� C�t Th��ng")
        	AddRecipe(755)
        	Msg2Player("B�n h�c ���c ph�i ch�: X�ch Nguy�t Th��ng")
       	elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(749)==0 then
        	AddRecipe(749)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        	AddRecipe(750)
        	Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        	AddRecipe(751)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        	AddRecipe(752)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        	AddRecipe(753)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
        	AddRecipe(754)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� C�t Th��ng")
        	AddRecipe(755)
        	Msg2Player("B�n h�c ���c ph�i ch�: X�ch Nguy�t Th��ng")
        	AddRecipe(756)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng�n X� Th��ng")
       	elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(749)==0 then
        	AddRecipe(749)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        	AddRecipe(750)
        	Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        	AddRecipe(751)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        	AddRecipe(752)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        	AddRecipe(753)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
        	AddRecipe(754)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� C�t Th��ng")
        	AddRecipe(755)
        	Msg2Player("B�n h�c ���c ph�i ch�: X�ch Nguy�t Th��ng")
        	AddRecipe(756)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng�n X� Th��ng")
        	AddRecipe(757)
        	Msg2Player("B�n h�c ���c ph�i ch�: H�a Ti�m Th��ng")
       	elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(749)==0 then
        	AddRecipe(749)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
        	AddRecipe(750)
        	Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        	AddRecipe(751)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        	AddRecipe(752)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        	AddRecipe(753)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
        	AddRecipe(754)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� C�t Th��ng")
        	AddRecipe(755)
        	Msg2Player("B�n h�c ���c ph�i ch�: X�ch Nguy�t Th��ng")
        	AddRecipe(756)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng�n X� Th��ng")
        	AddRecipe(757)
        	Msg2Player("B�n h�c ���c ph�i ch�: H�a Ti�m Th��ng")
        	AddRecipe(758)
        	Msg2Player("B�n h�c ���c ph�i ch�: Tr��ng B�t X� M�u")
       	elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(749)==0 then
        	AddRecipe(749)
	        Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
    	    AddRecipe(750)
        	Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
        	AddRecipe(751)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        	AddRecipe(752)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        	AddRecipe(753)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
        	AddRecipe(754)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� C�t Th��ng")
        	AddRecipe(755)
        	Msg2Player("B�n h�c ���c ph�i ch�: X�ch Nguy�t Th��ng")
        	AddRecipe(756)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng�n X� Th��ng")
        	AddRecipe(757)
        	Msg2Player("B�n h�c ���c ph�i ch�: H�a Ti�m Th��ng")
        	AddRecipe(758)
        	Msg2Player("B�n h�c ���c ph�i ch�: Tr��ng B�t X� M�u")
        	AddRecipe(759)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ph� Thi�n K�ch")
      	elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(749)==1 and HaveLearnRecipe(759)==0 then
        	AddRecipe(759)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ph� Thi�n K�ch")
        elseif (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
			AddRecipe(86)
        	Msg2Player("B�n h�c ���c ph�i ch�: Th�y H�a C�n")
    		AddRecipe(87)
    		Msg2Player("B�n h�c ���c ph�i ch�: T� B�nh C�n")
    		AddRecipe(97)
    		Msg2Player("B�n h�c ���c ph�i ch�: T�ch Tr��ng")
    		AddRecipe(98)
    		Msg2Player("B�n h�c ���c ph�i ch�: Ho�ng Ph�p Tr��ng")
        	AddRecipe(749)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�t Th��ng")
    		AddRecipe(750)
    		Msg2Player("B�n h�c ���c ph�i ch�: �i�m Cang Th��ng")
    		SetTask(LEV_LEARNRECIPE, 10)
    	elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(88)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ph� �� C�n")
        	AddRecipe(89)
        	Msg2Player("B�n h�c ���c ph�i ch�: H�c V� C�n")
        	AddRecipe(99)
        	Msg2Player("B�n h�c ���c ph�i ch�: Tam B�o Tr��ng")
        	AddRecipe(100)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ph�c Ma Tr��ng")
        	AddRecipe(751)
        	Msg2Player("B�n h�c ���c ph�i ch�: L�c L�ng Th��ng")
        	AddRecipe(752)
        	Msg2Player("B�n h�c ���c ph�i ch�: C�u Li�m Th��ng")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(90)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ph�n Th�y C�n")
        	AddRecipe(101)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ph� �� Tr��ng")
        	AddRecipe(753)
        	Msg2Player("B�n h�c ���c ph�i ch�: Truy H�n Th��ng")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(91)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ti�m Long C�n")
        	AddRecipe(92)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� Kim L��ng")
        	AddRecipe(102)
        	Msg2Player("B�n h�c ���c ph�i ch�: Nguy�t Lu�n Tr��ng")
        	AddRecipe(103)
        	Msg2Player("B�n h�c ���c ph�i ch�: Kh�ng Minh Tr��ng")
        	AddRecipe(754)
        	Msg2Player("B�n h�c ���c ph�i ch�: T� C�t Th��ng")
        	AddRecipe(755)
        	Msg2Player("B�n h�c ���c ph�i ch�: X�ch Nguy�t Th��ng")
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(93)
        	Msg2Player("B�n h�c ���c ph�i ch�: �� C�u B�ng")
        	AddRecipe(94)
        	Msg2Player("B�n h�c ���c ph�i ch�: Kh�n Na La B�ng")
        	AddRecipe(104)
        	Msg2Player("B�n h�c ���c ph�i ch�: B�o Quang Tr��ng")
        	AddRecipe(105)
        	Msg2Player("B�n h�c ���c ph�i ch�: ��i T� T�i Tr��ng")
        	AddRecipe(756)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ng�n X� Th��ng")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
	        AddRecipe(95)
    	    Msg2Player("B�n h�c ���c ph�i ch�: Thi�n X� C�n")
        	AddRecipe(106)
        	Msg2Player("B�n h�c ���c ph�i ch�: ��i B�t Nh� Tr��ng")
        	AddRecipe(757)
        	Msg2Player("B�n h�c ���c ph�i ch�: H�a Ti�m Th��ng")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(96)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thanh Long C�n")
        	AddRecipe(107)
        	Msg2Player("B�n h�c ���c ph�i ch�: Thi�n Ph�t Tr��ng")
        	AddRecipe(758)
        	Msg2Player("B�n h�c ���c ph�i ch�: Tr��ng B�t X� M�u")
        	SetTask(LEV_LEARNRECIPE,70)
      elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
        	AddRecipe(759)
        	Msg2Player("B�n h�c ���c ph�i ch�: Ph� Thi�n K�ch")
        	SetTask(LEV_LEARNRECIPE,80)
    	else
        	Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
    	end
    end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 2)
	if nLevel >= 79 then
    	AddRecipe(1115)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� C�i Bang C�n"))
    	AddRecipe(1121)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� Thi�u L�m Tr��ng"))
    	AddRecipe(1124)
    	Msg2Player(format("�� h�c ph�i ch� m�i: %s", "Linh �� D��ng M�n Th��ng"))
	else
    	Say(strTitle..": ��ng qu� n�n n�ng, kinh nghi�m giang h� ng��i c�n k�m l�m, c� g�ng th�m nh�!",0)
	end
end

--�����
function Weekend()
	if (GetLifeSkillLevel(1, 2) >= 1) then
    	if GetTask(HaveWeekend)==1 then
        	Say(strTitle.."Ng��i �� h�c h�t c�c k� n�ng � ch� ta r�i!", 0)
		elseif (CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1) then
    		Talk(1,"",strTitle.."Ti�n tuy�n chi�n tranh �c li�t, ta c� 1 c�ch ch� t�o v� kh� ��c ��o mu�n truy�n th� cho ng��i. H�y ch� t�o tr��ng m�u cho c�c binh s� ra chi vi�n cho ti�n tuy�n!")
    		AddRecipe(227)
    		Msg2Player("B�n h�c ���c ph�i ch�-- Tr��ng m�u qu�n d�ng!")
    		SetTask(HaveWeekend,1)
    	end
    else
    	Say(strTitle.."B�n ch�a h�c qua c�ch ch� t�o binh kh� d�i ho�c th�i gian ch�a ��n! Ta kh�ng th� truy�n th� cho ng��i!", 0)
    end
end;

--�������Ϣ
function Dating()
	Talk(1,
		 "",
		 strTitle.."Mu�n ch� t�o 1 binh kh� tuy�t th� v� song, c�n ph�i b� th�m nhi�u v�t ph� gia, ng��i h�y th� b� th�m 1 s� v�t li�u t�t, c� th� s� r�n ���c nh�ng v� kh� c� m�t kh�ng hai.")
end;

--ȡ������
function SayHello()

end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=red>Trang b� B�t Qu�i<color> l� t�m huy�t c� ��i c�a huynh �� M�c gia ch�ng ta v� T��ng D��ng L�o L�u, C�ng D� Th� Gia, C�m N��ng c�ng nhau nghi�n c�u ra. N�u nh�n ���c v�i m�n �� c�a Linh Th�ch ng��i �i h�i con ch�u c�a C�ng D� Th� Gia, n�u ng��i mu�n t�m hi�u l�m th� n�o �� ch� t�o 1 trang b� c� th�<color=yellow>Kh�m n�m linh th�ch<color>, th� ��n ch� ta ��y.",
	4,
	"L�m sao ch� t�o trang b� c� l� kh�m n�m/kongzhuangbeizhizuo",
	"V�t ph�m th�m v�o c� t�c d�ng g�/tianjiawu",
	"L�m sao trang b� ���c ch� t�o th�nh trang b� B�t Qu�i/xiangqianzhuyi",
	"��n h�i th�m th�i m�!/SayHello"
	)
end

function kongzhuangbeizhizuo()
	Talk(1,"",strTitle.."R�t ��n gi�n, qua nghi�n c�u c�a b�n ta, c�i ti�n ph��ng ph�p ch� t�o ta truy�n th� cho c�c ng��i, b�y gi� ng��i �ang thu th�p nguy�n li�u � khu v�c thu th�p, nh�ng trang b� ch� t�o ra c� m�c linh kh� t�i �a v� c� th� c� l� kh�m n�m, nh�ng m� c�ng ch�nh v� v�y, nh�ng trang b� c� thu�c t�nh linh kh� kh�ng c�n ch� t�o ���c n�a.")
end

function tianjiawu()
	Talk(1,"",strTitle.."V�n v�t tr�n th� gian ��u c� gi� tr� ri�ng, gi� tr� t�y v�o linh kh� �t hay nhi�u, khi ch� t�o trang b� t�ng v�t ph�m th�m v�o, c� th� t�ng m�c linh kh� t�i �a v� t�ng s� l� kh�m n�m linh th�ch tr�n trang b�. M�c linh kh� t�i �a c�a trang b� quy�t ��nh m�c linh kh� �� kh�m n�m linh th�ch, v� s� l� quy�t ��nh n� c� th� kh�m bao nhi�u linh th�ch, c� th� th�nh thu�c t�nh b�t qu�i hay kh�ng, cho n�n n�u ���c th� c� g�ng th�m v�i v�t c� gi� tr�.")
end

function xiangqianzhuyi()
	Talk(1,"",strTitle.."� tr�n �� nh�c ��n r�i, tr�n trang b� c� m�c linh kh� t�i �a v� l� kh�m n�m, 1 trang b� kh�m <color=yellow>3 vi�n<color> linh th�ch, khi m�c linh kh� c�a 3 vi�n linh th�ch b�ng v�i m�c linh kh� t�i �a c�a trang b�, s� h�nh th�nh trang b� thu�c t�nh b�t qu�i. Linh th�ch l� s� l� th� m�c linh kh� �m, Linh th�ch l� s� ch�n th� m�c linh kh� d��ng, n�u th� t� Linh Th�ch ���c kh�m kh�ng gi�ng nhau, th� trang b� c� thu�c t�nh b�t qu�i kh�c nhau, tr�n \'B�t qu�i B�o �i�n\' d�nh cho h�u du� c�a C�ng D� Th� Gian c� ghi r�t r� l�m th� n�o �� ch� t�o 1 trang b� c� thu�c t�nh b�t qu�i mong mu�n, c� th�i gian th� xem.")
end

function xinwuqi()
	local nLevel = GetLifeSkillLevel(1, 2)
	if (GetLifeSkillLevel(1, 2) > 1) then
		if (GetTask(LEV_LEARNRECIPE) == 80 and HaveLearnRecipe(1010) == 0) then
        	AddRecipe(1011)
        	Msg2Player("B�n h�c ���c ph�i ch�: ��i H�o L�i Th��ng")
        	AddRecipe(1005)
        	Msg2Player("B�n h�c ���c ph�i ch�: Li�t Di�m")
        	AddRecipe(1010)
        	Msg2Player("B�n h�c ���c ph�i ch�: A La H�n Tr��ng")
       else
        	Say(strTitle.."N�y, ng��i thanh ni�n, ��ng s�t ru�t, t� ch�t c�a ng��i b�y gi� c�n k�m l�m, ��i ng��i s� d�ng th�nh th�o t�t c� c�c lo�i binh kh� d�i th�ng th��ng, l�c �� ��n t�m ta.",0)
		end
	else
		Talk(1,"","Ng��i v�n ch�a h�c k� n�ng n�y!")
	end
end

function update_max_skill_level()
	Say(strTitle..format("M� r�ng c�p k� n�ng s�n xu�t c�n k� n�ng thu th�p ��t c�p 79 ��ng th�i ti�u hao %d V�ng", 1000), 
		2, "��ng �/update_max_skill_level_ensure", "T�i h� ch� xem qua th�i/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 2) < 79 then
		Talk(1,"",format("Hi�n t�i c�p k� n�ng s�n xu�t ch�a ��t c�p %d, kh�ng th� m� r�ng c�p gi�i h�n k� n�ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng�n l��ng kh�ng �� %d v�ng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 2, 99);
	Msg2Player("Ch�c m�ng c�p gi�i h�n k� n�ng s�n xu�t �� ��t c�p 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end
