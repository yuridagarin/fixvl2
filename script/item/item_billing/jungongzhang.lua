Include("\\script\\newbattles\\functions.lua");
tbJUNGONGZHANG = 
{
	[1] = {"Huy hi珿 chi掝 c南g (ti荄)",2,1,9999,2},
	[2] = {"Qu姊 C南g 完i",2,1,9998,5},
	[3] = {"Qu姊 C南g Huy Ho登g",2,1,9977,10},
}

function OnUse(nItemIdx)
	if 1==1 then
		return 0;
	end;
	local nType = get_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","B雉 kh南g s? d獼g huy hi珿 chi掝 c南g!");
		return 0;
	end;
	local nLastTime = BT_GetData(PT_SPYCLOTH_TIME)
	local nTimePassed = GetTime() - nLastTime;
	if nTimePassed < ITEM_SPYCLOTH_TIME then
		Talk(1,"","Huy hi珿 chi掝 c南g v? m鱸 n? gi罩 展珽 kh南g th? c鮦g s? d獼g! Th甋 gian s? d獼g m鱸 n? chi掝 剃ng c鎙 ng閂i c羧: <color=yellow>"..tf_GetTimeString(ITEM_SPYCLOTH_TIME-nTimePassed).."<color>.");
		return 0;
	end;
	local selTab = {
				format("批ng ?/#use(%d)",nType),
				"H鞬 c南g d獼g huy hi珿 chi掝 c南g/cancel_effect",
				"H鞬 b?/nothing",
				}
	local nCurMultiple = BT_GetData(PT_MULTIPLE_JUNGONG);
	if nCurMultiple ~= 0 then
		nCurMultiple = nCurMultiple + 1;
	end;
	Say("C南g d獼g huy hi珿 chi掝 c南g c鎙 ng閂i hi琄 l? <color=yellow>"..nCurMultiple.."<color>lブ. S? d獼g <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color> khi chi掝 tr甹 k掐 th鏂 s? nh甹 悌蟃 <color=yellow>"..tbJUNGONGZHANG[nType][5].."<color> lブ c南g tr雉g. 批ng ? s? d獼g ch?? <enter> Ch? ?: <enter>1: <color=yellow> C南g tr雉g kh南g t閂ng 鷢g v璐 huy hi珿 chi掝 c南g s? b? kh厏 tr? khi chi掝 tr甹 k掐 th鏂. <color><enter>2: 展脁 c南g tr雉g <color=yellow>s? c盯 c? v發 s? lブ th駐g b隘 m? t徯h l矉<color>.<enter>3 <color=red>Qu姊 c南g tr雉g v? M鱸 n? gi罩 展珽 kh南g th? 桀ng th甋 s? d獼g<color>!",getn(selTab),selTab);
end;

function cancel_effect()
	BT_SetData(PT_MULTIPLE_JUNGONG,0)
	Talk(1,"","H鞬 b? c南g d獼g huy hi珿 chi掝 c南g, hi琄 c羧 l? <color=yellow>0<color> lブ")
	Msg2Player("C南g d獼g huy hi珿 chi掝 c南g hi琄 l? 0 lブ");
end;

function get_type(nItemIdx)
	local genre = GetItemGenre(nItemIdx)
	local detail = GetItemDetail(nItemIdx)
	local particular = GetItemParticular(nItemIdx);
	for i=1,getn(tbJUNGONGZHANG) do
		if genre == tbJUNGONGZHANG[i][2] and detail == tbJUNGONGZHANG[i][3] and particular == tbJUNGONGZHANG[i][4] then
			return i;
		end;
	end;
	return 0;
end;

function use(nType)
	BT_SetData(PT_MULTIPLE_JUNGONG,tbJUNGONGZHANG[nType][5]-1)
	Talk(1,"","C南g d獼g huy hi珿 chi掝 c南g hi琄 l? <color=yellow>"..tbJUNGONGZHANG[nType][5].."<color> lブ");
	Msg2Player("C南g d獼g huy hi珿 chi掝 c南g hi琄 l? "..tbJUNGONGZHANG[nType][5].."lブ")
end;