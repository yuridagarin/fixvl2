--任务
--地点：雁门关  任务：天门阵任务结点8
--策划：樊万松  2004.03.


function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 55 )  then
	Talk(6,"","D竚 h醝 <color=red>H祅 Tr? Nhng<color> l穙 nh﹏ c遪 c? tr? n琲 n祔?","Ngi l祬??","T筰 h? l? h? h祅g xa c馻 ngi n祔, 頲 nh? n v蕁 an l穙 nh﹏!","T鑤 l緈! Xem nh? ngi c? l遪g! M蕐 n╩ nay H祅 Tr? Nhng l穙 nh﹏ ch辵 r蕋 nhi襲 kh? s?! в tu鎖 gi? 頲 y猲 b譶h, l穙  chuy觧 n s鑞g ? <color=red>H筺h Hoa th玭<color>!"," t? l遪g t鑤 c馻 ngi! T筰 h? 甶 ngay y!","ng qu猲 nh緉 gi髉 ta, l穙 c遪 n? ta <color=yellow>m閠 nh竧 產o<color>! Kh? kh?!...")
    SetTask(1401,60)
    ----AddItem(0,0,0)
    --Earn(10000)
    ModifyExp(10000)
    AddNote("дn H筺h Hoa th玭 h醝 th╩ Trng V﹏ v? H祅 l穙!")
    Msg2Player("дn H筺h Hoa th玭 h醝 th╩ Trng V﹏ v? H祅 l穙!")

elseif ( UWorld1401  == 60  ) then
	Talk(1,"","в tu鎖 gi? 頲 y猲 b譶h, m蕐 n╩ trc H祅 Tr? Nhng l穙 nh﹏  chuy觧 n s鑞g ? <color=red>H筺h Hoa th玭<color>! H穣 n  t譵 玭g ta!")
	
elseif ( UWorld1401  > 60  ) then
	Talk(1,"","Sao? H祅 Tr? Nhng hi謓 s鑞g ra sao?")
else
	Talk(1,"","Gi芻 Khi誸 n n khi n祇 m韎 lui qu﹏? C遪 b鉵g gi芻, d﹏ ch髇g u c秏 th蕐 b蕋 an!")
end
end;
