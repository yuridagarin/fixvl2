--ϴ������ҩ��Ʒ�ű�

Include ("\\script\\system_switch_config.lua")

t_name = {"Nh�m M�ch", "��c M�ch", "��i M�ch", "Xung M�ch",}
t_type_task = {2947, 2948, 2949, 2950,}

function OnUse_Real(id)
	local tbSay = {}
	local szTitle = ""
	if 1 == IsMeridianSystemOpen() and MeridianGetLevel() >= 1 then
		szTitle = format("D�ch C�n �an: ta c� th� gi�p ng��i t�y t�y d�ch c�n, xin h�y ch�n kinh m�ch c�n t�y.")
		for i=1,4 do
			local nCurTypeZhenQi = GetTask(t_type_task[i])
			if nCurTypeZhenQi > 0 then
				tinsert(tbSay, format("%s%s/#_do_restore(%d)", "Ta mu�n t�y t�y", t_name[i], i))
			end
		end
--		tinsert(tbSay, format("%s%s/#_do_restore(1)","��Ҫϴ��", t_name[1]))
--		tinsert(tbSay, format("%s%s/#_do_restore(2)","��Ҫϴ��", t_name[2]))
--		tinsert(tbSay, format("%s%s/#_do_restore(3)","��Ҫϴ��", t_name[3]))
--		tinsert(tbSay, format("%s%s/#_do_restore(4)","��Ҫϴ��", t_name[4]))
		tinsert(tbSay, "Ta ch� gh� ch�i/no")
	else
		szTitle = format("Hi�n t�i c�c h� v�n ch�a k�ch ho�t c�nh gi�i, r�t ti�c ta kh�ng th� gi�p ng��i d�ch c�n t�y t�y.")
		tinsert(tbSay, "Ra kh�i/no")
	end
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _do_restore(nType)
	if nType >= 1 and nType <= 4 then
		local nCurTypeZhenQi = GetTask(t_type_task[nType])
		if nCurTypeZhenQi > 0 then
			local nDelResult = DelItem(2,1,30549,1)
    		if 1== nDelResult then
    			local nResult = MeridianRestore(nType)
            	if nResult > 0 then
            		Talk(1,"",format("[%s]%s", t_name[nType], "T�y t�y th�nh c�ng!"))
            	else
            		--Talk(1,"",format("[%s]%s", t_name[nType], "����Ҫϴ�裡"))
            	end
    		end
		else
			Talk(1,"",format("[%s]%s", t_name[nType], "Kh�ng c�n t�y t�y!"))
		end
	end
end


function no()
end

