--File name:laojiu_item.lua
--Describe:����Ʒ���߽ű�
--Create Date:2006-3-24
--Author:yanjun
Include("\\script\\online\\qingming\\qingming_head.lua");

function OnUse()
	local MapID,MapX,MapY = GetWorldPos();
	if MapID ~= 818 and MapID ~= 819 and MapID ~= 820 then	--ȷ���������ŵ�ͼ��
		Talk(1,"","V�t ph�m n�y ch� s� d�ng khi c�ng t� ti�n.");
		return FALSE;
	end;
	local selTab = {
				"���c! Ta mu�n s� d�ng./use",
				"Th�i �� sau n�y h�y d�ng./nothing",
				};
	Say("Ng��i c� ��ng � d�ng r��u ngon �� b�i t� kh�ng?",2,selTab);
end;

function use()
	local nDay = tonumber(date("%d"));
	if Get_Task_Byte(JIBAI_ITEM,3) ~= nDay then
		Set_Task_Byte(JIBAI_ITEM,3,0);
	end;
	if Get_Task_Byte(JIBAI_ITEM,3) == 0 then
		if DelItem(2,0,389,1) == 1 then
			Set_Task_Byte(JIBAI_ITEM,3,nDay);
			local nTotalLuck = Get_Task_Byte(JIBAI_ITEM,4);
			Set_Task_Byte(JIBAI_ITEM,4,nTotalLuck+5);
			if Get_Task_Byte(JIBAI_ITEM,4) > 10 then
				Set_Task_Byte(JIBAI_ITEM,4,10);
			end;			
			Msg2Player("Ng��i b�i t� b�ng r��u ngon c� th� th�y h�m nay ng��i r�t th�nh t�m");
			Write_Log("S� d�ng v�t ph�m","�� d�ng r��u ngon b�i t�.  ");
		end;
	else
		Talk(1,"","Ng��i h�m nay �� b�i t� b�ng r��u ngon, kh�ng th� s� d�ng v�t ph�m n�y n�a");
	end;
end;

function nothing()

end;