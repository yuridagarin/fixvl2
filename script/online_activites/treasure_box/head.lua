--by liubo
--�Ƹ�����
Include("\\script\\lib\\globalfunctions.lua")

--��ľ�佱���ӿ�
--�ɹ�����1��ʧ�ܷ���0
--ʹ��ǰ�жϱ����ռ�
function get_award_woodenbox()
	if gf_CheckEventDateEx(46) == 1 then
		if gf_AddItemEx2({2,1,30340,1},"M�c R��ng","Th�n T�i B�o R��ng","",0,1) ~= 1 then
			return 0
		end
  		gf_WriteLogEx("Than Tai Bao Ruong", "��i th�nh c�ng", 1, "M�c r��ng online") 		
		return 1
	end
	return 0
end