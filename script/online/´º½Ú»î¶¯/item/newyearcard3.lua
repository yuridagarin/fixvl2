Include("\\script\\online\\���ڻ\\newyear_head.lua")
Include("\\script\\online\\title_head.lua")
function OnUse()
	if DelItem(2,1,230,1) == 1 then
		RemoveAllFestivalTitle()
		if AddTitle(TITLE_GENRE,3) == 1 then
			SetCurTitle(TITLE_GENRE,3)
			SetTask(TASK_TITLE_OLD,3)
			WriteLog("[Ho�t ��ng m�a xu�n (thi�p ch�c)]:"..GetName().."�� s� d�ng thi�p ch�c n�m m�i 3. ")
			Msg2Player("B�n nh�n ���c danh hi�u h�c t�p ti�n b�.")
		end
	end
end

