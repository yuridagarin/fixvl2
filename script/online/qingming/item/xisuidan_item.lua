--File name:xisuidan_item.lua
--Describe:ϴ�赤���߽ű�
--Create Date:2006-3-22
--Author:yanjun
Include("\\script\\online\\qingming\\qingming_head.lua");
function OnUse()
	local selTab = {
				"���c! Ta mu�n s� d�ng./use",
				"Th�i �� sau n�y h�y d�ng./nothing",
				};
	Say("B�n c� ��ng � s� d�ng T�y T�y ��n kh�ng? N� c� t�c d�ng t�y l�i �i�m ti�m n�ng",2,selTab);
end;

function use()
	if DelItem(2,0,386,1) == 1 then
		ResetProperty();
		Write_Log("S� d�ng v�t ph�m","�� s� d�ng T�y T�y ��n ");
	end;
end;

function nothing()

end;