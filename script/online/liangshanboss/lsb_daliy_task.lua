Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\lib\\globalfunctions.lua");

function task_1()
	local nFlag = gf_GetTaskByte(VET_LSB_MAIL_NUM,2);
	if nFlag == 0 then
		if DirectGetGTask(89,2) == 1 then
			SetTask(VET_LSB_GETBOX,0);
			gf_SetTaskByte(VET_LSB_MAIL_NUM,2,1);
		end
	else
		--不能接任务
		local nRet = DirectFinishGTask(89,2)
		if nRet == 2 then
			Msg2Player("Nhi謒 v? ch璦 ho祅 th祅h");
		elseif nRet == -3 then
			Msg2Player("C竎 h?  l祄 nhi謒 v? n祔 r錳")
		end	
	end
end

function task_2()
	local nFlag = gf_GetTaskByte(VET_LSB_MAIL_NUM,3);
	if nFlag == 0 then
		if DirectGetGTask(90,2) == 1 then
			SetTask(VET_LSB_CALLBOSS,0);
			gf_SetTaskByte(VET_LSB_MAIL_NUM,3,1);
		end
	else
		--不能接任务
		local nRet = DirectFinishGTask(90,2)
		if nRet == 2 then
			Msg2Player("Nhi謒 v? ch璦 ho祅 th祅h");
		elseif nRet == -3 then
			Msg2Player("C竎 h?  l祄 nhi謒 v? n祔 r錳")
		end	
	end
end

function task_3()
	local nFlag = gf_GetTaskByte(VET_LSB_MAIL_NUM,4);
	if nFlag == 0 then
		if DirectGetGTask(91,2) == 1 then
			SetTask(VET_LSB_OPENBOX,0);
			gf_SetTaskByte(VET_LSB_MAIL_NUM,4,1);
		end
	else
		--不能接任务
		local nRet = DirectFinishGTask(91,2)
		if nRet == 2 then
			Msg2Player("Nhi謒 v? ch璦 ho祅 th祅h");
		elseif nRet == -3 then
			Msg2Player("C竎 h?  l祄 nhi謒 v? n祔 r錳")
		end	
	end
end

function return_status(nTaskID)
	local strTab = {"C? th? ti誴 nh薾","C? th? giao","Ch璦 ho祅 th祅h","Ng祔 mai h穣 n"};
	local nSerial = nTaskID - 87;
	if gf_GetTaskByte(VET_LSB_MAIL_NUM,nSerial) == 0 then
		return strTab[1];
	else
		if nTaskID == 89 then
			if tGtTask:check_cur_task(89) == 1 then
				if GetTask(VET_LSB_GETBOX) == 1 then
					return strTab[2];
				else
					return strTab[3];
				end
			else
				return strTab[4];
			end
		end
		if nTaskID == 90 then
			if tGtTask:check_cur_task(90) == 1 then
				if GetTask(VET_LSB_CALLBOSS) == 5 then
					return strTab[2];
				else
					return strTab[3];
				end
			else
				return strTab[4];
			end
		end
		if nTaskID == 91 then
			if tGtTask:check_cur_task(91) == 1 then
				if GetTask(VET_LSB_OPENBOX) == 1 then
					return strTab[2];
				else
					return strTab[3];
				end
			else
				return strTab[4];
			end
		end
	end
end