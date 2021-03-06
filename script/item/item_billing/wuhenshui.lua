------------------------------------------------------------
-- 无痕水的脚本 wuhenshui.lua
--
-- comment: 洗掉秘籍上任意一个决要。
-- creator: Tony(Jizheng)
-- Date   : Jul 20th, 2006
--
-- Item ID: 2,1,503
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	if IsBookLocked() > 0 then
		Say("M藅 t辌h trang b? 產ng ? tr筺g th竔 kh鉧, kh玭g th? d飊g V? Ng蕁 th駓 h駓 b? ki誴!", 0)
		return
	end
	
	strTab = {"Sau khi d飊g <color=yellow>V? Ng蕁 Th駓<color> s? s? h駓 b? m閠 quy觧 b? ki誴 b蕋 k? trong m藅 t辌h trang b? c馻 b筺 hi謓 t筰. B筺 mu鑞 h駓 b? b? ki誴 n祇?",
			  "Ta kh玭g mu鑞 h駓 b?--H駓 b?/cancel_dialog"}
			  
	local strAddendar = {"", "", "", ""}
	local nAddendarID = {-1, -1, -1, -1}
	local nAddendarCount = 0
	for i = 0, 3 do
		strAddendar[i + 1], nAddendarID[i + 1] = GetBookAddendarName(i)
		if (nAddendarID[i + 1] ~= -1) then
			nAddendarCount = nAddendarCount + 1
		end
	end
	
	-- 没有决要要消除
	if (nAddendarCount == 0) then
		Say("Hi謓 b筺 kh玭g th? h駓 b? b? ki誴!", 0)
	end
	
	-- 只有一个决要可以消除
	if (nAddendarCount == 1) then
		if (nAddendarID[1] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[1].."/clear_addendar_1",
				strTab[2])
		end
		if (nAddendarID[2] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[2].."/clear_addendar_2",
				strTab[2])
		end
		if (nAddendarID[3] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end
		if (nAddendarID[4] ~= -1) then
			Say(strTab[1],
				2,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
	end
	
	-- 有两个决要可以消除
	if (nAddendarCount == 2) then
		if ((nAddendarID[1] == -1) and (nAddendarID[2] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[3].."/clear_addendar_3",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[2].."/clear_addendar_2",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[2].."/clear_addendar_2",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[1].."/clear_addendar_1",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[1].."/clear_addendar_1",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[3] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[1].."/clear_addendar_1",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[2].."/clear_addendar_2",
				strTab[2])
		end
	end
	
	-- 有三个决要可以消除
	if (nAddendarCount == 3) then
		if (nAddendarID[1] == -1) then
			Say(strTab[1],
				4,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[2].."/clear_addendar_2",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[3].."/clear_addendar_3",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if (nAddendarID[2] == -1) then
			Say(strTab[1],
				4,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[1].."/clear_addendar_1",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[3].."/clear_addendar_3",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if (nAddendarID[3] == -1) then
			Say(strTab[1],
				4,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[1].."/clear_addendar_1",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[2].."/clear_addendar_2",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if (nAddendarID[4] == -1) then
			Say(strTab[1],
				4,
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[1].."/clear_addendar_1",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[2].."/clear_addendar_2",
				"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end	
	end
	
	-- 有四个决要可以消除的
	if (nAddendarCount == 4) then
		Say(strTab[1],
			5,
			"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[1].."/clear_addendar_1",
			"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[2].."/clear_addendar_2",
			"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[3].."/clear_addendar_3",
			"Ta mu鑞 h駓 b? b? ki誴"..strAddendar[4].."/clear_addendar_4",
			strTab[2])
	end
	
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 消除决要1
function clear_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	Say("Ngi x竎 nh mu鑞 h駓 b? <color=yellow>"..strAddendar.."<color> ch?? Sau khi h駓 b?, b? ki誴 n祔 s? bi課 m蕋!",
		2,
		"уng ?/confirm_clear_addendar_1",
		"Ta kh玭g mu鑞 h駓 b?--H駓 b?/cancel_dialog")
end;
-- 确认消除决要1
function confirm_clear_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(0)
		Say("B筺  x鉧 th祅h c玭g <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B筺  x鉧 b? ki誴 th祅h c玭g!")
	end
end;


-- 消除决要2
function clear_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	Say("Ngi x竎 nh mu鑞 h駓 b? <color=yellow>"..strAddendar.."<color> ch?? Sau khi h駓 b?, b? ki誴 n祔 s? bi課 m蕋!",
		2,
		"уng ?/confirm_clear_addendar_2",
		"Ta kh玭g mu鑞 h駓 b?--H駓 b?/cancel_dialog")
end;
-- 确认消除决要2
function confirm_clear_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(1)
		Say("B筺  x鉧 th祅h c玭g <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B筺  x鉧 b? ki誴 th祅h c玭g!")
	end
end;


-- 消除决要3
function clear_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	Say("Ngi x竎 nh mu鑞 h駓 b? <color=yellow>"..strAddendar.."<color> ch?? Sau khi h駓 b?, b? ki誴 n祔 s? bi課 m蕋!",
		2,
		"уng ?/confirm_clear_addendar_3",
		"Ta kh玭g mu鑞 h駓 b?--H駓 b?/cancel_dialog")
end;
-- 确认消除决要3
function confirm_clear_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(2)
		Say("B筺  x鉧 th祅h c玭g <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B筺  x鉧 b? ki誴 th祅h c玭g!")
	end
end;


-- 消除决要4
function clear_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	Say("Ngi x竎 nh mu鑞 h駓 b? <color=yellow>"..strAddendar.."<color> ch?? Sau khi h駓 b?, b? ki誴 n祔 s? bi課 m蕋!",
		2,
		"уng ?/confirm_clear_addendar_4",
		"Ta kh玭g mu鑞 h駓 b?--H駓 b?/cancel_dialog")
end;
-- 确认消除决要4
function confirm_clear_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(3)
		Say("B筺  x鉧 th祅h c玭g <color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("B筺  x鉧 b? ki誴 th祅h c玭g!")
	end
end;

