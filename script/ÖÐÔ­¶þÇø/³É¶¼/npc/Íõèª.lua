--����
--�ص㣺 ����
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");
--*****************************************���峣����Ԥ����************************************
Include("\\script\\task\\lifeskill\\skill_lvlup.lua")
LEV_LEARNRECIPE=1926;
LEVELTASKID49=518					--��������ȹ
TASKID_LIFESKILL_FLG=1932	--49������������
TASK_GATHER_FLAG=1931 		--������Ʒ�ɼ���ʾ

strName = "";
strTitle = "";
--*****************************************MAIN����********************************************
function main()
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "

	------------------------------------------����Խ�Ӹ������----------------------------------------
	UWorld1402 = GetTask(1402)	
	if ( UWorld1402 == 80 )  then
		Say("T�m ta c� vi�c g�?",
			2,
			"Ta ��n t�m hi�u t�nh h�nh c�a Phong �� Qu� Th�nh/WuYue", 
			"Kh�ng c� vi�c g�!/SayHello")
	else
		Say("T�m ta c� vi�c g�?",
			1,
			"Kh�ng c� vi�c g�!/SayHello")
	end
	return
end;


--*******************************************����Խ�Ӹ����񲿷�****************************************
function WuYue()
	Talk(7,"","V� ��y l� V��ng C�n t� t�. G�n ��y th�ch m�n Phong Ma ��ng �� m� v� Phong �� Qu� Th�nh c�ng t�i hi�n nh�n gian. D��ng Nguy�t S� Th�i b�o ta nh� ng��i gi�p ��.","Cu�i c�ng c� ta c�ng ch�u ��n t�m ta","C� ta n�i n�m x�a l� do c� �y kh�ng ph�i v�i ng��i, mong ng��i h�y l�y vi�c c�u sinh linh �� th�n l�m tr�ng v� ch� c�ch �u�i b�n Qu� Th�nh ra kh�i nh�n gian.","Th�t s� m�y n�m nay ta c�ng kh�ng c� gi�n c� ta, chuy�n t�m thanh tu tr�n n�i. Theo ta t�nh <color=yellow>m�nh b�n �� S�n H� X� T�c �� b� chia th�nh nhi�u m�nh<color>. Ch� d�a v�o s�c m�nh c�a y�u qu�i th� kh�ng th� m� phong �n ���c. Nh�t ��nh l� c� ng��i kh�c gi�p s�c. Theo ta bi�t ch� c� m�t ng��i c� th� c� n�ng l�c ��.","Ng��i �� l� ai?","Ng��i �� l� <color=red>Ng� Vi�t L�o T�<color> � <color=red>Thi�n S� ��ng Thanh Th�nh s�n<color>, s�c m�nh c�a h�n ngay c� Ch��ng m�n c�c ph�i � Trung Nguy�n li�n th� c�ng kh�ng b� ���c hu�ng chi b�y gi� h�n l�i c� m�nh b�n �� S�n H� X� T�c trong tay, Phong Ma ��ng nh�t ��nh l� do h�n m�, v�i c�ng l�c ng��i hi�n nay kh�ng ph�i l� ��i th� c�a h�n, �� ta t�m c�ch kh�c.","Ti�n b�i kh�ch s�o r�i!")
	SetTask(1402,85)
	Earn(1300)
	GivePlayerExp(SkeyFDGC,"fengduguicheng11")		--�ᶼ���11
	ModifyReputation(20,0)
end


--************************************************ͨ�ô���**************************************
--�պ���
function SayHello()	
end

