--  �ļ�˵��
--  ʹ����ΰ�յ��غ��Ժ󴥷��Ľű��ļ�
--  Created by lizhi
--  2005-8-4 21:13

Include("\\script\\task\\world\\lizhi_������\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

    local szMsg = {
        "Nh�n nhi�m v�: Th�ng b�o cho H� H�u C�m",
        "Trong m�t h�m ghi {�� chuy�n ��n n�i an to�n! H� H�u C�m � D��ng Ch�u l� m�t trong 4 ng��i C�m, K�, Thi, H�a c�a Tr��ng Ca M�n, ph� tr�ch v�ng Giang Nam, ph�i tr� kh� nhanh!}. Ch��ng V� C��ng tr�nh.",
        "Nghe n�i Tr��ng Ca M�n c� t� th�i nh� T�ng do nhi�u m�n ph�i h�p l�i �� ch�ng ngo�i t�c x�m chi�m. Mau �em b�c th� ��n {D��ng Ch�u} giao cho {H� H�u C�m}."
    };
    local nStep;
    
    nStep = GetTask(TASK_THREE);
    if (nStep == 0) then
        Msg2Player("�em m�t h�m giao cho H� H�u C�m");
        TaskTip("�em m�t h�m giao cho H� H�u C�m");
        SetTask(TASK_THREE, 1);
        TalkEx("", szMsg);
    elseif nStep == 1 then
        Msg2Player("�em m�t h�m giao cho H� H�u C�m");
        TaskTip("�em m�t h�m giao cho H� H�u C�m");
    end;

end;