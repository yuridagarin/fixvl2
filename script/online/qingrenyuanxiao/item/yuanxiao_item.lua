--filename:yuanxiao_item.lua
--create date:2006-01-25
--author:yanjun
--describe:Ԫ�����߽ű�
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\class\\ktabfile.lua")

tabLVEXP = new(KTabFile, "\\settings\\huodong_exp.txt");

function OnUse()
	local selTab = {
				"��ng �/ok",
				"Ta ch�a mu�n �n./cancel"
				}
	local yxleft = 10 - GetByte(GetTask(TASK_USEYUANXIAO),2)
	if yxleft <= 0 then
		Say("B�n �� �n 10 b�nh Chi Ma H��ng, kh�ng th� �n n�a.",0)
		return 0
	end
	Say("B�n �� �n <color=yellow>"..GetByte(GetTask(TASK_USEYUANXIAO),2).."<color> b�nh Chi Ma H��ng, c�n c� th� �n <color=yellow>"..yxleft.."<color> c�i",2,selTab)
end

function ok()
	local nDay = tonumber(date("%d"))
	if GetByte(GetTask(TASK_USEYUANXIAO),1) ~= nDay then
		SetTask(TASK_USEYUANXIAO,SetByte(GetTask(TASK_USEYUANXIAO),1,0))
	end
	if GetByte(GetTask(TASK_USEYUANXIAO),1) == 0 then
		if DelItem(2,1,332,1) == 1 then
			if GetLevel() < 10 then 
				Say("Ng��i ch�i ch�a ��t ��n c�p 10 kh�ng th� s� d�ng v�t ph�m n�y.",0)
				return 0 
			end
			local nExp = 0
			local nRow = 0
			nRow = tonumber(tabLVEXP:selectRowNum("lv",GetLevel()))
			nExp = tonumber(tabLVEXP:getCell(nRow,"exp"))
			ModifyExp(nExp)
			Msg2Player("B�n �� �n Chi Ma H��ng, t�ng tr� kinh nghi�m"..nExp)
			SetTask(TASK_USEYUANXIAO,SetByte(GetTask(TASK_USEYUANXIAO),1,nDay))
			SetTask(TASK_USEYUANXIAO,SetByte(GetTask(TASK_USEYUANXIAO),2,GetByte(GetTask(TASK_USEYUANXIAO),2)+1))
			WriteLog("[Ho�t ��ng l� t�nh nh�n v� t�t nguy�n ti�u (�n b�nh nguy�n ti�u)]:"..GetName().."�n 1 b�nh nguy�n ti�u.")
		end
	else
		Say("H�m nay b�n �� �n qu� b�nh nguy�n ti�u r�i.",0)
	end	
end

function cancel()

end