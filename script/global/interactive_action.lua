--���˻���������֮�ű���
--��ں�����main�����������Ϊ����������������������Ϊ���������Ƿ�ɹ�
Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")					--�峤�Ĺ�������
Include("\\script\\task\\marriage\\map_att_head.lua")					--������ͷ�ļ�
Include("\\script\\���\\marriage_head.lua");
Include("\\script\\master_prentice\\some_op.lua")
Include("\\script\\online\\3festival\\3festival_head.lua")
Include("\\script\\online\\newyear08\\newyear08_head.lua") --07ʥ����ʦ�
Include("\\script\\lib\\lingshi_head.lua"); --��ʯͷ�ļ�
Include("\\script\\online\\spring2014\\sp_head.lua")

INTERACTIVE_SHARE_RIDE = 0		-- ˫�˹���
INTERACTIVE_SHARE_HAND = 1		-- ˫��Я��
INTERACTIVE_SHARE_BACK = 2		-- GG��MM
INTERACTIVE_SHARE_CHEST = 3		-- GG��MM
INTERACTIVE_KISS = 4			-- ����
INTERACTIVE_COMFORT = 5			-- ��ο
INTERACTIVE_KOTOW = 6			-- ��
INTERACTIVE_HELP = 7			-- ��æ
INTERACTIVE_SORROW = 8			-- ����
INTERACTIVE_READY_GO = 9		-- ����
INTERACTIVE_ACT_UP = 10			-- ��Ƥ
INTERACTIVE_CRAZY = 11			-- ����
INTERACTIVE_KNEE_DOWN = 12		-- ����
INTERACTIVE_SHY = 13			-- ����
INTERACTIVE_BOW	= 14			-- �Ϲ�
INTERACTIVE_CLAPS = 15			-- ����
INTERACTIVE_MARRIAGE = 16		-- ���
INTERACTIVE_ANGRY = 17			-- ����
INTERACTIVE_VICTORY = 18		-- ʤ��
INTERACTIVE_COOL = 19			-- ˣ��
INTERACTIVE_LAY_DOWN = 20		-- ����
INTERACTIVE_DEFY = 21			-- ����
INTERACTIVE_PUZZLED = 22		-- �ɻ�
INTERACTIVE_FAINT = 23			-- �ε�
INTERACTIVE_BYEBYE = 24 		-- ����
INTERACTIVE_CONFIDENCE = 25		-- ����
INTERACTIVE_GENTLE = 26			-- ��Ҿ
INTERACTIVE_SIT = 27			-- ����

--2007�괺�ڻTaskID��¼
TaskID_spring2007_kotow_seq = 986
TaskID_spring2007_HASH_1st = 987
TaskID_spring2007_HASH_2nd = 988
TaskID_spring2007_HASH_3rd = 989
--2007�����ڻTaskID��¼
tomb_sweep_2007_date_seq = 852
tomb_sweep_2007_times_count = 853
tomb_sweep_2007_goods_use_diff = 854
--2008������
tomb_sweep_2008_date_seq = 1858
tomb_sweep_2008_times_count = 1851
tomb_sweep_2008_goods_use_diff = 1859

tomb_sweep_2007_start_goodsID = 675
--�������������ID
	task_map_id_TaskID = 1217
	task_att_seq_TaskID = 1218
	Tb_frag = {}
	Tb_frag[568] = "Gi�p M�c d��ng"
	Tb_frag[569] = "�t M�c �m"
	Tb_frag[570] = "B�nh h�a d��ng"
	Tb_frag[571] = "�inh H�a �m"
	--�����ڹ�������
	Monster_attr = {}
	Monster_attr[13]={2750,19}
	Monster_attr[14]={3850,23}
	Monster_attr[15]={4950,28}
	Monster_attr[16]={6050,34}
	Monster_attr[17]={7150,41}
	Monster_attr[18]={8250,48}
	Monster_attr[19]={9350,54}
	Monster_attr[20]={10450,58}
	Monster_attr[21]={11550,61}
	Monster_attr[22]={12650,65}
	Monster_attr[23]={13750,67}
	Monster_attr[24]={14850,71}
	Monster_attr[25]={15950,73}
	Monster_attr[26]={17050,76}
	Monster_attr[27]={18150,79}
	Monster_attr[28]={19250,83}
	Monster_attr[29]={21550,85}
	Monster_attr[30]={23050,98}
	Monster_attr[31]={24550,106}
	Monster_attr[32]={26050,112}
	Monster_attr[33]={27550,114}
	Monster_attr[34]={29050,118}
	Monster_attr[35]={30550,123}
	Monster_attr[36]={32050,127}
	Monster_attr[37]={33550,133}
	Monster_attr[38]={35050,140}
	Monster_attr[39]={36550,148}
	Monster_attr[40]={38050,155}
	Monster_attr[41]={40000,167}
	Monster_attr[42]={41950,175}
	Monster_attr[43]={43900,181}
	Monster_attr[44]={45850,187}
	Monster_attr[45]={47800,192}
	Monster_attr[46]={49750,200}
	Monster_attr[47]={51700,205}
	Monster_attr[48]={53650,213}
	Monster_attr[49]={55600,230}
	Monster_attr[50]={58400,245}
	Monster_attr[51]={61200,248}
	Monster_attr[52]={64000,260}
	Monster_attr[53]={66800,266}
	Monster_attr[54]={69600,272}
	Monster_attr[55]={72400,280}
	Monster_attr[56]={75200,288}
	Monster_attr[57]={78000,296}
	Monster_attr[58]={80800,304}
	Monster_attr[59]={83600,312}
	Monster_attr[60]={86400,320}
	Monster_attr[61]={89400,331}
	Monster_attr[62]={92400,339}
	Monster_attr[63]={95400,350}
	Monster_attr[64]={98400,359}
	Monster_attr[65]={101400,362}
	Monster_attr[66]={104400,379}
	Monster_attr[67]={107400,383}
	Monster_attr[68]={110400,391}
	Monster_attr[69]={113400,404}
	Monster_attr[70]={117750,412}
	Monster_attr[71]={117750,426}
	Monster_attr[72]={117750,449}
	Monster_attr[73]={117750,467}
	Monster_attr[74]={117750,492}
	Monster_attr[75]={117750,511}
	Monster_attr[76]={117750,526}
	Monster_attr[77]={117750,541}
	Monster_attr[78]={117750,557}
	Monster_attr[79]={117750,573}
	Monster_attr[80]={117750,588}
	Monster_attr[81]={117750,604}
	Monster_attr[82]={117750,619}
	Monster_attr[83]={117750,641}
	Monster_attr[84]={117750,656}
	Monster_attr[85]={117750,672}
	Monster_attr[86]={117750,687}
	Monster_attr[87]={117750,703}
	Monster_attr[88]={117750,724}
	Monster_attr[89]={117750,740}
	Monster_attr[90]={117750,755}
	Monster_attr[91]={117750,777}
	Monster_attr[92]={117750,792}
	Monster_attr[93]={117750,819}
	Monster_attr[94]={117750,824}
	Monster_attr[95]={117750,828}
	Monster_attr[96]={117750,832}
	Monster_attr[97]={117750,836}
	Monster_attr[98]={117750,840}
	Monster_attr[99]={117750,845}
	Tb_ma_monster = {
		{2,"Di�u L�p Th�nh","Gia �inh c�a Tr�n c�ng t�"},
		{4,"Di�u L�p Th�nh","Gia �inh c�a Tr�n c�ng t�"},
		{5,"A Vi",	"��o t�c h�o s�c Tr�n c�ng t�"},	
	}
function main(nInteractiveIndex, bSuccess)
	--��������أ��κ���ض���
	if bSuccess ~= 0 then
		ON_All()
	end
	if (nInteractiveIndex == INTERACTIVE_KOTOW) and (bSuccess ~= 0) then	--�ݶ���
		ON_KOTOW()
	end
	if (nInteractiveIndex == INTERACTIVE_GENTLE) and (bSuccess ~= 0) then	--�ݶ���
		ON_GENTLE()
	end
	if (nInteractiveIndex == INTERACTIVE_SHARE_HAND) and (bSuccess ~= 0) then
		ON_SHARE_RIDE_HAND()
	end
	if bSuccess ~= 0 then --��������
		gen_sui_you_li(nInteractiveIndex);
	end
	if bSuccess ~= 0 and nInteractiveIndex == INTERACTIVE_GENTLE then
		sp_InteractiveToNpc();
	end
end
--==================================���ж���=============================
function ON_All()
        local szMateName = GetMateName();
	--�ж��Ƿ���
	if szMateName == nil or szMateName == "" then
		return
	end
        local nPlayerIndexSave = PlayerIndex;--����ԭPlayerIndex
        local nMateIndex = 0;                --��ż����
        local nTeamSize = GetTeamSize();
        for i = 1 , nTeamSize do
	    PlayerIndex = GetTeamMember(i)
	    if szMateName == GetName() then
	        nMateIndex = PlayerIndex;
		PlayerIndex = nPlayerIndexSave;
		break
	    end
        end
        if nMateIndex == 0 then
            Talk(1, "", "<color=green>Ch� �<color>: Xin x�c nh�n b�n v� � trung nh�n �� t� ��i!");
            return
        end
	--����Ƿ������
	local map_id_save = GetTask(task_map_id_TaskID)
	local att_seq = GetTask(task_att_seq_TaskID)
	if map_id_save == 0 or map_id_save == nil then
		return
	end
	if att_seq == 0 or att_seq == nil then
		return
	end
	--��⵱ǰ��ͼ�Ƿ�Ϊ�����ͼ
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID ~= map_id_save then
		return
	end
	--�ռ�͸����ж�
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--��ͼ��ͬ��ʱ��
	local frag_ID = {0,568,569,570,571,583,592}
	if Tb_task_reel_att[map_id_save][att_seq][1] == nil or Tb_task_reel_att[map_id_save][att_seq][2] == nil then
		return
	end
	if Tb_task_reel_att[map_id_save][att_seq][1] == floor(att_X/8) and Tb_task_reel_att[map_id_save][att_seq][2] == floor(att_Y/16) then
		local moster_frag_ran = random(1,10)
		if moster_frag_ran == 9 then		--ˢ��
			--�������ȼ�
			local monster_level = random(1,5)
			for i = 1 ,getn(Tb_ma_monster) do
				if monster_level <= Tb_ma_monster[i][1] then
					monster_level = i
					break
				end
			end
			--��������
			local Player_level = GetLevel()
				--�жϸĵȼ��Ĺ����Ƿ����
			if Monster_attr[Player_level] == nil then
				return
			end
				--��ʼ����
			local monster_index = CreateNpc(Tb_ma_monster[monster_level][2],Tb_ma_monster[monster_level][3],GetWorldPos())
				--�жϹ��������Ƿ�����
			if monster_index == 0 or monster_index == nil then
				return
			end
				--���ù������Ժ������ű�·��
				SetNpcScript(monster_index,"\\script\\task\\marriage\\ma_monster_death.lua")
				SetUnitCurStates(monster_index,0,Player_level)
				SetUnitCurStates(monster_index,1,Monster_attr[Player_level][1])
				SetTask(map_id_save,0)
				SetTask(task_att_seq_TaskID,0)		
                                SetTask(2286, monster_index);--��¼һ�´���������NPC����
                                PlayerIndex = nMateIndex;
                                SetTask(2286, monster_index);--��¼һ�´���������NPC����
                                PlayerIndex = nPlayerIndexSave;
                else		--ֱ�Ӹ���Ƭ

			local ran_num = random(1,100)
			for i = 2, getn(Tb_task_reel_att[map_ID].map_att) do
				if ran_num <= Tb_task_reel_att[map_ID].map_att[i] then
					if AddItem(2,1,frag_ID[i],1) == 1 then
						Talk(1,"","<color=green>Ch� d�n<color>: Ch�c m�ng b�n nh�n ���c 1 <color=yellow>"..Tb_frag[frag_ID[i]].."<color>, nh�p chu�t ph�i �� s� d�ng v�t ph�m!")
						SetTask(map_id_save,0)
						SetTask(task_att_seq_TaskID,0)
						break
					end
				end
			end
		end
	else
		Talk(1,"","B�n kh�ng ��n ���c ��a �i�m ch� ��nh v� kh�ng c� v�t ph�m c�n thi�t")
		return
	end
end
--====================================��=================================
function ON_KOTOW()
	if master_prentice() == 1 then			-- ���ʦͽ����Ӧ���ȸ���ʦͽ��������˵
		return
	end
	kotow_tomb_sweep_2008()					--2007������
	marriage_check_kotow()				--���
	newyear08_bai()               --2007ʥ���
end
--*******************************2007��������****************************
function kotow_tomb_sweep_2007()
	local Plyaer_level = GetLevel()
	if Plyaer_level < 11 then								--�ȼ��ж�
		return
	end
	if tomb_sweep_2007_date_chk() ~= 1 then				--�ڻ�ڼ���Ч
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID < 818 or map_ID > 820 then				--�ڰݼ���ͼ��Ч
		return
	end
	if att_X < 1660 then								--��������
		Talk(1,""," c�ng t� ��i hi�p, ti�p t�c n�a xem sao!")
		return
	end
	local last_kotow_seq = GetTask(tomb_sweep_2007_date_seq)		--�������İݼ�����
	if last_kotow_seq >= zgc_pub_day_turn(1) then
		Talk(1,"","L�n ��u c�ng t� l� th�nh t�m nh�t.")
		return
	end
	--���Խ��аݼ�
	local prize_diff = GetTask(tomb_sweep_2007_goods_use_diff)
	local exp_times = 1
	local Player_level = GetLevel()
	local exp_num = floor(Player_level * Player_level * Player_level *Player_level / 50)
	if prize_diff == 0 or prize_diff == nil then
		prize_diff = 0
	end
			--�����������
	if Plyaer_level < 40 then
		Say("Ng��i mu�n nh�n lo�i nhi�m v� n�o: ��n gi�n, h�i kh�?",
		3,
		"��n gi�n/#task_teel_add(2)",
		"Kh�/#task_teel_add(5)",
		"Sao c�ng ���c/#task_teel_add(9)"
		)
	elseif Plyaer_level >= 40 and Plyaer_level <= 60 then
		Say("Ng��i mu�n nh�n lo�i nhi�m v� n�o: ��n gi�n, h�i kh�?",
		2,
		"��n gi�n/#task_teel_add(5)",
		"Sao c�ng ���c/#task_teel_add(9)"
		)
	else
		task_teel_add(9)
	end
	if random(1,100) <= (10 + prize_diff) then						--����B
		exp_times = 10
	end
	local kotow_times_save = GetTask(tomb_sweep_2007_times_count)
	if kotow_times_save == 7 then				--����D
		exp_times = exp_times + 15
		--ModifyReputation(100,0)
	end
	--���Ӿ���
	exp_num = exp_num * exp_times
	ModifyExp(exp_num)
	if exp_times == 1 then
		Msg2Player("Nh�n ���c kh�ch l� c�a ��i hi�p ta c�m th�y v� c�ng ti�n b� v��t b�c, kinh nghi�m giang h� �� t�ng "..exp_num.." �i�m!")
	else
		Msg2Player("M�t c�n gi� l�nh th�i qua, b�n c�m th�y g�n c�t to�n th�n r�t d� ch�u, kinh nghi�m giang h� �� t�ng l�n"..exp_num.." �i�m!")
	end
	--�������ڽ�����Ĵ���
	if kotow_times_save == nil or kotow_times_save == 0 then
		SetTask(tomb_sweep_2007_times_count,1)
	else
		SetTask(tomb_sweep_2007_times_count,(kotow_times_save + 1))
	end
	SetTask(tomb_sweep_2007_date_seq,zgc_pub_day_turn(1))
	--��Ʒһ����Ч
	SetTask(tomb_sweep_2007_goods_use_diff,0)
end
--*******************************2008������******************************
function kotow_tomb_sweep_2008()
	local Player_level = GetLevel()
	--�ȼ��͸��ؼ��
	if Player_level < 11 then								--�ȼ��ж�
		return
	elseif Player_level ~= 99 then
		if Zgc_pub_goods_add_chk(1,50) ~= 1 then
			return
		end
	else
		if Zgc_pub_goods_add_chk(3,50) ~= 1 then
			return
		end
	end
	if is_qingming_opened() ~= 1 then				--�ڻ�ڼ���Ч
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID < 818 or map_ID > 820 then				--�ڰݼ���ͼ��Ч
		return
	end
	if att_X < 1660 then								--��������
		Talk(1,""," c�ng t� ��i hi�p, ti�p t�c n�a xem sao!")
		return
	end
	local last_kotow_seq = GetTask(tomb_sweep_2008_date_seq)		--�������İݼ�����
	if last_kotow_seq >= zgc_pub_day_turn(1) then
		Talk(1,"","L�n ��u c�ng t� l� th�nh t�m nh�t.")
		return
	end
	--���Խ��аݼ�
	local prize_diff = GetTask(tomb_sweep_2008_goods_use_diff)
	local exp_times = 1
	local exp_num = floor(1500000*(Player_level * Player_level  / (80*80)))--�����
	--Msg2Player("��ȡ��ҵȼ�:"..Player_level)
	if prize_diff == 0 or prize_diff == nil then
		prize_diff = 0
	end

	if GetLevel() ~= 99 then
		--�շ���Ϊ��������ת����200w*�ȼ�˥��,�����Ϊ����150w*�ȼ�˥��
	  --99��Ϊ��ʱע��2����1-7����ʯ*1������鶦
		if random(1,100) <= (10 + prize_diff) then						--����B
			exp_times = 10
		end
		local kotow_times_save = GetTask(tomb_sweep_2008_times_count)
		if kotow_times_save == 7 then				--����D
			exp_times = 10 --��������ȡ����D��ʱ����ȡ����A�����Ա������ۼ�
			Msg2Player("B�n �� b�i t� li�n t�c 8 ng�y n�n nh�n ���c nhi�u �i�m kinh nghi�m h�n.")
			--ModifyReputation(100,0)--��������
		end
		--���Ӿ���
		--��������Ӿ���
		exp_num = exp_num * exp_times
		
		ModifyExp(exp_num)
		
		if exp_times == 1 then
			Msg2Player("Nh�n ���c kh�ch l� c�a ��i hi�p ta c�m th�y v� c�ng ti�n b� v��t b�c, kinh nghi�m giang h� �� t�ng "..exp_num.." �i�m!")
		else
			Msg2Player("M�t c�n gi� l�nh th�i qua, b�n c�m th�y g�n c�t to�n th�n r�t d� ch�u, kinh nghi�m giang h� �� t�ng l�n"..exp_num.." �i�m!")
		end
	else--��Ҷ�λ99
		local n99times = 1 --99����ҽ�������
		if random(1,100) <= (10 + prize_diff) then						--����B
			n99times = 10
		end
		local kotow_times_save = GetTask(tomb_sweep_2008_times_count)
		if kotow_times_save == 7 then				--����D
			n99times = 10 --��������ȡ����D��ʱ����ȡ����A�����Ա������ۼ�
			Msg2Player("B�n �� b�i t� li�n t�c 8 ng�y n�n nh�n ���c nhi�u ph�n th��ng h�n.")
			--ModifyReputation(100,0)--��������
		end
		local nTemp = 1
		for nTemp = 1,n99times,1 do
			if Zgc_pub_goods_add_chk(2,2) == 1 then
				AddItem(2,1,3210,2)--�����ʱע��2��
			else
				Msg2Player("S�c l�c c�a b�n kh�ng ��, ph�n th��ng b�i t� l�n n�y b� h�y, h�y d�n d�p h�nh trang r�i quay l�i b�i t�!")
				return
			end --if zgc_pub_gooods_add_chk
			--======������1-7��ʯ1��,���7����ʯ�ļ��ʵ�����1/20
			local lvLingShi = 1
			local nRander = random(1,210)
			if nRander <= 120 then
				--1~4����ʯ
				lvLingShi = random(1,4)
			elseif nRander <= 203 then
				--5~6����ʯ
				lvLingShi = random(5,6)
			else
				lvLingShi = 7
			end
			SetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1,GetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1)+1)
			Msg2Player("B�n nh�n ���c "..lvLingShi.."(c�p) Linh Th�ch!")
		end--for
		nTemp = n99times*2
		Msg2Player("B�n nh�n ���c Thi�n Th�i Ch� Gi�i "..nTemp.." quy�n!")
	end--if_lv_99
	--�����������
	if Player_level < 80 then
		Say("Ng��i mu�n nh�n lo�i nhi�m v� n�o: ��n gi�n, h�i kh�?",
		3,
		"��n gi�n/#task_teel_add(random(1,3))",
		"Kh�/#task_teel_add(random(1,6))",
		"Sao c�ng ���c/#task_teel_add(random(1,10))"
		)
	elseif Player_level >= 80 and Player_level <= 90 then
		Say("Ng��i mu�n nh�n lo�i nhi�m v� n�o: ��n gi�n, h�i kh�?",
		2,
		"��n gi�n/#task_teel_add(random(1,6))",
		"Sao c�ng ���c/#task_teel_add(random(1,10))"
		)
	else
		task_teel_add(random(1,10))
	end
	--�������ڽ�����Ĵ���
	local kotow_times_save = GetTask(tomb_sweep_2008_times_count)
	if kotow_times_save == nil or kotow_times_save == 0 then
		SetTask(tomb_sweep_2008_times_count,1)
	else
		SetTask(tomb_sweep_2008_times_count,(kotow_times_save + 1))
	end
	SetTask(tomb_sweep_2008_date_seq,zgc_pub_day_turn(1))
	--��Ʒһ����Ч
	SetTask(tomb_sweep_2008_goods_use_diff,0)
end
--*******************************�����������****************************
function task_teel_add(add_diff)
	--Msg2Player(add_diff);--�����ã���ɾ��
	local add_flag = AddItem(2,0,add_diff+tomb_sweep_2007_start_goodsID-1,1)--2008Moxian�޸�,�ɵ�����д�����
	if add_flag == 1 then
		Msg2Player("Trong l�c c�ng b�i b�n v� t�nh ph�t hi�n m�t t� gi�y!")
	end
	--��Ʒһ����Ч
	SetTask(tomb_sweep_2007_goods_use_diff,0)
	return
end
--===================================��Ҿ================================
function ON_GENTLE()

end
function ON_SHARE_RIDE_HAND()	--ǣ��

end

function gen_sui_you_li(nInteractiveIndex)
	if Get_3festival_State() ~= 1 then
		return
	end
	local nMapId,nPlayerX,nPlayerY = GetWorldPos();
	local nNpcIdx = GetMapTaskTemp(nMapId,1);
	if GetNpcName(nNpcIdx) ~= tNewCehua[1][2] and GetNpcName(nNpcIdx) ~= tNewCehua[2][2] and GetNpcName(nNpcIdx) ~= tNewCehua[3][2] then
		return
	end
	if GetLevel() < 30 then
		Talk(1,"","��ng c�p th�p qu�, ti�p t�c phi�u b�t giang h� ��n c�p <color=yellow>30<color> h�y ��n.");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then   --�ռ为�ؼ��
		return
	end	
	local nNpcId,nNpcX,nNpcY = GetNpcWorldPos(nNpcIdx);
	local nDistance = floor(sqrt((nPlayerX-nNpcX)^2+(nPlayerY-nNpcY)^2));
	local nDate = tonumber(date("%Y%m%d"));
	if nDistance > 20 then
		Talk(1,"","Xa qu�, l�i g�n n�a �i");
	else
		local nActionIdx = GetMapTaskTemp(nMapId,2);
		if nActionIdx ~= nInteractiveIndex then
			Talk(1,"","��ng t�c hi�n t�i l� <color=yellow>"..tActionIndex[nActionIdx-4][1].."<color>, l�m sai r�i.");
			return
		else
			if GetTask(TASK_GENSUI_DATE) ~= nDate then
				SetTask(TASK_GENSUI_TOTAL,0);
			end 
			if GetTask(TASK_GENSUI_TOTAL) == 10 then
				Talk(1,"","H�m nay b�n l�nh ph�n th��ng nhi�u r�i, �� �i�m cho b�ng h�u kh�c, ng�y mai h�y t�i");
				return
			else
				local nRand = random(1,10000);
				for i=2,getn(tGensuiAward) do
					if nRand <= tGensuiAward[i][6] then
						AddItem(tGensuiAward[i][2],tGensuiAward[i][3],tGensuiAward[i][4],tGensuiAward[i][5],1);
						Msg2Player("Ch�c m�ng b�n nh�n ���c "..tGensuiAward[i][1]..tGensuiAward[i][5].."c�i");
						break;
					end
				end
				local nExp = floor(GetLevel()^3/80^3*tGensuiAward[1][1]);
				ModifyExp(nExp);
				Msg2Player("Ch�c m�ng b�n nh�n ���c "..nExp.."Kinh nghi�m");
				SetTask(TASK_GENSUI_TOTAL,GetTask(TASK_GENSUI_TOTAL)+1);
				SetTask(TASK_GENSUI_DATE,nDate);
			end
		end
	end					
end

--=============================07ʥ����ʦ�===========================
function newyear08_bai()
	if get_chrims_state() ~= 1 then
		return
	end
 	local nLv = GetLevel();
 	local nTeamNum = GetTeamSize();
 	local nDate = tonumber(date("%Y%m%d"));
 	local nMapId,nPosX,nPosY = GetWorldPos();
 	local nOldIdx = PlayerIndex;
 	if GetTask(TASK_BAI_DATE) >= nDate then
 		Talk(1,"","M�i ng�y m�t ng��i ch� ���c l�nh gi�i th��ng 1 l�n.");
 		return
 	end
 	if nLv < 11 then --������޴�����
 		Talk(1,"","<color=green>Th�ng b�o: <color>: B�n c�n ph�i phi�u b�t giang h� th�m �t l�u n�a!");
 		return
 	end
 	if nTeamNum ~= 2 or nTeamNum == 0 then
		Talk(1,"","N�m m�i b�i s� h�c v�. Ho�t ��ng b�i s� ph�i c� 2 ng��i t� ��i m�i ���c l�nh th��ng.");
		return
	end
	if GetTeamMember(1) == PlayerIndex then
		PlayerIndex = GetTeamMember(2);
	elseif GetTeamMember(2) == PlayerIndex then 
		PlayerIndex = GetTeamMember(1);
	else
		WriteLog("Ho�t ��ng b�i s� Gi�ng Sinh 2007: link th�nh vi�n ��i ng� c� l�i.");
		return
	end
	local nMapId2,nPosX2,nPosY2 = GetWorldPos();
	local nLvTwo = GetLevel();
	local sName = GetName();
	if nMapId ~= nMapId2 or abs((nPosX-nPosX2)+(nPosY-nPosY2)) > 20 then --�����ж�
		PlayerIndex = nOldIdx;
		Talk(1,"","N�m m�i b�i s� h�c v�. Kho�ng c�ch h�mh l� xa qu�, l�i g�n l�m l�i �i");
		return
	end
	if nLv == 99 and nLvTwo == 99 then --99�����ֻ�ܰ�99�� ���辭��
		PlayerIndex = nOldIdx;
		local nExp = floor(((nLv^4)/(80^4))*6000000);
		if nExp < 100000 then
			nExp = 100000;
		end
		if nExp > 8000000 then
			nExp = 8000000;
		end
		local nRandom = random(1,100);
		if nRandom <= 2 then    --2%���ʷ���
			nExp = 2*nExp;
		end
		SetTask(TASK_BAI_DATE,nDate);
		ModifyExp(nExp);
		Msg2Player("Sau khi b�n h�nh l� v�i "..sName.." xong, c�ng th�y ��m ��o, l�m t�ng th�m kinh nghi�m giang h�"..nExp.."�i�m.");
		if nRandom <= 2 then
			Msg2Global(GetName().."Th�nh t�m th�nh �"..sName.."th�nh gi�o v� h�c, v� c�ng ti�n b�, nh�n ���c 2 ph�n th��ng, ��t ���c"..nExp.." �i�m kinh nghi�m giang h�")	;
		end
		return 0;
	end			
	if nLv >= nLvTwo then --��99�����
		PlayerIndex = nOldIdx;
		Talk(1,"","N�m m�i b�i s� h�c v�. Ng��i c�p th�p b�i ng��i c�p cao h�n m�i c� th��ng.");			
	else
		PlayerIndex = nOldIdx;
		local nExp = floor(((nLv^4)/(80^4))*6000000);
		if nExp < 100000 then
			nExp = 100000;
		end
		if nExp > 8000000 then
			nExp = 8000000;
		end
		local nRandom = random(1,100);
		if nRandom <= 2 then    --2%���ʷ���
			nExp = 2*nExp;
		end
		SetTask(TASK_BAI_DATE,nDate);
		ModifyExp(nExp);
		Msg2Player("Sau khi b�n h�nh l� v�i "..sName.." xong, c�ng th�y ��m ��o, l�m t�ng th�m kinh nghi�m giang h�"..nExp.."�i�m.");
		if nRandom <= 2 then
			Msg2Global(GetName().."Th�nh t�m th�nh �"..sName.."th�nh gi�o v� h�c, v� c�ng ti�n b�, nh�n ���c 2 ph�n th��ng, ��t ���c"..nExp.." �i�m kinh nghi�m giang h�")	;
		end
	end
	PlayerIndex = nOldIdx;
end

function is_qingming_opened()	
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080403 then
		return -1;--�����δ��ʱ��
	elseif nDate > 20080412 then
		return 0;--�ѹ���
	else
		return 1;
	end;
end;
