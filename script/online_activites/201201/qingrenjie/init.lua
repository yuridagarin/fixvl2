--by liubo
--2012��2�����˽ڻ

Include("\\script\\lib\\globalfunctions.lua")

EVENT_LOG_TITLE = "Hoat dong thang 2 nam 2012"
--��ɽÿ�������ý���
function get_award_liangshan_qingrenjie(nNum)
	--�Ƿ�����ж�
	if gf_CheckEventDateEx(55) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0
  end
	gf_AddItemEx2({2,1,30357,50},"Qu� Ca Cao",EVENT_LOG_TITLE,"L��ng S�n v��t �i nhi�m v� h�ng ng�y",0,1)
end
--��ɽ�������屦���ý���
function get_award_juyibox_qingrenjie()
	if gf_CheckEventDateEx(55) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0
  end
	gf_AddItemEx2({2,1,30357,10},"Qu� Ca Cao",EVENT_LOG_TITLE,"L��ng S�n T� Ngh�a B�o R��ng",0,1)
end

--�μ�һ��������
function get_award_tianmenzhen_qingrenjie(nType)
	--�Ƿ�����ж�
	if gf_CheckEventDateEx(55) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0
  end
	if nType == 1 then
		gf_AddItemEx2({2,1,30357,50},"Qu� Ca Cao",EVENT_LOG_TITLE,"Thi�n M�n tr�n",0,1)
	elseif nType == 2 then
		gf_AddItemEx2({2,1,30357,100},"Qu� Ca Cao",EVENT_LOG_TITLE,"Thi�n M�n tr�n",0,1)
	elseif nType == 3 then
		gf_AddItemEx2({2,1,30357,300},"Qu� Ca Cao",EVENT_LOG_TITLE,"Thi�n M�n tr�n",0,1)
	else
		gf_AddItemEx2({2,1,30357,30},"Qu� Ca Cao",EVENT_LOG_TITLE,"Thi�n M�n tr�n",0,1)
	end
end

------------------------------------------------
function ServerStartUp()

end
function PlayerLogin()

end
