--甑子丹
--created by lizhi
--2005-9-10 11:38

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_main.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");

function main()

	if CheckTime(6) == 1 or CheckTime(0) == 1 then		--星期六和星期天才允许运送物资
	    local szSay = {
	        "S? gi? ho箃 ng: Ch﹏ T? n i hi謕 頲 tri襲 nh 駓 th竎 qu秐 l? m鋓 vi謈 li猲 quan i h閕 t? v? l莕 n祔, h穣 n Bi謓 Kinh t譵 anh ta, ho箃 ng cu鑙 tu莕 hi謓 do ta ph? tr竎h!",
	        "Gi髉 Чi T鑞g t譵 qu﹏ b?/supply_armament",
	        "Gi髉 Чi T鑞g chuy觧 h祅g/deliver_goods",
	        "D飊g c玭g lao i b竜 p/goto_liguan",
	        "Xem c玭g lao/query_offer",
	        "Gi韎 thi謚 chi ti誸 ho箃 ng cu鑙 tu莕/introduce_detail",
	        "K誸 th骳 i tho筰/end_say"
	    };
	    SelectSay(szSay);
	elseif CheckTime(5) == 1 then	--周末的时候才有活动
	    local szSay = {
	        "S? gi? ho箃 ng: Ch﹏ T? n i hi謕 頲 tri襲 nh 駓 th竎 qu秐 l? m鋓 vi謈 li猲 quan i h閕 t? v? l莕 n祔, h穣 n Bi謓 Kinh t譵 anh ta, ho箃 ng cu鑙 tu莕 hi謓 do ta ph? tr竎h!",
	        "Gi髉 Чi T鑞g t譵 qu﹏ b?/supply_armament",
	        "D飊g c玭g lao i b竜 p/goto_liguan",
	        "Xem c玭g lao/query_offer",
	        "Gi韎 thi謚 chi ti誸 ho箃 ng cu鑙 tu莕/introduce_detail",
	        "K誸 th骳 i tho筰/end_say"
	    };
	    SelectSay(szSay);
	else
	    local szSay = {
	        "S? gi? ho箃 ng: Ch﹏ T? n i hi謕 頲 tri襲 nh 駓 th竎 qu秐 l? m鋓 vi謈 li猲 quan i h閕 t? v? l莕 n祔, h穣 n Bi謓 Kinh t譵 anh ta, ho箃 ng cu鑙 tu莕 hi謓 do ta ph? tr竎h!",
	        "Gi韎 thi謚 chi ti誸 ho箃 ng cu鑙 tu莕/introduce_detail",
	        "K誸 th骳 i tho筰/end_say"
	    };
	    SelectSay(szSay);
	end;
end;
