-- 机关人， 开启批量制造功能
Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nidx)
	-- local time_h = tonumber(date("%H"));
	-- if time_h >= 19 then 
		-- Say("C? quan nh﹏ ch? c? th? s? d鬾g trong th阨 gian 0h n 12h  tr竛h l祄 秐h hng n server gi? cao 甶觤.", 0)
	-- else 
		local nItemIndex = tonumber(nidx)
		Say("B筺 mu鑞 d飊g c? quan nh﹏? N? c? th? gi髉 b筺 m? m閠 s? ch鴆 n╪g trong 1 gi?.", 2, "ng/#yes_use("..nItemIndex..")", "Sai/no_say")
	--end;
end

function yes_use(nItemIndex)
	
	if GetTask(2509) > 0 then
		Say("B筺  d飊g m閠 c? quan nh﹏.", 0)
	else
		if DelItem(2,1,1011,1) == 1 then
			SetTask(2509, 3600 * 18)
			Msg2Player("B筺  d飊g 1 c? quan nh﹏ ")
		end
	end
end