--function main()
--Say ("<color=green>��׼<color>����ĳ�����ƹ���Ժ��һ���йؽ�Ʒ���������˾����Ҹ�����ʲô���԰ﵽ��ģ�",2,"����Ҷһ���Ʒ/jiangpin","��ʱû��/no")
--end

--function jiangpin()
--Say ("<color=green>��׼<color>���Բ�����û��ʲô��Ʒ���졣",0)  --���ý���
--end;


--function no()
--Say ("<color=green>��׼<color>���������������������ĳ�ʵ���ӡ�",0)  
--end;

--���񣺻��л�������ʾ
--�ص㣺 ����
--�߻���������  2004.03.
--append by lizhi
--2005-8-8 11:20

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�꾩\\task_main.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\201203\\kuizheng\\kuizeng.lua")

function main()
    local nLevel;
    local nStep;
    nLevel = GetLevel();
    nStep = GetTask(TASK_BJ_ID);
    local nXbValue = GetTask(TASK_XB_ID)
    
           --2012��4�¹����
	if gf_CheckEventDateEx(60) == 1 then
		gf_Say(VET_201203_KuiZeng_tbTalkDialog);
		--return 0;
	end
    
	if nXbValue == 100 then
		nXbValue = 0
	end
    --��ȡ��������01���İ�ӿ Ҫ�� �ȼ���= 70
    if nXbValue == 0 and nLevel >= 70 then
  		task_001_01_0();
  		return  	
    end
    
    --��������01���İ�ӿ����û��������Ի�
    if nXbValue == 1 then
    	task_001_01_1();
    	return 
    end

    
    ---------------------------------- ������29����֮��------------------------------------------
    
    --ѯ�ʹ�����������������
    if GetTask(TASK_XB_ID_01) == 69 then
  		task_029_02_0();
  		return  	
    end
    
    --��δ���С��ȡ�����
    if GetTask(TASK_XB_ID_01) == 70 then
  		task_029_02_1();
  		return  	
    end
    
    --��δ�����Ԫ��
    if GetTask(TASK_XB_ID_01) == 71 then
  		task_029_02_2();
  		return  	
    end
    
    --�Ѿ������Ԫ�����׼�Ի�
    if GetTask(TASK_XB_ID_01) == 72 then
  		task_029_04_0();
  		return  	
    end
    
    --�Ѿ������Ԫ����ȡ�һ�װ��
    if GetTask(TASK_XB_ID_01) == 73 then
  		task_029_04_0_2();
  		return  	
    end
    
    --�Ѿ��һ���װ�����һ�������
    if GetTask(TASK_XB_ID_01) == 74 then
  		task_029_04_0_5();
  		return
    end
     
    --��δ��ȡ���һ�װ����Bug�޸���
    if GetTask(TASK_XB_ID_01) == 75 then
  		task_029_04_0_100();
  		return
    end
    
    --��ȡ���һ�װ����Ի���Bug�޸���
    if GetTask(TASK_XB_ID_01) == 76 then
  		task_029_05_0();
  		return  	
    end
    
    ---------------------------------------------------------------------------------------------
    
    if GetTask(1) >= 25 and GetTask(1) < 100 then
        if (nStep == 0) then
            task_000_00();
            SetTask(131,2);
            if GetTask(130) == 2 and GetTask(132) == 2 then
                SetTask(1, 26); --�����������������������(���һ��)����ر��������
            end;
            return
        elseif (nStep == 13) then
            task_013_00();
            return
        elseif (nStep == 14) then
            task_014_00();
            return
        end;
    end;

    Talk(1,"","L�o phu ��y tuy kh�ng ra kh�i Bi�n Kinh nh�ng chuy�n trong thi�n h� ta ��u bi�t c�.");

end;

function  pipcap()
--	ClosePiP()
	Pn2 = GetCaptainName()
	if( Pn2 == 0) then
			Talk(1,"","Ti�c cho ng��i kh�ng c� ��i tr��ng!")
	else	
			Talk(1,"","�i�u ng��i mu�n bi�t ��y, hi hi!")
			SetPiPView(Pn2,1)
	end;
end;

function  pipwhere()
--	ClosePiP()
	Talk(1,"","�i�u ng��i mu�n bi�t ��y, hi hi!")
	SetPiPView(314,1582,2903)
end;

function  pipkz()
--	ClosePiP()
	Talk(1,"","�i�u ng��i mu�n bi�t ��y!")
	SetPiPView(200,1426,2741)
end;

function  closepip()
		ClosePiP()
		Talk(1,"","Mai m�t ��ng xem th��ng ta n�a nh�!")
end;