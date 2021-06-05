
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����ϵͳ�����ļ�
-- Edited by peres
-- 2005/05/30 PM 17:14

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ������������ͷ�ļ�
Include("\\script\\lib\\task_main.lua");

function main()

	local strMain_001 = {
		"B�nh t�nh c�a ph� th�n g�n ��y l�i t�i ph�t, b�ng h�u c� th� gi�p ta t�m m�t �t th�o d��c kh�ng?",
		"��ng �/task_yes_01",
		"Ta c� vi�c r�i./no"
	};
	
	local strMain_002 = {
		"�a t� ng��i �� gi�p ph� th�n ta t�m th�o d��c, nh�ng th�i th� lo�n l�c, gia c�nh l�i kh� kh�n�Ta ch�ng bi�t ph�i l�m sao n�a�",
		"Ta c� th� gi�p ng��i t�m m�t c�ng vi�c./task_yes_02",
		"Ta c� vi�c r�i./no"
	};
	
	local strMain_003 = {
		"Th�t t�t qu�, ng��i �� nhi�u l�n ra tay gi�p ��, �n n�y ghi l�ng t�c d�. Sau n�y c� vi�c g� c�n ��n ti�u nh�n n�y xin c� h� c�.",
		"nh�ng c�ng k� l�, b�n gi�c c� �� c��p b�nh s� n�y �� l�m g� ch�?",
		"C�i g�? Ch� ph�i l�n n�y ng��i �� d�p ���c m�y t�n gi�c c� �� r�i sao?",
		"Th� ��ng l� nh� v�y nh�ng �� xem ch�ng c�n d� tr� g� n�a kh�ng?",
		"Ta kh�ng bi�t nhi�u v� b�n ch�ng nh�ng trong th�nh c� <color=yellow>Tr��ng �nh<color> h�n c� bi�t b�n n�y, ng��i ��n �� h�i xem...",
		"Ng��i n�n b� � ��nh khuy�n �n C�ng �i."
	};
	
	if CTask:IsTaskFinish("Nhi�m v� 2 C� M�c_T��ng D��ng") then
		CTask:TalkEx("task_yes_03",strMain_003);
		return
	end;
	
	if CTask:IsTaskFinish("Nhi�m v� 2 H�n t�ng qu�n_T��ng D��ng") then
		Say("",0);
		CTask:FinishTask("Nhi�m v� 2 C� M�c_T��ng D��ng");
		CTask:PayAward("Nhi�m v� 2 C� M�c_T��ng D��ng");
		return
	end;
	
	if CTask:IsTaskFinish("Nhi�m v� 1 C� M�c_T��ng D��ng") then
		if CTask:CheckCanStart("Nhi�m v� 2 C� M�c_T��ng D��ng")==1 then
			CTask:SayEx(strMain_002);
			return
		end;
	end;
	
	if CTask:IsTaskStart("Nhi�m v� 1 C� M�c_T��ng D��ng")==1 then
		Say("Ng��i gi�p t�m 3 lo�i th�o d��c <color=yellow>C�t c�nh<color>, <color=yellow>Ho�ng li�n<color>, <color=yellow>X� h��ng<color> v� ch�a?",
			2,
			"���c/task_check",
			"V�n ch�a /no");
		return
	end;
	
	if CTask:CheckCanStart("Nhi�m v� 1 C� M�c_T��ng D��ng")==1 then
		CTask:SayEx(strMain_001);
		return
	end;
	
	main_default();

end;


-- �����˹�ĬѰҩ������
function task_yes_01()
	Say("�a t� ng��i, ��n thu�c n�y c�n <color=yellow>C�t c�nh<color>, <color=yellow>Ho�ng li�n<color>, <color=yellow>X� h��ng<color>.",0);
	CTask:StartTask("Nhi�m v� 1 C� M�c_T��ng D��ng");
end;

-- �����˰�����Ĭ�ҹ���������
function task_yes_02()
	Say("<color=yellow>H�n t�ng qu�n<color> � T� M� th�i th� hi�n �ang tuy�n Gia �inh, ta v�n kh�ng nh� kh�ng c�a ng��i c� th� h�i th�m gi�p ta kh�ng? N�u ���c nh�n v�o th� n�a ��i sau kh�ng ph�i lo ngh�",0);
	CTask:StartTask("Nhi�m v� 2 C� M�c_T��ng D��ng");
end;

-- ������ȥ����Ӱ������
function task_yes_03()
	CTask:FinishTask("Nhi�m v� 2 C� M�c_T��ng D��ng");
	CTask:PayAward("Nhi�m v� 2 C� M�c_T��ng D��ng");
	CTask:StartTask("T�m Tr��ng �nh_T��ng D��ng");
end;

-- ��������ĬѰҩ�������Ƿ����
function task_check()

if CTask:CheckTask("Nhi�m v� 1 C� M�c_T��ng D��ng")==1 then
	Say("Th�t �a t�, ta ph�i s�c thu�c cho cha ��y.",0);
	CTask:FinishTask("Nhi�m v� 1 C� M�c_T��ng D��ng");
	CTask:PayAward("Nhi�m v� 1 C� M�c_T��ng D��ng");
	return
else
	Say("Ng��i v�n ch�a t�m ���c 3 lo�i th�o d��c �y �? Hay l�m r�i d�c ���ng r�i?",0);
	return
end;

end;


-- ʲô����Ҳû�е�Ĭ��״̬
function main_default()
	i=random(1,3)
	if i==1 then 
		Talk(1,"","T�i sao c�c ng��i c� ng�y c� �i �i l�i l�i ? C�n ta l�i ph�i b�t c� ki�m ti�n ch�?")
	elseif i == 2 then  
		Talk(1,"","T� T��ng D��ng �i v� ph�a t�y l� V� �ang ph�i, may ra � �� c� th� tr� li�u ���c b�nh t�nh c�a ph� th�n.")
	else
		Talk(1,"","H�n t�ng qu�n ��ng � nh�n ta l�m gia �inh, hy v�ng t� ��y ta kh�ng c�n v�t v� n�a.")
	end
end;

function no()

end;