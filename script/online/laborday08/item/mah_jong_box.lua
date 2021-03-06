--2008年春节活动-麻将收集活动-物品使用函数
--代码开发人：陈墨仙
--代码开发时间：2008-04-10
--代码修改记录：
Include("Script\\Online\\\laborday08\\mah_jong_head.lua")
MJ_MAX_DIEJIA = 999
function OnUse()
	local tTemp = {
		"Ta mu鑞 c蕋 t蕋 c? qu﹏ b礽 v祇 h祅h trang/save_all",
		"Ki觤 tra qu﹏ уng c遪 "..get_total(0).."Trng/#get_mah_jong_1(0)",
		"Ki觤 tra qu﹏ 襲 c遪 "..get_total(1).."Trng/#get_mah_jong_1(1)",
		"Ki觤 tra qu﹏ V筺 c遪 "..get_total(2).."Trng/#get_mah_jong_1(2)",
		"Ki觤 tra qu﹏ T筽 c遪 "..get_total(3).."Trng/#get_mah_jong_1(3)",
		"Sau n祔 h穣 l蕐/nothing"
	}
	Say("B筺 c? th? xem s? qu﹏ b礽 c蕋 v祇 ho芻 l蕐 ra, c竎 qu﹏ b礽 h? th鑞g cho s? m芻 nh 頲 b? v祇 trong rng n祔.",getn(tTemp),tTemp)
end

function get_total(index)
	local nTotal = 0
		if index >= 0 and index <= 2 then
		local nFor = 1
		for nFor = 1, 9, 1 do
			nTotal = nTotal + GetTask(TASK_MJ_TONG1 + index * 9 + nFor - 1)
		end
	elseif index == 3 then--杂
		local nFor = 1
		for nFor = 1, 7, 1 do
			nTotal = nTotal + GetTask(TASK_MJ_DONG + nFor - 1)
		end
	end
	return nTotal
end

function get_mah_jong_1(index)
	local tTemp = {}
	local tMJTemp = {"уng","襲","V筺 ","T筽"}
	if get_total(index) <= 0 then
		Talk(1,"OnUse","Trong rng M箃 chc c馻 b筺 kh玭g c? "..tMJTemp[index + 1])
		return
	end
	if index == 0 or index == 1 or index == 2 then--统计有多少筒条万
		local szTemp = {"уng","襲","V筺 "}
		local nFuncTemp = {0,1,2,3,4,5}
		--作为参数传递给get_mah_jong_2的话，1,3,5表示取出1~9筒条万；2，4，6表示取出全部筒条万
		local nFor = 1
		tinsert(tTemp,"Ta mu鑞 l蕐 "..szTemp[index + 1].."1 n 9/#get_mah_jong_2("..nFuncTemp[index * 2 + 1]..")")
		for nFor = 1, 9, 1 do--插入取出一筒（条，万）二筒（条，万）……的全部选项
			local nTaskTemp = TASK_MJ_TONG1 + index * 9 + nFor - 1
			tinsert(tTemp,tMahJong[nFor + index * 9][1]..", c遪 "..GetTask(nTaskTemp).."Trng/#get_mah_jong_2("..nTaskTemp..")")
		end
		tinsert(tTemp,"Ta mu鑞 l蕐 h誸"..szTemp[index + 1].."/#get_mah_jong_2("..nFuncTemp[index * 2 + 2]..")")
		tinsert(tTemp,"Kh玭g l蕐/OnUse")
	elseif index == 3 then--杂
		tTemp = {
			"Ta mu鑞 l蕐 Йng Nam T﹜ B綾 m鏸 lo筰 3 con/#get_mah_jong_2(6)",
			"Йng, c遪 "..GetTask(TASK_MJ_DONG).."Trng/#get_mah_jong_2("..TASK_MJ_DONG..")",
			"T﹜, c遪 "..GetTask(TASK_MJ_XI).."Trng/#get_mah_jong_2("..TASK_MJ_XI..")",
			"Nam, c遪 "..GetTask(TASK_MJ_NAN).."Trng/#get_mah_jong_2("..TASK_MJ_NAN..")",
			"B綾, c遪 "..GetTask(TASK_MJ_BEI).."Trng/#get_mah_jong_2("..TASK_MJ_BEI..")",
			"Trung, c遪 "..GetTask(TASK_MJ_ZHONG).."Trng/#get_mah_jong_2("..TASK_MJ_ZHONG..")",
			"Ph竧, c遪 "..GetTask(TASK_MJ_FA).."Trng/#get_mah_jong_2("..TASK_MJ_FA..")",
			"B筩h, c遪 "..GetTask(TASK_MJ_BAI).."Trng/#get_mah_jong_2("..TASK_MJ_BAI..")",
			"Ta mu鑞 l蕐 to祅 b? T筽/#get_mah_jong_2(7)",
			"Kh玭g l蕐/OnUse"
		}
	end
	Say("",getn(tTemp),tTemp)
end

function get_mah_jong_2(index)
	if index > 10 then--用输入框拿出具体哪一种的麻将
		if GetTask(index) > 0 then
			SetTaskTemp(TASK_TEMP_MJ_KIND,index)
			AskClientForNumber("comfirm_MJ",1,tonumber(GetTask(index)),"H穣 nh藀 v祇 M箃 chc b筺 mu鑞 l蕐")
			return
		else
			local nTemp = floor((index - TASK_MJ_TONG1) / 9)
			Say("Xin l鏸! Trong rng M箃 chc c馻 b筺 kh玭g c? lo筰 M箃 chc n祔!",1,"Ta bi誸 r錳./#get_mah_jong_1("..nTemp..")")
			return
		end
	else--特殊取出方法
		if index == 0 or index == 2 or index == 4 then--取出筒条万1~9
			local nFor = 1
			if Zgc_pub_goods_add_chk(9,9) ~= 1 then
				return
			end--if物品检测
			for nFor = 1, 9, 1 do--遍历，取出1~9筒
				--麻将筒条万的任务变量是连续的，每隔九个为一个系列（1筒~9筒，
				--1条~9条，……）index / 2的值代表了第几个系列（筒为第一个系列，
				--条为第二个系列，……），nFor的值代表了一筒二筒的1或2
				if GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) <= 0 then
					--判断每种筒有没有一个
					local tMJTemp = {
						[0] = "уng",
						[2] = "襲",
						[4] = "V筺 "
					} 
					Say("Trong rng M箃 chc c馻 b筺 kh玭g c? "..nFor..tMJTemp[index],1,"Ta bi誸 r錳./#get_mah_jong_1("..floor(index / 2)..")")
					--返回上一个提示
					return
				end--增加一张麻将
			end--for增加麻将
			for nFor = 1, 9, 1 do--遍历，取出1~9筒
				--麻将筒条万的任务变量是连续的，每隔九个为一个系列（1筒~9筒，
				--1条~9条，……）index / 2的值代表了第几个系列（筒为第一个系列，
				--条为第二个系列，……），nFor的值代表了一筒二筒的1或2
				if GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) >= 1 then
					--取出一个筒
					SetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1,GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) - 1)
					AddItem(tMahJong[nFor + floor(index / 2) * 9][2],tMahJong[nFor + floor(index / 2) * 9][3],tMahJong[nFor + floor(index / 2) * 9][4],1)

				end--增加一张麻将
			end--for增加麻将
		elseif index == 1 or index == 3 or index == 5 then--取出全部筒（条万）
			local nFor = 1
			local nTotal = 0--有多少张麻将
			local nGezi = 0--判断需要多少格子
			if get_total(floor(index / 2)) <= 0 then
				local tMJTemp = {
					[1] = "уng",
					[3] = "襲",
					[5] = "V筺 "
				}
				Talk(1,"OnUse","Trong rng M箃 chc c馻 b筺 kh玭g c? g? c?"..tMJTemp[index])
				return--返回
			end
			for nFor = 1, 9, 1 do
				nTotal = nTotal + GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1)
				nGezi = ceil(GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) / MJ_MAX_DIEJIA) + nGezi
			end
			if Zgc_pub_goods_add_chk(nGezi,nTotal) ~= 1 then
				return
			end--if物品检测
			for nFor = 1, 9, 1 do
				if GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) >= 1 then
					local nTempMJ = GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1)
					SetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1,0)
					AddItem(tMahJong[nFor + floor(index / 2) * 9][2],tMahJong[nFor + floor(index / 2) * 9][3],tMahJong[nFor + floor(index / 2) * 9][4],nTempMJ)
				end--增加所有一种麻将
			end--for增加麻将
		elseif index == 6 then--取出东南西北各三张
			local nFor = 1
			if Zgc_pub_goods_add_chk(ceil(3/MJ_MAX_DIEJIA),3) ~= 1 then
				return
			end
			for nFor = 1, 4, 1 do
				if GetTask(TASK_MJ_DONG + nFor - 1) < 3 then
					local tszTemp = {"Йng ","Nam ","T﹜ ","B綾 "}
					Say(" -"..tszTemp[nFor].." kh玭g  3 con!",1,"Ta bi誸 r錳/#get_mah_jong_1(3)")
					return
				end
			end
			for nFor = 1, 4, 1 do
				if GetTask(TASK_MJ_DONG + nFor - 1) >= 3 then
					SetTask(TASK_MJ_DONG + nFor - 1,GetTask(TASK_MJ_DONG + nFor - 1) - 3)
					AddItem(tMahJong[27 + nFor][2],tMahJong[27 + nFor][3],tMahJong[27 + nFor][4],3)
				end
			end
		elseif index == 7 then--取出全部杂
			local nFor = 1
			local nTotal = 0--有多少张麻将
			local nGezi = 0--判断需要多少格子
			if get_total(3) == 0 then
				Talk(1,"OnUse","Trong rng M箃 chc c馻 b筺 kh玭g c? con T筽!")
				return--返回
			end
			for nFor = 1, 9, 1 do
				nTotal = nTotal + GetTask(TASK_MJ_DONG + nFor - 1)
				nGezi = ceil(GetTask(TASK_MJ_DONG + nFor - 1) / MJ_MAX_DIEJIA) + nGezi
			end
			if Zgc_pub_goods_add_chk(nGezi,nTotal) ~= 1 then
				return
			end--if物品检测
			for nFor = 1, 7, 1 do
				local nTempMJ = GetTask(TASK_MJ_DONG + nFor - 1)
				SetTask(TASK_MJ_DONG + nFor - 1, 0)
				AddItem(tMahJong[27 + nFor][2],tMahJong[27 + nFor][3],tMahJong[27 + nFor][4],nTempMJ)
			end
		end--if index
	end
	local nLast = 0
	if index == 1 or index == 3 or index == 5 or index == 7 then
		local tMJTemp = {
			[1] = "уng",
			[3] = "襲",
			[5] = "V筺 ",
			[7] = "T筽"
		} 
		Say("  l蕐 to祅 b? "..tMJTemp[index].."!",1,"Ta bi誸 r錳./OnUse")--如果是取出全部筒条万
		return
	elseif index < 10 then
		nLast = floor(index / 2)
	else
		nLast = floor((index - TASK_MJ_TONG11) / 9)
	end
	get_mah_jong_1(nLast)--返回上一个提示
end

function comfirm_MJ(nCount)
	if GetTask(GetTaskTemp(TASK_TEMP_MJ_KIND)) < nCount then
		Msg2Player("M箃 chc trong rng kh玭g  s? lng b筺 nh藀 v祇!")
	else
		if Zgc_pub_goods_add_chk(nCount / MJ_MAX_DIEJIA,nCount) ~= 1 then
			--不够负重，返回
			return
		end
		SetTask(GetTaskTemp(TASK_TEMP_MJ_KIND),GetTask(GetTaskTemp(TASK_TEMP_MJ_KIND)) - nCount)
		AddItem(tMahJong[GetTaskTemp(TASK_TEMP_MJ_KIND)-860][2],tMahJong[GetTaskTemp(TASK_TEMP_MJ_KIND)-860][3],tMahJong[GetTaskTemp(TASK_TEMP_MJ_KIND)-860][4],nCount)
	end
	get_mah_jong_1(floor((GetTaskTemp(TASK_TEMP_MJ_KIND) - 860)/9))
end

function nothing()--结束对话用函数
	
end

function save_all()--存放身上所有麻将
	local nFor = 1
	for nFor = TASK_MJ_TONG1,TASK_MJ_BAI,1 do
		local nMJnum = GetItemCount(tMahJong[nFor - 860][2],tMahJong[nFor - 860][3],tMahJong[nFor - 860][4])
		if nMJnum > 0 then
			if DelItem(tMahJong[nFor - 860][2],tMahJong[nFor - 860][3],tMahJong[nFor - 860][4],nMJnum) == 1 then
				SetTask(nFor,GetTask(nFor) + nMJnum)
			end
		end
	end
	Talk(1,"OnUse","B筺  c蕋 h誸 M箃 chc v祇 h祅h trang!")
end