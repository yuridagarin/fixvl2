--�ν�
--append by lizhi
--2005-9-10 10:17

--Include("\\script\\lib\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�����\\task_main.lua");

function main()
    local nStep = GetTask(TASK_JJC);
    if nStep == 17 then
        task_17_00();
        return
    elseif nStep == 18 then
        task_18_00();
        return
    elseif nStep == 19 then
        task_19_00();
        return
    else
        local szTalk = {
            "Huynh �� ��ng l�ng h� qu�c b�o d�n."
        };
        TalkEx("", szTalk);
    end;
end;
--
--	if CTask:IsTaskFinish("ˮ���ν���")==1 then	--�����
--		Say("<color=green>�ν�<color>����ʥ�ϲ������ֵ��������Ѿ��ǳ�͢ɽ��·�ĵ��ʹ��ʥ��������ר�Ÿ���׷�ó�Ұ������а��������߽�����ҲҪ�������£��������˷��͸ٳ���", 0)
--	elseif CTask:CheckTask("ˮ���ν���")==1 then	--�������
--		FinishTask005()
--	elseif CTask:IsTaskStart("ˮ���ν���")==1 then	--������
--		Say("<color=green>�ν�<color>����ô������û�м����������㵽�꾩����ʦʦ����취����", 0)
--	elseif CTask:CheckTask("ˮ���ν���")==1 then	--�������
--		FinishTask004()
--	elseif CTask:IsTaskStart("ˮ���ν���")==1 then	--������
--		Say("<color=green>�ν�<color>����ܸ��ϣ���ȡ�����ϵ����죬�ٱ��ͻ᲻ս�����ˡ�", 0)
--	elseif CTask:CheckTask("ˮ���ν���")==1 then	--�������
--		FinishTask003()
--	elseif CTask:IsTaskStart("ˮ���ν���")==1 then	--������
--		Say("<color=green>�ν�<color>��ؤ��һ����ˮ�����ã������ݺ�����ز��������Թۡ������ȥؤ����һ�ˣ����������������������������ϣ���ʩԮ�֡�", 0)
--	elseif CTask:CheckCanStart("ˮ���ν���")==1 then	--������
--		StartTask003()
--	elseif CTask:IsTaskFinish("ˮ���ν���")==1 then	--�����
--		Say("<color=green>�ν�<color>������ȥ��Ϣ��Ϣ���ȵ���<color=yellow>35��<color>�������ҡ�", 0)
--	elseif CTask:CheckTask("ˮ���ν���")==1 then	--�������
--		FinishTask002()
--	elseif CTask:IsTaskStart("ˮ���ν���")==1 then	--������
--		Say("<color=green>�ν�<color>��������������κӺ����İ��࣬�ڶ���������ð���Һ����ӣ�ɱ�˷Ż�����ǿ�飬�������ǵ���ͷ��ʮ�ֿɶ���ȥ���Ұ����ǳ�����ʰȡ�������ϵ��Ʒ������ң���", 0)
--	elseif CTask:CheckTask("ˮ���ν�һ")==1 then	--�������
--		FinishTask001()
--	elseif CTask:IsTaskStart("ˮ���ν�һ")==1 then	--������
--		Say("<color=green>�ν�<color>���ٲ����ɽ�µ�Ұ���־��У������һ���ٲ���Դ����Ϳ�������ˡ�", 0)
--	elseif CTask:CheckCanStart("ˮ���ν�һ")==1 then	--������
--		StartTask001()
--	else	--����ǰ
--		Say("<color=green>�ν�<color>��ѧ�ù����գ������ιټң�������Ȼ���Ϊ�ܣ���Ҳʱ�̲���������Т���尡����", 0)
--	end
--end;
--
--function StartTask001()
--	local strMain = {
--		"<color=green>���<color>���ɶ���ɽ����ָ�㣬����Ͷ���δ�磬������¼��",
--		"<color=green>�ν�<color>�������˵����ɽ�������һ���쵱���ĺú������Ȼ���������ģ���Ȼ���²�����һЩ�����Ƚھ����ˣ����ȥ���ܵ�·���������Ͷ��״������",
--		"<color=green>���<color>����ң���֪��νͶ��״��",
--		"<color=green>�ν�<color>�������������ٲ���Դ������ҡ�",
--		"<color=green>���<color>����������",
--		"<color=green>�ν�<color>����ʲô�������е��ٵĹ�أ��������ݵĹ�ء���ˮ������ССӢ�ۺú�Ҳ�а����������ƴ���Դ������Ķ����������£��㲻���Ͷ��״����˭�����㣿�ٲ����ɽ�µ�Ұ���־��У������һ���ٲ���Դ����Ϳ�������ˡ�",
--}
--	CTask:TalkEx(strMain)
--	CTask:StartTask("ˮ���ν�һ");
--	TaskTip("ȥҰ����ɱ���ٲ��һ���ٲ���Դ�����")
--end
--
--
--function FinishTask001()
--local strMain = {
--	"<color=green>���<color>����磬�ҵ�Ͷ��״�Ѿ�ȡ���ˡ�",
--	"<color=green>�ν�<color>���ã�����Ͷ��״���ȹ���Ѫ�ƣ����������ˮ����һ���ú��ˡ�����ˮ����10��կ�棬20�����ɣ�30�����򣬿��ؿɲ��ء�������Ҫһ��������Ҫʱ���μ����ǵĿںţ������е�����",
--	"<color=green>���<color>�������е���",
--	"<color=green>�ν�<color>��������������κӺ����İ��࣬�ڶ���������ð���Һ����ӣ�ɱ�˷Ż�����ǿ�飬�������ǵ���ͷ��ʮ�ֿɶ���ȥ���Ұ����ǳ�����ʰȡ�������ϵ��Ʒ������ң���",
--}
--	CTask:TalkEx(strMain)
--	CTask:FinishTask("ˮ���ν�һ")
--	CTask:PayAward("ˮ���ν�һ")
--	CTask:StartTask("ˮ���ν���");
--	TaskTip("���������������κӺ����ʰȡ�������ϵ��Ʒ������ν���")
--end;
--
--
--function FinishTask002()
--local strMain = {
--	"<color=green>���<color>����磬�κӺ�����Ѿ���������ˣ���������ǵ��Ʒ���",
--	"<color=green>�ν�<color>�����������ˣ�ʵ���Ǹ����Ľ�����������ĺܺã����Ǹ���Ľ����������ʱ�������ң���������ί�ɡ�",
--}
--	CTask:TalkEx(strMain)
--	CTask:FinishTask("ˮ���ν���")
--	CTask:PayAward("ˮ���ν���")
--	TaskTip("��������ɣ��뵽��30���������ν���")
--end;
--
--
--function StartTask003()
--	local strMain = {
--		"<color=green>�ν�<color>�����������ã����Ѿ��õ��ɿ���Ϣ����͢���Ͼ�Ҫ�ɱ�������ˮ��������кõ��˵�֮�ߣ�",
--		"<color=green>���<color>��С��Ѱ˼���⿿ˮ��һ�ҵ�������������һʱ��������һ�������ö���ЩԮ�ֲźá�",
--		"<color=green>�ν�<color>���ţ����������ǡ�ؤ��һ����ˮ�����ã������ݺ�����ز��������Թۡ������ȥؤ����һ�ˣ����������������������������ϣ���ʩԮ�֡�",
--}
--	CTask:TalkEx(strMain)
--	CTask:StartTask("ˮ���ν���");
--	TaskTip("ȥؤ�������������Ԯ��ˮ����")
--end
--
--
--function FinishTask003()
--local strMain = {
--	"<color=green>���<color>����磬���Ѿ��ɹ�˵���������죬����������ؤ����Ӹ�����",
--	"<color=green>�ν�<color>��ؤ�����¹�Ȼ�������ˣ��������ǰ�æ������ͺð���ˡ��ٱ��Ѿ�����ɽ�ţ����Ͼ�Ҫ��Χ���ˣ�������ȥ�Ҽ���־ͬ���ϵ��ֵܣ�һ��ȥɱ�˹ٱ���",
--	"<color=green>���<color>�������ȥ��",
--	"<color=green>�ν�<color>���ţ��ٱ����ӵ�ͷ��и��ϣ���֪�����������ȡ�����ϵ���������ˡ�",
--}
--	CTask:TalkEx(strMain)
--	CTask:FinishTask("ˮ���ν���")
--	CTask:PayAward("ˮ���ν���")
--	CTask:StartTask("ˮ���ν���");	
--	TaskTip("ȥ��Щͬ�飬��ܸ��ϣ�ȡ�������ϵ����졣")
--end;
--
--
--function FinishTask004()
--local strMain = {
--	"<color=green>���<color>����磬���Ѿ��ɹ�����˸��ϣ������������졣",
--	"<color=green>�ν�<color>���ã������ˡ����㵽ˮ�������Ҿ�һֱ�ڹ۲죬���Ǵ����ˣ������Ҿ����ô����˵ķ�ʽ����˵�����ӱ�����˵�������е�ֻ��һ���ںţ������з�Ҳ�ǡ������������ںţ���Ϊ�������Щ���������ˣ���Ϊ�������Ҫ������ΪʲôҪ����أ�����Ϊ����Ӱ���������󣬲������٣�Ҳû��Ǯ��Ů�ˡ�Ҫ�ı���һ�У���һ��Ҫ��������е��Ŀںţ���Ը�����ˣ���������Ӱ�죡",
--	"<color=green>���<color>���˽⡣�����е��������е���",
--	"<color=green>�ν�<color>�������ҳ��ڼ���Ŭ�������ǵ������Ѿ������˻��ϣ����Ӱ���Ѿ������ˡ�������������һ��Σ�յ����񽻸��㡣��Ҫ���꾩ȥ���跨�ӽ���ʦʦ��ͨ�����������ϣ�����������а����ǣ����ǾͿ������ܴ�Ĺ٣��кܶ��Ǯ��Ů�ˣ��������ǳ���Σ�գ����Բ����õڶ�����֪������ʲô����û�У�",
--	"<color=green>���<color>���ɲ����Բ�ȥ��",
--	"<color=green>�ν�<color>�����С����Ǹ����ϵ����ţ�������˽���������500����������ȥ����ɾ����·�����ȥ��أ���Ҫ��ˮ��������",
--}
--	CTask:TalkEx(strMain)
--	CTask:FinishTask("ˮ���ν���")
--	CTask:PayAward("ˮ���ν���")
--	CTask:StartTask("ˮ���ν���");	
--	TaskTip("ȥ�꾩����ʦʦ���跨�ӽ����ϡ�")
--end;