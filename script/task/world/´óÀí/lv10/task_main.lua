-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����10��45��50��������̴����ļ�
-- By StarryNight
-- 2005/12/29 PM 16:02

--ʮһ��إ�� ������������  
--�ˣ�  ���¡����̡��޲֡����졢����������������������  
--�ɣ�  ������Ȣ  

-- ����С͵���ݣ�����������ʧ������ѹ�������

-- ======================================================

-- ���þ��������ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--��ȡŮ����֣��֮����
function task_000_00()
	
local strSelect = {
	"Ta th�y <sex> th�n th� kh�ng t�! C� th� gi�p ti�u n� m�t vi�c nh� kh�ng?",
	"Ta �i l�i trong giang h� c�ng �� nhi�u, c� n��ng c� vi�c g� c�n gi�p xin c� n�i nh�ng ph�i t�n 15 Kim./Accept_Task_000",
	"Th�t ng�i qu�, b�y gi� ta c� vi�c r�i./Task_Exit"
	};

	SelectSay(strSelect)
	
end;

function Accept_Task_000()

local strTalk = {
	"N�u v�y phi�n b�ng h�u m�t chuy�n nh�!",
	"Ti�u n� l� Tr�nh Qu�n Chi l�n n�y ��n ��i L� bu�n b�n, kh�ng may b� ng��i c�a Xi H�a gi�o c��p m�t d��c li�u. C� th� gi�p ta ��n Th�y Y�n M�n �em 15 d��c li�u v� kh�ng?",
	"Chuy�n nh� th�i m�!"
};
	if (GetCash() >= 150000) then
		Pay(150000)
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV10_ID,1);
		CreateTrigger(0,250,KILL_DL_POINSONBEE);
		TaskTip("Gi�p Tr�nh Qu�n Chi t�m d��c li�u.");
		Msg2Player("Gi�p Tr�nh Qu�n Chi t�m d��c li�u.");
	elseif ( GetCash() < 150000  ) then
			Talk(1,"","Tr�i! Xem b� d�ng ng��i m�t xu d�nh t�i c�ng kh�ng c� �?")		
	end
end;

--�Ѿ���ȡ��Ů��������	
function task_001_00()
	
local nNum = GetItemCount(2,0,362);
local strTalk_1 = {
	"�a t�! Phi�n <sex> gi�p ta t�m 15 d��c li�u."
};
local strTalk_2 = {
	"Ta �� t�m �� {15 d��c li�u}",
	"Nhanh nh� v�y �� v� r�i �? Nh�ng ta v�a ph�t hi�n h�a ��n mua h�ng �� b� Xi H�a Y�u N� l�y �i. <sex> c� th� gi�p ta �em v� ���c kh�ng?",
	"�� t� tu�n l�nh!"
};

	if nNum >= 15 then
		SetTask(TASK_DL_LV10_ID,2);
		DelItem(2,0,362,15);
		RemoveTrigger(GetTrigger(KILL_DL_POINSONBEE));
		TalkEx("",strTalk_2);
		TaskTip("��n Th�y Y�n t�m Xi H�a Y�u N� (167.196) l�y h�a ��n.");	
		Msg2Player("��n Th�y Y�n t�m Xi H�a Y�u N� (167.196) l�y h�a ��n.");
		GivePlayerAward("Level_10","xn_step_1");
		GivePlayerExp(SkeyDali,"zhaohuiyaocai")
		return
	--����������
	elseif GetTrigger(KILL_DL_POINSONBEE) == 0 then
		CreateTrigger(0,250,KILL_DL_POINSONBEE);
		TalkEx("",strTalk_1);
		TaskTip("Gi�p Tr�nh Qu�n Chi t�m d��c li�u.");
		Msg2Player("Gi�p Tr�nh Qu�n Chi t�m d��c li�u.");
		return
	else
		TalkEx("",strTalk_1);
	end;
	
end;

--��֣��֮�һض�ʧ�Ļ���
function task_002_00()

local strTalk = {
	"N�u <sex> kh�ng t�m ���c h�a ��n th� xem nh� l�n n�y ta ��n ��i L� c�ng c�c r�i."
} 	
	TalkEx("",strTalk);
	return
end;


--�Ѿ��һض�ʧ�Ļ���
function task_003_00()

local strTalk = {
	"C� n��ng xem ��y c� ph�i l� {h�a ��n} c�a c� kh�ng?",
	"��ng r�i. �a t� <sex>! Ch�t th�nh � xin nh�n cho!",
	"Ngh� c�ng k� l�, Xi H�a gi�o c��p d��c li�u c�a ta �� l�m g� ch�?",
	"C� c�ng kh�ng bi�t nguy�n nh�n v� sao �?",
	"Ta l� ng��i H�n, m�i ��n ��i L� l�m �n n�n c�ng kh�ng hi�u t�nh h�nh � ��y l�m. Nh�ng nghe n�i n�u c� g� li�n quan ��n Xi H�a gi�o th� c� th� t�m Qu�c c�ng Cao Th�ng Tuy�n �� h�i.",
	"���c! �� ta �i h�i xem."
};
	DelItem(2,0,363,1);
	SetTask(TASK_DL_LV10_ID,4);
	TalkEx("",strTalk);
	TaskTip("��n ��i L� t�m Qu�c c�ng Cao Th�ng Tuy�n");	
	Msg2Player("��n ��i L� t�m Qu�c c�ng Cao Th�ng Tuy�n");
	GivePlayerAward("Level_10","xn_step_2","weapon","Level_10");
	GivePlayerExp(SkeyDali,"zhaohuihuodan")
end;


--��ȡ������ʹ����1
function task_004_00()
	--����45��������ȡ����
	if GetLevel() >= 45 then
		local strTalk = {
			"Tr�nh c� n��ng, l�u qu� kh�ng g�p, bu�n b�n th� n�o?",
			"<sex> c� gi�p ta h�i th�m t�nh h�nh c�a Xi H�a gi�o kh�ng?",
			"C� n��ng g�n ��y c� nghe tin g� kh�ng?",
			"<sex> ��n th�t ��ng l�c! M�y h�m tr��c ta c� nghe m�t th��ng nh�n n�i Xi H�a gi�o thu�c � man ��i l�p v�i B�ch t�c. Nh�ng ��i L� l� do t� ti�n c�a B�ch t�c g�y d�ng n�n.",
			"Th� ra l� v�y, th�o n�o h� lu�n ch�ng l�i ho�ng t�c. Ta m�i t� {Mi�u L�nh} v�, nh�ng ng��i � �� h�nh nh� c�ng c� quan h� v�i {Xi H�a gi�o}, h� mu�n ch�ng l�i Ho�ng ��."
			}
			TalkEx("task_004_01",strTalk);
			return	
	else
		local strTalk = {
			"H�m nay ta b�n r�i. <sex> h�m kh�c l�i ��n nh�!"
		}
		TalkEx("",strTalk);	
	end;
end;

--��ȡ������ʹ����2
function task_004_01()

local strTalk = {
	"Nghe n�i T�n s� c�a Mi�u L�nh � Y�n T� ��ng t�ng 1, may ra c� th� t�m ���c ch�t manh m�i",
	"Kh�ng c� l� do g� ��n h�i tin, e l� kh�ng ���c r�i!",
	"Mu�n t�m hi�u m�i quan h� gi�a Mi�u L�nh v� Xi H�a gi�o ch� c�n c�ch l� c��p th�, nh�ng nh� l� ��ng l�m t�n h�i ��n t�nh m�nh ch�ng.",
	"V�y c�ng ���c! Nh�ng l�m sao �� t�m ch�ng?",
	"Tr��c ti�n h�y ��n Y�n T� ��ng t�ng 1 t�m 10 t�m Da h��u, ta s� gi�p ng��i l�m t�n hi�u c�a Mi�u L�nh. Sau �� quay l�i Y�n T� ��ng t�ng 1, ch� c�n ng��i th�i l�n th� Mi�u L�nh L�c S� s� xu�t hi�n.",
	"Ta �i ngay ��y.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ID,7);
	SetTask(TASK_DL_LV45_ID,1);
	CreateTrigger(0,256,KILL_DL_MLHY);
	TaskTip("��n Y�n T� ��ng t�ng 1 ��nh Mi�u L�nh H� �n thu th�p 10 Da h��u!");	
	Msg2Player("��n Y�n T� ��ng t�ng 1 ��nh Mi�u L�nh H� �n thu th�p 10 Da h��u!");
	GivePlayerExp(SkeyDali,"dalihanren")
end

--�Ѿ���ȡ������ʹ����
function task_005_00()

local strTalk = {
			"��n Y�n T� ��ng t�ng 1 thu th�p 10 t�m da h��u",
				}
	if GetItemCount(2,0,366) >= 10 then
		strTalk = {
			"<sex> �� t�m �� r�i �?",
			"{10 t�m Da h��u} ��y!",
			"T�t qu�! Ta l�p t�c l�m T�n ti�u ��y. <sex> ��i ta m�t l�t nh�!.",
			"�",
			"Xong r�i. <sex> h�y ��n Y�n T� ��ng d�ng T�n ti�u n�y th�i l�n l�m t�n hi�u l�p t�c T�n s� Mi�u L�nh s� xu�t hi�n. Nh�ng <sex> ph�i c�n th�n!",
			"Ta s� ch� � chuy�n n�y.",
			}
		RemoveTrigger(GetTrigger(KILL_DL_MLHY));
		DelItem(2,0,366,10);--ɾȥ��Ƥ
		--�õ��ٻ�������ʿ������
		AddItem(2,0,367,1,1);
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV45_ID,2);
		Msg2Player("��n Y�n T� ��ng t�ng 1 d�ng ti�ng s�o l�m t�n hi�u g�i s� gi�.");
		TaskTip("��n Y�n T� ��ng t�ng 1 d�ng ti�ng s�o l�m t�n hi�u g�i s� gi�.");
		GivePlayerAward("Level_45","xn_step_1");
		GivePlayerExp(SkeyDali,"nipixinshao")
		return
	elseif GetTrigger(KILL_DL_MLHY) == 0 then
		TalkEx("",strTalk);
		CreateTrigger(0,256,KILL_DL_MLHY);--�������뻤ӡ����������
		TaskTip("��n Y�n T� ��ng t�ng 1 ��nh Mi�u L�nh H� �n thu th�p 10 Da h��u!");	
		Msg2Player("��n Y�n T� ��ng t�ng 1 ��nh Mi�u L�nh H� �n thu th�p 10 Da h��u!");
		return
	else
		TalkEx("",strTalk);
		return
	end
end

--�Ѿ���ȡ����
function task_006_00()

local strTalk = {
	"��n Y�n T� ��ng t�ng 1 d�ng t�n hi�u, n�u v�n ch�a th�y v�t ph�m xin ki�m tra l�i r��ng",
	}
	if BigGetItemCount(2,0,367) < 1 then
		if GetFreeItemRoom() >= 1 and GetMaxItemWeight() - GetCurItemWeight() > 1 then
			AddItem(2,0,367,1,1);
			TalkEx("",strTalk)
		else 
			strTalk = {
				"Xin ki�m tra l�i h�nh trang c�n �� kho�ng tr�ng, sau �� ��n nh�n v�t l�m t�n hi�u",
					}
			TalkEx("",strTalk);
		end
	else
		TalkEx("",strTalk)
	end
	
	return
end

--�Ѿ����������ʿȡ���ż�
function task_007_00()

local strTalk = {
	"<sex> v� r�i �?",
	"Ta �� l�y ���c b�c th�, nh�ng trong �y vi�t g� ta kh�ng hi�u.",
	"��a ta xem! Ch�c ta c�ng ph�i ��n ��i L� �� h�c ch� n�y qu�!",
	"�",
	"Qu� nhi�n l� Mi�u L�nh v� Xi H�a gi�o c� quan h� v�i nhau, nh�ng trong th� n�i g� ta c�ng kh�ng hi�u. <sex> �� ta nh� ng��i phi�n d�ch ��, c� g� s� th�ng b�o <sex> sau.",
	"V�t v� cho c� n��ng r�i.",
	}
	DelItem(2,0,369,1);--ɾ���ż�
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV45_ID,4);
	GivePlayerAward("Level_45","xn_step_2","weapon","Level_46");
	GivePlayerExp(SkeyDali,"miaolinglishi")
	return
end


--�Ѿ����ż�����֣��֮��
function task_008_00()

	if GetLevel() >= 50 then
		local strTalk = {
			"Tr�nh c� n��ng, b�c th� �y th� n�o r��?",
			"<sex> y�n t�m, tuy l� xem kh�ng hi�u, nh�ng ta c� bi�t m�t ng��i c� th� ��c ���c th� n�y.",
			"L� ai v�y?",
			"L� Tr�n L�p Ho�nh, g�c l� ng��i H�n nh�ng do ��n ��i L� c�ng �� l�u n�n hi�u ���c ng�n ng� � ��.",
			"T�t qu�, ta l�p t�c �i t�m �ng �y!",
			}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV45_ID,5);
		SetTask(TASK_DL_LV50_ID,1);
		TaskTip("��n ph�a b�c c�a th�nh ��i L� t�m Tr�n L�p Ho�nh.");	
		Msg2Player("��n ph�a b�c c�a th�nh ��i L� t�m Tr�n L�p Ho�nh.");
	else
		local strTalk = {
			"<sex> tranh th� th�i gian n�y luy�n c�ng �i.",
			}
		TalkEx("",strTalk);
		return
	end
end

--�Ѿ���ȡ50������֮��
function task_009_00()

local strTalk = {
	"Tr�n L�p Th�nh � ph�a b�c th�nh ��i L�.",
	}
	TalkEx("",strTalk);
	return
end

--�Ѿ�����������첢�������峤�Ի���
function task_010_00()

local strTalk = {
	"<sex> v� r�i �?",
	"Ta ngh� Xi H�a Gi�o v� �n o�n c�a b� t�c m� t�c lo�n, m�c ��ch l� �� g�y �p l�c ph� ng�i ���ng kim Ho�ng ��. Ta nghe T�c tr��ng Mi�u L�nh n�i �o�n Th� ch�nh l� � Man c� li�n quan huy�t th�ng v�i B�ch T�c. V� v�y Xi H�a gi�o kh�ng nh�ng ph�n ��i m� c�n �ng h� �o�n Th�.",
	"H� c�n n�i g� n�a?",
	"H� b�o ta ��n g�p {Cao Qu�n Qu� T�c} �� h�i.",
	"V�y ng��i mau �i h�i �i. Ng��i m� Mi�u L�nh nh�c ��n �� ng��i c� quen kh�ng?",
	"Ph�i h�i {Cao Qu�n Qu� T�c} ��, ta c�n ch�a bi�t {Qu�c C�ng Cao Th�ng Tuy�n} n�a k�a.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV50_ID,7);
	TaskTip("��n g�p Cao Th�ng Tuy�n");	
	Msg2Player("��n g�p Cao Th�ng Tuy�n");
	GivePlayerAward("Level_50","xn_step_4");
	GivePlayerWeapon("Level_52",1);
	GivePlayerExp(SkeyDali,"wujikeshi")
	return
end

--δ�����Ȫ�Ի�
function task_011_00()

local strTalk = {
	"V�y ng��i mau �i g�p Qu�c c�ng Cao Th�ng Tuy�n, �ng �y � trong th�nh ��i l�.",
	}
	TalkEx("",strTalk);
	return
end

--��ȡ֣��֮ծ������
function task_012_00()

local strTalk = {};
 
	if Pay(100000) == 1 then
			
		strTalk = {
			"Tr�nh c� n��ng, {��ng Qu�c S�} nh� ta chuy�n {ti�n h�ng} cho c�.",
			"�� t� <sex>.",
			"Ng��i v�a m�i ��nh b�i D� Xoa �? V�t v� cho ng��i qu�!",
			"Sao c� n��ng bi�t chuy�n n�y? Ta v�a �i g�p {��ng Qu�c S�}",
			"<sex> c� th� gi�p ta ���c kh�ng?",
			"Xin c� n�i",
			"V� n��ng � Th�nh �� v� Bi�n Kinh c�n n� ta m�t m�n ti�n, ng��i c� th� �i l�y v� gi�p ta kh�ng?",
			"���c! Ta s� �i ngay!",
			"M�i ng��i c�n n� ta 10 l��ng, phi�n b�ng h�u nh�!",
			}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV60_ID,9);
		SetTask(TASK_DL_LV60_1_ID,1);
		SetTask(TASK_DL_LV60_2_ID,1);
		Msg2Player("Gi�p Tr�nh Qu�n Chi ��n Bi�n Kinh v� Th�nh �� ��i n�.");
		TaskTip("Gi�p Tr�nh Qu�n Chi ��n Bi�n Kinh v� Th�nh �� ��i n�.");
		GivePlayerExp(SkeyDali,"daikuanzhuanjiao")
	else
		strTalk = {
			"Sao? Ti�n b� m�t r�i?",
			}
		TalkEx("",strTalk);
	end;
end

--�Ѿ���ȡ֣��֮ծ�������
function task_013_00()

local strSay = {
		"C� ��i ���c n� kh�ng?",
		"L�y ���c r�i!/task_015_00",
		"V�n ch�a t�m ���c./Task_Exit"
	}

	SelectSay(strSay);
	return
end

--�Ѿ���ȡ��֣��֮��ծ��������ɶ�����Ի�
function task_014_11()

local strTalk = {
	"Ti�n n� c�a {Tr�nh Qu�n Chi �}? Ng��i n�i l� ta qu�n r�i.",
	"����",
	"M�y h�m tr��c �i ngang qua {�i�m Th��ng s�n} b� {Ng�c H�a Cu�ng Nh�n} ��nh l�n! C� th� gi�p ta h� t�n n�y kh�ng?",
	"���c! �� ta gi�p!",
	"{Ng�c H�a Cu�ng Nh�n} � {�i�m Th��ng S�n}.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_1_ID,2);
	Msg2Player("��n �i�m Th��ng S�n ��nh b�i Ng�c H�a Cu�ng Nh�n.");
	TaskTip("��n �i�m Th��ng S�n ��nh b�i Ng�c H�a Cu�ng Nh�n.");
	return
end

--δɱ���������
function task_014_21()

local strTalk = {
	"{Ng�c H�a Cu�ng Nh�n} � {�i�m Th��ng S�n}.",
	}
	TalkEx("",strTalk);
	return
end

--��ɱ�������������
function task_014_31()

local strTalk = {
	"Ta �� ��nh b�i h�n r�i.",
	"T�t qu�, {10 l��ng} ��y. Xin nh�n l�y!",
	}
	GivePlayerAward("Level_62","xn_step_1");
	GivePlayerExp(SkeyDali,"chengduwuniang")
--	Earn(100000);
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_1_ID,4);
		--���������������ɺ�
		if GetTask(TASK_DL_LV60_2_ID) == 3 then
			SetTask(TASK_DL_LV60_1_ID,5);
			SetTask(TASK_DL_LV60_2_ID,4);
			SetTask(TASK_DL_LV60_0_ID,1);
			Msg2Player("�� ��i ���c n�, quay l�i t�m Tr�nh Qu�n Chi.");
			TaskTip("�� ��i ���c n�, quay l�i t�m Tr�nh Qu�n Chi.");
		end	
	return
end

--�����ɱ������������������Ի�
function task_014_41()

local strTalk = {
	"Ch� ph�i ng��i �� l�y ���c n� r�i sao, ta ch�ng c�n n� n�n g� v�i h� Tr�nh �y c�.",
	}

	TalkEx("",strTalk);
	return
end

--��ȡ�ռ�Ѫѻ������
function task_014_12()

local strTalk = {
	"Ng��i ��n gi�p {Tr�nh Qu�n Chi} ��i n�.",
	"��ng v�y, c� n��ng c� th� tr� n� ch�?",
	"Th� n�y v�y, ta �ang mu�n may b� trang ph�c m�i nh�ng c�n thi�u {10 Huy�t Nha V�}, c� th� gi�p ta kh�ng?",
	"���c th�i.",
	"��n {B�ch Th�y ��ng t�ng 2} ��nh {�c l�} c� th� t�m ���c {Huy�t Nha V�}.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_2_ID,2)
	--CreateTrigger(0,261,KILL_DL_BLOODCROW);
	Msg2Player("��n B�ch Th�y ��ng t�ng 2 ��nh �c l� l�y 10 Huy�t Nha V�.");
	TaskTip("��n B�ch Th�y ��ng t�ng 2 ��nh �c l� l�y 10 Huy�t Nha V�.");
	return

end	

--δ�ռ�10��Ѫѻ��
function task_014_22()

local strTalk = {
	"��n {B�ch Th�y ��ng t�ng 2} ��nh {�c l�} c� th� t�m ���c {Huy�t Nha V�}.",
	}

	if GetItemCount(2,1,285) >= 10 then
		DelItem(2,1,285,10);
		strTalk = {
			"Ta �� t�m �� {10 Huy�t Nha V�}",
			"T�t qu�, 10 l��ng ��y, xin nh�n l�y!",
			}
--		Earn(100000);
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV60_2_ID,3);
		GivePlayerAward("Level_62","xn_step_2");
		GivePlayerExp(SkeyDali,"bianjingwuniang")
		--���������������ɺ�
		if GetTask(TASK_DL_LV60_1_ID) == 4 then
			SetTask(TASK_DL_LV60_1_ID,5);
			SetTask(TASK_DL_LV60_2_ID,4);
			SetTask(TASK_DL_LV60_0_ID,1);
			Msg2Player("�� ��i ���c n�, quay l�i t�m Tr�nh Qu�n Chi.");
			TaskTip("�� ��i ���c n�, quay l�i t�m Tr�nh Qu�n Chi.");
		end
		return
	end
	--����������
	--if GetTrigger(KILL_DL_BLOODCROW) == 0 then
		--CreateTrigger(0,261,KILL_DL_BLOODCROW);
		--Msg2Player("ǰ����ˮ�������ҹ��Ѫѻ�����ռ�10��Ѫѻ��");
		--TaskTip("ǰ����ˮ�������ҹ��Ѫѻ�����ռ�10��Ѫѻ��");
	--end
	TalkEx("",strTalk);
end

--������꾩��������
function task_014_32()

local strTalk = {
	"Ch� ph�i ng��i �� l�y ���c n� r�i sao, ta ch�ng c�n n� n�n g� v�i h� Tr�nh �y c�.",
	}
	TalkEx("",strTalk);
	return
end

--��Ƿ���֣��֮
function task_015_00()

local	strTalk = {};
	
	if Pay(200000) == 1 then
		strTalk = {
			"�a t�! Ta �� thu th�p ���c m�t s� tin t�c c�a Xi H�a gi�o. Cao Qu�c C�ng c�n g�p <sex>, h�y �i t�m �ng �y!",
			}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV60_0_ID,2);
		SetTask(TASK_DL_LV60_1_ID,6);
		SetTask(TASK_DL_LV60_2_ID,5);
		GivePlayerAward("Level_62","xn_step_3");
		GivePlayerExp(SkeyDali,"shouhuidiaokuan")
	else
		strTalk = {
			"Hay l� �i ���ng l�m r�t r�i",
		}
		TalkEx("",strTalk);
	end;
end


--���֣��֮�Ļ����������ȡ62������ʧ�ٵĻ��
function task_016_00()

local strTalk = {
	"Tr�nh c� n��ng, c� tin t�c g� c�a {Xi H�a gi�o} kh�ng?",
	"M�y h�m tr��c � Long Nh�n ��ng t�ng 1 c� t�p h�p m�t s� Xi H�a Tr��ng L�o, ��y l� nh�ng nh�n v�t ch� y�u c�a Xi H�a gi�o. Ta �� cho ng��i ��n �� d� la nh�ng kh�ng th�y tr� v�. L�n n�y phi�n b�ng h�u nh�!",
	"{Long Nh�n ��ng} � ��u?",
	"T� ��i L� �i v� ph�a nam, ��n �i�m Th��ng s�n th� nh�n th�y Long Nh�n ��ng.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV62_ID,1);
	Msg2Player("V�o Long Nh�n ��ng th�m d�");
	TaskTip("V�o Long Nh�n ��ng th�m d�");
	return
end

--δǰ�����۶��鿴
function task_017_00()

local strTalk = {
	"T� ��i L� �i v� ph�a nam, ��n �i�m Th��ng s�n th� nh�n th�y Long Nh�n ��ng.",
	}

	TalkEx("",strTalk);
	return
end

--ǰ�����۶��鿴������㱨
function task_018_00()

local strTalk = {
	"<sex> v� r�i �? T�nh h�nh � �� th� n�o?",
	"{Long Nh�n ��ng t�ng 1} kh�p n�i ��u l� {Kh�i L�i ��c Nh�n}, trong ��ng c�n c� m�t s� {Xi H�a Tr��ng L�o}",
	"V�y �?...<sex> c� th� gi�p ta ���c kh�ng?",
	"Tr�nh c� n��ng c� n�i.",
	"<sex> c� th� gi�p ta gi�t Kh�i L�i ��c Nh�n v� Xi H�a tr��ng l�o ���c kh�ng?",
	"Ta nh�t ��nh s� gi�p c�.",
	"Xin <sex> gi�p ta ti�u tr�15 Kh�i L�i ��c Nh�n v� 15 Xi H�a Tr��ng L�o � Long Nh�n ��ng t�ng 1.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV62_ID,3);
	CreateTrigger(0,262,KILL_DL_CREATUREMAN);
	CreateTrigger(0,263,KILL_DL_CHIHUO_ELDER);
	Msg2Player("��n Long Nh�n ��ng t�ng 1 gi�t 15 Kh�i L�i ��c Nh�n v� 15 Xi H�a Tr��ng L�o.");
	TaskTip("��n Long Nh�n ��ng t�ng 1 gi�t 15 Kh�i L�i ��c Nh�n v� 15 Xi H�a Tr��ng L�o.");
	GivePlayerAward("Level_63","xn_step_1");
	GivePlayerExp(SkeyDali,"xunzhaohuoji")
	return

end

--������ܶ��˺����ϴ�����
function task_019_00()

local strTalk = {
	"Nh� <sex>��n Long Nh�n ��ng t�ng 1 gi�t 15 Kh�i L�i ��c Nh�n v� 15 Xi H�a Tr��ng L�o.",
	}

	if GetTrigger(KILL_DL_CREATUREMAN) == 0 then
		CreateTrigger(0,262,KILL_DL_CREATUREMAN);
		Msg2Player("��n Long Nh�n ��ng t�ng 1 gi�t 15 Kh�i L�i ��c Nh�n v� 15 Xi H�a Tr��ng L�o.");
		TaskTip("��n Long Nh�n ��ng t�ng 1 gi�t 15 Kh�i L�i ��c Nh�n v� 15 Xi H�a Tr��ng L�o.");
	end;
	if GetTrigger(KILL_DL_CHIHUO_ELDER) == 0 then
		CreateTrigger(0,263,KILL_DL_CHIHUO_ELDER);
		Msg2Player("��n Long Nh�n ��ng t�ng 1 gi�t 15 Kh�i L�i ��c Nh�n v� 15 Xi H�a Tr��ng L�o.");
		TaskTip("��n Long Nh�n ��ng t�ng 1 gi�t 15 Kh�i L�i ��c Nh�n v� 15 Xi H�a Tr��ng L�o.");
	end;
	
	TalkEx("",strTalk);
	return
end

--ɱ�����ܶ��˺����Ϻ�
function task_020_00()

local strTalk = {
	"Ta �� thay c� n��ng b�o th� cho {�i�m H�a K�} r�i.",
	"�a t�! B�ch Doanh Doanh gi�o ch� Ng� ��c gi�o cho ng��i ��n t�m. <sex> mau ��n �� m�t chuy�n!",
	"�� t� tu�n l�nh!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV62_ID,5);
	Msg2Player("B�ch Doanh Doanh gi�o ch� Ng� ��c gi�o ph�i ng��i ��n t�m ng��i.");
	TaskTip("B�ch Doanh Doanh gi�o ch� Ng� ��c gi�o ph�i ng��i ��n t�m ng��i.");
	GivePlayerAward("Level_63","xn_step_2","weapon","Level_64");
	GivePlayerExp(SkeyDali,"huojishizhong")
end

--δȥ���嶾�̽���
function task_021_00()

local strTalk = {
	"B�ch Doanh Doanh gi�o ch� Ng� ��c gi�o cho ng��i ��n t�m ng��i, ng��i mau ��n �� m�t chuy�n �i.",
	}

	TalkEx("",strTalk);
	return
end

--�ռ���10�Ŵ����־����֣��֮�Ի�1
function task_022_00()

local strTalk = {
	"<sex> v�t v� qu�!",
	"Kh�ng c�n kh�ch s�o, ta c� v�i ��u mu�n n�i v�i c� n��ng.",
	"<sex> n�i �i.",
	"Sao c� n��ng quan t�m ��n {Xi H�a gi�o} ��n v�y?",
	"�, ngay khi ta v�a m�i ��n ��i L� l�m �n �� b� Xi H�a gi�o g�y kh� d� n�n m�i h�n n�y kh� qu�n.",
	"V�y sao c� n��ng kh�ng r�i kh�i ��y. {��i L�} nguy hi�m nh� v�y kh�ng ph�i l� n�i l�m �n t�t.",
	"Ta th�ch n�i n�y, thi�n th�i ��a l�i ta kh�ng mu�n r�i kh�i ��y.",
	"B�i v� c� n��ng l� ng��i {��i L�}, ��ng kh�ng?",
	"�"
	}
	TalkEx("task_022_01",strTalk);
end

--�ռ���10�Ŵ����־����֣��֮�Ի�2
function task_022_01()

local strTalk = {
	"Th�n th� c�a c� n��ng ta r�t r�. C� n��ng thu�c {l�c ��i gia t�c} � {��i L�} n�y. L�n n�y {��i L�} n�i lo�n c� n��ng ��n ��y gi� l�m ng��i bu�n b�n �� theo d�i nh�t c� nh�t ��ng c�a {Xi H�a gi�o}. Ta n�i v�y ��ng kh�ng?",
	"�",
	"<sex> kh�ng ng� l�i hi�u ta ��n v�y. Kh�ng sai, ta thu�c h� Tr�nh, trong m�t trong l�c ��i gia t�c � ��y.",
	"����",
	"Ta l�n l�n � Tuy�n Ch�u, nh�ng gia t�c ta tr��c gi� r�t quan t�m ��n t�nh h�nh c�a ��i L�. L�n n�y ��i L� n�i lo�n m�i ph�i ta ��n ��y �� th�m d� tin t�c c�a Xi H�a gi�o.",
	"Sao c�c ng��i l�i quan t�m ��n {Xi H�a gi�o} ��n v�y?",
	}
	TalkEx("task_022_02",strTalk);
end
	
--�ռ���10�Ŵ����־����֣��֮�Ի�3
function task_022_02()

local strTalk = {
	"V� Di s�n thu�c B�c Tuy�n Ch�u c� L��ng Th�y ��ng. Xi H�a gi�o �� th��ng xu�t hi�n � ��, h�i ra m�i bi�t ch�ng c� quan h� v�i Ma H� La Ca.",
	"{Ma H� La Ca}?",	
	"Con ng��i n�y h�nh d�ng k� d�, ��u ng��i th�n r�n. Ma H� La Ca l� t�n m�i ng��i g�i �� x�ng t�ng h�n. Th�c ch�t h�n l� m�t trong nh�ng hung th� gi�t gia t�c h� Tr�nh ta.",
	"Ch� tr�ch gia t�c c� n��ng l�i l�u t�m ��n h� nh� v�y.",
	}
	TalkEx("task_022_03",strTalk);
end

--�ռ���10�Ŵ����־����֣��֮�Ի�4
function task_022_03()
local strTalk = {
	"��ng v�y, m�c ��ch c�a ta ��n ��i L� l�n n�y �� th�ng qua Xi H�a gi�o t�m ra tung t�ch c�a Ma H� La Ca.",
	"V�y d�ng h� c� n��ng kh�ng c�n o�n h�n {D��ng Gia} n�a ch�, kh�ng mu�n �o�t l�i ng�i v� {ho�ng t�c t� h� �o�n} �?",	
	"N�m �� D��ng Gia �� nh� Ha M� La Ca gi�t s�ch t�c Tr�nh, may ta tho�t ���c. Nh�ng chuy�n n�y c�ng �� l�u r�i, h�u nh�n c�a D��ng Gia kh�ng tr�c ti�p l�m chuy�n �� ta kh�ng mu�n b�o th� h�. Nh�ng c�n t�n qu�i v�t Ha M� La Ca th� su�t ��i n�y ta kh�ng th� n�o tha cho h�n.",
	"C� n��ng �� t�m ra tung t�ch g� c�a {Ma H� La Ca} ch�a?",
	}
	TalkEx("task_022_04",strTalk);
end

--�ռ���10�Ŵ����־����֣��֮�Ի�5
function task_022_04()

local strTalk = {
	"...C�!",
	"Qu�i v�t �� hi�n gi� � ��u?",
	"Ha M� La Ca r�t c� kh� n�ng h�n �ang � ph�a b�c T�y Song B�n N�p. H�n ���c Xi H�a gi�o g�i ��n �� �� ph�c h�i s�c m�nh. Hi�n gi� s�c l�c c�a h�n h�i ph�c ch�a ���c nhi�u. <sex> h�y tranh th� th�i gian ��n �� ��nh b�i h�n. Ti�u tr� ���c t�n qu�i v�t n�y c� gia t�c h� Tr�nh ta su�t ��i ghi �n ng��i.",
	"Qu�i v�t �� nguy hi�m nh� v�y, ta nh�t ��nh ph�i gi�p c� n��ng r�i.",
	"�a t� <sex>! Ma H� La Ca hi�n � ph�a b�c T�y Song B�n N�p. T�t nh�t n�n c� ��ng ��i h� tr�.",
	"Ta bi�t r�i!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV75_ID,7);
	GivePlayerExp(SkeyDali,"zhengshihouren")
	Msg2Player("��n t�y Song B�n N�p gi�t Ma H� La Ca.");
	TaskTip("��n t�y Song B�n N�p gi�t Ma H� La Ca.");
	return
end

--δ���Ħ�����ȶԻ�
function task_023_00()

local strTalk = {
	". <sex> n�n c� s� h� tr� c�a ��ng ��i!",
	}
	
	TalkEx("",strTalk);
	return
end

--���Ħ�����Ⱥ�Ի�
function task_024_00()

local strTalk = {
	"Ng��i �� di�t ���c Ma H� La Ca r�i �?",
	"��ng v�y.",
	"Ng��i qu� l� h�o h�n, c� Tr�nh t�c ta mang �n <sex>.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV75_ID,9);
	GivePlayerAward("Level_80","xn_step_1",nil,nil,"YunTie",2);
	GivePlayerWeapon("Level_76",1);
	GivePlayerExp(SkeyDali,"weizhengshifuchou")
	return
end


--�պ����������κ�����	
function Task_Exit()
end;