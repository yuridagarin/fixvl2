--by liubo
--2012年春节活动

Include("\\script\\lib\\globalfunctions.lua")

--梁山每日任务获得奖励
function get_award_liangshan_chunjie(nNum)
	--是否开启活动判断
	if VietCheckEventDate() ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
		return 0
  end
	gf_AddItemEx2({2,1,30353,50},"уng ti襫 may m緉","Hoat dong thang 1 nam 2012","Lng S琻 vt 秈 nhi謒 v? h籲g ng祔",0,1)
end
--梁山开启聚义宝箱获得奖励
function get_award_juyibox_chunjie()
	if VietCheckEventDate() ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
		return 0
  end
	gf_AddItemEx2({2,1,30353,10},"уng ti襫 may m緉","Hoat dong thang 1 nam 2012","Lng S琻 T? Ngh躠 B秓 Rng",0,1)
end

--参加一场天门阵
function get_award_tianmenzhen_chunjie(nType)
	--是否开启活动判断
	if VietCheckEventDate() ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
		return 0
  end
	if nType == 1 then
		gf_AddItemEx2({2,1,30353,50},"уng ti襫 may m緉","Hoat dong thang 1 nam 2012","Thi猲 M玭 tr薾",0,1)
	elseif nType == 2 then
		gf_AddItemEx2({2,1,30353,100},"уng ti襫 may m緉","Hoat dong thang 1 nam 2012","Thi猲 M玭 tr薾",0,1)
	elseif nType == 3 then
		gf_AddItemEx2({2,1,30353,300},"уng ti襫 may m緉","Hoat dong thang 1 nam 2012","Thi猲 M玭 tr薾",0,1)
	else
		gf_AddItemEx2({2,1,30353,30},"уng ti襫 may m緉","Hoat dong thang 1 nam 2012","Thi猲 M玭 tr薾",0,1)
	end
end

------------------------------------------------
function ServerStartUp()

end
function PlayerLogin()

end
