--by liubo
--2012�괺�ڻ

Include("\\script\\lib\\globalfunctions.lua")

--��ɽÿ�������ý���
function get_award_liangshan_chunjie(nNum)
	--�Ƿ�����ж�
	if VietCheckEventDate() ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0
  end
	gf_AddItemEx2({2,1,30353,50},"��ng ti�n may m�n","Hoat dong thang 1 nam 2012","L��ng S�n v��t �i nhi�m v� h�ng ng�y",0,1)
end
--��ɽ�������屦���ý���
function get_award_juyibox_chunjie()
	if VietCheckEventDate() ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0
  end
	gf_AddItemEx2({2,1,30353,10},"��ng ti�n may m�n","Hoat dong thang 1 nam 2012","L��ng S�n T� Ngh�a B�o R��ng",0,1)
end

--�μ�һ��������
function get_award_tianmenzhen_chunjie(nType)
	--�Ƿ�����ж�
	if VietCheckEventDate() ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0
  end
	if nType == 1 then
		gf_AddItemEx2({2,1,30353,50},"��ng ti�n may m�n","Hoat dong thang 1 nam 2012","Thi�n M�n tr�n",0,1)
	elseif nType == 2 then
		gf_AddItemEx2({2,1,30353,100},"��ng ti�n may m�n","Hoat dong thang 1 nam 2012","Thi�n M�n tr�n",0,1)
	elseif nType == 3 then
		gf_AddItemEx2({2,1,30353,300},"��ng ti�n may m�n","Hoat dong thang 1 nam 2012","Thi�n M�n tr�n",0,1)
	else
		gf_AddItemEx2({2,1,30353,30},"��ng ti�n may m�n","Hoat dong thang 1 nam 2012","Thi�n M�n tr�n",0,1)
	end
end

------------------------------------------------
function ServerStartUp()

end
function PlayerLogin()

end
