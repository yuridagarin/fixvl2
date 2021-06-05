--File name:	jixiang_head.lua
--Describe:		����С���head�ļ�
--Create Date:	2008-06-24
--Author:		chenbenqian

SWITCH_08_JIXIANG_VIET	= 1;

DATE_08_JIXIANG_VIET_START	= 2008080100;		-- ����С�����ʼ����
DATE_08_JIXIANG_VIET_END	= 2008081100;		-- ����С�����������

--����С������ŷ���1���رշ���0
function is_jixiang_event_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_08_JIXIANG_VIET_START and nDate < DATE_08_JIXIANG_VIET_END then
		return SWITCH_08_JIXIANG_VIET;
	else
		return 0;
	end
end
