--������Ƭʹ�ýű�
Include("\\script\\lib\\globalfunctions.lua")

TMSP_NUM_NEED = 200;--����������Ƭ����

function TMSP_OnUse(nItem)
	Say("M�nh Thi�n M�n ���c r�i ra t� Boss Th�ng Thi�n Huy�n C�nh, c� th� gh�p th�nh Thi�n M�n Kim L�nh.",2,format("%d M�nh Thi�n M�n gh�p th�nh 1 Thi�n M�n Kim L�nh/combine_TMGL",TMSP_NUM_NEED),"Ra kh�i/nothing");
end

function combine_TMGL()
	--�жϱ����ռ�
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
     return 0;
	end
	if GetItemCount(2,1,30410) < TMSP_NUM_NEED then
		Talk(1,"",format("S� l��ng M�nh Thi�n M�n kh�ng ��<color>%d<color>",TMSP_NUM_NEED));
		return 0;
	end
	if DelItem(2,1,30410,TMSP_NUM_NEED) == 1 then
		gf_AddItemEx2({2,1,30370,1}, "Thi�n M�n Kim L�nh", "Gh�p M�nh Thi�n M�n th�nh Thi�n M�n Kim L�nh", "M�nh Thi�n M�n", 0, 1);
		AddRuntimeStat(14, 2, 0, 1)
	end
	return 1;
end