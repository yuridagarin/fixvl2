
Include("\\script\\task\\faction\\faction_main_tm.lua"); -- ����ʦ������Ľű�ͷ�ļ�


function main()

local nTaskValue = FN_GetTaskState(FN_TM)

	if (nTaskValue==4) then
		task_008();
		return
	elseif (nTaskValue==5) then
		Say("Ng��i kh�ng mau �i ��o c�n � ��y ��i g� n�a?",0);
		return
	elseif (nTaskValue==6) then
		task_010();
		return
	elseif (nTaskValue==7) then
		Say("���c r�i! Xem nh� ng��i �� qua �i c�a ta, mau ��n g�p L�o l�o!",0);	
		return
	else
	
		local i=random(1,3)
		if i == 1 then
			Say("C� ���ng V�n ta � ��y, k� kh�c mu�n x�m ph�m ���ng M�n c�n kh� h�n l�n tr�i.",0)
		elseif	i == 2 then
			Say("�m kh� ph�ng v� H�a kh� ph�ng c� �� k� nhau l�m ta c�m th�y kh� x�.",0)
		else
			Say("Thi�n H�i g�n ��y h�i kh�c l�, e r�ng �� c� chuy�n x�y ra.",0)
		end
		
	end
end;

