--�����to�ᶼ
--GGH



function main(sel)
UWorld1402 = GetTask(1402)
if ( UWorld1402 >= 75 and  GetItemCount(2,1,150) >= 1 and  GetItemCount(2,3,7) >= 1 and  GetItemCount(2,3,4) >= 1 )  then
	NewWorld(307, 1472 ,3192)
	SetFightState(1);
elseif ( UWorld1402 == 70 and  GetItemCount(2,1,150) >= 1 and  GetItemCount(2,3,7) >= 1 and  GetItemCount(2,3,4) >= 1 )  then
	SetTask(1402,75)
	NewWorld(307, 1472 ,3192)
	SetFightState(1);
else
	Talk(1,"","Ng��i ph�m th��ng kh�ng th� v�o Qu� Th�nh chi b�ng ��n Nga My t�m D��ng Nguy�t S� Th�i th�nh gi�o.")
end
end;
