--�ű����ƣ���������ű�
--�ű����ܣ����������Ʒ��Ӧ�ű���ʹ�������������������ؽ���
--�߻��ˣ�С����
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-06-01
--�����޸ļ�¼
--==============================��������������========================
	zong_zi_bag_goods_ID = 1141
TB_zong_zi_bag_prize = {
	{"b�nh �t g�o tr�ng",1122,1,"43%",4300},
	{"b�nh �t ng�i h��ng",1123,1,"30%",7300},
	{"b�nh �t ch�n g�",1124,1,"20.5%",9350},
	{"b�nh �t B�c B�o",1125,1,"5%",9850},
	{"b�nh �t vui v�",1126,1,"1%",9950},
	{"b�nh �t may m�n",1127,1,"0.45%",9995},
	{"b�nh �t th�ch anh",1128,1,"0.05%",10000},
}
function OnUse(goods_index)
	local prize_dialog = ""
	for i = 1, getn(TB_zong_zi_bag_prize) do
		prize_dialog = prize_dialog.."\n    <color=yellow>"..TB_zong_zi_bag_prize[i][1].."1<color>, x�c xu�t: "..TB_zong_zi_bag_prize[i][4]..""
	end
	Say("<color=green>G�i � <color>: B�n x�c nh�n mu�n s� d�ng <color=yellow>H�p b�nh �t<color> ��i l�y ph�n th��ng? "..prize_dialog,
	2,
	"��ng �/prize_chg",
	"�� ta suy ngh� l�i/end_dialog"
	)
end
function prize_chg()
	--Я�����
	if GetItemCount(2,1,zong_zi_bag_goods_ID) == 0 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>H�p b�nh �t <color>!")
		return
	end
	if DelItem(2,1,zong_zi_bag_goods_ID,1) ~= 1 then
		Talk(1,"","<color=green>G�i � <color>: Xin h�y x�c nh�n b�n �� mang theo <color=yellow>H�p b�nh �t <color>!")
		return
	end
	local ran_num = random(1,10000)
	for i = 1,getn(TB_zong_zi_bag_prize) do
		if ran_num <= TB_zong_zi_bag_prize[i][5] then
			local add_flag = AddItem(2,1,TB_zong_zi_bag_prize[i][2],1)
			if add_flag == 1 then
				Msg2Player("Ch�c m�ng b�n nh�n ���c 1"..TB_zong_zi_bag_prize[i][1])
				return
			else
				WriteLog("Ho�t ��ng T�t �oan Ng�: Ng��i ch�i "..GetName().."S� d�ng H�p b�nh �t t�ng"..TB_zong_zi_bag_prize[i][1].." th�t b�i, k� hi�u:"..add_flag.."")
			end
			if i > 4 then
				Msg2SubWorld("Ch�c m�ng:"..GetName().."S� d�ng H�p b�nh �t ��i l�y 1 "..TB_zong_zi_bag_prize[i][1].."!")
				WriteLog("Ho�t ��ng T�t �oan Ng�: Ng��i ch�i "..GetName().."S� d�ng H�p b�nh �t ��i l�y 1 "..TB_zong_zi_bag_prize[i][1].."!")
			end
		end
	end
end
function end_dialog()
end
