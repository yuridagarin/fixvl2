Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if GetItemCount(2, 0, 30065) > 0 and GetTask(3133) == 0 then
		--������ʦ��������û����ɹ�����
		Talk(1, "", "<color=yellow>Th�ch Tr�: <color> ng��i �� s� d�ng Thi�n S� Ph�, th�ch tr� n�y �� ���c k�ch ho�t.");
		SetTask(3133, 1);
		SetCurrentNpcSFX(GetTargetNpc(), 921, 1, 0, 18 *3);
		TaskTip("�� m� Th�ch Tr� v� phong �n H� Y�u, v� t�m M� B�t Ti�n");
		Msg2Player("�� m� Th�ch Tr� v� phong �n H� Y�u, v� t�m M� B�t Ti�n");
		return 0;
	end
	Talk(1,"","D�n Thi�n S� Ph� l�n m�i c� th� k�ch ho�t Th�ch Tr�, m� Thi�n Nguy�n Ph�p Tr�n, phong �n Y�u H�");
end
