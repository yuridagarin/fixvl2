--by liubo
--2012年3月国际妇女节活动

Include("\\script\\lib\\globalfunctions.lua")

AcitivityID = 56;
AwardTB = {2,1,30360,"V秈 l鬭 cao c蕄","Hoat dong thang 3 nam 2012 "};

--梁山每日任务获得奖励
function get_award_liangshan_funvjie(nNum)
	--是否开启活动判断
	if gf_CheckEventDateEx(AcitivityID) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
		return 0
  end
	gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],50},AwardTB[4],AwardTB[5],"Lng S琻 vt 秈 nhi謒 v? h籲g ng祔",0,1)
end
--梁山开启聚义宝箱获得奖励
function get_award_juyibox_funvjie()
	if gf_CheckEventDateEx(AcitivityID) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
		return 0
  end
	gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],10},AwardTB[4],AwardTB[5],"Lng S琻 T? Ngh躠 B秓 Rng",0,1)
end

--参加一场天门阵
function get_award_tianmenzhen_funvjie(nType)
	--是否开启活动判断
	if gf_CheckEventDateEx(AcitivityID) ~= 1 then
		return 0
	end
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
    Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
		return 0
  end
	if nType == 1 then
		gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],50},AwardTB[4],AwardTB[5],"Thi猲 M玭 tr薾",0,1)
	elseif nType == 2 then
		gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],100},AwardTB[4],AwardTB[5],"Thi猲 M玭 tr薾",0,1)
	elseif nType == 3 then
		gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],300},AwardTB[4],AwardTB[5],"Thi猲 M玭 tr薾",0,1)
	else
		gf_AddItemEx2({AwardTB[1],AwardTB[2],AwardTB[3],30},AwardTB[4],AwardTB[5],"Thi猲 M玭 tr薾",0,1)
	end
end

------------------------------------------------
function ServerStartUp()

end
function PlayerLogin()

end
