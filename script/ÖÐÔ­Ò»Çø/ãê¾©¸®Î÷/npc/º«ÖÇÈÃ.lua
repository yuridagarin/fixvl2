--任务
--地点：雁门关  任务：天门阵任务结点8
--策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");

function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 70 )  then
	Talk(7,"hzrtalk","Xin h醝 ti猲 sinh c? ph秈 l? H祅 Tr? Nhng?","L? ta y! Ngi t譵 ta c? chuy謓 g? kh玭g?","Cu鑙 c飊g c騨g g苝 頲 l穙 r錳. Ta ch輓h l? h藆 nh﹏ c馻 c鮱 nh﹏ l穙 y. Nay ph秈 ph鬰 m謓h n Li猽 Qu鑓, nghe n鉯 l穙 c? ngi quen b猲 , c? c莕 nh緉 nh? g? kh玭g ta chuy觧 l阨 gi髉.","B筺 tr? l? h藆 b鑙 c馻 ai trong th﹏ t閏 ta? C? th? n鉯 r? ch髏 kh玭g?","L穙 qu猲 r錳 sao? L穙 c遪 n? ngi  <color=yellow>1 nh竧 產o<color>!...","Ta nh? r錳. C﹗ chuy謓 <color=yelow>1 nh竧 產o<color> sau n祔 ta s? k? ngi nghe. Ngi quen Li猽 Qu鑓 ch輓h l? l穙 phu. Qu? th藅 n╩ x璦 ta c? m閠 h錸g nhan tri k? ngi Khi誸 產n. Ta v? n祅g g苝 nhau ? Nh筺 M玭 quan, r錳 Khi誸 n 甧m qu﹏ nh Trung Nguy猲. Ngi H竛 n鉯 n祅g l? c萿 Khi誸 n, ch鰅 v? nh p n祅g. Ta c騨g mang ti課g l? gian t?. Nh鱪g ng祔 , ch髇g ta  tr秈 qua mu玭 v祅 kh? s?!","Sau  th? n祇?")
    SetTask(1401,75)
    GivePlayerExp(SkeyTianmenzhen,"tandexialuo")
    Earn(1000)
    ModifyReputation(15,0)
    --AddNote("可以动身去雁门关以外的大草原了，需要去寻找萧燕燕以及韩德让。")
    TaskTip("дn i th秓 nguy猲 ngo礽 Nh筺 M玭 quan t譵 Ti猽 Y課 Y課 v? H祅 c Nhng.")
	
elseif ( UWorld1401  == 75  )then
	Talk(1,"","H穣 n Li猽 Qu鑓 t譵 <color=red>Ti猽 Y課 Y課<color> ho芻 <color=red>H祅 c Nhng<color>!")
else
	Talk(1,"","Ng祔 th竛g an hng tu鎖 gi?, qu? th藅 thanh t辬h!")
end
end;


function hzrtalk()
	Talk(2,"","Sau n祔 n祅g quay v? c? hng匩誹 c? g苝 n祅g, h穣 n鉯 r籲g ta gi韎 thi謚 ngi t韎, c? chuy謓 g? n祅g s? gi髉 ngi lo li謚! T猲 n祅g l? <color=red>Ti猽 Y課 Y課<color>. Ngi c騨g c? th? t譵 <color=red>H祅 c Nhng<color>, em trai ta!","Xin c竜 t?!")

end;
