--file name:item_star.lua
--author:yanjun
--create date:2007-9-25
--describe:07����СѾ���ĺ�������Ը��
MAP_ID = 117;

function OnUse()
	local nMapID = GetWorldPos()
	if nMapID ~= MAP_ID then
		Talk(1,"","��ֻ�������ĺ��ǲ��ܵ�����Ը�ǣ�");
		return 0;
	end;
	AskClientForString("create_star","",1,14,"���������ǵ����֣�");
end;

function create_star(sName)
	local nMapID = GetWorldPos();
	if nMapID ~= MAP_ID then
		Talk(1,"","��ֻ�������ĺ��ǲ��ܵ�����Ը�ǣ�");
		return 0;
	end;
	if DelItem(2,1,1171,1) == 1 then
		local nNpcIndex = CreateNpc("͸����",sName,GetWorldPos());
		Msg2Player("ף�������Ը�ܹ�ʵ�֣�");
		SetNpcLifeTime(nNpcIndex,1*60*60);
		SetCurrentNpcSFX(nNpcIndex,935,1,1);
	end;
end;