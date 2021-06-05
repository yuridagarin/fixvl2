--create date:2007-07-25 15:57
--author:yanjun
--describe:�ؿ���������
Include("\\script\\missions\\tong_mission\\main_function.lua");

function main()
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx <= 0 then
		return 0;
	end;
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"","Vi�n tr� ngo�i bang kh�ng th� nh�t b�o r��ng.");
		return 0;
	end;
	local nCurJob = IsTongMember();
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"","B�o r��ng ph�i ���c m� b�i Bang chu, Ph� bang ch�, Tr��ng l�o.");
		return 0;
	end;
	local nParam2 = GetUnitCurStates(nNpcIdx,2);	
	local nStage = GetUnitCurStates(nNpcIdx,1);	
	local nNeedRoom = 5;
	if nStage == MAX_STAGE then
		nNeedRoom = 7;	--��6����Ҫ7���ռ�
	end;
	if gf_JudgeRoomWeight(nNeedRoom,50,"") == 0 then
		return 0;
	end;
	if nParam2 ~= 1 then	--���δ��ʰȡ
		TM_SetUnitCurStates(nNpcIdx,2,1);	--�����ѱ�ʰȡ
		SetNpcLifeTime(nNpcIdx,0);
		AddItem(2,0,740+nStage-1,5);
		if nStage == MAX_STAGE then	--����ǵ�6�أ����ٸ�1��5�ص����Ӹ�1��
			for i=1,5 do
				AddItem(2,0,740+i-1,1);
			end;
			Msg2MSAll(MISSION_ID,GetName().."M� b�o r��ng c�a �i "..nStage..", thu ���c 7 b�o r��ng T� Quang C�c");
		else
			Msg2MSAll(MISSION_ID,GetName().."M� b�o r��ng c�a �i "..nStage..", thu ���c 2 b�o r��ng T� Quang C�c");
		end;
		SetMissionV(MV_GET_BOX,0);
		SendTongMessage(GetName().."Nh�t ���c r��ng c�a �i"..nStage..".	");
		WriteLog("[Bang h�i v��t �i]:"..GetName().."Nh�t ���c th�"..nStage..".	");
	end;
end;