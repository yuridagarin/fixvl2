--ʥ�𴫵ݻ��ʹ
--by vivi
--2008/05/09

Include("\\script\\online\\aoyun08\\aoyun_head.lua")
Include("\\script\\online\\aoyun08\\huojushou_name.lua")

function main()
--	local strtab = {
--		"��Ҫ�����μ�ʥ�𴫵ݻ/aoyun_canjia_huoju",
--		"��Ҫ�˽����ֵĲ�ѡ�ʸ�/aoyun_about_huoju",
--		"��Ҫ�˽Ȿ�λ�Ľ���/aoyun_about_jiangli",
--		"��Ҫ�˽Ȿ�λ����/aoyun_about_anpai",
--		"��ֻ��������/nothing"
--		};
--	Say("<color=green>ʥ�𴫵ݻ��ʹ<color>�����ִ���Ѿ��ٿ��ˣ�����Ӣ���ڴ˱�����գ�Ϊ�����ֱ����д裬��ƽ������ԭ�����Ǽ������н���2����ʥ�𴫵ݣ���֪�����Ƿ�Ҳ����Ȥ�μӡ�ֻҪ����<color=red>70��<color>�����˱����μӵ��ʸ��ˣ�<color=red>������μ��˻����ѡ�Σ�������������棬���ǻ���з��ϻ�����ʸ������������棬���еڶ���ѡ�١�<color>",
--		getn(strtab),
--		strtab)
	local strtab = {
			"Ta mu�n t�m hi�u ho�t ��ng/chuandi_detail",
			"S�p x�p th�i gian ho�t ��ng ti�p s�c/chuandi_time",
			"Nh�n quy�n tham gia ho�t ��ng/chuandi_get_prove",
			"T�m t�a �� ��i �u�c/huoju_zuobiao",
			"Ta ch� ��n xem th�/nothing"
			}
	Say("<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Ho�t ��ng r��c Th�nh H�a V� L�m s�p b�t ��u, m�i nh�ng ng��i tham gia ��n ��y nh�n quy�n tham gia v� t�m hi�u n�i dung ho�t ��ng.",
		getn(strtab),
		strtab)
end

function aoyun_canjia_huoju()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20080612 then
		Talk(1,"","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Th�i h�n b�o danh ho�t ��ng r��c Th�nh H�a l� 12 th�ng 6.");
		return
	end
	if GetTask(547) == 1 then
		Talk(1,"","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Ng��i �� b�o danh tham gia ho�t ��ng tuy�n ch�n r��c Th�nh H�a, xin ch� � th�ng b�o.");
		return
	end
	if GetLevel() < 70 then
		Talk(1,"","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: ��ng c�p tham gia ho�t ��ng r��c Th�nh H�a ph�i tr�n 70.");
		return
	end
	Say("<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Ng��i mu�n tham gia ho�t ��ng, ch� c�n tr�n c�p 70 l� c� th� b�o danh, <color=red>30 th�ng 6<color> s� b�t ��u r��c Th�nh H�a. Xin ch� �, b�t k� ai n�u tham gia ho�t ��ng ��u c� th� nh�n ���c ph�n th��ng.",
		2,
		"���c/aoyun_ask_canjia",
		"Kh�ng c�n/nothing")
end

function aoyun_ask_canjia()
	Say("<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Xin ch� �, m�i t�i kho�n ch� c� th� c� 1 nh�n v�t ���c ch�n l�m ng��i r��c �u�c, n�u b�o danh c�ng l�c nhi�u nh�n v�t th� s� ch�n ng��i c� �i�m t�ch l�y cao nh�t.",
		2,
		"���c/aoyun_confirm_canjia",
		"Kh�ng c�n/nothing")
end

function aoyun_confirm_canjia()
	SetTask(547,1);
	Talk(1,"","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Ng��i �� b�o danh tham gia ho�t ��ng tuy�n ch�n r��c Th�nh H�a, xin ch� � th�ng b�o.")
end

function aoyun_about_huoju()
	Talk(1,"aoyun_about_huoju2","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: M�i ng��i ��u c� t� c�ch tham gia r��c �u�c, ch�ng t�i s� c�n c� th�n ph�n trong V� L�m 2 �� tuy�n ch�n ng��i r��c �u�c, th�m ch� khi b�n kh�ng ���c ch�n v�n c� th� l�m ng��i c� v� �� tham gia ho�t ��ng v� nh�n ph�n th��ng, tuy�n c� ng��i r��c �u�c ch� y�u tham kh�o nh� ph�a d��c:\n1. ��ng c�p v� th� h�ng\n2. Qu�n ch��ng\n3. Qu�n c�ng\n4. �i�m t�ch l�y n�p th�\n5. Danh v�ng\n6. �� c�ng hi�n s� m�n\n7. Th�nh t�ch ��i h�i v� l�m");
end

function aoyun_about_huoju2()
	Talk(1,"main","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Sau khi b�o danh, xin l�u � trang ch�, ng��i ch�i c� �i�u ki�n ph� h�p tuy�n ch�n ng��i r��c �u�c, t� <color=red>18/6 ��n 25/6<color> ch�ng t�i s� th�ng b�o tr�n trang ch�, v� do ng��i ch�i b� phi�u v�ng 2.\n<color=red>Xin ch� �, n�ng l�c tuy�n ch�n l� n�ng l�c b�o danh ng�y cu�i c�ng, tr��c n�y cu�i c�ng b�n c� th� t�ng t� c�ch li�n quan.<color>")
end

function aoyun_about_jiangli()
	Talk(1,"main","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Ch� c�n b�n b�o danh ho�t ��ng r��c �u�c th� d� b�n l� ng��i r��c �u�c hay ng��i c� v� c�ng ��u c� th� nh�n ���c ph�n th��ng phong ph�.")
end

function aoyun_about_anpai()
	Talk(1,"main","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Th�i gian b�o danh ho�t ��ng n�y t� <color=red>b�y gi� ��n 12/6<color>, m�i ng��i c� th� b�o danh tuy�n ch�n ng��i r��c �u�c.\nT� <color=red>13/6 ��n 1-7/6<color>, ch�ng t�i s� tuy�n ch�n b��c ��u.\nT� <color=red>18/6 ��n 25/6<color>, s� ti�n h�nh b� phi�u tr�n trang ch�, trong 50 ng��i s� tuy�n ch�n ra 30 ng��i.\nT� <color=red>26/6 ��n 29/6<color>, c�ng b� danh s�ch cu�i c�ng tr�n trang ch�.\n<color=red>30/6<color> l� ng�y r��c �u�c, m�i ng��i c�ng nhau �� Th�nh H�a.")
end

function chuandi_detail()
	Talk(1,"chuandi_detail2","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: N�i th� v� ho�t ��ng l�n n�y.\nHo�t ��ng r��c �u�c:\nCh� c�n ng��i tham gia b�o danh l� c� th� nh�n 'Ch�ng nh�n quy�n r��c �u�c' v� 'Ch�ng nh�n quy�n c� v�' t�i ��y, c�n c�n c� b�n �� t� c�ch li�n quan kh�ng.\nPh�m ph�i tra xem 'Ch�ng nh�n quy�n r��c �u�c' v� 'Ch�ng nh�n quy�n c� v�' c�a m�nh, x�c nh�n nhi�m v� m�nh c�n ho�n th�nh v� �i�m th�i gian r��c �u�c.\nSau khi ��n �i�m th�i gian r��c �u�c, r��c �u�c v� c� v� theo h��ng d�n.");
end

function chuandi_detail2()
	Talk(1,"main","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Ho�t ��ng ��i h�i t� v� m�ng Th�nh H�a:\nSau khi ho�t ��ng b�t ��u 30/3, khi kh�ng ph�i th�i gian ng�y r��c �u�c m�y ch� n�y, ai c�ng c� th� mua '��ng ph�c r��c �u�c' t�i t�p h�a, t� Th�nh H�a ��i b�t ��u th�p �u�c, qua t�t c� ��i �u�c, sau khi ��n Th�nh H�a ��i Th�nh Th� cu�i c�ng, ��u c� th� nh�n ph�n th��ng, nh�ng c�n ch� � r�ng m�i ng��i m�i ng�y ch� nh�n ���c m�t l�n.");
end

function chuandi_time()
	Talk(1,"chuandi_time2","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Th�i gian nh� sau, ho�t ��ng b�t ��u t� 30/6 ��n 6/8 k�t th�c.\nB�t ��u t� 30/6, tu�n ��u 30/6 l� khu thu ph� 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 r��c �u�c.\nTu�n 2 7/7 l� khu thu ph� 11, 12, 13, 14, 15, 16, 1-7, 18, 19, 20 r��c �u�c.\nTu�n 3 14/7 l� khu thu ph� 21, 22, 23, 24, 25, 26, 27, 28, 29, 30 r��c �u�c.");
end

function chuandi_time2()
	Talk(1,"main","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Tu�n 4 21/7 l� khu thu ph� 31, 32, 33, 34, 35, 36, 37, 38, 39, 40 r��c �u�c.\nTu�n 5 28/7 l� khu thu ph� 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52 r��c �u�c.\nTu�n 6 4/8 to�n b� khu mi�n ph� r��c �u�c.\nTh�i gian ho�t ��ng chuy�n �u�c l� <color=yellow>20 gi� ��m 21 gi� t�i<color>.")
end

function chuandi_get_prove()
	if GetTask(547) ~= 0 then
		local sName = tostring(GetName());
		local nIsHuojushou = 0;
		for i=1,getn(tHuojushouName) do
			for j=1,getn(tHuojushouName[i]) do
				if sName == tHuojushouName[i][j] then
					nIsHuojushou = j;
					break
				end
			end
		end
		if nIsHuojushou == 0 then
			Say("<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Ng��i �ang l� ng��i c� v�, ng��i mu�n nh�n <color=yellow>quy�n tham gia c� v�<color> kh�ng?",
				2,
				"Ta mu�n nh�n /#chuandi_confirm_get(1)",
				"�� nh�n sau/nothing")
		else
			SetTask(TASK_AOYUN_HUOJU_NUM,nIsHuojushou);
			Say("<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Ng��i �ang l� ng��i r��c �u�c, mu�n nh�n <color=yellow>Ch�ng nh�n quy�n r��c �u�c<color> kh�ng?",
				2,
				"Ta mu�n nh�n /#chuandi_confirm_get(2)",
				"�� nh�n sau/nothing")
		end
	else
		Talk(1,"","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Ng��i ch�a b�o danh tham gia ho�t ��ng.");
	end
end

function chuandi_confirm_get(nType)
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if nType == 1 then
		if BigGetItemCount(2,1,3377) < 1 then
			AddItem(2,1,3377,1); --�������ʸ�֤��
		else
			Talk(1,"","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Kh�ng ph�i ng��i �� c� r�i sao?")
		end 
	elseif nType == 2 then
		local nBody = GetBody();
		if BigGetItemCount(0,105,44+nBody) < 1 then
			AddItem(0,105,44+nBody,1); --����ַ���
		end		
		if BigGetItemCount(2,1,3376) < 1 then
			AddItem(2,1,3376,1); --������ʸ�֤��
		else
			Talk(1,"","<color=green>��i s� ho�t ��ng r��c Th�nh H�a<color>: Kh�ng ph�i ng��i �� c� r�i sao?")
		end
	end
end

function huoju_zuobiao()
	Talk(1,"huoju_zuobiao2","Ph�ng T��ng: Th�nh H�a ��i [228,191], ��i �u�c 1 [209,200], ��i �u�c 2 [207,193], ��i �u�c 3 [222,200]\nT��ng D��ng: ��i �u�c 4 [192,1-79], ��i �u�c 5 [1-77,1-74], ��i �u�c 6 [168,1-79], ��i �u�c 7 [1-70,190], ��i �u�c 8 [189,190]\nTh�nh ��: ��i �u�c 9 [209,229], ��i �u�c 10 [213,21-7], ��i �u�c 11 [232,218], ��i �u�c 12 [220,221], ��i �u�c 13 [233,226]\n��i L�: ��i �u�c 14 [191,182], ��i �u�c 15 [1-78,185], ��i �u�c 16 [181,193], ��i �u�c 1-7 [195,194]");
end

function huoju_zuobiao2()
	Talk(1,"OnUse","Tuy�n Ch�u: ��i �u�c 18 [169,180], ��i �u�c 19 [169,190], ��i �u�c 20 [189,190], ��i �u�c 21 [188,181]\nD��ng Ch�u: ��i �u�c 22 [203,191], ��i �u�c 23 [203,198], ��i �u�c 24 [218,198], ��i �u�c 25 [21-7,192]\nBi�n Kinh: ��i �u�c 26 [158,185], ��i �u�c 27 [183,184], ��i �u�c 28 [183,1-73], ��i �u�c 29 [162,1-72], ��i �u�c th�nh th� [1-70,1-79]");
end