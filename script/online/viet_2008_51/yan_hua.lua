-- Խ��2008 51�
-- �̻�

Include("\\script\\online\\viet_2008_51\\viet_51_function.lua");
Include("\\script\\item\\yanhuo.lua");

TASK_ID_VIET_2008_51_LAST_USE_DATE = 2420;			--�ϴ�ʹ������
TASK_ID_VIET_2008_51_TODAY_USED_TIMES = 2421;		--����ʹ�ô���

function OnUse(nItemIdx)
	if is_viet_51_opened() ~= 1 then
		Say("Ho�t ��ng l�n n�y �� k�t th�c!.", 0);
		return
	end
	
	if GetLevel() < 20 then
		Say("Ch�a �� c�p 20, h�y c� g�ng th�m.!", 0);
		return
	end
	
	local nDate = tonumber(date("%Y%m%d"));
	local nLastUseDate = GetTask(TASK_ID_VIET_2008_51_LAST_USE_DATE);
	if nLastUseDate < nDate then
		SetTask(TASK_ID_VIET_2008_51_TODAY_USED_TIMES, 0);
		SetTask(TASK_ID_VIET_2008_51_LAST_USE_DATE, nDate);
	end
	local nTodayUsedTimes = GetTask(TASK_ID_VIET_2008_51_TODAY_USED_TIMES);
	if nTodayUsedTimes >= 8 then
		Say("M�i ng�y ch� c� th� s� d�ng t�i �a 8 ph�o hoa..", 0);
		return
	end
	
	if DelItemByIndex(nItemIdx, 1) ~= 1 then
		return
	end
	
	local nCount = getn(YANHUO_TABLE);
	local nIndex = random(1, nCount);
	local nRetCode = DoFireworks(YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3]);

	SetTask( TASK_ID_VIET_2008_51_TODAY_USED_TIMES, nTodayUsedTimes + 1);
	gf_SetLogCaption("viet_20080501_yanhua");
	gf_Modify( "Exp", 100000 );
	gf_SetLogCaption("");
end

