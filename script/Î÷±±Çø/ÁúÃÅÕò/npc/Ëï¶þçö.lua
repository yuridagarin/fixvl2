-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPC�����Script
-- By StarryNight
-- 2007/06/07 PM 2:47

-- ������һɲ�ǣ�˼���Ǻܶ��һɲ��

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);

	---------------------------------- ��������02������ջ----------------------------------
	
	--��ʼ����
	if nStep_XBTask == 5 then
		task_002_01_0();
		return
	end
	
	--δ���С��ȡ���Ѿ�ҩ
	if nStep_XBTask >= 6 and nStep_XBTask <= 7 then
		task_002_01_1();
		return
	end
	
	--�ͷ��Ѿ�ҩ��Ի�
	if nStep_XBTask == 8 then
		task_002_04_0();
		return
	end
	
	--δȡ�öǶ�֮ǰ�Ի�
	if nStep_XBTask >= 9 and nStep_XBTask <= 12 then
		task_002_04_1();
		return
	end
	
	---------------------------------- ��������04�б�����----------------------------------
	--ȡ�öǶ��󽫶Ƕ����������
	if nStep_XBTask == 13 then
		task_004_01_0();
		return
	end
	
	--��ûȡ�û�ȡ��һƷ�����뺯
	if nStep_XBTask == 14 then
		task_004_02_0();
		return
	end
	
	--��û��ŷ�����㱨���
	if nStep_XBTask == 15 then
		task_004_02_1();
		return
	end
	
	--������������Ʊ
	if GetBit(GetTask(GIVE_TICKET_STATE),6) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		{"Th�p Tam N��ng� M� Ki�u N��ng�"},
		{"C�n r�t nhi�u tin t�c c�n thu th�p, th�c ra tin t�c c�ng c� th� mua ���c b�ng ti�n v�y."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--������Ʊ�ű�
function give_ticket_01()

local strTalk = {
	"T�n Nh� Li�m: <sex> ch�ng ta l�i g�p nhau r�i, v�n kh�e ch�? Nghe �u D��ng ti�n sinh n�i ng��i �� ph� ���c �m m�u c�a Nh�t Ph�m ���ng, vi�c n�y khi�n ta r�t kh�m ph�c. Chuy�n Nh�t Ph�m ���ng ��ng ra �� ��n h�i k�t th�c, kh�ng ng� thi�n tai l�i �� xu�ng, ng��i c� th�y ��m m�y �en ��ng xa kh�ng? N� �� t� � ��y h�n m��i m�y ng�y r�i v�n ch�a tan!",
	"Ng��i ch�i: T�n ti�n sinh kh�ch s�o qu�! T�i h� khi v�o Long M�n tr�n th�y h�nh nh� n�i ��y b� t�n ph� r�t nhi�u, nhi�u nh� �� b� gi� c�t v�i l�p, Long M�n tr�n �� x�y ra chuy�n g�? ��m m�y �en n�y d� b�o �i�u g�?",
	"T�n Nh� Li�m: ��ng nh� <sex> �� th�y, m�y ng�y nay Long M�n tr�n b� b�o c�t t�n ph�, cu�ng phong tr�i qua ch�ng ai gi�n d� ch� c� v�i h� �� d�n �i r�i, ch� c� qu�n tr� Long M�n, d� ta c� khuy�n Th�p Tam N��ng c�ch m�y b� ta c�ng kh�ng ch�u d�n �i n�i kh�c, kh�ng bi�t v� sao n�a...ng��i n�i xem, qu�n tr� nh� n�y l�m sao ch�ng �� ���c n�u b�o c�t l�i xu�t hi�n?",
	"Ng��i ch�i: Th� ra ti�n sinh lo l�ng qu�n tr� l� c�a Th�p Tam N��ng? Theo l�i ti�n sinh n�i tr�n n�y ch� c�n duy nh�t qu�n tr� n�y, b�o c�t r�t c�c l� chuy�n g� v�y?",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"T�n Nh� Li�m: Kh�ng sai! Ta l� ng��i � g�n sa m�c bi�t chuy�n b�o c�t, c� l� �ng tr�i �ang n�i gi�n v� mu�n tr�ng ph�t nh�n gian! b�t ��u t� t�n c�ng sa m�c b�o c�t bay ngang th� ��n c� c�y c�ng kh�ng s�ng n�i, c� l� �ng tr�i kh�ng mu�n gi� m�nh ��t n�y n�a. Qu�n tr� c�a Th�p Tam N��ng b� gi� c�t che ph� b� ta m�i an t�m sao?",
	"Ng��i ch�i: T�n c�ng sa m�c? B�ng r�m c�a ��m m�y �en �� c� th� l� m� cung sa m�c?",
	"T�n Nh� Li�m: ��ng v�y! Ch�nh l� m� cung sa m�c. <sex> ��n m� cung sa m�c ch�a? H�nh nh� n� c� m�t n�i g�i l� t�n c�ng sa m�c, t��ng truy�n th��ng c� nhi�u �i�u k� b�. b�o c�t t� t�n c�ng sa m�c th�i qua c� sa m�c, ch�ng l� ch�ng c� quan h� v�i nh�ng �i�u k� b� � t�n c�ng sa m�c?",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"Ng��i ch�i: �o gi�c sa m�c �� b� ta d�ng C�n L�n ph�p kh� phong �n, c� �i�u n� c� th� tr�ng sinh, Nh�t Ph�m ���ng t�ng mu�n kh�ng ch� �o gi�c �� m��n n� �� ph�c v� cho chi�n tranh? B�o c�t qu� th�t c� s�c m�nh v�y sao? Xem ra ph�i �i t�n c�ng sa m�c m�t chuy�n, c� �i�u l�n n�y xem ra kh�ng d� d�ng g�.",
	"T�n Nh� Li�m: Th� ra l� nguy�n nh�n n�y, c� �i�u <sex> mu�n ��n t�n c�ng sa m�c th� ta kh�ng c� c�ch n�o gi�p, ph��ng h��ng sa m�c r�t kh� �o�n, ta t�ng ��n sa m�c t�m t�nh b�o, d�ng {La B�n} c� th� d�n ���ng ��n t�n c�ng sa m�c, m� kh�ng s� l�t v�o m� cung sa m�c, nh�ng khi ��n t�n c�ng sa m�c th� t� tr��ng s� m�t �i n�u mu�n �i ti�p th� ph�i t�m th�m 1 {La B�n}. <sex> qu�n tr� c�a Th�p Tam N��ng c� th� gi� ���c hay kh�ng ��u nh� v�o ng��i ��!",
	"Ng��i ch�i: Ti�n sinh qu� l�i r�i, chuy�n b�o c�t c� li�n quan b� t�nh xung quanh sa m�c, l� n�o kh�ng t�n l�c?",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1036,1,1);--�õ���ɳ����
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),6,1));
	
end
