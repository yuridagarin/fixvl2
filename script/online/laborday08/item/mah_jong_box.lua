--2008�괺�ڻ-�齫�ռ��-��Ʒʹ�ú���
--���뿪���ˣ���ī��
--���뿪��ʱ�䣺2008-04-10
--�����޸ļ�¼��
Include("Script\\Online\\\laborday08\\mah_jong_head.lua")
MJ_MAX_DIEJIA = 999
function OnUse()
	local tTemp = {
		"Ta mu�n c�t t�t c� qu�n b�i v�o h�nh trang/save_all",
		"Ki�m tra qu�n ��ng c�n "..get_total(0).."Tr��ng/#get_mah_jong_1(0)",
		"Ki�m tra qu�n �i�u c�n "..get_total(1).."Tr��ng/#get_mah_jong_1(1)",
		"Ki�m tra qu�n V�n c�n "..get_total(2).."Tr��ng/#get_mah_jong_1(2)",
		"Ki�m tra qu�n T�p c�n "..get_total(3).."Tr��ng/#get_mah_jong_1(3)",
		"Sau n�y h�y l�y/nothing"
	}
	Say("B�n c� th� xem s� qu�n b�i c�t v�o ho�c l�y ra, c�c qu�n b�i h� th�ng cho s� m�c ��nh ���c b� v�o trong r��ng n�y.",getn(tTemp),tTemp)
end

function get_total(index)
	local nTotal = 0
		if index >= 0 and index <= 2 then
		local nFor = 1
		for nFor = 1, 9, 1 do
			nTotal = nTotal + GetTask(TASK_MJ_TONG1 + index * 9 + nFor - 1)
		end
	elseif index == 3 then--��
		local nFor = 1
		for nFor = 1, 7, 1 do
			nTotal = nTotal + GetTask(TASK_MJ_DONG + nFor - 1)
		end
	end
	return nTotal
end

function get_mah_jong_1(index)
	local tTemp = {}
	local tMJTemp = {"��ng","�i�u","V�n ","T�p"}
	if get_total(index) <= 0 then
		Talk(1,"OnUse","Trong r��ng M�t ch��c c�a b�n kh�ng c� "..tMJTemp[index + 1])
		return
	end
	if index == 0 or index == 1 or index == 2 then--ͳ���ж���Ͳ����
		local szTemp = {"��ng","�i�u","V�n "}
		local nFuncTemp = {0,1,2,3,4,5}
		--��Ϊ�������ݸ�get_mah_jong_2�Ļ���1,3,5��ʾȡ��1~9Ͳ����2��4��6��ʾȡ��ȫ��Ͳ����
		local nFor = 1
		tinsert(tTemp,"Ta mu�n l�y "..szTemp[index + 1].."1 ��n 9/#get_mah_jong_2("..nFuncTemp[index * 2 + 1]..")")
		for nFor = 1, 9, 1 do--����ȡ��һͲ�������򣩶�Ͳ�������򣩡�����ȫ��ѡ��
			local nTaskTemp = TASK_MJ_TONG1 + index * 9 + nFor - 1
			tinsert(tTemp,tMahJong[nFor + index * 9][1]..", c�n "..GetTask(nTaskTemp).."Tr��ng/#get_mah_jong_2("..nTaskTemp..")")
		end
		tinsert(tTemp,"Ta mu�n l�y h�t"..szTemp[index + 1].."/#get_mah_jong_2("..nFuncTemp[index * 2 + 2]..")")
		tinsert(tTemp,"Kh�ng l�y/OnUse")
	elseif index == 3 then--��
		tTemp = {
			"Ta mu�n l�y ��ng Nam T�y B�c m�i lo�i 3 con/#get_mah_jong_2(6)",
			"��ng, c�n "..GetTask(TASK_MJ_DONG).."Tr��ng/#get_mah_jong_2("..TASK_MJ_DONG..")",
			"T�y, c�n "..GetTask(TASK_MJ_XI).."Tr��ng/#get_mah_jong_2("..TASK_MJ_XI..")",
			"Nam, c�n "..GetTask(TASK_MJ_NAN).."Tr��ng/#get_mah_jong_2("..TASK_MJ_NAN..")",
			"B�c, c�n "..GetTask(TASK_MJ_BEI).."Tr��ng/#get_mah_jong_2("..TASK_MJ_BEI..")",
			"Trung, c�n "..GetTask(TASK_MJ_ZHONG).."Tr��ng/#get_mah_jong_2("..TASK_MJ_ZHONG..")",
			"Ph�t, c�n "..GetTask(TASK_MJ_FA).."Tr��ng/#get_mah_jong_2("..TASK_MJ_FA..")",
			"B�ch, c�n "..GetTask(TASK_MJ_BAI).."Tr��ng/#get_mah_jong_2("..TASK_MJ_BAI..")",
			"Ta mu�n l�y to�n b� T�p/#get_mah_jong_2(7)",
			"Kh�ng l�y/OnUse"
		}
	end
	Say("",getn(tTemp),tTemp)
end

function get_mah_jong_2(index)
	if index > 10 then--��������ó�������һ�ֵ��齫
		if GetTask(index) > 0 then
			SetTaskTemp(TASK_TEMP_MJ_KIND,index)
			AskClientForNumber("comfirm_MJ",1,tonumber(GetTask(index)),"H�y nh�p v�o M�t ch��c b�n mu�n l�y")
			return
		else
			local nTemp = floor((index - TASK_MJ_TONG1) / 9)
			Say("Xin l�i! Trong r��ng M�t ch��c c�a b�n kh�ng c� lo�i M�t ch��c n�y!",1,"Ta bi�t r�i./#get_mah_jong_1("..nTemp..")")
			return
		end
	else--����ȡ������
		if index == 0 or index == 2 or index == 4 then--ȡ��Ͳ����1~9
			local nFor = 1
			if Zgc_pub_goods_add_chk(9,9) ~= 1 then
				return
			end--if��Ʒ���
			for nFor = 1, 9, 1 do--������ȡ��1~9Ͳ
				--�齫Ͳ�������������������ģ�ÿ���Ÿ�Ϊһ��ϵ�У�1Ͳ~9Ͳ��
				--1��~9����������index / 2��ֵ�����˵ڼ���ϵ�У�ͲΪ��һ��ϵ�У�
				--��Ϊ�ڶ���ϵ�У���������nFor��ֵ������һͲ��Ͳ��1��2
				if GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) <= 0 then
					--�ж�ÿ��Ͳ��û��һ��
					local tMJTemp = {
						[0] = "��ng",
						[2] = "�i�u",
						[4] = "V�n "
					} 
					Say("Trong r��ng M�t ch��c c�a b�n kh�ng c� "..nFor..tMJTemp[index],1,"Ta bi�t r�i./#get_mah_jong_1("..floor(index / 2)..")")
					--������һ����ʾ
					return
				end--����һ���齫
			end--for�����齫
			for nFor = 1, 9, 1 do--������ȡ��1~9Ͳ
				--�齫Ͳ�������������������ģ�ÿ���Ÿ�Ϊһ��ϵ�У�1Ͳ~9Ͳ��
				--1��~9����������index / 2��ֵ�����˵ڼ���ϵ�У�ͲΪ��һ��ϵ�У�
				--��Ϊ�ڶ���ϵ�У���������nFor��ֵ������һͲ��Ͳ��1��2
				if GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) >= 1 then
					--ȡ��һ��Ͳ
					SetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1,GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) - 1)
					AddItem(tMahJong[nFor + floor(index / 2) * 9][2],tMahJong[nFor + floor(index / 2) * 9][3],tMahJong[nFor + floor(index / 2) * 9][4],1)

				end--����һ���齫
			end--for�����齫
		elseif index == 1 or index == 3 or index == 5 then--ȡ��ȫ��Ͳ������
			local nFor = 1
			local nTotal = 0--�ж������齫
			local nGezi = 0--�ж���Ҫ���ٸ���
			if get_total(floor(index / 2)) <= 0 then
				local tMJTemp = {
					[1] = "��ng",
					[3] = "�i�u",
					[5] = "V�n "
				}
				Talk(1,"OnUse","Trong r��ng M�t ch��c c�a b�n kh�ng c� g� c�"..tMJTemp[index])
				return--����
			end
			for nFor = 1, 9, 1 do
				nTotal = nTotal + GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1)
				nGezi = ceil(GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) / MJ_MAX_DIEJIA) + nGezi
			end
			if Zgc_pub_goods_add_chk(nGezi,nTotal) ~= 1 then
				return
			end--if��Ʒ���
			for nFor = 1, 9, 1 do
				if GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1) >= 1 then
					local nTempMJ = GetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1)
					SetTask(TASK_MJ_TONG1 + nFor + floor(index / 2) * 9 - 1,0)
					AddItem(tMahJong[nFor + floor(index / 2) * 9][2],tMahJong[nFor + floor(index / 2) * 9][3],tMahJong[nFor + floor(index / 2) * 9][4],nTempMJ)
				end--��������һ���齫
			end--for�����齫
		elseif index == 6 then--ȡ����������������
			local nFor = 1
			if Zgc_pub_goods_add_chk(ceil(3/MJ_MAX_DIEJIA),3) ~= 1 then
				return
			end
			for nFor = 1, 4, 1 do
				if GetTask(TASK_MJ_DONG + nFor - 1) < 3 then
					local tszTemp = {"��ng ","Nam ","T�y ","B�c "}
					Say(" -"..tszTemp[nFor].." kh�ng �� 3 con!",1,"Ta bi�t r�i/#get_mah_jong_1(3)")
					return
				end
			end
			for nFor = 1, 4, 1 do
				if GetTask(TASK_MJ_DONG + nFor - 1) >= 3 then
					SetTask(TASK_MJ_DONG + nFor - 1,GetTask(TASK_MJ_DONG + nFor - 1) - 3)
					AddItem(tMahJong[27 + nFor][2],tMahJong[27 + nFor][3],tMahJong[27 + nFor][4],3)
				end
			end
		elseif index == 7 then--ȡ��ȫ����
			local nFor = 1
			local nTotal = 0--�ж������齫
			local nGezi = 0--�ж���Ҫ���ٸ���
			if get_total(3) == 0 then
				Talk(1,"OnUse","Trong r��ng M�t ch��c c�a b�n kh�ng c� con T�p!")
				return--����
			end
			for nFor = 1, 9, 1 do
				nTotal = nTotal + GetTask(TASK_MJ_DONG + nFor - 1)
				nGezi = ceil(GetTask(TASK_MJ_DONG + nFor - 1) / MJ_MAX_DIEJIA) + nGezi
			end
			if Zgc_pub_goods_add_chk(nGezi,nTotal) ~= 1 then
				return
			end--if��Ʒ���
			for nFor = 1, 7, 1 do
				local nTempMJ = GetTask(TASK_MJ_DONG + nFor - 1)
				SetTask(TASK_MJ_DONG + nFor - 1, 0)
				AddItem(tMahJong[27 + nFor][2],tMahJong[27 + nFor][3],tMahJong[27 + nFor][4],nTempMJ)
			end
		end--if index
	end
	local nLast = 0
	if index == 1 or index == 3 or index == 5 or index == 7 then
		local tMJTemp = {
			[1] = "��ng",
			[3] = "�i�u",
			[5] = "V�n ",
			[7] = "T�p"
		} 
		Say(" �� l�y to�n b� "..tMJTemp[index].."!",1,"Ta bi�t r�i./OnUse")--�����ȡ��ȫ��Ͳ����
		return
	elseif index < 10 then
		nLast = floor(index / 2)
	else
		nLast = floor((index - TASK_MJ_TONG11) / 9)
	end
	get_mah_jong_1(nLast)--������һ����ʾ
end

function comfirm_MJ(nCount)
	if GetTask(GetTaskTemp(TASK_TEMP_MJ_KIND)) < nCount then
		Msg2Player("M�t ch��c trong r��ng kh�ng �� s� l��ng b�n nh�p v�o!")
	else
		if Zgc_pub_goods_add_chk(nCount / MJ_MAX_DIEJIA,nCount) ~= 1 then
			--�������أ�����
			return
		end
		SetTask(GetTaskTemp(TASK_TEMP_MJ_KIND),GetTask(GetTaskTemp(TASK_TEMP_MJ_KIND)) - nCount)
		AddItem(tMahJong[GetTaskTemp(TASK_TEMP_MJ_KIND)-860][2],tMahJong[GetTaskTemp(TASK_TEMP_MJ_KIND)-860][3],tMahJong[GetTaskTemp(TASK_TEMP_MJ_KIND)-860][4],nCount)
	end
	get_mah_jong_1(floor((GetTaskTemp(TASK_TEMP_MJ_KIND) - 860)/9))
end

function nothing()--�����Ի��ú���
	
end

function save_all()--������������齫
	local nFor = 1
	for nFor = TASK_MJ_TONG1,TASK_MJ_BAI,1 do
		local nMJnum = GetItemCount(tMahJong[nFor - 860][2],tMahJong[nFor - 860][3],tMahJong[nFor - 860][4])
		if nMJnum > 0 then
			if DelItem(tMahJong[nFor - 860][2],tMahJong[nFor - 860][3],tMahJong[nFor - 860][4],nMJnum) == 1 then
				SetTask(nFor,GetTask(nFor) + nMJnum)
			end
		end
	end
	Talk(1,"OnUse","B�n �� c�t h�t M�t ch��c v�o h�nh trang!")
end