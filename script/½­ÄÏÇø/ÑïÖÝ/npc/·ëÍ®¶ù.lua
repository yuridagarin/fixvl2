--��ͮ��
--created by lizhi
--2005-9-1 16:19

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	--���
	local tSay = {};
	--���
	local tActivityID = {116};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
	end
	if getn(tSay) > 0 then
		tinsert(tSay, "Ra kh�i/nothing")
		Say("<color=green>Ph�ng ��ng Nhi<color>: Ng��i c� nh�n th�y �o�n ng��i ng�a ngo�i th�nh kh�ng? Ng��i d�n ��u t�n L�i Th�ng, ng��i �� nh�n th�y ch�a?", getn(tSay), tSay);
		return 
	end
	-------
	 
  local nStep = GetTask(TASK_YZ_ONE);
  if nStep == 1 then
      task_01_00();
  elseif nStep == 2 then
      local szTalk = {
          "Ta kh�ng sao ��u. <sex> ��ng qu� lo l�ng cho ta!"
      }
      TalkEx("", szTalk);
  else
      Talk(1,"","<color=green>Ph�ng ��ng Nhi<color>: Ng��i c� nh�n th�y �o�n ng��i ng�a ngo�i th�nh kh�ng? Ng��i d�n ��u t�n L�i Th�ng, ng��i �� nh�n th�y ch�a?");
  end;
end;

function task_01_00()
    local szTalk = {
        "V� ��y l� Ph�ng ��ng Nhi? Ta �� mang ��n m�t tin kh�ng vui��.",
        "Ng��i c� n�i! Ta �t nhi�u �� �o�n ���c chuy�n b�t h�nh!",
        "L�i Th�ng �� b� h�m h�i tr�n ���ng ��n D��ng Ch�u... L�i huynh �� ra �i m�i m�i �T�i h� nh�n th�y tr�n ng��i L�i huynh c� b�c phong th�. Hy v�ng c� ���c ch�t t�m nguy�n cu�i c�ng, huynh �y g�i l�i cho c� n��ng!",
        "Ta v� ch�ng s�p n�n ngh�a phu th�...n�o ng�....Ch�ng t�ng n�i v�i ta�Tr��c kia, ch�ng l� ng��i c�a Xi H�a gi�o, �� h�m h�i nhi�u ng��i n�n trong l�ng kh�ng y�n, e r�ng sau n�y c�n �nh h��ng ��n con c�i. Ch�ng �� quy�t ��nh r�i kh�i giang h�, c�ng v� con s�ng cu�c ��i �n d�t, vui th� �i�n vi�n!"
    };
    TalkEx("task_01_00_00", szTalk);
end;

function task_01_00_00()
    local szTalk = {
        "V� v�y m�i n�n c� s� �au l�ng?",
        "��ng! M�y ng�y tr��c, thu�c h� c�a ch�ng m�i mang t�i m�t m�n �� r�t quan tr�ng. Ch�ng c�n bi�t H� H�u C�m l� ng��i li�n l�c c�a Tr��ng Ca M�n n�n quy�t ��nh mang v�t quan tr�ng n�y ��n cho n�ng. C� l� ch�ng �� �o�n ���c nh�ng nguy hi�m tr�n ���ng �i n�n �� �� ta t� m�nh ��n D��ng Ch�u? Th�t b�t h�nh cho ��i ta....",
        "C� n��ng h�y y�n t�m! T�i h� nh�t ��nh s� t�m ra hung th�!",
        "B� �i! T�m l�m g�? B�o th� �? Ph�n li�u y�u nh� ta th� b�o th� g� ch�! N�u c� b�o th�, ch�ng c�ng kh�ng s�ng l�i ���c, l�i g�y th�m th� h�n ch�t ch�ng! Th�i thׅ",
        "C� n��ng ngh� ���c nh� v�y, t�i h� c�m th�y y�n l�ng. C� n��ng h�y b�nh t�m, n�n �au th��ng �� s�ng nh�ng ng�y vui v� sau n�y!"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    DelItem(2,0,101,1);
    SetTask(TASK_YZ_ONE, 2);
    GivePlayerAward("Level_31", "easy", "head", "Level_31");
	GivePlayerExp(SkeyYZxiahouqin,"zuihoudeyuqishu")		--����������
end;