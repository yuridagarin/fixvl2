--�ű����ƣ��������ɵ�ʹ�ýű�
--�ű����ܣ�ʹ���������ɵ�����60��������
--���ܲ߻��ˣ�����
--���ܿ����ˣ��峤
--���ܲ����ˣ����
--���뿪��ʱ�䣺2008-12-11
--�����޸ļ�¼��
Elixir_chg_num = 60							--һ�������ɵ��һ�������
TaskID_elixer_num = 1263					--�ɵ�������
Elixer_num_max = 30000					--�ɵ���ŵ��������

function OnUse(elixir_index)
	Say("<color=green>��ʾ<color>��ʹ��<color=yellow>�����ɵ�<color>���������Լ���<color=yellow>�ɵ�<color>��������<color=yellow>"..Elixir_chg_num.."<color>������ȷ��Ҫʹ����",
	2,
	"��ȷ��Ҫʹ��/elixir_use_dtm",
	"���ٿ��ǿ���/end_dialog"
	)
end
--ȷ��ʹ����������
function elixir_use_dtm()
	local num_max = GetItemCount(2,0,1042)
	AskClientForNumber("elixir_chg_dtm",1,num_max,"��������Ҫ�һ�������")
end
--ȷ�϶Ի�
function elixir_chg_dtm(num_enter)
	--Я�����
	if GetItemCount(2,0,1042) <num_enter then
		Talk(1,"","<color=green>��ʾ<color>������<color=yellow>�����ɵ�<color>�������㣬��ȷ�Ϻ�����ʹ�ã�")
		return
	end
	--�����ж�
	local elixir_num = GetTask(TaskID_elixer_num) + (num_enter *Elixir_chg_num)
	if elixir_num > Elixer_num_max then
		Talk(1,"","<color=green>��ʾ<color>������<color=yellow>�ɵ�<color>�����Ѿ��ﵽ���ޣ�<color=red>"..Elixer_num_max.."<color>�������ȵ�<color=yellow>����<color>��<color=green>�󿼹����ܹ�<color>�һ�������ʹ�ðɣ�")
		return
	end
	--ɾ�����
	if DelItem(2,0,1042,num_enter) ~= 1 then
		Talk(1,"","<color=green>��ʾ<color>������<color=yellow>�����ɵ�<color>�������㣬��ȷ�Ϻ�����ʹ�ã�")
		return
	end
	SetTask(TaskID_elixer_num,elixir_num)
	Talk(1,"","<color=green>��ʾ<color>��ʹ�ú���������<color=yellow>".. (num_enter *Elixir_chg_num).."<color>���ɵ������������ɵ�����Ϊ<color=yellow>"..elixir_num.."<color>����")
end
--�����Ի�
function end_dialog()
end
