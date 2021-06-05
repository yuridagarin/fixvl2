--����
--�ص㣺�꾩��  ����������������6
--�߻���������  2004.03.
--append by lizhi
--2005-8-8 11:26

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�꾩\\task_main.lua");

function main()

    local nBjStep = GetTask(TASK_BJ_ID);    --�꾩����
    local UWorld1401 = GetTask(1401);
    
    if nBjStep >= 1 and nBjStep<=6 and UWorld1401 ~= 0 then
        local szSay = {
            "<sex> t�m ta c� vi�c g� kh�ng?",
            "Nhi�m v� Bi�n Kinh/bj_question",
            "Nhi�m v� Thi�n M�n tr�n/tmz_question"
        }
        SelectSay(szSay);
        return
    end;
    
    if nBjStep >= 1 and nBjStep<=6 then
        bj_question();
        return
    end;
    
    if UWorld1401 ~= 0 then
        tmz_question();
        return
    end;
    Talk(1,"","Gi�c Khi�t �an t� cao t� ��i nh�ng kh�ng d� x�m ph�m c��ng th� ��i T�ng ta!");
end;


function bj_question()
    local nBjStep = 0;
    nBjStep = GetTask(TASK_BJ_ID);  --�꾩ϵ��������������
    
    if (nBjStep == 1) then
        task_001_00();
        return
    elseif (nBjStep == 2) then
        task_002_00();
        return
    elseif (nBjStep == 3) then
        task_003_00();
        return
    elseif (nBjStep == 4) then
        task_004_01();
        return
    elseif (nBjStep == 5) then
        task_005_00();
        return
    elseif (nBjStep == 6) then
        task_006_00();
        return
    else
    	Talk(1,"","Gi�c Khi�t �an t� cao t� ��i nh�ng kh�ng d� x�m ph�m c��ng th� ��i T�ng ta!")
    end;
end;

function tmz_question() --����������
    local UWorld1401 = GetTask(1401);
    if ( UWorld1401 == 40 )  then
    	Talk(6,"","T�i h� v�n an Xa L�o Th�i Qu�n!","Kh�! Kh�! �a t�! Xin h�i anh h�ng c� g� ch� gi�o!","T� nh� t�i h� v�n s�ng k�nh D��ng t��ng qu�n, nay mu�n b�o danh gia nh�p D��ng Gia qu�n gi�t gi�c Khi�t �an. N�o ng� b� bi�t ph�i ��n L��ng S�n B�c, xin L�o Th�i Qu�n ph�i t�i h� ��n Nh�n M�n quan ti�n tuy�n!","H�! Chuy�n n�y d� th�i! Chuy�n c�a D��ng Gia qu�n, l�o ��y c� th� t� quy�t! C� n�i l� ta ph�i ng��i �i s� d� d�ng ��u qu�n!","Ti�n th� ng��i chuy�n l�i cho phu qu�n <color=red>D��ng Nghi�p<color> c�a ta � <color=red>Nh�n M�n quan<color> r�ng: Ti�u nh�n l�ng quy�n, h� t�t ph�i ph� t�i.","�a t� L�o Th�i Qu�n chi�u c�! Ti�u nh�n nh�t ��nh chuy�n l�i!")
        SetTask(1401,45)
        ----AddItem(0,0,0)
        Earn(1000)
        ModifyExp(1500)
        ModifyReputation(12,0)
        AddNote("��n Nh�n M�n quan t�m D��ng Nghi�p chuy�n l�i c�a Xa Th�i Qu�n, ��ng th�i h�i th�m tin t�c v� B�n �� S�n H� X� T�c!")
        TaskTip("��n Nh�n M�n quan t�m D��ng Nghi�p chuy�n l�i c�a Xa Th�i Qu�n, ��ng th�i h�i th�m tin t�c v� B�n �� S�n H� X� T�c!")
    	
    elseif ( UWorld1401  == 45  ) then
    		Talk(1,"","Gi�p ta chuy�n l�i cho phu qu�n <color=red>D��ng Nghi�p<color> � <color=red>Nh�n M�n quan<color>!")	
    elseif ( UWorld1401  > 45  ) then
    	Talk(1,"","�a t� b�ng h�u!")
    else
    	Talk(1,"","Gi�c Khi�t �an t� cao t� ��i nh�ng kh�ng d� x�m ph�m c��ng th� ��i T�ng ta!")
    end
end;