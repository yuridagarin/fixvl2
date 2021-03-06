--九转玄功系统
--by vivi
--2008/10/10

--任务变量
TASK_XUANGONG_TELL = 1040;   --提示九转玄功系统
TASK_XUANGONG_NUM = 1041;    --修炼九转玄功的次数
TASK_XUANGONG_WEEK = 1042;   --每周换一次

--全局变量
XUANGONG_QIANNENG = 5;      --一次换取的潜能点
XUAnGONG_TOTAL_NUM = 10;    --修炼的次数上限 
XUANGONG_EXP = 2000000000;  --一次需要消耗的经验值

function main()
	local nLv = GetLevel();
	if nLv ~= 99 then
		Talk(1,"","<color=green>Trng l穙 V? L﹎<color>: Ta c? th? d箉 ngi Ti猲 Thi猲 Th竔 D辌h H鏽 Nguy猲 C玭g, c玭g phu n祔 m鏸 l莕 tu th祅h, c? th? t╪g 5 甶觤 ti襪 n╪g. Nh璶g lo筰 th莕 c玭g n祔 kh玭g d? h鋍, trc ti猲 ph秈 t n c蕄 99 c秐h gi韎 thi猲 vi猲 m穘 m韎 c? th? tu th祅h, ngo礽 ra c遪 c莕 quy觧 Th竔 D辌h H鏽 Nguy猲 Ph?, ngi mau luy謓 n c蕄 99 r錳 h絥 n t譵 ta!");
		return
	else	
		SetTask(TASK_XUANGONG_TELL,1);
		Say("<color=green>Trng l穙 V? L﹎<color>: Kh玭g ng? ngi  t n tr譶h  n祔, 頲, ta s? truy襫 d箉 cho ngi Ti猲 Thi猲Th竔 D辌h H鏽 Nguy猲 C玭g c馻 v? l﹎, th莕 c玭g n祔 c莕 c? <color=yellow>2 t? kinh nghi謒<color> v? <color=yellow>1 quy觧 Th竔 D辌h H鏽 Nguy猲 Ph?<color> m韎 c? th? luy謓, m鏸 l莕 tu th祅h c? th? t╪g 5 甶觤 ti襪 n╪g. V韎 t? ch蕋 c馻 ngi c? th? luy謓 <color=yellow>10 l莕<color>, hi謓 gi? ngi  luy謓 頲 <color=yellow>"..GetTask(TASK_XUANGONG_NUM).."<color> l莕. M鏸 tu莕 ch? c? th? luy謓 <color=yellow>1 l莕<color>. (s? l莕 luy謓 th莕 c玭g n祔 s? 秐h hng n x誴 h筺g c馻 nh﹏ v藅, luy謓 1 l莕 tng 琻g 2 t? kinh nghi謒)",
				2,
				"\nTa mu鑞 luy謓 Ti猲 Thi猲 Th竔 D辌h H鏽 Nguy猲 C玭g (m蕋 2 t? kinh nghi謒)/xiulian_wugong",
				"\nT筸 th阨 ch璦 mu鑞 luy謓/nothing")
	end
end

function nothing()

end

function xiulian_wugong()
	local nNum = GetTask(TASK_XUANGONG_NUM);
	local nWeek = GetWeekSequence(1,0);
	if nNum >= 10 then
		Talk(1,"","<color=green>Trng l穙 V? L﹎<color>: T? ch蕋 hi謓 gi? c馻 ngi ch? c? th? luy謓 <color=yellow>10 l莕<color>, ngi  luy謓 10 l莕.");
		return
	end
	if GetTask(TASK_XUANGONG_WEEK) == nWeek then
		Talk(1,"","<color=green>Trng l穙 V? L﹎<color>: M鏸 tu莕 ch? c? th? luy謓 1 l莕, tu莕 n祔 ngi  luy謓 r錳.");
		return
	end
	Say("<color=green>Trng l穙 V? L﹎<color>: Mu鑞 luy謓 th莕 c玭g n祔 <color=yeloow>c莕 c? 2 t? kinh nghi謒 v? 1 quy觧 Th竔 D辌h H鏽 Nguy猲 Ph?<color>, ta c? Th竔 D辌h H鏽 Nguy猲 Ph? t譵 頲 ? T﹜ B綾 <color=yellow>M? cung sa m筩<color>, nh璶g ch? c? th? gi髉 ngi 1 l莕, l莕 sau ngi t? t譵 l蕐. Зy l? l莕 th? <color=yellow>"..(nNum+1).."<color> ngi luy謓 th莕 c玭g n祔!",
		2,
		"\nTa mu鑞 b総 u luy謓/confirm_xiulian",
		"\nT筸 th阨 ch璦 mu鑞 luy謓/nothing")
end

function confirm_xiulian()
	local nExp = GetExp();
	local nNum = GetTask(TASK_XUANGONG_NUM);
	local nWeek = GetWeekSequence(1,0);
	if nNum >= 10 then
		Talk(1,"","<color=green>Trng l穙 V? L﹎<color>: T? ch蕋 hi謓 gi? c馻 ngi ch? c? th? luy謓 <color=yellow>10 l莕<color>, ngi  luy謓 10 l莕.");
		return
	end	
	if nExp < XUANGONG_EXP then
		Talk(1,"","<color=green>Trng l穙 V? L﹎<color>: Luy謓 Ti猲 Thi猲 Th竔 D辌h H鏽 Nguy猲 C玭g c莕 <color=yellow>2 t? kinh nghi謒<color>, kinh nghi謒 c馻 ngi kh玭g .");
		return
	end
	if GetTask(TASK_XUANGONG_WEEK) == nWeek then
		Talk(1,"","<color=green>Trng l穙 V? L﹎<color>: M鏸 tu莕 ch? c? th? luy謓 1 l莕, tu莕 n祔 ngi  luy謓 r錳.");
		return
	end	
	if nNum >= 1 then  --第一次不用
 		if GetItemCount(2,0,1083) < 1 then
			Talk(1,"","<color=green>Trng l穙 V? L﹎<color>: Luy謓 Ti猲 Thi猲 Th竔 D辌h H鏽 Nguy猲 C玭g c莕 c? <color=yellow>quy觧 Th竔 D辌h H鏽 Nguy猲 Ph?<color>, hi謓 gi? ngi kh玭g c?.");
			return
		end
	end
	if nNum >= 1 then		--第一次不用
		if DelItem(2,0,1083,1) ~= 1 then
			return
		end
	end
	SetTask(TASK_XUANGONG_NUM,nNum+1);
	SetTask(TASK_XUANGONG_WEEK,nWeek);
	ModifyExp(-XUANGONG_EXP);
	AddProp(XUANGONG_QIANNENG);
	Talk(1,"","<color=green>Trng l穙 V? L﹎<color>: Ch骳 m鮪g ngi  luy謓 th祅h c玭g Ti猲 Thi猲 Th竔 D辌h H鏽 Nguy猲 C玭g, t╪g "..XUANGONG_QIANNENG.." 甶觤 ti襪 n╪g.");	 
	Msg2Global("Чi hi謕"..GetName().."Л頲 s? ch? d蒼 c馻 Trng l穙 V? L﹎,  luy謓 n c秐h gi韎 Ti猲 Thi猲, nh薾 頲 甶觤 ti襪 n╪g, luy謓 th祅h c玭g Ti猲 Thi猲 Th竔 D辌h H鏽 Nguy猲 C玭g!");
	WriteLog("Ngi ch琲"..GetName().."Х luy謓 1 l莕 Ti猲 Thi猲 Th竔 D辌h H鏽 Nguy猲 C玭g.");
end

function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--计算周的序数
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--处理时差
	nCurTime = nCurTime - 4*24*3600;	--对齐到1970年1月1日（星期四）后的第一个周一凌晨。
	local nWeekSecond = 7*24*3600;	--一周多少秒
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--计算偏移时间
	local nTotalTime = nCurTime - nOffset;	--计算后的总时间
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--计算周的序数
	return nWeekSeq;
end;