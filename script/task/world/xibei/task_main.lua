-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ������������̴����ļ�
-- By StarryNight
-- 2007/06/06 AM 10:51

-- ����ֻ�г�Ĭ�Ĵ��ڣ�û�п��Է�����δ��

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\xibei\\xibei_task_award.lua");

--�����������ӡ������
KULOUWANG_CURSE = {
	[1] = "Nh�t vi�t thi�n chi, nh� vi�t ��a chi, tam vi�t nh�n chi; t� ph��ng th��ng h�, t� h�u ti�n h�u, xu�t y�u y�u, nh�p minh minh, h� th�n b�t ph�c, h� qu� c�m ���ng.",
	[2] = "Nh�t vi�t tr��ng m�c, nh� vi�t phi nh�, tam vi�t th� minh; thi�n l� chi ngo�i, �n vi chi trung, thi�n ��o t�t, nh�t nguy�t c�u, ti�n s�t �c qu�, h�u tr�m d� quang.",
	[3] = "Nh�t vi�t m�c minh, nh� vi�t nh� th�ng, tam vi�t t�m tr�; t� ph� l�c gi�p, h�u v� l�c �inh, th��ng thi�n qu�, h� ��a s�t, gian t� h�a kh�, qu� t�c ti�u vong."
	}

--��ӡ����ԭ�͵�����
HUANXIANG_CURSE = {
	[1] = "D��ng ��ng nhi h�nh, �m ch� nhi t�ng; d� d��ng ��ng gi�, ��c t��ng sinh d�. �m d��ng chi l�c ��i kh�, b�t ��c c�u ��nh.",
	[2] = "D��ng ��ng nhi xu�t, �m �n nhi nh�p; d� �m t�nh gi�, h�nh t��ng th�nh d�. D� �m d��ng th� chi, ch� chi d� xu�t nh�p.",
	[3] = "D��ng vi�n chung �m, �m c�c ph�n d��ng; d� d��ng c�u �m, b�o d� ��c d�. D� �m k�t d��ng, thi d� l�c thu chi."
	}

--��������ƺ�
--[��Ӧ�����ñ���id] = {"�ƺ�����",��Ӧ����,��Ӧ����ֵ
YIPINGTANG_TITLE = {
	[1] = {"Nh�t Ph�m ���ng-T�n B�",2030,17},
	[2] = {"Nh�t Ph�m ���ng-Th�ch Kh�ch",2030,34},
	[3] = {"Nh�t Ph�m ���ng-Phi H�",2031,9},
	[4] = {"Nh�t Ph�m ���ng-H� D�c",2031,23},
	[5] = {"Nh�t Ph�m ���ng-V� V�",2031,52},
	[6] = {"Nh�t Ph�m ���ng-Gian T�",2031,61},
	[7] = {"�i�p �nh k� hi�p",2031,68},
	}

---------------------------------- ������01���İ�ӿ----------------------------------

--����׼����ȡ��������01���İ�ӿ������
function task_001_01_0()

local strTalk = {
		"G�n ��y ta nh�n ���c tin b�o, T�y H� �ang li�n h� m�t thi�t v�i n��c Li�u. T�y H� nh� s�ch l��c v�n tr� v� c�ng c�a L� Nguy�n H�o ng�y m�t l�n m�nh, tuy ngo�i m�t th�n ph�c ��i T�ng, nh�ng s� th�t �� ba n��c T�ng, Li�u, T�y H� �� h�nh th�nh th� ki�ng ba ch�n. T�y H� tr��c nay h�nh s� c�n tr�ng, l�n n�y d�m c�ng nhi�n li�n h� v�i n��c Li�u, e s� b�t l�i cho ��i T�ng ta.",
		"T�y H� d�m ng� giang s�n ��i T�ng chuy�n �� ai c�ng bi�t, nh�ng ��ng th�i c�ng r�t nghi ng�i n��c Li�u. N�u b�t tay nhau th� T�y H� ���c l�i g� ch�?",
		"T�y H� c�ng hi�u r� ��o l� m�i h� r�ng l�nh, n�n �� �m th�m �i�u ��ng th�nh vi�n Nh�t Ph�m ���ng � Trung Nguy�n ��i ph� v�i ��i T�ng. N�u chi�m ���c Trung Nguy�n l�m c�n c�, T�y H� s� �� s�c ��i kh�ng v�i n��c Li�u.",
		"N�i v�y, T�y H� mu�n m��n tay n��c Li�u �� chi�m l�nh th� ��i T�ng?",
		}

	TalkEx("task_001_01_0_1",strTalk);

end;

--���Ի�
function task_001_01_0_1()

local strTalk = {
	"R�t c� th�. � T�y H� ph�a t�y H� T�y T�u Lang l� v�ng hoang m�c r�ng l�n, n�n ch�ng r�t th�m mu�n c�c m�nh ��t m�u m�. Qu�n ��i ��i T�ng hi�n �ang t�p trung chi�n l�c � Nh�n M�n Quan ��nh qu�n Li�u, mai n�y �t s� r�i v�o th� g�ng k�m, hai m�t gi�p ��ch.",
	"H�nh ��ng c�a T�y H� th�t hi�m �c, T�y H� v�n quen h�nh ��ng ng�m, nay l�i �� th�ng tin b� r� r� th� th�t ��ng nghi. Kh�u ��i nh�n, kh�ng bi�t ta c� th� gi�p ���c g� cho �ng?",
	"<sex> trung qu�n �i qu�c, l� r��ng c�t c�a ��i T�ng ta. Nh�ng ch� v�i s�c c�a m�t m�nh <sex>, e l� kh�ng �� v� c�ng r�t nguy hi�m. Tr��ng Ca M�n �t �� n�m th�ng tin v� ��ng th�i c�a T�y H�, ng��i h�y t�i g�p B�ch Hi�u Sinh � Bi�n Kinh, h�i xem Tr��ng Ca M�n c� ��ng � gi�p �i�u tra vi�c n�y. S� vi�c li�n quan ��n an nguy c�a ��i T�ng, ng��i h�y kh�i h�nh ngay.",
	"C� s� tr� gi�p c�a Tr��ng Ca M�n, ta �t s� �i�u ra r� ng�n ng�nh."
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,1);
	TaskTip("Nh�n �y th�c c�a Kh�u Chu�n, ��n Bi�n Kinh t�m B�ch Hi�u Sinh nh� gi�p ��.");
	Msg2Player("Nh�n �y th�c c�a Kh�u Chu�n, ��n Bi�n Kinh t�m B�ch Hi�u Sinh nh� gi�p ��.");

end

--�Ұ�����֮ǰ���׼�Ի�
function task_001_01_1()

local strTalk = {
	"<sex> trung qu�n �i qu�c, l� r��ng c�t c�a ��i T�ng ta. Nh�ng ch� v�i s�c c�a m�t m�nh <sex>, e l� kh�ng �� v� c�ng r�t nguy hi�m. Tr��ng Ca M�n �t �� n�m th�ng tin v� ��ng th�i c�a T�y H�, ng��i h�y t�i g�p B�ch Hi�u Sinh � Bi�n Kinh, h�i xem Tr��ng Ca M�n c� ��ng � gi�p �i�u tra vi�c n�y. S� vi�c li�n quan ��n an nguy c�a ��i T�ng, ng��i h�y kh�i h�nh ngay.",
	"C� s� tr� gi�p c�a Tr��ng Ca M�n, ta �t s� �i�u ra r� ng�n ng�nh."
	}

	TalkEx("",strTalk);

end

--��������Ի�
function task_001_02_0()

local strTalk = {
	"<sex> �nh m�t ho�ng h�t... kh�ng bi�t c� chuy�n g�?",
	"T�i h� bi�t ���c th�ng tin t� Kh�u Chu�n, T�y H� g�n ��y nhi�u l�n b� m�t li�n h� v�i Li�u Qu�c, h�nh nh� d� ��nh li�n minh x�m l��c T�ng, n�u l� th�t th� ��i T�ng s� b� t�n c�ng t� hai ph�a, giang s�n s� g�p nguy c� trong m�t s�m m�t chi�u.",
	"Chuy�n n�y Tr��ng Ca M�n ta c�ng c� nghe qua, v� � Ph�ng T��ng d� th�m ���c c� ng��i T�y H� �ang �n n�p, T�y H� h�nh s� b� m�t th�n tr�ng, nh�ng ta c�ng kh�ng �o�n ���c ch�ng l�i �m m�u v�i Li�u Qu�c, c� � �� qu�y r�i.",
	"T�y H� l�n n�y nghi ng� b� tr�, t�i h� s� m�nh c� th� kh�ng th� �ng ph�. Kh�ng bi�t Tr��ng Ca M�n c� th� gi�p �� �i�u tra kh�ng?",
	"��i T�ng g�p n�n, Tr��ng Ca M�n ta l� n�o l�i ng�i y�n sao? <sex> l�ng ��y nhi�t huy�t, anh h�ng thi�u n�n, b�ch Hi�u Sinh ta r�t ng��ng m�, thi�u hi�p an t�m, Tr��ng Ca M�n ta nh�t ��nh s� gi�p. �u D��ng H�a �ang � Ph�ng T��ng, <sex> mang ch� th� c�a ta ��n ch� �ng ta, �� �u D��ng H�a l�p t�c b�t ��u �i�u tra chuy�n n�y, s� kh�ng c� sai s�t.",
	"�a t� B�ch Hi�u Sinh ti�n b�i, t�i h� l�n ���ng ��y."
	}

	SetTask(TASK_XB_ID,2);
	TalkEx("",strTalk);
	TaskTip("B�ch Hi�u Sinh nh� b�n mang ch� th� c�a Tr��ng Ca M�n ��n cho �u D��ng H�a � Ph�ng T��ng.");
	Msg2Player("B�ch Hi�u Sinh nh� b�n mang ch� th� c�a Tr��ng Ca M�n ��n cho �u D��ng H�a � Ph�ng T��ng.");
	GivePlayerAward("Award_XB_01","Easy");
	GivePlayerExp(SkeyXibei,"xixiafengbo")
end

--��ŷ�����Ի�ǰ��������Ի�
function task_001_02_1()

local strTalk = {
	"�u D��ng H�a �ang � Ph�ng T��ng, mau �i t�m �ng ta."
	}

	TalkEx("",strTalk);

end

--��ŷ�����Ի���æȡŮװ�·�
function task_001_03_0()

local strTalk = {
	"Xem tranh m� n� c�a ta. <sex> c� th�y tuy�t v�i kh�ng, c� th� l� si�u ph�m kh�ng?",
	"Ph�i�ph�i�th�t l� ��p�.",
	"Ha ha ha, tuy�t tuy�t, xem ra <sex> l� ng��i hi�u tranh, �u D��ng H�a ta b�nh sinh gh�t nh�t l� ng��i kh�ng hi�u tranh! Ta lu�n ��a thi�u n� T�ng v�o tranh, thi�u n� ��i T�ng nh� nh�n d�u d�ng, v�o trong tranh l�i c�ng quy�n r�",
	"�u D��ng ti�n b�i n�i c� l�.(H�a ra �ng ta ch�nh l� �u D��ng H�a�.) ��ng r�i ti�n b�i�.",
	"Kh�ng sai kh�ng sai, l�n n�y ta ��n T�y V�c, mu�n t�m hi�u v� phong t�nh c�a m� n� T�y V�c. Nghe n�i thi�u n� T�y V�c t�nh kh� n�ng n�y, n�u ��a h� v�o tranh, e r�ng c�ng kh�ng ��t ���c � mu�n. Nh�ng v� kh�ng th� hi�n ���c, th� kh�ng ph�i ��ng ti�c sao?",
	"(�u D��ng H�a�.��ng l� k� danh th�ch v�) ti�n b�i�..",
	}


	SetTask(TASK_XB_ID,3);
	TalkEx("task_001_03_0_1",strTalk);
	TaskTip("��n B�c Ph�ng T��ng l�y m�t b� y ph�c t� ng��i ��n b� T�y V�c v� ng��i ��p Ba T�. ");
	Msg2Player("��n B�c Ph�ng T��ng l�y m�t b� y ph�c t� ng��i ��n b� T�y V�c v� ng��i ��p Ba T�. ");
	CreateTrigger(0,1220,KILL_XB_BOSIYAOJI);
	CreateTrigger(0,1221,KILL_XB_XIYUHANFU);
	GivePlayerExp(SkeyXibei,"fengxiang")
end

-- ���Ի�
function task_001_03_0_1()

local strTalk = {
	"�, c� c�ch r�i. Hi�n gi� tuy kh�ng c� ng��i th�t, nh�ng ph�c s�c c�a thi�u n� T�y V�c di�m d�a phong t�nh, m�u s�c ��c ��o, ���c xem m�t l�n th� phong c�ch t� nhi�n s� ���c l�ng v�o tranh, v�y c�ng th�a l�ng.",
	"Nh�ng ti�n b�i�..",
	"<sex> l� ng��i hi�u tranh, ph�i bi�t r�ng c�m x�c lu�n d�ng tr�o. Ch�ng ta chia nhau l�m, ta �i m�i m�c, ng��i ��n ph�a B�c th�nh l�y b� y ph�c c�a ng��i ��p Ba T� v� ng��i ��n b� T�y V�c, ta s� v� n�n b�c tranh giai nh�n tuy�t ��p. ",
	"V�y��",
	"Mau �i �i, c�m x�c s� tan bi�n m�t, c� th� ��a thi�u n� T�y V�c v�o tranh l� m�t ni�m vui ��i v�i ta.",
	"� (xem ra ch� c�n th�a m�n ni�m ao ��c c�a �ng ta ��, r�i t�nh sau)",
	}

	TalkEx("",strTalk);

end

--���ػ�δ����Ůװ��ŷ����
function task_001_04_0()

local strTalk = {};

	--����Ůװ
	if GetItemCount(2,0,686) >= 1 and GetItemCount(2,0,687) >= 1 then
		strTalk = {
			"�u D��ng ti�n b�i, ��y l� �� �ng c�n.",
			"Tuy�t, thi�u n� T�y V�c qu� nhi�n l� kh�c v�i thi�u n� Trung nguy�n, th� hi�n ���c v� ��p, c� � ngh�a c� � ngh�a. �, ��ng r�i, <sex> t�m ta c� vi�c g�?",
			"(Cu�i c�ng c�ng nh� ��n ta) Ti�n b�i c� ph�i l� ng��i c�a Tr��ng Ca M�n? C� ph�t hi�n h�nh tung g�n ��y c�a T�y H� kh�ng?",
			"Kh�ng sai, ta l� �u D��ng H�a m�t trong nh�ng c�m, k�, thi, h�a c�a Tr��ng Ca M�n, <sex> l�m sao bi�t ���c? G�n ��y ta c�ng ph�t hi�n s� xu�t hi�n c�a ng��i T�y H� � Long M�n tr�n ng�y c�ng nhi�u.",
			"Qu� nhi�n l� v�y. T�i c�n bi�t T�y H� b� m�t li�n h� v�i Li�u Qu�c, s� qu�y r�i ��n ��i T�ng ta, B�ch Hi�u Sinh ti�n b�i nh� �ng �i�u tra chuy�n n�y, ��y l� th� ch� th� c�a qu� m�n ph�i.",
			"(xem xong th�) �i d�, chuy�n ��i s� n�y li�n quan ��n giang s�n x� t�c c�a ��i T�ng, sao ng��i kh�ng n�i s�m?",
			"�.V�n b�i mu�n n�i s�m, nh�ng ti�n b�i l�i g�p r�t v� tranh.",
			}
		TalkEx("task_001_04_0_1",strTalk);

	--û�д���Ůװ���������񴥷���
	else
		strTalk = {
			"Ng��i ��p Ba T� v� ng��i ��n b� T�y V�c � B�c Ph�ng T��ng, gi�p ta l�y b� y ph�c c�a h�, ta �i m�i m�c."
			}
		if	GetTrigger(KILL_XB_BOSIYAOJI) == 0 or GetTrigger(KILL_XB_XIYUHANFU) == 0 then
			CreateTrigger(0,1220,KILL_XB_BOSIYAOJI);
			CreateTrigger(0,1221,KILL_XB_XIYUHANFU);
			TaskTip("��n B�c Ph�ng T��ng l�y m�t b� y ph�c t� ng��i ��n b� T�y V�c v� ng��i ��p Ba T�. ");
			Msg2Player("��n B�c Ph�ng T��ng l�y m�t b� y ph�c t� ng��i ��n b� T�y V�c v� ng��i ��p Ba T�. ");
		end

		TalkEx("",strTalk);
	end
end

-- ���Ի�
function task_001_04_0_1()

local strTalk = {
	"Chuy�n g�p v�y, c�n v� tranh �? <sex> g�c v� tranh qua m�t b�n, ��i l�m xong chuy�n n�y ��, ta s� c�ng v�i ng��i th��ng l�m. ",
	"Ph�i, ph�i�theo l�i ti�n b�i, h�nh nh� ng��i T�y H� t� t�p � g�n Long M�n tr�n?",
	"Kh�ng sai, g�n Long M�n tr�n g�n ��y c� s� xu�t hi�n c�a ng��i T�y H�, ta nghi ng� l� Nh�t Ph�m ���ng M�t S� �ang ho�t ��ng. T�y H� h�nh s� r�t b� m�t, Nh�t Ph�m ���ng c�ng �� h�n qu�i ��n, b�t ng� xu�t hi�n � Long M�n tr�n, nh�t ��nh l� c� �m m�u.",
	"Ch�nh x�c l� v�y, tuy T�y H� l�n n�y h�nh ��ng v�i t�c phong h�c ��o, nh�ng �m m�u li�n k�t v�i Li�u Qu�c �� b� l�, qu� th�t khi�n ng��i ta ph�i lo ngh�. T�i mu�n �i Long M�n tr�n th�m d� m�t chuy�n. Ti�n b�i c� th� cho t�i bi�t Long M�n tr�n � ��u kh�ng?",
	"L�ng y�u n��c c�a <sex> v� l�ng y�u h�i h�a c�a ta l� nh� nhau, tuy�t l�m. Long M�n tr�n l� m�t th� tr�n nh� � ph�a T�y, ra kh�i T�y th�nh l� th�y, ph�i c�n th�n, ta ��i tin nh�!",
	}

	TalkEx("",strTalk);
	DelItem(2,0,686,1);
	DelItem(2,0,687,1);
	RemoveTrigger(GetTrigger(KILL_XB_BOSIYAOJI));
	RemoveTrigger(GetTrigger(KILL_XB_XIYUHANFU));
	SetTask(TASK_XB_ID,4);
	CreateTrigger(0,1222,KILL_XB_YIPINTANGMISHI);
	TaskTip("��n Long M�n tr�n �i�u tra xem c� h�nh tung c�a nh�n s� Nh�t Ph�m ���ng kh�ng, xem c� th� thu ���c ch�ng c� n�o kh�ng.");
	Msg2Player("��n Long M�n tr�n �i�u tra xem c� h�nh tung c�a nh�n s� Nh�t Ph�m ���ng kh�ng, xem c� th� thu ���c ch�ng c� n�o kh�ng.");
	GivePlayerAward("Award_XB_02","Easy");
	GivePlayerExp(SkeyXibei,"bosihua")
end

--���ػ�δ����һƷ�����Ƹ�ŷ����
function task_001_05_0()

local strTalk = {};

	--����һƷ������
	if GetItemCount(2,0,688) >= 1 then
		strTalk = {
			"Ho�ng Sa c�ng c� th� ��i ���c v�ng, ti�n b�i, t�i h� �� t�m ���c Nh�t Ph�m ���ng l�nh b�i tr�n ng��i h�.",
			"Kh�ng ngo�i d� ki�n, qu� th�c l� ng��i c�a T�y H� Nh�t Ph�m ���ng, Nh�t Ph�m ���ng M�t S� chuy�n thu th�p t�nh b�o trong �m th�m. T�y H� th� �o�n gian x�o, h�nh tung b� �n, l�n n�y l�i �i�u ��ng Nh�t Ph�m ���ng tr� tr�n Long M�n tr�n, ngo�i l�n g�p Li�u Qu�c ra ch� e c�n c� �n t�nh kh�c.",
			"� ti�n b�i T�y H� l�n g�p Li�u Qu�c ch� l� c�i c�? Trong �� c�n c� �m m�u kh�c?",
			"�� ch� l� d� �o�n ban ��u, Nh�t Ph�m ���ng v�n l� c� c�u gi�n �i�p ��c bi�t c�a T�y H�, tr��c �� �� tr� tr�n v�o ��i T�ng �m s�t nh�n s� v� l�m v� mua chu�c quan li�u ��i T�ng, nguy h�i kh�ng th� t�nh h�t. L�n g�p Li�u Qu�c e c�ng l� s� th�t.",
			"T�y H� Nh�t Ph�m ���ng g�y h�a v� l�m, t� l�u �� l� ��i ��ch c�a v� l�m. Ch�ng hay Nh�t Ph�m ���ng M�t S� �� d� th�m ���c g� ch�a?",
			"Ta c�ng mu�n t�m hi�u r�, r�t cu�c Nh�t Ph�m ���ng b�y nghi binh l� c� � g�. ��ng r�i, m�t th�m T�n Nh� Li�n ta ph�i �i hi�n � Long M�n tr�n, kh�ng bi�t h�n c� ph�t hi�n g� m�i kh�ng?",
			"V�y �� t�i h� �i Long M�n tr�n m�t chuy�n, hy v�ng c� th� thu th�p th�m tin t�c.",
			}
		TalkEx("",strTalk);
		DelItem(2,0,688,1);
		SetTask(TASK_XB_ID,5);
		TaskTip("�u D��ng H�a nh� b�n ��n Long M�n tr�n t�m m�t th�m T�n Nh� Li�n t�m hi�u h�nh ��ng Nh�t Ph�m ���ng.");
		Msg2Player("�u D��ng H�a nh� b�n ��n Long M�n tr�n t�m m�t th�m T�n Nh� Li�n t�m hi�u h�nh ��ng Nh�t Ph�m ���ng.");
	 	RemoveTrigger(GetTrigger(KILL_XB_YIPINTANGMISHI));
	 	GivePlayerAward("Award_XB_03","Easy");
	 	GivePlayerExp(SkeyXibei,"yipintang")
	--û�д���һƷ�����ƣ��������񴥷���
	else
		strTalk = {
			"Ta ng� r�ng ho�t ��ng g�n ��y � Long M�n tr�n l� Nh�t Ph�m ���ng M�t S�, ng��i �i thu th�p v�i ch�ng c�, ra kh�i T�y V�c l� c� th� th�y Long M�n tr�n, <sex> h�y c�n th�n."
			}
		if	GetTrigger(KILL_XB_YIPINTANGMISHI) == 0 then
			CreateTrigger(0,1222,KILL_XB_YIPINTANGMISHI);
			TaskTip("��n Long M�n tr�n �i�u tra xem c� h�nh tung c�a nh�n s� Nh�t Ph�m ���ng kh�ng, xem c� th� thu ���c ch�ng c� n�o kh�ng.");
			Msg2Player("��n Long M�n tr�n �i�u tra xem c� h�nh tung c�a nh�n s� Nh�t Ph�m ���ng kh�ng, xem c� th� thu ���c ch�ng c� n�o kh�ng.");
		end

		TalkEx("",strTalk);
	end

end

--δ���������ŷ�����Ի�
function task_001_05_1()

local strTalk = {
	"T�n Nh� Li�n ���c ph�i ��n qu�n tr� Long M�n � Long M�n tr�n �� thu th�p t�nh b�o, h�n nh�t ��nh c� th�m th�ng tin."
	}

	TalkEx("",strTalk);

end

---------------------------------- ������02������ջ----------------------------------

--��������Ի���ʼ����
function task_002_01_0()

local strTalk = {
	"��y c� ph�i l� T�n Nh� Li�n ti�n sinh kh�ng?",
	"(H�i r��u n�ng n�c) N�y���T�nh l� g� m� khi�n l�ng ng��i �i�n ��o..., ti�u nh�, mang th�m m�t b�nh n� nhi h�ng����",
	"Th�a ti�n sinh?",
	"(b�t t�nh nh�n s�)����",
	"�� (ph�i t�m c�ch ��nh th�c �ng ta d�y, kh�ch s�n l� n�i u�ng r��u, kh�ch say x�n l� chuy�n b�nh th��ng, ti�u nh� h�y ��a Thu�c t�nh r��u)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,6);
	TaskTip("T�m ti�u nh� mua thu�c t�nh r��u cho T�n Nh� Li�n u�ng �� t�nh r��u.");
	Msg2Player("T�m ti�u nh� mua thu�c t�nh r��u cho T�n Nh� Li�n u�ng �� t�nh r��u.");
	GivePlayerExp(SkeyXibei,"longmenkezhan")
end

--δ���С���Ի�
function task_002_01_1()

local strTalk = {
	"(say ��n b�t t�nh nh�n s�)���",
	"(Kh�ch s�n l� n�i u�ng r��u, kh�ch say x�n l� chuy�n b�nh th��ng, Ti�u nh� h�y ��a Thu�c t�nh r��u)"
	}

	TalkEx("",strTalk);

end

--���С���Ի���ȡ�Ѿ�ҩ
function task_002_02_0()

local strTalk = {
	"Kh�ch quan ngh� tr� hay �n c�m?",
	"Ta mu�n h�i ng��i c� Thu�c t�nh r��u kh�ng?",
	"C�, nh�ng th�t kh�ng may, m�y h�m tr��c �� b�n cho T�y B�c tr�ng s� r�i, n�i r�ng mu�n thi u�ng r��u.",
	"C� chuy�n n�y �? Ng��i c� bi�t ng��i say r��u kia kh�ng? �ng ta say bao l�u r�i?",
	"V� kh�ch quan �� �? D� nhi�n l� bi�t, � ��y ���c m�y ng�y r�i, u�ng r�i ng�, ng� r�i u�ng, l�n n�y v�a m�i say, B�n mua Thu�c t�nh r��u �� l�m �ng ta t�nh �? T�i th�y Thu�c t�nh r��u c�ng ph�i t�ng th�m l��ng, kho�ng 10 �i�m.",
	"Nh�ng b�y gi� ng��i kh�ng c� h�ng, c� �i t�m c�ng m�t th�i gian. V� T�y B�c tr�ng s� kia �i v� h��ng n�o?",
	"N�i l� t�p h�p t�i nam Ph�ng T��ng ph�. T�i th�y nh�ng tr�ng s� �� th�n h�nh v�m v�, s�c kh� ��ng ��ng, n�u kh�ch quanh mu�n mua thu�c, h�y ��n t�m � n�i kh�c, ��ng ch�c gi�n h�.",
	"�a t� ti�u nh� ca quan t�m, nh�ng ta ph�i xin h� �t thu�c, kh�ng ch�c h� gi�n ��u.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,7);
	CreateTrigger(0,1223,KILL_XB_XIBEIZHUANGHAN);
	TaskTip("��n ph� nam t�m T�y B�c tr�ng s� l�y 10 �i�m thu�c t�nh r��u ��a cho ti�u nh�, �� anh ta l�m T�n Nh� Li�n t�nh l�i.");
	Msg2Player("��n ph� nam t�m T�y B�c tr�ng s� l�y 10 �i�m thu�c t�nh r��u ��a cho ti�u nh�, �� anh ta l�m T�n Nh� Li�n t�nh l�i.");
	GivePlayerExp(SkeyXibei,"mizui")
end

--ȡ�û�δȡ���Ѿ�ҩ���С���Ի�
function task_002_03_0()

local strTalk = {};

	--�����Ѿ�ҩ
	if GetItemCount(2,0,689) >= 10 then
		strTalk = {
			"��ng l�, c� � ��y say x�n, n�u say ��n tr�m n�m nh� ng��i x�a, khi t�nh d�y �� b� l� m�i chuy�n! Ti�u nh� ca, h�y cho anh ta u�ng thu�c �i.",
			"���c, u�ng bao nhi�u ��y ch�c s� t�nh.",
			"����"
			}
		TalkEx("",strTalk);
		DelItem(2,0,689,10);
		SetTask(TASK_XB_ID,8);
		TaskTip("�� sai ti�u nh� cho T�n Nh� Li�n u�ng thu�c t�nh r��u, h�y xem anh ta t�nh ch�a.");
		Msg2Player("�� sai ti�u nh� cho T�n Nh� Li�n u�ng thu�c t�nh r��u, h�y xem anh ta t�nh ch�a.");
	 	RemoveTrigger(GetTrigger(KILL_XB_XIBEIZHUANGHAN));
	 	GivePlayerAward("Award_XB_04","Easy");
	 	GivePlayerExp(SkeyXibei,"xingjiuyao")
	--û�д����Ѿ�ҩ���������񴥷���
	else
		strTalk = {
			"T�y B�c tr�ng s� kia t�p h�p t�i nam Ph�ng T��ng ph�, kh�ch quan g�p h� ph�i c�n th�n."
			}
		if	GetTrigger(KILL_XB_XIBEIZHUANGHAN) == 0 then
			CreateTrigger(0,1223,KILL_XB_XIBEIZHUANGHAN);
			TaskTip("T�m ti�u nh� mua thu�c t�nh r��u cho T�n Nh� Li�n u�ng �� t�nh r��u.");
			Msg2Player("T�m ti�u nh� mua thu�c t�nh r��u cho T�n Nh� Li�n u�ng �� t�nh r��u.");
		end

		TalkEx("",strTalk);
	end

end

--�ͷ��Ѿ�ҩ����δ��������Ի�
function task_002_03_1()

local strTalk = {
	"T�i h� �� cho T�n Nh� gia u�ng thu�c t�nh r��u, ch�c c�ng �� t�nh l�i r�i, <sex> h�y �i g�p anh ta.",
	"V�t v� cho ti�u nh� ca qu�.",
	}

	TalkEx("",strTalk);

end

--�ͷ��Ѿ�ҩ����������Ի�
function task_002_04_0()

local strTalk = {
	"���i�� N� nhi h�ng, n� nhi ��p, n� nhi d�u d�ng nh� Th�p Tam Mu�i�� Th�p Tam Mu�i, Th�p Tam Mu�i, sao l�i tuy�t t�nh, khi�n ta �au l�ng��",
	"(c� v� t�nh d�y l�i l�n th�n h�n, Th�p Tam Mu�i l� ai?)",
	"Th�p Tam Mu�n��",
	"(Xem ra �� m�c b�nh t��ng t� r�i, �� v�y l�i c�n u�ng r��u, c� u�ng thu�c t�nh r��u c�ng v� �ch)",
	"Th�p Tam Mu�i, nh�n ta �i, c� ph�i ch�t v� n�ng ta c�ng cam l�ng�� Th�p Tam Mu�i �� N��c ch�y hoa tr�i, n�ng b�n t�y ta b�n ��ng��",
	"(N�i c�u n�y kh�ng bi�t bao nhi�u l�n, h�y h�i Ti�u nh� xem sao)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,9);
	TaskTip("H�y h�i ti�u nh� xem T�n Nh� Li�n b� g�.");
	Msg2Player("H�y h�i ti�u nh� xem T�n Nh� Li�n b� g�.");
end

--�ͷ��Ѿ�ҩ��δȡ�öǶ�ǰ��������Ի�
function task_002_04_1()

local strTalk = {
	"Th�p Tam Mu�i, tim ta��",
	"(N�i c�u n�y kh�ng bi�t bao nhi�u l�n, h�y h�i Ti�u nh� xem sao)",
	}

	TalkEx("",strTalk);

end

--���С���Ի�ѯ��ʮ����һ��
function task_002_05_0()

local strTalk = {
	"V� T�n kh�ch quan kia �� t�nh r�i �?",
	"T�nh ch�t ��nh, nh�ng kh�ng t�nh h�n, c� l�m nh�m kh�ng bi�t bao nhi�u l�n, �i d�o, thu�c kia kh�ng c� t�c d�ng r�i. Ng��i n�i xem anh ta �� ng��i ra l�u r�i, su�t ng�y say x�n, l� v� chuy�n g�? Th�p Tam Mu�i  anh ta n�i ��n l� ai?",
	"Kh�ch quan kh�ng bi�t r�i. Th�p Tam Mu�i anh ta n�i ��n l� Xu�n Th�p Tam N��ng ch� qu�n n�y, n�ng �y l� ��i m� nh�n n�i ti�ng t�i Long M�n tr�n, r�t xinh ��p, b�n ��n �ng trong tr�n nh�n th�y n�ng kh�ng ai kh�ng h�n si�u ph�ch l�c, ch�y n��c d�i r�ng r�ng.",
	"Ch�ng tr�ch anh h�ng nh�t ch�, th� ra l� g�p m� nh�n.",
	"��ng v�y, T�n kh�ch quan c�n kh� h�n, v�a th�y n� ch� qu�n ch�ng t�i �� m�t h�n, su�t ng�y l�i nh�i �Th�p Tam Mu�i � lu�n mi�ng, ti�c l� n�ng �y kh�ng �� m�t ��n anh ta.",
	}

	TalkEx("task_002_05_0_1",strTalk);

end

-- ���Ի�
function task_002_05_0_1()

local strTalk = {
	"�i, h�ng nhan g�y h�a. Nh� v�y xem ra anh ta �� m� Xu�n Th�p Tam N��ng ��n m� ng��i r�i.",
	"��ng v�y, t� khi g�p n� ch� qu�n c�a ch�ng t�i, anh ta ng�y n�o c�ng ��n u�ng r��u, say r�i ng�, t�nh d�y l�i u�ng, mi�ng l�c n�o c�ng l�m nh�m, kh�ng ng�m th� c�ng g�i t�n n� ch� qu�n c�a ch�ng t�i.",
	"�i, r��u t��ng t� d� u�ng kh�ng d� t�nh, ti�u nh� ca, d�ng th�m thu�c t�nh r��u n�a ���c kh�ng?",
	"Kh�ng ���c, kh�ng ���c, thu�c n�y kh�ng ���c u�ng nhi�u, t� anh t�nh l�i m�i ���c.",
	"�V�y th� th�i, �a t� ti�u nh� ca. ",
	"(Anh ta g�i t�n Xu�n Th�p Tam N��ng kh�ng th�i, xem ra l� y�u ��n ph��ng r�i, ch�c ph�i quay v� t�m �u D��ng ti�n b�i th��ng l��ng)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,10);
	TaskTip("�i h�i �u D��ng H�a, b�nh t��ng t� c�a T�n Nh� Li�n ph�i ch�a th� n�o.");
	Msg2Player("�i h�i �u D��ng H�a, b�nh t��ng t� c�a T�n Nh� Li�n ph�i ch�a th� n�o.");
	GivePlayerAward("Award_XB_05","Easy");
	GivePlayerExp(SkeyXibei,"wujikeshi")
end

--δ��ŷ�����Ի�ǰ���С���Ի�
function task_002_05_1()

local strTalk = {
	"Thu�c n�y kh�ng ���c u�ng nhi�u, kh�ng ���c u�ng n�a, h�y �� anh ta t� t�nh l�i.",
	"(Anh ta g�i t�n Xu�n Th�p Tam N��ng kh�ng th�i, xem ra l� y�u ��n ph��ng r�i, ch�c ph�i quay v� t�m �u D��ng ti�n b�i th��ng l��ng)",
	}

	TalkEx("",strTalk);

end

---------------------------------- ������03��ʮ����----------------------------------
--��ŷ�����Ի�ѯ�����ҽ�����������˼��
function task_003_01_0()

local strTalk = {
	"<sex> v� r�i, c� t�m ���c T�n Nh� Li�n kh�ng?",
	"T�m ���c T�n Nh� Li�n r�i, nh�ng anh ta say r��u ch�a t�nh l�i, nghe n�i anh ta �� m� Xu�n Th�p Tam N��ng � qu�n tr� Long m�n, nh�ng ng��i ta kh�ng ��m x�a g� ��n anh ta. Anh ta �� m�c b�nh t��ng t�, su�t ng�y m��n r��u gi�i s�u t�i kh�ch s�n. L�c ta t�m th�y, anh ta �� b�t t�nh nh�n s�, u�ng thu�c t�nh r��u r�i nh�ng c�ng v� �ch.",
	"Ai da, tham t�u s�c, l�m sao kh�ng l� vi�c cho ���c! V�i m� nh�n, ch� ���c nh�n xa kh�ng ���c nh�n g�n. T�n Nh� Li�n n�y �� r�i v�o l��i t�nh, r��u kh�ng say m� l� say ng��i, l�m g� c� thu�c l�m cho t�nh l�i?",
	"��ng v�y, c� c�ch n�o l�m anh ta t�nh l�i kh�ng?",
	"Tr� b�nh ph�i t�m ra g�c b�nh, g�c b�nh c�a T�n Nh� Li�n l� Xu�n Th�p Tam N��ng, y�u m� kh�ng ���c ��p l�i. M�c b�nh t��ng t� n�y l�m sao kh�ng h�n si�u ph�ch l�c cho ���c! Ch� c� th� b�t ��u t� ng��i ���c y�u, ng��i bi�t Xu�n Th�p Tam N��ng b�y gi� � ��u kh�ng?",
	"Ti�n b�i n�i ch� ph�i, n�u t�m ���c Th�p Tam N��ng, n�i n�ng ta g�p T�n Nh� Li�n c� ���c kh�ng?",
	}

	TalkEx("task_003_01_0_1",strTalk);

end

-- ���Ի�
function task_003_01_0_1()

local strTalk = {
	"Nh�ng nh� l�i ng��i n�i, d� c� t�m ���c Xu�n Th�p Tam N��ng, e r�ng n�ng ta c�ng kh�ng mu�n g�p T�n Nh� Li�n, n�ng ta v�n kh�ng �a T�n Nh� Li�n, t�m n�ng ta c�ng ch�ng �ch g�.",
	"Kh�ng sai, chuy�n t�nh c�m kh�ng th� mi�n c��ng. V�y n�u c� c�ch l�m cho T�n Nh� Li�n c�m th�y Xu�n Th�p Tam N��ng quan t�m ��n anh ta, kh�ng ch�ng anh ta s� t�nh l�i.",
	"��ng, ��ng, tuy kh�ng m�i ���c Xu�n Th�p Tam N��ng, n�u l�y ���c �t �� c�a n�ng ta, r�i ��a cho T�n Nh� Li�n, ch�c ch�n anh ta s� cho r�ng Xu�n Th�p Tam N��ng quan t�m ��n m�nh, anh ta s� ph�n ch�n, kh�ng c�n s�u kh� n�a, ch�c s� t�nh r��u.",
	"Nh�ng l�y �� c�a con g�i nh� ng��i ta li�u c� th�t l� kh�ng?",
	"H�, giang h� nhi n� kh�ng quan t�m chuy�n nh� nh�t, l�m sao �� � chuy�n n�y? \'x�a nay h�ng nhan th��ng g�y h�a, x�a nay anh h�ng kh�i ng��i ph�i l�y m�nh.� Nh�ng h�ng nhan ��p nh� tranh qu� l� th��ng ph�m, ��ng ti�c, ��ng ti�c.",
	}

	SetTask(TASK_XB_ID,11);
	TaskTip("Quay l�i Long M�n Tr�n t�m ti�u nh� h�i t�ng t�ch c�a b� ch� qu�n.");
	Msg2Player("Quay l�i Long M�n Tr�n t�m ti�u nh� h�i t�ng t�ch c�a b� ch� qu�n.");
	TalkEx("",strTalk);
end

--δȡ�öǶ�ǰ��ŷ�����Ի�
function task_003_01_1()

local strTalk = {
	"H�y ��n Long M�n Tr�n h�i Ti�u nh� n� ch� qu�n �i ��u. T�m ���c Xu�n Th�p Tam N��ng, l�y m�t v�t tr�n ng��i n�ng ta ��a cho T�n Nh� Li�n, c� l� anh ta s� t�nh l�i.",
	}

	TalkEx("",strTalk);

end

--ѯ�ʵ�С����ʮ����ȥ��
function task_003_02_0()

local strTalk = {
	"Ti�u nh� ca, ch� nh�n c�a ng��i ��u?",
	"N� ch� qu�n �� ��n ph�a ��n b�c Long M�n Tr�n mua h�ng, kh�ch quan t�m n�ng �y l�m g�? N�u l� v� v� kh�ch quan say r��u kia, ti�u nh�n s� r�ng B�n ph�i �� u�ng c�ng, v� ch� nh�n t�i r�t gh�t anh ta, ch�c ch�n s� kh�ng nghe B�n ��u.",
	"Ta c�ng ngh� v�y, v�y ta c� th� xin Th�p Tam N��ng �t �� cho anh ta �� anh ta t�nh l�i ���c kh�ng?",
	"Ai da, v�y kh�ch quan ph�i c�n th�n, ch� nh�n ch�ng t�i v�a ��p l�i c�n gi�i v�, nh�ng k� h�o s�c � Long M�n Tr�n  n�y ��u kh�ng d�m ch�c gi�n n�ng. N�ng ta r�t n�ng t�nh, e r�ng kh�ch quan mu�n xin �� s� ph�i ch�u kh�.",
	"H�, m� nh�n ��ng ��nh l� chuy�n b�nh th��ng, khi n�o ch� nh�n ng��i v�, h�y n�i gi�p ta.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,12);
	TaskTip("��n ph�a ��ng b�c Long M�n Tr�n t�m Xu�n Th�p Tam N��ng xin ��.");
	Msg2Player("��n ph�a ��ng b�c Long M�n Tr�n t�m Xu�n Th�p Tam N��ng xin ��.");
	GivePlayerExp(SkeyXibei,"laobanniang")
end

--δȡ�öǶ�ǰ���С���Ի�
function task_003_02_1()

local strTalk = {
	"Xu�n Th�p Tam N��ng�ang mua h�ng t�i ph�a ��ng b�c Long M�n Tr�n, n�ng ta r�t n�ng t�nh, v� c�ng cao c��ng, ph�i c�n th�n kh�ng n�n ��c t�i v�i n�ng �y."
	}

	TalkEx("",strTalk);

end

---------------------------------- ������04�б�����----------------------------------

--ȡ�öǶ�����������Ի�
function task_004_01_0()

local strTalk = {
	"��i�trong m� ta v� giai nh�n c�a ta s� ��i? Th�p Tam N��ng? ��y l� m�i h��ng c�a Th�p Tam N��ng!......Th�p Tam N��ng, n�ng v� r�i �!? (th�n ch� ch�t t�nh, nh�m d�y t�m xung quanh).",
	"Kh�ng ph�i, Th�p Tam N��ng c�n �ang l�m vi�c, nh�ng ng��i xem ��y c� ph�i l� y�m c�a n�ng �y?",
	"C�i g�? ��a ta xem n�o, m�i h��ng c�a Th�p Tam N��ng! ��y l� t�i c�a Th�p Tam N��ng! N�i mau, ng��i �� l�m g� v�i Th�p Tam N��ng? C�i �� d�m t�c nh� ng��i kia! N�i mau!? (th�n ch� t�nh h�n, t� v� hung h�n).",
	"Ai da, T�n ti�n sinh ng��i hi�u l�m r�i! ��y l� �� Th�p Tam N��ng cho ta, b�o ta chuy�n cho ng��i, n�ng �y n�i ng��i si t�nh nh� v�y, r�t ��ng �� l�m b�n. L�i nghe n�i ng��i su�t ng�y u�ng r��u t�i kh�ch s�n, m��n r��u gi�i s�u, �� d�n ta �em v�t n�y v� cho ng��i, mong ng��i ��ng l�m chuy�n h�i th�n n�a. �� n�y ng��i c� gi� l�y, khi n�o n�ng �y v� h�y tr� l�i, ti�n th� n�i r� v�i ng��i ta.",
	"�i� Th� ra l� v�y, th� l�i l�c n�y�� Th�t m�o ph�m, <sex> b� qua cho! Ph�i r�i, l�c n�y ng��i n�i Th�p Tam N��ng h�i t�m chuy�n � r�i ph�i kh�ng? Ha ha ha, ta bi�t tr�i kh�ng ph� l�ng ng��i, kh�ng u�ng c�ng ta, cu�i c�ng �� c� ���c m� nh�n! T�t t�t. ph�i r�i, kh�ng bi�t <sex> t�m ta c� chuy�n g�?",
	"(Ng��i n�y d��ng nh� �� t�nh l�i) g�n ��y T�y H� �ang l�m m�a l�m gi�, d��ng nh� mu�n g�y r�i ��i T�ng, ta xin Tr��ng Ca M�n gi�p �i�u tra chuy�n n�y, �u D��ng ti�n b�i �� ph�i ta ��n t�m ng��i.",
	}

	TalkEx("task_004_01_0_1",strTalk);

end

-- ���Ի�
function task_004_01_0_1()

local strTalk = {

	"�, th� ra �u D��ng ti�n sinh sai ng��i ��n.. <sex> y�n t�m, ng��i �� mang cho ta tin t�t nh� v�y, ta kh�ng bi�t th� th�i, bi�t th� ph�i l�m ��n c�ng. H�nh ��ng c�a T�y H� l�n n�y r�t l�n, kh�ng c�n ph�i n�i, �m m�u trong �� tuy che ���c m�t c�a nh�n s� v� l�m b�nh th��ng, nh�ng Tr��ng Ca M�n ta �� c�nh gi�c.",
	"T�n ti�n sinh d��ng nh� bi�t chuy�n, kh�ng bi�t �� t�m ���c th�ng tin g�?? Long M�n Tr�n  g�n ��y c� g� kh�c th��ng kh�ng?",
	"Nh�t c� nh�t ��ng c�a Long M�n Tr�n  l�m sau che ���c m�t ta? V�ng Long M�n Tr�n  n�y c�ch xa ho�ng ��, gi�y quan ph� kh�ng ��n ���c, th��ng c� t� nh�n tr�n ch�y, t�nh c�nh r�i ren, t��ng truy�n c�n c� nhi�u cao th� v� l�n �n c�. Theo ta Nh�t ph�m ���ng �ang �� � ��n v�ng ��t kh�ng ai coi qu�n t�p trung nhi�u k� vong m�ng n�y, b� tr� n�i �ng, gi� th� �o�n chi�u binh m�i m�. ",
	"N�i nh� v�y T�y H� kh�ng nh�ng m�u �� t�n c�ng T�ng, m� c�n �i�u ��ng nh�n t�i c�a Nh�t ph�m ���ng t�i Long M�n Tr�n �� sai khi�n, M�t s� Nh�t ph�m ���ng ho�t ��ng li�n t�c, th� ra �ang thu th�p tin t�nh b�o c�a nh�n t�i.",
	"��ng v�y, M�t s� Nh�t ph�m ���ng g�n ��y b�n t�m ki�m nh�n t�i. Kh�ng mua chu�c vong m�nh chi �� �m s�t tr�m c��p, th� l� gi�t d�y, ��ng l� �� ��c �c.",
	}

	TalkEx("task_004_01_0_2",strTalk);

end

-- ���Ի�
function task_004_01_0_2()

local strTalk = {
	"Kh�ng sai, b�n r�n ��c n�y kh�ng t� th� �o�n, ��ng l� tai h�a c�a v� l�m Trung Nguy�n ta, l�n n�y n�u Nh�t ph�m ���ng th�nh c�ng, ch�c s� h� m�a g�i gi�, ch�ng ta ph�i ra s�c ng�n c�n.",
	"�i, v�n �� l� ta kh�ng bi�t ���c h�nh tung c�a ch�ng. Mu�n ch�t ��t k� ho�ch c�a ch�ng, ph�i t�m ra k� ch� m�u l� ai",
	"Kh�ng c� ��u m�i �? Coi nh� k� ch� m�u mai danh �n t�ch, nh�ng l�n n�y Nh�t ph�m ���ng chi�u binh m�i m� quy m� l�n, ch�c s� kh�ng �n n�u qu� s�u. S� qua l�i c�a ch�ng ch�c c� th� l�n ra d�u v�t.",
	"��ng ��ng, ng��i kh�ng n�i ta c�ng kh�ng ngh� ra, g�n ��y Cao th� quan ngo�i qua l�i t�i Long M�n Tr�n  c� h�nh tung kh� nghi, d��ng nh� c� ti�p x�c b� m�t v�i Nh�t ph�m ���ng, nh�ng ta v�n n�n l�i kh�ch s�n ch�a th� truy t�m, qu� th�c r�t x�u h�.",
	"Ti�n sinh ch� x�u h�, ng��i �� cung c�p cho ta tin t�c quan tr�ng, Cao th� quan ngo�i kia r�t c� th� �� g�p k� ch� m�u, ta ph�i �i th�m d� m�t chuy�n.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,690,1);--ɾȥ�Ƕ�
	CreateTrigger(0,1241,KILL_XB_GUANWAIGAOSHOU);--�������ɱ�ִ�����
	SetTask(TASK_XB_ID,14);
	TaskTip("�i ��n Long M�n Tr�n, �i�u tra cao th� quan ngo�i xem c� manh m�i v� Nh�t ph�m ���ng kh�ng.");
	Msg2Player("�i ��n Long M�n Tr�n, �i�u tra cao th� quan ngo�i xem c� manh m�i v� Nh�t ph�m ���ng kh�ng.");
	GivePlayerAward("Award_XB_06","Easy");
	GivePlayerExp(SkeyXibei,"dudou")
end


--���ػ�δ����һƷ�����뺯��������Ի�
function task_004_02_0()

local strTalk = {};

	--����һƷ�����뺯
	if GetItemCount(2,0,691) >= 1 then
		strTalk = {
			"Nh�ng Cao th� quan ngo�i qu� nhi�n l�i h�i, ta �� l�y ���c Th� m�i c�a Nh�t ph�m ���ng tr�n ng��i ch�ng.",
			"(Xem th� m�i) kh�ng ���c, ng��i ch�u tr�ch nhi�m ch�nh trong l�n chi�u binh m�i m� n�y c�a Nh�t ph�m ���ng l� L� Nguy�n Kh�nh! Chuy�n n�y kh�ng gi�ng b�nh th��ng. Nh�ng k� qua l�i v�i cao th� ��u l� nh�ng k� xu�t ch�ng, ��ng th�i Nh�t ph�m ���ng th�p ��i kim cang c�ng �� ra m�t. ��i s�, chuy�n ��i s� s�p x�y ra.",
			"T�n L� Nguy�n Kh�nh n�y l� ai? Th�p ��i kim cang l� nh�ng k� n�o?",
			"Xa Lu�n B� V��ng n�y l� k� ch� m�u c�a h�nh ��ng l�n n�y, l�c n�y �ang � Long M�n Tr�n. Th�ng tin v� suy �o�n c�a ta ch� c� th�, <sex> h�y �i t�m �u D��ng ti�n sinh, �ng ta c� th� gi�i t�a nghi v�n cho ng��i. Ha ha, c�n ph�i �a t� <sex> �� mang tin t�t v� cho ta.",
			"��ng kh�ch s�o, ta xin c�o t�.",
			}

		RemoveTrigger(GetTrigger(KILL_XB_GUANWAIGAOSHOU));
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID,15);
		TaskTip("Bi�t Nh�t ph�m ���ng s�p c� �m m�u l�n, h�y mau v� Ph�ng T��ng b�o cho �u D��ng H�a bi�t.");
		Msg2Player("Bi�t Nh�t ph�m ���ng s�p c� �m m�u l�n, h�y mau v� Ph�ng T��ng b�o cho �u D��ng H�a bi�t.");
		GivePlayerAward("Award_XB_07","Easy");
		GivePlayerExp(SkeyXibei,"yipintangzhuangda")
	--û�д���һƷ�����뺯and�������񴥷���
	else
		strTalk = {
			"C�c cao th� quan ngo�i qua l�i Long M�n Tr�n  c� h�nh tung kh� nghi, d��ng nh� c� ti�p x�c b� m�t v�i Nh�t ph�m ���ng. Nh�ng ta v�n n�n l�i kh�ch s�n ch�a �i �i�u tra, th�t x�u h�"
			}
		if	GetTrigger(KILL_XB_GUANWAIGAOSHOU) == 0 then
			CreateTrigger(0,1241,KILL_XB_GUANWAIGAOSHOU);
			TaskTip("�i ��n Long M�n Tr�n, �i�u tra cao th� quan ngo�i xem c� manh m�i v� Nh�t ph�m ���ng kh�ng.");
			Msg2Player("�i ��n Long M�n Tr�n, �i�u tra cao th� quan ngo�i xem c� manh m�i v� Nh�t ph�m ���ng kh�ng.");
		end

		TalkEx("",strTalk);
	end
end


--δ��ŷ�����Ի�ǰ��������Ի�
function task_004_02_1()

local strTalk = {
	"Ng��i h�y ��n Ph�ng T��ng t�m �u D��ng H�a ti�n sinh."
	}

	TalkEx("",strTalk);

end

--��ŷ�����Ի�׼������һƷ�����Ե�
function task_004_03_0()

local strTalk = {
	"<sex> �� v� r�i �! T�n Nh� Li�n �� t�nh r�i ch�?",
	"T�n ti�n sinh �� t�nh l�i r�i, �ng ta c�n th�m th�nh ���c Nh�t Ph�m ���ng �ang chi�u binh m�i m� � Long M�n tr�n, M�t s� Nh�t Ph�m ���ng �ang � g�n �� t�m ki�m nh�n t�i. C�n ��y l� Th� m�i Nh�t Ph�m ���ng. Xin ti�n b�i xem qua.",
	"(Xem xong th� m�i) �� �i�u ��ng L� Nguy�n Kh�nh v� Th�p ��i Kim Cang, h�nh ��ng l�n n�y c�a Nh�t Ph�m ���ng qu� th�t kh�ng ph�i chuy�n nh�, xem ra ch�ng r�t xem tr�ng ��t chi�u binh m�i m� l�n n�y, L� Nguy�n Kh�nh c�ng xu�t hi�n, ch� s� b�n trong c�n c� �m m�u g� l�n h�n.",
	"L� Nguy�n Kh�nh l� ai?",
	"L� Nguy�n Kh�nh l� cao th� th� 3 c�a T�y H� Nh�t Ph�m ���ng, ng��i n�y tr� d�ng song to�n v� c� ��a v� r�t cao trong Nh�t Ph�m ���ng. Kh�ng ph�i vi�c h� tr�ng y s� kh�ng xu�t hi�n, vi�c c�a Nh�t Ph�m ���ng ch� c�n y ph� tr�ch th� ch�c ch�n s� th�nh c�ng, t� l�c tr� y �� c� th� ng�i v�o ch�c v� cao th� th� 3 c� th� th�y t�i ngh� c�a y cao th�m kh� l��ng.",
	"Th� ra l� v�y! Nh�t Ph�m ���ng �� L� Nguy�n Kh�nh ph� tr�ch vi�c chi�u binh m�i m� l�n n�y nh�t ��nh s� th�nh c�ng. C�n Th�p ��i Kim Cang?",
	"Th�p ��i Kim Cang l� tinh anh Nh�t Ph�m ���ng ph� tr�ch h�nh s� v� truy�n ch� l�nh. M��i ng��i n�y c� ngo�i h�nh k� l� nh�ng ��u l� cao th�, l�n n�y ng��i ��n Long M�n tr�n ��n Xa Lu�n B� V��ng  ch�nh l� m�t trong m��i ng��i ��.",

	}

	TalkEx("task_004_03_0_1",strTalk);

end;

-- ���Ի�
function task_004_03_0_1()

local strTalk = {
	"L�n n�y c�c cao th� c�a Nh�t Ph�m ���ng l�n l��t xu�t hi�n, kh�ng bi�t t�i sao h� l�i coi tr�ng ��t chi�u binh m�i m� n�y?",
	"Theo ta �o�n, T�y H� mu�n x�m chi�m l�nh th� ��i T�ng, mu�n li�n k�t v�i n��c Li�u �� x�m chi�m ��i T�ng, l�n h�nh ��ng n�y Nh�t Ph�m ���ng mu�n m� r�ng th� l�c � Trung Nguy�n, l�m y�u �i s�c m�nh c�a Trung Nguy�n. Nh�t Ph�m ���ng kh�ng ch� �m s�t c�c cao th� v� l�m m� c�n mua chu�c c�c qu�n th�n trong tri�u �� l�y th�ng tin c� m�t c�a ��i T�ng.",
	"Ch�ng tr�ch Nh�t Ph�m ���ng coi tr�ng h�nh ��ng l�n n�y, ch�ng l� m�i nguy h�i v�i v� l�m Trung Nguy�n, ta ph�i ng�n ch�n h�nh ��ng l�n n�y c�a b�n ch�ng.",
	"Kh�ng sai! Nh�ng mu�n ph� ho�i h�nh ��ng c�a b�n ch�ng th� ta ph�i bi�t h��ng h�nh ��ng c�a ch�ng. ���<sex> ��i hi�p, ta c� chuy�n mu�n nh� ng��i.",
	"Kh�ng d�m! G�p s�c cho n��c nh� l� tr�ch nhi�m c�a v�n b�i. Ti�n b�i xin c� n�i!",
	"H�nh ��ng l�n n�y c�a Nh�t Ph�m ���ng n�u th�nh c�ng s� l� ��i h�a cho v� l�m. Cho n�n ta mu�n <sex> th�m nh�p Nh�t Ph�m ���ng �i�u tra �m m�u c�a ch�ng, �� th�a c� ng�n ch�n h�nh ��ng l�n n�y.",
	}

	TalkEx("task_004_03_0_2",strTalk);

end

-- ���Ի�
function task_004_03_0_2()

local strTalk = {
	"Ti�n b�i mu�n t�i h� tr� tr�n v�o Nh�t Ph�m ���ng?",
	"V�i c� tr� c�a <sex>, vi�c n�y ch� c� th� tr�ng ch� v�o <sex>. Nh�t Ph�m ���ng h�nh ��ng kh� �o�n, <sex> l� ng��i c� th� tin c�y, ta m�i d�m m� mi�ng nh� v�.",
	"Xem ra ��y c�ng l� bi�n ph�p t�t, mu�n ph� ho�i h�nh ��ng c�a ch�ng ph�i tr� tr�n v�o Nh�t Ph�m ���ng m�i c� th� l�y ���c tin t�c quan tr�ng.",
	"<sex> ��i hi�p, n�u vi�c n�y th�nh c�ng, <sex> xem nh� �� t�o ph�c cho b� t�nh, h�nh ��ng l�n n�y v� c�ng nguy hi�m, ng��i h�y t�y c� h�nh s�, n�u g�p kh� kh�n g� h�y ��n t�m ta, Tr��ng Ca M�n ta s� �ng h� ng��i h�t m�nh.",
	"V�n b�i xin ghi nh�! Nh�t ��nh s� kh�ng ph� l�ng ng��i.",
	"Ng��i ��ng ��u ��t chi�u binh m�i m� l�n n�y l� Xa Lu�n B� V��ng , ng��i c� th� �em Th� m�i Nh�t Ph�m ���ng ��n Long M�n tr�n th� xem. M�i chuy�n h�y c�n th�n.",
	}

	SetTask(TASK_XB_ID,16);
	TaskTip("�u D��ng H�a b�o b�n �i t�m Xa Lu�n B� V��ng!");
	Msg2Player("�u D��ng H�a b�o b�n �i t�m Xa Lu�n B� V��ng!");
	GivePlayerAward("Award_XB_08","Easy");
	GivePlayerExp(SkeyXibei,"qianru")
	TalkEx("",strTalk);
end

--��δ�복�ְ����Ի�ǰ��ŷ�����Ի�
function task_004_03_1()

local strTalk = {
	"<sex> v� n��c kh�ng ti�c th�n m�nh, th�t khi�n ng��i ng��i k�nh ph�c.",
	}

	TalkEx("",strTalk);

end


---------------------------------- ������05�²ְ���----------------------------------
--�복�ְ����Ի���ʼ��������05�²ְ��ȡ�����
function task_005_01_0()

local strTalk = {};

	--����67���ܽ�����
	if GetLevel() >= 67 then
		strTalk = {
			"(Ta ph�i gi� trang th�nh t�i ph�m c�a ��i T�ng �� l�y chi�m ���c s� t�n nhi�m c�a Xa Lu�n B� V��ng)",
			"Ng��i l� Xa Lu�n B� V��ng ? Ta v� m�u s�t k� th� ph�m ph�i t�i t�. L�c Phi�n M�n truy �u�i t�i ��n ��y, thi�t ngh� ��i T�ng �� kh�ng c�n ch� �� t�i dung th�n, ��y l� Th� m�i Nh�t Ph�m ���ng, kh�ng bi�t Nh�t Ph�m ���ng c� th� th�u nh�n ta kh�ng?",
			"Xem ra <sex> l� nh�n t�i c�a M�t s� Nh�t Ph�m ���ng. Nh�t Ph�m ���ng v�n tr�ng anh h�ng, kh�ng c�n bi�t xu�t x�, cho d� ng��i ph�m ph�p c�ng kh�ng sao, ch� c�n l� ng��i c� n�ng l�c l� ���c.",
			"T�i h� �� nghe danh Nh�t Ph�m ���ng xem tr�ng nh�n t�i t� l�u, t�i h� �ang b� b�n L�c Phi�n M�n ��ng gh�t truy �u�i r�o ri�t, kh�ng bi�t Nh�t Ph�m ���ng c� th� th�u nh�n ta kh�ng?",
			"Ha ha! Ng��i y�n t�m, � Nh�t Ph�m ���ng s� g� b�n L�c Phi�n M�n? Cho d� Ho�ng cung ��i n�i b�n ta c�n ch�a xem ra g�.",
			}

		TalkEx("task_005_01_0_1",strTalk);

	else
		strTalk = {
			"(Ta ph�i gi� trang th�nh t�i ph�m c�a ��i T�ng �� l�y chi�m ���c s� t�n nhi�m c�a Xa Lu�n B� V��ng)",
			"Ng��i l� Xa Lu�n B� V��ng ? Ta v� m�u s�t k� th� ph�m ph�i t�i t�. L�c Phi�n M�n truy �u�i t�i ��n ��y, thi�t ngh� ��i T�ng �� kh�ng c�n ch� �� t�i dung th�n, ��y l� Th� m�i Nh�t Ph�m ���ng, kh�ng bi�t Nh�t Ph�m ���ng c� th� th�u nh�n ta kh�ng?",
			"Xem ra <sex> l� nh�n t�i c�a M�t s� Nh�t Ph�m ���ng. Nh�ng h�m nay xem ra <sex> v�n ch�a �� n�ng l�c m� b�n ta y�u c�u, ch� ng��i ��t c�p 80 h�y ��n t�m ta.",
			}
		TalkEx("",strTalk);
	end
end

-- ���Ի�
function task_005_01_0_1()

local strTalk = {
				"Ch� c�n Nh�t Ph�m ���ng gi�p ta tho�t kh�i ki�p n�n n�y, ta s� t�n l�c ph�ng s� cho Nh�t Ph�m ���ng.",
				"Nh�t Ph�m ���ng ta coi anh h�ng, kh�ng th�ch th�u nh�n k� b�t t�i, th� m�i M�t s� cho ng��i ch� l� b��c s�ng l�c th�i, mu�n v�o Nh�t Ph�m ���ng ph�i qua s� th� th�ch �� ch�ng minh n�ng l�c c�a ng��i. Nh�p m�n ph�i qua 3 th� th�ch.",
				"V�ng th�t kh�ng s� l�a, ��i nh�n xin c� n�i!",
				"<sex> th�t s�ng kho�i. Ng��i b� L�c Phi�n M�n truy �u�i ��n ��y, thi�t ngh� ng��i c�ng c�m th� L�c Phi�n M�n ��n t�n x��ng, g�n ��y m�t trong Th�p ��i Kim Cang l� S�t th� Oa Oa ch�ng may b� L�c Phi�n M�n b�t gi�, ta th�y ng��i h�o kh� h�n ng��i, c� d�m ��n L�c Phi�n M�n c�u ng��i kh�ng?",
				}

	TalkEx("task_005_01_0_2",strTalk);

end

-- ���Ի�
function task_005_01_0_2()

local strTalk = {
			"V�y ta kh�ng ph�i t� chu�i ��u v�o l��i sao? Ta �ang b� L�c Phi�n M�n truy �u�i, bi�t tr�n n�i c� h� d� ch�ng l� c� leo l�n sao?",
			"Kh�ng v�o hang c�p sao b�t ���c c�p? Nh�t Ph�m ���ng kh�ng hoan ngh�nh nh�ng k� nh�t gan, ph�i v��t qua kh� kh�n m�i l� b�c anh h�ng. <sex> n�u kh�ng �� can ��m th� th�i v�y,, nh�ng ng��i �� c� � nh�p m�n, l�i l� T�n b� Nh�t Ph�m ���ng, sau n�y ch� c�n ��a ra k� hi�u n�y v�i ng��i trong ���ng �� ch�ng nh�n th�n ph�n.",
			"Ha ha! ��i nh�n h�y ch� tin c�a t�i h�.",
			"(K� n�y ki�u c�ng nh�ng l�i c�n tr�ng, r� r�ng ta �� t� khai m�nh �ang b� L�c Phi�n M�n truy n�, c�n b�t ta m�o hi�m, th�t gi�o ho�t. C� �i�u nh� lao L�c Phi�n M�n � ��u m�i ���c? Ch�c ph�i ��n h�i �u D��ng H�a ti�n b�i th�i.)",
	}

	DelItem(2,0,691,1);--ɾȥ���뺯
	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,17);
	TaskTip("V� Ph�ng T��ng t�m �u D��ng H�a h�i v� tr� nh� lao L�c Phi�n M�n.");
	Msg2Player("V� Ph�ng T��ng t�m �u D��ng H�a h�i v� tr� nh� lao L�c Phi�n M�n.");
	add_xb_title(1);--�ƺţ�һƷ���±�
	GivePlayerExp(SkeyXibei,"jiaoruyipintang")
end

--��δ��ŷ�����Ի�
function task_005_01_1()

local strTalk = {
	"Th� th�ch th� 1: ��n nh� lao gi�i c�u S�t th� Oa Oa �� ch�ng t� l�ng can ��m.",
	"(K� n�y ki�u c�ng nh�ng l�i c�n tr�ng, r� r�ng ta �� t� khai m�nh �ang b� L�c Phi�n M�n truy n�, c�n b�t ta m�o hi�m, th�t gi�o ho�t. C� �i�u nh� lao L�c Phi�n M�n � ��u m�i ���c? Ch�c ph�i ��n h�i �u D��ng H�a ti�n b�i th�i.)",
	}

	TalkEx("",strTalk);

end

--��δ�ȳ�����ɱ��ǰ�Ի�
function task_005_01_2()

local strTalk = {
	"Th� th�ch th� 1: ��n nh� lao gi�i c�u S�t th� Oa Oa �� ch�ng t� l�ng can ��m.",
	}

	TalkEx("",strTalk);

end

--��ŷ�����Ի�ѯ�ʼ���λ��
function task_005_02_0()

local strTalk = {
	"S� vi�c ��n ��u r�i?",
	"Xa Lu�n B� V��ng  r�t c�n th�n, n�i l� gia nh�p Nh�t Ph�m ���ng ph�i th�ng qua 3 th� th�ch. Ta b�o gi� m�nh �ang l� t�i ph�m b� truy n� � ��i T�ng, nh�ng h�n l�i bu�c ta ph�i t�i L�c Phi�n M�n c�u ng��i, ch�c l� mu�n th�m d� ta ��y.",
	"��ng l� gian x�o. Xem ra vi�c n�y ph�i nh� ��n L�c Phi�n M�n r�i. Ng��i h�y ��n Bi�n Kinh t�m B�ch Hi�u Sinh, �ng ta quen bi�t v�i L�c Phi�n M�n, ch�c s� gi�p ���c ng��i ��y. Ta s� d�ng b� c�u ��a th� �� k� r� s� t�nh.",
	"���c, �a t� s� gi�p �� c�a ti�n b�i.",
	}

	SetTask(TASK_XB_ID,18);
	TalkEx("",strTalk);
	TaskTip("��n Bi�n Kinh, t�m B�ch Hi�u Sinh nh� gi�p ��.");
	Msg2Player("��n Bi�n Kinh, t�m B�ch Hi�u Sinh nh� gi�p ��.");
	GivePlayerExp(SkeyXibei,"citanjimi")
end;

--��δ��������Ի�
function task_005_02_1()

local strTalk = {
	"Gi� ng��i h�y ��n Bi�n Kinh t�m B�ch Hi�u Sinh, ta �� d�ng b� c�u ��a th� n�i r� s� t�nh v�i �ng ta r�i.",
	"���c, v�n b�i s� �i ngay."
	}

	TalkEx("",strTalk);

end

--��������Ի����Ԭ��������
function task_005_03_0()

local nMapName,nXpos,nYpos = SelectMapData(1);
local strTalk = {
	"<sex> ��n r�i �, ta �� nh�n ���c th� c�a �u D��ng H�a, chuy�n c�a L�c Phi�n M�n ng��i c� y�n t�m, ta �� nh� B� kho�i Vi�n V�n Phi gi�p ��, h�n l� 1 trong l�c ��i danh b� c�a ��i T�ng, l� tr� c�t c�a L�c Phi�n M�n, c� s� gi�p �� c�a h�n, vi�c s� ��u v�o ��y c�.",
	"H�nh tung c�a B� kho�i L�c Phi�n M�n l� c� m�t, l�m sao ta t�m Vi�n Phi V�n ���c ch�?",
	"Ta �� vi�t th� cho L�c Phi�n M�n, gi� h�n �ang � "..nMapName..", ng��i ch� c�n ��n "..(nXpos..", "..nYpos).." d�ng Ph�o hi�u L�c Phi�n m�n n�y, Vi�n Phi V�n t� kh�c xu�t hi�n.",
	"�a t� ti�n b�i, c� nhi�u s� gi�p �� nh� v�y, ta nh�t ��nh s� ho�n th�nh t�t nhi�m v�.",
	"<sex> ��ng kh�ch s�o, c�n tr� m� �� x� th�n v� giang s�n ��i T�ng, h�nh ��ng �y th�t v� ��i. <sex> ph�i th�t c�n tr�ng, n�u g�p v�n �� g�, ch� c�n trong ph�m vi n�ng l�c c�a Tr��ng Ca M�n, ta �t d�c to�n l�c tr� gi�p.",
	}

	AddItem(2,0,692,1,1);--����������̻�
	SetTask(TASK_XB_ID,19);
	TalkEx("",strTalk);
	TaskTip("��n "..nMapName.."("..nXpos..", "..nYpos..") d�ng Ph�o hi�u L�c Phi�n m�n �� g�p Vi�n Phi V�n.");
	Msg2Player("��n "..nMapName.."("..nXpos..", "..nYpos..") d�ng Ph�o hi�u L�c Phi�n m�n �� g�p Vi�n Phi V�n.");
	GivePlayerExp(SkeyXibei,"bukuaiyuanyunfei")
end

--ѡȡĿ���ͼ�������
--����nType��1,2,3Ϊ��Ԭ���ƶԻ���������ص�
function SelectMapData(nType)

local i = 0;
local Map_Data_Index = {};
local nMapName = "";
local nMapDataID,nMapID,nXpos,nYpos = 0,0,0,0;

	if nType == 1 or nType == 2 or nType == 3 then

		nMapDataID = random(1,getn(Map_Data));
		SetTask(YUANFEIYUN_MAP_DATA_ID,nMapDataID);
		nMapName = Map_Data[nMapDataID][1];
		nXpos = Map_Data[nMapDataID][5];
		nYpos = Map_Data[nMapDataID][6];

		return nMapName,nXpos,nYpos

	end

end

--��δʹ���̻���Ԭ���ƻ���ʱ��������Ի�
function task_005_03_1()

local nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
local nMapName,nXpos,nYpos = Map_Data[nMapDataID][1],Map_Data[nMapDataID][5],Map_Data[nMapDataID][6];
local strTalk = {
	"Ta �� vi�t th� cho L�c Phi�n M�n, gi� h�n �ang � "..nMapName..", ng��i ch� c�n ��n "..(nXpos..", "..nYpos).." d�ng Ph�o hi�u L�c Phi�n m�n n�y, Vi�n Phi V�n t� kh�c xu�t hi�n.",
	"�a t� ti�n b�i, c� nhi�u s� gi�p �� nh� v�y, ta nh�t ��nh s� ho�n th�nh t�t nhi�m v�.",
	"<sex> ��ng kh�ch s�o, c�n tr� m� �� x� th�n v� giang s�n ��i T�ng, h�nh ��ng �y th�t v� ��i. <sex> ph�i th�t c�n tr�ng, n�u g�p v�n �� g�, ch� c�n trong ph�m vi n�ng l�c c�a Tr��ng Ca M�n, ta �t d�c to�n l�c tr� gi�p.",
	}

	TalkEx("",strTalk);

	--�����̻�
	if GetItemCount(2,0,692) <= 0 then
		AddItem(2,0,692,1,1);--����������̻�
	end

end

--��Ԭ���ƶԻ�ȡ��·��ͼ
function task_005_04_0()

local nMapName,nXpos,nYpos = SelectMapData(1);
local strTalk = {
	"Ta �� ���c nghe B�ch Hi�u Sinh nh�c ��n <sex>. L�y qu�c gia x� t�c l�m tr�ng, g�t b� l�i �ch c� nh�n, ��ng l� anh h�ng xu�t thi�u ni�n! ",
	"Ta ch� mu�n l�m ch�t g� �� cho n��c nh�, Vi�n B� kho�i tr� gian di�t �c, danh ch�n v� l�m, ���c B� kho�i tr� gi�p ta th�y t� tin h�n nhi�u.",
	"<sex> ��ng kh�ch s�o, chuy�n kh�ng th� ch�m tr�, ta h�y mau v�ch k� ho�ch �ng ph�. X�ng v�o nh� lao L�c Phi�n M�n e l� kh�ng �n l�m, v� nh� lao ���c canh ph�ng c�n m�t, c� quan tr�ng tr�ng, cho d� <sex> c��p ng�c th�nh c�ng, c�ng ph�i g�nh l�y t�i danh su�t ��i.",
	"Xa Lu�n B� V��ng giao nhi�m v� n�y, r� r�ng l� mu�n ��y l� v�o ng� c�t, gi�t ng��i nay l�i th�m t�i c��p ng�c ch�c ch�n ta s� kh�ng c�n c� h�i l�m l�i cu�c ��i, nh�ng n�u kh�ng c�u ���c S�t th� Oa Oa th� kh�ng th� c� ���c l�ng tin c�a h�n. Ch�ng l� kh�ng c�n c�ch n�o kh�c sao?",
	"��ng lo l�ng qu�, ta �� suy ngh� r�t l�u, n�u kh�ng th� c�ng khai c��p ng�c, th� h�y c�ng nhau ��ng 1 v� k�ch qua m�t thi�n h� v�y. S�p t�i ta s� �p t�i S�t th� Oa Oa �i ngang "..nMapName.."("..nXpos..", "..nYpos..", ng��i h�y t�i c��p ng�c, ta v� b� th��ng v� ng��i nh�n c� h�i c�u S�t th� Oa Oa. ��y l� b�n �� l� tr�nh �p t�i, ng��i ch� vi�c �i theo h��ng d�n tr�n ��.",
	}

	TalkEx("task_005_04_0_1",strTalk);

end

-- ���Ի�
function task_005_04_0_1()

local strTalk = {
	"C�ch n�y gi�p gi�m b�t nhi�u kh� kh�n trong l�c c��p ng�c, ��ng l� di�u k�. Nh�ng kh�ng bi�t c�ch n�y c� th� qua m�t ���c c�c nha d�ch c�ng �o�n v� S�t th� Oa Oa kh�ng?",
	"T�i l�c �� ta s� ��ch th�n �p t�i S�t th� Oa Oa, �� l�a ���c h�n, ng��i v� ta ��u ph�i d�c h�t s�c cho cu�c chi�n, kh�ng ���c m�m l�ng n��ng tay. C�n n�a, ng��i c� th� ��n Ph�ng T��ng ph� t�m Di�p l�o mua �t ��n kh�i, n� s� gi�p �ch cho vi�c c�u ng��i ��y.",
	"Nh� v�y ch�ng ph�i Vi�n B� kho�i ph�i nh�n l�nh tr�ch nhi�m hay sao? Ng��i h�t s�c gi�p �� ta, nh�ng ta khi�n ng��i mang t�i, l�i c�n b� th��ng, ta kh�ng th� l�m v�y ���c.",
	"Ng��i l�m ��i s� kh�ng c�u n� ti�u ti�t. V� ��i c�c, ch�t l�i �ch c� nh�n n�o c� ��ng g�! <sex> v� ta b�o n��c t��ng ph�ng, nh�ng x�a c� c�u k� s� c� th� ch�t v� tri k� kia m�. ��ng ��n �o n�a, <sex> ��ng �� Vi�n m� ph�i th�t v�ng.",
	"K� s� c� th� ch�t v� tri k�, hay l�m, n�u ta c�n ch�n ch�, th� h�a ra m�nh qu� nhu nh��c r�i. ",
	"V�y m�i ��ng l� con d�n c�a ��i T�ng ch�. Ta �i chu�n b� m�i th� ��y. Xin c�o t�.",
	}

	AddItem(2,0,693,1,1);--���Ѻ��·��·
	SetTask(TASK_XB_ID,20);
	TalkEx("task_005_04_1",strTalk);
	TaskTip("��n Ph�ng T��ng t�m th��ng nh�n Di�p l�o mua ��n kh�i d�ng cho vi�c c��p ng�c.");
	Msg2Player("��n Ph�ng T��ng t�m th��ng nh�n Di�p l�o mua ��n kh�i d�ng cho vi�c c��p ng�c.");
	GivePlayerAward("Award_XB_09","Easy");
	GivePlayerExp(SkeyXibei,"haoxi")
end

--��Ԭ���ƶԻ�ȡ��·��ͼ��Npc��ʧ
function task_005_04_1()

	SetNpcLifeTime(GetTask(YUANFEIYUN_NPCINDEX),0);--��Npc��ʧ
	SetNpcScript(GetTask(YUANFEIYUN_NPCINDEX),"");--�ű��ÿ�
end

--�����Ҷ�϶Ի�
function task_005_05_0()

local strTalk = {
	"Xin h�i �ng c� ph�i Di�p L�o kh�ng? T�i mu�n mua Y�n M�c ��n.",
	"��ng r�i. Ta th��ng giao d�ch v�i l�i bu�n T�y V�c, Y�n M�c ��n n�y l� t�ng th�m, kh�ng ��ng bao nhi�u, n�u <sex> mu�n ta c� th� t�ng ng��i. Nh�ng ta c� vi�c mu�n nh� <sex> gi�p ���c kh�ng?",
	"�ng c� n�i ��ng ng�i, ch� c�n t�i �� s�c, t�i h� s� gi�p �ng.",
	"Ha ha, <sex> th�t t�t b�ng, ch� l� chuy�n nh� th�i, con trai ta ��n C�n L�n ph�i tu luy�n, m�i ��y �� ba n�m kh�ng v�, ta r�t nh� n�, kh�ng bi�t n� s�ng ra sao, s�c ta �� gi� y�u kh�ng th� l�n n�i, ng��i c� th� gi�p ta g�i ch�t �� cho n� kh�ng?",
	"���c th�i, kh�ng bi�t con trai �ng t�n g�?",
	"N� t�n Di�p T� Thu, tu luy�n � C�n L�n ph�i, phi�n ng��i gi�p ta g�i b�c Th� nh� v� G�i �� n�y cho n�, hy v�ng n� kh�e. <sex> th�t t�t b�ng, c�m �n nhi�u.",
	"�ng c� y�n t�m, t�i h� s� chuy�n ��n ��.",
	}

	AddItem(2,0,747,1,1);--�õ�����Ҷ����İ���������
	AddItem(2,0,748,1,1);
	SetTask(TASK_XB_ID,21);
	TalkEx("",strTalk);
	TaskTip("Mang th� v� g�i �� cho Di�p T� Thu con trai Di�p L�o �ang tu luy�n tr�n C�n L�n ph�i.");
	Msg2Player("Mang th� v� g�i �� cho Di�p T� Thu con trai Di�p L�o �ang tu luy�n tr�n C�n L�n ph�i.");

end

--��δ��ȥ����Ͱ�����Ҷ�϶Ի�������������Ʒ��
function task_005_05_1()

local strTalk = {
	"Con trai ta t�n Di�p T� Thu l� �� t� C�n L�n ph�i, phi�n ng��i gi�p ta chuy�n ��n ��. C�m �n <sex> nhi�u."
	}

	if GetItemCount(2,0,747) <= 0 then
		AddItem(2,0,747,1,1);
	end

	if GetItemCount(2,0,748) <= 0 then
		AddItem(2,0,748,1,1);
	end

	TalkEx("",strTalk);

end

--��Ҷ�����ȥ����Ͱ����Ի�
function task_005_06_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"\'Nguy�n h�t l�ng tu ��o thu�t �� h�ng ma di�t y�u, c� nh� v�y thi�n h� m�i th�i b�nh.\' S� �� t�m ta c� vi�c �?",
			"T�i mang �t �� cho ��i s� huynh, Di�p L�o g�i cho huynh Th� nh� v� G�i ��, �ng �y r�t nh� huynh, hy v�ng huynh c� th�i gian �i th�m �ng.",
			"Phi�n s� �� r�i. Ta �� xa nh� ��n C�n L�n tu luy�n m�i ��y �� ba n�m, b� cha gi� c� ��n m�t m�nh � nh�, �ng v�n kh�e ch�?",
			}
	else
		strTalk = {
			"\'Nguy�n h�t l�ng tu ��o thu�t �� h�ng ma di�t y�u, c� nh� v�y thi�n h� m�i th�i b�nh.\' <sex> t�m ta c� vi�c �?",
			"Thi�u hi�p c� ph�i l� con c�a Di�p L�o, Di�p T� Thu?",
			"��ng, sao ng��i bi�t gia ph�? Ph�i ch�ng gia ph� x�y ra chuy�n?",
			"Kh�ng ph�i, Di�p L�o � Ph�ng T��ng v�n kh�e, thi�u hi�p kh�ng c�n lo l�ng. Ta ��n ��a �� th�i, Di�p L�o g�i Th� nh� v� G�i ��, �ng r�t nh� ng��i, hy v�ng ng��i c� th�i gian �i th�m �ng.",
			}
	end

	TalkEx("task_005_06_0_1",strTalk);

end

-- ���Ի�
function task_005_06_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
	 	strTalk = {
			"Huynh tuy h�t l�ng tu h�nh tr� ma, nh�ng c�ng c�n nh� ��n ng��i th�n m�i ph�i. Di�p L�o r�t kh�e, huynh y�n t�m. �ng c� ��n m�t m�nh � Ph�ng T��ng , mu�n l�n n�i th�m nh�ng tu�i gi� s�c y�u kh�ng th� �i ���c. Tuy c�ch xa ng�n d�m nh�ng v�n lo l�ng cho huynh.",
			"S� �� n�i ph�i, ta qu� b�t hi�u. S� �� c� th� gi�p ta b�o cho gia ph� kh�ng? Ta r�t kh�e, ch� l�m xong nhi�m v� s� ph� giao cho s� v� th�m �ng.",
			"���c, mong huynh mau ch�ng v� nh�."
			}
	else
		strTalk = {
			"Phi�n <sex> r�i. Ta �� r�i nh� ��n C�n L�n tu luy�n m�i ��y �� ba n�m, b� cha gi� c� ��n m�t m�nh � nh�, �ng v�n kh�e ch�?",
			"Ng��i tuy h�t l�ng tu h�nh tr� ma, nh�ng c�ng c�n nh� ��n ng��i th�n m�i ph�i. Di�p L�o r�t kh�e, ng��i y�n t�m. �ng c� ��n m�t m�nh � Ph�ng T��ng, mu�n l�n n�i th�m nh�ng tu�i gi� s�c y�u kh�ng th� �i ���c. Tuy c�ch xa ng�n d�m nh�ng v�n lo l�ng cho ng��i.",
			"Qu� th�c ta b�t hi�u. <sex> c� th� gi�p ta b�o cho gia ph� kh�ng? Ta r�t kh�e, ch� l�m xong nhi�m v� s� ph� giao cho s� v� th�m �ng.",
			"���c, mong huynh mau ch�ng v� nh�.",
			}
	end

	TalkEx("",strTalk);
	DelItem(2,0,747,1);--ɾȥ����������
	DelItem(2,0,748,1);
	SetTask(TASK_XB_ID,22);
	TaskTip("Gi�p Di�p T� Thu b�o cho Di�p L�o, ch� l�m xong vi�c s� v� nh� m�t chuy�n.");
	Msg2Player("Gi�p Di�p T� Thu b�o cho Di�p L�o, ch� l�m xong vi�c s� v� nh� m�t chuy�n.");
	GivePlayerAward("Award_XB_10","Easy");
	GivePlayerExp(SkeyXibei,"jiashu")
end

--δ���ػ���Ҷ����Ҷ����Ի�
function task_005_06_1()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"�a t� s� �� gi�p ��, phi�n chuy�n l�i cho gia ph�, khi l�m xong vi�c s� v� th�m �ng."
			}
	else
		strTalk = {
			"�a t� <sex>, phi�n chuy�n l�i cho gia ph�, khi l�m xong vi�c s� v� th�m �ng."
			}
	end

	TalkEx("",strTalk);

end

--������Ҷ��ȡ����Ļ���Ի�
function task_005_07_0()

SelectMapData(2);

local nTriggerID = Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][7];
local strTalk = {
	"<sex> g�p con trai ta kh�ng? N� kh�e kh�ng?",
	"Di�p L�o y�n t�m, huynh �y r�t kh�e, huynh �y c�n n�i khi n�o l�m xong vi�c s� ph� giao s� v� th�m �ng.",
	"�, v�y t�t r�i, ch� c�n n� kh�e l� ta y�n t�m. T�ng ng��i Y�n M�c ��n, c�m �n <sex> �� gi�p ��.",
	"Chuy�n nh� th�i.",
	}

	AddItem(2,0,694,1,1);--�õ���Ļ��
	--����·��ͼ
	if GetItemCount(2,0,693) <= 0 then
		AddItem(2,0,693,1,1)
	end
	SetTask(TASK_XB_ID,23);
	TalkEx("",strTalk);
	CreateTrigger(2,nTriggerID,RECT_XB_YUANFEIYUN);
	TaskTip("�� nh�n Y�n M�c ��n, theo b�n �� m� Vi�n B� ��u giao cho �i c��p ng�c.");
	Msg2Player("�� nh�n Y�n M�c ��n, theo b�n �� m� Vi�n B� ��u giao cho �i c��p ng�c.");
	GivePlayerExp(SkeyXibei,"yanwudan")
end

--δ��ɽ���������Ҷ�϶Ի���������������������Ʒ��
function task_005_07_1()

local nTriggerID = Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][7];
local strTalk = {
	"C�m �n <sex> gi�p ��, <sex> qu� l� t�t b�ng."
	}

	TalkEx("",strTalk);

	if GetItemCount(2,0,693) <= 0 or GetItemCount(2,0,693) <= 0 or GetTrigger(RECT_XB_YUANFEIYUN) == 0 then

		if GetItemCount(2,0,694) <= 0 then--��������
			AddItem(2,0,694,1,1)
		end

		if GetItemCount(2,0,693) <= 0 then--����·��ͼ
			AddItem(2,0,693,1,1)
		end

		if GetTrigger(RECT_XB_YUANFEIYUN) == 0 then--����������
			CreateTrigger(2,nTriggerID,RECT_XB_YUANFEIYUN);
		end

		TaskTip("�� nh�n Y�n M�c ��n, theo b�n �� m� Vi�n B� ��u giao cho �i c��p ng�c.");
		Msg2Player("�� nh�n Y�n M�c ��n, theo b�n �� m� Vi�n B� ��u giao cho �i c��p ng�c.");

	end

end

--��Ԭ���ƶԻ�׼������
function task_005_08_0(nNpcIndex)

local strSay = {};
local strTalk = {};

	--�ж��Ƿ�Ϊ��ǰ����ٻ�������Npc
	if GetTask(YUANFEIYUN_NPCINDEX) == nNpcIndex and GetTask(TASK_XB_ID) == 23 then
		if GetFollower() == 0 then
			strSay = {
				"Ai ��y? X�ng t�n �i! D�m ngang nhi�n c��p ng�c, ch�ng ��i quan ph�, xem L�c Phi�n M�n ta kh�ng ra g� �? Ti�p chi�u!",
				"��ng nhi�u l�i, h�y mau th� ng��i cho ta!/#task_005_08_1("..nNpcIndex..")",
				"Ch� l� qua ���ng th�i./Task_Exit",
				}
		else
			strSay = {
				"Ai ��y? X�ng t�n �i! D�m ngang nhi�n c��p ng�c, ch�ng ��i quan ph�, xem L�c Phi�n M�n ta kh�ng ra g� �? Ti�p chi�u!",
				"��ng nhi�u l�i, h�y mau th� ng��i cho ta!/#task_005_08_2("..nNpcIndex..")",
				"Ch� l� qua ���ng th�i./Task_Exit",
				}
		end
		SelectSay(strSay);
	elseif GetTask(TASK_XB_ID) == 23 then
		strTalk = {
			"D��ng nh� t�m nh�m ng��i r�i, h�y ��n "..Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][1].."("..Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][5]..", "..Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][6].." t�m th�."
			}
		TalkEx("",strTalk);
	else
		strTalk = {
			"D��ng nh� nh�m ng��i."
			}
		TalkEx("",strTalk);
	end

end

--��ʾɾ���������
function task_005_08_1(nNpcIndex)

local strSay = {
	"Nh�c nh�: Khi c��p S�t Th� Oa Oa th�nh c�ng, s� h�y b� th� c�ng hi�n mang theo, ti�p t�c c��p ng�c kh�ng?",
	"��ng �/#task_005_08_2("..nNpcIndex..")",
	"H�y b�/Task_Exit"
	}

	SelectSay(strSay);

end

--ѡ�����
function task_005_08_2(nNpcIndex)

local strTalk = {};

	if GetItemCount(2,0,694) <= 0 then
		strTalk = {
			"... (��n kh�i ch� l� m�t r�i, hay l� t�m Di�p L�o t�m l�i.)",
			"Xin l�i, nh�n nh�m ng��i.",
			"(T�n n�y �ang l�m tr� g� v�y, c�n kh�ng mau d�ng ��n kh�i c��p ng�c...)"
			}
		TalkEx("",strTalk)
	else
		--������Ļ����Ч
		strTalk = {
			"A?! L� ��n kh�i! C� ng��i c��p ng�c!",
			"(Mau ch�ng ��nh b�i Vi�n B� ��u, c�u S�t Th� Oa Oa.)"
			}
		TalkEx("",strTalk)
		ChangeNpcToFight(nNpcIndex);
	end
end

--����Ԭ���ƺ�Ի�
function task_005_08_3()

local strTalk = {
	"Ng��i l� qu� th�n ph��ng n�o? Kh�ng quen kh�ng bi�t, sao l�i c�u ta? B�o cho ng��i bi�t l� n�u ta mu�n r�i kh�i ��y c�ng kh�ng c�n ng��i gi�p s�c ��u! ��ng l� phi�n ph�c!",
	}

	TalkEx("task_005_08_3_1",strTalk);

end

-- ���Ի�
function task_005_08_3_1()

local strTalk = {
	"V�y..? (l� n�o ta c�u nh�m ng��i?) C�c h� c� ph�i l� m�t trong Th�p ��i kim cang Nh�t Ph�m ���ng, S�t Th� Oa Oa kh�ng? Ta ph�ng m�nh Xa Lu�n B� V��ng , gi�i c�u c�c h�.",
	"�, th� ra l�o Xa Lu�n ph�i ng��i ��n, kh�ng sai, ta ch�nh l� S�t Th� Oa Oa, ng��i l� ng��i c�a Nh�t Ph�m ���ng? L�m sao ng��i bi�t ta s� qua l�i n�y? N�u ta kh�ng b� b�t th� l�m sao c�u ���c?",
	"T�i v�n ch�a gia nh�p Nh�t Ph�m ���ng, c�u�� kh�ng���n c�c h� v� l� m�t b�i th� th�ch c�a t�i. T�i �n n�u � L�c Phi�n M�n nhi�u ng�y, th�m th�nh ���c Vi�n Phi V�n s� �p gi�i c�c h� qua ch� n�y, n�n � ��y ch� ��i.",
	"Kh� l�m, v� b�o v�i Xa Lu�n r�ng, ta ch� mu�n v�o Nh� lao b� �� �� ch�i v�i ng�y th�i, ch� kh�ng ph�i ta kh�ng ho�n th�nh nhi�m v�. L�c Phi�n M�n ta �� xem l� g� ch�?",
	}

	SummonNpc("S�t Th� Oa Oa","S�t Th� Oa Oa");
	TalkEx("task_005_08_3_2",strTalk);
	SetTask(TASK_XB_ID,24);

end

-- ���Ի�
function task_005_08_3_2()

local strTalk = {
	"(Ng��i n�y ��ng l� m�t trong Th�p ��i kim cang Nh�t Ph�m ���ng kh�ng? Th�p ��i kim cang l� nh�ng nh�n v�t g� nh�? Ng��i n�y nh�n qu� tr� con, r� r�ng b� b�t m� c�n s� di�n. Th�i, v� t�m Xa Lu�n B� V��ng  r�i t�nh ti�p.)",
	"N�i v�y, c�c h� c� r�t nhi�u b� m�t t�nh b�o? Chi b�ng ch�ng ta v� g�p Xa Lu�n B� V��ng r�i t�nh ti�p.",
	"Ha ha, ti�u t� kh� l�m, sau n�y Nh�t Ph�m ���ng s� c� nhi�u ��t d�ng v�, c� theo l�i ng��i v�y. L� n�o l� v�y, t�n h� Vi�n d�m c��p K�o H� L� c�a ta, th�t l� phi�n qu��",
	}

	TalkEx("",strTalk);
	TaskTip("�� c�u S�t Th� Oa Oa, t�m Xa Lu�n B� V��ng ph�c m�nh.");
	Msg2Player("�� c�u S�t Th� Oa Oa, t�m Xa Lu�n B� V��ng ph�c m�nh.");
end

--�복�ְ����Ի���ɽ���ĵ�һ��������ȡ�ڶ�������
--��ȡ����Ի�
function task_005_09_0()

	if GetTask(TASK_GET_AWARD) == 1 then
		task_005_09_0_3()
		return 0;
	end

local strTalk = {
	"S�t Th� Oa Oa �� v�.",
	"Ta ch� l� ��n nh� lao �� d�o m�t v�ng, ti�n th� th�m th�nh t�nh h�nh, kh�ng ph�i l� b� b�t. Phi�n Xa Lu�n ph�i ti�u t� n�y ��n ��n ta r�i. Th�n th� ti�u t� n�y r�t kh�, ch� l� h�i non t� th�i.",
	"Ha ha ha, <sex> kh�ng ph�i t�m th��ng. S�t Th� Oa Oa n�i ng��i kh� th� ch�c ng��i kh�ng ��n n�i n�o. Nh�ng L�c Phi�n M�n s� kh�ng �� y�n cho ng��i ��u.",
	"C� th� v� Nh�t Ph�m ���ng, th� t� chuy�n phi�n ph�c c� ��ng l� g� ch�! Ngo�i L�c Phi�n M�n ra th� m�i chuy�n ��u t�t ��p. Nh�t Ph�m ���ng s� cho t�i n�i n��ng nh�, kh�ng ch� ��n chuy�n L�c Phi�n M�n kh�ng bu�ng tha.",
	"(D��ng nh� qua �i r�i, may m� kh�ng ph� k� v�ng c�a Vi�n B� Kho�i.)",
	"Ti�u t� n�y l�m vi�c chu ��o, �� ��nh b�i Vi�n Phi V�n. Th�c ra Vi�n Phi V�n l�m sao c� th� l� ��i th� c�a ta, ta ch� l� nh��ng cho ti�u t� �� m�t c� h�i bi�u hi�n.",
	}

	TalkEx("task_005_09_0_1",strTalk);

end

-- ���Ի�
function task_005_09_0_1()

local strTalk = {
	"Ha ha ha, qu� l� anh h�ng xu�t thi�u ni�n, ta gi� ��n n�i r�i. Ti�u Oa l�n sau ��ng ��n nh� lao �� ch�i n�a, ta s� kh�ng ph�i ng��i ��n ng��i n�a ��u.",
	"Xa Lu�n b�t d�i d�ng, h� Vi�n d�m ��i ��u v�i Nh�t Ph�m ���ng ch�ng ta, ngay c� ti�u t� n�y c�n ��i ph� kh�ng ���c, sao d�m b�t ta? C�n c��p K�o H� L��ta mu�n l�t da r�t g�n c�a h�n. Ti�u t�, l�n sau ch�ng ta c�ng nhau h� h�n, xong chuy�n ta m�i ng��i K�o H� L�.",
	"(S�t Th� Oa Oa qu� danh b�t h� truy�n, h�nh d�ng nh� con n�t, t�m nh� s�t th�, sau n�y ph�i c�n th�n ��i ph�.)",
	"C� th� c�u ng��i t� tay Vi�n Phi V�n c�a L�c Phi�n M�n, <sex> qu� l� kh� l��ng! Ng��i c�ng m�t r�i, ngh� ng�i �i, l�n kh�o nghi�m n�y m�i g� l� m�n khai v� th�i, m�n ngon c�n � ph�a sau ��.",
	"Kh�ng d�m. Xin d�n d�, t�i h� s� h�t s�c m� l�m.",
	}

	TalkEx("task_005_09_0_2",strTalk);

end

--������
function task_005_09_0_2()

	give_wp_award(11);

end

--�ɹ���ȡ������ִ��
function task_005_09_0_3()

	SetTask(TASK_GET_AWARD,0);
	SetTask(TASK_XB_ID,25);
	GivePlayerAward("Award_XB_11","Easy");
	GivePlayerExp(SkeyXibei,"jieqiu")
	TaskTip("Sau khi ngh� ng�i, Xa Lu�n giao nhi�m v� th� hai.");
	Msg2Player("Sau khi ngh� ng�i, Xa Lu�n giao nhi�m v� th� hai.");
	task_005_09_1()

end;

--ɾȥ����ɱ��
function task_005_09_1()

local nFollowerName = GetNpcName(GetFollower());

	if nFollowerName == "S�t Th� Oa Oa" then
		KillFollower();
	end

end

---------------------------------- ������06������----------------------------------
--��ȡ�ڶ�������
function task_006_01_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"N�i C�n L�n l� ng�n n�i tr�n ��y ti�n kh�, t��ng truy�n ng��i C�n L�n ph�i ngo�i tinh th�ng c�ch h�ng y�u di�t ma, c�n n�m gi� b� thu�t luy�n Tr��ng Sinh B�t L�o ��n, nhi�u n�m tr��c T�y H� V��ng T�c ta ��n c�u c�ch ch� luy�n, nh�ng b� ch��ng m�n C�n L�n ph�i Chu B�t Ho�c t� ch�i.",
			"C�n L�n ph�i c� b� thu�t �� sao?? (Thu�c c�a C�n L�n ph�i ta bi�n th�nh Tr��ng Sinh B�t L�o ��n khi n�o nh�?)",
			"��y l� b� m�t �� ���c c�ng khai, ch� l� ch��ng m�n C�n L�n ph�i kh�ng nh�n m� th�i. T�y H� V��ng T�c ta d�ng l� ��i ��i, kh�ng ng� C�n L�n ph�i kh�ng th�c th�i nh� v�y, s� c� m�t ng�y Nh�t Ph�m ���ng ta l�m c� C�n L�n ph�i.",
			"Tr��ng Sinh B�t L�o ��n qu� l�m thi�n h� kinh ho�ng, n�u C�n L�n th�a nh�n h� c� c�ch luy�n ��n �� th� kh�ng ph�i l� t� chu�c h�a v�o th�n sao?",
			}
	else
		strTalk = {
			"N�i C�n L�n l� ng�n n�i tr�n ��y ti�n kh�, t��ng truy�n ng��i C�n L�n ph�i ngo�i tinh th�ng c�ch h�ng y�u di�t ma, c�n n�m gi� b� thu�t luy�n Tr��ng Sinh B�t L�o ��n, nhi�u n�m tr��c T�y H� V��ng T�c ta ��n c�u c�ch ch� luy�n, nh�ng b� ch��ng m�n C�n L�n ph�i Chu B�t Ho�c t� ch�i.",
			"C�n L�n ph�i c� b� thu�t �� sao?",
			"��y l� b� m�t �� ���c c�ng khai, ch� l� ch��ng m�n C�n L�n ph�i kh�ng nh�n m� th�i. T�y H� V��ng T�c ta d�ng l� ��i ��i, kh�ng ng� C�n L�n ph�i kh�ng th�c th�i nh� v�y, s� c� m�t ng�y Nh�t Ph�m ���ng ta l�m c� C�n L�n ph�i.",
			"Tr��ng Sinh B�t L�o ��n qu� l�m thi�n h� kinh ho�ng, n�u C�n L�n th�a nh�n h� c� c�ch luy�n ��n �� th� kh�ng ph�i l� t� chu�c h�a v�o th�n sao?",
			}
	end

	TalkEx("task_006_01_0_1",strTalk);

end

-- ���Ի�
function task_006_01_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng��i n�i c�ng c� l�, d� r�ng C�n L�n ph�i th�t s� c� c�ch luy�n Tr��ng Sinh B�t L�o ��n th� c�ng kh�ng d� d�ng ti�t l�. L�ng gan d� s�ng su�t c�a ng��i ta nh�n th�y r�i, nh�ng kh�ng bi�t kh� n�ng d� th�m t�nh h�nh th� n�o, m� �� l�i l� m�t k� n�ng m� ng��i trong Nh�t Ph�m ���ng ai c�ng tinh th�ng, ng��i �i C�n L�n d� th�m m�t chuy�n, xong vi�c l� qua kh�o nghi�m th� hai.",
			"Chuy�n n�y ��u c� g� kh�! H�y ch� tin c�a t�i h�.",
			"(Tr��ng Sinh B�t L�o ��n? �n n�i v� v�n. Nghe ng� kh� c�a h�n d��ng nh� c� �m m�u v�i C�n L�n ta, c�n ph�i l�u �. S� huynh Di�p T� Thu tinh th�ng thu�t luy�n ��n, chi b�ng �i h�i huynh �y)",
			}
	else
		strTalk = {
			"Ng��i n�i c�ng c� l�, d� r�ng C�n L�n ph�i th�t s� c� c�ch luy�n Tr��ng Sinh B�t L�o ��n th� c�ng kh�ng d� d�ng ti�t l�. L�ng gan d� s�ng su�t c�a ng��i ta nh�n th�y r�i, nh�ng kh�ng bi�t kh� n�ng d� th�m t�nh h�nh th� n�o, m� �� l�i l� m�t k� n�ng m� ng��i trong Nh�t Ph�m ���ng ai c�ng tinh th�ng, ng��i �i C�n L�n d� th�m m�t chuy�n, xong vi�c l� qua kh�o nghi�m th� hai.",
			"Chuy�n n�y ��u c� g� kh�! H�y ch� tin c�a t�i h�.",
			"(Th�i �� ng��i n�y ��i v�i ta c� v� �n h�a h�n r�i. Tr��ng Sinh B�t L�o ��n? An n�i v� v�n. Nh�ng thu�t luy�n ��n C�n L�n ph�i danh tr�n giang h�, ��ng r�i ��n t�m Di�p T� Thu h�i th�.)",
			}
	end

	SetTask(TASK_XB_ID,26);
	TalkEx("",strTalk);
	TaskTip("T�m Di�p T� Thu th�m th�nh t�nh h�nh Tr��ng Sinh B�t L�o ��n.");
	Msg2Player("T�m Di�p T� Thu th�m th�nh t�nh h�nh Tr��ng Sinh B�t L�o ��n.");

end

--δ��Ҷ��������������ϵ�����
function task_006_01_1()

local strTalk = {
	"Kho�ng nghi�m l�n hai: ��n C�n L�n ph�i d� th�m b� thu�t luy�n Tr��ng Sinh B�t L�o ��n �� ch�ng minh n�ng l�c d� th�m."
	}

	TalkEx("",strTalk);

end

--��Ҷ��������������ϵ�
function task_006_02_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"\'B� t�nh c� n�n, thi�n h� r�i lo�n. Ta d�c l�ng tu luy�n �� tr� y�u ma, tr� l�i s� thanh b�nh cho thi�n h�.\' Sao s� �� l�i quay v� ��y? Ph�i ch�ng th�n ph� ta c� vi�c g�?",
			"Di�p l�o v�n kh�e, nghe n�i s� huynh s� v� th�m nh�, l�o r�t vui. N�u Di�p l�o bi�t s� huynh quan t�m m�nh nh� v�y, h�n c�n vui h�n.",
			"�n d��ng d�c c�a th�n ph�, ta n�o d�m qu�n? Bi�t ng��i v�n kh�e m�nh l� ta y�n t�m r�i. S� �� t�m ta c� vi�c g�?",
			}
	else
		strTalk = {
			"\'B� t�nh c� n�n, thi�n h� r�i lo�n. Ta d�c l�ng tu luy�n �� tr� y�u ma, tr� l�i s� thanh b�nh cho thi�n h�.\' Sao <sex> l�i quay v� ��y? Ph�i ch�ng th�n ph� ta c� chuy�n g�?",
			"Kh�ng, Di�p l�o v�n kh�e, bi�t huynh s� v� th�m, Di�p l�o r�t vui. N�u bi�t huynh quan t�m m�nh nh� th�, h�n Di�p l�o s� c�n vui h�n.",
			"�n d��ng d�c c�a th�n ph�, ta n�o d�m qu�n? Bi�t ng��i v�n kh�e m�nh l� ta y�n t�m r�i. <sex> ��n ��y c� vi�c g� kh�ng?",
			"Ta t� nh� �� l�m b�nh t�t, ph�i s�ng nh� ��n d��c, n�n �� l�p ch� theo h�c Luy�n ��n chi ph�p, c�u nh�n �� th�. Nghe ��n thu�t luy�n ��n c�a C�n L�n ph�i thi�n h� v� song, kh�ng bi�t ta c� th� nh�p m�n b�i s�, h�c k� n�ng luy�n ��n?",
			"<sex> kh�ng nh�ng nhi�t t�nh m� c�n c� t�m l�ng hi�p ngh�a, T� Thu xin b�i ph�c. Ta c�n �ang ph�n v�n kh�ng bi�t ph�i l�m th� n�o b�o ��p c�ng lao c�a <sex>, nay ���c bi�t <sex> c� � gia nh�p C�n L�n ph�i, v�y th� c�n g� b�ng. Ta s� ��a ng��i ��n g�p ch��ng m�n.",
			}
	end

	TalkEx("task_006_02_0_1",strTalk);

end

-- ���Ի�
function task_006_02_0_1()

local strTalk = {}

	if GetPlayerRoute() == 100 then
		strTalk = {
			"���c bi�t s� huynh �� ���c b� thu�t luy�n ��n ch�n truy�n c�a s� ph�, �� c� v�i v�n �� mu�n ���c th�nh gi�o.",
			"Ta �ang ph�n v�n kh�ng bi�t ph�i b�o ��p c�ng lao c�a s� �� th� n�o, s� �� ham h�c h�i nh� v�y, s� huynh ta ���ng nhi�n ph�i gi�p �� h�t m�nh. Nh�ng gi� ��y ta c�n ph�i �i th�c hi�n nhi�m v� kh�n c�p m� s� ph� v�a giao, e kh�ng th� gi�i quy�t ngay cho s� �� ���c. Hay l� h�y ��i ta v� r�i b�n ti�p v�y.",
			"Di�p s� huynh c� y�n t�m �i l�m nhi�m v� s� ph� giao ph�, v�n �� c�a �� kh�ng quan tr�ng, �� t�m Tri�u s� hu�nh c�ng ���c m�.",
			}
		TaskTip("T�m Tri�u T� B�nh s� huynh t�m hi�u v� vi�c luy�n ch� ��n d��c.");
		Msg2Player("T�m Tri�u T� B�nh s� huynh t�m hi�u v� vi�c luy�n ch� ��n d��c.");
	else
		strTalk = {
			"�a t� s� gi�p �� c�a thi�u hi�p, kh�ng bi�t hi�n t�i ta c� th� nh�p ph�i ch�a?",
			"C�n L�n ph�i lu�n ch�o ��n hi�p s�, nh�ng hi�n gi� ta ph�i �i l�m nhi�m v� kh�n cho s� ph�, e l� s� vi�c ph�i ho�n l�i. N�u <sex> mu�n nh�p m�n ngay b�y gi�, c� th� ��n t�m s� �� c�a ta Tri�u T� B�nh, �� �y s� ng��i ��n g�p ch��ng m�n. C�n n�u kh�ng v�i, c� th� ��i ta tr� v� r�i m�i �i, sao h�?",
			"(N�u ta ��i huynh �y tr� v�, vi�c c�a Xa Lu�n B� V��ng  bi�t gi�i quy�t sao ��y? Hay c� �i g�p s� �� c�a huynh �y v�y.)",
			"Thi�u hi�p c� y�n t�m �i l�m nhi�m v� cho s� ph�, ��ng �� vi�c c�a ta l�m l� ��i s�, ta s� �i t�m s� �� c�a thi�u hi�p. ",
			"V�y c�ng ���c, ��i ta tr� v� th� ch�ng ta �� l� ��ng m�n, �n hi�p ngh�a c�a <sex> ta s� b�o ��p sau.",
			"Ch�t vi�c nh� ��ng n�n b�n t�m, <sex> ph�i c�n th�n h�nh s�.",
			}
		TaskTip("T�m Tri�u T� B�nh h�i v� vi�c gia nh�p C�n L�n ph�i v� vi�c ch� luy�n ��n d��c.");
		Msg2Player("T�m Tri�u T� B�nh h�i v� vi�c gia nh�p C�n L�n ph�i v� vi�c ch� luy�n ��n d��c.");
	end
	GivePlayerExp(SkeyXibei,"diergekaoyan")
	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,27);
end

--δ������ƽ�Ի�
function task_006_02_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Tri�u T� B�nh s� huynh s� gi�i ��p ���c th�c m�c c�a ng��i, h�y ��n h�i huynh �y."
			}
	else
		strTalk = {
			"S� �� Tri�u T� B�nh s� thay ta gi�i thi�u ng��i v�i ch��ng m�n, ta xin c�o t�."
			}
	end

	TalkEx("",strTalk);

end

--������ƽ�Ի���ȡȥ�������ռ���ǵ�����
function task_006_03_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Tri�u s� huynh, �� c� kh�c m�c v� vi�c luy�n ��n. Xin huynh ch� gi�o.",
			"Thu�t luy�n ��n? S� �� say m� nghi�n c�u k� n�ng c�a ph�i ta nh� v�y, s� huynh ���ng nhi�n kh�ng th� t� ch�i. Nh�ng gi� ta �ang ph� tr�ch canh gi� ph�ng luy�n ��n, kh�ng th� gi�i ��p th�c m�c cho s� �� ���c. S� ph� c� d�n c�n luy�n Kim ��n, mu�n luy�n ��n d��c, quan tr�ng nh�t l� kh�ng ch� h�a h�u, n�u l�a luy�n ��n kh�ng ��ng th� ��n d��c s� kh�ng th�nh, ta kh�ng g�nh n�i tr�ch nhi�m ��u.",
			"Ra luy�n ��n c�ng c�n ��n h�a h�u. Kh�ng bi�t ��n d��c bao gi� m�i ho�n th�nh, �� s� huynh gi�i ��p cho ��?",

			}
	else
		strTalk = {
			"C� ph�i Tri�u T� B�nh thi�u hi�p kh�ng? T� l�u �� nghe danh C�n L�n ph�i c� thu�t luy�n ��n cao si�u, mu�n gia nh�p C�n L�n ph�i h�c ngh�, Di�p T� Thu thi�u hi�p n�i ta c� th� nh� ng��i ��a ta t�i g�p ch��ng m�n. Xin thi�u hi�p gi�p ��.",
			"Ng��i ���c Di�p s� huynh ti�n c�, h�n l� hi�p s� ch�nh ngh�a r�i, �i g�p ch��ng m�n l� chuy�n nh�, ta ���ng nhi�n s� gi�p.",
			"Hay qu�, �a t� Tri�u thi�u hi�p.",
			"Nh�ng gi� ta �ang ph� tr�ch canh gi� ph�ng luy�n ��n, kh�ng th� t� � r�i b� c��ng v�, s� ph� c� d�n hi�n gi� c�n ph�i luy�n Kim ��n, khi luy�n ��n, quan tr�ng nh�t l� ph�i kh�ng ch� h�a h�u, n�u l�a luy�n ��n kh�ng ��ng th� ��n d��c s� kh�ng th�nh, ta kh�ng g�nh n�i tr�ch nhi�m ��u.",
			"Ra luy�n ��n c�ng c�n ��n h�a h�u. Kh�ng bi�t ��n d��c bao gi� m�i ho�n th�nh, �� thi�u hi�p gi�i ��p th�c m�c cho ta?",

			}
	end

	TalkEx("task_006_03_0_1",strTalk);


end

-- ���Ի�
function task_006_03_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Kh�ng n�i ch�c ���c, c� th� ch� m�y canh gi�, c�ng c� th� m�t m�y ng�y m�y ��m. N�u s� �� mu�n ���c gi�i ��p nhanh, c� th� gi�p ta t�m �t l�u hu�nh v� l�m d��c d�n, l�u hu�nh t�ch t� d��c kh�, gi�p r�t ng�n th�i gian luy�n ��n.",
			"���c, kh�ng th�nh v�n ��. Nh�ng kh�ng bi�t � ��u c� l�u hu�nh?",
			"T�ng 1 C� D��ng ��ng � b�n ngo�i Long M�n tr�n c� nhi�u kim th�ch, nh�ng b�n �m Nh�t S� ��c chi�m vi�c khai th�c l�u hu�nh, n�u s� �� mu�n l�y l�u hu�nh, th� ph�i ngh� c�ch ��i ph� v�i ch�ng.",
			}
	else
		strTalk = {
			"Kh�ng n�i ch�c ���c, c� th� ch� m�t v�i canh gi�, c�ng c� th� m�t m�y ng�y m�y ��m. D��ng nh� <sex> r�t n�ng l�ng mu�n g�p ch��ng m�n? Ta c� m�t c�ch r�t ng�n th�i gian luy�n ��n, m�t khi ��n d��c luy�n th�nh, ta c� th� ��a ng��i �i g�p ch��ng m�n ngay. ��ng � kh�ng?",
			"(T�n n�y th�t ��ng gh�t, d�m uy hi�p c� ta. M� th�i, ng��i l�m ��i s� kh�ng c�u n� ti�u ti�t.)",
			"Luy�n ��n c�ng c� nhi�u b� ki�p v�y sao? C�ng ng�y ta c�ng th�ch th� v�i thu�t luy�n ��n n�y ��y. Kh�ng bi�t �� l� c�ch g�?",
			"N�u mu�n t�ng t�c �� luy�n ��n, c� th� d�ng l�u hu�nh l�m d��c d�n, l�u hu�nh t�ch t� d��c kh�, gi�p r�t ng�n th�i gian ch� luy�n, ti�c l� ph�ng luy�n ��n �� h�t m�n n�y.",
			}
	end

	TalkEx("task_006_03_0_2",strTalk);

end

-- ���Ի�
function task_006_03_0_2()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Chuy�n n�y c� g� kh�? C� ��n xin m�t �t v� ��y l� ���c ch� g�.",
			"(Ti�u t� n�y ng�c th�t, n�u xin ���c ta �� xin t� l�u, ��u c�n ng�i ��y ph� l�i v�i h�n.)",
			"��ng v�y ��ng v�y, h�y �i xin m�t �t v� ��y, 10 ph�n l� ��. Nh� ��ng v�o qu� s�u trong ��ng, t��ng truy�n C� D��ng ��ng c� C� D��ng th� tr�n gi�, �i v�o qu� s�u s� b� d� th� t�n c�ng.",
			}
	else
		strTalk = {
			"Ra l� v�y. Huynh c� th� cho ta bi�t � ��u c� l�u hu�nh, ta s� mang v� cho huynh.",
			"<sex> th�t t�t b�ng. T�ng 1 C� D��ng ��ng � b�n ngo�i Long M�n tr�n c� nhi�u kim th�ch, nh�ng b�n �m Nh�t S� �� ��c chi�m vi�c khai th�c l�u hu�nh, n�u mu�n c� ���c l�u hu�nh, c�n ph�i t�m c�ch ��i ph� v�i ch�ng.",
			"C�ng ��u kh�, ta c� ��n xin m�t �t l� ���c ch� g�.",
			"(Ti�u t� n�y ng�c th�t, n�u xin ���c ta �� xin t� l�u, ��u c�n ng�i ��y ph� l�i v�i h�n.)",
			"��ng v�y ��ng v�y, h�y �i xin m�t �t v� ��y, 10 ph�n l� ��. Nh� ��ng v�o qu� s�u trong ��ng, t��ng truy�n C� D��ng ��ng c� C� D��ng th� tr�n gi�, �i v�o qu� s�u s� b� d� th� t�n c�ng.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,28);
	CreateTrigger(0,1224,KILL_XB_ANRISHI);--ɱ�ִ�����
	TaskTip("��n T�ng 1 C� D��ng ��ng, l�y 10 l�u hu�nh t� tay �m Nh�t S�.");
	Msg2Player("��n T�ng 1 C� D��ng ��ng, l�y 10 l�u hu�nh t� tay �m Nh�t S�.");
	GivePlayerExp(SkeyXibei,"jiazhuangrumen")
end

--���ػ�δ����10�����
function task_006_04_0()

local strTalk = {};

	--����10�����
	if GetItemCount(2,0,695) >= 10 then

		--�����ɵ��ӶԻ�
		if GetPlayerRoute() == 100 then
			strTalk = {
				"10 l�u hu�nh�� t�m �� ch�a? B�n �m Nh�t S� ch�c kh�ng d� ��i ph� h�?",
				"�� t�m �� r�i, �m Nh�t S� ��ng l� kh�ng d� ��i ph�. Ch�c ch�ng bao l�u ��n d��c s� ho�n th�nh ph�i kh�ng?",
				"(Ha ha, ta c� ���c l�u hu�nh m� ch�ng m�t ch�t c�ng s�c. �m Nh�t S� � ng��i ��ng th� m�nh, ��c chi�m l�u hu�nh, xem ta ti�u t� n�y c�ng c� ch�t b�n l�nh, vi�c thu th�p Ti�u th�ch ch�c c�ng giao cho h�n lu�n v�y.)",
				"�� c� l�u hu�nh l�m d��c d�n, qu� tr�nh luy�n ��n s� r�t ng�n ���c v�i canh gi�, nh�ng n�u ng��i mu�n nhanh h�n n�a, th� h�y t�m th�m �t Ti�u th�ch v� ��y.",
				}
		else
			strTalk = {
				"10 l�u hu�nh�� t�m �� ch�a? B�n �m Nh�t S� ch�c kh�ng d� ��i ph� h�?",
				"�� t�m �� r�i, �m Nh�t S� ��ng l� kh�ng d� ��i ph�. Ch�c ch�ng bao l�u ��n d��c s� ho�n th�nh ph�i kh�ng?",
				"(Ta c� ���c l�u hu�nh m� ch�ng m�t ch�t c�ng s�c. �m Nh�t S� � ng��i ��ng th� m�nh, ��c chi�m l�u hu�nh, xem ta ti�u t� n�y c�ng c� ch�t b�n l�nh, vi�c thu th�p Ti�u th�ch ch�c c�ng giao cho h�n lu�n v�y.)",
				}
		end

		TalkEx("task_006_04_0_1",strTalk);

	--û�д�����Ʒand�������񴥷���
	else
		--�����ɵ��ӶԻ�
		if GetPlayerRoute() == 100 then
			strTalk = {
				"�m Nh�t S� � t�ng 1 C� D��ng ��ng ��c chi�m vi�c khai th�c l�u hu�nh, ng��i h�y �i l�y 10 ph�n v� ��y, nh�ng nh� ��ng v�o s�u trong ��ng, �� tr�nh b� d� th� t�n c�ng."
				}
		else
			strTalk = {
				"�m Nh�t S� � t�ng 1 C� D��ng ��ng ��c chi�m vi�c khai th�c l�u hu�nh, ng��i h�y �i l�y 10 ph�n v� ��y, nh�ng nh� ��ng v�o s�u trong ��ng, �� tr�nh b� d� th� t�n c�ng."
				}
		end

		if	GetTrigger(KILL_XB_ANRISHI) == 0 then
			CreateTrigger(0,1224,KILL_XB_ANRISHI);
			TaskTip("��n T�ng 1 C� D��ng ��ng, t�m Minh Nguy�t S� l�y 10 l�u hu�nh.");
			Msg2Player("��n T�ng 1 C� D��ng ��ng, t�m Minh Nguy�t S� l�y 10 l�u hu�nh.");
		end

		TalkEx("",strTalk);
	end
end

-- ���Ի�
function task_006_04_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"�a? Ti�u th�ch c�ng c� th� l�m d��c d�n ���c sao?",
			"Ti�u th�ch tuy kh�ng th� l�m d��c d�n, nh�ng c� t�c d�ng t�ng h�a th�. N�u cho �t Ti�u th�ch v�o ng�n l�a, l�a s� m�nh h�n, t�c �� luy�n ��n c�ng s� ���c ��y nhanh.",
			"ra v�y. Ti�u th�ch ph�i ch�ng c�ng � t�ng 1 C� D��ng ��ng?",
			"S� �� th�t th�ng minh. Minh Nguy�t S� v� �m Nh�t S� � t�ng 1 C� D��ng ��ng c�u k�t v�i nhau, ��c chi�m h�t vi�c khai th�c kim th�ch � ��, Minh Nguy�t S� n�m gi� Ti�u th�ch, n�u <sex> �� c� th� l�y ���c l�u hu�nh, Ti�u th�ch ch�c c�ng kh�ng th�nh v�n ��. T��ng t� ch� c�n 10 ph�n l� ��.",
			}
	else
		strTalk = {
			"�� c� l�u hu�nh l�m d��c d�n, qu� tr�nh luy�n ��n s� r�t ng�n ���c v�i canh gi�, nh�ng n�u ng��i mu�n nhanh h�n n�a, th� ta c�ng c� c�ch. Kh�ng bi�t <sex> mu�n ti�p t�c ��i, hay l� nghe � ki�n c�a ta?",
			"C�n c� c�ch nhanh h�n n�a �? ���ng nhi�n l� c�ng nhanh c�ng t�t r�i. Xin c� n�i.",
			"Mu�n t�ng t�c �� luy�n ��n ngo�i vi�c s� d�ng d��c d�n, c�n c� th� t�ng th�m h�a th�. Ti�u th�ch l� m�t trong c�c lo�i h�a th�ch, n�u cho Ti�u th�ch v�o l�a, th� l�a s� m�nh l�n, vi�c luy�n ��n s� nhanh h�n.",
			"Ra v�y, ch�ng l� Ti�u th�ch c�ng � t�ng 1 C� D��ng ��ng?",
			}
	end

	TalkEx("task_006_04_0_2",strTalk);

end

-- ���Ի�
function task_006_04_0_2()

local strTalk = {}

	--�����ɵ��ӶԻ�
		if GetPlayerRoute() == 100 then
			strTalk = {
				"(Qu� nhi�n l�i ph�i ��n C� D��ng ��ng, �m Nh�t S� �� kh� ��i ph�, e Minh Nguy�t S� c�ng kh�ng d� x�. Ta nghi ng� h�n mu�n c� kim th�ch nh�ng l�i ng�i ��i ph� b�n kia, n�n b�t ta l�m vi�c cho h�n. Th�i th� ta c� gi� ng�y xem sao.)",
				"Tri�u ��i ca qu� nhi�n d�y d�n kinh nghi�m, �� c�n ph�i th�nh gi�o nhi�u.",
				"Qu� khen qu� khen. Nh� ��ng v�o s�u trong ��ng.",
				}
		else
			strTalk = {
				"<sex> th�ng minh l�m. Minh Nguy�t S� v� �m Nh�t S� � t�ng 1 C� D��ng ��ng c�u k�t v�i nhau, ��c chi�m h�t vi�c khai th�c kim th�ch � ��, Minh Nguy�t S� n�m gi� Ti�u th�ch, n�u <sex> �� c� th� l�y ���c l�u hu�nh, Ti�u th�ch ��i v�i <sex> ch�c c�ng kh�ng th�nh v�n ��. T��ng t� ch� c�n 10 ph�n l� ��.",
				"(T�n n�y ���c n��c l�m t�i, �m Nh�t S� �� kh� ��i ph�, e Minh Nguy�t S� c�ng kh�ng d� x�. Ta nghi ng� h�n mu�n c� kim th�ch nh�ng l�i ng�i ��i ph� b�n kia, n�n b�t ta l�m vi�c cho h�n. Th�i th� ta c� gi� ng�y xem sao.)",
				"Ta l� n��c l� c�i, ch�ng bi�t g� c�, c�ng may �� c� Tri�u ��i ca h��ng d�n, ta r�t bi�t �n. Tri�u ��i ca d�y d�n kinh nghi�m nh� v�y, sau n�y ta ph�i th�nh gi�o nhi�u.",
				"Qu� khen qu� khen. Nh� ��ng v�o s�u trong ��ng.",
				}
		end

	TalkEx("",strTalk);
	DelItem(2,0,695,10);
	RemoveTrigger(GetTrigger(KILL_XB_ANRISHI));
	SetTask(TASK_XB_ID,29);
	CreateTrigger(0,1225,KILL_XB_MINGYUESHI);
	TaskTip("��n t�ng 1 C� D��ng ��ng, l�y 10 Ti�u th�ch t� tay Minh Nguy�t S�.");
	Msg2Player("��n t�ng 1 C� D��ng ��ng, l�y 10 Ti�u th�ch t� tay Minh Nguy�t S�.");
	GivePlayerAward("Award_XB_12","Easy");
	GivePlayerExp(SkeyXibei,"anrishi")
end

--���ػ�δ����10����ʯ
function task_006_05_0()

local strTalk = {};

	--����10����ʯ
	if GetItemCount(2,0,696) >= 10 then

		--�����ɵ��ӶԻ�
		if GetPlayerRoute() == 100 then
			strTalk = {
				"��y l� 10 Ti�u th�ch, Tri�u s� huynh c�n d�n d� g� kh�ng?",
				"(Qu� nhi�n l�i th�nh c�ng r�i. ��i ta �em l�u hu�nh v� Ti�u th�ch ch� luy�n th�m, l�i c� ���c nhi�u ��n d��c. H�, �m Nh�t S� v� Minh Nguy�t S� gi�nh h�t kim th�ch c�a ta, khi�n ta kh�ng th� luy�n Ng� Th�ch t�n �em b�n, ch�ng kh�c n�o ch�t ��t ngu�n l�i c�a ta. Ti�u t� n�y kh� kh�o, b�o g� l�m n�y, sau n�y c� th� sai b�o ���c ��y.)",
				"B�y nhi�u l� �� r�i, c� th� r�t ng�n ���c nhi�u canh gi� l�m. Ch�ng ph�i ng��i c� th�c m�c g� sao? H�i �i.",
				"Tri�u s� huynh ���c giao canh gi� ph�ng luy�n ��n, qu� nhi�n tinh th�ng ��n thu�t, kh�ng bi�t ph�i ta c� nh�ng ��n d��c g� c� c�ng hi�u k�o d�i tu�i th� hay kh�ng?",
				"���ng� ���ng nhi�n l� c�, hi�n s� ph� �ang c�n ch� luy�n H�nh V�n ��n, c�n luy�n 12 canh gi� m�i xong, nh�ng hi�n nay �� c� l�u hu�nh l�m d��c d�n, c� Ti�u th�ch t�ng h�a th�, h�n 4 canh gi� n�a l� ho�n th�nh r�i. �m... ��n n�y c�ng c� c�ng hi�u k�o d�i tu�i th� ��.",
				}
		else
			strTalk = {
				"��y l� 10 Ti�u th�ch, Tri�u ��i ca c�n d�n d� g� kh�ng?",
				"(Qu� nhi�n l�i th�nh c�ng r�i. ��i ta �em l�u hu�nh v� Ti�u th�ch ch� luy�n th�m, l�i c� ���c nhi�u ��n d��c. H�, �m Nh�t S� v� Minh Nguy�t S� gi�nh h�t kim th�ch c�a ta, khi�n ta kh�ng th� luy�n Ng� Th�ch t�n �em b�n, ch�ng kh�c n�o ch�t ��t ngu�n l�i c�a ta. Ti�u t� n�y kh� kh�o, b�o g� l�m n�y, mai n�y gia nh�p m�n ph�i, ta l�i c� th�m m�t tay sai ��c l�c r�i.)",
				"B�y nhi�u l� �� r�i, c� th� r�t ng�n ���c nhi�u canh gi� l�m. Sau khi ��n d��c ho�n th�nh, ta s� ��a ng��i ��n g�p ch��ng m�n, kh�ng qu�n n�i t�t cho ng��i m�y l�i.",
				"Ta c� th� nh�p m�n r�i sao? T� l�u ta �� ng��ng m� thu�t luy�n ��n c�a C�n L�n, d��ng nh� Tri�u ��i ca r�t c� kinh nghi�m, sau n�y nh�p m�n, nh�t ��nh ta s� c�n t�i th�nh gi�o.",
				"Thu�t luy�n ��n c�a C�n L�n ph�i n�i ti�ng kh�p thi�n h�, v� c�ng h�ng y�u ph�c ma l�i c�ng cao si�u h�n, <sex> gia nh�p C�n L�n, �� l� c�i ph�c c�a b� t�nh.",
				}
		end

		TalkEx("task_006_05_0_1",strTalk);


	--û�д�����Ʒand�������񴥷���
	else
		--�����ɵ��ӶԻ�
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Minh Nguy�t S� � t�ng 1 C� D��ng ��ng��c chi�m vi�c khai th�c Ti�u th�ch, ng��i h�y c� g�ng l�y ���c 10 ph�n, nh� l� ��ng v�o qu� s�u, �� ph�ng d� th� t�n c�ng."
				}
		else
			strTalk = {
				"Minh Nguy�t S� � t�ng 1 C� D��ng ��ng��c chi�m vi�c khai th�c Ti�u th�ch, ng��i h�y c� g�ng l�y ���c 10 ph�n, nh� l� ��ng v�o qu� s�u, �� ph�ng d� th� t�n c�ng."
				}
		end

		if	GetTrigger(KILL_XB_MINGYUESHI) == 0 then
			CreateTrigger(0,1225,KILL_XB_MINGYUESHI);
			TaskTip("��n t�ng 1 C� D��ng ��ng, l�y 10 Ti�u th�ch t� tay Minh Nguy�t S�.");
			Msg2Player("��n t�ng 1 C� D��ng ��ng, l�y 10 Ti�u th�ch t� tay Minh Nguy�t S�.");
		end

		TalkEx("",strTalk);
	end
end

--���Ի�
function task_006_05_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"(��ng gh�t, s� ph� ch� truy�n c�ch luy�n ��n cho Di�p T� Thu, c�n ta th�ch luy�n ��n nh� v�y th� ch� ���c ch��ng qu�n l� luy�n ��n, s� ph� qu� ki�ng d� ta, kh�ng bi�t c� th� qua m�t ���c t�n ti�u t� n�y kh�ng.)",
			"�, k� thu�t c�a ph�i ta ��ng l� xu�t th�n nh�p h�a, kh�ng bi�t s� huynh c� bi�t c�ch luy�n ��n kh�ng?",
			"Sao? C�i n�y� tr��c ti�n d�ng l�u hu�nh l�m d��c d�n, sau �� sau �� cho th�m c�c th�o d��c qu� nh� nh�n s�m, h� th� �, quan tr�ng l� ph�i kh�ng ch� h�a h�u, m�t khi luy�n th�nh, kh�ng nh�ng c� c�ng hi�u k�o d�i tu�i th�, n�u d�ng l�u c�n c� th� tr��ng sinh b�t l�o.",
			"(C� tr��ng sinh b�t l�o c�ng d�m ph�a ra, ch�c ch�n l� n�i d�i r�i. Tr��c ��y ta t�ng nghe n�i, d�ng l�u hu�nh Ti�u th�ch l�m thu�c l� c�ch ch� Ng� Th�ch t�n l�u truy�n t� th�i nh� ���ng, �n v�o kh�ng tr�ng ��c ch�t l� may l�m r�i, c�n mu�n l�a ta sao! M� khoan, m�c k� n� th�t hay gi�, ta ch� c�n chuy�n l�i ��n Xa Lu�n B� V��ng, th� coi nh� ho�n th�nh nhi�m v� c�n g�?)",
			}
	else
		strTalk = {
			"Kh�ng bi�t Tri�u ��i ca �ang luy�n lo�i ��n g�? C�n L�n ph�i c� ��n d��c n�o gi�p k�o d�i tu�i th� kh�ng?",
			"�, ��y l� H�nh V�n ��n m� s� ph� d�n ta luy�n ch�, c�n 12 canh gi� m�i xong, nh�ng gi� c� th�m l�u hu�nh l�m d��c d�n, l�i c� Ti�u th�ch tr� h�a, kho�ng 4 canh gi� n�a l� ho�n th�nh. �m... thu�c n�y c�ng c� c�ng hi�u k�o d�i tu�i th�.",
			"(��ng gh�t, s� ph� ch� truy�n c�ch luy�n ��n cho Di�p T� Thu, c�n ta th�ch luy�n ��n nh� v�y th� ch� ���c ch��ng qu�n l� luy�n ��n, s� ph� qu� ki�ng d� ta, kh�ng bi�t c� th� qua m�t ���c t�n ti�u t� n�y kh�ng.) ",
			"V�i th�n ��n n�y, khi ch� luy�n c� b� ki�p n�o kh�ng?",
			"Sao? C�i n�y� tr��c ti�n d�ng l�u hu�nh l�m d��c d�n, sau �� sau �� cho th�m c�c th�o d��c qu� nh� nh�n s�m, h� th� �, quan tr�ng l� ph�i kh�ng ch� h�a h�u, m�t khi luy�n th�nh, kh�ng nh�ng c� c�ng hi�u k�o d�i tu�i th�, n�u d�ng l�u c�n c� th� tr��ng sinh b�t l�o.",
			}
	end

	TalkEx("task_006_05_0_2",strTalk)

end

--���Ի�
function task_006_05_0_2()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Tri�u s� huynh qu� nhi�n tinh th�ng ��n thu�t, mong s� huynh ch� b�o th�m.",
			"S� �� kh�ch s�o qu�, ta c�n ph�i tr� v� ph�ng luy�n ��n, sau n�y c� v�n �� g� c� ��n t�m ta, ta s� gi�p cho.? (T�n n�y th�t ng�c, ta n�i v�y m� h�n c�ng tin.)",
			"���c, �� xin c�o t�.",
			"(Tri�u s� huynh n�y d��ng nh� ch� hi�u bi�t s� v� thu�t luy�n ��n, khi g�p Xa Lu�n B� V��ng  ta ph�i n�i khoa tr��ng m�t ch�t m�i ���c.)",
			}
	else
		strTalk = {
			"(C� tr��ng sinh b�t l�o c�ng d�m ph�a ra, ch�c ch�n l� n�i d�i r�i. Tr��c ��y ta t�ng nghe n�i, d�ng l�u hu�nh Ti�u th�ch l�m thu�c l� c�ch ch� Ng� Th�ch t�n l�u truy�n t� th�i nh� ���ng, �n v�o kh�ng tr�ng ��c ch�t l� may l�m r�i, c�n mu�n l�a ta sao! M� khoan, m�c k� n� th�t hay gi�, ta ch� c�n chuy�n l�i ��n Xa Lu�n B� V��ng, th� coi nh� ho�n th�nh nhi�m v� c�n g�?)",
			"(Thu�t luy�n ��n c�a C�n L�n ph�i ��ng l� xu�t qu� nh�p th�n, danh b�t h� truy�n!",
			"���ng nhi�n r�i. Ng��i mau chu�n b� �i, m�y canh gi� n�a, khi ��n d��c luy�n th�nh, ch�ng ta s� t�i g�p ch��ng m�n.",
			"���c. �n c�a Tri�u ��i ca, mai n�y ta nh�t ��nh s� b�o ��p.",
			"(B�y gi� ch�nh l� th�i c� t�t nh�t �� ta chu�n ��y. Khi ��n ch� Xa Lu�n B� V��ng, ta ph�i khoa tr��ng v� thu�t luy�n Tr��ng sinh b�t t� ��n v�i h�n m�i ���c.)",
			}
	end

	TalkEx("",strTalk);
	DelItem(2,0,696,10);
	RemoveTrigger(GetTrigger(KILL_XB_MINGYUESHI));
	SetTask(TASK_XB_ID,30);
	TaskTip("��n b�o v�i Xa Lu�n B� V��ng v� Tr��ng sinh b�t t� ��n.");
	Msg2Player("��n b�o v�i Xa Lu�n B� V��ng v� Tr��ng sinh b�t t� ��n.");
	GivePlayerAward("Award_XB_13","Easy");
	GivePlayerExp(SkeyXibei,"mingyueshi")
end



--��û�ͳ��ְ����Ի�
function task_006_05_1()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng��i h�y ��i th�m 1 l�t, khi ��n d��c luy�n th�nh, ta s� c�ng ng��i ��n g�p ch��ng m�n.",
			"(B�y gi� ch�nh l� th�i c� t�t nh�t �� ta chu�n ��y. Khi ��n ch� Xa Lu�n B� V��ng, ta ph�i khoa tr��ng v� thu�t luy�n Tr��ng sinh b�t t� ��n v�i h�n m�i ���c.)",
			}
	else
		strTalk = {
			"Sau n�y s� �� c� v�n �� g� c� ��n t�m ta, ta s� gi�p cho.",
			"(Tri�u s� huynh n�y d��ng nh� ch� hi�u bi�t s� v� thu�t luy�n ��n, khi g�p Xa Lu�n B� V��ng  ta ph�i n�i khoa tr��ng m�t ch�t m�i ���c.)",
			}
	end

	TalkEx("",strTalk);

end

--�복�ְ����Ի���ɵڶ�������
function task_006_06_0()

local strTalk = {
	"Sao r�i? L�n �i C�n L�n ph�i n�y c� thu ho�ch g� kh�ng?",
	"Tr�i kh�ng ph� l�ng ng��i, sau nhi�u n�m �n m�nh t�i ph�ng luy�n ��n c�a C�n L�n ph�i, ta �� bi�t ���c b� ph��ng v� nguy�n li�u �� luy�n Tr��ng sinh b�t t� ��n.",
	"Ha ha, c� th� t� do ra v�o ph�ng luy�n ��n c�a C�n L�n ph�i, <sex> qu� nhi�n th�n th� b�t ph�m! Ng��i �� t�m ra b� m�t g�?",
	"(Chuy�n v� ph�ng luy�n ��n c�a C�n L�n qu� nhi�n thu h�t ���c s� ch� � c�a h�n, ta ph�i �em l�i n�i c�a Tri�u T� B�nh ph�ng ��i, th�u d�t th�m m�i ���c.)",
	"Tr��ng sinh b�t t� ��n c� nguy�n li�u ch�nh l� Ng� kim, b�t th�ch, Tam ho�ng, k�t h�p v�i c�c th�o d��c qu� nh� Nh�n s�m ng�n n�m, h� th� �, d�ng Kim th�ch ���c C� D��ng th� tr�n gi� trong C� D��ng ��ng l�m d��c d�n, d�ng chi�c Th�i Thanh c� ��nh t�i ��nh n�i C�n L�n, �� h�p th� tinh hoa tr�i ��t l�m chi�c ��nh luy�n ��n, nung b�ng ng�n l�a thu�n d��ng, h�a gi�i kh� ng�n n�m trong su�t 7 ng�y, t�p h�p S�n tr�ch chi b�o, 49 ng�y m�i th�nh c�ng.",
	}

	TalkEx("task_006_06_0_1",strTalk);

end

--���Ի�
function task_006_06_0_1()

local strTalk = {
	"Thu�t luy�n ��n c�a C�n L�n qu� nhi�n cao th�m. ��n r�ng C� D��ng th� trong C� D��ng ��ng tr�n gi� d� b�o, ch�ng l� chuy�n c� th�t sao?",
	"��ng v�y, ta t�ng ��n C� D��ng ��ng xem x�t, nh�ng n�i c� C� D��ng th� lai v�ng, ��u c� l�u quang, �t c� d� b�o. C�n n�a, khi luy�n ��n c�n ph�i l�n ��nh n�i C�n L�n n�i t� h�p linh kh�, d�ng Th�i Thanh ��nh ch� luy�n ��ng 49 ng�y, c� ti�n duy�n th� s� luy�n th�nh. M�t khi �� luy�n th�nh c�ng, d�ng ��n n�y s� th� nh� Kim ng�c, b�t l�o b�t t�.",
	"H�a ra n�i luy�n ��n kh�ng ph�i � C�n L�n, ch� tr�ch V��ng t�c T�y H� nhi�u l�n ��n ��y c�u thu�t ��u tay tr�ng tr� v�. T�t l�m, Ha ha, t�nh b�o c�a ng��i r�t c� gi� tr�, ta s� b�m b�o l�i v�i V��ng t�c T�y H�. L�n th� th�ch th� 2 n�y coi nh� ng��i th�ng qua r�i. Kh�ng ng� n�ng l�c t�nh b�o c�a ng��i l�i xu�t s�c nh� v�y, Nh�t Ph�m ���ng r�t th�ch nh�ng nh�n t�i nh� th�. Ng��i h�y ngh� ng�i �i, ��i sau khi ho�n th�nh th� th�ch cu�i c�ng, ng��i s� ���c x�p v�o h�ng ng� c�a Nh�t Ph�m ���ng.",
	"(Cu�i c�ng c�ng gi�nh ���c l�ng tin c�a h�n. Ha ha, ��i khi V��ng t�c T�y H� c�a c�c ng��i t�m th�y Th�i Thanh ��nh � n�i C�n L�n r�ng l�n, ch�c h�n Nh�t Ph�m ���ng �� b� san th�nh b�nh ��a r�i.)",
	"Ch�c ch�n r�i, ta ch� mong c� ch� y�n th�n th�i.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,31);
	TaskTip("Sau khi ngh� ng�i Xa Lu�n B� V��ng s� giao nhi�m v� th� th�ch cu�i c�ng �� ���c nh�n v�o Nh�t Ph�m ���ng.");
	Msg2Player("Sau khi ngh� ng�i Xa Lu�n B� V��ng s� giao nhi�m v� th� th�ch cu�i c�ng �� ���c nh�n v�o Nh�t Ph�m ���ng.");
	GivePlayerAward("Award_XB_14","Easy");
	GivePlayerExp(SkeyXibei,"busidan")
end

---------------------------------- ������07�ж��----------------------------------
--��ȡһƷ�õ���������
function task_007_01_0()

local strTalk = {
	"Vi�c gi�i tho�t S�t th� Oa Oa ng��i �� l�m r�t t�t, th�m d� thu�t luy�n ��n c�a C�n L�n c�ng r�t xu�t s�c, ch�a nh�p ���ng m� �� l�p ���c 2 c�ng tr�ng, Nh�t Ph�m ���ng c� ���c nh�n t�i nh� ng��i, c�n s� ��i T�ng hay sao? Nh�ng Nh�t Ph�m ���ng x�a nay ch� nh�n ng��i t�i, v� lu�n tu�n th� quy t�c ��o nh��c l�u c��ng.",
	"��o nh��c l�u c��ng l� sao?",
	"Hi�n nay c� r�t nhi�u h�o ki�t v� l�m mu�n ��n v�i Nh�t Ph�m ���ng, ���ng nhi�n Nh�t Ph�m ���ng ta c�ng ph�i ch�n l�c k� c�ng. Nay c� m�t ��o ph�m c�a ��i T�ng l� Di Tu ��i h�n c�ng �ang nh�n th� th�ch nh�p ���ng, �� ���c ph�i ��n Quang Minh ��nh �i�u tra ��ng t�nh c�a Minh gi�o. Ng��i v� h�n, b�n ta ch� ch�n l�y 1, trong c�c ng��i ch�c ch�n ph�i c� m�t ng��i b� m�ng.",
	"Sao l�i ph�i c� m�t ng��i b� m�ng? Ta v� h�n kh�ng th� c�ng nhau gia nh�p Nh�t Ph�m ���ng sao?",
	}

	TalkEx("task_007_01_0_1",strTalk);

end

--���Ի�
function task_007_01_0_1()

local strTalk = {
	"N�c c��i, Nh�t Ph�m ���ng ��u ph�i l� n�i t� n�n, ng��i ��ng th� c� �ch g� ch�? Gi�a ng��i v� h�n ph�i tranh nhau danh hi�u ��u Danh Tr�ng, n�u ng��i kh�ng gi�t h�n, th� ��nh ng�i ��i h�n t�i gi�t ng��i. Nh�t Ph�m ���ng x�a nay kh�ng ch�o ��n k� b�c nh��c, n�u h�n kh�ng b�ng ng��i th� gi� l�i l�m g�? Ng��c l�i, v�i ng��i c�ng v�y.",
	"Ra c� m�t ng��i ph�i b� m�ng l� ch� cu�c t�n s�t gi�a ta v� h�n, ph��ng ph�p ��o nh��c l�u c��ng n�y qu� cao minh, nh�ng c�ng qu� t�n nh�n. Ta hi�u r�i, �ng c� ��i tin c�a ta.",
	"Ha ha, t�t, <sex> qu� nhi�n s�ng kho�i, ��y s� l� th� th�ch cu�i c�ng c�a ng��i, Nh�t Ph�m ���ng �ang r�ng c�a ch� ��n ng��i ��.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,32);
	TaskTip("Di Tu ��i h�n �ang � Quang Minh ��nh, h�y ��n �� ��nh b�i h�n �� c� c�ch gia nh�p Nh�t Ph�m ���ng.");
	Msg2Player("Di Tu ��i h�n �ang � Quang Minh ��nh, h�y ��n �� ��nh b�i h�n �� c� c�ch gia nh�p Nh�t Ph�m ���ng.");
end

--δ������󺺶Ի�
function task_007_01_1()

local strTalk = {
	"C� T� ��i h�n hi�n �ang � Quang Minh ��nh �i�u tra chuy�n Minh gi�o, h�y �em th� c�p c�a h�n ��n g�p ta, ng��i s� l� th�nh vi�n c�a Nh�t Ph�m ���ng.",
	}

	TalkEx("",strTalk);

end

--��ɵ��������飬�복�ֶԻ�����һƷ��
function task_007_02_0()

local strTalk = {
	"Di Tu ��i h�n �� b� di�t, ��y l� th� c�p c�a h�n, ta c� th� gia nh�p Nh�t Ph�m ���ng r�i ch�?",
	"Ha ha, th�ng r�i �? <sex> qu� nhi�n n�ng l�c si�u ph�m. Ba th� th�ch �� qua, kh�ng ng� tu�i tr� m� t�i cao ��n v�y.? (Nh�t Ph�m ���ng hoan ngh�nh s� gia nh�p c�a ng��i, gi� ng��i l� th�ch kh�ch c�a Nh�t Ph�m ���ng. Nh�t Ph�m ���ng t� ch�c nghi�m minh, v� c�n ph�i th�t c�n tr�ng khi h�nh s�. Ng��i trong Nh�t ph�m ����ng g�p �m hi�u n�y, �t s� t�i gi�p ��.)",
	"Ta nguy�n c�ng hi�n h�t s�c m�nh.",
	"Ng��i b� L�c Phi�n M�n truy n� �� l�u, nh�ng ch� m�t L�c Phi�n M�n c�n con v�n ch�a x�ng l� ��i th� c�a b�n ta, sau n�y ng��i c� y�n t�m, gia nh�p Nh�t Ph�m ���ng r�i th� L�c Phi�n M�n s� kh�ng th� l�m phi�n ng��i n�a. Ch� c�n ng��i t�n trung v�i Nh�t Ph�m ���ng, mai n�y ph� qu� danh l�i ��u trong t�m tay. H�y ngh� ng�i ��, c� nhi�m v� m�i ta s� t�m ng��i.",
	"���c. Xin c�o t�.",
	"(M�t kh�ng �t c�ng s�c m�i v�o ���c Nh�t Ph�m ���ng, ta ph�i b�o l�i v�i �u D��ng ti�n b�i m�i ���c. Kh�ng bi�t th��ng t�ch c�a Vi�n B� kho�i th� n�o r�i, ta c�ng lo qu�, hay l� ��n nha m�n tr��c v�y.)",
	}

	DelItem(2,0,697,1);--ɾȥ������ͷ
	SetTask(TASK_XB_ID,34);
	TalkEx("",strTalk);
	TaskTip("��n nha m�n ph� Ph�ng T��ng h�i th�m th��ng t�ch c�a Vi�n B� kho�i.");
	Msg2Player("��n nha m�n ph� Ph�ng T��ng h�i th�m th��ng t�ch c�a Vi�n B� kho�i.");
	GivePlayerAward("Award_XB_15","Easy");
	GivePlayerExp(SkeyXibei,"disanjianshi")
	add_xb_title(2);--���һƷ�ô̿ͳƺ�
end

--δ����貶ͷ�Ի�
function task_007_02_1()

local strTalk = {
	"Ng��i �� l� th�nh vi�n c�a b�n ���ng, h�y lui xu�ng ngh� ng�i, l�t sau s� c� nhi�m v� m�i.",
	"(Kh�ng bi�t th��ng t�ch c�a Vi�n B� kho�i th� n�o r�i, ta th�t lo qu�, hay l� c� ��n nha m�n m�t chuy�n.)",
	}

	TalkEx("",strTalk);

end

--����貶ͷ�Ի�ѯ��Ԭ����ȥ��
function task_007_03_0()

local strTalk = {
	"V� b� ��u n�y c� quen bi�t Vi�n Phi V�n Vi�n B� kho�i kh�ng?",
	"Vi�n B� kho�i l� tr� c�t c�a ph� nha n�y, b� ��u nha d�ch nh� b�n ta ��u r�t k�nh tr�ng ng��i, sao l�i kh�ng bi�t danh Vi�n B� kho�i ch�? <sex> ��n t�m c� vi�c g� kh�ng?",
	"Ta c� duy�n k�t giao v�i Vi�n b� ��u, ���c bi�t g�n ��y huynh �y b� th��ng, ta r�t lo, kh�ng bi�t hi�n gi� huynh �y �ang � ��u?",
	"Vi�n B� kho�i th�ng minh, t�i tr�, x�a nay h�nh s� ��u r�t c�n tr�ng qu� �o�n, kh�ng hi�u sao l�n n�y l�i s� � �� ph�m nh�n ch�y tho�t, b�n th�n c�n b� th��ng. Nha m�n v�n l� n�i th� phi, nhi�u k� ti�u nh�n v�n kh�ng ph�c Vi�n B� kho�i �� �� d�u v�o l�a, t�u v�i tri�u ��nh v� s� th�t tr�ch c�a ng��i, khi�n uy danh c�a Vi�n B� kho�i gi�m s�t h�n.",
	}

	TalkEx("task_007_03_0_1",strTalk);

end

--���Ի�
function task_007_03_0_1()

local nMapName,nXpos,nYpos = SelectMapData(3);
local nTriggerID = Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][7];
local strTalk = {
	"Kh�ng ng� s� vi�c l�i l�m kh� Vi�n B� kho�i ��n v�y.",
	"(C�ng t�i ta, �� l�m li�n l�y Vi�n B� kho�i, c�n �� huynh �y ch�u t�i th�t tr�ch. Vi�n B� kho�i v� ta b�o n��c t��ng ph�ng, nh�ng l�i ch�n th�nh gi�p �� ta, kh�ng t�nh to�n thi�t h�n, ��ng l� m�t ng��i t�t hi�m c�.)",
	"��ng v�y, b�n ta c�ng t��ng Vi�n B� kho�i s� an t�m t�nh d��ng m�t th�i gian, kh�ng ng� ch� v�i ng�y sau, ng��i �� l�n ���ng ��n "..nMapName.."("..nXpos..", "..nYpos..") b�t t�i ph�m, nha m�n tr�n d��i ��u t� h�o v� ng��i. N�u <sex> ��nh �i t�m Vi�n B� kho�i, phi�n ��a gi�p chai L�c Phi�n M�n th��ng d��c n�y cho ng��i, b�n ta ��u r�t lo l�ng cho th��ng t�ch c�a Vi�n B� kho�i.",
	"��ng kh�ch s�o, ta nh�t ��nh s� ��a thu�c n�y ��n tay Vi�n V�n Phi. C�o t�.",
	}

	TalkEx("",strTalk);
	AddItem(2,0,749,1,1);--�õ���������ҩ
	SetTask(TASK_XB_ID,35);
	CreateTrigger(2,nTriggerID,RECT_XB_YUANFEIYUN);--��ͼ������
	TaskTip("��n "..nMapName.."("..nXpos..", "..nYpos..") ��a thu�c c�a L�c Phi�n M�n cho Vi�n V�n Phi.");
	Msg2Player("��n "..nMapName.."("..nXpos..", "..nYpos..") ��a thu�c c�a L�c Phi�n M�n cho Vi�n V�n Phi.");

end

--��δ��Ԭ���ƶԻ���������������
function task_007_03_1()

local nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
local nMapName = Map_Data[nMapDataID][1];
local nXpos,nYpos = Map_Data[nMapDataID][5],Map_Data[nMapDataID][6];
local nTriggerID = Map_Data[nMapDataID][7];
local strTalk = {
	"Vi�n B� kho�i �� t�i "..nMapName.."("..nXpos..", "..nYpos..") l�m vi�c, n�u ng��i �i t�m ng��i. Xin �em L�c Phi�n M�n th��ng d��c n�y theo, ��y l� t�m l�ng c�a c�c huynh �� trong nha m�n.",
	}

	TalkEx("",strTalk);

	if GetItemCount(2,0,749) < 1 then
		AddItem(2,0,749,1,1);--�õ���������ҩ
	end

	if GetTrigger(RECT_XB_YUANFEIYUN) == 0 then
		CreateTrigger(2,nTriggerID,RECT_XB_YUANFEIYUN);
		TaskTip("��n "..nMapName.."("..nXpos..", "..nYpos..") ��a thu�c c�a L�c Phi�n M�n cho Vi�n V�n Phi.");
		Msg2Player("��n "..nMapName.."("..nXpos..", "..nYpos..") ��a thu�c c�a L�c Phi�n M�n cho Vi�n V�n Phi.");
	end

end

--��Ԭ���ƶԻ�������ҩ
function task_007_07_0()

local strTalk = {
	"��n nha m�n ���c bi�t Vi�n B� kho�i th��ng t�ch ch�a l�nh, �� b�n ba c�ng vi�c, trong l�ng r�t lo l�ng, n�n ��n th�m, c�c b� ��u trong nha m�n c�ng nh� ta mang thu�c tr� th��ng cho ng��i. Vi�n B� kho�i h�t l�ng gi�p ��, nh�ng ta l�i l�m li�n l�y ��n ng��i, th�t �y n�y.",
	"<sex> c�n nh� ta t�ng b�o, mong ���c c�ng nhau u�ng r��u t�m s�? Kh�ng ti�c b�ng h�u ��n ca, ch� ti�c tri �m �t �i, sinh t� l� chuy�n nh�, ch� �au v� tri k� kh� c�u. Huynh v� ta b�o n��c t��ng ph�ng, nh�ng l�i th�n thi�t nh� c� nh�n. Gi�p �� b�ng h�u l� ni�m vui c�a ta, huynh kh�ng c�n �y n�y l�m g�.",
	"Nh�ng chung quy ta v�n khi�n huynh b� tr�ng th��ng, c�n ph�i ch�u oan �c. Vi�n huynh ��i x� v�i ta ch�n th�nh, nh�ng ta ch�a h�n �� b�o ��p ���c t�m l�ng, ta th�y r�t kh� x�.",
	"V�t th��ng v�t n�y c� ��ng g�. Nam nhi ��n ch�t tim v�n nh� s�t ��, ung dung th�n nhi�n, ch�t th��ng t�ch c� l� g�. H�n n�a chuy�n n��c nh�, tr��c nay ch� ph�n bi�t ��ng l�m v� kh�ng ��ng l�m, n�o c� ph�n th�t gi� ��ng sai? Ta ch� l�m nh�ng vi�c ta cho l� x�ng ��ng, v� d�c h�t s�c v� n�. L�i n�i d�m pha b�ng gi�, �y l� h�nh ��ng c�a ti�u nh�n, ��ng n�n b�n t�m. Huynh c�ng ��ng n�n �� b�ng, ng��i l�m ��i s� kh�ng c�u n� ti�u ti�t.",
	"Vi�n B� kho�i t�m l�ng bao dung r�ng m�, th�t khi�n ng��i ta kh�m ph�c, ch� tr�ch Vi�n B� kho�i l�i ���c giang h� t�n tr�ng ��n v�y. Mong r�ng s� vi�c kh�ng g�y �nh h��ng l�n ��n danh ti�ng c�a ng��i.",
	}

	TalkEx("task_007_07_0_1",strTalk);

end

--���Ի�
function task_007_07_0_1()

local strTalk = {
	"Sao <sex> l�i n�i v�y? Hai ta ��u lo l�ng cho v�n m�nh n��c nh�, <sex> v� c�u b� t�nh m� cam t�m d�n th�n v�o long ��m huy�t h�, b� ngo�i tai nh�ng l�i m�ng nhi�c ph�n qu�c ngh�ch th�n. Xin ��ng qu� b�n t�m v� vi�c n�y.",
	"N�m x�a ta c�ng t�ng l�m n�i gi�n cho ph� nha, bi�t r� l�m n�i gi�n n�u kh�ng c� d�ng kh� v� � ch� ki�n ��nh th� kh�ng th� duy tr� ��n ph�t cu�i. Kh�ng nh�ng ph�i t� nh�c nh� kh�ng ��nh l�p tr��ng c�a m�nh, c�n ph�i r�ng l��ng b�t ch�p nh�ng l�i d�m pha, c�ng ph�i ��i m�t v�i nhi�u quy�t ��nh kh� kh�n, ti�n tho�i l��ng nan. <sex> c�n h�t s�c th�n tr�ng, n�m �i�m y�u �� d� d�ng ��i ph� v�i k� th�.",
	"Ngay t� ��u ta �� nh�n th�c gi�n �i�p l� m�t th� th�ch r�t l�n. Tuy c�ng lo s�c ta kh�ng �� g�nh v�c, nh�ng sau khi nghe l�i t�m s� c�a Vi�n B� kho�i, ta quy�t d�c h�t s�c m�nh, �� kh�ng th�n v�i l�ng. �a t� nh�ng l�i v�ng ng�c c�a Vi�n B� kho�i, ta xin kh�c ghi trong l�ng.",
	"V�y l� t�t r�i, ta tin t��ng nh�n x�t c�a Tr��ng Ca m�n, v� c�ng tin v�o con m�t c�a ch�nh m�nh, <sex> s� l�m n�n ��i nghi�p. Sau n�y n�u c�n g�, ta s� gi�p �� h�t m�nh. Nay ta c�n nhi�u c�ng v�. Xin c�o t�.",
	"(Vi�n B� kho�i t�i lui nh� gi�, b�n ba v� chuy�n thi�n h�, ��ng l� thi�t huy�t �an t�m. C� th� k�t giao v�i m�t l��ng s� �ch h�u nh� th�, ��ng l� kh�ng u�ng cu�c ��i. C� l� ta n�n tr� v� ch� Xa Lu�n B� V��ng, �� xem nhi�m v� m�i l� g�.)",
	}

	DelItem(2,0,749,1);--ɾ����������ҩ;
	TalkEx("task_007_07_1",strTalk);
	SetTask(TASK_XB_ID,36);
	TaskTip("��n ch� Xa Lu�n B� V��ng, b�t ��u h�nh ��ng gi�n �i�p c�a m�nh t�i Nh�t Ph�m ���ng!");
	Msg2Player("��n ch� Xa Lu�n B� V��ng, b�t ��u h�nh ��ng gi�n �i�p c�a m�nh t�i Nh�t Ph�m ���ng!");
	GivePlayerAward("Award_XB_16","Easy");
	GivePlayerExp(SkeyXibei,"tiexueernv")
end



--��Ԭ���ƶԻ��ص�ɾ��Npc
function task_007_07_1()

	SetNpcLifeTime(GetTask(YUANFEIYUN_NPCINDEX),0);--��Npc��ʧ
	SetNpcScript(GetTask(YUANFEIYUN_NPCINDEX),"");--�ű��ÿ�

end

---------------------------------- ������08������----------------------------------
--�복�ְ����Ի���ȡһƷ������
function task_008_01_0()

local strTalk = {
	"L� th�nh vi�n c�a Nh�t Ph�m ���ng, ng��i ph�i lu�n ghi nh� ���ng quy, ph�c t�ng m�nh l�nh th��ng c�p, tuy�t ��i kh�ng ���c ph�m th��ng, m�i vi�c ph�i ��t l�i �ch c�a b�n ���ng l�n ��u, th� t�n trung v�i b�n ���ng. N�u ng��i c� � ph�n ngh�ch, k�t c�c ch� c� m�t con ���ng ch�t, r� ch�a?",
	"Ta hi�u, Nh�t Ph�m ���ng �� cho ta m�t ch�n dung th�n, ta quy�t d�c s�c ph�ng s� b�n ���ng!",
	"T�t, v�i t�i tr� v� th�n th� c�a ng��i, tin r�ng s� kh�ng ph� k� v�ng c�a ta. T�c T�y H� chu�ng v�, Nh�t Ph�m ���ng ta l� th�nh ��a v� h�c, ngay c� T�y H� �� nh�t d�ng s� c�ng � trong h�ng ng� c�a Nh�t Ph�m ���ng, ng��i n�y l� Th�c B�t Ho�ng, v� c�ng si�u vi�t, v� ��ch T�y H� nhi�u n�m li�n, l� m�nh t��ng ���c ��ch th�n L� Nguy�n Kh�nh ��i nh�n chi�u m�.",
	"L� Nguy�n Kh�nh ��i nh�n ph�i ch�ng ch�nh l� ng��i t�ng ph� tr�ch �� ���c nh�c t�i trong m�t h�m? L�n n�y �ng ta c�ng t�i Ph�ng T��ng ph� �?",
	}

	TalkEx("task_008_01_0_1",strTalk);

end

--���Ի�
function task_008_01_0_1()

local strTalk = {
	"��ng v�y, l�n n�y c� L� ��i nh�n ch� tr� ��i c�c, ng��i c� y�n t�m h�nh s�. Nh�ng nh�ng vi�c kh�ng n�n h�i th� t�t nh�t ng��i ��ng l�m �i�u. Hi�n nay Th�c B�t Ho�ng ph�ng l�nh �i�u tra chuy�n Quang Minh ��nh c�a Minh gi�o, Minh gi�o m�y n�m tr��c v�n r�t bi�t �i�u, th��ng h�p t�c v�i b�n ���ng, nh�ng nay th� kh�c r�i, c� d�u hi�u ch�ng ��i ta. Ng��i h�y t�i Ph�ng T��ng ph� t�m Th�c B�t Ho�ng, xem h�n c� sai b�o g� kh�ng.",
	"Nh�ng Th�c B�t Ho�ng ph� tr�ch �i�u tra Quang Minh ��nh, sao gi� l�i xu�t hi�n � Ph�ng T��ng?",
	"H�, Th�c B�t Ho�ng v� c�ng tuy�t ��nh, tuy l� ng��i c�a Nh�t Ph�m ���ng, nh�ng l�i kh�ng t�n t�m cho n��c nh�, ch� th�ch t�m ki�m ��i th� so t�i v� ngh�, n�u h�n kh�ng �i�n kh�ng nh� v�y, ch�c gi� �� leo ��n v� tr� th�ng l�nh Nh�t Ph�m ���ng r�i. Ch�c � Ph�ng T��ng h�n l�i g�p m�t cao th� g� ��, khi�n b� b� c� nhi�m v�.",
	"Ra v�y, ngh� l�i c�c cao nh�n ��u t�nh t�nh k� qu�i, ng��i ngo�i kh�ng th� �o�n bi�t ���c. Ta xin c�o t�.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,37);
	TaskTip("��n Ph�ng T��ng, h�i Th�c B�t Ho�ng v� ti�n tri�n nhi�m v� �i�u tra � Quang Minh ��nh.");
	Msg2Player("��n Ph�ng T��ng, h�i Th�c B�t Ho�ng v� ti�n tri�n nhi�m v� �i�u tra � Quang Minh ��nh.");

end

--��δ���ذκ�Ի�
function task_008_01_1()

local strTalk = {
	"Th�c B�t Ho�ng hi�n �ang � Ph�ng T��ng ph�, ng��i ��n t�m h�n, xem h�n c� c�n gi�p �� kh�ng.",
	}

	TalkEx("",strTalk);

end

--���ذκ�Ի��õ�һƷ����ҩ
function task_008_02_0()

local strTalk = {
	"Chi�u th�c c�a h�n tho�t nh�n c� v� nh�t nh�o, nh�ng chi�u th�c h�p v�i t�m tr�ng ng��i c�m ki�m, bi�n h�a �a d�ng l�i th�ng nh�t, bi�t ph� gi�i nh� th� n�o ��y?",
	"C�c h� c� ph�i Th�c B�t Ho�ng ti�n b�i? Xa Lu�n B� V��ng sai t�i h� ��n ��y t�m �ng!",
	"� � ��ng v�y. Ra l� ng��i c�a b�n ���ng, Xa Lu�n B� V��ng ph�i ng��i t�i sao? L�i h�i th�c v� nhi�m v� � Quang Minh ��nh ch� g�? Ng��i v� b�o l�i v�i Xa Lu�n, ta bi�t ph�i l�m g�, kh�ng c�n h�n h�i th�c ch� ��o. Kh�c... kh�c�",
	"Xa Lu�n B� V��ng kh�ng c� � h�i th�c B�n, �ng �y b�o t�i h� ��n tr� gi�p B�n c�ng �i�u tra Quang Minh ��nh. Nh�ng ti�n b�i d��ng nh� �ang b� th��ng th� ph�i? Ti�n b�i v� c�ng c�i th�, ch�ng l� l� b� ��nh l�n?",
	"(C� v� nh� �ng ta r�t ch�n gh�t nhi�m v� m� Nh�t Ph�m ���ng giao cho, c�n Nh�t Ph�m ���ng c�ng c� v� h�t nh�n n�i v�i h�n.)",
	"Ha ha, <sex> n�i v�y l� sai r�i. Ng��i h�c v� kh�ng c� c�i thuy�t c�i th� si�u ph�m, v� h�c c�ng kh�ng ph�n chia m�nh y�u, k� m�nh ��ng th�i c�ng bao h�m m�t tr�i tim y�u �u�i, b� l�i k� y�u l�i th��ng c� c� th� m�nh m�. C�i s� trong thi�n h�, b�t ��u t� ��u s� k�t th�c t�i ��. s� cao th�p trong v� h�c n�i ��ng h�n ch�nh l� s� cao th�p c�a c�i t�m ng��i h�c v�.",
	}

	TalkEx("task_008_02_0_1",strTalk);

end

--���Ի�
function task_008_02_0_1()

local strTalk = {
	"L�i n�i c�a ti�n b�i � ngh�a s�u xa, c� th� gi�i th�ch v� s� m�nh y�u c�a v� h�c nh� th�, ��ng l� m�t l� lu�n uy�n th�m.",
	"�? Ng��i hi�u ta mu�n n�i g� th�t sao?",
	"Ng��i ch�i: C� g� kh� ��u ch�. C�ng v� nh� c�c chi�u th�c v� c�ng, kh� ph�t ra th� hi�n trong c�c chi�u th�c, nh�ng b�n th�n chi�u th�c kh�ng chia m�nh y�u, cao th� xu�t chi�u c� v� nh� kh�ng c� s� h�,�i�m m�nh nh�t v� �i�m y�u nh�t th��ng ���c ��t chung v�i nhau, cao th� ch� c� gi�u �i�m y�u chi�u th�c. Do �� tr��c khi bi�n h�a xu�t chi�u, ch�c ch�n s� �� l� s� h�, ch�nh s� h� n�y s� quy�t ��nh s� cao th�p",
	"Ha ha, c� l� c� l�, v� ngh� v� chi�u th�c v�n c�ng m�t g�c, kh�ng ng� ki�n th�c v� h�c c�a <sex> c�ng kh�ng t�i, l�i c� thi�n ph�. N�o, ch�ng ta so t�i m�t phen. Kh�c kh�c�",
	"T�i h� ch� xu�i theo l� lu�n c�a ti�n b�i m� n�i b�a v�y th�i, ch� v� h�c c�a t�i h� ch� m�i giai �o�n nh�p m�n, ��u d�m so t�i c�ng ti�n b�i. H�n n�a ti�n b�i �ang b� th��ng, t�i h� ph�i gi�p ng��i tr� th��ng tr��c m�i ph�i.",
	}

	TalkEx("task_008_02_0_2",strTalk);

end

--���Ի�
function task_008_02_0_2()

local strTalk = {
	"Ng��i kh�ch s�o qu�. Nh�ng sau n�y ta s� c�n nhi�u c� h�i so t�i v�i nhau. V�t th��ng c�a ta kh�ng ��ng ng�i, do h�m tr��c t� th� m�t ng�y m�t ��m v�i T� M� Minh Phongn�n m�i v�y. T� ng�y xu�t ��o ��n nay, ta ch�a t�ng ���c ��nh m�t tr�n s�ng kho�i ��n v�y, h�n n�a c�n b�t ph�n th�ng b�i. Ta ngh� ch�c h�n c�ng �� b� th��ng, <sex> c� v� nh� l� ng��i T�ng, h�y gi�p ta ��a Nh�t Ph�m ���ng M�t d��c n�y cho h�n, v� d��ng nh� h�n h�i ph�n c�m v�i ng��i T�y H�.",
	"Theo nh� l�i ti�n b�i, T� M� Minh Phong l� m�t ng��i H�n, kh�ng bi�t gi� h�n �ang � ��u?",
	"H�n v�n c�n � trong Ph�ng T��ng ph�, ta v� h�n v�n ch�a ph�n th�ng b�i, ch� l� t�m th�i ngh� ng�i, sao c� th� b� �i ���c? M�t ��i th� c�n s�c nh� th� ��u ph�i d� g�p. Ng��i mau ��a thu�c t�i cho h�n, ��ng th�i gi�p ta h�n ng�y giao ��u ti�p. �i mau �i, ta c�n ph�i suy ngh� c�ch ph� gi�i chi�u th�c c�a h�n, bi�n h�a c�a chi�u th�c ph�i k�t h�p ���c �i�m m�nh nh�t v� y�u nh�t, ch� l� khi bi�n h�a c�ng l� l�c �� l� s� h�...",
	"�����.",
	"(Xem ra Th�c B�t Ho�ng �� b� ngo�i tai nhi�m v� c�a Nh�t Ph�m ���ng r�i. T� M� Minh Phong kia l� th�n th�nh ph��ng n�o? N�u h�n l� ng��i T�ng, m�t cao nh�n nh� th� sao giang h� l�i kh�ng nghe danh t�nh v�y?)",
	}

	TalkEx("",strTalk);
	AddItem(2,0,698,1,1);--һƷ����ҩ
	SetTask(TASK_XB_ID,38);
	TaskTip("Gi�p Th�c B�t Ho�ng �em M�t d��c Nh�t Ph�m ���ng ��n cho T� M� Minh Phong, ��ng th�i chi�m ng��ng phong th�i c�a v� ��i hi�p n�y.");
	Msg2Player("Gi�p Th�c B�t Ho�ng �em M�t d��c Nh�t Ph�m ���ng ��n cho T� M� Minh Phong, ��ng th�i chi�m ng��ng phong th�i c�a v� ��i hi�p n�y.");
	GivePlayerExp(SkeyXibei,"xixiayongshi")
end

--��δ��˾������Ի�
function task_008_02_1()

local strTalk = {
	"Ta �o�n T� M� Minh Phong c�ng �� b� th��ng, gi� ch�c h�n v�n c�n � trong Ph�ng T��ng ph�. H�y gi�p ta ��a Nh�t Ph�m ���ng M�t d��c n�y cho h�n, ��ng th�i gi�p ta h�n ng�y giao ��u ti�p.�i mau �i, ta c�n ph�i suy ngh� c�ch ph� gi�i chi�u th�c c�a h�n, bi�n h�a c�a chi�u th�c ph�i k�t h�p ���c �i�m m�nh nh�t v� y�u nh�t, ch� l� khi bi�n h�a c�ng l� l�c �� l� s� h�...",
	}

	TalkEx("",strTalk);

end

--��˾������Ի�ɾȥһƷ����ҩ
function task_008_03_0()

local strTalk = {
	"Ti�n b�i c� ph�i l� T� M� Minh Phong?",
	"T�i h� ch�nh l� T� M� Minh Phong, sao <sex> l�i bi�t t�i h�?",
	"Th�c B�t Ho�ng ti�n b�i �� n�i v�i t�i h�, hai ng��i so t�i su�t m�t ng�y m�t ��m, e l� ti�n b�i c�ng �� b� th��ng, ��y l� Nh�t Ph�m ���ng M�t d��c m� �ng �y nh� t�i h� �em ��n t�ng.",
	"Giang h� phi�u b�t, thuy�n nan ng��c xu�i, ai bi�t ��u l� thi�n ���ng? T�i h� nhi�u n�m kh�ng h�nh t�u giang h�, kh�ng ng� l�i thay ��i nhi�u ��n v�y, h�a ra T�y H� c�ng l� n�i ng�a h� t�ng long, g�p m�t ��i th� nh� Th�c B�t Ho�ng ta ch�ng c�n g� �� h�i ti�c. Kh�ng ng� h�n h�nh s� l�i l�c, c�n cho th� h� ��n t�ng thu�c, ��ng l� m�t t�n h�o h�n, ch� ��ng ti�c l�i l� ng��i c�a Nh�t Ph�m ���ng.",
	}

	TalkEx("task_008_03_0_1",strTalk);

end

--���Ի�
function task_008_03_0_1()

local strTalk = {
	"Th�c B�t ti�n b�i c�ng h�t l�i khen ng�i v� ngh� c�a T� M� ti�n b�i, n�i ng��i l� ��i th� c�n s�c nh�t t� tr��c ��n nay, ��ng th�i c�n d�n t�i h� h�n th�i gian so t�i l�n t�i.",
	"Ha ha, ��y c�ng ch�nh l� mong mu�n c�a t�i h�. Ta v�n kh�ng thi�n c�m v�i ng��i T�y H�, nh�ng g�p ���c Th�c B�t Ho�ng �� khi�n ta thay ��i suy ngh� v� T�y H� Nh�t Ph�m ���ng. <sex> l� ng��i T�ng, sao l�i ph�ng s� cho Nh�t Ph�m ���ng? Nh�ng ��y l� chuy�n ri�ng t� c�a c�c h�, ta c�ng kh�ng ti�n h�i. �a t� th��ng d��c c�a c�c h�. Xin chuy�n l�i ��n Th�c B�t Ho�ng, ta s� ��n ��ng h�n.",
	"Kh�ng l�m phi�n ti�n b�i tr� th��ng n�a, ta s� chuy�n l�i ��n Th�c B�t ti�n b�i. Xin c�o t�.",
	"(�i, l�i nh�c nh� c�a Vi�n V�n Phi qu� nhi�n �� �ng nghi�m, ta c�n ph�i c� d�ng kh� �� ��i m�t v�i s� hi�u l�m c�a ng��i ��i. T� M� Minh Phong �n n�i ��nh ��c, n�m x�a h�n l� m�t nh�n v�t l�i h�i, c� l� n�n �i t�m �u D��ng H�a ti�n b�i �� h�i cho r�.)",
	}

	TalkEx("",strTalk);
	DelItem(2,0,698,1);--һƷ����ҩ
	SetTask(TASK_XB_ID,39);
	CreateTrigger(4,210,TALK_XB_OUYANGHUA);
	TaskTip("Chuy�n l�i ��n Th�c B�t Ho�ng, ��ng th�i �i t�m �u D��ng H�a ti�n b�i h�i th�m v� T� M� Minh Phong.");
	Msg2Player("Chuy�n l�i ��n Th�c B�t Ho�ng, ��ng th�i �i t�m �u D��ng H�a ti�n b�i h�i th�m v� T� M� Minh Phong.");
	GivePlayerAward("Award_XB_17","Easy");
	GivePlayerExp(SkeyXibei,"dishou")
end

--��δ��ŷ�������ذκ�Ի�
function task_008_03_1()

local strTalk = {};

	--δ��ŷ�����Ի�
	if GetTask(TASK_XB_ID_01) ~= 0 then
		strTalk = {
			"(T� M� Minh Phong �n n�i ��nh ��c, n�m x�a h�n l� m�t nh�n v�t l�i h�i, ta n�n �i t�m �u D��ng H�a ti�n b�i �� h�i cho r�.)"
				}
		--����ŷ�����Ի�������
		if GetTrigger(TALK_XB_OUYANGHUA) == 0 then
			CreateTrigger(4,210,TALK_XB_OUYANGHUA);
			TaskTip("T�m �u D��ng H�a h�i v� T� M� Minh Phong.");
			Msg2Player("T�m �u D��ng H�a h�i v� T� M� Minh Phong.");
		end
		TalkEx("",strTalk);
	--δ���ذκ�Ի�
	elseif GetTask(TASK_XB_ID_02) ~= 0 then
		strTalk = {
			"�a t� th��ng d��c c�a c�c h�. Xin chuy�n l�i ��n Th�c B�t Ho�ng, ta s� ��n ��ng h�n.",
				}
		TalkEx("",strTalk);
	--δ��ŷ����&δ���ذκ�Ի�
	else
		 strTalk = {
		 	"�a t� th��ng d��c c�a c�c h�. Xin chuy�n l�i ��n Th�c B�t Ho�ng, ta s� ��n ��ng h�n.",
			"(T� M� Minh Phong �n n�i ��nh ��c, h�n l� m�t nh�n v�t l�i h�i, ta n�n �i t�m �u D��ng H�a ti�n b�i �� h�i cho r�.)",
			}
		--����ŷ�����Ի�������
		if GetTrigger(TALK_XB_OUYANGHUA) == 0 then
			CreateTrigger(4,210,TALK_XB_OUYANGHUA);
			TaskTip("T�m �u D��ng H�a h�i v� T� M� Minh Phong.");
			Msg2Player("T�m �u D��ng H�a h�i v� T� M� Minh Phong.");
		end
	end

	TalkEx("",strTalk);

end

-----------------------------------------��֧1��ʼ----------------------------------------------------------------
---------------------------------- ������09��֧1_1������ʹ----------------------------------
--��˾������ת���ذκ���ҩ���յ�
function task_009_01_0()

local strTalk = {
	"Ti�n b�i, ta �� ��n g�p T� M� Minh Phong, v�t th��ng c�a �ng �y kh�ng ��ng ng�i, �ng �y c�ng r�t mong ���c c�ng ti�n b�i so t�i l�n n�a, ��i khi c� hai �� l�nh h�n, �ng �y s� ��n ��ng h�n.",
	"Ta kh�ng nh�n l�m T� M� Minh Phong, h�n c�ng l� m�t ng��i c� tinh th�n v� h�c. �a t� <sex> �� gi�p ra x� l� vi�c ri�ng, ng��i c�a Nh�t Ph�m ���ng ��u c� b�n ch�t t� t� t� l�i, th�ch tranh gi�nh quy�n l�c, nh�ng ng��i nhi�t t�nh gi�p �� ng��i kh�c nh� ng��i qu� l� r�t hi�m.",
	"Ti�n b�i qu� l�i. Ti�n b�i v� T� M� Minh Phong d�ng v� k�t giao, v� lo l�ng cho th��ng t�ch c�a b�ng h�u m� �em t�ng thu�c qu�, t�i h� ch� gi�p �� ��i ch�t, ti�n b�i xin ��ng kh�ch s�o.",
	"Ha ha, kh�ng gi�u g� ng��i, ta v� T� M� Minh Phong kh�ng ph�i b�ng h�u, c�ng ch�ng ph�i ��i ��ch, h�n l� nh�n t�i m� Nh�t Ph�m ���ng �ang mu�n chi�u m�. Nh�ng d��ng nh� h�n kh�ng th�ch ng��i T�y H�, m�i nghe n�i ta ��n t� T�y H� Nh�t Ph�m ���ng, mu�n chi�u m� h�n, �� t� � kh� ch�u r�i c� hai quy�t ��u b�t ph�n th�ng b�i. Quy ��nh c�a Nh�t Ph�m ���ng l� n�u kh�ng chi�u m� ���c, th� ph�i tr� kh� �i. T� M� Minh Phong kh�ng mu�n gia nh�p, n�n h�n kh�ng nh�ng kh�ng ph�i l� b�ng h�u, m� c�n l� k� ��ch.",
	}

	TalkEx("task_009_01_0_1",strTalk);

end

--���Ի�
function task_009_01_0_1()

local strTalk = {
	"Ra l� v�y, nh�ng ti�n b�i kh�ng nh�ng kh�ng tr� kh� h�n, tr�i l�i c�n t�ng thu�c tr� th��ng. Ch�ng l� ti�n b�i kh�ng s� Nh�t Ph�m ���ng tr�ch t�i sao?",
	"<sex> v� ta c� duy�n, � ng��i c� lu�ng ch�nh kh� kh�c h�n v�i m�i ng��i, n�n ta b�t gi�c th� l� nhi�u �i�u. Th�t ra vi�c ta gia nh�p Nh�t Ph�m ���ng c�ng kh� d�i d�ng, v�i ta, cu�c ��i ng�n ng�i, � ngh�a cu�c ��i ch�nh l� t�m ���c ��i th� so t�i v� ngh�. Hu�ng h� s�c ta c�ng kh�ng th� ti�u di�t ���c h�n, v�y th� c� t�i g� ch�? C�n n�u L� Nguy�n Kh�nh mu�n tr�ch t�i, th� c� �� h�n �i t�m cao th� kh�c v�y.",
	"Ti�n b�i ��ng l� k� l�, h�nh s� ph�ng t�ng l�i th�ng th�n kho�ng ��t, kh�ng c�u n� chuy�n ���c m�t.",
	"(Quan h� gi�a Th�c B�t Ho�ng v� L� Nguy�n Kh�nh d��ng nh� kh�ng ���c b�nh th��ng, ��a v� c�a h�n cao h�n c� Th�p ��i Kim cang, tr�c ti�p nghe l�nh c�a L� Nguy�n Kh�nh, nh�ng l�i l� k� si v�, d�ng v� ngh� k�t giao b�ng h�u l�i t� ra quang minh l�i l�c, ��ng l� b�c anh h�o hi�m c� trong Nh�t Ph�m ���ng.)",
	}

	TalkEx("task_009_01_0_2",strTalk);

end

--���Ի�
function task_009_01_0_2()

local strTalk = {
	"Ha ha, k� nh�n th� kh�ng d�m, ch�ng qua l� t�n qu�i nh�n kh�ng nh�n th�u v� ��o, l�i th�ch ki�m chuy�n ��nh nhau th�i. Tuy ta th��ng ph�t l� nhi�m v�, nh�ng ��i v�i k� m�i gia nh�p m�n ph�i nh� ng��i, ho�n th�nh nhi�m v� kh�ng nh�ng gi�p ng��i tr� v�ng trong ���ng, c�n l� c� h�i th�ng ti�n. L�n n�y Minh gi�o tr�ng h�ng Quang Minh ��nh, L� Nguy�n Kh�nh �� s�m c� s� nghi ng�, c�m th�y Minh gi�o c�n �m m�u n�o kh�c. Nh�ng ta l�i kh�ng h�ng th� v�i vi�c n�y, n�u kh�ng v� h�n nh� v�, ta c�ng ch�ng th�m nh�ng tay v�o.",
	"T�ng ��n Minh gi�o d��ng nh� ���c ��t � Tuy�n Ch�u, t�i sao l�i ng�n d�m xa x�i ��n v�ng hoang v�ng n�y �� x�y d�ng c�n c�?",
	"��y ch�nh l� m�c ��ch c�a nhi�m v� l�n n�y. G�n ��y ta ch�m ��m trong chuy�n T� M� Minh Phong, l�m nhi�m v� n�y b� g�c l�i. ��n nay ch� bi�t ���c ng��i ph� tr�ch x�y d�ng l� Quang Minh t� s� �n Minh c�a Minh gi�o. V�y �i, ng��i thay ta ��n Quang Minh ��nh, coi nh� ��y l� nhi�m v� ��u ti�n sau khi nh�p ���ng. Nghe n�i �n Minh h�o r��u, ng��i h�y b�t tay t� ��y, c� th� s� t�m ra manh m�i n�o ��.",
	"T�i h� s� gi�p ti�n b�i x� l� vi�c n�y, ti�n b�i c� y�n t�m �ng chi�n.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,1);
	--if GetTask(TASK_XB_ID_02) == 1 then
		SetTask(TASK_XB_ID,40);--�ر�08�������
	--end
	TaskTip("��n Quang Minh ��nh th�m d� ��ng t�nh Minh gi�o t� ngu�n Quang Minh t� s� - �n Minh.");
	Msg2Player("��n Quang Minh ��nh th�m d� ��ng t�nh Minh gi�o t� ngu�n Quang Minh t� s� - �n Minh.");
	GivePlayerExp(SkeyXibei,"mingjiao")
end

--δ�������Ի�
function task_009_01_1()

local strTalk = {
	"Ng��i ph� tr�ch tr�ng tu Quang Minh ��nh l� Quang Minh t� s� �n Minh c�a Minh gi�o. �n Minh h�o r��u, ng��i c� th� khai th�c �i�m n�y c�a h�n �� thu th�p th�ng tin. Gi� ��y �n Minh �ang c� m�t tr�n Quang Minh ��nh.",
	}

	TalkEx("",strTalk);

end

--�������Ի����ռ���˹���Ѿ�
function task_009_02_0()

local strTalk = {
	" Kh�i ���ng d� khang, �u t� nan vong, h� d� gi�i �u, duy h�u �� khang. Thi�n h� anh h�ng h�o kh�, th�y d� c�ng �m ��ng x��ng?",
	"T�i h� �i ngang Quang Minh ��nh, th�y �� t� Minh gi�o ra v�o ng��c xu�i, l�i nghe c�c h� u�ng r��u ng�m nga, d��ng nh� c� n�i bu�n man m�c. T� l�u nghe danh Minh gi�o Quang Minh t� s� �n Minh t�u ki�m song tuy�t, ch� t�u l�n x�p tr�n ��u, ph�i ch�ng c�c h� ��y ch�nh l� Quang Minh t� s� �n Minh?",
	"<sex> �o�n hay l�m, ta ch�nh l� �n Minh. Khi n�y ch� l� do h�i men, n�i bu�n b�t gi�c tr�o d�ng, n�n m�i ng�m nga m�y c�u, mong <sex> ��ng c��i ch�.",
	"T� c� r��u v�o l�i ra, ng��i m� r��i l�i c�ng ph�ng kho�ng tho�t t�c, ti�n sinh c�m kh�i mu�n v�n, l�i c�n ng�m th� gi�p vui, t�i h� n�o d�m c��i ch�?",
	}

	TalkEx("task_009_02_0_1",strTalk);

end

--���Ի�
function task_009_02_0_1()

local strTalk = {
	"<sex> d��ng nh� c�ng c� nhi�u ki�n gi�i ��c ��o v� r��u, ��ng l� b�ng h�u tri k�. Ta chu du kh�p ��i giang nam b�c, ph�t hi�n r��u c�a Trung Nguy�n n�u kh�ng ph�i qu� m�nh th� l� qu� nh�t, r�t hi�m c� nh�ng lo�i r��u n�ng �m ch�ng c�t l�u n�m. R��u sinh h�o kh�, nay kh�ng t�m th�y r��u ngon, n�i bu�n b�t gi�c d�ng tr�o, kh�ng sao c�m ���c.",
	"R��u Trung Nguy�n c�ng c� lo�i n�ng n�n d� v� nh� Tam Oa ��u, N� Nhi H�ng, c�n c�c lo�i B�ch Th�o, H�u Nhi l�i l� c�c lo�i r��u thu�c thanh li�t s�ng kho�i, sao l�i n�i l� kh�ng c� r��u ngon?",
	"Hay, hay l�m, <sex> qu� nhi�n l� ng��i s�nh r��u, �� ��ch th�c l� nh�ng lo�i r��u ngon nh�t Trung Nguy�n, ch� ti�c Ph�ng T��ng ph� � n�i h�o l�nh, r��u c�ng ngh�o n�n. Song Ph�ng T��ng do gi�p ranh T�y V�c, n�n l�i c� b�n lo�i T�y V�c M� T�u m� Trung Nguy�n kh�ng c�, h��ng v� tuy�t di�u. ",
	"Ta l�m sao d�m so s�nh v�i c�c h�, kh�ng bi�t l� lo�i r��u ngon n�o l�i ���c l�ng c�c h� ��n v�y?",
	}

	TalkEx("task_009_02_0_2",strTalk);

end

--���Ի�
function task_009_02_0_2()

local strTalk = {
	"Kh� h�u T�y V�c Ba T� c� hai m�a tr�i ng��c, m�a h� n�ng l�a, m�a ��ng gi� r�t, cho n�n b� ��o � ��y c�ng r�t ��c bi�t, m�u �� nh� m�u, th�m d�u d�ng, kh�ng cay kh�ng nh�t, d� c� u�ng ng�n ly c�ng kh�ng say, ��ng l� c�c ph�m.",
	"R��u nho Ba T� ���c ti�n sinh khen ng�i nh� v�y, sao kh�ng th�y ti�n sinh u�ng?",
	"R��u nho Ba T� n�y ch� c� � Ph�ng T��ng ph� ch� th��ng nh�n Ba T�, m�i l�n ch� c� l��ng h�n ch�, nh�ng ta v� k�t c�ng v� n�n kh�ng th� t�i ��, ��nh ng�i ��y nh�n r��u than th�, u�ng r��u gi�i s�u.",
	"Ta s� gi�p ti�n sinh ���c to�i nguy�n, gi� ta s� t�i Ph�ng T��ng ph�, t�m r��u ngon cho ti�n sinh.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,2);
	TaskTip("T�i Ph�ng T��ng ph� t�m th��ng nh�n Ba T� mua r��u B� ��o cho �n Minh.");
	Msg2Player("T�i Ph�ng T��ng ph� t�m th��ng nh�n Ba T� mua r��u B� ��o cho �n Minh.");
	GivePlayerAward("Award_XB_18","Easy");
	GivePlayerExp(SkeyXibei,"putaomeijiu")
end

--δ�벨˹���˶Ի�
function task_009_02_1()

local strTalk = {
	"R��u nho Ba T� ch� c� � Ph�ng T��ng ph� ch� th��ng nh�n Ba T�, m�i l�n ch� c� l��ng h�n ch�, nh�ng ta v� k�t c�ng v� n�n kh�ng th� t�i ��, ��nh ng�i ��y nh�n r��u than th�, u�ng r��u gi�i s�u.",
	}

	TalkEx("",strTalk);

end

--�벨˹���˶Ի���֪���ѾƱ������̺���ȥ
function task_009_03_0()

local strTalk = {
	"<sex>, � ��y ta c� m�t ��t h�ng qu� hi�m ��n t� Ba T�, n�u ch�n ���c c�i �ng �, gi� ti�n c� th� th��ng l��ng.",
	"Nghe ��n � ��y c� b�n r��u B� ��o c�a Ba T�, c� ph�i kh�ng?",
	"<sex> th�t s�nh s�i, r��u B� ��o c�a ta l� lo�i r��u ngon �� c�t h�n 12 n�m, s� l��ng kh�ng nhi�u, ch� ti�c ng��i �� ch�m 1 b��c, r��u �� b� T�y B�c Y�n H�n mua h�t v�i gi� cao, ch�ng c�n s�t l�i b�nh n�o.",
	"(Sao ��n �ng � Ph�ng T��ng ph� n�y ��u h�o r��u h�t v�y? L�n tr��c s� thu�c gi� r��u c�ng b� mua h�t s�ch. Cho h�i bao gi� th� �ng m�i c� h�ng m�i?",
	}

	TalkEx("task_009_03_0_1",strTalk);

end

--���Ի�
function task_009_03_0_1()

local strTalk = {
	"Ta m�i ��n ��y kh�ng l�u, ph�i ��i ki�m �� v�n c�a chuy�n h�ng n�y m�i v� Ba T� ���c, cho n�n c�ng kh�ng th� n�i ch�c l� bao gi�. Chuy�n h�ng l�n sau c� l� s� kh�ng b�ng b�y gi�, nh�ng c�ng l� lo�i r��u c�t ���c 10 n�m, l�n sau <sex> nh� ��n s�m.",
	"Th�t ��ng l� r��u ngon kh� t�m, kh�ng bi�t T�y B�c Y�n H�n c� ch�u nh��ng l�i? �ng c� bi�t h� �i v� h��ng n�o kh�ng?",
	"<sex> ��ng l� ng��i h�o r��u, ch�ng kh�c n�o T�y B�c Y�n H�n, nh�ng cho d� c� �u�i k�p h� c�ng ch�a ch�c ch�u nh��ng l�i ��u. Ta nh� h� �� �i v� ph�a nam Ph�ng T��ng ph�, c� ��n �� xem th�.",
	"�a t�, ta ph�i t�i xem li�u h� c� th� nh��ng 10 r��u B� ��o, nh� v�y th� ��p c� ��i ��ng.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,3);
	CreateTrigger(0,1226,KILL_XB_XIBEIYANHAN);--ɱ�ִ�����
	TaskTip("��n ph�a Nam Ph�ng T��ng ph� t�m T�y B�c Y�n H�n mua 10 r��u B� ��o.");
	Msg2Player("��n ph�a Nam Ph�ng T��ng ph� t�m T�y B�c Y�n H�n mua 10 r��u B� ��o.");
end

--δȡ��10�����Ѿ��벨˹���˶Ի�and����������
function task_009_03_1()

local strTalk = {
			"T�y B�c Y�n H�n �� �i v� ph�a nam Ph�ng T��ng ph�, h� qu� r��u h�n c� sinh m�ng, e kh�ng d� d�ng nh��ng l�i cho ng��i ��u.",
			}
	if	GetTrigger(KILL_XB_XIBEIYANHAN) == 0 then
		CreateTrigger(0,1226,KILL_XB_XIBEIYANHAN);--ɱ�ִ�����
		TaskTip("��n ph�a Nam Ph�ng T��ng ph� t�m T�y B�c Y�n H�n mua 10 r��u B� ��o.");
		Msg2Player("��n ph�a Nam Ph�ng T��ng ph� t�m T�y B�c Y�n H�n mua 10 r��u B� ��o.");
	end

	TalkEx("",strTalk);

end

---------------------------------- ������10��֧1_2δ�����----------------------------------
--ȡ�����Ѿƺ��������Ի�
function task_010_01_0()

local strTalk = {};

	if GetItemCount(2,0,708) >= 10 then
		--���̵��ӶԻ�
		if GetPlayerRoute() == 100 then
			strTalk = {
				"<sex> b� h��ng th�m c�a r��u l�i cu�n ��n ��y ph�i ch�ng v�n l�u luy�n h��ng v� R��u nho Ba T�?",
				"R��u v�n c�n trong b�nh m� �n T� S� v�n ng�i th�y sao? R��u nho Ba T� ph�i t�ng ng��i bi�t th��ng th�c nh� �n T� S� ��y.",
				"Ha ha, cho d� c� ch�n d��i ��t v�n kh�ng th� gi�u ���c m�i r��u. Ch�ng ta ��u l� b�n b� t�m th�i h�y b� qua nh�ng l� ngh�a th��ng ng�y m� c�ng nhau u�ng m�t b�a cho no say. R��u nho n�y m�i v� qu� l� r�t kh�c th��ng, ngon kh�ng ch� v�o ��u ���c.",
				"R��u n�y sau 3 l�n ch�ng c�t th� v� chua �� v�i �i nhi�u, n�u ch�ng c�t th�m 1 l�n th� ch�c l� s� kh� h�t v� chua.",
				"Ng��i n�i r�t ��ng qu� l� ng��i bi�t th��ng th�c, nh�ng v� chua n�y l�i l� tinh t�y c�a r��u nho, tr�n ��y d� �m. S� ��i c�ng th� n�u nh� m�i vi�c ��u b�nh th��ng th� ��u h�ng th� g�.",
				}
		else
			strTalk = {
				"<sex> b� h��ng th�m c�a r��u l�i cu�n ��n ��y ph�i ch�ng v�n l�u luy�n h��ng v� R��u nho Ba T�?",
				"R��u v�n c�n trong b�nh m� �n T� S� v�n ng�i th�y sao? R��u nho Ba T� ph�i t�ng ng��i bi�t th��ng th�c nh� �n T� S� ��y.",
				"Ha ha, cho d� c� ch�n d��i ��t v�n kh�ng th� gi�u ���c m�i r��u. Ch�ng ta ��u l� b�n b� t�m th�i h�y b� qua nh�ng l� ngh�a th��ng ng�y m� c�ng nhau u�ng m�t b�a cho no say. R��u nho n�y m�i v� qu� l� r�t kh�c th��ng, ngon kh�ng ch� v�o ��u ���c.",
				"R��u n�y sau 3 l�n ch�ng c�t th� v� chua �� v�i �i nhi�u, n�u ch�ng c�t th�m 1 l�n th� ch�c l� s� kh� h�t v� chua.",
				"<sex> n�i r�t ��ng qu� l� ng��i bi�t th��ng th�c, nh�ng v� chua n�y l�i l� tinh t�y c�a r��u nho, tr�n ��y d� �m. S� ��i c�ng th� n�u nh� m�i vi�c ��u b�nh th��ng th� ��u h�ng th� g�.",
				}
		end

		TalkEx("task_010_01_0_1",strTalk);

	--û�д�����Ʒ
	else
		strTalk = {
			"R��u nho Ba T� ch� c� � Ph�ng T��ng ph� ch� th��ng nh�n Ba T�, m�i l�n ch� c� l��ng h�n ch�, nh�ng ta v� k�t c�ng v� n�n kh�ng th� t�i ��, ��nh ng�i ��y nh�n r��u than th�, u�ng r��u gi�i s�u.",
			}
		TalkEx("",strTalk);

	end

end

--���Ի�
function task_010_01_0_1()

local strTalk = {}

	--���̵��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"�n T� S� ph�i ch�ng �ang c� chuy�n phi�n mu�n?",
			"Ng��i �� t�ng nghe Si H�a gi�o? Si H�a gi�o l� gi�o ph�i th�n b� � trung nguy�n, v� mu�n �o�t B�n �� S�n H� X� T�c n�n l�m lo�n trung nguy�n. Si H�a gi�o v� B�n gi�o t��ng nh� d� l�n l�n nh�ng th�t ra l� kh�c bi�t r�t xa. Nh�ng c� l� v� gi�o ch�ng kh�ng c�u n� l� ngh�a trung nguy�n n�n ng��i trong v� l�m ��u c� th�nh ki�n v� �em l�ng th� ��ch.",
			"Thu�c h� c�ng c� nghe n�i Si H�a gi�o l�m lo�n trung nguy�n nh�ng sao l�i k�t o�n v�i ta?",
			"Si H�a gi�o v�n kh�ng thi�n ch� v�i v� l�m trung nguy�n, chuy�n ch�nh quy�n ��i L� r�i lo�n l� do Si H�a gi�o g�y n�n nh�ng Minh gi�o c�ng b� v� l�y v� cho l� ��ng b�n c�a Si H�a gi�o. V� th� m� ta �� nhi�u l�n quy�t ��u v�i Si H�a gi�o nh�ng ��u b�t ph�n th�ng b�i. Sau nhi�u l�n giao tranh ���c bi�t Si H�a gi�o �� ��nh c�p Th�nh H�a L�nh n�n m�i th� c�ng s�u h�n. Chuy�n Minh gi�o tr�ng tu Quang Minh ��nh v�n c� m�t nh�ng l�i b� l�, e r�ng s� g�y s� ch� � c�a Nh�t Ph�m ���ng.",
			}
	else
		strTalk = {
			"�n T� S� ph�i ch�ng �ang c� chuy�n phi�n mu�n?",
			"<sex> �� t�ng nghe Si H�a gi�o? Si H�a gi�o l� gi�o ph�i th�n b� � trung nguy�n, v� mu�n �o�t B�n �� S�n H� X� T�c n�n l�m lo�n trung nguy�n. Si H�a gi�o v� B�n gi�o t��ng nh� d� l�n l�n nh�ng th�t ra l� kh�c bi�t r�t xa. Nh�ng c� l� v� gi�o ch�ng kh�ng c�u n� l� ngh�a trung nguy�n n�n ng��i trong v� l�m ��u c� th�nh ki�n v� �em l�ng th� ��ch.",
			"Chuy�n Si H�a gi�o l�m lo�n trung nguy�n v�n ch�a y�n sao ch�ng l�i k�t o�n v�i Minh gi�o?",
			"Si H�a gi�o v�n kh�ng thi�n ch� v�i v� l�m trung nguy�n, chuy�n ch�nh quy�n ��i L� r�i lo�n l� do Si H�a gi�o g�y n�n nh�ng Minh gi�o c�ng b� v� l�y v� cho l� ��ng b�n c�a Si H�a gi�o. V� th� m� ta �� nhi�u l�n quy�t ��u v�i Si H�a gi�o nh�ng ��u b�t ph�n th�ng b�i. Sau nhi�u l�n giao tranh ���c bi�t Si H�a gi�o �� ��nh c�p Th�nh H�a L�nh n�n m�i th� c�ng s�u h�n. Chuy�n Minh gi�o tr�ng tu Quang Minh ��nh v�n c� m�t nh�ng l�i b� l�, e r�ng s� g�y s� ch� � c�a Nh�t Ph�m ���ng.",
			}
	end

	TalkEx("task_010_01_0_2",strTalk);

end

--���Ի�
function task_010_01_0_2()

local strTalk = {}

	--���̵��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Th� ra l� v�y ch�ng tr�ch �n T� S� lo l�ng th�, chuy�n n�y sao l�i li�n quan ��n Nh�t Ph�m ���ng?",
			"Ng��i v�a gia nh�p gi�o kh�ng bi�t b�n gi�o v� Nh�t Ph�m ���ng �� t�ng h�p t�c, nh�ng �� �� l� qu� kh�. Ta th�y ng��i c�a Nh�t Ph�m ���ng nhi�u l�n ra v�o Quang Minh ��nh, c� l� Nh�t Ph�m ���ng �� nghi ng�. Gi� ta d�m kh�ng ��nh trong gi�o c� Gian t�, kh�ng ch� � T�ng �� m� c�c �� t� tr�n Quang Minh ��nh ��u c� gian t� �n n�p.",
			"Theo l�i �n T� S� th� gian t� kh�ng ch� ho�t ��ng � Quang Minh ��nh e r�ng � t�ng �� c�ng c� kh�ng �t.",
			"Kh�ng sai, ta v� ng��i v�a g�p nh� �� quen ��ng l� ph�i u�ng cho say nh�ng ta c�n ph�i gi�m s�t vi�c tr�ng tu Quang Minh ��nh v� tr� v� t�ng �� h�i b�o tin t�c, ng��i c� th� gi�p ta �i�u tra�� t� Minh gi�o tr�n Quang Minh ��nh xem c� manh m�i c�a gian t� kh�ng.",
			"�n T� S� ch� kh�ch s�o h�y ��i tin t�t c�a ta.",
			}
	else
		strTalk = {
			"(Quang Minh T� S� qu� kh�ng t�m th��ng, ta t��ng h�n ch� l� t�n b�m r��u, mong r�ng h�n s� kh�ng ph�t hi�n th�n ph�n Nh�t Ph�m ���ng c�a ta.)",
			"Theo l�i �n T� S� th� gian t� kh�ng ch� ho�t ��ng � Quang Minh ��nh e r�ng � t�ng �� c�ng c� kh�ng �t.",
			"Kh�ng gi�u g� ng��i Minh gi�o v� Nh�t Ph�m ���ng �� t�ng h�p t�c, nh�ng �� �� l� qu� kh�. Ta th�y ng��i c�a Nh�t Ph�m ���ng nhi�u l�n ra v�o Quang Minh ��nh, c� l� Nh�t Ph�m ���ng �� nghi ng�. Gi� ta d�m kh�ng ��nh trong gi�o c� Gian t�, kh�ng ch� � T�ng �� m� c�c �� t� tr�n Quang Minh ��nh ��u c� gian t� �n n�p.",
			"Theo l�i �n T� S� th� gian t� kh�ng ch� ho�t ��ng � Quang Minh ��nh e r�ng � t�ng �� c�ng c� kh�ng �t.",
			"Kh�ng sai, ta v� ng��i v�a g�p nh� �� quen ��ng l� ph�i u�ng cho say nh�ng ta c�n ph�i gi�m s�t vi�c tr�ng tu Quang Minh ��nh v� tr� v� t�ng �� h�i b�o tin t�c, ng��i c� th� gi�p ta �i�u tra�� t� Minh gi�o tr�n Quang Minh ��nh xem c� manh m�i c�a gian t� kh�ng.",
			"�n T� S� ch� kh�ch s�o h�y ��i tin t�t c�a ta.",
			}
	end

	TalkEx("",strTalk);
	DelItem(2,0,708,10);
	RemoveTrigger(GetTrigger(KILL_XB_XIBEIYANHAN));
	SetTask(TASK_XB_ID_01,4);
	CreateTrigger(0,1227,KILL_XB_MINGJIAOJIANXI);--ɱ�ִ�����
	TaskTip("�i�u tra gian t� Minh gi�o xem c� tin t�c li�n quan ��n Si H�a gi�o kh�ng.");
	Msg2Player("�i�u tra gian t� Minh gi�o xem c� tin t�c li�n quan ��n Si H�a gi�o kh�ng.");
	GivePlayerAward("Award_XB_19","Easy");
	GivePlayerExp(SkeyXibei,"xibeiyanhan")
end

--���ػ�δ�����������
function task_010_02_0()

local strTalk = {};

	--�����������
	if GetItemCount(2,0,709) >= 1 then
		--���̵��ӶԻ�
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Kh�ng ngo�i d� �o�n c�a �n T� S�, n�i n�y c� gian t� c�a Si H�a gi�o �n n�p, ��y l� L�nh b�i ta t�m ���c.",
				"Ra l� Si H�a gi�o �ang g�y chuy�n, n�i n�y c�ch t�ng �� r�t xa m� gian t� Si H�a gi�o �� l�n v�o trong khi nh�ng ng��i ch� ch�t trong gi�o ch�a c�, e r�ng th�c l�c kh�ng �� �� ��i ph� khi gi�o ch�ng t�o ph�n. N�u Si H�a gi�o x�i gi�c �� t� t�o ph�n kh�ng nh�ng s� ph� h�y Quang Minh ��nh c�n l� �� k�ch cho b�n gi�o, chuy�n n�y th�t ��ng lo.",
				"C�ch t�t nh�t l� tr��c khi Si H�a gi�o x�i gi�c �� t� t�o ph�n th� ph�i t�m ra t�n ph�n ��, �n T� S� c� ph�t hi�n g�n ��y Quang Minh ��nh c� g� kh�c th��ng?",
				"Ta �� kh�ng ��nh m�t s� �� t� c� � t�o ph�n, ta c�n �n ��nh l�ng qu�n trong ph�n ��, ng��i h�y gi�p ta t�m �� t� Minh gi�o tr�n Quang Minh ��nh v� ti�u di�t 30 t�n �� ng�n ch�n h�nh ��ng c�a ch�ng, ta �i b�t tay v�o ph�ng b�.",
				"Thu�c h� tu�n l�nh, �n T� S� h�y mau �i ph�ng b�.",
				}
		else
			strTalk = {
				"Kh�ng ngo�i d� �o�n c�a �n T� S�, n�i n�y c� Gian t� c�a Si H�a gi�o �n n�p, ��y l� L�nh b�i ta t�m ���c.",
				"Ra l� Si H�a gi�o �ang g�y chuy�n, n�i n�y c�ch t�ng �� r�t xa m� gian t� Si H�a gi�o �� l�n v�o trong khi nh�ng ng��i ch� ch�t trong gi�o ch�a c�, e r�ng th�c l�c kh�ng �� �� ��i ph� khi gi�o ch�ng t�o ph�n. N�u Si H�a gi�o x�i gi�c �� t� t�o ph�n kh�ng nh�ng s� ph� h�y Quang Minh ��nh c�n l� �� k�ch cho b�n gi�o, chuy�n n�y th�t ��ng lo.",
				"C�ch t�t nh�t l� tr��c khi Si H�a gi�o x�i gi�c �� t� t�o ph�n th� ph�i t�m ra t�n ph�n ��, �n T� S� c� ph�t hi�n g�n ��y Quang Minh ��nh c� g� kh�c th��ng?",
				"Ta �� kh�ng ��nh m�t s� �� t� c� � t�o ph�n, ta c�n �n ��nh l�ng qu�n trong ph�n ��, <sex> h�y gi�p ta t�m �� t� Minh gi�o tr�n Quang Minh ��nh v� ti�u di�t 30 t�n �� ng�n ch�n h�nh ��ng c�a ch�ng, ta �i b�t tay v�o ph�ng b�.",
				"Ra s�c v� b�n m� sao kh�ch kh� th�, �n T� S� h�y mau �i ph�ng b�.",
				}
		end
		DelItem(2,0,709,1);
		RemoveTrigger(GetTrigger(KILL_XB_MINGJIAOJIANXI));
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID_01,5);
		CreateTrigger(0,1228,KILL_XB_MINGJIAOPANTU);
		TaskTip("Ti�u di�t 30 �� t� Minh gi�o �� ng�n ch�n k� ho�ch uy hi�p Quang Minh ��nh.");
		Msg2Player("Ti�u di�t 30 �� t� Minh gi�o �� ng�n ch�n k� ho�ch uy hi�p Quang Minh ��nh.");
		GivePlayerAward("Award_XB_20","Easy");
		GivePlayerExp(SkeyXibei,"mingjiaojianxi")
	--û�д�������and�������񴥷���
	else
		strTalk = {
			"E l� �� t� Minh gi�o tr�n Quang Minh ��nh c� gian t�, ta �ang c� vi�c ng��i c� th� gi�p ta di�u tra kh�ng?",
			}
		if	GetTrigger(KILL_XB_MINGJIAOJIANXI) == 0 then
			CreateTrigger(0,1227,KILL_XB_MINGJIAOJIANXI);
			TaskTip("�n T� S� �� h�t c�ch, nh� b�n �i�u tra xem c� tin t�c c�a gian t� Si H�a gi�o trong Quang Minh ��nh.");
			Msg2Player("�n T� S� �� h�t c�ch, nh� b�n �i�u tra xem c� tin t�c c�a gian t� Si H�a gi�o trong Quang Minh ��nh.");
		end

		TalkEx("",strTalk);
	end
end

--��δɱ��30��ͽand����������
function task_010_02_1()

local strTalk = {
	"Ta �� kh�ng ��nh m�t s� �� t� c� � t�o ph�n, ta c�n �n ��nh l�ng qu�n trong ph�n ��, <sex> h�y gi�p ta t�m �� t� Minh gi�o tr�n Quang Minh ��nh v� ti�u di�t 30 t�n �� ng�n ch�n h�nh ��ng c�a ch�ng, ta �i b�t tay v�o ph�ng b�.",
	};

	if	GetTrigger(KILL_XB_MINGJIAOPANTU) == 0 then
			CreateTrigger(0,1228,KILL_XB_MINGJIAOPANTU);
			TaskTip("Ti�u di�t 30 �� t� Minh gi�o �� ng�n ch�n k� ho�ch uy hi�p Quang Minh ��nh.");
			Msg2Player("Ti�u di�t 30 �� t� Minh gi�o �� ng�n ch�n k� ho�ch uy hi�p Quang Minh ��nh.");
	end

	TalkEx("",strTalk);

end

--ɱ��ɱ30��ͽ
function task_010_03_0()

local strTalk = {};

	--���̵��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ta �� ti�u di�t 30 �� t� Minh gi�o, h�nh ��ng c�a ch�ng v� th� m� b� c�n tr�.",
			"T�t r�i, nh� v�y ta c� nhi�u th�i gian chi�u m� ng��i t�i �� ti�u di�t s� ph�n �� c�n l�i. Ng��i �� l�p c�ng l�n cho Minh gi�o ta nh�t ��nh s� b�o l�i v�i t�ng �� th��ng cho ng��i.",
			"�n T� S� qu� l�i, ��ng tr�ch thu�c h� nhi�u chuy�n, b�n gi�o thi�t l�p Ph�n �� � m�t n�i hoang v�ng nh� th� s� b� ph�n t�n l�c l��ng v� d� b� k� th� ��nh l�n, Minh gi�o kh�ng s� t�n th�t sao?",
			}
	else
		strTalk = {
			"Ta �� ti�u di�t 30 �� t� Minh gi�o, h�nh ��ng c�a ch�ng v� th� m� b� c�n tr�.",
			"T�t r�i, nh� v�y ta c� nhi�u th�i gian chi�u m� ng��i t�i �� ti�u di�t s� ph�n �� c�n l�i. <sex> �� l�p c�ng l�n cho Minh gi�o ta nh�t ��nh s� b�o l�i v�i t�ng �� th��ng cho ng��i.",
			"�n T� S� kh�ch s�o r�i. Xin th� t�i nhi�u chuy�n. Minh gi�o thi�t l�p Ph�n �� � m�t n�i hoang v�ng nh� th� s� b� ph�n t�n l�c l��ng v� d� b� k� th� ��nh l�n, Minh gi�o kh�ng s� t�n th�t sao?",
			}
	end

	TalkEx("task_010_03_0_1",strTalk);

end

--���Ի�
function task_010_03_0_1()

local strTalk = {}

	--���̵��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"�u lo c�a ng��i c�ng gi�ng nh� c�a ta. Nh�ng b�n gi�o kh� ���c trung nguy�n ch�p nh�n v� thua xa k� ��ch Si H�a gi�o, n�i b� trong gi�o l�i m�t �o�n k�t n�n kh�ng th� kh�ng m�o hi�m l�p ph�n �� t�i ��y �� b�o to�n b� ph�n l�c l��ng. D� Minh gi�o c� b� t�n c�ng c�ng kh�ng ��n n�i m�t h�t l�c l��ng, kh�ng ng� tin t�c b� l� khi�n k� ��ch th�a c�, s� r�ng c�c ph�i kh�c l�i nghi ng�.",
			"N�u vi�c n�y m�o hi�m qu� l�n th� sao ph�i ti�n h�nh? Chuy�n gian t� �� g�y n�n s�ng gi� n�u v� hi�u l�m m� t�n c�ng th� l�c l��ng c�a ta s� t�n th�t n�ng n�.",
			"Ta c�ng bi�t vi�c n�y r�t kh� nh�ng l�i c� l�i v� sau, b�n gi�o kh�ng mu�n xung ��t v�i c�c ph�i, nh�ng n�u v� l�m kh�ng cho ph�p th� Minh gi�o s� kh�ng khoanh tay ch�u tr�i m� gi� v�ng l�p tr��ng c�a m�nh.",
			}
	else
		strTalk = {
			"�u lo c�a <sex> c�ng gi�ng nh� c�a ta. Nh�ng b�n gi�o kh� ���c trung nguy�n ch�p nh�n v� thua xa k� ��ch Si H�a gi�o, n�i b� trong gi�o l�i m�t �o�n k�t n�n kh�ng th� kh�ng m�o hi�m l�p ph�n �� t�i ��y �� b�o to�n b� ph�n l�c l��ng. D� Minh gi�o c� b� t�n c�ng c�ng kh�ng ��n n�i m�t h�t l�c l��ng, kh�ng ng� tin t�c b� l� khi�n k� ��ch th�a c�, s� r�ng c�c ph�i kh�c l�i nghi ng�.",
			"N�u vi�c n�y m�o hi�m qu� l�n th� sao ph�i ti�n h�nh? Chuy�n gian t� �� g�y n�n s�ng gi� n�u v� hi�u l�m m� t�n c�ng th� l�c l��ng c�a Minh gi�o s� t�n th�t n�ng n�.",
			"Ta c�ng bi�t vi�c n�y r�t kh� nh�ng l�i c� l�i v� sau, b�n gi�o kh�ng mu�n xung ��t v�i c�c ph�i, nh�ng n�u v� l�m kh�ng cho ph�p th� Minh gi�o s� kh�ng khoanh tay ch�u tr�i m� gi� v�ng l�p tr��ng c�a m�nh.",
			}
	end

	TalkEx("task_010_03_0_2",strTalk);

end

--���Ի�
function task_010_03_0_2()

local strTalk = {}

	--���̵��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ra l� th�, t�t c� ��u t�i v� l�m c� th�nh ki�n qu� s�u v�i ch�nh t� khi�n cho m�t s� m�n ph�i �i kh�i trung nguy�n, ��ng l� t� chu�c l�y kh�.",
			"L�n n�y ng��i l�p ���c c�ng l�n, c�u b�n gi�o tho�t kh�i nguy hi�m, khi n�o r�nh ta s� u�ng v�i ng��i.",
			"�a t�, kh�ng qu�y r�y �n T� S� l�m vi�c, sau n�y ta s� mang r��u nho Ba T� ��n th�m vi�ng.",
			"(Th� ra Minh gi�o g�y d�ng c� �� � Quang Minh ��nh v� nguy�n do n�y, tr� v� t�m Th�c B�t Ho�ng  �� th�ng b�o t�nh h�nh.)",
			}
	else
		strTalk = {
			"Ra l� th�, t�t c� ��u t�i v� l�m c� th�nh ki�n qu� s�u v�i ch�nh t� khi�n cho m�t s� m�n ph�i �i kh�i trung nguy�n, ��ng l� t� chu�c l�y kh�. Quen ���c �n T� S� ��ng l� vinh h�nh.",
			"Sao kh�ch sao th�? �n Minh thay m�t Minh gi�o �a t� <sex> ra tay gi�p �� Minh gi�o tho�t kh�i nguy hi�m, khi n�o r�nh ta s� u�ng v�i ng��i.",
			"Ta c�ng c� � ��, kh�ng qu�y r�y �n T� S� l�m vi�c, sau n�y ta s� mang R��u nho Ba T� ��n th�m vi�ng.",
			"(Th� ra Minh gi�o g�y d�ng c� �� � Quang Minh ��nh v� nguy�n do n�y, tr� v� t�m Th�c B�t Ho�ng  �� th�ng b�o t�nh h�nh.)",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,7);
	TaskTip("V� g�p Th�c B�t Ho�ng b�o c�o t�nh h�nh v� Minh gi�o.");
	Msg2Player("V� g�p Th�c B�t Ho�ng b�o c�o t�nh h�nh v� Minh gi�o.");
	GivePlayerAward("Award_XB_21","Easy");
	GivePlayerExp(SkeyXibei,"mingjiaopanduan")
end

--��δ���ذκ�Ի�
function task_010_03_1()

local strTalk = {};

	if GetPlayerRoute() == 100 then
		strTalk = {
			"L�n n�y ng��i l�p ���c c�ng l�n, c�u b�n gi�o tho�t kh�i nguy hi�m, khi n�o r�nh ta s� u�ng v�i ng��i.",
			"�a t�, kh�ng qu�y r�y �n T� S� l�m vi�c, sau n�y ta s� mang r��u nho Ba T� ��n th�m vi�ng.",
			"(Th� ra Minh gi�o g�y d�ng c� �� � Quang Minh ��nh v� nguy�n do n�y, tr� v� t�m Th�c B�t Ho�ng  �� th�ng b�o t�nh h�nh.)",
			}
	else
		strTalk = {
			"�n Minh thay m�t Minh gi�o �a t� <sex> ra tay gi�p �� Minh gi�o tho�t kh�i nguy hi�m, khi n�o r�nh ta s� u�ng v�i ng��i.",
			"Ta c�ng c� � ��, kh�ng qu�y r�y �n T� S� l�m vi�c, sau n�y ta s� mang R��u nho Ba T� ��n th�m vi�ng.",
			"(Th� ra Minh gi�o g�y d�ng c� �� � Quang Minh ��nh v� nguy�n do n�y, tr� v� t�m Th�c B�t Ho�ng  �� th�ng b�o t�nh h�nh.)",
			}
	end

	TalkEx("",strTalk);

end

---------------------------------- ������11��֧1_3����֮Ĺ----------------------------------
--����һ�½��������ذκ�Ի�
function task_011_01_0()

local strTalk = {
	"<sex>, chuy�n �i Quang Minh ��nh c� thu ho�ch kh�ng?",
	"Kh�ng ph� l�ng tin c�a ti�n b�i, chuy�n Minh gi�o g�y d�ng c� �� t�i Quang Minh ��nh ch� �� t� v�. V� kh�ng ���c v� l�m trung nguy�n ti�p nh�n n�n V� V� Tr� M�u m�i l�p ph�n �� �� gi� l�c l��ng ch� kh�ng c� m�u �� v� c�ng kh�ng d�nh l�u ��n Nh�t Ph�m ���ng.",
	"T�t, nh� th� chuy�n c�a Minh gi�o xem nh� k�t th�c. Ng��i c� th� ��n b�o cho Xa Lu�n B� V��ng . Ta c�ng r�t kh�i chuy�n n�y �� chu�n b� cu�c chi�n v�i T� M� Minh Phong. B�n l�nh c�a ng��i c�ng kh�ng t�i, ��i sau khi ta ph�n cao th�p v�i T� M� Minh Phong nh�t ��nh s� so t�i v�i ng��i.",
	"B�n l�nh c�a ta sau s�nh ���c v�i ti�n b�i? Ta �i t�m Xa Lu�n B� V��ng  b�o c�o vi�c n�y. C�o t�!",
	}

	SetTask(TASK_XB_ID_01,8);
	TalkEx("",strTalk);
	TaskTip("B�o v�i Xa Lu�n B� V��ng chuy�n li�n quan ��n Minh gi�o");
	Msg2Player("B�o v�i Xa Lu�n B� V��ng chuy�n li�n quan ��n Minh gi�o");
	GivePlayerAward("Award_XB_22","Easy");
	GivePlayerExp(SkeyXibei,"qianyinhouguo")
end

--��û�����ְ������ذκ�Ի�
function task_011_01_1()

local strTalk = {
	"N�u ng��i �� t�m ra ch�n t��ng th� tr�c ti�p b�o cho Xa Lu�n B� V��ng . Ta c�ng r�t kh�i chuy�n n�y �� chu�n b� cu�c chi�n v�i T� M� Minh Phong.",
	}

	TalkEx("",strTalk);

end

--�복�ְ����Ի�
function task_011_02_0()

local strTalk = {
	"Ng��i c� g�p Th�c B�t Ho�ng kh�ng? Vi�c Minh gi�o g�y d�ng c� �� t�i Quang Minh ��nh c� manh m�i r�i ch�ng??",
	"Ta �� g�p ti�n b�i Th�c B�t Ho�ng, chuy�n Quang Minh ��nh �� �i�u tra r�. Th� ra Minh gi�o v� �� t� b� v� l�m t�y chay, l�i k�t o�n v�i Si H�a gi�o, Minh gi�o th�y chuy�n ch�ng l�nh n�n V� V� Tr� M�u �� l�p Ph�n �� t�i Quang Minh ��nh �� b�o v� l�c l��ng, kh�ng c� � ��nh ��i ph� Nh�t Ph�m ���ng.",
	"Th� ra l� v�y, m�t th�m c�ng �� h�i b�o Minh gi�o kh�ng c� h�nh ��ng x�m ph�m Nh�t Ph�m ���ng. Nh� th� c�ng t�t c� th� g�c l�i chuy�n ��i ph� Minh gi�o. Tin n�y ph�i Th�c B�t Ho�ng n�i ng��i bi�t kh�ng?",
	"L� Th�c B�t ti�n b�i sai ta ��n Quang Minh ��nh �i�u tra s� th�t. �ng ta hi�n gi� � Ph�ng T��ng  b�n ��i ph� v�i T� M� Minh Phong.",
	}

	TalkEx("task_011_02_0_1",strTalk);

end

--���Ի�
function task_011_02_0_1()

local strTalk = {
	"Qu� kh�ng sai, h�n l�m sao ho�n th�nh nhi�m v� nhanh th� ���c. T�n T� M� Minh Phong ti�u di�t hay kh�ng c�ng th� th�i, sao Th�c B�t Ho�ng  l�i g�y th�m r�c r�i l�m t�n th�i gian. Th�c B�t Ho�ng � c� L� Nguy�n Kh�nh ��i nh�n l�m h�u thu�n m� xem nh� nhi�m v�, ch�c l�i b� T� M� Minh Phong h�t l�y r�i. Ng��i n�y ch�ng ���c t�ch s� g� c� nh�ng L� ��i nh�n l�i kh�ng nghe l�i khuy�n c�a ta. Ng��i v�a gia nh�p �� l�p c�ng l�n t��ng lai s� r�t s�ng l�n.",
	"L�m vi�c cho Nh�t Ph�m ���ng l� b�n ph�n c�a ta, nh�t ��nh ph�i ho�n th�nh nhi�m v� ���c giao.",
	"N�u ng��i h�t l�ng l�m vi�c sau n�y Nh�t Ph�m ���ng s� c� th� h� gi� g�i m�a. Th�c ra Phi H� c�a ta �ang ph� tr�ch m�t chuy�n c� m�t nh�ng ti�n tri�n kh�ng thu�n l�i. B�n l�nh c�a ng��i gi�i v� l�m vi�c c�n th�n v�y, ta s� th�ng ch�c ng��i l� Nh�t Ph�m ���ng Phi H� �� �i�u tra vi�c n�y, c� gan th� kh�ng?",
	"C� vi�c d�n d�, sao l�i c� chuy�n kh�ng d�m th�.",
	}

	TalkEx("task_011_02_0_2",strTalk);

end

--���Ի�
function task_011_02_0_2()

local strTalk = {
	"Ph�a ��ng c�a B�c Ph�ng T��ng l� T�n L�ng n�i ch�n c�t c�a T�n Th�y Ho�ng. Tr��c ��y �ng ta x�ng b� thi�n h�, t��ng truy�n trong m� c� Kho b�u n�n �� g�y s� ch� � c�a Ng��i tr�m m�, tr�n ng��i h� c� mang 1 lo�i v�t ph�m l� M�t n� t� v�ng. Ng��i h�y t�m c�ch mang v� 10 m�t n� t� v�ng, ta s� s�p x�p h�nh ��ng ti�p theo. Vi�c n�y v� c�ng quan tr�ng, ng��i ch� n�n h�i nhi�u v� c�ng ��ng ti�t l� ra ngo�i, �i r�i v� mau.",
	"Ta bi�t n�n l�m g� r�i, ng��i h�y ��i tin t�t c�a ta.",
	"(Xem ra Nh�t Ph�m ���ng l�i c� �m m�u, nh�ng kh�ng bi�t li�n quan g� ��n T�n L�ng, chi b�ng v� h�i �u D��ng ti�n b�i th� xem.)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,9);
	TaskTip("Th�nh gi�o �u D��ng H�a chuy�n li�n quan ��n T�n L�ng.");
	Msg2Player("Th�nh gi�o �u D��ng H�a chuy�n li�n quan ��n T�n L�ng.");
	add_xb_title(3);--���һƷ�÷ɻ��ƺ�
end



--��û��ŷ�����Ի�
function task_011_02_1()

local strTalk = {
	"Ph�a ��ng c�a B�c Ph�ng T��ng l� T�n L�ng n�i ch�n c�t c�a T�n Th�y Ho�ng. Tr��c ��y �ng ta x�ng b� thi�n h�, t��ng truy�n trong m� c� Kho b�u n�n �� g�y s� ch� � c�a Ng��i tr�m m�, tr�n ng��i h� c� mang 1 lo�i v�t ph�m l� M�t n� t� v�ng. Ng��i h�y t�m c�ch mang v� 10 m�t n� t� v�ng, ta s� s�p x�p h�nh ��ng ti�p theo. ",
	"(Xem ra Nh�t Ph�m ���ng l�i c� �m m�u, nh�ng kh�ng bi�t li�n quan g� ��n T�n L�ng, chi b�ng v� h�i �u D��ng ti�n b�i th� xem.)",
	}

	TalkEx("",strTalk);

end

--��ŷ�����Ի�ǰ���������ɱһƷ�ð�ɱʹ
function task_011_03_0()

local strTalk = {
	"�� l�u kh�ng g�p �u D��ng ti�n b�i v�n kh�e ch�? H�u b�i c� vi�c mu�n h�i.",
	"Sau l�n tr��c chia ly, ta lu�n lo cho s� an nguy c�a ng��i, nay th�y ng��i an to�n tr� l�i ��y ta m�i y�n l�ng. <sex> c� vi�c g� c� n�i.",
	"Ti�n b�i ��ng lo, ta lu�n c�n th�n khi l�m vi�c. Ti�n b�i �� nghe qua Kho b�u trong T�n L�ng? Xa Lu�n B� V��ng  sai ta �i thu th�p M�t n� t� v�ng.",
	"Th� ra li�n quan ��n T�n L�ng, ta �� s�m bi�t Nh�t Ph�m ���ng s� kh�ng d� d�ng b� qua chuy�n n�y, xem ra Nh�t Ph�m ���ng �� b� m�t h�nh ��ng, Th�m t� m� ch�ng ta ph�i �i th�m d� T�n L�ng �� m�t t�ch, e r�ng do ch�ng �� ph� r�i. Nh�ng M�t n� t� v�ng th� ta ch�a t�ng nghe qua, n� c� t�c d�ng g�.",
	}

	TalkEx("task_011_03_0_1",strTalk);

end

--���Ի�
function task_011_03_0_1()

local strTalk = {
	"Xa Lu�n B� V��ngn�i ch�ng c� 1 h�nh ��ng c� m�t �� tri�n khai � T�n L�ng, r�t cu�c l� chuy�n g� ��y?",
	"Nh�t Ph�m ���ng �� h�nh ��ng r�i? <sex> c� bi�t T�n L�ng l� n�i c�t gi� b� m�t v� B�n �� S�n H� X� T�c? H�n chi th�m t� ��u m�t t�ch, Nh�t Ph�m ���ng s� b� h�t tay tr�n. n�u �� Nh�t Ph�m ���ng c� ���c B�n �� S�n H� X� T�c th� thi�n h� s� g�p n�n chuy�n n�y v� c�ng quan tr�ng. N�u Nh�t Ph�m ���ng s�m c� h�nh ��ng th� e r�ng th�m t� b� �m s�t b�i �m s�t S� c�a Nh�t Ph�m ���ng, ng��i h�y �i T�n L�ng �i�u tra h�nh tung �m s�t S� c�a Nh�t Ph�m ���ng xem sao.",
	"Kh�ng ng� b� m�t l�i l� B�n �� S�n H� X� T�c, n�u b� Nh�t Ph�m ���ng l�y ���c th� nguy to. Ta s� ��n T�n L�ng m�t chuy�n.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,10);
	CreateTrigger(0,1229,KILL_XB_YIPINTANGANSHASHI);--ɱ�ִ�����
	TaskTip("��n Ho�ng l�ng ti�u di�t �m s�t S� c�a Nh�t Ph�m ���ng.");
	Msg2Player("��n Ho�ng l�ng ti�u di�t �m s�t S� c�a Nh�t Ph�m ���ng.");
	GivePlayerAward("Award_XB_23","Easy");
	GivePlayerExp(SkeyXibei,"huangling")
end

--��δɱ��30��ɱʹand����������
function task_011_03_1()

local strTalk = {
	"N�u Nh�t Ph�m ���ng s�m c� h�nh ��ng th� e r�ng th�m t� b� �m s�t b�i �m s�t S� c�a Nh�t Ph�m ���ng, ng��i h�y �i T�n L�ng �i�u tra h�nh tung �m s�t S� c�a Nh�t Ph�m ���ng xem sao.",
	};

	if	GetTrigger(KILL_XB_YIPINTANGANSHASHI) == 0 then
			CreateTrigger(0,1229,KILL_XB_YIPINTANGANSHASHI);
			TaskTip("��n Ho�ng l�ng ti�u di�t �m s�t S� c�a Nh�t Ph�m ���ng.");
			Msg2Player("��n Ho�ng l�ng ti�u di�t �m s�t S� c�a Nh�t Ph�m ���ng.");
	end

	TalkEx("",strTalk);

end

--�Ѿ�ɱ��30��һƷ�ð�ɱʹ����ô����ܺ���ŷ�����Ի�
function task_011_04_0()

local strTalk = {
	"Xung quanh T�n L�ng ��u l� �m s�t S� c�a Nh�t Ph�m ���ng, t�m ���c Th� h�m m�t th�m ��i T�ng tr�n ng��i ch�ng.",
	"Th� �o�n c�a Nh�t Ph�m ���ng qu� l� ��c �c, m�t th�m c�a ta e l� l�nh �t d� nhi�u. Trong Th� h�m n�y n�i Nh�t Ph�m ���ng �� n�m ���c manh m�i c�a B�n �� S�n H� X� T�c trong l�ng, trong l�ng kh�i ��c m� m�t c�n c� M�t n� t� v�ng �� ph�ng tr�nh, v� l�i trong l�ng c� T��ng binh m� bi�t di chuy�n. Ch�ng l� �� l� s�c m�nh c�a B�n �� S�n H� X� T�c?",
	"N�u th� th� ��ng l� trong T�n L�ng c� B�n �� S�n H� X� T�c, hay l� ta v�o trong �� d� la xem sao?",
	"L�ng m� th�i x�a C� quan tr�ng tr�ng hu�ng chi ��y l� linh c�u c�a Ho�ng ��, ��t nh�p v�o m� ��u ph�i chuy�n d�. Hay l� ta �i h�i Cao nh�n ��o tr�m m�, ng��i h�y �i l�m vi�c do Xa Lu�n B� V��ng  giao cho, l�y M�t n� t� v�ng �� d�ng khi v�o m� nh�ng ch� c� l�y nhi�u tr�nh cho ch�ng nghi ng�. Nhi�m v� ng�n ch�n Nh�t Ph�m ���ng �o�t B�n �� S�n H� X� T�c giao cho <sex>, v�t v� cho ng��i r�i.",
	"Ti�n b�i kh�ch kh� th�. Ta ��n T�n L�ng t�m 10 M�t n� t� v�ng �� th�m d� h�nh ��ng ti�p theo c�a Xa Lu�n B� V��ng  ��y.",
	}

	DelItem(2,0,711,1);--ɾȥ������̽�麯
	SetTask(TASK_XB_ID_01,12);
	TalkEx("",strTalk);
	CreateTrigger(0,1230,KILL_XB_DAOMUREN);--��Ĺ��ɱ�ִ�����
	TaskTip("��n T�n L�ng ti�u di�t ng��i tr�m m� �� thu th�p 10 M�t n� t� v�ng.");
	Msg2Player("��n T�n L�ng ti�u di�t ng��i tr�m m� �� thu th�p 10 M�t n� t� v�ng.");
	GivePlayerAward("Award_XB_24","Easy");
	GivePlayerExp(SkeyXibei,"daomu")
end

--��ûȡ��10����˿������ŷ�����Ի�and����������
function task_011_04_1()

local strTalk = {
	"L�ng m� th�i x�a C� quan tr�ng tr�ng hu�ng chi ��y l� linh c�u c�a Ho�ng ��, ��t nh�p v�o m� ��u ph�i chuy�n d�. Hay l� ta �i h�i Cao nh�n ��o tr�m m�, ng��i h�y �i l�m vi�c do Xa Lu�n B� V��ng  giao cho, l�y M�t n� t� v�ng �� d�ng khi v�o m�.",
	}

	TalkEx("",strTalk);

	if GetTrigger(KILL_XB_DAOMUREN) == 0 then
		CreateTrigger(0,1230,KILL_XB_DAOMUREN);--��Ĺ��ɱ�ִ�����
		TaskTip("��n T�n L�ng ti�u di�t ng��i tr�m m� �� thu th�p 10 M�t n� t� v�ng.");
		Msg2Player("��n T�n L�ng ti�u di�t ng��i tr�m m� �� thu th�p 10 M�t n� t� v�ng.");
	end

end

---------------------------------- ������12��֧1_4�ϱ۲���----------------------------------

--��ȡ��10����˿���ֽ������ְ���
function task_012_01_0()

local strTalk = {};

	--��ȡ��10����˿����
	if GetItemCount(2,0,710) >= 10 then
		DelItem(2,0,710,8);
		strTalk = {
			"��y l� 10 M�t n� t� v�ng, b��c ti�p theo l� g� n�o.",
			"R�t t�t. Theo th�m t� h�i b�o trong l�ng m� tr�n ��y kh� ��c, M�t n� t� v�ng n�y d�ng khi v�o trong m�. Trong m� qu� nguy hi�m n�n ph�i giao cho �o�n T�y v� T�n Tho�i trong s� Th�p ��i Kim Cang �i l�m, ng��i h�y quay l�i T�n L�ng �em 2 M�t n� t� v�ng cho ch�ng, ch�ng �� ��i ngo�i l�ng m� r�i.",
			"Tu�n l�nh!",
			"(N�u nh� Th�p ��i Kim Cang v�o m� th� nh�t ��nh l�y ���c b�n ��.B�n �� S�n H� X� T�c li�n quan s� an nguy c�a thi�n h� n�u r�i v�o tay Nh�t Ph�m ���ng th� s� h�i n��c h�i d�n. Chi b�ng ��nh l�a �o�n T�y T�n Tho�i r�i ti�u di�t ch�ng. Th�p ��i Kim Cang b�t �i 1 ng��i s� y�u �i ph�n n�o.)",
			"(Nh� th� s� d�n ��n s� nghi ng� c�a Xa Lu�n B� V��ng, hay l� n�i r�ng ch�ng kh�ng ch�u �eo M�t n� t� v�ng v�o m� n�n b� tr�ng ��c, n�i kho�c r�ng kh� ��c trong m� v�n c�n h�ng h�c n�n d�i l�i th�i h�n v�o m�.)",
			};
		TalkEx("",strTalk);
		RemoveTrigger(GetTrigger(KILL_XB_DAOMUREN));
		SetTask(TASK_XB_ID_01,13);
		--�����ǰ�õı���
		SetTask(DUANBI_DEAD_STATE,0);
		SetTask(CANTUI_DEAD_STATE,0);
		TaskTip("Ti�u di�t �o�n T�y v� T�n Tho�i b�n ngo�i Ho�ng l�ng.");
		Msg2Player("Ti�u di�t �o�n T�y v� T�n Tho�i b�n ngo�i Ho�ng l�ng.");
		GivePlayerAward("Award_XB_25","Easy");
		GivePlayerExp(SkeyXibei,"jinsimianzhao")
	else
		strTalk = {
			"Ph�a ��ng c�a B�c Ph�ng T��ng l� T�n L�ng n�i ch�n c�t c�a T�n Th�y Ho�ng. Tr��c ��y �ng ta x�ng b� thi�n h�, t��ng truy�n trong m� c� Kho b�u n�n �� g�y s� ch� � c�a Ng��i tr�m m�, tr�n ng��i h� c� mang 1 lo�i v�t ph�m l� M�t n� t� v�ng. Ng��i h�y t�m c�ch mang v� 10 m�t n� t� v�ng, ta s� s�p x�p h�nh ��ng ti�p theo. ",
			};
		TalkEx("",strTalk);
	end

end

--��ûɱ���ϱ۲����복�ְ����Ի�and������˿����
function task_012_02_1()

local strTalk = {
	"M�t n� t� v�ng d�ng khi �i v�o m�. Ng��i �em 2 M�t n� t� v�ng ��n T�n L�ng giao cho �o�n T�y v� T�n Tho�i, ch�ng �� ��i � ngo�i m�.",
	"(N�u nh� Th�p ��i Kim Cang v�o m� th� nh�t ��nh l�y ���c b�n ��.B�n �� S�n H� X� T�c li�n quan s� an nguy c�a thi�n h� n�u r�i v�o tay Nh�t Ph�m ���ng th� s� h�i n��c h�i d�n. Chi b�ng ��nh l�a �o�n T�y T�n Tho�i r�i ti�u di�t ch�ng. Th�p ��i Kim Cang b�t �i 1 ng��i s� y�u �i ph�n n�o.)",
	"(Nh� th� s� d�n ��n s� nghi ng� c�a Xa Lu�n B� V��ng, hay l� n�i r�ng ch�ng kh�ng ch�u �eo M�t n� t� v�ng v�o m� n�n b� tr�ng ��c, n�i kho�c r�ng kh� ��c trong m� v�n c�n h�ng h�c n�n d�i l�i th�i h�n v�o m�.)",
	};

	if GetItemCount(2,0,710) < 2 then
		AddItem(2,0,710,2,1);
		TalkEx("",strTalk);
		TaskTip("Ti�u di�t �o�n T�y v� T�n Tho�i b�n ngo�i Ho�ng l�ng.");
		Msg2Player("Ti�u di�t �o�n T�y v� T�n Tho�i b�n ngo�i Ho�ng l�ng.");
	end

	TalkEx("",strTalk);

end

--�Ѿ�ɱ���ϱ۲����복�ְ����Ի�
function task_012_03_0()

local strTalk = {
	"Kh�ng xong r�i, �o�n T�y v� T�n Tho�i ��u m�t m�ng. S� vi�c qu� b�t ng� ta ch� t�m ���c Nh�t Ph�m Kim Cang L�nh tr�n ng��i ch�ng v� ph�c m�nh.",
	"�� x�y ra chuy�n g� v�y? V�i b�n l�nh c�a �o�n T�y T�n Tho�i sao l�i c� th� c�ng nhau b� m�ng? Ng��i h�y n�i r� h�n ng��i n�o �� ra tay?",
	"Ta theo l�i d�n c�a �ng �em M�t n� t� v�ng ��n tr��c l�ng m� giao cho h� nh�ng l�c ��n n�i �� kh�ng th�y h�. Nh�ng l�i nghe th�y ti�ng c�i nhau t� b�n trong m�, n�i l� Xa Lu�n qu� c�n th�n r�i, c� kh� ��c g� ��u? V� c�ng c�a ng��i thua ta xa h�y ngoan ngo�n � ��y ��i M�t n� t� v�ng �i. c�n n�i l� Ng��i mu�n v�o m� gi�nh b�u v�t tr��c ta sao? ��ng h�ng, m�t n� �� l� Xa Lu�n chu�n b� cho ng��i ��.",
	}

	TalkEx("task_012_03_0_1",strTalk);

end

--���Ի�
function task_012_03_0_1()

local strTalk = {
	"Sao? Ch�ng kh�ng �eo m�t n� m� v�o m�? ��ng ch�t, ta �� d�n l� ph�i �eo m�t n� m�i v�o m� kh�ng ng� ch�ng v�n ch�ng n�o t�t n�y, anh em v�i nhau m� tranh c�ng �o�t l�i. Kim Cang L�nh l� t�n v�t t�y th�n c�a Th�p ��i Kim Cang, ch�ng �� b� m�ng trong m� ra sao?",
	"��ng th�, ta � ngo�i nghe th�y v� c�ng s�t ru�t nh�ng kh�ng d�m v�o trong, ngh� r�ng �o�n T�y T�n Tho�i l� Th�p ��i Kim Cang c� th� tr� ra an to�n. Sau m�t h�i v�n ch�a th�y ai tr� ra, ta �� �eo m�t n� v�o trong m� xem th� ch� th�y x�c c�a ch�ng ngo�i ra kh�ng th�y ai kh�c, s�c m�t t�i �en e l� do tr�ng ��c m� ch�t.",
	"M� �� V��ng kh� ��c m� m�t, ngay c� Th�p ��i Kim Cang c�ng kh�ng tr�nh kh�i. Xem ra chuy�n v�o m� ph�i suy t�nh l�i, gi� ch� c� th� giao vi�c n�y cho Th�c B�t Ho�ng. Ng��i h�y �i xem h�n ��u v� xong ch�a sau �� n�i r� m�i vi�c r�i ��a M�t n� t� v�ng cho h�n �� s�p x�p vi�c v�o m�.",
	}

	TalkEx("task_012_03_0_2",strTalk);

end

--���Ի�
function task_012_03_0_2()

local strTalk = {
	"L�n n�y ta kh�ng l�m tr�n b�n ph�n, c� th� �� ta v�o m� �i�u tra �� l�y c�ng chu�c t�i kh�ng? Ta nh�t ��nh c� g�ng h�t s�c �� ho�n th�nh nhi�m v�.",
	"Ng��i ch� co t� tr�ch m�nh, ch� t�i �o�n T�y T�n Tho�i kh�ng nghe l�i khuy�n n�n t� r��c h�a v�o th�n. Ta bi�t ng��i n�ng l�ng mu�n l�p c�ng nh�ng Th�p ��i Kim Cang v�a m�t �i 2 ng��i, t�nh h�nh trong m� l�i kh�ng r� t�t nh�t ng��i kh�ng n�n manh ��ng, h�y �� vi�c n�o cho Th�c B�t Ho�ng.",
	"T�t nh�t n�n c�n th�n h�nh s�, ta �i t�m Th�c B�t Ho�ng ti�n b�i ��y. C�o t�.",
	"T�n n�y qu� l� c�n tr�ng, b� ngo�i ��i c� ch�n th�nh v�i ta th�c ch�t c�n nghi ng� th�n ph�n ng��i T�ng. Vi�c n�y kh�ng ��nh? (Nh�t Ph�m ���ng �� n�m ���c b� m�t c�a B�n �� S�n H� X� T�c ta ph�i t�m c�ch ng�n c�n.)",
	}

	TalkEx("task_012_03_0_3",strTalk);

end

--������
function task_012_03_0_3()

	give_zb_award(26);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		DelItem(2,0,750,1);--ɾȥһƷ�����֮�ϱ�
		DelItem(2,0,751,1);--ɾȥһƷ�����֮����
		SetTask(TASK_XB_ID_01,15);
		--������˿����
		if GetItemCount(2,0,710) < 2 then
			AddItem(2,0,710,2,1);
		end
		TaskTip("Giao M�t n� t� v�ng giao Th�c B�t Ho�ng.");
		Msg2Player("Giao M�t n� t� v�ng giao Th�c B�t Ho�ng.");
		GivePlayerAward("Award_XB_26","Easy");
		GivePlayerExp(SkeyXibei,"huanglingwai")
	end
end

--��ûǰ�����ذκ�Ի�
function task_012_03_1()

local strTalk = {
	"Ng��i ch� co t� tr�ch m�nh, ch� t�i �o�n T�y T�n Tho�i kh�ng nghe l�i khuy�n n�n t� r��c h�a v�o th�n. Ta bi�t ng��i n�ng l�ng mu�n l�p c�ng nh�ng Th�p ��i Kim Cang v�a m�t �i 2 ng��i, t�nh h�nh trong m� l�i kh�ng r� t�t nh�t ng��i kh�ng n�n manh ��ng, h�y �� vi�c n�o cho Th�c B�t Ho�ng.",
	"T�t nh�t n�n c�n th�n h�nh s�, ta �i t�m Th�c B�t Ho�ng ti�n b�i ��y. C�o t�.",
	"T�n n�y qu� l� c�n tr�ng, b� ngo�i ��i c� ch�n th�nh v�i ta th�c ch�t c�n nghi ng� th�n ph�n ng��i T�ng. Vi�c n�y kh�ng ��nh? (Nh�t Ph�m ���ng �� n�m ���c b� m�t c�a B�n �� S�n H� X� T�c ta ph�i t�m c�ch ng�n c�n.)",
	}

	TalkEx("",strTalk);

end

---------------------------------- ������13��֧1_5������Ĺ----------------------------------

--���ذκ�Ի��������˿����
function task_013_01_0()

local strTalk = {
	"Th�c B�t ti�n b�i, �ng �� quy�t ��u v�i T� M� ti�n b�i ch�a??",
	"Ng��i ��n th�t ��ng l�c ta �ang c� chuy�n bu�n phi�n. D�o tr��c ta quy�t ��u v�i T� M� Minh Phong ph�t hi�n r�ng �ng ta xu�t chi�u ch�m h�n x�a r�t nhi�u khi�n ta r�t ch�n n�n.",
	"Hai ng��i v�n ch�a ph�n th�ng b�i sao? N�u kh�ng c� � ch� chi�n ��u th� ���ng ki�m c�ng s� nh�n nh�m th�i. T� M� ti�n b�i ch�c �ang c� chuy�n phi�n n�o.",
	"Ng��i n�i kh�ng sai t� n�o, ki�m � c�a T� M� Minh Phong mang suy ngh�, th� m� ta c� t��ng �ng ta kh�ng mu�n quy�t ��u �i�u n�y khi�n ta lo l�ng. T� M� Minh Phong lu�n � Ph�ng T��ng ph� kh�ng mu�n �i ��u th� ra l� v� mu�n ��n T�n L�ng xem th�, l�u nay v�n ch�a ���c to�i nguy�n n�n lu�n l�nh nh�t ��i v�i s� ��i. L�n ��u ta v� h�n quy�t ��u l� do t�nh c� n�n m�i k�ch th�ch � ch� c�a �ng ta m� th�i.",
	}

	TalkEx("task_013_01_0_1",strTalk);

end

--���Ի�
function task_013_01_0_1()

local strTalk = {
	"Ra l� v�y ti�n b�i ch�a th� quy�t ��u ��n c�ng ch� tr�ch s�u n�o. T�i sao T� M� ti�n b�i mu�n v�o T�n L�ng? Th�t tr�ng h�p, Xa Lu�n B� V��ng mu�n �ng ti�p nh�n vi�c v�o m�, ��y l� M�t n� t� v�ng d�ng �� v�o m�.",
	"Chuy�n c�a T�n L�ng v�n ch�a c� k�t qu� sao? Vi�c n�y qu� l� t�n nhi�u th�i gian, gi� l�i c�n ��n t�m ta n�a. C�ng may T� M� Minh Phong �ang mu�n v�o m�, tuy ta kh�ng bi�t m�c ��ch c�a �ng ta nh�ng ch� c�n h�n tr�t b� t�m s� m� quy�t ��u v�i ta th� �� r�i. Ng��i h�y �em M�t n� t� v�ng giao cho �ng ta.",
	"H�? Ha ha� Th�c B�t ti�n b�i l�i l�m theo � m�nh r�i, l�n n�y Xa Lu�n B� V��ng l�i t�c gi�n cho m� xem.",
	}

	TalkEx("task_013_01_0_2",strTalk);

end

--���Ի�
function task_013_01_0_2()

local strTalk = {
	"C� �� h�n t�c gi�n �i, ta s� ch�u m�i tr�ch nhi�m. N�u �� l� m�t ��i th� nh� th� th� �� c�n ��ng ti�c h�n chuy�n c�a T�n L�ng n�a. V� l�i v�n c�n 1 c�i m�t n� ta c� th� ph�i ng��i kh�c v�o m� �i�u tra.",
	"���c r�i ta �i t�m T� M� Minh Phong ��y.",
	"(T� M� ti�n b�i c�ng t�i T�n L�ng, ch�ng l� �ng ta bi�t tin t�c c�a B�n �� S�n H� X� T�c? M�nh ta �eo m�t n� v�o m� c�ng kh� m�o hi�m chi b�ng �i t�m T� M� ti�n b�i d� h�i � c�a �ng ta.)",
	}

	TalkEx("",strTalk);
		--�����˿����
	if GetItemCount(2,0,710) >= 1 then
		DelItem(2,0,710,GetItemCount(2,0,710));
		AddItem(2,0,710,1,1);
	else
		AddItem(2,0,710,1,1);
	end

	SetTask(TASK_XB_ID_01,16);
	TaskTip("Giao 1 M�t n� t� v�ng cho T� M� Minh Phong.");
	Msg2Player("Giao 1 M�t n� t� v�ng cho T� M� Minh Phong.");

end

--��δ��˾�������ȥ��˿����and�������֣�û�����ֲ��ܽ�����һ�㣩
function task_013_01_1()

local strTalk = {
	"Kh�ng bi�t t�i sao T� M� Minh Phong c� canh c�nh trong l�ng v� T�n L�ng, ng��i h�y giao 1 M�t n� t� v�ng cho h�n �� h�n gi�i quy�t xong t�m nguy�n m� s�m quy�t ��u v�i ta.",
	};

	--��ʧ�����ֲ���
	if GetItemCount(2,0,710) < 1 then
		AddItem(2,0,710,1,1);
		strTalk = {};
	end

	TalkEx("",strTalk);

end

--����˿���ֽ���˾������
function task_013_02_0()

local strTalk = {
	"T� M� ti�n b�i v�n kh�e ch�? Nghe Th�c B�t Ho�ng ti�n b�i n�i �ng c� chuy�n phi�n mu�n n�n kh�ng th� t�p trung ��u v�?",
	"Ta �� t�ng th� ��c r�ng s� kh�ng ��ng th� v�i ai, kh�ng ng� l�i g�p ph�i Th�c B�t Ho�ng n�n nh�t th�i b� �ng ta kh�u kh�ch. Ta t��ng h�n h�n ta quy�t ��u l� mu�n l�i k�o ta v�o Nh�t Ph�m ���ng, th�c ra h�n ch� mu�n so t�i n�n khi�n ta m�t h�t � ch� chi�n ��u, s� r�ng n� s� l�m h�n th�t v�ng.",
	"Th�c B�t ti�n b�i ��ng l� h�i th�t v�ng nh�ng bi�t T� M� ti�n b�i lo l�ng chuy�n T�n L�ng, m� g�n ��y ta �i�u tra ���c tin t�c li�n quan ��n T�n L�ng n�n sai ta ��n t�m T� M� ti�n b�i �� gi�p �ng gi�i t�a n�i lo. �ng t�ng nghe trong m� c� Kh� ��c kh�ng?",
	"Kh�ng gi�u g� ng��i, ta lu�n mu�n v�o trong T�n L�ng xem th� nh�ng lu�n b� Kh� ��c trong m� l�m ta ch�n b��c. T�n L�ng kh�ng h� danh l� M� �� V��ng, Kh� ��c r�t nhi�u, ta �� th� d�ng ch�n kh� to�n th�n ng�n c�n kh� ��c �� v�o m� nh�ng v�n kh�ng ch�u n�i n�a canh gi�. <sex> d��ng nh� r�t am hi�u T�n L�ng kh�ng bi�t c� cao ki�n g�?",
	}

	TalkEx("task_013_02_0_1",strTalk);

end

--���Ի�
function task_013_02_0_1()

local strTalk = {
	"Ti�n b�i kh�ch s�o r�i, ta ch� t�nh c� bi�t ���c m�t s� th�ng tin trong l�c l�m nhi�m v�, n�u �ng mu�n v�o trong th� c�ng ���c, nh�ng kh� ��c trong m� r�t m�nh v�o trong �� r�i kh�ng bi�t s�ng ch�t ra sao, �ng h�y suy ngh� cho k�.",
	"Ng��i c� c�ch v�o m� sao? T�m nguy�n l�u nay c�a ta ch� mu�n V�o m� xem th�, v�n �� kh�ng m�ng ��n chuy�n s�ng ch�t. Nh�ng n�u chuy�n li�n quan ��n b� m�t c�a Nh�t Ph�m ���ng th� ta c�ng kh�ng �p ng��i, nh�ng c� th� gi�p ta l�m r� m�t vi�c kh�ng? Ta s� ��n ��p c�ng �n c�a c�c h�.",
	"Ta c� bi�t s� v� c�ch v�o m� nh�ng kh�ng ch�c l� s� th�nh c�ng, ti�n b�i h�y cho ta bi�t nguy�n nh�n �ng v�o m�? Ta nh�t ��nh s� gi�p �� �ng.",
	"Chuy�n c�ch nay �� 18 n�m r�i, l�c tr� ta �� qu� �am m� v� thu�t m� t�o n�n nghi�p ch��ng, T� Qu�n v� ta �� ��c trong m�t s� ghi ch�p c� bi�t ���c T�n L�ng c� ch�a M�t b�o th�n binh vi�t M�c ��u l� B�i Ki�m �� theo T�n V��ng chinh chi�n nhi�u n�m. Th�n ki�m �en nh� m�c, ���c r�n t� s�t ng�n n�m tuy nh� nh�ng s�c b�n, c� th� ph�t huy h�t uy l�c ki�m ph�p c�a ta. T� Qu�n th�a l�c ta ��n Hoa S�n lu�n ki�m �� m�t m�nh v�o m�, ��n nay �� 18 n�m.",
	}

	TalkEx("task_013_02_0_2",strTalk);

end

--���Ի�
function task_013_02_0_2()

local strTalk = {
	"Th� ra l� th� n�n ti�n b�i �� mai danh �n t�ch.",
	"T� Qu�n v�n ch�a r� s�ng ch�t, n�u kh�ng t�m ���c thi th� ta s� kh�ng cam l�ng. V� c�ng thi�n h� �� nh�t th� sao ch�? Ngay c� ng��i con g�i m�nh y�u qu� c�ng kh�ng gi� ���c. N�u <sex> c� th� v�o m� ta ch� nh� ng��i �i�u tra tin c�a v� ta T� Qu�n, d� s�ng hay ch�t c�ng b�o cho ta bi�t.",
	"Ti�n b�i n�ng t�nh th� sao ta c� th� kh�ng gi�p? �ng c� y�n t�m, v� ch�ng �ng t�nh s�u ngh�a n�ng nh�t ��nh s� g�p l�i nhau. Xin c�o t�.",
	"(Kh�ng c�n c�ch n�o hay h�n l� l�i d�ng t�nh ngh�a c�a T� M� ti�n b�i �� v�o m�, ��nh ph�i v�a truy t�m B�n �� S�n H� X� T�c v�a gi�p �ng ta ho�n th�nh t�m nguy�n. Ph�i r�i �u D��ng H�a  t�ng d�n tr��c khi v�o m� h�y ��n t�m �ng ta.)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,17);
	TaskTip("H�i �u D��ng H�a chuy�n v�o m�.");
	Msg2Player("H�i �u D��ng H�a chuy�n v�o m�.");
	GivePlayerAward("Award_XB_27","Easy");
	GivePlayerExp(SkeyXibei,"lianggemianzhao")
end

--��δѯ��ŷ������Ĺ���
function task_013_02_1()

local strTalk = {
	"V� c�ng thi�n h� �� nh�t th� sao ch�? Ngay c� ng��i con g�i m�nh y�u qu� c�ng kh�ng gi� ���c. N�u <sex> c� th� v�o m� ta ch� nh� ng��i �i�u tra tin c�a v� ta T� Qu�n, d� s�ng hay ch�t c�ng b�o cho ta bi�t.",
	"(Kh�ng c�n c�ch n�o hay h�n l� l�i d�ng t�nh ngh�a c�a T� M� ti�n b�i �� v�o m�, ��nh ph�i v�a truy t�m B�n �� S�n H� X� T�c v�a gi�p �ng ta ho�n th�nh t�m nguy�n. Ph�i r�i �u D��ng H�a  t�ng d�n tr��c khi v�o m� h�y ��n t�m �ng ta.)",
	}

	TalkEx("",strTalk);

end

--ѯ��ŷ������Ĺ���
function task_013_03_0()

local strTalk = {
	"Ti�n b�i t�m ���c Cao nh�n ��o tr�m m� ch�a? Ta c�n v�o m� m�t chuy�n.",
	"T�t l�m, chuy�n v�o m� v� c�ng c�p b�ch, T��ng binh m� trong m� �� s�ng l�i, ch�c ��y l� s�c m�nh c�a B�n �� S�n H� X� T�c nh�t ��nh kh�ng th� �� B�n �� S�n H� X� T�c r�i v�o tay ng��i T�y H�. T�nh h�nh trong m� ta c�ng kh�ng r�, e r�ng v�i M�t n� t� v�ng c�ng s� c� tr� ng�i, M� �� V��ng kh�ng th� xem th��ng. Ta t�m ���c truy�n nh�n c�a C��p m� t�n l� Li�u T�ng V�n .",
	"T�t r�i, ng��i n�y � ��u? Ta s� �i t�m h�n.",
	"Ng��i n�y h�nh ngh� Tr�m m� � Ph�ng T��ng ph�, tinh th�ng C�ch t�o c� quan r�t am hi�u v� T�n L�ng. Ng��i h�y �i d� h�i t�nh h�nh trong m�, ta ph�i v�o m� tr��c ng��i T�y H�, c�ng ph�i c�n th�n v�i t��ng binh m� v� c� quan trong m�.",
	"�a t� ti�n b�i!",
	}

	SetTask(TASK_XB_ID_01,18);
	TalkEx("",strTalk);
	TaskTip("H�i Li�u T�ng V�n c�ch �� v�o Ho�ng L�ng m� th�t.");
	Msg2Player("H�i Li�u T�ng V�n c�ch �� v�o Ho�ng L�ng m� th�t.");
	GivePlayerExp(SkeyXibei,"daomushijia")
end

--��δѯ����������Ĺ���
function task_013_03_1()

local strTalk = {
	"Ph�ng T��ng ph� c� truy�n nh�n c�a C��p m� t�n l� Li�u T�ng V�n , ng��i n�y tinh th�ng C�ch t�o c� quan, ng��i c� th� t�m h�n �� h�i t�nh h�nh trong �� ta ph�i v�o m� tr��c ng��i T�y H�.",
	}

	TalkEx("",strTalk);

end

--ѯ����������Ĺ�������ɱ�ִ�����
--��Ҫ30���Ӳ������²�����������ֹˢBoss�����¼ʱ��
function task_013_04_0()

local strTalk = {
	"��y c� ph�i l� Li�u T�ng V�n? Nghe n�i c�c h� l� ng��i tr�m m� n�n mu�n th�nh gi�o v�i �i�u v� c� m�.",
	"��ng r�i. Th� ra <sex> c�ng h�ng th� v�i c� m� sao? C� m� v� c� quan trong �� c� r�t nhi�u d�ng, m� m�i lo�i c� quan c� c�ch ph� gi�i kh�c nhau, <sex> mu�n bi�t c�u t�o c�a l�ng m� n�o?",
	"�ng �� t�ng v�o T�n L�ng ch�a? C� bi�t t�nh h�nh b�n trong kh�ng?",
	"Sao? Ng��i n�i T�n L�ng? ��y� ��y kh�ng ph�i n�i ai c�ng v�o ���c. C� ��i ta t�ng v�o nhi�u ng�i m� nh�ng ch�a g�p c�i n�o k� l� nh� th�. Tuy l� M� �� V��ng nh�ng c�ng l� v�t �� ch�t v�y m� T��ng binh m� trong m� si�u vi�t ��n n�i g�p ng��i l� gi�t.",
	"V�y l� chuy�n t��ng binh m� s�ng l�i l� c� th�t, s�c m�nh c�a B�n �� S�n H� X� T�c qu� kh�ng th� �o�n.",
	}

	--85�����ܼ�������
	if GetLevel() >= 72 then
		TalkEx("task_013_04_0_1",strTalk);
	else
		strTalk = {
			"��y c� ph�i l� Li�u T�ng V�n? Nghe n�i c�c h� l� ng��i tr�m m� n�n mu�n th�nh gi�o v�i �i�u v� c� m�.",
			"��ng r�i. Th� ra <sex> c�ng h�ng th� v�i c� m� sao? C� m� v� c� quan trong �� c� r�t nhi�u d�ng, m� m�i lo�i c� quan c� c�ch ph� gi�i kh�c nhau, <sex> mu�n bi�t c�u t�o c�a l�ng m� n�o?",
			"�ng �� t�ng v�o T�n L�ng ch�a? C� bi�t t�nh h�nh b�n trong kh�ng?",
			"Sao? Ng��i n�i T�n L�ng? ��y� ��y kh�ng ph�i n�i ai c�ng v�o ���c. C� ��i ta t�ng v�o nhi�u ng�i m� nh�ng ch�a g�p c�i n�o k� l� nh� th�. Tuy l� M� �� V��ng nh�ng c�ng l� v�t �� ch�t v�y m� T��ng binh m� trong m� si�u vi�t ��n n�i g�p ng��i l� gi�t.",
		}
		TalkEx("task_013_04_0_2",strTalk);
	end

end

--���Ի�
function task_013_04_0_1()

local strTalk = {
	"B�n �� S�n H� X� T�c l� b�u v�t g� th�? C� li�n quan ��n t��ng binh m� sao? ���c th�i ta �� quy�t ��nh kh�ng ��n �� n�a th� c�ng kh�ng ng�i n�i ng��i bi�t. T�n L�ng r�t to l�n v� chia l�m 2 t�ng. m�i t�ng ��u c� T��ng binh m� tr�n gi�, l�c ta ��t nh�p v�o th� b� ch�ng t�n c�ng n�u ta kh�ng nhanh ch�n ch�y tr�n b�ng m�t ��o th� e l� �� ph�i b� m�ng r�i.",
	"N�u v�y �ng c� th� cho ta bi�t ph��ng ph�p �� v�o m� kh�ng?",
	"Huy�t m� nguy hi�m nh� c� g� hay ho ch�? n�u ng��i c� kh�ng kh�ng mu�n �i th� ph�i c�n th�n. M�t ��o L�ng m� t�ng 1quanh co v� tr�ng kh�ng, thi�t ngh� b�u v�t ���c gi�u � t�ng 2. C� quan � t�ng 1 r�t �t ch� c�n M�t n� t� v�ng l� ��. Nh�ng c�ng v�o L�ng m� t�ng 2 do Th�ng l�nh t��ng binh m� tr�n gi�, c�n ��nh b�i 25 v� v� t��ng binh m� v� 25 h� v� t��ng binh m� th� th�ng l�nh m�i xu�t hi�n. ��ng r�i, M� Kim ph� v�t gia truy�n c�a ta b� Th�ng l�nh t��ng binh m� c��p m�t, n�u ng��i ��nh b�i th�ng l�nh c� th� gi�p ta l�y l�i n� kh�ng? Khi tr� v� ��y ta s� d�y ng��i c�ch �� v�o t�ng 2.",
	"�a t� ti�n sinh ch� gi�o, n�u kh�ng th� ��nh b�i Th�ng l�nh t��ng binh m� m� l�n t�ng 2 ch�nh l� t� t�m ch� ch�t. �ng h�y ��i tin t�c c�a ta.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,19);
	SetTask(TASK_BINGMAYONGTONGLING_TIME,GetTime());--��¼ʱ��
	CreateTrigger(0,1231,KILL_XB_KONGSHOUBINGMAYONG);--ɱ�ִ�����
	CreateTrigger(0,1232,KILL_XB_CHINUBINGMAYONG);--ɱ�ִ�����
	--�����ǰʹ�ñ���״̬
	SetTask(KONGSHOU25_STATE,0);
	SetTask(CHINU25_STATE,0);
	TaskTip("��n l�ng m� t�ng 1 ti�u di�t 25 V� v� t��ng binh m� v� H� v� t��ng binh m�.");
	Msg2Player("��n l�ng m� t�ng 1 ti�u di�t 25 V� v� t��ng binh m� v� H� v� t��ng binh m�, sau �� ti�u di�t Th�ng l�nh t��ng binh m� l�y M� Kim Ph� v� cho Li�u T�ng V�n.");
end

--���Ի�
function task_013_04_0_2()

local strTalk = {
	"V�y l� chuy�n t��ng binh m� s�ng l�i l� c� th�t, s�c m�nh c�a B�n �� S�n H� X� T�c qu� kh�ng th� �o�n.",
	"B�n �� S�n H� X� T�c l� b�u v�t g� th�? C� li�n quan ��n t��ng binh m� sao? ���c th�i ta �� quy�t ��nh kh�ng ��n �� n�a th� c�ng kh�ng ng�i n�i ng��i bi�t. T�n L�ng r�t to l�n v� chia l�m 2 t�ng. m�i t�ng ��u c� T��ng binh m� tr�n gi�, l�c ta ��t nh�p v�o th� b� ch�ng t�n c�ng n�u ta kh�ng nhanh ch�n ch�y tr�n b�ng m�t ��o th� e l� �� ph�i b� m�ng r�i.",
	"N�u v�y �ng c� th� cho ta bi�t ph��ng ph�p �� v�o m� kh�ng?",
	"Li�u T�ng V�n: theo ta th�y, th�c l�c hi�n t�i c�a <sex>, v�o L�ng C� m� ch� e l� m�t �i kh�ng tr� l�i, h�y quay v� luy�n th�m 1 th�i gian �i, ��t c�p 72 h�y ��n t�m ta",
	"�a t� ti�n b�i."
	}

	TalkEx("",strTalk);
end


--��δȡ�������and��Ҫ30���Ӳ������²�����������ֹˢBoss
function task_013_04_1()

local strTalk = {};

	--�������û��ɱ��ͳ��
	if GetTask(KONGSHOU25_STATE) == 1 and GetTask(CHINU25_STATE) == 1 then
		if (GetTime() - GetTask(TASK_BINGMAYONGTONGLING_TIME)) < 1800 then -- �ж�ʱ������
			strTalk = {
				"C�ng v�o L�ng m� t�ng 2 do Th�ng l�nh t��ng binh m� tr�n gi�, c�n ��nh b�i 25 v� v� t��ng binh m� v� 25 h� v� t��ng binh m� th� th�ng l�nh m�i xu�t hi�n. ��ng r�i, M� Kim ph� v�t gia truy�n c�a ta b� Th�ng l�nh t��ng binh m� c��p m�t, n�u ng��i ��nh b�i th�ng l�nh c� th� gi�p ta l�y l�i n� kh�ng? Khi tr� v� ��y ta s� ch� ng��i c�ch �� v�o t�ng 2.",
				};
		else --���·�������
			CreateTrigger(0,1231,KILL_XB_KONGSHOUBINGMAYONG);--ɱ�ִ�����
			CreateTrigger(0,1232,KILL_XB_CHINUBINGMAYONG);--ɱ�ִ�����
			SetTask(KONGSHOU25_STATE,0);
			SetTask(CHINU25_STATE,0);
			strTalk = {
				"C�ng v�o L�ng m� t�ng 2 do Th�ng l�nh t��ng binh m� tr�n gi�, c�n ��nh b�i 25 v� v� t��ng binh m� v� 25 h� v� t��ng binh m� th� th�ng l�nh m�i xu�t hi�n. ��ng r�i, M� Kim ph� v�t gia truy�n c�a ta b� Th�ng l�nh t��ng binh m� c��p m�t, n�u ng��i ��nh b�i th�ng l�nh c� th� gi�p ta l�y l�i n� kh�ng? Khi tr� v� ��y ta s� ch� ng��i c�ch �� v�o t�ng 2.",
				};
			TaskTip("��n l�ng m� t�ng 1 ti�u di�t 25 V� v� t��ng binh m� v� H� v� t��ng binh m�.");
			Msg2Player("�eo m�t n� t� v�ng r�i v�o l�ng m� t�ng 1, ti�u di�t 25 v� v� t��ng binh m� v� 25 h� v� t��ng binh m�, sau �� ��nh b�i Th�ng l�nh t��ng binh m� �o�t l�i M� Kim ph� cho Li�u T�ng V�n.");
		end
	--��δ������񲹷�������
	else
		if GetTrigger(KILL_XB_KONGSHOUBINGMAYONG) == 0 and GetTask(KONGSHOU25_STATE) == 0 then
			CreateTrigger(0,1231,KILL_XB_KONGSHOUBINGMAYONG);--ɱ�ִ�����
			TaskTip("��n l�ng m� t�ng 1 ti�u di�t 25 V� v� t��ng binh m� v� H� v� t��ng binh m�.");
			Msg2Player("�eo m�t n� t� v�ng r�i v�o l�ng m� t�ng 1, ti�u di�t 25 v� v� t��ng binh m� v� 25 h� v� t��ng binh m�, sau �� ��nh b�i Th�ng l�nh t��ng binh m� �o�t l�i M� Kim ph� cho Li�u T�ng V�n.");
		elseif GetTrigger(KILL_XB_CHINUBINGMAYONG) == 0 and GetTask(CHINU25_STATE) == 0 then
			CreateTrigger(0,1232,KILL_XB_CHINUBINGMAYONG);--ɱ�ִ�����
			TaskTip("��n l�ng m� t�ng 1 ti�u di�t 25 V� v� t��ng binh m� v� H� v� t��ng binh m�.");
			Msg2Player("�eo m�t n� t� v�ng r�i v�o l�ng m� t�ng 1, ti�u di�t 25 v� v� t��ng binh m� v� 25 h� v� t��ng binh m�, sau �� ��nh b�i Th�ng l�nh t��ng binh m� �o�t l�i M� Kim ph� cho Li�u T�ng V�n.");
		else--����������
			strTalk = {
				"C�ng v�o L�ng m� t�ng 2 do Th�ng l�nh t��ng binh m� tr�n gi�, c�n ��nh b�i 25 v� v� t��ng binh m� v� 25 h� v� t��ng binh m� th� th�ng l�nh m�i xu�t hi�n. ��ng r�i, M� Kim ph� v�t gia truy�n c�a ta b� Th�ng l�nh t��ng binh m� c��p m�t, n�u ng��i ��nh b�i th�ng l�nh c� th� gi�p ta l�y l�i n� kh�ng? Khi tr� v� ��y ta s� ch� ng��i c�ch �� v�o t�ng 2.",
				};
		end
	end

	TalkEx("",strTalk);

end

--ˢ������ٸͳ��
function CreateBingMaYongTongLing()

local nMapPosIndex = random(1,getn(BingMaYongTongLing_MapData));
local nNpcIndex = 0;

	Msg2Player("Th�ng l�nh t��ng binh m� xu�t hi�n r�i!")
	nNpcIndex = CreateNpc("L�nh qu�n t��ng binh m�","Th�ng l�nh t��ng binh m�",513,BingMaYongTongLing_MapData[nMapPosIndex][1],BingMaYongTongLing_MapData[nMapPosIndex][2]);
	SetNpcScript(nNpcIndex,"\\script\\������\\����Ĺ��һ��\\npc\\����ٸͳ��.lua");
	SetNpcLifeTime(nNpcIndex,1500);
	Msg2Player("Th�ng l�nh t��ng binh m� xu�t hi�n t�i  "..BingMaYongTongLing_MapData[nMapPosIndex][3]..", "..BingMaYongTongLing_MapData[nMapPosIndex][4].."  mau �i ti�u di�t �� l�y M� Kim Ph�.")
	TaskTip("Th�ng l�nh t��ng binh m� xu�t hi�n t�i "..BingMaYongTongLing_MapData[nMapPosIndex][3]..", "..BingMaYongTongLing_MapData[nMapPosIndex][4].." mau �i ti�u di�t �� l�y M� Kim Ph�.");
end


---------------------------------- ������14��֧1_6��Ĺ֮��----------------------------------
--ɱ������ٸͳ��ȡ����������������ƶԻ�
function task_014_01_0()

local strTalk = {
	"�ng xem th� ��y c� ph�i l� M� Kim ph� kh�ng? Ta �� ��nh b�i l�nh qu�n t��ng binh m�, c�ng v�o l�ng m� t�ng 2 �� xu�t hi�n nh�ng kh�ng th� �i v�o, l�m th� n�o �� v�o ���c ��y?",
	"T�t, ��ng l� M� Kim ph� r�i. <sex> th�t l� t�i c� th� ��nh b�i s� t��ng binh m� ��. N�u mu�n v�o b�n trong c� m� th� ph�i c� c�ch, �� l� c� m� ��u c� d� th�, c� quan ho�c x�c ng��i l�mtr�n m� linh v�t M� �� V��ng c�ng th�.",
	"Nh�ng ta kh�ng th�y trong l�ng m� t�ng 1 c� linh v�t g�, ch� th�y r�t nhi�u t��ng binh m�.",
	"���ng nhi�n r�i, m� c�a T�n V��ng sao d� d�ng �� ng��i ngo�i qu�y nhi�u? Huy�t m� n�y kh�ng ch� c� Linh v�t r�t m�nh tr�n gi� c�ng l�i c� phong th�y tr�n. n�u kh�ng ph� ���c n� e r�ng h�nh d�ng c�a Linh v�t c�ng kh�ng th�y ���c. Tuy c�ch b� tr� c�a c�c m� th�t ��u kh�ng gi�ng nhau nh�ng c�ng kh�ng n�m ngo�i �i�m chung, ng��i c�n �o�n Th�y Ch� v� La Canh �� ph� n�.",
	"Ph� phong th�y tr�n c�n �o�n Th�y Ch� v� La Canh ta c� th� t�m ch�ng � ��u?",
	}

	TalkEx("task_014_01_0_1",strTalk);

end

--���Ի�
function task_014_01_0_1()

local strTalk = {
	"La Canh �� t�m huy�t phong th�y, �o�n Th�y Ch� �� ��ng v�o huy�t phong th�y, ch� khi ph� ���c 4 �i�m phong th�y m�i v�o ���c m�t ��o c�a tr�n m� linh v�t, ph� v� tr�n m� linh v�t m�i v�o ���c t�ng 2. Hai th� n�y v�n d� ta ��u c� nh�ng l�n tr��c khi ��n m� cung sa m�c t�m b�u v�t c� gh� qua D��c V��ng C�c, b� Ng��i T�y H� � �� c��p m�t r�i.",
	"Sao? B� Ng��i T�y H� c��p �i r�i sao?",
	"K� ra c�ng l� Ng��i T�y H� sao l�i �i c��p th� kh�ng c� t�c d�ng g� ngo�i vi�c tr�m m� th� ch�. S� ng��i qua l�i � D��c V��ng C�c l� do v� s� T�y H� v� d�ng s� T�y H� gi� d�ng.",
	"Kh�ng xong r�i, c�m �n ti�n sinh, ta �i t�m �o�n Th�y Ch� v� La Canh v� ��y.",
	"(Ng��i T�y H� �� t�p h�p t� l�c n�o th�? T�m g�c l�i chuy�n n�y, mau ��n D��c V��ng C�c l�y 4 �o�n Th�y Ch� v� La Canh.)",
	}

	TalkEx("",strTalk);
	DelItem(2,0,712,1);--ɾȥ�����
	SetTask(TASK_XB_ID_01,21);
	CreateTrigger(0,1233,KILL_XB_XIXIAWUSHI);--ɱ�ִ�����
	CreateTrigger(0,1234,KILL_XB_XIXIAYONGSHI);--ɱ�ִ�����
	SetTask(FENGSHUIXUE_ID,0);--�Է�ˮѨ��ر�������
	SetTask(FENGSHUIXUE_STATE,0);--�Է�ˮѨ��ر�������
	SetTask(TASK_BINGMAYONGTONGLING_TIME,0);--��ͳ��ˢ��ʱ���������
	TaskTip("��n D��c V��ng C�c thu th�p 4 �o�n Th�y Ch� v� 1 La Canh t� v� s� T�y H� v� d�ng s� T�y H�.");
	Msg2Player("��n D��c V��ng C�c thu th�p 4 �o�n Th�y Ch� v� 1 La Canh t� v� s� T�y H� v� d�ng s� T�y H�.");
	GivePlayerAward("Award_XB_28","Easy");
	GivePlayerExp(SkeyXibei,"mojinfu")
end

--ȡ�û�δȡ�ö�ˮ�����޸�
function task_014_02_0()

local strTalk = {};

	--���ض�ˮ�����޸�
	if GetItemCount(2,0,713) >= 4 and GetItemCount(2,0,714) >= 1 then
		strTalk = {
			"Li�u ti�n sinh xem th� ��y c� ph�i �o�n Th�y Ch� v� La Canh kh�ng, nh�ng th� n�y l�m sao s� d�ng?",
			"��ng r�i nh�ng th�t c� l�i v�i <sex>, nh�ng th� n�y e r�ng ch�a th� ph� phong th�y tr�n. V� ch� c� Ph� Phong Ch�y m�i c� th� ��ng �o�n Th�y Ch� v�o huy�t phong th�y, v�a m�i c� ng��i t� x�ng l� Nh�t Ph�m ���ng kim cang tr�o v��ng ��n h�i ta l�y Ph� Phong Ch�y. N� l� m�t b�o tr�m m� gia truy�n c�a nh� ta v�n ��nh cho ng��i m��n th� sao ta ��a cho h�n? Th� l� h�n ra tay c��p ch�y c�a ta v� k�t qu� ch�y �� b� h�n c��p �i.",
			"Sao? H�n t� x�ng l� Nh�t Ph�m ���ng kim cang sao?",
			}

		TalkEx("task_014_02_0_1",strTalk);

	--û�д�����Ʒand�������񴥷���
	else
		strTalk = {
			"�o�n Th�y Ch� v� La Canh v�n d� ta ��u c� nh�ng l�n tr��c khi ��n m� cung sa m�c t�m b�u v�t c� gh� qua D��c V��ng C�c, b� Ng��i T�y H� � �� c��p m�t r�i. Sao ch�ng l�i c��p d�ng c� tr�m m� c�a ta th�t k� l�.",
			}
		if	GetTrigger(KILL_XB_XIXIAWUSHI) == 0 or GetTrigger(KILL_XB_XIXIAYONGSHI) == 0 then
			if GetTrigger(KILL_XB_XIXIAWUSHI) == 0 then
				CreateTrigger(0,1233,KILL_XB_XIXIAWUSHI);--ɱ�ִ�����
			end
			if GetTrigger(KILL_XB_XIXIAYONGSHI) == 0 then
				CreateTrigger(0,1234,KILL_XB_XIXIAYONGSHI);--ɱ�ִ�����
			end
			TaskTip("��n D��c V��ng C�c thu th�p 4 �o�n Th�y Ch� v� 1 La Canh t� v� s� T�y H� v� d�ng s� T�y H�.");
			Msg2Player("��n D��c V��ng C�c thu th�p 4 �o�n Th�y Ch� v� 1 La Canh t� v� s� T�y H� v� d�ng s� T�y H�.");
		end
		TalkEx("",strTalk);
	end

end

--���Ի�
function task_014_02_0_1()

local strTalk = {
	"��ng r�i, �� l� do Ng��i T�y H� gi� d�ng. Ch�ng l� Ng��i T�y H� l�i mu�n �i tr�m m�, sao ch�ng l�i c��p d�ng c� tr�m m� c�a ta? Ng��i ph�i d�ng La Canh t�m huy�t phong th�y sau �� d�ng Ph� Phong Ch�y �� ��ng �o�n Th�y Ch� v�o, th� c� th� ph� phong th�y tr�n m� m�t ��o c�a tr�n m� linh v�t, C� quan th� m� nh�n � c�ng v�o t�ng 2 s� d�n ng��i v�o trong.",
	"Chuy�n kh�ng hay r�i. �a t� ti�n sinh ch� gi�o, ta ph�i ��n l�ng m� m�t chuy�n, c�o t�.",
	"(Ch�ng l� Nh�t Ph�m ���ng �� t�m ���c c�ch v�o m�? H�t c��p La Canh v� �o�n Th�y Ch� l�i �o�t Ph� Phong Ch�y, Th�p ��i Kim Cang c�ng h�nh ��ng r�i th� nguy cho B�n �� S�n H� X� T�c. Kh�ng th� �� Ng��i T�y H� ��t ���c m�c ��ch, hay l� ta tr� v� h�i Th�c B�t Ho�ng  xem sao.)",
	}

	RemoveTrigger(GetTrigger(KILL_XB_XIXIAWUSHI));
	RemoveTrigger(GetTrigger(KILL_XB_XIXIAYONGSHI));
	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,22);
	TaskTip("T�m Th�c B�t Ho�ng �i�u tra v� tr�o v��ng.");
	Msg2Player("T�m Th�c B�t Ho�ng �i�u tra v� tr�o v��ng.");
	GivePlayerAward("Award_XB_30","Easy");
	GivePlayerExp(SkeyXibei,"rumujiguan")
end

--��δ���ذκ�Ի�(������ˮ�����޸�)
function task_014_02_1()

local strSay = {
	"<sex> sao l�i quay v� r�i?",
	"T�i h� l�m m�t �o�n Th�y Ch� v� La Canh r�i/task_014_02_2",
	"Kh�ng c� g�/task_014_02_3",
	}

	SelectSay(strSay);

end

--������ˮ�����޸�
function task_014_02_2()

local strTalk = {};

	--���ϴ���4����ˮ�����޸�
	if GetItemCount(2,0,713) >= 4 and GetItemCount(2,0,714) >= 1 then
		strTalk = {
			"<sex> t�m k� l�i xem, ta v�a th�y 4 �o�n Th�y Ch� v� La Canh trong ba l� c�a ng��i, s� � nh� th� sao m� v�o trong l�ng m� ch�?",
			"L�i c�a ti�n b�i n�i ch� ph�i, l�n sau ta s� c�n th�n h�n.",
			};
		TalkEx("",strTalk);
		return
	end

	if GetItemCount(2,0,713) < 4 then
		AddItem(2,0,713,(4-GetItemCount(2,0,713)),1);
	end

	if GetItemCount(2,0,714) < 1 then
		AddItem(2,0,714,1,1);
	end

	strTalk = {
		"T�n Nh�t Ph�m ���ng kim cang tr�o v��ng n�o �� �� c��p Ph� Phong Ch�y c�a ta. Kh�ng c� Ph� Phong Ch�y th� kh�ng th� ph� phong th�y tr�n trong m� c�ng kh�ng th� m� m�t ��o c�a tr�n m� linh v�t.",
		"(Ch�ng l� Nh�t Ph�m ���ng �� t�m ���c c�ch v�o m�? Nguy cho B�n �� S�n H� X� T�c r�i, kh�ng th� �� Ng��i T�y H� ��t ���c m�c ��ch, hay l� ta tr� v� h�i Th�c B�t Ho�ng  xem sao.)",
		};
	TalkEx("",strTalk);
end

--��û���ذκ�Ի�
function task_014_02_3()

local strTalk = {
	"T�n Nh�t Ph�m ���ng kim cang tr�o v��ng n�o �� �� c��p Ph� Phong Ch�y c�a ta. Kh�ng c� Ph� Phong Ch�y th� kh�ng th� ph� phong th�y tr�n trong m� c�ng kh�ng th� m� m�t ��o c�a tr�n m� linh v�t.",
	"(Ch�ng l� Nh�t Ph�m ���ng �� t�m ���c c�ch v�o m�? Nguy cho B�n �� S�n H� X� T�c r�i, kh�ng th� �� Ng��i T�y H� ��t ���c m�c ��ch, hay l� ta tr� v� h�i Th�c B�t Ho�ng  xem sao.)",
	};

	TalkEx("",strTalk);

end

---------------------------------- ������15��֧1_6��Ĺ����----------------------------------
--���ذκ�Ի���֪צ���Ѿ�ȡ���Ʒ�鳽�����Ĺ
function task_015_01_0()

local strTalk = {
	"Cu�i c�ng ng��i �� quay v� r�i �, T� M� Minh Phong ch�c �� nh�n ���c Kim Ti Di�n Tr�o r�i ch�?",
	"(Vi�c T� M� ti�n b�i ch�a v�o m� hay l� kh�ng n�n ti�t l� s� t�t h�n, �� tr�nh phi�n ph�c b�n ngo�i.)",
	"T� M� ti�n b�i �� nh�n ���c Kim Ti Di�n Tr�o, th� ra �ng ta v�o m� l� mu�n t�m ng��i v� �� ly t�n 18 n�m, kh� n�i ch�a ngh� ra c�ch gi�i kh� ��c trong m�, cho n�n v�n ch�a to�i nguy�n. L�n n�y c� th� v�o m�, xem nh� c�ng th�a ���c t�m nguy�n.",
	"T�t l�m, ��i t�m nguy�n c�a �ng ta ho�n th�nh, ta s� h�n �ng ta ��u m�t tr�n. H�n chi l�n tr��c �� s�c c�ng ta �ng ta c� v� lo ra, th� ra �ang lo l�ng cho v�, kh� tr�nh vi�c �ng ta l�u l�c 18 n�m � Ph�ng T��ng, n�u �ng ta c� th� t�m ���c tung t�ch c�a v� m�nh, r�i m�i c�ng ta thi th� m�t tr�n, nh� th� ch�ng ph�i v�n c� ��i ���ng sao?",
	"�ng kh�ng c�n mu�n chi�u m� T� M� ti�n b�i n�a �?",
	"�i�.Ng��i tr�ng t�nh tr�ng ngh�a t�i Nh�t ph�m ���ng ch� c� th� l� ng��i ch�a g�p th�i, th�m v�o v� c�ng cao c��ng, kh�ng ph�i l� ta d� d�ng ��n nh�n, chuy�n chi�u m� nh�t ��nh kh�ng th� mi�n c��ng r�i. Chi b�ng c� theo c�m h�ng, t�n t�nh lu�n v�, tr�n ��i n�y c� chuy�n g� vui th�ch h�n vi�c trau d�i v� h�c? l�m sao c� th� b� qua ��i th� ��ng g�m n�y? �y...Hay l� trong khi ch� ��i anh ta c�t ��t t�m s�, ch�ng ta so t�i m�t ch�t?",
	}

	TalkEx("task_015_01_0_1",strTalk);

end

--���Ի�
function task_015_01_0_1()

local strTalk = {
	"V�n b�i kh�ng d�m, hay l� �� v�n b�i chia s� b�t m�t v�i vi�c gi�p ti�n b�i. Ti�n b�i c� �i�u chi c�n d�n?",
	"T�t, thi�u ni�n tr� tu�i th� n�n r�n luy�n nhi�u. Nh�ng ta �� giao vi�c v�o Ho�ng L�ng cho Tr�o V��ng m�t trong Th�p ��i kim cang. N�u kh�ng c� g� thay ��i th� v�t ph�m m� ta nh�n ���c nh�t ��nh s� � trong r��ng � L�ng m� t�ng 2. Sau khi th�m d� th� ng��i gi� r��ng ch�nh l� Qu� t��ng qu�n, ta s� r�ng vi�c n�y qu� kh�, ng��i kh�ng �� s�c, cho n�n �� giao cho Tr�o V��ng l�m. Ng��i ��ng lo, c� luy�n t�p cho gi�i, sau n�y s� c�n nhi�u c� h�i th� s�c.",
	"(Kh�ng ���c r�i, Tr�o V��ng qu� nhi�n �� b�t ��u h�nh ��ng, Nh�t Ph�m ���ng �� c� t�nh b�o ch�nh x�c nh� th�, n�u kh�ng v�y ��nh Tr�o V��ng th� e r�ng b�i s� �t th�nh, kh�ng c�n ���ng r�t lui.)",
	"M�c d� ta kh�ng giao cho ng��i vi�c n�y, nh�ng ng��i v�n c� h�t s�c m� kh�ng than v�n, th�t l� ��ng khen. Ta s� th�ng ch�c cho ng��i th�nh Nh�t Ph�m ���ng H� D�c, k� t� h�m nay, h� Nh�t Ph�m ���ng kim cang nh�n th�y danh hi�u n�y, th� s� s�n s�ng h�p t�c c�ng ng��i.",
	"�a t� ti�n b�i �� quan t�m �� b�t, t�i h� xin c�o t�."
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,23);
	TaskTip("��n Ho�ng l�ng m� t�ng 1 gi�t ch�t Tr�o V��ng l�y Ph� phong ch�y m� th�ng ��o t�ng 2.");
	Msg2Player("��n Ho�ng l�ng m� t�ng 1 gi�t ch�t Tr�o V��ng l�y Ph� phong ch�y m� th�ng ��o t�ng 2.");
	add_xb_title(4);
	GivePlayerExp(SkeyXibei,"pofengchui")
end

--��δɱ��צ�����ذκ�Ի�
function task_015_01_1()

local strTalk = {
	"N�u kh�ng c� g� thay ��i th� v�t ph�m m� ta nh�n ���c nh�t ��nh s� � trong r��ng � L�ng m� t�ng 2. Sau khi th�m d� th� ng��i gi� r��ng ch�nh l� Qu� t��ng qu�n, ta s� r�ng vi�c n�y qu� kh�, ng��i kh�ng �� s�c, cho n�n �� giao cho Tr�o V��ng l�m. Ng��i ��ng lo, c� luy�n t�p cho gi�i, sau n�y s� c�n nhi�u c� h�i th� s�c.",
	"(Kh�ng ���c r�i, Tr�o V��ng qu� nhi�n �� b�t ��u h�nh ��ng, Nh�t Ph�m ���ng �� c� t�nh b�o ch�nh x�c nh� th�, n�u kh�ng v�y ��nh Tr�o V��ng th� e r�ng b�i s� �t th�nh, kh�ng c�n ���ng r�t lui.)"
	}

	TalkEx("",strTalk);

end

--�Ѿ��ƻ�һ���ĸ���ˮѨ����Ĺ�˶Ի�
function task_015_02_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(Zhenmushou_MapData));
local xWPos,yWPos,xPos,yPos = Zhenmushou_MapData[nMapDataIndex][1],Zhenmushou_MapData[nMapDataIndex][2],Zhenmushou_MapData[nMapDataIndex][3],Zhenmushou_MapData[nMapDataIndex][4]
local nNpcIndex = 0;

	--���������ʧ����Ҫ��30���Ӳ�������ˢ����Ĺ��
	if GetTime()-GetTask(CREAT_ZHENMUSHOU_TIME)	>= 1800 then

		strTalk = {
			"Th� m� nh�n: Tr�n m� linh th� �� xu�t hi�n, mau ti�u di�t!",
			"Tr�n m� linh th�: G� g�!!!",
			"B�n nh�n th�y m�t con v�t th�t l�n xu�t hi�n � ("..xPos..", "..yPos.."), ch�c l� Tr�n m� th� m� Li�u ti�n b�i �� n�i, mau ti�u di�t n�!"
			}

		SetTask(CREAT_ZHENMUSHOU_TIME,GetTime());--��¼��Ĺ��ˢ��ʱ��
		nNpcIndex = CreateNpc("Tr�n M� Th�","Tr�n M� Th�",513,xWPos,yWPos);
		SetNpcScript(nNpcIndex,"\\script\\������\\����Ĺ��һ��\\npc\\��Ĺ��.lua");
		SetNpcLifeTime(nNpcIndex,1500);
		TaskTip("Tr�n m� th� xu�t hi�n �  "..xPos..", "..yPos.." , mau ��n t�n c�ng n�.")
		Msg2Player("Tr�n m� th� xu�t hi�n �  "..xPos..", "..yPos.." , mau ��n ��nh b�i n� v� m� th�ng ��o v�o l�ng m� t�ng 2.");
		GivePlayerExp(SkeyXibei,"fengshuixue")
	else
		strTalk = {
			"Th� m� nh�n: ��",
			"H�nh nh� ch�ng c� ph�n �ng g� c�, c� c�ch 30 ph�t l� Tr�n m� th� xu�t hi�n, h�y ��i m�t l�c r�i th� l�i sau!"
			}

	end

	TalkEx("",strTalk);

end

--�Ѿ���ȡ���񵫻�δ�ƻ���ˮѨ����Ĺ�˶Ի�
function task_015_02_1()

local strTalk = {
	"Th� m� nh�n: ��",
	"Theo l�i Li�u ti�n b�i, c�n d�ng �o�n th�y ch� v� Ph� phong ch�y, sau �� nh� s� gi�p �� c�a La Canh t�m 4 c�i Phong th�y huy�t ph� h�y ch�ng th� c� th� d� ���c Tr�n m� linh th� � t�ng 2."
	};

	TalkEx("",strTalk);

end

--û����ȡ��������Ĺ�˶Ի�
function task_015_02_2()

local strTalk = {
	"Th� m� nh�n: ��",
	};

	TalkEx("",strTalk);

end

--�Ѿ����ĸ���Ĺ��������Ĺ�����Ի�
function task_015_03_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(GuiJiangJun_MapData));
local xWPos,yWPos,xPos,yPos = GuiJiangJun_MapData[nMapDataIndex][1],GuiJiangJun_MapData[nMapDataIndex][2],GuiJiangJun_MapData[nMapDataIndex][3],GuiJiangJun_MapData[nMapDataIndex][4]
local nNpcIndex = 0;

	--���������ʧ����Ҫ��30���Ӳ�������ˢ������
	if GetTime()-GetTask(CREAT_GUIJIANGJUN_TIME)	>= 1800 then

		strTalk = {
			"Th� m� t��ng qu�n: Qu� t��ng qu�n �� xu�t hi�n, mau ��nh!",
			"Qu� t��ng qu�n: G� g�!!!",
			"B�n nh�n th�y m�t con v�t th�t l�n xu�t hi�n � ("..xPos..", "..yPos.."), ch�c l� Qu� t��ng qu�n trong b�c th� T�y H� �� nh�c ��n, mau ��nh b�i n� v� l�y v�t ph�m trong b�o r��ng!"
			}

		SetTask(CREAT_GUIJIANGJUN_TIME,GetTime());--��¼����ˢ��ʱ��
		nNpcIndex = CreateNpc("T�y B�c Qu� T��ng ��u","Qu� T��ng Qu�n",514,xWPos,yWPos);
		SetNpcScript(nNpcIndex,"\\script\\������\\����Ĺ�Ҷ���\\npc\\����.lua");
		SetNpcLifeTime(nNpcIndex,1500);
		Msg2Player("Qu� t��ng qu�n xu�t hi�n �  "..xPos..", "..yPos.."  , mau ��nh b�i n� v� l�y v�t ph�m trong b�o r��ng.")
		TaskTip("Qu� t��ng qu�n xu�t hi�n �  "..xPos..", "..yPos.."  , mau ��nh b�i n� v� l�y v�t ph�m trong b�o r��ng.");

	else

		strTalk = {
			"Th� m� t��ng qu�n: ��",
			"H�nh nh� ch�ng c� ph�n �ng g� c�, c� c�ch 30 ph�t l� Qu� t��ng qu�n xu�t hi�n, h�y ��i m�t l�c r�i th� l�i sau!"
			}

	end

	TalkEx("",strTalk);

end

--�Ѿ���ȡ���񵫻�δ�ƻ���ˮѨ����Ĺ�˶Ի�
function task_015_03_1()

local strTalk = {
	"Th� m� t��ng qu�n: ��",
	"Theo nh� trong b�c th� T�y H�, n�u ��nh b�i 4 v� Tr�n m� t��ng qu�n ��ng Nam T�y B�c th� c� th� ��nh th�c Qu� t��ng qu�n �ang gi� b�o r��ng."
	};

	TalkEx("",strTalk);

end

--û����ȡ��������Ĺ�����Ի�
function task_015_03_2()

local strTalk = {
	"Th� m� t��ng qu�n: ��",
	};

	TalkEx("",strTalk);

end

--��ܹ�������˾������Ի�
function task_015_04_0()

local strTalk = {
	"T� M� ti�n b�i, t�i h� �� t�m ���c Ng�c b�i v� M�c ��u ki�m, ti�n b�i c� nh�n ra v�t n�y kh�ng?",
	"��y l� �..Minh phong qu�nh ng�c y�n h�n, h�ng nhan t��ng t� nan ho�n. T� Qu�n �� �eo ng�c n�y, v� kh�ng h� th�o xu�ng bao gi�, l� n�o�.l� n�o�.T� Qu�n�..",
	"Ti�n b�i�.xin h�y n�n �au th��ng, t�i h� kh�ng t�m th�y thi th� trong m�, kh�ng ch�ng hi�n th� c�a �ng v�n c�n s�ng.",
	"��..",
	"���",
	"Trong l�ng hi�m �c tr�ng tr�ng, T� Qu�n e l� l�nh �t d� nhi�u, �a t� <sex> �� an �i, ta c�ng kh�ng c�n ph�i t� l�a d�i m�nh, kh�ng t�m ���c thi th� c�a T� Qu�n trong l�ng ra c�ng �� ngh� ra ���c t�nh hu�ng x�u nh�t. Chuy�n ch�c phi�u linh nh�t m�ng qui, ��i nguy�t tr� ��i kh�ng th� th�y, thi�n � b�t l�n c�nh tri�m y, tr�n t�ch nan t�m t�c nguy�n vi. M�c ��u ki�m n�y c�n �� l�m g� n�a ch�?",
	"Ti�n b�i���",
	}

	TalkEx("task_015_04_0_1",strTalk);

end

--���Ի�
function task_015_04_0_1()

local strTalk = {
	"L� m�t th�n binh th� sao ch�? S�ng � th� gian n�y ch� g�y h�i cho nh�n gian, chi b�ng ch�t �i cho xong. V� c�ng thi�n h� �� nh�t l� c�i g� c� ch�? Cu�i c�ng th� c�ng r�i xu�ng h� s�u nghi�t ng�, kh�ng th� c�ng nhau ��n ch�n tr�i g�c b�, gi� nh� n��c ch�y ��ng t�y.",
	"Ti�n b�i ��ng qu� �au l�ng, l�nh th� bi�t ���c trong l�ng m� c� Th�n binh, ���ng nhi�n l� ph�i bi�t c�ch v�o m�, v� th�a bi�t r�ng s� nguy hi�m nh� th� n�o, nh�ng c� ta b� qua t�t c�, m�t l�ng v� ti�n b�i h��ng ��n ��nh �i�m c�a V� ��o. C� ta hi�u ���c t�m l�ng c�a �ng, c� l� tr�n th� gian n�y ch� c� c� ta m�i hi�u ���c �i�u ��. Ti�n b�i kh�ng n�n v� qu� �au l�ng m� t� b� t�t c�.",
	"���",
	"C� l� ng��i ��ng, T� Qu�n th�ng minh lanh l�i nh� th�, l� n�o kh�ng bi�t ���c l�n �i n�y kh� c� ���ng quay v�? K� v�ng c�a c� ta e r�ng l�i l� b� kh� cho ta, v� e r�ng ch� c� k� v�ng c�a c� ta m�i c� th� gi�i tho�t ���c b� kh� cho ta. Ng��i l� ng��i t�t ta r�t l�y l�m c�m k�ch.",
	"Ti�n b�i kh�ng c�n kh�ch s�o th�, tr�n th� gian n�y v�n c�n m�t ng��i c� th� hi�u ���c ti�n b�i, �� ch�nh l� Th�c B�t Ho�ng  ti�n b�i.",
	}

	TalkEx("task_015_04_0_2",strTalk);

end

--���Ի�
function task_015_04_0_2()

local strTalk = {
	"Th�c B�t Ho�ng? C� th� ng��i n�i ��ng. L�n ��u g�p m�t, �ng ta �� mu�n th� s�c c�ng ta, sau n�y m�i bi�t th� ra �ng ta mu�n chi�u m� ta gia nh�p Nh�t Ph�m ���ng, nh�ng ta th�y trong l�ng T�n Th�y Ho�ng th��ng c� ng��i T�y H� quanh qu�n, m� hi�n th� c�a ta m�t t�ch � l�ng T�n Th�y Ho�ng, cho n�n kh� tr�nh kh�i vi�c nghi ng� b�n T�y H� ��c �c. Hu�ng h� Nh�t Ph�m ���ng l�i l� k� th� ��ng g�m c�a v� l�m ��i T�ng, ta sao c� th� ph�n l�i qu�n m�nh? Ta c�n t��ng r�ng �ng ta h�n ra khi�u chi�n v� l� do kh�ng h�ng th� gi�t, nh�ng kh�ng ng� ��nh ���c v�i chi�u th� m�i bi�t r�ng �� ch� l� mu�n th� s�c, ch� kh�ng c�n � mu�n chi�u n�p n�a.",
	"Th�t ra Th�c B�t ti�n b�i c�ng gi�ng nh� �ng v�y, nghi�n c�u v� ��o, am hi�u tinh th�ng, ��u kh�ng mu�n m�ng ��n th� s�. Chuy�n v� chi�u m� e r�ng Th�c B�t ti�n b�i �� kh�ng �� trong l�ng n�a. �ng ta ch� mu�n th� s�c c�ng �ng m� th�i.",
	"��i th� t�t nh� th� sao c� th� b� l� ���c? Ng��i h�y n�i v�i Th�c B�t Ho�ng , 3 ng�y sau ta s� vi�ng th�m. ��ng r�i, <sex> ��ng tr�ch ta n�i th�ng, Nh�t Ph�m ���ng l� m�t t� ch�c th�p h�n nh� th�, th�t s� kh�ng ph� h�p nh�ng ng��i c� ph�m ch�t cao sang nh� Th�c B�t Ho�ng v� ng��i. <sex> l� con d�n ��i T�ng, nh�n th�y thi�n h� lo�n l�c nh� hi�n nay, th� giang s�n c�ng kh� m� y�n �n, ng��i giang h�n n�n v� qu�c gia m� g�p s�c, sao l�i mu�n b�n ��ng qu�c gia nh� th�? Ta ngh� �ng ta n�n s�m r�i kh�i Nh�t Ph�m ���ng, �� tr�nh ph�i h�i ti�c v� sau.",
	"Ti�n b�i�.l�i c�a �ng n�i t�i s� ghi kh�c trong l�ng, t�i h� xin ph�p c�o t�, chuy�n t�m � c�a �ng ��n Th�c B�t ti�n b�i.",
	"(�i�.kh�ng bi�t t�nh h�nh sai d�ch c�a Vi�n Phi V�n nh� th� n�o r�i, c� th� kh�p trong thi�n h� ch� c� anh ta hi�u ���c c�m nh�n c�a ta l�c n�y, nh�ng s� vi�c v�n ch�a ���c ho�n th�nh, c�n ph�i nh�n n�i nhi�u h�n, nh�ng s� hi�u l�m ��nh xem nh� l� ��ng l�c m� th�i.)"
	}

	TalkEx("task_015_04_0_3",strTalk);

end

--������
function task_015_04_0_3()

	give_zb_award(34);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		SetTask(TASK_XB_ID_01,29);
		DelItem(2,0,718,1);--ɾȥī��
		DelItem(2,0,719,1);--ɾȥ����
		DelItem(2,0,710,1);--ɾȥ��˿����
		DelItem(2,0,716,1);--ɾȥ���ķ����ܺ�
		TaskTip("H�i b�o Th�c B�t Ho�ng v� vi�c T� M� Minh Phong �� ��ng � t� v�.");
		Msg2Player("H�i b�o Th�c B�t Ho�ng v� vi�c T� M� Minh Phong �� ��ng � t� v�.");
		GivePlayerAward("Award_XB_34","Easy");
		GivePlayerExp(SkeyXibei,"guijiangjun")
	end
end

--��δ�㱨�ذκ�
function task_015_04_1()

local strTalk = {
	"Ng��i h�y n�i v�i Th�c B�t Ho�ng , 3 ng�y sau ta s� vi�ng th�m. <sex> ��ng tr�ch ta n�i th�ng, <sex> l� con d�n ��i T�ng, nh�n th�y thi�n h� lo�n l�c nh� hi�n nay, th� giang s�n c�ng kh� m� y�n �n, ng��i giang h�n n�n v� qu�c gia m� g�p s�c, sao l�i mu�n b�n ��ng qu�c gia nh� th�? Ta ngh� �ng ta n�n s�m r�i kh�i Nh�t Ph�m ���ng, �� tr�nh ph�i h�i ti�c v� sau."
	}

	TalkEx("",strTalk);

end

---------------------------------- ������16��֧1_7ҩ�˾���----------------------------------
--��ī�������彻����������ذκ�Ի�
function task_016_01_0()

local strTalk = {
	"�� m�t th�i gian r�i, Tr�o V��ng c� th� v�o ���c l�ng m� hay kh�ng, c�ng ph�i h�i b�o m�t ti�ng ch�. B�n Xa Lu�n l�i ph�i ng��i ��n ��c th�c, vi�c r�c r�i n�y th�t khi�n ta nh�c ��u.",
	"(Kh�ng ���c, Tr�o V��ng �� ch�t, vi�c n�y ph�i b�n giao nh� th� n�o ��y? Th�i, Nh�t Ph�m ���ng ��n nay v�n ch�a v�o m�, c� th� che d�u ���c bao nhi�u th� d�u v�y, ph�i c�n th�n ch�o h�i th� m�i ���c.)",
	"Th�c B�t ti�n b�i kh�ng c�n ph�i lo l�ng, t�ng 2 l�ng m� l� m�t n�i r�t nguy hi�m, ��i th�m v�i ng�y n�a xem sao. ��ng r�i, T� M� ti�n b�i b�o t�i nh�n l�i v�i �ng, t�m s� c�a �ng ta �� ���c gi�i quy�t, m�c d� kh�ng th� t�m ���c hi�n th�, th� ��nh g�c qua m�t b�n v�y, �ng ta h�n �ng ba h�m sau s� ��u.",
	"C� th�t nh� th� kh�ng? Qu� t�t, qu� t�t, Ha ha�, T� M� Minh Phong th�t s� khi�n ta r�t s�t ru�t. Chi�u th�c c�a �ng ta, ta v�n ch�a ph� gi�i h�t, ch� ��i l�n n�y thi th�, ta s� c� th� th��ng th�c to�n b� chi�u th�c r�i.",
	}

	TalkEx("task_016_01_0_1",strTalk);

end

--���Ի�
function task_016_01_0_1()

local strTalk = {
	"Th�c B�t ti�n b�i v�a n�i ��n chi�u th�c, v�a l� n�t phi�n n�o, nh�ng sinh kh� l�i d�i d�o. N�u kh�ng ph�i v� vi�c �ng chi�u m� T� M� ti�n b�i v�o ���ng m� c� th� so t�i v�i m�t ��i th� ngang t�m, th� e r�ng ti�n b�i c�ng kh� m� ch�u ���c c�m gi�c c� ��n c�a m�t ng��i ��c cao v�ng tr�ng.",
	"C� ��n c�a m�t ng��i ��c cao v�ng tr�ng th� h�i qu�, nh�ng th��ng l� c�m gi�c c� qu�nh. Ta b�nh sinh nghi�n c�u v� ��o, c� ��i c� c�ng theo �u�i, r� bi�t thi�n h� r�t r�ng l�n, kh� t�m ���c ng��i v� ��ch. Cho n�n ta m�i ��n T�y H�, mu�n t�m ��i th� th� s�c m�t phen. V� sau c� g�p L� Nguy�n Kh�nh, �ng ta n�i v� h�c T�y H� kh�ng th�m s�u uy�n b�c nh� ��i T�ng. Ng��i T�y H� y�u th�ch v�, ng��i ��i T�ng l�i tinh th�ng v�, b�o ta gia nh�p Nh�t Ph�m ���ng �� tr�c ti�p nghe l�nh c�a �ng ta, �ng ta c� th� gi�p ta t�m ���c cao th� ��i T�ng, gi�p ta ho�n th�nh t�m nguy�n c�a m�nh.",
	"Th� ra l� v�y, T� M� Minh Phong ch�nh l� cao th� m� �ng ta gi�p �ng t�m �?",
	}

	TalkEx("task_016_01_0_2",strTalk);

end

--���Ի�
function task_016_01_0_2()

local strTalk = {
	"�m�c d� n�i l� t�m cao th� ��i T�ng, nh�ng th��ng nhi�m v� c� �� tr�n vai ta, b�nh th��ng c�ng c� r�t nhi�u vi�c kh� gi�i quy�t c�n ta x� l�, r�t phi�n ph�c. Nh�ng L� Nguy�n Kh�nh xem ra c�ng gi� l�i h�a ��y, t�m gi�p ta r�t nhi�u cao th�, l�n n�y c� th� g�p ���c T� M� Minh Phong, xem ra L� Nguy�n Kh�nh �� l�m m�t vi�c kh��n ta to�i nguy�n. Nhi�m v� th� c� xem nh� ta b�o ��p �n c�a �ng �y v�y. Nh�ng nhi�m v� l�n n�y th�t k� l�, kh� kh�n v� c�ng. Ng��i �i n�i v�i Xa Lu�n B� V��ng , vi�c v�o m� kh� c� ti�n tri�n, b�o �ng �y ��i th�m m�t th�i gian.",
	"���c, ti�n b�i ��ng lo l�ng, c� chu�n b� �� s�c c�ng T� M� Minh Phong. M�i vi�c c� �� t�i h� x� l�.",
	"(Th�c B�t Ho�ng  xem ra c�ng l�c c�ng ch�n Nh�t Ph�m ���ng, �ng ta l� T�y H� �� nh�t d�ng s�, Nh�t Ph�m ���ng l�n m�nh l� nh� �ng ta, m� Th�c B�t Ho�ng l� m�t k� ��o v� ch�nh c�ng, b�n ch�t c�ng kh�ng ph�i th�p h�n nh� Nh�t Ph�m ���ng. N�u c� th� c�ch ly quan h� c�a �ng ta v� Nh�t Ph�m ���ng, kh�ng ch�ng c� th� g� b� ���c s� r�ng bu�c cho �ng ta, m� c�n c� th� l�m lung lay th�c l�c c�a Nh�t Ph�m ���ng. Ph�i ngh� c�ch m�i ���c.)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,30);
	TaskTip("Quay v� h�i b�o Xa Lu�n B� V��ng v� t�nh h�nh l�ng m�.");
	Msg2Player("Quay v� h�i b�o Xa Lu�n B� V��ng v� t�nh h�nh l�ng m�.");

end

--δ�복�ֻ㱨������Ĺ�����
function task_016_01_1()

local strTalk = {
	"Nhi�m v� l�n n�y th�t k� l�, kh� kh�n mu�n tr�ng. Ng��i �i b�o v�i Xa Lu�n B� V��ng , vi�c v�o m� kh� m� ti�n tri�n ���c, b�o �ng ta ��i th�m m�t th�i gian n�a.",
	}

	TalkEx("",strTalk);

end

--�복�ֻ㱨������Ĺ�����
function task_016_02_0()

local strTalk = {
	"Th� n�o? Th�c B�t Ho�ng �� ho�n th�nh vi�c v�o m� ch�a?",
	"Th�c B�t ti�n b�i �� giao vi�c �� cho Tr�o V��ng x� l�, e r�ng trong m� C� quan tr�ng tr�ng, kh� m� th�c hi�n, �ng ta b�o �ng ch� th�m m�t th�i gian n�a, hi�n gi� �ng ta �ang chu�n b� cho vi�c chi�u m� T� M� Minh Phong.",
	"C�i g�? L�i l� T� M� Minh Phong? N�u chi�u m� kh�ng ���c, th� gi�t qu�ch �i kh�ng hay h�n �? Th�c B�t Ho�ng  c�ng l�c c�ng l�m nh�ng vi�c kh�ng ��u. Vi�c v�o m� n�n ��ch th�n �i l�m th� l�i, t�i sao l�i �� cho Tr�o V��ng l�m ch�? E r�ng vi�c T� M� Minh Phong c�ng kh�ng ph�i l�m v� nhi�m v�, �ng ta mu�n tho�t kh�i vi�c n�y, �� t� v� v� v�n g� ��.",
	"Th�c B�t ti�n b�i th�ch s� t� do, nghi�n c�u v� ��o, e r�ng vi�c l�m nhi�m v� kh�ng ph�i l� � mu�n c�a �ng ta, c� mi�n c��ng c�ng v� �ch, n�u l�m �ng ta n�i gi�n, r�i kh�i Nh�t Ph�m ���ng th� l� t�n th�t cho ch�ng ta r�i.",
	}

	TalkEx("task_016_02_0_1",strTalk);

end

--���Ի�
function task_016_02_0_1()

local strTalk = {
	"H�m, Nh�t Ph�m ���ng l� ch� �ng ta n�i ��n l� ��n n�i �i l� �i sao? Ng��i c�a Nh�t Ph�m ���ng th� ph�i v� l�i �ch c�a Nh�t Ph�m ���ng, L� Nguy�n Kh�nh ��i nh�n th�t l� qu� dung t�ng cho �ng ta r�i. Th�i �i, th�i �i, ng��i n�y m�c d� v� c�ng cao th�m, nh�ng r�t kh� �i�u khi�n. �, ng��i tr� th�nh ���ng H� D�c c�a ta l�c n�o? Ch�c l� do Th�c B�t Ho�ng th�ng ch�c cho ng��i ��ng kh�ng? T�t, Th�c B�t Ho�ng l�m vi�c kh�ng t�i, t�m nh�n r�t t�t. ���ng H� D�c c� th� h�p t�c l�m vi�c v�i Th�p ��i Kim Cang v� Ph�p V��ng, v� ph�i kh�ng ng�ng r�n luy�n!",
	"Th� th� t�t qu�, t�i h� nh�t ��nh kh�ng ph� l�ng mong m�i. Xin c� c�n d�n.",
	"Vi�c Ho�ng l�ng c� �� Tr�o V��ng l�m �i, ki�n nh�n ��i tin t�c l� ���c r�i. L�n n�y Nh�t Ph�m ���ng ��n Ph�ng T��ng , l� v� mu�n t�ng th�m th�c l�c qu�n ��i T�y H�, m�c ti�u d� nhi�n ch�nh l� ��i T�ng. Ng��i ch�c bi�t Ph�ng T��ng ph� b�c c� c�i D��c V��ng ��ng ch�? N�i n�y l�y t�n l� D��c V��ng, l� do m�t ng��i �am m� d��c m�y n�m tr��c b� hoang t��ng c�a sa m�c, �� t�m ��n s�n ��ng th�n b� n�y, trong ��ng ch�a ��y c�c lo�i k� hoa d� th�o, l� nh�ng d��c li�u hi�m th�y tr�n th� gian. Ng��i n�y gi�ng nh� l� b�t ���c v�ng, ��n gi� v�n kh�ng mu�n r�i s�n ��ng n�a b��c, t� nh�n l� D��c V��ng, c�ng ch�nh l� t�n c�a ��ng n�y.",
	"T�i �� ��n qua D��c V��ng ��ng, � �� c� r�t nhi�u ng��i T�y H�, c� vi�c g� th�?",
	}

	TalkEx("task_016_02_0_2",strTalk);

end

--���Ի�
function task_016_02_0_2()

local strTalk = {
	"Ng��i c�a ta �� th�m d� ���c D��c V��ng g�n ��y �� nghi�n c�u ���c B�t t� D��c nh�n, Ph�p V��ng c�a ta �� th��ng l��ng c�ng v�i D��c V��ng, mu�n d�ng pha ch� D��c nh�n, c� th� t�ng c��ng th�c l�c c�a qu�n ��i.",
	"B�t t� D��c nh�n l� v�t g� v�y? R�t cu�c l� n� c� s�c m�nh nh� th� n�o?",
	"���ng nhi�n, D��c nh�n ch�nh l� B�t t� nh�n do D��c V��ng kh� c�ng nghi�n c�u th�nh, ch�c l� d�ng nh�ng d��c li�u ��c bi�t �� t�o th�nh, c� th� r�t c��ng tr�ng, m�nh m� v� c�ng, v� kh�ng bi�t �au ��n l� g� c�, n�u b� th��ng th� s� t� ��ng ph�c h�i. L� m�t k� binh m�nh t��ng x�ng pha chi�n tr�n. Th�a thu�n c�a Ph�p V��ng c�ng s�p ho�n th�nh r�i, ng��i h�y ��n D��c V��ng c�c hi�p tr� c�ng �ng ta x� l� vi�c n�y.",
	"Qu� nhi�n c� lo�i D��c nh�n k� d� n�y �, v�y th� t�i s� �i t�m Ph�p V��ng ngay.",
	"(Kh�ng ���c, Nh�t Ph�m ���ng �m m�u qu� k� th�t kh� l��ng, chuy�n D��c nh�n r�t cu�c l� nh� th� n�o nh�? N�u th�t nh� Xa Lu�n B� V��ng �� n�i, th� qu�n ��i T�y H� qu� l� hi�m h�a l�n cho ��i T�ng, ph�i t�m �u D��ng H�a ti�n b�i �� th��ng l��ng.)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,31);
	TaskTip("T�m �u D��ng H�a ti�n b�i th��ng l��ng v� vi�c D��c nh�n.");
	Msg2Player("T�m �u D��ng H�a ti�n b�i th��ng l��ng v� vi�c D��c nh�n.");
	GivePlayerAward("Award_XB_35","Easy");
	GivePlayerExp(SkeyXibei,"yaowang")
end

--��δ��ŷ�����㱨ҩ��һ��
function task_016_02_1()

local strTalk = {
	"T�y H� Ph�p V��ng �� b�t ��u th�a thu�n v�i D��c V��ng, l�c n�y ch�c �ang � [D��c V��ng c�c. N�u c� ���c c�ch pha ch� D��c nh�n, th� th�c l�c c�a qu�n ta s� t�ng d� d�i.",
	}

	TalkEx("",strTalk);

end

--��ŷ�����㱨����ҩ��һ��
function task_016_03_0()

local strTalk = {
	"�u D��ng ti�n b�i, c� vi�c kh�ng l�nh r�i, t�i h� bi�t ���c m�t �m m�u kh�c c�a Nh�t Ph�m ���ng. T�y H� �� c�u k�t v�i D��c V��ng, ��nh l�i d�ng D��c nh�n �� t�ng c��ng s�c m�nh qu�n ��i, v� ��i th�i c� �� x�m chi�m T�ng. Ngo�i ra L�ng T�n Th�y Ho�ng kh�ng c� manh m�i v� b�n �� S�n H� X� T�c nh� ch�ng ta d� ki�n, c� quan trong m� r�t m�nh, ch�c ch�n l� c� r�t nhi�u Ho�t nh�n d�ng.",
	"D��c V��ng? M�ng l��i t�nh b�o c�a Nh�t Ph�m ���ng qu� nhi�n danh b�t h� truy�n, ng��i b� �n nh� th� m� c�ng c� th� �o�n �ng ph�. D��c V��ng t�nh t�nh qu�i ��n, th�ch nghi�n c�u nh�ng lo�i d��c th�o k� d�, nghe n�i D��c nh�n l� nghi�n c�u t�m ��c nh�t c�a �ng ta, B�t th�ng b�t t�, D��c V��ng n�u ti�p tay v�i T�y H�, th� qu�n ��i T�y H� s� m�c s�c tung ho�nh thi�n h�.",
	"D��c nh�n e r�ng �� xu�t hi�n trong D��c V��ng ��ng, hay l� �� t�i h� �i th�m th�nh m�t chuy�n.",
	"Nh� th� c�ng t�t, n�u trong l�ng T�n Th�y Ho�ng kh�ng c� b�n �� S�n H� X� T�c, th� t�m d�ng vi�c n�y l�i. N�u ng��i T�y H� c� ���c D��c nh�n th� h�u qu� s� kh� l��ng. Ng��i h�y ��n D��c V��ng ��ng tr��c ti�u di�t s� D��c nh�n �� �� tr� ho�n k� ho�ch c�a ng��i T�y H�, khi ti�u di�t b�n D��c nh�n nh� kh�ng ���c b�t d�y ��ng r�ng, tr�nh �� cho Ph�p V��ng T�y H� ph�t gi�c.",
	"T�i h� s� c� g�ng c�n th�n, khi n�o c� v�n �� g� kh�c t�i h� s� quay v� h�i b�o ti�n b�i.",
	}

	SetTask(TASK_XB_ID_01,32);
	TalkEx("",strTalk);
	CreateTrigger(0,1235,KILL_XB_YAOREN);--ҩ��ɱ�ִ�����
	TaskTip("��n D��c V��ng ��ng, ti�u di�t 30 t�n D��c nh�n.");
	Msg2Player("��n D��c V��ng ��ng, ti�u di�t 30 t�n D��c nh�n.");

end

--��δɱ��30ҩ��
function task_016_03_1()

local strTalk = {
	"Ng��i ��n D��c V��ng ��ng ti�u di�t D��c nh�n tr� ho�n k� ho�ch c�a ng��i T�y H�, khi ti�u di�t D��c nh�n nh� kh�ng ���c b�t d�y ��ng r�ng, tr�nh �� Ph�p V��ng T�y H� ph�t hi�n.",
	}

	if	GetTrigger(KILL_XB_YAOREN) == 0 then
		CreateTrigger(0,1235,KILL_XB_YAOREN);--ҩ��ɱ�ִ�����
		TaskTip("��n D��c V��ng ��ng, ti�u di�t 30 t�n D��c nh�n.");
		Msg2Player("��n D��c V��ng ��ng, ti�u di�t 30 t�n D��c nh�n.");
	end

	TalkEx("",strTalk);

end

--����30ҩ�˺���ŷ�����㱨���
function task_016_04_0()

local strTalk = {
	"Ti�n b�i, t�i h� �� ti�u di�t m�t s� D��c nh�n, D��c nh�n qu� nhi�n r�t kh� ��i ph�, kh�ng nh�ng c��ng tr�ng kh�e m�nh, m� l�i kh�ng ng�ng h�i sinh, nhi�u v� s� k�.",
	"Nguy to, ch� s� D��c V��ng �� ��ng � ch� t�o D��c nh�n cho ng��i T�y H�, cho n�n m�i s�n sinh ra s� l��ng l�n nh� th�. B�n D��c nh�n �� kh�ng th� d�ng c�ch th�ng th��ng m� ��i ph� ���c. Mu�n gi�t D��c nh�n th� ph�i bi�t ���c ph��ng ph�p ch� t�o c�a n�, n�u kh�ng th� c�ng u�ng ph� c�ng s�c m� th�i.",
	"D��c nh�n l� m�t nghi�n c�u t�m ��c nh�t c�a D��c V��ng, kh�ng d� g� bi�t ���c, hay l� tr�c ti�p t�m D��c V��ng?",
	"Kh�ng �n, kh�ng bi�t th�c h� nh� th� n�o kh�ng n�n ���ng ��t h�nh ��ng kh�ng ch�ng m�c k�. V� l�i hi�n gi� Ph�p V��ng T�y H� v� D��c V��ng �ang th��ng th�o v�i nhau, n�u g�p ph�i h�, ng��i s� m�t �i c� h�i h�nh ��ng. Hay l� ng��i ��n g�n khu D��c V��ng c�c th�m th�nh xem c� ai bi�t ���c t�nh h�nh D��c V��ng ��ng, t�m h� �� t�m hi�u t�nh h�nh, bi�t ng��i bi�t ta tr�m tr�n tr�m th�ng, kh�ng ch�ng s� bi�t ���c m�t v�i tin t�c v� D��c nh�n.",
	"Ti�n b�i n�i r�t ph�i, n�n ��nh v�o nh��c �i�m c�a k� ��ch th� m�i c� hi�u qu� ���c, �� t�i h� �i th�m th�nh th� xem c� ai hi�u r� n�i t�nh b�n trong kh�ng, c� v�n �� g� t�i h� s� quay v� c�ng b�n t�nh v�i ti�n b�i.",
	}

	SetTask(TASK_XB_ID_01,34);
	TalkEx("",strTalk);
	TaskTip("T�m �u D��ng H�a ti�n b�i th��ng l��ng v� vi�c D��c nh�n.");
	Msg2Player("T�m �u D��ng H�a ti�n b�i th��ng l��ng v� vi�c D��c nh�n.");
	GivePlayerAward("Award_XB_36","Easy");
	GivePlayerExp(SkeyXibei,"yaoren")
end

--��δ�������Ի�ǰ��ŷ�����Ի�
function task_016_04_1()

local strTalk = {
	"Hay l� ng��i ��n g�n khu D��c V��ng c�c th�m th�nh xem c� ai bi�t ���c t�nh h�nh D��c V��ng ��ng, t�m h� �� t�m hi�u t�nh h�nh, bi�t ng��i bi�t ta tr�m tr�n tr�m th�ng, kh�ng ch�ng s� bi�t ���c m�t v�i tin t�c v� D��c nh�n.",
	}

	TalkEx("",strTalk);

end

---------------------------------- ������17��֧1_8����֮��----------------------------------
--�������Ի���Ӧ�����ռ�20ǧ����ľ
function task_017_01_0()

local strTalk = {
	"B�n tr�, n�n x�ng h� nh� th� n�o ��y? Sao l�i ��ng � ��y? D��c V��ng c�c nguy hi�m tr�ng tr�ng, n�u kh�ng c� vi�c g�, th� mau r�i kh�i ��y �i.",
	"<sex> c�m �n ng��i �� quan t�m, ta l� L�u Tam. Ta bi�t n�i n�y nguy hi�m, ��ng � ��y ta c�ng r�t lo s�. Nh�ng v� ng��i T�y H� ra v�o D��c V��ng ��ng, th��ng mang ra m�t �t � M�c �� b�n cho ta, s� � m�c n�y c� th� b�n ki�m m�t �t ti�n, cho n�n ta m�i ��ng ��y ��i. N�u kh�ng v� mi�ng �n th� ta �� r�i kh�i t� l�u r�i.",
	"Ta ch� nghe n�i D��c V��ng ��ng c� r�t nhi�u k� hoa d� th�o, kh�ng ng� c�n c� g� n�a �h? Sao ng��i c� th� bi�t ���c t�nh h�nh trong ��ng?",
	"�, ta ��n g� m�u sinh. Nh�ng Ph�ng T��ng  m�y n�m g�n ��y b�o c�t qu� nhi�u, h�u nh� ti�u h�y h�t c�y c�i. H�m n� ta v� t�nh �i qua ��y, ph�t hi�n g�n c�a hang D��c V��ng ��ng c� m�t s� � M�c ng�n n�m r�t qu� gi�, ta li�n nh�t �em b�n. Sau �� mu�n v�o ��ng t�m xem c�n g� n�a kh�ng, kh�ng ng� su�t ch�t th� kh�ng c�n m�ng quay v�.",
	}

	TalkEx("task_017_01_0_1",strTalk);

end

--���Ի�
function task_017_01_0_1()

local strTalk = {
	"Ng��i �� v�o ��ng r�i �, nghe n�i D��c nh�n trong ��ng d�ng m�nh v� c�ng, sao ng��i c� th� tho�t ���c?",
	"�y da, nh�c ��n b�n D��c nh�n th�t ��ng s�, c� ��i ta c�ng ch�a nh�n th�t v�t g� gh� g�m nh� th�. L�c �� ta ch� mu�n tr�m m�t �t g� tr�n ng��i Th� nh�n, kh�ng ng� b� D��c nh�n ph�t hi�n, li�n ��n b�t ta, ta l�m sao ch�ng n�i h�n, cho n�n ��nh ph�i ngoan ngo�n �� h�n b�t v� ch� D��c V��ng, D��c V��ng nh�n th�y ng��i s�ng nh� b�t ���c v�ng, ��nh �em ta l�m th�nh D��c nh�n. Ta ngh� l�c �� c�ng kh� s�ng s�t, nh�n l�c c� m�y ng��i T�y H� ��n, D��c V��ng b�n ti�p ki�n h�, ta li�n b� tr�n.",
	"Ng��i n�i D��c V��ng mu�n �em ng��i l�m th�nh D��c nh�n �? Ng��i c� th� n�i r� cho ta v� chuy�n D��c nh�n kh�ng?",
	"Nh�ng t�n D��c nh�n ��ng s� �� kh�ng bi�t l� ng��i hay l� qu�, <sex> sao l�i c� h�ng th� th�? Nh�ng <sex> l� ng��i trong v� l�m, n�u <sex> ��ng � gi�p ta v�o ��ng m�t chuy�n, l�y h� ta � M�c ng�n n�m tr�n ng��i Th� nh�n, th� ta s� k� cho nghe chuy�n D��c nh�n.",
	"Ch� l� vi�c nh�, ta c�n �ang lo l�ng kh�ng bi�t n�n b�o ��p cho ng��i th� n�o ��y.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,35);
	CreateTrigger(0,1236,KILL_XB_QIANNIANSHUREN);--ǧ������ɱ�ִ�����
	TaskTip("Gi�p L�u Tam ��n D��c V��ng ��ng thu th�p 20 c�y � M�c ng�n n�m tr�n ng��i Th� nh�n.");
	Msg2Player("Gi�p L�u Tam ��n D��c V��ng ��ng thu th�p 20 c�y � M�c ng�n n�m tr�n ng��i Th� nh�n.");

end

--���ػ�δ����20ǧ����ľ��Ʒ
function task_017_02_0()

local strTalk = {};

	--����20ǧ����ľ��Ʒ
	if GetItemCount(2,0,720) >= 20 then
		strTalk = {
			"Anh b�n nh�, ng��i xem c� ph�i ��y l� � M�c m� ng��i c�n kh�ng?",
			"�i ch�, th�t c�m �n ng��i, nhi�u nh� th� �, ta c� th� s�ng m�t th�i gian m� kh�ng c�n ��n n�i qu� qu�i n�y r�i. ��ng, <sex> bi�t trong D��c V��ng ��ng c� D��c nh�n, v� bi�t ���c ch� �n n�u c�a D��c V��ng kh�ng?",
			"Ta c�ng c� nghe n�i, D��c V��ng l� m�t ng��i qu�i d�, ng��i �� nh�n th�y h�n, ch�c c�ng ph�i bi�t h�n ch� t�o D��c nh�n nh� th� n�o ch�?",
			"Trong D��c V��ng ��ng c� r�t nhi�u k� hoa d� th�o, lo�i D��c Nh�n Th�o l� nhi�u nh�t. D��c V��ng tr�n trong m�t M�t ��ng trong D��c V��ng ��ng kh�ng r�i n�a b��c, b�n D��c nh�n ch�nh l� ��y t� c�a h�n ta. Ai v�o ��ng s� b� b�t ��n M�t ��ng �� �� ch� d��c nh�n, ta nh�n th�y r�t nhi�u si�u thu�c trong M�t ��ng, ng�m r�t nhi�u d��c nh�n ch�a th�nh h�nh, c�nh t��ng �y r�t kinh ho�ng.",
			}

		TalkEx("task_017_02_0_1",strTalk);

	--û�д���20ǧ����ľand�������񴥷���
	else
		strTalk = {
			"<sex> l� ng��i trong v� l�m, n�u <sex> ��ng � gi�p ta v�o ��ng m�t chuy�n, l�y h� ta � M�c ng�n n�m tr�n ng��i Th� nh�n, th� ta s� k� cho nghe chuy�n D��c nh�n.",
			}
		if	GetTrigger(KILL_XB_QIANNIANSHUREN) == 0 then
			CreateTrigger(0,1236,KILL_XB_QIANNIANSHUREN);--ǧ������ɱ�ִ�����
			TaskTip("Gi�p L�u Tam ��n D��c V��ng ��ng thu th�p 20 c�y � M�c ng�n n�m tr�n ng��i Th� nh�n.");
			Msg2Player("Gi�p L�u Tam ��n D��c V��ng ��ng thu th�p 20 c�y � M�c ng�n n�m tr�n ng��i Th� nh�n.");
		end

		TalkEx("",strTalk);
	end
end

--���Ի�
function task_017_02_0_1()

local strTalk = {
	"D��c nh�n kh� ��i ph� nh� th�, ch�c ch�n l� c� li�n quan ��n d��c th�o trong ��ng, D��c Nh�n Th�o th�t ra l� c�i g�?",
	"��ng r�i, l�n tr��c trong l�c ho�ng lo�n ta v� t�nh ng�t ���c m�t c�y, <sex> �� l�y cho ta nhi�u g� nh� th�, c�y D��c Nh�n Th�o n�y t�ng cho <sex>, hy v�ng c� �ch cho ng��i.",
	"Th�t t�t qu�, ta v�a ��nh v�o ��ng t�m m�t �t D��c Nh�n Th�o, ��nh ti�u h�y nh�ng th� qu�i d� n�y.",
	"��ng v�y, lo�i D��c Nh�n Th�o n�y t�n t�i ch� g�y h�i ch� kh�ng c� l�i, <sex> c� xem nh� v� d�n tr� h�i. Nh�ng hoa kh�c trong ��ng kh�ng c� g� b�t th��ng, ch� c� s� D��c Nh�n Th�o �� ���c b�o v� b�i b�n ng��i ��i d��c nh�n c�n d�ng m�nh h�n c� d��c nh�n, <sex> m�c d� ng��i t�i ngh� cao c��ng, nh�ng c�ng ph�i c�n th�n ��y.",
	"Th� ra D��c nh�n c�ng c� nhi�u lo�i, c�m �n ng��i �� cho ta bi�t nhi�u chuy�n ��n th�, anh b�n nh� h�y b�o tr�ng nh�, h�n g�p l�i.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,720,20);
	AddItem(2,0,721,1,1);--�õ�һ��ҩ�˲�
	RemoveTrigger(GetTrigger(KILL_XB_QIANNIANSHUREN));
	SetTask(TASK_XB_ID_01,36);
	TaskTip("��n D��c V��ng ��ng, th� ti�u di�t m�t s� D��c Nh�n Th�o.");
	Msg2Player("��n D��c V��ng ��ng, th� ti�u di�t m�t s� D��c Nh�n Th�o.");
	GivePlayerAward("Award_XB_37","Easy");
	GivePlayerExp(SkeyXibei,"yaowanggu")
end

--��û��ȥһ��ҩ�˲�
function task_017_02_1()

local strTalk = {
	"��ng v�y, lo�i D��c Nh�n Th�o n�y t�n t�i ch� g�y h�i ch� kh�ng c� l�i, <sex> c� xem nh� v� d�n tr� h�i. Nh�ng hoa kh�c trong ��ng kh�ng c� g� b�t th��ng, ch� c� s� D��c Nh�n Th�o �� ���c b�o v� b�i b�n ng��i ��i d��c nh�n c�n d�ng m�nh h�n c� d��c nh�n, <sex> m�c d� ng��i t�i ngh� cao c��ng, nh�ng c�ng ph�i c�n th�n ��y.",
	}

	TalkEx("",strTalk);

end

--��ҩ�˲ݶԻ�
function task_017_03_0()

local nNpcIndex = GetTargetNpc();
local strSay = {
	"Lo�i n�y c� v� gi�ng v�i lo�i m� L�u Tam �� giao, ch�c ch�nh l� D��c Nh�n Th�o.",
	"Nh� D��c Nh�n Th�o!/#task_017_03_1("..nNpcIndex..")",
	"Lo�i c�y n�y tr�ng c� v� ��p, t�t nh�t kh�ng n�n l�m h� n�/Task_Exit",
		}

	if nNpcIndex == nil then
		return
	end

	SelectSay(strSay)

end

--ѡ��ε�ҩ�˲�
function task_017_03_1(nNpcIndex)

local strTalk = {
	"D��c Nh�n Th�o ��ng l� k� qu�i kh�c th��ng, kh�ng d� g� ph� h�y ���c. Lo�i c�y n�y sinh t�n r�t m�nh, kh� m� ti�u di�t. Hay l� ��n h�i �u D��ng H�a  ti�n b�i xem sao.",
	}

	SetNpcLifeTime(nNpcIndex,0);
	nNpcIndex = CreateNpc("D��c Nh�n Th�o","D��c Nh�n Th�o",GetWorldPos());--ԭ������һ��Ҫ�˲�
	SetNpcScript(nNpcIndex,"\\script\\������\\ҩ����\\npc\\ҩ�˲�.lua");
	SetNpcLifeTime(nNpcIndex,300);
	SetTask(TASK_XB_ID_01,37);
	TalkEx("",strTalk);
	TaskTip("�em D��c Nh�n Th�o m� L�u Tam giao ��n cho �u D��ng ti�n b�i xem, sau �� m�i quy�t ��nh n�n l�m th� n�o.");
	Msg2Player("�em D��c Nh�n Th�o m� L�u Tam giao ��n cho �u D��ng ti�n b�i xem, sau �� m�i quy�t ��nh n�n l�m th� n�o.");

end

--��û��ҩ�˲ݴ���ŷ��ǰ��
function task_017_03_2()

local strTalk = {
	"Xem ra lo�i D��c Nh�n Th�o n�y r�t kh� ti�u di�t, hay l� quay v� th��ng l��ng c�ng �u D��ng ti�n b�i xem sao.",
	}

	TalkEx("",strTalk);

end

---------------------------------- ������18��֧1_9�ƺ�����----------------------------------
--����ŷ����ҩ�˲���������һ��
function task_018_01_0()

local strTalk = {
	"�u D��ng ti�n b�i, t�i h� �� t�m ���c m�t �t D��c Nh�n Th�o � D��c V��ng ��ng, nghe n�i d�ng �� ch� t�o D��c nh�n. T�i h� ��nh ti�u h�y h�t lo�i n�y trong D��c V��ng ��ng, nh�ng kh�ng ng� kh�ng th� ti�u di�t ���c, v�a h�y c�i n�y n� l�i s�n sinh c�i kh�c.",
	"C� lo�i c�y k� d� �� �? D��c V��ng c� th� t�n d�ng ���c th�o d��c ��n m�c n�y, qu� nhi�n khi�n ng��i ta ph�i kh�m ph�c. Khi ng��i ra ngo�i th�m th�nh ta c�ng �� t�m ���c m�t ng��i r�t hi�u v� th�o d��c, c� th� s� gi�p ta gi�i ���c b� m�t n�y.",
	"T�t qu�, ti�n b�i qu� nhi�n suy ngh� chu ��o, v� �� l� cao nh�n ph��ng n�o?",
	"Ng��i �� t�n l� T�n Ph��ng Nh�n, l� h�u nh�n c�a T�n T� M�c, r�t n�i danh v�i Thi�n Kim Y�u Ph��ng, ���c g�i l� \'Th�n Y\' tr�n giang h�. 'Thi�n Kim Y�u Ph��ng' l� s� t�p trung c�a ph�n l�n y thu�t, ghi l�i h�n m�t ng�n ph��ng thu�c, ��i v�i lo�i d��c ph�m k� d� n�y �ng ta ch�c ch�n ph�i c� nghi�n c�u. T�n Ph��ng Nh�n hi�n nay �ang � Ph�ng T��ng ph�, ng��i h�y th� �i h�i xem �ng ta c� c�ch kh�c ch� lo�i d��c th�o n�y kh�ng.",
	"Th� th� t�t qu�, ti�n b�i nhi�t t�nh gi�p �� nh� th�, khi�n v�n b�i c�m k�ch v� c�ng.",
	}

	SetTask(TASK_XB_ID_01,38);
	TalkEx("",strTalk);
	TaskTip("T�m T�n Ph��ng Nh�n h�i v� c�ch ti�u di�t D��c Nh�n Th�o.");
	Msg2Player("T�m T�n Ph��ng Nh�n h�i v� c�ch ti�u di�t D��c Nh�n Th�o.");
	GivePlayerAward("Award_XB_38","Easy");
	GivePlayerExp(SkeyXibei,"yaorencao")
end

--��û�ҵ��﷽�����ҩ�˲�һ��
function task_018_01_1()

local strTalk = {
	"<sex> kh�ng c�n kh�ch s�o, h�u nh�n T�n T� M�c T�n Ph��ng Nh�n hi�n nay �ang � Ph�ng T��ng ph�. C� th� �ng ta s� c� c�ch gi�i ���c D��c Nh�n Th�o, ng��i h�y mau �i t�m.",
	}

	TalkEx("",strTalk);

end

--���﷽���������ҩ�˲�һ��
function task_018_02_0()

local strTalk = {
	"V� n�y ch�c ch�nh l� Th�n Y T�n Ph��ng Nh�n T�n ti�n sinh ch�? Nghe n�i T�n ti�n sinh r�t tinh th�ng v� d��c th�o, ki�n th�c uy�n b�c th�m s�u, kh�ng bi�t ti�n sinh �� th�y qua lo�i D��c Nh�n Th�o n�y ch�a?",
	"T�i h� ch�nh l� T�n Ph��ng Nh�n, th�n y ta kh�ng d�m nh�n, l��ng y nh� ph� m�u l� l�i gi�o hu�n c�a t� ti�n. <sex> d��c th�o trong tay h�nh nh� c� ��c, h�nh d�ng k� l�, t�i h� �� t�ng th�y trong 'Thi�n Kim Y�u Ph��ng' t� ti�n �� l�i.",
	"T�n ti�n sinh qu� th�t �� th�y qua r�i sao? Kh�ng bi�t lo�i d��c th�o n�y c� ��c t�nh g�? C� c�ch g� tr� ch�ng kh�ng?",
	"Ha ha. <sex> ch�ng vi�c g� ph�i lo l�ng, lo�i c� l� n�y ta c�ng m�i th�y l�n ��u, d��c t�nh c�a n� th� n�o ta v�n ch�a r�. �� ta xem ��, <sex> ch� m�t ch�t.",
	}

	TalkEx("task_018_02_0_1",strTalk);

end

--���Ի�
function task_018_02_0_1()

local strTalk = {
	"C� ��y, <sex> lo�i c� ng��i c�m t�n l� Ch� H�n Th�o, kh�ng ph�i l� D��c Nh�n Th�o. Theo 'Thi�n Kim Ph��ng' ghi l�i, Ch� H�n Th�o c� v� cay, t�nh h�n, d��c t�nh r�t ��c bi�t, sinh tr��ng nhanh v� kh� di�t t�n g�c. N�u d�ng Kim D��c th� ch�a l�nh v�t th��ng r�t nhanh, song ��c t�nh c�ng c�c m�nh, kh�ng th� b�o ch� thu�c.",
	"H�a ra lo�i ��c th�o n�y l�i c� t�c d�ng l�m li�n da th�t, nh�ng l�i r�t ��c, ��ng l� t�o h�a tr�u ng��i. Kh�ng bi�t 'Thi�n Kim Y�u Ph��ng' c� ghi l�i c�ch di�t n� kh�ng?",
	"<sex> ��ng l� r�t k� l�, v�n v�t sinh ra ��u c� c�i l� c�a n�, ��c t� c�a lo�i d��c th�o n�y kh�ng c��p �i sinh m�ng, ch� l�m ng��i ta m�t tr� h�a �i�n. C� sao <sex> l�i c� ch�p mu�n di�t tr� ch�ng? Tr�i ��t �m d��ng �i�u h�a, ch�ng ta ch� l� ph�m phu t�c t� l�m sao t�y � thay ��i?",
	"T�n ti�n sinh l� lang trung ���ng nhi�n l�ng d� l��ng thi�n. Nh�ng m� th� gian lu�n c� k� b� �i mu�n ra oai, nh�ng k� mu m� b�t ch�nh l�i d�ng lo�i c� n�y l�m c� th� kh�ng b� t�n th��ng, nh�ng d��c nh�n kh�ng bi�t �au s� gieo r�c t�i h�a n�y. Cho n�n c� n�y kh�ng di�t �c s� c� th�m nhi�u n�n nh�n.",
	}

	TalkEx("task_018_02_0_2",strTalk);

end

--���Ի�
function task_018_02_0_2()

local strTalk = {
	"C�i g�? C� ng��i ��c �c ��n th� sao, d�ng ��c th�o l�n c� th� ng��i? L�m chuy�n t�n t�n l��ng t�m, th�o n�o <sex> h�i c�ng k� nh� v�y. Ch� ti�c l� 'Thi�n Kim Y�u Ph��ng' ch� ghi l�i d��c l� c�a n�, c�n c�ch di�t th� kh�ng c�. Nh�ng t� ti�n c�n truy�n l�i 'Thi�n Kim D�c Ph��ng' c� b� sung th�m c�ch gi�i ��c d��c, ch�c c� ghi ch�p l�i.",
	"T�n ti�n sinh y thu�t uy�n th�m, kh�ng bi�t c� th� gi�p ta tra c�u li�n ���c kh�ng?",
	"Quy�n 'Thi�n Kim D�c Ph��ng' c�a ta mang theo khi h�i thu�c �� bi�t r� d��c t�nh. Kh�ng may l�n tr��c ta �i sa m�c h�i thu�c b� h�nh gi� trong sa m�c tr�m m�t, ��n nay v�n ch�a t�m v� ���c. Cho n�n kh�ng th� gi�p ngay ���c <sex> l�t, l�t.",
	"��u c� th� ���c, t�n H�nh gi� sa m�c �� � ��u? Ta s� gi�p �ng ��i cu�n s�ch v�.",
	" <sex> xem ra v� c�ng c�ng kh�, c� th� ��ng ng�i. H�nh gi� sa m�c �n n�p trong M� cung sa m�c, Thi�n Kim D�c Ph��ng c� 10 T�n Quy�n, ng��i �em10 T�n Quy�n v� ��y, c� th� s� t�m ra c�ch di�t.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,721,1);--ɾȥҩ�˲�
	SetTask(TASK_XB_ID_01,39);
	CreateTrigger(0,1237,KILL_XB_SHAMOXINGZHE);--ɳĮ����ɱ�ִ�����
	TaskTip("L�y 10 t�n quy�n 'Thi�n Kim D�c Ph��ng' tr�n ng��i H�nh gi� sa m�c � M� cung sa m�c �em v� ��y.");
	Msg2Player("L�y 10 t�n quy�n 'Thi�n Kim D�c Ph��ng' tr�n ng��i H�nh gi� sa m�c � M� cung sa m�c �em v� ��y.");

end

--���ػ�δ����10ƪ��ǧ�������о�
function task_018_03_0()

local strTalk = {};

	--����10ƪ��ǧ�������о�
	if GetItemCount(2,0,722) >= 10 then
		strTalk = {
		"T�n ti�n sinh, xin xem ��y c� ph�i l� Thi�n Kim D�c Ph��ng t�n quy�n kh�ng?",
		"��ng v�y, ��y ��ng l� Thi�n Kim D�c Ph��ng. <sex> l�m vi�c t�t l�m, ch� m�t m�t l�c ng��i �� �em ���c s�ch v�, ta v� c�ng c�m k�ch. <sex> ch� m�t ch�t, �� ta tra l�i.",
		"Ch� H�n Th�o m�c � ��ng �m H�n, v� m�i tr��ng s�ng kh� kh�c nghi�t, cho n�n ch� c�n Ch� H�n Th�o c� m�t c� h�i s�ng s� sinh s�i n�y n�. V� m�c � n�i �m h�n n�n c� v� cay t�nh h�n, tuy ��c t�nh kh�ng g�y ch�t ng��i nh�ng t�m tr� m� mu�i, n�u v�o c� th� qu� l�u s� khi�n m�ch m�u t� li�t, l�m m�t l� tr�, v� c�ng c� t�c d�ng ch�a l�nh v�t th��ng r�t nhanh, nh�ng c� th� d��c nh�n kh�ng kh�c g� ng��i ch�t.",
		"Tri�u ch�ng ti�n sinh m� t� qu� l� gi�ng v�i D��c nh�n, c� c�ch di�t d��c th�o n�y kh�ng?",
		}

		TalkEx("task_018_03_0_1",strTalk);


	--û�д��ء�ǧ�������о�and�������񴥷���
	else
		strTalk = {
			" <sex> xem ra v� c�ng c�ng kh�, c� th� ��ng ng�i. H�nh gi� sa m�c �n n�p trong M� cung sa m�c, Thi�n Kim D�c Ph��ng c� 10 T�n Quy�n, ng��i �em10 T�n Quy�n v� ��y, c� th� s� t�m ra c�ch di�t.",
			}
		if	GetTrigger(KILL_XB_SHAMOXINGZHE) == 0 then
			CreateTrigger(0,1237,KILL_XB_SHAMOXINGZHE);--ɳĮ����ɱ�ִ�����
			TaskTip("L�y 10 t�n quy�n 'Thi�n Kim D�c Ph��ng' tr�n ng��i H�nh gi� sa m�c � M� cung sa m�c �em v� ��y.");
			Msg2Player("L�y 10 t�n quy�n 'Thi�n Kim D�c Ph��ng' tr�n ng��i H�nh gi� sa m�c � M� cung sa m�c �em v� ��y.");
		end

		TalkEx("",strTalk);
	end
end

--���Ի�
function task_018_03_0_1()

local strTalk = {
	"D��c th�o n�y qu� l� r�t ��c. Tuy c� n�y s�ng dai nh�ng v�n v�t trong tr�i ��t ��u t��ng sinh t��ng kh�c, c� n�y c�c h�n, n�u g�p d��c th�o c�c nhi�t s� h�o, l�c �� kh� n�ng s�ng s� kh�ng c�n.D�c Ph��ng c� ghi, � s�u trong sa m�c c� m�t lo�i T�ch D��ng C�n, tr�n h�t m�t tr�i r�c l�a, d��i h�p th� c�i n�ng h�ng h�c c�a c�t, c�ng m�c � n�i kh�c nghi�t, s�c s�ng m�nh li�t. C� kh�c l� d��c t�nh thu�c nhi�t, n�u g�p Ch� H�n Th�o th� hai t��ng kh�c nhau, c�ng h�y di�t.",
	"M�t v�t kh�c m�t v�t, th�nh v�ng tu�n ho�n t� nhi�n. Ti�n sinh bi�t ch� n�o c� T�ch D��ng C�n kh�ng?",
	"N�i ra c�ng th�t tr�ng h�p, l�n tr��c ta �i h�i thu�c � M� cung sa m�c, t�nh c� nh�n th�y T�ch D��ng C�n. D�ng n� b�o ch� thu�c c� r�t nhi�u c�ng d�ng, nh�ng kh�ng h�i v�. Theo D�c Ph��ng ghi l�i, h�i v� b�o ch� thu�c T�ch D��ng C�n r�t r��m r�. T�ch D��ng C�n c� 3 m�u xanh l�, v�ng, ��. C�y m�u xanh ��c nh�t, l�y l��i li�m c�t t� ph�n th�n; c�y m�u v�ng r�ng nh�t, d�ng cu�c c�n th�n ��o ��t quanh c�y r�i l�y l�n; c�y m�u �� m�nh nh�t, d�ng Ch�y th� r�c l�p ngo�i �� l�y ch�t d�ch. C�n ph�n kh�c ��u kh�ng th� d�ng.",
	"Kh�ng bi�t ti�n sinh c�n bao nhi�u m�i c� th� b�o ch� thu�c?",
	"C�ch b�o ch� thu�c kh� r��m r�, v� kh� � ch� ph�i �� ph�ng ��c t�nh c�a n�. T�m th�i ng��i �i h�i 10 T�ch D��ng C�n �em v� ��y, ��y l� m�t v�i d�ng c� h�i thu�c c�a ta, ng��i l�y n� m� d�ng, ta ti�p t�c nghi�n c�u c�ch b�o ch� thu�c.",
	"C�ch b�o ch� thu�c kh� r��m r�, v� kh� � ch� ph�i �� ph�ng ��c t�nh c�a n�. T�m th�i ng��i �i h�i 10 T�ch D��ng C�n �em v� ��y, ��y l� m�t v�i d�ng c� h�i thu�c c�a ta, ng��i l�y n� m� d�ng, ta ti�p t�c nghi�n c�u c�ch b�o ch� thu�c.",
	}

	TalkEx("",strTalk);
	AddItem(2,0,724,1,1);--�õ��﷽�ʵĲ�ҩ����
	DelItem(2,0,722,10);
	RemoveTrigger(GetTrigger(KILL_XB_SHAMOXINGZHE));
	SetTask(TASK_XB_ID_01,40);
	TaskTip("��n M� cung sa m�c, thu th�p 10 T�ch D��ng C�n");
	Msg2Player("��n M� cung sa m�c, thu th�p 10 T�ch D��ng C�n");
	GivePlayerAward("Award_XB_39","Easy");
	GivePlayerExp(SkeyXibei,"qianjinyifang")
end

--��û�������������﷽��
function task_018_03_1()

local strTalk = {
	"C�ch b�o ch� thu�c kh� r��m r�, v� kh� � ch� ph�i �� ph�ng ��c t�nh c�a n�. T�m th�i ng��i �i h�i 10 T�ch D��ng C�n �em v� ��y, theo D�c Ph��ng ghi l�i, h�i v� b�o ch� thu�c T�ch D��ng C�n r�t r��m r�. T�ch D��ng C�n c� 3 m�u xanh l�, v�ng, ��. C�y m�u xanh ��c nh�t, l�y l��i li�m c�t t� ph�n th�n; c�y m�u v�ng r�ng nh�t, d�ng cu�c c�n th�n ��o ��t quanh c�y r�i l�y l�n; c�y m�u �� m�nh nh�t, d�ng Ch�y th� r�c l�p ngo�i �� l�y ch�t d�ch. C�n ph�n kh�c ��u kh�ng th� d�ng. Ta ti�p t�c nghi�n c�u c�ch b�o ch� thu�c.",
	}

	TalkEx("",strTalk);

	--������ҩ����
	if GetItemCount(2,0,724) < 1 then
		AddItem(2,0,724,1,1);
	end

end

--����������Ի��ɼ�
function task_018_04_0()

local strSay = {
	"Ch�c ch�n ��y l� T�ch D��ng C�n T�n ti�n b�i �� n�i, �� ta xem d�ng c�i g� �� h�i ch�ng ��y.",
	"L��i li�m/#task_018_05_0(1)",
	"Cu�c/#task_018_05_0(0)",
	"Ch�y th�/#task_018_05_0(0)",
	"Lo�i c�y n�y tr�ng c� v� ��p, t�t nh�t kh�ng n�n l�m h� n�/Task_Exit",
		}

	SelectSay(strSay)

end

--����������Ի��ɼ�
function task_018_04_1()

local strSay = {
	"Ch�c ch�n ��y l� T�ch D��ng C�n T�n ti�n b�i �� n�i, �� ta xem d�ng c�i g� �� h�i ch�ng ��y.",
	"L��i li�m/#task_018_05_0(0)",
	"Cu�c/#task_018_05_0(1)",
	"Ch�y th�/#task_018_05_0(0)",
	"Lo�i c�y n�y tr�ng c� v� ��p, t�t nh�t kh�ng n�n l�m h� n�/Task_Exit",
		}

	SelectSay(strSay)

end

--����������Ի��ɼ�
function task_018_04_2()

local strSay = {
	"Ch�c ch�n ��y l� T�ch D��ng C�n T�n ti�n b�i �� n�i, �� ta xem d�ng c�i g� �� h�i ch�ng ��y.",
	"L��i li�m/#task_018_05_0(0)",
	"Cu�c/#task_018_05_0(0)",
	"Ch�y th�/#task_018_05_0(1)",
	"Lo�i c�y n�y tr�ng c� v� ��p, t�t nh�t kh�ng n�n l�m h� n�/Task_Exit",
		}

	SelectSay(strSay)

end

--�ɼ�������
function task_018_05_0(nType)

local nNpcIndex = GetTargetNpc();
local strTalk = {};

	if nNpcIndex == nil then
		return
	end

	SetNpcLifeTime(nNpcIndex,0);

	if nType == 1 then

		AddItem(2,0,723,1,1);--���һ��������

		if GetItemCount(2,0,723) >= 10 then
			strTalk = {
				"H�i ���c 10 T�ch D��ng C�n, c�n kh�ng mau ��a cho T�n Ph��ng Nh�n �� b�o ch� c�ch kh�c ch� D��c Nh�n Th�o."
				}
		else
			strTalk = {
				"B�n �� h�i th�nh c�ng 1 T�ch D��ng C�n h�u d�ng."
				}
		end

	else

		strTalk = {
			"H�nh nh� b�n s� d�ng kh�ng ��ng d�ng c� h�i thu�c, h�i T�ch D��ng C�n kh�ng th�nh c�ng.",
			"T�n ti�n b�i t�ng n�i r�ng h�i v� b�o ch� thu�c T�ch D��ng C�n r�t r��m r�. T�ch D��ng C�n c� 3 m�u xanh l�, v�ng, ��. C�y m�u xanh ��c nh�t, l�y l��i li�m c�t t� ph�n th�n; c�y m�u v�ng r�ng nh�t, d�ng cu�c c�n th�n ��o ��t quanh c�y r�i l�y l�n; c�y m�u �� m�nh nh�t, d�ng Ch�y th� r�c l�p ngo�i �� l�y ch�t d�ch. C�n ph�n kh�c ��u kh�ng th� d�ng.",
			"C�n ph�i ch� � m�u s�c c�a T�ch D��ng C�n, s� d�ng ��ng d�ng c� h�i m�i c� th� th�nh c�ng.",
			}

	end


	TalkEx("",strTalk);

end

--�Ѿ��ռ���δ�ռ�6�����������﷽�ʶԻ�
function task_018_06_0()

local strTalk = {};

	--������������Ʒ
	if GetItemCount(2,0,723) >= 10 then
		strTalk = {
			"T�n ti�n sinh, xin xem ��y c� ph�i l� T�ch D��ng C�n kh�ng?",
			"��ng r�i, ��y l� T�ch D��ng C�n d��c t�nh c�c h�n, ta �� hi�u r� c�ch b�o ch� thu�c t� T�ch D��ng C�n, ch� ta.",
			"M�t l�c sau�",
			"��y l� T�ch D��ng Th�y, l� tinh hoa c�a T�ch D��ng C�n, ph�i T�ch D��ng Th�y tr�n c� D��c v��ng, kh�ng l�u sau th�n v� r� c�a n� s� b� t�n th��ng, l�c �� s� di�t tr� t�n g�c d��c th�o n�y. Ng��i c�m �i, c�m t� ng��i gi�p ta t�m l�i Thi�n Kim D�c Ph��ng.",
			"�a t� T�n ti�n sinh, may m� ���c T�n ti�n sinh t��ng tr�, cu�i c�ng �� di�t tr� ���c ��c th�o n�y.",
			}

		DelItem(2,0,723,10);
		DelItem(2,0,724,1);--��ҩ����
		AddItem(2,0,725,1);--�������ˮ
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID_01,41);
		SetTask(KILL_YAORENBOSS_NUM,0);
		TaskTip("C�m T�ch D��ng Th�y do T�n Ph��ng Nh�n pha ch� ��n D��c V��ng ��ng ti�u di�t 5 c�y D��c Nh�n Th�o.");
		Msg2Player("C�m T�ch D��ng Th�y do T�n Ph��ng Nh�n pha ch� ��n D��c V��ng ��ng ti�u di�t 5 c�y D��c Nh�n Th�o.");
		GivePlayerAward("Award_XB_40","Easy");
		GivePlayerExp(SkeyXibei,"lieyanggen")
	--û�д���������
	else
		strTalk = {
			"C�ch b�o ch� thu�c kh� r��m r�, v� kh� � ch� ph�i �� ph�ng ��c t�nh c�a n�. C�n T�ch D��ng C�n xanh, v�ng, �� m�i lo�i 2 c�y, ng��i �em 10 T�ch D��ng C�n v� ��y, Theo D�c Ph��ng ghi l�i, h�i v� b�o ch� thu�c T�ch D��ng C�n r�t r��m r�. T�ch D��ng C�n c� 3 m�u xanh l�, v�ng, ��. C�y m�u xanh ��c nh�t, l�y l��i li�m c�t t� ph�n th�n; c�y m�u v�ng r�ng nh�t, d�ng cu�c c�n th�n ��o ��t quanh c�y r�i l�y l�n; c�y m�u �� m�nh nh�t, d�ng Ch�y th� r�c l�p ngo�i �� l�y ch�t d�ch. C�n ph�n kh�c ��u kh�ng th� d�ng. Ta ti�p t�c nghi�n c�u c�ch b�o ch� thu�c.",
			}
		TalkEx("",strTalk);
	end
end

--��û����ҩ�˲����﷽�ʶԻ�
function task_018_06_1()

local strTalk = {
	"Ph�i T�ch D��ng Th�y tr�n c� D��c v��ng, kh�ng l�u sau th�n v� r� c�a n� s� b� t�n th��ng, l�c �� s� di�t tr� t�n g�c d��c th�o n�y. Ng��i c�m �i, c�m t� ng��i gi�p ta t�m l�i Thi�n Kim D�c Ph��ng.",
	}
	--��������ˮ
	if GetItemCount(2,0,725) < 1 then
		AddItem(2,0,725,1);--�������ˮ
	end
	TalkEx("",strTalk);

end

--��������ˮ��ҩ�˲ݶԻ�
function task_018_07_0()

local strSay = {
	"Ng��i mu�n l�m g�?",
	"D�ng T�ch D��ng Th�y ti�u di�t 1 D��c Nh�n Th�o/task_018_07_1",
	"Kh�ng mu�n l�m/Task_Exit"
	};

	SelectSay(strSay);

end

--��������ˮ����ҩ�˲�
function task_018_07_1()

local strTalk = {};
local nNpcIndex = GetTargetNpc();

	if GetTargetNpc() == nil then
		return
	end

	if GetItemCount(2,0,725) < 1 then
	 	strTalk = {
	 		"N�u kh�ng c� T�ch D��ng Th�y, th� th� kh�ng c� c�ch n�o di�t D��c Nh�n Th�o."
	 		}
	 	TalkEx("",strTalk);
	 	return
	end

	strTalk = {
		"H�m�",
		"N�u c� D��c nh�n chuy�n canh gi� D��c Nh�n Th�o, th� th� ch�ng c�n c�ch n�o ��nh ph�i tr� kh� ch�ng m�i c� th� di�t lo�i c� n�y."
		}

	SetNpcLifeTime(nNpcIndex,0);
	nNpcIndex = CreateNpc("Th� l�nh D��c nh�n","D��c nh�n v��ng",GetWorldPos());
	SetNpcScript(nNpcIndex,"\\script\\������\\ҩ����\\npc\\ҩ������.lua");
	SetNpcLifeTime(nNpcIndex,600);
	TalkEx("",strTalk);

end

---------------------------------- ������19��֧1_10�����----------------------------------

--�ɹ���������ҩ�˲ݣ���ȥ��ŷ���Ի�
function task_019_01_0()

local strTalk = {
	"�u D��ng ti�n b�i, T�n ti�n sinh qu� nhi�n cao minh, �ng �� t�m ra c�ch di�t D��c Nh�n Th�o, ta �� v�o D��c V��ng ��ng di�t D��c Nh�n Th�o, D��c v��ng kh�ng c�n l�i d�ng lo�i d��c th�o n�y �� l�m ra D��c nh�n ���c n�a.",
	"Qu� t�t, <sex> �� l�m vi�c t�t cho b� t�nh.D��c v��ng qu� �o t��ng v� tinh ch� th�o d��c, D��c Nh�n Th�o trong D��c V��ng ��ng tuy �� di�t h�t, nh�ng v�i nh�ng hi�u bi�t v� d��c th�o h�n s� t�m lo�i d��c th�o kh�c thay th�.",
	"Trong D��c V��ng ��ng c� 1 M�t ��ng n�i D��c v��ng �n n�u, ra v�o r�t kh�, trong m�t ��ng c�n r�t nhi�u D��c nh�n ch�a h�nh th�nh, s� r�ng trong M�t ��ng v�n c�n c�t gi�u D��c v��ng th�o. D��c v��ng th�o d� m�c, tr�ng l�i n� d� nh� tr� b�n tay.",
	"D��c v��ng l� m�i tai h�a kh�n l��ng, b�y gi� b� T�y H� mua v� th� c�ng c�c k� nguy hi�m. B�y gi� b�n ch�ng �ang ch� t�o r�t nhi�u D��c nh�n, ch� c�n c�ch di�t tr� t�n g�c th�i.",
	}

	TalkEx("task_019_01_0_1",strTalk);

end

--���Ի�
function task_019_01_0_1()

local strTalk = {
	"N�u �� nh� v�y, kh�ng s� kinh ��ng ��n ng��i T�y H� sao?",
	"C�n ph�i c�n tr�ng, ng��i bi�t D��c v��ng m�t ��ng � ��u kh�ng?",
	"Ta �� t�ng ���c 1 ng��i ch� �i�m c�ch v�o D��c v��ng m�t ��ng, D��c v��ng �n n�u trong ��ng do Canh gi� D��c nh�n canh g�c, ngo�i D��c v��ng ra kh�ng ai ���c v�o. Canh gi� D��c nh�n m�t khi ph�t hi�n c� ng��i t� ti�n x�ng v�o m�t ��ng, t�c kh�c s� tri�u t�p t�t c� D��c nh�n trong ��ng c�ng c�ng k�ch.",
	"N�i nh� v�y th� ng��i T�y H� c�ng kh�ng th� v�o M�t ��ng, c�ch t�t nh�t l� �m s�t D��c v��ng �m s�t � trong M�t ��ng. Canh gi� D��c nh�n ch� nh�n ra D��c v��ng, ch�ng ta ph�i l�i d�ng ���m n�y, �� ng��i c�i trang th�nh D��c v��ng tr� tr�n v�o M�t ��ng. Ng��i ch�a t�ng g�p D��c v��ng ��ng kh�ng? Nh�ng �� c� ng��i t�ng g�p h�n?",
	}

	TalkEx("task_019_01_0_2",strTalk);

end

--���Ի�
function task_019_01_0_2()

local strTalk = {
	"A, ta c� quen 1 ng��i �� t�ng th�y m�t D��c v��ng, t�n h�n l� L�u Tam, ta �i h�i h�n dung m�o D��c v��ng.",
	"T�t qu�, ng��i nh� h�n gi�p ng��i m� t� dung m�o D��c v��ng, sau �� quay l�i ��y ta gi�p ng��i v� 1 b�c ch�n dung D��c v��ng. Ta c� quen m�t cao th� c�i trang � Ph�ng T��ng ph�, s� tr��ng c�a h�n l� ch� t�o m�t n� da ng��i, n�u c� m�t n� s� l�a ���c Canh gi� D��c nh�n, l�n v�o trong m�t ��ng.",
	"K� n�y qu� r�t hay, th�n tr� c�a Canh gi� D��c nh�n b� D��c v��ng th�o h�y ho�i, ch�ng kh�ng th� ph�n bi�t ���c dung m�o, ta �i t�m L�u Tam h�i h�n dung m�o D��c v��ng.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,43);
	TaskTip("��n D��c v��ng c�c t�m L�u Tam h�i th�m dung m�o c�ch �n m�c c�a D��c v��ng.");
	Msg2Player("��n D��c v��ng c�c t�m L�u Tam h�i th�m dung m�o c�ch �n m�c c�a D��c v��ng.");
	GivePlayerAward("Award_XB_41","Easy");
	GivePlayerExp(SkeyXibei,"qingchuyaorencao")
end

--��δ�������Ի�
function task_019_01_1()

local strTalk = {
	"Ng��i mau �i t�m L�u Tam nh� h�n m� t� dung m�o D��c v��ng, sau �� quay l�i ��y ta gi�p ng��i v� 1 b�c ch�n dung D��c v��ng."
	}

	TalkEx("",strTalk);

end

--�������Ի�ѯ��ҩ��������ò
function task_019_02_0()

local strTalk = {
	"Nh�n th�y <sex> b�nh an v� s�, ta c�ng y�n t�m ph�n n�o. B�y gi� ta c� th� y�n t�m r�i kh�i ��y.",
	"Ch�ng l� t��u ca ��ng � ��y ��i ta xu�t ��ng? �� t��u ca lo l�ng ta th�t �y n�y. N�i n�y kh�ng th� � l�u, t��u ca mau r�i kh�i n�i n�y. T��u ca �� t�ng th�y dung m�o D��c v��ng, c� th� m� t� l�i gi�p ta ���c kh�ng?",
	"<sex> ph�i ��n D��c V��ng ��ng sao? Ng��i ph�i c�n th�n D��c v��ng, tuy h�n r�u t�c b�c tr�ng nh�ng v� c�ng kh�e. ��u h�n gi�ng nh� b�o, r�u t�c d�i b�c tr�ng v� r�m, da d� kh�ng kh�c g� ng��i tr� tu�i. Sau l�ng �eo 1 b�nh d��c h� l� l�n, l�c �� kh�n c�p kh�ng th� nh�n r� nh�ng dung m�o c�a h�n r�t d� nh�.",
	"Ti�u ca m� t� h�nh d�ng D��c v��ng c�ng kh� chi ti�t. B�ng h�u h�y mau r�i kh�i n�i n�y, t�m n�i kh�c m�u sinh. �a t� b�ng h�u, ta xin c�o t�.",
	"<sex> qu� kh�ch s�o r�i, ta ph�i c�m �n m�i ��ng, <sex> h�nh t�u gian h�, m�i vi�c ph�i c�n tr�ng.",
	}

	SetTask(TASK_XB_ID_01,44);
	TalkEx("",strTalk);
	TaskTip("�� bi�t ���c t��ng m�o c�a D��c v��ng, mau quay v� b�o �u D��ng H�a ti�n b�i.");
	Msg2Player("�� bi�t ���c t��ng m�o c�a D��c v��ng, mau quay v� b�o �u D��ng H�a ti�n b�i.");

end

--δ�ر�ŷ����ҩ������ò
function task_019_02_1()

local strTalk = {
	"<sex> nh�t ��nh ph�i c�n th�n v�i D��c v��ng, tuy h�n r�u t�c b�c tr�ng nh�ng v� c�ng kh�e. ��u h�n gi�ng nh� b�o, r�u t�c d�i b�c tr�ng v� r�m, sau l�ng �eo 1 l� d��c h� l�, l�c �� kh�n c�p ta kh�ng nh�n r� nh�ng dung m�o c�a h�n r�t d� nh�."
	}

	TalkEx("",strTalk);

end

--��ŷ��������ҩ��������ò
function task_019_03_0()

local strTalk = {
	"Ta �� chu�n b� xong b�t m�c, ng��i �� h�i k� dung m�o D��c v��ng ch�a?",
	"Ta �� h�i dung m�o c�a D��c v��ng. D��c v��ng r�u t�c b�c tr�ng, �� c� tu�i. ��u h�n gi�ng nh� b�o, r�u t�c d�i b�c tr�ng v� r�m. da d� kh�ng kh�c g� ng��i tr� tu�i. Sau l�ng �eo 1 b�nh d��c h� l� l�n, ti�n b�i c� th� d�a theo �� v� ���c kh�ng?",
	"Tuy kh�ng r� r�ng l�m, nh�ng nh�ng chi ti�t m� t� kh� ��c tr�ng. Theo m� t� c�a ng��i th�y c�ng c� v�i n�t gi�ng Tr��ng Phi th�i Tam Qu�c, ng��i ch� ta 1 ti�ng, ta �i v� 1 b�c tranh gi�ng nh� th�t.",
	" 1 gi� sau��",
	}

	TalkEx("task_019_03_0_1",strTalk);

end

--���Ի�
function task_019_03_0_1()

local strTalk = {
	"Vi�c l�n �� xong, ng��i �em ch�n dung D��c v��ng �i t�m ���ng Thi�n Thi�n, c� ta s� l�m �� c�i trang gi�ng nh� th�t cho ng��i.",
	"���ng Thi�n Thi�n �ang � Ph�ng T��ng ph�? Ch�ng ph�i ���ng m�n � T� Xuy�n sao?",
	"Ph� th�n c�a ���ng Thi�n Thi�n v� ta c� th�m t�nh v�i nhau, ti�c l� kh�ng may ch�t y�u, tr��c l�c l�m chung d�n d� ta ch�m s�c c� ta. Thi�n Thi�n v�n thu�c ���ng m�n, c� ta ch� th�ch thu�t c�i trang, nh�ng ng��i c�a ���ng m�n t� tr��c ��n nay lu�n xem th��ng thu�t c�i trang. Sau khi ph� th�n c�a Thi�n Thi�n m�t, c� ta b� ���ng m�n lo�i tr�, cu�i c�ng ta khuy�n c� ta ��n ��nh c� t�i Ph�ng T��ng , tr�nh xa n�i phi�n ph�c, l�i c� th� ph�t huy s� tr��ng.",
	"H�a ra l� v�y, ta �i t�m ���ng c� n��ng ��y. Ti�n b�i, c�o t�!",
	}

	TalkEx("",strTalk);
	AddItem(2,0,752,1,1);--�õ�ҩ������
	SetTask(TASK_XB_ID_01,45);
	TaskTip("T�m ���ng Thi�n Thi�n � Ph�ng T��ng nh� ch� t�o v�t d�ng �� c�i trang theo ch�n dung D��c v��ng.");
	Msg2Player("T�m ���ng Thi�n Thi�n � Ph�ng T��ng nh� ch� t�o v�t d�ng �� c�i trang theo ch�n dung D��c v��ng.");
	GivePlayerAward("Award_XB_42","Easy");
	GivePlayerExp(SkeyXibei,"yaowanghuaxiang")
end

--δ����ܷܷ�Ի�������������װ
function task_019_03_1()

local strTalk = {
	"Ng��i �em b�c 'ch�n dung D��c v��ng' ta v� ��a cho ���ng Thi�n Thi�n, nh� c� ta ch� t�o �� c�i trang, nh� v�y vi�c h� th� D��c v��ng d� nh� tr� b�n tay."
	}

	TalkEx("",strTalk);

end

--����ܷܷ�Ի������æ��������װ
function task_019_04_0()

	local strTalk = {
	"C� n��ng l� ���ng Thi�n Thi�n? �u D��ng H�a ti�n b�i n�i v�i ta c� r�t tinh th�ng thu�t c�i trang, c� th� gi�p ta ch� t�o 1 t�m m�t n� da ng��i?",
	"Ta ch�nh l� ���ng Thi�n Thi�n. H�a ra l� b�ng h�u c�a �u D��ng b� b�, l�m 1 b� �� c�i trang th� qu� d�. Ch� c�n c�c h� ��a ch�n dung c�a ng��i mu�n gi� d�ng cho ta, b�o ��m th�t gi� kh� ph�n bi�t ���c.",
	"�a t� c� n��ng, nh� c� n��ng l�m m�t n� d�a v�o b�c h�nh n�y.",
	"Th� ra l� 1 �ng gi�, r�u t�c ��u b�c tr�ng, da d� th� l�i b�ng l��ng. S� r�ng ta kh�ng c� �� thu�c nhu�m. C�c h� t�m gi�p ta 100 L�nh tr�ng t� v� 100 Da s� t�. Ch� c� 2 lo�i nguy�n li�u n�y m�i ph� h�p v�i lo�i t�c v� m�u da n�y.",
	"���ng nhi�n kh�ng c� v�n �� g�, c� n��ng ch� ta ch�c l�t, ta l�p t�c �i thu th�p nguy�n li�u.",
	}

	DelItem(2,0,752,1);--ɾȥҩ������
	SetTask(TASK_XB_ID_01,46);
	TalkEx("",strTalk);
	TaskTip("Thu th�p 100 L�nh tr�ng t� v� 100 Da s� t� giao cho ���ng Thi�n Thi�n ch� t�o �� c�i trang D��c v��ng.");
	Msg2Player("Thu th�p 100 L�nh tr�ng t� v� 100 Da s� t� giao cho ���ng Thi�n Thi�n ch� t�o �� c�i trang D��c v��ng.");

end

--���ػ�û�д������˿����Ʒ����ܷܷ
function task_019_05_0()

local strTalk = {};

	--������Ʒ
	if GetItemCount(2,9,4) >= 100 and GetItemCount(2,2,47) >= 100 then
		strTalk = {
			"��y l� nguy�n li�u c� n��ng c�n, c�n c�n th� g� n�a kh�ng?",
			"B�y nhi�u �� r�i, m�i th� �� �� kho�ng n�a gi� sau s� l�m xong m�t n�, <sex> ch� ch�t.",
			"M�t l�c sau�",
			"M�t n� v� �� c�i trang �� l�m xong, c�c h� th� xem c� v�a � ch�a?",
			"���ng c� n��ng tr� tu� h�n ng��i, b�n tay l�i kh�o l�o, c�i trang r�t kh� ph�n bi�t th�t gi�. Thu�t c�i trang c�a ���ng c� n��ng th�t cao si�u.T�i h� c�n vi�c quan tr�ng c�n l�m, c�m t� c� n��ng tr��ng ngh�a t��ng tr�.",
			}
		AddItem(2,0,760,1,1);--ҩ������װ
		DelItem(2,9,4,100);
		DelItem(2,2,47,100);
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID_01,47);
		TaskTip("�� c�i trang D��c v��ng �� c� ��, c� th� l�a ���c ng��i canh g�c trong D��c V��ng ��ng.");
		Msg2Player("�� c�i trang D��c v��ng �� c� ��, c� th� l�a ���c ng��i canh g�c trong D��c V��ng ��ng.");
		GivePlayerAward("Award_XB_43","Easy");
		GivePlayerExp(SkeyXibei,"yaowangyirongzhuang")
	--û�д�����Ʒ
	else
		strTalk = {
			"Th� ra l� 1 �ng gi�, r�u t�c ��u b�c tr�ng, da d� th� l�i b�ng l��ng. S� r�ng ta kh�ng c� �� thu�c nhu�m. C�c h� t�m gi�p ta 100 L�nh tr�ng t� v� 100 Da s� t�. Ch� c� 2 lo�i nguy�n li�u n�y m�i ph� h�p v�i lo�i t�c v� m�u da n�y."
			}

		TalkEx("",strTalk);
	end

end

--�Ѿ�ȡ������װ(��������װ)
function task_019_05_1()

local strTalk = {
	"M�t n� v� �� c�i trang �� l�m xong, c�c h� th� xem c� v�a � ch�a?"
	}

	TalkEx("",strTalk);

	if GetItemCount(2,0,760) < 1 then
		AddItem(2,0,760,1,1);--ҩ������װ
	end

end

--��ȡ������װ��ҩ���ض������˶Ի�
function task_019_06_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(YaoWang_MapData));
local xWPos,yWPos,xPos,yPos = YaoWang_MapData[nMapDataIndex][1],YaoWang_MapData[nMapDataIndex][2],YaoWang_MapData[nMapDataIndex][3],YaoWang_MapData[nMapDataIndex][4]
local nNpcIndex = 0;

	--���������ʧ����Ҫ��30���Ӳ�������ˢ��ҩ��
	if GetTime()-GetTask(CREAT_YAOWANG_TIME)	>= 1800 then

		strTalk = {
			"Ng��i l� ai?",
			"Ta l� D��c v��ng, kh�ng nh�n ra ta sao?",
			"Ai l�m �n b�n ngo�i ��!?",
			"��i s� kh�ng hay r�i, kh�ng th� ��nh l�a ���c n�a, kh�ng c�n c�ch n�o kh�c, ��nh ph�i x�ng l�n, tr� kh� D��c v��ng.",
			}

		SetTask(CREAT_YAOWANG_TIME,GetTime());--��¼ҩ��ˢ��ʱ��
		nNpcIndex = CreateNpc("D��c V��ng","D��c V��ng",510,xWPos,yWPos);
		SetNpcScript(nNpcIndex,"\\script\\������\\ҩ����\\npc\\ҩ��.lua");
		SetNpcLifeTime(nNpcIndex,1500);
		Msg2Player("D��c v��ng xu�t hi�n �  "..xPos..", "..yPos.." , h�y mau �i ti�u di�t h�n.")
		TaskTip("D��c v��ng xu�t hi�n �  "..xPos..", "..yPos.." , h�y mau �i ti�u di�t h�n.");

	else

		strTalk = {
			"��",
			"D��ng nh� kh�ng c� ph�n �ng g�, c�ch 30 ph�t D��c v��ng m�i xu�t hi�n, ch� c� h�i th� ti�p!"
			}

	end

	TalkEx("",strTalk);

end

--�Ѿ���ȡ���񵫻�δȡ������װ�뿴���˶Ի�
function task_019_06_1()

local strTalk = {
	"��",
	"Kh�ng c� �� c�i trang ch� t� ti�n h�nh ��ng, b�ng kh�ng kinh ��ng ��n D��c v��ng h�u qu� kh� l��ng.",
	};

	TalkEx("",strTalk);

end

--û����ȡ������ҩ�ҿ����˶Ի�
function task_019_06_2()

local strTalk = {
	"��",
	};

	TalkEx("",strTalk);

end

--�Ѿ�ɱ��ҩ����ŷ�����Ի�
function task_019_07_0()

local strTalk = {
	"�u D��ng ti�n b�i, may m� ch�ng ta �i tr��c m�t b��c ti�u di�t D��c v��ng, D��c v��ng �� ��ng � ch� t�o D��c nh�n cho qu�n ��i T�y H�, ng��i h�y xem m�t th� n�y, D��c v��ng c�n chu�n b� Ph��ng thu�c D��c nh�n cho T�y H�.",
	"L�c ��u ta c� t��ng T�y H� mu�n D��c v��ng ch� t�o s� l��ng l�n D��c nh�n �� s� d�ng, kh�ng ng� T�y H� v�n mu�n tr�c ti�p s� d�ng qu�n ��i c�a m�nh, ng��i T�y H� qu� th�t th� �o�n ��c �c. May m� �� di�t D��c Nh�n Th�o, k� ho�ch c�a b�n ch�ng r�i s� nh� d� tr�ng xe c�t.",
	"S� r�ng ng��i T�y H� kh�ng tin t��ng th�n d�n ��i T�ng, th� hy sinh ng��i c�a m�nh ch� quy�t kh�ng d�ng ng��i T�ng trong qu�n ��i. ��i th� l� ��i T�ng, T�y H� quy�t kh�ng l� l�.",
	"N�u T�y H� c� ���c ph��ng thu�c n�y, ch�ng ta ch�ng �� kh�ng n�i, ph�i h�y ph��ng thu�c n�y �� tr�nh g�y h�a cho ng��i d�n. Nh�ng n�u Nh�t ph�m ���ng ph�t hi�n ra kh�ng th�y tung t�ch c�a ph��ng thu�c ��u, nh�t ��nh s� nghi ng�. C� r�i, ng��i �i t�m T�n Ph��ng Nh�n , ��a ph��ng thu�c th�t cho �ng ta nghi�n c�u, l�m 1 ph��ng thu�c gi� cho Nh�t ph�m ���ng, l�m nh� th� v�a gi�u ���c chuy�n D��c v��ng b� ti�u di�t v� c� th� ch� t�o D��c nh�n gi� tr� tr�n v�o qu�n ��i T�y H�.",
	"Tuy�t k�, �u D��ng ti�n b�i kh�ng h� danh l� b� n�o c�a Tr��ng Ca M�n. C�i n�y g�i l� gieo nh�n n�o g�p qu� n�y.",
	}

	TalkEx("task_019_07_0_1",strTalk);

end

--������
function task_019_07_0_1()

	give_zb_award(44);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		DelItem(2,0,727,1);--ɾȥ��������
		SetTask(TASK_XB_ID_01,49);
		TaskTip("T�m T�n Ph��ng Nh�n h�i xem Ph��ng thu�c D��c nh�n c� th� l�m gi� hay kh�ng.");
		Msg2Player("T�m T�n Ph��ng Nh�n h�i xem Ph��ng thu�c D��c nh�n c� th� l�m gi� hay kh�ng.");
		GivePlayerAward("Award_XB_44","Easy");
		GivePlayerExp(SkeyXibei,"yaowang")
	end
end

--��δ���﷽�ʶԻ�
function task_019_07_1()

local strTalk = {
	"Ng��i �i t�m T�n Ph��ng Nh�n , ��a ph��ng thu�c th�t cho �ng ta nghi�n c�u, l�m 1 ph��ng thu�c gi� cho Nh�t ph�m ���ng, l�m nh� th� v�a gi�u ���c chuy�n D��c v��ng b� ti�u di�t v� c� th� ch� t�o D��c nh�n gi� tr� tr�n v�o qu�n ��i T�y H�. ",
	}

	TalkEx("",strTalk);

end

--���﷽�ʶԻ������æα��ҩ��ҩ��
function task_019_08_0()

local strTalk = {
	"<sex> c� di�t g�n h�t D��c Nh�n Th�o h�i ng��i �� kh�ng?",
	"May c� T�ch D��ng Th�y c�a T�n ti�n sinh ch� ra, D��c Nh�n Th�o g�p n��c b� bi�n ch�t, �� ti�u di�t t�n g�c. Ti�n sinh c�n nh� l�n tr��c ta nh�c ��n c� ng��i ��c �c mu�n d�ng D��c Nh�n Th�o l�n c� th� ng��i kh�ng? Ta �� c� ���c ph��ng thu�c D��c nh�n.",
	"��o cao 1 th��c, ma cao 1 tr��ng, tuy n�i ng��i nghi�n c�u ra ph��ng thu�c n�y t�m ��a ��c �c, nh�ng kh�ng th� kh�ng kh�m ph�c t�i tr� tinh th�ng, ki�n th�c s�u r�ng c�a h�n ��i v�i th�o d��c. Ph�i dung thu�c ��ng li�u, th�t ��ng kh�m ph�c.",
	"Kh�ng bi�t T�n ti�n sinh c� th� ch� ra 1 ph��ng thu�c gi� m�o, ch� c� h�nh d�ng b�n ngo�i c�a D��c nh�n nh�ng l�i kh�ng gi�ng D��c nh�n?",
	}

	TalkEx("task_019_08_0_1",strTalk);

end

--���Ի�
function task_019_08_0_1()

local strTalk = {
	"Kh� qu�, trong ch�c l�t kh�ng th� l�m ra ph��ng thu�c n�y, nh�ng <sex> mu�n ph��ng ph�p ch� t�o gi�ng m� l�i kh�ng gi�ng D��c nh�n? Th� th� ph�i nghi�n c�u li�u l��ng v� t�c d�ng l�n nhau gi�a c�c lo�i thu�c v� c�n s� d�ng m�t li�u nh� D��c Nh�n Th�o.",
	"N�u ti�n sinh c� th� ch� t�o ph��ng thu�c gi�ng nh�ng kh�ng ph�i l� Ph��ng thu�c D��c nh�n th� qu� t�t r�i, m�t s� D��c Nh�n Th�o ch�t kh� kh�ng bi�t c�n d�ng ���c kh�ng?",
	"D��c Nh�n Th�o b� h�o c� b�o ch� thu�c ���c hay kh�ng c�n ph�i c�n nh�c, m�t l�t ng��i h�y quay l�i ch� vi�c n�y trong ph�t ch�c kh�ng th� n�n n�ng ���c, ��i ta nghi�n c�u ��.",
	"�a t� T�n ti�n sinh, n�u ti�n sinh c� ti�n tri�n g� m�i xin b�o l�i cho �u D��ng H�a ti�n b�i, v�n b�i s� l�p t�c ��n l�y. Kh�ng qu�y r�y T�n ti�n sinh n�a, c�o t�.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,726,1);--ɾȥҩ��ҩ��
	SetTask(TASK_XB_ID_01,50);
	TaskTip("T�n Ph��ng Nh�n �� ng��i ��i m�t th�i gian m�i ��n l�y Ph��ng thu�c D��c nh�n gi�.");
	Msg2Player("T�n Ph��ng Nh�n �� ng��i ��i m�t th�i gian m�i ��n l�y Ph��ng thu�c D��c nh�n gi�.");
	GivePlayerAward("Award_XB_45","Easy");
	GivePlayerExp(SkeyXibei,"zhuanyan")
end

--����֧��δ����δȡ��α��ҩ��ҩ��
function task_019_08_1()

local strTalk = {
	"Ng��i ��i m�t th�i gian r�i h�n ��n, ch� vi�c n�y trong ph�t ch�c kh�ng th� n�n n�ng ���c, ��i ta nghi�n c�u ��.",
	}

	TalkEx("",strTalk);

end


---------------------------------- ������20��֧1_11������թ----------------------------------
--����֧�߽��������ܣ�ȡ��α��ҩ��ҩ��
function task_020_01_0()

local strTalk = {
	"T�n ti�n sinh �� ch� t�o ra 1 ph��ng thu�c gi� r�i ph�i kh�ng?",
	"Ph��ng thu�c n�y ph�i t�nh to�n t� m� ch�ng lo�i v� li�u l��ng, n�u kh�n t�nh to�n ch�nh x�c e r�ng thu�c n�y kh� th�nh. M�y ng�y nay ta kh�ng ng�ng th� thu�c, cu�i c�ng �� ch� th�nh, n�u s� d�ng l�n c� th� ng��i, t�m th�i xu�t hi�n d�ng v� b�n ngo�i c�a D��c nh�n, nh�ng kh�ng c� s�c m�nh c�a D��c nh�n, qua 2 canh gi� s� h�i ph�c l�i nh� c�, tuy c� m�t �t ��c t�nh nh�ng kh�ng c� tr� ng�i g� l�n.",
	"T�n ti�n sinh qu� nhi�n l�i h�i, l�m nh� v�y c� th� khi�n k� gian �c r�i v�o b�y. Khi b�n ch�ng t��ng r�ng c� th� ph�t huy uy l�c c�a D��c nh�n c�ng l� l�c di�t vong. V�t v� cho T�n ti�n sinh qu�.",
	}

	TalkEx("task_020_01_0_1",strTalk);

end

--���Ի�
function task_020_01_0_1()

local strTalk = {
	"<sex> kh�ng c�n kh�ch s�o, tuy bi�t r�t t�n �c nh�ng ���c nh�n th�y ph��ng thu�c n�y nh� ���c m� r�ng t�m m�t, nh� b� y thu�t l�i cu�n h�n. Ph��ng thu�c th�t c�n ph�i h�y, n�u r�i v�o tay ng��i thi�n th� t�t c�n ch� r�i v�o tay k� �c l� h�a, gi� l�i qu� l� tai h�a.",
	"T�n ti�n sinh n�i r�t ��ng, v�t h�i ng��i nh� v�y l�m sao c� th� gi� l�i? B�y gi� H�y �i. �a t� T�n ti�n sinh t��ng tr�, ti�n sinh b�o tr�ng, ta xin c�o t�.",
	"(D��c Nh�n Th�o, Ph��ng thu�c D��c nh�n, D��c v��ng ��u �� tr� s�ch, cu�i c�ng �� ��p tan �m m�u t�n �c c�a T�y H�, b�y gi� ph�i c�n th�n giao ph��ng thu�c gi� cho Xa Lu�n B� V��ng.)",
	}

	TalkEx("",strTalk);
	AddItem(2,0,728,1,1);--�õ�α���ҩ��ҩ��
	SetTask(TASK_XB_ID_01,51);
	TaskTip("Giao Ph��ng thu�c D��c nh�n gi� cho Xa Lu�n B� V��ng .");
	Msg2Player("Giao Ph��ng thu�c D��c nh�n gi� cho Xa Lu�n B� V��ng .");

end

--��δ��α��ҩ���������ְ���
function task_020_01_1()

local strTalk = {
	"H�c thu�t v� d��c th�o qu� nhi�n uy�n th�m, xem ra ta v�n ch�a hi�u h�t v� Thi�n Kim Y�u Ph��ng, t� b�y gi� ph�i ch�m ch� nghi�n c�u ti�p t�c ch� nguy�n c�a ti�n t�.",
	"(D��c Nh�n Th�o, Ph��ng thu�c D��c nh�n, D��c v��ng ��u �� tr� s�ch, cu�i c�ng �� ��p tan �m m�u t�n �c c�a T�y H�, b�y gi� ph�i c�n th�n giao ph��ng thu�c gi� cho Xa Lu�n B� V��ng.)",
	}

	TalkEx("",strTalk);
	--����ҩ��
	if GetItemCount(2,0,728) < 1 then
		AddItem(2,0,728,1,1);--�õ�α���ҩ��ҩ��
		TaskTip("Giao Ph��ng thu�c D��c nh�n gi� cho Xa Lu�n B� V��ng .");
		Msg2Player("Giao Ph��ng thu�c D��c nh�n gi� cho Xa Lu�n B� V��ng .");
	end

end

--��α��ҩ���������ְ���
function task_020_02_0()

local strTalk = {
	"Ng��i �� �i m�t th�i gian d�i, chuy�n D��c v��ng ti�n tri�n sao r�i?",
	"May m� kh�ng ph� l�ng �y th�c c�a B�n, Ph�p v��ng �� l�i k�o ���c D��c v��ng, D��c v��ng ��ng � ch� t�o D��c nh�n cho T�y H� , c�n d�ng Ph��ng thu�c D��c nh�n �� qu�n T�y H� d�ng.",
	"Ha ha, t�t qu�, nghe n�i D��c v��ng r�t x�o tr� qu�i ��n, l�c ��u ta c� lo kh�ng th� thuy�t ph�c ���c h�n. Ng��i l�y ���c ph��ng thu�c r�i ph�i kh�ng? ��a cho ta xem.",
	"��y l� Ph��ng thu�c D��c nh�n, theo c�ch pha ch� ghi � ��y ch� t�o D��c nh�n, t� r�y v� sau T�y H� s� v� ��ch thi�n h�.",
	}

	TalkEx("task_020_02_0_1",strTalk);

end

--���Ի�
function task_020_02_0_1()

local strTalk = {
	"Ha ha, n�i ��ng l�m, s�m mu�n g� Trung Nguy�n c�ng thu�c v� T�y H� ch�ng ta. N�u vi�c n�y gi�i quy�t s�m, c�ng c�a ng��i kh�ng nh�, t�nh ra ng��i c�ng �� l�p kh�ng �t c�ng lao, cho ng��i nh�n ch�c V� V� ���ng n�i. V� V� tr�c ti�p nghe l�nh c�a Th�p ��i kim cang, gi� ��y Th�p ��i kim cang b� th��ng nghi�m tr�ng, nguy�n kh� b� t�n th��ng, ng��i l�p ���c c�ng lao s� ���c ng�i v�o ch�c v� c�n tr�ng, g�i l� Kim cang Nh�t ph�m ���ng n�i.",
	"Kh�ng d�m, t�i h� l�m h�t s�c m�nh l� vi�c n�n l�m.",
	"Th�y ng��i kh�ng ham danh l�i. Ta giao cho ng��i 1 nhi�m v�. Khi ng��i d� la v� b� m�t c�a Tr��ng Sinh B�t L�o ��n d��c cho Nh�t ph�m ���ng, c� nh�c ��n kim ��n tr�n gi� d� th� trong C� D��ng ��ng, ch�ng ta �� cho ng��i �i �i�u tra, trong C� D��ng ��ng qu� nhi�n c� d� th�, nh�ng ng�t n�i l�c �� kh�ng c� c�ch thu ph� d� th�, kh� m� l�y ���c kim ��n c�a n�. May m� b�n ta g�p 1 v� �n n�p trong ��ng t� x�ng l� C�n L�n l�o ��o Phi Th��ng ��o Nh�n. Ng��i n�y c� c�ch thu ph�c d� th�.",
	"(Kh�ng hay r�i, Phi Th��ng ��o Nh�n �� b� ta gi�t, �� ��ng ch�m v�i Nh�t ph�m ���ng. Ph�i b�nh t�nh l�i, nghe xem Nh�t ph�m ���ng c� h�nh ��ng g�.)",
	}

	TalkEx("task_020_02_0_2",strTalk);

end

--���Ի�
function task_020_02_0_2()

local strTalk = {
	"�, khi ��n C�n L�n th�m d� tin t�c ���c bi�t Phi Th��ng ��o Nh�n �� b� �u�i ra kh�i n�i, �n n�p � C� D��ng ��ng, nh�ng kh�n ngh� r�ng �ng ta bi�t c�ch thu ph�c C� D��ng th�.",
	"��ng v�y, Ph�p v��ng �� giao thi�p v�i �ng ta 1 l�n, l�o ��o �� ��ng � thu ph�c C� D��ng th� gi�p ch�ng ta v� ��ng � nghi�n c�u thu�c Tr��ng sinh b�t l�o. Ta �� ph�i S�t th� Oa Oa �i b�n b�c, nh� �ng ta thu ph�c C� D��ng th�, nh�ng ��n gi� v�n ch�a c� tin t�c, ng��i �� t�ng ��n C� D��ng ��ng, th�ng thu�c ��a h�nh, ng��i �i m�t chuy�n ph�i h�p v�i S�t th� Oa Oa, c�ng tr� gi�p Phi Th��ng ��o Nh�n thu ph�c d� th�, gi� ��y ng��i �� l� V� V�, tr�c ti�p ph�i h�p v�i S�t th� Oa Oa, c�ng tr� gi�p Phi Th��ng ��o Nh�n thu ph�c d� th�.",
	"Tu�n l�nh.",
	"(Ti�u r�i, n�u S�t th� Oa Oa ��n C� D��ng ��ng nh�ng kh�ng th�y b�ng d�ng c�a C� D��ng th� ��u v� ph�t hi�n thi th� c�a Phi Th��ng ��o Nh�n, Nh�t ph�m ���ng ��u bi�t ch� c� ta ch�m tr�n Phi Th��ng ��o Nh�n, th�n ph�n gi�n �i�p b� b�i l� th� m�i n� l�c c�a ta s� ti�u tan. Chi b�ng tr� kh� S�t th� Oa Oa, xem nh� l� tr� h�i cho d�n, nh�ng ng��i n�y kh�ng d� ��i ph�, ph�i l�m sao ��y? ��ng r�i, Vi�n B� kho�i t�ng b�t h�n chi b�ng h�i h�n c� k� s�ch g�. Kh�ng bi�t Vi�n B� kho�i c� � nha m�n Ph�ng T��ng kh�ng.)",
	}

	TalkEx("",strTalk);
	DelItem(2,0,728,1);--ɾȥα��ҩ��
	SetTask(TASK_XB_ID_01,52);
	TaskTip("��n nha m�n Ph�ng T��ng �i�u tra h�nh tung c�a Vi�n Phi V�n �� d� h�i vi�c gi�t S�t th� Oa Oa.");
	Msg2Player("��n nha m�n Ph�ng T��ng �i�u tra h�nh tung c�a Vi�n Phi V�n �� d� h�i vi�c gi�t S�t th� Oa Oa.");
	GivePlayerAward("Award_XB_46","Easy");
	GivePlayerExp(SkeyXibei,"wawashashou")
	add_xb_title(5);--һƷ�������ƺ�

end

--��δ�벶��Ի�
function task_020_02_1()

local strTalk = {
	"S�t th� Oa Oa ��n C� D��ng ��ng b�n b�c v�i Phi Th��ng ��o Nh�n, nh� �ng ta thu ph�c C� D��ng th�, nh�ng ��n gi� v�n ch�a c� tin t�c, ng��i �� t�ng ��n C� D��ng ��ng, th�ng thu�c ��a h�nh, ng��i �i m�t chuy�n ph�i h�p v�i S�t th� Oa Oa, c�ng tr� gi�p Phi Th��ng ��o Nh�n thu ph�c d� th�.",
	"(Ti�u r�i, S�t th� Oa Oa ��n C� D��ng ��ng th�n ph�n gi�n �i�p m� b� b�i l� th� m�i n� l�c c�a ta s� ti�u tan. Chi b�ng tr� kh� S�t th� Oa Oa, xem nh� l� tr� h�i cho d�n, nh�ng ng��i n�y kh�ng d� ��i ph�, ph�i l�m sao ��y? ��ng r�i, Vi�n B� kho�i t�ng b�t h�n chi b�ng h�i h�n c� k� s�ch g�. Kh�ng bi�t Vi�n B� kho�i c� � nha m�n Ph�ng T��ng kh�ng.)",
	}

	TalkEx("",strTalk);

end

--����貶��Ի�ѯ��Ԭ��������
function task_020_03_0()

local strTalk = {
	"<sex> l�i l� ng��i, ��n t�m Vi�n B� kho�i n�a h�?",
	"B� ��u ��i ca c� tr� nh� r�t t�t, kh�ng bi�t Vi�n B� kho�i c� � nha m�n kh�ng?",
	"Vi�n B� kho�i kh�ng c� l�c n�o r�nh, kh�ng b�t ph�m nh�n v� quy �n th� c�ng b� th��ng, �t khi n�o xu�t hi�n � nha m�n, � nha m�n tr�n d��i ��u kh�m ph�c t�c phong c�a Vi�n B� kho�i v� l�y �� l�m g��ng, x� �n kh�ng d�m khinh su�t. L�n n�y Vi�n B� kho�i ��n M� cung sa m�c th� l� �n.",
	"M� cung sa m�c l� n�i kh�ng m�t b�ng ng��i, c�ng x�y ra v� �n n�o sao?",
	"��i ��o ��c h�nh l�o �� tr�n tr�nh s� truy b�t c�a Vi�n B� kho�i, n�n tr�n v�o M� cung sa m�c. Nh�ng Vi�n B� kho�i d� g� tha cho h�n, c�ng v�o sa m�c truy b�t. ��c h�nh l�o �� t�i ngh� cao c��ng, to�n s� d�ng binh kh� k� qu�i, n�u ng��i mu�n t�m Vi�n B� kho�i th� ph�i c�n th�n t�n ��o t�c n�y.",
	"Ta �i t�m Vi�n B� kho�i, �a t� b� ��u ��i ca ch� gi�o.",
	}

	SetTask(TASK_XB_ID_01,53);
	TalkEx("",strTalk);
	TaskTip("��n M� cung sa m�c, t�m ���c ��c h�nh l�o �� th� s� t�m ���c Vi�n b� ��u.");
	Msg2Player("��n M� cung sa m�c, t�m ���c ��c h�nh l�o �� th� s� t�m ���c Vi�n b� ��u.");

end

--��δɱ���������ӺͲ���Ի�
function task_020_03_1()

local strTalk = {
	"Giang Nam ��i ��o ��c h�nh l�o �� tr�n tr�nh s� truy l�ng c�a Vi�n B� kho�i n�n tr�n v�o M� cung sa m�c. Vi�n B� kho�i c�ng v�o sa m�c truy b�t.",
	}

	TalkEx("",strTalk);

end

--���ƺ�«�Ի����Ǻ�«
function task_020_04_0()

local strTalk = {
	"B�ng h�u c� b�n k�o h� l� kh�ng?",
	"<sex> bi�t xem h�ng ��y, k�o h� l� c�a ta chua ng�t h�a quy�n v�o nhau, �n v�o gi�i kh�t l�i no b�ng. L� s� 1 c�a ��i T�ng ��. Nh�ng <sex> ��n kh�ng ��ng l�c, ta �� b�n h�t k�o h� l� l�m h�m nay cho ng��i t�m kho b�u sa m�c, b�n h� ��n ��y mua ��nh k�, ��y l� m�n �n v�a gi�i kh�t v�a l�t d� tuy�t nh�t � sa m�c. ��ng l�c h�m nay b�n h� xu�t ph�t. N�u <sex> mu�n mua th� ph�i ��i ��n mai, ta s� l�m c�i m�i cho.",
	"N�u ��i ��n mai qu� th�c kh�ng �n. ��m ng��i t�m kho b�u �i sa m�c r�i �? �ng bi�t b�n h� �� �i ���c m�y gi� r�i?",
	"B�n h� �i v�n ch�a l�u, ��u l� nh�ng kh�ch quen, �i t�m kho b�u sa m�cr�i, ch�c l� v�n ch�a �i xa, ch�a v�o s�u trong sa m�c ��u.",
	"B�a kh�c ta t�i mua k�o h� l� c�a b�ng h�u, c�o t�.",
	}

	SetTask(TASK_XB_ID_01,55);
	TalkEx("",strTalk);
	CreateTrigger(0,1238,KILL_XB_XUNBAOREN);--ɱ�ִ�����
	TaskTip("��n M� cung sa m�c c� th� t�m th�y 10 x�u k�o h� l� tr�n ng��i t�m kho b�u.");
	Msg2Player("��n M� cung sa m�c c� th� t�m th�y 10 x�u k�o h� l� tr�n ng��i t�m kho b�u.");

end

--δȡ��10�����Ǻ�«
function task_020_04_1()

local strTalk = {
	"B�n h� �i v�n ch�a l�u, ��u l� nh�ng kh�ch quen, �i t�m kho b�u sa m�cr�i, ch�c l� v�n ch�a �i xa, ch�a v�o s�u trong sa m�c ��u.",
	}

	if	GetTrigger(KILL_XB_XUNBAOREN) == 0 then
		CreateTrigger(0,1238,KILL_XB_XUNBAOREN);
		TaskTip("��n M� cung sa m�c c� th� t�m th�y 10 x�u k�o h� l� tr�n ng��i t�m kho b�u.");
		Msg2Player("��n M� cung sa m�c c� th� t�m th�y 10 x�u k�o h� l� tr�n ng��i t�m kho b�u.");
	end

	TalkEx("",strTalk);

end

---------------------------------- ������21��֧1_12��������----------------------------------
--ɱ������ɱ�ֺ�ؼ����ְ���
function task_021_01_0()

local strTalk = {
	"Vi�c l�n kh�ng hay r�i, C� D��ng th� �� xu�t hi�n, uy l�c v��t qu� s�c t��ng t��ng c�a ch�ng ta. Phi Th��ng ��o Nh�n t� cho r�ng c�ch thu ph�c C� D��ng th� c� th� l�m t�ng uy l�c c�a n�, �ng ta mu�n chi�m l�y C� D��ng th�.S�t th� Oa Oa s� r�ng d� nhi�u l�nh �t. Ta v�o trong ��ng b� C� D��ng th� t�n c�ng. C�ng may tho�t ���c, C� D��ng ��ng gi� ��y r�t nguy hi�m.",
	"C�i g�? R�t cu�c l� c� chuy�n g�? Phi Th��ng ��o Nh�n th� v�i ta r�ng b�o ��m c�ch thu ph�c C� D��ng th� tuy�t ��i kh�ng x�y ra sai s�t, gi� ��y l�i th�t th� b� m�ng c�ng l�m li�n l�y ��n Th�p ��i kim cang. S�t th� Oa Oa b� b� m�ng trong ��ng, ng��i t�n m�t ch�ng ki�n C� D��ng th� t�n c�ng S�t th� Oa Oa ��ng kh�ng?",
	"L�c ta v�o trong ��ng �� kh�ng th�y Phi Th��ng ��o Nh�n v� S�t th� Oa Oa ��u c�, ch� t�m th�y 1 l�nh b�i. C� D��ng th� th�t hung d�, c� s�c m�nh gh� g�m, s� r�ng �� l� H�a luy�n kim ��n c�a Phi Th��ng ��o Nh�n luy�n ra. N�u kh�ng th� cao th� nh� S�t th� Oa Oa, ngo�i C� D��ng th� b� c��ng h�a ra th� kh�ng c�n ai ��i ��u n�i?",
	"S�t th� Oa Oa tuy h�nh d�ng nh� tr� con, nh�ng v� v� c�ng ch� ��ng sau Th�c B�t Ho�ng . L�n n�y th�t b�i, ch� s� h�n tr� tay kh�ng k�p, vi�c n�y t�m th�i d�ng l�i, ta s� cho ng��i v�o ��ng �i�u tra. C� D��ng th� xu�t hi�n C� D��ng ��ng c�ng nguy hi�m h�n, Tr��ng Sinh B�t L�o ��n c�n b�n b�c k� h�n. Nh�t ph�m ���ng l�i m�t �i m�t tr� th�, Th�p ��i kim cang �� th��ng vong h�n m�t n�a, h�nh ��ng l�n n�y xem nh� l� ���c m�t m�t m��i. H�nh ��ng l�n n�y �� l�m suy gi�m th�c l�c t�ch l�y �� nhi�u n�m c�a Nh�t ph�m ���ng, t�n th��ng nguy�n kh�.",
	}

	if GetTask(TASK_GET_AWARD) == 1 then
		task_021_01_0_4()
		return 0;
	end

	TalkEx("task_021_01_0_1",strTalk);

end

--���Ի�
function task_021_01_0_1()

local strTalk = {
	"Nh�t ph�m ���ng c� nhi�u nh�n t�i, l�i th�m cao th� s� m�t T�y H� l� Th�c B�t Ho�ng , s�c m�nh kh�ng l��ng ���c.",
	"Ta kh�ng mu�n l�m m�t uy phong c�a m�nh, vi�c �� ��n n��c n�y. C�n Th�c B�t Ho�ng  t� cho r�ng c� L� Nguy�n Kh�nh ��i nh�n n�ng �� th� coi nh� nhi�m v�. Ta c� nghe Th�c B�t Ho�ng  mua chu�c T� M� Minh Phong kh�ng th�nh, nh�ng l�i b� T� M� Minh Phong d�ng t� y�u m� ho�c, mu�n ph�n b�i l�i Nh�t ph�m ���ng. L� Nguy�n Kh�nh ��i nh�n �� �� � ��n chuy�n n�y. Th�c B�t Ho�ng  l�n n�y l� t� t�o nghi�t.",
	"C� chuy�n n�y sao? Th�c B�t Ho�ng  nh�n l�nh mua chu�c T� M� Minh Phong, sao l�i b� h�n x�i gi�c r�i?",
	}

	TalkEx("task_021_01_0_2",strTalk);

end

--���Ի�
function task_021_01_0_2()

local strTalk = {
	"Ta c�ng kh�ng r� n�a. T�m l�i l� Th�c B�t Ho�ng  �� c� � ph�n b�i Nh�t Ph�m ���ng n�n t�i kh�ng th� tha. Ng��i h�y �em Thu�c d��c nh�n cho h�n u�ng.",
	"Ta �i t�m Th�c B�t Ho�ng ��y.",
	"(Thu�c d��c nh�n n�y kh�ng c� t�c d�ng, quan h� c�a Th�c B�t ti�n b�i v� Nh�t Ph�m ���ng �� ��n h�i gay c�n. N�u Xa Lu�n B� V��ng ph�i ng��i ��n C� D��ng ��ng �i�u tra s� l� th� th�n ph�n gi�n �i�p c�a ta s� b� l�. Hay l� �i �i�u tra xem xu h��ng hi�n t�i c�a Nh�t Ph�m ���ng.)",
	}

	TalkEx("task_021_01_0_3",strTalk);

end

--������
function task_021_01_0_3()

	give_wp_award(49);

end

--�ɹ���ȡ������ִ��
function task_021_01_0_4()

	DelItem(2,0,754,1);--ɾȥ��������
	AddItem(2,0,731,1,1);--�õ�ҩ��ҩ
	SetTask(TASK_XB_ID_01,57);
	GivePlayerAward("Award_XB_49","Easy");
	GivePlayerExp(SkeyXibei,"jisha")
	TaskTip("T�m Th�c B�t Ho�ng, t�m c�ch che gi�u th�n ph�n gi�n �i�p �� d� la th�m tin t�c c�a Nh�t Ph�m ���ng.");
	Msg2Player("T�m Th�c B�t Ho�ng, t�m c�ch che gi�u th�n ph�n gi�n �i�p �� d� la th�m tin t�c c�a Nh�t Ph�m ���ng.");

end;

--δ���ذκ�Ի�
function task_021_01_1()

local strTalk = {
	"Th�c B�t Ho�ng  �� c� � ph�n b�i Nh�t Ph�m ���ng n�n t�i kh�ng th� tha. Ng��i h�y �em Thu�c d��c nh�n cho h�n u�ng.",
	}

	TalkEx("",strTalk);

end

--���ذκ�Ի�
function task_021_02_0()

local strTalk = {
	"Th� ra l� ng��i, Xa Lu�n B� V��ng sai ng��i ��n �� thu ph�c ta, ti�c l� ta kh�ng th� c�ng ng��i ��nh m�t tr�n cho ��.",
	"Trong Nh�t Ph�m ���ng ch� c� ti�n b�i l� ��ng k�nh, sao ta l�i c� thӅ",
	"� ta �� quy�t ng��i ch� nhi�u l�i. Ta v� T� M� Minh Phong quy�t ��u 3 ng�y 3 ��m tr�n ��nh Hoa S�n t� �� �� th�c t�nh. Ta t�ng ngh� r�ng gia nh�p Nh�t Ph�m ���ng s� g�p ���c cao th� �� ���c th�a l�ng.",
	"Ch�ng ph�i Th�c B�t ti�n b�i �� n�i, Nh�t Ph�m ���ng �� gi�p ng��i t�m ���c r�t nhi�u cao th� hay sao?",
	"�� ch� l� c�i c� �� b�nh tr��ng th� l�c c�a Nh�t ���ng th�i. B�nh sinh ta lu�n k�nh tr�ng nh�ng ng��i c� ch� h�c v�, c�n Nh�t Ph�m ���ng ch� mu�n c� ���c v� l�c c�a h�, sau khi chi�u m� v�o ���ng th� giao cho c�c nhi�m v� �m s�t, ho�c x�i gi�c l�i k�o, ho�c ph� ho�i, ch� to�n c�c h�nh ��ng b�c h�i ��c �c. Ta c�m th�y t�i l�i v� �� k�o nh�ng cao th� v� l�m n�y v�o th� gi�i �en t�i c�a Nh�t Ph�m ���ng.",
	}

	TalkEx("task_021_02_0_1",strTalk);

end

--���Ի�
function task_021_02_0_1()

local strTalk = {
	"Th�c B�t ti�n b�i xin ��ng t� tr�ch m�nh, m�i vi�c ��u do Nh�t Ph�m ���ng�",
	"Trong s� c�c cao th� c�ng kh�ng �t ng��i c� th� tr� th�nh tri k� nh� T� M� Minh Phong, nh�ng ��u ph�n b�i ho�c b� tr� kh�. M�i ��y L� Nguy�n Kh�nh �� t�i t�m ta, mu�n ta th�i ��u v�i T� M� Minh Phong, b�i h�n �� kh�ng c�n nh�n n�i ���c n�a. T� M� Minh Phong �� kh�ng c�n ���C Nh�t Ph�m ���ng ch�p nh�n, n�u c� T� M� Minh Phong c�ng b� h�i, th� thi�n h� c�n ai hi�u ���c Th�c B�t Ho�ng? M�c ��ch ban ��u c�a ta �� b� l�ch h��ng, L� Nguy�n Kh�nh c�ng kh�ng c�n v� n� �n x�a, ta h� t�t ph�i bi�n m�nh th�nh con c� trong tay k� kh�c? Ta �� n�i h�t l�i, ���c ch�t d��i tay ng��i c�ng l� m�t s� may m�n, ra tay �i.",
	"Xem ra Th�c B�t ti�n b�i �� h� quy�t t�m, v�y th� t�t qu�. T� ng�y k�t giao v�i ti�n b�i ��n nay, ta ��u th�y ti�c cho ng��i, m�t n�i x�u xa �en t�i nh� Nh�t Ph�m ���ng l�m sao x�ng ��ng v�i m�t ��ng anh h�o nh� th�? Nh�ng gi� th� ta �� hi�u r� ng�n ng�nh. Ti�n b�i y�n t�m, ta kh�ng c� � h�i ng��i ��u, h�n n�a d��c nh�n d��c n�y l� do ta ph��ng thu�c gi� �� t�o ra.",
	"...Ch� tr�ch g�n ��y Nh�t Ph�m ���ng lu�n g�p tr� ng�i, ra ��u do <sex> c�. Ta kh�m ph�c t�i tr� v� d�ng kh� c�a ng��i, ta t��ng ch�ng �� bu�ng xu�i kh�ng ng� l�i g�p ���c m�t tri k� nh� ng��i.",
	"Sao ti�n b�i l�i n�i v�y? V�t th��ng c�a ti�n b�i sau v�i ng�y s� kh�i, r�t kh�i Nh�t Ph�m ���ng th� th�t l� ti�c.",
	}

	TalkEx("task_021_02_0_2",strTalk);

end

--���Ի�
function task_021_02_0_2()

local strTalk = {
	"Ng��i c� �i�u kh�ng bi�t r�i, kh�ng ai ph�n b�i Nh�t Ph�m ���ng m� c� th� s�ng s�t, ch�ng l�p n�n Ng� h�nh s� l� �� ti�u di�t ph�n ��. Chuy�n ta k�t ngh�a v�i T� M� Minh Phong �� b� L� Nguy�n Kh�nh bi�t ���c, h�n �� ra l�nh l�y m�ng c�a ta, l�n n�y ta ch�t ch�c r�i.",
	"Ng� h�nh tr�n l� g� m� v�i s�c c�a ti�n b�i c�ng kh�ng ph� ���c?",
	"Ng� h�nh tr�n chuy�n �� thanh l� m�n h� sao c� th� d� d�ng ph� ���c? D� ta c� �i hay kh�ng c�ng ph�i ch�u ch�t. Ng��i ph�i c�n th�n kh�ng �� l� th�n ph�n n�u kh�ng ch�ng s� ��i ph� ng��i.",
	"Ti�n b�i, tr�i kh�ng tuy�t ���ng s�ng c�a ng��i, Ng� h�nh tr�n n�y s�m mu�n ta c�ng ph�i ��i di�n, chi b�ng b�y gi� �i ti�u di�t n� �� ti�n b�i c� th� h�t l�ng v�i v� thu�t, th� kh�ng t�t sao?",
	"Ng� h�nh tr�n kh�ng th� ph� b�i s�c c�a 1 ng��i nh�ng ng��i c� th� t�m b�n ��ng h�nh. Ng� h�nh tr�n � trong sa m�c khi th�y L�nh b�i c�a ta th� Ng� h�nh tr�n s� s� d�n ng��i v�o trong Ng� h�nh tr�n, trong �� c� 5 ng��i, ng��i ph�i c�n th�n. Ng��i nh�t ��nh ph�i gi� m�ng �� tr� v� ��u v�i ta 1 tr�n.",
	"Ti�n b�i �� d�n sao d�m kh�ng nghe?",
	}

	TalkEx("",strTalk);
	DelItem(2,0,731,1);--ɾȥҩ��ҩ
	SetTask(TASK_XB_ID_01,58);
	AddItem(2,0,755,1,1);--һƷ�ذ���
	TaskTip("��n m� cung sa m�c t�m Ng� h�nh tr�n s� xu�t tr�nh l�nh b�i �� d�n Ng� h�nh s� ra.");
	Msg2Player("��n m� cung sa m�c t�m Ng� h�nh tr�n s� xu�t tr�nh l�nh b�i �� d�n Ng� h�nh s� ra.");
	GivePlayerAward("Award_XB_50","Easy");
	GivePlayerExp(SkeyXibei,"panzhe")
end

--δɱ������ʹ�Ի�
function task_021_02_1()

local strTalk = {
	"Ng� h�nh tr�n kh�ng th� ph� b�i s�c c�a 1 ng��i nh�ng ng��i c� th� t�m b�n ��ng h�nh. Ng� h�nh tr�n � trong sa m�c khi th�y L�nh b�i c�a ta th� Ng� h�nh tr�n s� s� d�n ng��i v�o trong Ng� h�nh tr�n, trong �� c� 5 ng��i, ng��i ph�i c�n th�n. Ng��i nh�t ��nh ph�i gi� m�ng �� tr� v� ��u v�i ta 1 tr�n.",
	}

	TalkEx("",strTalk);

	--�����ذ���������Ʒ
	if GetItemCount(2,0,755) < 1 then
		AddItem(2,0,755,1,1);--һƷ�ذ���
		TaskTip("��n m� cung sa m�c t�m Ng� h�nh tr�n s� xu�t tr�nh l�nh b�i �� d�n Ng� h�nh s� ra.");
		Msg2Player("��n m� cung sa m�c t�m Ng� h�nh tr�n s� xu�t tr�nh l�nh b�i �� d�n Ng� h�nh s� ra.");
	end

end

--�Ѿ���ȡ���񵫻�δȡ���ذ���Ի�
function task_021_03_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(WuXingShi_MapData));
local xWPos,yWPos,xPos,yPos = WuXingShi_MapData[nMapDataIndex][1],WuXingShi_MapData[nMapDataIndex][2],WuXingShi_MapData[nMapDataIndex][3],WuXingShi_MapData[nMapDataIndex][4]
local nNpcIndex1,nNpcIndex2,nNpcIndex3,nNpcIndex4,nNpcIndex5 = 0,0,0,0,0;

	--���������ʧ����Ҫ��30���Ӳ�������ˢ������ʹ
	if GetTime()-GetTask(CREAT_YAOWANG_TIME)	>= 1800 then

		strTalk = {
			"Ng��i l� ai?",
			"Ta l� ng��i khi�u chi�n, th� c�ng kh�ng nh�n ra sao?",
			"Qu� l� gan d�!",
			}

		DelItem(2,0,755,1);--ɾ��һƷ�ذ���
		SetTask(CREAT_WUXINGSHI_TIME,GetTime());--��¼����ʹˢ��ʱ��
		nNpcIndex1 = CreateNpc("Ng� H�nh S� Kim","Ng� H�nh S� Kim",506,xWPos,yWPos,-1,1,1,70);
		nNpcIndex2 = CreateNpc("Ng� H�nh S� M�c","Ng� H�nh S� M�c",506,xWPos,yWPos,-1,1,1,70);
		nNpcIndex3 = CreateNpc("Ng� H�nh S� Th�y","Ng� H�nh S� Th�y",506,xWPos,yWPos,-1,1,1,70);
		nNpcIndex4 = CreateNpc("Ng� H�nh S� H�a","Ng� H�nh S� H�a",506,xWPos,yWPos,-1,1,1,70);
		nNpcIndex5 = CreateNpc("Ng� H�nh S� Th�","Ng� H�nh S� Th�",506,xWPos,yWPos,-1,1,1,70);
		SetNpcScript(nNpcIndex1,"\\script\\������\\ɳĮ�Թ�\\npc\\����ʹ��.lua");
		SetNpcScript(nNpcIndex2,"\\script\\������\\ɳĮ�Թ�\\npc\\����ʹľ.lua");
		SetNpcScript(nNpcIndex3,"\\script\\������\\ɳĮ�Թ�\\npc\\����ʹˮ.lua");
		SetNpcScript(nNpcIndex4,"\\script\\������\\ɳĮ�Թ�\\npc\\����ʹ��.lua");
		SetNpcScript(nNpcIndex5,"\\script\\������\\ɳĮ�Թ�\\npc\\����ʹ��.lua");
		SetNpcLifeTime(nNpcIndex1,1500);
		SetNpcLifeTime(nNpcIndex2,1500);
		SetNpcLifeTime(nNpcIndex3,1500);
		SetNpcLifeTime(nNpcIndex4,1500);
		SetNpcLifeTime(nNpcIndex5,1500);

		Msg2Player("Ng� h�nh s� xu�t hi�n �  "..xPos..", "..yPos.." , h�y mau �i ti�u di�t h�n.")
		TaskTip("Ng� h�nh s� xu�t hi�n �  "..xPos..", "..yPos.." , h�y mau �i ti�u di�t h�n.");

	else

		strTalk = {
			"�",
			"Th�i gian Ng� h�nh s� xu�t hi�n c�ch nhau 30 ph�t, h�y ��i ch�t �i!"
			}

	end

	TalkEx("",strTalk);

end

--�Ѿ���ȡ���񵫻�δȡ���ذ���Ի�
function task_021_03_1()

local strTalk = {
	"�",
	"�",
	};

	TalkEx("",strTalk);

end

--�Ѿ�ɱ������ʹ���ؿ��ӿڿ���
function task_021_03_2()

local strTalk = {
	"V� c�ng c�a c�c h� qu� l� tuy�t v�i.",
	};

	TalkEx("",strTalk);

end


--�Ѿ��������ʹ���ذκ�Ի�
function task_021_04_0()

local strTalk = {
	"G�p <sex> quay v�, bi�t ng��i �� ph� ���c Ng� h�nh tr�n, Ng� H�nh S� kh�ng ph�i l� ��i th� c�a ng��i, ta r�t mu�n ���c giao ��u v�i ng��i. Ng��i �� c�u m�ng Th�c B�t Ho�ng, �n n�y kh�ng bi�t ph�i tr� th� n�o.",
	"Ti�n b�i �� coi ta l� ng��i quen, kh�ng c�n ph�i c�m �n. Khi n�o ti�n b�i Th�c B�t kh�e l�i, s� ��n th�nh gi�o B�n.",
	"Ha ha, ��ng kh�ch s�o. L�u r�i ta kh�ng ���c tho�i m�i nh� h�m nay, kh�ng b� r�ng bu�c, l� ��o t� nhi�n, l� ��o v� h�c, r�t t�t. Nh�ng T�y H� Ph�p V��ng s�p ��n sa m�c, l�n n�y ch�c c� chuy�n, ng��i ph�i th�n tr�ng.",
	}

	TalkEx("task_021_04_0_1",strTalk);

end

--���Ի�
function task_021_04_0_1()

local strTalk = {
	"�m. Ti�n b�i c� tin c�a Nh�t Ph�m ���ng g�n ��y kh�ng?",
	"L�u nay ta c�m th�y Nh�t Ph�m ���ng kh�ng c�n tin ta n�a, nhi�u b� m�t �ang ���c gi� k�n. Chuy�n B�n �� S�n H� X� T�c ch�a c� k�t qu�, c�n ph��ng thu�c c�a h� c�ng l� gi�. L�n n�y h�nh ��ng c�a Ph�ng T��ng ph� m��i ph�n c� ��n t�m ch�n ph�n �� x�i h�ng b�ng kh�ng. N�u Xa Lu�n B� V��ng  bi�t ng��i l� gi�n �i�p, e r�ng to�n b� cao th� Trung Nguy�n thu nh�n l�n n�y c�ng ch�ng l�m ���c g�. Nh� v�y ti�ng t�m c�a h�n s� b� Nh�t Ph�m ���ng h� th�p v� s� b� ph�n c�ng. Ng��i ph�i lo�i b� �i�u n�y tr��c khi h�n ra tay.",
	"Xa Lu�n B� V��ng l�n n�y ch�c ch�n s� ch�u kh�ng �t tr�ch nhi�m cho l�n th�t tr�ch n�y. Kh�ng bi�t c�n c� �m m�u g� sau l�ng h�n kh�ng, ta c�ng c�m th�y Xa Lu�n B� V��ng s� b�o th� Nh�t Ph�m ���ng, th�m ch� g�y h�a cho c� trung nguy�n. �a t� ti�n b�i Th�c B�t �� nh�c nh�, Xa Lu�n B� V��ng ch�c s� tr� ���c n� v� quay v�.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,743,1);--ɾȥ�ذ���
	SetTask(TASK_XB_ID_01,60);
	TaskTip("K� l�m n�i �ng ch�c �� b� v�ch tr�n, �� ��n l�c quy�t chi�n m�t tr�n v�i Xa Lu�n B� V��ng.");
	Msg2Player("K� l�m n�i �ng ch�c �� b� v�ch tr�n, �� ��n l�c quy�t chi�n m�t tr�n v�i Xa Lu�n B� V��ng.");
	GivePlayerAward("Award_XB_51","Easy");
	GivePlayerExp(SkeyXibei,"wuxingzhen")
end

--δ��ܳ��ְ���
function task_021_04_1()

local strTalk = {
	"H�nh ��ng l�n n�y c�a Xa Lu�n B� V��ng  t�i Ph�ng T��ng ph� m��i ph�n c� ��n t�m ch�n ph�n �� b� ng��i ph� h�ng, ch�c s� kh�ng d� ch�u thua, ng��i ph�i ra tay tr��c khi h�n h�nh ��ng.",
	}

	TalkEx("",strTalk);

end

---------------------------------- ������22��֧1_13��Į����----------------------------------
--�복�ְ����Ի�������ս��
function task_022_01_0()

local nNpcIndex = GetTargetNpc();
local strTalk = {
	"Ha ha ha, ��ng l� thu�c gi�, ��ng l� m��n dao gi�t ng��i. Ng��i c�n d�m quay v� g�p ta �? Ng��i ch�t �i.",
	}

	if nNpcIndex == nil then
		return
	end

	TalkEx("#task_022_01_1("..nNpcIndex..")",strTalk);
	TaskTip("H�y quy�t chi�n m�t tr�n v�i Xa Lu�n B� V��ng.");
	Msg2Player("H�y quy�t chi�n m�t tr�n v�i Xa Lu�n B� V��ng.");

end

--ת�����ְ���ս��״̬
function task_022_01_1(nNpcIndex)

	ChangeNpcToFight(nNpcIndex);

end

--��ܳ��ְ���������Ի�
function task_022_01_2()

local strTalk = {
	"Ng�y t�n c�a T�ng tri�u kh�ng c�n xa, Trung nguy�n s�m mu�n g� c�ng l� thi�n h� c�a T�y H�. Ha ha ha.",
	}

	TalkEx("",strTalk);

end



--�㱨ŷ����ɳĮ����һ��
function task_022_02_0()

local strTalk = {
	"Ti�n b�i, Nh�t Ph�m ���ng �� bi�t r� th�n ph�n ta, th�c l�c c�a Nh�t Ph�m ���ng g�n nh� �� ti�u hao h�t. Xa Lu�n B� V��ng c�ng b� ta ��nh b�i, nh�ng h�n lu�n mi�ng n�i c�n, n�o l� �o gi�c sa m�c s�p th�n t�nh ��i T�ng, ��i T�ng s�p di�t vong.",
	"�o gi�c sa m�c? Ta ch�a t�ng nghe qua, nh�ng ��y l� �i�u nh�ng nh� bu�n �i qua sa m�c ho�c ng��i ��n sa m�c t�m b�u v�t n�i. �o gi�c l� chuy�n c� th�t, nh�ng ng��i l�i n�i ch�a t�ng nghe ��n. Th�n ph�n ng��i �� b� Nh�t Ph�m ���ng bi�t r�, c� l� ng��i �ang g�p nguy hi�m?",
	"Ng� h�nh s�, ng��i b� Nh�t Ph�m ���ng truy s�t c�ng �� b� tr� kh�, ch�c kh�ng qu� nguy hi�m. Nh�ng �o gi�c sa m�c d��ng nh� �n ch�a nhi�u b� m�t. T�y H� Ph�p V��ng d��ng nh� �ang thao t�ng ph�a sau.",
	"Ng��i r�t lui ta th�t y�n t�m. T�y H� Ph�p V��ng kh�ng th� coi th��ng, �o gi�c sa m�c l� th� v� h�nh, n�u ���c T�y H� Ph�p V��ng d�ng, h�u qu� s� kh� l��ng. H�y �i h�i ng��i c�a C�n L�n ph�i, c� l� h� bi�t ���c b� m�t.",
	"�� T� C�n L�n c� l� bi�t ���c b� m�t. H�y h�i �ng ta. Ta xin c�o t�.",
	}

	SetTask(TASK_XB_ID_01,62);
	TalkEx("",strTalk);
	TaskTip("H�y ��n C�n L�n h�i Di�p T� Thu v� �o gi�c sa m�c.");
	Msg2Player("H�y ��n C�n L�n h�i Di�p T� Thu v� �o gi�c sa m�c.");
	GivePlayerAward("Award_XB_52","Easy");
	GivePlayerExp(SkeyXibei,"poxiangzhifa")
end

--��δѯ��Ҷ�������ɳĮ����һ��
function task_022_02_1()

local strTalk = {
	"Ng��i c�a C�n L�n ph�i c� l� bi�t b� m�t c�a �o gi�c sa m�c, ng��i h�y ��n �� h�i.",
	"�� T� C�n L�n c� l� bi�t ���c b� m�t. H�y h�i �ng ta. Ta xin c�o t�.",
	}

	TalkEx("",strTalk);

end

---------------------------------- ������23��֧1_14��ɳ��Ļ----------------------------------
--ѯ��Ҷ�������ɳĮ���������
function task_023_01_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"\'B� t�nh c� n�n, ��i ��o b�t h�ng, ��i ngh�a quy �n, th� h�t l�ng tu ��o thu�t, tr� � u�, gi�ng y�u ma, thi�n h� th�i b�nh\'. Ng��i c� chuy�n chi c�n g�p ta?",
			"Di�p thi�u hi�p v�n sung s�c nh� x�a. C� �i�u n�y mu�n h�i, thi�u hi�p c� bi�t trong sa m�c c� �o gi�c kh�ng? Kh�ng bi�t �o gi�c sa m�c n�y l� g�?",
			"Ng��i n�i ��n Ch�n l�u trong sa m�c �? Nh�ng ngu�n g�c kh�ng r� r�ng, c�ng kh�ng c� s�c m�nh. Nh�ng n�u b� kh�ng ch�, s� g�i ���c Ch�n trong truy�n thuy�t xa x�a. �o gi�c m� Ch�n t�o ra c� th� bi�n ra nhi�u h�nh d�ng kh�c nhau, c� th� th�n t�nh tr�i ��t. N�u l�n n�y n� xu�t hi�n, s� kh� thu ph�c, v� h�nh d�ng th�t c�a ch�ng kh� t�m, c� th� g�y ��i h�a.",
			"Qu� ��ng Xa Lu�n B� V��ng  kh�ng phao tin gi�t g�n. Di�p thi�u hi�p, Nh�t Ph�m ���ng �� ph�i T�y H� Ph�p V��ng �i kh�ng ch� �o gi�c, c�n khoe khoang mu�n d�ng �o gi�c th�n t�nh Trung Nguy�n, g�y h�a chi�n tranh.",
			}
	else
		strTalk = {
			"\'B� t�nh c� n�n, ��i ��o b�t h�ng, ��i ngh�a quy �n, th� h�t l�ng tu ��o thu�t, tr� � u�, gi�ng y�u ma, thi�n h� ���c th�i b�nh. \' <sex> c� kh�e kh�ng?",
			"Di�p thi�u hi�p v�n sung s�c nh� x�a. C� �i�u n�y mu�n h�i, thi�u hi�p c� bi�t chuy�n trong sa m�c c� �o gi�c kh�ng? Kh�ng bi�t �o gi�c sa m�c n�y l� g�?",
			" <sex> n�i ��n Ch�n l�u trong sa m�c �? N� c� ngu�n g�c kh�ng r� r�ng, c�ng kh�ng c� s�c m�nh. Nh�ng n�u b� kh�ng ch�, s� g�i ���c Ch�n trong truy�n thuy�t xa x�a. �o gi�c m� Ch�n t�o ra c� th� bi�n th�nh nhi�u h�nh d�ng kh�c nhau, c� th� th�n t�nh tr�i ��t. N�u n� xu�t hi�n, s� kh� thu ph�c, v� h�nh d�ng th�t c�a n� kh� t�m, c� th� g�y ��i h�a.",
			"Qu� ��ng Xa Lu�n B� V��ng  kh�ng phao tin gi�t g�n. Di�p thi�u hi�p, Nh�t Ph�m ���ng �� ph�i T�y H� Ph�p V��ng �i kh�ng ch� �o gi�c, c�n khoe khoang mu�n d�ng �o gi�c th�n t�nh Trung Nguy�n, g�y h�a chi�n tranh.",
			}
	end

	TalkEx("task_023_01_0_1",strTalk);

end

--���Ի�
function task_023_01_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"�o gi�c sa m�c tuy m�nh, nh�ng kh�ng th� th�n t�nh ���c c� tr�i ��t n�y. Nh�ng th�n t�nh c� sa m�c, m� ho�c l�ng ng��i, ��u ��c qu�n ��i qu� l� d� s�c. Mu�n ��i ph� v�i Ch�n �� b� kh�ng ch�, ph�i t�m ���c nguy�n h�nh c�a n�. Nguy�n h�nh c�a Ch�n kh�ng hi�n ra s� kh� ��i ph�, tr� phi t�m ���c ph�p kh� phong �n c�a ng��i kh�ng ch� Ch�n.",
			"Ph�p kh� phong �n n�y ch�c l� c�a T�y H� Ph�p V��ng. Ph�i ��i ph� th� n�o?",
			"�o gi�c sa m�c kh�ng d� ��i ph�, n�u c� Ph�p kh� phong �n, �o gi�c s� bi�n ra nhi�u h�nh d�ng, n�u ng��i ��nh b�i, n� s� hi�n hi�n nguy�n h�nh Ch�n, mu�n ��nh b�i Ch�n, ph�i s� d�ng Phong y�u th�p n�y ni�m L�i nguy�n�� thu ph�c n�, n�u kh�ng n� s� l�n tr�n m�t t�m. Mu�n ��i ph� v�i n� c�ng kh�ng c�n c� h�i n�a.",
			"D�m h�i L�i nguy�n phong �n n�y l� g� v�y?",
			}
	else
		strTalk = {
			"�o gi�c sa m�c tuy m�nh, nh�ng kh�ng th� th�n t�nh ���c c� tr�i ��t n�y. Nh�ng th�n t�nh c� sa m�c, m� ho�c l�ng ng��i, ��u ��c qu�n ��i qu� l� d� s�c. Mu�n ��i ph� v�i Ch�n �� b� kh�ng ch�, ph�i t�m ���c nguy�n h�nh c�a n�. Nguy�n h�nh c�a Ch�n kh�ng hi�n ra s� kh� ��i ph�, tr� phi t�m ���c ph�p kh� phong �n c�a ng��i kh�ng ch� Ch�n.",
			"Ph�p kh� phong �n n�y ch�c l� c�a T�y H� Ph�p V��ng. Ph�i ��i ph� th� n�o?",
			"�o gi�c sa m�c b� kh�ng ch� kh�ng d� ��i ph�, n�u c� Ph�p kh� phong �n, �o gi�c s� bi�n th�nh nhi�u h�nh d�ng, n�u ng��i ��nh b�i, n� s� hi�n hi�n nguy�n h�nh Ch�n, ��nh b�i Ch�n, ph�i s� d�ng phong y�u th�p n�y ni�m l�i nguy�n�� thu ph�c n�, n�u kh�ng n� s� l�n tr�n m�t t�m. Mu�n ��i ph� v�i n� c�ng kh�ng c�n c� h�i n�a.",
			"D�m h�i L�i nguy�n phong �n n�y l� g� v�y?",
			}
	end

	TalkEx("task_023_01_0_2",strTalk);

end

--���Ի�
function task_023_01_0_2()

local nCruseIndex = random(1,getn(HUANXIANG_CURSE));
local strTalk = {}

	SetTask(HUANGXIANG_CURSE_ID,nCruseIndex);

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng��i ph�i nh� "..HUANXIANG_CURSE[nCruseIndex].." , ��y l� l�i nguy�n phong �n, kh�ng ���c nh� sai, n�u kh�ng s� ph� c�ng nh�c s�c!",
			"Th� ra l� v�y, �o gi�c sa m�c l�i kh� ��i ph� nh� v�y, kh�ng bi�t �o gi�c th��ng xu�t hi�n n�i n�o?",
			"Cu�i sa m�c th��ng c� �o gi�c xu�t hi�n, nh�ng kh�ng c� h��ng �� t�m Sa m�c, kh� nh�n ra ���ng �� �i ��n cu�i, nh�ng ta t�nh c� quen v�i B�ch Thi�n Th�nh, ng��i t�m b�u v�t � sa m�c, �ng ta n�m n�o c�ng ��n sa m�c, bi�t r� sa m�c nh� l�ng b�n tay, ng��i h�y �i t�m �ng ta, �ng ta c� th� s� d�n ng��i ��n cu�i sa m�c.",
			"Th� ra l� v�y, �a t� ��i s� huynh. Ta s� �i t�m ph�p kh� phong �n, kh�ng �� cho �o gi�c sa m�c h�i ��i.",
			}
	else
		strTalk = {
			"Ng��i ph�i nh� "..HUANXIANG_CURSE[nCruseIndex].." , ��y l� l�i nguy�n phong �n, kh�ng ���c nh� sai, n�u kh�ng s� ph� c�ng nh�c s�c!",
			"Th� ra l� v�y, �o gi�c sa m�c l�i kh� ��i ph� nh� v�y, kh�ng bi�t �o gi�c th��ng xu�t hi�n n�i n�o?",
			"Cu�i sa m�c th��ng c� �o gi�c xu�t hi�n, nh�ng kh�ng c� h��ng �i ��n Sa m�c, kh� nh�n ra ���ng �� �i ��n cu�i, nh�ng ta t�nh c� quen v�i B�ch Thi�n Th�nh, ng��i t�m b�u v�t � sa m�c, �ng ta n�m n�o c�ng ��n sa m�c, bi�t r� sa m�c nh� l�ng b�n tay, ng��i h�y �i t�m �ng ta, �ng ta s� d�n ng��i ��n cu�i sa m�c.",
			"Th� ra l� v�y, �a t� Di�p thi�u hi�p �� cho ta bi�t nhi�u tin c� �ch nh� v�y. Ta s� �i t�m ph�p kh� phong �n, kh�ng �� cho �o gi�c sa m�c h�i ��i.",
			}
	end

	TalkEx("",strTalk);
	AddItem(2,0,732,1,1);--�õ�������
	SetTask(TASK_XB_ID_01,63);
	TaskTip("��n D��c V��ng C�c ��nh b�i T�y H� Ph�p V��ng ��at ph�p kh� phong �n.");
	Msg2Player("��n D��c V��ng C�c ��nh b�i T�y H� Ph�p V��ng ��at ph�p kh� phong �n.");

end

--��δ������ķ���
function task_023_01_1()

local strTalk = {}
local nCruseIndex = GetTask(HUANGXIANG_CURSE_ID);

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Mu�n ��i ph� v�i �o gi�c sa m�c ph�i t�m ���c Ph�p kh� phong �n, c�n ph�i t�m B�ch Thi�n Th�nh, ng��i t�m b�u v�t � sa m�c d�n ng��i ��n cu�i sa m�c, m�i th�y ���c �o gi�c.",
			"Ng��i ph�i nh� "..HUANXIANG_CURSE[nCruseIndex].." , ��y l� l�i nguy�n phong �n, kh�ng ���c nh� sai, n�u kh�ng s� ph� c�ng nh�c s�c!",
			}
	else
		strTalk = {
			"Mu�n ��i ph� v�i �o gi�c sa m�c ph�i t�m ���c Ph�p kh� phong �n, c�n ph�i t�m B�ch Thi�n Th�nh, ng��i t�m b�u v�t � sa m�c d�n ng��i ��n cu�i sa m�c, m�i th�y ���c �o gi�c.",
			"Ng��i ph�i nh� "..HUANXIANG_CURSE[nCruseIndex].." , ��y l� l�i nguy�n phong �n, kh�ng ���c nh� sai, n�u kh�ng s� ph� c�ng nh�c s�c!",
			}
	end

	--����������
	if GetItemCount(2,0,732) < 1 then
		AddItem(2,0,732,1,1);--�õ�������
	end

	TalkEx("",strTalk);

end

--��δ��ܻ���֮ǰ��Ҷ����Ի����������
function task_023_01_2()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Mu�n ��i ph� v�i �o gi�c sa m�c ph�i t�m ���c Ph�p kh� phong �n, c�n ph�i t�m B�ch Thi�n Th�nh, ng��i t�m b�u v�t � sa m�c d�n ng��i ��n cu�i sa m�c, m�i th�y ���c �o gi�c.",
			}
	else
		strTalk = {
			"Mu�n ��i ph� v�i �o gi�c sa m�c ph�i t�m ���c Ph�p kh� phong �n, c�n ph�i t�m B�ch Thi�n Th�nh, ng��i t�m b�u v�t � sa m�c d�n ng��i ��n cu�i sa m�c, m�i th�y ���c �o gi�c.",
			}
	end

	--����������
	if GetItemCount(2,0,732) < 1 then
		AddItem(2,0,732,1,1);--�õ�������
	end

	TalkEx("",strTalk);

end

--ɱ�������������ɶԻ�ˢ������
function task_023_02_0()

local strTalk = {};

	--���������ʧ����Ҫ��30���Ӳ�������ˢ������ʹ
	if GetTime()-GetTask(CREAT_HUANGXIANG_TIME)	>= 1800 then

		strTalk = {
			"V� n�y l� B�ch Thi�n Th�nh �? Nghe n�i B�ch ti�n sinh th��ng t�m b�o v�t � sa m�c, ch�c bi�t r� h��ng sa m�c. Kh�ng bi�t B�ch ti�n sinh c� th� ��a ta ��n cu�i sa m�c ���c kh�ng?",
			"B�ch Thi�n Th�nh Cu�i sa m�c ch�ng ph�i l� n�i th� v� g�, ta khuy�n <sex> ��ng �i chuy�n n�y. Cu�i sa m�c kh� nh�n ra h��ng �i, h�n n�a nguy hi�m lu�n r�nh r�p, l�i c�n c� �o gi�c m� ho�c l�ng ng��i, n�u kh�ng l� chuy�n l�n th� n�n tr�nh. H�n n�a ta ch� t�m nh�ng th� c� gi� tr� m� th�i, cu�i sa m�c ch�ng c� g� hay, �i l�m g� c� ch�?",
			"Nh�ng B�ch ti�n sinh, �o gi�c cu�i sa m�c �� b� ��nh th�c, n�u kh�ng s�m ��i ph�, ch� e s� g�y h�a cho d�n, hu�ng chi sau n�y ��n cu�i sa m�c t�m b�u v�t ch�ng l� c�c h� c�ng mu�n khi�p s� n�a sao?",
			"�o gi�c sa m�c l�m ng��i ta b� th��ng �? Tr��c kia �i qua ��, ta kh�ng th�y �o gi�c l�m ng��i ta b� th��ng? Nh�ng �o gi�c c� b� �n g�?",
			}
		TalkEx("task_023_02_0_1",strTalk);
	else

		strTalk = {
			"�o gi�c n�y tho�t �n tho�t hi�n, <sex> ��i ch�t n�a h�y ��n, l�c n�y ta c�ng kh�ng l�m g� ���c.",
			}
		TalkEx("",strTalk);
	end
end

--���Ի�
function task_023_02_0_1()

local nMapDataIndex = random(1,getn(HuangXiang_MapData));
local xWPos,yWPos,xPos,yPos = HuangXiang_MapData[nMapDataIndex][1],HuangXiang_MapData[nMapDataIndex][2],HuangXiang_MapData[nMapDataIndex][3],HuangXiang_MapData[nMapDataIndex][4]
local nNpcIndex = 0;
local strTalk = {
	"��ng v�y, k� ��c �c mu�n kh�ng ch� �o gi�c, l�n n�y ta ��n cu�i sa m�c l� �� phong �n �o gi�c. Xem n�y, ��y l� Ph�p kh� phong �n d�ng �� kh�ng ch� �o gi�c, b�ch ti�n sinh ��a ta �i ���c kh�ng?",
	"�? Ph�p kh� n�y l� m�n �� kh�ng t�i. V�y �i, ta s� d�n ng��i ��n cu�i sa m5c, nh�ng ng��i ph�i t�ng ph�p kh� n�y cho ta, th� n�o? ",
	"Ng��i t�m b�u v�t qu� nhi�n ��u tham b�u v�t, th�i, ph�p khi n�y d�ng �� g�i nguy�n h�nh c�a Ch�n, sau khi thu Ch�n v�o phong y�u th�p c�ng h�t t�c d�ng, t�ng cho �ng ta c�ng kh�ng sao.)",
	"���c, n�u B�ch ti�n sinh th�ch v�t n�y, ��i ta phong �n �o gi�c xong, s� t�ng n� cho �ng �� c�m t�.",
	"Ta nh� l�n tr��c � "..xPos..", "..yPos.." �� g�p qua�o gi�c, <sex> h�y �i ki�m tra xem sao.",
	}

	TalkEx("",strTalk);
	SetTask(CREAT_HUANGXIANG_TIME,GetTime());--��¼����ˢ��ʱ��
	nNpcIndex = CreateNpc("Hoan T��ng (T��ng l�nh t��ng)","�o gi�c th�ng l�nh",506,xWPos,yWPos,-1,1,1,70);
	SetNpcScript(nNpcIndex,"\\script\\������\\ɳĮ�Թ�\\npc\\����ͳ��.lua");
	SetNpcLifeTime(nNpcIndex,1800);
	Msg2Player("��n  "..xPos..", "..yPos.." , t�m v� ti�u di�t �o gi�c.")
	TaskTip("��n  "..xPos..", "..yPos.." , t�m v� ti�u di�t �o gi�c.");

end

--��δ��ɴ�ܻ��������
function task_023_02_1()

local strTalk = {
	"��y l� sa m�c ��ng s�, kh�ng th�n tr�ng s� m�t m�ng nh� ch�i.",
	};

	TalkEx("",strTalk);

end

--�Ѿ�ɱ�����󣬹ؿ��ӿڿ���
function task_023_02_2()

local strTalk = {
	"C�c h� c� b�u v�t qu� g� th�?",
	};

	TalkEx("",strTalk);

end

--�Ѿ���ӡ���󣬽������͸������
function task_023_03_0()

local strTalk = {
	"<sex> v� r�i �? C� phong �n �o gi�c sa m�c kh�ng?",
	"Kh�ng sai, �o gi�c n�y qu� l� kh�ng d� ��i ph�, nh�ng sau n�y �i v�o sa m�c t�m b�u v�t s� d� d�ng h�n. ��y l� ph�p kh�, �a t� B�ch ti�n sinh �� d�n ���ng.",
	"<sex> ch� kh�ch kh�, ta m�i l� ng��i ph�i �a t� ng��i, sau n�y n�u mu�n ��n cu�i sa m�c c� ��n t�m ta, ta s� d�n ���ng cho ng��i.",
	}

	DelItem(2,0,733,1);--ɾȥ����
	SetTask(TASK_XB_ID_01,66);
	TalkEx("",strTalk);
	TaskTip("Mang phong y�u th�p v� C�n L�n cho Di�p T� Thu.");
	Msg2Player("Mang phong y�u th�p v� C�n L�n cho Di�p T� Thu.");
	GivePlayerAward("Award_XB_54","Easy");
	GivePlayerExp(SkeyXibei,"fengyao")
end

--������������Ҷ����
function task_023_04_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"th�y <sex> b�nh y�n quay v�, nh�ng c� phong �n �o gi�c sa m�c ���c kh�ng?",
			"Nh� Di�p thi�u hi�p ch� gi�o, n�n �� phong �n �o gi�c sa m�c t�i Phong y�u th�p n�y, nh� v�y, Ch�n c�ng kh�ng c�n h�i d�n ���c n�a.",
			"T�t, ng��i �� l�m m�t vi�c l�n cho v� l�m, ��i s� huynh th�t t� h�o v� ng��i.",
			"Di�p thi�u hi�p qu� l�i r�i. H�t l�ng v� v� l�m, l� tr�ch nhi�m c�a ta. Ta c�n ph�i �i th�m chuy�n n�a, n�i s� t�nh cho �u D��ng H�a  ti�n b�i bi�t. Xin c�o t�.",
			}
	else
		strTalk = {
			"Th�y <sex> b�nh y�n quay v�, nh�ng c� phong �n �o gi�c sa m�c ���c kh�ng?",
			"Nh� Di�p thi�u hi�p ch� gi�o, �� phong �n �o gi�c sa m�c t�i Phong y�u th�p n�y, nh� v�y, Ch�n c�ng kh�ng c�n h�i d�n ���c n�a.",
			"T�t, <sex> l�i l�m m�t vi�c l�n cho v� l�m, t�i h� th�t b�i ph�c.",
			"Di�p thi�u hi�p qu� l�i r�i. H�t l�ng v� v� l�m, l� tr�ch nhi�m c�a ta. Ta c�n ph�i �i th�m chuy�n n�a, n�i s� t�nh cho �u D��ng H�a  ti�n b�i bi�t, sau n�y s� v� th�m.",
			}
	end

	DelItem(2,0,732,1);--ɾȥ������
	SetTask(TASK_XB_ID_01,67);
	TalkEx("",strTalk);
	TaskTip("N�i cho �u D��ng H�a bi�t chuy�n phong �n �o gi�c.");
	Msg2Player("N�i cho �u D��ng H�a bi�t chuy�n phong �n �o gi�c.");

end

--��δ�㱨ŷ����
function task_023_04_1()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng��i v� d�n tr� h�i, th�t khi�n ��i s� huynh b�i ph�c.",
			"Di�p thi�u hi�p qu� l�i r�i. H�t l�ng v� v� l�m, l� tr�ch nhi�m c�a ta. Ta c�n ph�i �i th�m chuy�n n�a, n�i s� t�nh cho �u D��ng H�a  ti�n b�i bi�t. Xin c�o t�."
			}
	else
		strTalk = {
			"<sex> v� d�n tr� h�i, th�t khi�n t�i h� b�i ph�c.",
			"Di�p thi�u hi�p qu� l�i r�i. H�t l�ng v� v� l�m, l� tr�ch nhi�m c�a ta. Ta c�n ph�i �i th�m chuy�n n�a, n�i s� t�nh cho �u D��ng H�a  ti�n b�i bi�t, sau n�y s� v� th�m.",
			}
	end

	TalkEx("",strTalk);

end

--�������֪ŷ����
function task_023_05_0()

local strTalk = {
	"�u D��ng ti�n b�i, �o gi�c sa m�c qu� nhi�n l� chi�u l�i h�i nh�t c�a Nh�t Ph�m ���ng, may l�, ch�ng ta �� phong �n �o gi�c sa m�c tr��c khi h�n h�nh ��ng.",
	"T�t, t�t, nh�ng g� v� l�m l�m l�n n�y ��ng l� t�o ph�c cho thi�n h�. Th�c l�c c�a Nh�t Ph�m ���ng phen n�y ch�c s� b� ��nh b�i. Nh�ng ng��i vong m�nh t�i Ph�ng T��ng ph� ch� e ch�ng �ch g�; B�n �� S�n H� X� T�c c�ng s� t� ��ng m�t �i; k� ho�ch mu�n d�ng d��c nh�n x�m ph�m ��i T�ng c�ng �� tan th�nh m�y kh�i, T�y H� ch�c s� kh�ng d�m ra giang h� m�t th�i gian. Nh�ng ta c�ng lo L� Nguy�n Kh�nh s� kh�ng ch�u �� y�n, e r�ng s� ph�n c�ng, th� nh�ng, ta r�t y�n t�m, ng��i ��nh cho Nh�t Ph�m ���ng th�t �i�n b�t ��o, ch�ng c�ng kh�ng d�m b�o th� ng��i, Tr��ng ca m�n nh�n c�a ta s� h�t s�c b�o v� <sex>. ",
	"N�u Nh�t Ph�m ���ng ��n b�o th�, ta c�ng kh�ng lo, ta s� qu�n m�nh �� tr� h�i cho d�n. Ta �� k�t ���c nhi�u b�n t�t, cu�i c�ng ta �� t�m ���c ng��i g�p ta. �u D��ng ti�n b�i, �a t� �� ra k� s�ch.",
	}

	TalkEx("task_023_05_0_1",strTalk);

end

--���Ի�
function task_023_05_0_1()

local strTalk = {
	"Ha ha ha, b�y gi� nh� l�i m�i lo c�a ng��i, m�i �� ng��i �� c�u ��i T�ng tho�t kh�i d�u s�i l�a b�ng. �n n�y th�t kh� qu�n. �m m�u qu� k� c�a Nh�t Ph�m ���ng tuy �� b� ph�, Th�p ��i kim cang c�ng �� t�n th�t nghi�m tr�ng, b�y gi� ch� lo Nh�t Ph�m ���ng s� t� b� chi�n l��c Thao Quang D��ng H�i, t�n c�ng t�y b�c v� l�m, ch� e l�c �� <sex> v�n ph�i ��n gi�p ��.",
	"��y l� tr�ch nhi�m c�a ta, kh�ng th� ch�i t�.",
	"Nh�n th�y <sex> ��y nhi�t huy�t nh� v�y, ta th�t vui m�ng. Tuy ��i T�ng s�p di�t vong, nh�ng l�c n�o c�ng tr�n ��y hy v�ng v�o ng��i. Ph�n hoa l�c m�c, chung h�u h�ng tr�n tam thi�n, kh�m ch�ng sinh th� gian, giai th� t�nh duy�n. <sex> v�t v� qu�.",
	}

	--TalkEx("task_023_05_0_2",strTalk);--�ر����ս����һ�
	TalkEx("task_029_01_0",strTalk);
	SetTask(TASK_XB_ID_01,68);
	GivePlayerAward("Award_XB_55","Easy");
	GivePlayerExp(SkeyXibei,"qixia")
	AddItem(0,107,156,1,1);
	--ɾȥһƷ�óƺ�
	for i=1,6 do
		RemoveTitle(60,i);
	end
	add_xb_title(7);--��õ�Ӱ�����ƺ�
end

function task_023_05_0_2()

local strTalk = {
	"Nh�n th�y <sex> ��y nhi�t huy�t nh� v�y, ta th�t vui m�ng. Tuy ��i T�ng s�p di�t vong, nh�ng l�c n�o c�ng tr�n ��y hy v�ng v�o ng��i. Ph�n hoa l�c m�c, chung h�u h�ng tr�n tam thi�n, kh�m ch�ng sinh th� gian, giai th� t�nh duy�n. <sex> v�t v� qu�.",
	}

	TalkEx("",strTalk);
	AddTitle(60,7);--��ô���Ӣ�۳ƺ�

end

------------------------------------------��֧2����---------------------------------------------------------------
---------------------------------- ������24��֧2_1����ԩ��----------------------------------
--��ŷ�����Ի���̽������������������
function task_024_01_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"�u D��ng ti�n b�i, ta �� th�m nh�p Nh�t Ph�m ���ng ���c r�i. ��ng r�i, ta c�n m�t chuy�n mu�n h�i.",
			"T�t, t�t, th�m nh�p ���c v�o Nh�t Ph�m ���ng c�ng l� b��c ���c b��c ��u ti�n, kh� kh�n ng��i s�p ��i m�t kh�ng th� coi th��ng, n�n th�n tr�ng, g�p r�c r�i c� ��n t�m ta, ta s� c� g�ng gi�p ng��i. Chuy�n g� n�i �i.",
			"Ti�n b�i v�n nhi�t t�nh nh� v�y, ta xin �a t�. Ti�n b�i l� kh�ch giang h�, l� ng��i t�ng tr�i, kh�ng bi�t ti�n b�i c� t�ng nghe ��n T� M� Minh Phong? Ng��i n�y d��ng nh� l� cao th� v� l�m.",
			"C� ph�i ng��i n�i ��n Ki�m th�n T� M� Minh Phong? Xem ra, T� M� Minh Phong th�t n�i danh. 18 n�m tr��c lu�n ki�m � Hoa S�n, ��nh Hoa S�n t�p trung c�c cao th� trong thi�n h�, l�i n�i Nh�t Ni�n Thanh ki�m kh�ch d�c ngang Hoa S�n nh� th�n, kh�ng ai ti�p n�i 20 chi�u c�a �ng ta. Nh� ��, danh ti�ng �ng vang kh�p thi�n h�. Ng��i n�y ch�nh l� T� M� Minh Phong.",
			"Th� ra l� nh�n v�t v� l�m g�y ch�n ��ng nh� v�y, sao l�i kh�ng nghe ti�ng trong giang h�?",
			}
	else
		strTalk = {
			"�u D��ng ti�n b�i, ta �� th�m nh�p Nh�t Ph�m ���ng ���c r�i. ��ng r�i, ta c�n m�t chuy�n mu�n h�i.",
			"T�t, t�t, th�m nh�p ���c v�o Nh�t Ph�m ���ng c�ng l� b��c ���c b��c ��u ti�n, kh� kh�n ng��i s�p ��i m�t kh�ng th� coi th��ng, n�n th�n tr�ng, g�p r�c r�i c� ��n t�m ta, ta s� c� g�ng gi�p ng��i. Chuy�n g� n�i �i.",
			"Ti�n b�i v�n nhi�t t�nh nh� v�y, ta xin �a t�. Ti�n b�i l� kh�ch giang h�, l� ng��i t�ng tr�i, kh�ng bi�t ti�n b�i c� t�ng nghe ��n T� M� Minh Phong? Ng��i n�y d��ng nh� l� cao th� v� l�m.",
			"C� ph�i ng��i n�i ��n Ki�m th�n T� M� Minh Phong? Xem ra, T� M� Minh Phong th�t n�i danh. 18 n�m tr��c lu�n ki�m � Hoa S�n, ��nh Hoa S�n t�p trung c�c cao th� trong thi�n h�, l�i n�i Nh�t Ni�n Thanh ki�m kh�ch d�c ngang Hoa S�n nh� th�n, kh�ng ai ti�p n�i 20 chi�u c�a �ng ta. Nh� ��, danh ti�ng �ng vang kh�p thi�n h�. Ng��i n�y ch�nh l� T� M� Minh Phong.",
			"Th� ra l� nh�n v�t v� l�m g�y ch�n ��ng nh� v�y, sao l�i kh�ng nghe ti�ng trong giang h�?",
			}
	end

	TalkEx("task_024_01_0_1",strTalk);

end

--���Ի�
function task_024_01_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ha ha, g�i �ng ta l� ki�m th�n, l� v� �ng r�t kh�i giang h� sau khi th� hi�n ki�m ph�p v� song, nhi�u n�m tr��c ng��i tr�n n�i Hoa S�n nh�c ��n ki�m ph�p th�n k� kia, c�n T� M� Minh Phong b� �n bi�n m�t, c�ng ���c bi�t ��n l� K��m th�n h� ph�m, xu�t qu� nh�p th�n. ��nh tr�n g�y ch�n ��ng thi�n h�, nh�ng sau �� l�i bi�n m�t, nh� v�y c� truy�n k� kh�ng ch�? Chuy�n n�y ���c truy�n t� l�u trong giang h�, ng��i ��i c�ng d�n qu�n. N�m �� ta may m�n ���c th�y ki�m ph�p c�a �ng ta tr�n ��nh Hoa S�n, ��ng l� tuy�t k�.",
			"Kh�ng ng� T� M� Minh Phong l�i c� lai l�ch l�n nh� v�y, ch�ng tr�ch �� nh�t d�ng s� T�y H� kh�ng ��ch n�i �ng ta. Ti�n b�i bi�t ng��i n�y � Ph�ng T��ng, c�n ng��i c�a Nh�t Ph�m ���ng d��ng nh� �ang ti�p x�c v�i �ng ta.",
			"�? T�ng nghe �ng ta �i kh�p b�n bi�n, ho�c � Giao Ch�, ho�c � Li�u Th�, nh�ng ch�a nghe n�i �ng ta � Ph�ng T��ng ph�. Nh�t Ph�m ���ng e r�ng �ang truy t�m t�ng t�ch c�a �ng t�i Ph�ng T��ng , mu�n m�i �ng nh�p ���ng. N�u ng��i �� g�p �ng ta, n�n l�u �, n�u �ng ta th�t s� gia nh�p Nh�t Ph�m ���ng, Nh�t Ph�m ���ng s� kh� ��i ph� h�n.",
			"Ta hi�u r�i.",
			}
	else
		strTalk = {
			"Ha ha, g�i �ng ta l� ki�m th�n, l� v� �ng r�t kh�i giang h� sau khi th� hi�n ki�m ph�p v� song, nhi�u n�m tr��c ng��i tr�n n�i Hoa S�n nh�c ��n ki�m ph�p th�n k� kia, c�n T� M� Minh Phong b� �n bi�n m�t, c�ng ���c bi�t ��n l� K��m th�n h� ph�m, xu�t qu� nh�p th�n. ��nh tr�n g�y ch�n ��ng thi�n h�, nh�ng sau �� l�i bi�n m�t, nh� v�y c� truy�n k� kh�ng ch�? Chuy�n n�y ���c truy�n t� l�u trong giang h�, ng��i ��i c�ng d�n qu�n. N�m �� ta may m�n ���c th�y ki�m ph�p c�a �ng ta tr�n ��nh Hoa S�n, ��ng l� tuy�t k�.",
			"Kh�ng ng� T� M� Minh Phong l�i c� lai l�ch l�n nh� v�y, ch�ng tr�ch �� nh�t d�ng s� T�y H� kh�ng ��ch n�i �ng ta. Ti�n b�i bi�t ng��i n�y � Ph�ng T��ng, c�n ng��i c�a Nh�t Ph�m ���ng d��ng nh� �ang ti�p x�c v�i �ng ta.",
			"�? T�ng nghe �ng ta �i kh�p b�n bi�n, ho�c � Giao Ch�, ho�c � Li�u Th�, nh�ng ch�a nghe n�i �ng ta � Ph�ng T��ng ph�. Nh�t Ph�m ���ng e r�ng �ang truy t�m t�ng t�ch c�a �ng t�i Ph�ng T��ng , mu�n m�i �ng nh�p ���ng. N�u ng��i �� g�p �ng ta, n�n l�u �, n�u �ng ta th�t s� gia nh�p Nh�t Ph�m ���ng, Nh�t Ph�m ���ng s� kh� ��i ph� h�n. ",
			}
	end

	TalkEx("task_024_01_0_2",strTalk);

end

--���Ի�
function task_024_01_0_2()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"C�n m�t chuy�n nh� ��n ng��i. Chim b� c�u ��a th� c�a B�ch Hi�u Sinh ��n b�o, g�n ��y Trung Nguy�n th��ng xu�t hi�n �� t� C�n L�n ph�i, �� g�y nghi ng� cho c�c ��i m�n ph�i, v� s� an nguy c�a Trung Nguy�n, v� l�m Trung Nguy�n x�a nay lu�n gi� th�i �� th�n tr�ng v�i c�c m�n ph�i ngo�i lai. C�c m�n ph�i kh�ng hi�u m�c ��ch nh�p th� c�a C�n L�n ph�i, e r�ng s� g�y ph�n tranh. Ng��i l� �� T� C�n L�n, n�n g�nh l�y tr�ch nhi�m n�y, gi� l� l�c c�c ph�i ph�i �o�n k�t l�i, n�i r� ch� h��ng c�a c�c ng��i cho c�c ph�i bi�t, h�a gi�i ph�n tranh kh�ng c�n thi�t, m�i l� �i�u quan tr�ng nh�t.",
			"Ph�i ta kh�ng ph�i �t ra giang h�, ch� l� x�a nay ho�t ��ng n�i n�i r�ng, v�i m�c ��ch gi�ng y�u tr� ma. Ta s� v� h�i ��i s� huynh Di�p T� Thu nguy�n nh�n ��n Trung Nguy�n l�n n�y, �u D��ng ti�n b�i ��ng qu� lo l�ng.",
			"H�a gi�i ph�n tranh, kh�ng t� ra y�u k�m, ��ng l� b�c k� t�i, <sex> th�t bao dung. Qu� M�n H�i Lang t�p h�p nhi�u �� T� C�n L�n, d��ng nh� �� x�y ra chuy�n g� r�i, ng��i h�y �i xem th� n�o.",
			"Ta nh�t ��nh s� cho ti�n b�i bi�t m�c ��ch nh�p th� c�a ph�i ta, Qu� M�n H�i Lang l� n�i oan h�n t�p h�p, ch�c �� x�y ra chuy�n g� r�i, ta xin c�o t�. �a t� ti�n b� �� cho ta bi�t tin v� T� M� Minh Phong.",
			}
	else
		strTalk = {
			"Ta hi�u r�i.",
			"C�n m�t chuy�n nh� ��n ng��i. Chim b� c�u ��a th� c�a B�ch Hi�u Sinh ��n b�o, g�n ��y Trung Nguy�n nhi�u l�n xu�t hi�n �� t� C�n L�n ph�i, V� l�m Trung Nguy�n x�a nay c�nh gi�c v�i chuy� m�n ph�i nh�p th�, C�n L�n ph�i r�t �t quan t�m ��n th� s�, l�n n�y nhi�u �� T� C�n L�n ra giang h�, c�c ph�i v� l�m nghi ng� m�c ��ch c�a h�. <sex> c� th� t�m hi�u m�c ��ch nh�p th� c�a C�n L�n ph�i ���c kh�ng? C� nhi�u �� T� C�n L�n t�p trung t�i Qu� M�n H�i Lang, ng��i h�y �i d� la xem sao.",
			"C�n L�n ph�i tuy �t ra giang h�, nh�ng ch� h��ng kh�ng gi�ng gian t�, nh� �� ph�ng b�t tr�c, c�ng n�n �i t�m hi�u m�t l�n, �u D��ng ti�n b�i xin c�o t�. �a t� B�n �� cho ta bi�t tin v� T� M� Minh Phong.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,1);
	if GetTask(TASK_XB_ID_01) == 1 then
		SetTask(TASK_XB_ID,40);--�ر�08�������
	end
	TaskTip("H�y ��n Qu� M�n H�i Lang �i�u tra chuy�n �� T� C�n L�n ��n Trung Nguy�n.");
	Msg2Player("H�y ��n Qu� M�n H�i Lang �i�u tra chuy�n �� T� C�n L�n ��n Trung Nguy�n.");

end

--����Ż��������˵����ص��ӶԻ�
function task_024_02_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"�a? V� s� huynh n�y sao b� th��ng v�y?",
			"V�t th��ng c�a ta kh�ng n�ng l�m, ch� l� t�m th�i kh�ng h�nh ��ng ���c, oan h�n t�i Qu� M�n H�i Lang d��ng nh� �ang m�nh l�n, ta t�m th�i b� qua ��i �. Sao ng��i l�i ��n ��y?",
			"Nghe n�i n�i ��y �� t�p h�p ���c m�t s� �� t� ph�i ta, ta li�n ��n xem c� chuy�n g� x�y ra. V�t th��ng c�a B�n d��ng nh� kh�ng nh�, c� c�n gi�p g� kh�ng?",
			"Th� ra l� v�y, ta v�a thu Oan h�n v�o trong B�nh ��ng h�n n�y, ph�p l�c c�a b�nh ��ng h�n �ang y�u d�n, ch� s� s�p kh�ng ch�a ���c oan h�n. V�t th��ng c�a ta do oan h�n l�c g�y ra, t�m th�i kh� h�nh ��ng, nh�ng kh�ng h�i ��n t�nh m�ng. Ng��i h�y mau mang b�nh n�y ��n ch� ��i s� huynh ���c kh�ng? �ng ta s� t� bi�t n�i dung ta mu�n h�i b�o.",
			"���c, c�c h� h�y t�nh d��ng, s�n ��y xin h�i ��i thi�u hi�p ch�a v�t th��ng cho c�c h� nh� th� n�o?",
			}
	else
		strTalk = {
			"�a? Nh�nh c�ch �n m�c c�a c�c h� gi�ng v�i �� t� C�n L�n ph�i, sao l�i b� th��ng v�y?",
			"V�t th��ng c�a ta kh�ng n�ng l�m, ch� l� t�m th�i kh�ng h�nh ��ng ���c, Oan h�n t�i Qu� M�n H�i Lang d��ng nh� �� m�nh l�n, ta t�m th�i b� qua ��i �. Sao ng��i nh�n ra c�ch �n m�c c�a C�n L�n ph�i ch�ng ta?",
			"Ta v� ��i �� t� Di�p T� Thu c�a C�n L�n ph�i c� duy�n v�i nhau, n�n bi�t ���c c�ch �n m�c c�a c�c h�. V�t th��ng c�a c�c h� c� v� kh�ng nh�, c� c�n gi�p g� kh�ng?",
			"Th� ra ng��i bi�t Di�p s� huynh, t�t, ta v�a thu Oan h�n v�o trong B�nh ��ng h�n n�y, ph�p l�c c�a b�nh ��ng h�n �ang y�u d�n, ch� s� s�p kh�ng ch�a ���c oan h�n. V�t th��ng c�a ta do oan h�n l�c g�y ra, t�m th�i kh� h�nh ��ng, nh�ng kh�ng h�i ��n t�nh m�ng. Ng��i h�y mau mang b�nh n�y ��n ch� Di�p s� huynh ���c kh�ng? �ng ta s� t� bi�t n�i dung ta mu�n h�i b�o.",
			"���c, c�c h� h�y t�nh d��ng, s�n ��y xin h�i Di�p thi�u hi�p ch�a v�t th��ng cho c�c h� nh� th� n�o?",
			}
	end

	SetTask(TASK_XB_ID_02,2);
	AddItem(2,0,699,1,1);--������
	TalkEx("",strTalk);
	TaskTip("H�y mang b�nh ��ng h�n v� C�n L�n giao cho Di�p T� Thu");
	Msg2Player("H�y mang b�nh ��ng h�n v� C�n L�n giao cho Di�p T� Thu");

end

--��δ���������ͷ��������������ص��ӶԻ�
function task_024_02_1()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Th� ra l� v�y, ta v�a thu Oan h�n v�o trong B�nh ��ng h�n n�y, ta b� th��ng n�n t�m th�i kh�ng �i ���c, ng��i h�y mau mang chi�c b�nh n�y ��n ch� ��i s� huynh ���c kh�ng?",
			}
	else
		strTalk = {
			"Th� ra ng��i quen Di�p s� huynh, nh� v�y th�t t�t, ta v�a thu Oan h�n v�o trong B�nh ��ng oan h�n n�y, ta b� th��ng n�n t�m th�i kh�ng �i ���c, ng��i h�y mau mang chi�c b�nh n�y ��n ch� Di�p s� huynh ���c kh�ng?",
			}
	end

	TalkEx("",strTalk);

end

--��Ҷ����Ի�������������
function task_024_03_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Di�p s� huynh, ta g�p ng��i c�a ph�i ta t�i Qu� M�n H�i Lang, �ng ta b� th��ng do thu ph�c Oan h�n n�n kh�ng th� h�nh ��ng, n�n nh� ta mang B�nh ��ng h�n n�y v� cho B�n, B�n xem c� g� kh�c th��ng kh�ng.",
			"Sao? C� ng��i b� th��ng �? C� n�ng kh�ng? C� ph�i b� th��ng do Oan h�n kh� b�n trong Qu� M�n H�i Lang kh�ng?",
			"Nghe �ng ta n�i c� v� nh� kh�ng tr� ng�i l�m, ch� l� t�m th�i kh�ng h�nh ��ng ���c. �ng ta n�i v� s�c m�nh c�a Oan h�n t�i Qu� M�n H�i Lang b�ng d�ng t�ng l�n, t�m th�i b� qua v�t th��ng. Ta ��nh ch�a cho �ng ta, nh�ng �ng ta l�i b�o ta mau v� ph�c m�nh.",
			"Th� ra l� v�y, may l� kh�ng b� th��ng n�ng, Qu� M�n H�i Lang g�n ��y li�n t�c c� chuy�n b�t th��ng, oan h�n trong �� c�ng b� c�m h�a, r�ch r�ch ng�c ��u d�y. S� ph� t�ng n�i Trung Nguy�n c� ma, ho�nh h�nh kh�p n�i, xem ra l� th�t.",
			}
	else
		strTalk = {
			"Di�p s� huynh, ta g�p ng��i c�a ph�i ta t�i Qu� M�n H�i Lang, �ng ta b� th��ng do thu ph�c Oan h�n n�n kh�ng th� h�nh ��ng, n�n nh� ta mang B�nh ��ng h�n n�y v�, xin xem th�!",
			"Sao? C� ng��i b� th��ng �? C� n�ng kh�ng? C� ph�i b� th��ng do Oan h�n kh� b�n trong Qu� M�n H�i Lang kh�ng?",
			"Ng��i ch�i Nghe �ng ta n�i c� v� nh� kh�ng tr� ng�i l�m, ch� l� t�m th�i kh�ng h�nh ��ng ���c. �ng ta n�i v� s�c m�nh c�a Oan h�n t�i Qu� M�n H�i Lang b�ng d�ng t�ng l�n, t�m th�i b� qua v�t th��ng.",
			"Th� ra l� v�y, may m� b� th��ng kh�ng n�ng, Qu� M�n H�i Lang g�n ��y li�n t�c c� chuy�n b�t th��ng, oan h�n trong �� c�ng b� c�m h�a, r�ch r�ch ng�c ��u d�y. S� ph� t�ng n�i Trung Nguy�n c� ma, ho�nh h�nh kh�p n�i, xem ra l� th�t.",
			}
	end

	TalkEx("task_024_03_0_1",strTalk);

end

--���Ի�
function task_024_03_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"S� huynh th��ng n�i ph�i c�a ta h� thi�n ��a, tr� y�u ma, nh�ng �t khi h�i chuy�n Trung Nguy�n, b�y gi� l�i ��n Trung Nguy�n, c� ph�i v� vi�c n�y?",
			"Kh�ng sai, t� khi m� n�i l�p ph�i, C�n L�n chuy�n tr� y�u di�t ma, k� n�ng tinh t��ng. Y�u ma tr�n trong r�ng s�u n�i hi�m, �� t� ph�i ta c�ng th��ng qua l�i n�i n�y, kh�ng ng� Trung Nguy�n Giang T�n th�n th��ng xuy�n c� qu� h�i ng��i, ch�ng ta l�m sao c� th� �� cho gian t� h�i d�n? N�n m�i ��n Trung Nguy�n. C� �i�u ph�i �i v�ng qua n�i r�ng, l�m cho c�c ph�i Trung Nguy�n kinh ng�c, th�m ch� c�n g�y nghi ng�, n�u c� hi�u l�m, th� n�n h�a gi�i.",
			"Th� ra l� v�y, ph�i ta chuy�n tr� ma, b�o v� thi�n ��a, n�i n�o c� t� ma, n�i �� c� C�n L�n. C�c ph�i Trung Nguy�n x�a nay nghi k� v�i c�c ph�i kh�c, v� s� an to�n c�a Trung Nguy�n, kh�ng c� �c �. H�a gi�i ph�n tranh m�i cho th�y kh� kh�i c�a ph�i ta, ta s� n�i sai Tr��ng Ca M�n n�i m�c ��ch nh�p th� c�a ph�i ta, ch� l� h� thi�n ��a ch�nh ��o, kh�ng �� cho c�c ph�i Trung Nguy�n ph�i hi�u l�m.",
			}
	else
		strTalk = {
			"Nghe Di�p thi�u hi�p n�i ch� h��ng c�a qu� ph�i l� h� thi�n ��a ch�nh ��o, tr� y�u ma, r�t �t h�i chuy�n Trung Nguy�n, b�y gi� l�i ��n Trung Nguy�n, c� ph�i l� v� chuy�n n�y?",
			"<sex> n�i ��ng l�m, t� khi m� n�i l�p ph�i, C�n L�n chuy�n tr� y�u di�t ma, k� n�ng tinh t��ng. Y�u ma tr�n trong r�ng s�u n�i hi�m, �� t� �� T� C�n L�n c�ng th��ng qua l�i n�i n�y, kh�ng ng� Trung Nguy�n Giang T�n th�n th��ng xuy�n c� qu� h�i ng��i, �� T� C�n L�n l�m sao c� th� �� cho gian t� h�i d�n? N�n C�n L�n ph�i ��n Trung Nguy�n. C� �i�u ph�i �i v�ng qua n�i r�ng, l�m cho c�c ph�i Trung Nguy�n kinh ng�c, th�m ch� c�n g�y nghi ng�, n�u c� hi�u l�m. Xin h�y l��ng th�.",
			"Th� ra l� v�y, C�n L�n chuy�n tr� ma, l� �� b�o v� thi�n ��a, n�i n�o c� t� ma, n�i �� c� C�n L�n. C�c ph�i Trung Nguy�n x�a nay nghi k� v�i c�c ph�i kh�c, v� s� an to�n c�a Trung Nguy�n, kh�ng c� �c �, thi�u hi�p c�ng ��ng qu� lo l�ng, ta s� cho Tr��ng Ca M�n n�i cho c�c ph�i bi�t, C�n L�n ph�i nh�p th� �� tr� ma, c�c ph�i Trung Nguy�n kh�ng n�n kh� x�, m� n�n h� tr� nhau.",
			"��y c�ng l� b�n � c�a ph�i ta, <sex> ngh�a s�u ��c d�y, l�i nh�n ngh�a, ta ���c k�t th�n v�i ng��i b�n nh� v�y qu� th�t may m�n. Xin �a t� <sex> gi�p ��.",
			}
	end

	TalkEx("task_024_03_0_2",strTalk);

end

--���Ի�
function task_024_03_0_2()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"��y v�n l� b�n � c�a ph�i ta, h�y n�i cho v� l�m Trung Nguy�n bi�t, tr�nh ph�n tranh kh�ng c�n thi�t c�ng l� �i�u t�t.",
			"Kh�ng sai, s� huynh n�i ch� ph�i. ��ng r�i, tuy b� th��ng t�i Qu� M�n H�i Lang ��ng M�n kh�ng n�ng, nh�ng n�i �� r�t nguy hi�m, nh�ng c� c�ch c�u ch�a ch�?",
			"D� nhi�n l� c�, C�n L�n Kim ��n chuy�n tr� T� y�u kh�, ta s� t�m thu�c cho �ng ta. Ph�i r�i, Oan h�n trong B�nh ��ng h�n kh�ng ph�i l� Oan h�n th�c s�, m� l� nh�ng Du h�n v� t�i b� Y�u t� l�c kh�ng ch� bi�n th�nh. S�c m�nh c�a y�u t� n�y kh�ng th� coi th��ng, c� th� bi�n du h�n th�nh �c qu�. ��y l� C�n L�n ti�n ��n, c� th� gi�i t�, ng��i h�y ��a cho �ng ta v� n�i cho �ng ta bi�t chuy�n oan h�n, v� h�i ngu�n g�c c�a Y�u t� l�c r�i h�y th��ng l��ng.",
			"Kh�ng th�nh v�n ��, n�u ��i s� huynh mu�n t�i C� D��ng ��ng th� n�n c�n th�n, n�i �� nguy c� tr�ng tr�ng.",
			}
	else
		strTalk = {
			"Di�p thi�u hi�p �� coi ta l� b�n th� ��ng n�n kh�ch s�o. Th��ng t�ch c�a �� t� Qu� M�n H�i Lang tuy kh�ng n�ng, nh�ng n�i n�y v�n r�t nguy hi�m, c� c�ch ch�a tr� n�o kh�ng?",
			"���ng nhi�n l� c�. C�n L�n Kim ��n chuy�n tr� kh� t� y�u, ta v�a t�m ���c ��n d��c cho h� ��y. � ph�i, Oan H�n ���c thu ph�c trong Ti�u H�n T�n kh�ng ph�i l� Oan H�n th�t, m� ch� l� nh�ng Du H�n v� t�i b� chi ph�i b�i Gian T� chi l�c. Ngu�n s�c m�nh Gian T� n�y kh�ng th� xem th��ng, ch�ng c� th� bi�n c�c Du H�n b�nh th��ng th�nh li�t qu�. C�n L�n Ti�n ��n n�y c� th� gi�i kh� ��nh Th�n, ��ng ra ta ph�i ��ch th�n ��n ��, nh�ng v� c�n ph�i v�i t�i C� D��ng ��ng, n�n ��nh ph�i nh� <sex> m�t l�n n�a. Khi <sex> g�p h�. Xin h�y n�i r� vi�c Oan H�n kh�ng ph�i l� Oan H�n th�t, v� t�m hi�u v� xu�t x� c�a Gian T� chi l�c, r�i ta s� th�o lu�n sau.",
			"Kh�ng th�nh v�n ��, Di�p thi�u hi�p n�u mu�n ��n C� D��ng ��ng c�n h�t s�c c�n th�n, C� D��ng ��ng kh�p n�i ��u l� c�m b�y.",
			"�a t� s� nh�c nh� c�a <sex>, l�u nay ���c <sex> gi�p ��, ta th�t r�t c�m k�ch.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,3);
	DelItem(2,0,699,1);--ɾȥ������
	AddItem(2,0,756,1,1);--�õ������ɵ�
	TaskTip("��a C�n L�n Ti�n ��n cho c�c �� t� Qu� M�n H�i Lang �ang b� th��ng.");
	Msg2Player("��a C�n L�n Ti�n ��n cho c�c �� t� Qu� M�n H�i Lang �ang b� th��ng.");
	GivePlayerAward("Award_XB_56","Easy");
	GivePlayerExp(SkeyXibei,"jiuren")
end

--δ���ɵ��������Ż��ȴ������ص���
function task_024_03_1()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"��y l� C�n L�n Ti�n ��n, c� th� gi�i kh� ��nh Th�n, ng��i �em v� ��a cho �� t� Qu� M�n H�i Lang b� th��ng, cho h� bi�t chuy�n Oan H�n gi�, ��ng th�i t�m ra ��u ngu�n c�a Gian T� chi l�c, r�i ta s� b�n lu�n sau.",
			}
	else
		strTalk = {
			"Phi�n <sex> �em C�n L�n Ti�n ��n n�y ��n cho �� t� Qu� M�n H�i Lang b� th��ng, ��ng th�i t�m hi�u v� ngu�n g�c c�a Gian T� chi l�c.",
			}
	end

	--���������ɵ�
	if GetItemCount(2,0,756) < 1 then
		AddItem(2,0,756,1,1);--�õ������ɵ�
		TaskTip("��a C�n L�n Ti�n ��n cho c�c �� t� Qu� M�n H�i Lang �ang b� th��ng.");
		Msg2Player("��a C�n L�n Ti�n ��n cho c�c �� t� Qu� M�n H�i Lang �ang b� th��ng.");
	end

	TalkEx("",strTalk);

end

--���ɵ��������˵����ص���
function task_024_04_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"C� �em Ti�u H�n T�n cho ��i s� huynh ch�a?",
			"Y�n t�m �i, ta �� ��a Ti�u H�n T�n cho ��i s� huynh r�i, huynh �y mu�n ta �em Ti�n ��n t�i �� tr� th��ng cho c�c ng��i, h�y mau d�ng �i.",
			"���c, �a t�. ��i s� huynh xem qua Ti�u H�n T�n c� d�n d� g� kh�ng?",
			"��i s� huynh n�i, trong Ti�u H�n T�n kh�ng ph�i l� Oan H�n th�t, ch� l� nh�ng Du H�n b� Gian T� chi l�c kh�ng ch�, ng��i c� bi�t n�i c�c Oan H�n b� ph�ng th�ch ra kh�ng? C� th� �� ch�nh l� ��u ngu�n c�a s�c m�nh Gian T�.",
			}
	else
		strTalk = {
			"<sex> c� �em Ti�u H�n T�n cho ��i s� huynh kh�ng?",
			"C�c h� y�n t�m, ta �� �em Ti�u H�n T�n t�i tay Di�p thi�u hi�p, ch�nh thi�u hi�p �� nh� ta �em C�n L�n Ti�n ��n ��n, c� th� gi�p c�c h� tr� th��ng, c�c h� h�y d�ng �i.",
			"<sex> th�t t�t b�ng, ta ��ng l� c�m �n kh�ng xi�t. Di�p s� huynh sau khi xem Ti�u H�n T�n c� d�n d� g� kh�ng?",
			"Di�p thi�u hi�p n�i, Oan H�n b� ni�m phong trong Ti�u H�n T�n kh�ng ph�i Oan H�n th�t, m� l� c�c Du H�n b� kh�ng ch� b�i s�c m�nh Gian T�, ng��i c� ph�t hi�n ���c n�i c�c Oan H�n ���c ph�ng th�ch ra kh�ng? C� th� �� l� ��u ngu�n c�a s�c m�nh Gian T�",
			}
	end

	TalkEx("task_024_04_0_1",strTalk);

end

--���Ի�
function task_024_04_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"N�i v�y, t�i n�i t�n c�ng c�a Qu� M�n H�i Lang ��ng l� c� m�t s�c m�nh Gian T� �ang ng�y c�ng l�n m�nh, c�c Oan H�n t� n�i �� tu�n ra kh�ng ng�ng. S�c m�nh n�y d��ng nh� c� th� kh�ng ch� ���c c�c Du H�n, s� t�nh c�p b�ch, li�n quan t�i v�n m�nh c�a c�c th�n tr�n quanh Qu� M�n H�i Lang. Gi� ta v�n ch�a h�i ph�c c�ng l�c, e l� kh�ng th� ��n ���c ��. V� c�ng c�a ng��i c� v� c�ng kh�, c� th� gi�p ta ��n xem t�nh h�nh th� n�o?",
			"Li�n quan t�i v�n m�nh c�a b� t�nh, C�n L�n th� quy�t theo ch�nh ��o, sao c� th� kh�ng �i ���c? Nh�ng kh�ng bi�t ph�i �i�u tra nh� th� n�o?",
			"Gian T� chi l�c mu�n kh�ng ch� c�c Du H�n, n�n m�t khi g�p ph�i c�c h�n ma v� t�i �t s� hi�n th�n. Ch� ta c� m�t C� H�n T�n, trong �� to�n l� nh�ng c� h�n d� qu�, ng��i c� th� mang theo v�t n�y ��n n�i ph�ng th�ch c� h�n trong Qu� M�n H�i Lang �� d� s�c m�nh n�y xu�t hi�n, �� xem th�c h� th� n�o. Ph�i h�t s�c th�n tr�ng, t�t nh�t l� n�n t�i �� c�ng v�i v�i b�ng h�u ��ng m�n. Ngu�n s�c m�nh n�y kh�ng th� xem th��ng, ch� ri�ng vi�c bi�n c�c C� h�n b�nh th��ng th�nh Li�t qu� v�i s�c m�nh gh� g�m c�ng �� bi�t uy l�c to l�n c�a n�.",
			"Ta hi�u r�i, t�m th�i ng��i c� an t�m tu d��ng, ta s� th�n tr�ng �ng ph�, vi�c n�y c� giao cho ta l� ���c.",
			}
	else
		strTalk = {
			"N�i v�y, t�i n�i t�n c�ng c�a Qu� M�n H�i Lang ��ng l� c� m�t s�c m�nh Gian T� �ang ng�y c�ng l�n m�nh, c�c Oan H�n t� n�i �� tu�n ra kh�ng ng�ng. S�c m�nh n�y d��ng nh� c� th� kh�ng ch� ���c c�c Du H�n, s� t�nh c�p b�ch, li�n quan t�i v�n m�nh c�a c�c th�n tr�n quanh Qu� M�n H�i Lang. Gi� ta v�n ch�a h�i ph�c c�ng l�c, e l� kh�ng th� ��n ���c ��. V� c�ng c�a ng��i c� v� c�ng kh�, c� th� gi�p ta ��n xem t�nh h�nh th� n�o?",
			"Li�n quan t�i v�n m�nh c�a b� t�nh, C�n L�n th� quy�t theo ch�nh ��o, ���ng nhi�n ph�i gi�p �� h�t m�nh. Nh�ng kh�ng bi�t ph�i �i�u tra nh� th� n�o?",
			"Gian T� chi l�c mu�n kh�ng ch� c�c Du H�n, n�n m�t khi g�p ph�i c�c h�n ma v� t�i �t s� hi�n th�n. Ch� ta c� m�t C� H�n T�n, trong �� to�n l� nh�ng c� h�n d� qu�, ng��i c� th� mang theo v�t n�y ��n n�i ph�ng th�ch c� h�n trong Qu� M�n H�i Lang �� d� s�c m�nh n�y xu�t hi�n, �� xem th�c h� th� n�o. Ph�i h�t s�c th�n tr�ng, t�t nh�t l� n�n t�i �� c�ng v�i v�i b�ng h�u ��ng m�n. Ngu�n s�c m�nh n�y kh�ng th� xem th��ng, ch� ri�ng vi�c bi�n c�c C� h�n b�nh th��ng th�nh Li�t qu� v�i s�c m�nh gh� g�m c�ng �� bi�t uy l�c to l�n c�a n�.",
			"Ra l� v�y, t�m th�i ng��i c� an t�m tu d��ng, ta s� th�n tr�ng �ng ph�, vi�c n�y c� giao cho ta l� ���c.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,4);
	AddItem(2,0,757,1,1);--�»���
	DelItem(2,0,756,1);--ɾȥ�����ɵ�
	TaskTip("S� d�ng C� H�n T�n d�n d� O�n H�n Chi V��ng xu�t hi�n v� ti�u di�t ch�ng.");
	Msg2Player("S� d�ng C� H�n T�n d�n d� O�n H�n Chi V��ng xu�t hi�n v� ti�u di�t ch�ng.");

end

--δ����Թ��֮�������˵ĵ��ӶԻ�
function task_024_04_1()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Gian T� chi l�c mu�n kh�ng ch� c�c Du H�n, n�n m�t khi g�p ph�i c�c h�n ma v� t�i �t s� hi�n th�n. Ch� ta c� m�t C� H�n T�n, trong �� to�n l� nh�ng c� h�n d� qu�, ng��i c� th� mang theo v�t n�y ��n n�i ph�ng th�ch c� h�n trong Qu� M�n H�i Lang �� d� s�c m�nh n�y xu�t hi�n, �� xem th�c h� th� n�o. Ph�i h�t s�c th�n tr�ng, t�t nh�t l� n�n t�i �� c�ng v�i v�i b�ng h�u ��ng m�n. Ngu�n s�c m�nh n�y kh�ng th� xem th��ng, ch� ri�ng vi�c bi�n c�c C� h�n b�nh th��ng th�nh Li�t qu� v�i s�c m�nh gh� g�m c�ng �� bi�t uy l�c to l�n c�a n�.",
			}
	else
		strTalk = {
			"Gian T� chi l�c mu�n kh�ng ch� c�c Du H�n, n�n m�t khi g�p ph�i c�c h�n ma v� t�i �t s� hi�n th�n. Ch� ta c� m�t C� H�n T�n, trong �� to�n l� nh�ng c� h�n d� qu�, ng��i c� th� mang theo v�t n�y ��n n�i ph�ng th�ch c� h�n trong Qu� M�n H�i Lang �� d� s�c m�nh n�y xu�t hi�n, �� xem th�c h� th� n�o. Ph�i h�t s�c th�n tr�ng, t�t nh�t l� n�n t�i �� c�ng v�i v�i b�ng h�u ��ng m�n. Ngu�n s�c m�nh n�y kh�ng th� xem th��ng, ch� ri�ng vi�c bi�n c�c C� h�n b�nh th��ng th�nh Li�t qu� v�i s�c m�nh gh� g�m c�ng �� bi�t uy l�c to l�n c�a n�.",
			}
	end

	TalkEx("",strTalk);

	--�����»���
	if GetItemCount(2,0,757) < 1 then
		AddItem(2,0,757,1,1);--�»���
		TaskTip("S� d�ng C� H�n T�n d�n d� O�n H�n Chi V��ng xu�t hi�n v� ti�u di�t ch�ng.");
		Msg2Player("S� d�ng C� H�n T�n d�n d� O�n H�n Chi V��ng xu�t hi�n v� ti�u di�t ch�ng.");
	end

end

--����Թ��֮�������˵����ص��ӶԻ�
function task_024_05_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"C� thu ho�ch ���c g� kh�ng? C� t�m ra ��u ngu�n s�c m�nh �ang kh�ng ch� c�c Du H�n ch�a?",
			"T�i n�i t�n c�ng c�a Qu� M�n H�i Lang, ta �� g�i ���c Oan H�n Chi V��ng xu�t hi�n, h�n r�t m�nh, c�ng may c� b�ng h�u t��ng tr�, khi h�n phi ph�ch t�n n� c� �� l�i m�t ��o ph� n�y, ta kh�ng bi�t n� l� v�t g�, ng��i xem th� �i.",
			"�a, sao v�t n�y tr�ng gi�ng Tr�n Ma Ph� c�a ph�i ta v�y, nh�ng l�i kh�ng ho�n to�n l� Tr�n Ma Ph�, d��ng nh� n� �� b� �m c�u T� ch� qu�i d� m� nh�t th�i ta c�ng kh�ng th� ph�n bi�t r� ���c. C� l� ��i s� huynh s� bi�t c�u tr� l�i.",
			"N�u l� ��o ph� c�a C�n L�n, ch�c l� ��i s� huynh s� nh�n ra, nh�ng k� n�o trong ph�i C�n L�n �� �i�u khi�n Oan H�n V��ng?",
			"Vi�c n�y ta c�ng kh�ng r�, ch�c l� c� u�n kh�c g� ��y. Gi� th��ng t�ch c�a ta �� l�nh h�n, c� th� h�nh ��ng ���c r�i. Ng��i h�y �em ��o ph� n�y giao cho ��i s� huynh, v� b�o v�i huynh �y ta s� ti�p t�c �i�u tra v� n�y, v�i ng�y n�a s� tr� v� C�n L�n.",
			"Ta hi�u. N�i n�y r�t nguy hi�m, ng��i ph�i th�n tr�ng k�o b� c�c Oan H�n �� th��ng.",
			}
	else
		strTalk = {
			"<sex> c� thu ho�ch ���c g� kh�ng? C� t�m ���c ��u ngu�n s�c m�nh kh�ng ch� c�c Du H�n ch�a?",
			"T�i n�i t�n c�ng c�a Qu� M�n H�i Lang, ta �� g�i ���c Oan H�n Chi V��ng xu�t hi�n, h�n r�t m�nh, c�ng may c� b�ng h�u t��ng tr�, khi h�n phi ph�ch t�n n� c� �� l�i m�t ��o ph� n�y, ta kh�ng bi�t n� l� v�t g�, ng��i xem th� �i.",
			"<sex> kh�ng nh�ng c� t�m l�ng hi�p ngh�a, c�n c� v� c�ng cao si�u, ta r�t kh�m ph�c. �a, sao v�t n�y tr�ng gi�ng Tr�n Ma Ph� c�a ph�i ta v�y, nh�ng l�i kh�ng ho�n to�n l� Tr�n Ma Ph�, d��ng nh� n� �� b� �m c�u T� ch� qu�i d�, ta hi�u bi�t n�ng c�n, nh�ng c� l� ��i s� huynh s� c� c�u tr� l�i.",
			"N�u l� ��o ph� c�a C�n L�n, ch�c l� Di�p thi�u hi�p s� nh�n ra, nh�ng k� n�o trong ph�i C�n L�n �� �i�u khi�n Oan H�n V��ng?",
			"Vi�c n�y ta c�ng kh�ng r�, ch�c l� c� u�n kh�c g� ��y. Gi� th��ng t�ch c�a ta �� l�nh h�n, c� th� h�nh ��ng ���c r�i. <sex> c� th� �em ��o ph� n�y giao cho Di�p s� huynh, v� b�o v�i huynh �y ta s� ti�p t�c � l�i �i�u tra v� n�y, v�i ng�y n�a m�i tr� v� C�n L�n. L�m phi�n <sex>.",
			"��ng kh�ch s�o, chuy�n nh� th�i m�. N�i n�y r�t nguy hi�m, ng��i ph�i th�n tr�ng k�o b� c�c Oan H�n �� th��ng.",
			}
	end

	SetTask(TASK_XB_ID_02,6);
	TalkEx("",strTalk);
	TaskTip("��a ��o ph� c� ���c sau khi gi�t ch�t O�n H�n Chi V��ng cho Di�p T� Thu ph�i C�n L�n, ��ng th�i b�o c�o v� chuy�n O�n H�n Chi V��ng.");
	Msg2Player("��a ��o ph� c� ���c sau khi gi�t ch�t O�n H�n Chi V��ng cho Di�p T� Thu ph�i C�n L�n, ��ng th�i b�o c�o v� chuy�n O�n H�n Chi V��ng.");
	GivePlayerAward("Award_XB_57","Easy");
	GivePlayerExp(SkeyXibei,"fuming")
end

--��δ����Ҷ����Թ��֮��һ��
function task_024_05_1()

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng��i ��a ��o ph� n�y v� cho ��i s� huynh, ��ng th�i n�i l�i v�i huynh �y ta s� ti�p t�c � l�i ��y �i�u tra, v�i ng�y n�a m�i tr� v�.",
			}
	else
		strTalk = {
			"<sex> h�y ��a gi�p ��o ph� n�y ��n tay Di�p s� huynh, v� n�i v�i huynh �y, ta s� ti�p t�c � l�i ��y �i�u tra, v�i ng�y n�a m�i v� C�n L�n. Xin c�m �n <sex>.",
			}
	end

	TalkEx("",strTalk);

end

---------------------------------- ������25��֧2_2�ؾ�����----------------------------------
--����Ҷ����Թ��֮��һ��
function task_025_01_0()

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"��i s� huynh, �� v�a tr� v� t� Qu� M�n H�i Lang, th��ng t�ch c�a �� t� C�n L�n �� l�nh h�n, h�n n�i ph�i � l�i ti�p t�c �i�u tra v� t�nh h�nh c�a Qu� M�n H�i Lang, sau �� m�i tr� v� C�n L�n. ��u ngu�n c�a Gian T� chi l�c l� do d� bi�n c�a Oan H�n Chi V��ng � n�i t�n c�ng c�a Qu� M�n H�i Lang, kh� kh�n l�m �� m�i ��nh b�i ���c h�n v� ph�t hi�n ��o ph� n�y, ��i s� huynh c� bi�t v�t n�y c� t�c d�ng g� kh�ng?",
			"�� t� Qu� M�n H�i Lang ���c b�nh y�n l� ta y�n t�m r�i. ��o ph� n�y tr�ng gi�ng v�t c�a ph�i ta, r�t gi�ng Tr�n Ma Ph� nh�ng d��ng nh� ph�p l�c c�a n� c�n m�nh h�n c� Tr�n Ma Ph�. C�n nh� khi Phi Th��ng ��o Nh�n c�n � trong m�n ph�i, ng�n s� tr��ng ch�nh l� Tr�n Ma Ph�, nh�ng sao Tr�n Ma Ph� l�i c� th� �i�u khi�n ���c ma qu�i? Ch�ng l� Phi Th��ng ��o Nh�n �� t�ng ph�p l�c cho ��o ph� n�y?",
			"Phi Th��ng ��o Nh�n l� ai? D��ng nh� ch�a t�ng nghe n�i ��n ng��i n�y.",
			"Kh�c kh�c, ng��i n�y k� ra c�ng d�i d�ng l�m. Phi Th��ng ��o Nh�n v�n l� s� b� c�a ta, 20 n�m tr��c do s� c�ng truy�n ng�i v� ch��ng m�n cho s� ph� ta n�n �� r�i kh�i C�n L�n, ��n nay v�n kh�ng cam l�ng, kh�ng ng�ng l�n k� ho�ch ph�n c�ng C�n L�n t�i C� D��ng ��ng, h�ng �o�t l�i ng�i v� ch��ng m�n. C�n L�n coi tr�ng vi�c tu t�m d��ng t�nh, sao c� th� dung t�ng l�ng tham quy�n l�c nh� th�. V�n s� ph� ta c�ng ni�m t�nh ��ng m�n m� b� qua, nh�ng theo t�nh b�o, Phi Th��ng ��o Nh�n kh�ng nh�ng c� � �� thu ph�c C� D��ng Th�, c�n qua l�i v�i T�y H�, nh�ng h�nh ��ng ph�n ��o m�i qu�c nh� th� sao c� th� tha ���c? V� th� s� ph� �� ph�i ta ��n C� D��ng ��ng thanh l� m�n h�.",
			}
	else
		strTalk = {
			"Di�p thi�u hi�p, ta v�a tr� v� t� Qu� M�n H�i Lang, th��ng t�ch c�a �� t� C�n L�n �� l�nh h�n, h�n n�i ph�i � l�i ti�p t�c �i�u tra v� t�nh h�nh c�a Qu� M�n H�i Lang, sau �� m�i tr� v� C�n L�n. ��u ngu�n c�a Gian T� chi l�c l� do d� bi�n c�a Oan H�n Chi V��ng � n�i t�n c�ng c�a Qu� M�n H�i Lang, kh� kh�n l�m ta m�i ��nh b�i ���c h�n v� ph�t hi�n ��o ph� n�y, Di�p thi�u hi�p c� bi�t v�t n�y c� t�c d�ng g� kh�ng?",
			"�� t� Qu� M�n H�i Lang ���c b�nh y�n l� ta y�n t�m r�i. ��o ph� n�y tr�ng gi�ng v�t c�a ph�i ta, r�t gi�ng Tr�n Ma Ph� nh�ng d��ng nh� ph�p l�c c�a n� c�n m�nh h�n c� Tr�n Ma Ph�. C�n nh� khi Phi Th��ng ��o Nh�n c�n � trong m�n ph�i, ng�n s� tr��ng ch�nh l� Tr�n Ma Ph�, nh�ng sao Tr�n Ma Ph� l�i c� th� �i�u khi�n ���c ma qu�i? Ch�ng l� Phi Th��ng ��o Nh�n �� t�ng ph�p l�c cho ��o ph� n�y?",
			"Phi Th��ng ��o Nh�n l� ai? C�ng l� ng��i c�a ph�i C�n L�n sao?",
			"Kh�c kh�c, ��y l� �i�u h� th�n trong m�n ph�i. Th�y l� <sex> ta c�ng kh�ng ng�i n�i th�ng. Phi Th��ng ��o Nh�n v�n l� s� b� c�a ta, 20 n�m tr��c do s� c�ng truy�n ng�i v� ch��ng m�n cho s� ph� ta n�n �� r�i kh�i C�n L�n, ��n nay v�n kh�ng cam l�ng, kh�ng ng�ng l�n k� ho�ch ph�n c�ng C�n L�n t�i C� D��ng ��ng, h�ng �o�t l�i ng�i v� ch��ng m�n. C�n L�n coi tr�ng vi�c tu t�m d��ng t�nh, sao c� th� dung t�ng l�ng tham quy�n l�c nh� th�. V�n s� ph� ta c�ng ni�m t�nh ��ng m�n m� b� qua, nh�ng theo t�nh b�o, Phi Th��ng ��o Nh�n kh�ng nh�ng c� � �� thu ph�c C� D��ng Th�, c�n qua l�i v�i T�y H�, nh�ng h�nh ��ng ph�n ��o m�i qu�c nh� th� sao c� th� tha ���c? V� th� s� ph� �� ph�i ta ��n C� D��ng ��ng thanh l� m�n h�. ",
			}
	end

	TalkEx("task_025_01_0_1",strTalk);

end

--���Ի�
function task_025_01_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ra l� v�y. Phi Th��ng ��o Nh�n kh�ng ch� c�c ma v�t n�y c�ng l� v� mu�n t�n c�ng ph�i ta �?",
			"Vi�c n�y c�ng kh�ng th� n�i r� ���c. M�y ng�y nay ta � C� D��ng ��ng kh�ng th�y t�ng t�ch c�a Phi Th��ng ��o Nh�n, ch�c l� �ang l�n tr�n ��u �� thu ph�c C� D��ng Th� r�i. Xem ra ta ph�i t�i �� l�n n�a, l�n b�ng ���c t�ng t�ch c�a Phi Th��ng ��o Nh�n.",
			"Nghe ��n C� D��ng Th� uy l�c v� song, sao c� th� d� d�ng b� thu ph�c? N�u C� D��ng Th� xu�t hi�n, ch�ng th�nh ra thi�n h� ��i lo�n?",
			"Phi Th��ng ��o Nh�n �� mai ph�c � C� D��ng ��ng su�t 20 n�m, n�u nghi�m ra ���c c�ch thu ph�c th� c�ng kh�ng l�y l�m l�. C�ng d�ng c�a ��o ph� n�y ch�nh l� nh� th�, nh�ng c� th� do ph�p l�c ch�a �� m�nh �� thu ph�c ���c C� D��ng Th�, n�n m�i d�ng cho nh�ng ma v�t y�u h�n. � ph�i, � Thi�n S� M�t C�nh c�ng c� nh�ng d� th��ng gi�ng nh� v�y, �� t� ph�i ta �� ��n �� nhi�u ng�y, nh�ng ch�a c� tin b�o v�. Ng��i c� th� ��n Thi�n S� M�t C�nh t�m h� �� n�m r� s� t�nh, c�n ta ph�i t�i C� D��ng ��ng ��i ph� v�i Phi Th��ng ��o Nh�n.",
			"Tr� ma v� ��o quy�t kh�ng t� nan, chuy�n ��n Thi�n S� M�t C�nh c� giao cho ta, Di�p thi�u hi�p h�y y�n t�m l�m c�ng vi�c thanh l� m�n h�.",
			}
	else
		strTalk = {
			"Ra l� v�y. Phi Th��ng ��o Nh�n kh�ng ch� c�c ma v�t n�y c�ng l� v� mu�n t�n c�ng ph�i ta �?",
			"Vi�c n�y c�ng kh�ng th� n�i r� ���c. M�y ng�y nay ta � C� D��ng ��ng kh�ng th�y t�ng t�ch c�a Phi Th��ng ��o Nh�n, ch�c l� �ang l�n tr�n ��u �� thu ph�c C� D��ng Th� r�i. Xem ra ta ph�i t�i �� l�n n�a, l�n b�ng ���c t�ng t�ch c�a Phi Th��ng ��o Nh�n.",
			"Nghe ��n C� D��ng Th� uy l�c v� song, sao c� th� d� d�ng b� thu ph�c? N�u C� D��ng Th� xu�t hi�n, ch�ng th�nh ra thi�n h� ��i lo�n?",
			"Phi Th��ng ��o Nh�n �� mai ph�c � C� D��ng ��ng su�t 20 n�m, n�u nghi�m ra ���c c�ch thu ph�c th� c�ng kh�ng l�y l�m l�. C�ng d�ng c�a ��o ph� n�y ch�nh l� nh� th�, nh�ng c� th� do ph�p l�c ch�a �� m�nh �� thu ph�c ���c C� D��ng Th�, n�n m�i d�ng cho nh�ng ma v�t y�u h�n. � ph�i, � Thi�n S� M�t C�nh c�ng c� nh�ng d� th��ng gi�ng nh� v�y, �� t� ph�i ta �� ��n �� nhi�u ng�y, nh�ng ch�a c� tin b�o v�. <sex> c� th� gi�p ta th�m m�t l�n, ��n Thi�n S� M�t C�nh t�m h� �� n�m r� s� t�nh, c�n ta ph�i t�i C� D��ng ��ng ��i ph� v�i Phi Th��ng ��o Nh�n.",
			"Tr� ma v� ��o quy�t kh�ng t� nan, chuy�n ��n Thi�n S� M�t C�nh c� giao cho ta, Di�p thi�u hi�p h�y y�n t�m l�m c�ng vi�c thanh l� m�n h�.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,7);
	DelItem(2,0,717,1);--ɾȥ�ǳ�����
	TaskTip("Nh�n �y th�c c�a Di�p T� Thu, l�n ���ng ��n Thi�n S� M�t C�nh t�m ki�m �� t� C�n L�n b� m�t li�n l�c.");
	Msg2Player("Nh�n �y th�c c�a Di�p T� Thu, l�n ���ng ��n Thi�n S� M�t C�nh t�m ki�m �� t� C�n L�n b� m�t li�n l�c.");

end

--��δ����ʦ�ؾ������˵����ص��ӶԻ�
function task_025_01_1()

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"� Thi�n S� M�t C�nh c�ng c� nh�ng d�u hi�u c�a Gian T� chi l�c, �� t� ph�i ta �� ��n �� nh�ng ch�a th�y tin b�o v�. Ng��i c� th� ��n Thi�n S� M�t C�nh t�m h� �� n�m r� s� t�nh, c�n ta ph�i t�i C� D��ng ��ng ��i ph� v�i Phi Th��ng ��o Nh�n.",
			}
	else
		strTalk = {
			"� Thi�n S� M�t C�nh c�ng c� nh�ng d�u hi�u c�a Gian T� chi l�c, �� t� ph�i ta �� ��n �� nh�ng ch�a th�y tin b�o v�. <sex> c� th� gi�p ta ��n Thi�n S� M�t C�nh t�m h� �� n�m r� s� t�nh, c�n ta ph�i t�i C� D��ng ��ng ��i ph� v�i Phi Th��ng ��o Nh�n.",
			}
	end

	TalkEx("",strTalk);

end

--����ʦ�ؾ������˵����ص��ӶԻ���ý�������
function task_025_02_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"S� huynh ph�i ch�ng ��n ��y �� �i�u tra v� d� th��ng c�a Thi�n S� M�t C�nh? ��i s� huynh ph�i ta ��n t�m hi�u t�nh h�nh c� ti�n tri�n g� kh�ng?",
			"S� �� ��n th�t ��ng l�c. Xin h�y chuy�n l�i l� ta �� ph�t hi�n Thi�n S� M�t C�nh c� ngu�n Gian T� chi l�c �ang t�c qu�i, khi�n C� L�u V��ng c� d�u hi�u th�c t�nh sau tr�ng th�i ng� m�. Ta b� h�n �� th��ng, hao t�n t�t c� ph�p l�c m�i mi�n c��ng phong �n ���c h�n, nh�ng l�i kh�ng c�n s�c l�c �� ti�u di�t. N�u C� L�u V��ng l�i th�c t�nh l�n n�a, e s� nguy h�i nh�n gian.",
			"� ��y c�ng c� ngu�n Gian T� chi l�c l�m C� L�u V��ng th�c t�nh �? Sao l�i tr�ng h�p v�i s� vi�c c�a Oan H�n V��ng v�y?",
			"� ng��i l� Oan H�n Chi V��ng � Qu� M�n H�i Lang �� sao? N�u Oan H�n Chi V��ng v� C� L�u V��ng c�ng l�c hi�n th� th� kh�ng ph�i l� �i�m l�nh. Oan H�n V��ng c� b� ti�u di�t ch�a?",
			"Oan H�n V��ng �� b� ta ti�u di�t, xem ra C� L�u V��ng c�ng kh�ng ���c ph�p t�n t�i n�a r�i, kh�ng bi�t c� c�ch n�o ti�u di�t C� L�u V��ng kh�ng? H�y �� ta gi�p s� huynh ti�u di�t n� v�y.",
			}
	else
		strTalk = {
			"Ph�i ch�ng ng��i ch�nh l� ng��i c�a ph�i C�n L�n ��n �i�u tra v� d� th��ng c�a Thi�n S� M�t C�nh? Di�p T� Thu ph�i ta ��n t�m hi�u t�nh h�nh c� ti�n tri�n g� kh�ng?",
			"Ra <sex> quen bi�t Di�p s� huynh. Xin h�y chuy�n l�i l� ta �� ph�t hi�n Thi�n S� M�t C�nh c� ngu�n Gian T� chi l�c �ang t�c qu�i, khi�n C� L�u V��ng c� d�u hi�u th�c t�nh sau tr�ng th�i ng� m�. Ta b� h�n �� th��ng, hao t�n t�t c� ph�p l�c m�i mi�n c��ng phong �n ���c h�n, nh�ng l�i kh�ng c�n s�c l�c �� ti�u di�t. N�u C� L�u V��ng l�i th�c t�nh l�n n�a, e s� nguy h�i nh�n gian.",
			"� ��y c�ng c� ngu�n Gian T� chi l�c l�m C� L�u V��ng th�c t�nh �? Sao l�i tr�ng h�p v�i s� vi�c c�a Oan H�n V��ng v�y?",
			"<sex> �ang n�i t�i Oan H�n Chi V��ng trong Qu� M�n H�i Lang ph�i kh�ng? N�u Oan H�n Chi V��ng v� C� L�u V��ng c�ng l�c hi�n th� th� kh�ng ph�i l� �i�m l�nh. Oan H�n V��ng c� b� ti�u di�t ch�a?",
			"Oan H�n V��ng �� b� ta ti�u di�t, xem ra C� L�u V��ng c�ng kh�ng ���c ph�p t�n t�i n�a r�i, kh�ng bi�t c� c�ch n�o ti�u di�t C� L�u V��ng kh�ng? H�y �� ta gi�p s� huynh ti�u di�t n� v�y.",
			}
	end

	TalkEx("task_025_02_0_1",strTalk);

end

--���Ի�
function task_025_02_0_1()

local strTalk = {}
local nCruseIndex = random(1,getn(KULOUWANG_CURSE));

	SetTask(KULOUWANG_CURSE_ID,nCruseIndex);

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"C� L�u V��ng �ang b� ta phong �n t�i n�i t�n c�ng c�a Thi�n S� M�t C�nh, n�u mu�n ti�u di�t th� ph�i nh�n l�c n�y. Ng��i c� th� d�ng c�u T� ch� n�y �� gi�i phong �n, sau �� c�ng Tr�m Y�u Ph� ti�u di�t h�n. Ch� d�ng sai T� ch�, v� n�u d�ng sai T� ch� trong l�c gi�i phong �n, C� L�u V��ng s� tho�t ra, m�t khi h�n ph�c h�i ph�p l�c s� r�t kh� ��i ph�.",
			"Xin h�i s� huynh c�u T� ch� l� g�?",
			"Ng��i ph�i nh� cho k� T� ch� l� "..KULOUWANG_CURSE[nCruseIndex]..", n�u ��c sai th� phong �n s� kh�ng gi�i tr� ���c ��u.",
			"Hi�u r�i, ta s� c�n th�n. S� huynh c� y�n t�m d��ng th��ng.",
			}
	else
		strTalk = {
			"C� L�u V��ng �ang b� ta phong �n t�i n�i t�n c�ng c�a Thi�n S� M�t C�nh, n�u mu�n ti�u di�t th� ph�i nh�n l�c n�y. Tuy <sex> kh�ng ph�i ng��i c�a ph�i C�n L�n ta, nh�ng l�i c� t�m l�ng ph�c ma hi�p ngh�a, ta xin �a t� <sex>. Phong �n c� th� d�ng c�u T� ch� �� gi�i tr�, sau �� c�ng Tr�m Y�u Ph� ti�u di�t h�n. Ch� d�ng sai T� ch�, v� n�u d�ng sai T� ch� trong l�c gi�i phong �n, C� L�u V��ng s� tho�t ra, m�t khi h�n ph�c h�i ph�p l�c s� r�t kh� ��i ph�.",
			"Xin h�i c�c h� c�u T� ch� l� g�?",
			"Ng��i ph�i nh� cho k� T� ch� l� "..KULOUWANG_CURSE[nCruseIndex]..", n�u ��c sai th� phong �n s� kh�ng gi�i tr� ���c ��u.",
			"Hi�u r�i, ta s� c�n th�n. Xin c� y�n t�m d��ng th��ng.",
			}
	end

	TalkEx("",strTalk);
	AddItem(2,0,758,1,1);--ն����
	SetTask(TASK_XB_ID_02,8);
	TaskTip("Nh�n �y th�c c�a �� t� C�n L�n, l�n ���ng �i ��n n�i C� L�u V��ng b� phong �n �� ti�u di�t h�n.");
	Msg2Player("Nh�n �y th�c c�a �� t� C�n L�n, l�n ���ng �i ��n n�i C� L�u V��ng b� phong �n �� ti�u di�t h�n.");

end

--��δ����������
function task_025_02_1()

local nCruseIndex = GetTask(KULOUWANG_CURSE_ID);
local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"C� L�u V��ng �� b� ta phong �n t�i n�i t�n c�ng c�a Thi�n S� M�t C�nh, c� th� d�ng c�u T� ch� l�n tr��c ta �� truy�n th� �� gi�i tr�, sau d�ng Tr�m Y�u Ph� �� ti�u di�t. Ch� d�ng sai T� ch�, v� n�u d�ng sai T� ch� trong l�c gi�i phong �n, C� L�u V��ng s� tho�t ra, m�t khi h�n ph�c h�i ph�p l�c s� r�t kh� ��i ph�.",
			"H�y nh� c�u T� ch� gi�i tr� phong �n l� "..KULOUWANG_CURSE[nCruseIndex]..", n�u ��c sai th� phong �n s� kh�ng gi�i tr� ���c ��u.",
			}
	else
		strTalk = {
			"C� L�u V��ng �� b� ta phong �n t�i n�i t�n c�ng c�a Thi�n S� M�t C�nh, c� th� d�ng c�u T� ch� l�n tr��c ta �� truy�n th� �� gi�i tr�, sau d�ng Tr�m Y�u Ph� �� ti�u di�t. Ch� d�ng sai T� ch�, v� n�u d�ng sai T� ch� trong l�c gi�i phong �n, C� L�u V��ng s� tho�t ra, m�t khi h�n ph�c h�i ph�p l�c s� r�t kh� ��i ph�.",
			"H�y nh� c�u T� ch� gi�i tr� phong �n l� "..KULOUWANG_CURSE[nCruseIndex]..", n�u ��c sai th� phong �n s� kh�ng gi�i tr� ���c ��u.",
			}
	end

	TalkEx("",strTalk);

	--����ն����
	if GetItemCount(2,0,758) < 1 then
		AddItem(2,0,758,1,1);--ն����
		TaskTip("Nh�n �y th�c c�a �� t� C�n L�n, l�n ���ng �i ��n n�i C� L�u V��ng b� phong �n �� ti�u di�t h�n.");
		Msg2Player("Nh�n �y th�c c�a �� t� C�n L�n, l�n ���ng �i ��n n�i C� L�u V��ng b� phong �n �� ti�u di�t h�n.");
	end

end

--�ɹ����������������ص��ӶԻ�
function task_025_03_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng��i c� ti�u di�t ���c C� L�u V��ng ch�a? C� b� th��ng kh�ng?",
			"Nh� b� phong �n, uy l�c c�a C� L�u V��ng b� gi�m �i r�t nhi�u, n�n ta kh�ng b� th��ng g�. Khi b� ti�u di�t c�ng gi�ng nh� l�c ta di�t tr� Oan H�n V��ng, ��u �� l�i ��o ph� n�y, s�c m�nh c�a C� L�u V��ng v� Oan H�n V��ng ��u ��n t� c�ng m�t ngu�n, xem ra l� c�ng m�t th� ph�m.",
			"H�a ra chuy�n � Qu� M�n H�i Lang c�ng c� li�n quan, e l� vi�c th�c t�nh c�a C� L�u V��ng l� �i�u b�t th��ng. C� L�u V��ng tuy �� b� di�t, nh�ng n�u v�n c�n c�c y�u v�t kh�c th� kh�ng hay ch�t n�o. �� �� ph�ng b�t tr�c, c� l� ta s� � l�i ��y ti�p t�c �i�u tra, c�n ng��i tr� v� b�o v�i ��i s� huynh chuy�n c�a C� L�u V��ng � Thi�n S� M�t C�nh. Ta ph�i � l�i ��y th�m v�i h�m.",
			"���c, ta s� b�o l�i v�i ��i s� huynh, ng��i � l�i ph�i c�n th�n h�nh s�.",
			}
	else
		strTalk = {
			"<sex> c� ti�u di�t ���c C� L�u V��ng ch�a? C� b� th��ng kh�ng?",
			"Nh� b� phong �n, uy l�c c�a C� L�u V��ng b� gi�m �i r�t nhi�u, n�n ta kh�ng b� th��ng g�. Khi b� ti�u di�t c�ng gi�ng nh� l�c ta di�t tr� Oan H�n V��ng, ��u �� l�i ��o ph� n�y, s�c m�nh c�a C� L�u V��ng v� Oan H�n V��ng ��u ��n t� c�ng m�t ngu�n, xem ra l� c�ng m�t th� ph�m.",
			"H�a ra chuy�n � Qu� M�n H�i Lang c�ng c� li�n quan, e l� vi�c th�c t�nh c�a C� L�u V��ng l� �i�u b�t th��ng. C� L�u V��ng tuy �� b� di�t, nh�ng n�u v�n c�n c�c y�u v�t kh�c th� kh�ng hay ch�t n�o. �� �� ph�ng b�t tr�c, c� l� ta s� � l�i ��y ti�p t�c �i�u tra, n�u <sex> quen bi�t v�i Di�p s� huynh, c� th� phi�n Ng��i b�o l�i v�i huynh �y chuy�n C� L�u V��ng � Thi�n S� M�t C�nh? Ta ph�i � l�i ��y th�m v�i h�m. �a t� s� gi�p �� c�a <sex>, ph�i C�n L�n c�m k�ch b�t t�n.",
			"Xin ��ng kh�ch s�o. T�i s� truy�n ��t t�nh h�nh c� th� ��n Di�p thi�u hi�p, ng��i � l�i nh� ph�i th�t c�n tr�ng.",
			}
	end

	SetTask(TASK_XB_ID_02,10);
	TalkEx("",strTalk);
	TaskTip("Nh�n �y th�c c�a �� t� C�n L�n, �em s� vi�c C� L�u V��ng � Thi�n S� M�t C�nh b�o l�i v�i Di�p T� Thu.");
	Msg2Player("Nh�n �y th�c c�a �� t� C�n L�n, �em s� vi�c C� L�u V��ng � Thi�n S� M�t C�nh b�o l�i v�i Di�p T� Thu.");
	GivePlayerAward("Award_XB_58","Easy");
	GivePlayerExp(SkeyXibei,"jiefengzhouyu")
end

--��δ��֪Ҷ����������һ��
function task_025_03_1()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"H�y b�o l�i v�i ��i s� huynh chuy�n C� L�u V��ng � Thi�n S� M�t C�nh, ta ph�i � l�i th�m v�i ng�y �� xem c�n c� ma v�t n�o n�a kh�ng. �a t� s� gi�p �� c�a <sex>, ph�i C�n L�n c�m k�ch b�t t�n.",
			}
	else
		strTalk = {
			"Nh� <sex> chuy�n l�i ��n Di�p s� huynh v� chuy�n C� L�u V��ng � Thi�n S� M�t C�nh, ta ph�i � l�i th�m v�i ng�y �� xem c�n c� ma v�t n�o n�a kh�ng. �a t� s� gi�p �� c�a <sex>, ph�i C�n L�n c�m k�ch b�t t�n.",
			}
	end

	TalkEx("",strTalk);

end

--��֪Ҷ����������һ��
function task_025_04_0()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"��i s� huynh, C� L�u V��ng � Thi�n S� M�t C�nh �� th�c t�nh, nh�ng �� ���c ng��i c�a ph�i ta phong �n k�p th�i. Khi ti�u di�t C� L�u V��ng, �� c�ng t�m ���c m�t ��o ph�, gi�ng y c�ch th�c �� kh�ng ch� Oan H�n V��ng.",
			"Ta v�a tr� v� t� C� D��ng ��ng, t�i C� D��ng ��ng ta ng�u nhi�n ph�t hi�n t�ng t�ch c�a Phi Th��ng ��o Nh�n, nh�ng h�n ph�ng th�ch c�c ma v�t �� ���c thu�n h�a r�i t�u tho�t. Khi ta ti�u di�t c�c ma v�t n�y m�i ph�t hi�n t�t c� ��u b� kh�ng ch� b�i ��o ph�. K�t h�p v�i l�i k� c�a ng��i, c� th� ch�c ch�n vi�c th�c t�nh c�a Oan H�n V��ng v� C� L�u V��ng l� do Phi Th��ng ��o Nh�n g�y ra. Ch��ng m�n �� c�m nh�n ���c d� th��ng � C�n L�n s�n �ang gia t�ng, d��ng nh� s� c� y�u v�t xu�t hi�n. Phi Th��ng ��o Nh�n tr�n trong C� D��ng ��ngsu�t 20 n�m, vi�c thu�n h�a C� D��ng Th� ch� l� v�n �� th�i gian.",
			"��n r�ng C� D��ng Th� t�nh t�nh hung b�o, l� m�i h�a c�a nh�n gian, Phi Th��ng ��o Nh�n v� c�i l�i ri�ng m� ph� m�c an nguy c�a b� t�nh, ph�ng th�ch C� D��ng Th�, �t s� g�y n�n ��i h�a.",
			"��ng v�y, n�n s� ph� ta m�i quy�t t�m thanh l� m�n h�, ch� e Phi Th��ng ��o Nh�n �� s�p thu ph�c ���c C� D��ng Th�, b�ng kh�ng sao h�n l�i v�i v�ng ti�p x�c v�i ng��i T�y H�? �� c�u b� t�nh thi�n h�, �t ph�i tr�ng tr� Phi Th��ng ��o Nh�n, b�o v� C�n L�n ch�nh ��o. � ph�i, ta v�n c�n m�t vi�c mu�n nh� ng��i gi�p ��.",
			}
	else
		strTalk = {
			"Di�p thi�u hi�p, C� L�u V��ng � Thi�n S� M�t C�nh�� th�c t�nh, nh�ng �� b� �� t� C�n L�n phong �n. Khi ti�u di�t C� L�u V��ng, c� ph�t hi�n th�m m�t ��o ph�, gi�ng h�t nh� c�ch �� kh�ng ch� Oan H�n V��ng.",
			"Ta v�a tr� v� t� C� D��ng ��ng, t�i C� D��ng ��ng ta ng�u nhi�n ph�t hi�n t�ng t�ch c�a Phi Th��ng ��o Nh�n, nh�ng h�n ph�ng th�ch c�c ma v�t �� ���c thu�n h�a r�i t�u tho�t. Khi ta ti�u di�t c�c ma v�t n�y m�i ph�t hi�n t�t c� ��u b� kh�ng ch� b�i ��o ph�. K�t h�p v�i l�i k� c�a ng��i, c� th� ch�c ch�n vi�c th�c t�nh c�a Oan H�n V��ng v� C� L�u V��ng l� do Phi Th��ng ��o Nh�n g�y ra. Ch��ng m�n �� c�m nh�n ���c d� th��ng � C�n L�n s�n �ang gia t�ng, d��ng nh� s� c� y�u v�t xu�t hi�n. Phi Th��ng ��o Nh�n tr�n trong C� D��ng ��ngsu�t 20 n�m, vi�c thu�n h�a C� D��ng Th� ch� l� v�n �� th�i gian.",
			"��n r�ng C� D��ng Th� t�nh t�nh hung b�o, l� m�i h�a c�a nh�n gian, Phi Th��ng ��o Nh�n v� c�i l�i ri�ng m� ph� m�c an nguy c�a b� t�nh, ph�ng th�ch C� D��ng Th�, �t s� g�y n�n ��i h�a.",
			"<sex> n�i r�t c� l�, v�y n�n s� ph� ta m�i quy�t t�m thanh l� m�n h�, ch� e Phi Th��ng ��o Nh�n �� s�p thu ph�c ���c C� D��ng Th�, b�ng kh�ng sao h�n l�i v�i v�ng ti�p x�c v�i ng��i T�y H�? �� c�u b� t�nh thi�n h�, �t ph�i tr�ng tr� Phi Th��ng ��o Nh�n, b�o v� C�n L�n ch�nh ��o. <sex> �� gi�p �� ph�i C�n L�n r�t nhi�u, ta th�t kh�ng bi�t ph�i n�i g� �� c�m �n. � ph�i, ta v�n c�n m�t vi�c mu�n nh� <sex> gi�p ��. ",
			}
	end

	TalkEx("task_025_04_0_1",strTalk);

end

--���Ի�
function task_025_04_0_1()

local strTalk = {}

		--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"��i s� huynh ��ng kh�ch s�o. Xin c� d�n d�.",
			"Ph� th�n ta � Ph�ng T��ng �� l�u kh�ng th�y li�n l�c, l�n tr��c ng��i c� nh�c ��n ph� th�n � qu� nh� th��ng lo l�ng cho ta, b�n th�n ta c�ng r�t mong nh� Ng��i, ng��i c� th� thay ta b�o b�nh an cho ph� th�n? Ngo�i ra vi�c s� ph� giao ph� c�ng s�p ho�n th�nh, s�p t�i ta c� th� v� �o�n t� v�i ph� th�n r�i. Xin h�y chuy�n l�i t�i ph� th�n ta �ang � Ph�ng T��ng ph� ���c an t�m.",
			"Kh�ng ng� ��i s� huynh c�ng l� ng��i con hi�u th�o. ��i s� huynh c� y�n t�m, �� s� chuy�n l�i c�a huynh ��n Di�p l�o, huynh c� y�n t�m ��n C� D��ng ��ng, nh�ng d��ng nh� ph�p l�c c�a Phi Th��ng ��o Nh�n �� t�ng r�t nhi�u, huynh ph�i c�n th�n.",
			"(C�n n�a ta qu�n b�o v�i �u D��ng ti�n b�i v� m�c ��ch nh�p th� c�a ph�i ta. �i t�m �ng �y n�i r� t�nh h�nh r�i m�i t�i ch� Di�p l�o v�y.)",
			}
	else
		strTalk = {
			"Di�p thi�u hi�p kh�ch s�o qu�, b�ng h�u gi�p �� nhau l� vi�c n�n l�m. Xin c� n�i ��ng ng�i. ",
			"Ph� th�n ta � Ph�ng T��ng �� l�u kh�ng li�n l�c, l�n tr��c <sex> c� nh�c ��n ph� th�n � qu� nh� th��ng lo l�ng cho ta, b�n th�n ta c�ng r�t mong nh� Ng��i, <sex> c� th� thay ta b�o b�nh an cho ph� th�n? Ngo�i ra vi�c s� ph� giao ph� c�ng s�p ho�n th�nh, s�p t�i ta c� th� v� �o�n t� v�i ph� th�n r�i. Xin h�y chuy�n l�i t�i ph� th�n ta �ang � Ph�ng T��ng ph� ���c an t�m.",
			"H�a ra Di�p thi�u hi�p c�ng l� ng��i con hi�u th�o. Thi�u hi�p c� y�n t�m, ta s� chuy�n l�i ��n Di�p l�o, huynh c� y�n t�m ��n C� D��ng ��ng, nh�ng d��ng nh� ph�p l�c c�a Phi Th��ng ��o Nh�n �� t�ng r�t nhi�u, huynh ph�i c�n th�n.",
			"(M�c ��ch nh�p th� c�a C�n L�n �� r� r�ng r�i, tr��c khi t�i ch� Di�p l�o ch�c ta n�n �i t�m �u D��ng ti�n b�i n�i r� s� t�nh.)",
			}
	end

	TalkEx("task_025_04_0_2",strTalk);

end

--������
function task_025_04_0_2()

	give_ss_award(59);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		DelItem(2,0,717,1);--�ǳ�����
		SetTask(TASK_XB_ID_02,11);
		CreateTrigger(4,210,TALK_XB_OUYANGHUA);
		TaskTip("�em m�c ��ch nh�p th� c�a C�n L�n ph�i n�i r� v�i �u D��ng ti�n b�i.");
		Msg2Player("�em m�c ��ch nh�p th� c�a C�n L�n ph�i n�i r� v�i �u D��ng ti�n b�i.");
		GivePlayerAward("Award_XB_59","Easy");
		GivePlayerExp(SkeyXibei,"fuhui")
	end
end

--��δ��֪ŷ������������һ������
function task_025_04_1()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"�� l�u ta kh�ng li�n l�c g� v�i ph� th�n � Ph�ng T��ng, l�n tr��c ng��i c� nh�c ��n ph� th�n � qu� nh� th��ng lo l�ng cho ta, b�n th�n ta c�ng r�t mong nh� Ng��i, ng��i c� th� thay ta b�o b�nh an cho ph� th�n? Ta s� nhanh ch�ng ho�n th�nh c�ng vi�c s� ph� giao ph� �� v� �o�n t� v�i ph� th�n.",
			"Kh�ng ng� ��i s� huynh c�ng l� ng��i con hi�u th�o. ��i s� huynh c� y�n t�m, �� s� chuy�n l�i c�a huynh ��n Di�p l�o, huynh c� y�n t�m ��n C� D��ng ��ng, nh�ng d��ng nh� ph�p l�c c�a Phi Th��ng ��o Nh�n �� t�ng r�t nhi�u, huynh ph�i c�n th�n.",
			"(C�n n�a ta qu�n b�o v�i �u D��ng ti�n b�i v� m�c ��ch nh�p th� c�a ph�i ta. �i t�m �ng �y n�i r� t�nh h�nh r�i m�i t�i ch� Di�p l�o v�y.)",
			}
	else
		strTalk = {
			"�� l�u ta kh�ng li�n l�c g� v�i ph� th�n � Ph�ng T��ng, l�n tr��c <sex> c� nh�c ��n ph� th�n � qu� nh� th��ng lo l�ng cho ta, b�n th�n ta c�ng r�t mong nh� Ng��i, <sex> c� th� thay ta b�o b�nh an cho ph� th�n? Ta s� nhanh ch�ng ho�n th�nh c�ng vi�c s� ph� giao ph� �� v� �o�n t� v�i ph� th�n.",
			"H�a ra Di�p thi�u hi�p c�ng l� ng��i con hi�u th�o. Thi�u hi�p c� y�n t�m, ta s� chuy�n l�i ��n Di�p l�o, huynh c� y�n t�m ��n C� D��ng ��ng, nh�ng d��ng nh� ph�p l�c c�a Phi Th��ng ��o Nh�n �� t�ng r�t nhi�u, huynh ph�i c�n th�n.",
			"(M�c ��ch nh�p th� c�a C�n L�n �� r� r�ng r�i, tr��c khi t�i ch� Di�p l�o ch�c ta n�n �i t�m �u D��ng ti�n b�i n�i r� s� t�nh.)",
			}
	end

	TalkEx("",strTalk);

	--����ŷ�����Ի�������
	if GetTrigger(TALK_XB_OUYANGHUA) == 0 then
		CreateTrigger(4,210,TALK_XB_OUYANGHUA);
		TaskTip("�em m�c ��ch nh�p th� c�a C�n L�n ph�i n�i r� v�i �u D��ng ti�n b�i.");
		Msg2Player("�em m�c ��ch nh�p th� c�a C�n L�n ph�i n�i r� v�i �u D��ng ti�n b�i.");
	end

end

--��δ��֪ŷ������������һ��������Ҷ�϶Ի�����ŷ�����Ի�������
function task_025_04_2()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Kh�ng ng� C�n L�n nh�p th� l�i d�y l�n nhi�u nghi k� nh� v�y, vi�c quan tr�ng tr��c m�t l� ph�i ��n g�p �u D��ng H�a b�m r� ng�n ng�nh.",
			}
	else
		strTalk = {
			"Kh�ng ng� C�n L�n nh�p th� l�i d�y l�n nhi�u nghi k� nh� v�y, vi�c quan tr�ng tr��c m�t l� ph�i ��n g�p �u D��ng H�a b�m r� ng�n ng�nh.",
			}
	end

	TalkEx("",strTalk);

	--����ŷ�����Ի�������
	if GetTrigger(TALK_XB_OUYANGHUA) == 0 then
		CreateTrigger(4,210,TALK_XB_OUYANGHUA);
		TaskTip("Mau ch�ng n�i r� nguy�n do C�n L�n nh�p th� v�i �u D��ng ti�n b�i.");
		Msg2Player("Mau ch�ng n�i r� nguy�n do C�n L�n nh�p th� v�i �u D��ng ti�n b�i.");
	end

end


---------------------------------- ������26��֧2_3�ǳ�����----------------------------------
--����ŷ������������һ������

function task_026_01_0()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"�u D��ng ti�n b�i, m�c ��ch nh�p th� c�a C�n L�n �� r�, b�nh th��ng ch�ng t�i ch� h�ng y�u tr� ma � ch�n r�ng s�u, g�n ��y do Trung Nguy�n Giang T�n th�n y�u ma ho�nh h�nh, c� nguy c� lan sang c�c th�n l�ng l�n c�n, C�n L�n ph�i m�i xu�t hi�n quanh v�ng Giang T�n th�n, khi�n c�c bang ph�i Trung Nguy�n l�m t��ng ch�ng t�i c� �m m�u, s� th�t l� y�u ma hi�n th�, C�n L�n truy hung, ��i s� huynh Di�p T� Thu c� d�n, n�u C�n L�n g�y n�n hi�u l�m g�. Xin b� qu� cho.",
			"Kh�ng ng� C�n L�n ph�i tuy �t xu�t hi�n tr�n giang h� l�i quan t�m ��n thi�n h� b� t�nh nh� v�y, th�t ��ng qu�. Ma qu� xu�t hi�n quanh Giang T�n th�n �� bi�n quanh v�ng th�nh qu� v�c. C�n L�n gi�p s�c l� �i�u ��ng qu�, ta s� cho b� c�u ��a th� ��n c�c bang ph�i, ��ng nghi k� ng��i c�a C�n L�n, �� tr�nh nh�ng tranh ch�p kh�ng ��ng c�.",
			"�� t� C�n L�n �a ph�n ��u chuy�n t�m tu luy�n, ��t vi�c tr�m y�u tr� ma l�n h�ng ��u, �t khi tranh ch�p so �o c�ng ai, m�i ng��i ��u mong ���c chung s�ng h�a m�c v�i c�c bang ph�i Trung Nguy�n.",
			}
	else
		strTalk = {
			"�u D��ng ti�n b�i, m�c ��ch nh�p th� c�a C�n L�n ph�i �� ���c l�m r�. C�n L�n kh�ng ph�i kh�ng h�nh t�u Trung Nguy�n, ch� l� t�p trung h�ng y�u tr� ma � ch�n r�ng s�u. G�n ��y Trung Nguy�n Giang T�n th�n y�u ma ho�nh h�nh, c� nguy c� lan sang c�c th�n l�ng l�n c�n, C�n L�n ph�i m�i xu�t hi�n quanh v�ng Giang T�n th�n, khi�n c�c bang ph�i Trung Nguy�n l�m t��ng ch�ng t�i c� �m m�u, s� th�t l� y�u ma hi�n th�, C�n L�n truy hung, ��i s� huynh c� d�n, n�u C�n L�n g�y n�n hi�u l�m g�. Xin b� qu� cho.",
			"Kh�ng ng� C�n L�n ph�i tuy �t xu�t hi�n tr�n giang h� l�i quan t�m ��n thi�n h� b� t�nh nh� v�y, th�t ��ng qu�. Ma qu� xu�t hi�n quanh Giang T�n th�n �� bi�n quanh v�ng th�nh qu� v�c. C�n L�n gi�p s�c l� �i�u ��ng qu�, ta s� cho b� c�u ��a th� ��n c�c bang ph�i, ��ng nghi k� ng��i c�a C�n L�n, �� tr�nh nh�ng tranh ch�p kh�ng ��ng c�.",
			"�� t� C�n L�n ��u chuy�n t�m tu luy�n, t�m l�ng b�c �i, ai ai c�ng ��t vi�c tr�m y�u tr� ma l�n ��u, l� m�t m�n ph�i ��ng k�nh.",
			}
	end

	TalkEx("task_026_01_0_1",strTalk);

end

--���Ի�
function task_026_01_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Gian T� y�u nghi�t chuy�n l�m �i�u �c m� l�i kh� di�t tr�, ta ph�i th�ng b�o ��n c�c bang ph�i, tr� gi�p C�n L�n tr�m y�u tr� ma. Nay ��i T�ng qu�c n�n li�n mi�n, v� l�m ��ng ��o ph�i ��ng t�m hi�p l�c, m�t l�ng gi�t ��ch m�i ph�i.",
			"Ti�n b�i d�y ph�i l�m, chuy�n c�a C�n L�n ph�i xin nh� ti�n b�i n�i gi�p cho. Ta c�n c� vi�c. Xin c�o t�.",
			"(Mong sao c�c bang ph�i Trung Nguy�n ��ng l�m kh� C�n L�n. M�n ph�i ta m�t l�ng tr� ma c�u th�, nh�ng l�i b� hi�u l�m th� qu� l� kh�ng ��ng. Kh�ng bi�t hi�n gi� s�c kh�e Di�p l�o th� n�o?)",
			}
	else
		strTalk = {
			"Gian T� y�u nghi�t chuy�n l�m �i�u �c m� l�i kh� di�t tr�, ta ph�i th�ng b�o ��n c�c bang ph�i, tr� gi�p C�n L�n tr�m y�u tr� ma. Nay ��i T�ng qu�c n�n li�n mi�n, v� l�m ��ng ��o ph�i ��ng t�m hi�p l�c, m�t l�ng gi�t ��ch m�i ph�i.",
			"Ti�n b�i d�y ph�i l�m, chuy�n c�a C�n L�n ph�i xin nh� ti�n b�i n�i gi�p cho. Ta c�n c� vi�c. Xin c�o t�.",
			"(Mong sao c�c bang ph�i Trung Nguy�n ��ng l�m kh� C�n L�n. M�n ph�i ta m�t l�ng tr� ma c�u th�, nh�ng l�i b� hi�u l�m th� qu� l� kh�ng ��ng. Kh�ng bi�t hi�n gi� s�c kh�e Di�p l�o th� n�o?)",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,12);
	TaskTip("Thay Di�p T� Thu ��n v�n an Di�p l�o.");
	Msg2Player("Thay Di�p T� Thu ��n v�n an Di�p l�o.");

end

--��Ҷ������Ҷ�ϱ�ƽ��
function task_026_02_0()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ch�o Di�p l�o! Ng��i v�n m�nh kh�e ch�?",
			"Ch�o <sex>! Sao r�nh t�i th�m ta v�y? C�i th�n gi� n�y v�n kh�e, nh�ng g�n ��y th�i ti�t th�t th��ng, khi�n ta th�p th�m kh�ng y�n. <sex> ��n ��y c� vi�c g�?",
			"Di�p s� huynh n�i l�o m�t m�nh s�ng t�i Ph�ng T��ng, n�n r�t mong nh�, nh� ta ��n b�o v�i l�o, nhi�m v� c�a s� ph� giao cho �� s�p ho�n th�nh, s� nhanh ch�ng tr� v� �o�n t� v�i l�o. Xin ��ng lo l�ng qu�.",
			"Ra l� v�y, ta c�ng �ang ��nh h�i th�m n� ��y. Kh�ng bi�t s� ph� c�c ng��i giao nhi�m v� g� m� ��n gi� n� v�n ch�a xong. S� vi�c c� kh� kh�n l�m kh�ng? Ch�c l� v� n� kh�ng �� s�c g�nh v�c r�i.",
			"Kh�ng ��u, kh�ng ��u, s� vi�c l�n n�y r�t ph�c t�p, Di�p s� huynh tu�i tr� t�i cao, l�i c� ch� l�n, phen n�y ��n C� D��ng ��ng ch�c ch�n s� ho�n th�nh nhi�m v� ���c giao.",
			"C�i� c�i g�? C� C� D��ng ��ng� N� ph�i ��n C� D��ng ��ng th�t sao?",
			}
	else
		strTalk = {
			"Ch�o Di�p l�o! Ng��i v�n m�nh kh�e ch�?",
			"Ch�o <sex>! Sao r�nh t�i th�m ta v�y? C�i th�n gi� n�y v�n kh�e, nh�ng g�n ��y th�i ti�t th�t th��ng, khi�n ta th�p th�m kh�ng y�n. <sex> ��n ��y c� vi�c g�?",
			"G�n ��y ta v� Di�p T� Thu - con c�a Di�p l�o kh� th�n, nghe huynh �y nh�c l�o �ang s�ng � Ph�ng T��ng, r�t nh� mong l�o, n�n �� nh� ta ��n nh�n v�i l�i, nhi�m v� m� s� ph� huynh �y giao ph� �� s�p ho�n th�nh, s� nhanh ch�ng tr� v� �o�n t� v�i l�o. Mong l�o ��ng th��ng nh� qu�.",
			"Ra l� v�y, ta c�ng �ang ��nh h�i <sex> v� ti�u nhi ��y. Kh�ng bi�t s� ph� n� giao nhi�m v� g� m� ��n gi� v�n ch�a l�m xong. S� vi�c c� kh� kh�n l�m kh�ng? Ch�c l� v� n� kh�ng �� s�c g�nh v�c.",
			"Kh�ng ��u, kh�ng ��u, s� vi�c l�n n�y r�t ph�c t�p, Di�p thi�u hi�p tu�i tr� t�i cao, l�i c� ch� l�n, phen n�y ��n C� D��ng ��ng ch�c ch�n s� ho�n th�nh nhi�m v� ���c giao.",
			"C�i� c�i g�? C� C� D��ng ��ng� N� ph�i ��n C� D��ng ��ng th�t sao?",
			}
	end

	TalkEx("task_026_02_0_1",strTalk);

end

--���Ի�
function task_026_02_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Di�p l�o h�y b�o tr�ng, ��ng n�n lo l�ng qu�. Chuy�n g� v�y? C� ph�i C� D��ng ��ng l� n�i r�t nguy hi�m? ",
			"Kh�ng� kh�ng ���c �� n� ��n C� D��ng ��ng, tuy�t ��i kh�ng ���c �� n� ��n C� D��ng ��ng, �� ��n �� r�i th� kh�ng tr� ra ���c n�a.",
			"Di�p l�o xin h�y b�nh t�nh. Di�p s� huynh l� ��i �� t� C�n L�n, v� c�ng cao c��ng, Di�p l�o ��ng qu� lo l�ng. Ph�i ch�ng C� D��ng ��ng c� �i�u g� b�t th��ng?",
			"<sex> kh�ng bi�t �� th�i, nhi�u n�m tr��c ��y C� D��ng ��ng �� n�i ti�ng l� n�i hi�m �c, l� m�t n�i ch�t ng��i. �� t�ng c� ng��i ��o 1 v�t s�ng l�p l�nh v� b� ��n l� v�ng, thu h�t r�t nhi�u ng��i ��n xem v� ��o b�i. V� sau ng��i tham gia ��o c�ng ng�y �t �i v� m�t �i kh�ng tr� l�i. T� �� truy�n r�ng kho b�u c�a C� D��ng ��ng c� d� th� tr�n gi�, nh�ng k� tham lam ��u ph�i b� m�ng v� n�i ��y b� b� hoang t� ��.",
			}
	else
		strTalk = {
			"Di�p l�o h�y b�o tr�ng, ��ng n�n lo l�ng qu�. Chuy�n g� v�y? C� ph�i C� D��ng ��ng l� n�i r�t nguy hi�m? ",
			"Kh�ng� kh�ng ���c �� n� ��n C� D��ng ��ng, tuy�t ��i kh�ng ���c �� n� ��n C� D��ng ��ng, �� ��n �� r�i th� kh�ng tr� ra ���c n�a.",
			"Di�p l�o xin h�y b�nh t�nh. Di�p s� huynh l� ��i �� t� C�n L�n, v� c�ng cao c��ng, Di�p l�o ��ng qu� lo l�ng. Ph�i ch�ng C� D��ng ��ng c� �i�u g� b�t th��ng?",
			"<sex> kh�ng bi�t �� th�i, nhi�u n�m tr��c ��y C� D��ng ��ng �� n�i ti�ng l� n�i hi�m �c, l� m�t n�i ch�t ng��i. �� t�ng c� ng��i ��o 1 v�t s�ng l�p l�nh v� b� ��n l� v�ng, thu h�t r�t nhi�u ng��i ��n xem v� ��o b�i. V� sau ng��i tham gia ��o c�ng ng�y �t �i v� m�t �i kh�ng tr� l�i. T� �� truy�n r�ng kho b�u c�a C� D��ng ��ng c� d� th� tr�n gi�, nh�ng k� tham lam ��u ph�i b� m�ng v� n�i ��y b� b� hoang t� ��.",
			}
	end

	TalkEx("task_026_02_0_2",strTalk);

end

--���Ի�
function task_026_02_0_2()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Tin ��n b�n trong C� D��ng ��ng c� d� th� kh�p thi�n h� ai ai c�ng bi�t, ta �� t�ng ��n ��ng �y, nh�ng ch�a t�ng th�y d� th� n�o c�.",
			"D� th� l� c� th�t ��y. Th�t ra T� Thu c�n c� m�t huynh tr��ng song sinh, l�c nh� do b�t c�n l�c v�o C� D��ng ��ng, t� �� kh�ng th�y tr� ra, e l� �� ch�t d��i m�ng vu�t d� th�. V� ta m�t s�m, c�n l�i ta v� T� Thu s�ng n��ng t�a nhau. Nam nhi ch� t�i b�n ph��ng, n� � C�n L�n ph�i l�m n�n c� nghi�p, ta r�t m�ng, nh�ng tuy�t ��i kh�ng ���c b�n m�ng ��n C� D��ng ��ng.",
			"Di�p l�o y�n t�m, Di�p s� huynh v� c�ng cao c��ng, �t s� g�p d� h�a l�nh. Hay �� ta ��n �� t�m huynh �y xem c� gi�p ���c g� kh�ng, v� c�ng �� Di�p l�o y�n t�m.",
			"�a t� <sex>, �a t� <sex>, c� <sex> gi�p s�c th� ta y�n t�m h�n. Xin ��ng n�i v�i n� chuy�n huynh �� song sinh trong C� D��ng ��ng, �� tr�nh ph�n t�m m� l� vi�c. R�t bi�t �n <sex> �� gi�p �� cho con ta.",
			"Di�p l�o ��ng kh�ch s�o, c�ng ��ng lo l�ng qu�, ta nh�t ��nh s� d�c s�c gi�p �� Di�p s� huynh. Xin c�o t�.",
			}
	else
		strTalk = {
			"Tin ��n b�n trong C� D��ng ��ng c� d� th� kh�p thi�n h� ai ai c�ng bi�t, ta �� t�ng ��n ��ng �y, nh�ng ch�a t�ng th�y d� th� n�o c�.",
			"D� th� l� c� th�t ��y. Th�t ra T� Thu c�n c� m�t huynh tr��ng song sinh, l�c nh� do b�t c�n l�c v�o C� D��ng ��ng, t� �� kh�ng th�y tr� ra, e l� �� ch�t d��i m�ng vu�t d� th�. V� ta m�t s�m, c�n l�i ta v� T� Thu s�ng n��ng t�a nhau. Nam nhi ch� t�i b�n ph��ng, n� � C�n L�n ph�i l�m n�n c� nghi�p, ta r�t m�ng, nh�ng tuy�t ��i kh�ng ���c b�n m�ng ��n C� D��ng ��ng.",
			"Di�p l�o y�n t�m, Di�p thi�u hi�p v� c�ng cao c��ng, �t s� g�p d� h�a l�nh. Hay �� ta ��n �� t�m huynh �y xem c� gi�p ���c g� kh�ng, v� c�ng �� Di�p l�o y�n t�m.",
			"�a t� <sex>, �a t� <sex>, c� <sex> gi�p s�c th� ta y�n t�m h�n. Xin ��ng n�i v�i n� chuy�n huynh �� song sinh trong C� D��ng ��ng, �� tr�nh ph�n t�m m� l� vi�c. R�t bi�t �n <sex> �� gi�p �� cho con ta.",
			"Di�p l�o ��ng kh�ch s�o, c�ng ��ng lo l�ng qu�, ta nh�t ��nh s� d�c s�c gi�p �� Di�p thi�u hi�p. Xin c�o t�.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,13);
	TaskTip("Nh�n l�i �y th�c c�a Di�p l�o, ��n gi�p �� Di�p T� Thu.");
	Msg2Player("Nh�n l�i �y th�c c�a Di�p l�o, ��n gi�p �� Di�p T� Thu.");
	GivePlayerAward("Award_XB_60","Easy");
	GivePlayerExp(SkeyXibei,"zaihuiyenao")
end

--δ��Ҷ����Ի���Ҷ�϶Ի�
function task_026_02_1()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"�a t� <sex>, �a t� <sex>, c� <sex> gi�p s�c th� ta y�n t�m h�n. Xin ��ng n�i v�i n� chuy�n huynh �� song sinh trong C� D��ng ��ng, �� tr�nh ph�n t�m m� l� vi�c. R�t bi�t �n <sex> �� gi�p �� cho con ta.",
			}
	else
		strTalk = {
			"�a t� <sex>, �a t� <sex>, c� <sex> gi�p s�c th� ta y�n t�m h�n. Xin ��ng n�i v�i n� chuy�n huynh �� song sinh trong C� D��ng ��ng, �� tr�nh ph�n t�m m� l� vi�c. R�t bi�t �n <sex> �� gi�p �� cho con ta.",
			}
	end

	TalkEx("",strTalk);

end

--��Ҷ��������Ҷ����Ի�
function task_026_03_0()

local strTalk = {};

	--�ȼ�����
	if GetLevel() < 85 then
		if GetPlayerRoute() == 100 then
			strTalk = {
				"��ng ti�c c�ng l�c c�a ng��i c�n y�u, b�ng kh�ng thu ph�c t�n ph�n �� C�n L�n Phi Th��ng ��o Nh�n nh�t ��nh ph�i nh� ��n s� gi�p �� c�a ng��i."
				}
		else
			strTalk = {
				"Di�p T� Thu: ��ng ti�c <sex> v� c�ng c�n k�m, ch�a ��t ��n {c�p 85}. N�u thu ph�c {��o nh�n} n�y nh�t ��nh ph�i t�m ng��i gi�p �� r�i."
				}
		end
		TalkEx("",strTalk);
		return
	end

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Sao ��i s� huynh l�i b� th��ng? Th��ng t�ch c� n�ng l�m kh�ng?",
			"V�t th��ng kh�ng ��ng ng�i. Ta v� nh�t th�i s� � �� Phi Th��ng ��o Nh�n d�n d� v�o s�u trong ��ng, b� c�c ma v�t ���c h�n thu ph�c t�n c�ng, kh� kh�n l�m m�i tho�t ra ���c nh�ng v�n b� b�n y�u v�t l�m b� th��ng. Phi Th��ng ��o Nh�n �� thu ph�c m�t l��ng l�n y�u v�t, h�n ch�nh l� k� �� kh�ng ch� Oan H�n V��ng v� C� L�u V��ng. H�n ch� d�ng y�u v�t m� kh�ng hi�n th�n, ta e vi�c thu ph�c C� D��ng Th� �� ��n giai �o�n quy�t ��nh.",
			"S� huynh ph�i b�o tr�ng, m�i c� th� d�c s�c gi�t ��ch. �� �� chuy�n l�i c�a huynh ��n Di�p l�o, Ng��i r�t m�nh kh�e, huynh kh�ng c�n ph�i lo l�ng. S� huynh, C� D��ng Th� c� th�t s� t�n t�i kh�ng?",
			"C� D��ng Th� l� c� th�t, tuy b�n ngo�i c� nhi�u l�i ��n, nh�ng s� ph� �� t�ng c� � ��nh thu ph�c ch�ng, sau ph�t hi�n C� D��ng Th� ch� t�n c�ng nh�ng k� x�m nh�p v�o trong ��ng, l�y ��ng kh�u l�m ranh gi�i, tuy�t nhi�n kh�ng c� � ra ngo�i. Thi�n h� v�n v�t ��u c� linh kh�, quy lu�t t� nhi�n kh�ng n�n b� ph� v� b�i � ngh�a c�a con ng��i, n�u ma v�t kh�ng ra kh�i ��ng l�m h�i ng��i, th� con ng��i kh�ng c�n ph�i �u�i c�ng di�t t�n. Ch�nh v� th� s� ph� �� th�i � ��nh thu ph�c C� D��ng Th�. Kh�ng ng� Phi Th��ng ��o Nh�n t�m thu�t b�t ch�nh, v� l�i �ch c�a b�n th�n, b� ngo�i tai s� s�ng c�n c�a b� t�nh, quy�t thu ph�c cho b�ng ���c.",
			}
	else
		strTalk = {
			"Sao thi�u hi�p l�i b� th��ng? Th��ng t�ch c� n�ng l�m kh�ng?",
			"<sex> y�n t�m, v�t th��ng kh�ng ��ng ng�i. Ta v� nh�t th�i s� � �� Phi Th��ng ��o Nh�n d�n d� v�o s�u trong ��ng, b� c�c ma v�t ���c h�n thu ph�c t�n c�ng, kh� kh�n l�m m�i tho�t ra ���c nh�ng v�n b� b�n y�u v�t l�m b� th��ng. Phi Th��ng ��o Nh�n �� thu ph�c m�t l��ng l�n y�u v�t, h�n ch�nh l� k� �� kh�ng ch� Oan H�n V��ng v� C� L�u V��ng. H�n ch� d�ng y�u v�t m� kh�ng hi�n th�n, ta e vi�c thu ph�c C� D��ng Th� �� ��n giai �o�n quy�t ��nh.",
			"Thi�u hi�p ph�i b�o tr�ng, m�i c� th� d�c s�c gi�t ��ch. Ta �� chuy�n l�i c�a thi�u hi�p ��n Di�p l�o, Ng��i r�t m�nh kh�e, thi�u hi�p ch� lo. Xin h�i thi�u hi�p, C� D��ng Th� c� th�t hay kh�ng?",
			"C� D��ng Th� l� c� th�t, tuy b�n ngo�i c� nhi�u l�i ��n, nh�ng s� ph� �� t�ng c� � ��nh thu ph�c ch�ng, sau ph�t hi�n C� D��ng Th� ch� t�n c�ng nh�ng k� x�m nh�p v�o trong ��ng, l�y ��ng kh�u l�m ranh gi�i, tuy�t nhi�n kh�ng c� � ra ngo�i. Thi�n h� v�n v�t ��u c� linh kh�, quy lu�t t� nhi�n kh�ng n�n b� ph� v� b�i � ngh�a c�a con ng��i, n�u ma v�t kh�ng ra kh�i ��ng l�m h�i ng��i, th� con ng��i kh�ng c�n ph�i �u�i c�ng di�t t�n. Ch�nh v� th� s� ph� �� th�i � ��nh thu ph�c C� D��ng Th�. Kh�ng ng� Phi Th��ng ��o Nh�n t�m thu�t b�t ch�nh, v� l�i �ch c�a b�n th�n, b� ngo�i tai s� s�ng c�n c�a b� t�nh, quy�t thu ph�c cho b�ng ���c.",
			}
	end

	TalkEx("task_026_03_0_1",strTalk);

end

--���Ի�
function task_026_03_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"M�t khi C� D��ng Th� b� thu ph�c s� l� ��i h�a cho thi�n h�, l� ki�p n�n c�a b� t�nh, b�ng m�i gi� ph�i di�t tr� Phi Th��ng ��o Nh�n. S� huynh h�y y�n t�m tu d��ng, �� s� thay huynh �i thu ph�c Phi Th��ng ��o Nh�n.",
			"Sao? Phi Th��ng ��o Nh�n ph�p l�c cao c��ng, nh�ng hi�n nay h�n �ang t�p trung thu ph�c C� D��ng Th�, �t s� b� ph�n t�m, h�n n�a c�c ma v�t m� h�n thu ph�c ���c ��u �� b� ta ti�u di�t c� r�i, gi� ch�nh l� th�i c� t�t nh�t �� tr� kh� h�n. Th�i ���c, vi�c n�y s� giao cho ��, �� ph�i h�t s�c c�n th�n, Phi Th��ng ��o Nh�n d� g� c�ng l� s� b� c�a ch�ng ta, ch�a k� h�n c�n c� c�u k�t v�i T�y V�c.",
			"S� huynh y�n t�m, �� bi�t m�nh ph�i l�m g�. Huynh c� y�n t�m d��ng th��ng.",
			}
	else
		strTalk = {
			" M�t khi C� D��ng Th� b� thu ph�c s� l� ��i h�a cho thi�n h�, l� ki�p n�n c�a b� t�nh, di�t tr� Phi Th��ng ��o Nh�n �� kh�ng c�n l� vi�c thanh l� m�n h� c�a C�n L�n, m� l� tr�ch nhi�m c�a to�n thi�n h�. Thi�u hi�p c� y�n t�m tu d��ng, vi�c thu ph�c Phi Th��ng ��o Nh�n c� giao cho ta.",
			"Sao ta c� th� l�m phi�n <sex> ���c? <sex> �� gi�p C�n L�n ta r�t nhi�u r�i, n�u l�n n�y c�n �� <sex> ph�i m�o hi�m th� th�t �y n�y qu�.",
			"Xin ch� n�i v�y. Ta di�t tr� Phi Th��ng ��o Nh�n l� v� b� t�nh trong thi�n h�, kh�ng ph�i gi�p C�n L�n thanh l� m�n h�, thi�u hi�p c� y�n t�m, ta s� c�n th�n khi ��i ph� v�i Phi Th��ng ��o Nh�n.",
			"Ta bi�t ph�i n�i g� tr��c t�m l�ng hi�p ngh�a c�a <sex>, T� Thu xin �a t� �n t��ng tr� c�a <sex>. Phi Th��ng ��o Nh�n c�n c� c�u k�t v�i T�y H�, c�n �� cao c�nh gi�c.",
			}
	end

	SetTask(TASK_XB_ID_02,14);
	TalkEx("",strTalk);
	TaskTip("��n t�ng m�t C� D��ng ��ng gi�p Di�p T� Thu ��nh b�i Phi Th��ng ��o Nh�n.");
	Msg2Player("��n t�ng m�t C� D��ng ��ng gi�p Di�p T� Thu ��nh b�i Phi Th��ng ��o Nh�n.");

end

--δ�򵹷ǳ����˶Ի�
function task_026_03_1()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Phi Th��ng ��o Nh�n d� g� c�ng l� s� b� c�a ch�ng ta, l�i c�n c�u k�t v�i T�y V�c, �� ph�i h�t s�c �� ph�ng.",
			}
	else
		strTalk = {
			"T� Thu xin �a t� �n t��ng tr� c�a <sex>. Phi Th��ng ��o Nh�n c�n c� c�u k�t v�i T�y H�, c�n �� cao c�nh gi�c.",
			}
	end

	TalkEx("",strTalk);

end

---------------------------------- ������27��֧2_4��������----------------------------------
--�򵹷ǳ����˺���Ҷ����Ի�
function task_027_01_0()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"�� v� r�i ��y �, ta c� lo l�ng cho s� an nguy c�a ��.",
			"�a t� s� quan t�m c�a ��i s� huynh, Phi Th��ng ��o Nh�n �� b� ch� ph�c, nh�ng tr�n ng��i h�n �� t�m th�y m�nh v�n c�a ��n d��c Th�n b�, kh�ng bi�t c� c�ng d�ng g�. Ngo�i ra c�n c� m�t th� trao ��i v�i T�y H�, m�i �m m�u ��u c� c� trong th� n�y.",
			"Qu� nhi�n Phi Th��ng ��o Nh�n c� c�u k�t v�i T�y H�, mau ��a m�t th� cho ta xem. H�, v� ham mu�n c� nh�n m� b� m�c �n o�n n��c nh�, T�y H� v�n lu�n ch�c ch� chi�m l�nh Trung Nguy�n, Phi Th��ng ��o Nh�n l�i mu�n m��n th� l�c c�a ch�ng �� ��nh C�n L�n, ch�ng ph�i �� v� t�nh gi�p T�y H� ���c th�a nguy�n �� sao? T�n n�y th�t qu� hi�m �c. Trong th� c� nh�c ch� c�n ba ng�y l� c� th� thu ph�c C� D��ng Th�, �� � C� D��ng ��ng c� th�y C� D��ng Th� kh�ng?",
			"� trong ��ng �� kh�ng th�y con C� D��ng Th� n�o c�, ch� th�y Phi Th��ng ��o Nh�n �ang �i tr� ra, tr�n ng��i �em theo r�t nhi�u Phi Th��ng ��o ph�, ch�c l� d�ng �� h� th�n trong l�c thu ph�c y�u v�t. Th� l� �� �� ch�n ���ng h�n.",
			}
	else
		strTalk = {
			"<sex> v� r�i sao? Ta c� lo cho s� an nguy c�a <sex>.",
			"�a t� s� quan t�m c�a thi�u hi�p, Phi Th��ng ��o Nh�n �� b� ch� ph�c, nh�ng tr�n ng��i h�n ta t�m ���c m�nh v�n c�a ��n d��c Th�n b�, kh�ng bi�t c� c�ng d�ng g�. Ngo�i ra c�n c� m�t th� trao ��i v�i T�y H�, m�i �m m�u ��u c� c� trong th� n�y.",
			"Qu� nhi�n Phi Th��ng ��o Nh�n c� c�u k�t v�i T�y H�, mau ��a m�t th� cho ta xem. H�, v� ham mu�n c� nh�n m� b� m�c �n o�n n��c nh�, T�y H� v�n lu�n ch�c ch� chi�m l�nh Trung Nguy�n, Phi Th��ng ��o Nh�n l�i mu�n m��n th� l�c c�a ch�ng �� ��nh C�n L�n, ch�ng ph�i �� v� t�nh gi�p T�y H� ���c th�a nguy�n �� sao? T�n n�y th�t qu� hi�m �c. Trong th� c� nh�c ch� c�n ba ng�y l� c� th� thu ph�c C� D��ng Th�, �� � C� D��ng ��ng c� th�y C� D��ng Th� kh�ng?",
			"� trong ��ng �� kh�ng th�y con C� D��ng Th� n�o c�, ch� th�y Phi Th��ng ��o Nh�n �ang �i tr� ra, tr�n ng��i �em theo r�t nhi�u Phi Th��ng ��o ph�, ch�c l� d�ng �� h� th�n trong l�c thu ph�c y�u v�t. Th� l� �� �� ch�n ���ng h�n.",
			}
	end

	TalkEx("task_027_01_0_1",strTalk);

end

--���Ի�
function task_027_01_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"(Phi Th��ng ��o Nh�n c�u k�t v�i T�y H�, �� b� ta di�t tr�, nh�ng n�u T�y H� l�i cho ng��i ��n t�m Phi Th��ng ��o Nh�n th� th�n ph�n c�a ta s� b�i l�. Ch�c ch�n T�y H� v� mu�n c� ���c Tr��ng Sinh B�t T� ��n m�i gi�p Phi Th��ng ��o Nh�n t�n c�ng C�n L�n, vi�c n�y bi�t x� tr� ra sao ��y? Tr��c h�t n�n ph�ng ��i s� nguy hi�m c�a C� D��ng ��ng v� uy l�c c�a C� D��ng Th� v�i Nh�t Ph�m ���ng �� tranh th� th�m ch�t th�i gian.)",
			"Xem ra th�i h�n ba ng�y ���c nh�c ��n trong th� l� th�t, b�ng kh�ng Phi Th��ng ��o Nh�n c�ng kh�ng c�n v�i v�ng �i t�m y�u v�t h� th�n. Nh�ng m�nh v�n Kim ��n n�y tr�ng gi�ng H�a Luy�n Kim ��n, khi ma v�t d�ng Kim ��n n�y ���c 49 ng�y, n� s� ph�t huy t�c d�ng khi�n ch�ng ph�c t�ng m�nh l�nh c�a ng��i cho thu�c. Ngo�i ra sau khi d�ng ��n d��c n�y, uy l�c c�a ma v�t s� t�ng g�p tr�m l�n. ",
			"Theo b�c th� n�y, C� D��ng Th� �� ���c d�ng thu�c ��n ng�y th� 46, n�u kh�ng ti�p t�c th� k�t qu� s� nh� th� n�o?",
			}
	else
		strTalk = {
			"(Phi Th��ng ��o Nh�n c�u k�t v�i T�y H�, �� b� ta di�t tr�, nh�ng n�u T�y H� l�i cho ng��i ��n t�m Phi Th��ng ��o Nh�n th� th�n ph�n c�a ta s� b�i l�. Ch�c ch�n T�y H� v� mu�n c� ���c Tr��ng Sinh B�t T� ��n m�i gi�p Phi Th��ng ��o Nh�n t�n c�ng C�n L�n, vi�c n�y bi�t x� tr� ra sao ��y? Tr��c h�t n�n ph�ng ��i s� nguy hi�m c�a C� D��ng ��ng v� uy l�c c�a C� D��ng Th� v�i Nh�t Ph�m ���ng �� tranh th� th�m ch�t th�i gian.)",
			"Xem ra th�i h�n ba ng�y ���c nh�c ��n trong th� l� th�t, b�ng kh�ng Phi Th��ng ��o Nh�n c�ng kh�ng c�n v�i v�ng �i t�m y�u v�t h� th�n. Nh�ng m�nh v�n Kim ��n n�y tr�ng gi�ng H�a Luy�n Kim ��n, khi ma v�t d�ng Kim ��n n�y ���c 49 ng�y, n� s� ph�t huy t�c d�ng khi�n ch�ng ph�c t�ng m�nh l�nh c�a ng��i cho thu�c. Ngo�i ra sau khi d�ng ��n d��c n�y, uy l�c c�a ma v�t s� t�ng g�p tr�m l�n. ",
			"Theo b�c th� n�y, C� D��ng Th� �� ���c d�ng thu�c ��n ng�y th� 46, n�u kh�ng ti�p t�c th� k�t qu� s� nh� th� n�o?",
			}
	end

	TalkEx("task_027_01_0_2",strTalk);

end

--���Ի�
function task_027_01_0_2()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Vi�c n�y ta c�ng kh�ng r� l�m, ph�i h�i s� ph� m�i ���c. Nh�ng tr��c m�t l� ph�i nhanh ch�ng gi�i tr� Kim ��n chi l�c, mu�n v�y c�n ph�i nh� ��n ngu�n s�c m�nh t��ng kh�c v�i d� th�. T�ng 2 C� D��ng ��ng c� hai d� v�t l� X�ch Luy�n H�a H� v� Li�t Nham Ly Long, ch�ng c� th� chung s�ng v�i C� D��ng Th�, ch�c h�n c�ng c� kh� n�ng �c ch� n�. �� h�y ��n t�ng 2 C� D��ng ��ng l�y 10 �u�i H�a H� v�  10 Ly Long Tu, ��i ta h�i r� s� ph�, l�m T�a Y�u Ph� c� th� x�a d��c l�c c�a Kim ��n.",
			"V�y th� t�t qu�, nh�ng kh�ng bi�t t�nh h�nh C� D��ng Th� ra sao, ch�ng c� n�y sinh d� bi�n sau khi d�ng Kim ��n hay kh�ng?",
			"Vi�c n�y c�ng ��ng lo l�m, �� ta t�m m�t �� t� ��ng tin c�y ��n C� D��ng ��ng t�m th�i phong �n C� D��ng Th�, m�t l� �� ng�n ch�n d� bi�n, hai l� tranh th� th�i gian. Vi�c kh�ng th� ch�m tr�, ta chia nhau ra h�nh s�.",
			"T�t, v�y �� s� ��n t�ng 2 C� D��ng ��ng tr��c ��y.",
			}
	else
		strTalk = {
			"Vi�c n�y ta c�ng kh�ng r� l�m, ph�i h�i s� ph� m�i ���c. Nh�ng tr��c m�t l� ph�i nhanh ch�ng gi�i tr� Kim ��n chi l�c, mu�n v�y c�n ph�i nh� ��n ngu�n s�c m�nh t��ng kh�c v�i d� th�. T�ng 2 C� D��ng ��ng c� hai d� v�t l� X�ch Luy�n H�a H� v� Li�t Nham Ly Long, ch�ng c� th� chung s�ng v�i C� D��ng Th�, ch�c h�n c�ng c� kh� n�ng �c ch� n�. �� h�y ��n t�ng 2 C� D��ng ��ng l�y 10 �u�i H�a H� v�  10 Ly Long Tu, ��i ta h�i r� s� ph�, l�m T�a Y�u Ph� c� th� x�a d��c l�c c�a Kim ��n.",
			"V�y th� t�t qu�, nh�ng kh�ng bi�t t�nh h�nh C� D��ng Th� ra sao, ch�ng c� n�y sinh d� bi�n sau khi d�ng Kim ��n hay kh�ng?",
			"Vi�c n�y c�ng ��ng lo l�m, �� ta t�m m�t �� t� ��ng tin c�y ��n C� D��ng ��ng t�m th�i phong �n C� D��ng Th�, m�t l� �� ng�n ch�n d� bi�n, hai l� tranh th� th�i gian. Vi�c kh�ng th� ch�m tr�, ta chia nhau ra h�nh s�.",
			"T�t, v�y �� s� ��n t�ng 2 C� D��ng ��ng tr��c ��y.",
			}
	end

	TalkEx("",strTalk);
	DelItem(2,0,700,1);--��������Ƭ
	DelItem(2,0,701,1);--��������
	SetTask(TASK_XB_ID_02,16);
	CreateTrigger(0,1239,KILL_XB_LIEYANCHILONG);--�������ɱ�ִ�����
	CreateTrigger(0,1240,KILL_XB_CHILIANHUOHU);--�������ɱ�ִ�����
	TaskTip("��n t�ng 2 C� D��ng ��ng t�m 10 Ly Long Tu v� �u�i H�a H�.");
	Msg2Player("��n t�ng 2 C� D��ng ��ng t�m 10 Ly Long Tu v� �u�i H�a H�.");
	GivePlayerAward("Award_XB_61","Easy");
	GivePlayerExp(SkeyXibei,"feichangdaoren")
end

--�ռ���δ�ռ���10�����β�������
function task_027_02_0()

local strTalk = {};

	--������Ʒ
	if GetItemCount(2,0,702) >= 10 and GetItemCount(2,0,703) >= 10 then

		--�����ɵ��ӶԻ�
		if GetPlayerRoute() == 100 then
			strTalk = {
				"��i s� huynh, ��y l� 10 �u�i H�a H� v� 10 Ly Long Tu, huynh c� h�i ���c c�ch gi�i tr� t�c d�ng c�a Kim ��n ch�a?",
				"Ta �� h�i r� s� ph� r�i, n�u ma v�t d�ng H�a Luy�n Kim ��n ch�a �� 49 ng�y m� �� ng�ng l�i, ma v�t �t s� c� d� bi�n, s�c m�nh c�a Kim ��n s� l�m b�c ph�t ma t�nh. C� D��ng Th� v�n kh�ng ra kh�i ��ng, e l� l�n n�y v�i t�c d�ng c�a Kim ��n ch�ng s� v��t qua ranh gi�i, h�u qu� kh�n l��ng. �� t� m� ta ph�i �i ch�c c�ng kh�ng ch�ng �� ���c l�u, ta s� ch� T�a Y�u Ph� cho �� ngay.",
				"C� D��ng Th� ch�c �� xu�t hi�n d� bi�n, kh�ng bi�t v� s� huynh ��n phong �n ch�ng c� ���c an to�n kh�ng?",
				"�� y�n t�m, �� t� ta ph�i �i c� th�a n�ng l�c phong �n C� D��ng Th�. �� ph�i h�t s�c th�n tr�ng, uy l�c c�a C� D��ng Th� v�n �� m�nh, nay l�i c� th�m t�c d�ng c�a Kim ��n, c�ng kh�ng d� ��i ph�. T�a Y�u Ph� n�y c� th� gi�p �� gi�i tr� t�c d�ng c�a Kim ��n trong c� th� C� D��ng Th�, nh� v�y s� nh� g�nh cho �� h�n. �� c� th� �em theo ��o M�c Ki�m c�a ta �i c�ng, ��a n� cho �� t� �ang tr�n gi� t�i ��, v� s� vi�c h� tr�ng, ta �� c�n d�n kh�ng ���c nh� d� tin ai h�t.",
				"Nh� v�y l� t�t. Chuy�n kh�ng th� ch�m tr�, n�u C� D��ng Th� x�ng ra th� gay go.",
				}
		else
			strTalk = {
				"Thi�u hi�p, ��y l� 10 �u�i H�a H� v� 10 Ly Long Tu, thi�u hi�p c� h�i ���c c�ch gi�i tr� t�c d�ng c�a Kim ��n ch�a?",
				"Ta �� h�i r� s� ph� r�i, n�u ma v�t d�ng H�a Luy�n Kim ��n ch�a �� 49 ng�y m� �� ng�ng l�i, ma v�t �t s� c� d� bi�n, s�c m�nh c�a Kim ��n s� l�m b�c ph�t ma t�nh. C� D��ng Th� v�n kh�ng ra kh�i ��ng, e l� l�n n�y v�i t�c d�ng c�a Kim ��n ch�ng s� v��t qua ranh gi�i, h�u qu� kh�n l��ng. �� t� m� ta ph�i �i ch�c c�ng kh�ng ch�ng �� ���c l�u, ta s� ch� T�a Y�u Ph� cho �� ngay.",
				"C� D��ng Th� ch�c �� xu�t hi�n d� bi�n, �� t� ���c ph�i ��n phong �n ch�ng li�u c� ���c an to�n kh�ng?",
				"Y�n t�m, �� t� ta ph�i �i c� th�a n�ng l�c phong �n C� D��ng Th�. Ng��i ph�i h�t s�c th�n tr�ng, uy l�c c�a C� D��ng Th� v�n �� m�nh, nay l�i c� th�m t�c d�ng c�a Kim ��n, c�ng kh�ng d� ��i ph�. T�a Y�u Ph� n�y c� th� gi�p ng��i gi�i tr� t�c d�ng c�a Kim ��n trong c� th� C� D��ng Th�, nh� v�y s� nh� g�nh cho ng��i h�n. Ng��i c� th� �em theo ��o M�c Ki�m c�a ta �i c�ng, ��a n� cho �� t� C�n L�n �ang tr�n gi� t�i ��, v� s� vi�c h� tr�ng, ta �� c�n d�n kh�ng ���c nh� d� tin ai h�t.",
				"Nh� v�y l� t�t. Chuy�n kh�ng th� ch�m tr�, n�u C� D��ng Th� x�ng ra th� gay go.",
				}
		end
		DelItem(2,0,702,10);
		DelItem(2,0,703,10);
		AddItem(2,0,704,1,1);--������
		AddItem(2,0,759,1,1);--��ľ��
		RemoveTrigger(GetTrigger(KILL_XB_LIEYANCHILONG));
		RemoveTrigger(GetTrigger(KILL_XB_CHILIANHUOHU));
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID_02,17);
		TaskTip("��n t�ng 2 C� D��ng ��ng t�m �� t� ph�i C�n L�n v� ��a ��o M�c Ki�m, h�i v� tr� c�a C� D��ng Th�.");
		Msg2Player("��n t�ng 2 C� D��ng ��ng t�m �� t� ph�i C�n L�n v� ��a ��o M�c Ki�m, h�i v� tr� c�a C� D��ng Th�.");
		GivePlayerAward("Award_XB_62","Easy");
		GivePlayerExp(SkeyXibei,"guyangdong")
	--û�д�����Ʒand�������񴥷���
	else

		--�����ɵ��ӶԻ�
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Ng��i h�y ��n t�ng 2 C� D��ng ��ng t�m 10 �u�i H�a H� v� 10 Ly Long Tu, ta s� ph�i �� t� th�n t�n ��n C� D��ng ��ng t�m th�i phong �n C� D��ng Th�, ��i sau khi ta h�i r� s� ph� c�ch gi�i tr� t�c d�ng Kim ��n r�i th�o lu�n ti�p.",
				}
		else
			strTalk = {
				"Phi�n <sex> �i ��n t�ng 2 C� D��ng ��ng t�m 10 �u�i H�a H� v� 10 Ly Long Tu, ta s� cho �� t� th�n t�n ��n C� D��ng ��ng t�m th�i phong �n C� D��ng Th�, ��i sau khi h�i r� c�ch gi�i tr� t�c d�ng Kim ��n r�i th�o lu�n ti�p.",
				}
		end

		if	GetTrigger(KILL_XB_LIEYANCHILONG) == 0 then
			CreateTrigger(0,1239,KILL_XB_LIEYANCHILONG);--�������ɱ�ִ�����
			TaskTip("��n t�ng 2 C� D��ng ��ng t�m 10 Ly Long Tu v� �u�i H�a H�.");
			Msg2Player("��n t�ng 2 C� D��ng ��ng t�m 10 Ly Long Tu v� �u�i H�a H�.");
		end

		if	GetTrigger(KILL_XB_CHILIANHUOHU) == 0 then
			CreateTrigger(0,1240,KILL_XB_CHILIANHUOHU);--�������ɱ�ִ�����
			TaskTip("��n t�ng 2 C� D��ng ��ng t�m 10 Ly Long Tu v� �u�i H�a H�.");
			Msg2Player("��n t�ng 2 C� D��ng ��ng t�m 10 Ly Long Tu v� �u�i H�a H�.");
		end

		TalkEx("",strTalk);
	end

end

--δ�����ص��ӶԻ���Ϥ����������
function task_027_02_1()

local strTalk = {};

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng��i h�y ��a ��o M�c Ki�m cho �� t� C�n L�n �ang ��ng t�i t�ng 2 C� D��ng ��ng, sau �� c� th� d�ng T�a Y�u Ph� thu ph�c C� D��ng Th�.",
			}
	else
		strTalk = {
			"Ng��i h�y ��a ��o M�c Ki�m cho �� t� C�n L�n �ang ��ng t�i t�ng 2 C� D��ng ��ng, sau �� c� th� d�ng T�a Y�u Ph� thu ph�c C� D��ng Th�.",
			}
	end

	TalkEx("",strTalk);

	--������ľ����������
	if GetItemCount(2,0,704) < 1 then
		AddItem(2,0,704,1,1);--������
	end

	if GetItemCount(2,0,759) < 1 then
		AddItem(2,0,759,1,1);--��ľ��
	end

end

--�����ص��ӶԻ���Ϥ����������
function task_027_03_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(GuYangShou_MapData));
local xWPos,yWPos,xPos,yPos = GuYangShou_MapData[nMapDataIndex][1],GuYangShou_MapData[nMapDataIndex][2],GuYangShou_MapData[nMapDataIndex][3],GuYangShou_MapData[nMapDataIndex][4]
local nNpcIndex = 0;

	--���������ʧ����Ҫ��30���Ӳ�������ˢ��������
	if GetTime()-GetTask(CREAT_GUYANGSHOU_TIME)	>= 1800 then

		--�����ɵ��ӶԻ�
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Sao ng��i l�i ��n ��y? N�i n�y r�t nguy hi�m, n�u kh�ng c� vi�c g� th� h�y �i mau!",
				"��i s� huynh ph�i ta ��n thu ph�c C� D��ng Th�, ��y l� ��o M�c Ki�m c�a huynh �y.",
				"Ra l� ng��i c�a ��i s� huynh, tuy C� D��ng Th� �� b� ta phong �n, nh�ng ta c�ng �� b� th��ng, uy l�c c�a C� D��ng Th� qu� m�nh, phong �n ch�c kh�ng th� duy tr� ���c l�u. Ng��i ��n ��ng l�c l�m, gi� ta s� gi�i tr� phong �n, ng��i ph�i c�n th�n.",
				"�� t� tu�n l�nh!",
				}
		else
			strTalk = {
				"Ai ��? N�i n�y r�t nguy hi�m, n�u kh�ng c� vi�c g� th� mau r�i kh�i ��y.",
				"Ta ��n ��y �� thu ph�c C� D��ng Th�, ��y l� ��o M�c Ki�m c�a Di�p T� Thu thi�u hi�p.",
				"Ra l� b�ng h�u c�a ��i s� huynh. Tuy C� D��ng Th� �� b� ta phong �n, nh�ng ta c�ng �� b� th��ng, uy l�c c�a C� D��ng Th� qu� m�nh, e phong �n kh�ng th� duy tr� ���c l�u. Ng��i ��n ��ng l�c l�m, ta s� gi�i tr� phong �n, ng��i ph�i c�n th�n.",
				"�a t�.",
				}
		end

		SetTask(CREAT_GUYANGSHOU_TIME,GetTime());--��¼������ˢ��ʱ��
		DelItem(2,0,759,1);--��ľ��
		nNpcIndex = CreateNpc("C� D��ng Th�","C� D��ng Th�",512,xWPos,yWPos,-1,1,1,70);
		SetNpcScript(nNpcIndex,"\\script\\������\\����������\\npc\\������.lua");
		SetNpcLifeTime(nNpcIndex,1800);

		Msg2Player("��n  "..xPos..", "..yPos.." , ��nh b�i C� D��ng Th�.")
		TaskTip("��n  "..xPos..", "..yPos.." , ��nh b�i C� D��ng Th�.");

	else

		strTalk = {
			"C� D��ng Th� uy l�c r�t l�n, t�t nh�t n�n ngh� ng�i m�t l�c r�i m�i h�nh ��ng.",
			}

	end

	TalkEx("",strTalk);

end

--��δ��ɴ�ܹ����޵�����
function task_027_03_1()

local strTalk = {
	"N�i ��y l� sa m�c hi�m �c, ch� c�n s� s�y m�t ch�t l� kh�ng c�n c� h�i tr� ra ngo�i.",
	};

	TalkEx("",strTalk);

end

--�Ѿ�ɱ�������ޣ��ؿ��ӿڿ���
function task_027_03_2()

local strTalk = {
	"C� D��ng Th� xu�t hi�n �t s� nguy h�i th� gian!",
	};

	TalkEx("",strTalk);

end

---------------------------------- ������28��֧2_5�������----------------------------------
--ɱ�������޺���Ҷ����Ի�
function task_028_01_0()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Thi�u hi�p, C� D��ng Th� �� b� thu ph�c, nh�ng tr��c khi C� D��ng Th� bi�n m�t, ta nghe m�t ti�ng h�t th�t thanh v� th�y m�t v�ng s�ng m�u �� l�e l�n, sau �� kh�ng th�y d�u v�t c�a C� D��ng Th� n�a. Thi�u hi�p c� bi�t chuy�n n�y l� sao kh�ng?",
			"Qu� nhi�n <sex> �� thu ph�c ���c ma v�t. Xin �a t�. Nhi�u n�m tr��c ��y s� ph� ta c�ng t�ng c� � thu ph�c C� D��ng Th�, n�n c�ng t�m hi�u nhi�u v� ch�ng. S� ph� t�ng n�i, nh�ng ng��i b� C� D��ng Th� nu�t ch�ng n�u v�n c�n o�n ni�m, s� huy�n h�a trong ch�nh c� th� c�a con th�, k�o d�i sinh m�nh b�ng c�ch h�t ch�t dinh d��ng c�a C� D��ng Th�. Nh�ng ngo�i h�nh v� tinh th�n th� v�n b� nh�t b�n trong l�t th�.",
			"C� chuy�n n�y sao? V�y ti�ng h�t m� ta nghe th�y ch�nh l� c�a nh�ng ng��i b� nh�t trong con th� �? C� D��ng Th� bi�n m�t, ph�i ch�ng nh�ng ng��i b�n trong c�ng bi�n m�t theo?",
			"Kh�ng, nh�ng ng��i b� nh�t ���c C� D��ng Th� nu�i d��ng, uy l�c c�a h� kh�ng ch�ng c�n h�n h�n C� D��ng Th�. C� th� khi C� D��ng Th� ch�t �i, h� c�ng s� ch�t theo, nh�ng c�ng r�t c� kh� n�ng c�i ch�t c�a C� D��ng Th� ch�nh l� th�i c� �� h� tho�t kh�i c�nh t� t�ng. M�nh Huy�t H�n Tinh Ph�ch n�y ch�nh l� v�t c� c�ng d�ng nu�i d��ng sinh m�ng.",
			}
	else
		strTalk = {
			"Thi�u hi�p, C� D��ng Th� �� b� thu ph�c, nh�ng tr��c khi C� D��ng Th� bi�n m�t, ta nghe m�t ti�ng h�t th�t thanh v� th�y m�t v�ng s�ng m�u �� l�e l�n, sau �� kh�ng th�y d�u v�t c�a C� D��ng Th� n�a. Thi�u hi�p c� bi�t chuy�n n�y l� sao kh�ng?",
			"Qu� nhi�n <sex> �� thu ph�c ���c ma v�t. Xin �a t�. Nhi�u n�m tr��c ��y s� ph� ta c�ng t�ng c� � thu ph�c C� D��ng Th�, n�n c�ng t�m hi�u nhi�u v� ch�ng. S� ph� t�ng n�i, nh�ng ng��i b� C� D��ng Th� nu�t ch�ng n�u v�n c�n o�n ni�m, s� huy�n h�a trong ch�nh c� th� c�a con th�, k�o d�i sinh m�nh b�ng c�ch h�t ch�t dinh d��ng c�a C� D��ng Th�. Nh�ng ngo�i h�nh v� tinh th�n th� v�n b� nh�t b�n trong l�t th�.",
			"C� chuy�n n�y sao? V�y ti�ng h�t m� ta nghe th�y ch�nh l� c�a nh�ng ng��i b� nh�t trong con th� �? C� D��ng Th� bi�n m�t, ph�i ch�ng nh�ng ng��i b�n trong c�ng bi�n m�t theo?",
			"Kh�ng, nh�ng ng��i b� nh�t ���c C� D��ng Th� nu�i d��ng, uy l�c c�a h� kh�ng ch�ng c�n h�n h�n C� D��ng Th�. C� th� khi C� D��ng Th� ch�t �i, h� c�ng s� ch�t theo, nh�ng c�ng r�t c� kh� n�ng c�i ch�t c�a C� D��ng Th� ch�nh l� th�i c� �� h� tho�t kh�i c�nh t� t�ng. M�nh Huy�t H�n Tinh Ph�ch n�y ch�nh l� v�t c� c�ng d�ng nu�i d��ng sinh m�ng.",
			}
	end

	TalkEx("task_028_01_0_1",strTalk);

end

--���Ի�
function task_028_01_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"N�u ma v�t ch�a ���c di�t tr�, ch�ng ph�i s� sinh ra m�t qu�i th� m�nh h�n C� D��ng Th� tr��c ��y? V�n n�n tr� kh� �i th� h�n.",
			"<sex> n�i ph�i l�m, n�u l�i xu�t hi�n th�m nh�ng k� hi�m ��c nh� Phi Th��ng ��o Nh�n th� th�t tai h�i! N�u ma v�t v�n ch�a ch�t, d�ng Huy�t H�n Tinh Ph�ch t�t s� d�n d� ���c ch�ng.",
			"Khi ta ��a Huy�t H�n Tinh Ph�ch v� ��y, c�ng ��u th�y ma v�t xu�t hi�n, l�m c�ch n�o �� d� ���c ch�ng?",
			"Huy�t H�n Tinh Ph�ch ch� linh ��ng khi g�p m�u, t�t nh�t l� m�u c�a ng��i �� thu ph�c C� D��ng Th�. Ng��i c� th� d�ng T� Linh Th�t Th� - v�t �� quy t� linh kh� c�a C�n L�n �� tr�ch m�u c�a m�nh h�a v�o Tinh th�ch. Khi Tinh th�ch linh ��ng, ma v�t �t s� ��nh h�i ���c v�t nu�i d��ng n� v� t�m ��n ��y. Ma v�t n�y m�nh h�n h�n C� D��ng Th�, ng��i ph�i h�t s�c c�n th�n.",
			"Ra l� v�y, ta hi�u r�i. Ma v�t n�y tuy�t ��i kh�ng ���c ph�p t�n t�i.",
			}
	else
		strTalk = {
			"N�u ma v�t ch�a ���c di�t tr�, ch�ng ph�i s� sinh ra m�t qu�i th� m�nh h�n C� D��ng Th� tr��c ��y? V�n n�n tr� kh� �i th� h�n.",
			"<sex> n�i ph�i l�m, n�u l�i xu�t hi�n th�m nh�ng k� hi�m ��c nh� Phi Th��ng ��o Nh�n th� th�t tai h�i! N�u ma v�t v�n ch�a ch�t, d�ng Huy�t H�n Tinh Ph�ch t�t s� d�n d� ���c ch�ng.",
			"Khi ta ��a Huy�t H�n Tinh Ph�ch v� ��y, c�ng ��u th�y ma v�t xu�t hi�n, l�m c�ch n�o �� d� ���c ch�ng?",
			"Huy�t H�n Tinh Ph�ch ch� linh ��ng khi g�p m�u, t�t nh�t l� m�u c�a ng��i �� thu ph�c C� D��ng Th�. Ng��i c� th� d�ng T� Linh Th�t Th� - v�t �� quy t� linh kh� c�a C�n L�n �� tr�ch m�u c�a m�nh h�a v�o Tinh th�ch. Khi Tinh th�ch linh ��ng, ma v�t �t s� ��nh h�i ���c v�t nu�i d��ng n� v� t�m ��n ��y. Ma v�t n�y m�nh h�n h�n C� D��ng Th�, ng��i ph�i h�t s�c c�n th�n.",
			"Ra l� v�y, ta hi�u r�i. Ma v�t n�y tuy�t ��i kh�ng ���c ph�p t�n t�i.",
			}
	end

	TalkEx("",strTalk);
	AddItem(2,0,706,1,1);--����ذ��
	SetTask(TASK_XB_ID_02,19);
	TaskTip("��n t�ng 2 C� D��ng ��ng, d�ng T� Linh Th�t Th� tr�ch m�u �� khai phong, l�i d�ng Huy�t H�n Tinh Ph�ch d�n d� d� v�t b�n trong C� D��ng Th� xu�t hi�n.");
	Msg2Player("��n t�ng 2 C� D��ng ��ng, d�ng T� Linh Th�t Th� tr�ch m�u �� khai phong, l�i d�ng Huy�t H�n Tinh Ph�ch d�n d� d� v�t b�n trong C� D��ng Th� xu�t hi�n.");
	GivePlayerAward("Award_XB_63","Easy");
	GivePlayerExp(SkeyXibei,"guyangshou")
end

--��δɱ��Ѫħ�ˣ���������ذ�ף�
function task_028_01_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng��i c� th� d�ng T� Linh Th�t Th� tr�ch m�u c�a m�nh �� d�n d� ma v�t, nh�m ��ng th�i c� �� thu ph�c n�. Ma v�t n�y uy l�c r�t l�n, c�n ph�i h�t s�c th�n tr�ng.",
			}
	else
		strTalk = {
			"Ng��i c� th� d�ng T� Linh Th�t Th� tr�ch m�u c�a m�nh �� d�n d� ma v�t, nh�m ��ng th�i c� �� thu ph�c n�. Ma v�t n�y uy l�c r�t l�n, c�n ph�i h�t s�c th�n tr�ng.",
			}
	end

	TalkEx("",strTalk);

	if GetItemCount(2,0,706) < 1 then
		AddItem(2,0,706,1,1);--����ذ��
		TaskTip("��n t�ng 2 C� D��ng ��ng, d�ng T� Linh Th�t Th� tr�ch m�u �� khai phong, l�i d�ng Huy�t H�n Tinh Ph�ch d�n d� d� v�t b�n trong C� D��ng Th� xu�t hi�n.");
		Msg2Player("��n t�ng 2 C� D��ng ��ng, d�ng T� Linh Th�t Th� tr�ch m�u �� khai phong, l�i d�ng Huy�t H�n Tinh Ph�ch d�n d� d� v�t b�n trong C� D��ng Th� xu�t hi�n.");
	end

end

--�Ѿ�ɱ��Ѫħ��
function task_028_02_0()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"H�a ra ma v�t l� m�t Huy�t Ma Nh�n, ph�i t�n kh�ng �t c�ng s�c m�i c� th� di�t tr� ���c n�.",
			"T�t qu�! M�i vi�c �� k�t th�c, Phi Th��ng ��o Nh�n �� ph�c ph�p, C� D��ng Th� b� di�t tr�, Huy�t Ma Nh�n c�ng �� ���c ti�u di�t, t�t c� ��u l� c�ng lao c�a ��. Mai n�y �� s� l� tr� c�t c�a C�n L�n.",
			"��i s� huynh qu� khen, h�ng y�u ph�c ma l� t�n ch� c�a ph�i ta, �� n�o d�m qu�n? � ph�i, khi ma v�t bi�n m�t �� �� l�i n�a m�nh ng�c b�i, huynh xem th� c� li�n quan ��n y�u v�t kh�ng?",
			"M�nh ng�c b�i n�y l�y t� ch� Huy�t Ma Nh�n sao? �� xem!",
			}
	else
		strTalk = {
			"H�a ra ma v�t l� m�t Huy�t Ma Nh�n, ph�i t�n kh�ng �t c�ng s�c m�i c� th� di�t tr� ���c n�.",
			"T�t qu�! M�i vi�c �� k�t th�c, Phi Th��ng ��o Nh�n �� ph�c ph�p, C� D��ng Th� b� di�t tr�, Huy�t Ma Nh�n c�ng �� ���c ti�u di�t, t�t c� ��u l� c�ng lao c�a <sex>. <sex> �� h�t m�nh v� C�n L�n v� b� t�nh trong thi�n h�, ta th�t kh�ng bi�t l�y g� �� t� l�ng bi�t �n. �n ��c c�a <sex>, T� Thu xin ghi t�c trong l�ng.",
			"Huynh v� ta l� b�ng h�u, ch� n�n kh�ch s�o. � ph�i, khi ma v�t bi�n m�t c� �� l�i n�a m�nh ng�c b�i, huynh xem th� c� li�n quan ��n y�u v�t kh�ng?",
			"M�nh ng�c b�i n�y l�y t� ch� Huy�t Ma Nh�n sao? <sex> xem!",
			}
	end

	TalkEx("task_028_02_0_1",strTalk);

end

--���Ի�
function task_028_02_0_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Sao s� huynh c�ng c� n�a m�nh ng�c b�i v�y? Hai n�a n�y gh�p l�i v�a kh�t v�i nhau, kh�ng lυ",
			"�� �o�n ra �i�u g� �� ph�i kh�ng? C� n�i ��ng ng�i.",
			"Khi �� t�i g�p Di�p l�o, c� nh�c vi�c huynh ph�ng m�nh s� ph� t�i C� D��ng ��ng. Khi nghe ��n C� D��ng ��ng Di�p l�o r�t k�ch ��ng, h�i ra m�i bi�t s� huynh c�n c� m�t huynh tr��ng song sinh, l�c nh� �i l�c v�o C� D��ng ��ng th� kh�ng th�y tr� ra n�a, e l� �� th�nh m�i cho C� D��ng Th�. Nay xem ra, Huy�t Ma Nh�n kia r�t c� th� l�...",
			"Sao? Nh�ng ta ch�a h� nghe ph� th�n n�i c�n c� m�t ng��i huynh tr��ng?",
			}
	else
		strTalk = {
			"Sao thi�u hi�p c�ng c� n�a m�nh ng�c b�i v�y? Hai n�a n�y l�i v�a kh�t v�i nhau, kh�ng lυ",
			"<sex> �o�n ra �i�u g� �� ph�i kh�ng? C� n�i ��ng ng�i.",
			"Khi ta t�i g�p Di�p l�o, c� nh�c vi�c thi�u hi�p ph�ng m�nh s� ph� ��n C� D��ng ��ng. Khi nghe ��n C� D��ng ��ng Di�p l�o r�t k�ch ��ng, h�i ra m�i bi�t thi�u hi�p c�n c� m�t huynh tr��ng song sinh, l�c nh� �i l�c v�o C� D��ng ��ng th� kh�ng th�y tr� ra n�a, e l� �� th�nh m�i cho C� D��ng Th�. Nay xem ra, Huy�t Ma Nh�n kia r�t c� th� l�...",
			"Sao? Nh�ng ta ch�a h� nghe ph� th�n n�i c�n c� m�t ng��i huynh tr��ng?",
			}
	end

	TalkEx("task_028_02_0_2",strTalk);

end

--���Ի�
function task_028_02_0_2()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Di�p l�o bi�t huynh ch� t�i b�n ph��ng, tuy r�t y�u th��ng huynh, nh�ng c�ng cam nguy�n s�ng c� ��c � Ph�ng T��ng �� huynh ho�n th�nh ch� h��ng. Di�p l�o c�n c�n d�n kh�ng ���c �� huynh bi�t m�nh c�n c� huynh tr��ng song sinh, s� huynh b� ph�n t�m, nh�ng v�n th��ng xuy�n lo l�ng h�i han cu�c s�ng c�a huynh � C�n L�n.",
			"Ra ph� th�n v�n lu�n quan t�m lo l�ng cho ta, c�n ta th� l�i ph�t l� t�nh c�m c�a Ng��i, ta th�t b�t hi�u� H�ng y�u ph�c ma c�ng l� v� b� t�nh thi�n h�, n�u v� v�y m� b� qu�n t�nh th�n, th� h�ng y�u ph�c ma �� l�m g� n�a? Ph� th�n tuy � xa nh�ng v�n lo l�ng cho ta �� �i�u, ��i sau khi b�nh ph�c ta ph�i l�p t�c v� th�m Ng��i...",
			"S� vi�c �� k�t th�c, s� huynh c� th� v� th�m Di�p l�o r�i, h�n Di�p l�o s� vui m�ng l�m. �� kh�ng l�m phi�n s� huynh n�a.",
			}
	else
		strTalk = {
			"Di�p l�o bi�t huynh ch� t�i b�n ph��ng, tuy r�t y�u th��ng huynh, nh�ng c�ng cam nguy�n s�ng c� ��c � Ph�ng T��ng �� huynh ho�n th�nh ch� h��ng. Di�p l�o c�n c�n d�n kh�ng ���c �� huynh bi�t m�nh c�n c� huynh tr��ng song sinh, s� huynh b� ph�n t�m, nh�ng v�n th��ng xuy�n lo l�ng h�i han cu�c s�ng c�a huynh � C�n L�n.",
			"Ra ph� th�n v�n lu�n quan t�m lo l�ng cho ta, c�n ta th� l�i ph�t l� t�nh c�m c�a Ng��i, ta th�t b�t hi�u� H�ng y�u ph�c ma c�ng l� v� b� t�nh thi�n h�, n�u v� v�y m� b� qu�n t�nh th�n, th� h�ng y�u ph�c ma �� l�m g� n�a? Ph� th�n tuy � xa nh�ng v�n lo l�ng cho ta �� �i�u, ��i sau khi b�nh ph�c ta ph�i l�p t�c v� th�m Ng��i...",
			"S� vi�c �� k�t th�c, thi�u hi�p c� th� v� th�m Di�p l�o r�i, h�n Di�p l�o s� vui m�ng l�m. Ta kh�ng l�m phi�n thi�u hi�p n�a, c� th� k�t giao b�ng h�u v�i thi�u hi�p ��ng l� m�t �i�u may m�n.",
			}
	end

	TalkEx("task_028_02_0_3",strTalk);

end

--������
function task_028_02_0_3()

	give_ss_award(64);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		DelItem(2,0,707,1,1);--�������
		SetTask(TASK_XB_ID_02,21);
		GivePlayerAward("Award_XB_64","Easy");
		GivePlayerExp(SkeyXibei,"yezhiqiu")
	end

end

--�Ѿ�ɱ��Ѫħ��
function task_028_02_1()

local strTalk = {}

	--�����ɵ��ӶԻ�
	if GetPlayerRoute() == 100 then
		strTalk = {
			"B� qu�n t�nh th�n th� h�ng y�u ph�c ma �� l�m g� ch�? Ph� th�n tuy � xa nh�ng v�n lu�n lo l�ng cho ta �� �i�u, ��i sau khi b�nh ph�c ta ph�i l�p t�c v� th�m Ng��i�",
			}
	else
		strTalk = {
			"B� qu�n t�nh th�n th� h�ng y�u ph�c ma �� l�m g� ch�? Ph� th�n tuy � xa nh�ng v�n lu�n lo l�ng cho ta �� �i�u, ��i sau khi b�nh ph�c ta ph�i l�p t�c v� th�m Ng��i�",
			}
	end

	TalkEx("",strTalk);

end

---------------------------------- ������29����֮��----------------------------------
--��ŷ�����Ի���ȡ����
function task_029_01_0()

local strTalk = {
	"�u D��ng H�a: Ta nh�n ���c tin, L� Nguy�n Kh�nh cao th� th� 3 c�a t�y H� Nh�t Ph�m ���ng �� ��ch th�n ��n Long M�n tr�n, e r�ng b�n ch�ng �ang ng�m ho�t ��ng � Ph�ng T��ng, h�n xu�t hi�n � ��y nh�t ��nh l� c� �m m�u. <sex> h�y c�n th�n �� ph�ng.",
	"Ng��i ch�i: C� vi�c n�y sao? Nh�t Ph�m ���ng ph�c h�i s�c m�nh nhanh v�y �? L� Nguy�n Kh�nh c�n ��ch th�n ra tr�n.",
	"�u D��ng H�a: Theo �i�u tra c�a ta, s�c m�nh c�a Nh�t Ph�m ���ng � Ph�ng T��ng nh�t ��nh b� {gi�m s�t}, n�u kh�ng L� Nguy�n Kh�nh s� kh�ng l� di�n. Tr�n chi�n n�y ta lo r�ng Nh�t Ph�m ���ng mu�n b�o th� v� l�m Trung Nguy�n, qu� nhi�n ta �o�n kh�ng sai, chuy�n n�y cu�i c�ng c�ng ph�i x�y ra.",
	}

	TalkEx("task_029_01_0_1",strTalk);

end

function task_029_01_0_1()

local strTalk = {
	"Ng��i ch�i: Ti�n b�i n�i ch�i sao? L� Nguy�n Kh�nh d�m ��n th�n ��c m� ��n ��y �?",
	"�u D��ng H�a: <sex> c� �i�u ch�a bi�t, L� Nguy�n Kh�nh ng��i n�y kh�ng th� xem th��ng ���c, h�n l� cao th� th� 3 c�a T�y H� Nh�t Ph�m ���ng n�n vi�c y ��n th�n ��c m� ��n ch�n nguy hi�m n�y c�ng ��ng v�i t�c phong c�a y, tuy l� ng��i c�a Nh�t Ph�m ���ng nh�ng r�t tr�ng t�nh ngh�a, x�ng pha ��n ��c �� tr�nh s� nguy hi�m cho ��ng ��i.",
	"Ng��i ch�i: Ta v�n bi�t y l� ��i th� ��ng s�, t� c�ch s�p x�p h�nh ��ng c� th� th�y y l� ng��i r�t c�n th�n. Th�ng � Ph�ng T��ng l�n n�y th�c ra ch� g�p may th�i.",
	"�u D��ng H�a: Ha ha, <sex> ��ng l� bi�t ng��i bi�t ta tr�m tr�n tr�m th�ng, L� Nguy�n Kh�nh l�n n�y ��ch th�n ��n Long M�n tr�n l� v� mu�n {thi�t y�n} gi�i h�a hi�u l�m x�a b� nh�ng �n o�n gi�a Cao th� v� l�m trung nguy�n v� T�y H� Nh�t Ph�m ���ng.",
	}

	TalkEx("task_029_01_0_2",strTalk);

end

function task_029_01_0_2()

local strTalk = {
	"Ng��i ch�i: L�m sao m�i c� th� d� ti�c?",
	"�u D��ng H�a: Kh�ng sai! Ta c�ng cho r�ng bu�i ti�c n�y nh�t ��nh c� �m m�u. C�i g�i l� x�a b� �n o�n n�i ��u c� d� v�y? <sex> nh� ph�i �� ph�ng, L� Nguy�n Kh�nh d� sao c�ng l� cao th� d�m ��n Trung Nguy�n tuy�n chi�n nh�t ��nh �� c� chu�n b� tr��c. Ta �� nh�n ���c {thi�p m�i} c�a y, ng��i c� th� ��n g�p {Kh�u Chu�n � Bi�n Kinh} �� h�i c�ch nh�n thi�p m�i.",
	"Ng��i ch�i: Ta �� chu�n b� ngh�nh chi�n, t�p h�p c�c nh�n s� v� l�m �� c�ng �ng ph�. T�i h� ph�i ��n g�p Kh�u Chu�n �� h�i thi�p m�i, xin c�o t�!",
	}

	--ɾȥһƷ�óƺ�
	for i=1,6 do
		RemoveTitle(60,i);
	end
	SetTask(TASK_XB_ID_01,69);
	TalkEx("",strTalk);
	TaskTip("��n Bi�n Kinh t�m Kh�u Chu�n h�i y�n ti�c Long M�n.");
	Msg2Player("��n Bi�n Kinh t�m Kh�u Chu�n h�i y�n ti�c Long M�n.");

end

--δǰ���꾩���׼�Ի�
function task_029_01_1()

local strTalk = {
	"�u D��ng H�a: {Kh�u Chu�n � Bi�n Kinh} bi�t c�ch nh�n ���c thi�p m�i Long M�n, ng��i c� th� t�m �ng ta h�i th�.",
	}

	TalkEx("",strTalk);

end

--���׼�Ի�ѯ���������
function task_029_02_0()

local strTalk = {
	"Kh�u Chu�n: Xin ch�o <sex>! Ta ���c tin t� {Tr��ng Ca M�n} n�i ng��i ��u m�t tr�n k�ch li�t v�i Nh�t Ph�m ���ng � Ph�ng T��ng. G�n ��y ch� nghe n�i L� Nguy�n Kh�nh c�a Nh�t Ph�m ���ng �ang ��n Trung Nguy�n, <sex> ��n ��y l� v� chuy�n n�y �?",
	"Ng��i ch�i: T�i h� ��n ��y l� v� chuy�n L� Nguy�n Kh�nh ��n Long M�n tr�n v� thi�t y�n t�i ��y. �n D��ng H�a ti�n b�i e r�ng {��i y�n v� l�m Trung Nguy�n} n�y kh�ng ��n gi�n, k� n�y kh�ng ph�i l� h�ng t�m th��ng.",
	"Kh�u Chu�n: Kh�ng sai! N�u kh�ng v� l�i �ch qu�c gia, L� Nguy�n Kh�nh kh�ng d� g� ra tay, y ��ch th�n ph�n k�ch e r�ng kh�ng ch� ��n gi�n l� chuy�n b�o th�, c� 2 nguy�n nh�n: Th� 1 l� Nh�t Ph�m ���ng tranh th� th�i gian ngh� ng�i, th� 2 l� ��nh m��n bu�i ti�c � Long M�n �� th�m d� th�c l�c c�a v� l�m trung nguy�n. Thi�t Chu l�nh c�a Nh�t Ph�m ���ng �� ban, <sex> l� m�c ti�u truy �u�i c�a ch�ng, L� Nguy�n Kh�nh s� kh�ng b� qua ��u.",
	}

	TalkEx("task_029_02_0_1",strTalk);

end

function task_029_02_0_1()

local strTalk = {
	"Ng��i ch�i: Ta ph�i cho L� Nguy�n Kh�nh hi�u, h�u b�i b�n ta kh�ng ph�i l� nh�ng con r�a r�t ��u!",
	"Kh�u Chu�n: M�i c�u c�a <sex> nh� hi�u r� l�ng ta, L� Nguy�n Kh�nh thi�t y�n t�i qu�n tr� Long M�n, ch� c�n h�i {Ti�u Nh� � qu�n tr� Long M�n} c� th� nh�n ���c {thi�p m�i Long M�n}!",
	"Ng��i ch�i: �a t� Kh�u ti�n sinh! T�i h� nh�t ��nh gi� th� di�n cho ��i T�ng! Xin c�o t�.",
	}

	SetTask(TASK_XB_ID_01,70);
	TalkEx("",strTalk);
	TaskTip("��n kh�ch s�n Long M�n tr�n t�m Ti�u Nh� h�i thi�p m�i.");
	Msg2Player("��n kh�ch s�n Long M�n tr�n t�m Ti�u Nh� h�i thi�p m�i.");

end

--δǰ��������ȡ�����
function task_029_02_1()

local strTalk ={
	"Kh�u Chu�n: Ng��i c� th� t�m {Ti�u Nh� � qu�n tr� Long M�n} �� h�i chuy�n thi�p m�i.",
	}

	TalkEx("",strTalk);

end

--δ�����Ԫ��ǰ��׼�Ի�
function task_029_02_2()

local strTalk ={
	"Kh�u Chu�n: <sex> mu�n d� y�n ti�c Long M�n? L� Nguy�n Kh�nh kh�ng ph�i d� ��i ph� ��u, bu�i ti�c n�y nh�t ��nh kh�ng ph�i ��n gi�n, n�u l�n n�y kh�ng th�nh c�ng y c�ng t� ch�c b�a ti�c kh�c.",
	}

	TalkEx("",strTalk);

end

--���С���Ի�������
function task_29_03_0()

local strTalk = {
	"Ti�u Nh�: <sex> l� ng��i �? {S�ng gi�} Long M�n s�p x�y ra, kh�ng c� chuy�n g� th� mau r�i kh�i ��y. Quanh ��y kh�ng c� qu�n tr� n�o ��u.",
	"Ng��i ch�i: Ti�u Nh� ca, s�ng gi� s�p di�n ra � ��y ng��i th��ng e kh� m� ch�u ���c, ng��i h�y mau v� nh� �i!",
	"Ti�u Nh�: Ha ha. Kh�ng gi�u g� <sex>, th�t ra Ti�u Nh� qu�n tr� n�y ch�nh l� ta, tr��ng qu�y c�ng l� ta, ng��i h�u c�ng l� ta, qu�n tr� n�y ch� c� ta v� v�, m�i ��y �� 10 n�m r�i, v� ta c�ng l� ch�, ch� kh�ng �i ta c�ng kh�ng �i.",
	}

	TalkEx("task_29_03_0_1",strTalk);

end

function task_29_03_0_1()

local strTalk = {
	"Ng��i ch�i: Ch�ng l� Ti�u Nh� v� b� ch� l� quan h� ch� t�?",
	"Ti�u Nh�: Kh�ng sai! B� ch� l� v� c�a ta, ti�c l� ng��i nh� c�a ta khi ��n ��y �� b� ch�t h�t, qu�n tr� n�y kh�ng ph�i �� ki�m ti�n nh�ng ��n gi� b� ch� v�n kh�ng vui v� g�, b� ta n�i qu�n tr� n�y kh�ng c� kh�ch c�ng v�n ph�i m� c�a, ng��i m� qu�n tr� cu�i c�ng c�ng ��n! G�n ��y t�m t�nh b� ch� vui v� h�n ra l�m ta c�ng vui l�y. B�i v� ta nghe n�i {L� Nguy�n Kh�nh} ��i nh�n s�p ��n qu�n tr�, �ng ta ch�nh l� ng��i m� qu�n tr�, �� bao n�m tr�i qua cu�i c�ng ng�y b� ch� ch� ��i b�y l�u c�ng �� ��n.",
	"Ng��i ch�i: Th� ra ng��i ��ng ��ng sau qu�n tr� Long M�n l� L� Nguy�n Kh�nh �? Ch�ng tr�ch y ch�n n�i n�y thi�t y�n. Ti�u Nh� c� l� c�ng l� ng��i c�a Nh�t Ph�m ���ng?",
	"Ti�u Nh�: Kh�ng! Ta v� b� ch� kh�ng ph�i l� ng��i c�a Nh�t Ph�m ���ng, g�n ��y ta m�i bi�t L� ��i nh�n l� ng��i c�a Nh�t Ph�m ���ng, L� ��i nh�n l� ��i anh h�ng �� c�u b� ta, v� c�ng c�a b� �y c�ng l� L� ��i nh�n truy�n th�, �ng ta n�i mu�n ��n qu�n tr� thi�t y�n cao th� Trung Nguy�n, b� ch� c�a ta r�t vui m�ng.",
	}

	TalkEx("task_29_03_0_2",strTalk);

end

function task_29_03_0_2()

local strTalk = {
	"Ng��i ch�i: Th� ra 2 ng��i kh�ng ph�i ng��i c�a Nh�t Ph�m ���ng. Ta c�ng c� nghe n�i L� Nguy�n Kh�nh s� thi�t y�n � ��y cho n�n ��n ��y h�i Ti�u Nh� ca v� vi�c n�y, l�m sao m�i c� th� d� ti�c?",
	"Ti�u Nh�: M�y ng�y tr��c L� ��i nh�n �� ��n ��y n�i v�i b� ch� mu�n thi�t y�n cao th� Trung Nguy�n t�i qu�n tr�, b� ch� r�t vui m�ng b� l�m theo s� s�p x�p c�a L� ��i nh�n. �ng ta nh� b� ch� chu�n b� nhi�u thi�p m�i Long M�n �� ph�t cho nh�n s� v� l�m. Ph�i l� anh h�ng c� t�n trong Thi�t Chu l�nh m�i c� t� c�ch nh�n thi�p m�i, <sex> c� ph�i l� ng��i c� t�n trong {Thi�t Chu l�nh}? N�u ph�i th� xin ng��i h�y l�y nh�n m�i, <sex> c� th� ��n d� ti�c r�i! {<sex> ph�i nh� kh�ng ���c l�m m�t thi�p n�y, ti�u nh�n kh�ng c� nhi�u thi�p ��u.}",
	"Ng��i ch�i: (Xem ra Ti�u Nh� c�ng kh�ng r� �n kh�c b�n trong, L� Nguy�n Kh�nh qu� nhi�n ��ng nh� �u D��ng ti�n b�i �� n�i r�t tr�ng t�nh ngh�a, ch�ng tr�ch Xu�n Th�p Tam N��ng v� Ti�u Nh� c� th� sinh t�n � Long M�n tr�n l� do ���c L� Nguy�n Kh�nh �m th�m b�o v�), �� l�m phi�n Ti�u Nh� ca r�i, t�i h� ch�nh l� ng��i trong Thi�t Chu l�nh truy �u�i, mu�n ��n ��y d� ti�c, �a t� thi�p m�i c�a Ti�u Nh� ca!",
	}

	TalkEx("",strTalk);
	AddItem(2,0,1037,1,1);--������������
	SetTask(TASK_XB_ID_01,71);
	TaskTip("22:00 t�i th� 7 ��n d� y�n ti�c Long M�n.");
	Msg2Player("22:00 t�i th� 7 ��n d� y�n ti�c Long M�n.");

end

--�����Ԫ���Ϳ�׼�Ի�
function task_029_04_0()

local strTalk = {
	"Kh�u Chu�n: <sex> ��n ���c ��y t�c l� �� ��nh b�i L� Nguy�n Kh�nh t�i y�n ti�c Long M�n? ��ng l� �i�u ��nh m�ng? y�n ti�c Long M�n c�a h�n so v�i H�ng M�n y�n c�a H�ng b� v��ng th� n�o?",
	"Ng��i ch�i: y�n ti�c Long M�n kh�ng ph�i l� n�i ��ng s�, �i�u ��ng s� nh�t ch�nh l� t�n L� Nguy�n Kh�nh, ta ch�a th�y qua v� ngh� c�a h�n n�n kh�ng bi�t l�m sao kh�c ch� n�n v�n ph�i h�p s�c c�a nhi�u ng��i m�i mong ��nh b�i h�n.",
	"Kh�u Chu�n: Ha ha! ��nh b�i L� Nguy�n Kh�nh kh�ng ph�i l� chuy�n d�, kh�ng th� g�p g�p, v� th� Trung nguy�n c�n ph�i ��ng t�m hi�p l�c, ph�i r�i <sex> c� trang b� tr��c ��y �u D��ng H�a ti�n sinh ��a cho ng��i kh�ng?",
	}

	TalkEx("task_029_04_0_1",strTalk);

end

--���Ի�
function task_029_04_0_1()

local strTalk = {
	"Ng��i ch�i: �? Trang b� n�y c� v�n �� g� �?",
	"Kh�u Chu�n: <sex> �� g�p s�c v� ��i T�ng, ng��i ch� c�n �em {1 b� nhi�m v� nh�n ���c trong nhi�m v� T�y B�c tr��c ��y} ��n ��y ��i {1 b�o v�t}?",
	"Ng��i ch�i: Hay qu�! �a t� Kh�u ti�n sinh.",
	}

	TalkEx("task_029_04_0_2",strTalk);
	SetTask(TASK_XB_ID_01,73);

end

--�ѽ������Ԫ�� �һ������
function task_029_04_0_2()

local strTalk = {
	"Kh�u Chu�n: <sex> ch� c�n �em {1 b� trang b�} tr��c ��y nh�n ���c ��n ��y ��i {1 b�o v�t}?",
	}

	if GetTask(TASK_GET_AWARD) == 1 then
		task_029_04_0_4()
		return
	end

	TalkEx("task_029_04_0_3",strTalk);

end

--������
function task_029_04_0_3()

	final_award()

end

--����װ���ɹ���
function task_029_04_0_4()

local strTalk = {
	"Kh�u Chu�n: ��y l� v�t b�u hi�m c�, <sex> c� th� l�y �i."
	}

	TalkEx("task_029_04_0_5",strTalk);
	SetTask(TASK_GET_AWARD,0);
	SetTask(TASK_XB_ID_01,74);--�һ��������

end

--����һ��������
function task_029_04_0_5()

local strTalk = {
	"Kh�u Chu�n: ��ng r�i, ta nh� trong giang h� c� nhi�u ng��i o�n h�n nhi�u v�t ph�m qu� kh�ng c� ch� �� c�t, ta �� t�m ���c Th� r�n c� th� gi�p ng��i {t�ng dung l��ng r��ng ch�a ��}.",
	"Ng��i ch�i: ��y ch�nh l� th� t�i h� �ang c�n, ti�n sinh ngh� r�t chu ��o.",
	"Kh�u Chu�n: Chi�n d�ch n�y qua �i, ��i T�ng {giang s�n} t�m th�i ���c y�n b�nh! {M�a b�i xanh r�n non n��c xa, kh�i s��ng m� m�t n�n �� qua, v�ng d��ng xu�ng n�i, ph�n hoa h�t, c�n ng�n gi� xanh th�i m�ng t�}.",
	}

	if GetTask(1481) ~= 1 and GetStoreBoxPageCount() <= 4 then
		SetTask(1481,1);
		SetStoreBoxPageCount(GetStoreBoxPageCount()+1);
		Msg2Player("Kh�u Chu�n ��p t� n� l�c c�a b�n cho ��i T�ng n�n t�m th� r�n ��n t�ng s�c ch�a r��ng ch�a �� c�a b�n!");
	end

	TalkEx("task_029_04_0_100",strTalk);
	SetTask(TASK_XB_ID_01,75);--�һ��������

end

--����֮ǰû���쵽�һ�����:1.�ӿڶԻ�
function task_029_04_0_100()

local strTalk = {
	"Kh�u Chu�n: <sex> ch� c�n �em {1 b� trang b�} tr��c ��y nh�n ���c ��n ��y ��i {1 b�o v�t}?",
	}

	if GetTask(TASK_GET_AWARD) == 1 then
		task_029_04_0_102()
		return
	end

	TalkEx("task_029_04_0_101",strTalk);

end

--����֮ǰû���쵽�һ�����2.���Ž���
function task_029_04_0_101()

	final_award();

end

--����֮ǰû���쵽�һ�����2.���Ž������
function task_029_04_0_102()

local strTalk = {
	"Kh�u Chu�n: ��y l� v�t b�u hi�m c�, <sex> c� th� l�y �i."
	}

	TalkEx("task_029_05_0",strTalk);
	SetTask(TASK_GET_AWARD,0);
	SetTask(TASK_XB_ID_01,76);--�һ��������

end

--�������֮������׼�Ի�
function task_029_05_0()

local strTalk =	{
	"Kh�u Chu�n: ��i T�ng cu�i c�ng c�ng ���c {y�n b�nh}, th�t hay qu�! M�a b�i xanh r�n non n��c xa, kh�i s��ng m� m�t n�n �� qua, v�ng d��ng xu�ng n�i ph�n hoa h�t, c�n ng�n gi� xanh th�i m�ng t�.",
	}

	TalkEx("",strTalk);

end

--�պ����������κ�����
function Task_Exit()
end;

--�����ƺ�
--����nType��YIPINGTANG_TITLE�����
function add_xb_title(nType)

	AddTitle(60,nType);
	SetCurTitle(60,nType);
	Msg2Player("B�n nh�n ���c  "..YIPINGTANG_TITLE[nType][1].." Danh hi�u!");

end

--�ж��Ƿ�������ǰ�׶εĳƺ�
--����ֵ��1Ϊ��ǰ�����ý׶γƺţ�0Ϊ��ǰû�������ý׶γƺ�
function is_show_title_level()

local i=0;
local nTitleIndex = 0;
local nCurTitleId_1,nCurTitleId_2 = 0,0;

	for i=1,getn(YIPINGTANG_TITLE) do
		if GetTask(YIPINGTANG_TITLE[i][2]) >= YIPINGTANG_TITLE[i][3] then
			nTitleIndex = i
		end
	end

	nCurTitleId_1,nCurTitleId_2 = GetCurTitle();

	--��ǰû�ж��Ÿý׶γƺ�
	if nCurTitleId_1 == 60 and nCurTitleId_2 == nTitleIndex then
		return 1
	else
		return 0
	end

end

--���ְ��������ƺţ������õ�ǰ�ƺ�Ϊ��ǰ�ɻ�õ���ߵȼ��ƺ�
function repeat_add_xb_title()

local i=0;
local nDetailType = 0;

	for i=1,getn(YIPINGTANG_TITLE) do
		--�ж�����
		if GetTask(YIPINGTANG_TITLE[i][2]) >= YIPINGTANG_TITLE[i][3] then
			AddTitle(60,i);
			nDetailType = i;
		end
	end

--	if nDetailType ~= 0 then
--		SetCurTitle(60,nDetailType);
--	end
--
--	Msg2Player("������"..YIPINGTANG_TITLE[nDetailType][1].."�ƺţ�");

end

--�����óƺ�������ʾ
--������nTitleIndexΪ��Ҫ��ʾ�ĳƺ�id����ӦYIPINGTANG_TITLE��nNpcNameΪ��Ҫ��ʾ��Npc����
function xb_title_tip(nTitleIndex,nNpcName)

local strTalk = {
	[1] = {
				["Xa Lu�n B� V��ng"] =
				{
				{"Quanh v�ng Long M�n tr�n qu� nhi�n ng�a h� t�ng long, ch� m�i v�i ng�y �� quy t� ���c r�t nhi�u T�n B� th�n th� r�t kh� ��n xin gia nh�p. Ng��i c�a b�n ���ng ��u c� m�t danh hi�u, n�u l� T�n B� c�a b�n ���ng, h�y ��n tr�nh di�n, nh�n th� th�ch nh�p ���ng; c�n n�u ch� mu�n ph� r�i th� h�y nh�n l�c ta ch�a n�i gi�n m� ngoan ngo�n ra v�."},
				{"L�c n�y quanh Long M�n tr�n xu�t hi�n nhi�u T�n B� th�n th� r�t kh�, n�u c� th� th�ng qua c� 3 �i th� th�ch, �t c� ch� h�n ng��i, ch�c s� h�p d�n l�m ��y. Ng��i c�a b�n ���ng ��u c� m�t danh hi�u, n�u l� T�n B� c�a b�n ���ng, h�y ��n tr�nh di�n, nh�n th� th�ch nh�p ���ng. Th� th�ch d�nh cho T�n B� l� m�t cu�c c�nh tranh kh�c li�t!"}
				},
				},
	[2] = {
				["Xa Lu�n B� V��ng"] =
				{
				{"S� d� Nh�t Ph�m ���ng ���c xem l� ��i qu�n tinh nhu� nh�t c�a T�y H�, b�i th�ch kh�ch c�a b�n ���ng ���c ph�n b� r�ng kh�p thi�n h�. R�t nhi�u T�n B� mu�n gia nh�p b�n ���ng ��u c� th�n th� r�t kh�, n�u v��t qua c� 3 th� th�ch th� s� tr� th�nh th�ch kh�ch, nh� th� Nh�t Ph�m ���ng l�i c� th� l�n m�nh h�n tr��c. Nh�ng nhi�m v� c� b�n ��u do th�ch kh�ch ho�n th�nh, ng��i c�a b�n ���ng ��u c� m�t danh hi�u, n�u l� th�ch kh�ch c�a b�n ���ng, h�y ��n ch� ta nh�n nhi�m v�."},
				},
				["Th�c B�t Ho�ng "] =
				{
				{"Ng��i c�a b�n ���ng ��u c� danh hi�u, n�u l� th�ch kh�ch c�a b�n ���ng, h�y ��n ch� ta nh�n nhi�m v�; n�u ch�a ph�i l� th�ch kh�ch, h�y ��n ch� Xa Lu�n B� V��ng �� nghe ch� d�n. Th�ch kh�ch ch�nh l� tr� c�t c�a b�n ���ng, l� nh�ng cao th� ���c r�i ��u kh�p thi�n h�. "},
				{"Xem ra l�n n�y �� chi�u m� ���c kh�ng �t nh�n t�i, ph� Ph�ng T��ng qu� l� n�i ng�a h� t�ng long, kh�ng bi�t c�n t�m ���c cao th� n�o c� th� so t�i v�i ta m�t phen. G�n ��y th�ch kh�ch c�a b�n ���ng t�ng l�n r�t nhi�u, t�t l�m t�t l�m. �em nhi�m v� c�a b�n ���ng r�i ��u ra kh�p n�i, c�ng l� m�t c�ch l�m vi�c hi�u qu�."},
				},
				},
	[3] = {
				["Xa Lu�n B� V��ng"] =
				{
				{"Th�ch kh�ch c�ng l� m�t th�m c�a b�n ���ng, l� l�c l��ng ch�nh chuy�n thu th�p t�nh b�o, d� la tin t�c, th� ti�u nh�ng k� g�y b�t l�i cho b�n ���ng. T�nh b�o l�n tr��c v� Quang Minh ��nh c�ng l� m�t v� d�. Nh�ng nh�ng t�nh b�o c� m�t th� v�n ph�i giao cho c�c Phi H� c�a b�n ���ng ��m nhi�m. S� tr��ng c�a Phi H� l� khai th�c b� m�t, th�m d� qu�n t�nh, �m s�t c�c nh�n v�t ��u n�o v.v... V� l� c� m�t, n�n ph�i ��m b�o t�nh b�o v� nhi�m v� ���c ho�n th�nh tuy�t ��i ch�nh x�c. Khi nh�n nhi�m v� b� m�t ��u ph�i cho bi�t danh hi�u Phi H�."},
				},
				["Th�c B�t Ho�ng "] =
				{
				{"Th�ch kh�ch c�ng l� m�t th�m c�a b�n ���ng, l� l�c l��ng ch�nh chuy�n thu th�p t�nh b�o, d� la tin t�c, th� ti�u nh�ng k� g�y b�t l�i cho b�n ���ng. T�nh b�o l�n tr��c v� Quang Minh ��nh c�ng l� m�t v� d�. Nh�ng nh�ng t�nh b�o c� m�t th� v�n ph�i giao cho c�c Phi H� c�a b�n ���ng ��m nhi�m. S� tr��ng c�a Phi H� l� khai th�c b� m�t, th�m d� qu�n t�nh, �m s�t c�c nh�n v�t ��u n�o v.v... V� l� c� m�t, n�n ph�i ��m b�o t�nh b�o v� nhi�m v� ���c ho�n th�nh tuy�t ��i ch�nh x�c. Khi nh�n nhi�m v� b� m�t ��u ph�i cho bi�t danh hi�u Phi H�."},
				},
				},
	[4] = {
				["Xa Lu�n B� V��ng"] =
				{
				{"H� D�c l� l�c l��ng tinh nhu� c�a b�n ���ng. Tuy Phi H� ��m nh�n ch�c n�ng d� th�m t�nh b�o, nh� l�ng m� T�n Th�y Ho�ng, b�n �� S�n H� X� T�c... ��u l� c� m�t. Song nhi�m v� c�a H� D�c l�i l� nh�ng nhi�m v� c� m�t li�n quan ��n s� ti�n tho�i c�a b�n ���ng, kh�ng nh�ng ph�i c� tuy�t k� do th�m c�a Phi H�, c�n ph�i bi�t ph�i h�p v�i c�c l�c l��ng kh�c c�a b�n ���ng �� ho�n th�nh nhi�m v�. Kim Cang c�a b�n ���ng v� T�y H� ph�p v��ng ��u r�t tin t��ng H� D�c, v� th� c�n ph�i cho bi�t danh hi�u H� D�c khi nh�n nhi�m v� c� m�t."},
				},
				["Th�c B�t Ho�ng "] =
				{
				{"H� D�c l� l��ng l�c tinh nhu� c�a b�n ���ng. Tuy Phi H� ��m nh�n ch�c n�ng d� th�m t�nh b�o, nh� l�ng m� T�n Th�y Ho�ng, b�n �� S�n H� X� T�c... ��u l� c� m�t. Song c�c nhi�m v� c�a H� D�c l�i l� nh�ng nhi�m v� c� m�t li�n quan ��n s� ti�n tho�i c�a b�n ���ng, kh�ng nh�ng ph�i c� tuy�t k� do th�m c�a Phi H�, c�n ph�i bi�t ph�i h�p v�i c�c l�c l��ng kh�c c�a b�n ���ng �� ho�n th�nh nhi�m v�. Kim Cang c�a b�n ���ng v� T�y H� ph�p v��ng ��u r�t tin t��ng H� D�c, v� th� c�n ph�i cho bi�t danh hi�u H� D�c khi nh�n nhi�m v� c� m�t."},
				},
				},
	[5] = {
				["Xa Lu�n B� V��ng"] =
				{
				{"V� V� l� c�nh tay ��c l�c nh�t c�a Th�p ��i Kim Cang. V��t qua nh�ng nhi�m v� th� th�ch l�n nh� c�a Nh�t Ph�m ���ng, V� V� c�n c�n ph�i c� l�ng trung th�nh tuy�t ��i. Nhi�m v� c�a V� V� kh�ng nh�ng li�n quan ��n b�n ���ng, c�n li�n quan ��n qu�c gia, kh�ng nh�ng ph�i ��a b�n ���ng �i l�n m� c�ng ph�i gi�p qu�n ��i T�y H� th�m v�ng m�nh. Tr�ch nhi�m c�a V� V� c�ng ch�nh l� tr�ch nhi�m v�i T�y H�."},
				},
				["Th�c B�t Ho�ng "] =
				{
				{"Ng� H�nh tr�n ngo�i vi�c tr�ng tr� ph�n ��, c�n l� n�i t�p luy�n c�a V� V�. V� V� mu�n th�ng c�p l�n Kim Cang ��u ph�i tr�i qua th� th�ch c�a Ng� H�nh tr�n. V� th� Ng� H�nh tr�n kh�ng ti�p nh�n nh�ng ng��i d��i c�p V� V�."},
				},
				},
	}

	i = random(1,getn(strTalk[nTitleIndex][nNpcName]))
	TalkEx("",strTalk[nTitleIndex][nNpcName][i]);
	repeat_add_xb_title();

end