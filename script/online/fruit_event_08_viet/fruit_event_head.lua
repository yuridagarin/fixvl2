--File name:	fruit_event_head.lua
--Describe:		ˮ�����head�ļ�
--Create Date:	2008-06-23
--Author:		chenbenqian

SWITCH_08_FRUIT_VIET	= 1;

DATE_08_FRUIT_VIET_START	= 2008070400;		-- ˮ�������ʼ����
DATE_08_FRUIT_VIET_END		= 2008072800;		-- ˮ�������������

--ˮ��������ŷ���1���رշ���0
function is_fruit_event_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_08_FRUIT_VIET_START and nDate < DATE_08_FRUIT_VIET_END then
		return SWITCH_08_FRUIT_VIET;
	else
		return 0;
	end
end

