-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �������񴥷�������
-- By StarryNight
-- 2005/12/30 PM 10:48

--������ ������ ������ 
--��: ���� ���� ��ţ�� ������ȡ 
--��: ��լ ���� ���� ��Ȣ ���� �촬 
--��������: ���� ���� ����  
--�����˼�: �½� Сʱ ���� ���� �ػ�  
--����: ������  ��ִλ  
--����ټ�: �첻������������ �Ӳ��ʲ����ǻ��� 

-- ======================================================
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--ɱ�������ռ�ҩ��
function PoisonBee_Killed_1()

	  if g_probability(50, 100) then
        AddItem(2,0,362,1,1);--�õ�ҩ��
    		if GetItemCount(2,0,362) >= 15 then
      		TaskTip("�� thu th�p �� 15 d��c li�u quay v� t�m Tr�nh Qu�n Chi.");
      		Msg2Player("�� thu th�p �� 15 d��c li�u quay v� t�m Tr�nh Qu�n Chi.");
    		end;
		end;
end;

--ɱ��20�������
function PoisonSco_Killed_20()
	
	RemoveTrigger(GetRunningTrigger());
	SetTask(TASK_DL_LV20_ID,2);
	TaskTip("Ho�n th�nh nhi�m v� quay v� g�p Cao Th�ng Tuy�n.");
	Msg2Player("Ho�n th�nh nhi�m v� quay v� g�p Cao Th�ng Tuy�n.");
	
end;

--ɱ���綾ʳ�˲��ռ�����
function AnPlant_Killed_1()    
    
    if g_probability(50, 100) then
      AddItem(2,0,364,1,1);--�õ�ҩ��
      if GetItemCount(2,0,364) >= 20 then
    		RemoveTrigger(GetRunningTrigger());
      	TaskTip("�� thu th�p �� 20 h�t, quay v� g�p B�ch Doanh Doanh.");
      	Msg2Player("�� thu th�p �� 20 h�t, quay v� g�p B�ch Doanh Doanh.");
    	end; 
		end;
end;

--ɱ��10����׽�ͽ
function ChiHuoWhite_Killed_10()

local nSate = GetTask(TASK_DL_LV35_01_ID);

	--֮ǰ��ɱ��10����ڽ�ͽ
	if nSate == 10 then
		local strTalk = {
			"C� chuy�n g� v�y?",
			"Kh�ng li�n quan g� ��n ng��i!",
			"Cho d� l� chuy�n c�a c�c ng��i �i ch�ng n�a th� c�ng kh�ng ���c n�o lo�n ��i T�ng c�a ta!",
			"Ta c�nh b�o ng��i ��ng xen v�o vi�c c�a Xi H�a gi�o ta!",
			"Chuy�n n�y c� li�n quan ��n vi�c l�n ng�i c�a Ho�ng t� ch�ng!?",
			"Kh�ng li�n quan g� ��n ng��i",
			"����",
			"{(Ngh� th�m) Hay l� quay v� g�p {Cao Th�ng Tuy�n}}",
			}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV35_ID,2);
    TaskTip("Quay v� g�p Cao Th�ng Tuy�n");
    Msg2Player("Quay v� g�p Cao Th�ng Tuy�n");
    	
	--δɱ��10����ڽ�ͽ
	else
		SetTask(TASK_DL_LV35_01_ID,10);
	end;
	RemoveTrigger(GetRunningTrigger());
end

--ɱ��10����ڽ�ͽ
function ChiHuoBlack_Killed_10()

local nSate = GetTask(TASK_DL_LV35_01_ID);
	--֮ǰ��ɱ��10����׽�ͽ
	if nSate == 10 then
	local strTalk = {
		"C� chuy�n g� v�y?",
		"Kh�ng li�n quan g� ��n ng��i!",
		"Cho d� l� chuy�n c�a c�c ng��i �i ch�ng n�a th� c�ng kh�ng ���c n�o lo�n ��i T�ng c�a ta!",
		"Ta c�nh b�o ng��i ��ng xen v�o vi�c c�a Xi H�a gi�o ta!",
		"Chuy�n n�y c� li�n quan ��n vi�c l�n ng�i c�a Ho�ng t� ch�ng!?",
		"Kh�ng li�n quan g� ��n ng��i",
		"����",
		"{(Ngh� th�m) Hay l� quay v� g�p {Cao Th�ng Tuy�n}}",
		}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV35_ID,2);
    TaskTip("Quay v� g�p Cao Th�ng Tuy�n");
    Msg2Player("Quay v� g�p Cao Th�ng Tuy�n");
    	
	--δɱ��10����׽�ͽ
	else
		SetTask(TASK_DL_LV35_01_ID,10);
	end;
	RemoveTrigger(GetRunningTrigger());
end

--ɱ��15������ͽ
function ChiHuoRed_Killed_15()
local strTalk = {
	"C� chuy�n g� v�y?",
	"Kh�ng li�n quan g� ��n ng��i!",
	"Cho d� l� chuy�n c�a c�c ng��i �i ch�ng n�a th� c�ng kh�ng ���c n�o lo�n ��i T�ng c�a ta!",
	"Ta c�nh b�o ng��i ��ng xen v�o vi�c c�a Xi H�a gi�o ta!",
	"Chuy�n n�y c� li�n quan ��n vi�c l�n ng�i c�a Ho�ng t� ch�ng!?",
	"Kh�ng li�n quan g� ��n ng��i",
	"����",
	"(Ngh� th�m) (Hay l� quay v� g�p {Cao Th�ng Tuy�n})",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV35_ID,2);
	SetTask(TASK_DL_LV35_ID_ZX,2);
  TaskTip("Quay v� g�p Cao Th�ng Tuy�n");
  Msg2Player("Quay v� g�p Cao Th�ng Tuy�n");
  RemoveTrigger(GetRunningTrigger());
end

--��������Ի�1
function Zhaoyannian_Talk()

local nTask_DL_State_40 = GetTask(TASK_DL_LV40_ID);

	if nTask_DL_State_40 == 1 then
		local strTalk = {
			"B�ch Hi�u Sinh sai ng��i ��n �?",
			"T�i h� mu�n bi�t v� vi�c l�n ng�i c�a Ho�ng T�.",
			"Th� ra l� chuy�n n�y.",
			"Ti�ng ��n kh�ng sai",
			"���ng tri�u Ho�ng �� {��i L�} l� {�o�n T� Th�ng}",
			"Ho�ng �� khai qu�c l�p n�n {��i L�} ch�ng ph�i l� {�o�n T� B�nh} sao? {�o�n T� Th�ng} l� ho�ng �� �?",
			"Th�nh ph�n qu� t�c � {��i L�} n�y ��u l� {B�ch T�c}, d�ng h� �o�n c�ng thu�c B�ch T�c, v� v�y m� c�ch ��t t�n c�ng gi�ng ng��i H�n ch�ng ta. M�i nghe qua {�o�n T� B�nh} v� {�o�n T� Th�ng} gi�ng nh� l� huynh �� nh�ng ho�n to�n kh�ng ph�i, gi�a h� c�ch nhau ��n 3 ��i!",
			"Th� ra l� v�y!"
			}
			TalkEx("Zhaoyannian_Talk_01",strTalk);
			RemoveTrigger(GetRunningTrigger());
		  return
	end;
	
	if nTask_DL_State_40 == 5 then
		local strTalk = {
			"Tri�u ti�n b�i, t�i h� ���c bi�t {Xi H�a gi�o} t�c lo�n l� v� mu�n tru�t ng�i ���ng kim Ho�ng th��ng, ngo�i ra c�n g� n�a kh�ng?",
			"Ta c�ng kh�ng r�, ng��i ��n {��i L�} h�i nh�ng ng��i H�n � �� may ra c� ch�t manh m�i.",
			"�a t� ti�n b�i ch� gi�o!",
			"(Ng��i H�n � {��i L�}�Xem ra ph�i t�m {Tr�nh Qu�n Chi} r�i!)",
			}
		  TalkEx("",strTalk);
			SetTask(TASK_DL_LV40_ID,6);
		  TaskTip("��n ��i L� t�m Tr�nh Qu�n Chi");
		  Msg2Player("��n ��i L� t�m Tr�nh Qu�n Chi");
		  GivePlayerAward("Level_40","xn_step_4","chest","Level_44");
		  GivePlayerExp(SkeyDali,"chihuojiaoyinmou")
		  RemoveTrigger(GetRunningTrigger());
		  return
	end
end;

--��������Ի�2
function Zhaoyannian_Talk_01()

local strTalk	= {
	"Ho�ng �� {�o�n T� Th�ng} tr��c khi b�ng h� c� �� l�i th�nh ch� truy�n ng�i cho m�t trong {ba v� ho�ng t�}, nh�ng c� ba v� ��u mu�n tranh ng�i b�u. Sau �� th� Ho�ng t� c� m�t t�ch, nh� ho�ng t� ph�n lo�n, cu�i c�ng Tam Ho�ng t� �o�n T� Kh�nh l�n ng�i.",
	"{Xi H�a gi�o} t�c lo�n c�ng v� chuy�n n�y? Sao t�i h� kh�ng nghe {Cao Th�ng Tuy�n} n�i g�?",
	"Sau khi {Tam Ho�ng t�} l�n ng�i m�i c� chuy�n {Xi H�a gi�o} ph�n lo�n, nh�ng c� li�n quan ��n chuy�n n�y hay kh�ng ta c�ng kh�ng r�. ��y ch� l� chuy�n n�i b� n�n Cao ti�n b�i c�ng kh�ng ti�n n�i ra.",
	}
	TalkEx("Zhaoyannian_Talk_02",strTalk);
end

--��������Ի�3
function Zhaoyannian_Talk_02()	

local strTalk	=	{
	"T�i h� mu�n �i�u tra m�t ch�t manh m�i v� {Xi H�a gi�o}, ti�n b�i n�i xem t�i h� ph�i l�m th� n�o?",
	"T�c tr��ng Mi�u L�nh tr��c ��y c� qua l�i v�i Xi H�a gi�o ng��i th� ��n �� h�i xem.",
	"�a t� ti�n b�i ch� gi�o!"
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ID,2);
	TaskTip("��n g�p T�c tr��ng Mi�u L�nh");
	Msg2Player("��n g�p T�c tr��ng Mi�u L�nh");
	GivePlayerAward("Level_40","xn_step_2");
	GivePlayerExp(SkeyDali,"dalihuangzu")
	return
end

--ɱ�����뻤ӡ
function MLHY_Killed_1()

  if g_probability(30, 100) then
  	AddItem(2,0,366,1,1);--�õ���Ƥ
  	if GetItemCount(2,0,366) >= 10 then
  		TaskTip("�� t�m �� 10 t�m Da h��u, quay v� g�p Tr�nh Qu�n Chi");
  		Msg2Player("�� t�m �� 10 t�m Da h��u, quay v� g�p Tr�nh Qu�n Chi");
  	end;
	end;
end;

--ɱ��������˾
function MLTS_Killed_1()

    if g_probability(30, 100) then
      AddItem(2,0,368,1,1);--�õ���˾�嵶
      if GetItemCount(2,0,368) >= 10 then
      	TaskTip("�� l�y ���c 10 B�i �ao quay v� g�p Tr�n L�p Ho�nh");
      	Msg2Player("�� l�y ���c 10 B�i �ao quay v� g�p Tr�n L�p Ho�nh");
    	end;
		end;
end;

--ɱ����ҹ��
function MidnightTiger_Killed_1()
   
    if g_probability(40, 100) then
      AddItem(2,0,371,1,1);--�õ���ҹ����
      if GetItemCount(2,0,371) >= 10 then
      	TaskTip("�� t�m ���c 10 nanh D� H�!");
      	Msg2Player("�� t�m ���c 10 nanh D� H�!");
    	end;
		end;
end;

--ɱ����ͷ��
function BaldEagle_Killed_1()
    
    if g_probability(40, 100) then
      AddItem(2,0,372,1);--�õ���ͷ����
      if GetItemCount(2,1,372) >= 10 then
      	TaskTip("�� t�m ���c 10 l�ng B�ch ��u �i�u");
      	Msg2Player("�� t�m ���c 10 l�ng B�ch ��u �i�u");
    	end;
		end;
end;

--��Ī���Ի�
function MoSan_Talk()

	--δ��ȡ�����
	if GetTask(TASK_DL_LV55_ID) == 2 then

		local strTalk = {};
		
		--Ī��ͽ�ܶԻ�
		if GetLifeSkillLevel(1,4) ~= 0 then
		
			strTalk = {
				"M�c s� b�, t�i h� c� vi�c mu�n nh� ng��i.",
				"Cao Th�ng Tuy�n ph�i ng��i ��n �? Ta bi�t r�i, t�m �� v�t li�u ta s� gi�p cho.",
				"M�c s� b� bi�t h�t r�i �?",
				"Ta v� Cao huynh �n ngh�a s�u n�ng, l�n n�y huynh �y c� vi�c l� n�o ta l�i t� ch�i?",
				"Th� ra l� v�y!",
				"Kh�ng c�n kh�ch s�o.",
				"uh!!",
				"�",
				"Xong r�i! Nh�ng Ph�ng Ho�ng Linh n�y r�t mau m�t t�c d�ng! H�y mau ��n Ph�ng Nh�n ��ng g�i ra v� ��nh b�i Ph�ng Ho�ng!",
				"T�i h� bi�t r�i, �a t� Tam s� b�.",
				}
		else
			strTalk = {
				"{M�c s� b�}, t�i h� ���c Cao Qu�c C�ng sai ��n t�m ng��i.",
				"��n nh� ta ch� t�o Ph�ng Ho�ng Linh �? ��i m�t l�t nh�!",
				"Xin �a t�!",
				"�",
				"Xong r�i! Nh�ng Ph�ng Ho�ng Linh n�y r�t mau m�t t�c d�ng! H�y mau ��n Ph�ng Nh�n ��ng g�i ra v� ��nh b�i Ph�ng Ho�ng!",
				"T�i h� bi�t r�i, �a t� Tam s� b�.",
				}		
  	end;
  	
		TalkEx("",strTalk);
		DelItem(2,0,371,10);--ɾȥ10������
		DelItem(2,0,372,10);--ɾȥ10������
		AddItem(2,0,373,1,1)--�õ��ٻ���¥����Ʒ�����
		SetTask(TASK_DL_LV55_ID,3);
		CreateTrigger(1,450,TIME_DL_PHENIX);
		ContinueTimer(GetTrigger(TIME_DL_PHENIX));
		local	nTime = GetTime();
		SetTask(TASK_DL_LV55_TIME,nTime);--��¼�õ������ʱ��
		Msg2Player("D�ng Ph�ng Ho�ng Linh g�i v� ��nh b�i Ph�ng Ho�ng (trong 30 ph�t)!");
		TaskTip("D�ng Ph�ng Ho�ng Linh g�i v� ��nh b�i Ph�ng Ho�ng (trong 30 ph�t)!");
		GivePlayerExp(SkeyDali,"tiejiangmoshan")
		return
	end
	
	--������߷����ͶԻ�������
	if GetTask(TASK_DL_LV55_ID) == 3 then
		local nTime = GetTime();
		local nTaskTime = GetTask(TASK_DL_LV55_TIME);
		if GetItemCount(2,0,373) <= 0 and nTime - nTaskTime >= 1800 then
			CreateTrigger(4,201,TALK_DL_MOSAN);
			CreateTrigger(1,450,TIME_DL_PHENIX);
			ContinueTimer(GetTrigger(TIME_DL_PHENIX));
			nTime = GetTime();
			SetTask(TASK_DL_LV55_TIME,nTime);--��¼�õ������ʱ��
			AddItem(2,0,373,1,1)--�õ��ٻ���¥����Ʒ�����
			Msg2Player("D�ng Ph�ng Ho�ng Linh g�i v� ��nh b�i Ph�ng Ho�ng (trong 30 ph�t)!");
			TaskTip("D�ng Ph�ng Ho�ng Linh g�i v� ��nh b�i Ph�ng Ho�ng (trong 30 ph�t)!");
		end;
		local strTalk = {
			"C�m Ph��ng Ho�ng Linh ��n Ph��ng Nh�n ��ng s� d�ng, n�u th�t b�i ho�c m�t Ph��ng Ho�ng Linh, th� ��n ch� ta l�y 1 c�i m�i, nh�ng m� ch� t�o Ph��ng Ho�ng Linh c�n c�n m�t �t th�i gian, c�n 30 ph�t �� l�m th�m m�t c�i kh�c, <sex> ph�i gi� g�n c�n th�n. ",
			}
		
		TalkEx("",strTalk);
		return
	end
	
	--ȷ��ɾ���Ի�������
	if GetTask(TASK_DL_LV55_ID) >= 4 then
		RemoveTrigger(GetRunningTrigger());
	end
end

--�����ʱ�䳬ʱ
function Phenix_TimeOut()

local strTalk = {
	"�� qu� 30 ph�t, Ph�ng Ho�ng Linh  �� h�t hi�u l�c quay l�i T��ng D��ng t�m M�c Tam."
}

	TalkEx("",strTalk);
	if GetTrigger(TALK_DL_MOSAN) == 0 then
		CreateTrigger(4,201,TALK_DL_MOSAN);
	end;
	DelItem(2,0,373,1);--ɾȥ�����
	RemoveTrigger(GetRunningTrigger());
	Msg2Player("Quay l�i t�m M�c tam nh�n Ph�ng Ho�ng Linh m�i.");
	TaskTip("Quay l�i t�m M�c tam nh�n Ph�ng Ho�ng Linh m�i.");

end

--58��������̫���Ի�������
function SheTaiJun_Talk()

local strTalk = {};
	
	--��ȡС��
	if GetTask(TASK_DL_LV55_ID) == 6 then
		if GetPlayerFaction() == 6 then
			strTalk = {
				"L�o Th�i Qu�n, t�i h� tu�n l�nh {��ng Qu�c S�} ��n ��n c�ng t� {��ng Ca Minh} v� {��i L�}.",
				"�� nh�n nhi�m v� th� l�m cho t�t, ��ng �� m�t m�t ng��i c�a D��ng M�n.",
				"uh!!",
				"��ng Ca Minh ��n ��y ch�a l�u, v� c�ng h�c ���c c�ng ch�a nhi�u, ng��i ��a thi�u gia v� th�m ph� m�u v�i h�m r�i quay l�i ti�p t�c luy�n v� nh�!",
				"uh!!",
				"��ng Ca Minh, chu�n b� xong ch�a? T��ng s� n�y s� ��a con v� th�m ph� th�n, huynh �y c�ng l� �� t� D��ng gia ch�ng ta.",
				"Ta mu�n mua m�t v�i m�n ��c s�n � ��i T�ng v� cho ph� m�u nh�ng kh�ng bi�t ch�n m�n n�o, n�n �� ��c to�n b� m�n �n ngon � nh�ng L�u l�u trong c�c th�nh th�!",
				"C� hi�u nh� v�y th�t l� t�t. Phi�n b�ng h�u gi�p thi�u gia nh�!"
				}
		else 
			strTalk = {
				"L�o Th�i Qu�n t�i h� tu�n l�nh {��ng Qu�c S�} ��n ��n c�ng t� {��ng Ca Minh} v� {��i L�}.",
				"<sex> v�t v� qu�! L�n n�y c�ng t� v� th�m ph� m�u r�i s�m quay l�i ��y ti�p t�c luy�n v� nh�!",
				"T�i h� s� b�o l�i v�i {��ng Qu�c S�}.",
				"��ng Ca Minh ch�n b� xong h�t ch�a? Theo <sex> v� ��i L� nh�!",
				"Ta mu�n mua m�t v�i m�n ��c s�n � ��i T�ng v� cho ph� m�u nh�ng kh�ng bi�t ch�n m�n n�o, n�n �� ��c to�n b� m�n �n ngon � nh�ng L�u l�u trong c�c th�nh th�!",
				"C� hi�u nh� v�y th�t l� t�t. Phi�n b�ng h�u gi�p thi�u gia nh�!",
				}
		end
	TalkEx("SheTaiJun_Talk_01",strTalk);
end
	
	--δ��С���ͻ�ȥ
	if GetTask(TASK_DL_LV55_ID) == 7 then
		local strTalk = {
			"���ng �i r�t nguy hi�m, nh� b�o tr�ng nh�!",
			}
			
		TalkEx("",strTalk);
		--RemoveTrigger(GetRunningTrigger())
		return
	end;
end


function SheTaiJun_Talk_01()

local strTalk = {
				"C�: B�o Ng� (Bi�n Kinh), V�t quay (D��ng Ch�u), Long Ch�u (Tuy�n Ch�u), b�nh t� (T��ng D��ng), b�nh �t (Th�nh ��)",
				"C�ng ���c! Mau mua nhanh r�i v� th�m ph� th�n nh�!",
				}
	TalkEx("",strTalk);
	SummonNpc("��ng Ca Minh","��ng Ca Minh");
	SetTask(TASK_DL_LV55_ID,7);
	--UseScrollEnable(0);--���λس̷�ʹ��
	--SetDeathScript("\\script\\task\\world\\����\\Lv58\\playerdeath.lua");--���ô�С�������е���������ű�
	Msg2Player("��a ��ng Ca Minh ��n c�c th�nh th� �� mua v�t ph�m");
	TaskTip("��a ��ng Ca Minh ��n c�c th�nh th� �� mua v�t ph�m");
	GivePlayerAward("Level_58", "xn_step_1");
	GivePlayerExp(SkeyDali,"yangmenxuexi")
	
end

--ɱ��20������
function PoisonBat_Killed_20()
	
	RemoveTrigger(GetRunningTrigger());
	SetTask(TASK_DL_LV60_ID,2);
	TaskTip("�� gi�t ���c 20 d�i ��c, quay v� g�p ��ng Gi� La");
	Msg2Player("�� gi�t ���c 20 d�i ��c, quay v� g�p ��ng Gi� La");
	
end

--ҹ��Ѫѻ����������
function BloodCrow_Killed_1()
  
    if g_probability(40, 100) then
      AddItem(2,0,197,1,1);--�õ�Ѫѻ��
    	if GetItemCount(2,0,197) >= 10 then
      	TaskTip("�� l�y �� 10 Huy�t Nha V�");
      	Msg2Player("�� l�y �� 10 Huy�t Nha V�");
    	end;
		end;
end

--ɱ��15�����ܶ���
function CreatureMan_Killed_15()
	
	RemoveTrigger(GetRunningTrigger());
	if GetTask(TASK_DL_LV35_ID_ZX) == 100 and GetTask(TASK_DL_LV62_ID) == 3 then
		SetTask(TASK_DL_LV62_ID,4);
		TaskTip("Gi�t ���c 15 Kh�i L�i ��c Nh�n v� Xi H�a Tr��ng l�o, quay v� g�p Tr�nh Qu�n Chi.");
		Msg2Player("Gi�t ���c 15 Kh�i L�i ��c Nh�n v� Xi H�a Tr��ng l�o, quay v� g�p Tr�nh Qu�n Chi.");
	else
		SetTask(TASK_DL_LV35_ID_ZX,100);--����1304�ű������
		TaskTip("Gi�t ���c 15 Kh�i L�i ��c Nh�n");
		Msg2Player("Gi�t ���c 15 Kh�i L�i ��c Nh�n");
	end;
end

--ɱ��15������
function ChiHuoElder_Killed_15()
	
	RemoveTrigger(GetRunningTrigger());
	if GetTask(TASK_DL_LV35_ID_ZX) == 100 and GetTask(TASK_DL_LV62_ID) == 3 then
		SetTask(TASK_DL_LV62_ID,4);
		TaskTip("Gi�t ���c 15 Kh�i L�i ��c Nh�n v� Xi H�a Tr��ng l�o, quay v� g�p Tr�nh Qu�n Chi.");
		Msg2Player("Gi�t ���c 15 Kh�i L�i ��c Nh�n v� Xi H�a Tr��ng l�o, quay v� g�p Tr�nh Qu�n Chi.");
	else
		SetTask(TASK_DL_LV35_ID_ZX,100);--����1304�ű������
		TaskTip("Gi�t ���c 15 Xi H�a Tr��ng L�o");
		Msg2Player("Gi�t ���c 15 Xi H�a Tr��ng L�o");
	end;
end

--�������Ի�������
function BaiXiaoSheng_Talk()

local strTalk = {};
	--����嶾�̵�ŭ�������
	if GetTask(TASK_DL_LV75_ID) == 3 then
		strTalk = {
			"Ti�n b�i, c� vi�c nh� ti�n b�i ch� gi�o.",
			"Ch� ph�i l�n tr��c ta �� n�i r�i, sao l�i ��n n�a?",
			"L�n n�y l� chuy�n kh�c�",
			"Nh�ng �i�u ng��i quan t�m ��u c� h�t trong t�m ��i L� C�u Ch�. Hi�n gi� L�u �i�n �ang gi�, mau ��n ��i L� t�m �ng �y �i.",
			"�a t� ti�n b�i!",
			}
		
		TalkEx("",strTalk);
		CreateTrigger(4,203,TALK_DL_BAIXIAOSHENG);
		Msg2Player("��n ��i L� t�m L�u �i�n");
		TaskTip("��n ��i L� t�m L�u �i�n");
		SetTask(TASK_DL_LV75_ID,4);
		GivePlayerExp(SkeyDali,"qiyi")
		--RemoveTrigger(GetTrigger(TALK_DL_BAIXIAOSHENG));
		return
	end
	--δ������Ի�
	if GetTask(TASK_DL_LV75_ID) == 4 then
		strTalk = {
		"Ng��i c� th� ��n ��i L� t�m L�u �i�n �� h�i v� t�m ��i L� C�u Ch�."
		}
		TalkEx("",strTalk);
		return
	end
end

--���������������ű�
function Jocko_Killed_1()

    if g_probability(40, 100) then
      AddItem(2,0,379,1,1);--�õ������־��Ƭ
      if GetItemCount(2,0,379) >= 10 then
      	TaskTip("�� thu th�p ���c 10 t�m ��i L� C�u Ch�");
      	Msg2Player("�� thu th�p ���c 10 t�m ��i L� C�u Ch�");
    	end;
		end;
end

--�𵶿����������ű�
function DaoKe_Killer_10()

local strTalk = {
	"C�n ��nh tr�ng th��ng ng��i c�a b�n ta, chuy�n n�y l� th� n�o?",
	"Nh� v� ch� hi�u l�m, ta kh�ng c�n c�ch n�o kh�c m�i ph�i l�m nh� v�y.",
	"Ta ��n t�m t�n ti�u t� m� ng��i v�a nh�c ��n, h�n h�n h� v�i t�nh nh�n b� tr�n nh�ng b� c�c ng��i b�t gi�.",
	"H�m�h�n h� gi�a ��m h�m v�y �?",
	"(Ngh� th�m) (Ta c�ng ch�a g�p A M�ng l�n n�o, chi b�ng quay v� g�p A Ch�u v�y)"
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ZX_ID,5);
	TaskTip("Quay l�i Mi�u L�nh b�o l�i t�nh h�nh cho A Ch�u");
	Msg2Player("Quay l�i Mi�u L�nh b�o l�i t�nh h�nh cho A Ch�u");
end


	