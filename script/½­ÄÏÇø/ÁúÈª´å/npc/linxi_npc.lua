--��ϫ�������ˣ�������ң�ɶ�

g_szInfoHeader = "<color=green>L�m T�ch<color>: ";

function main()
	Say(g_szInfoHeader.."T�m ta c� vi�c g� kh�ng?",2,"Ta mu�n ��n Dao Ti�n ��ng/go_to_yaoxiandong","Kh�ng c� g�/nothing");
end;

function go_to_yaoxiandong()
	local nLevel = GetLevel();
	if nLevel < 85 then
		Talk(1,"",g_szInfoHeader.."��ng c�p th�p h�n <color=yellow>85<color> kh�ng th� v�o Dao Ti�n ��ng.");
		return 0;
	end;
	NewWorld(118,1616,3211);
end;

function nothing()

end;