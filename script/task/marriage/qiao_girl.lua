--�ű�����:��Ů�Ի��ű�
--�ű�����:������NPC"��Ů"�Ի��ű�,������������������
--�߻���:����
--���뿪����:�峤
--���뿪��ʱ��:2007��5��15��
--�����޸ļ�¼
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
CALLBACK_FILE = "\\script\\task\\marriage\\qiao_girl.lua";
--================================��������������================================
	Frag_att_num_TaskID = 1220
	goods_id_chg_use_id = 168
	goods_id_chg_id = 169
	get_task_reel_TaskID = 1216

	Tb_frag = {}
	Tb_frag[568] = "Gi�p M�c d��ng"
	Tb_frag[569] = "�t M�c �m"
	Tb_frag[570] = "B�nh h�a d��ng"
	Tb_frag[571] = "�inh H�a �m"

	Tb_ring_up_info = {
	{104,105,"Nh�n kim c��ng th��ng"},
	{106,107,"Nh�n kim c��ng"}
	}

	Tb_ring_attr = {
		{115,20,40,60,80,100},
		{421,20,40,60,80,100}
	}
function main()
	local mate_name = GetMateName()
	if mate_name == "" or mate_name == nil then
		Say("<color=green> <color>: Ng��i n�y <color=yellow>"..Zgc_pub_sex_name().."<color> c� � trung nh�n ch�a? ��n t�m ta khi �� th�nh h�n!",
		3,
		"T�i mu�n dem theo khi ch�t/kill_follower",
		"Ta mu�n s�a v�n �� k�t h�n/repair_marriage",
		"R�i kh�i/end_dialog")
	else
		if BigGetItemCount(2,1,583) == 0 then
			if Zgc_pub_goods_add_chk(1,1) ~= 1 then
				return
			else
				AddItem(2,1,583,1)
			end
		end
		Say("<color=green> <color>: Ta l� X�o N� tr�n tr�i, th�ch gi�p m�i ng��i c� t�nh nh�n. Th�i gian n�y c� nhi�u L�u tinh r�i xu�ng, ch� c�n ng��i v� t�nh nh�n <color=yellow>m�i tu�n <color> 1 l�n ��n nh�n <color=yellow>Nhi�m v� Phu th�<color>, s� t�m ���c m�nh v� L�u tinh, d�ng n� h�p th�nh v�t qu� hi�m, �� t�nh c�m v� ch�ng th�m sau ��m, c� th� h�c ���c s�c m�nh ��c bi�t trong H�n Nh�n. Sau khi nh�n <color=yellow>Khi�n V�n Phi Tinh Ph�<color> th� nh�n <color=yellow>Nhi�m v� Phu th�<color> tu�n n�y.",
		8,
		"T�i mu�n nh�n Nhi�m v� Phu th� tu�n n�y/get_task_dtm",
		"T�i mu�n trao ��i m�nh v� ph�a tr�n/ma_frag_chg",
		"T�i mu�n ��i thu�c t�nh nh�n/up_diamand_ring",
		"Thuy�t minh Nhi�m v� Phu th�/get_att_info",
		"Thuy�t minh k� n�ng Phu th�/ma_skill_info",
		"T�i mu�n dem theo khi ch�t/kill_follower",
		"Ta mu�n s�a v�n �� k�t h�n/repair_marriage",
		"R�i kh�i/end_dialog"
	)
	end
end

function kill_follower()
	local selTab = {
				"��ng �/kill_follower_confirm",
				"H�y b�/end_dialog",
				}
	Say("<color=green> <color>: N�u b�n cho r�ng qu� Xu�t H�n c� v�n ��, ch�n 'X�c ��nh' h�y b� v�t �i theo, n�u kh�ng c� th� ��ng ch�n.",getn(selTab),selTab);
end;

function kill_follower_confirm()
	KillFollower();
end;
--�������
function up_diamand_ring()
	Say("<color=yellow> n�y"..Zgc_pub_sex_name().."<color>, c�c ng��i c�n y�u nhau kh�ng? H�y mang <color=yellow>nh�n kim c��ng<color> t��ng tr�ng cho l�i th� t�nh y�u ��n, ta s� d�ng ti�n thu�t l�m t�ng t�nh y�u c�a c�c ng��i. Nh�ng <color=yellow>nh�n kim c��ng<color> sau khi th�ng c�p s� theo ng��i su�t ��i, <color=red>kh�ng ���c giao d�ch n�a<color>. S� ti�u hao <color=yellow>10<color> vi�n <color=yellow>L�u tinh chi sa<color> v� <color=yellow>5<color> vi�n <color=yellow>B�n long b�ch<color>. C� mu�n th�m thu�c t�nh cho nh�n kim c��ng kh�ng?",
	3,
	"��ng �/ring_up_way",
	"L�m sao c� ���c l�u tinh chi sa/star_ash_inf",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--�����õ�����֮ɳ
function star_ash_inf()
	Talk(1,"","Ta nghe n�i l�c n�y c� m�t ng��i t�n �<color=green>Tr�n c�ng t�<color>� ho�t ��ng kh�p n�i, trong qu� tr�nh t�m <color=yellow>m�nh L�u tinh<color>, c� khi s� g�p h�n ho�c th� h�, h� s� ch� ��ng c�ng k�ch. Nh�ng c�c ng��i kh�ng ph�i s�, b�n ng��i n�y n�ng l�c kh�ng m�nh, sau khi ��nh b�i b�n h�, s� c� ���c <color=yellow>L�u tinh chi sa<color>.")
end
--������ʽѡ��
function ring_up_way()
	Say("Nh�n kim c��ng c� <color=yellow>hai<color> thu�c t�nh. M�t l� ��nh qu�i c� ���c kinh nghi�m t�ng th�m; hai l� t�ng t�t c� �i�m s�. M�i l�n th�m thu�c t�nh ph�i ti�u hao <color=yellow>5<color> vi�n <color=yellow>B�n long b�ch<color>. H�y th�m thu�c t�nh cho nh�n kim c��ng Ph� th�ng, hay kh�ng h�i h�i l�ng v� thu�c t�nh c�a <color=yellow>nh�n kim c��ng<color> �� c�, c� mu�n <color=yellow>th�m l�i thu�c t�nh<color>? Nh�c l�n n�a, <color=yellow>nh�n kim c��ng<color> th�m thu�c t�nh kh�ng ���c giao d�ch.",
	3,
	"Ta mu�n th�m thu�c t�nh cho nh�n kim c��ng Ph� th�ng/#ring_up(1)",
	"Ta kh�ng h�i l�ng v�i thu�c t�nh nh�n kim c��ng hi�n nay, mu�n th�m thu�c t�nh/ring_reup_dtm",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
--����������ָȷ�϶Ի�
function ring_reup_dtm()
	Say("Tuy ta c� th� <color=yellow>ban<color> thu�c t�nh, nh�ng do thu�c t�nh c�ng th�m xu�t hi�n ng�u nhi�n, ta kh�ng th� b�o ��m thu�c t�nh l�n n�y s� t�t h�n l�n tr��c. Ng��i c�n mu�n <color=yellow>th�m l�i thu�c t�nh<color> kh�ng?",
		2,
		"��ng �/#ring_up(2)",
		"�� ta suy ngh� l�i/end_dialog"
	)
end
--�������
function ring_up(up_diff)
	--��ָЯ�����
	local player_sex = GetSex()
	local ring_num = GetItemCount(0,102,Tb_ring_up_info[up_diff][player_sex])
	if ring_num == 0 then
		Talk(1,"","<color=yellow> n�y"..Zgc_pub_sex_name().."<color>, ta ch�a th�y <color=yellow>nh�n kim c��ng<color> c�a ng��i.")
		return
	end
	if up_diff == 2 and ring_num ~= 1 then
		Talk(1,"","<color=yellow> n�y"..Zgc_pub_sex_name().."<color> �� mang <color=red>"..ring_num.."<color> chi�c <color=yellow>nh�n kim c��ng<color>, ta bi�t ch�n c�i n�o? H�y s�p x�p l�i.")
		return
	end
	--�����Я�����
	if GetItemCount(2,1,1000) < 5 then
		Talk(1,"","<color=yellow>Thu�c t�nh<color> kim c��ng c�n luy�n ng�c, n�n kh�ng th� thi�u <color=yellow>B�n Long b�ch<color>, ng��i h�y mang <color=yellow>5<color> vi�n <color=yellow>B�n Long b�ch<color> ��n �� th�m thu�c t�nh cho nh�n kim c��ng. <color=yellow>B�n Long b�ch<color> c� b�n <color=yellow>t�i<color>Ng� C�c Th��ng L�c Hi�n.")
		return
	end
	--����֮ɳЯ�����
	if GetItemCount(2,1,584) < 10 then
		Talk(1,"","Thu�c t�nh <color=yellow>nh�n kim c��ng<color> ph�i bao h�m nguy�n t� L�u tinh, n�n c�n ��n <color=yellow>10<color> m�nh <color=yellow>L�u tinh chi sa<color>, n�u kh�ng ta c�ng b� tay. H�y thu th�p <color=yellow>10<color> vi�n <color=yellow>L�u tinh chi sa<color> r�i h�y ��n.")
		return
	end
	--���ؿռ���
	if Zgc_pub_goods_add_chk(1,20) ~= 1 then
		return
	end
	--����֮ɳɾ�����
	if DelItem(2,1,584,10) ~= 1 then
		Talk(1,"","Thu�c t�nh <color=yellow>nh�n kim c��ng<color> ph�i bao h�m nguy�n t� L�u tinh, n�n c�n ��n <color=yellow>10<color> m�nh <color=yellow>L�u tinh chi sa<color>, n�u kh�ng ta c�ng b� tay. H�y thu th�p <color=yellow>10<color> vi�n <color=yellow>L�u tinh chi sa<color> r�i h�y ��n.")
		return
	end
	--�����ɾ�����
	if DelItem(2,1,1000,5) ~= 1 then
		Talk(1,"","<color=yellow>Thu�c t�nh<color> kim c��ng c�n luy�n ng�c, n�n kh�ng th� thi�u <color=yellow>B�n Long b�ch<color>, ng��i h�y mang <color=yellow>5<color> vi�n <color=yellow>B�n Long b�ch<color> ��n �� th�m thu�c t�nh cho nh�n kim c��ng. <color=yellow>B�n Long b�ch<color> c� b�n <color=yellow>t�i<color>Ng� C�c Th��ng L�c Hi�n.")
		return
	end
	--��ָɾ�����
	if DelItem(0,102,Tb_ring_up_info[up_diff][player_sex],1) ~= 1 then
		Talk(1,"","<color=yellow> n�y"..Zgc_pub_sex_name().."<color>, ta ch�a th�y <color=yellow>nh�n kim c��ng<color> c�a ng��i.")
		return
	end
	--��ָ����
		--��ָ��������
		local ran_num_1 = random(1,Tb_ring_attr[1][6])
		local ran_num_2 = random(1,Tb_ring_attr[2][6])
		local attr_level_1 = 1
		local attr_level_2 = 1
		for i = 2,6 do
			if ran_num_1 <= Tb_ring_attr[1][i] then
				attr_level_1 = i - 1
				break
			end
		end
		for i = 2,6 do
			if ran_num_2 <= Tb_ring_attr[2][i] then
				attr_level_2 = i - 1
				break
			end
		end
		--��ָ����
		local add_flag = AddItem(0,102,Tb_ring_up_info[2][player_sex],1,1,attr_level_1,Tb_ring_attr[1][1],attr_level_2,Tb_ring_attr[2][1],-1,-1)
		if add_flag == 1 then
			Talk(1,"","Ta �� nh�n th�y bi�u hi�n t�nh y�u c�a c�c ng��i, ��y l� ph�n th��ng cho s� chung th�y c�a c�c ng��i, ch�c c�c ng��i s�ng ��n ��u b�c r�ng long, l�c n�o c�ng gi� ch�t l�i th� s�c son tr�n chi�c nh�n n�y. N�u kh�ng h�i l�ng v� thu�c t�nh c�a <color=yellow>nh�n kim c��ng<color>, c� th� thu th�p th�m <color=yellow>10<color> m�nh <color=yellow>L�u tinh chi sa<color> r�i ��n t�m ta, ta c� th� <color=yellow>th�m<color> thu�c t�nh gi�p ng��i.")
			return
		else
			WriteLog("K�t h�n k� hai-Ng��i ch�i:"..GetName().."Th�ng c�p nh�n b� l�i, log l�:"..add_flag)
		end
end
--*******************************��Ƭ����**************************
function ma_frag_chg()
	Say("Ta c� th� ��i gi�p ng��i <color=yellow>m�nh �ang c�<color> th�nh m�nh <color=yellow>kh�c<color>. Nh�ng c�ch n�y ti�u hao nhi�u nguy�n kh�, n�n ch� c� th� d�ng <color=red>3 m�nh gi�ng nhau ��i l�y 1 m�nh<color>. Ng��i mu�n ��i <color=yellow>m�nh<color> n�o?",
	5,
	"Ta mu�n ��i Gi�p M�c D��ng/#ma_frag_chg_use(568)",
	"Ta mu�n ��i �t M�c �m/#ma_frag_chg_use(569)",
	"Ta mu�n ��i B�nh H�a D��ng/#ma_frag_chg_use(570)",
	"Ta mu�n ��i �inh H�a �m/#ma_frag_chg_use(571)",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
function ma_frag_chg_use(use_goods_id)
	--�����ж�
	if GetItemCount(2,1,use_goods_id) < 3 then
		Talk(1,"","<color=yellow>Ng��i kh�ng c� �� -"..Tb_frag[use_goods_id].."<color> <color=red>3<color> vi�n, kh�ng th� ��i!")
		return
	end
	--�Ի�
	local dia_chg = {}
	for i = 568, 571 do
		if i ~= use_goods_id then
			tinsert(dia_chg,"Ta mu�n ��i "..Tb_frag[i].."/#chg_num_in("..use_goods_id..","..i..")")
		end
	end
	tinsert(dia_chg,"�� ta suy ngh� l�i/end_dialog")
	Say("Ng��i c� th� ��i <color=red>3<color> vi�n"..Tb_frag[use_goods_id].." �� ��i <color=yellow>1<color> m�nh <color=red>L�u tinh<color> kh�c <color=yellow>t�y �<color>, ng��i mu�n ��i m�nh n�o?",
		getn(dia_chg),
		dia_chg
	)
end
--��������������
function chg_num_in(use_goods_ID,goods_ID)
	SetTaskTemp(goods_id_chg_use_id,use_goods_ID)
	SetTaskTemp(goods_id_chg_id,goods_ID)
	local goods_num_max = floor(GetItemCount(2,1,use_goods_ID)/3)
	AskClientForNumber("ma_chg_deal",1,goods_num_max,"H�y nh�p s� l��ng ��i")
end
--�����Ĳ���
function ma_chg_deal(chg_num)
	if chg_num == 0 then
		return
	end
	--����ȡ��
	local use_goods_ID = GetTaskTemp(goods_id_chg_use_id)
	local goods_Id = GetTaskTemp(goods_id_chg_id)
	SetTaskTemp(goods_id_chg_use_id,0)
	SetTaskTemp(goods_id_chg_id,0)
	--����У��
	if use_goods_ID <568 or use_goods_ID > 571 or goods_Id <568 or goods_Id > 571 then
		return
	end
	if use_goods_ID == goods_Id then
		return
	end
	--��Ʒ�������
	if GetItemCount(2,1,use_goods_ID) < (chg_num * 3) then
		Talk(1,"","<color=yellow>Ng��i kh�ng c� �� -"..Tb_frag[use_goods_ID].."<color>, kh�ng th� ��i!")
		return
	end
	--��Ұ����ռ�͸��ؼ��
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--����ɾ�����
	if DelItem(2,1,use_goods_ID,(chg_num * 3)) ~= 1 then
		Talk(1,"","<color=yellow>Ng��i kh�ng c� �� -"..Tb_frag[use_goods_ID].."<color>, kh�ng th� ��i!")
		return
	else
		if AddItem(2,1,goods_Id,chg_num) == 1 then
			Msg2Player("Ch�c m�ng b�n �� ��i ���c r�i."..chg_num.."c�i"..Tb_frag[goods_Id].."!")
		end
	end
end
--���Ԫ�ط�λ�Ի�
function ma_skill_info()
	Talk(3,"ma_skill_info_1",
				"<color=yellow>K� n�ng phu th�<color> l� k�t qu� t�nh y�u gi�a hai v� ch�ng, mu�n h�c k� n�ng phu th� ph�i chia l�m <color=yellow>3 b��c<color>.",
				"<color=red>B��c th� nh�t:<color> t�m <color=yellow>m�nh L�u tinh<color>, ��a m�nh L�u tinh t�m ���c v�o <color=yellow>Khi�n V�n Phi Tinh ph�<color>.",
				"<color=red>B��c th� hai:<color> d�ng <color=yellow>Khi�n V�n Phi Tinh ph�<color> h�p th�nh <color=yellow>S�ch k� n�ng h�n nh�n<color>. Trong ��, <color=yellow>b�n quy�n<color> ���c <color=yellow>s� d�ng<color> khi h�c k� n�ng, <color=yellow>t�n quy�n<color> ���c <color=yellow>s� d�ng<color> khi n�ng c�p k� n�ng."
		)
end
function ma_skill_info_1()
	Talk(2,"",	"<color=red>B��c th� ba:<color> l� <color=yellow>nh�p chu�t ph�i<color> s� d�ng quy�n k� n�ng h�n nh�n, s� h�c ���c k� n�ng t��ng �ng.",
				"Hi�n t�i c� <color=yellow>3<color> k� n�ng. M�t l� <color=yellow>t��ng t�<color>, c� t�c d�ng <color=yellow>Phu th� truy�n t�ng l�n nhau<color>; hai l� <color=yellow>�H�a �i�p�<color>, c� t�c d�ng <color=yellow>h�i sinh b�n ��i<color>; ba l� <color=yellow>��i�p bi�n�<color>, c� t�c d�ng <color=yellow>t�ng c��ng n�ng l�c c�a b�n ��i trong m�t th�i gian<color>."
	)
end
--*********************************�������************************
--���Ԫ�ط�λ�Ի�
function get_task_dtm()
	Say("Nh�n gian k�t duy�n, tr�i ban �i�m l�nh. C�c ng��i �� se s�i ch� h�ng, k�t th�nh phu th�, c� th� t�m d�u v�t L�u tinh r�i xu�ng ��t. � ��y tu�n n�o ta c�ng ghi l�i v� tr� L�u tinh r�i v�o quy�n Khi�n V�n Phi Tinh ph�. Ng��i c� ch�c mu�n ghi v� tr� <color=yellow>tu�n n�y<color> v�o <color=yellow>Khi�n V�n Phi Tinh ph�<color>?",
	2,
	"��ng �/get_task",
	"H�y b�/end_dialog"
	)
end
function get_task()
	--�����Ƿ��Ѿ���ȡ�����
	if GetTask(get_task_reel_TaskID) == Zgc_pub_week_seq() then
		Talk(1,"","Tu�n n�y ng��i �� nh�n nhi�m v� phu th�, mu�n ghi th�m nhi�u v� tr� th� tu�n l�i ��n!")
		return
	end
	--Я�����Ʒ����׼��
	if GetItemCount(2,1,583) == 0 then
		Talk(1,"","Xin x�c nh�n c� mang theo <color=yellow>Khi�n V�n Phi Tinh ph�<color>!")
		return
	end
	--��������
	local ran_num = random(1,100)
	local task_num = 14
	if ran_num <= 30 then
		task_num = 21
	elseif ran_num <= 20 then
		task_num = 42
	end
	SetTask(Frag_att_num_TaskID,(GetTask(Frag_att_num_TaskID)+task_num))
	SetTask(get_task_reel_TaskID,Zgc_pub_week_seq())
	Talk(1,"","Ng��i �� c� ���c"..task_num.." v� tr� L�u tinh, ta �� ghi n� v�o trong <color=yellow>Khi�n V�n Phi Tinh ph�<color> c�a ng��i . Nh�p v�o v�t ph�m n�y s� c� ���c t�a �� L�u tinh!")
end
--**************************���ǲɼ�˵��************************
function get_att_info()
	Talk(3,"OnUse",
					"<color=yellow>Nhi�m v� phu th�<color> c� t�c d�ng nh�n <color=yellow>b�o v�t phu th�<color>, c� <color=yellow>hai b��c<color> c� ���c b�o v�t. <color=yellow>B��c th� nh�t:<color> nh�n m�nh <color=yellow>L�u tinh<color> khu v�c ngo�i th�nh; <color=yellow>B��c th� hai:<color> s� d�ng nh�ng m�nh n�y �� <color=yellow>h�p th�nh b�o v�t phu th�<color>.",
					"<color=yellow>Ngo�i th�nh<color> lu�n c� L�u tinh r�i xu�ng, n�n ng��i c� th� <color=yellow>s� d�ng Khi�n V�n Phi Tinh ph�<color> tra xem ch� n�o c� m�nh L�u tinh. <color=yellow>M�nh<color> t�m ���c <color=yellow>� m�i b�n ��<color> ��u kh�c nhau, th�ng th��ng <color=green>b�n �� ��ng c�p c�ng cao, c�ng t�m ���c m�nh cao c�p<color>.",
					"Nhi�m v� phu th� c�n c� <color=yellow>t� ��i phu th�<color>, kh�ng cho ng��i kh�c v�o. Sau khi t� ��i, ng��i s� d�ng Khi�n V�n Phi Tinh ph� ph�t nhi�m v� phu th�, <color=yellow>hai v� ch�ng c� th� nh�n m�i ng��i n�a �i�m t�a �� L�u tinh<color>. <color=red>Nam nh�n t�a �� X, n� nh�n t�a �� Y<color>. <color=yellow>Ng��i s� d�ng Khi�n V�n Phi Tinh ph�<color> th�c hi�n m�t <color=yellow>��ng t�c t�nh t�<color> t�i t�a �� ch� ��nh, s� nh�n ���c <color=yellow>m�nh L�u tinh<color>. Ch� �, khi <color=yellow>nh�n t�a �� m�nh, ph�i t� ��i phu th� v� trong c�ng m�t khu v�c<color>, kh�ng cho ng��i kh�c v�o."
	)
end

--=========================================================================
function repair_marriage()
	AddRelayShareData("wojiubuxinhuichongming_yj",0,0,CALLBACK_FILE,"callback_main",0,"key","d",0);
end;

function callback_main()
	local selTab = {
				"Ta bi�t r�i, ta mu�n s�a/repair_marriage_confirm",
				"\nTa kh�ng c� v�n �� g�, kh�ng c�n s�a/end_dialog",
				}
	Say("<color=green>X�o n�<color>: Ng��i x�c nh�n mu�n s�a v�n �� k�t h�n? N�u ng��i trong qu� tr�nh t�o h�n ��c g�p ���c b� mai ��i tho�i kh�ng h��ng �ng ho�c do nguy�n nh�n kh�c d�n ��n b�n kh�ng th� k�t h�n, ng��i c� th� th� s�a � ch� ta.<color=red>Ch� �: Sau khi s�a v�n �� ph�i giao l�i s�nh l� v� ��t s�n<color>",getn(selTab),selTab);
end;

function repair_marriage_confirm()
	if GetMateName() ~= "" then
		Talk(1,"","<color=green>X�o n�<color>: B�n �ang trong tr�ng th�i k�t h�n, h�y t�m <color=yellow>Nguy�t l�o (Th�y Y�n 205,162)<color> �� ly h�n, sau �� ��n s�a v�n �� k�t h�n c�a b�n.");
		return 0;
	end;
	local selTab = {
				"X�c nh�n s�a/repair_marriage_confirm_1",
				"\n�� ta suy ngh� l�i/end_dialog",
				}
	Say("<color=green>X�o n�<color>: B�n th�t s� mu�n s�a v�n �� k�t h�n?",getn(selTab),selTab);
end;

function repair_marriage_confirm_1()
	local szTaskInfo = "";
	for i=2000,2010 do
		szTaskInfo = szTaskInfo.."("..i..":"..GetTask(i)..");"
		SetTask(i,0);
	end;
	for i=2013,2019 do
		szTaskInfo = szTaskInfo.."("..i..":"..GetTask(i)..");"
		SetTask(i,0);
	end;
	WriteLog("[S�a]:"..GetName().."Thay ��i bi�n l��ng, th�ng tin bi�n l��ng nhi�m v� k�t h�n tr��c khi thay ��i:"..szTaskInfo);
	Msg2Player("V�n �� k�t h�n c�a b�n �� s�a xong, h�y th� l�i xem");
	Say("<color=green>X�o n�<color>: V�n �� k�t h�n c�a b�n �� s�a xong. Xin c�o l�i v� g�y nh�ng phi�n ph�c v�i b�n tr��c ��y ��ng th�i c�m �n s� �ng h� c�a b�n ��i v�i c�ng vi�c c�a t�i.",0);
end;
