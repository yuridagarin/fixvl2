--File name:mooncake_notice_ontime.lua 
--Describe:������������ʼ���±�������ǰ����
--Create Date:2006-9-11
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
function main()
	if Get_3festival_State() == 1 then
		Msg2SubWorld("Ni�n s� s� ph�t b�nh Trung Thu sau 30 ph�t n�a, m�i ng��i h�y chu�n b�!");
		AddGlobalNews("Ni�n s� s� ph�t b�nh Trung Thu sau 30 ph�t n�a, m�i ng��i h�y chu�n b�!");		
	end;
end;