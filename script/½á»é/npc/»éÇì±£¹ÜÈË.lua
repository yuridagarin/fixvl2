ID_ITEMBOX = 805
function main()
	if GetTask(ID_ITEMBOX) == 0 then
		Talk(1,"","Xin l�i ng��i v�n ch�a ���c s� h�u r��ng n�y")
		return 0;
	end;
	OpenBox();
end;