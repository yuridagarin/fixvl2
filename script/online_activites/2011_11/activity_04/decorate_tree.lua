--by liubo
--װ��ʥ������ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2011_11\\string.lua")
Include("\\script\\misc\\taskmanager.lua")

VET_201111_DECORATE_TREE_ID = 50 --ʥ�����ID
VET_201111_TREE_VALUE = 50 --ʥ�����۸�*10000
VET_201111_TREE_EXITSTIME = 3*60 --ʥ�������ڵ�ʱ��
VET_201111_TIMESPACE_MAX = 1*60 --װ�ε���Сʱ����
VET_201111_DECOTIMES_MAX = 10 --װ��ʥ������������
--ʱ�䴥����
VET_201111_TRIGGER_TBID = 1517
VET_201111_TRIGGER_UFID = 1517*2

VET_201111_TREENPC_NAME = {
	[1] = "C�y Gi�ng sinh 2d",
	[2] = "C�y Gi�ng sinh 2c",
	[3] = "C�y Gi�ng sinh 1c",
	[4] = "C�y Gi�ng sinh 1b",
	[5] = "C�y Gi�ng sinh 1a",
}
VET_201111_DECORATETREE_TASK = TaskManager:Create(5,1)
VET_201111_DECORATETREE_TASK.IsCreate = 1 --�Ƿ񴴽���1��0��װ��һ�μ�1
VET_201111_DECORATETREE_TASK.TreeIndex = 2 --ʥ��������
VET_201111_DECORATETREE_TASK.DecoTimes = 3 --װ�δ���
VET_201111_DECORATETREE_TASK.TimeSpace = 4 --װ�ε�ʱ����
VET_201111_DECORATETREE_TASK.DaySeq = 5 --���
VET_201111_DECORATETREE_TASK.PlayerIndex = 6 --�������


function VET_201111_DecorateTreeDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201111_DECORATE_TREE_ID) == 1 then
		tinsert(tbSayDialog, format(tSTRING_DECORATETREE_TABLE[1],VET_201111_TREE_VALUE).."/sale_christmas_tree")
	end
    return tbSayDialog, szSayHead 
end

function sale_christmas_tree()
	Say(format(tSTRING_DECORATETREE_TABLE[2],VET_201111_TREE_VALUE),2,"��ng �/ensure","Kh�ng c�n ��u/do_nothing")
end

function ensure()
	--�жϱ����ռ�
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
		Talk(1,"",tSTRING_201111_TABLE[3])
		return 0
	end
	if Pay(VET_201111_TREE_VALUE*10000) == 1 then
		gf_AddItemEx2({2,1,30350,1},"C�y th�ng gi�o h�i","Event trang tr� c�y th�ng noel","Mua c�y th�ng noel",24*60*60,1)
	else
		Talk(1,"",format(tSTRING_DECORATETREE_TABLE[3],VET_201111_TREE_VALUE))
	end
end

function do_nothing()
end