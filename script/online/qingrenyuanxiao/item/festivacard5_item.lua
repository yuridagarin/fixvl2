Include("\\script\\online\\title_head.lua")
function OnUse()
	if DelItem(2,1,338,1) == 1 then
		RemoveAllFestivalTitle()
		if AddTitle(4,15) == 1 then
			SetCurTitle(4,15)
			WriteLog("[Ho�t ��ng m�a xu�n (thi�p ch�c)]:"..GetName().."�� s� d�ng thi�p t�nh y�u v� nguy�n ti�u 5. ")
			Msg2Player("B�n nh�n ���c 1 danh hi�u.")
		end
	end
end