
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �����ʴ���ʵ�崦���ļ�_·�˰�����
-- Edited by peres
-- 2005/04/14 PM 13:59

-- ������  Ϩ����
-- ��ʧ��  ��ס��
-- ��վ��  ��������
-- ����    ������ѿ
-- �ȴ�    꼻��ٿ�
-- �ѷҷ�  �����껪
-- �˰�    û�е���
-- ����Ȼ  ������
-- ���    ˢ����ͷ��
-- ������  �һ��
-- ����    �Ҷ��Լ�˵
-- �Ҳ�����
-- �Һܰ���

-- lyrics : �˰���

-- ======================================================

Include("\\script\\task\\question\\question_head.lua");
Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\world\\lizhi_������\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\lv40\\task_main.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");

-- ��ڴ�����
function main()

local Talk_Main_Sign = {};--����������;1Ϊ����������2Ϊ��������3Ϊ��������
local SelectList = {};
local nStep = GetTask(TASK_TWO);
local strSay = {"Ta ch�nh l� k� t�c tr� �a m�u B�ch Hi�u Sinh! Ng��i t�m ta c� g� kh�ng?"}

	SelectList = {
	
	[1] = {
					{
				 		"V�n b�i c� nghe chuy�n c�a Tr��ng Ca M�n, mu�n ���c ti�n b�i ch� gi�o./task_002_00"
				 	},
				 	{
				 		"Mu�n th�nh gi�o chuy�n v� v� l�m truy�n thuy�t!/wl_story",
--				 		"�����������һ���й����ֵ�ѧʶ��/ConfirmQuestion"
				 	}
				},
	[2] = {
					{
						"V�n b�i c� nghe chuy�n c�a T�y nam ��i L�, mu�n ���c ti�n b�i ch� gi�o./task_100_00",
					},
					
					{
						"V�n b�i c� nghe chuy�n c�a T�y nam ��i L�, mu�n ���c ti�n b�i ch� gi�o./task_100_01"
					},
				},
	[3] = {
					{
						"V�n b�i ���c Kh�u Chu�n �y th�c, mu�n ���c ti�n b�i ch� gi�o v� ��ng t�nh m�y ng�y nay c�a Nh�t ph�m ���ng � ph�a t�y bi�n gi�i T�y H�./task_001_02_0",
					},
					{
						"V�n b�i ���c Kh�u Chu�n �y th�c, mu�n ���c ti�n b�i ch� gi�o v� ��ng t�nh m�y ng�y nay c�a Nh�t ph�m ���ng � ph�a t�y bi�n gi�i T�y H�./task_001_02_1"
					},
					{
						"V�n b�i mu�n ���c ti�n b�i ch� gi�o l�m c�ch n�o �� b�t S�t Th� Oa Oa/task_005_03_0"
					},
					{
						"V�n b�i mu�n ���c ti�n b�i ch� gi�o l�m c�ch n�o �� b�t S�t Th� Oa Oa/task_005_03_1"
					},
				}
		}

	--��������Ի�����
	
	--������������
	
	--task_002_00
	if nStep == 1 then
		Talk_Main_Sign[1] = 1;
	--szSay
	elseif nStep == 2 then
		Talk_Main_Sign[1] = 2;
	else
		Talk_Main_Sign[1] = 0;
	end
	
	--����������
	--task_100_00
	if GetTask(TASK_DL_LV35_ID) == 3 and GetLevel() >= 35 then
		Talk_Main_Sign[2] = 1;
	--task_100_01
	elseif GetTask(TASK_DL_LV40_ID) == 1 then
		Talk_Main_Sign[2] = 2;
	else
		Talk_Main_Sign[2] = 0;
	end
	
	--����������
	if GetTask(TASK_XB_ID) == 1 then
		Talk_Main_Sign[3] = 1;
	elseif GetTask(TASK_XB_ID) == 2 then
		Talk_Main_Sign[3] = 2;
	elseif GetTask(TASK_XB_ID) == 18 then
		Talk_Main_Sign[3] = 3;
	elseif GetTask(TASK_XB_ID) == 19 then
		Talk_Main_Sign[3] = 4;
	else
		Talk_Main_Sign[3] = 0;
	end
	
	for i=1,getn(Talk_Main_Sign) do
		if Talk_Main_Sign[i] ~= 0 then
			for t=1,getn(SelectList[i][Talk_Main_Sign[i]]) do
				tinsert(strSay,SelectList[i][Talk_Main_Sign[i]][t]); 
			end
		end
	end
	
	tinsert(strSay,"C� g� ��u/MainExit");
	
	if Talk_Main_Sign[1] ~= 0 or Talk_Main_Sign[2] ~= 0 or Talk_Main_Sign[3] ~= 0 then
		SelectSay(strSay);
		return
	end
	
--����������Ĵ���
    
--    local nStep = 0;
--    local szTalk = {
--        "�����������ֻ����ˣ������ʲô����㴵�����ģ�",  
--        "��ң�������һЩ�й�{������}�����飬���������ֽ̡�",
--        "������������Ҳ֪�������ŵ������ˣ����������˻����Ƕ��졣��˿�����Ҳ�볤������Ե��Ҳ�գ��ұ�ָ����һ������������Щ���ڽ�����շת�������в�����ص��鼮�Ѿ�ʧ���ڸ����ˣ���Щϸ��һʱ˵���������ɲ�Ҫ��Թ����"
--    };
--    local szSay = {
--        "���������Ҿ����˳ơ����Ƕ�ı���İ���������������ʲô����ô��",
--        "���������ֽ��й����ִ�˵�Ĺ��¡�/wl_story",
--        "�����������һ���й����ֵ�ѧʶ��/ConfirmQuestion"
--    };
--
--    nStep = GetTask(TASK_TWO);
--    
--    if nStep == 1 then
--			--������40���������(����:1�������ɽ����;2�ȼ�����35��)
--    	if GetTask(TASK_DL_LV35_ID) == 3 and GetLevel() >= 35 then
--				local strSelect = {
--        	"�����������ֻ����ˣ������ʲô����㴵�����ģ�",
--        	"������һЩ�й�{������}�����飬���������ֽ̡�/task_002_00",
--        	"������һЩ�й�{���ϴ���}�����飬���������ֽ̡�/task_100_00"
--    		};
--    		SelectSay(strSelect);
--    		return
--    	end
--    	if GetTask(TASK_DL_LV40_ID) == 1 then
--    		local strSelect = {
--        	"�����������ֻ����ˣ������ʲô����㴵�����ģ�",
--        	"������һЩ�й�{������}�����飬���������ֽ̡�/task_002_00",
--        	"������һЩ�й�{���ϴ���}�����飬���������ֽ̡�/task_100_01"
--    		};
--    		SelectSay(strSelect);
--    		return
--    	end
--      TalkEx("task_002_00", szTalk);
--      return
--    elseif nStep == 2 then
--    	--������40���������(����:1�������ɽ����;2�ȼ�����35��)
--    	if GetTask(TASK_DL_LV35_ID) == 3 and GetLevel() >= 35 then
--				szSay = {
--        	"���������Ҿ����˳ơ����Ƕ�ı���İ���������������ʲô����ô��",
--        	"���������ֽ��й����ִ�˵�Ĺ��¡�/wl_story",
--        	"�����������һ���й����ֵ�ѧʶ��/ConfirmQuestion",
--        	"������һЩ�й�{���ϴ���}�����飬���������ֽ̡�/task_100_00"
--   			 	};
--   			SelectSay(szSay);
--      	return
--   		end;
--   		if GetTask(TASK_DL_LV40_ID) == 1 then
--    		szSay = {
--        	"���������Ҿ����˳ơ����Ƕ�ı���İ���������������ʲô����ô��",
--        	"���������ֽ��й����ִ�˵�Ĺ��¡�/wl_story",
--        	"�����������һ���й����ֵ�ѧʶ��/ConfirmQuestion",
--        	"������һЩ�й�{���ϴ���}�����飬���������ֽ̡�/task_100_01"
--    			};
--    		SelectSay(szSay);
--      	return
--    	end
--    	SelectSay(szSay);
--      return
--    end
--    
--    if GetTask(TASK_DL_LV35_ID) == 3 and GetLevel() >= 35 then
--    	strTalk = {
--      	"���������Ҿ����˳ơ����Ƕ�ı���İ���������������ʲô����ô��",
--      	"���:������һЩ�й�{���ϴ���}�����飬���������ֽ̡�"
--   		 	};
--    	TalkEx("task_100_00",strTalk);
--    	return
--    end
--    	
--    if GetTask(TASK_DL_LV40_ID) == 1 then
--    	strTalk = {
--      	"����������ȥ��{������}���ʰɣ�������{�꾩}��"
--   		 	};
--    	TalkEx("task_100_01",strTalk);
--    	return
--    end
    
-- ��������Ĵ���
local nState = TE_GetTeachState();

if (nState==18) then
	task_018_00();
	return
end;

	Say("Th�c l�c c�a T�ng Ki�m s�n trang sao gi�u ���c ta!",0);

end;

-- �ӱ���ļ��ж�ȡÿ�������Ȩ���γ�һ������
CreateRateArry();

-- ˵��TASK_TWO������״̬��20000��ʾstep2�������4λ�ֱ�����Ƿ������4�����˽������
-- ���һ���˽�����ݣ�����4λ�еĶ�Ӧλ����Ϊ1

function task_002_00()
    local szSay = {
        "Ta ch�nh l� k� t�c tr� �a m�u B�ch Hi�u Sinh! Ng��i t�m ta c� g� kh�ng?",
        "T�i h� mu�n th�nh gi�o ki�n th�c v� l�m!/wl_story",
--        "�����������һ���й����ֵ�ѧʶ��/ConfirmQuestion"
    };
    SetTask(TASK_TWO, 2);
    SelectSay(szSay);
end;

--�������������ĸĶ�
function task_002_10()
    local szSay = {
        "Ng��i c�ng bi�t chuy�n Tr��ng Ca M�n sao? G� Tri�u Di�n Ni�n qu� th�t nhi�u chuy�n nh�ng xem nh� ng��i c� duy�n v�i chuy�n Tr��ng Ca M�n. M�y n�m nay ta l�n l�n ch�n giang h�, bi�t ���c nhi�u th� t�ch qu� hi�m th�t l�c � kh�p n�i nh�ng ta kh�ng bi�t ch�nh x�c � n�i n�o. Xin ��ng o�n h�n ta!",
        "T�i h� mu�n th�nh gi�o ki�n th�c v� l�m!/wl_story",
--        "�����������һ���й����ֵ�ѧʶ��/ConfirmQuestion"
    };
    SetTask(TASK_TWO, 2);
    SelectSay(szSay);
end;

function wl_story()
    local szSay = {
        "Th�i v� l�m lo�n th�, anh h�ng xu�t hi�n! Ng��i mu�n hi�u chuy�n chi?",
        "Mu�n bi�t v� lai l�ch Tr��ng Ca m�n./say1",
        "Mu�n bi�t v� k�t c�u t� ch�c c�a Tr��ng Ca m�n./say2",
        "Mu�n hi�u chuy�n c�a Thi�n �m gi�o Li�u Qu�c./say3",
        "Mu�n hi�u chuy�n c�a Xi H�a gi�o ��i L�./say4",
        "Mu�n hi�u chuy�n T�y H� Nh�t Ph�m ���ng./say5"
    };
    SelectSay(szSay);
end;

function say1()
    local szTalk = {
        "Sau khi Th�i T� ��i tr��c b�nh ��nh giang s�n B�i T�u Th�ch Binh Quy�n, c�c t��ng l�nh Th�ch Th� T�n, Cao Ho�i ��c, Tr��ng L�nh Phong, Tri�u Ng�n Huy ��u c�o l�o h�i h��ng. Tri�u Ng�n Huy ��i nh�n kh�ng cam c�nh c� ��n, �� li�n l�c v�i b�ng h�u giang h�, th��ng c�ng nhau ng�m th� ��i x��ng ho�c t� th� v� c�ng.",
        "Sau n�y c�c b�ng h�u c�ng k�t ngh�a, th�nh l�p n�n m�t m�n ph�i. Khi �y, ng��i trong ph�i h�u h�t ��u l� c�c s� phu nho nh�, l�y s�ng t�c thi ca l�m th� vui n�n m�i ng��i ��u t� x�ng l� Tr��ng Ca M�n. Tuy Tr��ng Ca M�n th�n t�i giang h� nh�ng tr��c sau r�t quan t�m Qu�c k� d�n sinh, h�nh hi�p tr��ng ngh�a kh�p n�i theo t�n ch� lu�n t�o ph�c cho thi�n h� b� t�nh.",
        "Ra l� v�y! �a t� ti�n b�i ch� gi�o!"
    };
    TalkEx("", szTalk);
end;

function say2()
    local szNotFinished = {
        "Tr��ng Ca M�n h�u h�t l� nh�ng v�n nh�n m�c kh�ch n�i danh. Ch� ��ng ti�c l�n tr��c khi ta � L��ng S�n, quy�n s�ch ghi ch�p v� c�u chuy�n c�a h� �� b� th�t l�c g�n D� Tr� L�m. H�y gi�p ta t�m Tr��ng M�n s�ch, ta s� k� th�m cho nghe!",
	    "Tr��ng M�n S�ch g�m 9 trang. Thu th�p ��, ta s� n�i r� cho ng��i bi�t!"
    };
    local szFinished = {
        "Tr��ng Ca M�n h�u h�t l� nh�ng v�n nh�n m�c kh�ch dung r�i kh�p n�i, n�i ti�ng tr�n giang h� v� Ng� hi�p Nh�n Ngh�a L� Tr� T�n v� T� h�u C�m K� Thi H�a.",
        "T�nh c�ch ki�n c��ng Chuy�n l�m vi�c ngh�a nh�n. H�n Th� M�nh, lu�n ti�n phong ra tay h�nh hi�p tr��ng ngh�a. X� th�n v� ngh�a. C�nh V�n Phi lu�n coi tr�ng ngh�a kh�, v�i b�ng h�u lu�n v�ng d� s�c son. L� Th��ng v�ng lai. T�n Thanh Nhi�m l� n�i gia quy�n cao nh�n, m��n l�c ��nh l�c l� tuy�t k� n�i danh c�a ng��i n�y.",
        "T�c tr� �a m�u, t�nh t�nh �i�m ��m, ngo�i tr� ki�n th�c r�ng c�ng kh�ng c� g� n�i b�t. H� b�t th�nh v�n. L��ng Th��ng Ng�c l� s� tr��ng, c�ng phu xu�t th�n nh�p h�a, c� th� s�nh ngang v�i C�nh V�n Phi, nh�ng ti�c thay � l�i l� m�t ngh�a ��o c��p c�a ng��i gi�u chia cho ng��i ngh�o.",
        "T� h�u C�m K� Thi H�a. �u D��ng H�a l� b�c th�y v� m�u s�c. H� H�u C�m x�ng l� �� nh�t danh c�m � D��ng Ch�u. Gia C�t K� �� nh�t danh c� �ang tr� t�i Nam Th�nh �� ph�. C�ng T�n Th� � T��ng D��ng gi�i c� v� th� ph�p l�n ��nh b�c .",
        "Ra l� v�y! �a t� ti�n b�i ch� gi�o!"
    }
    local nStep = GetTask(TASK_TWO_ONE);
    if nStep == 0 or nStep == 1 then
        -- ������������
        if GetItemCount(2,0,51) >= 9 then
            DelItem(2,0,51,9);
            SetTask(TASK_TWO_ONE, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(92));
            if GetTask(TASK_TWO_TWO) == 2 and GetTask(TASK_TWO_THREE) == 2 and GetTask(TASK_TWO_FOUR) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_ONE, 1);
            Msg2Player("��n D� Tr� L�m t�m Tr��ng M�n S�ch th�t l�c.");
            TaskTip("��n D� Tr� L�m t�m Tr��ng M�n S�ch th�t l�c.");
            CreateTrigger(0, 502, 92);  --��ɱҰ����
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

function say3()
    local szNotFinished = {
	    "Thi�n �m gi�o ngu�n g�c � Li�u C��ng. Ta �� t�ng l�n ph��ng B�c d� la t�nh h�nh c�a ch�ng v� ghi ch�p l�i Thi�n �m gi�o t�p th�. N�o ng� tr�n ���ng quay v� Trung Nguy�n b� ng��i c�a Linh B�o s�n c��p m�t. H�y thay ta ��n �� l�y v�, ta s� k� r� cho ng��i chuy�n v� Thi�n �m gi�o!",
	    "Thi�n �m gi�o t�p th� g�m 9 trang. Thu th�p ��, ta s� k� r� cho ng��i!"
    };
    local szFinished = {
    	"Thi�n �m gi�o c� ngu�n g�c t� m�t t�n gi�o th�n b� � Li�u C��ng, gi�o ngh�a l� tin t��ng v�o v�n v�t ��u c� linh h�n, th��ng d�ng nghi th�c ca v� �� t� b�i tr�i ��t. Thi�n �m gi�o nhi�u v� l�m cao th� n�n m�y n�m nay c� th� l�c ng�y c�ng m�nh � Li�u Qu�c, nhi�u qu� t�c � Li�u Qu�c l� t�n �� c�a Thi�n �m gi�o.",
    	"Th�ng so�i t�i cao c�a Thi�n �m gi�o, d��i c� T� H�u h� ph�p gi�p gi�o ch� thi h�nh quy�t s�ch. Trong gi�o c� tam ���ng Phong- H�a- L�i ��m tr�ch c�c vi�c d� th�m t�nh b�o, nghi�n c�u v� ngh� v� th��ng ph�t c�c gi�o ��. Nh�t Nguy�t Tinh Ch�n t� ��n d�ng t� l� tr�i ��t v�n v�t. Ng��i tr�c ti�p th�ng l�nh m�y v�n bang ch�ng l� H�ng H�c Lam Ho�ng B�ch Ng� K� Ch�.",
        "Ra l� v�y! �a t� ti�n b�i ch� gi�o!"
    }
    local nStep = GetTask(TASK_TWO_TWO);
    if nStep == 0 or nStep == 1 then
        --����������
        if GetItemCount(2,0,52) >= 9 then
            DelItem(2,0,52,9);
            SetTask(TASK_TWO_TWO, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(93));
            if GetTask(TASK_TWO_ONE) == 2 and GetTask(TASK_TWO_THREE) == 2 and GetTask(TASK_TWO_FOUR) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_TWO, 1);
            Msg2Player("��n Linh B�o s�n �o�t v� Thi�n �m gi�o t�p th�!");
            TaskTip("��n Linh B�o s�n �o�t v� Thi�n �m gi�o t�p th�!");
            CreateTrigger(0, 503, 93);  --��ɱ�鱦ɽ
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

function say4()
    local szNotFinished = {
    	"Xi H�a gi�o kh�i ngu�n t� ph�a Nam ��i L�, c� t�p t�c l� th��ng. Gi�o ngh�a Xi H�a gi�o c�ng r�t k� l�. Ta �� ��n � M�ng B� � Nam C��ng d� la tin t�c c�a Xi H�a gi�o, ghi ch�p trong Xi H�a gi�o d�n t�c nh�ng ng��i � M�ng B� s� ti�t l� ra ngo�i s� g�y b�t l�i cho h�, kh�ng cho ph�p ta mang s�ch ra kh�i Nam C��ng. H�y gi�p ta l�y n� v�, ta s� n�i r� chuy�n Xi H�a gi�o cho ng��i bi�t!",
    	"Xi H�a gi�o d�n t�c g�m 9 trang. Thu th�p ��, ta s� n�i r� cho ng��i bi�t!"
    };
    local szFinished = {
    	"Xi H�a gi�o kh�i ngu�n t� ph�a Nam ��i L�, c� t�p t�c l� th��ng. Gi�o ngh�a Xi H�a gi�o c�ng r�t k� l�. Xi V�u l� v� th�n ���c t�n k�nh nh�t c�a Xi H�a gi�o. V� th�, Xi H�a gi�o c� th�m th� s�u s�c v�i con ch�u Hu�nh �� ta.",
    	"Xi H�a gi�o gi�o ch� t� x�ng l� Xi V�u ch� t�, l� l�nh t� tinh th�n tuy�t ��i c�a Xi H�a gi�o. D��i gi�o ch� c� Ch�c Dung t� s� v� C�ng C�ng t� s� ��m tr�ch t� b�i H�a Th�n v� Th�y Th�n, c�u Th�y H�a t��ng t�. Ngo�i ra c�n c� Ng� H�nh ph�p s�, n�m v� ng� h�nh t��ng sinh t��ng kh�c, v�n v�t ���c sinh s�i n�y n�. Hi�n � ��i L� c� nhi�u ho�t ��ng c�a Xi H�a gi�o gi�o ��, d��ng nh� ng�m l�t �� ngai v� Ti�n V��ng T� ��i L�.",
        "Ra l� v�y! �a t� ti�n b�i ch� gi�o!"
    };
    local nStep = GetTask(TASK_TWO_THREE);
    if nStep == 0 or nStep == 1 then
        --�������
        if GetItemCount(2,0,53) >= 9 then
            DelItem(2,0,53,9);
            SetTask(TASK_TWO_THREE, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(94));
            if GetTask(TASK_TWO_ONE) == 2 and GetTask(TASK_TWO_TWO) == 2 and GetTask(TASK_TWO_FOUR) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_THREE, 1);
            Msg2Player("��n � M�ng B� �o�t v� s�ch Xi H�a gi�o d�n t�c!");
            TaskTip("��n � M�ng B� �o�t v� s�ch Xi H�a gi�o d�n t�c!");
            CreateTrigger(0, 504, 94);  --��ɱ���˲�
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

function say5()
    local szNotFinished = {
	    "Nh�t Ph�m ���ng l� t� ch�c th�n b� � T�y H�. Trong m�n ph�i c� nhi�u cao th�. Khi ta tr� t�i M� Tuy�t s�n trang t�ng c�ng trang ch� b�n v� chuy�n c�a Nh�t Ph�m ���ng v� �� ghi ch�p l�i trong Nh�t Ph�m ���ng b� s�. N�o ng� M� Tuy�t s�n trang c�u k�t v�i ng��i T�y H�, thu gi� th� t�ch c�a ta trong s�n trang. H�y gi�p ta l�y th� t�ch v�, ta s� k� r� chuy�n Nh�t Ph�m ���ng cho ng��i bi�t!",
	    "Nh�t Ph�m ���ng b� s� g�m 9 trang. Thu th�p ��, ta s� n�i r� cho ng��i nghe!"
    };
    local szFinished = {
        "Nh�t Ph�m ���ng do T�y h� chinh ��ng ��i t��ng qu�n X�ch Li�n Thi�t Th� s�ng l�p. �� t�ng c��ng qu�n l�c cho T�y H�, X�ch Li�n Thi�t Th� �� chi�u m� nhi�u v� l�m d� s� gia nh�p Nh�t Ph�m ���ng, kh�ng ph�n bi�t xu�t th�n ch� xem v� ngh� m�nh y�u, n�n �� thu ph�c ���c l�ng ng��i. Nh�ng c�ng v� th�, Nh�t Ph�m ���ng �� thu nh�n nhi�u nh�n s� v� l�m v� ngh� cao c��ng nh�ng nh�n ph�m b�t h�o. T� ��, v� l�m ch�nh ��o lu�n xem th��ng Nh�t Ph�m ���ng!",
        "X�ch Li�n Thi�t Th� l� ���ng ch� c�a Nh�t Ph�m ���ng. Th�nh vi�n h�u h�t l� qu�n ��i c�a T�y H�. Nh�t Ph�m ���ng hi�n c� 4 v� ���c x�ng l� T� ��i Thi�n V��ng, v� c�ng cao c��ng nh�ng ra tay �c ��c. Ngo�i ra c�n c� Th�p ��i Kim Cang, m�i ng��i th�ng so�i m�t ��i qu�n, g�y uy hi�p nhi�u cho bi�n ph�ng c�a ��i T�ng. B�ng h�u h�nh hi�p giang h�, g�p b�n ng��i n�y nh�t m�c ph�i c�n th�n!",
        "Ra l� v�y! �a t� ti�n b�i ch� gi�o!"
    };
    local nStep = GetTask(TASK_TWO_FOUR);
    if nStep == 0 or nStep == 1 then
        --һƷ������
        if GetItemCount(2,0,54) >= 9 then
            DelItem(2,0,54,9);
            SetTask(TASK_TWO_FOUR, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(95));
            if GetTask(TASK_TWO_ONE) == 2 and GetTask(TASK_TWO_TWO) == 2 and GetTask(TASK_TWO_THREE) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_FOUR, 1);
            Msg2Player("��n M� Tuy�t s�n trang �o�t v� Nh�t Ph�m ���ng b� s�!");
            TaskTip("��n M� Tuy�t s�n trang �o�t v� Nh�t Ph�m ���ng b� s�!");
            CreateTrigger(0, 505, 95);  --��ɱĺѩɽׯ
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;


-- ȷ���������񣬿�ʼ�ش�����
function ConfirmQuestion()
	do
		Talk(1,"",QA_TitleText.."V� "..GetPlayerSex().."C� th� �� v�i h�c th�c uy�n b�c c�a l�o phu, qu� nhi�n h�u sinh kh� �y!");
		return 0;
	end;
	
	if GetStamina()<=QA_MINSTAMINA + 1 then
		Say(QA_TitleText.."V� "..GetPlayerSex().."tr�ng c� v� m�t m�i? Chi b�ng ngh� ng�i <color=yellow>b� sung ch�t th� l�c<color> r�i ��n!",0);
		return
	end;

	SetTask(QA_STATE, 1); -- ����״̬Ϊ�Ѿ���ʼ�ش�����
--	SetTask(QA_RANDOMSEED, tonumber(date("%y%m%d%H%M%S"))); -- ��¼�������
	CreateQuestion();
	return
end;

-- ��һ������ش����ȷʱ
function AnswerRight()


	if GetTask(QA_FINISHNUM)+ 1 >= 10 then
		SetTask(QA_RIGHTSTATE, GetTask(QA_RIGHTSTATE) + 1); -- �����ش���ȷ�Ĵ����� 1
		FinishQuestion();
	else
		SetTask(QA_FINISHNUM, GetTask(QA_FINISHNUM) + 1); -- �����ش�Ĵ����� 1
		SetTask(QA_RIGHTSTATE, GetTask(QA_RIGHTSTATE) + 1); -- �����ش���ȷ�Ĵ����� 1
		AnswerNext(1);
	end;
	
end;

-- ��һ������ش�ô���ʱ
function AnswerError()

	if GetTask(QA_FINISHNUM)+ 1 >= 10 then
		FinishQuestion();
	else
		SetTask(QA_FINISHNUM, GetTask(QA_FINISHNUM) + 1); -- �����ش�Ĵ����� 1
		AnswerNext(2);
	end;
	
end;


-- ѡ�������һ���Ĺ��̣����Ҹ�����һش���ȷ���ߴ���
function AnswerNext(nCheck)
	
	if nCheck==1 then
		Talk(1, "CreateQuestion", QA_TitleText.."Hay l�m! Ng��i �� tr� l�i ��ng! H�y tr� l�i c�u h�i ti�p theo!");
	elseif nCheck==2 then
		Talk(1, "CreateQuestion", QA_TitleText.."Ha ha!�Sai r�i! H�y c� g�ng h�c h�i th�m! Nh�ng kh�ng sao! H�y nghe c�u h�i ti�p theo!");
	end;
end;


-- ȫ����ȷ�ش��� 10 ������ʱ�Ĵ�����
function FinishQuestion()

local nPay, nTimes = GiveAward(); -- �ɷ�����
	
	if nPay ~= 0 then
		Say(QA_TitleText.."Ng��i �� ��p ��ng "..nTimes.."  c�u h�i c�a ta, ��y l� ph�n th��ng  "..nPay.." ti�n ��ng c�a ng��i. Hy v�ng sau n�y ng��i c� th� hi�u bi�t th�m v� th� gi�i xung quanh!",0);
	else
		Say(QA_TitleText.."Ng��i ch�a ��p ��ng c�u h�i n�o c�a ta! H�y c� g�ng trau d�i ki�n th�c!",0);
	end;
	
	SetTask(QA_FINISHNUM, 0); -- �������ش�Ĵ������
	SetTask(QA_RIGHTSTATE, 0); -- ����ȷ�ش�����Ĵ������
	SetTask(QA_STATE, 0); -- ����״̬Ϊ��û��ʼ�ش�����
end;

-- ����ҷ��轱��
function GiveAward()

local nTimes = GetTask(QA_RIGHTSTATE);
local nPay = 0;

	PayStamina(QA_PAYSTAMINA); -- �۳���ҵ�����ֵ

	if nTimes>=10 then -- ��� 10 ��ȫ���ش���ȷ�Ļ���ȫ���
		nPay = 130;
		Earn(nPay);
		return nPay, nTimes;
	else
		nPay = nTimes * 10; -- ÿ�ش���ȷһ������� 10 ��Ǯ
		Earn(nPay);
		return nPay, nTimes;
	end;
	
end;

-- ����������ֵ�Ƿ��㹻
function CheckStamina()

	
end;

-- ʲôҲ��������˳�����
function MainExit()

end;

--��ȡ������40������1
function task_100_00()

local strTalk = {
	"Ng��i mu�n bi�t g� v� ��i L�?",
	"V�n b�i mu�n h�i {L�c ��i gia t�c}.",
	"��ng l� ��i L� c� 6 t�c l�n ���c g�i {L�c ��i gia t�c} g�m Tr�nh gia, D��ng gia, Tri�u gia, ��ng gia, Cao gia v� �o�n gia.",
	"{�o�n gia}!?",
	"��ng! �o�n gia l� ho�ng t�c c�a ��i L�. H�n n�a kh�ng nh� c�c gia t�c kh�c �o�n gia kh�ng th� tr� v�ng ���c.",
	"Cho h�i {L�c ��i gia t�c} h�nh th�nh nh� th� n�o? C� quan h� ra sao?"
	}
	TalkEx("task_100_10",strTalk);
	return
end

--��ȡ������40������2
function task_100_10()

local strTalk = {	
	"��i L� ban ��u c� t�n Nam Chi�u Qu�c l� thu�c ��a nh� ���ng. Cu�i nh� ���ng Nam Chi�u Qu�c suy y�u. Gian th�n Tr�nh M�i T� nh�n c� h�i �o�t ng�i vua th�nh l�p ��i Tr��ng H�a Qu�c, v� sau b� c�c qu� t�c nh� Tri�u Thi�n Ch�nh, D��ng Can Trinh v� �o�n T� B�nh thay phi�n ��o ch�nh, trong th�i gian ng�n thay ��i nhi�u qu�c hi�u. Cu�i c�ng �o�n T� B�nh th�nh l�p n��c ��i L�, �n ��nh c�c th� l�c kh�c h�nh th�nh 4 v�ng t�c l�n g�m: Tr�nh, Tri�u, D��ng, �o�n.",
	"C�n {Cao gia} v� {��ng gia} th� sao?",
	}
	TalkEx("task_100_11",strTalk);
	return
end

function task_100_11()

local strTalk = {
	"{Cao gia} v� {��ng gia} ��u l� gia t�c m�i k� t� khi ��i L� th�nh l�p. Hi�n th� l�c c�a ��ng gia m�nh h�n, qu�c s� ���ng tri�u l� ��ng Gi� La thu�c gia t�c h� ��ng. Hai th� l�c lu�n ng�m ng�m tranh gi�nh l�n nhau.",
	"Th� ra l� v�y!",
	"N�i L�c ��i gia t�c nh�ng th�c t� ��i L� ch� c�n 5 gia t�c th�i!"
	}
	TalkEx("task_100_20",strTalk);
	return
end

--��ȡ������40������3
function task_100_20()

local strTalk = {	
	"Sao l� v�y?",
	"Tr��c khi ��i L� th�nh l�p, c�c th� l�c lu�n tranh gi�nh ch�m gi�t l�n nhau, trong �� gia t�c Tr�nh th� b� di�t vong tr��c. V� v�y, tr�n th�c t� Tr�nh gia kh�ng c�n t�n t�i.",
	"Hi�n {Xi H�a gi�o} �ang g�y r�i � {��i L�}, nghe n�i li�n quan ��n vi�c ho�ng �� m�i l�n ng�i. Kh�ng bi�t ti�n b�i c� nghe tin ch�a?",
	"��m ng��i Xi H�a gi�o c� nghe qua nh�ng hi�n ��i L� thay ��i v��ng tri�u n�n ta c�ng kh�ng r�. Ng��i th� ��n Bi�n Kinh h�i Tri�u Di�n Ni�n xem!",
	"�a t� ti�n b�i!",
}
	TalkEx("",strTalk);
	CreateTrigger(4,200,Talk_DL_ZHAOYANNIAN);--����������������Ի�������
	Msg2Player("��n Bi�n Kinh h�i Tri�u Di�n Ni�n v� vi�c ho�ng �� m�i l�n ng�i");
	TaskTip("��n Bi�n Kinh h�i Tri�u Di�n Ni�n v� vi�c ho�ng �� m�i l�n ng�i");
	SetTask(TASK_DL_LV35_ID,4);--ɾ������ɽ�����Ϣ
	SetTask(TASK_DL_LV40_ID,1);
	GivePlayerAward("Level_40","xn_step_1");
	GivePlayerExp(SkeyDali,"baixiaosheng")
	return
end

--������40������,δ��������Ի�
function task_100_01()

local strTalk = {
	"Tri�u Di�n Ni�n n�m r� t�nh h�nh ho�ng t�c c�c n��c, ng��i �i h�i h�n th� xem, h�n � Bi�n Kinh.",
	"�a t� ti�n b�i!",
	}
	
	TalkEx("",strTalk);
	
	if GetTrigger(Talk_DL_ZHAOYANNIAN) == 0 then
		CreateTrigger(4,200,Talk_DL_ZHAOYANNIAN);--����������������Ի�������
		Msg2Player("��n Bi�n Kinh h�i Tri�u Di�n Ni�n v� vi�c ho�ng �� m�i l�n ng�i");
		TaskTip("��n Bi�n Kinh h�i Tri�u Di�n Ni�n v� vi�c ho�ng �� m�i l�n ng�i");
	end;
	return
end