--������ʯ����ʯ�䷽�����ļ��޹ص������Ƶ����
--��Ҫ�ǿ��ǵ���ʯ��������ᱻ��Χ�õ���
--��������ǲ���һ���������ҲҪ�������ļ��������Ǿ�̫�˷��ڴ���
--����lspf_AddLingShiInBottle��lspf_AddPeiFangInBottle��д����������

--�洢��ʯ�������
SYS_TSK_LINGSHI_ONE = 2321;   --1����ʯ������
SYS_TSK_LINGSHI_TWO = 2322;
SYS_TSK_LINGSHI_THREE = 2323;
SYS_TSK_LINGSHI_FOUR = 2324;
SYS_TSK_LINGSHI_FIVE = 2325;
SYS_TSK_LINGSHI_SIX = 2326;
SYS_TSK_LINGSHI_SEVEN = 2327;  --7����ʯ������

--�洢��ʯ�䷽�������
SYS_TSK_PEIFANG_ONE = 2328;   --1���䷽������
SYS_TSK_PEIFANG_TWO = 2329;
SYS_TSK_PEIFANG_THREE = 2330;
SYS_TSK_PEIFANG_FOUR = 2331;
SYS_TSK_PEIFANG_FIVE = 2332;
SYS_TSK_PEIFANG_SIX = 2333;
SYS_TSK_PEIFANG_SEVEN = 2334;  --7���䷽������

--����ʯ������鶦
function lspf_AddLingShiInBottle(nLevel,nCount)
	SetTask(SYS_TSK_LINGSHI_ONE+nLevel-1,GetTask(SYS_TSK_LINGSHI_ONE+nLevel-1)+nCount);
end;
--���䷽������鶦
function lspf_AddPeiFangInBottle(nLevel,nCount)
	SetTask(SYS_TSK_PEIFANG_ONE+nLevel-1,GetTask(SYS_TSK_PEIFANG_ONE+nLevel-1)+nCount);
end;

function lspf_AddLingShiInBottleEx(nLevel, nCount)
	lspf_AddLingShiInBottle(nLevel, nCount);
	Msg2Player(format("%s nh�n ���c %d vi�n c�p %d  Linh Th�ch, �� cho v�o T� Linh ��nh","C�c h��", nCount, nLevel));
	WriteLog(format("%s Get %d Level %d LingShi", GetName(), nCount, nLevel));
end

function lspf_AddTaiShiLingShiInBottleEx(nLevel, nCount)
	if 1 == lspf_AddTaiShiLingShiInBottle(nLevel, nCount) then
		Msg2Player(format("%s nh�n ���c %d vi�n c�p %d Th�i Th�y Linh Th�ch, �� cho v�o T� Linh ��nh","C�c h��", nCount, nLevel));
		WriteLog(format("%s Get %d Level %d TaiShiLingShi", GetName(), nCount, nLevel));
	end
end

--function lspf_AddPeiFangInBottleEx(nLevel,nCount)
--	lspf_AddPeiFangInBottle(nLevel,nCount);
--	Msg2Player("����"..nCount.."��"..nLevel.."����ʯ�䷽, �ѷ�����鶦");
--	WriteLog(GetName().."���"..nCount.."��"..nLevel.."����ʯ�䷽, �ѷ�����鶦");
--end;
