-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����20,35,55������̴����ļ�
-- By StarryNight
-- 2005/12/30 PM 13:54

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

--��ȡ�����������Ȫ����1
function task_000_00()
	
local strTalk = {
	"C� ph�i Cao qu�c c�ng {Cao Th�ng Tuy�n}?",
	"Ch�nh l� ta. <sex> c� c�n ta gi�p g� kh�ng?",
	"M�y h�m tr��c nh�n th�y th��ng nh�n b� gi�o �� c�a Xi H�a gi�o t�n c�ng, ta mu�n bi�t v� {Xi H�a gi�o}.",
	"Xi H�a gi�o v�n l� m�t gi�o ph�i nh� � ��i L� sau �� ng�y c�ng l�n m�nh, g�n ��y l�i ngang nhi�n t�c lo�n.",
	"Tr��c khi {Xi H�a gi�o} t�c lo�n c� ph�t sinh ��i s� g� kh�ng?",
	"Chuy�n l� khi ho�ng �� l�n k� v� ���c m�y ng�y th� Xi H�a gi�o b�t ��u n�o lo�n c� ��i L�.",
	}
	TalkEx("task_000_01",strTalk);
	return

end;

--��ȡ�����������Ȫ����2
function task_000_01()

local strTalk = {
	"C� ph�i li�n quan ��n v� Ho�ng �� m�i n�y?",
	"C�ng c� th�! ��i L� c� m�t s� th�nh ph�n ph�n lo�n �� c�u k�t v�i Xi H�a gi�o nh�ng r�t c� th� l� Ng� ��c gi�o, b�i gi�o ph�i n�y c�ch ��i L� kh�ng xa, gi�o �� c�a h� l�i tinh th�ng ��c thu�t.",
	"N�u v�y th� ta s� ��n {Ng� ��c} xem t�nh h�nh � �� th� n�o.",
	"<sex> nh�n ti�n tr� lu�n 20 con r�t ��c nh�!",
	"�� t� tu�n l�nh!"
	}
	TalkEx("",strTalk);
	CreateTrigger(0,251,KILL_DL_POINSONSCO);
	TaskTip("V�o Ng� ��c gi�o gi�t 20 r�t ��c");
	Msg2Player("V�o Ng� ��c gi�o gi�t 20 r�t ��c");
	SetTask(TASK_DL_LV10_ID,5);
	SetTask(TASK_DL_LV20_ID,1);
end

--��û��ɸ���Ȫ����
function task_001_00()
	
	--����������
	if GetTrigger(KILL_DL_POINSONSCO) == 0 then
		CreateTrigger(0,251,KILL_DL_POINSONSCO);
		TaskTip("Gi�p Tr�nh Qu�n Chi t�m d��c li�u.");
		Msg2Player("Gi�p Tr�nh Qu�n Chi t�m d��c li�u.");
		return
	end;
	return
end;

--�Ѿ�����20�������
function task_002_00()

local strTalk = {
			"<sex> v� r�i �? C� ph�t hi�n g� kh�ng?",
			"� �� ��c tr�ng r�t nhi�u, nh�ng kh�ng th� d�a v�o �� cho r�ng {Xi H�a gi�o} v� {Ng� ��c gi�o} c� li�n quan v�i nhau.",
			"G�n Ng� ��c gi�o g�n ��y xu�t hi�n Huy�t L�n ��c M�ng, qu�i v�t n�y �� l�m t�n h�i bi�t bao nhi�u ng��i. <sex> h�y mang theo D��c Huy�t n�y ��n �� �� ti�u tr� n�!",
			"Ta s� c� g�ng."
		}
	TalkEx("",strTalk);
	AddItem(2,0,365,1,1);--�������ҩѪ
	TaskTip("��n Ng� ��c gi�o d�ng d��c huy�t �� di�t Huy�t L�n ��c M�ng.");
	Msg2Player("��n Ng� ��c gi�o d�ng d��c huy�t �� di�t Huy�t L�n ��c M�ng.");
	SetTask(TASK_DL_LV20_ID,3);--�Ѿ�����ɱ����������
	GivePlayerAward("Level_20","xn_step_1");
	GivePlayerExp(SkeyDali,"tanchawudujiao")
	return
end


--�Ѿ���ȡ��ɱ��������
function task_003_00()

local strTalk = {
	"V�t v� cho <sex> r�i."
	}
	
	--�������ҩѪ��ʧ����
	if BigGetItemCount(2,0,365) <= 0 then
		if GetFreeItemRoom() >= 1 and GetMaxItemWeight() - GetCurItemWeight() > 1 then
			AddItem(2,0,365,1,1);--�������ҩѪ
			TalkEx("",strTalk);
			TaskTip("��n Ng� ��c gi�o d�ng d��c huy�t �� di�t Huy�t L�n ��c M�ng.");
			Msg2Player("��n Ng� ��c gi�o d�ng d��c huy�t �� di�t Huy�t L�n ��c M�ng.");	
		else
			strTalk = {
				"Xin ki�m tra l�i h�nh trang tr��c khi nh�n D��c Huy�t",
					}
			TalkEx("",strTalk)
		end
	else
		TalkEx("",strTalk);
	end
end;
		

--�Ѿ�ɱ���������Ҹ���Ȫ�Ի�
function task_004_00()

local strTalk = {
	"<sex> v�t v� qu�! Ch�t th�nh � xin <sex> nh�n cho!",
	"Nh�ng v�n ch�a bi�t ���c Xi H�a gi�o v� Ng� ��c gi�o c� li�n quan v�i nhau hay kh�ng!",
	"�� ta nh� l�i xem�"
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV20_ID,5);--�Ѿ�����ɱ��������
	GivePlayerAward("Level_20", "xn_step_2", "weapon", "Level_22");
	GivePlayerExp(SkeyDali,"xuelingdumang")
	return
end


--�Ѿ�����ɱ��������
function task_005_00()

local strTalk = {};

	--����50�����ɼ���������������
	if GetLevel() < 50 then
		local strTalk = {
			"C� vi�c ta s� l�i nh� ��n ng��i!"
			}
		TalkEx("",strTalk);
		return
	elseif GetPlayerFaction() == 7 then --�嶾����ר�жԻ�
		strTalk = {
			"Cao Qu�c c�ng c� k� s�ch g� ch�a?",
			"Ng� ��c gi�o l� m�n ph�i th�n b� nh�ng �� c� ti�ng trong gi�i v� l�m, ta ngh� gi�o ph�i n�y kh�ng li�n quan ��n vi�c ch�nh s� � ��i L�. Nh�ng c�ng Phi�n b�ng h�u ��n Ng� ��c gi�o g�p B�ch Doanh Doanh h�i cho r� r�ng vi�c n�y",
			"Ta l�p t�c �i ngay!",
			"�a t� <sex>"
			}
	else
		strTalk = {
			"Cao Qu�c c�ng c� k� s�ch g� ch�a?",
			"Ng� ��c gi�o tuy thu�c t� ph�i nh�ng x�a nay c� ti�ng trong gi�i V� L�m, ta ngh� vi�c n�y kh�ng li�n quan ��n h�. <sex> th� ��n h�i B�ch Doanh Doanh xem sao?",
			"Ta l�p t�c �i ngay!",
			"�a t� <sex>"
			}
	end
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV20_ID,6);
	SetTask(TASK_DL_LV30_ID,1);
	TaskTip("��n Ng� ��c gi�o tham ki�n B�ch Doanh Doanh!");
	Msg2Player("��n Ng� ��c gi�o tham ki�n B�ch Doanh Doanh!");
	return	
end

--��δ���ӨӨ�Ի�
function task_006_00()

local strTalk = {
	"�a t� <sex>"
	}
	TalkEx("",strTalk);
	return
end;

--����嶾�������Ի�
function task_007_00()

local strTalk = {};

	if GetPlayerFaction() == 7 then --�嶾����ר�жԻ�
		strTalk = {
			"T�nh h�nh th� n�o?",
			"T�i h� �� h�i gi�o ch�, hai gi�o ph�i n�y ch�ng c� quan h� g� ng��c l�i h� c�n l� ��i th�. {Xi H�a gi�o} c�n tr�m c�ch luy�n ��c c�a Ng� ��c gi�o.",
			"Kh�ng c� li�n quan g� v�i nhau th� t�t r�i. Ta �� cho ng��i �i th�m d� t�nh h�nh c�a Xi H�a gi�o, ch�c c�ng s�p v� r�i."
			}
	else
		strTalk = {
			"<sex> h�i th�m ���c tin t�c g� r�i?",
			"Ta �� h�i gi�o ch�, hai gi�o ph�i n�y ch�ng c� quan h� g� ng��c l�i h� c�n l� ��i th�. Xi H�a gi�o c�n tr�m c�ch luy�n ��c c�a Ng� ��c gi�o.",
			"Kh�ng c� li�n quan g� v�i nhau th� t�t r�i. Ta �� cho ng��i �i th�m d� t�nh h�nh c�a Xi H�a gi�o, ch�c c�ng s�p v� r�i."
			}
	end;
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV30_ID,6);
	GivePlayerAward("Level_30", "xn_step_3");
	GivePlayerExp(SkeyDali,"cihuojiao")
	return
end


function task_008_00()
	
	--����51�����ɼ�����������
	if GetLevel() > 51 then
		local strTalk = {
				"C� chuy�n g�p l�i nh� ��n <sex> ��y! G�n ��y Xi H�a gi�o l�i ho�t ��ng � V� L�ng s�n, ch�ng s�t h�i v� s� th�o d�n. Nh�ng V� L�ng s�n kh�ng thu�c ��i L� m� thu�c qu�c th� c�a ��i T�ng, n�u tri�u ��nh bi�t ���c e r�ng s� kh�ng hay, chi b�ng <sex> ��n �� ��nh �u�i b�n ch�ng �i!",
				"���c! V�y ch�ng �ang � ��u?",
			}
		TalkEx("task_008_01",strTalk);		
	else
		local strTalk = {
			"V�n ch�a c� tin t�c g�.",
			}
		TalkEx("",strTalk);
		return
	end
end

--��֧:ѡ��1ȥ����ɽ��2����ɽ
function task_008_01()

local strTalk = {
		"L�n n�y Xi H�a gi�o �� l�i chia th�nh 2 n�i �� ho�t ��ng, m�t � tr�n n�i v� m�t � ch�n n�i. D��i ch�n n�i c� B�ch Gi�o �� v� H�c Gi�o ��. Tr�n n�i c� X�ch Gi�o �� v� Xi H�a �ao kh�ch. <sex> th�i gian kh�ng nhi�u, xin ch�n m�t n�i, c�n nh�ng n�i kh�c ta s� ph�i ng��i ��n sau."
		}
	TalkEx("task_008_02",strTalk)
end;

function task_008_02()
local strSelect = {
	"<sex> n�u ��n ch�n V� L�ng s�n th� ��nh 10 t�n Xi H�a B�ch Gi�o �� v� 10 Xi H�a H�c Gi�o ��. ��n V� L�ng s�n th� ��nh 15 t�n Xi H�a X�ch Gi�o �� l� ���c!",
	"��n ch�n n�i V� L�ng S�n/task_009_00",
	"��n V� L�ng s�n/task_009_10",
	"�� ta ngh� l�i/nothing"
	}
	SelectSay(strSelect); 
end


--��ȡ����ǰ������ɽ�Ŵ�10�����/�׽�ͽ
function task_009_00()

local strTalk = {
	"��nh b�i 10 t�n Xi H�a B�ch Gi�o �� v� 10 t�n Xi H�a H�c Gi�o ��."
	}
	TalkEx("",strTalk);
	CreateTrigger(0,253,KILL_DL_CHIHUO_WHITE);
	CreateTrigger(0,254,KILL_DL_CHIHUO_BLACK);
	SetTask(TASK_DL_LV30_ID,7);
	SetTask(TASK_DL_LV35_ID,1);
	SetTask(TASK_DL_LV35_01_ID,1);
	TaskTip("��n ch�n n�i V� L�ng s�n ��nh b�i 10 t�n Xi H�a B�ch Gi�o �� v� 10 t�n Xi H�a H�c Gi�o ��.");
	Msg2Player("��n ch�n n�i V� L�ng s�n ��nh b�i 10 t�n Xi H�a B�ch Gi�o �� v� 10 t�n Xi H�a H�c Gi�o ��.");
	
end;
	
--��ȡ����ǰ������ɽ�Ŵ�15������ͽ
function task_009_10()

local strTalk = {
	"��nh b�i 15 t�n Xi H�a X�ch Gi�o ��."
	}
	
	TalkEx("",strTalk);
	CreateTrigger(0,255,KILL_DL_CHIHUO_RED);
	SetTask(TASK_DL_LV30_ID,7);
	--SetTask(TASK_DL_LV35_ID,1);
	SetTask(TASK_DL_LV35_01_ID,2);
	SetTask(TASK_DL_LV35_ID_ZX,1);
	TaskTip("��n V� L�ng s�n ��nh b�i 15 t�n Xi H�a X�ch Gi�o ��.");
	Msg2Player("��n V� L�ng s�n ��nh b�i 15 t�n Xi H�a X�ch Gi�o ��.");

end


--δ��10�����/�׽�ͽ�Ի�
function task_010_00()

local strTalk = {
	"��nh b�i 10 t�n Xi H�a B�ch Gi�o �� v� 10 t�n Xi H�a H�c Gi�o ��."
	}
	TalkEx("",strTalk);
	if GetTrigger(KILL_DL_CHIHUO_WHITE) == 0 then
		CreateTrigger(0,253,KILL_DL_CHIHUO_WHITE);
		TaskTip("��n ch�n n�i V� L�ng s�n ��nh b�i 10 t�n Xi H�a B�ch Gi�o �� v� 10 t�n Xi H�a H�c Gi�o ��.");
		Msg2Player("��n ch�n n�i V� L�ng s�n ��nh b�i 10 t�n Xi H�a B�ch Gi�o �� v� 10 t�n Xi H�a H�c Gi�o ��.");
	end;
	if GetTrigger(KILL_DL_CHIHUO_BLACK) == 0 then
		CreateTrigger(0,254,KILL_DL_CHIHUO_BLACK);
		TaskTip("��n ch�n n�i V� L�ng s�n ��nh b�i 10 t�n Xi H�a B�ch Gi�o �� v� 10 t�n Xi H�a H�c Gi�o ��.");
		Msg2Player("��n ch�n n�i V� L�ng s�n ��nh b�i 10 t�n Xi H�a B�ch Gi�o �� v� 10 t�n Xi H�a H�c Gi�o ��.");
	end;
end

--δ��15������ͽ�Ի�
function task_010_10()

local strTalk = {
	"��n V� L�ng s�n ��nh b�i 15 t�n X�ch Gi�o ��."
	}
	TalkEx("",strTalk);
	if GetTrigger(KILL_DL_CHIHUO_RED) == 0 then
		CreateTrigger(0,255,KILL_DL_CHIHUO_RED);
		TaskTip("��n V� L�ng s�n ��nh b�i 15 t�n Xi H�a X�ch Gi�o ��.");
		Msg2Player("��n V� L�ng s�n ��nh b�i 15 t�n Xi H�a X�ch Gi�o ��.");
	end;
end

--�������ɽ����������Ȫ�Ի�
function task_011_00()

local strTalk = {
	"Cao Qu�c C�ng! T�i h� �� ��nh b�i ch�ng r�i!",
	"�a t� <sex>",
	"L�n n�y Xi H�a gi�o t�c lo�n ph�i ch�ng c� li�n quan ��n v� ho�ng �� m�i k� t�c?",
	"Ta c�ng kh�ng r� l�m!",
	"Ta nghe n�i ��i L� c� ��n l�c ��i gia t�c, c� th� nh� th� n�o?",
	"Vi�c n�y c� th� li�n quan ��n Xi H�a gi�o nh�ng ta c�ng kh�ng r� l�m! <sex> th� t�m hi�u xem.",
	"Xem ra ph�i h�i {B�ch Hi�u Sinh} r�i.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV35_ID,3);
	SetTask(TASK_DL_LV35_ID_ZX,3);
	RemoveTrigger(KILL_DL_CHIHUO_WHITE)
	RemoveTrigger(KILL_DL_CHIHUO_BLACK)
	RemoveTrigger(KILL_DL_CHIHUO_RED)
	Msg2Player("��n Bi�n Kinh t�m B�ch Hi�u Sinh.");
	TaskTip("��n Bi�n Kinh t�m B�ch Hi�u Sinh.");
	GivePlayerAward("Level_35", "xn_step_1", "weapon", "Level_40");
	GivePlayerExp(SkeyDali,"wulingshanjiao")
end

--��������ɽ����������Ȫ�Ի�
function task_012_00()

local strTalk = {
	"V�t v� cho <sex> r�i!",
	}
	TalkEx("",strTalk);
end


--����55�����������1
function task_013_00()

	if GetLevel()>= 54 and GetTask(TASK_DL_LV50_ID) == 7 then
		local strTalk = {
			"Cao Qu�c C�ng, t�i h� c� m�t ch�t manh m�i v� {Xi H�a gi�o} ��y.",
			"�a t� <sex> v� b� t�nh c�a ��i L� m� v�t v� qu�. Xin h�i <sex> �� thu th�p ���c nh�ng g�?",
			"L�c ��u t�i h� ngh� {Xi H�a gi�o} v� �n o�n gi�a � Man v� B�ch T�c n�n m�i t�c lo�n. Nh�ng kh�ng ph�i v�y, h� v� mu�n gi�p qu�c v��ng. Cao Qu�c C�ng, chuy�n n�y l� th� n�o?",
			"Ch�ng ch� n�i h� �� th�i. Th�nh th��ng d�n ch�ng tin y�u, ��u c�n ��n s� t��ng tr� c�a t� gi�o? N�u ch�ng c� h�o � th� kh�ng n�n t�c lo�n nh� v�y.",
			"T�n ho�ng �� c� th�t ���c d�n ch�ng tin y�u? N�u d�n ch�ng tin y�u sao l�c ��ng quang g�p nhi�u tr�c tr� ��n v�y?",
			"�",
			"V� Ho�ng �� tr��c �� e r�ng kh�ng ph�i t� Ho�ng t� k� v�?"
			}
		TalkEx("task_013_01",strTalk);
		GivePlayerExp(SkeyDali,"zhaogaoguogong")
		return
	else
		local strTalk = {
			"<sex> l�u qu� kh�ng g�p, v� c�ng �� c� ti�n b� g� ch�a?"
		}
		TalkEx("",strTalk);
	end;
end

--����55�����������2
function task_013_01()
local strTalk = {
			"Xem ra <sex> �� bi�t h�t c� r�i. L�c m�i ��ng quang c� ��i L� �� x�y ra m�t tr�n h�n lo�n. C� 3 v� Ho�ng t� ch�ng ai nh��ng ai, cu�i c�ng Tam Ho�ng T� �� l�n ng�i, nh�ng Xi H�a gi�o mu�n ��i ng�i v� l�i cho Nh� Ho�ng T�.",
			"Vi�c n�y tr��c ��y ch�a t�ng nghe Qu�c C�ng nh�c t�i.",
			"��y ch� l� chuy�n trong nh�, ta c�ng v�a th�m d� m�i quan h� gi�a Nh� Ho�ng T� v� Xi H�a gi�o.",
			"V�y Qu�c s� quy�t ��nh th� n�o?",
			"Mu�n th�o ph�t Xi H�a gi�o v� Nh� Ho�ng T� c�ng c�n x�y d�ng m�t th� l�c v�ng ch�c ��. C� m�t v�i vi�c ph�i nh� <sex> gi�p r�i!"
			}
	TalkEx("task_013_02",strTalk);
	return
end

--����55�����������3
function task_013_02()

local strTalk = {	
			"Chuy�n ��i s� t�i h� kh�ng d�m can thi�p, nh�ng c�n t�i h� gi�p g� xin Qu�c s� c� g�i.",
			"�a t� <sex>. Ph�ng Ho�ng_bi�u t��ng c�a Xi H�a gi�o �� xu�t hi�n t�i Ph�ng Nh�n ��ng. Kh�ng �� cho th� l�c c�a gi�o ph�i n�y b�nh tr��ng! <sex> mau ��n �� ti�u tr� ch�ng!",
			"V�y ph�i l�m sao?",
			"<sex> ��n Ph�ng Nh�n ��ng thu th�p 10 nanh D� H� v� 10 l�ng B�ch ��u �i�u.",
			"�� t� tu�n l�nh!",
			}
		
	TalkEx("",strTalk);
	CreateTrigger(0,258,KILL_DL_MIDNIGHT_TIGER);
	CreateTrigger(0,259,KILL_DL_BALD_EAGLE);
	SetTask(TASK_DL_LV50_ID,8);
	SetTask(TASK_DL_LV55_ID,1);
	GivePlayerExp(SkeyDali,"weiyibanfa")
	Msg2Player("��n Ph�ng Nh�n ��ng thu th�p 10 nanh D� H� v� 10 l�ng B�ch ��u �i�u.");
	TaskTip("��n Ph�ng Nh�n ��ng thu th�p 10 nanh D� H� v� 10 l�ng B�ch ��u �i�u.");
end

--����55������������
function task_014_00()
	--����ռ������͵�������
	if GetItemCount(2,0,371) >= 10 and GetItemCount(2,0,372) >= 10 then
		local strTalk = {
			"V�t ph�m thu th�p �� ��.",
			"Phi�n <sex> �em v�t ph�m n�y ��n T��ng D��ng t�m M�c Tam �� nh� ch� t�o Ph�ng Ho�ng Linh.",
			"{Ph�ng Ho�ng Linh} c� t�c d�ng g�?",
			"<sex> d�ng Ph�ng Ho�ng Linh �� g�i Ph�ng Ho�ng",
			"Th� ra l� v�y! Ta ��n ch� {M�c Tam} ��y.",
			"Ng��i n�n d�ng b� c�u ��a th� th�ng b�o cho �ng �y tr��c.",
			"���c! T�i h� l�p t�c l�m ngay!"
			}
		
		TalkEx("",strTalk);
		DelItem(2,0,371,10);
		DelItem(2,0,372,10);
		RemoveTrigger(GetTrigger(KILL_DL_MIDNIGHT_TIGER));
		RemoveTrigger(GetTrigger(KILL_DL_BALD_EAGLE));
		CreateTrigger(4,201,TALK_DL_MOSAN);
		SetTask(TASK_DL_LV55_ID,2);
		Msg2Player("��n T��ng D��ng t�m M�c Tam ch� t�o Ph�ng Ho�ng Linh .");
		TaskTip("��n T��ng D��ng t�m M�c Tam ch� t�o Ph�ng Ho�ng Linh .");
		GivePlayerAward("Level_55", "xn_step_1");
		GivePlayerExp(SkeyDali,"jialouluo")
		return
	end
	--������ҹ���Ͱ�ͷ������������
	if GetTrigger(KILL_DL_MIDNIGHT_TIGER) == 0 or GetTrigger(KILL_DL_BALD_EAGLE) == 0 then
		if GetTrigger(KILL_DL_MIDNIGHT_TIGER) == 0 then
			CreateTrigger(0,258,KILL_DL_MIDNIGHT_TIGER);
		end
		if GetTrigger(KILL_DL_BALD_EAGLE) == 0 then
			CreateTrigger(0,259,KILL_DL_BALD_EAGLE);
		end
		Msg2Player("��n Ph�ng Nh�n ��ng thu th�p 10 nanh D� H� v� 10 l�ng B�ch ��u �i�u.");
		TaskTip("��n Ph�ng Nh�n ��ng thu th�p 10 nanh D� H� v� 10 l�ng B�ch ��u �i�u.");
	end
	--δ�������
	local strTalk = {
		"Phi�n b�ng h�u ��n Ph�ng Nh�n ��ng thu th�p 10 nanh D� H� v� 10 l�ng B�ch ��u �i�u.",
		}
	TalkEx("",strTalk)
end

--δ��Ī���Ի�
function task_015_00()

local strTalk = {
	"M�c Tam m� ti�m th� r�n � T��ng D��ng, r�t d� t�m.",
	}

	if GetTrigger(TALK_DL_MOSAN) == 0 then
		CreateTrigger(4,201,TALK_DL_MOSAN);
		Msg2Player("��n T��ng D��ng t�m M�c Tam ch� t�o Ph�ng Ho�ng Linh .");
		TaskTip("��n T��ng D��ng t�m M�c Tam ch� t�o Ph�ng Ho�ng Linh .");
	end;
	
	TalkEx("",strTalk);
	
end;

--�򵹷�˺�
function task_016_00()

local strTalk = {
	"<sex> qu� l� tu�i tr� t�i cao, l�i th�m m�t nh�n t�i n�a.",
	"�a t� qu� khen!",
	"Qu�c s� ��ng Gi� La � ��i L� l�i g�p chuy�n. <sex> mau ��n �� �i!",
	"T�i h� �i ngay!",
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV55_ID,5);
	GivePlayerAward("Level_55", "xn_step_2");
	GivePlayerEquipment("head", "Level_55",1);
	GivePlayerExp(SkeyDali,"jibaojialouluo")
end

--���55����������
function task_017_00()

local strTalk = {
	"��ng Gi� La hi�n � ph�a b�c th�nh ��i L�, phi�n <sex> ��n �� m�t chuy�n.",
	}

	TalkEx("",strTalk);
	
end


--���֣��֮�Ļ����������ȡ70��������̵���ս��
function task_018_00()

local strTalk = {
	"Qu�c C�ng cho g�i t�i h� c� vi�c g� kh�ng?",
	"<sex> h�y ��n t�ng 2 Long Nh�n ��ng t� v� v�i A Tu La (Xi H�a gi�o)",
	"L�n n�y xem nh� b�n ch�ng ch� ��ng, ���c ta �i ngay ��y.",
	"<sex> d�n theo bao nhi�u ��ng ��i ��u ���c nh�ng <sex> nh�t c� nh�t ��ng ph�i th�n tr�ng!",
	"Ta bi�t r�i!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_0_ID,3);--ɾȥͷ�ϵ�������
	SetTask(TASK_DL_LV70_ID,1);
	GivePlayerExp(SkeyDali,"tiaozhanshu")
	Msg2Player("��n t�ng 2 Long Nh�n ��ng di�t A Tu La");
	TaskTip("��n t�ng 2 Long Nh�n ��ng di�t A Tu La");
	return
end


--δ��ܰ�����
function task_019_00()

local strTalk = {
	"A Tu La t�i t�ng 2 Long Nh�n ��ng.",
	}
	TalkEx("",strTalk);
	return
end

--��ܰ����޲����Ķ��ż�����
function task_020_00()

local strTalk = {
	"<sex> �� chi�n th�ng tr� v�!",
	"T�i h� ph�t hi�n m�t vi�c r�t quan tr�ng, Qu�c c�ng xem th� n�y �i.",
	"�",
	"Nh� Ho�ng T� hi�n �ang �n n�u � T�y Song B�n N�p, l�i c�u k�t v�i Xi H�a gi�o. Chuy�n n�y kh�ng ��n gi�n. <sex> mau ��n ch� ��ng Qu�c S� c�u ki�n.",
	"�� t� tu�n l�nh!",
	}
	DelItem(2,0,380,1);--ɾȥ��̵��ܺ�
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV70_ID,4);
	GivePlayerAward("Level_70", "xn_step_1",nil ,nil,"YunTie",1);
	GivePlayerWeapon("Level_70",1);
	GivePlayerExp(SkeyDali,"datanxiangqing")
	return
end

function nothing()

end