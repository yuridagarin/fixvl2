
function OnUse()
	Say("<color=green>C� Kinh<color> �� t� b�n m�n ��u ph�i n�m l�ng, nghi�m c�m ti�t l� ra ngo�i. Ai vi ph�m s� b� tru�t ph� v� c�ng, tr�c xu�t kh�i s� m�n._B�ch Di�n Lang Qu�n",5,"Ch��ng 1: Kh�i lu�n/gailun","Ch��ng 2: C� thu�t/gushu","Ch��ng 3: C� M�u/gumu","Ch��ng 4: ��c/gu","��ng/no")
end

function gailun()
	Say("<color>Tinh hoa v� c�ng b�n ph�i n�m trong c� m�u. Ch� c�n chuy�n t�m nu�i d��ng ph�i h�p v�i n�i c�ng b�o ch� s� t�o ra lo�i c� m�u c�c ��c, kh� ai b� k�p. D� ��i ph��ng c� tr�m n�m c�ng l�c c�ng ��nh b� tay!",5,"Ch��ng 2: C� thu�t/gushu","Ch��ng 3: C� M�u/gumu","Ch��ng 4: ��c/gu","Tr��c/OnUse","��ng/no")
end

function gushu()
	Say("<color> Tr� Cu�ng Phong Tr�o, v� c�ng kh�c c�a b�n ph�i ��u l� C� thu�t, mi�u t� chi ti�t:",6,". Ph�n lo�i C� thu�t/gushufenlei",". Nu�i c� m�u v� ch� ��c/gumuweiyang",". Kh�ng ch� ��c/tunshi",". K�ch ��c/jihuo","Tr��c/OnUse","��ng/no")
end

function gumu()
	Say("<color> C� m�u l� v� c�ng s� h� c�a b�n ph�i, l� c�n nguy�n c�a v�n ��c, mi�u t� chi ti�t:",7,". Th�c �n/shiwu",". Tu�i th�/shouming",". ��i/jie",". B�n t�nh ch�t ��c, Huy�t, Linh, Ma/duxuelingmo",". X�ng hi�u/chenghao","Tr��c/OnUse","��ng/no")
end

function gu()
	Say("<color> Kh�ng c� ��c th� kh�ng c� C� thu�t, mi�u t� chi ti�t:",4,". Ph�n lo�i/gufenlei",". �i�u ki�n s�n sinh s�u ��c/shengchantiaojian","Tr��c/OnUse","��ng/no")
end

function gushufenlei()
	Say("<color> Nh�n chung C� thu�t chia l�m hai lo�i: <color=gold>Nu�i C� m�u v� C� thu�t<color> C� thu�t chia theo hi�u qu� l�: <color=gold>T�n c�ng, ph�ng ng�, t�n c�ng ��c bi�t v� ph�ng ng� ��c bi�t<color>C� thu�t chia theo t�nh ch�t: <color=green>��c h� <color=red>Huy�t h� <color=gray>Linh h� <color=gold>Ma h�<color>",5,". Nu�i c� m�u v� ch� ��c/gumuweiyang",". Kh�ng ch� ��c/tunshi",". K�ch ��c/jihuo","Tr��c/gushu","��ng/no")
end

function gumuweiyang()
	Say("<color>Nu�i c� m�u b�ng c�c lo�i v�t ph�m, thay ��i n�ng l�c c�a c� m�u. <color=green>Tr��c ti�n, ph�i mang theo ng��i 1 con c� m�u<color>: S� d�ng k� n�ng Nu�i c� m�u, nh�p chu�t l�y v�t ph�m trong � v�t ph�m ra, cho c� m�u �n v�t ph�m khi�n n�ng l�c c� m�u bi�n chuy�n. S� d�ng k� n�ng s�n sinh s�u ��c �� s�n sinh ra nh�ng con s�u ��c nh�. M�i l�n s�n sinh, c�n c� v�o s�u ��c kh�c nhau �� c�i thi�n n�ng l�c c�a c� m�u. K� n�ng D��ng c� m�t thu�t c� th� �i�u ch� c�c lo�i th�c �n ��c bi�t cho c� m�u, chuy�n bi�n m�t n�ng l�c ��c bi�t n�o �� c�a c� m�u.",5,". Ph�n lo�i C� thu�t/gushufenlei",". Kh�ng ch� ��c/tunshi",". K�ch ��c/jihuo","Tr��c/gushu","��ng/no")
end

function tunshi()
	Say("<color> Kh�ng ch� ��c l� c�ng ��c v� ph�ng ��c theo t�nh ch�t c�a ��c, h�a gi�i t�c d�ng ��c l�n nhau: C�ng ��c: Khi k� ��ch b� phun ��c, ch�t ��c tr�n ng��i s� �n d�n v�o theo tu�n t� t�: ��c->Huy�t->Linh->Ma->��c. V� d�: Tr�n ng��i k� ��ch �� b� phun c� m�u, l�i ti�p t�c b� phun ��c huy�t. Hi�u qu� c�a c� m�u s� b� ��c huy�t h�a gi�i. Kh�ng ch� ��c c� th� t� tr��c sau, n�u phun ��c huy�t tr��c r�i phun c� m�u, ��c huy�t s� kh�ng th� kh�ng ch� c� m�u. Ph�ng ��c: Nh�n v�t ch� c� th� mang m�t lo�i ph�ng ��c, ph�ng ��c ���c th�m v�o s� kh�ng ch� c�i �� c�. Kh�ng ch� ��c th�: C�ng ��c v� ph�ng ��c ��c th� kh�ng kh�c ch� nhau, c� th� c�ng t�n t�i.",5,". Ph�n lo�i C� thu�t/gushufenlei",". Nu�i c� m�u v� ch� ��c/gumuweiyang",". K�ch ��c/jihuo","Tr��c/gushu","��ng/no")
end

function jihuo()
	Say("<color> K�ch ��c l� khi <color=green>k� ��ch b� phun 3 lo�i c�ng ��c<color>, c� th� k�ch ho�t hi�u qu� c�a c�c lo�i ��c: C�ng ��c ��c bi�t: Phun ch�t ��c ��c th� cho k� ��ch, s� k�ch ho�t thu�c t�nh t�n c�ng cao c�p cho k� ��ch, ��ng th�i 3 lo�i c�ng ��c b� h�y b�. Ph�ng ��c: Khi b�n th�n �� c� ph�ng ��c, n�u b� k� ��ch t�n c�ng s� t� k�ch ho�t thu�c t�nh ph�ng ng� cao c�p, ��ng th�i 3 lo�i c�ng ��c b� h�y b�. Ph�ng ��c ��c bi�t: Khi b�n th�n c� ph�ng ��c ho�c ph�ng ��c ��c bi�t, n�u b� k� ��ch t�n c�ng, c�ng k�ch ho�t m�nh m� h�n thu�c t�nh ph�ng ng� c�a b�n th�n, ��ng th�i 3 lo�i c�ng ��c b� h�y b�.",5,". Ph�n lo�i C� thu�t/gushufenlei",". Nu�i c� m�u v� ch� ��c/gumuweiyang",". Kh�ng ch� ��c/tunshi","Tr��c/gushu","��ng/no")
end

function shiwu()
	Say("<color=green>Th�c �n l� nh�ng v�t ph�m c� th� nu�i d��ng c� m�u<color>: Ph�n l�n v�t ph�m ��u l�m th�c �n nu�i c� m�u v� chuy�n bi�n n�ng l�c c�a n�. V�t ph�m c�ng hi�m c� c�ng cao c�p, c�ng c� nhi�u �nh h��ng t�t ��n n�ng l�c c�a c� m�u. K� n�ng D��ng c� m�t thu�t c� th� ch� bi�n nhi�u lo�i th�c �n ��c bi�t.",6,". Tu�i th�/shouming",". ��i/jie",". B�n t�nh ch�t ��c, Huy�t, Linh, Ma/duxuelingmo",". X�ng hi�u/chenghao","Tr��c/gumu","��ng/no")
end

function shouming()
	Say("<color=green>Tu�i th� l� sinh l�c c�a c� m�u<color>: M�i l�n s�n sinh s�u ��c, c�n c� v�o ch�ng lo�i c�a s�u ��c nh� �� kh�u tr� tu�i th� nh�t ��nh c�a c� m�u. Khi tr� tu�i th� c�a c� m�u b�ng 0, c� m�u s� ch�t. Cho �n th�c �n ��c ��nh c� th� t�ng th�m tu�i th� cho c� m�u. K� n�ng D��ng c� m�t thu�t c� th� ch� bi�n th�c �n d�ng �� t�ng th�m tu�i th� cho c� m�u. N�ng l�c c�a c� m�u c�ng m�nh ph�i �n lo�i th�c �n t��ng �ng.",6,". Th�c �n/shiwu",". ��i/jie",". B�n t�nh ch�t ��c, Huy�t, Linh, Ma/duxuelingmo",". X�ng hi�u/chenghao","Tr��c/gumu","��ng/no")
end

function jie()
	Say("<color=green>��i l� s�c s�ng c�a c� m�u<color>: M�i l�n s�n sinh s�u ��c, c�n c� v�o ch�ng lo�i c�a s�u ��c nh� �� kh�u tr� tr� s�c s�ng nh�t ��nh c�a c� m�u. Qua m�t th�i gian nh�t ��nh c�ng s� kh�u tr� tr� s�c s�ng nh�t ��nh. Khi tr� s�c s�ng gi�m xu�ng, d�n ��n t�c �� s�n sinh s�u ��c c�a c� m�u ch�m d�n. Khi tr� s�c s�ng qu� th�p, tu�i th� c�ng gi�m d�n theo cho ��n khi c� m�u ch�t. Ph�n l�n th�c �n ��u t�ng th�m tr� s�c s�ng cho c� m�u.",6,". Th�c �n/shiwu",". Tu�i th�/shouming",". B�n t�nh ch�t ��c, Huy�t, Linh, Ma/duxuelingmo",". X�ng hi�u/chenghao","Tr��c/gumu","��ng/no")
end

function duxuelingmo()
	Say("<color>B�n t�nh ch�t ��c huy�t linh ma ph�n �nh n�ng l�c c�a c� m�u. Ch�ng ��u c� tr� t�i �a v� tr� hi�n t�i. Tr� t�i �a c�a ��c huy�t linh ma: Bi�u th� n�ng l�c s�n sinh hi�n t�i c�a c� m�u. Tr� t�i �a c�ng l�n s� sinh ra s�u ��c nh� c�ng t�t. Tr� hi�n t�i c�a ��c huy�t linh ma n�i l�n s� kh�c bi�t c�a s�u ��c do c� m�u s�n sinh ra. Tr� hi�n t�i lu�n � m�c 100, bi�u th� t�ng x�c su�t khi c� m�u sinh s�u ��c. Tr� hi�n t�i c�a m�i t�nh ch�t trong �� bi�u th� x�c su�t sinh ra s�u ��c mang t�nh ch�t n�y.",6,". Th�c �n/shiwu",". Tu�i th�/shouming",". ��i/jie",". X�ng hi�u/chenghao","Tr��c/gumu","��ng/no")
end

function chenghao()
	Say("<color> X�ng hi�u l� ti�u ch� ��nh gi� c� m�u m�nh y�u v� tr�ng th�i hi�n t�i. C� m�u x�ng hi�u kh�c nhau h�nh d�ng c�ng kh�c nhau. X�ng hi�u do tu�i th� quy�t ��nh: Tu�i th� c�a c� m�u quy�t ��nh x�ng hi�u, v� nh� s�c kh�e, m�nh m�...ph�n �nh ���c sinh l�c c�a c� m�u. X�ng hi�u do tr� t�i �a 4 t�nh ch�t quy�t ��nh: Tr� l�n nh�t c�a 4 t�nh ch�t ��c, huy�t, linh, ma quy�t ��nh x�ng hi�u, ph�n �nh n�ng l�c s�n sinh hi�n t�i c�a c� m�u.",6,". Th�c �n/shiwu",". Tu�i th�/shouming",". ��i/jie",". B�n t�nh ch�t ��c, Huy�t, Linh, Ma/duxuelingmo","Tr��c/gumu","��ng/no")
end

function gufenlei()
	Say("<color> C�n c� theo 4 t�nh ch�t c�a c� m�u, s�u ��c c�ng chia th�nh 4 lo�i t�nh ch�t ��c huy�t linh ma. C� lo�i s�u ��c ��c bi�t kh�ng thu�c t�nh ch�t n�o �� phun C� thu�t c� b�n nh� k� n�ng Phong ��c.",3,". �i�u ki�n s�n sinh s�u ��c/shengchantiaojian","Tr��c/gu","��ng/no")
end

function shengchantiaojian()
	Say("<color> �i�u ki�n s�n sinh s�u ��c c�n y�u c�u m�c t�i thi�u v� n�ng l�c 4 t�nh ch�t c�a c� m�u. V� d�: S�u ��c m�nh c�n n�ng l�c 4 t�nh ch�t c�a c� m�u l�: ��c t�nh 65, Huy�t t�nh 35, Linh t�nh 35 v� Ma t�nh 35. N�u th�p h�n m�c n�y, c� m�u kh�ng th� s�n sinh ra s�u ��c m�nh.",3,". Ph�n lo�i/gufenlei","Tr��c/gu","��ng/no")
end

function no()
end