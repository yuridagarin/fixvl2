
function OnUse()
	local selTab = {
		"���c! Ta mu�n m� bao l� x�./open",
		"T�m th�i ta ch�a mu�n m�./nothing"
		}
	Say("Tr��c khi m� bao l� x�, h�y xem h�nh trang c� �� � tr�ng v� s�c l�c hay kh�ng, nh�m tr�nh nh�ng t�n th�t kh�ng ��ng. B�n c� ��ng � m� n� kh�ng?",2,selTab)
end

function open()
	if DelItem(2,1,265,1) == 1 then
		WriteLog("[Ho�t ��ng m�a xu�n (bao l� x�)]:"..GetName().." �� s� d�ng 1 bao l� x� n�m m�i.")
		AddItem(2,1,266,1)
		AddItem(2,1,267,1)
		AddItem(2,1,268,1)
		AddItem(2,1,269,1)
		Msg2Player("B�n nh�n ���c 4 c�i b�nh t�.")
	end
end

function nothing()

end