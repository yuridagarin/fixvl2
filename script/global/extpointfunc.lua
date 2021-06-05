Include("\\script\\lib\\globalfunctions.lua");
function OnExtPointChange(nExtPointIndex, nChangeValue)
	if (ExtFunTab[nExtPointIndex + 1] == nil) then
		print("Error!!!!!!!!, No ExtPoint Fun On"..nExtPointIndex)
		WriteLog("Importacne Error!!!!!!!!, No ExtPoint CallFun On"..nExtPointIndex..", "..GetAccount().." "..GetName().." nExtPointIndex"..nExtPointIndex.." nChangeValue"..nChangeValue)
		return
	end
	dostring(ExtFunTab[nExtPointIndex + 1].."("..(nChangeValue)..")");
end

ExtFunTab=
{
	"OnChangeExt",
	"OnChangeExt",
	"OnChangeExt",
	"OnChangeExt",
	"OnChangeExt",
	"OnChangeExt",	
	"OnChangeExt",
	nil,
};

function OnChangeJXWeb(nChangeValue)
	local nValue = -nChangeValue	
	if nValue == 1 then			
			if AddItem(2,1,30085,nValue) == 1 then			
				Say("Ch�c m�ng bang ch� nh�n ���c "..nValue.." Li�n T�m �an.",0)
				Msg2Player("B�n nh�n ���c "..nValue.." Li�n T�m �an.")
				WriteLogEx("JX Web","nh�n",nValue,"Li�n T�m �an","",GetTongName())
			else
				WriteLogEx("JX Web","th�t b�i",nValue,"Li�n T�m �an","",GetTongName())
			end
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t c� l�i khi g�i function OnChangeJXWeb.")		
	end
end 

function OnChangeGetToken(nChangeValue)
	if nChangeValue == 1 then		
			local tToken = 
			{
				{"Long t� �n",{2,0,30002,1}},
				{"H� t� �n",{2,0,30003,1}},
				{"Ph�ng t� �n",{2,0,30005,1}},
				{"�ng t� �n",{2,0,30006,1}},
			}
			local nRand = random(1,4)						
			local nRet, nItemIdx =  gf_AddItemEx(tToken[nRand][2],tToken[nRand][1])
			if nRet == 1 then
				gf_SetItemExpireTime(nItemIdx,2009,11,30,24,0,0)			
				Say("Ch�c m�ng ��i hi�p nh�n ���c "..tToken[nRand][1],0)
				Msg2Player("B�n nh�n ���c 1 "..tToken[nRand][1])
				WriteLogEx("Phat thuong bang chu","nh�n",1,tToken[nRand][1])
			else
				WriteLogEx("Phat thuong bang chu","th�t b�i",1,tToken[nRand][1])
			end
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t c� l�i khi g�i function OnChangeGetToken.")		
	end
end

function OnChangeTopFaction(nChangeValue)
	local nValue = -nChangeValue
	local nRoute = GetPlayerRoute()
	local tb_wohucanglong_item_aword_83 = {
			[2]  = {"Ph� Y�n �ao", {0, 3, 6001, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[3]  = {"Ph� Y�n tr��ng",{0,8,6003, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[4]  = {"H�m Y�n th�",{0,0,6004, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[6]  = {"T�ng Y�n ch�m",{0,1,6005, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[8]  = {"Phi Y�n ki�m",{0,2,6006, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[9]  = {"V�n Y�n c�m",{0,10,6007, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[11] = {"V�n Y�n th�",{0,0,6008, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[12] = {"L�u Y�n c�n",{0,5,6009, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[14] = {"Huy�n Y�n ki�m",{0,2,6010, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[15] = {"V� Y�n b�t",{0,9,6011, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[17] = {"H� Ti�m Th��ng",{0,6,6012, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[18] = {"H�nh Y�n Cung",{0,4,6013, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[20] = {"Tr�c Y�n nh�n",{0,7,6014, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
			[21] = {"Y�u Y�n tr�o",{0,11,6015, 1,1,-1,-1,-1,-1,-1,-1,-1,9}},
	};
	if nValue == 1 then			
		for i=100,103 do
			if i ~= 102 then
				local nRet, nItemIdx = gf_AddItemEx({0,i,94 + GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,8},"Trang b� T�ng Ki�m")
				if Ret == 1 then
					WriteLogEx("Phan thuong Top Mon phai","nh�n",1,"Trang b� T�ng Ki�m")
				else
					WriteLogEx("Phan thuong Top Mon phai","th�t b�i",1,"Trang b� T�ng Ki�m")
				end
			else
				local nRet, nItemIdx = gf_AddItemEx({0,i,38,1,1,-1,-1,-1,-1,-1,-1},"T�ng Ki�m B�o Ch�u")
				if Ret == 1 then
					WriteLogEx("Phan thuong Top Mon phai","nh�n",1,"T�ng Ki�m B�o Ch�u")
				else
					WriteLogEx("Phan thuong Top Mon phai","th�t b�i",1,"T�ng Ki�m B�o Ch�u")
				end	
				local nRet, nItemIdx = gf_AddItemEx({0,i,40,1,1,-1,-1,-1,-1,-1,-1},"T�ng Ki�m Kim �n")
				if Ret == 1 then
					WriteLogEx("Phan thuong Top Mon phai","nh�n",1,"T�ng Ki�m Kim �n")
				else
					WriteLogEx("Phan thuong Top Mon phai","th�t b�i",1,"T�ng Ki�m Kim �n")
				end			
			end
		end			
		Say("Ch�c m�ng b�n nh�n ���c b� Trang b� T�ng Ki�m!",0)
		Msg2Player("B�n nh�n ���c Trang b� T�ng Ki�m.")	
		local nRet, nItemIdx = gf_AddItemEx(tb_wohucanglong_item_aword_83[nRoute][2],tb_wohucanglong_item_aword_83[nRoute][1])
		if Ret == 1 then
			Say("Ch�c m�ng b�n nh�n ���c 1 "..tb_wohucanglong_item_aword_83[nRoute][1],0)
			Msg2Player("B�n nh�n ���c 1 "..tb_wohucanglong_item_aword_83[nRoute][1])	
			WriteLogEx("Phan thuong Top Mon phai","nh�n",1,tb_wohucanglong_item_aword_83[nRoute][1])
		else
			WriteLogEx("Phan thuong Top Mon phai","th�t b�i",1,tb_wohucanglong_item_aword_83[nRoute][1])
		end				
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t c� l�i khi g�i function OnChangeTopFaction.")		
	end	
end

function OnChangeTopWorld(nChangeValue)
	local nValue = -nChangeValue		
	if nValue == 1 then			
		local nRet, nItemIdx = gf_AddItemEx({0,105,15,1,1,-1,-1,-1,-1,-1,-1},"Phi�u V�")
		if Ret == 1 then
			Say("Ch�c m�ng b�n nh�n ���c 1 Phi�u V�!",0)
			Msg2Player("B�n nh�n ���c 1 Phi�u V�.")	
			WriteLogEx("Phan thuong Top The gioi","nh�n",1,"Phi�u V�")
		else
			WriteLogEx("Phan thuong Top The gioi","th�t b�i",1,"Phi�u V�")
		end	
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t c� l�i khi g�i function OnChangeTopFaction.")		
	end	
end

function OnChangeTALK(nChangeValue)
	local nValue = -nChangeValue	
	if nValue == 1 then
			for i=1,48 do
				local nRet, nItmIdx = AddItem(2,0,30000,1)
				SetItemExpireTime(nItmIdx, 72*3600);				
			end
			Say("Ch�c m�ng Bang Ch� nh�n ���c 48 Tinh Anh L�nh K�. H�y ch�n ng��i x�ng ��ng!",0)
			Msg2Player("B�n nh�n ���c 48 Tinh Anh L�nh K�")	
			WriteLogEx("Bang hoi tinh anh 3","nh�n Tinh Anh L�nh K�","","","",GetTongName())
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t c� l�i khi g�i function OnChangeTALK.")		
	end
end 

function OnChangeTTLT(nChangeValue)
	local nValue = -nChangeValue		
	if nValue == 1 then			
		local nRet, nItemIdx = gf_AddItemEx({2,1,1068,1,1},"Thi�n Th�ch Linh Th�ch")
		if nRet == 1 then
			SetItemExpireTime(nItemIdx, 15*24*3600);		
			Say("Ch�c m�ng c�c h� nh�n ���c 1 Thi�n Th�ch Linh Th�ch!",0)
			Msg2Player("B�n nh�n ���c 1 Thi�n Th�ch Linh Th�ch.")	
			WriteLogEx("Phan thuong tham du BHTA","nh�n",1,"Thi�n Th�ch Linh Th�ch")
		else
			WriteLogEx("Phan thuong tham du BHTA","th�t b�i",1,"Thi�n Th�ch Linh Th�ch")
		end	
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t c� l�i khi g�i function OnChangeTTLT.")		
	end	
end

function OnChangeBHTANhanSam(nChangeValue)
	local nValue = -nChangeValue	
	if nValue >= 1 then			
			if AddItem(2,1,30071,nValue) == 1 then			
				Say("Ch�c m�ng c�c h� nh�n ���c "..nValue.." Nh�n S�m V�n N�m.",0)
				Msg2Player("B�n nh�n ���c "..nValue.." Nh�n S�m V�n N�m.")
				WriteLogEx("BHTA 3 Prize","nh�n",nValue,"Nh�n S�m V�n N�m","",GetTongName())
			else
				WriteLogEx("BHTA 3 Prize","th�t b�i",nValue,"Nh�n S�m V�n N�m","",GetTongName())
			end
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t c� l�i khi g�i function OnChangeBHTANhanSam.")		
	end
end 

function OnChangeVD(nChangeValue)
	nChangeValue = -nChangeValue
	if nChangeValue == 1 then		
			for i=100,103 do
				if i ~= 102 then
					local nRet, nItemIdx = gf_AddItemEx({0,i,8000+ GetBody(),1,1,-1,-1,-1,-1,-1,-1},"Trang b� Vi�m ��")
					if Ret == 1 then
						WriteLogEx("Promotion Tet","nh�n",1,"Trang b� Vi�m ��")
					else
						WriteLogEx("Promotion Tet","th�t b�i",1,"Trang b� Vi�m ��")
					end
			 	end
		 	end
		 	Say("Ch�c m�ng c�c h� nh�n ���c b� trang b� Vi�m ��!",0)			
			Msg2Player("B�n nh�n ���c b� trang b� Vi�m ��.")					
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t c� l�i khi g�i function OnChangeVD.")		
	end	
end

function OnChangeHKLB(nChangeValue)
	local nValue = -nChangeValue		
	if nValue == 1 then			
		local nRet, nItemIdx = gf_AddItemEx2({2,1,1067,1,1},"��nh H�n Thi�n Th�ch Th�n Th�ch","HKLB","nh�n",30*24*3600)
		if nRet == 1 then			
			Say("Ch�c m�ng c�c h� nh�n ���c 1 ��nh H�n Thi�n Th�ch Th�n Th�ch!",0)						
		else
			WriteLogEx("HKLB","th�t b�i",1,"��nh H�n Thi�n Th�ch Th�n Th�ch")
		end
	elseif nValue == 2 then
		local nRet, nItemIdx = gf_AddItemEx2({2,1,1068,1,1},"Thi�n Th�ch Linh Th�ch","HKLB","nh�n",30*24*3600)
		if nRet == 1 then			
			Say("Ch�c m�ng c�c h� nh�n ���c 1 Thi�n Th�ch Linh Th�ch!",0)						
		else
			WriteLogEx("HKLB","th�t b�i",1,"Thi�n Th�ch Linh Th�ch")
		end
	elseif nValue == 3 then
		local nRet, nItemIdx = 0,0
		for i=1,2 do
			nRet, nItemIdx = gf_AddItemEx2({2,1,1068,1,1},"Thi�n Th�ch Linh Th�ch","HKLB","nh�n",30*24*3600)
		end
		if nRet == 1 then			
			Say("Ch�c m�ng c�c h� nh�n ���c 2 Thi�n Th�ch Linh Th�ch!",0)						
		else
			WriteLogEx("HKLB","th�t b�i",2,"Thi�n Th�ch Linh Th�ch")
		end	
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t c� l�i khi g�i function OnChangeHKLB.")		
	end	
end 

function OnChangeBocThamBHTA(nChangeValue)
	local nValue = -nChangeValue		
	if nValue == 1 then				
		local nRet, nItemIdx = gf_AddItemEx2({2,1,1067,1,1},"��nh H�n Thi�n Th�ch Th�n Th�ch","Boc tham BHTA","nh�n",30*24*3600)
		if nRet ~= 1 then	
			WriteLogEx("Boc tham BHTA","th�t b�i",1,"��nh H�n Thi�n Th�ch Th�n Th�ch")
		end	
		nRet, nItemIdx = gf_AddItemEx2({0,112,78,1,1},"L�ng Ba Vi B�","Boc tham BHTA","nh�n",0)
		if nRet == 1 then			
			Say("Ch�c m�ng c�c h� nh�n ���c 1 ��nh H�n Thi�n Th�ch Th�n Th�ch v� 1 L�ng Ba Vi B�!",0)			
		else
			WriteLogEx("Boc tham BHTA","th�t b�i",1,"L�ng Ba Vi B�")			
		end
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t c� l�i khi g�i function OnChangeBocThamBHTA.")		
	end
end


function OnChangeExt(nChangeValue)
end

