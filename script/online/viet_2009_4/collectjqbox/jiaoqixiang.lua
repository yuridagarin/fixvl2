--=============================================
--create by baiyun 2009.4.15
--describe:Խ�ϰ�4�·��ռ�У���� У����
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua")
--------------------------------------
--OnUse()
--��У�����ú��������
--------------------------------------
function OnUse()
	-----�жϱ����͸���------------------------
	if gf_Judge_Room_Weight(1, 1, "Xin l�i, ") == 0 then
		return 0
	end
	local nID = 0;
	local sItem = "";
	if DelItem(2, 1, 30079, 1) == 1 then
		local nRand = random(1, 100);
		if nRand > 0 and nRand <= 90 then
			nID = 30081;
			sItem = "Lam K�";
		else
			nID = 30080;
			sItem = "H�ng K�";
		end 
		if AddItem(2, 1, nID, 1) == 1 then
			Msg2Player("Nh�n ���c 1 " .. sItem);
			WriteLogEx("Hoat dong thang 4","R��ng Hi�u K�",1,sItem)
		end
	end
end