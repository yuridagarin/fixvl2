--冯彤儿
--created by lizhi
--2005-9-1 16:19

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	--活动的
	local tSay = {};
	--副活动
	local tActivityID = {116};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
	end
	if getn(tSay) > 0 then
		tinsert(tSay, "Ra kh醝/nothing")
		Say("<color=green>Ph飊g уng Nhi<color>: Ngi c? nh譶 th蕐 畂祅 ngi ng鵤 ngo礽 th祅h kh玭g? Ngi d蒼 u t猲 L玦 Th緉g, ngi  nh譶 th蕐 ch璦?", getn(tSay), tSay);
		return 
	end
	-------
	 
  local nStep = GetTask(TASK_YZ_ONE);
  if nStep == 1 then
      task_01_00();
  elseif nStep == 2 then
      local szTalk = {
          "Ta kh玭g sao u. <sex> ng qu? lo l緉g cho ta!"
      }
      TalkEx("", szTalk);
  else
      Talk(1,"","<color=green>Ph飊g уng Nhi<color>: Ngi c? nh譶 th蕐 畂祅 ngi ng鵤 ngo礽 th祅h kh玭g? Ngi d蒼 u t猲 L玦 Th緉g, ngi  nh譶 th蕐 ch璦?");
  end;
end;

function task_01_00()
    local szTalk = {
        "V? y l? Ph飊g уng Nhi? Ta  mang n m閠 tin kh玭g vui厖.",
        "Ngi c? n鉯! Ta 輙 nhi襲  畂竛 頲 chuy謓 b蕋 h筺h!",
        "L玦 Th緉g  b? h穖 h筰 tr猲 阯g n Dng Ch﹗... L玦 huynh  ra 甶 m穒 m穒 匱筰 h? nh譶 th蕐 tr猲 ngi L玦 huynh c? b鴆 phong th?. Hy v鋘g c? 頲 ch髏 t﹎ nguy謓 cu鑙 c飊g, huynh 蕐 g鰅 l筰 cho c? nng!",
        "Ta v? ch祅g s緋 n猲 ngh躠 phu th?...n祇 ng?....Ch祅g t鮪g n鉯 v韎 ta匱rc kia, ch祅g l? ngi c馻 Xi H醓 gi竜,  h穖 h筰 nhi襲 ngi n猲 trong l遪g kh玭g y猲, e r籲g sau n祔 c遪 秐h hng n con c竔. Ch祅g  quy誸 nh r阨 kh醝 giang h?, c飊g v? con s鑞g cu閏 i 萵 d藅, vui th? 甶襫 vi猲!"
    };
    TalkEx("task_01_00_00", szTalk);
end;

function task_01_00_00()
    local szTalk = {
        "V? v藋 m韎 n猲 c? s? 產u l遪g?",
        "ng! M蕐 ng祔 trc, thu閏 h? c馻 ch祅g m韎 mang t韎 m閠 m鉵  r蕋 quan tr鋘g. Ch祅g c遪 bi誸 H? H莡 C莔 l? ngi li猲 l筩 c馻 Trng Ca M玭 n猲 quy誸 nh mang v藅 quan tr鋘g n祔 n cho n祅g. C? l? ch祅g  畂竛 頲 nh鱪g nguy hi觤 tr猲 阯g 甶 n猲   ta t? m譶h n Dng Ch﹗? Th藅 b蕋 h筺h cho i ta....",
        "C? nng h穣 y猲 t﹎! T筰 h? nh蕋 nh s? t譵 ra hung th?!",
        "B? 甶! T譵 l祄 g?? B竜 th? ?? Ph薾 li評 y誹 nh? ta th? b竜 th? g? ch?! N誹 c? b竜 th?, ch祅g c騨g kh玭g s鑞g l筰 頲, l筰 g﹜ th猰 th? h薾 ch蕋 ch錸g! Th玦 th讌",
        "C? nng ngh? 頲 nh? v藋, t筰 h? c秏 th蕐 y猲 l遪g. C? nng h穣 b譶h t﹎, n衝 產u thng  s鑞g nh鱪g ng祔 vui v? sau n祔!"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    DelItem(2,0,101,1);
    SetTask(TASK_YZ_ONE, 2);
    GivePlayerAward("Level_31", "easy", "head", "Level_31");
	GivePlayerExp(SkeyYZxiahouqin,"zuihoudeyuqishu")		--最后的与妻书
end;