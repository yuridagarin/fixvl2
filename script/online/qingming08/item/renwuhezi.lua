--�ű����ƣ�2008�����ڻ����������
--�ű����ܣ����ʹ�����������ӣ������������
--�߻��ˣ�����
--�����д�ˣ�ī��
--�����дʱ�䣺2008-03-23
--�����޸ļ�¼��
Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
Include("\\script\\online\\qingming08\\head_qingming.lua")

tomb_sweep_2007_start_goodsID = 675      --�������һ�ı��

function OnUse()
	Say("Hoan ngh�nh s� d�ng h�p nhi�m v�! Xin h�i ng��i mu�n ti�p nh�n m�t �� nhi�m v� n�o?",
	6,
	"M�t �� nhi�m v� 1/#add_reel_task(1)",
	"M�t �� nhi�m v� 2/#add_reel_task(2)",
	"M�t �� nhi�m v� 3/#add_reel_task(3)",
	"M�t �� nhi�m v� 4/#add_reel_task(4)",
	"Trang k�/#next_page(1)",
	"��ng h�p, t�m th�i ta kh�ng c�n m�t �� nhi�m v�./nothing"
	);
end;

function next_page(flag)
	if flag == 1 then
		Say("Hoan ngh�nh s� d�ng h�p nhi�m v�! Xin h�i ng��i mu�n ti�p nh�n m�t �� nhi�m v� n�o?",
		6,
		"M�t �� nhi�m v� 5/#add_reel_task(5)",
		"M�t �� nhi�m v� 6/#add_reel_task(6)",
		"M�t �� nhi�m v� 7/#add_reel_task(7)",
		"M�t �� nhi�m v� 8/#add_reel_task(8)",
		"Trang k�/#next_page(2)",
		"��ng h�p, t�m th�i ta kh�ng c�n m�t �� nhi�m v�./nothing"
		);
	else--flag
		Say("Hoan ngh�nh s� d�ng h�p nhi�m v�! Xin h�i ng��i mu�n ti�p nh�n m�t �� nhi�m v� n�o?",
		3,
		"M�t �� nhi�m v� 9/#add_reel_task(9)",
		"M�t �� nhi�m v� 10/#add_reel_task(10)",
		"��ng h�p, t�m th�i ta kh�ng c�n m�t �� nhi�m v�./nothing"
		);
	end;--if
end;

function nothing()
end;

function add_reel_task(flag)
	--ʱ���ж�
	local date_chk = is_qingming_opened()
	if date_chk == 1 then
		
	else
		Talk(1,"","<color=green>Nh�c nh�<color>: V�t ph�m n�y ch� s� d�ng trong ho�t ��ng Thanh Minh <color=yellow>3-4-2008 ��n 12-4<color>.")
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then--���ؼ��
		return
	end
	if DelItem(2,0,777,1) ~= 1 then
		WriteLog("Ti�t Thanh Minh 08: H�y h�p nhi�m v� th�t b�i!");
		return
	end;--if
	if AddItem(2,0,tomb_sweep_2007_start_goodsID + flag - 1,1) ~= 1 then
		WriteLog("Ti�t Thanh Minh 08: H�p nhi�m v� t�ng m�t �� nhi�m v�"..flag.."Th�t b�i!");
		return
	end;
	
end;