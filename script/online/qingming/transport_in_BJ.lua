--File name:transport_in_BJ.lua
--Describe:ɨĹ�����ˣ�������
--Create Date:2006-3-16
--Author:yanjun
--�޸ļ�¼���峤��2007��3��13�ս�����2007�������ڻ���޸�
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
EnterPointTab = {									--��¼������ͼ�Ľ������ꡣ
			[1] = {818,1636,3181},					--Ȫ��
			[2] = {820,1636,3181},					--�꾩
			[3] = {819,1636,3181},					--�ɶ�
			}
--================================������ȫ�ֱ���=======================================

--================================������ȫ�ֱ���========================================
function main()
	if tomb_sweep_2007_date_chk() == -1 then
		Talk(1,"","Thanh minh s�p ��n, h�y gi�nh ch�t th�i gian �� c�ng t� ti�n.");
	elseif tomb_sweep_2007_date_chk() == 0 then
		Talk(1,"","Ti�t thanh minh �� qua,"..Zgc_pub_sex_name().."nh� n�m sau ��n c�ng t� t� ti�n.");
	else
		local selTab = {
					"��n c�ng b�i m� H�n ��i hi�p./#gotocemetery(2)",
					"Nh�n 1 quy�n ch� nam ho�t ��ng Ti�t Thanh Minh./#AddItem(2,0,685,1)",
					"Ho�t ��ng Ti�t Thanh Minh./knowdetail",
					"H�y quay l�i c�ng t� sau nh�!/nothing",
					}
		Say("<color> Trong ti�t Thanh minh, "..Zgc_pub_sex_name().."c� mu�n ��n m� ph�n c�a <color=red>H�n ��i hi�p<color> b�i t� b�y t� th�nh � kh�ng?",getn(selTab),selTab);
	end;
end;

--������ҵ���ͬ��Ĺ԰
function gotocemetery(MapIndex)
	if GetLevel() < 11 then
		Say("Ng��i v� luy�n ��n <color=yellow>c�p 11<color> m�i ��n ��y t�m ta.",0);
		return FALSE;
	end
	NewWorld(EnterPointTab[MapIndex][1],EnterPointTab[MapIndex][2],EnterPointTab[MapIndex][3]);
end;
function knowdetail()
	Talk(4,"","Ho�t ��ng Ti�t Thanh Minh di�n ra v�o <color=yellow>30/3 - 8/4<color>, ng��i ch�i <color=yellow>c�p 11<color> ��u c� th� tham gia b�ng c�ch �i t�o m� c�c ��i hi�p.",
				"C�ng b�i m� ph�n c�c v� nh� <color=yellow>Chu ��i hi�p, H�n ��i hi�p, Hi�n Vi�n ��i hi�p<color>. Th�i gian di�n ra ho�t ��ng ch� c�n c�ng b�i b�t k� m� ph�n c�a m�t v� ��i hi�p b�ng c�ch <color=yellow>v�i l�y<color> l� ���c.",
				"Do"..Zgc_pub_sex_name().."th�nh t�m c�ng b�i nh�n ���c m�t �� nhi�m v� c�a th� l�ng nh�n, l�m xong ��n <color=yellow>th� l�ng nh�n<color> nh�n th��ng.",
				"<color=green>H�n gia nh�n: M�t �� Thanh Minh<color> ghi l�i m�i ng�y ch� l�m ���c <color=yellow>1<color> l�n, nh�ng c� th� d�ng <color=yellow>gi�y c�ng t�<color> t�ng s� l�n ho�n th�nh nhi�m v�, <color=yellow>gi�y c�ng t�<color> m�i ng�y ch� d�ng ���c <color=yellow>2<color> l�n!")
end
