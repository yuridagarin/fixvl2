--�������ӽű�
--by vivi
--07/26/2007

Include("\\script\\online\\qixi07\\qixi07_head.lua")
	
function OnUse()
	Say("<color=green>H�t th�n b�<color>: B�n mu�n tr�ng h�t th�n b� n�y kh�ng? N�u kh�ng mu�n, c� th� tr�c ti�p ��a cho B�ch Hoa s� gi�, nh�n ph�n th��ng cu�i c�ng, nh�ng ph�n th��ng s� r�t th�p.",
		2,
		"���c/confirm_grow",
		"Kh�ng c�n/nothing"
		);		
end

function confirm_grow()
	if DelItem(2,0,1154,1) == 1 then      --����
		local add_flog = AddItem(2,0,1155,1); --��		
		if add_flog == 1 then
			Msg2Player("Nh�n ���c Hoa th�n b�");
			SetTask(TASK_PLANT_TIME,GetTime()+28800);
			SetTask(TASK_IS_PLANT,1);			
		else
			WriteLog("Ho�t ��ng Th�t T�ch: Ng��i ch�i"..GetName().."Nh�n Hoa th�n b� th�t b�i, ti�u ch� th�t b�i:"..add_flog);
			return
		end
	end
end

function nothing()
end