--filename:�꾩ѩ�̴�����in.lua
--create date:2006-01-12
--author:yanjun
--describe:�꾩ѩ�̴����ˣ��������ű�
--modify:2007-01-04
--reason:ѩ�̸İ�
--mender:yanjun
Include("\\script\\online\\���ڻ\\snowwar\\snowwar_worker_npc.lua");
g_sNpcName = "Xa phu_n�m tuy�t";
g_CurMapID = 0;
function main()
	g_CurMapID = GetWorldPos();
	snowwar_enter_main();
end