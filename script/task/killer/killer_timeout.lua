-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务通告信息发布文件                  
-- Edited by starry night                                 
-- 2005/11/28 PM 15:17                                    
                                                          
-- ======================================================

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local nWeekDay = GetWeekDay();
	local nHour,nMin = GetLocalTime();
	
		if nWeekDay == 1 or nWeekDay == 2 or nWeekDay == 3 or nWeekDay == 4 then
			if nHour == 20  then
				AddLocalNews("G莕 y s? ngi ph筸 t閕 t╪g nhi襲, B? u c竎 th祅h th?  ph竧 danh s竎h truy n?, b筺 h穣 n Nha m玭 gi髉 h? ph? 竛!");
				Msg2SubWorld("G莕 y s? ngi ph筸 t閕 t╪g nhi襲, B? u c竎 th祅h th?  ph竧 danh s竎h truy n?, b筺 h穣 n Nha m玭 gi髉 h? ph? 竛!");
				
			elseif nHour == 22 then
				AddLocalNews("B? u c竎 th祅h th?  ph竧 danh s竎h truy n?, b筺 h穣 n Nha m玭 gi髉 h? ph? 竛!");
				Msg2SubWorld("B? u c竎 th祅h th?  ph竧 danh s竎h truy n?, b筺 h穣 n Nha m玭 gi髉 h? ph? 竛!");
				
			elseif nHour == 0 then
				AddLocalNews("Danh s竎h truy n? h玬 nay  ph竧 xong, mong c竎 v? i hi謕 gi髉 b総 ch髇g v? quy 竛. Nha m玭 s? ph竧 c玭g c竜 c秏 t? c竎 v?!");
				Msg2SubWorld("Danh s竎h truy n? h玬 nay  ph竧 xong, mong c竎 v? i hi謕 gi髉 b総 ch髇g v? quy 竛. Nha m玭 s? ph竧 c玭g c竜 c秏 t? c竎 v?!");
				
			else
				AddLocalNews("V祇 l骳 20 h v? 22 h, c竎 B? u c馻 Nha m玭 ? c竎 th祅h th? ra th玭g b竜 danh s竎h truy b総 t閕 ph筸. Mong c竎 hi謕 kh竎h ra tay tr? gi髉!");
				Msg2SubWorld("V祇 l骳 20 h v? 22 h, c竎 B? u c馻 Nha m玭 ? c竎 th祅h th? ra th玭g b竜 danh s竎h truy b総 t閕 ph筸. Mong c竎 hi謕 kh竎h ra tay tr? gi髉!"); 
			end;
		end;
end;
