--问题答对后的奖励

AwardExp = {
	20,
	50,
	360,
	630,
	1000,
	1800,
	3700,
	5700,
	16000,
	40000,
}

-- 回答正确的经验奖励
function QuesAward()
--	 AddItem(1,0,2,1)
	 nLevel = GetAwardLevel()
	 nAddExp = AwardExp[nLevel / 10] 
	 nRandom = random(1,1000)
	
	 if ( nRandom == 999 ) then
		nAddExp = nAddExp * 20
	 end
	 
     ModifyExp(nAddExp)
end


--超过规定次数的问题答错后的惩罚
function Punish(nParam)
	 UseSkillEnable(0)
	 if (nParam > 0) then
		Talk(1,"","<color=red>**<color>: B筺  s? d鬾g chng tr譶h auto, s? b? b? t?, xin h穣 y猽 th輈h tr? ch琲, ng d飊g auto!")
	 else
		Talk(1,"","<color=red>**<color>: B筺  s? d鬾g chng tr譶h auto, nh﹏ v藅 s? b? ng b╪g, xin h穣 y猽 th輈h tr? ch琲, ng d飊g auto!")
	 end
end

--逃避答题的惩罚
function PunishAnnouce(nParam)
	 UseSkillEnable(0)
	 Talk(1,"","<color=red>**<color>: B筺 b? 甶觤 huy謙 o, trong"..nParam.." ph髏 b筺 s? kh玭g th? s? d鬾g v? c玭g!")
end

--恢复逃避答题的惩罚
function PunishEndAnnouce()
	 UseSkillEnable(1)
	 Talk(1,"","<color=red>**<color>: Huy謙 o c馻 b筺  頲 gi秈, c? th? s? d鬾g l筰 v? c玭g!")
end

-- 被举报后回答正确的奖励
function QuesAward2()
     Restore()
end

-- 关入天牢的人刑满释放后的公告
function ReleaseAnnouce()
	 Talk(1,"","<color=red>**<color>: Th阨 gian th? h譶h c馻 b筺  , c? th? t譵 cai ng鬰  r阨 thi猲 lao!")
end

-- 关入天牢的人刑满一半后的贿赂提示
function BribeAnnouce()
	 Talk(1,"","<color=red>**<color>: B筺  ? y 頲 m閠 th阨 gian, c? th? t譵 cai ng鬰  ra t?!")
end
