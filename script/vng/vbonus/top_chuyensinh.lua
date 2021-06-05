Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\config\\vng_feature.lua")

szNpcName = "<color=green>B�o R��ng Ph�ng M�y Th�n Thi�n: <color>"

function main()
	local tbSay ={}
	if CheckVbonus() == 1 then
		if tonumber(date("%Y%m%d")) <= 20130705 then
			tinsert(tbSay,"Ghi t�n top 10 Chuy�n sinh 1/Top_ChuyenSinh_Reg")
		end
		tinsert(tbSay, "Xem danh s�ch top 10 Chuy�n sinh 1/Top_ChuyenSinh_Show")
	end
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say("Trong r��ng ch�a 10 m�nh gi�y da ghi t�n 10 v� cao th� chuy�n sinh ��u ti�n. H�y nhanh ch�ng ghi t�n nh�n th��ng.", getn(tbSay), tbSay)
end


function Top_ChuyenSinh_Reg()
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	if nChuyenSinh < 1 then
		Talk(1,"","�i�u ki�n chuy�n sinh ho�c ��ng c�p ch�a ��ng, kh�ng th� ghi t�n nh�n th��ng.")
		return 0
	end
	
	LIB_txtData:Init("vbonus_topchuyensinh.txt")
	LIB_txtData:LoadMultiColumn();
	local tbTop5 = LIB_txtData.tbTextData
	for i=1, getn(tbTop5) do
		if strupper(tbTop5[i][1]) == strupper(GetAccount()) then
			Talk(1,"","<color=green>"..GetName()..":<color> T�n ta �� c� ��y r�i, th�t l� vui qu�.")
			return 0
		end
	end
	
	if getn(tbTop5) >=10 then
		Talk(1,"","<color=green>"..GetName()..":<color> Trong r��ng kh�ng c�n m�nh gi�y da n�o tr�ng, ta �� ��n tr� r�i.")
		return 0
	end
	
	LIB_txtData:AddLine(GetAccount().."	".. GetName().."	"..date("%d-%m-%Y %H:%M:%S"))
	Talk(1,"","<color=green>"..GetName()..": <color>Ghi t�n th�nh c�ng, mau b� l�i v�o r��ng...")
end


function Top_ChuyenSinh_Show()
	LIB_txtData:Init("vbonus_topchuyensinh.txt")
	LIB_txtData:LoadMultiColumn();
	local tbTop5 = LIB_txtData.tbTextData
	local nCount = min(getn(tbTop5),10)
	local szList = "C�c cao th� �� ghi danh nh�n th��ng th�nh c�ng:"
	local szList2 = "C�c cao th� �� ghi danh nh�n th��ng th�nh c�ng (ti�p theo):"
	for i=1,nCount do
		if i < 6 then
			szList = szList.."\n  "..i.." - "..tbTop5[i][2]
		else
			szList2 = szList2.."\n  "..i.." - "..tbTop5[i][2]
		end
	end
	if nCount < 6 then
		Talk(1,"",szList)
	else
		Talk(2,"",szList, szList2)
	end
end