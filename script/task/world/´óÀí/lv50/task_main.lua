-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����50������̴����ļ�
-- By StarryNight
-- 2006/01/09 PM 15:24

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

--��ȡ�����������˾�ռ�10����˾�嵶
function task_000_00()
	
local strTalk = {
		"Xin h�i, ti�n b�i c� ph�i l� {Tr�n L�p Ho�nh}?",
		"Ch�nh l� ta. <sex> t�m ta c� vi�c g� kh�ng?",
		"Nghe n�i ti�n b�i r�t tinh th�ng ph��ng ng� � {��i L�}, c� th� gi�p t�i h� d�ch b�c th� n�y kh�ng?",
		"C� ph�i Tr�nh Qu�n Chi n�i, phi�n <sex> �i�u tra xem m�i quan h� gi�a Mi�u L�nh v� Xi H�a Gi�o?",
		"��ng v�y.",
		"Ta c�ng �ang c� chuy�n n�y mu�n nh� <sex>.",
		"Xin ti�n b�i c� n�i.",
		"B�n Th� Ty � Mi�u L�nh ng�y c�ng t�c lo�n, ch�ng c��p b�c, �c hi�p th�o d�n. M�y huynh �� c�a ta c�ng b� ch�ng b�c ch�t. <sex> c� th� thay ta b�o th� cho c�c huynh �� �y ���c kh�ng?",
		"T�i h� s� gi�p ti�n b�i b�o th�.",
		"H�y ��n t�ng 2 Y�n T� ��ng gi�t b�n Th� Ty �em 10 B�i �ao v� ��y.",
		"Ti�n b�i ��i tin vui c�a t�i h�.",
		}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV50_ID,2);
	CreateTrigger(0,257,KILL_DL_MLTS);
	GivePlayerExp(SkeyDali,"fanyixinjian")
	TaskTip("��n t�ng 2 Y�n T� ��ng gi�t Mi�u L�nh Th� Ty l�y 10 B�i �ao");
	Msg2Player("��n t�ng 2 Y�n T� ��ng gi�t Mi�u L�nh Th� Ty l�y 10 B�i �ao");
	return
end


--�Ѿ���ȡ�ռ���˾�嵶����
function task_001_00()

local strTalk = {
	"��n t�ng 2 Y�n T� ��ng gi�t Mi�u L�nh Th� Ty �em v� 10 B�i �ao.",
	}		

	if GetItemCount(2,0,368) >= 10 then		
		strTalk = {
			"<sex> l�y ���c B�i �ao ch�a?",
			"T�i h� �� l�y ���c {B�i �ao}! Ti�n b�i xin xem qua!",
			"��ng l� B�i �ao, �a t� <sex>.",
			"Ti�n b�i, v�y c�n b�c th��",
			"��y l� th� T�c tr��ng Mi�u L�nh g�i cho Xi H�a gi�o, trong th� n�i r�ng th� l�c c�a Xi H�a gi�o hi�n gi� r�t m�nh, �� g�y s� ch� � ��n gi�i nh�n s� V� L�m. Xi H�a gi�o nh�t c� nh�t ��ng n�n th�n tr�ng. <sex> n�n ��n {Mi�u L�nh} t�m {T�c tr��ng}.",
			"�a t� ti�n b�i!",
			}
		TalkEx("",strTalk);
		DelItem(2,0,368,10);
		RemoveTrigger(GetTrigger(KILL_DL_MLTS));
		SetTask(TASK_DL_LV50_ID,3);
		TaskTip("��n g�p T�c tr��ng Mi�u L�nh");
		Msg2Player("��n g�p T�c tr��ng Mi�u L�nh");
		GivePlayerAward("Level_50","xn_step_1");
		GivePlayerExp(SkeyDali,"baochou")
		return
	--������˾����������
	elseif GetTrigger(KILL_DL_MLTS) == 0 then
		TalkEx("",strTalk);
		CreateTrigger(0,257,KILL_DL_MLTS);
		TaskTip("��n t�ng 2 Y�n T� ��ng gi�t Mi�u L�nh Th� Ty l�y 10 B�i �ao");
  	Msg2Player("��n t�ng 2 Y�n T� ��ng gi�t Mi�u L�nh Th� Ty l�y 10 B�i �ao");
  	return
  else
		TalkEx("",strTalk);
		return
	end
end

--�Ѿ������˾�嵶����û�������峤�Ի�
function task_002_00()

local strTalk = {
	"<sex> c� ��n Mi�u L�nh �t s� t�m th�y T�c tr��ng",
	}
	TalkEx("",strTalk);
	return
end