--������Ե��
--authored by pengbo
--==========================================�������===========================================
ABLUEMOON_KEEP_XOYO = 638; --������Ե���Ƿ��������ң��
ABLUEMOON_KEEP_MOON = 639; --������Ե���Ƿ������������
EASTER_EGG = 819  --�ʵ���¼��
CELECLOTH_ALREADY = 802  --��¼�Ƿ���뽣��2����������װ
NEWYEARCLOTH_ALREADY = 803 --��¼�Ƿ����2007������װ
MATCHERCLOTH_ALREADY = 804 --��¼�Ƿ������������װ
CHAOHUA_ALREADY = 816 --��¼�Ƿ���볯����װ,1������볯��װ��0����û����
XINYUAN_ALREADY = 817 --��¼�Ƿ������Ԫ��װ,1���������Ԫװ��0����û����
XIANYU_ALREADY = 818 --��¼�Ƿ����������װ,1�����������װ��0����û����
PAPACLOTH_ALREADY = 820 --��¼�Ƿ����ſſ��ջ��װ,1�������,0����û�д���

tTask = {803,804,816,817,818,820}

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
					{109,241},
					--������
					{109,242},
					--�Ը�Ů
					{109,243},
					--��СŮ
					{109,244}
				}

--��Ԫ��װ
tXinyuan = {     --һ��
					--��׼��
					{109,495},
					--������
					{109,496},
					--�Ը�Ů
					{109,497},
					--��СŮ
					{109,498}
				}
				
--������װ
tChaohua = {		--һ��
					--��׼��	
					{109,499},
					--������
					{109,500},
					--�Ը�Ů
					{109,501},
					--��СŮ
					{109,502}		
				}
				
--������װ
tXianyu = {				--��һ�ף�Ů����
					--��׼��	
					{109,505},
					--������
					{109,506},
					--�Ը�Ů
					{{108,485},{109,503},{110,225}},
					--��СŮ
					{{108,486},{109,504},{110,226}}
				}

--ſſ��װ
tPapaCloth = {
				--��׼��
				{{108,510},{109,510},{110,510}},
				--������
				{{108,511},{109,511},{110,511}},
				--�Ը�Ů
				{{108,513},{109,513},{110,513}},
				--��СŮ
				{{108,512},{109,512},{110,512}}
			}
				

tAllcloth = {{tNewyear7,"2007������װ��װ"},{tMatchercloth,"��������װ"}}		

tAlreadyput = {{"�������2007������װ��װ/#PutClothInBox(1)","����ȡ��2007������װ��װ"},
							 {"���������������װ/#PutClothInBox(2)","����ȡ����������װ"},
							 {"������볯����װ/#PutClothInBox(3)","����ȡ��������װ"},
							 {"���������Ԫ��װ/#PutClothInBox(4)","����ȡ����Ԫ��װ"},
							 {"�������������װ/#PutClothInBox(5)","����ȡ��������װ"},
							 {"�������ſſ��ջ��װ/#PutClothInBox(6)","����ȡ��ſſ��ջ��װ"}
							}

tRouteCloth = {--���� �䵱 ���� ؤ�� ���� ���� �嶾
	{{0,108,73,0,109,73},{0,108,77,0,109,77}},
	{{0,108,74,0,109,74},{0,108,78,0,109,78},{0,108,82,0,109,82},{0,108,86,0,109,86}},
	{{},{},{0,108,81,0,109,81},{0,108,85,0,109,85}},--���� ǰ����Ϊ��
	{{0,108,75,0,109,75},{0,108,79,0,109,79},{0,108,83,0,109,83},{0,108,87,0,109,87}},
	{{0,108,76,0,109,76},{0,108,80,0,109,80},{0,108,84,0,109,84},{0,108,88,0,109,88}},
	{{0,108,105,0,109,105},{0,108,106,0,109,106},{0,108,107,0,109,107},{0,108,108,0,109,108}},
	{{0,108,123,0,109,125},{0,108,124,0,109,126},{0,108,125,0,109,127},{0,108,126,0,109,128}}
	}

		
function OnUse()
	local easter_egg = GetTask(EASTER_EGG)
	if easter_egg == 1 or easter_egg == 0 then 
		Talk(1,"main","<color=green>������Ե��<color>������Ϊ�㱳�����ſſ��ջ��װ�޴��ɷŲ�����?���ڿ��Դ�Ž���������!�����κ�һ��������ȡһ��Ŷ!")
    SetTask(EASTER_EGG,2)	
	else return main()
	end
end

function main()
	local tSay = {
		"��Ҫ��ȡ������Ե�����͵���װ/GetDefaultCloth",
		"��Ҫ��ȡ�������װ/GetOutCloth",
		"��Ҫ��ȡ��ң�л���������/get_two_box",
		"��Ҫ��ȡ������װ/get_route_cloth",
		"�����˽⽣����Ե����ʲô�ô�/AboutBox",
		"�رս�����Ե��/Leave"
	}
	local cloth_put = 0
	local insert_flag = 0
	for i = 1,6 do 
		cloth_put = GetTask(tTask[i])
		if cloth_put == 0 then
			insert_flag = insert_flag + 1
		end
	end
	if insert_flag > 0 then 
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
  return main()
end

function PutInBox()
	local player_sex = GetBody()
	local putAlready = 0
	local tSay = {}
	for i = 1,6 do
		putAlready = GetTask(tTask[i])
		if putAlready == 0 then
			tinsert(tSay,tAlreadyput[i][1])
		end
	end
	tinsert(tSay,"�Ҳ�������κ���װ/end_say")
	Say("<color=green>������Ե��<color>�������������Щ��װ�أ�",getn(tSay),tSay)
end

function PutClothInBox(nIndex)
	local player_sex = GetBody()
	local player_route = GetPlayerRoute()
	local choice = 0
	local sex = player_sex - 2
	if nIndex < 2 then
		if GetItemCount(0,tAllcloth[nIndex][1][player_sex][1][1],tAllcloth[nIndex][1][player_sex][1][2]) > 0 then
			DelItem(0,tAllcloth[nIndex][1][player_sex][1][1],tAllcloth[nIndex][1][player_sex][1][2],1)
			Msg2Player("���Ѿ���"..tAllcloth[nIndex][2].."���뵽������Ե�����ˣ�")
    	SetTask(tTask[nIndex],1)
    elseif GetItemCount(0,tAllcloth[nIndex][1][player_sex][2][1],tAllcloth[nIndex][1][player_sex][2][2]) > 0 then
    	DelItem(0,tAllcloth[nIndex][1][player_sex][2][1],tAllcloth[nIndex][1][player_sex][2][2],1)
    	Msg2Player("���Ѿ���"..tAllcloth[nIndex][2].."���뵽������Ե�����ˣ�")
    	SetTask(tTask[nIndex],1)
    elseif GetItemCount(0,tAllcloth[nIndex][1][player_sex][3][1],tAllcloth[nIndex][1][player_sex][3][2]) > 0 then
    	DelItem(0,tAllcloth[nIndex][1][player_sex][3][1],tAllcloth[nIndex][1][player_sex][3][2],1)
    	Msg2Player("���Ѿ���"..tAllcloth[nIndex][2].."���뵽������Ե�����ˣ�")
    	SetTask(tTask[nIndex],1)	
    else
    	Say("<color=green>������Ե��<color>����ı����ﲢû��"..tAllcloth[nIndex][2].."���κ�һ��,������ٴ��뱦���У�",0)
    end
	elseif nIndex == 2 then
			if DelItem(0,tMatchercloth[player_sex][1],tMatchercloth[player_sex][2],1) ~= 1 then
				Say("<color=green>������Ե��<color>����ı����ﲢû��һ����������װ,������ٴ��뱦���У�",0)
		  else 
		  	Msg2Player("���Ѿ�����������װ���뵽������Ե�����ˣ�")
				SetTask(MATCHERCLOTH_ALREADY,1)
		  end
	elseif nIndex == 3 then
			if DelItem(0,tChaohua[player_sex][1],tChaohua[player_sex][2],1) ~= 1 then
				 Say("<color=green>������Ե��<color>����ı����ﲢû��һ�׳�����װ,������ٴ��뱦���У�",0)
			else 
		  	Msg2Player("���Ѿ���������װ���뵽������Ե�����ˣ�")
		  	SetTask(CHAOHUA_ALREADY,1)
		  end
	elseif nIndex == 4 then
			if DelItem(0,tXinyuan[player_sex][1],tXinyuan[player_sex][2],1) ~= 1 then
				 Say("<color=green>������Ե��<color>����ı����ﲢû��һ����Ԫ��װ,������ٴ��뱦���У�",0)
			else 
		  	Msg2Player("���Ѿ�����Ԫ��װ���뵽������Ե�����ˣ�")
		  	SetTask(XINYUAN_ALREADY,1)
		  end
	elseif nIndex == 5 then
			if player_sex < 3 then
				 if DelItem(0,tXianyu[player_sex][1],tXianyu[player_sex][2],1) ~= 1 then
				 		Say("<color=green>������Ե��<color>����ı����ﲢû��һ��������װ,������ٴ��뱦���У�",0)
				 else 
				 		Msg2Player("���Ѿ���������װ���뵽������Ե�����ˣ�")
		  			SetTask(XIANYU_ALREADY,1)
		  	 end
		  else
		  		if GetItemCount(0,tXianyu[player_sex][1][1],tXianyu[player_sex][1][2]) > 0 then
		  			 DelItem(0,tXianyu[player_sex][1][1],tXianyu[player_sex][1][2],1)
		  			 Msg2Player("���Ѿ���������װ���뵽������Ե�����ˣ�")
    				 SetTask(tTask[nIndex],1)
    			elseif GetItemCount(0,tXianyu[player_sex][2][1],tXianyu[player_sex][2][2]) > 0 then
		  			 DelItem(0,tXianyu[player_sex][2][1],tXianyu[player_sex][2][2],1)
		  			 Msg2Player("���Ѿ���������װ���뵽������Ե�����ˣ�")
    				 SetTask(tTask[nIndex],1)
    			elseif GetItemCount(0,tXianyu[player_sex][3][1],tXianyu[player_sex][3][2]) > 0 then
		  			 DelItem(0,tXianyu[player_sex][3][1],tXianyu[player_sex][3][2],1)
		  			 Msg2Player("���Ѿ���������װ���뵽������Ե�����ˣ�")
    				 SetTask(tTask[nIndex],1)
    			else
				 		Say("<color=green>������Ե��<color>����ı����ﲢû��������װ�е��κ�һ��,������ٴ��뱦���У�",0)    				
    			end
    	end
	elseif nIndex == 6 then
			if GetItemCount(0,tPapaCloth[player_sex][1][1],tPapaCloth[player_sex][1][2]) > 0 then
		  			 DelItem(0,tPapaCloth[player_sex][1][1],tPapaCloth[player_sex][1][2],1)
		  			 Msg2Player("���Ѿ���ſſ��ջ��װ���뵽������Ե�����ˣ�")
    				 SetTask(tTask[nIndex],1)
    		elseif GetItemCount(0,tPapaCloth[player_sex][2][1],tPapaCloth[player_sex][2][2]) > 0 then
		  			 DelItem(0,tPapaCloth[player_sex][2][1],tPapaCloth[player_sex][2][2],1)
		  			 Msg2Player("���Ѿ���ſſ��ջ��װ���뵽������Ե�����ˣ�")
    				 SetTask(tTask[nIndex],1)
    		elseif GetItemCount(0,tPapaCloth[player_sex][3][1],tPapaCloth[player_sex][3][2]) > 0 then
		  			 DelItem(0,tPapaCloth[player_sex][3][1],tPapaCloth[player_sex][3][2],1)
		  			 Msg2Player("���Ѿ���ſſ��ջ��װ���뵽������Ե�����ˣ�")
    				 SetTask(tTask[nIndex],1)
    		else
				 		Say("<color=green>������Ե��<color>����ı����ﲢû��ſſ��ջ��װ�е��κ�һ��,������ٴ��뱦���У�",0)    				
    		end
	end
end
		
function GetOutCloth()
	local player_sex = GetBody()
	local tSay = {}
	local i1 = GetTask(CELECLOTH_ALREADY)
	local i2 = GetTask(NEWYEARCLOTH_ALREADY)
	local i3 = GetTask(MATCHERCLOTH_ALREADY)
	local i4 = GetTask(CHAOHUA_ALREADY)
	local i5 = GetTask(XINYUAN_ALREADY)
	local i6 = GetTask(XIANYU_ALREADY)
	local i7 = GetTask(PAPACLOTH_ALREADY)
	if i1 == 1 then
			tinsert(tSay,"����ȡ������2��������װ/#GetCloth(1)")
	end
	if i2 == 1 then
		 tinsert(tSay,"����ȡ��2007������װ��װ/#GetCloth(2)")
	end
	if i3 == 1 then
		 tinsert(tSay,"����ȡ����������װ/#GetCloth1(1)")
	end
	if i4 == 1 then
		 tinsert(tSay,"����ȡ��������װ/#GetCloth1(2)")
	end
	if i5 == 1 then
		 tinsert(tSay,"����ȡ����Ԫ��װ/#GetCloth1(3)")
	end
	if i6 == 1 then
		 tinsert(tSay,"����ȡ��������װ/#GetCloth(3)")
	end
	if i7 == 1 then
		tinsert(tSay,"����ȡ��ſſ��ջ��װ/#GetCloth(4)")
	end
	if i1 == 0 and i2 == 0 and i3 == 0 and i4 == 0 and i5 == 0 and i6 == 0 and i7 == 0 then 
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
	elseif nIndex == 3 then
		if player_sex < 3 then
			AddItem(0,tXianyu[player_sex][1],tXianyu[player_sex][2],1)
		else
			for i =1,3 do
				AddItem(0,tXianyu[player_sex][i][1],tXianyu[player_sex][i][2],1)
			end
		end
	elseif nIndex == 4 then 
		for i = 1,3 do 
			AddItem(0,tPapaCloth[player_sex][i][1],tPapaCloth[player_sex][i][2],1)
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
	end
	if nIndex == 2 then
		AddItem(0,tChaohua[player_sex][1],tChaohua[player_sex][2],1)
	end
	if nIndex == 3 then
		AddItem(0,tXinyuan[player_sex][1],tXinyuan[player_sex][2],1)
	end
end
		

function AboutBox()
	Say("<color=green>������Ե��<color>:�򿪸ñ��п�����ѻ�ȡʥ����װ��Ԫ����װ��������װ��ͬʱ����Ҳ�����ں�����������Լ���������ϵ�2007������װ������2����������װ���е��κ�һ������������װ����������Ԫ��������װ�������к���ң�У��ڴ����Ϳ�����ѻ�ȡ��Щ�������Ʒ��",
		1,
		"���˽���/end_say")
end

function Leave()

end

function get_two_box()
	local strtab = {
		"��Ҫ������ң��/#get_xoyo_box(1)",
		"��Ҫȡ����ң��/#get_xoyo_box(2)",
		"��Ҫ����������/#get_xoyo_box(3)",
		"��Ҫȡ��������/#get_xoyo_box(4)",
		"����/main",
		"û��/Leave"	
		}
	Say("<color=green>������Ե��<color>����λ��������������Դ�ȡ��ң�к��������ˣ��෽�㰡��",
		getn(strtab),
		strtab)	
end

function get_xoyo_box(nType)
	if nType < 1 or nType > 4 then
		return 
	end
	if nType == 2 or nType == 4 then
		if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 1 then
			Talk(1,"","<color=green>������Ե��<color>����ı����ռ��Ѿ�װ�����ˣ�������һ�������ɣ�")
	    return	
		end	
	end
	if nType == 1 then
		if GetItemCount(2,1,1168) < 1 then
			Talk(1,"","<color=green>������Ե��<color>��������û����ң�а���");
			return
		else
			if DelItem(2,1,1168,1) == 1 then
				SetTask(ABLUEMOON_KEEP_XOYO,1);
				Talk(1,"","<color=green>������Ե��<color>�������ң�д��룬����ʱ����ͨ��������Ե��ȡ����");
				return
			end
		end
	elseif nType == 2 then
		if GetTask(ABLUEMOON_KEEP_XOYO) ~= 1 then
			Talk(1,"","<color=green>������Ե��<color>����û����ң����������Ŷ��");
			return
		end
		if BigGetItemCount(2,1,1168) >= 1 then
			Talk(1,"","<color=green>������Ե��<color>���㲻���Ѿ���һ����ң������");
			return
		else			
			if AddItem(2,1,1168,1) == 1 then
				Talk(1,"","<color=green>������Ե��<color>�������ң��ȡ��������ʱ����ͨ��������Ե�д��롣");
				return
			end	
		end
	elseif nType == 3 then
		if GetItemCount(2,1,1169) < 1 then
			Talk(1,"","<color=green>������Ե��<color>��������û�������а���");
			return
		else
			if DelItem(2,1,1169,1) == 1 then
				SetTask(ABLUEMOON_KEEP_MOON,1);
				Talk(1,"","<color=green>������Ե��<color>����������д��룬����ʱ����ͨ��������Ե��ȡ����");
				return
			end
		end		
	elseif nType == 4 then
		if GetTask(ABLUEMOON_KEEP_MOON) ~= 1 then
			Talk(1,"","<color=green>������Ե��<color>����û����������������Ŷ��");
			return
		end		
		if BigGetItemCount(2,1,1169) >= 1 then
			Talk(1,"","<color=green>������Ե��<color>���㲻���Ѿ���һ������������");
			return
		else			
			if AddItem(2,1,1169,1) == 1 then
				Talk(1,"","<color=green>������Ե��<color>�����������ȡ��������ʱ����ͨ��������Ե�д��롣");
				return
			end	
		end 
	end			
end 

function get_route_cloth()
	local nFaction = GetPlayerFaction();
	local nBody = GetBody();
	if nFaction == 0 then
		Talk(1,"","<color=green>������Ե��<color>���㻹û��������Ŷ��");
		return
	end
	if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 20 then
		Talk(1,"","<color=green>������Ե��<color>����ı����ռ��Ѿ�װ�����ˣ�������һ�������ɣ�")
	   return	
	end	 
	if BigGetItemCount(tRouteCloth[nFaction][nBody][1],tRouteCloth[nFaction][nBody][2],tRouteCloth[nFaction][nBody][3]) >= 1 and BigGetItemCount(tRouteCloth[nFaction][nBody][4],tRouteCloth[nFaction][nBody][5],tRouteCloth[nFaction][nBody][6]) >= 1 then
		Talk(1,"","<color=green>������Ե��<color>���㲻����һ�����𣿴����������á�");
		return
	else 
		if AddItem(tRouteCloth[nFaction][nBody][1],tRouteCloth[nFaction][nBody][2],tRouteCloth[nFaction][nBody][3],1) == 1 and AddItem(tRouteCloth[nFaction][nBody][4],tRouteCloth[nFaction][nBody][5],tRouteCloth[nFaction][nBody][6],1) == 1 then
			Msg2Player("������������װһ��");
		end
	end
end