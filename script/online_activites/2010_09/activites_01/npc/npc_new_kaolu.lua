--=============================================
--create by zhangming 2010.8.20
--describe:Խ�ϰ�2010��9������ ��¯�ű��ļ�
--=============================================

Include("\\script\\online_activites\\task_values.lua");--�������ͷ�ļ�
Include("\\script\\online_activites\\2010_09\\activites_01\\strings.lua");--��ַ���
Include("\\script\\lib\\globalfunctions.lua");--���������ļ�

function main()
    local nNpcIndex = GetTargetNpc()
    local nPersonalNpcIndex = GetTask(VET_201009_01_TASK_FLAG_KAOLU)
    if nNpcIndex ~= nPersonalNpcIndex then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[16])
        return
    end
    
    local nLastTime = GetTask(VET_201009_01_TASK_KAOLU_TIME) 
    local nTimeNow = GetTime()
    if nTimeNow - nLastTime < 30 then
    		local nDiff = 30 - (nTimeNow - nLastTime)
    		Talk(1,"","C�n "..nDiff.." gi�y n�a m�i c� th� l�y b�nh ra kh�i l�!")
    		return
    end
    Say("B�nh �� ch�n v�a ��, mau l�y ra k�o kh�t b�nh!",2,format("Mau l�y b�nh/#get_cake(%d)",nNpcIndex),"T�m th�i ch�a l�y/gf_DoNothing")
end


function get_cake(nNpcIndex)
	SetNpcScript(nNpcIndex,"")
	SetNpcLifeTime(nNpcIndex, 0)
	local nPersonalNpcIndex = GetTask(VET_201009_01_TASK_FLAG_KAOLU)
    	if nNpcIndex ~= nPersonalNpcIndex then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[16])
        return
    	end	
    	AddUnitStates(nNpcIndex, 6, 1)
    	SetTask(VET_201009_01_TAKS_TIME_LAST_KAOLU,0)
	gf_AddItemEx2({2, 1,30237, 20},VET_201009_01_TB_ITEM_LIST[1][1],VET_201009_01_STR_LOG_TITLE, "nh�n b�nh Th� con n��ng b�nh",0,1)
end