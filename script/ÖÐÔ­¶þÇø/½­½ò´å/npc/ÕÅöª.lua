--����
--�ص㣺 ����
--�߻���������  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()

	if GetTask(150) == 9 then
		Say("T�m ta c� vi�c g�?",
			4,
			"T�m hi�u t�nh h�nh Giang T�n th�n/fengdu",
			"L�m c�ch n�o �i�u khi�n T�a Y�u chung?/suoyaozhong",
			"��i hi�p! Ta c� th� gi�p g�?/huanyouhun",
			"Kh�ng c� g�/no")
	else
		Say("T�m ta c� vi�c g�?",
			3,
			"T�m hi�u t�nh h�nh Giang T�n th�n/fengdu",
			"��i hi�p! Ta c� th� gi�p g�?/huanyouhun",
			"Kh�ng c� g�/no")
	end

end

function huanyouhun()
UWorld1402 = GetTask(1402)
if ( UWorld1402 > 20 )  then
		Say("Ta c�n <color=red>K� Th�ch Tuy�t Ph�ch<color> c�a <color=red>B�ng Qu�i<color> � t�ng 2 B�ng T�m ��ng �� l�m Thi�n Lang Ch�m, n�u ng��i c� th� t�m gi�p ta <color=red>15 Tuy�t Ph�ch<color> �� ta l�m ph�p kh�, ta s� cho ng��i 10 vi�n k� th�ch <color=red>U H�n<color>.",
		2,
		"��a ng��i 15 Tuy�t Ph�ch/huan",
		"Sau n�y h�y t�nh/no")
		else 
		Say("T�m th�i kh�ng c�n ng��i gi�p.",0)
end
end

function huan()
	if	GetItemCount(2,1,45) >= 15 then
	DelItem(2,1,45,15)
	AddItem(2,1,51,10)
	Say("�a t� b�ng h�u!", 0);	
	else
	Say("H�nh nh� Tuy�t Ph�ch kh�ng ��! B�ng h�u qu�n mang theo r�i �?",0)
end
end;


function fengdu()
UWorld1402 = GetTask(1402)
if ( UWorld1402 == 10 )  then
		Talk(2,"","Ta �� tr�ng Thi ��c, mau t�m <color=red>10 Ph� Ma Ch�<color> ��n kh�c ch� ch�ng!","T�i h� �i ngay!")
		SetTask(1402,15)
elseif ( UWorld1402  == 15 and  GetItemCount(2,3,12) < 9 ) then
		Talk(1,"","Mau t�m <color=red>10 Ph� Ma Ch�<color> v� ��y! Nhanh l�n!")
elseif ( UWorld1402  == 15 and  GetItemCount(2,3,12) >  9 ) then
		if  DelItem(2,3,12,10) == 1 then 
				Talk(1,"","Hay l�m! �a t� b�ng h�u t��ng tr�! Ta v�n ngh� ch� c�n m�t m�nh ta c�ng c� th� �u�i b�n y�u ma qu� qu�i nh�ng xem ra kh�ng ���c. h�y ��n <color=red>Nga My s�n<color> t�m <color=red>D��ng Nguy�t S� Th�i<color>, v�i ph�p l�c c�a b� ta kh�ng ch�ng s� c� c�ch ��i ph�.")
				 SetTask(1402,20)
				 --AddItem(1,1,1,1)
				 Earn(800)
				 GivePlayerExp(SkeyFDGC,"fengduguicheng2")		--�ᶼ���2
				 ModifyReputation(10,0)
				 --AddNote("ȥ��üɽ����������ʦ̫��������ʲô�취��")
				 TaskTip("��n Nga My s�n nh� D��ng Nguy�t S� Th�i gi�p ��.")
		else
				 Talk(1,"","Chuy�n giao v�t ph�m kh�ng th�nh c�ng")
		end
elseif ( UWorld1402  == 20 ) then
				Talk(1,"","��m y�u nghi�t n�y nh�t ��nh c� ch�t xu�t s�, h�y ��n <color=red>Nga My s�n<color> t�m <color=red>D��ng Nguy�t S� Th�i<color>, v�i ph�p l�c c�a b� ta kh�ng ch�ng s� c� c�ch ��i ph�.")
else
		Talk(1,"","Ta nh�t ��nh s� di�t tr� b�n y�u nghi�t n�y!")
end
end;

function suoyaozhong()

	if GetItemCount(2,1,19) >= 30 then
		Talk(5,"",
				"Ti�n b�i ��y l� 30 �u�i h�.",
				"Hay l�m! Ch� ta ch�t x�u.",
				"M�t l�t sau��",
				"��y l� H�nh Thi v� H� Thi ng��i c�n, mau �em v� cho <color=yellow>Gia C�t K�<color>.",
				"�a t� ti�n b�i!"
				);
		DelItem(2,1,19,30);
		AddItem(2,0,85,25);
		AddItem(2,0,86,15);
		TaskTip("�em Oan H�n v� cho Gia C�t K�");
	else
		Talk(2,"",
				"���c bi�t ti�n b�i bi�t c�ch d�ng T�a Y�u chung thu ph�c H�nh thi v� H� Thi n�n m�o mu�i nh� ti�n b�i ch� d�n cho!",
				"��ng v�y! �� ph�t huy uy l�c c�a T�a Y�u chung c�n <color=yellow>30 c�i �u�i h�<color>, ng��i th� ��n <color=yellow>Thi�u L�m<color> t�m xem!"
				);
		TaskTip("�em 30 �u�i h� cho Tr��ng ��nh");	
	end
end

function no()

end