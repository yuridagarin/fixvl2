--天门碎片使用脚本
Include("\\script\\lib\\globalfunctions.lua")

TMSP_NUM_NEED = 200;--需求天门碎片数量

function TMSP_OnUse(nItem)
	Say("M秐h Thi猲 M玭 頲 r琲 ra t? Boss Th玭g Thi猲 Huy詎 C秐h, c? th? gh衟 th祅h Thi猲 M玭 Kim L謓h.",2,format("%d M秐h Thi猲 M玭 gh衟 th祅h 1 Thi猲 M玭 Kim L謓h/combine_TMGL",TMSP_NUM_NEED),"Ra kh醝/nothing");
end

function combine_TMGL()
	--判断背包空间
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
     return 0;
	end
	if GetItemCount(2,1,30410) < TMSP_NUM_NEED then
		Talk(1,"",format("S? lng M秐h Thi猲 M玭 kh玭g <color>%d<color>",TMSP_NUM_NEED));
		return 0;
	end
	if DelItem(2,1,30410,TMSP_NUM_NEED) == 1 then
		gf_AddItemEx2({2,1,30370,1}, "Thi猲 M玭 Kim L謓h", "Gh衟 M秐h Thi猲 M玭 th祅h Thi猲 M玭 Kim L謓h", "M秐h Thi猲 M玭", 0, 1);
		AddRuntimeStat(14, 2, 0, 1)
	end
	return 1;
end