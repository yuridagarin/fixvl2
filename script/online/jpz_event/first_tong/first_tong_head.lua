--File name:	first_tong_head.lua
--Describe:		��һ��head�ļ�
--Create Date:	2008-07-17
--Author:		chenbenqian

SWITCH_08_FIRSTTONG_JPZ	= 1;								--��һ������(1�Ǵ�0�ǹر�)

--ENTER_TIMES 	= 1											--�ܽ������
START_TIME 		= 17.5*3600									--��ɽ���ʼʱ��17:30
PREPARE_TIME 	= 1800										--��ɽ�׼��ʱ��30����(1800��)
OPENBOX_TIME	= 240										--ʰȡ���䶯��ʱ��4����(240��)

--MAX_TEAM_NUM 	= 200										--�ܽ������������

RELAY_DB_FIRSTTONG_JPZ 		= "first_tong_event_viet"		--�������ݿ��ַ�����ʶ
g_LogTitle 					= "[Ho�t ��ng bang h�i tinh anh] : "


--DATE_08_FIRSTTONG_JPZ_START	= 2008083000;					-- ��һ����ʼ����
--DATE_08_FIRSTTONG_JPZ_END	= 2018083000;					-- ��һ����������

--��һ�����ŷ���1���رշ���0
function is_first_tong_jpz_open()
	return SWITCH_08_FIRSTTONG_JPZ
end
