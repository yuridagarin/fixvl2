--File name:recordbook_item.lua
--Describe:�۱�ի���Ͳ���Ʒ�ű�
--Create Date:2006-4-10
--Author:yanjun
Include("\\script\\online\\laborday06\\laborday_head.lua");

function OnUse()
	local selTab = {
				"Ch��ng 1: danh m�c v�t thu th�p lo�i 1/#seetype(1)",
				"Ch��ng 2: danh m�c v�t thu th�p lo�i 2/#seetype(2)",
				"Ch��ng 3: danh m�c v�t thu th�p lo�i 3/#seetype(3)",
				"Ch��ng 4: danh m�c v�t thu th�p lo�i 4/#seetype(4)",
				"Ch��ng 5: danh m�c v�t thu th�p lo�i 5/#seetype(5)",
				"Ch��ng 6: danh m�c v�t thu th�p lo�i 6/#seetype(6)",
				"Ch��ng 7: danh m�c v�t thu th�p lo�i 7/#seetype(7)",
				"Ch��ng 8: ph�n th��ng/#knowrule(3)",
				"Ch��ng 9: thuy�t minh ho�t ��ng/#knowdetail(3)",
				"��ng/nothing",
				}
	Say("B�n �� n�p "..g_TotalItemNum.."<color=yellow>"..GetTask(ITEMNUM).."<color> lo�i v�t thu th�p.",getn(selTab),selTab);
end;

function seetype(nType)
	seenext(nType,1);
end;

function seenext(nType,nPageNo)
	if nPageNo == 0 then	--Ŀǰû�����ã��������Ǳ����Ű�
		queryinfor();
		return 1;
	end;
	local nTaskID = LABORDAY_ITEM_BEGIN+nType-1;
	local sYes = "<color=yellow>�� n�p<color> ";
	local sNo = "<color=red>ch�a n�p<color>";
	local sContent = "";
	local selTab = {};
	local nSelNum = 1;
	local nMaxPage = 5;	--Ĭ�����ҳ��Сҳ����
	local tNumTab = {
			"m�t",
			"hai",
			"ba",
			"b�n",
			"Ng� ",
			"s�u",
			"b�y"
			};
	if nType == LABORDAY_ITEM_END-LABORDAY_ITEM_BEGIN+1 then	--���Ϊ���һҳ����ҳ��
		nMaxPage = floor(((g_TotalItemNum-30*(nType-1))-1)/6)+1;
	end;						
	if nPageNo ~= nMaxPage then
		selTab[nSelNum] = "Trang k�/#seenext("..nType..","..(nPageNo+1)..")";
		nSelNum = nSelNum + 1;
	end;
	if nPageNo ~= 1 then
		selTab[nSelNum] = "Trang tr��c/#seenext("..nType..","..(nPageNo-1)..")";
		nSelNum = nSelNum + 1;
	end;
	selTab[nSelNum] = "Quay l�i m�c l�c tr��c./OnUse";
	nSelNum = nSelNum + 1;
	selTab[nSelNum] = "��ng./nothing";
	nSelNum = nSelNum + 1;
	local ItemNumPerPage = 6;
	if (nType-1)*30+nPageNo*6 > g_TotalItemNum then	
		ItemNumPerPage = mod(g_TotalItemNum,6);
	end;
	for i=1,ItemNumPerPage do	--6 item per page
		local sTail = "";
		if i ~= ItemNumPerPage then
			sTail = "<enter>";
		end;
		local nItemNo = (nType-1)*30+((nPageNo-1)*6+i);
		if ItemTab[nItemNo][5] ~= nil then
			if GetBit(GetTask(nTaskID),(nPageNo-1)*6+i) == 1 then
				sContent = sContent.."s�:"..nItemNo.." <color=green>"..ItemTab[nItemNo][5].."<color>("..ItemTab[nItemNo][4].."):"..sYes..sTail;
			else
				sContent = sContent.."s�:"..nItemNo.." <color=green>"..ItemTab[nItemNo][5].."<color>("..ItemTab[nItemNo][4].."):"..sNo..sTail;
			end;
		end;
	end;
	Say("Danh m�c thu th�p, lo�i <color=yellow>"..tNumTab[nType].."<color>, trang <color=yellow>"..nPageNo.."<color>:<enter>"..sContent,getn(selTab),selTab);
end;


