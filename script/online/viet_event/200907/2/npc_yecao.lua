--=======================================================
--create by baiyun 2009.5.31
--describe:Խ�ϰ�7�·ݻ֮��ҹ�ݣ�ҹ�ݽű�
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	if VerifyDate(1) == 1 then
		Say("D� Th�o: T�  <color=red>19-06-2009 ��n 24:00 19-07-2009<red>, ��ng ��o c� th� d�ng ��ng Ti�n V�ng �� ��i l�y c�c ph�n th��ng h�p d�n sau ��y::",
				7,
				"1 ��i B�ch C�u Ho�n � (c�n 1 ��ng Ti�n V�ng)/#duihuan_aword(1)",
				"1 C��ng Hi�u Tam Thanh Ho�n � (c�n 1 ��ng Ti�n V�ng)/#duihuan_aword(2)",
				"1 C��ng Hi�u L�c Th�n Ho�n � (c�n 1 ��ng Ti�n V�ng)/#duihuan_aword(3)",
				"1 C�u Chuy�n H�i H�n ��n � (c�n 1 ��ng Ti�n V�ng)/#duihuan_aword(4)",
				"1 Thi�n H��ng C�m T�c_T�i Nh� � (c�n 1 ��ng Ti�n V�ng)/#duihuan_aword(5)",
				"Trang k�/#NextPage(2)",
				"T�i h� ch� gh� ngang!/end_dialogover");
	else
		Say("Ho�t ��ng n�y �� k�t th�c!",0)
	end
end

function NextPage(nPage)
	if VerifyDate(1) == 1 then
		if nPage == 2 then
			Say("D� Th�o: T�  <color=red>19-06-2009 ��n 24:00 19-07-2009<red>, ��ng ��o c� th� d�ng ��ng Ti�n V�ng �� ��i l�y c�c ph�n th��ng h�p d�n sau ��y::",
				7,
				"1 Nh�t nguy�n ph�c th�y ��n (ti�u) � (c�n 1 ��ng Ti�n V�ng)/#duihuan_aword(6)",
				"1 Ng� hoa ng�c l� ho�n (ti�u) � (c�n 1 ��ng Ti�n V�ng)/#duihuan_aword(7)",
				"1 B�ng Lai Ti�n ��n � (c�n 2 ��ng Ti�n V�ng)/#duihuan_aword(8)",
				"1 V�n v�t quy nguy�n ��n (Ti�u) � (c�n 2 ��ng Ti�n V�ng)/#duihuan_aword(9)",
				"1 Ti�u Th�n Th�ng Ph� � (c�n 2 ��ng Ti�n V�ng)/#duihuan_aword(10)",
				"Trang tr��c/main",
				"Trang k�/#NextPage(3)");
		elseif nPage == 3 then
				Say("D� Th�o: T�  <color=red>19-06-2009 ��n 24:00 19-07-2009<red>, ��ng ��o c� th� d�ng ��ng Ti�n V�ng �� ��i l�y c�c ph�n th��ng h�p d�n sau ��y::",
				8,
				"1 Ti�u Ni�n Th� Th�n Ph� � (c�n 3 ��ng Ti�n V�ng)/#duihuan_aword(11)",
				"1 H�c ng�c �o�n t�c cao (ti�u) � (c�n 3 ��ng Ti�n V�ng)/#duihuan_aword(12)",
				"1 B�ch C�u Ti�n ��n � (c�n 4 ��ng Ti�n V�ng)/#duihuan_aword(13)",
				"1 Tam Thanh Ti�n ��n � (c�n 4 ��ng Ti�n V�ng)/#duihuan_aword(14)",
				"1 L�c Th�n Ti�n ��n � (c�n 4 ��ng Ti�n V�ng)/#duihuan_aword(15)",
				"Trang tr��c/#NextPage(2)",
				"Trang k�/#NextPage(4)",
				"tr� l�i/main");
		elseif nPage == 4 then
				Say("D� Th�o: T�  <color=red>19-06-2009 ��n 24:00 19-07-2009<red>, ��ng ��o c� th� d�ng ��ng Ti�n V�ng �� ��i l�y c�c ph�n th��ng h�p d�n sau ��y::",
				8,
				"1 Sinh sinh h�a t�n (ti�u) � (c�n 4 ��ng Ti�n V�ng)/#duihuan_aword(16)",
				"1 L�c l�m lang y�n � (c�n 5 ��ng Ti�n V�ng)/#duihuan_aword(17)",
				"1 Th�y ho�ng b� chi�u � (c�n 5 ��ng Ti�n V�ng)/#duihuan_aword(18)",
				"1 Uy�n ��ng kim ti b�c � (c�n 7 ��ng Ti�n V�ng)/#duihuan_aword(19)",
				"1 S� tay s�ng � (c�n 20 ��ng Ti�n V�ng)/#duihuan_aword(20)",
				"Trang tr��c/#NextPage(3)",
				"Trang k�/#NextPage(5)",
				"tr� l�i/main");
		elseif nPage == 5 then
				Say("D� Th�o: T�  <color=red>19-06-2009 ��n 24:00 19-07-2009<red>, ��ng ��o c� th� d�ng ��ng Ti�n V�ng �� ��i l�y c�c ph�n th��ng h�p d�n sau ��y::",
				8,
				"1 Th�n h�nh b�o �i�n � (c�n 25 ��ng Ti�n V�ng)/#duihuan_aword(21)",
				"1 Huy hi�u chi�n c�ng (huy ho�ng) � (c�n 50 ��ng Ti�n V�ng)/#duihuan_aword(22)",
				"1 T�y T�y Linh ��n � (c�n 80 ��ng Ti�n V�ng)/#duihuan_aword(23)",
				"1 B�t B�o T�y T�y Ti�n ��n � (c�n 100 ��ng Ti�n V�ng)/#duihuan_aword(24)",
				"1 Phi�u V� � (c�n 250 ��ng Ti�n V�ng) /#duihuan_aword(25)",
				"Trang tr��c/#NextPage(4)",
				"tr� l�i/main",
				"T�i h� ch� gh� ngang!/end_dialogover");
		end
	else
		Say("Ho�t ��ng n�y �� k�t th�c!",0)
	end
end

--�һ�����
function duihuan_aword(nIndex)
	if GetItemCount(2, 1, 30094) < tb_yecao_aword[nIndex][3] then
		Talk(1, "", "��ng Ti�n V�ng mang theo kh�ng ��!");
		return
	end
	if gf_Judge_Room_Weight(2, 50, " ") == 0 then
		return
	end
	if DelItem(2, 1, 30094, tb_yecao_aword[nIndex][3]) == 1 then
		local nRetCode, nItem = gf_AddItemEx(tb_yecao_aword[nIndex][2], tb_yecao_aword[nIndex][1]);
		WriteLogEx("Hoat dong thang 6","D� Th�o Tr� l�i",tb_yecao_aword[nIndex][2][4],tb_yecao_aword[nIndex][1]);
		if nRetCode == 1 and tb_yecao_aword[nIndex][4] ~= 0 then
			SetItemExpireTime(nItem, tb_yecao_aword[nIndex][4]);
		end
	end
end

--�����Ի�
function end_dialogover()
end