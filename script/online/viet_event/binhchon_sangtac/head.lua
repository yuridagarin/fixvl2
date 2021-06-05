Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");

function main()
	local nDate =  tonumber(date("%y%m%d"))
	if nDate < 110909 or nDate > 110918 then
		Talk(1, "", "�� h�t h�n b�nh ch�n!")
		return
	end
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>Ch�o m�ng qu� ��ng ��o tham gia  cu�c thi <color=red>B�nh ch�n s�ng t�c truy�n tranh V� L�m 2<color>. H�y b�nh ch�n cho b� truy�n m� ��ng ��o c�m th�y �n t��ng nh�t trong danh s�ch d��i ��y:"
	local tbSayDialog = {};
	local nSaySize = 0;
	
	if GetLevel() < 77 then
		Talk(1, "", "��ng c�p 77 tr� l�n m�i c� th� tham gia b�nh ch�n!")
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "Ch�a gia nh�p m�n ph�i kh�ng th� tham gia b�nh ch�n!")
		return
	end
	
	tinsert(tbSayDialog, "Xem h��ng d�n/do_guide")
	tinsert(tbSayDialog, "Xem s� l�n b�n �� b�nh ch�n /num_infor")
	tinsert(tbSayDialog, "Ta mu�n b�nh ch�n Truy�n Tranh/do_vote_1")
	tinsert(tbSayDialog, "Ta mu�n b�nh ch�n K� H�a/do_vote_2")
	tinsert(tbSayDialog, "Ta ch� gh� ngang./do_nothing")
	
	Say(szHeader, getn(tbSayDialog), tbSayDialog)		
	
end

function do_vote_1()
	local tListTruyenTranh = {
			[1] = 
			{
				"Th�n H�nh B�o �i�n - Phan H�u Ho�ng/#confirm_do_vote(1,1)",	
				"T� V� - ��ng Minh Tr�ng/#confirm_do_vote(2,1)",	
				"Anh h�ng m�c m�u - D� Thanh V�/#confirm_do_vote(3,1)",	
				"C�i Bang ��i �� t� - �inh Th� H�ng Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thi�n H� - Nguy�n Qu�c B�o/#confirm_do_vote(5,1)",	
				"S�n Tinh Th�y Tinh V� L�m II - Nguy�n V�n Nam/#confirm_do_vote(6,1)",	
				"L�i t�i ai - Nguy�n V� B�o/#confirm_do_vote(7,1)",
				"T�n H�ng V��ng k�n r� - Nguy�n Th�nh C�ng/#confirm_do_vote(8,1)",
				"Danh T��ng - Th�n Quang D��ng/#confirm_do_vote(9,1)",	
				"Chuy�n gia l�a b�p - Nguy�n Ng�c Huy/#confirm_do_vote(10,1)",	
				"Th�m t� l�ng danh - Nguy�n H�u Vinh/#confirm_do_vote(11,1)",	
			},
			[2] =
			{
				"T� V� - ��ng Minh Tr�ng/#confirm_do_vote(2,1)",	
				"Anh h�ng m�c m�u - D� Thanh V�/#confirm_do_vote(3,1)",	
				"C�i Bang ��i �� t� - �inh Th� H�ng Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thi�n H� - Nguy�n Qu�c B�o/#confirm_do_vote(5,1)",	
				"S�n Tinh Th�y Tinh V� L�m II - Nguy�n V�n Nam/#confirm_do_vote(6,1)",	
				"L�i t�i ai - Nguy�n V� B�o/#confirm_do_vote(7,1)",
				"T�n H�ng V��ng k�n r� - Nguy�n Th�nh C�ng/#confirm_do_vote(8,1)",
				"Danh T��ng - Th�n Quang D��ng/#confirm_do_vote(9,1)",	
				"Chuy�n gia l�a b�p - Nguy�n Ng�c Huy/#confirm_do_vote(10,1)",	
				"Th�m t� l�ng danh - Nguy�n H�u Vinh/#confirm_do_vote(11,1)",	
				"Th�n H�nh B�o �i�n - Phan H�u Ho�ng/#confirm_do_vote(1,1)",	
			},
			[3] =
			{
				"Anh h�ng m�c m�u - D� Thanh V�/#confirm_do_vote(3,1)",	
				"C�i Bang ��i �� t� - �inh Th� H�ng Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thi�n H� - Nguy�n Qu�c B�o/#confirm_do_vote(5,1)",	
				"S�n Tinh Th�y Tinh V� L�m II - Nguy�n V�n Nam/#confirm_do_vote(6,1)",	
				"L�i t�i ai - Nguy�n V� B�o/#confirm_do_vote(7,1)",
				"T�n H�ng V��ng k�n r� - Nguy�n Th�nh C�ng/#confirm_do_vote(8,1)",
				"Danh T��ng - Th�n Quang D��ng/#confirm_do_vote(9,1)",	
				"Chuy�n gia l�a b�p - Nguy�n Ng�c Huy/#confirm_do_vote(10,1)",	
				"Th�m t� l�ng danh - Nguy�n H�u Vinh/#confirm_do_vote(11,1)",	
				"Th�n H�nh B�o �i�n - Phan H�u Ho�ng/#confirm_do_vote(1,1)",	
				"T� V� - ��ng Minh Tr�ng/#confirm_do_vote(2,1)",	
			},
			[4] =
			{
				"C�i Bang ��i �� t� - �inh Th� H�ng Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thi�n H� - Nguy�n Qu�c B�o/#confirm_do_vote(5,1)",	
				"S�n Tinh Th�y Tinh V� L�m II - Nguy�n V�n Nam/#confirm_do_vote(6,1)",	
				"L�i t�i ai - Nguy�n V� B�o/#confirm_do_vote(7,1)",
				"T�n H�ng V��ng k�n r� - Nguy�n Th�nh C�ng/#confirm_do_vote(8,1)",
				"Danh T��ng - Th�n Quang D��ng/#confirm_do_vote(9,1)",	
				"Chuy�n gia l�a b�p - Nguy�n Ng�c Huy/#confirm_do_vote(10,1)",	
				"Th�m t� l�ng danh - Nguy�n H�u Vinh/#confirm_do_vote(11,1)",	
				"Th�n H�nh B�o �i�n - Phan H�u Ho�ng/#confirm_do_vote(1,1)",	
				"T� V� - ��ng Minh Tr�ng/#confirm_do_vote(2,1)",	
				"Anh h�ng m�c m�u - D� Thanh V�/#confirm_do_vote(3,1)",	
			},
			[5] =
			{
				"Ngao Du Thi�n H� - Nguy�n Qu�c B�o/#confirm_do_vote(5,1)",	
				"S�n Tinh Th�y Tinh V� L�m II - Nguy�n V�n Nam/#confirm_do_vote(6,1)",	
				"L�i t�i ai - Nguy�n V� B�o/#confirm_do_vote(7,1)",
				"T�n H�ng V��ng k�n r� - Nguy�n Th�nh C�ng/#confirm_do_vote(8,1)",
				"Danh T��ng - Th�n Quang D��ng/#confirm_do_vote(9,1)",	
				"Chuy�n gia l�a b�p - Nguy�n Ng�c Huy/#confirm_do_vote(10,1)",	
				"Th�m t� l�ng danh - Nguy�n H�u Vinh/#confirm_do_vote(11,1)",	
				"Th�n H�nh B�o �i�n - Phan H�u Ho�ng/#confirm_do_vote(1,1)",	
				"T� V� - ��ng Minh Tr�ng/#confirm_do_vote(2,1)",	
				"Anh h�ng m�c m�u - D� Thanh V�/#confirm_do_vote(3,1)",	
				"C�i Bang ��i �� t� - �inh Th� H�ng Nhung/#confirm_do_vote(4,1)",	
			},
			[6] =
			{
				"S�n Tinh Th�y Tinh V� L�m II - Nguy�n V�n Nam/#confirm_do_vote(6,1)",	
				"L�i t�i ai - Nguy�n V� B�o/#confirm_do_vote(7,1)",
				"T�n H�ng V��ng k�n r� - Nguy�n Th�nh C�ng/#confirm_do_vote(8,1)",
				"Danh T��ng - Th�n Quang D��ng/#confirm_do_vote(9,1)",	
				"Chuy�n gia l�a b�p - Nguy�n Ng�c Huy/#confirm_do_vote(10,1)",	
				"Th�m t� l�ng danh - Nguy�n H�u Vinh/#confirm_do_vote(11,1)",	
				"Th�n H�nh B�o �i�n - Phan H�u Ho�ng/#confirm_do_vote(1,1)",	
				"T� V� - ��ng Minh Tr�ng/#confirm_do_vote(2,1)",	
				"Anh h�ng m�c m�u - D� Thanh V�/#confirm_do_vote(3,1)",	
				"C�i Bang ��i �� t� - �inh Th� H�ng Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thi�n H� - Nguy�n Qu�c B�o/#confirm_do_vote(5,1)",	
			},
			[7] =
			{
				"L�i t�i ai - Nguy�n V� B�o/#confirm_do_vote(7,1)",
				"T�n H�ng V��ng k�n r� - Nguy�n Th�nh C�ng/#confirm_do_vote(8,1)",
				"Danh T��ng - Th�n Quang D��ng/#confirm_do_vote(9,1)",	
				"Chuy�n gia l�a b�p - Nguy�n Ng�c Huy/#confirm_do_vote(10,1)",	
				"Th�m t� l�ng danh - Nguy�n H�u Vinh/#confirm_do_vote(11,1)",	
				"Th�n H�nh B�o �i�n - Phan H�u Ho�ng/#confirm_do_vote(1,1)",	
				"T� V� - ��ng Minh Tr�ng/#confirm_do_vote(2,1)",	
				"Anh h�ng m�c m�u - D� Thanh V�/#confirm_do_vote(3,1)",	
				"C�i Bang ��i �� t� - �inh Th� H�ng Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thi�n H� - Nguy�n Qu�c B�o/#confirm_do_vote(5,1)",	
				"S�n Tinh Th�y Tinh V� L�m II - Nguy�n V�n Nam/#confirm_do_vote(6,1)",	
			},
			[8] =
			{
				"T�n H�ng V��ng k�n r� - Nguy�n Th�nh C�ng/#confirm_do_vote(8,1)",
				"Danh T��ng - Th�n Quang D��ng/#confirm_do_vote(9,1)",	
				"Chuy�n gia l�a b�p - Nguy�n Ng�c Huy/#confirm_do_vote(10,1)",	
				"Th�m t� l�ng danh - Nguy�n H�u Vinh/#confirm_do_vote(11,1)",	
				"Th�n H�nh B�o �i�n - Phan H�u Ho�ng/#confirm_do_vote(1,1)",	
				"T� V� - ��ng Minh Tr�ng/#confirm_do_vote(2,1)",	
				"Anh h�ng m�c m�u - D� Thanh V�/#confirm_do_vote(3,1)",	
				"C�i Bang ��i �� t� - �inh Th� H�ng Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thi�n H� - Nguy�n Qu�c B�o/#confirm_do_vote(5,1)",	
				"S�n Tinh Th�y Tinh V� L�m II - Nguy�n V�n Nam/#confirm_do_vote(6,1)",	
				"L�i t�i ai - Nguy�n V� B�o/#confirm_do_vote(7,1)",
			},
			[9] =
			{
				"Danh T��ng - Th�n Quang D��ng/#confirm_do_vote(9,1)",	
				"Chuy�n gia l�a b�p - Nguy�n Ng�c Huy/#confirm_do_vote(10,1)",	
				"Th�m t� l�ng danh - Nguy�n H�u Vinh/#confirm_do_vote(11,1)",	
				"Th�n H�nh B�o �i�n - Phan H�u Ho�ng/#confirm_do_vote(1,1)",	
				"T� V� - ��ng Minh Tr�ng/#confirm_do_vote(2,1)",	
				"Anh h�ng m�c m�u - D� Thanh V�/#confirm_do_vote(3,1)",	
				"C�i Bang ��i �� t� - �inh Th� H�ng Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thi�n H� - Nguy�n Qu�c B�o/#confirm_do_vote(5,1)",	
				"S�n Tinh Th�y Tinh V� L�m II - Nguy�n V�n Nam/#confirm_do_vote(6,1)",	
				"L�i t�i ai - Nguy�n V� B�o/#confirm_do_vote(7,1)",
				"T�n H�ng V��ng k�n r� - Nguy�n Th�nh C�ng/#confirm_do_vote(8,1)",
			},
			[10] =
			{
				"Chuy�n gia l�a b�p - Nguy�n Ng�c Huy/#confirm_do_vote(10,1)",	
				"Th�m t� l�ng danh - Nguy�n H�u Vinh/#confirm_do_vote(11,1)",	
				"Th�n H�nh B�o �i�n - Phan H�u Ho�ng/#confirm_do_vote(1,1)",	
				"T� V� - ��ng Minh Tr�ng/#confirm_do_vote(2,1)",	
				"Anh h�ng m�c m�u - D� Thanh V�/#confirm_do_vote(3,1)",	
				"C�i Bang ��i �� t� - �inh Th� H�ng Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thi�n H� - Nguy�n Qu�c B�o/#confirm_do_vote(5,1)",	
				"S�n Tinh Th�y Tinh V� L�m II - Nguy�n V�n Nam/#confirm_do_vote(6,1)",	
				"L�i t�i ai - Nguy�n V� B�o/#confirm_do_vote(7,1)",
				"T�n H�ng V��ng k�n r� - Nguy�n Th�nh C�ng/#confirm_do_vote(8,1)",
				"Danh T��ng - Th�n Quang D��ng/#confirm_do_vote(9,1)",	
			},
			[11] =
			{
				"Th�m t� l�ng danh - Nguy�n H�u Vinh/#confirm_do_vote(11,1)",	
				"Th�n H�nh B�o �i�n - Phan H�u Ho�ng/#confirm_do_vote(1,1)",	
				"T� V� - ��ng Minh Tr�ng/#confirm_do_vote(2,1)",	
				"Anh h�ng m�c m�u - D� Thanh V�/#confirm_do_vote(3,1)",	
				"C�i Bang ��i �� t� - �inh Th� H�ng Nhung/#confirm_do_vote(4,1)",	
				"Ngao Du Thi�n H� - Nguy�n Qu�c B�o/#confirm_do_vote(5,1)",	
				"S�n Tinh Th�y Tinh V� L�m II - Nguy�n V�n Nam/#confirm_do_vote(6,1)",	
				"L�i t�i ai - Nguy�n V� B�o/#confirm_do_vote(7,1)",
				"T�n H�ng V��ng k�n r� - Nguy�n Th�nh C�ng/#confirm_do_vote(8,1)",
				"Danh T��ng - Th�n Quang D��ng/#confirm_do_vote(9,1)",	
				"Chuy�n gia l�a b�p - Nguy�n Ng�c Huy/#confirm_do_vote(10,1)",	
			},		
	}
	local nRand = random(1,11)
	local tSay = tListTruyenTranh[nRand]
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>Ch�o m�ng qu� ��ng ��o tham gia  cu�c thi <color=red>B�nh ch�n s�ng t�c truy�n tranh V� L�m 2<color>. H�y b�nh ch�n cho b� truy�n m� ��ng ��o c�m th�y �n t��ng nh�t trong danh s�ch d��i ��y:"
	
	tinsert(tSay, "Xem th�ng tin kh�c/main")
	Say(szHeader, getn(tSay), tSay)
		
end

function do_vote_2()
	local tListKyHoa = {
			[1] = 
			{
				"X�ch Th� D�m - D��ng H� Vi ��i Th�ch/#confirm_do_vote(1,2)",	
				"Ch�c b� ng� ngon - Ng� H�ng Nam/#confirm_do_vote(2,2)",	
				"Kh�ng ph�i l� - L� V�n Th��ng/#confirm_do_vote(3,2)",	
				"Truy t�m b�u v�t - ��ng V� Ho�ng/#confirm_do_vote(4,2)",	
				"Luy�n c�ng - Nguy�n Quang Hi�u/#confirm_do_vote(5,2)",	
				"S�n Th� - Tr�n Ng�c Y�n Trang/#confirm_do_vote(6,2)",	
				"C��p - Ho�ng Tr�n S�n/#confirm_do_vote(7,2)",	
				"T�t Trung thu - Tr�n Ng�c Y�n Trang/#confirm_do_vote(8,2)",	
				"V� �nh C��c - Nguy�n V� B�o/#confirm_do_vote(9,2)",	
				"M� Nh�n K� - Nguy�n Th�o Linh/#confirm_do_vote(10,2)",	
			},
			[2] =
			{
				"Ch�c b� ng� ngon - Ng� H�ng Nam/#confirm_do_vote(2,2)",	
				"Kh�ng ph�i l� - L� V�n Th��ng/#confirm_do_vote(3,2)",	
				"Truy t�m b�u v�t - ��ng V� Ho�ng/#confirm_do_vote(4,2)",	
				"Luy�n c�ng - Nguy�n Quang Hi�u/#confirm_do_vote(5,2)",	
				"S�n Th� - Tr�n Ng�c Y�n Trang/#confirm_do_vote(6,2)",	
				"C��p - Ho�ng Tr�n S�n/#confirm_do_vote(7,2)",	
				"T�t Trung thu - Tr�n Ng�c Y�n Trang/#confirm_do_vote(8,2)",	
				"V� �nh C��c - Nguy�n V� B�o/#confirm_do_vote(9,2)",	
				"M� Nh�n K� - Nguy�n Th�o Linh/#confirm_do_vote(10,2)",	
				"X�ch Th� D�m - D��ng H� Vi ��i Th�ch/#confirm_do_vote(1,2)",	
			},
			[3] =
			{
				"Kh�ng ph�i l� - L� V�n Th��ng/#confirm_do_vote(3,2)",	
				"Truy t�m b�u v�t - ��ng V� Ho�ng/#confirm_do_vote(4,2)",	
				"Luy�n c�ng - Nguy�n Quang Hi�u/#confirm_do_vote(5,2)",	
				"S�n Th� - Tr�n Ng�c Y�n Trang/#confirm_do_vote(6,2)",	
				"C��p - Ho�ng Tr�n S�n/#confirm_do_vote(7,2)",	
				"T�t Trung thu - Tr�n Ng�c Y�n Trang/#confirm_do_vote(8,2)",	
				"V� �nh C��c - Nguy�n V� B�o/#confirm_do_vote(9,2)",	
				"M� Nh�n K� - Nguy�n Th�o Linh/#confirm_do_vote(10,2)",	
				"X�ch Th� D�m - D��ng H� Vi ��i Th�ch/#confirm_do_vote(1,2)",	
				"Ch�c b� ng� ngon - Ng� H�ng Nam/#confirm_do_vote(2,2)",	
			},
			[4] =
			{
				"Truy t�m b�u v�t - ��ng V� Ho�ng/#confirm_do_vote(4,2)",	
				"Luy�n c�ng - Nguy�n Quang Hi�u/#confirm_do_vote(5,2)",	
				"S�n Th� - Tr�n Ng�c Y�n Trang/#confirm_do_vote(6,2)",	
				"C��p - Ho�ng Tr�n S�n/#confirm_do_vote(7,2)",	
				"T�t Trung thu - Tr�n Ng�c Y�n Trang/#confirm_do_vote(8,2)",	
				"V� �nh C��c - Nguy�n V� B�o/#confirm_do_vote(9,2)",	
				"M� Nh�n K� - Nguy�n Th�o Linh/#confirm_do_vote(10,2)",	
				"X�ch Th� D�m - D��ng H� Vi ��i Th�ch/#confirm_do_vote(1,2)",	
				"Ch�c b� ng� ngon - Ng� H�ng Nam/#confirm_do_vote(2,2)",	
				"Kh�ng ph�i l� - L� V�n Th��ng/#confirm_do_vote(3,2)",	
			},
			[5] =
			{
				"Luy�n c�ng - Nguy�n Quang Hi�u/#confirm_do_vote(5,2)",	
				"S�n Th� - Tr�n Ng�c Y�n Trang/#confirm_do_vote(6,2)",	
				"C��p - Ho�ng Tr�n S�n/#confirm_do_vote(7,2)",	
				"T�t Trung thu - Tr�n Ng�c Y�n Trang/#confirm_do_vote(8,2)",	
				"V� �nh C��c - Nguy�n V� B�o/#confirm_do_vote(9,2)",	
				"M� Nh�n K� - Nguy�n Th�o Linh/#confirm_do_vote(10,2)",	
				"X�ch Th� D�m - D��ng H� Vi ��i Th�ch/#confirm_do_vote(1,2)",	
				"Ch�c b� ng� ngon - Ng� H�ng Nam/#confirm_do_vote(2,2)",	
				"Kh�ng ph�i l� - L� V�n Th��ng/#confirm_do_vote(3,2)",	
				"Truy t�m b�u v�t - ��ng V� Ho�ng/#confirm_do_vote(4,2)",	
			},
			[6] =
			{
				"S�n Th� - Tr�n Ng�c Y�n Trang/#confirm_do_vote(6,2)",	
				"C��p - Ho�ng Tr�n S�n/#confirm_do_vote(7,2)",	
				"T�t Trung thu - Tr�n Ng�c Y�n Trang/#confirm_do_vote(8,2)",	
				"V� �nh C��c - Nguy�n V� B�o/#confirm_do_vote(9,2)",	
				"M� Nh�n K� - Nguy�n Th�o Linh/#confirm_do_vote(10,2)",	
				"X�ch Th� D�m - D��ng H� Vi ��i Th�ch/#confirm_do_vote(1,2)",	
				"Ch�c b� ng� ngon - Ng� H�ng Nam/#confirm_do_vote(2,2)",	
				"Kh�ng ph�i l� - L� V�n Th��ng/#confirm_do_vote(3,2)",	
				"Truy t�m b�u v�t - ��ng V� Ho�ng/#confirm_do_vote(4,2)",	
				"Luy�n c�ng - Nguy�n Quang Hi�u/#confirm_do_vote(5,2)",	
			},
			[7] =
			{
				"C��p - Ho�ng Tr�n S�n/#confirm_do_vote(7,2)",	
				"T�t Trung thu - Tr�n Ng�c Y�n Trang/#confirm_do_vote(8,2)",	
				"V� �nh C��c - Nguy�n V� B�o/#confirm_do_vote(9,2)",	
				"M� Nh�n K� - Nguy�n Th�o Linh/#confirm_do_vote(10,2)",	
				"X�ch Th� D�m - D��ng H� Vi ��i Th�ch/#confirm_do_vote(1,2)",	
				"Ch�c b� ng� ngon - Ng� H�ng Nam/#confirm_do_vote(2,2)",	
				"Kh�ng ph�i l� - L� V�n Th��ng/#confirm_do_vote(3,2)",	
				"Truy t�m b�u v�t - ��ng V� Ho�ng/#confirm_do_vote(4,2)",	
				"Luy�n c�ng - Nguy�n Quang Hi�u/#confirm_do_vote(5,2)",	
				"S�n Th� - Tr�n Ng�c Y�n Trang/#confirm_do_vote(6,2)",	
			},
			[8] =
			{
				"T�t Trung thu - Tr�n Ng�c Y�n Trang/#confirm_do_vote(8,2)",	
				"V� �nh C��c - Nguy�n V� B�o/#confirm_do_vote(9,2)",	
				"M� Nh�n K� - Nguy�n Th�o Linh/#confirm_do_vote(10,2)",	
				"X�ch Th� D�m - D��ng H� Vi ��i Th�ch/#confirm_do_vote(1,2)",	
				"Ch�c b� ng� ngon - Ng� H�ng Nam/#confirm_do_vote(2,2)",	
				"Kh�ng ph�i l� - L� V�n Th��ng/#confirm_do_vote(3,2)",	
				"Truy t�m b�u v�t - ��ng V� Ho�ng/#confirm_do_vote(4,2)",	
				"Luy�n c�ng - Nguy�n Quang Hi�u/#confirm_do_vote(5,2)",	
				"S�n Th� - Tr�n Ng�c Y�n Trang/#confirm_do_vote(6,2)",	
				"C��p - Ho�ng Tr�n S�n/#confirm_do_vote(7,2)",	
			},
			[9] =
			{
				"V� �nh C��c - Nguy�n V� B�o/#confirm_do_vote(9,2)",	
				"M� Nh�n K� - Nguy�n Th�o Linh/#confirm_do_vote(10,2)",	
				"X�ch Th� D�m - D��ng H� Vi ��i Th�ch/#confirm_do_vote(1,2)",	
				"Ch�c b� ng� ngon - Ng� H�ng Nam/#confirm_do_vote(2,2)",	
				"Kh�ng ph�i l� - L� V�n Th��ng/#confirm_do_vote(3,2)",	
				"Truy t�m b�u v�t - ��ng V� Ho�ng/#confirm_do_vote(4,2)",	
				"Luy�n c�ng - Nguy�n Quang Hi�u/#confirm_do_vote(5,2)",	
				"S�n Th� - Tr�n Ng�c Y�n Trang/#confirm_do_vote(6,2)",	
				"C��p - Ho�ng Tr�n S�n/#confirm_do_vote(7,2)",	
				"T�t Trung thu - Tr�n Ng�c Y�n Trang/#confirm_do_vote(8,2)",	
			},
			[10] =
			{
				"M� Nh�n K� - Nguy�n Th�o Linh/#confirm_do_vote(10,2)",	
				"X�ch Th� D�m - D��ng H� Vi ��i Th�ch/#confirm_do_vote(1,2)",	
				"Ch�c b� ng� ngon - Ng� H�ng Nam/#confirm_do_vote(2,2)",	
				"Kh�ng ph�i l� - L� V�n Th��ng/#confirm_do_vote(3,2)",	
				"Truy t�m b�u v�t - ��ng V� Ho�ng/#confirm_do_vote(4,2)",	
				"Luy�n c�ng - Nguy�n Quang Hi�u/#confirm_do_vote(5,2)",	
				"S�n Th� - Tr�n Ng�c Y�n Trang/#confirm_do_vote(6,2)",	
				"C��p - Ho�ng Tr�n S�n/#confirm_do_vote(7,2)",	
				"T�t Trung thu - Tr�n Ng�c Y�n Trang/#confirm_do_vote(8,2)",	
				"V� �nh C��c - Nguy�n V� B�o/#confirm_do_vote(9,2)",	
			},
	}
	
	local nRand = random(1,10)
	local tSay = tListKyHoa[nRand]
	local szName = "La Sa"
	local szHeader = "<color=green>"..szName.." :<color>Ch�o m�ng qu� ��ng ��o tham gia  cu�c thi <color=red>B�nh ch�n s�ng t�c truy�n tranh V� L�m 2<color>. H�y b�nh ch�n cho b� truy�n m� ��ng ��o c�m th�y �n t��ng nh�t trong danh s�ch d��i ��y:"

	tinsert(tSay, "Xem th�ng tin kh�c/main")
	Say(szHeader, getn(tSay), tSay)
	
end

function confirm_do_vote(nNum, nType)
	
	SetTaskTemp(TSK_KARAOKETEMP, nType) 
	SetTaskTemp(TSK_KARAOKETEMP, GetTaskTemp(TSK_KARAOKETEMP) + nNum * 10) 
	
	WinFlowerNumber()

end

function do_guide()
	local szName = "La Sa"
	local tSay = {}
	local szHeader = "<color=green>"..szName.." :<color> Ch��ng tr�nh b�nh ch�n s�ng t�c truy�n tranh V� L�m 2 di�n ra t� ng�y 09/09/2011 ��n 18/9/2011. Trong th�i gian b�nh ch�n, ��ng ��o c� th� s� d�ng b�nh Trung Thu �� b�nh ch�n cho b� truy�n th�n t��ng c�a m�nh. T� b�nh Trung Thu th� 2001 tr� �i, ng��i ch�i ch� nh�n ���c �i�m b�nh ch�n. "
	
	tinsert(tSay, "Xem th�ng tin kh�c/main")
	
	Say(szHeader, getn(tSay), tSay)
end

function WinFlowerNumber()
	AskClientForNumber("VoteNum",1,999,"S� b�nh Trung Thu!")
end

function VoteNum( nCount)
	
	local tVoteName =
	{
		[1] = 
			{
				"Th�n H�nh B�o �i�n - Phan H�u Ho�ng",
				"T� V� - ��ng Minh Tr�ng",
				"Anh h�ng m�c m�u - D� Thanh V�",
				"C�i Bang ��i �� t� - �inh Th� H�ng Nhung",
				"Ngao Du Thi�n H� - Nguy�n Qu�c B�o",
				"S�n Tinh Th�y Tinh V� L�m II - Nguy�n V�n Nam",
				"L�i t�i ai - Nguy�n V� B�o",
				"T�n H�ng V��ng k�n r� - Nguy�n Th�nh C�ng",
				"Danh T��ng - Th�n Quang D��ng",
				"Chuy�n gia l�a b�p - Nguy�n Ng�c Huy",
				"Th�m t� l�ng danh - Nguy�n H�u Vinh",
			},
		[2] = 
			{
				"X�ch Th� D�m - D��ng H� Vi ��i Th�ch",
				"Ch�c b� ng� ngon - Ng� H�ng Nam",
				"Kh�ng ph�i l� - L� V�n Th��ng",
				"Truy t�m b�u v�t - ��ng V� Ho�ng",
				"Luy�n c�ng - Nguy�n Quang Hi�u",
				"S�n Th� - Tr�n Ng�c Y�n Trang",
				"C��p - Ho�ng Tr�n S�n",
				"T�t Trung thu - Tr�n Ng�c Y�n Trang",
				"V� �nh C��c - Nguy�n V� B�o",
				"M� Nh�n K� - Nguy�n Th�o Linh",				
			},
	}
	
	if  nCount < 1 or nCount > 999  then
		Msg2Player("S� b�nh Trung Thu nh�p v�o kh�ng h�p l�")
		return
	end
	if GetItemCount(2, 1, 30326)  < nCount  then 
		Msg2Player("H�nh trang ��i hi�p kh�ng �� "..nCount.." b�nh Trung Thu!!")
		return
	end
	local nVotedCount = GetTask(TSK_TRUYENTRANH)
	local nWinFlower = 0
	local nExpCount = 0
	local nMark = 0;
	
	if nVotedCount >= 2000 then
		 nWinFlower = nCount
		 nMark = nWinFlower * 1
	else
		local nTotalVoted =  nVotedCount + nCount
		if nTotalVoted >= 2000  then
			nWinFlower = nTotalVoted - 2000
			nExpCount = 2000 -  nVotedCount
			nMark = nExpCount * 1 + nWinFlower * 1
		else
			nWinFlower = nCount
			nExpCount = nCount
			nMark = nCount * 1
		end
	end
	
--	
--	if nExpCount ~= 0 and DelItem(2, 1, 30326, nCount) == 1 then
--		SetTask(TSK_TRUYENTRANH, GetTask(TSK_TRUYENTRANH) + nMark)
--		local nExp = nExpCount * 250000
--		ModifyExp(nExp)
--		Msg2Player("Nh�n ���c  "..nExp.." �i�m kinh nghi�m!")
--	else
--		SetTask(TSK_TRUYENTRANH, GetTask(TSK_TRUYENTRANH) + nMark)
--	end
--	
	if nExpCount == 0 then
		if DelItem(2, 1, 30326, nCount) == 1  then
			SetTask(TSK_TRUYENTRANH, GetTask(TSK_TRUYENTRANH) + nMark)
		end
	else
		if DelItem(2, 1, 30326, nCount) == 1  then
			SetTask(TSK_TRUYENTRANH, GetTask(TSK_TRUYENTRANH) + nMark)
			local nExp = nExpCount * 250000
			ModifyExp(nExp)
			Msg2Player("Nh�n ���c  "..nExp.." �i�m kinh nghi�m!")
		end
	end
	
	local nType  = mod(GetTaskTemp(TSK_KARAOKETEMP), 10)
	local nNum = floor(GetTaskTemp(TSK_KARAOKETEMP)/10)
	
	local szLogTitle = "Binh chon sang tac truyen tranh"
	if nType == 2 then
		szLogTitle = "Binh chon sang tac ky hoa"
	end	
	gf_WriteLogEx(szLogTitle, "Tham gia b�nh ch�n ",nMark, tVoteName[nType][nNum])
	Talk(1,"","S� �i�m b�n b�nh ch�n cho "..tVoteName[nType][nNum] .. " " .. nMark)
end

function num_infor()
	local nNum = GetTask(TSK_TRUYENTRANH)
	Talk(1,"","B�n �� b�nh ch�n ���c <color=red>"..nNum.."<color> l�n!!!")
end

function do_nothing()

end