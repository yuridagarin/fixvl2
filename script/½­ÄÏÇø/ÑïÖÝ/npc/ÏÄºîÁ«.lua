--�����������ĺ���
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_����\\task_main.lua");
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20130614 and nDate <= 20130714 then	
	--���������
	--local tSay = aah_GetSayDialog(89);
	--���ʶ�ͯ��
		local tSay = aah_GetSayDialog(93);
		if getn(tSay) > 0 then
			tinsert(tSay, "Tho�t/nothing");
			Say(format("<color=green>H� H�u Li�n<color>: %s mang m�n ngon g� ��n t�ng mu�i th�?", GetPlayerSex()), getn(tSay), tSay);
			return 0;
		end
	end
	
  local nStep = GetTask(TASK_YZ_TWO);
  if nStep == 7 then
      if GetSex() == 1 then
          Talk(1,"","��i ca ca! Mu�i th��ng �au b�ng, to�n th�n ng�a ng�y. Kh� ch�u qu�!...");
      elseif GetSex() == 2 then
          Talk(1,"","��i t� t�! Mu�i th��ng �au b�ng, to�n th�n ng�a ng�y. Kh� ch�u qu�!...");
      end
      return
	end
  
  nStep = GetTask(TASK_FIVE);
  if nStep == 10 then
      task_10_00();
      return
  elseif nStep >= 11 and nStep < 19 then
      Talk(1,"","Ha ha ha.");
      return
  elseif nStep == 19 then
      task_19_00();
      return
  elseif nStep > 19 then
      Talk(1,"","Ha ha ha.");
      return
  end;
end;

function nothing()

end