--=============================================
--create by baiyun 2009.5.29
--describe:Խ�ϰ�7�·ݻ֮�����������Ӱ��ű�
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--���л�����Ӱ�������ͳһͷ�ļ�
Include("\\script\\online_activites\\award.lua");
Include("\\script\\online\\viet_event\\award\\award_head.lua");
Include("\\script\\function\\vip_card\\vc_head.lua")

function OnUse(nItemIdx)
	--local nMainType = GetItemGenre(item)--������
	--local nSecondType = GetItemDetail(item)--������
	--local nDetailType = GetItemParticular(item)--��ϸ����
	local nExpire = GetItemExpireTime(tonumber(nItemIdx));
	if gf_Judge_Room_Weight(7, 10, " ") == 0 then           --by��xiongyizhi 2010��ʥ�������»������ڣ�����һ���ռ��ж�
		return
	end
	local seedtab = {2, 1, 30086, 6};
	--if DelItem(nMainType, nSecondType, nDetailType, 1) == 1 then
	if DelItemByIndex(nItemIdx, 1) == 1 then
		Give_seedbag_Award()           --by��xiongyizhi 2010��ʥ�������»�������
		for i  = 1, 6 do
			local nIsSuccess, nItem=  AddItem(2, 1, 30086, 1);
			if nExpire > 0 then
				SetItemExpireTime(nItem, nExpire);
			end
		end
		-- Bang h�i tinh anh 6 , ngu�n ra hoa h�ng
		local nDate = tonumber(date("%y%m%d"))
        	if nDate >= 110930 and nDate <= 111023 then
        		gf_AddItemEx2({2, 0, 1164, 20, 1}, "Hoa H�ng Ph�n", "Bang Hoi Tinh Anh 6", "m� T�i H�t Gi�ng")
        	end
        	VietSeedBagAwards()
		--gf_AddItemEx(seedtab, "H�t gi�ng");
		--����vip��
		_vc_OpenSeedBag();
	end
end