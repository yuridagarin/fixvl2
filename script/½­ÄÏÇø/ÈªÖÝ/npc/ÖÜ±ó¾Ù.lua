--  �ļ�˵��
--  ��ӦNPC���ƣ��ܱ��
--  created by lizhi
--  2005-8-4 15:14

Include("\\script\\task\\world\\lizhi_Ȫ��\\14��\\task_main.lua");

function main()
    
    local nLevel = 0;
    local nStep = 0;
    local szTalk = {
        "Chu B�n C�: Giai kh�ng tr� l�p, t�c �i�u quy phi c�p. H� x� th� quy tr�nh? Tr��ng ��nh li�n �o�n ��nh."
    };

    nStep = GetTask(TASK_LEV_14_ID);
    if (nStep == 1) then
        task_001_02();
    elseif (nStep == 2) then
        task_002_01();
    elseif (nStep == 3) then
        task_003_01();
    else
        TalkEx("", szTalk);
    end;

end;