tTitle = {	--�ƺ����֣��ƺŴ��࣬�ƺ�С�࣬��Ʒ���1����Ʒ���2����Ʒ���3
	[2] = {{"H�nh gi�",6,1,2,1,395},{"H�n Nguy�n T�ng",6,2,2,1,396}},
	[3] = {{"Kh� H�nh T�ng",8,1,2,1,399},{"Thi�n Tu T�ng",8,2,2,1,400}},
	[4] = {{"Sa Di",7,1,2,1,397},{"��u T�ng",7,2,2,1,398}},
	[6] = {{"Trang Kh�ch",9,1,2,1,401},{"H� V�",9,2,2,1,402}},
	[8] = {{"Thanh T�m S�",10,1,2,1,403},{"V� Y S�",10,2,2,1,404}},
	[9] = {{"T� Kh�c S�",11,1,2,1,405},{"Ph�n �m S�",11,2,2,1,406}},
	[11] = {{"Ch�p B�t �� T�",12,1,2,1,407},{"Tr� Gian �� T�",12,2,2,1,408}},
	[12] = {{"Ch�p B�ng �� T�",13,1,2,1,409},{"Tr�ng �c �� T�",13,2,2,1,410}},
	[14] = {{"Thanh Tu ��o nh�n",14,1,2,1,411},{"Nh�p Quan ��o nh�n",14,2,2,1,412}},
	[15] = {{"Thanh Phong ��o nh�n",15,1,2,1,413},{"S�n D��ng ��o nh�n",15,2,2,1,414}},
	[17] = {{"Khinh k� binh",16,1,2,1,415},{"Hi�u �y",16,2,2,1,416}},
	[18] = {{"Xuy�n D��ng Th�",17,1,2,1,417},{"�� �y",17,2,2,1,418}},
	[20] = {{"�o�t Ph�ch T�n Nh�n",18,1,2,1,419},{"Th�i M�nh T�n Nh�n",18,2,2,1,420}},
	[21] = {{"��c T�m T�n Nh�n",19,1,2,1,421},{"Th�c T�m T�n Nh�n",19,2,2,1,422}},
}

function Use_Title(nRoute,nTitleLevel)	--��һ������������ʹ�ø���Ʒ��·�ߣ��ڶ��������ǳƺŵĵȼ�
	if GetPlayerRoute() ~= nRoute then
		Talk(1,"","B�n kh�ng th� s� d�ng v�t ph�m l�u ph�i kh�c");
		return 0;
	end;
	local selTab = {
			"��ng �/#Confirm("..nTitleLevel..")",
			"�� ta suy ngh� l�i/nothing",
			}
	Say("S� d�ng v�t ph�m n�y c� th� thay ��i danh hi�u s� m�n c�a b�n, b�n x�c nh�n mu�n s� d�ng?",getn(selTab),selTab);
end;

function Remove_Other_Title()
	for i=6,19 do	--�����µ�·��ʱ���Ҫ�޸�
		for j=1,2 do	--�����µĳƺ�ʱ���Ҫ�޸�
			RemoveTitle(i,j);
		end;
	end;
end;

function Confirm(nTitleLevel)
	local nRoute = GetPlayerRoute();
	local nGenreIndex = nTitleLevel;
	Remove_Other_Title();
	if DelItem(tTitle[nRoute][nTitleLevel][4],tTitle[nRoute][nTitleLevel][5],tTitle[nRoute][nTitleLevel][6],1) == 1 then
		if AddTitle(tTitle[nRoute][nTitleLevel][2],tTitle[nRoute][nTitleLevel][3]) == 1 then
			SetCurTitle(tTitle[nRoute][nTitleLevel][2],tTitle[nRoute][nTitleLevel][3]);
			Msg2Player("B�n nh�n ���c danh hi�u"..tTitle[nRoute][nTitleLevel][1].."{X�ng hi�u}");
		end;
	end;
end;

function nothing()

end;