ABLUEMOON_ITEM_TO_EXP = 622 --��¼������ϻ����������
THIS_FILE = "\\script\\online\\abluemoon\\abluemoon_item2exp.lua"

--===================================================���ռ�Ʒ��ȡ���鿪ʼ============================================
function item_to_exp()
	if GetLevel() < 50 then
		Say("<color=green>������<color>�����Զ�С��Ϊ֮��������С����Ϊ��������ͻ��ᣬ�ȶ�����50���Ժ�����Ϊ�������Щ��ʳ�ɣ�",0)
		return
	end
	local nDay = tonumber(date("%y%m%d"))
	if ( GetTask(ABLUEMOON_ITEM_TO_EXP) == nDay ) then
		Say("<color=green>������<color>�����Զ�С��Ϊ֮��������С����Ϊ�����������Ѿ����׹���ʳ�ˣ�",0)
		return
	end
	Say("<color=green>������<color>�������ս�ң���������������ܶ���ѡ���������ж�������ʣ����Խ�����ȥ�ַ���������Ϊ�������һ�������һЩ���顣��������һ�°ɣ�",
			3,
			"��Ҫ����һЩ�������/gather",
			"��Ҫ����һЩ���õ�ʳƷ/food",
			"�һ�ȥ���Ұ�/end_say"
			)
end

function gather()	
	Say("<color=green>������<color>������Ҫ������Щ�����أ�",
			7,
			"��Ҫ����һЩ��˿����/#item2exp(1)",
			"��Ҫ����һЩ��Ƥ����/#item2exp(2)",
			"��Ҫ����һЩ�ڿ����/#item2exp(3)",
			"��Ҫ����һЩ��ľ����/#item2exp(4)",
			"��Ҫ����һЩ��ҩ����/#item2exp(5)",
			"��Ҫ����һЩ�ո�����/#item2exp(6)",
			"�һ�ȥ���Ұ�/end_say"
			)
end

function food()
	Say("<color=green>������<color>������Ҫ������Щ�����أ�",4,
		"��Ҫ����һЩ��ʳ/#item2exp(7)",
		"��Ҫ����һЩ����/#item2exp(8)",
		"��Ҫ����һЩ����/#item2exp(9)",
		"���ٿ���һ��/end_say"
	)
end

function item2exp(nType)
	local tSay = {}
	for i = 1,getn(tItem2Exp[nType]) do
		tSay[i] = "��Ҫ����"..tItem2Exp[nType][i][5].."��"..tItem2Exp[nType][i][1].."/#giveexp("..nType..","..i..")"
	end
	tSay[getn(tSay)+1] = "���ٿ���һ��/end_say"
	Say("<color=green>������<color>������Ҫ������Щ�����أ�",getn(tSay),tSay	)	
end

function wantexp()
	ApplyRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "giveexp_go")
end

function giveexp(ntype,nlevel)
	local nDay = tonumber(date("%y%m%d"))
	local Genre = tItem2Exp[ntype][nlevel][2]
	local Detail = tItem2Exp[ntype][nlevel][3]
	local Particular = tItem2Exp[ntype][nlevel][4]
	local neednum = tItem2Exp[ntype][nlevel][5]
	if GetItemCount(Genre,Detail,Particular) < neednum then
		Say("<color=green>������<color>����������û���㹻�Ĳ���Ŷ��",0)
		return
	end
	if DelItem(Genre,Detail,Particular,neednum) == 1 then
		Msg2SubWorld("���� "..GetName().." �ڳɶ������˴�Ϊ��������˴���"..tItem2Exp[ntype][nlevel][1].."�������չ�Ϊ���̣�")
		ApplyRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "giveexp_go")
	end
end

function giveexp_go(szKey, nKey1, nKey2, nCount)
	local nDay = tonumber(date("%y%m%d"))
	local player_level = GetLevel()
	local Exp = player_level^3 
	if nCount == 0 then  --��һ�γ�ʼ������
		DelRelayShareDataCopy(szKey,nKey1,nKey2)
		AddRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", 0)
		ApplyRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "giveexp_go")
		return
	end
	local count = GetRelayShareDataByKey(szKey, nKey1, nKey2,"count")
	count = count + 1
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	AddRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", count)
	if count == 1 or mod(count,100) == 0 then  --�ʵ���
		SetTask(ABLUEMOON_ITEM_TO_EXP,nDay)
		ModifyExp(Exp*2)
		Msg2Player("����"..(Exp*2).."�㾭�飡")
		Say("<color=green>������<color>��лл����Ϊ���������ķ��ף��������ǽ����<color=yellow>"..count.."<color>λ���׵��ˣ��ر����<color=yellow>����<color>�Ľ�������ʾ������",0)
	else
		SetTask(ABLUEMOON_ITEM_TO_EXP,nDay)
		ModifyExp(Exp)
		Msg2Player("����"..Exp.."�㾭�飡")
		Say("<color=green>������<color>��лл����Ϊ���������ķ��ף����ǽ����<color=yellow>"..count.."<color>λ���׵��ˡ�������ǵ�һλ��������λ�ľ����ߣ�������<color=yellow>����<color>�Ľ���Ŷ��",0)		
	end
end

function end_say()
end
--====================================================���ռ�Ʒ��ȡ�������===========================================

tItem2Exp = {  --��ȡ���������������
	[1] = { --˿
					{"��ë",2,9,1,999},
					{"��˿",2,9,2,999},
					{"��ɫ˿",2,9,3,799},
					{"����˿",2,2,52,799},
					{"Ѫ��˿",2,2,53,599},
					{"����˿",2,2,54,300},
					{"���˿",2,2,55,300},
					{"���˿",2,9,4,300},
	},
	[2] = { --Ƥ
					{"��Ƥ",2,2,15,999},
					{"��Ƥ",2,2,16,999},
					{"��Ƥ",2,2,18,799},
					{"��Ƥ",2,2,17,799},
					{"�׻�֮Ƥ",2,2,46,599},
					{"��Ƥ",2,2,20,300},
					{"�������",2,10,7,300},
					{"ɽʨ֮Ƥ",2,2,47,300},
	},
	[3] = { --��
					{"����",2,2,1,999},
					{"������",2,2,2,999},
					{"�ڽ�ʯ",2,8,5,799},
					{"����",2,2,4,799},
					{"̫�׾���",2,2,5,599},
					{"����",2,2,6,300},
					{"����ʯ",2,2,36,300},
					{"����ʯ",2,2,37,300},
	},
	[4] = { --ľ
					{"��ľ",2,2,41,999},
					{"��ľ",2,2,42,999},
					{"ɼľ",2,2,43,799},
					{"��ľ",2,2,44,799},
					{"��ͩľ",2,2,45,599},
					{"��ľ",2,2,9,300},
					{"����ľ",2,2,10,300},
					{"����ľ",2,2,11,300},
	},
	[5] = { --��ҩ
					{"�Ͷ�",1,2,8,1998},
					{"�غ컨",1,2,1,1998},
					{"�۹�",1,2,2,1998},
					{"����",1,2,3,1998},
					{"����",1,2,9,1599},
					{"����",1,2,10,999},
					{"��ɽ��",1,2,11,899},
					{"����",1,2,4,799},					
	},
	[6] = { --�ո�
					{"��ͨ��",1,3,9,1299},
					{"ľ��",1,3,19,1299},
					{"���鶹",1,3,10,1299},
					{"ʯ��",1,3,20,1299},
					{"������",1,3,11,1299},
					{"����",1,3,21,1299},
					{"�����",1,3,12,1299},
					{"����",1,3,22,1299},
					{"����",1,3,13,999},
					{"�Ӿ���",1,3,14,899},
					{"������",1,3,15,799},
					{"������",1,3,16,699},	
	},
	[7] = { --��ʳ
					{"����",1,1,2,250},
					{"��ͷ",1,1,3,250},
					{"����",1,1,4,220},
					{"���",1,1,5,200},		
	},
	[8] = { --����
					{"�س�����",1,1,6,250},
					{"�ҳ��ļ���",1,1,7,250},
					{"���㶹��",1,1,8,220},
					{"��������",1,1,9,200},		
	},
	[9] = { --��
					{"�յ���",1,1,10,250},
					{"Ů����",1,1,11,250},
					{"������",1,1,12,220},
					{"��������",1,1,13,200},		
	},
}