function main()
	local palyer_sex = "��i hi�p"
	if GetSex() == 2 then
		palyer_sex = "N� hi�p "
	end
	Say("Hoa S�n c�nh s�c tuy�t ��p, nh�ng "..palyer_sex.."N�u kh�ng s� l�nh, ta s� ��a ng��i �i m�t chuy�n!",
	4,
	"�i Bi�n Kinh/#leave_huashan(1)",
	"�i Th�nh ��/#leave_huashan(2)",
	"�i Tuy�n Ch�u/#leave_huashan(3)",
	"K�t th�c ��i tho�i/end_dialog"
	)
end
function leave_huashan(map_seq)
	local map_att = {
	{200,1404,2861},
	{300,1750,3555},
	{100,1421,2992},
	}
	NewWorld(map_att[map_seq][1],map_att[map_seq][2],map_att[map_seq][3])
	SetFightState(0)
end