--ʥ�𴫵ݻ��ʼ��
--by vivi
--2008/06/10

Include("\\script\\online\\aoyun08\\aoyun_head.lua")

if GetGlbValue(GLB_AOYUN_TIME_STATE) == 1 then
	local nNpcNum = GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM); --�ڼ���̨��ȼ
	local nNpcIdx = GetGlbValue(GLB_AOYUN_NPC_YI+nNpcNum);
	local nNpcName = GetNpcName(nNpcIdx);
	if nNpcNum == 0 then
		SetGlbValue(GLB_AOYUN_HUOJUTAI_NUM,nNpcNum+1);
		if nNpcName == tHuojuName[1][1] then
			SetCurrentNpcSFX(nNpcIdx,910,2,1);--��ȼ
			Msg2Global(tHuojuName[1][1].."�� th�p.");
		end
	elseif nNpcNum < 30 then
		SetGlbValue(GLB_AOYUN_HUOJUTAI_NUM,nNpcNum+1);
		if nNpcName == tHuojuName[nNpcNum][2] then
			SetCurrentNpcSFX(nNpcIdx,909,2,1);--��ȼ
			Msg2Global(tHuojuName[nNpcNum][2].."�� th�p.");	
		end		
	elseif nNpcNum == 30 then
		SetGlbValue(GLB_AOYUN_HUOJUTAI_NUM,nNpcNum+1);
		if nNpcName == tHuojuName[nNpcNum][2] then
			SetCurrentNpcSFX(nNpcIdx,913,2,1);--��ȼ
			Msg2Global(tHuojuName[nNpcNum][2].."�� th�p.");
		end			
	end
end