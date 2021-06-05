--File name:festival_book_item.lua 
--Describe:�����������ָ��
--Create Date:2006-8-31
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")

function OnUse()
	local selTab = {
			"Nh�n ���c b�nh Trung Thu M� V�/detail_1",
			"Nh�n th��ng V� L�m Minh/detail_6",
--			"��ȡ�����꽱��/detail_2",
			"B�nh Trung Thu, l�y ��o c� ��i ph�n th��ng /detail_3",
			"L�m c�c lo�i b�nh Trung Thu/detail_4",
			"��i th� k� ni�m nh�n ph�n th��ng/detail_5",
			"[-��ng h��ng d�n-]/nothing",
			}
	Say("<color=green>H��ng d�n<color>: B�n mu�n t�m hi�u ph��ng di�n n�o? �� bi�t t� m� c� c�u gi�i th��ng m�i ��n tra h�i ng��i qu�n l� t��ng �ng.",getn(selTab),selTab);
end;

function detail_1()
	Talk(1,"OnUse","<color=green>H��ng d�n<color>: Nh�n b�nh Trung Thu M� V�: <enter>Th�i gian ho�t ��ng, <color=yellow>11:30, 14:30, 21:00, 23:00 m�i ng�y<color>, ng��i ch�i ��n g�p Ni�n s� nh�n b�nh Trung Thu, s� lu�ng c� h�n, ai ��n tr��c s� nh�n tr��c, <color=yellow>m�i ng�y ch� c� th� nh�n 1 l�n<color>, n�u l� th�i gian c� th� mua <color=yellow>Danh s�ch ng��i ch�i c�<color> � Ng� C�c �� nh�n b� sung.");
end;

function detail_2()
	Talk(1,"OnUse","<color=green>H��ng d�n <color>: Ch�ng t�i �� chu�n b� r�t nhi�u ph�n th��ng cho ng��i ch�i c�, b�n n�o tham gia V� L�m 2 v�o 3 th�i �i�m kh�c nhau s� c� ph�n th��ng t��ng �ng. \nQuy t�c ph�n th��ng: \n1, x�y d�ng nh�n v�t nhi�u h�n 600 ng�y ���c t�ng 20 r��ng s�t ho�c 5 r��ng ��ng ho�c 1 r��ng b�c\n2, x�y d�ng nh�n v�t tr�n 300 ng�y ���c t�ng 10 r��ng s�t ho�c 2 r��ng ��ng \n3, x�y d�ng nh�n v�t �t h�n 100 ng�y ���c t�ng 5 r��ng s�t ho�c 1 r��ng ��ng.");
end;

function detail_3()
	Talk(1,"detail_3_ex","<color=green>H��ng d�n<color>: M�i ng�y v�o <color=yellow>16:30, 19:30, 21:45<color> c�c Boss s� xu�t hi�n b�n ngo�i <color=yellow>Ph�ng T��ng, Tuy�n Ch�u, Th�nh ��<color>, ��nh b�i c�c BOSS n�y c� th� g�i ra Ti�u qu�i, nh�n v�o Ti�u qu�i nh�n ���c c�c B�o h�p (m�i ng��i m�i gi� ch� c� th� nh�n 1 l�n), m�i ng��i ph�i c� ch�a kh�a t��ng �ng m� c�c b�o h�p �� nh�n ph�n th��ng");
end;

function detail_3_ex()
	Talk(1,"OnUse","<color=green>H��ng d�n<color>: T�t Trung Thu l�i ��n, n�m nay ngo�i vi�c l�m c�c b�nh trung thu �� th��ng th�c c�n c� th� ��n ch� ta ��i c�c lo�i b�o h�p c�a V� l�m minh ch� ph�t. Mu�n bi�t b�o h�p c� c�ng d�ng g� h�y ��n g�p <color=yellow>��c s� V� L�m<color>. Ngo�i ra n�u b�n nh�n ���c th� k� ni�m JX2 tr�n 3 n�m c� th� ��n g�p Ni�n s� ��i th��ng.");
end;

function detail_4()
	Talk(1,"detail_4_ex","<color=green>H��ng d�n<color>: <enter>C�ch l�m b�nh trung thu: <enter>M�i ng�y ��n g�p Ni�n s� nh�n nguy�n li�u v� c�ng c� l�m b�nh, �n c�c b�nh trung thu s� nh�n ���c c�c hi�u qu� ��c bi�t.<enter><color=yellow>1. Nh�n nguy�n li�u<color>: Trong th�i gian ho�t ��ng, m�i ng�y online ��n g�p Ni�n s� �� nh�n nguy�n li�u, ngo�i ra c� th� mua th�m c�c nguy�n li�u l�m b�nh t�i ��y.<enter><color=yellow>2. N�u b�nh<color>: ��u ti�n, nh�n ch�n c�ng c�, sau �� b� nguy�n li�u v�o theo h��ng d�n, c� th� ch�n b� 1 trong 3 nguy�n li�u ch�nh v�o, sau �� ch�n than hay c�i �� n�u.");
end;

function detail_4_ex()
	Talk(1,"OnUse","<color=green>H��ng d�n<color>: Ch� �: <enter>1)N�u ch�n than g� th� nhi�t �� ban ��u l� 600 ��, ch�n c�i th� nhi�t �� ban ��u l� 300 ��. <enter>2)Nhi�t �� l� s� gi�m kh�ng ng�ng gi�m xu�ng. <enter>3)B�t c� l�c n�o c�ng c� th� th�m nhi�n li�u v�o l� nh�ng nhi�t �� v��t qu� 900 �� b�nh s� b� ch�y. <enter>4 Nhi�t �� trong l� n��ng kh�ng th� bi�t ���c n�n sau khi b�t ��u n��ng b�nh 3 ph�t s� c� 1 l�n �o nhi�t �� hi�n t�i, n�u qu� 3 ph�t sau s� kh�ng th� �o nhi�t ��. <enter><color=yellow>3, l�y b�nh<color><enter>1) Th�i gian n��ng b�nh l� 5 ph�t. 5 ph�t sau nh�n chu�t ph�i v�o l� n��ng b�nh �� l�y b�nh. <enter>2) Sau khi nhi�t �� l� n��ng b�nh c�n 0 �� kh�ng th� ti�p t�c th�m nhi�n li�u v�o.");
end;

function detail_5()
	Talk(2,"OnUse","<color=green>Ni�n s�<color>: M� b�o h�p c� th� nh�n ���c th� k� ni�m JX2 tr�n 3 n�m\n  10 th� k� ni�m ��i ���c 1 B�ng Lai ti�n l�\n  20 th� k� ni�m ��i ���c ph�n th��ng �i�m kinh nghi�m\n  40 th� k� ni�m ��i ���c ph�n th��ng �i�m kinh nghi�m\n  100 k� ni�m c� th� ��i 1 H�p Ng�n B�i Vinh D�\n  500 th� k� ni�m ��i 1 Ch�a Kh�a B�c Vinh D�","<color=green>Ni�n s�<color>:\n1000 th� k� ni�m ��i 1 H�p Kim B�i Vinh D�\n2000 th� k� ni�m ��i trang s�c Huy Ho�ng Chi Th�y\n3000 th� k� ni�m ��i trang s�c Vinh D�\n6000 th� k� ni�m ��i 1 trong 3 trang b� Ho�ng ��.");
end;

function detail_6()
	Talk(1,"OnUse","<color=green>Ni�n s�<color>:\nTrong th�i gian ho�t ��ng, m�i ng�y ��n g�p V� l�m truy�n nh�n �� nh�n th��ng c�a V� l�m minh ch�, ph�n th��ng n�y s� thay ��i t�y theo v�n may c�a b�n. Mu�n bi�t v�n may h�y ��n t�m Th� Ti�u Nha. N�u l� th�i gian c� th� mua <color=yellow>Danh s�ch ng��i ch�i c�<color> � Ng� C�c �� nh�n b� sung.");
end;
