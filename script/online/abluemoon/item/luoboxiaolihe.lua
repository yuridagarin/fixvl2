function OnUse()
	Say("ʹ���ܲ�С��п��Ի��<color=yellow>һ�����ܲ�<color>����Ҫʹ����",2,
			"��Ҫʹ��/give_hongluobo",
			"�Ȳ�ʹ��/end_say"
	)
end

function give_hongluobo()
	if DelItem(2,1,1094,1) == 1 then
		AddItem(2,1,1090,1)
	else
		Say("��ȷ�����������ܲ�С��У�",0)
	end	
end

function end_say()
end