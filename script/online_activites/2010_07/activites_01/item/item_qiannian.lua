--=============================================
--create by zhangming 2010.6.18
--describe:Խ�ϰ�2010��7�»1 ��������һǧ��ű��ļ�
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--�ͷ�ļ�
Include("\\script\\online\\viet_event\\vng_task_control.lua");

g_szItemSayHead = gf_FixColor(VET_201007_01_TB_ITEM_LIST[15][1], 2, 1);

tb_list_1000_chat = 
{
	[1] = "Ch� c�n %d ng�y n�a l� ��n k� ni�m 1000 n�m Th�ng Long r�i!",
	[2] = "��i L� m�ng 1000 n�m Th�ng Long c�n %d ng�y n�a s� di�n ra!",
	[3] = "%d ng�y n�a l� ��i L� 1000 n�m Th�ng Long, c�ng ��t ph�o hoa n�o!",
	[4] = "C�n %d ng�y n�a th�i, ch� ��i l� h�nh ph�c!",
	[5] = "Ch�c c�c b�n 1 ng�y l� vui v�!",
	[6] = "K� ni�m 1000 n�m Th�ng Long ch�ng ta �i ch�i n�o!",
	[7] = "Ch�c m�ng ��i L� k� ni�m 1000 n�m Th�ng Long!",
}

function OnUse(nItemIdx)
	if tonumber(date("%y%m%d")) > 101024 then
		return
	end
	if GetLevel() < 77 or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
            Talk(1,"","Ch� c� nh�n v�t ��ng c�p 77 tr� l�n, �� gia nh�p m�n ph�i v� th�ng th�o k� n�ng c�p 55 m�i c� th� s� d�ng v�t ph�m n�y!")
            return
     end
--	X�c ��nh ng�y th�ng s� d�ng v� s� l�n s� d�ng item
    local nCount = mod(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM), 100)
--    local nReceive = mod(floor(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM) / 100), 100)
    local nUseDate = floor(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM) / 10000)
    
    local nCurDate = tonumber(date("%m%d"))
    if nCurDate ~= nUseDate then
    		SetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM, nCurDate * 10000)
    end
    if nCount >= 40 then
        Talk(1,"","M�i ng�y ch� c� th� s� d�ng t�i �a 40 l�n!")
        return
    end
    local nDelay = 30 - (GetTime() - GetTask(VET_1000_THANGLONG_TIME))
    if nDelay >= 0 then
    	   Talk(1,"",format("C�n %d gi�y n�a m�i c� th� ti�p t�c s� d�ng", nDelay))
        return
    end
    local nHour = tonumber(date("%H%M"))
    if (nHour >= 0900 and nHour <= 1000) or (nHour >= 1530 and nHour <= 1630) or (nHour >= 2030 and nHour <= 2130) then  
	    if DelItemByIndex(nItemIdx, 1) == 1 then
	        DoFireworks(871, 1)
	    	   local nExp = 200000
	        SetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM,GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM)+1)
	        if tonumber(date("%y%m%d")) == 101010 then
	        		nExp = 400000
	        end
	        if tonumber(date("%y%m%d")) < 101010 then
	        local nDes = 10
	        	if tonumber(date("%m")) == 9 then
	        		nDes = nDes + 30
	        	end
	        	local nDay = nDes - tonumber(date("%d"))
	        	NpcChat(PIdx2NpcIdx(), format(tb_list_1000_chat[random(1,4)], nDay))
	        else
	        	NpcChat(PIdx2NpcIdx(), tb_list_1000_chat[random(5,7)])
	        end
	        VET_201007_01_get_exp(nExp)
	        Msg2Player("Nh�n ���c "..nExp.." �i�m kinh nghi�m.")
	        SetTask(VET_1000_THANGLONG_TIME, GetTime())
	        StartTimeGuage("1000 n�m Th�ng Long", 30,0,1)
	        gf_WriteLogEx("Hoat dong thang 9 nam 2010", "S� d�ng 1000 n�m Th�ng Long nh�n "..nExp.." �i�m kinh nghi�m")
	    end
	else
		Talk(1,"","Ch� c� th� s� d�ng v�t ph�m n�y trong kho�ng th�i gian t� 9 gi� ��n 10 gi�, 15 gi� 30 ��n 16 gi� 30, 20 gi� 30 ��n 21 gi� 30.")
		return
	end
end

function get_1000_tl()
    local nUseDate = floor(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM) / 10000)
    local nCurDate = tonumber(date("%m%d"))
    if nCurDate ~= nUseDate then
    		SetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM, nCurDate * 10000)
    end
    if gf_Judge_Room_Weight(2, 2," ") ~= 1 then
        	return
    end
    local nReceive = floor(mod(GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM), 1000)/100)
    if GetLevel() < 77 or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
            Talk(1,"","Ch� c� nh�n v�t ��ng c�p 77 tr� l�n, �� gia nh�p m�n ph�i v� th�ng th�o k� n�ng c�p 55 m�i c� th� nh�n v�t ph�m n�y!")
            return
     end
    if nReceive >= 1 then
    	   Talk(1,"","M�i ng�y ch� c� th� nh�n v�t ph�m n�y 1 l�n!")
        return
    end
    gf_AddItemEx2({2,1,30219,40}, "K� Ni�m 1000 n�m Th�ng Long", "Hoat dong thang 9 nam 2010", "nh�n")
    SetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM, GetTask(VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM) + 100)
end