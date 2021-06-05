--by liubo
--��ʦ�ڻ

Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua") 

VET_201111_TEACHER_DAY = TaskManager:Create(3,3)
VET_201111_TEACHER_DAY.LoginInTime = 1 --��¼��ʱ��  
VET_201111_TEACHER_DAY.Times = 2 --��ȡ��Ƭ�Ĵ��� 
VET_201111_TEACHER_DAY.DaySeq = 3 --���
VET_201111_TEACHER_DAY.TriggerIndex = 4 --���������� 
VET_201111_TEACHER_DAY.SpaceTime = 5 --�ۼ�����ʱ�� 

VET_201111_MaxUsedCount = 10 --���ʹ�ô��� -- 
VET_201111_LimitTime = 60*60 --��ȡʱ��  --

--��¼������
VET_201111_TEACHER_DAY_TBID = 3004 --����ID 
VET_201111_TEACHER_DAY_UFID = 2557 --�Զ���ID -
--ʱ�䴥���� -- 
VET_201111_TEACHER_DAY_TBID1 = 1515 
VET_201111_TEACHER_DAY_UFID1 = 2550

VET_201111_TEACHER_DAY_STRING = {
	[1] = "Th�i gian online c�a c�c h� l� <color=green>%d<color>gi�<color=green>%d<color> ph�t<color=green>%d<color> gi�y.",
	[2] = "Th�i gian online c�a c�c h� l�<color=green>%d<color> gi�<color=green>%d<color> ph�t<color=green>%d<color> gi�y. \nTh�i gian online c� th� s� d�ng c�n l�i<color=green>%d<color> gi�<color=green>%d<color> ph�t<color=green>%d<color> gi�y.",
	[3] = "Nh�n v�t ��t c�p<color=green>79<color> tr� l�n, �� gia nh�p m�n ph�i v� h�c ���c k� n�ng c�p 55 m�i c� th� tham gia event.",
	[4] = "M�i ng�y m�i ng��i ch�i gi�i h�n nh�n ���c M�nh Gh�p l� <color=green>10<color> m�nh.",
	[5] = "Th�i gian nh�n m�nh gh�p v�n ch�a ��n.",
	[6] = "H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng ho�c s�c l�c kh�ng ��, xin h�y s�p x�p l�i h�nh trang!",
	[7] = "[Event]: evnet nh� gi�o th�ng 11 n�m 2011 s� m�nh gh�p ng�u nhi�n d� th��ng.",
	[8] = "S� l��ng m�nh �T�n� kh�ng ��",
	[9] = "S� l��ng m�nh �S�� kh�ng ��",
	[10] = "S� l��ng m�nh �Tr�ng� kh�ng ��",
	[11] = "S� l��ng m�nh ���o� kh�ng ��",
	[12] = "[Event]: B�o R��ng Tri �n gia t�ng th�t b�i",
}

--11�½�ʦ�ڻ����ʦ�ص� -- 
function check_onlinetime()
	local nTime = GetTime()
	--���ۼƿ�������ʱ��
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.LoginInTime,nTime)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.DaySeq,zgc_pub_day_turn())
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,0)
	end	
	local nLoginTime = VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.LoginInTime)
	local nOnlineTime = VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.SpaceTime)
	local nUseTime = VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times) * VET_201111_LimitTime
	local hour1,minute1,second1 = format_time(nTime - nLoginTime + nOnlineTime)
	local hour2,minute2,second2 = format_time(nTime - nLoginTime + nOnlineTime - nUseTime)
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55MaxSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"",format(VET_201111_TEACHER_DAY_STRING[1],hour1,minute1,second1))
	else
		Talk(1,"",format(VET_201111_TEACHER_DAY_STRING[2],hour1,minute1,second1,hour2,minute2,second2))
	end
end

function exchang_chip()
	local nTime = GetTime()
	--��������
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55MaxSkill() == 0  or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[3])
		return 0
	end
	--��ȡ��������
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.LoginInTime,nTime)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.DaySeq,zgc_pub_day_turn())
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,0)
	end
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times) >= VET_201111_MaxUsedCount then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[4])
		return 0
	end
	--ʱ���Ƿ�����
	if nTime - VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.LoginInTime) + VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.SpaceTime) - VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times) * VET_201111_LimitTime < VET_201111_LimitTime then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[5])
		return 0
	end
	--�����ռ�
	if gf_Judge_Room_Weight(1,1,"") == 0 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[6])
		return 0
	end
	--��ȡ������1
	VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times)+1)
	--�������Ƭ
	local num = random(400)
	if mod(num,4) == 1 then
		--gf_AddItemEx({2,1,30335,1},"T�n",1)
		gf_AddItemEx2({2,1,30335,1},"T�n", "Ton Su Trong Dao", "nhan Ton")
	elseif mod(num,4) == 2 then
		--gf_AddItemEx({2,1,30336,1},"S�",1)
		gf_AddItemEx2({2,1,30336,1},"S�", "Ton Su Trong Dao", "nhan Su")
	elseif mod(num,4) == 3 then
		--gf_AddItemEx({2,1,30337,1},"Tr�ng",1)
		gf_AddItemEx2({2,1,30337,1},"Tr�ng", "Ton Su Trong Dao", "nhan Trong")
	elseif mod(num,4) == 0 then
		--gf_AddItemEx({2,1,30338,1},"��o",1)
		gf_AddItemEx2({2,1,30338,1},"��o", "Ton Su Trong Dao", "nhan Dao")
	else
		WriteLog(VET_201111_TEACHER_DAY_STRING[7])
	end
end

function exchang_zhienbaoxiang()
	--��������
	local nLevel = GetLevel()
	if nLevel < 79 or gf_Check55MaxSkill() == 0  or GetPlayerFaction() == 0 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[3])
		return 0
	end
	if BigGetItemCount(2,1,30335) < 1 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[8])
		return 0
	end
	if BigGetItemCount(2,1,30336) < 1 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[9])
		return 0
	end
	if BigGetItemCount(2,1,30337) < 1 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[10])
		return 0
	end
	if BigGetItemCount(2,1,30338) < 1 then
		Talk(1,"",VET_201111_TEACHER_DAY_STRING[11])
		return 0
	end
	BigDelItem(2,1,30335,1)
	BigDelItem(2,1,30336,1)
	BigDelItem(2,1,30337,1)
	BigDelItem(2,1,30338,1)
	local res,index = gf_AddItemEx2({2,1,30339,1},"B�o R��ng Tri �n", "Ton Su Trong Dao", "nhan Bao Ruong") --gf_AddItemEx({2,1,30339,1},"B�o R��ng Tri �n",1)
	if res == 0 then
	--	print("writelog")
		WriteLog(VET_201111_TEACHER_DAY_STRING[12])
	end
end

function format_time(nSecond)
	if nSecond < 0 then
		return 0,0,0
	end
	local hour,minute,second
	hour = floor(nSecond / 3600)
	minute = floor((nSecond - hour*3600)/ 60)
	second = nSecond - minute*60 - hour*3600
	return hour,minute,second
end

--��������
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end

--�ǳ�
function Leave_Game()
	local nTime = GetTime()
	VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.SpaceTime)+(nTime-VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.LoginInTime)))
	local nIndex1 = VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.TriggerIndex)
	if nIndex1 ~= 0 then
		RemoveTrigger(nIndex1)
	end
	local nIndex2 = GetTrigger(VET_201111_TEACHER_DAY_UFID1)
	if nIndex2 ~= 0 then
		RemoveTrigger(nIndex2)
	end
end

function OnTimer()
	do return end
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		local nTime = GetTime()
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.SpaceTime)+(nTime-VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.LoginInTime)))
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.LoginInTime,nTime)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.DaySeq,zgc_pub_day_turn())
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,0)
	end
end