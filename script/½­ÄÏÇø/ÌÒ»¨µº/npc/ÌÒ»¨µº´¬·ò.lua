---�һ�������.lua---
function main()
	Say("Kh�ch quan c� mu�n r�i kh�i ��o?",2,"R�i kh�i ��o Hoa ��o (10 l��ng)/likaitaohuadao","Mu�n � l�i ��o/no");
end;
function likaitaohuadao()
	n=moneygo()
	if n==0 then 
		Talk(1,"","C� ti�n nh� quay l�i nh�!")
	else 
		NewWorld(104,1568,2975);
	end
end

function moneygo()
	if GetCash() >=1000 then
		PrePay(1000)
		return 1
	else
		return 0
	end
end;

function no()
end;