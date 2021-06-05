--������
--authored by pengbo
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")

tWenkui_cloth = {
	{  --��׼��
		{"�Ŀ�������(��)",259},{"�Ŀ�������(��)",260}
	},
	{  --������
		{"�Ŀ�������(��)",261},{"�Ŀ�������(��)",262}
	},
	{  --�Ը�Ů
		{"�Ŀ�������(��)",263},{"�Ŀ�������(��)",264},{"�Ŀ�������(��)",265},{"�Ŀ�������(��)",266},
		{"�Ŀ�������(��)",267},{"�Ŀ�������(��)",268},{"�Ŀ�������(��)",269}
	},
	{  --��СŮ
		{"�Ŀ�������(��)",270},{"�Ŀ�������(��)",271},{"�Ŀ�������(��)",272},{"�Ŀ�������(��)",273},
		{"�Ŀ�������(��)",274},{"�Ŀ�������(��)",275},{"�Ŀ�������(��)",276}	
	},
}

tLinglong = {  -- ͷ,�·�,����
		{{207,213}, {281,287}, {281,287}, "�����ѣ��죩"},  --��
		{{208,214}, {282,288}, {282,288}, "�����ѣ��ƣ�"},  --��
		{{209,215}, {283,289}, {283,289}, "�����ѣ��ۣ�"},  --��
		{{210,216}, {284,290}, {284,290}, "�����ѣ��ϣ�"},  --��
		{{211,217}, {285,291}, {285,291}, "�����ѣ�����"},  --��
		{{212,218}, {286,292}, {286,292}, "�����ѣ��̣�"},  --��
}

tXiaoyao_cloth = {
		{  --��׼��    -ͷ,�·�,����
			{{"��ͨ��",437},{"������",431},{"������",419},{"Ʈ����",425},{"���غ�",413}}, --����
			{{"��ͨ��",438},{"������",432},{"������",420},{"Ʈ����",426},{"���غ�",414}}, --����
			{{"��ͨ��",439},{"������",433},{"������",421},{"Ʈ����",427},{"���غ�",415}}, --ؤ��
			{{"��ͨ��",440},{"������",434},{"������",422},{"Ʈ����",428},{"���غ�",416}}, --�䵱
			{{"��ͨ��",441},{"������",435},{"������",423},{"Ʈ����",429},{"���غ�",417}}, --����
			{{"��ͨ��",442},{"������",436},{"������",424},{"Ʈ����",430},{"���غ�",418}}, --�嶾
		},
		{  --������
			{{"��ͨ��",467},{"������",461},{"������",449},{"Ʈ����",455},{"���غ�",443}}, --����
			{{"��ͨ��",468},{"������",462},{"������",450},{"Ʈ����",456},{"���غ�",444}}, --����
			{{"��ͨ��",469},{"������",463},{"������",451},{"Ʈ����",457},{"���غ�",445}}, --ؤ��
			{{"��ͨ��",470},{"������",464},{"������",452},{"Ʈ����",458},{"���غ�",446}}, --�䵱
			{{"��ͨ��",471},{"������",465},{"������",453},{"Ʈ����",459},{"���غ�",447}}, --����
			{{"��ͨ��",472},{"������",466},{"������",454},{"Ʈ����",460},{"���غ�",448}}, --�嶾
		},
		{  --�Ը�Ů
			{"ź����",408,408,208},{"������",409,409,209},{"������",410,410,210},{"�ξ���",411,411,211},{"õ���",412,412,212}
		},
		{  --��СŮ
		  {"ź����",398,398,198},{"������",399,399,199},{"������",400,400,200},{"�ξ���",401,401,201},{"õ���",402,402,202}
		}
}

tLinglongPart = {{108,"����ͷ��"},{109,"�������"},{110,"������װ"}}

tRose_headwear = {
		{{117,120},"��õ��"},
		{{118,121},"��õ��"},
		{{119,122},"��õ��"},
		{{203,205},"��õ��"},
		{{204,206},"��õ��"}
		} --���
		
function OnUse()
	local player_sex = GetBody()
	local tSay = {}
	if player_sex < 3 then
		Say("���Խ�ɫ����ʹ�������У�",0)
		return
	else
		Say("<color=green>������<color>:������Ҫ������װ�أ���������ѡ��",5,
				"����Ҫ�Ŀ�������/give_wenkui",
				"����Ҫ��ң��/give_xiaoyao",
				"����Ҫ������/give_linglong",
				"����Ҫõ��ͷ��/give_rose_headwear",
				"���ٿ���һ��/leave"
				)
	end
end

function give_wenkui()
	local player_sex = GetBody()
	local tSay = {}
	for i = 1,getn(tWenkui_cloth[player_sex]) do
		tinsert(tSay,tWenkui_cloth[player_sex][i][1].."/#wk_give_cloth("..tWenkui_cloth[player_sex][i][2]..")")
	end
	tinsert(tSay,"���ٿ���һ��/end_say")
	Say("<color=green>������<color>:������Ҫ���ֿƿ���װ�أ���������ѡ��",getn(tSay),tSay)
end

function give_linglong()
	local tSay = {}
	for i = 1,getn(tLinglong) do
		tinsert(tSay,tLinglong[i][4].."/#ll_give_cloth("..i..")")
	end
	tinsert(tSay,"���ٿ���һ��/end_say")
	Say("<color=green>������<color>:������Ҫ�����������أ���������ѡ��",getn(tSay),tSay)
end

function give_rose_headwear()
	local player_sex = GetBody()
	local sex = player_sex-2
	local tSay = {}
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 5 then
		Say("<color=green>������<color>:��ı����ռ��Ѿ�װ�����ˣ�������һ�������ɣ�",0)
		return
	end
	for i = 1,getn(tRose_headwear) do
		tinsert(tSay,tRose_headwear[i][2].."/#rh_give_cloth("..tRose_headwear[i][1][sex]..")")
	end
	tinsert(tSay,"���ٿ���һ��/end_say")
	Say("<color=green>������<color>:������Ҫ����õ��ͷ���أ���������ѡ��",getn(tSay),tSay)
end

function give_xiaoyao()
	local player_sex = GetBody()
	local player_route = GetPlayerRoute()
	local tSay = {}
	local choice = 0
	if player_route < 5 then
		choice = 1
	elseif player_route < 7 then
		choice = 2
	elseif player_route < 13 then
		choice = 3
	elseif player_route < 16 then
		choice = 4
	elseif player_route < 19 then
		choice = 5
	else
		choice = 6
	end
	if player_sex < 3 then
		for i = 1,5 do
			tinsert(tSay,tXiaoyao_cloth[player_sex][1][i][1].."/#xy_give_cloth("..tXiaoyao_cloth[player_sex][choice][i][2]..")")
		end
		tinsert(tSay,"���ٿ���һ��/end_say")
		Say("<color=green>��ң��<color>:������Ҫ���ֿƿ���װ�أ���������ѡ��",getn(tSay),tSay)
	else 
		for i = 1,5 do
			tinsert(tSay,tXiaoyao_cloth[player_sex][i][1].."/#xy_give_cloth1("..tXiaoyao_cloth[player_sex][i][2]..")")
		end
		tinsert(tSay,"���ٿ���һ��/end_say")
		Say("<color=green>��ң��<color>:������Ҫ���ֿƿ���װ�أ���������ѡ��",getn(tSay),tSay)
	end
end

function xy_give_cloth(nIndex)
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("<color=green>��ң��<color>:��ı����ռ��Ѿ�װ�����ˣ�������һ�������ɣ�",0)
		return
	end
	AddItem(0,108,nIndex,1) 
	AddItem(0,109,nIndex,1)
end

function xy_give_cloth1(nIndex)
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("<color=green>��ң��<color>:��ı����ռ��Ѿ�װ�����ˣ�������һ�������ɣ�",0)
		return
	end
	AddItem(0,108,nIndex,1) 
	AddItem(0,109,nIndex,1)
	AddItem(0,110,nIndex-200,1)
end
	
function rh_give_cloth(nIndex)
  if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 1 then
		Say("<color=green>������<color>:��ı����ռ��Ѿ�װ�����ˣ�������һ�������ɣ�",0)
		return
	end
	AddItem(0,108,nIndex,1)
	Msg2Player("���Ѿ������"..tRose_headwear[i][2])
end

function wk_give_cloth(nDetail)
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 30 then
		Say("<color=green>������<color>:��ı����ռ��Ѿ�װ�����ˣ�������һ�������ɣ�",0)
		return
	end
	AddItem(0,109,nDetail,1)
end

function ll_give_cloth(nDetail)
	if GetFreeItemRoom() < 3 or (GetMaxItemWeight() - GetCurItemWeight()) < 50 then
		Say("<color=green>������<color>:��ı����ռ��Ѿ�װ�����ˣ�������һ�������ɣ�",0)
		return
	end
	local nBody = GetBody()
	for i = 1,3 do
		AddItem(0,tLinglongPart[i][1],tLinglong[nDetail][i][nBody-2],1,1)
	end
end

function end_say()
	return OnUse()
end

function leave()

end