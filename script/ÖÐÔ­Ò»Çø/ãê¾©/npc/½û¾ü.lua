Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");

function main()
local nTaskValuem = FN_GetTaskState(FN_YMM);

	if (nTaskValuem==3) then
		task_007();
		return
  end;
	i=random(1,4)
	if i==1 then 
		Talk(1,"","��ng l�i! Ch�n s�ng r�i sao d�m x�m nh�p ho�ng cung!")
	elseif i==2 then
		Talk(1,"","�! M� to con m�t xem ��y l� ��u! C�t x�o!")
	elseif i==3 then
		Talk(1,"","C�m ��a ho�ng cung t� � x�ng v�o gi�t kh�ng tha!")
	else
		Talk(1,"","Quan vi�n d��i t� ph�m ch�a ���c truy�n kh�ng ���c ph�p v�o cung tr�i l�nh ch�m!")
	end
end
