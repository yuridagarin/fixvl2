--by liubo
--2011��12��ʥ�������

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2011_11\\string.lua")
--externs taskid
--��¼�����������ӵ�����
VET_201112_PLANTTREES_TASKID = 2135

--��ɽÿ�������ý���
function get_award_liangshan(nNum)
	--�Ƿ�����ж�
	if gf_CheckEventDateEx(48) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        Talk(1,"",tSTRING_201111_TABLE[3])
		return 0
    end
	gf_AddItemEx2({2,1,30347,50},"K�o Que","Hoat dong thang 12 nam 2011","L��ng S�n v��t �i nhi�m v� h�ng ng�y",0,1)
end
--��ɽ�������屦���ý���
function get_award_juyibox()
	if gf_CheckEventDateEx(48) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        Talk(1,"",tSTRING_201111_TABLE[3])
		return 0
    end
	gf_AddItemEx2({2,1,30347,10},"K�o Que","Hoat dong thang 12 nam 2011","L��ng S�n T� Ngh�a B�o R��ng",0,1)
end

--����һ������
-- function get_award_planttrees()
	--�Ƿ�����ж�
	-- if gf_CheckEventDateEx(48) ~= 1 then
		-- return 0
	-- end
	-- if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        -- Talk(1,"",tSTRING_201111_TABLE[3])
		-- return 0
    -- end
	-- local nNum = GetTask(VET_201112_PLANTTREES_TASKID)
	-- if nNum > 0 and nNum <= 6 then
		-- gf_AddItemEx2({2,1,30347,5},"�ǹ�","2011��12��ʥ���ڻ","����",0,1)
	-- elseif nNum > 6 and nNum <= 12 then
		-- gf_AddItemEx2({2,1,30347,15},"�ǹ�","2011��12��ʥ���ڻ","����",0,1)
	-- elseif nNum > 12 and nNum <= 24 then
		-- gf_AddItemEx2({2,1,30347,25},"�ǹ�","2011��12��ʥ���ڻ","����",0,1)
	-- end
-- end

--�μ�һ��������
function get_award_tianmenzhen(nType)
	--�Ƿ�����ж�
	if gf_CheckEventDateEx(48) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        Talk(1,"",tSTRING_201111_TABLE[3])
		return 0
    end
	if nType == 1 then
		gf_AddItemEx2({2,1,30347,50},"K�o Que","Event noel n�m 2011","Thi�n M�n tr�n",0,1)
	elseif nType == 2 then
		gf_AddItemEx2({2,1,30347,100},"K�o Que","Event noel n�m 2011","Thi�n M�n tr�n",0,1)
	elseif nType == 3 then
		gf_AddItemEx2({2,1,30347,300},"K�o Que","Event noel n�m 2011","Thi�n M�n tr�n",0,1)
	else
		gf_AddItemEx2({2,1,30347,30},"K�o Que","Event noel n�m 2011","Thi�n M�n tr�n",0,1)
	end
end

------------------------------------------------
function ServerStartUp()

end
function PlayerLogin()

end
