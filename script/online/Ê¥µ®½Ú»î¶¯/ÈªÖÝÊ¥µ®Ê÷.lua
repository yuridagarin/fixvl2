--=============================================
--create by yanjun 2005.12.12
--describe:Ȫ��ʥ����(ְ��NPC)�ű�
--=============================================
Include("\\script\\online\\ʥ���ڻ\\christmas_head.lua")

function main()
	if GetTrigger(3000) == 0 then
		if GetCurMonth() == 12 and GetCurDate() > 28 then
			Say("Ho�t ��ng Gi�ng Sinh �� k�t th�c!",0)
			return 0
		end
		Say("Ho�t ��ng Gi�ng Sinh v�n ch�a m�. Th�i gian ch�nh th�c l�: <color=yellow>t� 23/11 ��n 28/12<color>.",0)
		return 0
	end
	SelTab = {
		"Ta mu�n nh�n qu�./get_present",
		"Ta ch� ��n xem th�i./no",
		}
	Say("Gi�ng Sinh vui v�! Tr��c khi nh�n qu� h�y ki�m tra kho�ng tr�ng trong h�nh trang, �� tr�nh nh�ng t�n th�t kh�ng ��ng c�!",2,SelTab);
end

function get_present()
	if CHRISTMAS_SWITCH == 0 then
		Say("C�y th�ng v�n ch�a treo qu�, ho�t ��ng Gi�ng Sinh v�n ch�a b�t ��u!",0)
		return 0;
	end
	if GetLevel() < 10 then
		Say("Xin l�i! Qu� kh�ch ch�a ��t ��n c�p <color=red>10<color> ch�a th� nh�n qu�.",0)
		return 0
	end
	if GetTask(TASK_GOT_DATE) ~= GetCurDate() then	--�������ͬһ�죬������ȡ�����0
		SetTask(TASK_GOT_PRESENT,0)
	end
	if(GetTask(TASK_GOT_PRESENT) == 0) then --֮ǰû�����
		local nHour,nMin = GetLocalTime()
		if (nHour == 21 and nMin >= 2) or (GetLocalTime() == 23) then --���Ͼŵ��ʮһ��
			give_present()
		else
			Say("H�y ��i ��n <color=yellow>21h v� 23h<color> m�i c� th� nh�n qu�",0)
		end
	else
		Say("H�m nay b�n �� nh�n ���c qu�, kh�ng th� nh�n n�a.",0)
	end
end

function no()

end

function give_present()
	local nPresentRemain = GetGlbValue(ID_PRESENT_NUMBER_QZ)
	local nEmpty = 0
	if(nPresentRemain > 0) then
		local nTemp = random(1,100)
		local nRetCode = 0
		local nBody = GetBody()
		if nTemp <= 10 then
			nRetCode = AddItem(2,2,8,5,1)	--����5��
		elseif nTemp > 10 and nTemp <= 20 then
			nRetCode = AddItem(2,2,7,10,1)--������Ƭ10��
		elseif nTemp > 20 and nTemp <= 30 then
			nRetCode = AddItem(2,1,148,5,1)	--С���Ϭ5��
		elseif nTemp > 30 and nTemp <= 40 then
			nRetCode = AddItem(2,1,209,1,1)	--ʥ�����1��
		elseif nTemp > 40 and nTemp <= 50 then
			nRetCode = AddItem(2,1,208,25,1)	--ʥ������25��
		elseif nTemp > 50 and nTemp <= 60 then
			nRetCode = AddItem(2,1,210,1,1)	--"�ؿ�һ 1��"
		elseif nTemp > 60 and nTemp <= 70 then
			nRetCode = AddItem(2,1,211,1,1)	--"�ؿ��� 1��"
		elseif nTemp > 70 and nTemp <= 75 then
			if nBody == 1 then
				nRetCode = AddItem(0,108,109,1,1)	--"ʥ��ñ��1��"
			elseif nBody == 2 then
				nRetCode = AddItem(0,108,110,1,1)
			elseif nBody == 3 then
				nRetCode = AddItem(0,108,112,1,1)
			elseif nBody == 4 then
				nRetCode = AddItem(0,108,111,1,1)
			end
		elseif nTemp > 75 and nTemp <= 80 then
			if nBody == 1 then
				nRetCode = AddItem(0,109,109,1,1)	--"ʥ����װ1��"
			elseif nBody == 2 then
				nRetCode = AddItem(0,109,110,1,1)
			elseif nBody == 3 then
				nRetCode = AddItem(0,109,112,1,1)
			elseif nBody == 4 then
				nRetCode = AddItem(0,109,111,1,1)
			end
		elseif nTemp > 80 and nTemp <= 90 then
			if nBody == 1 then
				nRetCode = AddItem(0,110,73,1,1)	--"ʥ����װ1��"
			elseif nBody == 2 then
				nRetCode = AddItem(0,110,74,1,1)
			elseif nBody == 3 then
				nRetCode = AddItem(0,110,76,1,1)
			elseif nBody == 4 then
				nRetCode = AddItem(0,110,75,1,1)
			end
		elseif nTemp > 90 and nTemp <= 100 then --5��������
			for i=1,5 do			
				local nIndex = random(189,194)
				nRetCode = AddItem(2,1,nIndex,1,1)
				if nRetCode == 0 then
					break
				end
			end
		end		
		if nRetCode == 0 then	--û�гɹ����
			--Say("������Ŀռ䲻����������һ�±�������Ķ���������ȡ��",0)
			Say("Nh�n v�t ph�m th�t b�i!",0)
			return 0
		else
			Say("B�n �� nh�n ���c 1 ph�n qu�! Th�t may m�n!",0)
			SetGlbValue(ID_PRESENT_NUMBER_QZ,nPresentRemain-1)
			SetTask(TASK_GOT_PRESENT,1) 
			SetTask(TASK_GOT_DATE,GetCurDate())
			if GetGlbValue(ID_PRESENT_NUMBER_QZ) == 0 then
				nEmpty = 1;
			end
		end
	else
		Say("Xin l�i, qu� �� b� l�y h�t, l�n sau h�y quay l�i!",0)
	end
	if nEmpty == 1 then
		AddGlobalNews("Qu� c�y th�ng Gi�ng Sinh � B�c Tuy�n Ch�u �� b� l�y h�t, ng��i ch�i n�o ch�a l�y ���c h�y ��n l�n sau.")
		Msg2SubWorld("Qu� c�y th�ng Gi�ng Sinh � B�c Tuy�n Ch�u �� b� l�y h�t, ng��i ch�i n�o ch�a l�y ���c h�y ��n l�n sau.")
	end
end




