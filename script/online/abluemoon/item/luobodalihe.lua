Include("\\script\\online\\zgc_public_fun.lua")		--�峤�Ĺ�������
function OnUse()
	Say("ʹ���ܲ�����п��Ի��<color=yellow>ʮ�����ܲ�<color>����Ҫʹ����",2,
			"��Ҫʹ��/give_hongluobo10",
			"�Ȳ�ʹ��/end_say"
	)
end

function give_hongluobo10()
	if Zgc_pub_goods_add_chk(1,10) ~= 1 then		--�ռ�/�����ж�
		Talk(1,"","��ȷ�����ı������㹻�ĸ��غͿռ䣡")
		return
	end
	if DelItem(2,1,1095,1) == 1 then
		AddItem(2,1,1090,10)
	else
		Say("��ȷ�����������ܲ�����У�",0)
	end
end

function end_say()
end