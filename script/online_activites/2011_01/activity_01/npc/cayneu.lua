Include("\\script\\online_activites\\2011_01\\activity_01\\head.lua");

function main()
	local tSay = {}
	local szHeader = "Ch�c m�ng n�m m�i T�n M�o."
	
	tinsert(tSay, "N�p M�m Ng� Qu�./PB_give_5fruit")
	tinsert(tSay, "C�y n�u ��p th�t./do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_nothing()

end