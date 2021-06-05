--ʥ�𴫵ݻ������ʸ�֤��
--by vivi
--2008/05/30

Include("\\script\\online\\aoyun08\\aoyun_head.lua")

function OnUse()
	if GetTask(547) == 0 or GetTask(TASK_AOYUN_HUOJU_NUM) == 0 then
		Talk(1,"","<color=green>Ch�ng nh�n quy�n r��c �u�c<color>: Xin l�i, b�n kh�ng ph�i ng��i r��c �u�c.");
		return
	end
	local nTask = GetTask(TASK_AOYUN_HUOJU_NUM);
	local nStrtab = {
		"T�m hi�u ph�n th��ng/huojushou_award",
		"��a ta ��n ��i �u�c t��ng �ng (50 b�c)/goto_huojutai",
		"T�m t�a �� ��i �u�c/huoju_zuobiao",
		"Tho�t/nothing"
		};
	if nTask == 1 then
		Say("<color=green>Ch�ng nh�n quy�n r��c �u�c<color>: Ch�c m�ng, b�n �� t� <color=yellow>Th�nh H�a ��i<color> nh�n ���c Th�nh H�a, chuy�n ��n <color=yellow>��i �u�c 1<color>, xin chu�n b� trong ng�y r��c �u�c, chuy�n ng�n th� nh�t! <color=yellow>Tr��c khi Th�nh H�a ��i b�c ch�y<color> chuy�n ��n ��i �u�c 1, n�u kh�ng ��n ��ng gi� th� s� kh�ng nh�n ���c ph�n th��ng.",
			getn(nStrtab),
			nStrtab);
	elseif nTask == 30 then
		Say("<color=green>Ch�ng nh�n quy�n r��c �u�c<color>: Ch�c m�ng, b�n �� t� <color=yellow>��i �u�c 29<color> nh�n ���c Th�nh H�a, chuy�n ��n <color=yellow>��i �u�c th�nh th�<color>, xin chu�n b� trong ng�y r��c �u�c, chuy�n ng�n cu�i c�ng! <color=yellow>Tr��c khi Th�nh H�a ��i b�c ch�y<color> chuy�n ��n ��i �u�c th�nh th�, n�u kh�ng ��n ��ng gi� th� s� kh�ng nh�n ���c ph�n th��ng.",
			getn(nStrtab),
			nStrtab);
	else
		Say("<color=green>Ch�ng nh�n quy�n r��c �u�c<color>: Ch�c m�ng, t� ��i �u�c <color=yellow>"..(nTask-1).."<color> nh�n ���c Th�nh H�a, chuy�n ��n ��i �u�c <color=yellow>"..nTask.."<color>, xin chu�n b� trong ng�y r��c �u�c, chuy�n ng�n n�y! <color=yellow>Tr��c khi Th�nh H�a ��i b�c ch�y<color> chuy�n ��n ��i �u�c "..nTask..", n�u kh�ng ��n ��ng gi� th� s� kh�ng nh�n ���c ph�n th��ng.",
			getn(nStrtab),
			nStrtab);
	end
end

function huojushou_award()
	Talk(1,"","<color=green>Ch�ng nh�n quy�n r��c �u�c<color>: Ph�n th��ng ng��i r��c �u�c nh� sau:\nSau khi ho�t ��ng b�t ��u, ch� c�n chuy�n �u�c t� ��i �u�c hi�n t�i ��n ��i �u�c ch� ��nh l� c� th� nh�n ph�n th��ng kinh nghi�m l�p ph��ng ��ng c�p x 15. N�u c�p 99 c� th� nh�n 1 vi�n Linh th�ch ng�u nhi�n c�p 7.\nSau khi k�t th�c ho�t ��ng, trong 2 ph�t nh�n ��i �u�c ch� ��nh l� c� th� nh�n ph�n th��ng kinh nghi�m l�p ph��ng ��ng c�p x 10. N�u c�p 99 c� th� nh�n 1 vi�n Linh th�ch ng�u nhi�n c�p 6-7.")
end

function huoju_zuobiao()
	Talk(1,"huoju_zuobiao2","Ph�ng T��ng: Th�nh H�a ��i [228,191], ��i �u�c 1 [209,200], ��i �u�c 2 [207,193], ��i �u�c 3 [222,200]\nT��ng D��ng: ��i �u�c 4 [192,1-79], ��i �u�c 5 [1-77,1-74], ��i �u�c 6 [168,1-79], ��i �u�c 7 [1-70,190], ��i �u�c 8 [189,190]\nTh�nh ��: ��i �u�c 9 [209,229], ��i �u�c 10 [213,21-7], ��i �u�c 11 [232,218], ��i �u�c 12 [220,221], ��i �u�c 13 [233,226]\n��i L�: ��i �u�c 14 [191,182], ��i �u�c 15 [1-78,185], ��i �u�c 16 [181,193], ��i �u�c 1-7 [195,194]");
end

function huoju_zuobiao2()
	Talk(1,"OnUse","Tuy�n Ch�u: ��i �u�c 18 [169,180], ��i �u�c 19 [169,190], ��i �u�c 20 [189,190], ��i �u�c 21 [188,181]\nD��ng Ch�u: ��i �u�c 22 [203,191], ��i �u�c 23 [203,198], ��i �u�c 24 [218,198], ��i �u�c 25 [21-7,192]\nBi�n Kinh: ��i �u�c 26 [158,185], ��i �u�c 27 [183,184], ��i �u�c 28 [183,1-73], ��i �u�c 29 [162,1-72], ��i �u�c th�nh th� [1-70,1-79]");
end