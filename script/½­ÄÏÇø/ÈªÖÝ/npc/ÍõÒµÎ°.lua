
-- ====================== �ļ���Ϣ ======================
-- ��ӦNPC���ƣ���ҵΰ
-- Edited by lizhi
-- 2005/02/22 PM 18:03
-- ======================================================

Include("\\script\\task\\world\\lizhi_Ȫ��\\10��\\task_main.lua");

function main()
    
    local nLevel = 0;
    local nStep = 0;
    
    if GetTask(1) == 25 and GetTask(130) == 1 then
        local szMsg = {
            "Tri�u Di�n Ni�n v� D� T�u l�o nh�n nh� t�i h� mang th� t�i cho V��ng huynh! Xin huynh xem qua!",
            "Qu� l� b�ng h�u t�t! Xem ra c�c huynh v�n c�n nh� ��n ta!",
            "[V��ng Nghi�p V� nh�n l�y b�c th�]",
            "Xin �a t� <sex>!",
            "Kh�ng c� chi."
        };
        SetTask(130, 2);
        if GetTask(131) == 2 and GetTask(132) == 2 then
            SetTask(1, 26); --�����������������������(���һ��)����ر��������
        end;
        TalkEx("", szMsg);
        DelItem(2,0,49,1);
        return
    end;
    
    if GetLevel() < 10 then
        can_not_accept_task();
        return
    end;

    nStep = GetTask(TASK_LEV_12_ID);
    if (nStep == 5) then
        local szTalk = {
            "Phi�n huynh theo d�i s� n� xem chuy�n mua b�n g�n ��y �� b�n cho nh�ng ai? Hi�n ta ch�ng r� g� h�t! Huynh mau xem th�!",
            "G�n ��y, ph�n l�n chuy�n mua b�n l� b�n cho ��i ph� �ng {��i Ch� C��ng} � {Tuy�n Ch�u}, v� h�n cho l� h�ng h�a c�a ta t�t n�n ta m�i l�n l�i ng�n d�m chuy�n t� D��ng Ch�u ��n ��y.",
            "{��i Ch� C��ng} c� th� �� g�p chuy�n! �� ta �i xem th�, sau n�y n�i ti�p nh�!",
        };
        SetTask(TASK_LEV_12_ID, 6);
        SetTask(TASK_LEV_14_ID, 100);   --Ȫ�ݴ�־ǿ������
        TalkEx("", szTalk);
        return
    end;

    nStep = GetTask(TASK_LEV_10_ID);
    if (nStep == 0) then
        task_000_00();
        return
    elseif (nStep == 1) then
        task_001_00();
        return
    elseif (nStep == 2) then
        task_002_00();
        return
    elseif (nStep == 3) then
        task_003_00();
        return
    elseif (nStep >= 4) then
        task_004_00();
        return
    end;

    can_not_accept_task();
end;