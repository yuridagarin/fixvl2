Include("\\script\\lib\\globalfunctions.lua")

BIRTHDAY2010_LOG_TITLE = "Sinh Nhat VL2 2010"

szNpcName = "<color=green>S� Gi� S� Ki�n :<color>"

function main()
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 110102 then
		Talk(1, "", szNpcName.."�� h�t h�n nh�n th��ng, h�n g�p l�i ��i hi�p v�o d�p kh�c!")
		return
	end
	local tSay = {}
	local szHeader = szNpcName.."Ch�c m�ng sinh nh�t V� L�m Truy�n K� 2. Ho�t ��ng m�ng sinh nh�t n�m nay di�n ra t� ng�y <color=red>3/12/2010<color> ��n h�t ng�y <color=red>2/1/2011<color>."
	
	tinsert(tSay, "Nh�n th��ng may m�n m�ng sinh nh�t V� L�m Truy�n K� 2/receive_birthday_award_2010")
	tinsert(tSay, "T�i h� s� quay l�i sau/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function receive_birthday_award_2010()
	if gf_GetTaskBit(TSK_BIRTHDAY_AWARD, 1)  == 1 then
		Talk(1, "", szNpcName.."C�c h� �� nh�n ph�n th��ng n�y r�i, ch� ���c ph�p nh�n 1 l�n duy nh�t!")
		return
	end
	
	if GetExtPoint(6) ~= 1 then
		Talk(1, "", szNpcName.."C�c h� kh�ng c� m� nh�n th��ng, sao l�i ��n t�m ta!")
		return
	end
	
	if GetExtPoint(6) == 1 then
		local nRand = random(1, 10000)
		if nRand <= 9835 then
			gf_AddItemEx2({2,1,1009,1}, "Thi�n Th�ch Tinh Th�ch", BIRTHDAY2010_LOG_TITLE, "nh�n th��ng")
			Msg2SubWorld("Ch�c m�ng nh�n s� "..GetName().." �� nh�n ���c ph�n th��ng 1 Thi�n Th�ch Tinh Th�ch m�ng sinh nh�t VLTK II tr�n 3 tu�i!")
		elseif nRand <= 9985 then
			gf_AddItemEx2({2,1,1068,1,4}, "Thi�n Th�ch Linh Th�ch", BIRTHDAY2010_LOG_TITLE, "nh�n th��ng", 7 * 24 * 3600)
			Msg2SubWorld("Ch�c m�ng nh�n s� "..GetName().." �� nh�n ���c ph�n th��ng 1Thi�n Th�ch Linh Th�ch m�ng sinh nh�t VLTK II tr�n 3 tu�i!")
		else
			gf_AddItemEx2({2,1,1067,1,4}, "��nh H�n Thi�n Th�ch Th�n Th�ch", BIRTHDAY2010_LOG_TITLE, "nh�n th��ng", 7 * 24 * 3600)
			Msg2SubWorld("Ch�c m�ng nh�n s� "..GetName().." �� nh�n ���c ph�n th��ng 1 ��nh H�n Thi�n Th�ch Th�n Th�ch m�ng sinh nh�t VLTK II tr�n 3 tu�i!")
		end
		AddExtPoint(6, 1)
		gf_SetTaskBit(TSK_BIRTHDAY_AWARD, 1)
	end
end

function do_nothing()
end