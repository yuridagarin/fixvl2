-- Created by TuanNA5
-- 31/05/2010
-- T?i nguy?n chi?n

tReturnPos = {{1433,3035},{1455,3063}};

function main()
	if GetTask(701) >= 0 then
		SetPos(tReturnPos[1][1],tReturnPos[1][2]);
		Talk(1,"","Ng??i c?a phe T?ng kh?ng th? ?i v?o ?i?m t?p k?t phe Li?u.")		
	--else
		--SetPos(tReturnPos[2][1],tReturnPos[2][2]);	
		--Talk(1,"","Qu?n ??ch bao v?y ph?a tr??c, kh?ng n?n ?i ra l?i n?y!.")		
	end
	return 0;	
end;