--gtask功能脚本
--加入翠烟门派
--taskid 141

function JoinFaction()
	if GetLevel() < 10 then
		Talk(1,"","Ch璦 t c蕄 10, kh玭g th? gia nh藀 m玭 ph竔.");
		return 0;
	end
	
	if GetPlayerFaction() > 0 then
		Talk(1,"",format("Thi誹 hi謕  gia nh藀 v祇 m玭 ph竔 kh竎, kh玭g th? gia nh藀 %s r錳.", "Th髖 Y猲"));
		return 0;
	end
	
	--不是女号
	if GetSex() ~= 2 then
		return 0;
	end
	
	--加入翠烟门派
	SetPlayerFaction(10);
	SetCurrentNpcSFX(PIdx2NpcIdx(), 921, 1, 0, 18 *3);
	TaskTip(format("C竎 h?  gia nh藀 %s, hi謓 t筰 c? th? t譵 s? ph? b竔 s? h鋍 v? r錳!", "Th髖 Y猲"));
	Msg2Player(format("C竎 h?  gia nh藀 %s, hi謓 t筰 c? th? t譵 s? ph? b竔 s? h鋍 v? r錳!", "Th髖 Y猲"));
end

dostring("JoinFaction()");
