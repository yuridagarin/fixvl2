--  �ļ�˵��
--  ��ӦNPC���ƣ�������
--  created by lizhi
--  2005-8-4 15:14

Include("\\script\\task\\world\\lizhi_Ȫ��\\14��\\task_main.lua");

function main()
    
    local nLevel = 0;
    local nStep = 0;
    local szTalk = {
        "Ha ha! N�a ��i sau c�a ta kh�ng c�n s�ng l� thu�c v�o ng��i kh�c!"
    };

    nStep = GetTask(TASK_LEV_14_ID);

    if (nStep == 3) then
        task_003_02();
    elseif (nStep == 4) then
        task_004_01();
    else
        TalkEx("", szTalk);
    end;

end;
