-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPC������Script
-- By StarryNight
-- 2007/08/25 PM 3:13

-- ������ա�

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
	
	---------------------------------- ������13��֧1_5������Ĺ----------------------------------
	--�����������Ĺ���
	if nStep_XBTask_01 == 18 then
		task_013_04_0();
		return
	end
	
	--��δ���ͳ��ȡ�������
	if nStep_XBTask_01 == 19 then
		task_013_04_1();
		return
	end
	
	--���ͳ��ȡ�������
	if nStep_XBTask_01 == 20 then
		task_014_01_0();
		return
	end
	
	---------------------------------- ������14��֧1_6��Ĺ֮��----------------------------------
	
	--ȡ�û�δȡ�ö�ˮ�ƺ��޸�
	if nStep_XBTask_01 == 21 then
		task_014_02_0();
		return
	end
	
	--δ���ذκ�Ի���������ˮ�ƺ��޸���
	if nStep_XBTask_01 >= 22 and nStep_XBTask_01 <= 24 then
		task_014_02_1();
		return
	end
	
	--���ͻ����ص���Ʊ
	if GetBit(GetTask(GIVE_TICKET_STATE),2) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		{"C�c h� c� bi�t T�o Th�o? T� ti�n ta ch�nh l� ng��i ���c T�o Th�o phong ch�c Hi�u �y."},
		{"N�u M� Kim Ph� ��n ��i ta b� th�t truy�n th� th�t c� l�i v�i t� ti�n."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--������Ʊ�ű�
function give_ticket_01()

local strTalk = {
	"Li�u Tung V�n: <sex> c� chuy�n g� n�a �? L�n tr��c ng��i �� t�m M� Kim ph� cho ta, ta ch�a th� c�m �n ng��i, th�t l� x�u h�. <sex> h�nh nh� �� ��n T�n L�ng, cho n�n ta c� m�t s� chuy�n mu�n th�nh gi�o.",
	"Ng��i ch�i: Ti�n sinh kh�ng c�n kh�ch kh�, n�u l� chuy�n c� li�n quan ��n l�ng m�, nh�t ��nh ta bi�t g� s� n�i.",
	"Li�u Tung V�n: Kh�ng gi�u g� <sex>, ta v�n cho r�ng ng��i gi�p ta �o�t l�i M� Kim ph� gia truy�n, nh�ng sau n�y ta ph�t hi�n �� th�t s� kh�ng ph�i l� M� Kim ph� c�a nh� ta. Chuy�n n�y khi�n ta th�t kinh ng�c. ���ng nhi�n <sex> gi�p ta �o�t l�i M� Kim ph�, ta �� r�t c�m k�ch, c� ph�i gia truy�n hay kh�ng kh�ng c�n quan tr�ng n�a. Chuy�n ta ng�c nhi�n l� c�n c� M� Kim ph� c�a ng��i kh�c r�i trong m�, ng��i �i theo ch�t trong m� kh�ng �t. C�n c� chuy�n khi�n ta ng�c nhi�n n�a l�, h�nh dang m� kim ph� <sex> �o�t v� gi�ng v�i c�a ta, nh�ng th�i gian �� qu� l�u r�i, h�nh nh� �ang �n gi�u m�t v�i b� m�t.",
	"Ng��i ch�i: C� chuy�n n�y sao? Nh�ng ph� n�y ��ng l� ta �o�t l�i t� vi�c ��nh b�i th�ng l�nh Binh m� d�ng m�.",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"Li�u Tung V�n: E r�ng M� Kim ph� <sex> �o�t l�i l� ph� m� th�ng l�nh c��p t� ng��i c��p m� kh�c. Cho n�n ta mu�n h�i <sex>, trong m� tr� Binh m� d�ng ra, c�n c� Tr�n m� linh v�t v� v�t g�i l� Qu� T��ng Qu�n kh�ng?",
	"Ng��i ch�i: Kh�ng sai, t�ng 2 trong l�ng m� th�t s� c� Qu� T��ng Qu�n, r�t kh� ��i ph�, ti�n sinh ch�a v�o t�ng 2, sao bi�t chuy�n n�y?",
	"Li�u Tung V�n: Qu� nhi�n l� nh� v�y, v�t gi� m� c� th� ho�t ��ng t� nhi�n, t�c d�ng c�a b�n �� S�n H� X� T�c ho�n to�n kh�ng ��ng tin. Ng��i nh�n M� Kim ph� n�y c� kh�c m�y ch� {Ngang nhi�n x�m ph�m, ch�t d��i tay Qu� T��ng Qu�n}, h�nh nh� l� tr��c khi ch�t ng��i c��p m� �� l�i. Nh� ta d� �o�n, ti�n n� n�y c� th� l� ng��i c��p m�, c� ta �� ph�t hi�n b�o v�t � T�n Ho�ng, t�m ��n ch� Qu� t��ng qu�n, Qu� T��ng Qu�n l� linh v�t h� b�o, khi ti�n n� n�y �o�t b�o v�t, T�n Ho�ng v� h� b�o m� nh�p h�n v�o Qu� T��ng Qu�n. C� m�t ng��i c��p m� c�ng v�o l�ng m� �� nh�n th�y c�nh n�y, ch� l� h�n kh�ng may b� Tr�n M� Linh Th� c��p m�t m�ng. E r�ng v�t gi� m� v�n l� k� s�ch xua �u�i c�a h�n T�n Ho�ng.",
	"Ng��i ch�i? Sao? L� n� �? N� v�o T�n L�ng t�m b�o v�t sao? Vi�c n�y��",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"Li�u Tung V�n: <sex> mu�n bi�t �? Nh�ng c� m�t s� chuy�n kh�ng th� n�i ra. <sex> c� th� nh�n th�y Tr�n M� Linh Th� sao? N�u mu�n t�m hi�u chuy�n n�y, e r�ng ph�i �i l�ng m� m�t chuy�n.",
	"Ng��i ch�i: Tr�n M� Linh Th� n�y l� Tr�n m� th� canh gi� m�t ��o t�ng 1, 2. ��ng ti�c ta �� ��n m�t ��o 1 l�n, trong m� c� c� quan, m�t ��o h�nh nh� �� b� phong t�a, v�o kh�ng ���c n�a.",
	"Li�u Tung V�n: Th�t s� v�o l�i m�t ��o c�ng l� chuy�n kh�. Ta c� nghi�n c�u ��i v�i c� quan trong l�ng m�, m�t th�t th�ng th��ng trong l�ng m� n�u b� c� quan phong t�a, c� th� d�ng {H�i Long S�ch} �� m�, nh� v�y c� th� v�o ���c m�t ��o m�t l�n n�a. N�u <sex> c� c�ch, th� ph�i ��n l�ng m� m�t chuy�n, {H�i Long S�ch} n�y c� th� gi�p ���c ng��i.",
	"Ng��i ch�i: Ki�n th�c c�a Ti�n sinh ��i v�i C� M�c ��ng l� ��ng n�. T�i h� mu�n ��n m�t ��o l�ng m� �� x�c nh�n m�t chuy�n, �a t� H�i Long S�ch c�a ti�n sinh.",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1032,1,1);--�õ�������
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),2,1));
	
end