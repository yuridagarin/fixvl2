Include("\\script\\online_activites\\2010_12\\activites_01\\head.lua")

function main()
	local tSay = {}
	local szHeader = "Ch�c m�ng Gi�ng Sinh 2010."
	
	tinsert(tSay, "Trang tr� c�y th�ng m�ng n�m m�i./makeup_xmas_tree")
	tinsert(tSay, "N�p C�i Kh�./give_wood_201012")
	tinsert(tSay, "C�y th�ng ��p qu�./do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_nothing()

end