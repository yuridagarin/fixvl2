-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ͨ������ͨ����Ϣ�����ļ�                  
-- Edited by starry night                                 
-- 2005/11/28 PM 15:17                                    
                                                          
-- ======================================================

--����ͨ������ͷ�ļ�
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local nWeekDay = GetWeekDay();
	local nHour,nMin = GetLocalTime();
	
		if nWeekDay == 1 or nWeekDay == 2 or nWeekDay == 3 or nWeekDay == 4 then
			if nHour == 20  then
				AddLocalNews("G�n ��y s� ng��i ph�m t�i t�ng nhi�u, B� ��u c�c th�nh th� �� ph�t danh s�ch truy n�, b�n h�y ��n Nha m�n gi�p h� ph� �n!");
				Msg2SubWorld("G�n ��y s� ng��i ph�m t�i t�ng nhi�u, B� ��u c�c th�nh th� �� ph�t danh s�ch truy n�, b�n h�y ��n Nha m�n gi�p h� ph� �n!");
				
			elseif nHour == 22 then
				AddLocalNews("B� ��u c�c th�nh th� �� ph�t danh s�ch truy n�, b�n h�y ��n Nha m�n gi�p h� ph� �n!");
				Msg2SubWorld("B� ��u c�c th�nh th� �� ph�t danh s�ch truy n�, b�n h�y ��n Nha m�n gi�p h� ph� �n!");
				
			elseif nHour == 0 then
				AddLocalNews("Danh s�ch truy n� h�m nay �� ph�t xong, mong c�c v� ��i hi�p gi�p b�t ch�ng v� quy �n. Nha m�n s� ph�t c�ng c�o c�m t� c�c v�!");
				Msg2SubWorld("Danh s�ch truy n� h�m nay �� ph�t xong, mong c�c v� ��i hi�p gi�p b�t ch�ng v� quy �n. Nha m�n s� ph�t c�ng c�o c�m t� c�c v�!");
				
			else
				AddLocalNews("V�o l�c 20 h v� 22 h, c�c B� ��u c�a Nha m�n � c�c th�nh th� ra th�ng b�o danh s�ch truy b�t t�i ph�m. Mong c�c hi�p kh�ch ra tay tr� gi�p!");
				Msg2SubWorld("V�o l�c 20 h v� 22 h, c�c B� ��u c�a Nha m�n � c�c th�nh th� ra th�ng b�o danh s�ch truy b�t t�i ph�m. Mong c�c hi�p kh�ch ra tay tr� gi�p!"); 
			end;
		end;
end;
