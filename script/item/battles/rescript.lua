-- 英雄令 用来把玩家传送到雁门关大战报名点

Include("\\script\\battles\\battlehead.lua");
Include("\\script\\battles\\battleinfo.lua");

function OnUse()
	main()
end

function main()
CleanInteractive()	--断开交互
	local W,X,Y = GetWorldPos();

	local nMapId = W;
	tbFORBIDDEN_MAP = { };	-- 禁用特殊地图

	if( getn(tbFORBIDDEN_MAP) ~= 0 ) then
		for j = 1, getn(tbFORBIDDEN_MAP) do
			if ( nMapId == tbFORBIDDEN_MAP[j] ) then
				Msg2Player("B筺 kh玭g th? s? d鬾g o c? n祔 ? y.");
				return 1;
			end
		end
	end
	
	if( getn(tbBATTLEMAP) ~= 0 ) then
		for i = 1, getn(tbBATTLEMAP) do 
			if ( nMapId == tbBATTLEMAP[i] ) then
				Msg2Player("B筺 kh玭g th? s? d鬾g o c? n祔 ? y.");
				return 1;
			end
		end
	end
	
	if (nMapId > 604 and nMapId ~= 806 and nMapId ~= 808) then
		Msg2Player("B筺 kh玭g th? s? d鬾g o c? n祔 ? y.");
		return 1
	end

	if( HEROCARD == 1 ) then
		Say ( "                             <color=red>Чi T鑞g anh h飊g l謓h<color><enter><enter><enter> Phe c? ngi ng s? chi誱 璾 th? nh璶g 甶觤 chi課 c玭g nh薾 頲 s? 輙 甶.<enter> B筺 mu鑞 n b竜 danh phe n祇?", 3, "                           V祇 甶觤 b竜 danh phe T鑞g/ToSong", "                           T譵 hi觰 Nh筺 M玭 quan/bt_onbattleinfo", "                           Xu⺶...Ta l? o binh./Cancel" );
	else
		Say ( "                             <color=red>Чi Li猽 anh h飊g l謓h<color><enter><enter><enter> Phe c? ngi ng s? chi誱 璾 th? nh璶g 甶觤 chi課 c玭g nh薾 頲 s? 輙 甶.<enter> B筺 mu鑞 n b竜 danh phe n祇?", 3, "                           V祇 甶觤 b竜 danh phe Li猽/ToLiao",  "                           T譵 hi觰 Nh筺 M玭 quan/bt_onbattleinfo", "                           Xu⺶...Ta l? o binh./Cancel" );
	end
	-- 空格不要改了，为了居中显示
	return 1;

end

function ToSong()	-- 进入宋方报名点
	local factionnumber = GetPlayerRoute()
	if( factionnumber == 0 ) then
		Say("Ngi ch璦 gia nh藀 m玭 ph竔 n祇! Chi課 trng r蕋 kh鑓 li謙! H鋍 xong v? ngh? h穣 quay l筰 tham chi課!", 0)
		return
	end
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "Chi課 trng r蕋 kh鑓 li謙! Gia nh藀 m玭 ph竔, h鋍 xong v? ngh? h穣 quay l筰 tham chi課!" );
		return
	elseif ( GetLevel() >= 40 and GetLevel() < 60 ) then
		str = "дn 甶觤 b竜 danh Nh筺 M玭 quan chi課 trng s? c蕄 phe T鑞g."
	elseif ( GetLevel() >= 60 ) then
		str = "дn 甶觤 b竜 danh Nh筺 M玭 quan chi課 trng cao c蕄 phe T鑞g."
	end
	if (DelItem( 2, 0, 107, 1) == 1) then
		NewWorld( bt_getsignpos( 1 ));
		SetFightState(0);
--		UseScrollEnable(0); -- 不限制其使用回城符
		Msg2Player( str );
	end
end

function ToLiao()	-- 进入辽方报名点
	local factionnumber = GetPlayerRoute()
	if( factionnumber == 0 ) then
		Say("Ngi ch璦 gia nh藀 m玭 ph竔 n祇! Chi課 trng r蕋 kh鑓 li謙! H鋍 xong v? ngh? h穣 quay l筰 tham chi課!", 0)
		return
	end
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "Chi課 trng r蕋 kh鑓 li謙! Gia nh藀 m玭 ph竔, h鋍 xong v? ngh? h穣 quay l筰 tham chi課!" );
		return
	elseif ( GetLevel() >= 40 and GetLevel() < 60 ) then
		str = "дn 甶觤 b竜 danh Nh筺 M玭 quan chi課 trng s? c蕄 phe Li猽."
	elseif ( GetLevel() >= 60 ) then
		str = "дn 甶觤 b竜 danh Nh筺 M玭 quan chi課 trng cao c蕄 phe Li猽."
	end
	if (DelItem( 2, 0, 108, 1 ) == 1) then
		NewWorld( bt_getsignpos( 2 ));
		SetFightState(0);
--		UseScrollEnable(0); -- 不限制其使用回城符
		Msg2Player( str );
	end
end


function Cancel()
end