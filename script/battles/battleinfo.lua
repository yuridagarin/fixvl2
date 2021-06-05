TAB_YANMENGGUAN = {
	"Quy t�c ��i chi�n/info_rule_yanmen",
	"Th�i gian tham chi�n/info_open_time",
	"�i�u ki�n tham gia/info_join_requre",
	"Th�nh t�ch chi�n c�ng/info_point_gain",
	"T�m hi�u Anh h�ng l�nh/info_lingpai_help",
	"Ta �� hi�u r�i/OnCancel",
}

function info_rule_yanmen()
	Say("��i chi�n Nh�n M�n quan s� d�ng h�nh th�c qu�n chi�n. Trong chi�n tr�n kh�ng c� c�c NPC chi�n ��u nh�ng � ti�n tuy�n v� ��i doanh c� xu�t hi�n c�c NPC ��c th�. Chi�n ��u theo h�nh th�c l�p chi�n c�ng, m�i l�n ng��i ch�i phe m�nh ��nh b�i ng��i ch�i ��i ph��ng s� nh�n ���c 2 �i�m chi�n c�ng v� ghi th�m 2 �i�m chi�n c�ng cho phe m�nh, li�n tr�m 3 l�n nh�n ���c 10 �i�m chi�n c�ng. Chi�n c�ng ���c �i�u ch�nh theo t� l� kh�c nhau d�a v�o s� ng��i c�a hai b�n. B�n c� s� ng��i nhi�u, �i�m chi�n c�ng s� �t h�n so v�i b�n kia.", 3, "Trang k�/info_rule_next1", "tr� l�i/bt_onbattleinfo", "Tho�t/OnCancel")
end

function info_rule_next1()
	Say("Khi tr�ng th��ng s� ���c quay v� h�u doanh, 10 gi�y sau m�i c� th� quay l�i chi�n tr��ng. Th�i gian l�u l�i h�u doanh kh�ng v��t qu� 2 ph�t. N�u v��t qu�, s� ���c t� ��ng ��a tr� l�i chi�n tr��ng. Khi chi�n ��u, ng��i ch�i ch� c� th� gia nh�p 1 trong 2 phe v� kh�ng th� ��i phe. Ch� ���c ��i phe sau khi chi�n ��u k�t th�c.", 4, "Trang tr��c/info_rule_yanmen", "Trang k�/info_rule_next2", "tr� l�i/bt_onbattleinfo", "Tho�t/OnCancel")
end

function info_rule_next2()
	Say("S� ng��i khi khai chi�n c�a m�i b�n �t nh�t l� 10 ng��i. B�o danh k�t th�c, b�t k� phe n�o �t h�n 10 ng��i s� kh�ng th� khai chi�n. Sau khi chi�n ��u b�t ��u, phe n�o c� s� ng��i hi�n tham chi�n (bao g�m � h�u doanh) �t h�n 1 ng��i s� b� x� thua. Th�i gian chi�n ��u k�t th�c, phe c� t�ng chi�n c�ng ���c t�nh nhi�u h�n s� gi�nh chi�n th�ng. Chi�n c�ng hai b�n b�ng nhau s� ���c x� h�a", 3, "Trang tr��c/info_rule_next1", "tr� l�i/bt_onbattleinfo", "Tho�t/OnCancel")
end
  
function OnCancel()
end

function info_lingpai_help()
	Say("C� 2 lo�i Anh h�ng l�nh: ��i T�ng anh h�ng l�nh v� ��i Li�u anh h�ng l�nh. Nh�p chu�t ph�i v�o anh h�ng l�nh s� ���c chuy�n ��n �i�m b�o danh c�a phe T�ng ho�c phe Li�u t��ng �ng. ��i T�ng anh h�ng l�nh c� th� mua � Tri�u Di�n Ni�n (Bi�n Kinh). ��i Li�u anh h�ng l�nh c� th� mua � Ti�u Di�n Ni�n (Bi�n Kinh).", 2, "tr� l�i/bt_onbattleinfo", "Tho�t/OnCancel")
end

function bt_onbattleinfo()
	Say( "N�m th� 4 Th�i b�nh h�ng Qu�c ��i T�ng, T�ng Th�i T�ng Tri�u Quang Ngh�a th�o ph�t Li�u Qu�c ��i b�i tr� v� lo gi� n��c, tu d��ng binh l�c. Li�u Qu�c kh�ng t� b� c� h�i t�t n�y �ang k�o qu�n ��n Nh�n M�n quan. Cu�c chi�n Nh�n M�n quan b�ng n�.", getn(TAB_YANMENGGUAN), TAB_YANMENGGUAN )
end

function info_point_gain()
	Say("Trong chi�n ��u, khi ng��i ch�i PK, li�n tr�m, tham gia s� ki�n ��c bi�t, gi�nh ���c th�ng l�i trong cu�c chi�n...��u nh�n ���c �i�m chi�n c�ng t��ng �ng. <enter> Khi ch�a khai chi�n, ng��i ch�i hai b�n T�ng Li�u c� th� mua v�t ph�m, ��i �i�m kinh nghi�m � Qu�n Nhu Quan t�i �i�m b�o danh c�a m�i b�n. Sau khi ch�nh th�c khai chi�n, Qu�n Nhu Quan s� ng�ng b�n v�t ph�m chi�n tr��ng cho ��n khi chi�n ��u k�t th�c.", 2, "tr� l�i/bt_onbattleinfo", "Tho�t/OnCancel")
end

function info_join_requre()
	Say("Nh�n v�t l�n h�n ho�c b�ng c�p <color=yellow>40<color> m�i c� th� b�o danh tham gia chi�n tr��ng s� c�p. L�n h�n ho�c b�ng c�p <color=yellow>70<color> b�o danh chi�n tr��ng cao c�p. S� ng��i t�i �a c�a 2 b�n l� <color=yellow>100<color> ng��i. B�t ��u khai chi�n n�u s� ng��i tham chi�n ch�a ��t t�i �a th� c� th� ti�p t�c b�o danh, tr� tr��ng h�p khai chi�n 10 ph�t m�i kh�ng th� b�o danh. S� ng��i tham chi�n ��i b�n �t nh�t l� 10, b�t k� b�n n�o �t h�n s� �y th� kh�ng th� b�t ��u khai chi�n. ��i b�n b�o danh h�n nhau ���c 5 ng��i, qu� s� ng��i th� b�n nhi�u kh�ng th� b�o danh ch� ���c b�o danh phe c�n l�i.", 2, "tr� l�i/bt_onbattleinfo", "Tho�t/OnCancel")
end

function info_open_time()
	Say("Tr�n chi�n Nh�n M�n Quan m�i ng�y m� 4 ��t g�m: 13: 45; 15: 45; 19: 45; 21: 45, th�i gian b�o danh l� 15 ph�t, th�i gian chi�n ��u l� 30 ph�t.", 2, "tr� l�i/bt_onbattleinfo", "Tho�t/OnCancel")
end

