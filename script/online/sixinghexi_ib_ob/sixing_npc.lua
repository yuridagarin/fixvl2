--create date:07-04-04
--author:yanjun
--describe:������NPC�ű�
Include("\\script\\online\\sixinghexi_ib_ob\\sixinghexi_head.lua")
function main()
	local nNpcIdx = GetTargetNpc()
	local szNpcName = GetNpcName(nNpcIdx);
	local nNpcType = get_npc_type(szNpcName);
	if nNpcType ~= 0 then
		dlg_main(nNpcType);
	end;
end
--��ȡNPC������
function get_npc_type(szNpcName)
	local nNpcType = 0;
	if szNpcName == "Ph�c Th�n" then
		nNpcType = 1;
	elseif szNpcName == "T�i th�n" then
		nNpcType = 2;
	elseif szNpcName == "Chi�n th�n" then
		nNpcType = 3;
	elseif szNpcName == "Th�c th�n" then
		nNpcType = 4;
	end;
	return nNpcType;
end;
--��ȡ��ǰ��ͼ������
function get_curmap_info()
	local nCurMapID = GetWorldPos();
	for i,v in tbMapInfo_ib_ob do
		if nCurMapID == v[3][1][1] then
			return v[2],v[1];
		end;
	end;
	return "";
end;

function dlg_main(nType)
	local selTab = {
				"T�t qu�! Xin �a t�"..tbNpcInfo_ib_ob[nType][2].."!!/#get_present("..nType..")",
				"�a t�, s� v�t ph�m n�y �� d�nh t�ng cho b�ng h�u./nothing",
				}
	Say("<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: "..tbNpcInfo_ib_ob[nType][3],getn(selTab),selTab);
end;

function get_present(nType)
	--���NPC������
	if GetTargetNpcName() ~= tbNpcInfo_ib_ob[nType][2] then
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	local nTime = tonumber(date("%y%m%d%H%M"));
	local szMapName,nGlbIdx = get_curmap_info();
	local nPresentLeft = MAX_PRESENT_COUNT - GetGlbValue(nGlbIdx);
	local nLastMapID = GetTask(TASK_MAPID);
	local nGotDate = GetTask(TASK_GOT_DATE);
	local nGotTime = GetTask(TASK_TIME);
	local nCurMapID = GetWorldPos();
	local nCurTime = GetTime();
	if nPresentLeft == 0 then	--���û������
		Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: Qu� ta mang ��n �� ph�t h�t r�i, phi�n b�ng h�u l�n sau ��n s�m nh�!");
		return 0;
	end;
	--�ж���ͬһʱ�εķ�����
	--�ϴ���ȡʱ�����ĵ�ͼ�͵�ǰ��ͼ��ͬ����
	--��ǰʱ���ȥ�ϴ���ȡ����ʱ��С��NPC����ʱ��
	if nLastMapID == nCurMapID and nCurTime - nGotTime < IB_OB_NPC_LIFE_TIME then	--��ʱ����ȡ��������
		Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: Ng��i �� nh�n qu� r�i, mu�n l�m h�o h�n th� kh�ng ���c tham nh� v�y ch�.");
		return 0;
	end;
	if nDate > nGotDate then	--�µ�һ���������
		SetTask(TASK_GOT_DATE,nDate);
		SetTask(TASK_PRESENT_TIMES,0);
	end;
	if GetTask(TASK_PRESENT_TIMES) >= MAX_GOT_TIMES then	--���������ȡ���㹻�������
		Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: H�m nay ng��i may m�n �� nh�n ���c nhi�u qu� r�i, ch� c�n l�i �� nh��ng cho ng��i kh�c.");
		return 0;
	end;

	if gf_JudgeRoomWeight(2,200) == 0 then
		Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: H�nh trang c�a ng��i �� kh�ng c�n ch� tr�ng, h�y s�p x�p l�i r�i ��n nh�n qu�.");
		return 0;
	end;
	SetTask(TASK_PRESENT_TIMES,GetTask(TASK_PRESENT_TIMES)+1);
	SetTask(TASK_MAPID,nCurMapID);
	SetTask(TASK_TIME,nCurTime);
	SetGlbValue(nGlbIdx,GetGlbValue(nGlbIdx)+1);
	local nRand = 0;
	local szPresent = "";
	local szPlayerName = GetName();
	if nType == 1 then
		ModifyReputation(30,0);
		AddItem(2,5,7,5);
		Msg2Player("B�n nh�n ���c 5 t�m Gi�m ��nh ph� c�p 7.");
		Msg2Global("Ng��i ch�i"..szPlayerName.."T�i"..szMapName.."G�p ���c Ph�c Th�n nh�n v� s� qu�, th�t khi�n cho ng��i kh�c ph�i ganh t�!")
	elseif nType == 2 then
		nRand = random(1,100)
		if nRand <= 75 then
			Earn(80000);
			szPresent = "8 v�ng";
		elseif nRand <= 95 then
			Earn(180000);
			szPresent = "18 ti�n v�ng";
		else
			Earn(280000);
			szPresent = "28 ti�n v�ng";
		end;
		Msg2Global("Ng��i ch�i"..szPlayerName.."T�i"..szMapName.."G�p Th�n t�i nh�n ���c v� s� ng�n l��ng"..szPresent..", th�t khi�n ng��i kh�c ph�i ganh t�!");
	elseif nType == 3 then
		nRand = random(1,100)
		if nRand <= 85 then
			AddItem(2,1,481,1);
			Msg2Player("B�n nh�n ���c m�t t�i Ng� Hoa Ng�c L� Ho�n");
			szPresent = "Ng� Hoa Ng�c L� Ho�n (ti�u)";
		elseif nRand <= 90 then
			AddItem(2,1,483,1);
			Msg2Player("B�n nh�n ���c m�t t�i Sinh Sinh H�a T�n");
			szPresent = "Sinh Sinh H�a T�n (ti�u)";
		elseif nRand <= 95 then
			AddItem(2,1,489,1);
			Msg2Player("B�n nh�n ���c m�t t�i Ng�c Cao T�n");
			szPresent = "H�c Ng�c �o�n T�c Cao (ti�u)";
		else
			AddItem(2,1,495,1);
			Msg2Player("B�n nh�n ���c m�t t�i V�n V�t Quy Nguy�n ��n");
			szPresent = "V�n V�t Quy Nguy�n ��n (ti�u)";
		end;
		Msg2Global("Ng��i ch�i"..szPlayerName.."T�i"..szMapName.."G�p ���c Chi�n th�n nh�n ���c v� s� v�t ph�m"..szPresent..", khi�n ng��i kh�c ph�i �� k�!");
	elseif nType == 4 then
		nRand = random(1,100)
		if nRand <= 25 then
			AddItem(1,1,14,30);
			Msg2Player("B�n nh�n ���c 30 C�m chi�n tr�ng");
			szPresent = "30 ph�n c�m chi�n tr�ng";
		elseif nRand <= 50 then
			AddItem(1,1,9,30);
			Msg2Player("B�n nh�n ���c 30 C�i x�o t�i");
			szPresent = "30 C�i x�o t�i";
		elseif nRand <= 75 then
			AddItem(1,1,13,30);
			Msg2Player("B�n nh�n ���c 30 T�y M�ng T�u");
			szPresent = "30 T�y M�ng T�u";
		elseif nRand <= 83 then
			AddItem(1,1,15,20);
			Msg2Player("B�n nh�n ���c 20 b�nh B�t v�ng");		
			szPresent = "20 b�nh B�t v�ng";
		elseif nRand <= 91 then
			AddItem(1,1,17,20);
			Msg2Player("B�n nh�n ���c 20 Nh� th�p t� ki�u Minh Nguy�t D�");
			szPresent = "20 Nh� th�p t� ki�u Minh Nguy�t D�";
		else
			AddItem(1,1,19,20);
			Msg2Player("B�n nh�n ���c 20 T�y B�c V�ng");	
			szPresent = "20 T�y B�c V�ng";	
		end;
		Msg2Global("Ng��i ch�i"..szPlayerName.."T�i"..szMapName.."G�p ���c Th�c th�n, nh�n ���c v� s� th�c ph�m"..szPresent..", khi�n ng��i kh�c ph�i ganh t�!");
	end;
	Talk(1,"","<color=green>"..tbNpcInfo_ib_ob[nType][2].."<color>: Ph�n th��ng c�a ng��i ��y, ch�c vui v�!");
end;