Include("\\script\\ks2vng\\global\\playerlogout.lua")
-- ���ʱִ�еĽű�
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\online\\tong_feast\\tf_head.lua")
Include("\\settings\\static_script\\global\\tonginfo_task.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

-- ���¼������������\script\global\offlinelive_action.lua�ж��壡��
TASKVAL_BAIJU_LASTACTIVE_TIME = 2292		-- ��¼���һ�λ�ð׾Ծ����ʱ��
TASKVAL_LIUSHEN_LASTACTIVE_TIME = 2293		-- ��¼���һ�λ���������ʱ��
TASKVAL_SANQING_LASTACTIVE_TIME = 2294		-- ��¼���һ�λ�����徭���ʱ��

function main()
	viet_playerlogout_main()

	if IsOfflineLive() == 0 then	-- �������ߣ��������һ�λ�ð׾ԣ����壬�����ʱ��
		local TimeNow = GetTime()
		SetTask(TASKVAL_BAIJU_LASTACTIVE_TIME, TimeNow)
		SetTask(TASKVAL_LIUSHEN_LASTACTIVE_TIME, TimeNow)
		SetTask(TASKVAL_SANQING_LASTACTIVE_TIME, TimeNow)
	end
	
	exgsvr_func_on_player_logout()
	
	--�������
	tf_PlayerLogout();
	
	--���°����Ϣ�����������
	_UpdateTongInfoToTask()
	Observer:onEvent(SYSEVENT_PLAYER_LOGOUT, 0)
end
