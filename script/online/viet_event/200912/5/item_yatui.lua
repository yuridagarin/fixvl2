--=============================================
--create by baiyun 2009.11.22
--describe:Խ�ϰ�12�·�ʥ���ڻѼ�Ƚű�
--=============================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua")
Include("\\script\\voz\\xacthuc\\xacthuc.lua");
function OnUse(nItemIdx)
	--do return end
	--local nDate = tonumber(date("%y%m%d"));
	--if nDate > 091025 then
	--	Talk(1, "", "��Ʒ�Ѿ����ڣ����ܴ򿪡�");
	--	return 0;
	--end
	if CheckXacThuc() == 0 then
		Say("T�i kho�n ch�a x�c th�c. Xin th� ch� h�y d�ng tay.", 0)
		return
	end
	if gf_Judge_Room_Weight(2, 50, " ") ~= 1 then 
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
            --����Ʒ����
            local szFullLogTitle = VIET_0912_STR_EVENT_LOG_TITLE
            gf_EventGiveRandAward(VIET_0912_YUTUXIAO_AWARD, 100000, 13, szFullLogTitle,"��i v�t");
	end
end
