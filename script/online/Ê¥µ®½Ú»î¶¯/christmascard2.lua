Include("\\script\\online\\title_head.lua")
function OnUse()
	if DelItem(2,1,211,1) == 1 then
		RemoveAllFestivalTitle()
		nRetCode = AddTitle(3,2)
		if nRetCode == 1 then 
			Msg2Player("Ch�c m�ng b�n nh�n ���c 1 danh hi�u gi�ng sinh!")
		else
			Msg2Player("Nh�n danh hi�u gi�ng sinh th�t b�i.")
		end
	end
end