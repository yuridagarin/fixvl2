--����
--�ص㣺���Ź�  ����������������4
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_GetTaskStep(bTag) then
		return
	end
	UWorld1401 = GetTask(1401)
	if ( UWorld1401 == 25 )  then
		Talk(7,"","Nh�n huynh ��y t��ng m�o ���ng ���ng, �t h�n l�m th�ng l�nh � ��y, xin h�i c� bi�t <color=yellow>B�n �� S�n H� X� T�c<color> � ��u kh�ng?","Qu� khen, qu� khen! Ta ��y ch� l� ��i tr��ng th�i. <color=yellow>B�n �� S�n H� X� T�c<color> ch� c� ��i nh�n t��ng qu�n m�i bi�t ���c.","V�y phi�n ��i nh�n b�m b�o m�t ti�ng, t�i h� c� vi�c g�p c�n th��ng l��ng v�i T��ng qu�n.","Qu�n doanh kh�ng th� t�y ti�n ra v�o, ng��i ��i � ��y nh�!","C� c�ch n�o �� v�o qu�n doanh g�p t��ng qu�n kh�ng?","Ng��i ��n <color=red>Bi�n Kinh ph�<color> t�m <color=red>Binh b� Th� Lang<color> b�o danh, nh�ng c�ng kh�ng ch�c l�m.","�a t� �� ch� gi�o.")
	
	    SetTask(1401,30)
	    GivePlayerExp(SkeyTianmenzhen,"jieyu")
    --Earn(1000)
	    ModifyReputation(15,0)
	    TaskTip("��n Bi�n Kinh b�o danh.")
	
	elseif ( UWorld1401  == 30  ) then
		Talk(1,"","Ng��i ��n <color=red>Bi�n Kinh ph�<color> t�m <color=red>Binh b� Th� Lang<color> b�o danh, nh�ng c�ng kh�ng ch�c l�m.")	
		
	elseif ( UWorld1401  > 30  ) then
		Talk(1,"","Ch�c cao quy�n tr�ng, qu�n m�t ng��i huynh �� n�y r�i.")
	else
		Talk(1,"","Xu�t, ��ng n�i v�y ch�!")
	end
end;
