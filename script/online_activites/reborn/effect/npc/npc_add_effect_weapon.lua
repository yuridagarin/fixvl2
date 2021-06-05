----------------[��˵����Ӧ����һ������]----------------
--------------------------------------------------------
--�ű�����:��������Ի��ű�                            |
--�ű�����:�����������NPC����                         |
--���ܿ�����:�����                                    |
--���ܿ���ʱ��:2009-12-28                              |
--��Ҫ�޸ļ�¼:                                        |
--------------------------------------------------------

Include("\\script\\online_activites\\reborn\\effect\\head.lua")

---------------------------------------------------------------
--[���������Ϣ]                                              |
--����:effect_soul  ����:effect_power  �ָ��:effect_guide  |
--[˵��]Խ����������ɹ�����ֱ�Ӹ��Ӳ���Ҫ��������            |
---------------------------------------------------------------

--//������Ч���Ի����
function weapon_effect()
    local nPlayerRoute = GetPlayerRoute();
    local tbRouteInfo = {0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1};
    tbRouteInfo[0] = 0;
    if tbRouteInfo[nPlayerRoute] == 0 then                                  --�Ƿ��Ѿ�������
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][1]);
        return 0;
    end
    local nWeaponIndex = GetPlayerEquipIndex(2);
    SetTaskTemp(VIE_201005_REBORN_TASKTEMP_WeaponIndexSaved, nWeaponIndex); --���浱ǰ������������ֹ�������
    local tbSays = {
        --VIE_201005_REBORN_STR_NpcDialog[1][3].."/add_weapon_effect", 
        --VIE_201005_REBORN_STR_NpcDialog[1][4].."/del_weapon_effect", 
       --VIE_201005_REBORN_STR_NpcDialog[1][5].."/weapon_effect_guide", 
        --VIE_201005_REBORN_STR_NpcDialog[1][6].."/gf_DoNothing"
    };
    Say(VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][7], getn(tbSays), tbSays);
    return 1;
end

--[����]--
function add_weapon_effect()
    local nWeaponIndex = GetPlayerEquipIndex(2);
    if nWeaponIndex == 0 then                                               --�Ƿ�Я������
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][8]);
        return 0;
    end
    local szWeaponName = GetItemName(nWeaponIndex);
    if AbradeItem(nWeaponIndex, 0) == 0 then                                --�Ƿ����;�
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][9], szWeaponName));
        return 0;
    end
    local szEffectSoulName = GetBindedWeaponEffectName();
    if szEffectSoulName ~= "" then                                          --�Ƿ��Ѿ���������
        Talk(1, "" , VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][10], szWeaponName, szEffectSoulName));
        return 0;
    end
    soul_choose_list(1);                                                    --���������ж�����ܻ��ѵ������б�
    return 1;
end

--//���������ж�����ܻ��ѵ������б�
--nPage ��ҳ��ʾ����ʾҪ��ʾ�ڼ�ҳ
function soul_choose_list(nPage)
    local szDialogHead = VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][11];
    local tbEffectSoul = {};
    local tbDialog = {};
    for i = 1, getn(VIE_201005_REBORN_TB_WeaponEffectInfo) do               --ѡ����е�����
        if dostring(VIE_201005_REBORN_TB_WeaponEffectInfo[i][6]) == 1 then
            tinsert(tbEffectSoul, i);
        end
    end
    --��ҳ��ʾ����(����ҳ)
    if getn(tbEffectSoul) > 5 then                                            --����5��
        if nPage == 1 then                                                    --��һҳ
            for i = 1, 5 do 
                local nIndex =  tbEffectSoul[i];
                tinsert( tbDialog, format(VIE_201005_REBORN_STR_NpcDialog[1][12], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1]).."/#effect_soul_wakeup("..nIndex..")" );
            end
            tinsert( tbDialog, VIE_201005_REBORN_STR_NpcDialog[1][6].."/gf_DoNothing");
            tinsert( tbDialog, VIE_201005_REBORN_STR_NpcDialog[1][13].."/soul_choose_list(2)");
        else                                                                   --�ڶ�ҳ
            for i = 5, getn(tbEffectSoul) do 
                local nIndex =  tbEffectSoul[i];
                tinsert( tbDialog, format(VIE_201005_REBORN_STR_NpcDialog[1][12], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1]).."/#effect_soul_wakeup("..nIndex..")" );
            end
            tinsert( tbDialog, VIE_201005_REBORN_STR_NpcDialog[1][6].."/gf_DoNothing");
            tinsert( tbDialog, VIE_201005_REBORN_STR_NpcDialog[1][14].."/soul_choose_list(1)");
        end
    else                                                                        --С��5��
        for i = 1, getn(tbEffectSoul) do
            local nIndex =  tbEffectSoul[i];
            tinsert( tbDialog, format(VIE_201005_REBORN_STR_NpcDialog[1][12], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1]).."/#effect_soul_wakeup("..nIndex..")" );
        end
        tinsert( tbDialog, VIE_201005_REBORN_STR_NpcDialog[1][6].."/gf_DoNothing");
    end
    if getn(tbEffectSoul) == 0 then                                             --û�����ʸ�����ʾ
        szDialogHead = szDialogHead..VIE_201005_REBORN_STR_NpcDialog[1][16];
        Talk( 1, "", VIE_201005_REBORN_STR_NpcName..szDialogHead );
        return 0;
    else
        szDialogHead = szDialogHead..VIE_201005_REBORN_STR_NpcDialog[1][15];
    end
    Say(szDialogHead, getn(tbDialog), tbDialog);
    return 1;
end

--//�������ǲ���������
function effect_soul_wakeup(nIndex)
    local tbSays = {
        VIE_201005_REBORN_STR_NpcDialog[1][17].."/#effect_add_determine("..nIndex..")",
        VIE_201005_REBORN_STR_NpcDialog[1][18].."/gf_DoNothing"
    };
    Say( VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][19], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1], cost_string_build(nIndex), VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][5]), getn(tbSays), tbSays);
    return 1;
end

function effect_add_determine(nIndex)
    if is_weapon_changed_chk() ~= 1 then                                        --�����л����
        return 0;
    end
    if material_check_or_delete(1, nIndex) ~= 1 then                            --��ƷЯ�����
        return 0;
    end
    if material_check_or_delete(2, nIndex) ~= 1 then                            --��Ʒɾ�����
        return 0;
    end
    --��Ч����
    if BindWeaponEffect( VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1], (VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][5]*86400) ) == 1 then                                                    --86400 = 24*60*60
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][20], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1]) );
        AddGlobalNews( format(VIE_201005_REBORN_STR_NpcDialog[1][21], GetName(), VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][1]) );
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][1], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][4]), 1, "", 1, "", VIE_201005_REBORN_STR_LogAction[0][1]);
    else
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][1], VIE_201005_REBORN_TB_WeaponEffectInfo[nIndex][4]), 1, "", 0, "", VIE_201005_REBORN_STR_LogAction[0][2]);
        return 0;
    end
    --�������� 1-������������ 2-ȫ����
    if AddWeaponEffectAttribute(1, VIE_201005_REBORN_TB_SoulPowerInfo[nIndex][1]) == 1 then --����������
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][2], VIE_201005_REBORN_TB_SoulPowerInfo[nIndex][1], 1), 1, "", 1, "", VIE_201005_REBORN_STR_LogAction[0][1]);
    else
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][2], VIE_201005_REBORN_TB_SoulPowerInfo[nIndex][1], 1), 1, "", 0, "", VIE_201005_REBORN_STR_LogAction[0][2]);
    end
    if AddWeaponEffectAttribute(7, VIE_201005_REBORN_TB_SoulPowerInfo[nIndex][2]) == 1 then --����������
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][2], VIE_201005_REBORN_TB_SoulPowerInfo[nIndex][2], 2), 1, "", 1, "", VIE_201005_REBORN_STR_LogAction[0][1]);
        return 1;
    else
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][2], VIE_201005_REBORN_TB_SoulPowerInfo[nIndex][2], 2), 1, "", 0, "", VIE_201005_REBORN_STR_LogAction[0][2]);
        return 0;
    end
    return 1;
end

--[ɾ����Ч]--
function del_weapon_effect()
    local szSoulName = GetBindedWeaponEffectName();
    if szSoulName == nil or szSoulName == "" then                       --�Ƿ��������ж�
        Talk( 1, "main", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][22] );
        return 0;
    end
    if GetItemSpecialAttr( GetPlayerEquipIndex(2), "LOCK" ) == 1 then           --�����Ƿ�����
        Talk( 1, "main", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][23] );
        return 0;
    end
    local tbSays = {
        VIE_201005_REBORN_STR_NpcDialog[1][24].."/soul_delete",
        VIE_201005_REBORN_STR_NpcDialog[1][18].."/gf_DoNothing",
    };
    Say( VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][25], szSoulName), getn(tbSays), tbSays);
    return 1;
end

--//ɾ������
function soul_delete()
    if is_weapon_changed_chk() ~= 1 then                                        --�����Ƿ����
        return 0;
    end
    local szSoulName = GetBindedWeaponEffectName();                             --�Ƿ�������
    if szSoulName == nil or szSoulName == "" then
        Talk( 1, "main", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][22] );
        return 0;
    end
    if GetItemSpecialAttr( GetPlayerEquipIndex(2), "LOCK" ) == 1 then           --�����Ƿ�����
        Talk( 1, "main", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][23] );
        return 0;
    end
    --ɾ������
    --��ɾ����
    local nSoulNum, tbSoul = GetWeaponEffectAttributes();
    for i = 1, nSoulNum do                                                  --�����������ж�������
        RemoveWeaponEffectAttribute(tbSoul[i].id);
        gf_WriteLogEx( VIE_201005_REBORN_STR_LogTitle[1][1], format(VIE_201005_REBORN_STR_LogAction[1][3], tbSoul[i].id), 1, "", 1, "", VIE_201005_REBORN_STR_LogAction[0][1]);
    end
    --��ɾ����
    UnbindWeaponEffect();    
end

-----------------------------------------[�������ļ�ʹ�õĺ���]-----------------------------------------
--//�����Ƿ�������
--����1��ʾû�л���;����0���ʾ����
function is_weapon_changed_chk()
    local nWeaponIndex = GetPlayerEquipIndex(2);
    local nWeaponIndexSaved = GetTaskTemp(VIE_201005_REBORN_TASKTEMP_WeaponIndexSaved);
    if nWeaponIndex == 0 then                                                   --û��װ������
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[1][8]);
        return 0;
    end
    if nWeaponIndexSaved ~= nWeaponIndex then                                   --������Լ��
        Talk( 1, "", VIE_201005_REBORN_STR_NpcName..gf_GetPlayerSexName()..VIE_201005_REBORN_STR_NpcDialog[1][26] );
        return 0;
    end
    return 1;
end

--//�������ĶԻ��ַ�������
--nSouleType �����������1��13
function cost_string_build(nSouleType)
    if nSouleType > 13 or nSouleType < 1 then
        return nil;
    end 
    local szString = nil;
    if VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][1] ~= 0 then
        szString = format( VIE_201005_REBORN_STR_NpcDialog[1][27], VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][1] );
    end
    if VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][2] ~= 0 then
        local nMaterialType = VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][3];
        szString = szString..format(VIE_201005_REBORN_STR_NpcDialog[1][28], VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][2], VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][4]);
    end
    return szString;
end

--//���Я������ɾ��Я��
--nFlag:1ΪЯ�����,2ΪЯ��ɾ��
--nSouleType:��������,����VIE_201005_REBORN_TB_SoulEffectCostInfoĳ��
function material_check_or_delete(nFlag, nSouleType)
    local nCheckFlag = 1;
    if VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][1] ~= 0 then         --��Ǯ���
        if nFlag == 1 then
            if GetCash() < (VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][1] * 10000) then
                 nCheckFlag = 0;
            end
        else
            if Pay(VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][1] * 10000) ~= 1 then
                nCheckFlag = 0;
            end
        end
		if nCheckFlag == 0 then
            Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][29], VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][1]));
            return 0;
        end
    end
    if VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][2] ~= 0 then         --���ϼ��
        local nMaterialType = VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][3];
        if nFlag == 1 then
            if GetItemCount(VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][1], VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][2], VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][3]) <  VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][2] then
                nCheckFlag = 0;
            end
        else
            if DelItem(VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][1], VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][2], VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][3], VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][2]) ~= 1 then
                nCheckFlag = 0;
            end
        end
        if nCheckFlag == 0 then
            Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[1][30], VIE_201005_REBORN_TB_MaterialInfo[nMaterialType][4], VIE_201005_REBORN_TB_SoulEffectCostInfo[nSouleType][2]));
            return 0;
        end
    end
    return 1;
end

--//guide book
function weapon_effect_guide()
    local tbSays = {
        VIE_201005_REBORN_STR_NpcDialog[2][1].."/say_1",               --"��λ�������"
		VIE_201005_REBORN_STR_NpcDialog[2][2].."/#say_2(1)",           --"���ǵĵȼ�����ɫ"
        VIE_201005_REBORN_STR_NpcDialog[2][3].."/#say_3(1)",           --"���ǵĻ�������"
        VIE_201005_REBORN_STR_NpcDialog[2][4].."/say_4",               --"��λ�������"
        VIE_201005_REBORN_STR_NpcDialog[2][5].."/#say_5(1)",           --"���ܵ�����"
        VIE_201005_REBORN_STR_NpcDialog[2][6].."/main",                --"�Ҷ��˽������"
    };
    Say( VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[2][7], getn(tbSays), tbSays );
end

--��λ�������
function say_1()
    Talk( 1, "weapon_effect_guide", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[2][8] );
end

--"���ǵĵȼ�����ɫ"
function say_2(nPage)
--nPage:ҳ��
    local szString = VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[2][9];
    local nMin = (nPage - 1) * 5 + 1 ;                                          --ÿһҳ��ʼ�����к�
    local nMax = min( (nMin + 4), getn(VIE_201005_REBORN_TB_WeaponEffectInfo) );
    for i = nMin, nMax do
        szString = szString..format( VIE_201005_REBORN_STR_NpcDialog[2][10], VIE_201005_REBORN_TB_WeaponEffectInfo[i][2],  VIE_201005_REBORN_TB_WeaponEffectInfo[i][5] );
    end
    if nMax == getn( VIE_201005_REBORN_TB_WeaponEffectInfo ) then
        Talk( 1, "weapon_effect_guide", szString );
    else
        Talk( 1, "#say_2("..(nPage + 1)..")", szString);
    end
end

--"���ǵĻ�������"
function say_3(nPage)
--nPage:ҳ��
    local szString = VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[2][11];
    local nMin = (nPage - 1) * 4 + 1 ;                                          --ÿһҳ��ʼ�����к�
    local nMax = min( (nMin + 3), getn(VIE_201005_REBORN_TB_WeaponEffectInfo) );
    for i = nMin, nMax do
        szString =szString..format( VIE_201005_REBORN_STR_NpcDialog[2][12], VIE_201005_REBORN_TB_WeaponEffectInfo[i][1], VIE_201005_REBORN_TB_WeaponEffectInfo[i][3], cost_string_build(i) );
    end
    if nMax == getn( VIE_201005_REBORN_TB_WeaponEffectInfo ) then
        Talk( 1, "weapon_effect_guide", szString );
    else
        Talk( 1, "#say_3("..(nPage + 1)..")", szString);
    end
end

--"��λ�������"
function say_4()
    Talk( 1, "weapon_effect_guide", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[2][13]);
end

--"���ܵ�����"
function say_5(nPage)
--nPage:ҳ��
    local szString = VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[2][14];
    local nMin = (nPage - 1) * 5 + 1 ;                                          --ÿһҳ��ʼ�����к�
    local nMax = min( (nMin + 4), getn(VIE_201005_REBORN_TB_WeaponEffectInfo) );
    for i = nMin, nMax do
        szString =szString..format( VIE_201005_REBORN_STR_NpcDialog[2][15], VIE_201005_REBORN_TB_WeaponEffectInfo[i][1], VIE_201005_REBORN_TB_SoulPowerInfo[i][1]*500, VIE_201005_REBORN_TB_SoulPowerInfo[i][2]*3 );
    end
    if nMax == getn( VIE_201005_REBORN_TB_WeaponEffectInfo ) then
        Talk( 1, "weapon_effect_guide", szString );
    else
        Talk( 1, "#say_5("..(nPage + 1)..")", szString);
    end
end