--=======================================================
--create by baiyun 2009.5.30
--describe:Խ�ϰ�7�·ݻ֮һ׷Ѱ�����գ���Ͳ�ű�
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx, 1) == 1 then
		DoFireworks(871, 1);
	end
end;