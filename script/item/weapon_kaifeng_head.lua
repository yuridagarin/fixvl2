	-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII �߼���������ͷ�ļ�                  
-- Edited by starry night                                 
-- 2006/05/11 AM 10:47                                    
                                                          
-- ======================================================

--��ȡ���֧��
Include("\\script\\class\\ktabfile.lua");

--������Ա��
tabCommonKF = new(KTabFile, "\\settings\\item\\weapon_kf_common.txt");
tabSkillKF  = new(KTabFile, "\\settings\\item\\weapon_kf_skill.txt");
tabDJSKF    = new(KTabFile, "\\settings\\item\\weapon_kf_dajiangshi.txt");

--�����������ָ���
--�������� 1:һ�㿪�桢2����ϸ���桢3����ʦ���桢4���������
Attribute_Num_Rate = {

	[1] = {{60,0},{40,0},{30,0}},
	[2] = {{80,10},{30,0},{25,0}},
	[3] = {{75,15},{20,0},{15,0}},
	[4] = {}

}

WEAPON_DATA_76 = {

	[1]  = 	{{0,8,97,"A La H�n Tr��ng"},{2,1,382}},	--��
	[2]  = 	{{0,5,40,"Li�t Di�m"},{2,1,377}},			--����
	[3]  = 	{{0,6,108,"��i H�o L�i Th��ng"},{2,1,383}},	--ǹ
	[4]  = 	{{0,0,14,"V�n Nh�n"},{2,1,375}},			--����
	[5]  = 	{{0,3,64,"C� ��nh"},{2,1,379}},			--��
	[6]  = 	{{0,2,36,"H�a Tinh"},{2,1,376}},			--��
	[7]  = 	{{0,7,12,"L�ng Phong"},{2,1,386}},			--˫��
	[8]  = 	{{0,1,53,"M�n Thi�n Hoa V�"},{2,1,378}},	--����
	[9]  = 	{{0,9,86,"Th�n H�nh"},{2,1,381}},			--��
	[10] = 	{{0,10,75,"Hi Nh�n C�m"},{2,1,380}},	--��
	[11] = 	{{0,11,12,"M�nh h�"},{2,1,385}},			--צ
	[12] = 	{{0,4,119,"Th�n Cung"},{2,1,384}},			--��

}

--nKfType:�������� 1:һ�㿪�桢2����ϸ���桢3����ʦ���桢4���������
--nAttributeType:�������� 1���⹦��2���ڹ���0�����⹦
--nWeaponType 1:�ȡ�2������3ǹ��4���֡�5����6����7˫����8������9�ʡ�10�١�11צ��12��
function Weapon_Kaifeng(nKfType,nAttributeType,nWeaponType)

local nAttribute_1,nAttribute_2,nAttribute_3 = 0,0,0;
local nAttributeID_1,nAttributeID_2,nAttributeID_3 = 0,0,0;
local nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = 0,0,0;
local nOk,nItemIndex = 0,0;

	--�ж������Ƿ����δ��������
		if GetItemCount(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1) <= 0 then
			Talk(1,"","Hi�n b�n ch�a cung c�p v� kh� c�n k�ch ho�t!");
			return
		end
	
	--�жϿ��滨���Ƿ�ɹ��۳�
	if Kf_Cost(nKfType) == 1 then
		nAttribute_1,nAttribute_2,nAttribute_3 = GetWeaponAttributeNum(nKfType);
		
		--�ж������Ƿ���
		if IsWeaponDestroy(nAttribute_1,nAttribute_2,nAttribute_3) == 1 then
			Say("V� k� x�o khai phong �� d�ng kh�ng ph� h�p d�n ��n v� kh� b� t�n h�i.",0);
			DelItem(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1);
			WriteLog("[Nh�t k� k�ch ho�t v� kh�]".."		T�i kho�n:"..GetAccount().."		T�n:"..GetName().."		Gi�m ��nh 1 "..WEAPON_DATA_76[nWeaponType][1][4].."		K�t qu�: Th�t b�i!");
		else
			nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3 = GetWeaponAttribute(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType);
			nOk,nItemIndex = AddItem(WEAPON_DATA_76[nWeaponType][1][1],WEAPON_DATA_76[nWeaponType][1][2],WEAPON_DATA_76[nWeaponType][1][3],1,1,nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3);
			SetEquipCanChouQu(nItemIndex,1); 
			DelItem(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1);
			Say("Ch�c m�ng b�n, v� kh� <color=yellow>"..WEAPON_DATA_76[nWeaponType][1][4].."<color> K�ch ho�t th�nh c�ng!",0);
			WriteLog("[Nh�t k� k�ch ho�t v� kh�]".."		T�i kho�n:"..GetAccount().."		T�n:"..GetName().."		Gi�m ��nh 1 "..WEAPON_DATA_76[nWeaponType][1][4].."		K�t qu�: Th�nh c�ng! Nh�n ���c m�t v�t ph�m, id l�: *"..WEAPON_DATA_76[nWeaponType][1][1].."*"..WEAPON_DATA_76[nWeaponType][1][2].."*"..WEAPON_DATA_76[nWeaponType][1][3].."*1*1*"..nAttributeLv_1.."*"..nAttributeID_1.."*"..nAttributeLv_2.."*"..nAttributeID_2.."*"..nAttributeLv_3.."*"..nAttributeID_3.."{v� kh�}");
		end
	else
		Say("V�t li�u k�ch ho�t c�a b�n hi�n kh�ng ��! H�y chu�n b� l�i!",0);
	end

end

--�жϿ۳���Ӧ������Ʒ�Ƿ�ɹ�
--����ֵ 1���ɹ���0�����ɹ�
function Kf_Cost(nKfType)

	if nKfType == 1 then
		if GetItemCount(2,2,8) >= 1 and GetItemCount(2,5,7) >= 3 and GetCash() >= 10000 then
			DelItem(2,2,8,1);
			DelItem(2,5,7,3);
			Pay(10000);
			return 1
		else
			return 0
		end
	end
	
	if nKfType == 2 then
		if GetItemCount(2,2,8) >= 5 and GetItemCount(2,5,7) >= 5 and GetCash() >= 200000 then
			DelItem(2,2,8,5);
			DelItem(2,5,7,5);
			Pay(200000);
			return 1
		else
			return 0
		end
	end
	
	if nKfType == 3 then
		if GetItemCount(2,2,8) >= 10 and GetItemCount(2,5,7) >= 10 and GetItemCount(2,0,397) >= 1 and GetCash() >= 2000000 then
			DelItem(2,2,8,10);
			DelItem(2,5,7,10);
			DelItem(2,0,397,1);
			Pay(2000000);
			return 1
		else
			return 0
		end
	end	
end


--ѡȡ�������Ͷ�Ӧ�����Ա��
function SelectAttributeFile(nKfType)

local tabAttributeKF;

	if nKfType == 1 then
		tabAttributeKF = tabCommonKF;
	elseif nKfType == 2 then
		tabAttributeKF = tabSkillKF;
	elseif nKfType == 3 then
		tabAttributeKF = tabDJSKF;
	end
	
	return tabAttributeKF

end

--��ȡ��������
function GetWeaponAttribute(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType)

local nAttributeID_1,nAttributeID_2,nAttributeID_3 = 0,0,0;
local nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = 0,0,0;

	nAttributeID_1,nAttributeID_2,nAttributeID_3 = GetWeaponAttributeID(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType)
	nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = GetWeaponAttributeLV(nKfType,nAttributeID_1,nAttributeID_2,nAttributeID_3)
	return nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3

end

--����������Ŀѡȡ����ID
function GetWeaponAttributeID(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType)

local tabAttributeFile = SelectAttributeFile(nKfType);
local nAttributeID_1,nAttributeID_2,nAttributeID_3 = 0,0,0;
local argRate = {};
local nRow = 0;

	if nAttribute_1 == 1 then
		nAttributeID_1 = SelectWeaponAttributeID(nKfType,nAttributeType);
	else
		return nAttributeID_1,nAttributeID_2,nAttributeID_3
	end
	
	if nAttribute_2 == 1 then
		nAttributeID_2 = SelectWeaponAttributeID(nKfType,nAttributeType);
		if nAttributeID_2 == nAttributeID_1 then
			nAttributeID_2,nAttributeID_3 = 0,0;
			return nAttributeID_1,nAttributeID_2,nAttributeID_3
		end			
	else
		nAttributeID_2,nAttributeID_3 = 0,0;
		return nAttributeID_1,nAttributeID_2,nAttributeID_3
	end
	
	if nAttribute_3 == 1 then
		nAttributeID_3 = SelectWeaponAttributeID(nKfType,nAttributeType);
		if nAttributeID_3 == nAttributeID_1 or nAttributeID_3 == nAttributeID_2 then
			nAttributeID_3 = 0;
		end
	else
		nAttributeID_3 = 0;
		return nAttributeID_1,nAttributeID_2,nAttributeID_3
	end
	
	return nAttributeID_1,nAttributeID_2,nAttributeID_3
	
end

--��ȡ��������ID
function SelectWeaponAttributeID(nKfType,nAttributeType)

local tabAttributeFile = SelectAttributeFile(nKfType);
local	argRow = CreateArrayRowRate(nKfType,nAttributeType);
local nAttributeID = GetAttributeFormRowRateArray(nKfType,argRow);

	return nAttributeID

end


--������������ѡ���Ӧ���Եȼ�
function GetWeaponAttributeLV(nKfType,nAttributeID_1,nAttributeID_2,nAttributeID_3)

local nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = 0,0,0;

	if nAttributeID_1 ~= 0 and nAttributeID_1 ~= -1 then
		nAttributeLv_1 = SelectWeaponAttributeLV(nKfType,nAttributeID_1);
	else
		return nAttributeLv_1,nAttributeLv_2,nAttributeLv_3
	end

	if nAttributeID_2 ~= 0 and nAttributeID_2 ~= -1 then
		nAttributeLv_2 = SelectWeaponAttributeLV(nKfType,nAttributeID_2);
	else
		return nAttributeLv_1,nAttributeLv_2,nAttributeLv_3
	end
	
	if nAttributeID_3 ~= 0 and nAttributeID_3 ~= -1 then
		nAttributeLv_3 = SelectWeaponAttributeLV(nKfType,nAttributeID_3);
	else
		nAttributeLv_3 = 0;
		return nAttributeLv_1,nAttributeLv_2,nAttributeLv_3
	end

	return nAttributeLv_1,nAttributeLv_2,nAttributeLv_3

end


--��������IDѡȡ���Եȼ�
--����ֵ��������ID�ȼ�
function SelectWeaponAttributeLV(nKfType,nAttributeID)

local argAttributeLv = CreateAttributeLvRowRateArray(nKfType,nAttributeID);
local nAttributeLv = GetAttributeLvFormRateArray(argAttributeLv);

	return nAttributeLv

end


--�ж������Ƿ�����
--����ֵ 1���Ѿ����� 0:������
function IsWeaponDestroy(nAttribute_1,nAttribute_2,nAttribute_3)

	if nAttribute_1 == 2 or nAttribute_2 == 2 or nAttribute_3 == 2 then
		return 1
	else
		return 0
	end

end

--ѡȡ����������������
--����ֵ������1���������2���������3���
--0�������ԣ�1�������ԣ�2Ϊ����ʧ��
function GetWeaponAttributeNum(nKfType)

local i = 0;
local nAttribute_1,nAttribute_2,nAttribute_3 = 0,0,0;


	--�ж��Ƿ��������1
	i = random(1,100);
	if i >= 1 and i <= Attribute_Num_Rate[nKfType][1][1] then
		nAttribute_1 = 1;
	elseif i > Attribute_Num_Rate[nKfType][1][1] and i <= Attribute_Num_Rate[nKfType][1][1] + Attribute_Num_Rate[nKfType][1][2] then
		nAttribute_1 = 2;
		nAttribute_2 = 2;
		nAttribute_3 = 2;
		return nAttribute_1,nAttribute_2,nAttribute_3
	else
		return nAttribute_1,nAttribute_2,nAttribute_3
	end
	
	--�ж��Ƿ��������2
	if nAttribute_1 == 1 then -- ��һ���Գ��ֺ��жϵڶ������Ƿ����
		i = random(1,100);
		if i >= 1 and i <= Attribute_Num_Rate[nKfType][2][1] then
			nAttribute_2 = 1;
		elseif i > Attribute_Num_Rate[nKfType][2][1] and i <= Attribute_Num_Rate[nKfType][2][1] + Attribute_Num_Rate[nKfType][2][2] then
			nAttribute_1 = 2;
			nAttribute_2 = 2;
			nAttribute_3 = 2;
			return nAttribute_1,nAttribute_2,nAttribute_3
		else
			return nAttribute_1,nAttribute_2,nAttribute_3
		end
	end
	
	--�ж��Ƿ��������3
	if nAttribute_1 == 1 and nAttribute_2 == 1 then --��һ�������Գ��ֺ��жϵ��������Ƿ����
		i = random(1,100);
		if i >= 1 and i <= Attribute_Num_Rate[nKfType][3][1] then
			nAttribute_3 = 1;
			return nAttribute_1,nAttribute_2,nAttribute_3
		elseif i > Attribute_Num_Rate[nKfType][3][1] and i <= Attribute_Num_Rate[nKfType][3][1] + Attribute_Num_Rate[nKfType][3][2] then
			nAttribute_1 = 2;
			nAttribute_2 = 2;
			nAttribute_3 = 2;
			return nAttribute_1,nAttribute_2,nAttribute_3
		else
			return nAttribute_1,nAttribute_2,nAttribute_3
		end
	end
end

--����Ŀ������ѡȡ�����Եȼ���������һ��Ȩ������
--����ֵ�����Եȼ�Ȩ������
function CreateAttributeLvRowRateArray(nKfType,nAttributeID)

local tabAttributeFile = SelectAttributeFile(nKfType);
local nRow = tabAttributeFile:selectRowNum("AttributeID",tonumber(nAttributeID));
local argAttributeLv = {};
local i = 0;

	for i=1,7 do
		tinsert(argAttributeLv,tabAttributeFile:getCell(nRow,"LevelRate"..i))
	end
	
	return argAttributeLv
end

--����һ�����Եȼ�����Ȩ�ػ�ȡ�ȼ�
--����ֵ��Ŀ�����Եĵȼ�
function GetAttributeLvFormRateArray(argAttributeLv)

local i = 0;
local nCount = 0;
local nLuckyNum = 0;

	for i=1,getn(argAttributeLv) do
		nCount = nCount + argAttributeLv[i]
	end
	
	nLuckyNum = random(1,nCount);
	nCount = 0;
	
	for i=1,getn(argAttributeLv) do
		nCount = nCount + argAttributeLv[i]
		if nCount >= nLuckyNum then
			return i
		end
	end
		
	return -1 -- �����򷵻� -1

end


--�������б���ѡȡ�������������Թ���һ����������
--����ֵ��һ��������������������{Row1,Row2����}
function CreateArrayRowRate(nKfType,nAttributeType)

local tabAttributeFile = SelectAttributeFile(nKfType);
local argRow = {};
local i = 0;
local nNum = tabAttributeFile:getRow()

	if nAttributeType == 0 then
		for i=3,nNum do
			tinsert(argRow,i);
		end		 
		return argRow
	elseif nAttributeType == 1 then
		for i=3,nNum do
			if tonumber(tabAttributeFile:getCell(i,"AttributeType")) ~= 2 then
				tinsert(argRow,i);
			end
		end
		return argRow
	elseif nAttributeType == 2 then
		for i=3,nNum do
			if tonumber(tabAttributeFile:getCell(i,"AttributeType")) ~= 1 then
				tinsert(argRow,i);
			end		 
		end
		return argRow
	end
end

--�������������������������и���Ȩ��ѡ��һ������
--����ֵ����Ȩ������ID
function GetAttributeFormRowRateArray(nKfType,argRow)

local tabAttributeFile = SelectAttributeFile(nKfType); 
local i = 0;
local nCount = 0;
local nLuckyNum = 0;

	for i=1,getn(argRow) do
		nCount = nCount + tabAttributeFile:getCell(argRow[i],"AttributeRate");
	end
	
	nLuckyNum = random(1,nCount);
	nCount = 0;
	
	for i=1,getn(argRow) do
		nCount = nCount + tabAttributeFile:getCell(argRow[i],"AttributeRate");
		if nCount >= nLuckyNum then
			return tabAttributeFile:getCell(argRow[i],"AttributeID")
		end
	end
		
	return -1 -- �����򷵻�������

end

function Weapon_Kaifeng_Ex(nKfType,nAttributeType,nWeaponType)
	local nAttribute_1,nAttribute_2,nAttribute_3 = 0,0,0;
	local nAttributeID_1,nAttributeID_2,nAttributeID_3 = 0,0,0;
	local nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = 0,0,0;
	local nOk,nItemIndex = 0,0;

	--�ж������Ƿ����δ��������
		if GetItemCount(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1) <= 0 then
			Talk(1,"","Hi�n b�n ch�a cung c�p v� kh� c�n k�ch ho�t!");
			return
		end
	local tbPLBCost = {
			[1] = {2,1,1000,2},	--�����2��
			[2] = {2,1,1000,4},	--�����4��
			[3] = {2,0,136,1},	--ϴ�赤1��
			}
	--�жϿ��滨���Ƿ�ɹ��۳�
	if DelItem(tbPLBCost[nKfType][1],tbPLBCost[nKfType][2],tbPLBCost[nKfType][3],tbPLBCost[nKfType][4]) == 1 then
		nAttribute_1,nAttribute_2,nAttribute_3 = GetWeaponAttributeNum(nKfType);
		
		--�ж������Ƿ���
		if IsWeaponDestroy(nAttribute_1,nAttribute_2,nAttribute_3) == 1 then
			Say("V� k� x�o khai phong �� d�ng kh�ng ph� h�p d�n ��n v� kh� b� t�n h�i.",0);
			DelItem(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1);
			WriteLog("[Nh�t k� k�ch ho�t v� kh�]".."		T�i kho�n:"..GetAccount().."		T�n:"..GetName().."		Gi�m ��nh 1 "..WEAPON_DATA_76[nWeaponType][1][4].."		K�t qu�: Th�t b�i!");
		else
			nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3 = GetWeaponAttribute(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType);
			nOk,nItemIndex = AddItem(WEAPON_DATA_76[nWeaponType][1][1],WEAPON_DATA_76[nWeaponType][1][2],WEAPON_DATA_76[nWeaponType][1][3],1,1,nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3);
			SetEquipCanChouQu(nItemIndex,1);
			DelItem(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1);
			Say("Ch�c m�ng b�n, v� kh� <color=yellow>"..WEAPON_DATA_76[nWeaponType][1][4].."<color> K�ch ho�t th�nh c�ng!",0);
			WriteLog("[Nh�t k� k�ch ho�t v� kh�]".."		T�i kho�n:"..GetAccount().."		T�n:"..GetName().."		Gi�m ��nh 1 "..WEAPON_DATA_76[nWeaponType][1][4].."		K�t qu�: Th�nh c�ng! Nh�n ���c m�t v�t ph�m, id l�: *"..WEAPON_DATA_76[nWeaponType][1][1].."*"..WEAPON_DATA_76[nWeaponType][1][2].."*"..WEAPON_DATA_76[nWeaponType][1][3].."*1*1*"..nAttributeLv_1.."*"..nAttributeID_1.."*"..nAttributeLv_2.."*"..nAttributeID_2.."*"..nAttributeLv_3.."*"..nAttributeID_3.." v� kh�! D�ng v�t ph�m trong Ng� C�c �� m�i bao, C�c ki�u m�:"..nKfType);
		end
	else
		Say("V�t li�u k�ch ho�t c�a b�n hi�n kh�ng ��! H�y chu�n b� l�i!",0);
	end

end;
