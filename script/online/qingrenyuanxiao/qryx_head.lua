QRYX_SWITCH = 1	--���˽ڣ�Ԫ���ڻ���ء�1Ϊ����0Ϊ��
--ȫ�ֱ�������

--ȫ�ֳ���
DEBUG = 0 	--������Ϣ������ء�1Ϊ����0Ϊ��
ROSELIFE = 60*60	--õ�廨�����������һ��Сʱ
--�������
TASK_YUANFEN = 1860	--������¼��ҵ�Ե��ָ��
TASK_GOTUSE_CHOCOLATE = 1861	--������¼��ҵ����Ƿ��ѻ�ú���ʹ���ɿ�������1�ֽڱ�ʾ�Ƿ��ù�����2�ֽڱ�ʾ�Ƿ�ʹ�ù���
TASK_ROSE_LIFE 	 = 1862	--������¼õ�廨��������
TASK_ROSE_GROW 	 = 1863	--������¼õ�廨�ĳɳ���
TASK_ROSE_INDEX	 = 1864	--������¼������ֵ�õ�廨������
TASK_ROSE_TYPE 	 = 1865	--������¼������ֳ�����õ�廨�����͡�1Ϊ��õ�壬2Ϊ��õ�壬3Ϊ��õ��
TASK_TEAM_INDEX  = 1866	--������¼���������
TASK_LOVESTORY1  = 1867	--�����������һ����ɽ����ףӢ̨
TASK_LOVESTORY2  = 1868	--�������������������������
TASK_LOVESTORY3  = 1869	--������������������ɳ�����Сٻ
TASK_LOVESTORY4  = 1870	--������������ģ�����������
TASK_USE_YUPEI	 = 1871	--������¼���ʹ�������ʱ��
TASK_GOT_AWARD   = 1872	--������ʶ����ǲ�����ȡ������
TASK_USEYUANXIAO = 1873	--������ʶ��ҵ�����û�гԹ�Ԫ��
TASK_GOT_QRJ	 = 1874	--������ʶ�����û�еù����˽ᣨ����û�лش������⣩
--��ʱ�������

function Is_QRYX_Activity()	--�жϽ����Ƿ񿪷�
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20080213 and nDate <= 20080215 and QRYX_SWITCH == 1 then
		return 1
	else
		return 0
	end
end

--IsLucky�����������жϸ����Ƿ�����ġ���IsLucky(10,100)���ж�10/100�ĸ����Ƿ����
function IsLucky(numer,deno)	--numerator�����ӣ���denominator����ĸ��
	local nRandomNum = random(1,deno)
	if nRandomNum <= numer then
		return 1
	else
		return 0
	end
end

function IsLoversTeam()	--�жϵ�ǰ�ǲ���һ��һŮ���
	local OldPlayerIndex = PlayerIndex
	if GetTeamSize() == 2 then
		local Sex1,Sex2
		PlayerIndex = GetTeamMember(1)
		Sex1 = GetSex()
		PlayerIndex = GetTeamMember(2)
		Sex2 = GetSex()
		if Sex1 ~= Sex2 then
			PlayerIndex = OldPlayerIndex
			return 1
		else
			PlayerIndex = OldPlayerIndex
			return 0
		end
	else
		PlayerIndex = OldPlayerIndex
		return 0
	end
end

function GetLoversName()	--����ֵ����һ��������ҵ����֣��ڶ�����Ů��ҵ�����
	local OldPlayerIndex = PlayerIndex
	if IsLoversTeam() == 1 then
		PlayerIndex = GetTeamMember(1)
		if GetSex() == 1 then
			nameMale = GetName()
			PlayerIndex = GetTeamMember(2)
			nameFemale = GetName()
		else
			nameFemale = GetName()
			PlayerIndex = GetTeamMember(2)
			nameMale = GetName()
		end
		PlayerIndex = OldPlayerIndex
		return nameMale,nameFemale
	else
		PlayerIndex = OldPlayerIndex
		return 0,0
	end
end

function GetLoversIndex()	--����ֵ����һ��������ҵ��������ڶ�����Ů��ҵ����������������������򷵻أ�����
	if IsLoversTeam() == 1 then
		local OldPlayerIndex = PlayerIndex
		PlayerIndex = GetTeamMember(1)
		if GetSex() == 1 then
			PlayerIndex = OldPlayerIndex
			return GetTeamMember(1),GetTeamMember(2)
		else
			PlayerIndex = OldPlayerIndex
			return GetTeamMember(2),GetTeamMember(1)
		end
	else
		return 0,0
	end
end

function DebugOutput(message)	--����ʱ�����Ϣ�õ�
	if DEBUG == 1 then
		Msg2Player(message)
	end
end

function CreateTeamIndex(maleIdx,femaleIdx)	--��������һ����Ů��ӵĶ���������Ψһ��ʶһ������
	if IsLoversTeam() == 1 then
		return maleIdx * 10000 + femaleIdx
	else
		return 0
	end
end

function CanAcceptTask(TASKID,step)	--�ж��Ƿ���Խ�������
	local OldPlayerIndex = PlayerIndex
	if IsLoversTeam() == 1 then
		local OldPlayerIndex = PlayerIndex
		local teamIndex1,teamIndex2
		local Player1Step,Player2Step2
		local PlayerIndex1,PlayerIndex2 = GetLoversIndex()
		local PlayerLevel1,PlayerLevel2
		PlayerIndex = PlayerIndex1
		teamIndex1 = GetTask(TASK_TEAM_INDEX)
		Player1Step = GetTask(TASKID)
		Player1Level = GetLevel()
		PlayerIndex = PlayerIndex2
		teamIndex2 = GetTask(TASK_TEAM_INDEX)
		Player2Step = GetTask(TASKID)
		Player2Level = GetLevel()
		if Player1Level >= 10 and Player2Level >= 10 and teamIndex1 == teamIndex2 and Player1Step == Player2Step and Player1Step == step then
			PlayerIndex = OldPlayerIndex	
			return 1
		else
			PlayerIndex = OldPlayerIndex
			return 0
		end
	else
		PlayerIndex = OldPlayerIndex
		return 0
	end
end

function GetLoversDropRate()	--�õ����¶���ĵ�����ϵ�����緵��50��ʾ������ϵ��Ϊ0.5��
	local nFriendliness
	local DropRate,DropRate1,DropRate2
	local YFIndex1,YFIndex2
	local OldPlayerIndex = PlayerIndex
	if IsLoversTeam() == 1 then
		PlayerIndex = GetTeamMember(1)
		nFriendliness = GetMemberFriendliness(2)	
		--���¼����ɺøжȾ����ĵ�����
		if nFriendliness >= 2000 then	--����øжȴ���200
			DropRate1 = 100	--������Ϊ100��
		else
			DropRate1 = floor(nFriendliness*99/2000 + 1)	--0��99
		end
		--���¼�����Ե��ָ�������ĵ�����
		PlayerIndex = GetTeamMember(1)
		YFIndex1 = GetTask(TASK_YUANFEN)
		PlayerIndex = GetTeamMember(2)
		YFIndex2 = GetTask(TASK_YUANFEN)
		DropRate2 = floor(100 - abs(YFIndex1 - YFIndex2) * 1.5)
		--��������ȡ�����
		if DropRate1 >= DropRate2 then
			DropRate = DropRate1
		else
			DropRate = DropRate2
		end
		PlayerIndex = OldPlayerIndex
		return DropRate
	else 
		PlayerIndex = OldPlayerIndex
		return 0
	end
end

function AllTaskComplete()	--�����ж��Ƿ�ȫ���������ĸ���������
	if GetTask(TASK_LOVESTORY1) == 9 and GetTask(TASK_LOVESTORY2) == 9 and GetTask(TASK_LOVESTORY3) == 7 and GetTask(TASK_LOVESTORY4) == 9 then
		return 1
	else
		return 0
	end
end

function NoTaskBegin() --�����ж��Ƿ�û��ʼ�κ�һ������
	if GetTask(TASK_LOVESTORY1) == 1 and GetTask(TASK_LOVESTORY2) == 1 and GetTask(TASK_LOVESTORY3) == 1 and GetTask(TASK_LOVESTORY4) == 1 then
		return 1
	else
		return 0
	end
end

function qryx_give_a_chocolate()
	if Is_QRYX_Activity() ~= 1 then
		return
	end
	if GetSex() ~= 2 then
		return
	end
	if GetFreeItemRoom() < 2 then
		Msg2Player("H�nh trang ho�c s�c v�c n�ng kh�ng ��, chocola nh�n ���c l�n n�y m�t r�i. Xin h�y s�p x�p l�i nh�!");
		return
	end
	if AddItem(2,0,361,1) == 1 then
		Msg2Player("B�n nh�n ���c 1 th�i S�c�la")
		WriteLog("[Ho�t ��ng l� t�nh nh�n v� T�t Nguy�n Ti�u]"..GetName().."B�n �� l�m 10 l�n nhi�m v� Th��ng H�i xin nh�n l�y 1 thanh chocola.")
	end
end
