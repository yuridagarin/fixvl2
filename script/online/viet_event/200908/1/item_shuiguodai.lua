--=============================================
--create by baiyun 2009.7.16
--describe:Խ�ϰ�8�·ݻ ˮ�����ű�
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua");

function OnUse(nItemIdx)
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		local nRand = random(1, 100);
		if nRand <= 30 then
			if gf_AddItemEx({2, 1, 30098, 1}, "Nho") == 1then
				WriteLogEx("Hoat dong thang 8", "Dung tui trai cay", 1, "Nho Tuoi");
			end
		elseif nRand > 30 and nRand <= 60 then
			if gf_AddItemEx({2, 1, 30099, 1}, "M�ng c�u") == 1 then
				WriteLogEx("Hoat dong thang 8", "Dung tui trai cay", 1, "Mang Cau");
			end
		else
			if gf_AddItemEx({2, 1, 30100, 1}, "S�u ri�ng") == 1 then
				WriteLogEx("Hoat dong thang 8", "Dung tui trai cay", 1, "Sau rieng");
			end
		end
	end
end
