Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2011_12\\qingrenjie\\sale_chocolate.lua")
Include("\\script\\online_activites\\201202\\zengsongpifeng\\send_pifeng.lua")
Include("\\script\\online_activites\\201211\\jixiang_ruyi.lua")

function main()
	if gf_CheckEventDateEx(53) == 1 then
		Say("#<color=green>Lasa<color>: b�n Socola l� t�nh nh�n",2,"Ta ��n mua Socola l� t�nh nh�n/buy_chocolate","Ta ch� gh� ch�i/do_nothing");
		return 1;
	end
	if gf_CheckEventDateEx(57) == 1 then
		Say("<color=green>Lasa<color>:t�ng Ho�ng Kim Phi Phong cho t�t c� n� sinh trong th�nh (<color=green>�� s� d�ng ph�n th��ng cu�i c�a event 8 thang 3 s� nh�n ���c ph�n th��ng cu�i phong ph� h�n<color>)",2,"M�i SaSa thay ta t�ng Phi Phong cho c�c ch� em ph� n� trong th�nh (ti�u hao 8 Phi Phong Ho�ng Kim + 3 v�ng)/deal_send","Ta ch� gh� ch�i/do_nothing")
		return 1;
	end
	if gf_CheckEventDateEx(VET_ACTIVITY_JIXIANG_RUYI) == 1 then
		Say("<color=green>La Sa<color>: Gi�ng sinh vui v�!", getn(TABLE_JIXIANG_RUYI), TABLE_JIXIANG_RUYI);
		return 1;
	end
	Say("<color=green>La Sa<color>: Th�t ra h� ti�ng hoa c�a ta l� h� T��ng, nghe hay kh�ng?",0)
end

function do_nothing()
end