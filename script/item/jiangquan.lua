--��ȯ:ʹ���м��ʻ��100��500��1000��2000��5000��8000��1W��2W��5W��50W����ֵ��

function OnUse()

local nNum = random(1,286505);

	local bIsExist = 0;
	bIsExist = DelItem(2,0,225,1,1);
	if bIsExist ~= 1 then
		return
	end

	if nNum <= 5 then
		ModifyExp(500000);
		Talk(1,"","Ch�c m�ng b�n t�ng th�m <color=yellow>500000<color> �i�m kinh nghi�m!");
		Msg2Player("Ch�c m�ng b�n t�ng th�m 500000 �i�m kinh nghi�m!");
		--AddGlobalCountNews("��ϲ���"..GetName().."ͨ����ȡ��ȯ���500000����ֵ��",3);
	end;
	
	if nNum > 5 and nNum <= 505 then
		ModifyExp(50000);
		Talk(1,"","Ch�c m�ng b�n t�ng th�m <color=yellow>50000<color> �i�m kinh nghi�m!");
		Msg2Player("Ch�c m�ng b�n t�ng th�m 50000 �i�m kinh nghi�m!");	
	end;
	
	if nNum > 505 and nNum <= 2505 then
		ModifyExp(20000);
		Talk(1,"","Ch�c m�ng b�n t�ng th�m <color=yellow>20000<color> �i�m kinh nghi�m!");	
		Msg2Player("Ch�c m�ng b�n t�ng th�m 20000 �i�m kinh nghi�m!");
	end;
	
	if nNum > 2505 and nNum <= 8505 then
		ModifyExp(10000);
		Talk(1,"","Ch�c m�ng b�n t�ng th�m <color=yellow>10000<color> �i�m kinh nghi�m!");
		Msg2Player("Ch�c m�ng b�n t�ng th�m 10000 �i�m kinh nghi�m!");
	end;
	
	if nNum > 8505 and nNum <= 16505 then
		ModifyExp(8000);
		Talk(1,"","Ch�c m�ng b�n t�ng th�m <color=yellow>8000<color> �i�m kinh nghi�m!");
		Msg2Player("Ch�c m�ng b�n t�ng th�m 8000 �i�m kinh nghi�m!");
	end;
	
	if nNum > 16505 and nNum <= 26505 then
		ModifyExp(5000);
		Talk(1,"","Ch�c m�ng b�n t�ng th�m <color=yellow>5000<color> �i�m kinh nghi�m!");
		Msg2Player("Ch�c m�ng b�n t�ng th�m 5000 �i�m kinh nghi�m!");
	end;
	
	if nNum > 26505 and nNum <= 46505 then
		ModifyExp(2000);
		Talk(1,"","Ch�c m�ng b�n t�ng th�m <color=yellow>2000<color> �i�m kinh nghi�m!");
		Msg2Player("Ch�c m�ng b�n t�ng th�m 2000 �i�m kinh nghi�m!");
	end;
	
	if nNum > 46505 and nNum <= 96505 then
		ModifyExp(1000);
		Talk(1,"","Ch�c m�ng b�n t�ng th�m <color=yellow>1000<color> �i�m kinh nghi�m!");
		Msg2Player("Ch�c m�ng b�n t�ng th�m 1000 �i�m kinh nghi�m!");
	end;
	
	if nNum > 96505 and nNum <= 186505 then
		ModifyExp(500);
		Talk(1,"","Ch�c m�ng b�n t�ng th�m <color=yellow>500<color> �i�m kinh nghi�m!");
		Msg2Player("Ch�c m�ng b�n t�ng th�m 500 �i�m kinh nghi�m!");
		--AddGlobalCountNews("��ϲ���"..GetName().."ͨ����ȡ��ȯ���500����ֵ��",3);
	end;
	
	if nNum > 186505 then
		ModifyExp(100);
		Talk(1,"","Ch�c m�ng b�n t�ng th�m <color=yellow>100<color> �i�m kinh nghi�m!");
		Msg2Player("Ch�c m�ng b�n t�ng th�m 100 �i�m kinh nghi�m!");
		--AddGlobalCountNews("��ϲ���"..GetName().."ͨ����ȡ��ȯ���100����ֵ��",3);
	end;

end;
