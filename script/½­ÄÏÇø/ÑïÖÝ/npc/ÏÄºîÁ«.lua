--在扬州任务夏侯莲
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_扬州\\task_main.lua");
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20130614 and nDate <= 20130714 then	
	--冰凉冰棒活动
	--local tSay = aah_GetSayDialog(89);
	--国际儿童节
		local tSay = aah_GetSayDialog(93);
		if getn(tSay) > 0 then
			tinsert(tSay, "Tho竧/nothing");
			Say(format("<color=green>H? H莡 Li猲<color>: %s mang m鉵 ngon g? n t苙g mu閕 th??", GetPlayerSex()), getn(tSay), tSay);
			return 0;
		end
	end
	
  local nStep = GetTask(TASK_YZ_TWO);
  if nStep == 7 then
      if GetSex() == 1 then
          Talk(1,"","Чi ca ca! Mu閕 thng 產u b鬾g, to祅 th﹏ ng鴄 ng竬. Kh? ch辵 qu?!...");
      elseif GetSex() == 2 then
          Talk(1,"","Чi t? t?! Mu閕 thng 產u b鬾g, to祅 th﹏ ng鴄 ng竬. Kh? ch辵 qu?!...");
      end
      return
	end
  
  nStep = GetTask(TASK_FIVE);
  if nStep == 10 then
      task_10_00();
      return
  elseif nStep >= 11 and nStep < 19 then
      Talk(1,"","Ha ha ha.");
      return
  elseif nStep == 19 then
      task_19_00();
      return
  elseif nStep > 19 then
      Talk(1,"","Ha ha ha.");
      return
  end;
end;

function nothing()

end