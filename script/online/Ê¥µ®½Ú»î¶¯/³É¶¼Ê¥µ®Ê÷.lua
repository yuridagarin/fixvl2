--=============================================
--create by yanjun 2005.12.12
--describe:成都圣诞树(职能NPC)脚本
--=============================================
Include("\\script\\online\\圣诞节活动\\christmas_head.lua")

function main()
	if GetTrigger(3000) == 0 then
		if GetCurMonth() == 12 and GetCurDate() > 28 then
			Say("Ho箃 ng Gi竛g Sinh  k誸 th骳!",0)
			return 0
		end
		Say("Ho箃 ng Gi竛g Sinh v蒼 ch璦 m?. Th阨 gian ch輓h th鴆 l?: <color=yellow>t? 23/11 n 28/12<color>.",0)
		return 0
	end
	SelTab = {
		"Ta mu鑞 nh薾 qu?./get_present",
		"Ta ch? n xem th玦./no",
		}
	Say("Gi竛g Sinh vui v?! Trc khi nh薾 qu? h穣 ki觤 tra kho秐g tr鑞g trong h祅h trang,  tr竛h nh鱪g t鎛 th蕋 kh玭g ng c?!",2,SelTab);
end

function get_present()
	if CHRISTMAS_SWITCH == 0 then
		Say("C﹜ th玭g v蒼 ch璦 treo qu?, ho箃 ng Gi竛g Sinh v蒼 ch璦 b総 u!",0)
		return 0;
	end
	if GetLevel() < 10 then
		Say("Xin l鏸! Qu? kh竎h ch璦 t n c蕄 <color=red>10<color> ch璦 th? nh薾 qu?.",0)
		return 0
	end
	if GetTask(TASK_GOT_DATE) ~= GetCurDate() then	--如果不是同一天，则已领取标记清0
		SetTask(TASK_GOT_PRESENT,0)
	end
	if(GetTask(TASK_GOT_PRESENT) == 0) then --之前没有领过
		local nHour,nMin = GetLocalTime()
		if (nHour == 21 and nMin >= 2) or (GetLocalTime() == 23) then --晚上九点或十一点
			give_present()
		else
			Say("H穣 i n <color=yellow>21h v? 23h<color> m韎 c? th? nh薾 qu?",0)
		end
	else
		Say("H玬 nay b筺  nh薾 頲 qu?, kh玭g th? nh薾 n鱝.",0)
	end
end

function no()

end

function give_present()
	local nPresentRemain = GetGlbValue(ID_PRESENT_NUMBER_CD)
	local nEmpty = 0
	if(nPresentRemain > 0) then
		local nTemp = random(1,100)
		local nRetCode = 0
		local nBody = GetBody()
		if nTemp <= 10 then
			nRetCode = AddItem(2,2,8,5,1)	--陨铁5个
		elseif nTemp > 10 and nTemp <= 20 then
			nRetCode = AddItem(2,2,7,10,1)--陨铁碎片10个
		elseif nTemp > 20 and nTemp <= 30 then
			nRetCode = AddItem(2,1,148,5,1)	--小块金犀5个
		elseif nTemp > 30 and nTemp <= 40 then
			nRetCode = AddItem(2,1,209,1,1)	--圣诞礼盒1个
		elseif nTemp > 40 and nTemp <= 50 then
			nRetCode = AddItem(2,1,208,25,1)	--圣诞袜子25个
		elseif nTemp > 50 and nTemp <= 60 then
			nRetCode = AddItem(2,1,210,1,1)	--"贺卡一 1个"
		elseif nTemp > 60 and nTemp <= 70 then
			nRetCode = AddItem(2,1,211,1,1)	--"贺卡二 1个"
		elseif nTemp > 70 and nTemp <= 75 then
			if nBody == 1 then
				nRetCode = AddItem(0,108,109,1,1)	--"圣诞帽子1个"
			elseif nBody == 2 then
				nRetCode = AddItem(0,108,110,1,1)
			elseif nBody == 3 then
				nRetCode = AddItem(0,108,112,1,1)
			elseif nBody == 4 then
				nRetCode = AddItem(0,108,111,1,1)
			end
		elseif nTemp > 75 and nTemp <= 80 then
			if nBody == 1 then
				nRetCode = AddItem(0,109,109,1,1)	--"圣诞上装1个"
			elseif nBody == 2 then
				nRetCode = AddItem(0,109,110,1,1)
			elseif nBody == 3 then
				nRetCode = AddItem(0,109,112,1,1)
			elseif nBody == 4 then
				nRetCode = AddItem(0,109,111,1,1)
			end
		elseif nTemp > 80 and nTemp <= 90 then
			if nBody == 1 then
				nRetCode = AddItem(0,110,73,1,1)	--"圣诞下装1个"
			elseif nBody == 2 then
				nRetCode = AddItem(0,110,74,1,1)
			elseif nBody == 3 then
				nRetCode = AddItem(0,110,76,1,1)
			elseif nBody == 4 then
				nRetCode = AddItem(0,110,75,1,1)
			end
		elseif nTemp > 90 and nTemp <= 100 then --5个随机焰火
			for i=1,5 do			
				local nIndex = random(189,194)
				nRetCode = AddItem(2,1,nIndex,1,1)
				if nRetCode == 0 then
					break
				end
			end
		end		
		if nRetCode == 0 then	--没有成功添加
			--Say("背包里的空间不够，请整理一下背包里面的东西再来领取。",0)
			Say("Nh薾 v藅 ph萴 th蕋 b筰!",0)
			return 0
		else
			Say("B筺  nh薾 頲 1 ph莕 qu?! Th藅 may m緉!",0)
			SetGlbValue(ID_PRESENT_NUMBER_CD,nPresentRemain-1)
			SetTask(TASK_GOT_PRESENT,1) 
			SetTask(TASK_GOT_DATE,GetCurDate())
			if GetGlbValue(ID_PRESENT_NUMBER_CD) == 0 then
				nEmpty = 1;
			end
		end
	else
		Say("Xin l鏸, qu?  b? l蕐 h誸, l莕 sau h穣 quay l筰!",0)
	end
	if nEmpty == 1 then
		AddGlobalNews("Qu? c﹜ th玭g Gi竛g Sinh ? Nam Th祅h Й  b? l蕐 h誸, ngi ch琲 n祇 ch璦 l蕐 頲 h穣 n l莕 sau.")
		Msg2SubWorld("Qu? c﹜ th玭g Gi竛g Sinh ? Nam Th祅h Й  b? l蕐 h誸, ngi ch琲 n祇 ch璦 l蕐 頲 h穣 n l莕 sau.")
	end
end




