g_sNpcName = "Li�u Nhu quan"

function main()
	local selTab = {
			"K�t th�c ��i tho�i/nothing",
			};
	Say("<color=green>"..g_sNpcName.."<color>: Do ���ng x� xa x�i, qu�n b� ��i Li�u ch�a k�p chuy�n ��n, th�t v�t v� cho c�c v�!",getn(selTab),selTab);
end;

function nothing()

end;
