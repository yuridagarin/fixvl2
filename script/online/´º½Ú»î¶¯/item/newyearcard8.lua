Include("\\script\\online\\���ڻ\\newyear_head.lua")
Include("\\script\\online\\title_head.lua")
function OnUse()
	if DelItem(2,1,235,1) == 1 then
		RemoveAllFestivalTitle()
		if AddTitle(TITLE_GENRE,8) == 1 then
			SetCurTitle(TITLE_GENRE,8)
			SetTask(TASK_TITLE_OLD,8)
			WriteLog("[Ho�t ��ng m�a xu�n (thi�p ch�c)]:"..GetName().."�� s� d�ng thi�p ch�c n�m m�i 8 ")
			Msg2Player("B�n nh�n ���c danh hi�u T�m t��ng s� th�nh.")
		end
	end
end

