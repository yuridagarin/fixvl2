-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII δ��������нű��ļ�                  
-- Edited by starry night                                 
-- 2006/05/11 AM 20:15                                    
                                                          
-- ======================================================

Include("\\script\\item\\weapon_kaifeng_head.lua");

function OnUse()

	Say("<color=yellow>Th�n H�nh<color> n�y hi�n <color=yellow>ch�a gi�m ��nh<color>, c� th� d�ng v�t li�u ��c th� �� k�ch ho�t n�. B�n mu�n ch�n c�ch k�ch ho�t n�o sau ��y?",
	7,
	"K�ch ho�t th�ng th��ng (c�n 1 l��ng v�ng, 1 Thi�n th�ch v� 3 t�m Gi�m ��nh ph� c�p 7)/#Weapon_Kaifeng(1,1,9)",
	"K�ch ho�t k� (c�n 20 l��ng v�ng, 5 Thi�n th�ch v� 5 t�m Gi�m ��nh ph� c�p 7)/#Weapon_Kaifeng(2,1,9)",
	"K�ch Ho�t cao c�p? (c�n 200 l��ng v�ng, 10 thi�n th�ch, 10 gi�m ��nh ph� c�p 7, 1 t� m�t t�ch)/#Weapon_Kaifeng(3,1,9)",
	"K�ch ho�t th�ng th��ng? (c�n 2 B�n Long B�ch)/#Weapon_Kaifeng_Ex(1,1,9)",
	"K�ch ho�t k�? (c�n 4 B�n Long B�ch)/#Weapon_Kaifeng_Ex(2,1,9)",
	"K�ch ho�t cao c�? (c�n 1 T�y T�y ��n)/#Weapon_Kaifeng_Ex(3,1,9)",
	"T�m th�i kh�ng k�ch ho�t/nothing"
	)

end

function nothing()

end