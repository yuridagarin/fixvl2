--罗汉灵丹：增加1~5％当前经验，最大不超过50万点
function OnUse()

local PlayerExpAdd = floor(random(1,5)*0.01*GetExp());
	
	if PlayerExpAdd == 0 then 
		ModifyExp(1);
		DelItem(2,0,136,1,1);
		Say("B筺  s� d鬾g 1 vi猲 La H竛 Linh n, t╪g th猰 <color=yellow>1<color> 甶觤 kinh nghi謒!",0);
		return 
	elseif PlayerExpAdd<= 500000 then
		ModifyExp(PlayerExpAdd);
		DelItem(2,0,136,1,1);
		Say("B筺  s� d鬾g 1 vi猲 La H竛 Linh n, t╪g th猰 <color=yellow>"..PlayerExpAdd.."<color> 甶觤 kinh nghi謒!",0);
		return 
	else
		ModifyExp(500000);
		DelItem(2,0,136,1,1);
		Say("B筺  s� d鬾g 1 vi猲 La H竛 Linh n, t╪g th猰 <color=yellow>500000<color> 甶觤 kinh nghi謒!",0);
		return
		
	end;
		
end;
