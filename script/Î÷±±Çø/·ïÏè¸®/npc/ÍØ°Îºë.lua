-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ���踮NPC�ذκ�Script
-- By StarryNight
-- 2007/06/26 PM 5:04

-- ΢Ц��Ȼ��

-- ======================================================

-- ���þ�������ͷ�ļ�
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- ��������08������----------------------------------
	
	--�ܳ��ְ����Ը������ذκ�ѯ�ʹ��ڹ����������
	if nStep_XBTask == 37 then
		if is_show_title_level() == 1 then --����һƷ�ô̿ͳƺ� 
			task_008_02_0();
		else
			xb_title_tip(2,"Th�c B�t Ho�ng ");
		end
		return
	end
	
	--��δ�Ѵ���ҩ��˾������
	if nStep_XBTask == 38 then
		task_008_02_1();
		return
	end
	
	---------------------------------- ������09��֧1_1������ʹ----------------------------------
	--�Ѵ���ҩ��˾�������ر��ذκ�
	if nStep_XBTask == 39 then
		if is_show_title_level() == 1 then --����һƷ�ô̿ͳƺ� 
			task_009_01_0();
		else
			xb_title_tip(2,"Th�c B�t Ho�ng ");
		end
		return
	end
	
	--��̽��������Ϣ��
	if nStep_XBTask_01 >= 1 and nStep_XBTask_01 <= 6 then
		task_009_01_1();
		return
	end
	
	---------------------------------- ������11��֧1_3����֮Ĺ----------------------------------
	
	--��̽����������������
	if nStep_XBTask_01 == 7 then
		if is_show_title_level() == 1 then --����һƷ�ô̿ͳƺ� 
			task_011_01_0();
		else
			xb_title_tip(2,"Th�c B�t Ho�ng ");
		end
		return
	end
	
	--��û�����ְ������ذκ�Ի�
	 if nStep_XBTask_01 == 8 then
		task_011_01_1();
		return
	end
	
	---------------------------------- ������13��֧1_5������Ĺ----------------------------------
	
	--���ذκ�Ի��������˿����
	if nStep_XBTask_01 == 15 then
		if is_show_title_level() == 1 then --����һƷ�÷ɻ��ƺ� 
			task_013_01_0();
		else
			xb_title_tip(3,"Th�c B�t Ho�ng ");
		end
		return
	end
	
	--��δ����˿���ֽ���˾������
	if nStep_XBTask_01 == 16 then
		task_013_01_1();
		return
	end
	
	---------------------------------- ������15��֧1_6��Ĺ����----------------------------------
	
	--���ذκ�Ի���֪צ���Ѿ�Ǳ����Ĺ�����һƷ�û���ƺţ�
	if nStep_XBTask_01 == 22 then
		if is_show_title_level() == 1 then --����һƷ�÷ɻ��ƺ� 
			task_015_01_0();
		else
			xb_title_tip(3,"Th�c B�t Ho�ng ");
		end
		return
	end
	
	--��δ��ɱצ��
	if nStep_XBTask_01 == 23 then
		task_015_01_1();
		return
	end
	
	---------------------------------- ������16��֧1_7ҩ�˾���----------------------------------
	
	--��ī�������彻����������ذκ�Ի�
	if nStep_XBTask_01 == 29 then
		if is_show_title_level() == 1 then --����һƷ�û���ƺ� 
			task_016_01_0();
		else
			xb_title_tip(4,"Th�c B�t Ho�ng ");
		end
		return
	end
	
	--δ�복�ֻ㱨������Ĺ�����
	if nStep_XBTask_01 == 30 then
		task_016_01_1();
		return
	end
	
	---------------------------------- ������21��֧1_12��������----------------------------------
	--���ذκ�Ի�
	if nStep_XBTask_01 == 57 then
		if is_show_title_level() == 1 then --����һƷ�������ƺ� 
			task_021_02_0();
		else
			xb_title_tip(5,"Th�c B�t Ho�ng ");
		end
		return
	end
	
	--δɱ������ʹ�Ի�
	if nStep_XBTask_01 == 58 then
		task_021_02_1();
		return
	end
	
	--ɱ������ʹ�Ի�
	if nStep_XBTask_01 == 59 then
		if is_show_title_level() == 1 then --����һƷ�������ƺ� 
			task_021_04_0();
		else
			xb_title_tip(5,"Th�c B�t Ho�ng ");
		end
		return
	end
	
	--δɱ�����ְ����Ի�
	if nStep_XBTask_01 == 60 then
		task_021_04_1();
		return
	end
	
	--������������Ʊ
	if GetBit(GetTask(GIVE_TICKET_STATE),5) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--һ������µĶԻ�
	strTalk = {
		{"V� c�ng c�i th� ��ng b�a ��t, v� h�c sao c� k� m�nh nh�t? V� t�m m�i l� s� cao th�p c�a v� ngh�."},
		{"Ki�m v� t�m n�u kh�ng h�p nh�t th� chi b�ng t� nay ��ng d�ng ki�m."},
		{"Thi�n h� tuy r�ng l�n nh�ng ng��i c� v� c�ng cao ch� xu�t hi�n � trung nguy�n."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--������Ʊ�ű�
function give_ticket_01()

local strTalk = {
	"Th�c B�t Ho�ng: H�a ra l� <sex>, ha ha ha, h�nh nh� ch�ng ta m�i l�n g�p m�t, ta ��u tr�ng th��ng, ��u kh�ng th� ch�m s�c ng��i, th�t h� th�n!",
	"Ng��i ch�i: Ti�n b�i �� xem ta l� h�o h�u, th� n�i chi nh�ng l�i kh�ch kh� th� ch�. V�t th��ng c�a ti�n b�i c� n�ng kh�ng? Ng� H�nh S� r�t cu�c x�y ra chuy�n g� th�?",
	"Th�c B�t Ho�ng: Ha ha ha, h�m tr��c T� M� Minh Phong m�i t�ng m�t �t thu�c gia truy�n, ta �� �� nhi�u r�i. L�n n�y th�t s� l� may m�n, c�m �n ng��i l�n tr��c ��n sa m�c ph� Ng� H�nh Tr�n m�t l�n, khi�n cho nguy�n kh� c�a h� b� t�n th��ng. 5 ng��i trong Ng� H�nh S� l� m�t, tuy�t ��i s� kh�ng h�nh ��ng ri�ng l�, nh� h�m nay ch� c� 3 ng��i h�nh th�ch ta, ta �o�n c� 2 nguy�n nh�n. L� Nguy�n Kh�nh nh�t ��nh �� truy�n {Thi�t Chu L�nh}, hai l� 5 ng��i trong Ng� H�nh S� t�t c� ��u ch�a h�i ph�c nguy�n kh�, cho d� l� 3 ng��i c�ng kh�ng th� kh�ng h�nh ��ng.",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"Ng��i ch�i: Ti�n b�i kh�ng ng�i, ta c�ng an t�m. Xem ra Nh�t Ph�m ���ng kh�ng d� d�ng t� b�. {Thi�t Chu L�nh} m� ti�n b�i n�i c� th� gi�ng v�i Truy S�t l�nh kh�ng?",
	"Th�c B�t Ho�ng: Kh�ng sai, th�t ra Ng� H�nh S� thu�c nh�m �m s�t Nh�t Ph�m ���ng, ��y l� t� ch�c b� m�t tr�c ti�p nghe l�nh t� L� Nguy�n Kh�nh, th�ng tin ta bi�t kh� �t. Nh�ng Thi�t Chu L�nh c�a L� Nguy�n Kh�nh, l� Truy S�t l�nh kh�ng ph�n bi�t th�i gian, kh�ng gian, ��a �i�m, th� �o�n, kh�ng ��t ���c m�c ��ch s� kh�ng r�t l�nh. Nh�m �m s�t n�y s� ra tay gi�ng nh� th� �o�n �m s�t c�c Ch��ng m�n ��i m�n ph�i � Trung Nguy�n. L�y nguy�n nh�n l� Ng� H�nh S� tuy ch� c� 3 ng��i, v�n ph�i ch�p h�nh nhi�m v�, �n t�nh ph�a sau kh� m� �o�n ���c. <sex> c� an t�m, n�u ta �o�n kh�ng sai, ng��i c�ng l� m�c ti�u c�a ch�ng.",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"Ng��i ch�i, H�m, Nh�t Ph�m ���ng ��ng l� xem th��ng ng��i kh�c, xem ra ng�y n�o ch�a gi�t ���c Ng� H�nh S� th� kh� tr�nh kh�i h�u ho�n, D� cho c� xem ta l� m�c ti�u, Ng� H�nh S� v�n ch�a h�i ph�c nguy�n kh�, chi b�ng ra tay tr��c. Nh�ng l�n tr��c ta �� th� qua uy l�c c�a Ng� H�nh Tr�n r�i, ch�ng th�t s� r�t kh� ��i ph�.",
	"Th�c B�t Ho�ng: Ng� H�nh S� t��ng sinh t��ng kh�c, d�ng t�i n�ng �� c�n b�ng, tr� phi m�t nh�t ti�u di�t h�t b�n ch�ng, n�u kh�ng th� ai trong s� ch�ng c�ng kh�ng th� ch�t ���c. Nguy�n kh� c�a ch�ng ch�a h�i ph�c, n�u ra tay tr��c kh�ng ng�ng �p ch� ch�ng, h� s� kh� m� th�c hi�n nhi�m v�, �� c�ng l� c�ch t�t. N�u Ng� H�nh S� truy s�t ng��i t�o ph�n, s� �� l�i {Ng� H�nh K� Phi�n}, m�t l� cho th� nh�n bi�t �� l� ng��i do Ng� H�nh S� truy s�t, hai l� nh�c nh� ai c� � t�o ph�n, d�ng {Ng� H�nh K� Phi�n} l� k� hi�u c�a Ng� H�nh S�. Mang v�t n�y ��n Ng� H�nh Tr�n, cho d� Ng� H�nh S� c� tr�ng th��ng c�ng s� k�t tr�n ti�p ng��i, n�u ng��i l� ng��i Thi�t Chu L�nh truy s�t, ch�ng s� kh�ng d� g� b� qua. N�u ch�ng b�i tr�n, sau n�y ng��i c�ng c� th� d�ng v�t n�y ti�p t�c �p ch� Ng� H�nh Tr�n.",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1035,1,1);--�õ��������
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),5,1));
	
end