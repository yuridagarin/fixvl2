Include("\\script\\online\\���ڻ\\newyear_head.lua")
Include("\\script\\online\\title_head.lua")
function OnUse()
	if DelItem(2,1,231,1) == 1 then
		RemoveAllFestivalTitle()
		if AddTitle(TITLE_GENRE,4) == 1 then
			SetCurTitle(TITLE_GENRE,4)
			SetTask(TASK_TITLE_OLD,4)
			WriteLog("[Ho�t ��ng m�a xu�n (thi�p ch�c)]:"..GetName().."�� s� d�ng thi�p ch�c n�m m�i 4. ")
			Msg2Player("B�n nh�n ���c danh hi�u V�n s� nh� �.")
		end
	end
end

