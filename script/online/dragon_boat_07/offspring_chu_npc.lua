--�ű����ƣ�2007����NPC�ű�
--�ű����ܣ��NPC�ű�
--��߻��ˣ�С����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-05-24
--�����޸ļ�¼��
--=====================================ȫ�ֱ���������============================
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\dragon_boat_07\\dragon_boat_08_head.lua")

	flower_goods_id = 1140
	frag_sao_goods_id = 1139
	keepsake_num_TaskID = 1227
	zong_zi_date_seq = 1228
	zong_zi_num_restrict_TaskID = 1230
	zong_zi_start_TaskID = 1231
	chg_mertiral_TaskTempID = 168
	keepsake_date_TaskID = 1241
	dragon_boat_07_join_TaskID = 1242
	Tb_keepsake_chg_way = {
		{"L� g�i b�nh",800,1130},
		{"T�c M�",320,1129},
		{"Tr�c ��ng",320,1131},
		{"H�m Th�y",200,1132},
		{"�ch Tr� Nh�n",160,1133},
		{"��u ��",96,1134},
		{"g�o tr�ng",64,1135},
		{"Ng�i di�p",32,1136},
		{"��i n��ng",16,1137},
		{"T�c t�",8,1138},
	}
	Tb_zong_zi_info = {}
	Tb_zong_zi_info[1118] = {{"��ng t�ng","Nguy�n li�u h�p th�nh c� b�n v� hi�u","",70,1000,"delete_all","to�n b� nguy�n li�u s� bi�n m�t"},{"L� g�i b�nh",1130,1,0},{"T�c M�",1129,1,1},{"Tr�c ��ng",1131,1,2}}
	Tb_zong_zi_info[1119] = {{"B�nh �t H�m Th�y","Nguy�n li�u h�p th�nh c� b�n v� hi�u","",70,1000,"delete_all","to�n b� nguy�n li�u s� bi�n m�t"},{"L� g�i b�nh",1130,1,0},{"H�m Th�y",1132,1,3},{"��ng t�ng",1118,1}}
	Tb_zong_zi_info[1120] = {{"�ch Tr� T�ng","Lo�i b�nh n�y kh�ng c� g� ��c bi�t","",70,1500,"delete_all","to�n b� nguy�n li�u s� bi�n m�t"},{"L� g�i b�nh",1130,1,0},{"�ch Tr� Nh�n",1133,1,4},{"B�nh �t H�m Th�y",1119,1}}
	Tb_zong_zi_info[1121] = {{"B�nh �t ��u ��","Lo�i b�nh n�y kh�ng c� g� ��c bi�t","",60,2000,"delete_all","to�n b� nguy�n li�u s� bi�n m�t"},{"L� g�i b�nh",1130,1,0},{"��u ��",1134,1,5},{"�ch Tr� T�ng",1120,1}}
	Tb_zong_zi_info[1122] = {{"b�nh �t g�o tr�ng","Lo�i b�nh n�y kh�ng c� g� ��c bi�t","",50,4000,"delete_all","to�n b� nguy�n li�u s� bi�n m�t"},{"L� g�i b�nh",1130,1,0},{"g�o tr�ng",1135,1,6},{"B�nh �t ��u ��",1121,1}}
	Tb_zong_zi_info[1123] = {{"B�nh �t Ng�i h��ng","Sau khi s� d�ng c� th� ��i <color=yellow>50 v�n*��ng c�p*��ng c�p/6400<color> �i�m s�c kh�e th�nh kinh nghi�m","returngolden_exp_chg(500000)",50,6000,"delete_all","to�n b� nguy�n li�u s� bi�n m�t"},{"L� g�i b�nh",1130,1,0},{"Ng�i di�p",1136,1,7},{"b�nh �t g�o tr�ng",1122,1}}
	Tb_zong_zi_info[1124] = {{"b�nh �t ch�n g�","N�i <color=yellow>10<color> ph�t sau khi s� d�ng, Sinh l�c t�ng th�m <color=yellow>30##<color>","returnlife_improve()",50,10000,"delete_all","to�n b� nguy�n li�u s� bi�n m�t"},{"L� g�i b�nh",1130,1,0},{"��i n��ng",1137,1,8},{"B�nh �t Ng�i h��ng",1123,1}}
	Tb_zong_zi_info[1125] = {{"b�nh �t B�c B�o","N�i <color=yellow>3<color> ph�t sau khi s� d�ng, to�n b� n�ng l�c t�ng th�m <color=yellow>60<color> �i�m","returnability_improve()",33,40000,"delete_all","to�n b� nguy�n li�u s� bi�n m�t"},{"L� g�i b�nh",1130,1,0},{"T�c t�",1138,1,9},{"b�nh �t ch�n g�",1124,1}}
	Tb_zong_zi_info[1126] = {{"b�nh �t vui v�","C� th� ��i 1 quy�n <color=yellow>S� M�n l�nh th�<color> � ��y ho�c nh�n <color=yellow>100-200<color> �i�m danh v�ng ng�u nhi�n","returnbook_renation_add()",33,80000,"1125","T�n th�t 1 c�i B�nh �t b�t b�o"},{"b�nh �t B�c B�o",1125,3}}
	Tb_zong_zi_info[1127] = {{"b�nh �t may m�n","C� th� ��n g�p ta �� ��i 1 quy�n <color=yellow>M�t T�ch S� m�n<color>","returniron_stone_add()",33,100000,"1126"," s� t�n th�t 1 B�nh �t Vui v�"},{"b�nh �t vui v�",1126,3}}
	Tb_zong_zi_info[1128] = {{"b�nh �t th�ch anh","C� th� ��i 1 quy�n m�t t�ch <color=red>L�ng Ba Vi B�<color>","returnsecret_book_add()",20,400000,"1127"," s� t�n th�t 1 B�nh �t May m�n"},{"b�nh �t may m�n",1127,3}}
	Tb_zong_zi_num_restrict = {}
	Tb_zong_zi_num_restrict[1126] = {1,3,5,7}
	Tb_zong_zi_num_restrict[1127] = {2,3,6,7}
	Tb_zong_zi_num_restrict[1128] = {4,5,6,7}
	Tb_zong_zi_chg_dia = {}
	Tb_zong_zi_chg_dia[1126]= 	{"Ta mu�n ��i 1 quy�n S� M�n l�nh th�/#prize_get(1126,1,1016)",
								"Ta mu�n t�ng danh v�ng/#repute_add(1126,100,200)",
								"Ta t��ng t��ng xem n�o!/end_dialog",
								}
	Tb_zong_zi_chg_dia[1126].say = "<color=green>Truy�n nh�n n��c S�<color>: Qu� nhi�n l� lo�i <color=yellow>B�nh �t vui v�<color> hi�m th�y, � ��y c� quy�n <color=yellow>S� m�n l�nh th�<color> c� th� gi�p �i�m c�ng hi�n s� m�n trong ng�y c�a ng��i nh�n ��i, hay ng��i mu�n danh v�ng giang h� t�ng <color=yellow>100-200 �i�m<color>, suy ngh� k� r�i h�y b�i t�?"
	Tb_zong_zi_chg_dia[1127]= 	{"Ta x�c nh�n t� b�i!/tech_book_add",
								"Ta t��ng t��ng xem n�o!/end_dialog",
								}
	Tb_zong_zi_chg_dia[1127].say = "Th� ra l� <color=yellow>B�nh �t May m�n<color>, l�o phu ta c� c�c <color=yellow>B� ki�p<color> m�t truy�n c�a c�c m�n ph�i. N�u ng��i gia nh�p m�n ph�i ta s� t�ng ng��i 1 quy�n. N�u ch�a gia nh�p th� c�n ph�i xem v�n kh� c�a ng��i ��. Mu�n b�i t� kh�ng?"
	Tb_zongzi_teach_book = {}
	Tb_zongzi_teach_book[21]={"Kim Cang Ph�c Ma kinh",0,107,1}
	Tb_zongzi_teach_book[22]={"Kim Cang Ph�c Ma T�m Ph�p",0,107,2}
	Tb_zongzi_teach_book[41]={"Ti�m Long M�t t�ch",0,107,3}
	Tb_zongzi_teach_book[42]={"Ti�m Long T�m Ph�p",0,107,4}
	Tb_zongzi_teach_book[31]={"V� Tr�n M�t t�ch",0,107,5}
	Tb_zongzi_teach_book[32]={"V� Tr�n T�m Ph�p",0,107,6}
	Tb_zongzi_teach_book[61]={"Thi�n La M�t T�ch",0,107,7}
	Tb_zongzi_teach_book[62]={"Thi�n La T�m Ph�p",0,107,8}
	Tb_zongzi_teach_book[81]={"Nh� � M�t T�ch",0,107,9}
	Tb_zongzi_teach_book[82]={"Nh� � T�m Ph�p",0,107,10}
	Tb_zongzi_teach_book[91]={"B�ch H�i Ph�",0,107,11}
	Tb_zongzi_teach_book[92]={"B�ch H�i T�m Ph�p",0,107,12}
	Tb_zongzi_teach_book[111]={"H�n ��n M�t t�ch",0,107,13}
	Tb_zongzi_teach_book[112]={"H�n ��n T�m Ph�p",0,107,14}
	Tb_zongzi_teach_book[121]={"Qu� Thi�n M�t t�ch",0,107,15}
	Tb_zongzi_teach_book[122]={"Qu� Thi�n T�m Ph�p",0,107,16}
	Tb_zongzi_teach_book[141]={"Huy�n �nh M�t t�ch",0,107,17}
	Tb_zongzi_teach_book[142]={"Huy�n �nh T�m Ph�p",0,107,18}
	Tb_zongzi_teach_book[151]={"Qu�n T� M�t t�ch",0,107,19}
	Tb_zongzi_teach_book[152]={"Qu�n T� T�m Ph�p",0,107,20}
	Tb_zongzi_teach_book[171]={"Tr�n Qu�n M�t t�ch",0,107,21}
	Tb_zongzi_teach_book[172]={"Tr�n Qu�n T�m Ph�p",0,107,22}
	Tb_zongzi_teach_book[181]={"Xuy�n V�n M�t t�ch",0,107,23}
	Tb_zongzi_teach_book[182]={"Xuy�n V�n T�m Ph�p",0,107,24}
	Tb_zongzi_teach_book[201]={"U Minh Qu� L�c",0,107,25}
	Tb_zongzi_teach_book[202]={"U Minh T�m Ph�p",0,107,26}
	Tb_zongzi_teach_book[211]={"Linh C� M�t t�ch",0,107,27}
	Tb_zongzi_teach_book[212]={"Linh C� T�m Ph�p",0,107,28}
	Tb_player_route = {2,3,4,6,8,9,11,12,14,15,17,18,20,21}
	Tb_zong_zi_chg_dia[1128] = {"Ta x�c nh�n t� b�i!/#prize_get(1128,112,78)",
								"Ta t��ng t��ng xem n�o!/end_dialog",
								}
	Tb_zong_zi_chg_dia[1128].say= "Th� ra l� <color=yellow>B�nh �t Th�y tinh<color>���y l� B� ki�p <color=yellow>'L�ng Ba Vi B�'<color>. Xem ra ng��i c�p duy�n v�i n�...Mu�n b�i t� kh�ng?"
--linshi
--2008����
Tb_dialog_main = {
	"Ta mu�n l�m b�nh �t ��n b�i Khu�t Nguy�n ��i phu/zongzi_cook",
	"Ta c�n d�ng lo�i b�nh �t hi�m th�y �� c�ng t� Khu�t Nguy�n ��i phu/zongzi_chg",
	"Ta mu�n t�m hi�u c�ch l�m b�nh �t/zongzi_info",
	"Ta ch� ��n xem th�/end_dialog"
}
--======================================�������߼���=============================
function main()
	if GetLevel() < 10 then
		Talk(1,"","<color=green>Di t�c S� qu�c<color>: <color=yellow>"..Zgc_pub_sex_name().."<color> n�ng l�c c�n y�u, hay l� quay l�i sau v�y!")
		return
	end
	if dragon_boat_08_time_chk() == 0 then
		Talk(1,"","<color=green>Di t�c S� qu�c<color>: <color=yellow>"..Zgc_pub_sex_name().."<color> ��ng n�ng v�i, ��i ��n tr��c ��m �oan Ng� (<color=yellow>m�ng 5 th�ng 5<color>) ch�ng ta s� m� ho�t ��ng �oan Ng� ho�n to�n m�i, m�i ng��i c�ng nhau c�ng t� Khu�t Nguy�n ��i phu.")
		return
	else
		Say("<color=green>Truy�n nh�n n��c S�<color>: �, l�i s�p ��n <color=yellow>T�t �oan Ng�<color> r�i, m�i n�m c� ��n ng�y n�y Truy�n nh�n n��c S� c�a ch�ng ta r�t th��ng t�m. T�t c� con ch�u c�a ��i nh�n Khu�t Nguy�n v� �� t��ng nh� ��n �ng �� t�o m�t c�i l�u l�m b�nh �t, �� ph�c v� g�i b�nh cho m�i ng��i, ch� c�n b�n mang nguy�n li�u ��n l� ���c.",
		getn(Tb_dialog_main),
		Tb_dialog_main
		)
	end
end
--��������������
function zongzi_cook()
	 --���������Ի�
	local Tb_dialog_zongzi_cook ={}
	local zongzi_able_cook_num = 0
	if dragon_boat_08_time_chk() == 1 then
		zongzi_able_cook_num = getn(Tb_zongzi_08)
	else
		zongzi_able_cook_num = (getn(Tb_zongzi_08) - 4)
	end
	--�Ի��ϳ�
	for i = 1 ,zongzi_able_cook_num do
		tinsert(Tb_dialog_zongzi_cook,Tb_zongzi_08[i][1]..", c�ng d�ng: "..Tb_zongzi_08[i][6].."; t� l� th�nh c�ng: "..Tb_zongzi_08[i][3].."%/#zongzi_cook_chk("..i..")")
	end
	tinsert(Tb_dialog_zongzi_cook,"M�t qu� �i! Ta kh�ng l�m n�a!/end_dialog")
	--�Ի�չ��
	Say("<color=green>Truy�n nh�n n��c S�<color>: Mu�n l�m m�t c�i b�nh ngon kh�ng ph�i l� vi�c d�, c�n ph�i �� nguy�n li�u. Ng��i mu�n l�m m�t c�i b�nh nh� th� n�o?",
	getn(Tb_dialog_zongzi_cook),
	Tb_dialog_zongzi_cook
	)
end
--��������ȷ�϶Ի�
function zongzi_cook_chk(zongzi_diff)
	Say("<color=green>Di t�c S� qu�c<color>: <color=yellow>"..Tb_zongzi_08[zongzi_diff][1].."<color>, c�ng d�ng: <color=yellow>"..Tb_zongzi_08[zongzi_diff][6].."<color>; nguy�n li�u: <color=yellow>"..Tb_zongzi_08[zongzi_diff][5][1][3].."("..Tb_zongzi_08[zongzi_diff][5][1][2].."),"..Tb_zongzi_08[zongzi_diff][5][2][3].."("..Tb_zongzi_08[zongzi_diff][5][2][2].."),"..Tb_zongzi_08[zongzi_diff][5][3][3].."("..Tb_zongzi_08[zongzi_diff][5][3][2]..")<color>, t� l� th�nh c�ng: <color=yellow>"..Tb_zongzi_08[zongzi_diff][3].."%<color>. Ng��i x�c nh�n mu�n l�m ch�?",
	2,
	"Ta x�c nh�n/#zongzi_cook_dtm("..zongzi_diff..")",
	"�� ta suy ngh� l�i/zongzi_cook"
	)	
end
--ȷ����������
function zongzi_cook_dtm(zongzi_diff)
	local zongzi_num_min = min(floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][1][1])/Tb_zongzi_08[zongzi_diff][5][1][2]),floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][2][1])/Tb_zongzi_08[zongzi_diff][5][2][2]),floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][3][1])/Tb_zongzi_08[zongzi_diff][5][3][2]))
	if zongzi_num_min == 0 then
		Talk(1,"","<color=green>Di t�c S� qu�c<color>: <color=yellow>"..Tb_zongzi_08[zongzi_diff][1].."<color> nguy�n li�u g�m <color=yellow>"..Tb_zongzi_08[zongzi_diff][5][1][3].."("..Tb_zongzi_08[zongzi_diff][5][1][2].."),"..Tb_zongzi_08[zongzi_diff][5][2][3].."("..Tb_zongzi_08[zongzi_diff][5][2][2].."),"..Tb_zongzi_08[zongzi_diff][5][3][3].."("..Tb_zongzi_08[zongzi_diff][5][3][2]..")<color>, c� th� <color=yellow>"..Zgc_pub_sex_name().."<color> ngay c� nguy�n li�u l�m 1 c�i <color=yellow>"..Tb_zongzi_08[zongzi_diff][1].."<color> c�ng kh�ng ��, c� ph�i �� qu�n trong r��ng kh�ng?")
		return
	end
	SetTaskTemp(chg_mertiral_TaskTempID,zongzi_diff)
	AskClientForNumber("zongzi_get",1,zongzi_num_min,"Xi nh�p s� l��ng b�n mu�n l�m "..Tb_zongzi_08[zongzi_diff][1].."!")
end
--��ʼ��������
function zongzi_get(zongzi_num)
	local zongzi_diff = GetTaskTemp(chg_mertiral_TaskTempID)
	--��������Ϊ0ʱ������
	if zongzi_num == 0 then
		return
	end
	--�ռ为�ؼ��
	if Zgc_pub_goods_add_chk(4,(50 + zongzi_num)) ~= 1 then
		return
	end
	--����Я�����
	if mertiral_chk(1,zongzi_diff,zongzi_num) ~= 1 then
		Talk(1,"","<color=green>Truy�n nh�n n��c S�<color>: Nguy�n li�u ng��i �em kh�ng ��, c� ph�i �� qu�n trong r��ng kh�ng?")
		return
	end
	--����ɾ�����
	if mertiral_chk(2,zongzi_diff,zongzi_num) ~= 1 then
		Talk(1,"","<color=green>Truy�n nh�n n��c S�<color>: Nguy�n li�u ng��i �em kh�ng ��, c� ph�i �� qu�n trong r��ng kh�ng?")
		return
	end
	--�������ʼ���
	if Tb_zongzi_08[zongzi_diff][3] ~= 100 then
		local ran_num = 0
		for i = 1,zongzi_num do
			ran_num = random(1,100)
			if ran_num > Tb_zongzi_08[zongzi_diff][3]  then
				zongzi_num = zongzi_num - 1
			end
		end
	end
	if zongzi_num == 0 then
		Talk(1,"","<color=green>Truy�n nh�n n��c S�<color>: Th�t ��ng ti�c, "..Tb_zongzi_08[zongzi_diff][1].."Th�t b�i r�i!")
		return
	end
	--��������
	local add_flag = AddItem(2,1,Tb_zongzi_08[zongzi_diff][2],zongzi_num)
	if add_flag == 1 then
		Msg2Player("Ch�c m�ng b�n �� ch� t�o th�nh c�ng"..zongzi_num.."c�i"..Tb_zongzi_08[zongzi_diff][1].."!")
	else
		WriteLog("[T�t �oan Ng� 08] ng��i ch�i	"..GetName().."	T�ng"..zongzi_num.."c�i"..Tb_zongzi_08[zongzi_diff][1].." th�t b�i, k� hi�u:"..add_flag)
	end
	--������������
	--��װ����װ����
	if dragon_boat_08_time_chk() == 1 then
		for i = 1,zongzi_num do
			suit_add(zongzi_diff)
			exp_add()
		end
	end
end
--���ϼ��,�����־��1������Я����⣬2������ɾ��
function mertiral_chk(deal_flag,zongzi_diff,zongzi_num)
	if deal_flag == 1 then
		if zongzi_num > min(floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][1][1])/Tb_zongzi_08[zongzi_diff][5][1][2]),floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][2][1])/Tb_zongzi_08[zongzi_diff][5][2][2]),floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][3][1])/Tb_zongzi_08[zongzi_diff][5][3][2])) then
			return 0
		else
			return 1
		end
	else
		if DelItem(2,1,Tb_zongzi_08[zongzi_diff][5][1][1],(Tb_zongzi_08[zongzi_diff][5][1][2] * zongzi_num)) == 1 and 
		DelItem(2,1,Tb_zongzi_08[zongzi_diff][5][2][1],(Tb_zongzi_08[zongzi_diff][5][2][2] * zongzi_num)) == 1 and 
		DelItem(2,1,Tb_zongzi_08[zongzi_diff][5][3][1],(Tb_zongzi_08[zongzi_diff][5][3][2] * zongzi_num)) == 1 then
			return 1
		else
			return 0
		end
	end
end
--��װ����
function suit_add(zongzi_diff)
	--����Ѿ�����һ�ף��򷵻�
	local suit_got = GetTask(TaskID_suit_prize)
	if strlen(tostring(suit_got)) >= 3 then
		return
	end
	local ran_num = random(1,1000)
	if ran_num > Tb_zongzi_08[zongzi_diff][4] then
		return
	else
		local player_body = GetBody()
		local ran_seq_num = random(1,3) --˳������м���
		for i = 1,3 do
			local add_seq = (mod((i +ran_seq_num),3) +1)
			if strfind(tostring(suit_got),tostring(add_seq))  == nil then
				local add_flag = AddItem(Tb_suit_prize[add_seq][player_body][2],Tb_suit_prize[add_seq][player_body][3],Tb_suit_prize[add_seq][player_body][4],1)
				if add_flag == 1 then
					Msg2Player("Ch�c m�ng! B�n nh�n ���c 1 "..Tb_suit_prize[add_seq][player_body][1].."!")
				else
					WriteLog("[T�t �oan Ng� 08] ng��i ch�i	"..GetName().."	T�ng"..Tb_suit_prize[add_seq][player_body][1].." th�t b�i, k� hi�u:"..add_flag)
				end
				--��¼����
				SetTask(TaskID_suit_prize,(suit_got * 10 + add_seq))
				suit_got = GetTask(TaskID_suit_prize)
				--�Ƿ�������һ�׵Ĵ���
				if Tb_zongzi_08[zongzi_diff][4] < 50 then
					break
				end
			end
		end
	end
end
--��������
function exp_add()
	local date_seq_save = GetTask(TaskID_exp_get_date_seq)
	local chg_num_save = GetTask(TaskID_exp_get_times)
	local date_seq_now = zgc_pub_day_turn(1)
	if date_seq_save < date_seq_now then
		SetTask(TaskID_exp_get_date_seq,date_seq_now)
		SetTask(TaskID_exp_get_times,1)
		chg_num_save = 0
	elseif date_seq_save == date_seq_now then
		SetTask(TaskID_exp_get_times,(chg_num_save + 1))
	else
		return
	end
	--10�����ϲ�������
	if chg_num_save > 20 then
		return
	end
	if 	 GetLevel() == 99 then
		laborday08_baoshi_prob()
	else
		local player_level = GetLevel()
		local exp_add_num = floor(player_level*player_level*player_level*player_level * cifang_caculate(0.5 , chg_num_save)/6)
		if Sever_diff == 2 then
			exp_add_num = floor(exp_add_num * 0.75)
		end
		if exp_add_num > 0 then
			ModifyExp(exp_add_num)
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..exp_add_num.." �i�m kinh nghi�m!")
		end	
	end
end
--�η�����
function cifang_caculate(a,b)
	local num_rtn = 1
	if b == 0 then
		return 1
	else
		for i = 1 , b do
			num_rtn = (num_rtn * a)
		end
		return num_rtn
	end
end
--���Ӷһ�����
function zongzi_chg()
	Say("Truy�n nh�n n��c S�: Ng��i mu�n d�ng b�nh �t g� b�i t� Khu�t Nguy�n ��i phu, n�u lo�i th�ng th��ng th� kh�ng c�n, b�n ta c� nhi�u r�i.",
		6,
		"Ng��i xem th� B�nh �t B�ch Ng�c th� nh� th� n�o?/zongzi_baiyu",
		"Ng��i xem th� B�nh �t Ng� Ph�m th� nh� th� n�o?/zongzi_yupin",
		"H�y xem th� B�nh �t Vui v� th� n�o?/#zong_zi_up(1126)",
		"H�y xem th� B�nh �t May m�n th� n�o?/#zong_zi_up(1127)",
		"H�y xem th� B�nh �t Th�y tinh th� n�o?/#zong_zi_up(1128)",
		"Ta � ��y ch� c� b�nh �t th��ng, �� ta th� l�m l�i xem "
	)
end
--�������Ӵ���
--��������
function zongzi_baiyu()
	if zongzi_chg_astrict(1,1) ~= 1 then
		return
	end
	Say("<color=green>Truy�n nh�n n��c S�<color>: Qu� nhi�n l� <color=yellow>B�nh �t B�ch Ng�c<color>, l�o phu c� m�t �t trang b� kh�ng t�i, t�ng ng��i 1 m�n, ng��i x�c nh�n mu�n t� b�i r�i ch�?",
	3,
	"�ng c� nh�ng trang b� n�o/baiyu_prize_info",
	"Ta x�c nh�n t� b�i!/baiyu_use_dtm",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--�������ӽ�������
function baiyu_prize_info()
	Talk(1,"zongzi_baiyu","<color=green>Truy�n nh�n n��c S�<color>: <color=red>Linh th�ch c�p 7 (2 vi�n), T�ng Ki�m T� Kim M�o, T�ng Ki�m Kim L� Th��ng, T�ng Ki�m � Kim Trang, T�ng Ki�m B�o Ch�u, T�ng Ki�m K� Th�ch, T�ng Ki�m Kim �n<color>, ��u l� nh�ng v�t qu� c�.")
end
--��������ȷ��ʹ��
function baiyu_use_dtm()
	--�ռ为�ؼ��
	if Zgc_pub_goods_add_chk(1,100	) ~= 1 then
		return
	end
	--Я��ɾ�����
	for i = 1,2 do
		if zongzi_use_dtm(i,7) ~= 1 then
			return
		end
	end
	--��������
	local ran_num = random(1,100)
	if ran_num <= Tb_baiyu_prize[getn(Tb_baiyu_prize)][1] then	--���Ӳؽ�װ��
		local add_flag = 0
		for i = 1,getn(Tb_baiyu_prize) do
			if ran_num <= Tb_baiyu_prize[i][1] then
				if type(Tb_baiyu_prize[i][2][1]) == "table" then
					local player_body = GetBody()
					add_flag = AddItem(Tb_baiyu_prize[i][2][player_body][1],Tb_baiyu_prize[i][2][player_body][2],Tb_baiyu_prize[i][2][player_body][3],1,1,-1,-1,-1,-1,-1,-1)
				else
					add_flag = AddItem(Tb_baiyu_prize[i][2][1],Tb_baiyu_prize[i][2][2],Tb_baiyu_prize[i][2][3],1,1,-1,-1,-1,-1,-1,-1)
				end
				if add_flag == 1 then
					Msg2Player("Ch�ng m�ng b�n �� d�ng 'B�nh �t B�ch Ng�c' ��i ���c 1 '"..Tb_baiyu_prize[i][3].."!")
					Msg2SubWorld("Ng��i ch�i:"..GetName().." d�ng B�nh �t B�ch Ng�c' ��i th�nh c�ng 1 '"..Tb_baiyu_prize[i][3].."!")
				else
					WriteLog("[T�t �oan Ng� 08] ng��i ch�i	"..GetName().."	T�ng"..Tb_baiyu_prize[i][3].." th�t b�i, k� hi�u:"..add_flag)
				end
				break
			end
		end
	else	--������ʯ
		lspf_AddLingShiInBottle(7,2)
		Msg2Player("B�n nh�n ���c 2 vi�n Linh th�ch c�p 7, �� cho v�o T� Linh ��nh!")
	end
	zongzi_chg_astrict(1,2)
end
--��Ʒ����
Tb_dialog_yupin = {
	"Ta c�n Vi�m Ho�ng Thi�t H�n/#yupin_use_dtm(1)",
	"Ta c�n 12 vi�n Linh th�ch c�p 7/#yupin_use_dtm(4)",
}
if Sever_diff == 2 then
	tinsert(Tb_dialog_yupin,"Ta c�n Phi�n V�/#yupin_use_dtm(2)")
	tinsert(Tb_dialog_yupin,"Ta c�n Si�u Quang/#yupin_use_dtm(3)")
end
tinsert(Tb_dialog_yupin,"�� ta suy ngh� l�i/end_dialog")
function zongzi_yupin()
	if zongzi_chg_astrict(2,1) ~= 1 then
		return
	end
	Say("<color=green>Truy�n nh�n n��c S�<color>: Qu� nhi�n l� <color=red>B�nh �t Ng� Ph�m<color>, l�o phu kh�ng gi�u g� ng��i, ��ch th�c t� ti�n nh� ta l� th� v� c�a n��c S�, ��y l� <color=red>Vi�m Ho�ng Thi�t H�n<color> do t� ti�n truy�n l�i, d�ng �� t�o binh kh� th�n th�ng, ho�c <color=red>12 vi�n Linh th�ch c�p 7<color>, ho�c <color=red>B�ch T�c Th�n C�u (th� c��i v�nh vi�n)<color>, ng��i ch�n 1 th� �i, ng��i �� suy ngh� k� mu�n b�i t� r�i ch�?",
	getn(Tb_dialog_yupin),
	Tb_dialog_yupin
	)
end
--����ʹ��ȷ����Ϣ
function yupin_use_dtm(prize_diff)
	Say("<color=green>Truy�n nh�n n��c S�<color>: Ta c�ng bi�t <color=red>B�nh �t Ng� Ph�m<color>"..Zgc_pub_sex_name().."Kh�ng d� c�, x�c nh�n d�ng v�t n�y ��i <color=red>"..Tb_yupin_prize[prize_diff][getn(Tb_yupin_prize[prize_diff])].."<color>!",
	2,
	"Ta x�c nh�n ��i /#yupin_chg("..prize_diff..")",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--��Ʒ�����һ�
function yupin_chg(prize_diff)
	--�ռ为�ؼ��
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--Я��ɾ�����
	for i = 1,2 do
		if zongzi_use_dtm(i,9) ~= 1 then
			return
		end
	end
	--��������
	local add_flag = 0
	if prize_diff == 1 then
		add_flag = AddItem(Tb_yupin_prize[prize_diff][1],Tb_yupin_prize[prize_diff][2],Tb_yupin_prize[prize_diff][3],1)
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1"..Tb_yupin_prize[prize_diff][4].."!")
		Msg2Player("Ng��i ch�i '"..GetName().." t�i Truy�n nh�n n��c S�' d�ng 1 B�nh �t Ng� Ph�m ��i 1 "..Tb_yupin_prize[prize_diff][4].."!")
	elseif prize_diff == 2 or prize_diff == 3 then
		add_flag = AddItem(Tb_yupin_prize[prize_diff][1],Tb_yupin_prize[prize_diff][2],Tb_yupin_prize[prize_diff][3],1,1,-1,-1,-1,-1,-1,-1)
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 "..Tb_yupin_prize[prize_diff][4].."!")
		Msg2Player("Ng��i ch�i '"..GetName().." t�i Truy�n nh�n n��c S�' d�ng 1 B�nh �t Ng� Ph�m ��i 1 "..Tb_yupin_prize[prize_diff][4].."!")
	else
		lspf_AddLingShiInBottle(7,12)
		Msg2Player("Ng��i ch�i '"..GetName().." t�i Truy�n nh�n n��c S�' d�ng 1 B�nh �t Ng� Ph�m ��i "..Tb_yupin_prize[prize_diff][1].."!")
		add_flag = 1
	end
	if add_flag ~= 1 then
		WriteLog("[T�t �oan Ng� 08] ng��i ch�i	"..GetName().."	T�ng"..Tb_yupin_prize[prize_diff][4].." th�t b�i, k� hi�u:"..add_flag)
	end
	zongzi_chg_astrict(2,2)
end
--���Ӷһ�����ͳһ����
function zongzi_chg_astrict(zongzi_diff,deal_diff)
	if deal_diff == 1 then
		if GetTask(Tb_zongzi_use_num[zongzi_diff][2]) >= Tb_zongzi_use_num[zongzi_diff][3] then
			Talk(1,"","<color=green>Truy�n nh�n n��c S�<color>: Ph�n th��ng c�a l�o phu c� h�n, m�i ng��i ch�i ch� c� th� ��i <color=yellow>"..Tb_zongzi_use_num[zongzi_diff][1]..Tb_zongzi_use_num[zongzi_diff][3].."<color> l�n!")
			return 0
		end
	else
		local zongzi_chg_times = GetTask(Tb_zongzi_use_num[zongzi_diff][2])
		SetTask(Tb_zongzi_use_num[zongzi_diff][2],(zongzi_chg_times+1))
		Talk(1,"","<color=green>Truy�n nh�n n��c S�<color>: Ng��i �� ��i <color=yellow>"..(zongzi_chg_times+1).."<color> l�n <color=yellow>"..Tb_zongzi_use_num[zongzi_diff][1].."<color>, c�n c� th� ��i <color=red>"..(Tb_zongzi_use_num[zongzi_diff][3] - (zongzi_chg_times+1)).."<color> l�n!")
	end
	return 1
end
--����Я��\ɾ�����
function zongzi_use_dtm(chk_flag,goods_diff)
	if chk_flag == 1 then
		if GetItemCount(2,1,Tb_zongzi_08[goods_diff][2]) == 0 then
			Talk(1,"","<color=green>Nh�c nh�<color>: Ng��i kh�ng mang theo <color=yellow>"..Tb_zongzi_08[goods_diff][1].."<color>!")
			return 0
		end
	elseif chk_flag == 2 then
		if DelItem(2,1,Tb_zongzi_08[goods_diff][2],1) ~= 1 then
			Talk(1,"","<color=green>Nh�c nh�<color>: Ng��i kh�ng mang theo <color=yellow>"..Tb_zongzi_08[goods_diff][1].."<color>!")
			return 0
		end
	end
	return 1
end
--ԭ�����Ӵ���
	--���Ӽ���ȷ�϶Ի�
	function zong_zi_up(zong_zi_id)
		Say(Tb_zong_zi_chg_dia[zong_zi_id].say,
			getn(Tb_zong_zi_chg_dia[zong_zi_id]),
			Tb_zong_zi_chg_dia[zong_zi_id]
		)
	end
	--��Ʒ�һ�
	function prize_get(zong_zi_id,prize_type,prize_id)
		--ͨ�ü��
		if zong_zi_cond_chk(zong_zi_id) ~= 1 then
			return
		end
		--prize����
		if prize_type == 1 then
			if AddItem(2,1,prize_id,1) == 1 then
				Msg2Player("Ch�c m�ng b�n s� d�ng ' "..Tb_zong_zi_info[zong_zi_id][1][1].." ��i ph�n th��ng th�nh c�ng")
			end
		else
			if AddItem(0,prize_type,prize_id,1) == 1 then
				Msg2Player("Ch�c m�ng b�n s� d�ng ' "..Tb_zong_zi_info[zong_zi_id][1][1].." ��i ph�n th��ng th�nh c�ng")
			end
		end
		WriteLog("07 �oan ng�- "..GetName().."S� d�ng "..Tb_zong_zi_info[zong_zi_id][1][1].." ��i ph�n th��ng th�nh c�ng")
	end
	--�����������
	function happy_zongzi_prize(prize_diff)
		--�����ж�
		local date_save = GetTask(happy_zong_zi_date_TaskID)
		local num_save = GetTask(happy_zong_zi_num_TaskID)
		local date_now = zgc_pub_day_turn(1)
		if date_save >= date_now and num_save >= happy_zong_zi_restrict_num then
			Talk(1,"","<color=green>Di t�c S� qu�c<color>: <color=yellow>B�nh �t Vui v�<color m�i ng�y ��n g�p ta �� ��i <color=red>"..happy_zong_zi_restrict_num.."<color> l�n!")
			return
		end
		--��ʼ�Ի�
		local prize_dia = "<color=green>Di t�c S� qu�c<color>: <color=yellow>B�nh �t Vui v�<color> ��i <color=yellow>"..Tb_happy_zong_zi_prize_name[prize_diff].."<color> t� l� v� tr� s� nh� sau!"
		for i = 1,5 do		--�弶����
			prize_dia = prize_dia.."\n T� l�: <color=yellow>"..Tb_happy_zong_zi_probility[1][i].."  <color> nh�n ���c :"
			if prize_diff == 4 then
				prize_dia = prize_dia.."<color=yellow>"..Zgc_pub_money_name_change(Tb_happy_zong_zi_prize[4][i][1]).." ��n "..Zgc_pub_money_name_change(Tb_happy_zong_zi_prize[4][i][2]).."<color>"
			else
				prize_dia = prize_dia.."<color=yellow>"..Tb_happy_zong_zi_prize[prize_diff][i][1].." ��n "..Tb_happy_zong_zi_prize[prize_diff][i][2].."<color> �i�m"
			end
		end
		Say(prize_dia,
			2,
			"Ta x�c nh�n ��i /#prize_get_dtm("..prize_diff..")",
			"�� ta suy ngh� l�i/end_dialog"
			)
	end
	--�������ӽ�������
	function prize_get_dtm(prize_diff)
		if GetPlayerFaction() == 0 and prize_diff == 3 then
			Talk(1,"","<color=green>Di t�c S� qu�c<color>: <color=yellow>"..Zgc_pub_sex_name().."<color> n�u mu�n t�ng �� c�ng hi�n S� m�n, t�t nh�t n�n gia nh�p m�n ph�i r�i quay l�i ��y!")
			return
		end
		if GetItemCount(2,1,1126) == 0 then
			Talk(1,"","<color=green>Di t�c S� qu�c<color>: Ng��i mang ��n c�i qu�i g� th�! Mu�n ��a v�i ta �?")
			return
		end
		if DelItem(2,1,1126,1) ~= 1 then
			Talk(1,"","<color=green>Di t�c S� qu�c<color>: Ng��i mang ��n c�i qu�i g� th�! Mu�n ��a v�i ta �?")
			return
		end
		local prize_step = random(1,1000)
		for i = 1, getn(Tb_happy_zong_zi_probility[2]) do
			if prize_step <= Tb_happy_zong_zi_probility[2][i] then
				prize_step = i
				break
			end
		end
		local prize_num = random(Tb_happy_zong_zi_prize[prize_diff][prize_step][1],Tb_happy_zong_zi_prize[prize_diff][prize_step][2])
		if prize_diff == 1 then
			ModifyExp(prize_num)
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..prize_num.." �i�m kinh nghi�m!")
		elseif prize_diff == 2 then
			ModifyReputation(prize_num,0)
		elseif prize_diff == 3 then
			SetTask(336,(GetTask(336) + prize_num))
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..prize_num.."�i�m c�ng hi�n s� m�n!")
		else
			Earn(prize_num)
			Msg2Player("Ch�c m�ng b�n nh�n ���c "..Zgc_pub_money_name_change(prize_num).."!")
		end
		--�������Ӵ�������
		local date_save = GetTask(happy_zong_zi_date_TaskID)
		local num_save = GetTask(happy_zong_zi_num_TaskID)
		local date_now = zgc_pub_day_turn(1)
		if date_save < date_now then
			SetTask(happy_zong_zi_date_TaskID,zgc_pub_day_turn(1))
			SetTask(happy_zong_zi_num_TaskID,1)
			SetTask(aixiang_eat_num_TaskID,0)
			num_save = 0
		else
			SetTask(happy_zong_zi_num_TaskID,(num_save + 1))
		end
		Talk(1,"","<color=green>Di t�c S� qu�c<color>: <color=yellow>B�nh �t Vui v�<color> m�i ng�y ch� c� th� ��i <color=yellow>"..happy_zong_zi_restrict_num.."<color> l�n, ��y l� l�n ��i th� <color=yellow>"..(num_save+1).."<color> trong h�m nay!")
		WriteLog("Ho�t ��ng �oan Ng�: Ng��i ch�i s� d�ng 'B�nh �t Vui v�' ��i "..Tb_happy_zong_zi_prize_name[prize_diff].."("..prize_num..")")
	end
	--�����һ�
	function repute_add(zong_zi_id,add_num_min,add_num_max)
		--ͨ�ü��
		if zong_zi_cond_chk(zong_zi_id) ~= 1 then
			return
		end
		local ran_num = random(add_num_min,add_num_max)
		ModifyReputation(ran_num,0)
	end
	--���������������
	function tech_book_add()
		--����Я�����
		if GetItemCount(2,1,1127) == 0 then
			Talk(1,"","<color=green>Di t�c S� qu�c<color>: Ng��i mang ��n c�i qu�i g� th�! Mu�n ��a v�i ta �?")
			return 0
		end
		--�ռ为�ؼ��
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return 0
		end
		--����ɾ�����
		if DelItem(2,1,1127,1) ~= 1 then
			Talk(1,"","<color=green>Di t�c S� qu�c<color>: Ng��i mang ��n c�i qu�i g� th�! Mu�n ��a v�i ta �?")
			return 0
		end
		--�ؼ�����
		local player_route = GetPlayerRoute() 
		local ran_num = random(1,2)
		if player_route ~= 0 then
			ran_num = (player_route * 10) + ran_num
		else
			ran_num = (Tb_player_route[random(1,getn(Tb_player_route))] *10) + ran_num
		end
		if AddItem(Tb_zongzi_teach_book[ran_num][2],Tb_zongzi_teach_book[ran_num][3],Tb_zongzi_teach_book[ran_num][4],1) == 1 then
			Msg2Player("Ch�c m�ng! B�n nh�n ���c 1 quy�n ' "..Tb_zongzi_teach_book[ran_num][1].."!")
		end
	end
	--���Ӽ��ͨ�ú���
	function zong_zi_cond_chk(zong_zi_id)
			--��ƷЯ�����
		if GetItemCount(2,1,zong_zi_id) == 0 then
			Talk(1,"","<color=green>Di t�c S� qu�c<color>: Ng��i mang ��n c�i qu�i g� th�! Mu�n ��a v�i ta �?")
			return 0
		end
		--�ռ为�ؼ��
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return 0
		end
		--��Ʒɾ�����
		if DelItem(2,1,zong_zi_id,1) ~= 1 then
			Talk(1,"","<color=green>Di t�c S� qu�c<color>: Ng��i mang ��n c�i qu�i g� th�! Mu�n ��a v�i ta �?")
			return 0
		end
		return 1
	end
--��������˵��
function zongzi_info()
	Say("<color=green>Truy�n nh�n n��c S�<color>: Kh�ng bi�t ng��i mu�n h�i c�i n�o?",
		4,
		"Ta ph�i l�m sao m�i c� th� b�i t� c�ng c�c ng��i/how_2_cook",
		"Ta c� th� d�ng b�nh �t g� �� b�i t�/which_2_use",
		"Ta mu�n t�m hi�u c�ch l�m b�nh �t/cook_info",
		"Ta �� hi�u/end_dialog"
	)
end
--��μ���
function how_2_cook()
	Talk(1,"zongzi_info","<color=green>Truy�n nh�n n��c S�<color>: T�m <color=green>ch� t�u l�u<color>, ch� �ng ta c� nguy�n li�u b�nh �t, gi� c� r�t h�p l�; �em nguy�n li�u v� ��y, th� l�m b�nh � ��y s� gi�p ng��i l�m <color=yellow>mi�n ph�<color>.")
end
--��ʲô����
function which_2_use()
	Talk(3,"zongzi_info","<color=green>Truy�n nh�n n��c S�<color>: N�u l� b�nh �t th��ng th� kh�ng c�n, nh�ng c�i b�nh hi�m ng��i c�ng c� th� t� d�ng. N�u ng��i �em nh�ng c�i b�nh qu� d��i ��y ��n b�i t�, b�n ta s� kh�ng b�c ��i ng��i ��u, cho ng��i m�t s� v�t qu� hi�m.",
					"<color=green>Truy�n nh�n n��c S�<color>: Sau khi b�i t� <color=yellow>B�nh �t B�ch Ng�c<color> c� th� ng�u nhi�n nh�n ���c m�t trong nh�ng th� sau <color=red>2 vi�n Linh th�ch c�p 7, T�ng Ki�m T� Kim M�o, T�ng Ki�m Kim L� Th��ng, T�ng Ki�m � Kim Trang, T�ng Ki�m B�o Ch�u, T�ng Ki�m K� Th�ch, T�ng Ki�m Kim �n<color>.",
					"<color=green>Truy�n nh�n n��c S�<color>: <color=yellow>B�nh �t Ng� Ph�m<color> sau khi b�i t� c� th� ch�n <color=red>"..Tb_zongzi_08_yupin[Sever_diff].."<color> ."
			)
end
--����˵��
function cook_info()
	Talk(2,"zongzi_info","<color=green>Truy�n nh�n n��c S�<color>: T�t �oan Ng�<color=yellow>[5/6 ��n 9/6]<color> c� th� h�p <color=yellow>B�nh �t g�o th�m, B�nh �t ng�i h��ng, B�nh �t h�t d�, B�nh �t ng� h��ng, B�nh �t Ph� Th�y, B�nh �t B�ch Ng�c, B�nh �t Ng� Ph�m<color>. Trong th�i gian ho�t ��ng ng��i ch�i c�p <color=yellow>10-98<color> h�p b�nh th� s� c� �i�m kinh nghi�m d�a theo ��ng c�p, t�y theo s� l�n m� �i�m kinh nghi�m s� gi�m d�n, cho ��n khi �i�m kinh nghi�m th�p h�n 10 th� s� kh�ng c�n nh�n ���c n�a; ng��i ch�i c�p <color=yellow>99<color> m�i l�n h�p s� nh�n ���c 1 vi�n Linh th�ch ng�u nhi�n t� c�p 1-7, m�i ng�y nhi�u nh�t c� th� nh�n ���c <color=yellow>20<color> vi�n. M�i l�n h�p 1 c�i b�nh ��u c� c� h�i nh�n ���c <color=yellow>Trang ph�c B�t B�t<color>, m�i ng��i nhi�u nh�t c� th� nh�n ���c 1 b�. C� th� ��i ph�n th��ng nhi�u nh�t l� <color=yellow>15 l�n B�nh �t B�ch Ng�c, 5 l�n B�nh �t Ng� Ph�m<color>. (<color=red>B�nh �t B�ch Ng�c v� B�nh �t Ng� Ph�m ch� l�m trong th�i gian n�y<color>)",
		" <color=green>Truy�n nh�n n��c S�<color>: Sau T�t �oan Ng�, c� th� ti�p t�c l�m <color=yellow>B�nh �t g�o th�m, B�nh �t ng�i h��ng, B�nh �t h�t d�, B�nh �t ng� h��ng, B�nh �t Ph� Th�y<color>.")
end