--天门金令礼包合成
Include("\\script\\online\\collect_card\\cc_define.lua")
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tSay = {
		format("S? d鬾g %d Thi猲 M玭 Kim L謓h v? %d L? Bao Thi猲 M玭 Kim L謓h i l蕐 1 L? Bao N﹏g C蕄 Thi猲 M玭 Kim L謓h/#sure_exchange(%d)", CC_TMGL_COST_NUM, 1, nItem),
		"Ta suy ngh? l筰/do_nothing",	
	}
	Say("Чi hi謕 mu鑞 i L? Bao Th╪g C蕄 ch??", getn(tSay), tSay);
end

function sure_exchange(nItem)
	local nFreeRoom = GetFreeItemRoom();
	local nCount = min(GetItemCount(2, 1, 30509), floor(GetItemCount(2, 1, 30370)/CC_TMGL_COST_NUM));
	AskClientForNumber("sure_exchange_deal",0,min(nFreeRoom, nCount),"Nh藀 s? lng","")
end

function sure_exchange_deal(nNum)
	for i = 1, nNum do
		if GetFreeItemRoom() < 2 then
			Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
			return 0;
		end
		if GetItemCount(2, 1, 30370) < CC_TMGL_COST_NUM then 
			Talk(1,"",format("C莕 c? <color=red> %d <color> Thi猲 M玭 Kim L謓h m韎 c? th? i l蕐 1 L? Bao N﹏g C蕄 Thi猲 M玭 Kim L謓h", CC_TMGL_COST_NUM));
			return 0;
		end
		if DelItem(2, 1, 30509, 1) ~= 1 then
			return 0;
		end
		if DelItem(2, 1, 30370, CC_TMGL_COST_NUM) ~= 1 then
			return 0;
		end
		gf_AddItemEx2({2, 1, 30511, 1}, "L? bao Thi猲 M玭 Kim L謓h N﹏g C蕄", CC_LOG_TITLE, "фi L? Bao N﹏g C蕄 Thi猲 M玭 Kim L謓h", 0, 1);
	end
end 


function do_nothing()
end