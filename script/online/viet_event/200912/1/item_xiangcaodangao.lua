--=============================================
--create by baiyun 2009.11.18
--describe:Խ�ϰ�12�·ݻ ��ݵ���ű��ļ�
--=============================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20091218 or nDate > 20100124 then
		Say("V�t ph�m h�t h�n s� d�ng!",0)
		return 0;
	end
	if gf_Judge_Room_Weight(2, 50, " ") == 0 then
		return 0;
	end
	local nHasCount = GetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT);
	if nHasCount >= VIET_0912_XIANGCAODANGAO_MAX_COUNT then
		Say("B�n �� s� d�ng v�t ph�m ��t s� kinh nghi�m t�i �a!",0)
		return 0;
	end    
	if DelItemByIndex(nItemIdx, 1) == 1 then
		SetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT, nHasCount + 1);
		--����Ʒ����
		local szFullLogTitle = VIET_0912_STR_EVENT_LOG_TITLE
		if mod(GetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT),50) == 0 then
			gf_EventGiveRandAward(VIET_0912_XIANGCAODANGAO_AWARD_50, 100, 1, szFullLogTitle, "B�nh Kem Vani");
		else
			gf_EventGiveRandAward(VIET_0912_XIANGCAODANGAO_AWARD, 100, 7, szFullLogTitle, "B�nh Kem Vani");
		end
		--������        
		ModifyExp(150000);		  
	end
end
