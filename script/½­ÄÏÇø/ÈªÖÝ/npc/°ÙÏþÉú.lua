
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

-- �ӱ���ļ��ж�ȡÿ�������Ȩ���γ�һ������
CreateRateArry();

-- ˵��TASK_TWO������״̬��20000��ʾstep2�������4λ�ֱ�����Ƿ������4�����˽������
-- ���һ���˽�����ݣ�����4λ�еĶ�Ӧλ����Ϊ1

function task_002_00()
    local szSay = {
        "Ta ch�nh l� k� t�c tr� �a m�u B�ch Hi�u Sinh! Ng��i t�m ta c� g� kh�ng?",
        "T�i h� mu�n th�nh gi�o ki�n th�c v� l�m!/wl_story",
        --"�����������һ���й����ֵ�ѧʶ��/ConfirmQuestion"
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

-- ��ڴ�����
function main()
--����������Ĵ���
    
    local nStep = 0;
    local szTalk = {
        "Ng��i l�i quay l�i �? C� chuy�n g� kh�ng?",
        "V�n b�i g�p ph�i v�i chuy�n v� {Tr��ng Ca M�n} n�n ��n th�nh gi�o ti�n sinh!",
        "Ng��i c�ng bi�t chuy�n Tr��ng Ca M�n sao? G� Tri�u Di�n Ni�n qu� th�t nhi�u chuy�n nh�ng xem nh� ng��i c� duy�n v�i chuy�n Tr��ng Ca M�n. M�y n�m nay ta l�n l�n ch�n giang h�, bi�t ���c nhi�u th� t�ch qu� hi�m th�t l�c � kh�p n�i nh�ng ta kh�ng bi�t ch�nh x�c � n�i n�o. Xin ��ng o�n h�n ta!"
    };
    local szSay = {
        "Ta ch�nh l� k� t�c tr� �a m�u B�ch Hi�u Sinh! Ng��i t�m ta c� g� kh�ng?",
        "Mu�n th�nh gi�o chuy�n v� v� l�m truy�n thuy�t!/wl_story",
        --"�����������һ���й����ֵ�ѧʶ��/ConfirmQuestion"
    };

    nStep = GetTask(TASK_TWO);
    
    if nStep == 1 then
        TalkEx("task_002_00", szTalk);
        return
    elseif nStep == 2 then
        SelectSay(szSay);
        return
    end;
    
-- ��������Ĵ���
local nState = TE_GetTeachState();

if (nState==18) then
	task_018_00();
	return
end;

Say("Ta l� ��nh ��nh ��i danh tr�n giang h� V�n S� Th�ng B�ch Hi�u Sinh, th�c l�c c�a T�ng Ki�m s�n trang n�o l�t kh�i m�t ta!",0);

end;

-- ȷ���������񣬿�ʼ�ش�����
function ConfirmQuestion()

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

--	SetTask(QA_RANDOMSEED, tonumber(date("%y%m%d%H%M%S"))); -- ��¼�������

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