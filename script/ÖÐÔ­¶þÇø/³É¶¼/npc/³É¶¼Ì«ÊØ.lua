--文件说明
--与成都太守对话的脚本
--created by lizhi
--2005-8-12 15:11

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_成都\\task_main.lua");

function main()
    local nStep = GetTask(TASK_CD_THREE);
    
    if nStep == 2 then
        task_three_02_01();
        return
    elseif nStep == 3 then
        task_three_03_01();
        return
    end;

	i=random(1,4)

	if i==1 then 
		Talk(1,"","T? th阨 nh? T莕 L? B╪g ki課  Giang Y觧, l骳  Th祅h Й l? v飊g t tr? ph? b箃 ng祅, l? kho lng th鵦 c? thi猲 h?. Nh璶g hi謓 nay m颽 m祅g th蕋 b竧, ta th﹏ l? Th竔 Th? th藅 h? th裯 v韎 b? t竛h l? d﹏!")
	elseif i==2 then
		Talk(1,"","T? khi B秐  S琻 H? X? T綾 b? v? ra th祅h m秐h, qu? qu竔 Phong Й t竎 y猽 t竎 qu竔, may nh? c竎 n? hi謕 Nga My x? th﹏ li襲 m筺g, Th祅h Й m韎 kh玭g b? hoang ph?!")
	elseif i==3 then
		Talk(1,"","Th阨 cu閏 bi課 lo筺, hy v鋘g s韒 c? ch﹏ anh h飊g  b譶h 鎛 thi猲 h? c鴘 n筺 b? t竛h!")
	else
		Talk(1,"","Con 阯g ph輆 Йng Th祅h Й  b? phong t醓, b? t竛h ra ngo礽 th祅h h穣 c萵 th薾!")
	end

end;