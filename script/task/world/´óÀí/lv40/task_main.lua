-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����40,50������̴����ļ�
-- By StarryNight
-- 2006/01/06 PM 17:37

--������ ������ ������ 
--��: ���� ���� ��ţ�� ������ȡ 
--��: ��լ ���� ���� ��Ȣ ���� �촬 
--��������: ���� ���� ����  
--�����˼�: �½� Сʱ ���� ���� �ػ�  
--����: ������  ��ִλ  
--����ټ�: �첻������������ �Ӳ��ʲ����ǻ��� 

-- ======================================================

-- ���þ��������ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--��ȡ����ǰ��կ�Ӹ�����������ʿ
function task_000_00()
	
local strTalk = {
	"Ng��i l� ai? T�m ta c� vi�c g�?",
	"Cao Qu�c C�ng ph�i thu�c h� ��n h�i th�m v� t�nh h�nh c�a {Xi H�a gi�o}.",
	"Ta bi�t r�t r� v� gi�o ph�i n�y! Nh�ng xem ng��i c� b�n l�nh g� ��! N�u th�ng ���c Mi�u L�nh �� nh�t d�ng s� � ��y ta s� n�i cho ng��i nghe!",
	"T�i h� �i ngay!",
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ID,3);
	TaskTip("��n Mi�u L�nh tr�i ��nh b�i Mi�u L�nh D�ng s� (165.187)!");
	Msg2Player("��n Mi�u L�nh tr�i ��nh b�i Mi�u L�nh D�ng s� (165.187)!");
	GivePlayerExp(SkeyDali,"miaolingzuren")
	return
end

--δ��������ʿ
function task_001_00()

local strTalk = {
	"Mi�u L�nh D�ng S� � g�n Mi�u L�nh tr�i.",
	}
	TalkEx("",strTalk);
	return
end

--�Ѵ�������ʿ
function task_002_00()

local strTalk = {
	"Qu� l� c� b�n l�nh. Ng��i c�n g�, n�i mau l�n!",
	"{Xi H�a gi�o} r�t cu�c l� gi�o ph�i n�o? T�i sao l�i ph�n lo�n nh� v�y?",
	"Ph�n lo�n? Ta kh�ng ngh� v�y. Xi H�a gi�o t�n th� ��i th�n Xi V�u n�n con ch�u Vi�m _Ho�ng nh� c�c ng��i ��u kh�ng m�y thi�n c�m, song nguy�n t�c c�a Xi H�a gi�o c�ng r�t nghi�m kh�c. L�n n�y Xi H�a gi�o ph�n lo�n l� mu�n l�t �� ho�ng ��, l�p l�i m�t �� ch�.",
	"����",
	"Ng��i c�n g� �� h�i n�a kh�ng?",
	"(Hay l� quay l�i t�m {Tri�u Di�n Ni�n}) (Ngh� th�m)",
	}
	TalkEx("",strTalk);
	CreateTrigger(4,200,TALK_DL_ZHAOYANNIAN);--����������������Ի�������
	Msg2Player("Quay v� Bi�n Kinh g�p Tri�u Di�n Ni�n");
	TaskTip("Quay v� Bi�n Kinh g�p Tri�u Di�n Ni�n");
	SetTask(TASK_DL_LV40_ID,5);
	GivePlayerAward("Level_40","xn_step_3");
	GivePlayerExp(SkeyDali,"miaolingyongshi")
	return
end

--��δ��������㱨
function task_003_00()

local strTalk = {
	"Ng��i c�n g� �� h�i n�a kh�ng?",
	"(Hay l� quay l�i t�m {Tri�u Di�n Ni�n}) (Ngh� th�m)"
	}
	TalkEx("",strTalk);
	if GetTrigger(Talk_DL_ZHAOYANNIAN) == 0 then
		CreateTrigger(4,200,TALK_DL_ZHAOYANNIAN);--����������������Ի�������
		Msg2Player("Quay v� Bi�n Kinh g�p Tri�u Di�n Ni�n");
		TaskTip("Quay v� Bi�n Kinh g�p Tri�u Di�n Ni�n");
	end;
	return
end


--�ͳ�����Ի���������峤�Ի�
function task_004_00()

local strTalk = {
	"Ch�ng ph�i l�n tr��c ng��i �� ��nh b�i Mi�u L�nh D�ng S� r�i �� sao, sao c�n quay l�i?",
	"L�n tr��c do v�i qu� n�n c� nhi�u vi�c ch�a k�p h�i t�c tr��ng, l�n n�y quay l�i mu�n nghe t�c tr��ng n�i r� h�n v� t�nh h�nh c�a {Xi H�a gi�o}.",
	"L�i h�i v� Xi H�a gi�o? ���c th�i, nh�ng tr��c ti�n ng��i ph�i gi�p ta v�i vi�c ��.",
	"Thu�c h� s�n s�ng!",
	"Tr��c ��y m�y ng�y b�n Th� Ty ��n ��y l�m lo�n, ch�ng �� c��p m�t Mi�u L�nh l�nh b�i c�a ta. Ng��i mau ��n Y�n T� ��ng t�ng 2 ��nh b�i t�n ��u l�nh �em l�nh b�i v� ��y.",
	"Thu�c h� �i ngay!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV50_ID,4);
	Msg2Player("��n Y�n T� ��ng t�ng 2 ��nh b�i t�n ��u l�nh l�y Mi�u L�nh l�nh b�i");
	TaskTip("��n Y�n T� ��ng t�ng 2 ��nh b�i t�n ��u l�nh l�y Mi�u L�nh l�nh b�i");
	GivePlayerAward("Level_50","xn_step_2");
	GivePlayerExp(SkeyDali,"chihuojiao")
end

--δ����������������峤�Ի�
function task_005_00()

local strTalk = {
	"��n Y�n T� ��ng t�ng 2 ��nh b�i t�n ��u l�nh l�y l�nh b�i.",
	}

	TalkEx("",strTalk);
	return
end

--����������������峤�Ի�1
function task_006_00()

local strTalk = {
	"��y c� ph�i l� {l�nh b�i}?",
	"Ng��i qu� l� r�t c� b�n l�nh, c� vi�c g� mau h�i �i!",
	"L�n tr��c t�c tr��ng c� nh�c ��n {Xi H�a gi�o} mu�n l�t �� {ho�ng ��}. C� ph�i v� {Xi H�a gi�o} l� {� Man} c�n ho�ng �� thu�c {B�ch T�c} kh�ng?",
	"C� nh�ng chuy�n ng��i kh�ng n�n t�m hi�u k� l�m.",
	"B�i thu�c h� nghe n�i {� Man} v� {B�ch T�c} ��i l�p nhau, m� ho�ng �� l�i thu�c B�ch T�c.",
	"��i L� do B�ch T�c ki�n l�p n�n, nh�ng �o�n T� B�nh v� ho�ng �� khai qu�c l�i mang d�ng m�u c�a c� hai b� t�c. V� v�y Xi H�a gi�o kh�ng v� chuy�n ��i l�p n�y m� t�c lo�n ���c.",
	}
	TalkEx("task_006_01",strTalk);
end

--����������������峤�Ի�2
function task_006_01()

local strTalk = {	
	"C� chuy�n n�y �? V�y sao {Xi H�a gi�o} c� mu�n l�t �� ho�ng ��?",
	"Kh�ng ph�i l� l�t �� m� ng��c l�i c�n �ng h�.",
	"Chuy�n n�y l� sao?",
	"Ng��i ��n ��i L� t�m Cao qu�n h�i th� kh�c bi�t.",
	"�a t� t�c tr��ng.",
	"(Ngh� th�m) (Xem ra l�o c�ng ch�ng bi�t th�m g� n�a r�i, ph�i v� h�i {Tr�nh c� n��ng th�i}).",
	}
	TalkEx("",strTalk);
	DelItem(2,0,370,1);
	SetTask(TASK_DL_LV50_ID,6);
	Msg2Player("Quay v� ��i L� t�m Tr�nh Qu�n Chi.");
	TaskTip("Quay v� ��i L� t�m Tr�nh Qu�n Chi.");
	GivePlayerAward("Level_50","xn_step_3");
	GivePlayerExp(SkeyDali,"miaolinglingpai")
	return
end

--δ��֣��֮�Ի�
function task_007_00()

local strTalk = {
	"Ta ch� bi�t c� b�y nhi�u �� th�i, ng��i �i t�m ng��i kh�c h�i �i.",
	}

	TalkEx("",strTalk);
	return
end

--��֧���񣺲�����
function task_100_00()

local strSay = {
	"M�ng ca �i l� M�ng ca, sao huynh n� g�t mu�i nh� v�y. A Ch�u n�y c� l�m g� ��ng t�i ch�.",
	"Chuy�n g� x�y ra v�i c� n��ng v�y?/task_101_00",
	"Hic, hic� Ta sinh ra tr�n ��i n�y �� l�m g� ch�?/task_exit"
	}
	SelectSay(strSay);
end
	
--��ȡ����������1
function task_101_00()

local strTalk = {
	"Ta v�n kh�ng ph�i ng��i v�ng n�y, do lo�n l�c n�n m�i l�u l�c ��n ��y. Kh�ng may l�c �� trong l�ng c� tr�n ��i d�ch, m�i ng��i cho ta l� m�m m�ng g�y n�n ��i h�a�",
	"V�y c�n M�ng ca?",
	"Trong l�ng ai c�ng xa l�nh, ch� c� M�ng ca l� ng��i hi�u v� an �i ta. Th� r�i gi�a ta v� huynh �y n�y sinh t�nh c�m, nh�ng th�n ph� huynh �y ph�n ��i k�ch li�t, kh�ng c�n c�ch n�o h�n, ta v� huynh �y d� ��nh b� tr�n.",
	"Sau �� th� n�o?",
	"Tr��c �� 3 ng�y huynh �y h�n ta d��i ch�n n�i V� L�ng s�n �� c�ng tr�n �i, nh�ng ta ��i m�i, ��i m�i� c�ng kh�ng th�y ��n. Ta ngh� huynh �y �� thay ��i ch� � r�i."
}
	TalkEx("task_101_01",strTalk);
end

--��ȡ����������2
function task_101_01()

local strTalk = {
	"A Ch�u ta th�t l� b�t h�nh�!",
	"C� n��ng ��ng qu� �au l�ng, �� ta ��n g�p M�ng ca h�i nguy�n nh�n ra sao.",
	"M�ng ca � ph� ��ng ��i L�, m�u th�n huynh �y l� Tri�u N��ng.",
	"C� n��ng ��ng qu� �au l�ng, �� ta ��n ��i L� g�p Tri�u N��ng h�i xem."
}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ZX_ID,1);
	Msg2Player("��n ��i L� g�p Tri�u N��ng.");
	TaskTip("��n ��i L� g�p Tri�u N��ng.");
end	

--δ������Ի�
function task_102_00()

local strTalk = {
	"M�ng ca � ph� ��ng ��i L�, v� c�ng c�m �n <sex>."
}
	TalkEx("",strTalk);
end

--������Ի�ѯ���ɸ�����
function task_103_00()

local strTalk = {
	"C�i � a ��u �� �� l�m cho A M�ng nh� ta d� d� �i�n �i�n, hi�n gi� n� � ��u ta c�ng kh�ng bi�t n�a.",
	"C� ph�i m�u th�n c�a M�ng ca?",
	"<sex> c� tin t�c c�a M�ng ca �?",
	"L� n�o M�ng ca ch�a v� nh�?",
	"C� l� n� �� �i theo a ��u �� r�i���ng th��ng cho M�ng ca�!",
	"(Ph�i l�p t�c quay l�i b�o cho A Ch�u)"
}
  TalkEx("",strTalk);
  SetTask(TASK_DL_LV40_ZX_ID,2);
	Msg2Player("B�o cho A Ch�u M�ng ca v�n ch�a v� nh�.");
	TaskTip("B�o cho A Ch�u M�ng ca v�n ch�a v� nh�.");
end

--δ�ر�����ʱ������Ի�
function task_104_00()

local strTalk = {
	"(Ph�i l�p t�c quay l�i b�o cho A Ch�u)"
}
	TalkEx("",strTalk);
end

--������Ի���ر�����
function task_105_00()

local strTalk = {
	"<sex> v� r�i �? Ta �� quy�t �inh r�i kh�i n�i n�y�",
	"Ta t� ch� Tri�u N��ng v� ��y, M�ng ca kh�ng th�y v� nh�.",
	"Sao? Huynh �y v�n kh�ng v� nh�? Ta ph�i l�m sao ��y?",
	"C� n��ng ��ng qu� x�c ��ng, h�y k� l�i bu�i h�n h�m �� ta s� c� c�ch gi�p c� n��ng.",
	"Tr��c �� 3 ng�y, huynh �y h�n ta ��n ch�n n�i V� L�ng ��i tr�i t�i r�i c�ng b� tr�n.",
	"�� ta ��n {ch�n n�i V� L�ng} h�i t�nh h�nh c�a M�ng ca.",
	"�a t� <sex>, n�u M�ng ca �� thay ��i � ��nh b� tr�n c�ng kh�ng sao, ta ch� mong cho huynh �y b�nh an.",
	"C� n��ng y�n t�m, ta s� mau �i ch�ng v�."
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ZX_ID,3);
	Msg2Player("��n ch�n n�i V� L�ng h�i th�m tin t�c M�ng ca.");
	TaskTip("��n ch�n n�i V� L�ng h�i th�m tin t�c M�ng ca.");
end

--δ������ɽ�Ų�̽�ɸ�����ǰ
function task_106_00()

local strTalk = {
	"L� A Ch�u kh�ng t�t�hu hu�"
}
	TalkEx("",strTalk);
end

--������ɽ�Ų�ҩ�˶Ի�
function task_107_00()

local strTalk = {
	"B�n gi�o �� c�a xi H�a gi�o ng�y c�ng t�c lo�n, ngay c� ��n c�y c� c�ng ph�i khi�p s�.",
	",��i th�c cho h�i 3 ng�y tr��c c� th�y ng��i thi�u ni�n n�o kho�ng 25, 26 tu�i, d�ng cao qua ��y kh�ng?",
	"3 ng�y tr��c? Kho�ng 25, 26 tu�i?",
	"Tr��c ��y m�y ng�y ta c� th�y m�t ng��i b� gi�o �� c�a Xi H�a gi�o b�t �i. B�n ch�ng qu� hung d� ta c�ng kh�ng d�m nh�n r� n�a.",
	"V�y hi�n gi� b�n ch�ng � ��u?",
	"B�n ch�ng � tr�n n�i, nh�ng n�u kh�ng c� g� th� t�t nh�t ��ng va v�o ch�ng.",
	"�a t� ��i th�c.",
	"��ng kh�ch s�o!"
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ZX_ID,4);
	Msg2Player("��n v� L�ng s�n t�m tung t�ch c�a M�ng ca.");
	TaskTip("��n v� L�ng s�n t�m tung t�ch c�a M�ng ca.");
end

--������ɽ���ͽ�Ի�
function task_108_00()

local strTalk = {
	"L�i c�a ti�u t� n�y n�i kh�ng bi�t c� ��ng tin kh�ng, h�n n�i ��n ��y �� ��i m�t ng��i.",
	"V�y �?",
	"Ti�u t� c� ph�i ch�ng mu�n nh�c ��n M�ng ca?",
	"Tr�i! L�i th�m m�t t�n n�a ��n! Ta ch�t m�t th�i!!",
	"Huynh ��, x�ng l�n!"
	}
local nMapID,nXpos,nYpos = GetWorldPos();
	
	TalkEx("",strTalk);
	CreateNpc("Xi H�a �ao Kh�ch","Xi H�a �ao Kh�ch",nMapID,nXpos,nYpos,-1,30,2);
	CreateTrigger(0,265,KILL_DL_CHIHUO_DAOKE);
	Msg2Player("��nh b�i 10 t�n Xi H�a �ao kh�ch");
	TaskTip("��nh b�i 10 t�n Xi H�a �ao kh�ch");
end

--δ���10���𵶿�,�����𵶿�����������
function task_109_00()

local strTalk = {
	"T�n kia l� ai?",
	"Huynh ��, x�ng l�n!"
	};

	if GetTrigger(KILL_DL_CHIHUO_DAOKE) == 0 then
		CreateTrigger(0,265,KILL_DL_CHIHUO_DAOKE);
		Msg2Player("��nh b�i 10 t�n Xi H�a �ao kh�ch");
		TaskTip("��nh b�i 10 t�n Xi H�a �ao kh�ch");
	else
		TalkEx("",strTalk);
	end
end	




function task_exit()

end	