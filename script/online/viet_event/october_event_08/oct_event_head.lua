--File name:	oct_event_head.lua
--Describe:		ʮ�»head�ļ�
--Create Date:	2008-09-26
--Author:		chenbenqian

Include("\\script\\lib\\writelog.lua")

SWITCH_08_OCT_EVENT_VIET		= 1;				-- ʮ�»����

DATE_08_OCT_EVENT_VIET_START	= 2008101000;		-- ʮ�»��ʼ����
DATE_08_OCT_EVENT_VIET_END		= 2008102100;		-- ʮ�»��������

RELAY_DB_08_OCT_EVENT_VIET = "october_event_08_viet"		--�������ݿ��ַ�����ʶ

--ʮ�»���ŷ���1���رշ���0
function is_oct_event_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_08_OCT_EVENT_VIET_START and nDate < DATE_08_OCT_EVENT_VIET_END then
		return SWITCH_08_OCT_EVENT_VIET;
	else
		return 0;
	end
end
