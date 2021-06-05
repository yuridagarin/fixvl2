GAMESVRGLB_SYSTEM		= 151	-- GameServerȫ�ֱ�����ϵͳ
GAMESVRGLB_MULTIPLE		= 152	-- GameServerȫ�ֱ���������

SYS_BATTLE				= 1		-- ս����ս��
SYS_COC			 	 	= 2		-- �̻�Ľ���
SYS_MASTER_RANDOMTASK	= 3		-- ʦ�����������
SYS_MASTER_REPEATTASK	= 4		-- ʦ���ظ�������
SYS_KILLER_TASK			= 5		-- ɱ��������
SYS_DRAGONBOAT			= 6		-- ���ۻ��ֽ���

MIN_MULTIPLE			= 1		-- ������Сֵ
MAX_MULTIPLE			= 3		-- �������ֵ

-- ����������ϵͳ
map_sysnames = {
	"Chi�n tr��ng",
	"Th��ng h�i",
	"Nhi�m v� s� m�n - ng�u nhi�n",
	"Nhi�m v� s� m�n tu�n ho�n",
	"Nhi�m v� s�t th�",
	"Thuy�n r�ng"
}

-- ��ȡ�����ı���
function get_reward_multiple(system)
	local multiple_sys = GetGlbValue(GAMESVRGLB_SYSTEM) -- ����������ϵͳ
	local multiple_val = 1
	if (multiple_sys ~= 0 and multiple_sys == system) then
		multiple_val = GetGlbValue(GAMESVRGLB_MULTIPLE) / 100
		if (multiple_val == 0) then
			multiple_val = 1
		end
	end
	if (multiple_val < MIN_MULTIPLE) then
		multiple_val = MIN_MULTIPLE
	end
	if (multiple_val > MAX_MULTIPLE) then
		multiple_val = MAX_MULTIPLE
	end
	return multiple_val
end

-- ��������
function multiple_reward(system, reward)
	local multiple = get_reward_multiple(system)
	if (multiple == 1) then
		return reward
	else
		return reward * multiple
	end
end
