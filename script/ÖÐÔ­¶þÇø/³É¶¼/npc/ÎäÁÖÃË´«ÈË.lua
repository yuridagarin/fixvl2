	prize_use_start_time = 13447
	prize_use_end_time = 13463
function main()
	local palyer_sex = "��i hi�p"
	if GetSex() == 2 then
		palyer_sex = "N� hi�p "
	end
	if day_num_return() < prize_use_start_time or day_num_return() > prize_use_end_time then
		Say("V� "..palyer_sex.."N�u mu�n x�ng b� v� l�m th� c�n ph�i r�n luy�n th�m.",
		1,
		"Ta bi�t r�i/end_dialog")
	else
	Say("T�t Tr�ng D��ng kh�ng ���c ��ng s�n th��ng t�u th� th�t ��ng ti�c!",
	3,
	"Ta mu�n ��n Hoa S�n/goto_huashan",
	"T�m hi�u v� ho�t ��ng c�a t�t Tr�ng D��ng/double_nineth_con",
	"K�t th�c ��i tho�i/end_dialog"
	)
	end
end
--******************************���͵���ɽ******************************************
function goto_huashan()
		NewWorld(969,1633,3263)
end
function double_nineth_con()
	Talk(2,"dialog_next",
		"\n Th�i gian ho�t ��ng t�: <color=yellow>0:00/ 27/10-24:00/ 05/11<color>. \n Th�i h�n s� d�ng ph�n th��ng: <color=yellow>24:00/ 12/11<color>. \n �i�u ki�n tham gia: nh�n v�t c�p <color=yellow>11<color>. \n T�i �a nh�n ph�n th��ng: <color=yellow>6<color> l�n/ng�y. \n T�ng s� ph�n th��ng nh�n: <color=yellow>42<color> l�n.",
		"C�c b��c ho�t ��ng: \n 1.T�i tam ��i th�nh th�: Tuy�n Ch�u, Bi�n Kinh, Th�nh �� c� c�ch nhau 5 ph�t 3 lo�i hoa: C�c v�ng, Th� Du, C�c t�m l�i n� hoa. Nh�p v�o c� th� h�i ���c. \n 2.Thu th�p m�i lo�i �� 9 hoa, nh�p chu�t ph�i v�o t�ng lo�i �� ch� bi�n th�nh: C�c Hoa T�u, Th� Du Th�c, C�c Hoa Cao. \n 3. C�c Hoa T�u, Th� Du Th�c, C�c Hoa Cao ch� l�n ��nh <color=red>Hoa S�n<color> m�i c� th� s� d�ng (H�n s� d�ng ��n 24:00/12/11). M�i ng��i c� th� ��n Bi�n Kinh, Th�nh ��, Tuy�n Ch�u g�p <color=yellow>V� L�m Truy�n Nh�n<color> �� ���c ��a l�n Hoa S�n!"
		)
end
function dialog_next()
	Talk(2,"",
		"Ph�n th��ng ho�t ��ng: \n 9 ��a <color=yellow>C�c v�ng<color> tinh ch� th�nh <color=yellow>C�c Hoa T�u<color>. S� d�ng: 500000 �i�m s�c kh�e chuy�n h�a th�nh �i�m kinh nghi�m.\n 9 ��a <color=yellow>Th� Du<color> tinh ch� th�nh <color=yellow>Th� Du Th�c<color>.S� d�ng: T�ng 500000 �i�m s�c kh�e.\n 9 ��a <color=yellow>C�c t�m<color> tinh ch� th�nh <color=yellow>C�c Hoa Cao<color>. S� d�ng: T�ng 10 �i�m danh v�ng v� 200000 �i�m s�c kh�e chuy�n h�a th�nh 200000 �i�m kinh nghi�m.",
		"Ch� �: \n 1.T�i �a nh�n ph�n th��ng m�i ng�y 6 l�n. \n 2. T�ng s� l�n nh�n th��ng trong su�t th�i gian ho�t ��ng: 42 l�n. \n 3. N�u �i�m s�c kh�e=0 th� <color=red>Kh�ng th� s� d�ng<color>C�c Hoa T�u v� C�c Hoa Cao. \n 4. M�i ng��i n�n t�ch l�y �i�m s�c kh�e �� s� d�ng C�c Hoa T�u v� C�c Hoa Cao."
	)
end
function end_dialog()
end
--**************************�ִμ��㺯��******************************************
function day_num_return()
	local times_return = floor((GetTime() - 57600)/(86400))
	return times_return
end