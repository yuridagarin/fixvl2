JIXIANG_COUNTER = 0
RUYI_COUNTER = 0

function OnUse()
	local selTab = {
		"���c! Ta mu�n m� ti�u h�ng bao./open",
		"T�m th�i ta ch�a mu�n m�./nothing"
		}
	Say("Tr��c khi m� ti�u h�ng bao, h�y xem h�nh trang c� �� � tr�ng v� s�c l�c hay kh�ng, nh�m tr�nh nh�ng t�n th�t kh�ng ��ng. B�n c� ��ng � m� n� kh�ng?",2,selTab)
end

function open()
	if DelItem(2,1,213,1) == 1 then
		WriteLog("[Ho�t ��ng m�a xu�n (ti�u h�ng bao)]:"..GetName().." �� s� d�ng 1 ti�u h�ng bao.")
		local nRandomNum = random(1,100)
		if nRandomNum <= 50 then
		AddItem(1,0,32,1)	--��ת���굤1��
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 30 then
			AddItem(2,2,8,1)	--����1��
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 10 then
			AddItem(2,1,148,5)	--С���Ϭ5��
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 5 then
			AddItem(2,1,149,5)	--��Ϭ5��
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			AddItem(2,2,21,10)	--�ڽ�һ��10��
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			AddItem(2,2,22,10)	--֯��һ��10��
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 30 then
			AddItem(2,2,23,10)	--��佽�һ��10��
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			AddItem(2,2,27,10)	--������һ��10��
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 50 then
			AddItem(2,2,57,10)	--������һ��10��
		end
		nRandomNum = random(1,100)
		if nRandomNum <= 30 then
			AddItem(2,2,58,10)	--�����һ��10��
		end
		nRandomNum = random(1,200)
		if nRandomNum == 1 then
			if JIXIANG_COUNTER <= 90 then
				AddItem(0,102,22,1,1,-1,-1,-1,-1,-1,-1)	--����װ��
				WriteLog("[Ho�t ��ng m�a xu�n (��i h�ng bao)]:"..GetName().."B�n nh�n ���c 1 c�t t��ng bao.")
				JIXIANG_COUNTER = JIXIANG_COUNTER + 1
			end
		elseif nRandomNum == 2 then
			if RUYI_COUNTER <= 90 then
				AddItem(0,102,23,1,1,-1,-1,-1,-1,-1,-1)	--����װ��
				WriteLog("[Ho�t ��ng m�a xu�n (��i h�ng bao)]:"..GetName().."B�n nh�n ���c 1 nh� � bao.")
				RUYI_COUNTER = RUYI_COUNTER + 1
			end
		end
		
		nRandomNum = random(1,100)
		if nRandomNum <= 10 then	--��Ӧ��������װ
			if GetBody() == 1 then
				AddItem(0,109,113,1)
			elseif GetBody() == 2 then
				AddItem(0,109,114,1)
			elseif GetBody() == 3 then
				AddItem(0,109,116,1)
			elseif GetBody() == 4 then
				AddItem(0,109,115,1)
			end
		elseif nRandomNum <= 30 then
			local CardNo = random(228,237)
			AddItem(2,1,CardNo,1)	--����ؿ�
		elseif nRandomNum <= 50 then
			local NianGaoNo = random(266,269)
			AddItem(2,1,NianGaoNo,1)	--���
		end	
	end
end

function nothing()

end


