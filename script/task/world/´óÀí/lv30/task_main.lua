-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����30,62������̴����ļ�
-- By StarryNight
-- 2006/01/04 PM 16:26

--������ ������ ������ 
--��: ���� �ܻ� ���� ���� ���� ��Ȣ �ɲ� ��ж ���� ���� ���� ���� ���� ���� ��լ ���� ���� ��׽ ��� ��ľ ���˿� ��ˮ 
--��: ���� ���� �޷� ���� 
--��������: �帻 ����  
--�����˼�: ��ɷ С�� ���� ���� Ԫ��  
--ÿ��̥��ռ��: ռ�������ڱ� 
--����: ����ˮ ִִλ 
--��: ����(����)ɷ�� 
--����ټ�: �ﲻ����������ǿ �Ѳ�Զ�в������ 

-- ======================================================

-- ���þ��������ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--���ӨӨ�Ի���ȡ�綾ʳ�˲�����
function task_001_00()

local strTalk = {};

	if GetPlayerFaction() == 7 then --�嶾����ר�жԻ�
		strTalk = {
			"Gi�o ch�, thu�c h� v� r�i.",
			"C� thu th�p ���c tin t�c g� kh�ng?",
			"Thu�c h� ���c bi�t th� l�c c�a Xi H�a gi�o hi�n nay r�t m�nh, Cao Th�ng Tuy�n c�n nghi ng� Ng� ��c gi�o v� Xi H�a c� li�n quan v�i nhau.",
			"Cao Th�ng Tuy�n nghi ta c� li�n quan ��n Xi H�a gi�o, c�n ng��i?",
			"Thu�c h� kh�ng d�m, Ch� mu�n g�p gi�o ch� t�m hi�u v� t�nh h�nh c�a Xi H�a gi�o th�i.",
			"���c th�i! Nh�ng tr��c ti�n h�y ��n t�ng 2 M� Cung thu th�p 20 h�t ��c ch�ng, ta �ang c�n g�p �� luy�n ��c d��c.",
			"Tu�n l�nh!"
			}
	else
		strTalk = {
			"Ti�n b�i c� ph�i l� gi�o ch� Ng� ��c gi�o?",
			"��ng g�i ta l� ti�n b�i l�o b�i nghe gi� l�m. <sex> ��n t�m ta c� vi�c g� kh�ng? Hay l� mu�n gia nh�p gi�o ph�i?",
			"T�i h� ���c Cao Qu�c C�ng {Cao Th�ng Tuy�n} ph�i ��n g�p gi�o ch� �� h�i th�m v� {Xi H�a Gi�o}.",
			"H�i ta v� t�nh h�nh c�a Xi H�a Gi�o? Cao Th�ng Tuy�n v�n c�n nghi ng� ta? �ng ta ���ng ���ng l� Qu�c c�ng c�a ��i L� ch�ng l� vi�c c�n con n�y c�ng qu�n kh�ng n�i?",
			"Xin h�i gi�o ch�, nh�ng vi�c x�y ra v�i Xi H�a gi�o ph�i ch�ng c� li�n quan ��n ho�ng t�c?",
			"Bi�t n�i th� n�o, v�y �i. Ta �ang c�n 20 h�t Th�c Nh�n Th�o �� tinh luy�n ��c d��c, ng��i c� th� ��n t�ng 2 M� cung c�a b�n gi�o �em v� ��y ���c kh�ng?",
			"���c! Xong vi�c n�y hy v�ng gi�o ch� s� n�i cho t�i h� bi�t.",
			"Nh�t ��nh r�i."
			}
	end;
	
	TalkEx("",strTalk);
	CreateTrigger(0,252,KILL_DL_ANPLANT);
	SetTask(TASK_DL_LV30_ID,2);
	TaskTip("��n t�ng 2 M� cung l�y 20 h�t Th�c Nh�n Th�o");
	Msg2Player("��n t�ng 2 M� cung l�y 20 h�t Th�c Nh�n Th�o");

end;

--��ȡ��������󣬻򲹷��綾ʳ�˲ݴ��������������һ��
function task_002_00()

local nItemNum = GetItemCount(2,0,364);
local strTalk = {
	"Gi�p ta ��n t�ng 2 M� cung l�y 20 h�t Th�c Nh�n Th�o.",
}

	if nItemNum >= 20 then --�Ѿ��ռ���20������
		if GetPlayerFaction() == 7 then --�嶾����ר�жԻ�
			strTalk = {
				"Gi�o ch�, v�t ph�m ng��i c�n �� t�m ��.",
				"Th�t t�t qu�!",
				"V�y ng��i n�i cho t�i h� nghe v� Xi H�a gi�o?",
				"Ta s� n�i! Nh�ng c� vi�c n�y c�n g�p h�n! Ng� ��c �m C� �� ��n t�ng 2 M� Cung ��ng thu th�p ��c v�t, h�n c�n b�t m�t s� d�n l�ng ��n �� luy�n ��c. Ng��i h�y �i ti�u tr� t�n n�y gi�p ta.",
				"Tu�n l�nh!"
				}
		else
			strTalk = {
				"Gi�o ch�, v�t ph�m ng��i c�n �� t�m ��.",
				"Th�t t�t qu�!",
				"V�y Xi H�a gi�o c� li�n quan g� v�i Ng� ��c gi�o kh�ng?",
				"G�n ��y Ng� ��c �m C� ��n t�ng hai c�a M� Cung ��ng thu th�p ��c v�t, c�n b�t m�t s� d�n l�ng ��n �� luy�n ��c. <sex> h�y �i ti�u tr� t�n n�y gi�p ta!",
				"����",
				"��ng l�m m�t th�i gian. <sex> mau �i �i. Ho�n th�nh nhi�m v� ta s� n�i cho ng��i nghe.",
				"T�i h� �i ngay!"
				}
		end;
		
		DelItem(2,0,364,20);
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV30_ID,3);
		RemoveTrigger(GetTrigger(KILL_DL_ANPLANT))
		TaskTip("��n M� cung t�ng 2 ti�u tr� Ng� ��c �m C�.");
		Msg2Player("��n M� cung t�ng 2 ti�u tr� Ng� ��c �m C�.");
		GivePlayerAward("Level_30","xn_step_1");
		GivePlayerExp(SkeyDali,"peiyao")
		return
	--�����綾ʳ�˲ݴ�����	
	elseif GetTrigger(KILL_DL_ANPLANT) == 0 then
		CreateTrigger(0,252,KILL_DL_ANPLANT);
		TaskTip("��n t�ng 2 M� cung l�y 20 h�t Th�c Nh�n Th�o");
		Msg2Player("��n t�ng 2 M� cung l�y 20 h�t Th�c Nh�n Th�o");
		return
	end;
	
	TalkEx("",strTalk);

end;

--��ȡԦ�����������δɱ��Ԧ������֮ǰ
function task_003_00()

local strTalk = {
	"Mu�n di�t Ng� ��c �m C� ph�i ��n t�ng 2 M� cung. <sex> mau �i �i.",
}
		TalkEx("",strTalk);
end;


--ɱ��Ԧ��������1
function task_004_00()

local strTalk = {};

	if GetPlayerFaction() == 7 then --�嶾����ר�жԻ�
		strTalk = {
			"Gi�o ch�, t�i h� �� ti�u tr� {Ng� ��c �m C�}.",
			"L�n n�y ng��i v�t v� qu�!",
			"�a t� gi�o ch� qu� khen.",
			"Ha! Ha! V�a r�i ta sai ng��i �i di�t Ng� ��c �m C� ch�nh l� ng��i c�a Xi H�a gi�o, n�u ta v� Xi H�a gi�o c� li�n quan ��n nhau l� n�o ta l�i �i gi�t h� �?",
			"N�i v�y l� gi�a ti�n b�i v� Xi H�a gi�o kh�ng li�n quan g� ��n nhau?",
			"���ng nhi�n r�i! Xi H�a gi�o sao s�nh b�ng Ng� ��c gi�o c�a ta!",
			"Ti�n b�i c� th� n�i r� h�n ���c kh�ng?",
			"Xi H�a gi�o ph�n lo�n l� v� kh�ng mu�n t�n ho�ng �� k� v�.",
			"T�i h� c� nghe qua, Xi H�a gi�o t�c lo�n c�ng v� chuy�n n�y."
			}
		TalkEx("task_004_01",strTalk);
		return
	else
		strTalk = {
			"T�i h� �� di�t ���c {Ng� ��c �m C�}, gi�o ch� n�i cho t�i h� nghe ���c r�i ch�?",
			"<sex> tu�i tr� t�i cao, l�ng ��y nhi�t huy�t! Giang h� l�i c� th�m m�t nh�n t�i!",
			"����",
			"L�c n�y sai ng��i �i gi�t ��c �m C� ch�nh l� ng��i c�a Xi H�a gi�o. N�u ta v� Xi H�a gi�o c� li�n quan ��n nhau, l� n�o ta l�i sai ng��i �i gi�t h�n?",
			"N�i v�y l� gi�a ti�n b�i v� Xi H�a gi�o kh�ng li�n quan g� ��n nhau?",
			"���ng nhi�n r�i! Xi H�a gi�o sao s�nh b�ng Ng� ��c gi�o c�a ta!",
			"Ti�n b�i c� th� n�i r� h�n ���c kh�ng?",
			"Xi H�a gi�o ph�n lo�n l� v� mu�n ho�n v� Ho�ng ��",
			"T�i h� c� nghe qua, Xi H�a gi�o t�c lo�n c�ng v� chuy�n n�y."
			}
		TalkEx("task_004_02",strTalk);
		return
	end;
end;

--ɱ��Ԧ��������2(�嶾����)
function task_004_01()

local strTalk = {
	"��i L� c� ��n {L�c ��i gia t�c}? Chuy�n n�y ng��i c�ng bi�t sao?",
	"T�i h� kh�ng bi�t, mong gi�o ch� n�i r� h�n.",
	"L�c ��i gia t�c � ��i L� trong �� c� Cao gia, Cao Th�ng Tuy�n l� t�c tr��ng. T�t nh�t ng��i ��n g�p Cao Th�ng Tuy�n �� h�i r� h�n nh�!",
	"T�i h� hi�u r�i.",
	"C�n vi�c n�y n�a, ph��ng ph�p ph�i ch� ��c d��c c�a Kh�i L�i ��c Nh�n �� b� Xi H�a gi�o ��nh c�p, ng��i b�o l�i v�i Cao Th�ng Tuy�n v�y nh�!",
	"T�i h� bi�t r�i."
}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV30_ID,5);
	TaskTip("Quay l�i ��i L� g�p Cao Th�ng Tuy�n!");
	Msg2Player("Quay l�i ��i L� g�p Cao Th�ng Tuy�n!");
	GivePlayerAward("Level_30","xn_step_2","weapon","Level_34");
	GivePlayerExp(SkeyDali,"yuduyinji")
end

--ɱ��Ԧ��������2
function task_004_02()

local strTalk = {
	"Sao? Cao Th�ng Tuy�n kh�ng th�a nh�n �?",
	"T�i h� ch�a t�ng nghe qua, mong gi�o ch� n�i r�.",
	"T�t nh�t ng��i n�n ��n g�p Cao Th�ng Tuy�n �� h�i. N�i v�i �ng �y l� ta c�n r�t nhi�u vi�c kh�ng th� ��n ��i L� ���c.",
	"T�i h� �i ngay!",
	"C�n vi�c n�y n�a, ph��ng ph�p ph�i ch� ��c d��c c�a Kh�i L�i ��c Nh�n �� b� Xi H�a gi�o ��nh c�p, ng��i b�o l�i v�i Cao Th�ng Tuy�n v�y nh�!",
	"T�i h� bi�t r�i."
}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV30_ID,5);
	TaskTip("Quay l�i ��i L� g�p Cao Th�ng Tuy�n!");
	Msg2Player("Quay l�i ��i L� g�p Cao Th�ng Tuy�n!");
	GivePlayerAward("Level_30","xn_step_2","weapon","Level_34");
	GivePlayerExp(SkeyDali,"yuduyinji")
end

--ɱ��Ԧ������������Ȫ֮ǰ
function task_005_00()

local strTalk = {
	"H�y quay v� g�p Cao Th�ng Tuy�n �i!",
}
		TalkEx("",strTalk);
		
end;

--��ȡ62�������嶾�̵�ŭ��
function task_006_00()

local strTalk = {};

	if GetPlayerFaction() == 7 then --�嶾����ר�жԻ�
		strTalk = {
			"Gi�o ch� cho g�i t�i h� c� vi�c g� kh�ng?",
			"Ng��i c� bi�t Kh�i L�i ��c Nh�n � Long Nh�n ��ng kh�ng?",
			"T�i h� bi�t, �� t�ng �i qua n�i ��.",
			"Kh�i L�i ��c Nh�n �� b� ng��i c�a Xi H�a gi�o �p bu�c ti�t l� ph��ng ph�p ph�i ch� ��c d��c.Hi�n nay ng��i c� th� theo ph��ng ph�p n�y ch� t�o ra ��c d��c l� ��i Tr��ng l�o Xi H�a gi�o, ng��i mau gi�p ta ti�u di�t t�n n�y �� b�o to�n b� m�t.",
			"Ng��i n�y hi�n �ang � ��u?",
			"H�n � t�ng 1 Long Nh�n ��ng. M�t m�nh ng��i kh�ng th� ��i ph� v�i h�n, n�n c� ��ng ��i h� tr�.",
			}
	else
		strTalk = {
			"{B�ch gi�o ch�} cho t�m thu�c h�?",
			"<sex>Chuy�n c� li�n quan ��n Kh�i L�i ��c Nh�n � Long Nh�n ��ng, ng��i bi�t r�i ch�?",
			"Thu�c h� v�a �i qua n�i ��.",
			"Kh�i L�i ��c Nh�n �� b� ng��i c�a Xi H�a gi�o �p bu�c ti�t l� ph��ng ph�p ph�i ch� ��c d��c.Hi�n nay ng��i c� th� theo ph��ng ph�p n�y ch� t�o ra ��c d��c l� ��i Tr��ng l�o Xi H�a gi�o. <sex> c� th� gi�p ta ti�u tr� h�n kh�ng?",
			"T�n n�y th�t ��ng ch�t! Nh�ng sao {gi�o ch�} kh�ng ��ng th�?",
			"Ta �ang c� vi�c kh�ng th� ra ngo�i ���c. <sex> l�n tr��c nh� ta cung c�p m�t s� tin t�c cho <sex> r�i l� n�o l�n n�y ng��i kh�ng gi�p ta ���c �?",
			"���c! T�n {Tr��ng l�o} n�y hi�n �ang � ��u?",
			"H�n �ang � t�ng 1 Long Nh�n ��ng. <sex>m�t m�nh ng��i kh� th�ng n�i h�n, n�n c� ��ng ��i h� tr�.",
			}
	end
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV62_ID,6);
	SetTask(TASK_DL_LV75_ID,1);
	GivePlayerExp(SkeyDali,"zaishangwudu")
	Msg2Player("��n t�ng 1 Long Nh�n ��ng di�t Xi H�a ��i Tr��ng l�o.");
	TaskTip("��n t�ng 1 Long Nh�n ��ng di�t Xi H�a ��i Tr��ng l�o.");
	return
end

--δ���������
function task_007_00()

local strTalk = {
	"Xi H�a ��i tr��ng l�o � t�ng 1 Long Nh�n ��ng.",
	}
	
	TalkEx("",strTalk);
	return
end

--�Ѿ����������1
function task_008_00()

local strTalk = {};
	
	if GetPlayerFaction() == 7 then --�嶾����ר�жԻ�
		strTalk = {
			"V� r�i �? S� vi�c th� n�o?",
			"Thu�c h� �� ti�u tr� ���c h�n.",
			"L�m t�t l�m, kh�ng h� danh l� �� t� ru�t c�a ta.",
			"�a t� gi�o ch� qu� khen.",
			"C�n vi�c n�y mu�n h�i ng��i, sao ng��i bi�t Kh�i L�i ��c Nh�n � Long Nh�n ��ng?",
			"L� {Tr�nh Qu�n Chi} sai thu�c h� ��n th�m d� {Long Nh�n ��ng} n�n m�i ph�t hi�n ra.",
			"C� ta sai ng��i ��n Long Nh�n ��ng l�m g�?",
			"C� ta nghe n�i {Xi H�a tr��ng l�o} � Long Nh�n ��ng n�n ph�i {�i�m H�a K�} ��n �� nh�ng �i r�i kh�ng th�y v� m�i sai thu�c h� th�m d� xem sao.",
			"C� ta ch� l� ng��i bu�n b�n sao l�i quan t�n ��n Xi H�a gi�o ��n v�y? Ng��i c� th�y k� l� kh�ng?",
			}		
	else
		strTalk = {
			"<sex>Th�y ng��i vui v� nh� v�y l� bi�t th�nh c�ng r�i.",
			"��ng v�y, t�n kh�ng �t s�c.",
			"<sex> �� ra tay l� ph�i th�ng.",
			"{B�ch gi�o ch�} qu� khen.",
			"Sao ng��i bi�t Kh�i L�i ��c Nh�n � Long Nh�n ��ng?",
			"L� {Tr�nh Qu�n Chi} sai thu�c h� ��n th�m d� {Long Nh�n ��ng} n�n m�i ph�t hi�n ra.",
			"C� ta sai ng��i ��n Long Nh�n ��ng l�m g�?",
			"C� ta nghe n�i {Xi H�a tr��ng l�o} � Long Nh�n ��ng n�n ph�i {�i�m H�a K�} ��n �� nh�ng �i r�i kh�ng th�y v� m�i sai thu�c h� th�m d� xem sao.",
			"C� ta ch� l� ng��i bu�n b�n sao l�i quan t�n ��n Xi H�a gi�o ��n v�y? <sex> c� th�y k� l� kh�ng?",
			}
	end
	TalkEx("task_008_01",strTalk);		
end			

--�Ѿ����������2
function task_008_01()

local strTalk = {};
	
	if GetPlayerFaction() == 7 then --�嶾����ר�жԻ�			
		strTalk = {	
			"C� ta v�a ��n {��i L�} l�m �n �� b� {Xi H�a gi�o} l�m kh� d�, v� v�y m� g�y n�n o�n th�.",
			"L� do n�y kh�ng th�a ��ng. N�u b� Xi H�a gi�o g�y kh� d� c� ta c� th� chuy�n ��n n�i kh�c �� l�m �n. Ng��c l�i c� ta c�n � l�i ��i L� li�n t�c nh� ng��i d� la tin t�c c�a Xi H�a gi�o. Ng��i kh�ng th�y �i�u n�y l� kh�c th��ng sao?",
			"����",
			"T�nh h�nh � ��i L� ta c�ng kh�ng n�m r�, ng��i t�m B�ch Hi�u Sinh h�i nh�!",
			"�a t� gi�o ch�.",
			}	
	else					
		strTalk = {
			"C� ta v�a ��n {��i L�} l�m �n �� b� {Xi H�a gi�o} l�m kh� d�, v� v�y m� g�y n�n o�n th�.",
			"L� do n�y kh�ng th�a ��ng. N�u b� Xi H�a gi�o g�y kh� d� c� ta c� th� chuy�n ��n n�i kh�c �� l�m �n. Ng��c l�i c� ta c�n � l�i ��i L� li�n t�c nh� b�ng h�u d� la tin t�c c�a Xi H�a gi�o. <sex> kh�ng th�y kh�c th��ng sao?",
			"����",
			"N�u <sex> kh�ng tin nh�ng l�i ta n�i. <sex> c� th� �i h�i ng��i kh�c v�y.",
			"Thu�c h� tin r�i! C�m �n {gi�o ch�}.",
			"{C� l� ��n {B�ch Hi�u Sinh} h�i xem, may ra bi�t th�m ���c g�.}",
			}
	end            
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV75_ID,3);
	CreateTrigger(4,203,TALK_DL_BAIXIAOSHENG);
	Msg2Player("��n t�m B�ch Hi�u Sinh.");
	TaskTip("��n t�m B�ch Hi�u Sinh.");
	GivePlayerAward("Level_65","xn_step_1","head","Level_65");
	GivePlayerExp(SkeyDali,"fangongcihuo")
	return
end

--δȥ�Ұ�����������Ϣ(����Ի�������)
function task_009_00()

local strTalk = {
	"�� g�p B�ch Hi�u Sinh ch�a? Ng��i n�y hi�u bi�t r�ng, may ra c� th� gi�p ���c b�ng h�u!"
	}
	
	if GetTrigger(TALK_DL_BAIXIAOSHENG) == 0 then
		CreateTrigger(4,203,TALK_DL_BAIXIAOSHENG);
		Msg2Player("��n t�m B�ch Hi�u Sinh.");
		TaskTip("��n t�m B�ch Hi�u Sinh.");
	end;
	TalkEx("",strTalk);
end