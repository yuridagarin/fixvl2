-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��ü�����������񶡽ű��ļ�
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_em.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�����\\task_main.lua");

function main ()
    local nTaskValue = FN_GetTaskState(FN_EM);
    local nStep = GetTask(TASK_JJC_DING);
    
    if nTaskValue == 2 and nStep == 1 then
        local szSay = {
            "<sex> t�m ti�u nh�n c� vi�c g�?",
            "Nhi�m v� Nga My ph�i/em_question",
            "Nhi�m v� Giang T�n th�n/jjc_question"
        };
        SelectSay(szSay);
        return
    end;
    
    if nTaskValue == 2 then
        em_question();
        return
    end;
    
    if nStep == 1 then
        jjc_question();
        return
    end;
    
    UWorld1506 = GetTask(1506)
  	UWorld1516 = GetTask(1516)
  	if ( UWorld1506 >= 5   and  UWorld1516 == 0 )   then
  		Talk(3,"","Chu Thi�n Nh�n m� kho ph�t l��ng th�c, sai ta ��n th�ng b�o cho ng��i bi�t.","�a t� B�ng h�u �� ��n b�o tin, ��i �n ��i ��c n�y ta s� kh�ng qu�n!","Ch� l� chuy�n nh�! ��ng n�n kh�ch s�o. H�y mau ��n ��, ta c�n ph�i b�o tin cho ng��i kh�c n�a!")
  		SetTask(1516,1)
  		UWorld1506=UWorld1506+1
  		SetTask(1506,UWorld1506)
  		if UWorld1506 == 9 then 
  			AddNote("Th�ng b�o N�n d�n xong, quay v� g�p Chu Thi�n Nh�n!")
			TaskTip("Th�ng b�o N�n d�n xong, quay v� g�p Chu Thi�n Nh�n!")
  		end	
  	elseif ( GetCash() >=50000  )  then
		Say("Cho t�i v�i ��ng mua m�n th�u �n �i! Ti�u d�n c�n m� gi� v� v� con c�n ph�i lo, ng��i n�i xem c�n ai kh� h�n ta n�a?",2,"Th�t l� t�i nghi�p!/zaimin1000_yes","H�y t�m ng��i kh�c �i!/zaimin_no")
	elseif ( GetCash() >=4000 and GetCash() < 50000  )  then
		Say("Cho t�i xin v�i ��ng mua ch�n ch�o �n �i! V� c�a ti�u d�n �� b� theo ng��i kh�c, con th� b�n cho �ng ch� l�m A Ho�n, ng��i n�i xem c�n ai kh� h�n ta?",2,"Th�t l� t�i nghi�p!/zaimin500_yes","H�y t�m ng��i kh�c �i!/zaimin_no")
	elseif ( GetCash() >=1000 and GetCash() < 4000 )  then
		Say("Cho t�i xin v�i ��ng mua ch�n ch�o �n �i! Ti�u nh�n �� ��n b��c ���ng c�ng r�i, ng��i n�i xem c�n ai kh� h�n ta?",2,"Th�t l� t�i nghi�p!/zaimin100_yes","H�y t�m ng��i kh�c �i!/zaimin_no")
	elseif ( GetCash() >=50 and GetCash() < 1000 )  then
		Say("Cho ti�u nh�n m�y ��ng mua ch�o �n �i! Ti�u nh�n ��i ��n n�i ph�i b�n con ch� �� ��i m�n th�u �n. Ng��i n�i xem c�n ai kh� h�n ta ch�?",2,"Th�t l� t�i nghi�p!/zaimin10_yes","H�y t�m ng��i kh�c �i!/zaimin_no")
	elseif ( GetCash() < 50 )  then
		Say("Ti�n trong ng��i c�n �t h�n �n m�y n�a. Ng��i n�i xem c�n ai kh� h�n ta n�a?",2,"Cho d� c� c�ng kh�ng cho ng��i! C� tay c� ch�n ch�ng l� kh�ng bi�t t� ki�m s�ng sao!/zaimin_zdd","Ng��i c�ng c�nh ng� ch� n�n ch� c��i/zaimin_zbd")
	end
end;

function jjc_question()
    local nStep = GetTask(TASK_JJC);
    if nStep == 4 then
        task_jjc_fq(4);
    end;
end;

function em_question()

local nTaskValue = FN_GetTaskState(FN_EM);

	if (nTaskValue==2) then
	
		if (GetTask(EM_MANTALK_04)==0) then
			task_007_01();
			return
		else
			Say("�a t� ��i hi�p!",0);
			return
		end;
		
	end
end;

function  zaimin1000_yes()
	Talk(1,"","B� T�t chuy�n th�! ��n c�u ch�ng ta r�i!")
	Pay(1000)
	TaskTip("B�n b� th� cho N�n d�n 1000 ti�n ��ng!")
end;

function  zaimin500_yes()
	Talk(1,"","Tr�i! Ta kh�ng ph�i �ang n�m m� ch�?")
	Pay(500)
	TaskTip("B�n b� th� cho N�n d�n 500 ti�n ��ng!")
end;

function  zaimin100_yes()
	Talk(1,"","Oa! ��ng l� ra ���ng g�p qu� nh�n!")
	Pay(100)
	TaskTip("B�n �� ��a N�n d�n 100 ti�n ��ng!")
end;

function  zaimin10_yes()
	Talk(1,"","� hi�n s� g�p l�nh!")
	Pay(10)
	TaskTip("B�n b� th� cho N�n d�n 10 ti�n ��ng")
end;

function  zaimin_no()
	Talk(1,"","L�m �n b� th� cho ti�u nh�n v�i ��ng b�c l�.")
end;
function  zaimin_zdd()
	Talk(1,"","�n xin th�t ra c�ng kh�ng t� l�m!")
end;

function  zaimin_zbd()
	Talk(1,"","Y�n t�m! Sau n�y ta ph�t t�i m�i ng�y s� ��a ng��i 10 l��ng b�c.")
end;
