
Include("\\script\\task\\faction\\faction_main_tm.lua"); -- 唐门师门任务的脚本头文件


function main()

local nTaskValue = FN_GetTaskState(FN_TM)

	if (nTaskValue==4) then
		task_008();
		return
	elseif (nTaskValue==5) then
		Say("Ngi kh玭g mau 甶 o c遪 ? y i g? n鱝?",0);
		return
	elseif (nTaskValue==6) then
		task_010();
		return
	elseif (nTaskValue==7) then
		Say("Л頲 r錳! Xem nh? ngi  qua 秈 c馻 ta, mau n g苝 L穙 l穙!",0);	
		return
	else
	
		local i=random(1,3)
		if i == 1 then
			Say("C? Л阯g V﹏ ta ? y, k? kh竎 mu鑞 x﹎ ph筸 Л阯g M玭 c遪 kh? h琻 l猲 tr阨.",0)
		elseif	i == 2 then
			Say("竚 kh? ph遪g v? H醓 kh? ph遪g c?  k? nhau l祄 ta c秏 th蕐 kh? x?.",0)
		else
			Say("Thi猲 H秈 g莕 y h琲 kh竎 l?, e r籲g  c? chuy謓 x秠 ra.",0)
		end
		
	end
end;

