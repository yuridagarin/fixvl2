--by liubo
--2012��3�¹��ʸ�Ů�ڻ

Include("\\script\\lib\\globalfunctions.lua")

AcitivityID = 56;
AwardTB = {2,1,30360,"V�i l�a cao c�p","Hoat dong thang 3 nam 2012 "};

--��ɽÿ�������ý���
function get_award_liangshan_funvjie(nNum)
	--�Ƿ�����ж�
	if gf_CheckEventDateEx(AcitivityID) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0
  end
	gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],50},AwardTB[4],AwardTB[5],"L��ng S�n v��t �i nhi�m v� h�ng ng�y",0,1)
end
--��ɽ�������屦���ý���
function get_award_juyibox_funvjie()
	if gf_CheckEventDateEx(AcitivityID) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0
  end
	gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],10},AwardTB[4],AwardTB[5],"L��ng S�n T� Ngh�a B�o R��ng",0,1)
end

--�μ�һ��������
function get_award_tianmenzhen_funvjie(nType)
	--�Ƿ�����ж�
	if gf_CheckEventDateEx(AcitivityID) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0
  end
	if nType == 1 then
		gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],50},AwardTB[4],AwardTB[5],"Thi�n M�n tr�n",0,1)
	elseif nType == 2 then
		gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],100},AwardTB[4],AwardTB[5],"Thi�n M�n tr�n",0,1)
	elseif nType == 3 then
		gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],300},AwardTB[4],AwardTB[5],"Thi�n M�n tr�n",0,1)
	else
		gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],30},AwardTB[4],AwardTB[5],"Thi�n M�n tr�n",0,1)
	end
end

------------------------------------------------
function ServerStartUp()

end
function PlayerLogin()

end
