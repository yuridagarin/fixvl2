g_InfoHeader = "<color=green>B� mai<color>:";
function main()
	local selTab = {
				"Ta mu�n r�i kh�i s�n kh�u/leave",
				"Kh�ng c� g�/nothing",
				}
	Say(g_InfoHeader.."Ng��i mu�n r�i kh�i kh�ng?",getn(selTab),selTab);
end;

function leave()
	NewWorld(150, 1600, 3141)
end;

function nothing()

end;