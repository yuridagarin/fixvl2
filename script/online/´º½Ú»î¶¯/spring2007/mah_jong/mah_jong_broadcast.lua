--2007���ڻ-�齫�ռ��-��㲥
--���뿪���ˣ��Թ�
--���뿪��ʱ�䣺2007-01-26
--�޸ļ�¼:

--�Թ󴺹����ļ�
Include("\\script\\online\\zgc_public_fun.lua")
--=============================��������������==============================
--===============================���߼���==================================
function main()
	if spring_2007_date_chk() == 0 then
		return
	end
	local mah_seq_time = {{11,time_distance},{15,time_distance},{22,time_distance}}
	local mah_suc_seq = spring_2007_mahj_suc_seq_rtn()
	if mah_suc_seq == 0then
		local mah_jong_suc_seq = {		--�齫�ͷ�������
			{11,4,16},	{12,10,7},	{18,16,15},
			{4,17,14},	{10,6,1},	{2,7,3},
			{4,19,9},	{3,1,5},	{8,11,2},
			{1,12,13},	{13,9,7},	{2,12,15},
			{16,10,6},	{17,14,19},	{18,11,3},
			{9,5,1},	{4,2,1},
		}
		mah_suc_seq = 1
		local sec_seq_now = Zgc_pub_today_sec_num_rtn()		--��������ǽ���ĵڶ�����
		for i = 1, 3 do
			sec_seq_now[i].time_distance = sec_seq_now - (sec_seq_now[i][1]*3600 )
		end
		for i = 2,3 do
			if sec_seq_now[i].time_distance < sec_seq_now[i-1].time_distance then
				mah_suc_seq = i
			end
		end
		local date_seq = (zgc_pub_day_turn(1) - 13552 + 1)
		mah_suc_seq = mah_jong_suc_seq[date_seq][mah_suc_seq]
	end
	local mah_suc_name = {	"��i T� H�",		"T� Kh�c T�",		"C�u Li�n B�o ��ng", "Th�p Tham Y�u",	"Li�n Th�t ��i",
							"Thanh Th�t ��i",		"Th�t Tinh B�t Kh�o",		"Th�i b�t ��o",	"��i Tam Nguy�n",	"Thanh Y�u C�u",
							"Nh�t S�c T� ��ng Thu�n", 	"Nh�t S�c T� Ti�t Cao", 	"T� Nh�t S�c",	"Thanh Nh�t S�c",
							"To�n ��i",			"To�n trung",			"To�n ti�u",		"Thanh Long",		"Tam Kh�c T�",}
	Msg2SubWorld("Ho�t ��ng thu th�p b�i M�c Ch��c:"..mah_suc_name[mah_suc_seq].."!")
	Msg2SubWorld("M�i ng��i tham gia gia ho�t ��ng thu th�p, ��n 3 th�nh th� ch�nh g�p Ph�c Th�n �� nh�n ph�n th��ng.")
	Msg2SubWorld("Xin ��n ch� Ph�c Th�n nh�n  H��ng d�n ho�t ��ng (mi�n ph�)")
end
