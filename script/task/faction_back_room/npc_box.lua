--create date:2007-12-21 16:49
--author:yanjun
--describe:�ؿ���������
Include("\\script\\task\\faction_back_room\\back_room_function.lua");

function main()
	if GetTask(TSK_WC_FAIL_TIMES) >= MAX_FAILURE_TIMES then
		Talk(1,"","S� l�n xo� d� li�u trong tu�n �� l�n h�n ho�c b�ng <color=yellow>"..MAX_FAILURE_TIMES.."<color>, kh�ng th� nh�n b�o r��ng.");
		return 0;
	end;
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx <= 0 then
		return 0;
	end;
	if gf_JudgeRoomWeight(1,20,"") == 0 then
		return 0;
	end;
	local nDiff = GetUnitCurStates(nNpcIdx,1);	--�����Ӧ�Ĺؿ�	
	local nStage = GetUnitCurStates(nNpcIdx,2);	--�����Ӧ�Ĺؿ�
	local nParam3 = GetUnitCurStates(nNpcIdx,3);
	if nParam3 ~= 1 then	--���δ��ʰȡ
		gf_SetUnitCurState(nNpcIdx,3,1);	--�����ѱ�ʰȡ
		local nCurDiff = BR_GetCurDiff();	--�����Ӧ�Ĺؿ�����һ�ء���Ϊ��������󣬵�ǰ�ؿ����ᱻ��Ϊ��һ��
		local nCurStage = BR_GetCurStage();	--�����Ӧ�Ĺؿ�����һ��
		BR_SaveRecord(nCurDiff,nCurStage);	--ʰȡ����󱣴����Ϊ��һ��
		SetNpcLifeTime(nNpcIdx,0);
		BR_GetBoxAward(nDiff,nStage);
	end;
end;