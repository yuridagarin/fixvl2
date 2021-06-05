--=============================================
--create by baiyun 2009.8.27
--describe:Խ�ϰ�9�·������߾������ű�
--=============================================
Include("\\script\\online\\viet_event\\200909\\2\\mission_functions.lua");
--pk״̬���ձ�
t_pk_states = {
	[0] = {0, 0, "Tr�ng th�i luy�n c�ng"},
	[1] = {1, 0, "D�ng chi�n ��u 1"},
	[2] = {1, 1, "D�ng chi�n ��u 2"},
	[3] = {1, 2, "D�ng chi�n ��u 3"},
	[4] = {2, 0, "�� s�t"},
};

function main()
	local nNpcIndex = GetTargetNpc()
	local nAwardFlag = GetUnitCurStates(nNpcIndex, 4);--�Ƿ��Ѿ��е�һ����ҵ����ý���
	local nActiveFlag = GetUnitCurStates(nNpcIndex, 5);
	
	local nState1 = get_flag_bit(nActiveFlag, 1);--��������״̬��ҵ�����жϼ�¼
	local nState2 = get_flag_bit(nActiveFlag, 2);
	local nState3 = get_flag_bit(nActiveFlag, 3);
	local nState4 = get_flag_bit(nActiveFlag, 4);
	local nPkFlag1, nPkFlag2 = GetPKFlag();	--ȡ������ֵ��ʾ��PK״̬
	local nPkFlag = get_pk_flag(nPkFlag1, nPkFlag2);
	
	
	if nActiveFlag == 1111 then
		Talk(1, "", "Nghe ��n <color=yellow>Ho�ng Kim L�nh B�i<color> c�a <color=green>Ho�ng Kim Th��ng Nh�n<color> - Bi�n Kinh (171/178) c� th� gi�p nh�n s� v� l�m c�p t�c th�ng ��n c�p 73, ��t 3000 �i�m danh v�ng. Ngo�i ra, tr�n con h�nh tr�nh b�n t�u, nh�n s� c�n ���c h� tr� th�m nhi�u lo�i trang b�, v� kh� c�p cao khi s� h�u ���c Ho�ng Kim L�nh B�i n�y. Chi ti�t xin tham kh�o th�m t�i trang ch� <color=red>http://volam2.zing.vn<color>");
		if nAwardFlag == 0 then
--			ModifyExp(500000);
--			Talk(1, "", "Thu ���c ph�n th��ng may m�n 500000 kinh nghi�m");
--			Msg2Player("Thu ���c ph�n th��ng may m�n 500000 kinh nghi�m");
			AddUnitStates(nNpcIndex, 4, 1);
		end
		return 0;
	end
	
	if active_denglong(nNpcIndex, nPkFlag) == 0 then
		return 0;
	end
	
end

function get_pk_flag(nPkFlag1, nPkFlag2)
	for i = 0, getn(t_pk_states) do
		if t_pk_states[i][1] == nPkFlag1 and t_pk_states[i][2] == nPkFlag2 then
			return i;
		end
	end
	return 0;
end

function active_denglong(nNpcIndex, nPkFlag)
	local nMapId = SubWorldIdx2ID(SubWorld);
	local nActiveFlag = GetUnitCurStates(nNpcIndex, 5);
	local nResult = 1;
	local szMsg;
	if nPkFlag == 0 then
		Talk(1, "", "D�ng PK c�a ��i hi�p l� <color=red>"..t_pk_states[nPkFlag][3].."<color> kh�ng th� k�ch ho�t L� N��ng");
		return 0;
	else
		if get_flag_bit(nActiveFlag, nPkFlag) == 0 then
			AddUnitStates(nNpcIndex, 5, set_flag_bit(nActiveFlag, nPkFlag, 1) - nActiveFlag);
		end
		local szPkMsg = "<enter>";
		
		for i = 1, 4 do
			if get_flag_bit(GetUnitCurStates(nNpcIndex, 5), i) == 0 then
				szPkMsg = szPkMsg ..t_pk_states[i][3].."<enter>";
				nResult = 0;
			end
		end
		
		szMsg = "D�ng PK c�a ��i hi�p l� <color=red>"..t_pk_states[nPkFlag][3].."<color>, hi�n t�i c�n k�ch ho�t L� N��ng c�n:"..szPkMsg.."Ng��i ch�i c� d�ng PK m�i c� th� k�ch ho�t L� N��ng";
	end
	if GetUnitCurStates(nNpcIndex, 5) ~= 1111 then
		Talk(1, "", szMsg);
	else
		local nTimeStart = GetUnitCurStates(nNpcIndex, 6);
		local nMissionTime = 55 - floor((GetTime() - nTimeStart) / 60);--����missionӦ�ÿ���������ʱ��
		if nMissionTime >= 5 then--���ʱ��С��5���ӣ��򲻿���mission�ˣ���Ϊˢ����������Ҫ5���ӵ�ʱ��
			local nMapId, nMapX, nMapY = GetNpcWorldPos(nNpcIndex);

			SetGlbValue(1014, nNpcIndex);
			SetGlbValue(1015, nMapId);
			SetGlbValue(1016, nMapX);
			SetGlbValue(1017, nMapY);
			SetGlbValue(1018, nMissionTime);
			
			OpenMission(MISSION_ID, nMapId);
			Talk(1, "", "L� N��ng �� k�ch ho�t th�nh c�ng! Xin h�y ��i th� ng�c b�o � xu�t hi�n!");
		end
	end
	return nResult;
end

function get_flag_bit(nFlag, nBit)--ȡ�õ�1��2��3��4����һλ
	if nBit == 1 then
		return mod(nFlag, 10);
	elseif nBit == 2 then
		return floor(mod(nFlag, 100) / 10);
	elseif nBit == 3 then
		return floor(mod(nFlag, 1000) / 100);
	else
		return floor(nFlag / 1000);
	end
end

function set_flag_bit(nFlag, nBit, nValue)--���õ�1,2,3,4����һλ
	if nBit == 1 then
		return nFlag - get_flag_bit(nFlag, nBit) + nValue;
	elseif nBit == 2 then
		return nFlag - get_flag_bit(nFlag, nBit) * 10 + nValue * 10;
	elseif nBit == 3 then
		return nFlag - get_flag_bit(nFlag, nBit) * 100 + nValue * 100;
	else
		return nFlag - get_flag_bit(nFlag, nBit) * 1000 + nValue * 1000;
	end
end