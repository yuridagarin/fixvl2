--����NPC��ͷ
--created by lizhi
--2005-9-25 19:46
Include("\\script\\task\\world\\task_head.lua");

function main()
        local szSay = {
            "Thi�n lao tr�ng ��a, kh�ng ���c �i l�i lung tung!",
            "Gi�p d�m �i m�!/bribe",
            "R�i kh�i thi�n lao/leave_prison",
            "Xem ng�y ch�u ph�t/inquire",
            "K�t th�c ��i tho�i/end_say"
        }
        SelectSay(szSay)
end

function bribe()
	 nNeedPrisonTime = 1440*2*GetBePrisonedNum()
	 nLeftPrisonTime = GetPrisonLeftTime()
	 if (nLeftPrisonTime == 0) then
	 		NoSin()
	 elseif (nLeftPrisonTime <= nNeedPrisonTime)  then 
	    nMoney = GetCash()
	    nSaveMoney = GetSaveMoney()
	    nNeedMoney = nNeedPrisonTime * 5 *10000 / 60
	    nGold = nNeedMoney / 10000
			if (nMoney >= nNeedMoney) then
			      local szSay = {
            "Ng��i � ��y m�y ng�y r�i, n�u c� ng�n l��ng"..nGold.."ta s� gi�p ng��i r�i kh�i ��y!",
            "Ta ��ng �!/#leave_by_paymoney("..nNeedMoney..")",
            "Th�t kinh t�m!/end_say"
            }
           SelectSay(szSay)
			elseif (nMoney + nSaveMoney >= nNeedMoney) then
						local szSay = {
            "Ng��i � ��y m�y ng�y r�i, n�u c� ng�n l��ng"..nGold.."ta s� gi�p ng��i r�i kh�i ��y!",
            "Ta ��ng �!/#leave_by_paysavemoney("..nNeedMoney..")",
            "Th�t kinh t�m!/end_say"
            }
           SelectSay(szSay)
			else
			    laugh()
			end		
	 else
	 	    local szSay = {
        "H�m! M�i v� �� mu�n ra r�i, v� suy ngh� l�i �i!",
        "K�t th�c ��i tho�i/end_say"
        }
        SelectSay(szSay)
	 end	 
end

function leave_prison()
    nLeftPrisonTime = GetPrisonLeftTime()
    
    if (nLeftPrisonTime > 0) then
    	  local szSay = {
        "Ch�a h�t ng�y th� h�nh, kh�ng ���c r�i kh�i thi�n lao!",
        "K�t th�c ��i tho�i/end_say"
        }
        SelectSay(szSay)
    else 
			  leave_say()
    end 
end

function end_say()

end

function leave_say()
  local szSay = {
  "Ch�i game �� gi�i tr�, kh�ng n�n s� auto!",
  "R�i kh�i thi�n lao/leave"
  }
  SelectSay(szSay)	
end

function leave()
		NewWorld(200, 1373, 2700, 1)
		SetPlayerRevivalPos(200, 200)
		SetLeftPunishTime(0)
		SetPrisonLeftTime(0)
		UseSkillEnable(1)
		StallEnable(1)
end

function laugh()
  local szSay = {
  "H�m! Ch� �t �i ng�n l��ng v�y m� c�ng mu�n qua �i �, v� suy ngh� l�i �i!",
  "K�t th�c ��i tho�i/end_say"
  }
  SelectSay(szSay)
end

function NoSin()
	local szSay = {
  "Ng��i ��u c� t�i, t�m ta l�m chi v�y!",
  "K�t th�c ��i tho�i/end_say"
  }
  SelectSay(szSay)
end

function leave_by_paymoney(nNeedMoney)
	 if Pay(nNeedMoney) == 1 then
	 		szLog = "[BribeMoney]Account: "..GetAccount().." RoleName: "..GetName().." Bribe Money: "..nNeedMoney .."In Pack"
	    WriteLog(szLog)
			leave_say()
	 end
end

function leave_by_paysavemoney(nNeedMoney)
  nMoney = GetCash()
  nSaveMoney = nNeedMoney - nMoney
	if (Pay(nMoney) == 1)  then
		szLog = "[BribeMoney]Account: "..GetAccount().." RoleName: "..GetName().." Bribe Money: "..nNeedMoney .."In Pack"
		WriteLog(szLog)
		if (PaySaveMoney(nSaveMoney)==1) then
			szLog2 = "[BribeMoney]Account: "..GetAccount().." RoleName: "..GetName().." Bribe Money: "..nSaveMoney.."In Box"
	    WriteLog(szLog2)
	    leave_say()
		end
	end
end

function inquire()
  nNeedPrisonTime = 1440*2*GetBePrisonedNum()
	nLeftPrisonTime = GetPrisonLeftTime()
	
	if nLeftPrisonTime > 0 then
	  local szSay = {
	  "Theo lu�t ��i T�ng ng��i �� b� b�t"..nNeedPrisonTime.." ph�t, th�i gian r�i thi�n lao c�n "..nLeftPrisonTime.." ph�t!",
	  "K�t th�c ��i tho�i/end_say"
	  }
	  SelectSay(szSay)
  else
	  local szSay = {
	  "Ng��i �� ���c tha, mau r�i kh�i ��y!",
	  "K�t th�c ��i tho�i/end_say"
	  }
	  SelectSay(szSay)
  end
  
end
