--====================================================
--create by baiyun 2009.6.3
--describe:Խ�ϰ�7�·ݻ֮������Ӣ��֮λ����ңʹ�߽ű�
--ps:�ûֻ�������·���ǰʮ�����˹�ѡ�������˽ű�Ŀǰֻʵ�ַ���
--====================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	do return end
end

function get_aword()
	if GetTask(TASK_YINGXIONG_GET) == 1 then
		Talk(1, "", "<color=green>Ti�u Dao S� Gi�<color>: ��i hi�p �� nh�n ph�n th��ng r�i, kh�ng th� nh�n ti�p ���c n�a.");
		return
	end
	if GetExtPoint(1) < 2 then
		Talk(1, "", "<color=green>Ti�u Dao S� Gi�<color>: G�t ta �? Ng��i m� c�ng l� cao th� sao?");
		return
	end
	--�ж�����Ƿ����ʸ�
		--��������жϵĴ���
	--�ж����
	local nBody = GetBody();
	if gf_Judge_Room_Weight(3, 400, " ") == 0 then
		return
	end
	if GetExtPoint(1) == 2 then
		if PayExtPoint(1,2) == 1 then			
			for i = 1, 3 do
				local nRet = AddItem(tb_yingxiong_aword[i][nBody][2], tb_yingxiong_aword[i][nBody][3], tb_yingxiong_aword[i][nBody][4], 1,1,-1,-1,-1,-1,-1,-1)
				if nRet == 1 then
					Msg2Player("B�n nh�n ���c 1 ".. tb_yingxiong_aword[i][nBody][1])
					WriteLogEx("Hoat dong thang 6","Ti�u Giao S� Gi�",1, tb_yingxiong_aword[i][nBody][1])
				else
					WriteLogEx("Hoat dong thang 6","add item th�t b�i",1, tb_yingxiong_aword[i][nBody][1])
				end
			end			
			SetTask(TASK_YINGXIONG_GET, 1);
		end
	end
end

function nothing()
end