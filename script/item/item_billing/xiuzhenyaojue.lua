-- ����Ҫ��
-- ������Ϊ����1000��
-- lizhi 2006-11-2 11:53

nInsPopur = 1000

function OnUse()
	-- �ж����Ӻ���Ϊ�Ƿ񵽴�����
	nCount = GetItemCount(2,0,554)
	AskClientForNumber("TuChan_use", 0, nCount,"(0-999)")
end

function yes_say()
	if DelItem(2, 0, 554, 1) == 1 then
		ModifyPopur(nInsPopur)
		Msg2Player("B�n �� d�ng Tu Ch�n y�u quy�t, t�ng"..nInsPopur.." �i�m tu luy�n")
	end
end


function TuChan_use(nCount)
	if nCount == 0 then
		return 0
	end
	
	local nPopurLimit = GetPopurLimit()
	local nPopur = GetPopur()
	if (nPopur + (nInsPopur*nCount)) > nPopurLimit then
		Talk(1,"","S� �i�m c�ng v��t qu� gi�i h�n, kh�ng th� s� d�ng <color=green>Tu Ch�n y�u quy�t<color>!")
		return 0
	end
	
	if DelItem(2, 0, 554, nCount) == 1 then
		ModifyPopur(nInsPopur*nCount)
		Msg2Player("B�n �� d�ng "..nCount.." Tu Ch�n y�u quy�t, t�ng "..(nInsPopur*nCount).." �i�m tu luy�n.")
	else
		Talk(1,"","S� l��ng <color=green>Tu Ch�n y�u quy�t<color> trong h�nh trang kh�ng ��.")
		return 0
	end
end


function no_say()

end