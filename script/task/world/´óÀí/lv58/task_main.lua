-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����58��������̴����ļ�
-- By StarryNight
-- 2006/01/10 PM 17:02

-- ======================================================

-- ���þ��������ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--�γ�����
GiftData = {
	[1] = {2,0,374,"C� s�y kh�"},
	[2] = {2,0,375,"V�t quay"},
	[3] = {2,0,376,"Ng�ng h�p ��u xanh"},
	[4] = {2,0,377,"B�nh t�"},
	[5] = {2,0,378,"B�nh �t m�n"},
}

--��ȡ�Ӻ�������
function task_000_00()

local strTalk = {
	"Nghe n�i <sex> � ��i L� �� gi�p r�t nhi�u ��i s�! Qu�c s� ta c�ng v� c�ng c�m k�ch <sex>.",
	"Qu�c s� qu� khen, c� g� ch� b�o t�i h� kh�ng?",
	"Kh�ng d�m! C� th� thay l�o phu ��n Thi�n Ba D��ng Ph� m�t chuy�n kh�ng?",
	"C� chuy�n g� sao?",
	"Nhi t� ��ng Ca Minh ��n D��ng M�n h�c v�, mu�n v� th�m ph� th�n, nh�ng ch�a quen ���ng thu�c l�i, phi�n <sex> ��n D��ng M�n ��n v�.",
	"T�i h� �i ngay!",
	"�a t� <sex>. Phi�n <sex> ��n D��ng M�n b�o l�i cho Xa Th�i Qu�n bi�t vi�c n�y!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV55_ID,6);
	GivePlayerExp(SkeyDali,"daliguoshi")
	CreateTrigger(4,202,TALK_DL_SHETAIJUN);
	Msg2Player("��n D��ng M�n t�m Xa Th�i Qu�n ��a ��ng c�ng t� v� ��i L�.");
	TaskTip("��n D��ng M�n t�m Xa Th�i Qu�n ��a ��ng c�ng t� v� ��i L�.");
	return
	
end

--δ����̫�����Ӻ���
function task_001_00()

local strTalk = {
	"Phi�n <sex> ��n D��ng M�n t�m Xa Th�i Qu�n",
	}

	TalkEx("",strTalk);
	--������̫���Ի�������
	if GetTrigger(SheTaiJun_Talk) == 0 then
		CreateTrigger(4,202,TALK_DL_SHETAIJUN);
		Msg2Player("��n D��ng M�n t�m Xa Th�i Qu�n ��a ��ng c�ng t� v� ��i L�.");
		TaskTip("��n D��ng M�n t�m Xa Th�i Qu�n ��a ��ng c�ng t� v� ��i L�.");
	end;
	return
end

--�����ӵ���Ŀ�ĵ�
function task_002_00()

local nItemOk = buy_all_gift()

	if nItemOk == 1 then
		strTalk = {
			"��ng Qu�c s�, {c�ng t�} b�nh an tr� v� c�n �em v� {v� s� v�t ph�m} t� {��i T�ng}.",
			"Nh�ng m�n ��c s�n n�y ��u do v� <sex> n�y mua gi�p. Cha mau th��ng cho <sex> �i!",
			}
  	
		KillFollower();--ȥ�������С��
		SetTask(TASK_DL_LV55_ID,8);
		--UseScrollEnable(1);--����ʹ�ûس̷�
		--SetDeathScript("");--������������ű�
		RemoveTrigger(GetTrigger(TALK_DL_SHETAIJUN));
		TalkEx("task_002_01",strTalk);

	else
		strTalk = {
			"Cha! Con c� vi�c g�p, s� quay l�i sau!",
			}
		TalkEx("",strTalk);
	end
end

--���Ͷ������ؼҺ���ȡ����ѡ��
function task_002_01()

local strSay = {
	"C� ch�t th�nh �, xin nh�n cho!",
	"�a t�!/#reward(1)",
	"Ch� l� vi�c m�n, s� ng�n l��ng n�y t�i h� kh�ng d�m nh�n!/#reward(2)",
	}
	
	SelectSay(strSay);
	GivePlayerAward("Level_58", "xn_step_2");
	GivePlayerExp(SkeyDali,"teshecai")
end

function reward(nkind)

local strTalk = {
	"Th�t s� c�m �n <sex>! Xin <sex>h�y ngh� ng�i! Sau n�y c�n s� nh� ��n <sex>.",
	}
	TalkEx("",strTalk);
	
	if nkind == 1 then -- ����ҽ�Ǯ
		Earn(250000);
	else -- ���������
		ModifyReputation(10,0);
	end;
end


--�Ѿ���ɴ�����������    
function task_003_00()

local strTalk = {};

	if GetLevel() >= 55 then
		strTalk = {
			"<sex> c� tin vui g� kh�ng?",
			"Tai h� c� th� gi�p g� cho Qu�c s� kh�ng?",
			"C� vi�c n�y mu�n nh� <sex> gi�p ��, nh�ng do m�y h�m tr��c th�y <sex> v�t v� n�n kh�ng d�m nh�!",
			"T�i h� l� ng��i h�c v� ch� b� ch�t c�ng s�c ��u c� ��ng g�, xin Qu�c s� c� n�i!",
			"B�ch Th�y ��ng � V� L�ng s�n c� r�t nhi�u D�i ��c. <sex> c� th� gi�p ta b�t 20 con kh�ng?",
			"���c! T�i h� �i ngay!",
			}
		
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV55_ID,9);
		SetTask(TASK_DL_LV60_ID,1);
		CreateTrigger(0,260,KILL_DL_POISONBAT);
		Msg2Player("��n B�ch Th�y ��ng gi�t 20 D�i ��c.");
		TaskTip("��n B�ch Th�y ��ng gi�t 20 D�i ��c.");
			
	else	
		strTalk = {
			"Xin <sex> h�y ngh� ng�i m�t th�i gian!",
			}
		TalkEx("",strTalk); 

	end
end


--����¥�ϰ������ŶԻ�
function buy_gift_talk(index)

local strSay = {
	"Kh�ch quan mu�n d�ng g�? "..GiftData[index][4].." kh�ch quan c� mu�n mua kh�ng?",
	"Mua 1 ph�n/#buy_gift("..index..")",
	"Kh�ng mua/no"
	}
	SelectSay(strSay)
	return
end

--��������
function buy_gift(index)

local strTalk = {};
	
	if Pay(50000) == 1 then
		AddItem(GiftData[index][1],GiftData[index][2],GiftData[index][3],1,1)
		strTalk = {"�a t�, �a t�!"};
		TalkEx("",strTalk);
	else
		strTalk = {"Kh�ng c� ng�n l��ng �?"};
		TalkEx("",strTalk);
	end
end

--�ж��Ƿ���5������
--����ֵ��1 ȫ���򵽣�0 û����ȫ
function buy_all_gift()

local	i = 0;
	
	for i = 1,5 do
		if GetItemCount(GiftData[i][1],GiftData[i][2],GiftData[i][3]) <= 0 then
			return 0
		end;
	end
	
	for i=1,5 do
		DelItem(GiftData[i][1],GiftData[i][2],GiftData[i][3],1);
	end
	return 1
end 

--��ȡ��ɱ��20�����������
function task_009_00()

local strTalk = {
	"��n t�ng 1 B�ch Th�y ��ng (V� L�ng s�n) gi�t 20 D�i ��c tr��c ��!.",
	}
	
	if	GetTrigger(KILL_DL_POISONBAT) == 0 then
		CreateTrigger(0,260,KILL_DL_POISONBAT);
		Msg2Player("��n B�ch Th�y ��ng gi�t 20 D�i ��c.");
		TaskTip("��n B�ch Th�y ��ng gi�t 20 D�i ��c.");
	end;
	
	TalkEx("",strTalk);
	return
end

--�Ѿ�ɱ��20�����
function task_010_00()

local strTalk = {
		"V� r�i �? C�n vi�c g� t�i h� c� th� gi�p ���c kh�ng?",
		"Xi H�a gi�o �� g�n ��y l�i xu�t hi�n � B�ch Th�y ��ng, th� l�nh c�a ch�ng l� t�n Xi H�a �c T�ng v� c�ng l�i h�i, ��i T�ng �� c� bao nhi�u binh s� ��n ti�u tr� b�n ch�ng ��u kh�ng th�y tr� v�.",
		"{Xi H�a �c T�ng}? �c T�ng ngh�a l� g�?",
		"Ta c�ng kh�ng r�, c� l� b�n ch�ng ��c s�ch kh�ng nhi�u n�n d�ng sai ch�.",
		"Qu�c s� c� mu�n ti�u tr� t�n {Xi H�a �c T�ng} �� kh�ng?",
		"<sex> hi�n ch�a h�i ph�c, s� <sex> ch�a ph�i l� ��i th� c�a Xi H�a �c t�ng",
		"Qu�c s� y�n t�m, c� ch� tin vui c�a h�i h�.",
		"N�u v�y th� tr�ng nh� v�o <sex>. Xi H�a �c T�ng � t�ng 1 B�ch Th�y ��ng.",
		}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_ID,3);
	Msg2Player("��n B�ch Th�y ��ng t�ng 1 di�t Xi H�a �c T�ng.");
	TaskTip("��n B�ch Th�y ��ng t�ng 1 di�t Xi H�a �c T�ng.");
	GivePlayerAward("Level_60", "xn_step_1");
	GivePlayerExp(SkeyDali,"baishuidong")
	return
	
end

--δɱ����ɮ��Ի�
function task_011_00()

local strTalk = {
	"Xi H�a �c T�ng � t�ng 1 B�ch Th�y ��ng. <sex> nh� b�o tr�ng!",
	}

	TalkEx("",strTalk);	
	return
	
end

--�Ѿ�ɱ����ɮ��Ի�
function task_112_00()

local strTalk = {
		"<sex> v�t v� qu�!",
		"Kh�ng sao, t�i h� d� s�c �� gi�t h�n.",
		"Sau n�y c�n nhi�u vi�c nh� ��n <sex>, b�y gi� h�y ngh� ng�i ��!",
		}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_ID,5);
	GivePlayerAward("Level_60", "xn_step_2","chest","Level_61");
	GivePlayerExp(SkeyDali,"cihuoesheng")
	return
end

--��ȡ��ˮ������
function task_013_00()

local strTalk = {
	"Qu�c s� c�n c� g� ch� b�o?",
	"Xi H�a Gi�o �� �ang t� t�p � V� L�ng s�n. <sex> bi�t chuy�n n�y ch�a?",
	"Tr��c ��y m�y ng�y {Cao Qu�c C�ng Cao Th�ng Tuy�n} c� sai t�i h� ��n ��.",
	"C�ch ��y kh�ng l�u B�ch Th�y ��ng l�i xu�t hi�n D� Xoa, h�n �� s�t h�i bao nhi�u ng��i �i qua ��. L�n n�y phi�n b�ng h�u ��n �� m�t chuy�n!",
	"B�t lu�n ch�ng l�i h�i th� n�o, t�i h� c�ng kh�ng ch�i t�.",
	"<sex> qu� l� h�o hi�p, nh�ng n�u <sex> c� ��ng ��i h� tr� s� t�t h�n!",
	"T�i h� bi�t r�i, l�p t�c ��n {B�ch Th�y ��ng} ��y.",
	"Xin <sex> b�o tr�ng!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_ID,6);
	Msg2Player("��n B�ch Th�y ��ng t�ng 2 ��nh b�i D� Xoa (227.212).");
	TaskTip("��n B�ch Th�y ��ng t�ng 2 ��nh b�i D� Xoa (227.212).");
	
	return
	
end

--�Ѿ���ȡ�˰�ˮ������
function task_014_00()

local strTalk = {
	"D� Xoa � t�ng 2 B�ch Th�y ��ng. <sex> nh� b�o tr�ng!",
	}

	TalkEx("",strTalk);	
	return
end

--�Ѿ�ɱ��ҹ��Ի�
function task_015_00()

local strTalk = {
	"V� r�i �?",
	"T�i h� �� ��nh b�i {D� Xoa}! M�t ch�t �i ���c!",
	"�a t� <sex>, l�n n�y may m� nh� c� <sex> gi�p ��. L�n tr��c ta c�n n� Tr�nh c� n��ng 10 l��ng. <sex> c� th� gi�p ta �em ��n �� ���c kh�ng?",
	"���ng nhi�n l� ���c r�i!",
	"�a t� <sex>, xin �em 10 l��ng n�y ��n cho Tr�nh Qu�n Chi!",
	}
	Earn(100000);
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_ID,8);
	Msg2Player("�em ng�n l��ng ��n ��i L� cho Tr�nh Qu�n Chi.");
	TaskTip("�em ng�n l��ng ��n ��i L� cho Tr�nh Qu�n Chi.");
	GivePlayerAward("Level_61", "xn_step_1",nil,nil,"YunTie",1);
	GivePlayerExp(SkeyDali,"cihuoyecha")
	GivePlayerEquipment("head","Level_64",1);
	GivePlayerEquipment("legs", "Level_66",1);
	return
	
end

--�Ѿ����ҹ������
function task_016_00()

local strTalk = {
	"Ng��i ��i T�ng th�t bi�t l�m �n!",
	}
	
	TalkEx("",strTalk);
	return
end

--�Ѿ������̵���ս������
function task_017_00()

local strTalk = {};
	
	--80�����ܽ�����
	if GetLevel() >= 80 then
		strTalk = {
			"S� vi�c c�a Nh� Ho�ng T� v� c�ng c�p b�ch, phi�n <sex> ��n ��i L� ti�u tr� qu�n ph�n lo�n.",
			"T�i h� �i ngay!",
			"��u l�nh qu�n ph�n lo�n c�ng l� ��i tr��ng h� v� c�a Nh� Ho�ng T� t�n �o�n Th�a �n, t�n n�y l� m�t cao th� c� ti�ng � ��i L�.",
			"Hi�n gi� h� � ��u?",
			"Nh�t ��nh ph�i ��nh b�i �o�n Th�a �n!",
			} 	           
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV80_ID,1);
		SetTask(TASK_DL_LV70_ID,5);
		Msg2Player("��n ph�a nam T�y Song B�n N�p ��nh b�i �o�n Th�a �n.");
		TaskTip("��n ph�a nam T�y Song B�n N�p ��nh b�i �o�n Th�a �n.");
	else
		strTalk = {
			"Th� l�c c�a Nh� Ho�ng T� �ang r�t m�nh, hi�n gi� ta kh�ng ph�i l� ��i th� c�a ch�ng. <sex> c�n ph�i r�n luy�n th�m n�a!",
			}
		TalkEx("",strTalk);
	end
end

--δ�򵹶γж�֮ǰ�Ի�
function task_018_00()

local strTalk = {
	"�o�n Th�a �n � ph�a ��ng nam T�y Song B�n N�p.",
	}
	
	TalkEx("",strTalk);
	return
end

--������ӶԻ���
function task_019_00()
                      
local nTime = GetTime();                      
local strTalk = {
	"<sex> v� r�i �? M�i vi�c th� n�o?",
	"T�i h� �� g�p {Nh� Ho�ng T�} nghe n�i l� b� oan, trong {chi�u ch� c�a Ti�n �� ��i L�} v�n mu�n h�n ti�p t�c k� v�.",
	"C� chuy�n n�y �? Th�t bu�n c��i, h�n c� g� �� ch�ng minh?",
	"H�n ��a cho t�i h� {chi�u th� c�a Ti�n ��}, kh�ng bi�t th�t hay gi�.",
	"Ng��i ��a ta xem!",
	"�",
	"��ng l� b�t t�ch c�a Ti�n ��.",
	"V�y ph�i l�m sao?",
	"Ta th�y Tam Ho�ng T� m�i x�ng ��ng l� ng��i k� v�, nh�ng � ti�n �� �� nh� v�y chi b�ng ph�i xem l�i. C� tin g� ta s� b�o l�i ng��i sau.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_ID,4);
	DelItem(2,0,381,1);--ɾȥ�����ӵ�����
	SetTask(TASK_DL_LV80_TIME_ID,nTime);
	Msg2Player("��i tin c�a ��ng Qu�c S�");
	TaskTip("��i tin c�a ��ng Qu�c S�");
	GivePlayerAward("Level_76", "xn_step_2",nil,nil,"YunTie",1);
	GivePlayerEquipment("head","Level_72",1);
	GivePlayerEquipment("chest","Level_70",1);
	GivePlayerEquipment("legs","Level_74",1);
	return
end

--�붭���޶Ի�����ȡ���Ǭ��������1
function task_019_01()

local strTalk = {};
local nTime = GetTime() - GetTask(TASK_DL_LV80_TIME_ID);

	--����ʱ��20����֮��
	if nTime >= 1200 then
		strTalk = {
			"{��ng Qu�c S�}, s� vi�c th� n�o r�i?",
			"Kh�ng xong r�i, Tam Ho�ng T� kh�ng ch�u tho�i v�. Ta ��nh d�ng uy l�c �� b�c h�n tho�i v�. Kh�ng ng� h�n l�i ���c ng��i c�a Thi�n T�m Th�p h� tr� ��a v�o Thi�n T�m Th�p r�i, kh�ng c�n c�ch n�o kh�c.",
			"V�y gi� ph�i l�m sao?",
			"<sex>, ��i L� n�y ch� c� m�nh <sex> l� v� c�ng cao c��ng. Mau truy b�t Tam Ho�ng T�!",
			"���c th�i!",
			}
		TalkEx("task_019_02",strTalk);
	else
		strTalk = {
			"T�m th�i ch�a c� tin t�c g�! Quay l�i sau nh�!",
			}
		TalkEx("",strTalk);
	end
end

--�붭���޶Ի�����ȡ���Ǭ��������2
function task_019_02()

local strTalk = {};
strTalk = {
		"Tam Ho�ng T� r�t th�ch ph�o, h�n hi�n � t�ng cu�i c�ng c�a Thi�n T�m Th�p. Ng��i ph�i ��nh b�i C�n ��t B� h� v� c�a h�n l�y ���c ph�o. Sau �� ��t ph�o l�m t�n hi�u g�i h�n ra.",
		"{C�n ��t B�} � ��u?",
		"H�n hi�n � t�ng 1 Thi�n T�m Th�p.",
	}		
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_TIME_ID,1);--�Ѿ��Ⱥ�20���ӱ�־
	Msg2Player("��n t�ng 1 Thi�n T�m Th�p ��nh b�i C�n ��t B�");
	TaskTip("��n t�ng 1 Thi�n T�m Th�p ��nh b�i C�n ��t B�");
end	

--δ��Ǭ����ǰ�붭���޶Ի�
function task_020_00()

local strTalk = {
	"C�n ��t B� � t�ng 1 Thi�n T�m Th�p.",
	}
	
	TalkEx("",strTalk);
	return
end

--��Ǭ���ź��붭���޶Ի�����ȡɱ������������
function task_021_00()

local strTalk = {
	"�� l�y ���c {ph�o hi�u}, nh�ng ch�a c� {ng�i n�}.",
	"Ng�i n� �ang � ch� Kh�n Na La, ng��i ph�i ��nh b�i h�n m�i l�y ���c.",
	"{Kh�n Na La} � ��u?",
	"H�n � t�ng 2 Thi�n T�m Th�p.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_ID,6);
	DelItem(2,0,382,1);--ɾȥǬ��������
	Msg2Player("��n t�ng 2 Thi�n T�m Th�p ��nh b�i Kh�n Na La.");
	TaskTip("��n t�ng 2 Thi�n T�m Th�p ��nh b�i Kh�n Na La.");
	GivePlayerAward("Level_81","xn_step_1");		
	GivePlayerExp(SkeyDali,"qiandapo")
	return
end

--δ�򵹽�����ǰ�붭���޶Ի�
function task_022_00()

local strTalk = {
	"Kh�n Na La � t�ng 2 Thi�n T�m Th�p.",
	}
	
	TalkEx("",strTalk);
	return
end

--�򵹽����޺��붭���޶Ի�����ȡǰ���������������
function task_023_00()

local strTalk = {
	"T�i h� �� l�y ���c {ng�i n�}.",
	"B�y gi� ng��i c� th� ��n t�ng 3 Thi�n T�m Th�p t�m Ph�o hi�u ���c r�i!",
	"�� t� tu�n l�nh!",
	"<sex> ph�i c�n th�n, c�n v� c�a Tam Ho�ng T� ��u l� nh�ng cao th�!",
	"Ta bi�t r�i!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_ID,8);
	DelItem(2,0,383,1);--ɾȥ����
	AddItem(2,0,384,1,1);--�õ��ٻ����������
	Msg2Player("��n t�ng 3 Thi�n T�m Th�p d�ng ph�o hi�u �� g�i Tam Ho�ng T�");
	TaskTip("��n t�ng 3 Thi�n T�m Th�p d�ng ph�o hi�u �� g�i Tam Ho�ng T�");
	GivePlayerAward("Level_81","xn_step_2");
		GivePlayerExp(SkeyDali,"jinnaluo")
	return
end

--δ��������ǰ�붭���޶Ի��������ٻ���������Ʒ��
function task_024_00()

local strTalk = {
	"<sex> ��n t�ng 3 Thi�n T�m Th�p d�ng Ph�o Hi�u g�i Tam Ho�ng T�, nh�ng b�n c�nh h�n lu�n c� nh�ng c�n v� ��c l�c. Ph�i b�o tr�ng!",
	}
	
	TalkEx("",strTalk);
	if GetItemCount(2,0,384) <= 0 then
		AddItem(2,0,384,1,1);--�õ��ٻ����������
		Msg2Player("��n t�ng 3 Thi�n T�m Th�p d�ng ph�o hi�u �� g�i Tam Ho�ng T�");
		TaskTip("��n t�ng 3 Thi�n T�m Th�p d�ng ph�o hi�u �� g�i Tam Ho�ng T�");
	end
	return
end
	
--�������Ӻ��붭���޶Ի�1
function task_025_00()

local strTalk = {
	"�� ��nh b�i {tam Ho�ng T�}.",
	"C�n v� c�a h�n c�ng �� b� kh�ng ch�.",
	"V�y c�n {Xi H�a gi�o}?",
	"Tam Ho�ng T� tr��c khi r�i kh�i ��i L� trong tay �� c� b�n S�n H� X� T�c v� v�y ���c Xi H�a Gi�o v� Thi�n T�m Th�p k�t l�m ��ng minh, Xi H�a Gi�o v� th� ng�y c�ng t�c lo�n.",
	}
	TalkEx("task_025_01",strTalk);
end

--�������Ӻ��붭���޶Ի�2
function task_025_01()

local strTalk = {	
	"Qu�n ph�n lo�n c�a {Xi H�a gi�o} �� d�p ���c ch�a?",
	"Nh� Ho�ng T� s�p l�n ng�i nh�ng Ti�n �� v� ��i Ho�ng T� hi�n gi� kh�ng bi�t � ��u! D� sao c�ng �a t� <sex> �� qu� v�t v�!",
	"Ch� g�p ch�t c�ng s�c, kh�ng ��ng l� bao.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_ID,10);
	GivePlayerAward("Level_81","xn_step_3",nil,nil,"YunTie",1);
	GivePlayerEquipment("chest","Level_71",1);
	GivePlayerEquipment("head","Level_73",1);
	GivePlayerEquipment("legs","Level_75",1);
	GivePlayerExp(SkeyDali,"dalisanhuangzi")
end
