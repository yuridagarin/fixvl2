--�ű����ƣ��׵�����ͼֽʹ�ýű�
--�ű����ܣ��������ʾ������Ҫ�Ĳ���
--�߻��ˣ�С����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-07-02
Tb_refound_mertiral = {
	{2,1,504,4,"N� Oa Tinh Th�ch"},
	{2,0,555,2,"C�n Kh�n ph�"},
	{2,1,503,5,"V� Ng�n Th�y"},
	{2,1,1009,100,"Thi�n Th�ch Tinh Th�ch"},
}
function OnUse()
	local mertiral_need_dia = "Trong b�c tranh b�n ph�t hi�n b�n ph�t hi�n mu�n ��c <color=red>b� Vi�m ��<color> c�n c� c�c nguy�n li�u sau"
	for i = 1, getn(Tb_refound_mertiral) do
		local num_color = "<color=red>"
		local mertiral_num = GetItemCount(Tb_refound_mertiral[i][1],Tb_refound_mertiral[i][2],Tb_refound_mertiral[i][3])
		if mertiral_num >= Tb_refound_mertiral[i][4] then
			num_color = "<color=green>"
		end
		mertiral_need_dia = mertiral_need_dia .."\n    <color=yellow>"..Tb_refound_mertiral[i][5]..Tb_refound_mertiral[i][4].."<color>, hi�n b�n c�"..num_color..mertiral_num.."<color>;"
	end
	Talk(1,"",mertiral_need_dia)
end
