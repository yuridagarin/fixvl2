--File name:boss_notice_ontime.lua 
--Describe:��������������BOSS��ǰ����
--Create Date:2006-9-11
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
function main()
	if Get_3festival_State() == 1 then
		Msg2SubWorld("M�i t�n giang h� �c nh�n s� xu�t hi�n sau 30 ph�t, m�i ng��i h�y chu�n b�!");
		AddGlobalNews("M�i t�n giang h� �c nh�n s� xu�t hi�n sau 30 ph�t, m�i ng��i h�y chu�n b�!");		
	end;
end;