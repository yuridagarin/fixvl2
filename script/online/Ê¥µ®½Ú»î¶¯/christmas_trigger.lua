function sdlw_killed()
	local nRetCode = 1
    local nTemp = random(1,1000)
    local nBody = GetBody()
    if nTemp <= 20 then	-- 1/50���ʵ�������
        nRetCode = AddItem(2,1,208,1,1);
    elseif nTemp == 21 then	-- 1/1000���ʵ���������
    	nRetCode = AddItem(2,1,209,1,1);
    elseif nTemp == 22 then	-- 1/1000���ʵ���ʥ��ñ	
		if nBody == 1 then
			nRetCode = AddItem(0,108,109,1,1)	
		elseif nBody == 2 then
			nRetCode = AddItem(0,108,110,1,1)
		elseif nBody == 3 then
			nRetCode = AddItem(0,108,112,1,1)
		elseif nBody == 4 then
			nRetCode = AddItem(0,108,111,1,1)
		end
    end;
    if nRetCode == 0 then 
    	Say("Th�m v�t ph�m th�t b�i!",0)
    end
end
