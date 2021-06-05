--ʹ�û�ҩ֮��ִ�еĽű�
--created by lizhi
--2005-8-30 11:12

--��ɽ�ڸ�  1542 3049
--��ɽ�ڸ�  1354 2856
--����      1544 2686
--���      1544 2686

Include("\\script\\task\\world\\task_award.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function OnUse()
    local nMapId, nX, nY = GetWorldPos();
    local flagEast = 0;
    local flagWest = 0;
    local nDistEast = 0;
    local nDistWest = 0;

--�ջ��ڸڵ�����
    if GetTask(TASK_XY_ONE) == 2 then
    
        if GetTask(TASK_XY_ONE_ONE) ~= 1 then
            nDistEast = DistanceBetweenPoints(nMapId, nX, nY, 311, 1542, 3049);   --����ɽ�ڸ۵ľ���    
            if nDistEast >= 0 and nDistEast <= 10 then
                flagEast = 1;
            end;
        end;
        
        if GetTask(TASK_XY_ONE_TWO) ~= 1 then  
            nDistWest = DistanceBetweenPoints(nMapId, nX, nY, 311, 1354, 2856);   --����ɽ�ڸ۵ľ���
            if nDistWest >= 0 and nDistWest <= 10 then
                flagWest = 1;
            end;
        end;
        --Msg2Player(flagWest);
        if flagEast ~= 1 and flagWest ~= 1 then
            Talk(1,"","Thu�c n� n�y d�ng �� ��t {L�u canh} c�a Li�u qu�n � Ph�c Ng�u s�n.");
            return
        end;
        
        if flagEast == 1 then
            Death("L�u canh ��ng S�n");
            DelItem(2,0,70,1);
            SetTask(TASK_XY_ONE_ONE, 1);   --֤���ջٵ��Ƕ�ɽ
        else
            Death("L�u canh T�y S�n");
            DelItem(2,0,70,1);
            SetTask(TASK_XY_ONE_TWO, 1);   --�ջٵ�����ɽ
        end;
        
        if GetTask(TASK_XY_ONE_ONE) == 1 and GetTask(TASK_XY_ONE_TWO) == 1 then
            SetTask(TASK_XY_ONE, 3);
            Msg2Player("V� b�o cho T�ng binh T��ng D��ng");
            TaskTip("V� b�o cho T�ng binh T��ng D��ng");
            SetTask(TASK_XY_ONE_ONE, 0);
            SetTask(TASK_XY_ONE_TWO, 0);
        end;
    end;
    
--�ջ����ݺ���ص����� 
    if GetTask(TASK_XY_ONE) == 4 then
        nDistEast = DistanceBetweenPoints(nMapId, nX, nY, 311, 1544, 2686);   --�����ݺ���صľ���
        if nDistEast >= 0 and nDistEast <= 10 then
            Death("L��ng th�o");
            Death("Qu�n nhu");
            SetTask(TASK_XY_ONE, 5);
            AddItem(2,0,71,1);
            DelItem(2,0,70,1);
            if GetTask(TASK_XY_ONE) == 5 and GetTask(TASK_XY_TWO) == 5 then  --�������֧����������ˣ����������
                SetTask(TASK_XYTY, 56);
                Msg2Player("V� b�m b�o C�ng T�n Th�");
                TaskTip("V� b�m b�o C�ng T�n Th�");
            end;
        else
            Talk(1,"","Thu�c n� n�y d�ng �� ��t l��ng th�o v� qu�n nhu.");
        end;
    end;
end;