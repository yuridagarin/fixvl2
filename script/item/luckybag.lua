-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������ļ�
-- Edited by Starry
-- 2005/11/09 PM 13:43

-- ŵ���������Ҳ����ˣ��Բ����ţ����˲����ң�

-- ======================================================
function OnUse()
	
	Say("Tr��c khi m� qu�, vui l�ng x�c nh�n �� kho�ng tr�ng v� s�c l�c c�a h�nh trang, tr�nh r�i r�t v�t ph�m ra ngo�i!",
			2,
			"��ng �/ConfirmUse",
			"L�t sau s� m�/CancelUse");
	
end;

function ConfirmUse()

	local bIsExist = 0;
	bIsExist = DelItem(2,0,349,1,1);
	if bIsExist ~= 1 then
		return
	end

local nBodyType = GetBody()
local i = 0;
local j = 107+random(1,3);
local k = 188+random(1,6);
local n = 22+random(1,6);

		--��������װ	
		if nBodyType == 1 then
			i=random(1,18);
			AddItem(0,j,i,1,1);
		end;

		--��������װ	
		if nBodyType == 2 then
			i=random(19,36);
			AddItem(0,j,i,1,1);
		end;

		--����Ů��װ	
		if nBodyType == 3 then
			i=random(37,54);
			AddItem(0,j,i,1,1);
		end;		

		--�ɰ�Ů��װ	
		if nBodyType == 4 then
			i=random(55,72);
			AddItem(0,j,i,1,1);
		end;
		
		--��������
		if random(1,10000) <= 10 then
			AddItem(0,107,60,1,1);
		end;
		
		--1С���Ϭ
		if random(1,100) <= 50 then
			AddItem(2,1,148,1,1);
		end;
		
		--1��30������
		if random(1,100) <= 50 then
			AddItem(0,105,1,1,1,-1,-1,-1,-1,-1,-1);
		end;  
		
		--1���̻�
		if random(1,100) <= 50 then
			AddItem(2,1,k,1,1);
		end;    
		
		--1����ת���굤
		if random(1,100) <= 50 then
			AddItem(1,0,32,1,1);
		end;   
				
		AddItem(0,200,n,1,1);	 --1���ƽ𹤾�		
		AddItem(2,0,109,1,1);  --1������¶
		AddItem(2,0,225,1,1);  --1��ȯ
		AddItem(2,2,8,1,1);    --1����
		
end;

--�պ�����ʲô������
function CancelUse()

end;	