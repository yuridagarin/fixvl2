-- ʦͽ���������

Include("\\script\\global\\battlefield_callback.lua")

-- �������������	\script\master_prentice\some_op.lua �ж����
TASK_SEED = 1290
TASK_CONTENT = 1291

tTaskContent =
{
	[1] = 
	{
		"mp_do_shimen(2)",				-- ���2�γ���ʦ������
		"mp_do_shanghui(20)",			-- ���20���̻�����
	},

	[2] = 
	{
		"mp_do_shashou(5)",				-- ���5��ɱ������
		"mp_do_shanghui(20)",			-- ���20���̻�����
	},

	[3] = 
	{
		"mp_do_battle(1)",				-- ����1��ս��
		"mp_do_shanghui(20)",			-- ���20���̻�����
	},
	
	[4] =
	{
		"mp_do_cangjian(2)",			-- �ؽ���2��
		"mp_do_shanghui(20)",			-- ���20���̻�����
	},

	[5] =
	{
		"mp_do_taixu(4)",				-- ̫���4����
		"mp_do_shanghui(20)",			-- ���20���̻�����
	},

	[6] =
	{
		"mp_do_longzhou(4)",			-- ����4������
		"mp_do_shanghui(20)",			-- ���20���̻�����
	},

	[7] =
	{
		"mp_do_leitai(5)",				-- ������̨5��
		"mp_do_shanghui(20)",			-- ���20���̻�����
	},
}

tTaskCustomSave =
{
	"mp_shimen",
	"mp_shashou",
	"mp_battle",
	"mp_cangjian",
	"mp_taixu",
	"mp_longzhou",
	"mp_leitai",
	"mp_shanghui",
}

function _gettask(nRet, nParam1, nParam2)
	if nRet == 15 then
		Say("�� t� t�m th�i kh�ng ���c nh�n Nhi�m v� S� ��", 0)
		return
	elseif nRet == 23 then
		Say("Theo ��ng c�p th� nghi�p v� s� l��ng �� �� c�a s� ph�, hi�n ch� c� th� c�ng b� "..nParam2.." Nhi�m v� S� ��, nh�ng Nhi�m v� S� �� n�y hi�n �� ���c l�nh h�t", 0)
		return
	elseif nRet == 1 and nParam1 == 0 then
		Say("S� ph� hi�n v�n ch�a c�ng b� nhi�m v�", 0)
		return
	elseif nRet == 1 and GetTask(TASK_SEED) == nParam1 and CustomDataRead("mp_shanghui") == nil then
		Say("B�n �� ho�n th�nh Nhi�m v� S� ��", 0)
		return
	elseif nRet == 1 and GetTask(TASK_SEED) == nParam1 and CustomDataRead("mp_shanghui") ~= nil then
		Say("B�n �� nh�n Nhi�m v� S� �� n�y r�i", 0)
		return
	end
	
	SetTask(TASK_SEED, nParam1)
	SetTask(TASK_CONTENT, nParam2)
	Say("B�n �� ti�p nh�n Nhi�m v� S� ��", 0)
	
	for index, value in tTaskCustomSave do
		CustomDataRemove(value)
	end
	
	if tTaskContent[nParam2] ~= nil then
		dostring(tTaskContent[nParam2][1])
		dostring(tTaskContent[nParam2][2])
	else
		Msg2Player("Nhi�m v� n�y kh�ng t�n t�i, vui l�ng li�n h� v�i b� ph�n ph�c v� kh�ch h�ng!")
	end
	SaveNow()
end

function mp_do_shimen(nChance)
	CustomDataSave("mp_shimen", "dd", 0, nChance)
end

function mp_do_shashou(nChance)
	CustomDataSave("mp_shashou", "dd", 0, nChance)
end

function mp_do_battle(nChance)
	CustomDataSave("mp_battle", "d", nChance)
end

function mp_do_cangjian(nStep)
	CustomDataSave("mp_cangjian", "d", nStep)
end

function mp_do_taixu(nStep)
	CustomDataSave("mp_taixu", "d", nStep)
end

function mp_do_longzhou(nChance)
	CustomDataSave("mp_longzhou", "dd", 0, nChance)
end

function mp_do_leitai(nChance)
	CustomDataSave("mp_leitai", "dd", 0, nChance)
end

function mp_do_shanghui(nChance)
	CustomDataSave("mp_shanghui", "dd", 0, nChance)
end

function mp_give_award(nTaskIndex)
	local nLevel = GetLevel()
	local nMulti = 1
	if nLevel >= 80 then
		Msg2Player("B�n �� ��t c�p 80, kh�ng th� nh�n th�m ph�n th��ng c�a Nhi�m v� S� ��.")
		return
	elseif nLevel >= 73 then
		nMulti = 0.5
		Msg2Player("��ng c�p �� ��t c�p 73, ho�n th�nh nhi�m v� s� m�n ch� nh�n ���c m�t n�a ph�n th��ng.")
	end
	
	if nTaskIndex == 1 then				-- ͽ�ܽ�����ʦ�Ź��׶�
		if GetPlayerRoute() == 0 then
			local n = floor(50 * nMulti)
			ModifyReputation(n, 0)
			Msg2Player("B�n nh�n ���c ph�n th��ng Nhi�m v� S� ��:"..n.." �i�m danh v�ng")
		else
			local n = floor(15 * nMulti)
			SetTask(336, GetTask(336) + n)
			Msg2Player("B�n nh�n ���c ph�n th��ng Nhi�m v� S� ��:"..n.." �i�m c�ng hi�n S� M�n ")
		end
	elseif nTaskIndex == 2 then			-- ͽ�ܽ���������
		local n = floor(50 * nMulti)
		ModifyReputation(n, 0)
		Msg2Player("B�n nh�n ���c ph�n th��ng Nhi�m v� S� ��:"..n.." �i�m danh v�ng")
	elseif nTaskIndex == 3 then			-- ͽ�ܽ���������
		if GetPlayerRoute() == 0 then
			local nAddExp = floor(nLevel * nLevel * 110 * nMulti)
			ModifyExp(nAddExp)
			Msg2Player("B�n nh�n ���c ph�n th��ng Nhi�m v� S� ��:"..nAddExp.." �i�m kinh nghi�m")
		else
			SetRankPoint(5, 701, 1)	-- ˥��������SetRankPoint��ʱ��Ž���,����Ҫ��˥��,�ٿ�
			CalcBattleRank()
			local n = GetTask(701)
			local nn = floor(150 * nMulti)
			if n >= 0 then
				SetTask(701, n + nn)
			else
				SetTask(701, n - nn)
			end
			Msg2Player("B�n nh�n ���c ph�n th��ng Nhi�m v� S� ��:"..nn.." �i�m c�ng tr�ng")
		end
	elseif nTaskIndex == 4 then			-- ͽ�ܽ���������
		local nAddExp = floor(nLevel * nLevel * 110 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("B�n nh�n ���c ph�n th��ng Nhi�m v� S� ��:"..nAddExp.." �i�m kinh nghi�m")
	elseif nTaskIndex == 5 then			-- ͽ�ܽ���������
		local nAddExp = floor(nLevel * nLevel * 120 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("B�n nh�n ���c ph�n th��ng Nhi�m v� S� ��:"..nAddExp.." �i�m kinh nghi�m")
--	elseif nTaskIndex == 5 then			-- ͽ�ܽ�������������ת����
--		local nGolden = GetGoldenExp()
--		local nAddExp = nLevel * nLevel * 200
--		if nAddExp > nGolden then
--			nAddExp = nGolden
--		end
--		ModifyGoldenExp(-nAddExp)
--		ModifyExp(nAddExp)
--		Msg2Player("�������ʦͽ����������"..nAddExp.."�㽡������תΪ�˾���")
	elseif nTaskIndex == 6 then			-- ͽ�ܽ���������
		local nAddExp = floor(nLevel * nLevel * 110 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("B�n nh�n ���c ph�n th��ng Nhi�m v� S� ��:"..nAddExp.." �i�m kinh nghi�m")
	elseif nTaskIndex == 7 then			-- ͽ�ܽ���������
		local nAddExp = floor(nLevel * nLevel * 100 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("B�n nh�n ���c ph�n th��ng Nhi�m v� S� ��:"..nAddExp.." �i�m kinh nghi�m")
	end
	SaveNow()
end

function _complete_task(nRet)
	for index, value in tTaskCustomSave do
		CustomDataRemove(value)
	end
	
	if nRet ~= 0 then
		Msg2Player("B�n kh�ng ho�n th�nh Nhi�m v� S� �� theo th�i gian quy ��nh")
		return
	end
	
	local nParam = GetTask(TASK_CONTENT)
	local nTaskIndex = mod(nParam, 256)
	mp_give_award(nTaskIndex)
	SetTask(TASK_CONTENT, 0)
	SaveNow()
end