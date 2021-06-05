Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\settings\\static_script\\meridian\\vet_jihuo_wuzun.lua")

--ͨ��þ�
function tthj_daily_task()
	local nTaskID = gf_GetTaskBit(VET_TTD_WJZ_TASK_FLAG,1);
	if nTaskID == 0 then
		--������
		if DirectGetGTask(83,2) == 1 then
			SetTask(VET_TDD_DALIY_TASK_CROSS,0);
			gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,1,1,4);
		end
	else
		--���ܽ�����
		local nRet = DirectFinishGTask(83,2)
		if nRet == 2 then
			Msg2Player("Nhi�m v� ch�a ho�n th�nh");
		elseif nRet == -3 then
			Msg2Player("C�c h� �� l�m nhi�m v� n�y r�i")
		end		
	end
end

function tthj_week_task()
	local nTaskID = gf_GetTaskBit(VET_TTD_WJZ_TASK_FLAG,2);
	if nTaskID == 0 then
		--������
		if DirectGetGTask(84,2) == 1 then
			SetTask(VET_TDD_WEEK_TASK_CROSS,0);
			gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,2,1,4);
		end
	else
		--���ܽ�����
		local nRet = DirectFinishGTask(84,2)
		if nRet == 2 then
			Msg2Player("Nhi�m v� ch�a ho�n th�nh");
		elseif nRet == -3 then
			Msg2Player("C�c h� �� l�m nhi�m v� n�y r�i")
		end		
	end
end

--��ڣ
function wjz_daily_task()
	local nTaskID = gf_GetTaskBit(VET_TTD_WJZ_TASK_FLAG,3);
	if nTaskID == 0 then
		--������
		if DirectGetGTask(85,2) == 1 then
			SetTask(VET_WJZ_DALIY_TASK_CROSS,0);
			gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,3,1,4);
		end
	else
		--���ܽ�����
		local nRet = DirectFinishGTask(85,2)
		if nRet == 2 then
			Msg2Player("Nhi�m v� ch�a ho�n th�nh");
		elseif nRet == -3 then
			Msg2Player("C�c h� �� l�m nhi�m v� n�y r�i")
		else
			vaf_award_api("tWjzDailyTask") --2XU�
			_vjw_SetWjz();
			Observer:onEvent(SYSEVENT_WANJIANZHONG_TASK_AWARD, 1)
		end		
	end
end

function wjz_week_task()
	local nTaskID = gf_GetTaskBit(VET_TTD_WJZ_TASK_FLAG,4);
	if nTaskID == 0 then
		--������
		if DirectGetGTask(86,2) == 1 then
			SetTask(VET_WJZ_WEEK_TASK_CROSS,0);
			gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,4,1,4);
		end
	else
		--���ܽ�����
		local nRet = DirectFinishGTask(86,2)
		if nRet == 2 then
			Msg2Player("Nhi�m v� ch�a ho�n th�nh");
		elseif nRet == -3 then
			Msg2Player("C�c h� �� l�m nhi�m v� n�y r�i")
		else
			vaf_award_api("tWjzDailyTask") --2XU�
			_vjw_SetWjz();
			Observer:onEvent(SYSEVENT_WANJIANZHONG_TASK_AWARD, 3)
		end	
	end
end

--����
function fanpai_daily_task()
	local nTaskID = gf_GetTaskBit(VET_TTD_WJZ_TASK_FLAG,5);
	if nTaskID == 0 then
		--������
		if DirectGetGTask(87,2) == 1 then
			SetTask(VET_DALIY_TASK_FANPAI,0);
			gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,5,1,4);
		end
	else
		--���ܽ�����
		local nRet = DirectFinishGTask(87,2)
		if nRet == 2 then
			Msg2Player("Nhi�m v� ch�a ho�n th�nh");
		elseif nRet == -3 then
			Msg2Player("C�c h� �� l�m nhi�m v� n�y r�i")
		else
			vaf_award_api("tWjzDailyTask") --2XU�
			_vjw_SetWjz();
			Observer:onEvent(SYSEVENT_WANJIANZHONG_TASK_AWARD, 2)
		end		
	end
end

function fanpai_week_task()
	local nTaskID = gf_GetTaskBit(VET_TTD_WJZ_TASK_FLAG,6);
	if nTaskID == 0 then
		--������
		if DirectGetGTask(88,2) == 1 then
			SetTask(VET_WEEK_TASK_FANPAI,0);
			gf_SetTaskBit(VET_TTD_WJZ_TASK_FLAG,6,1,4);
		end
	else
		--���ܽ�����
		local nRet = DirectFinishGTask(88,2)
		if nRet == 2 then
			Msg2Player("Nhi�m v� ch�a ho�n th�nh");
		elseif nRet == -3 then
			Msg2Player("C�c h� �� l�m nhi�m v� n�y r�i")
		else
			vaf_award_api("tWjzDailyTask") --2XU�
			_vjw_SetWjz();
			Observer:onEvent(SYSEVENT_WANJIANZHONG_TASK_AWARD, 4)
		end	
	end
end

function is_get_task(nSerial)
	if nSerial < 1 or nSerial > 6 then return 0 ; end
	return gf_GetTaskBit(VET_TTD_WJZ_TASK_FLAG,nSerial);
end

function is_finish_task(nSerial)
	if nSerial < 1 or nSerial > 6 then return 0 ; end
	if nSerial == 1 then
		if GetTask(VET_TDD_DALIY_TASK_CROSS) == 1 then
			return 1;
		else
			return 0;
		end
	end
	if nSerial == 2 then
		if GetTask(VET_TDD_WEEK_TASK_CROSS) == 4 then
			return 1;
		else
			return 0;
		end
	end
	if nSerial == 3 then
		if GetTask(VET_WJZ_DALIY_TASK_CROSS) == 1 then
			return 1;
		else
			return 0;
		end
	end
	if nSerial == 4 then
		if GetTask(VET_WJZ_WEEK_TASK_CROSS) == 7 then
			return 1;
		else
			return 0;
		end
	end
	if nSerial == 5 then
		if GetTask(VET_DALIY_TASK_FANPAI) == 1 then
			return 1;
		else
			return 0;
		end
	end
	if nSerial == 6 then
		if GetTask(VET_WEEK_TASK_FANPAI) == 15 then
			return 1;
		else
			return 0;
		end
	end
end

function is_close_task(nSerial)
	if nSerial < 1 or nSerial > 6 then return 0 ; end
	if nSerial == 1 then
		if tGtTask:check_cur_task(83) == 1 then
			return 0;
		else
			return is_finish_task(nSerial);
		end
	end
	if nSerial == 2 then
		if tGtTask:check_cur_task(84) == 1 then
			return 0;
		else
			return is_finish_task(nSerial);
		end
	end
	if nSerial == 3 then
		if tGtTask:check_cur_task(85) == 1 then
			return 0;
		else
			return is_finish_task(nSerial);
		end
	end
	if nSerial == 4 then
		if tGtTask:check_cur_task(86) == 1 then
			return 0;
		else
			return is_finish_task(nSerial);
		end
	end
	if nSerial == 5 then
		if tGtTask:check_cur_task(87) == 1 then
			return 0;
		else
			return is_finish_task(nSerial);
		end
	end
	if nSerial == 6 then
		if tGtTask:check_cur_task(88) == 1 then
			return 0;
		else
			return is_finish_task(nSerial);
		end
	end
end


function return_status(nSerial)
	local strTab = {"C� th� ti�p nh�n","C� th� giao","Ch�a ho�n th�nh","Ng�y mai h�y ��n"};
	local nNum1,nNum2,nNum3;
	if nSerial < 1 or nSerial > 6 then 
		return ""; 
	end
	--δ��
	if is_get_task(nSerial)	== 0 then
			return strTab[1];
	--�ѽ�
	else
		--�����
		if is_close_task(nSerial) == 1 then
			return strTab[4];
		else
			--�ɽ�
			if is_finish_task(nSerial) == 1 then
				return strTab[2];
			else
				return strTab[3];
			end
		end		
	end
end