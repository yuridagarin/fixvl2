--��ң��
--authored by pengbo
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

tXiaoyao_cloth = {
		{  --��׼��    -ͷ,�·�,����
			{{"��ͨ��",437},{"������",431},{"������",419},{"Ʈ����",425},{"���غ�",413}}, --����
			{{"��ͨ��",440},{"������",434},{"������",422},{"Ʈ����",428},{"���غ�",416}}, --����
			{{"��ͨ��",439},{"������",433},{"������",421},{"Ʈ����",427},{"���غ�",415}}, --ؤ��
			{{"��ͨ��",438},{"������",432},{"������",420},{"Ʈ����",426},{"���غ�",414}}, --�䵱
			{{"��ͨ��",441},{"������",435},{"������",423},{"Ʈ����",429},{"���غ�",417}}, --����
			{{"��ͨ��",442},{"������",436},{"������",424},{"Ʈ����",430},{"���غ�",418}}, --�嶾
		},
		{  --������
			{{"��ͨ��",467},{"������",461},{"������",449},{"Ʈ����",455},{"���غ�",443}}, --����
			{{"��ͨ��",470},{"������",464},{"������",452},{"Ʈ����",458},{"���غ�",446}}, --����
			{{"��ͨ��",469},{"������",463},{"������",451},{"Ʈ����",457},{"���غ�",445}}, --ؤ��
			{{"��ͨ��",468},{"������",462},{"������",450},{"Ʈ����",456},{"���غ�",444}}, --�䵱
			{{"��ͨ��",471},{"������",465},{"������",453},{"Ʈ����",459},{"���غ�",447}}, --����
			{{"��ͨ��",472},{"������",466},{"������",454},{"Ʈ����",460},{"���غ�",448}}, --�嶾
		},
		{  --�Ը�Ů
			{"ź����",308,408,208},{"������",309,409,209},{"������",310,410,210},{"�ξ���",311,411,211},{"õ���",312,412,212}
		},
		{  --��СŮ
		  {"ź����",298,398,198},{"������",299,399,199},{"������",300,400,200},{"�ξ���",301,401,201},{"õ���",302,402,202}
		}
}

function OnUse()
	local player_sex = GetBody()
	local tSay = {}
	if player_sex < 3 then
			Say("<color = green>��ң��<color>:������Ҫ������װ�أ���������ѡ��",3,
			"����Ҫ�Ŀ�������/give_wenkui",
			"����Ҫ��ңװ/give_xiaoyao",
			"���ٿ���һ��/leave"
					)
	else
		Say("<color = green>��ң��<color>:������Ҫ������װ�أ���������ѡ��",2,
				"����Ҫ��ң��/give_xiaoyao",
				"���ٿ���һ��/leave"
				)
	end
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
	if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 20 then
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
	AddItem(0,109,nIndex+100,1)
	AddItem(0,110,nIndex+200,1)
end

function end_say()
	return OnUse()
end

function leave()

end