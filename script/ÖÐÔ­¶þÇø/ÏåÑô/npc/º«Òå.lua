
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����ϵͳ�����ļ�
-- Edited by peres
-- 2005/05/31 PM 15:17

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ������������ͷ�ļ�
Include("\\script\\lib\\task_main.lua");

function main()

local strMain_001 = {
	"Xin h�i, ng��i l� H�n t�ng qu�n?",
	"��ng v�y! V� "..CTask:GetSexName().."C� vi�c g� kh�ng?",
	"Nghe n�i H�n ph� c� chi�u m� th�m gia �inh?",
	"��ng nh�c ��n chuy�n n�y, ng��i c�ng bi�t th�i th� lo�n l�c tri�u ��nh �ang c�t b�t b�ng l�c. Ta �ang mu�n gi�m n� gia ��y, l�m g� c� chuy�n tuy�n th�m ch�?",
	"N�i v�y m�t ch�t ngo�i l� c�ng kh�ng c� sao?",
	"Th�i Th� �ang c� t�m s�, n�u ng��i gi�p ���c �ng �y may ra c�n c� h�i.",
	"Ta nh�t ��nh s� l�m ���c.",
	"Th�i Th� mua m�t c� <color=yellow>Thanh Hoa T� Kh�<color> v�n chuy�n v� g�n ��n <color=yellow>T��ng D��ng<color> th� b� b�n Th� Ph� � Ph�c Ng�u S�n c��p �i, c�ng v� chuy�n n�y m� m�t �n m�t ng�.",
	"<color=yellow>Thanh Hoa T� Kh�<color> �? Ta l�p t�c ��n <color=yellow>T��ng D��ng<color> �em v� ngay!"
}
	-- �õ��˴���֮��
	if CTask:IsTaskStart("Nhi�m v� 2 H�n t�ng qu�n_T��ng D��ng") then
		Say("Ha ha, qu� l� c� b�n l�nh! Kh�ng ng� b�n ch�ng c�ng b� ng��i h� g�c. B�ng h�u ng��i nh�t ��nh s� nh�n v�o ph� l�m vi�c.",0);
		CTask:FinishTask("Nhi�m v� 2 H�n t�ng qu�n_T��ng D��ng");
		CTask:PayAward("Nhi�m v� 2 H�n t�ng qu�n_T��ng D��ng");
		return
	end;

	if CTask:IsTaskStart("Nhi�m v� 2 C� M�c_T��ng D��ng") and not CTask:IsTaskStart("Nhi�m v� 1 H�n t�ng qu�n_T��ng D��ng") then
		CTask:TalkEx("task_001", strMain_001);
		return
	end;

	main_default();

end;

-- ��ʼ���ܹܵ�����
function task_001()
	CTask:StartTask("Nhi�m v� 1 H�n t�ng qu�n_T��ng D��ng");
	return
end;

function main_default()
	i=random(1,3)
	if i==1 then 
		Talk(1,"","Kh�ng bi�t l�n n�y l� ph�c hay h�a ��y�!")
	elseif i == 2 then  
		Talk(1,"","L�n n�y t� h�p � Y�n V� L�u nh�t ��nh s� c� nhi�u ng��i ��n tham gia, ph�i �� ph�ng m�i ���c.")
	else
		Talk(1,"","Kh�ng bi�t Thi�n Thi�n d�o n�y th� n�o, m�y n�m r�i m� con h� kh�ng ���c g�p nhau.")
	end
end
