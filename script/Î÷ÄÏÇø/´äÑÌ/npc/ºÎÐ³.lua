--�ű����ܣ���������NPC��Ӧ�ű�
--���ܿ������峤
--����ʱ�䣺2011-4-2
--�޸ļ�¼��
Include("\\script\\faction\\npc\\buy_sell_main.lua")
function main()
	local sDiaHead,tDiaSel = faction_buysell_main(10)
	Say(sDiaHead,getn(tDiaSel),tDiaSel)
end