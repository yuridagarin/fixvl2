
Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�ɶ�\\task_main.lua");

function main()
    local szTalk = {
        "Xin h�i c� ph�i l� H�ng Th�t ��i ca kh�ng? T�i h� ph�ng m�nh Ph�m Tr�ng Y�n ��n th�m h�i, ��y l� t�n v�t xin xem qua!",
        "<sex> kh�ng c�n �a l�. <sex> ��n ��y v� chuy�n c�a Ph�m ti�n sinh ph�i kh�ng?",
        "��ng v�y!",
        "Ta �� cho �� t� C�i Bang ��n ph�n �� Th�nh �� d� la, hi�n v�n ch�a v�. Ng��i gi�p ta khai th�ng con ���ng ��n D� Tr� l�m ���c kh�ng?"
    };
    local szTalk1 = {
        "H�n ta v� ch�a? Theo l�ch tr�nh h�m qua l� t�i.",
        "�� t�i h� �i xem sao"
    };
    local szBack = {
        "�� t� d� la tin t�c �� v�. �a t� <sex> d�c ���ng gi�p ��.",
        "H�ng ��i ca ��ng qu� kh�ch s�o, kh�ng bi�t Th�nh �� c� tin t�c g� kh�ng?"
    };
    local szBack2 = {
        "<sex> chu�n b� l�n ���ng ch�a?",
        "Ta �� s�n s�ng. Phi�n H�ng ��i ca!/task_four_yes",
        "Ta c�n chu�n b�, s� quay l�i sau!/task_exit"
    };
    
    local nStep = GetTask(TASK_CD_FOUR);
    
    if nStep == 1 then
        TalkEx("task_four_01", szTalk);
        return
    elseif nStep == 5 then
        SetTask(TASK_CD_FOUR, 6);
        AddItem(2,0,80,1);
        TalkEx("task_four_05", szBack);
        return
    elseif nStep == 6 then
        SelectSay(szBack2);
        return
    end;
    
    local nTaskValue = FN_GetTaskState(FN_GB);
    
	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
	
		task_003();
		return
	else
		if	GetPlayerFaction() == 4 then
			Say("C� c�n ta ��a xu�ng n�i kh�ng?",2,"Ta ph�ng l�nh bang ch� xu�ng n�i!/outgaibang","Ta ��n th�m S� huynh th�i m�!/no_gaibang")
		else
			Say("Ng��i t�m ti�u �n m�y ta c� chuy�n chi?",2,"C� vi�c g�p! Xin ��a ta xu�ng n�i!/outgaibang","Ta ��n xem qua t�ng �� C�i Bang th�i!/no_other")
		end
	end
	
end;

function outgaibang()	
	if(GetPKValue() >3 ) then
		Msg2Player("Ng��i l�m vi�c �c c�m ra v�o th�n tr�n.")	
	else
        	SetFightState(0)
		i=random(1,4)
        	if i==1 then
			NewWorld(150, 1724 ,3075)
		elseif i==2 then
			NewWorld(150, 1630 ,3050)
		elseif i==3 then
			NewWorld(150, 1615 ,3175)			
		else 
			NewWorld(150, 1757 ,3179)
		end
	end
end;

function no_gaibang()
	if GetSex() == 1  then
 		Say("��ng t��ng ta kh�ng bi�t, mu�n ��n c��p ��i g� c�a ta �? C�t �i!",0)
 	else
 		Say("S� mu�i ��n ��ng l�c l�m! Huynh m�i xin ���c ��i g�, c� mu�n n�m th� kh�ng?",0)
 	end
end;


function no_other()
	if GetSex() == 1  then
 		Say("Ng�i mi�u hoang n�y ch�ng c� g� ��c bi�t! C�ng t�! Xin m�i v�o!",0)
 	else
 		Say("N�o d�m phi�n l�ng c� n��ng! Xin m�i v�o trong!",0)
 	end
end;
