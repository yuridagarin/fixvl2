
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �䵱��������ʵ�崦��ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- ���Ϻ����˵ĶԻ�
function task_001()

local strMain = {
		"Ph�m l� �� t� V� �ang ph�i h�c thu�c ��o ��c Kinh, hi�u ���c ng� �, sau �� b�i t� l�ch ��i T� s� m�i c� th� nh�p m�n. Ng��i c� th� ��n V� �ang h�u vi�n t�m <color=yellow>Tr��ng Ng� D��ng<color> h�i r�."
	}

TaskTip("T� H�c Ch�n Nh�n b�o b�n �i g�p Tr��ng Ng� D��ng xin nh�p m�n!");
TE_Talk(getn(strMain), "task_002", strMain);

end


-- �Ի�������ı������1
function task_002()

	SetTask(1002,1);

end


-- ���������ĶԻ�
function task_003()

local strMain = {
		"��o ��c Kinh do L�o T� vi�t, chia l�m quy�n th��ng v� quy�n h�. Quy�n th��ng c� 37 ch��ng, quy�n h� c� 44 ch��ng. Mang n�i dung tinh th�m v� l� chi b�o c�a ��o gia. Ph�m l� �� t� V� �ang, tr��c khi nh�p m�n ph�i <color=yellow>h�c thu�c ��o ��c Kinh<color> v� hi�u ���c � ngh�a. Ng��i c� mu�n th� kh�ng?",
		"�� ta h�c thu�c ��o ��c kinh tr��c/task_003_read",
		"�� ta ��c thu�c ��o ��c kinh/task_003_next",
		"Ta c�n vi�c ph�i l�m/task_exit"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end


-- ������¾�
function task_003_read()

local strMain = {
		"��o Kh� ��o, Phi Th��ng ��o. Danh Kh� Danh, Phi Th��ng Danh. V� Danh Thi�n ��a Chi Kh�i. H�u Danh V�n V�t Chi M�u. C� Th��ng V� D�c D� Quan K� Di�u.",
		"Th��ng H�u D�c D� Quan K� Di�u. Th� L��ng Gi� ��ng Xu�t Nhi D� Danh. ��ng V� Chi Huy�n. Huy�n Chi H�u Huy�n, Ch�ng Di�u Chi M�n.",
		"C�c Th�n B�t T� Th� V� Huy�n T�n. Huy�n T�n Chi M�n Th� V� Thi�n ��a C�n. Mi�n Mi�n Nh��c T�n, D�ng Chi B�t C�n.",
		"Th��ng Thi�n Nh��c Th�y. Th�y Thi�n L�i V�n V�t Nhi B�t Tranh, X� Ch�ng Nh�n Chi S� �c, C� C� � ��o. C� Thi�n ��a, T�m Thi�n Uy�n D� Thi�n Nh�n, Ng�n Thi�n T�n, Ch�nh Thi�n Tr�, S� Thi�n N�ng, ��ng Thi�n Th�i. Phu Duy B�t Tranh, C� V� V�u.",
		"��i Th�nh Nh��c Khuy�t, K� D�ng B�t T�. ��i Doanh Nh��c Xung, K� D�ng B�t C�ng. ��i Tr�c Nh��c Khu�t. ��i X�o Nh��c Chuy�t. ��i Bi�n Nh��c N�t. T�nh Th�ng T�o. Thanh T�nh Vi Thi�n H� Ch�nh.",
		"H�u V�t H�n Th�nh ti�n thi�n ��a sanh. T�ch H� Li�u H� ��c L�p B�t C�i, Chu H�nh Nhi B�t ��i, Kh� D� Vi Thi�n H� M�u. Ng� B�t Tri K� Danh, C��ng T� Chi Vi�t ��o. C��ng Vi Chi Danh Vi�t ��i. ��i Vi�t Th�, Th� Vi�t Vi�n, Vi�n Vi�t Ph�n.",
		"C� ��o ��i, Thi�n ��i, ��a ��i, Nh�n Di�c ��i. V�c Trung H�u ��i, Nhi Nh�n C� K� Nh�t Y�n. Nh�n Ph�p ��a, ��a Ph�p Thi�n, Thi�n Ph�p ��o, ��o Ph�p T� Nhi�n."
	}
	
TE_Talk(getn(strMain), "task_003", strMain);

end





-- ���е��¾�
function task_003_next()

local strMain = {
		"C�u ��u ti�n c�a ��o ��c Kinh l� g�?",
		"��o Sinh Nh�t, Nh�t Sinh Nh�, Nh� Sinh Tam, Tam Sinh V�n V�t/task_error",
		"Nh�n Ph�p ��a, ��a Ph�p Thi�n, Thi�n Ph�p ��o, ��o Ph�p T� Nhi�n/task_error",
		"��o Kh� ��o, Phi Th��ng ��o, Danh Kh� Danh, Phi Th��ng Danh/task_004_next"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

function task_004_next()

local strMain = {
		"C�c th�n b�t t� x�ng l�:",
		"Huy�n V�/task_error",
		"Huy�n T�n/task_005_next",
		"H�u Huy�n/task_error"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

function task_005_next()

local strMain = {
		"Th��ng Thi�n Nh��c?",
		" Kim /task_error",
		"M�c/task_error",
		"Th�y/task_006_next",
		"H�a/task_error",
		"Th�/task_error"
	}

Say(strMain[1],5,strMain[2],strMain[3],strMain[4],strMain[5],strMain[6]);

end

function task_006_next()

local strMain = {
		"C�i g� l� vi thi�n h� ch�nh?",
		"V� vi/task_error",
		"Sung Doanh/task_error",
		"Khu�t Chuy�t/task_error",
		"Thanh T�nh/task_007_next"
	}

Say(strMain[1],4,strMain[2],strMain[3],strMain[4],strMain[5]);

end

function task_007_next()

local strMain = {
		"Nh�n Ph�p ��a, ��a Ph�p Thi�n, Thi�n Ph�p ��o, ��o Ph�p?",
		"T� nhi�n/task_008",
		"�m d��ng/task_error",
		"V� vi/task_error",
		"H� th�c/task_error"
	}

Say(strMain[1],4,strMain[2],strMain[3],strMain[4],strMain[5]);

end

-- ȫ���ش���ȷ��֮��ı����������2
function task_008()

	SetTask(1002,2);
	
	Say("Trong th�i gian ng�n �� h�c thu�c ��o ��c kinh, xem ra t� ch�t ng��i c�ng kh�. H�y t�m <color=yellow>1 thanh Hi�p Thi�u Ki�m<color> v� <color=yellow>1 b�nh Thi�u t�u<color> v� �� ta b�i t� T� s�. Hi�p Thi�u Ki�m c� th� mua � Th��ng �i�m, Thi�u t�u th� ��nh L�u Manh ngo�i r�ng �� l�y, ng��i c�n g� c� th� t�m <color=green>Minh Nguy�t ��o ��ng (218, 208)<color>.",0);
	
	TaskTip("H�y �i t�m 1 thanh Hi�p Thi�u Ki�m v� 1 b�nh Thi�u t�u �� b�i s�!");
	
end


function task_009()

local strMain = {
		"Kh�u n�p thu�n d��ng kh�, th�n luy�n t� kim ��n!",
		"�� b�i T� s�! C� th� quay v� g�p <color=yellow>Ch��ng m�n<color>."
	}

	if (GetItemCount(0,2,14)>=1) and (GetItemCount(2,1,12)>=1) then
	
		TE_Talk(getn(strMain), "task_010", strMain);
		
		TaskTip("B�n �� b�i s�, c� th� quay v� t�m Ch��ng m�n!");
		
	else
	
		Say("Hi�p Thi�u Ki�m c� th� mua � Th��ng �i�m, Thi�u t�u th� ��nh L�u Manh ngo�i r�ng �� l�y.",0);
	
	end
	
return

end

-- ɾ�����;ƣ����ı����������3
function task_010()

	DelItem(0,2,14,1);
	DelItem(2,1,12,1);
	SetTask(1002,3);

end


-- �ؼ����ŵĶԻ�
function task_011()

local strMain = {
		"B�n ��o s� nh�n ng��i l�m �� t� ��i th� 4 c�a V� �ang. Sau n�y ph�i tu�n th� m�n quy, c� g�ng luy�n v�, ��ng ph� s� k� v�ng c�a ta."
	}
	
TE_Talk(getn(strMain), "task_012", strMain);

end


-- �����ŶԻ��������ı����������4
function task_012()

	SetTask(1002,4);
	
	SetPlayerFaction(2)
	SetPlayerRoute(13)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,74,1)
		AddItem(0,108,74,1)
	elseif i==2 then
		AddItem(0,109,78,1)
		AddItem(0,108,78,1)
	elseif i==3 then
		AddItem(0,109,82,1)
		AddItem(0,108,82,1)
	else
		AddItem(0,109,86,1)
		AddItem(0,108,86,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("�����������"..GetName().."���ڽ��ռ����䵱��")
	TaskTip("B�n �� gia nh�p V� �ang, c� th� b�i s� h�c ngh�!")
	
	-- ����������������״̬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function task_exit()

end;


function task_error()

	Say("B�ng h�u ch�a thu�c ��o ��c Kinh, h�c thu�c r�i h�y quay l�i!",0);

end


function fix_wd()
FN_SetTaskState(FN_WD, 0);
Say("C� ch�t v�n �� x�y ra nh�ng �� ���c gi�i quy�t! Ng��i c� th� gia nh�p m�n ph�i l�i.",0);
end;