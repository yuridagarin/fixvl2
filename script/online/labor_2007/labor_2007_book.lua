--�ű����ƣ���һ�ָ�Ͻű�
--�ű����ܣ���һ�ָ�϶Ի��ű�
--�߻��ˣ�����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-04-20
--�����޸ļ�¼��
--****************************�Ի�������************************
function main()
	Say("<color=green>H��ng d�n ho�t ��ng 1-5<color>: L�i ��n d�p Qu�c t� lao ��ng h�ng n�m, v�t v� b�y l�u, m�i ng��i c� mu�n ngh� ng�i ch�t kh�ng. H�m nay ta c� t� ch�c m�t ho�t ��ng �� m�i ng��i th� gi�n, b�n nh�n v�o t�n ho�t ��ng �� xem thuy�t minh.",
		4,
		"Ho�t ��ng th� luy�n s� m�n, h�o h�u thi ��u l�i ��i so v� ngh�/techer",
		"T�ng Ki�m s�n trang �i�u ch�nh t�ng t� l� r�i trang b� Ho�ng Kim/cangjian",
		"Cu�c thi �� th�n tranh b�, c�c lo�i ph�n th��ng/mah_jong",
		"Tho�t/end_dialog"
		)
end
--****************************ʦ������************************
function techer()
	Talk(1,"main","<color=green>H��ng d�n ho�t ��ng 1-5<color>: C�c b�n h�y ��n <color=yellow>Tuy�n Ch�u, Th�nh ��, D��ng Ch�u, T��ng D��ng <color> tham gia thi ��u l�i ��i ho�c xem ng��i kh�c thi ��u, ch� c�n 2 b�n ��nh l�i ��i th�a m�n �i�u ki�n c� th� nh�n ���c <color=yellow>Th�c chi�n t�m ��c<color> v� <color=yellow>Quan chi�n t�m ��c<color>, 2 ng��i c�ng c� th� n�p ph�n th��ng ho�t ��ng nh�n ���c l�n S� ph� b�n m�n. �i�u ki�n l�i ��i c� th� t�m <color=green>Ch� l�i ��i<color> �� xem.")
end
--****************************�ؽ�ɽׯ************************
function cangjian()
	Talk(1,"main","<color=green>H��ng d�n ho�t ��ng 1-5<color>: T� l� <color=green>Tr��ng l�o<color> c�a T�ng Ki�m s�n trang v� <color=green>C�u Tuy�t Ki�m Ma<color> r�t <color=red>trang b� Ho�ng Kim<color> t�ng cao, l��ng m�u c�a <color=green>C�u Tuy�t Ki�m Ma<color> gi�m nhi�u. C� ph�i nhi�u l�n b�i d��i tay <color=green>C�u Tuy�t Ki�m Ma<color> khi�n b�n kh�ng cam l�ng, T�ng ki�m �ang ��i b�n ��n khi�u chi�n.")
end
--****************************�齫************************
function mah_jong()
	Talk(1,"main","<color=green>H��ng d�n ho�t ��ng 1-5<color>: <color=green>�� t� Hi�n Vi�n m�n<color> t� ch�c cu�c thi <color=yellow>�� th�n �a� chi�n<color>, b�n c� th� d�ng <color=yellow>B�ch C�u Ho�n<color> v� <color=yellow>Con b�i M�t ch��c<color> mua � <color=yellow>Ng� c�c<color>. B�t k� b�n c� bao nhi�u con b�i c�ng c� th� nh�n ���c ph�n th��ng t��ng �ng. N�u t�p h�p th�nh con b�i ��c bi�t c� th� nh�n ���c <color=yellow>�� hi�p l� bao<color>. Nghe n�i trong �� c� <color=red>Vi�m �� Thao Trang<color>, mu�n bi�t th�m chi ti�t h�y ��n t�m <color=green>�� t� Hi�n Vi�n m�n<color> ��ng b�n c�nh D� T�u.")
end

