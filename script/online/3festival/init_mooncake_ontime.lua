--File name:init_mooncake_ontime.lua 
--Describe:������������ʼ���±�����
--Create Date:2006-9-11
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")

function main()
	if Get_3festival_State() == 1 then
		SetMapTaskTemp(100,3,MAX_MOONCAKE_COUNT);
		SetMapTaskTemp(200,3,MAX_MOONCAKE_COUNT);
		SetMapTaskTemp(300,3,MAX_MOONCAKE_COUNT);
		Msg2SubWorld("Ni�n s� �ang ph�t mi�n ph� b�nh Trung Thu � Tuy�n Ch�u, Th�nh ��, Bi�n Kinh, s� l��ng c� h�n, m�i ng��i h�y nhanh ch�n ��n l�y!");
		AddGlobalNews("Ni�n s� �ang ph�t mi�n ph� b�nh Trung Thu � Tuy�n Ch�u, Th�nh ��, Bi�n Kinh, s� l��ng c� h�n, m�i ng��i h�y nhanh ch�n ��n l�y!");
	end;
end;