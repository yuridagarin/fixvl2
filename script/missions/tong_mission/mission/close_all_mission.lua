--create date:2007-08-06 15:30
--author:yanjun
--describe:systemtimetask.txt���ýű��������ر����еĹؿ�
Include("\\script\\missions\\tong_mission\\main_function.lua");
function main()
	local nWeekTime = tonumber(date("%w"));
	if nWeekTime == 0 then	--������
		TM_CloseAllField();
		Msg2SubWorld("V��t �i �ang � giai �o�n ��i m�i, t�t c� c�a �i s� ��ng. Xin m�i ng��i ch�i h�y ��i m�t ch�t r�i m�i ti�p t�c v��t �i.")
	end;
end;