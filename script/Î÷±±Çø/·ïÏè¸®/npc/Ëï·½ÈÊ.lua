-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPC�﷽��Script
-- By StarryNight
-- 2007/08/04 AM 11:37

-- ��ĩ�������ǳ��ǳ�֮�ã�o(��_��)o...����

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()


local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);
	
	---------------------------------- ������18��֧1_9�ƺ�����----------------------------------
	--����﷽��ҩ�˲�һ��
	if nStep_XBTask_01 == 38 then
		task_018_02_0();
		return
	end
	
	--���ػ�δ����10ƪ��ǧ�������о�
	if nStep_XBTask_01 == 39 then
		task_018_03_0();
		return
	end
	
	--���ػ���δ����������
	if nStep_XBTask_01 == 40 then
		task_018_06_0();
		return
	end
	
	--��û����ҩ�˲����﷽�ʶԻ�
	if nStep_XBTask_01 == 41 then
		task_018_06_1();
		return
	end
	
	---------------------------------- ������19��֧1_10�����----------------------------------
	
	--���﷽�ʶԻ������æα��ҩ��ҩ��
	if nStep_XBTask_01 == 49 then
		task_019_08_0();
		return
	end
	
	---------------------------------- ������20��֧1_11������թ----------------------------------
	
	--����֧�߽��������ܣ�ȡ��α��ҩ��ҩ��
	if nStep_XBTask_01 == 50 and nStep_XBTask_02 == 21 then
		task_020_01_0();
		return
	--����֧��δ����δȡ��α��ҩ��ҩ��
	elseif nStep_XBTask_01 == 50 then
		task_019_08_1();
		return
	end
	
	--��δ��α��ҩ���������ְ���
	if nStep_XBTask_01 == 51 then
		task_020_01_1();
		return
	end
	
	--������������Ʊ
	if GetBit(GetTask(GIVE_TICKET_STATE),4) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		{"Thi�n M�n ��ng tr� ho b� m�u, M�ch M�n ��ng thanh t�m gi�i kh�t."},
		{"K� L�n c�m m�u, tr� v�t th��ng �ao ki�m, ���ng Quy d��ng kh� huy�t."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--������Ʊ�ű�
function give_ticket_01()

local strTalk = {
	"T�n Ph��ng Nh�n: <sex> kh�ng may r�i, trong m�t ��m � D��c V��ng ��ng m�c ��y D��c nh�n th�o. Ta cho r�ng sau khi D��c V��ng b� ��nh b�i, D��c nh�n th�o v� D��c nh�n c�ng ph�i m�t �i ch�, nghe n�i trong D��c V��ng ��ng c� nhi�u k� hoa d� th�o, kh�ng xem kh�ng ���c, trong ��ng l�i v�a m�c D��c nh�n th�o, e r�ng D��c V��ng v�a v� D��c V��ng ��ng r�i.",
	"Ng��i ch�i: L� th�t? Ta �� d�ng T�ch D��ng th�y lo�i b� D��c nh�n th�o trong ��ng, c� r� c�ng �� thi�u h�y r�i, sao m�t ��m l�i c� ch�?",
	"T�n Ph��ng Nh�n: T�c �� ph�t tri�n D��c nh�n th�o tuy ��ng kinh ng�c, nh�ng T�ch D��ng c�n c� th� kh�c ph�c, <sex> lo�i b� D��c nh�n th�o nh�t ��nh kh�ng sai. C� l� tr�n ng��i D��c V��ng c� gi�u lo�i D��c nh�n th�o, h�n ta b� <sex> ��nh b�i, ch� t�m th�i r�t lui kh�i D��c V��ng ��ng, ho�c h�n v�n ch�a r�i kh�i D��c V��ng ��ng, trong ��ng c�n c� m�t ��ng, ch�ng ta kh�ng bi�t m� th�i.",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"Ng��i ch�i: Theo nh� l�i ti�n sinh, D��c V��ng th�t hung �c, D��c nh�n t�n c� ��i t�m huy�t �� ch� ra nh�ng l�i b� h�y trong ch�p m�t, ��ng l� s� nh�c, sao kh�ng h�n ch�? N�u D��c V��ng tr� th�, ta e r�ng kh� m� �� ph�ng.",
	"T�n Ph��ng Nh�n: ��y c�ng l� m�i lo c�a ta, ng��i n�y th�t t�n t�n l��ng t�m, sao l�i kh�ng tr� th� ch�? D��c V��ng ��ng l� m�t n�i ��p, th�m ch� c� D��c th�o qu� �� h�y di�t, l�m thu�c c� c�ng d�ng kh�i t� h�i sinh. Tr��c ��y khi D��c V��ng t�m ���c ��ng n�y c�ng k�ch ��ng nh� v�y, ch� ��ng ti�c D��c nh�n th�o r�t d� khi�n ng��i sa v�o. N�u gi�i d�ng D��c th�o n�y, th� th� gi�i n�y s� gi�i ���c r�t nhi�u b�nh hi�m ngh�o.",
	"Ng��i ch�i: Ti�n sinh, chi b�ng ta ��n D��c V��ng ��ng xem c� th� �u�i D��c V��ng ra kh�i ��ng kh�ng! Nh�ng D��c V��ng tr�n � Luy�n ��n ��ng, Thi�n c�n ��i th�ch � c�a ��ng, e r�ng ch� th�y ng��i gi� ��ng m�i m� ���c. L�n tr��c ta c�i trang D��c V��ng �i m�t chuy�n, c�ch n�y e r�ng kh�ng d�ng ���c n�a.",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"T�n Ph��ng Nh�n: �a t� <sex>��u�i h�n ra kh�i ��ng l� t�t nh�t, v�a c� th� ph�ng tr� h�a, v�a c� th� d�ng D��c th�o �� c�u ng��i. D��c nh�n tr�ng coi Luy�n ��n ��ng th� t�t nh�t. Ta �� t�ng nghi�n c�u l�m th� n�o �� gi�m uy l�c c�a D��c nh�n, ph�t hi�n D��c nh�n c�ng c� �i�m y�u, �� ch�nh l� T�ch D��ng c�n. ��y l� {T�ch D��ng tinh hoa}, D��c nh�n c� l�i h�i c�ng ph�i s� v�t n�y, n�u ng�m ph�i s� m�t �i c�ng l�c. Ng��i c� th� d�ng v�t n�y �� uy hi�p ng��i tr�ng coi thu�c, v�o Luy�n ��n ��ng s� d� nh� tr� b�n tay. C�n n�a, n�u kh�ng th� �u�i D��c V��ng, sau n�y ng��i c� ���c {T�ch D��ng tinh hoa}, c�ng d� ��n D��c V��ng ��ng gi�m s�t h�nh ��ng c�a n�.",
	"Ng��i ch�i: ��ng l� di�u k�. Ti�n sinh y�n t�m, ta nh�t ��nh s� b�o v� ��c y h�c c�a ti�n sinh!",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1034,1,1);--�õ���������
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),4,1));
	
end