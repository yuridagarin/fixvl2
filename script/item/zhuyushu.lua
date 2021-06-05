--重阳节茱萸束
--by vivi
--2007/10/16

IB_VERSION = 1;

--任务变量
TASK_ZYS_NUM = 2319; --使用次数，最多5次
function OnUse()
	if GetTask(TASK_ZYS_NUM) == 5 then
		Talk(1,"","Xin l鏸, b筺  s� d鬾g 5 l莕 v藅 ph萴, kh玭g th� s� d鬾g 頲 n鱝. ");
		return
	end
	local szExp = "";
	local nLevel = GetLevel();
	if IB_VERSION == 1 then
		szExp = "Nh薾 頲 <color=yellow>"..floor(1500000*(nLevel^3)/(80^3)).." kinh nghi謒 <color>. ";
	else
		szExp = "Nh薾 頲 <color=yellow>"..floor(2500000*(nLevel^3)/(80^3)).." kinh nghi謒 <color>. ";
	end;	
	Say("S� d鬾g B� th� du, b筺 c� th� "..szExp.."S� d鬾g ch�?",
		2,
		"уng �/give_exp",
		"H駓 b�/nothing")
end

function give_exp()
	if DelItem(2,0,551,1) == 1 then
		local nLevel = GetLevel();
		local nExp = 0;
		if IB_VERSION == 1 then
			nExp = floor(1500000*(nLevel^3)/(80^3));
			ModifyExp(nExp);
			Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
		else
			nExp = floor(2500000*(nLevel^3)/(80^3));
			ModifyExp(nExp);
			Msg2Player("B筺 nh薾 頲 "..nExp.." 甶觤 kinh nghi謒");
		end;
		WriteLog("[Ho箃 ng m鮪g ti誸 Tr飊g Dng]:"..GetName().."nh薾 頲 1 l莕 thng:"..nExp.." 甶觤 kinh nghi謒");
		SetTask(TASK_ZYS_NUM,GetTask(TASK_ZYS_NUM)+1);
	end
end