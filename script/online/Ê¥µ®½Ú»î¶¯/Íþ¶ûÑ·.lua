--=============================================
--create by yanjun 2005.12.12
--describe:����ѷ����(ְ��NPC)�ű�
--=============================================
Include("\\script\\online\\ʥ���ڻ\\christmas_head.lua")

function main()
	if GetTrigger(3000) == 0 then
		local nTemp = random(1,2)
		if nTemp == 1 then
			Say("Ch�a s� ban ph��c l�nh cho ng��i.",0)
		else
			Say("Th�t ra t�n c�a ta l� Wilson.",0)
		end
		return 0
	end
	SelTab = {
		"�� thu th�p �� v�t li�u c�n thi�t, ta mu�n ��i l�y qu� Gi�ng Sinh./get_hat_box",
		"Ta mu�n t�m hi�u ho�t ��ng Gi�ng Sinh./know_detail",
		"Merry Christmas, Gi�ng Sinh vui v�!/no",
		}
	Say("Ch�c b�n Gi�ng Sinh vui v�, Merry Christmas!",3,SelTab);
--	local nTemp = random(1,2)
--	if nTemp == 1 then
--		Say("<color=green>����ѷ����<color>����Ľ̻�����������������ָ���������������",0)
--	else
--		Say("<color=green>����ѷ����<color>����ʵ�ҵ�Ӣ�����ֽ�����wilson����",0)
--	end
end

function know_detail()
	Talk(8,"","L� Gi�ng Sinh b�t ngu�n t� Ph��ng T�y, sau �� ���c truy�n ��n Trung Nguy�n.","Gi�o h�i ch�ng t�i � Nam Bi�n Kinh, Nam Th�nh ��, B�c Tuy�n Ch�u tr�n nh�ng c�y th�ng c� treo qu� gi�ng sinh, m�i ng�y ��ng 21h v� 23h s� ph�n ph�t, m�i c�y th�ng s� ph�t 100 ph�n qu�, t�ng c�ng l� 600 ph�n qu� gi�ng sinh, m�i ng�y m�i ng��i ch� nh�n 1 ph�n.","Trong th�i gian di�n ra ho�t ��ng l� Gi�ng Sinh, n�p th� s� c� c� h�i nh�n ���c 1 trong 3 m�n ngo�i trang Gi�ng Sinh.","Ti�m Nam ph�c, n� trang c� b�n ngo�i trang Gi�ng Sinh.","Ti�m Kim ho�n c� b�n thi�p ch�c Gi�ng Sinh, s� d�ng s� nh�n ���c danh hi�u Gi�ng Sinh vui v� MERRY CHRISTMAS.","B�n thu th�p �� v�t li�u c� th� quay l�i ��y ��i l�y qu� Gi�ng Sinh, l�n ��u c� th� nh�n ���c n�n Gi�ng Sinh, nh�ng l�n sau s� nh�n ���c h�p qu� Gi�ng Sinh.","Trong qu� tr�nh ��nh qu�i c� th� nh�n ���c v� Gi�ng Sinh d�ng �� ��i l� ph�m.","Th�i gian ho�t ��ng c�a L� Gi�ng Sinh l� t� ng�y 23/12 ��n 28/12")
end

function get_hat_box()
	if CHRISTMAS_SWITCH == 0 then
		Say("Ho�t ��ng Gi�ng Sinh v�n ch�a b�t ��u m�!",0)
		return 0
	end
	if GetLevel() < 10 then
		Say("Xin l�i! Qu� kh�ch ch�a ��t ��n c�p <color=red>10<color> ch�a th� nh�n qu�.",0)
		return 0
	end
	if GetItemCount(2,2,62) >= 10 and GetItemCount(0,200,21) >= 1 and GetItemCount(2,9,1) >= 10 
		and GetItemCount(2,1,2) >= 10 and GetItemCount(2,2,21) >= 10 and GetItemCount(2,1,5) >= 10 
		and GetItemCount(2,2,30) >= 10 and GetItemCount(2,1,155) >= 10 then
		
		if GetTask(TASK_GOT_HAT) == 1 and GetItemCount(2,1,208) < 10 then --�����ȡ��ñ��������ʥ��ñ����10��
			Say("Ph�i l�y <color=yellow>10 ��i v� Gi�ng Sinh<color> m�i ��i ���c h�p qu� Gi�ng Sinh.",0)
			return 0
		end
		
		if DelItem(2,2,62,10) == 1 and DelItem(0,200,21,1) == 1 and DelItem(2,9,1,10) == 1
			and DelItem(2,1,2,10) == 1 and DelItem(2,2,21,10) == 1 and DelItem(2,1,5,10) == 1
			and DelItem(2,2,30,10) == 1 and DelItem(2,1,155,10) == 1 then
			local nBody = GetBody()
			if nBody == 1 then
				if GetTask(TASK_GOT_HAT) == 0 then --û�����ʥ��ñ
					nRetCode = AddItem(0,108,109,1,1)--��׼ʥ��ñ
					SetTask(TASK_GOT_HAT,1)
					strPresent = "1 c�i n�n gi�ng sinh"
				elseif GetItemCount(2,1,208) >= 10 and GetTask(TASK_GOT_HAT) == 1 then
					if DelItem(2,1,208,10) == 1 then 
						nRetCode = AddItem(2,1,209,1,1)
					end
					strPresent = " 1 h�p qu� gi�ng sinh"
				end
			elseif nBody == 2 then
				if GetTask(TASK_GOT_HAT) == 0 then 
					nRetCode = AddItem(0,108,110,1,1)--����ʥ��ñ
					SetTask(TASK_GOT_HAT,1)
					strPresent = "1 c�i n�n gi�ng sinh"
				elseif GetItemCount(2,1,208) >= 10 and GetTask(TASK_GOT_HAT) == 1 then
					if DelItem(2,1,208,10) == 1 then
						nRetCode = AddItem(2,1,209,1,1)
					end
					strPresent = " 1 h�p qu� gi�ng sinh"
				end
			elseif nBody == 3 then
				if GetTask(TASK_GOT_HAT) == 0 then 
					nRetCode = AddItem(0,108,112,1,1)--�Ը�ʥ��ñ
					SetTask(TASK_GOT_HAT,1)
					strPresent = "1 c�i n�n gi�ng sinh"
				elseif GetItemCount(2,1,208) >= 10 and GetTask(TASK_GOT_HAT) == 1 then
					if DelItem(2,1,208,10) == 1 then
						nRetCode = AddItem(2,1,209,1,1)
					end
					strPresent = " 1 h�p qu� gi�ng sinh"
				end
			elseif nBody == 4 then
				if GetTask(TASK_GOT_HAT) == 0 then 
					nRetCode = AddItem(0,108,111,1,1)--��Сʥ��ñ
					SetTask(TASK_GOT_HAT,1)
					strPresent = "1 c�i n�n gi�ng sinh"
				elseif GetItemCount(2,1,208) >= 10 and GetTask(TASK_GOT_HAT) == 1 then
					if DelItem(2,1,208,10) == 1 then
						nRetCode = AddItem(2,1,209,1,1)
					end
					strPresent = " 1 h�p qu� gi�ng sinh"
				end
			end
			
			if nRetCode == 0 then
				--Say("������Ŀռ䲻����������һ�±�������Ķ���������ȡ��")
				Say("Nh�n v�t ph�m th�t b�i!",0)
				return 0
			else
				Msg2Player("B�n nh�n ���c "..strPresent..".")
			end
		end
	else
		local strSex
		local nSex = GetSex()
		if nSex == 1 then
			strSex = "Qu� �ng"
		elseif nSex == 2 then
			strSex = "Qu� B�"
		else
			strSex = "�ng/B�"
		end
		Say("Xin l�i, h�nh nh�"..strSex.." v�n ch�a �� nguy�n li�u l�m qu� Gi�ng Sinh. C�n c�: <color=red>10<color> <color=yellow>s�i ny l�ng<color>, <color=red>1<color> <color=yellow>Ng�c n� thoa<color>, <color=red>10<color> <color=yellow>L�ng th�<color>, <color=red>10<color> <color=yellow>�u�i th�<color>, <color=red>10<color> <color=yellow>V�i �en<color>, <color=red>10<color> <color=yellow>L�ng s�i<color>, <color=red>10<color> <color=yellow>Chu sa<color>, <color=red>10<color> <color=yellow>H� b� mao<color>.",0)
	end		
end

function no()

end

