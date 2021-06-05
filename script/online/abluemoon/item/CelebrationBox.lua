--������Ե��
--authored by pengbo
--==========================================�������===========================================
PUT_ALREADY = 801  --��¼������װ�Ĵ������������е���װ����������Ի��򽫴�����װ��ѡ��ȥ��
CELECLOTH_ALREADY = 802  --��¼�Ƿ���뽣��2����������װ
NEWYEARCLOTH_ALREADY = 803 --��¼�Ƿ����2007������װ
MATCHERCLOTH_ALREADY = 804 --��¼�Ƿ������������װ
--MARRIAGECLOTH_ALREADY = 805 --��¼�Ƿ��������or������װ
tTask = {802,803,804}

--2005��ʥ��װ
tXmas = {     --ͷ,����,����
          --��׼��
					{{108,109},{109,109},{110,73}},
					--������
					{{108,110},{109,110},{110,74}},
					--�Ը�Ů
					{{108,112},{109,112},{110,76}},
					--��СŮ
					{{108,111},{109,111},{110,75}}
				}

--2007��Ԫ��װ
tYuandan7 = {     --ͷ,����,����
          --��׼��
					{{108,139},{109,185},{110,81}},
					--������
					{{108,140},{109,186},{110,82}},
					--�Ը�Ů
					{{108,141},{109,187},{110,83}},
					--��СŮ
					{{108,142},{109,188},{110,84}}
				}

--2007������װ
tNewyear7 = {     --ͷ,����,����
          --��׼��
					{{108,195},{109,255},{110,85}},
					--������
					{{108,196},{109,256},{110,86}},
					--�Ը�Ů
					{{108,197},{109,257},{110,87}},
					--��СŮ
					{{108,198},{109,258},{110,88}}
				}

--����2����������װ				
tCele2cloth = {     --ͷ,����,����
          --��׼��
					{{108,135},{109,181},{110,77}},
					--������
					{{108,136},{109,182},{110,78}},
					--�Ը�Ů
					{{108,137},{109,183},{110,79}},
					--��СŮ
					{{108,138},{109,184},{110,80}}
				}
				
--2006������װ				
tNewyear6 = {     --һ��
          --��׼��
					{109,113},
					--������
					{109,114},
					--�Ը�Ů
					{109,116},
					--��СŮ
					{109,115}
				}
				
--��������װ
tMatchercloth = {    --һ��
          --��׼��
					{109,177},
					--������
					{109,178},
					--�Ը�Ů
					{109,179},
					--��СŮ
					{109,180}
				}

tAllcloth = {{tCele2cloth,"����2����������װ"},{tNewyear7,"2007������װ��װ"},{tMatchercloth,"��������װ"}}				
--������װ      --  ��׼��,������
--================================================�Ȳ�����=====================================
--tGroomcloth = {
--							  {{109,173},{109,174}},  --����
--							  {{109,201},{109,202}},  --����
--							  {{109,197},{109,198}},  --ؤ��
--							  {{109,217},{109,218}},  --�䵱
--							  {{109,205},{109,206}},  --����
--							  {{109,209},{109,210}}   --�嶾
--							 }
--������װ      --�Ը�Ů,��СŮ
--tBridecloth = {
--								{{109,203},{109,204}},  --����
--								{{109,195},{109,196}},  --����
--								{{109,199},{109,200}},  --ؤ��
--								{{109,191},{109,192}},  --�䵱
--								{{109,207},{109,208}},  --����
--								{{109,211},{109,212}}   --�嶾
--							}
--==============================================================================================

tAlreadyput = {{"������뽣��2��������װ/#PutClothInBox(1)","����ȡ������2��������װ"},
							 {"�������2007������װ��װ/#PutClothInBox(2)","����ȡ��2007������װ��װ"},
							 {"���������������װ/#PutClothInBox(3)","����ȡ����������װ"}
							}
			
function OnUse()
	local tSay = {
		"��Ҫ��ȡ������Ե�и�������װ/GetDefaultCloth",
		"��Ҫ��ȡ�������װ/GetOutCloth",
		"�����˽⽣����Ե����ʲô�ô�/AboutBox",
		"û��ʲô��/Leave"
	}
	local putAlready = GetTask(PUT_ALREADY)
	if putAlready < 3 then  --������ȫ����װ��ȥ����ѡ��
		tinsert(tSay,2,"��Ҫ���Լ�����װװ��������Ե����/PutInBox")
	end
	Say("<color=green>������Ե��<color>����λ����������Ҫʲô������",getn(tSay),tSay);
end

function GetDefaultCloth()
  local sSay = {
  			"����Ҫ2005��ʥ������װ/GiveXmas",
  			"����Ҫ2006������װ��װ/#GiveNewyear(1)",
  			"����Ҫ2007��Ԫ��װ��װ/#GiveNewyear(2)",
  			"���ٿ���һ��/end_say"
  			}
  Say("<color=green>������Ե��<color>��������Ҫ������װ?��������ѡ:",getn(sSay),sSay)
 end

function GiveXmas()
	local player_sex = GetBody()
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("��ı����ռ䲻��,�������������ȡ!",0)
	return
  end
  for i=1,3 do
  	AddItem(0,tXmas[player_sex][i][1],tXmas[player_sex][i][2],1)
  end
end
	
function GiveNewyear(nYear)
	local player_sex = GetBody()
  if nYear == 1 then
  	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
  		Say("<color=green>������Ե��<color>����ı����ռ䲻��,�������������ȡ!",0)
  		return
  	end
  	AddItem(0,tNewyear6[player_sex][1],tNewyear6[player_sex][2],1)
  elseif nYear == 2 then
  	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
			Say("<color=green>������Ե��<color>����ı����ռ䲻��,�������������ȡ!",0)
			return
  	end
  	for i =1,3 do
  		AddItem(0,tYuandan7[player_sex][i][1],tYuandan7[player_sex][i][2],1)
    end
  end
end

function end_say()
  return OnUse()
end

function PutInBox()
	local player_sex = GetBody()
	local putAlready = 0
	local tSay = {}
	for i = 1,3 do
		putAlready = GetTask(tTask[i])
		if putAlready == 0 then
			tinsert(tSay,tAlreadyput[i][1])
		end
	end
--	putAlready = GetTask(MARRIAGECLOTH_ALREADY)
--	if putAlready == 0 then
--		if player_sex <= 2 then 
--			tinsert(tSay,"�������������װ/#PutClothInBox(4)")
--		else
--			tinsert(tSay,"�������������װ/#PutClothInBox(5)")
--		end	
--	end
	tinsert(tSay,"�Ҳ�������κ���װ/end_say")
	Say("<color=green>������Ե��<color>�������������Щ��װ�أ�",getn(tSay),tSay)
end

function PutClothInBox(nIndex)
	local player_sex = GetBody()
	local player_route = GetPlayerRoute()
	local choice = 0
	local sex = player_sex - 2
	if nIndex < 3 then
		if GetItemCount(0,tAllcloth[nIndex][1][player_sex][1][1],tAllcloth[nIndex][1][player_sex][1][2]) < 1 then
			Say("<color=green>������Ե��<color>����ı����ﲢû��������һ��"..tAllcloth[nIndex][2]..",������ٴ��뱦���У�",0)
    elseif GetItemCount(0,tAllcloth[nIndex][1][player_sex][2][1],tAllcloth[nIndex][1][player_sex][2][2])< 1 then
    	Say("<color=green>������Ե��<color>����ı����ﲢû��������һ��"..tAllcloth[nIndex][2]..",������ٴ��뱦���У�",0)
    elseif GetItemCount(0,tAllcloth[nIndex][1][player_sex][3][1],tAllcloth[nIndex][1][player_sex][3][2])< 1 then
    	Say("<color=green>������Ե��<color>����ı����ﲢû��������һ��"..tAllcloth[nIndex][2]..",������ٴ��뱦���У�",0)
    else	
    	for i = 1,3 do 
    		DelItem(0,tAllcloth[nIndex][1][player_sex][i][1],tAllcloth[nIndex][1][player_sex][i][2],1)
    	end
    	Msg2Player("���Ѿ���"..tAllcloth[nIndex][2].."���뵽������Ե�����ˣ�")
    	SetTask(PUT_ALREADY,GetTask(PUT_ALREADY)+1)
    	SetTask(tTask[nIndex],1)
    end
	elseif nIndex == 3 then
			if DelItem(0,tMatchercloth[player_sex][1],tMatchercloth[player_sex][2],1) ~= 1 then
				Say("<color=green>������Ե��<color>����ı����ﲢû��һ����������װ,������ٴ��뱦���У�",0)
		  else 
		  	Msg2Player("���Ѿ�����������װ���뵽������Ե�����ˣ�")
				SetTask(PUT_ALREADY,GetTask(PUT_ALREADY)+1)
				SetTask(MATCHERCLOTH_ALREADY,1)
		  end
--===============================================��ʱ������============================		  
--	elseif nIndex == 4 then
--		if player_route < 5 then         --����
--			choice = 1
--		elseif player_route < 7 then     --����
--			choice = 2
--		elseif player_route < 13 then    --ؤ��
--			choice = 3
--		elseif player_route < 16 then		 --�䵱		
--			choice = 4
--		elseif player_route < 19 then		 --����
--			choice = 5
--		else
--			choice = 6										 --�嶾
--		end
--		if DelItem(0,tGroomcloth[choice][player_sex][1],tGroomcloth[choice][player_sex][2],1)~=1 then
--			Say("<color=green>������Ե��<color>����ı����ﲢû��һ���������κ����ɶ�Ӧ��������װ,������ٴ��뱦���У�",0)
--		else
--			Msg2Player("���Ѿ���������װ���뵽������Ե�����ˣ�")
--			SetTask(PUT_ALREADY,GetTask(PUT_ALREADY)+1)
--			SetTask(MARRIAGECLOTH_ALREADY,1)
--		end
--	elseif nIndex == 5 then
--		if player_route < 7 then
--			choice = 1
--		elseif player_route < 10 then
--			choice = 2
--		elseif player_route < 13 then
--			choice = 3
--		elseif player_route < 16 then
--			choice = 4
--		elseif player_route < 19 then
--			choice = 5
--		else 
--			choice = 6
--		end
--		if DelItem(0,tBridecloth[choice][sex][1],tBridecloth[choice][sex][2],1)~=1 then
--			Say("<color=green>������Ե��<color>����ı����ﲢû��һ���������κ����ɶ�Ӧ��������װ,������ٴ��뱦���У�",0)
--		else
--			Msg2Player("���Ѿ���������װ���뵽������Ե�����ˣ�")
--			SetTask(PUT_ALREADY,GetTask(PUT_ALREADY)+1)
--			SetTask(MARRIAGECLOTH_ALREADY,1)
--		end
--====================================================================================================
	end
end
		
function GetOutCloth()
	local player_sex = GetBody()
	local putAlready = GetTask(PUT_ALREADY)
	local tSay = {}
	local i1 = GetTask(CELECLOTH_ALREADY)
	local i2 = GetTask(NEWYEARCLOTH_ALREADY)
	local i3 = GetTask(MATCHERCLOTH_ALREADY)
--	local i4 = GetTask(MARRIAGECLOTH_ALREADY)
	if i1 == 1 then
			tinsert(tSay,"����ȡ������2��������װ/#GetCloth(1)")
	end
	if i2 == 1 then
		 tinsert(tSay,"����ȡ��2007������װ��װ/#GetCloth(2)")
	end
	if i3 == 1 then
		 tinsert(tSay,"����ȡ����������װ/#GetCloth1(1)")
	end
--	if i4 == 1 then
--		if player_sex < 3 then
--			tinsert(tSay,"��Ҫȡ��������װ/#GetCloth1(2)")
--		else 
--			tinsert(tSay,"��Ҫȡ��������װ/#GetCloth1(3)")
--		end
--	end
	if putAlready == 0 then 
		Say("<color=green>������Ե��<color>���㻹û�д����κ���װ,ֻ�д�����װ�Ժ������ȡ!",0)
	else
		tinsert(tSay,"�Ҳ���ȡ���κ���װ/end_say")
		Say("<color=green>������Ե��<color>������Ҫȡ���ļ���װ?",getn(tSay),tSay)
	end
end

function GetCloth(nIndex)
	local player_sex = GetBody()
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("��ı����ռ��Ѿ�װ�����ˣ�������һ�������ɣ�",0)
    return	
	end
	if nIndex == 1 then
		for i =1,3 do
			AddItem(0,tCele2cloth[player_sex][i][1],tCele2cloth[player_sex][i][2],1)
		end
	elseif nIndex ==2 then
		for i =1,3 do
			AddItem(0,tNewyear7[player_sex][i][1],tNewyear7[player_sex][i][2],1)
		end
	end
end

function GetCloth1(nIndex)
	local player_sex = GetBody()
	local player_route = GetPlayerRoute()
	local choice = 0
	local sex = player_sex - 2
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("��ı����ռ��Ѿ�װ�����ˣ�������һ�������ɣ�",0)
    return	
	end
	if nIndex == 1 then 
		AddItem(0,tMatchercloth[player_sex][1],tMatchercloth[player_sex][2],1)
--============================��ʱ������===============
--	elseif nIndex == 2 then
--		if player_route < 5 then         --����
--			choice = 1
--		elseif player_route < 7 then     --����
--			choice = 2
--		elseif player_route < 13 then    --ؤ��
--			choice = 3
--		elseif player_route < 16 then		 --�䵱		
--			choice = 4
--		elseif player_route < 19 then		 --����
--			choice = 5
--		else
--			choice = 6										 --�嶾
--		end
--		AddItem(0,tGroomcloth[choice][player_sex][1],tGroomcloth[choice][player_sex][2],1)
--	elseif nIndex == 3 then
--		if player_route < 7 then
--			choice = 1
--		elseif player_route < 10 then
--			choice = 2
--		elseif player_route < 13 then
--			choice = 3
--		elseif player_route < 16 then
--			choice = 4
--		elseif player_route < 19 then
--			choice = 5
--		else 
--			choice = 6
--		end
--		AddItem(0,tBridecloth[choice][sex][1],tBridecloth[choice][sex][2],1)
	end
end
		

function AboutBox()
	Say("<color=green>������Ե��<color>:�򿪸ñ��п�����ѻ�ȡ2005��ʥ����װ��2007��Ԫ����װ��2006��������װ��ͬʱ����Ҳ�����ں�����������Լ���������ϵ�2007������װ������2����������װ����������װ�ͽ����װ���ڴ����Ϳ�����ѻ�ȡ��Щ�������װ��",
		1,
		"���˽���/end_say")
end

function Leave()

end