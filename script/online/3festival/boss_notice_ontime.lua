--File name:boss_notice_ontime.lua 
--Describe:三节连过，创建BOSS提前公告
--Create Date:2006-9-11
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")
function main()
	if Get_3festival_State() == 1 then
		Msg2SubWorld("M鏸 t猲 giang h? 竎 nh﹏ s? xu蕋 hi謓 sau 30 ph髏, m鋓 ngi h穣 chu萵 b?!");
		AddGlobalNews("M鏸 t猲 giang h? 竎 nh﹏ s? xu蕋 hi謓 sau 30 ph髏, m鋓 ngi h穣 chu萵 b?!");		
	end;
end;