----------------[��˵����Ӧ����һ������]-----------------
---------------------------------------------------------
--�ű�����:��װ���鴦��ű�                             |
--�ű�����:����������װ����ع���                       |
--���ܿ���:�����                                       |
--����ʱ��:2010-1-5                                     |
--���˼·:������װ����ɾ������װ��AddItem����װ��ʵ�ֵ�|
--��Ҫ�޸ļ�¼:                                         |
---------------------------------------------------------

Include("\\script\\online_activites\\reborn\\effect\\head.lua")

function cloth_effect()
    local szSay = VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[3][1];
    local tbSays = {
        --VIE_201005_REBORN_STR_NpcDialog[3][2].."/choose_cloth_effect_attr",
        --VIE_201005_REBORN_STR_NpcDialog[3][3].."/del_cloth_effect",
        --VIE_201005_REBORN_STR_NpcDialog[3][4].."/cloth_effect_guide",
        --VIE_201005_REBORN_STR_NpcDialog[3][26].."/gf_DoNothing",
    };
    Say(szSay, getn(tbSays), tbSays);
end

--//ѡ����װ�������Ե�����
function choose_cloth_effect_attr()
    local szSay = VIE_201005_REBORN_STR_NpcName;
    local tbSays = {
    --    VIE_201005_REBORN_STR_NpcDialog[3][32].."/#add_cloth_effect(1)";
        VIE_201005_REBORN_STR_NpcDialog[3][32].."/add_cloth_effect_normal";
    };
    if GetPlayerRebornParam(0) > 0 then                                         --�Ѿ�ת��
        if GetPlayerRebornParam(1) <= 0 then                          --δ�����Ż�
            szSay = szSay..VIE_201005_REBORN_STR_NpcDialog[3][30];
        else                                                          --�Ѽ����Ż�
            szSay = szSay..format(VIE_201005_REBORN_STR_NpcDialog[3][31], VIE_201005_REBORN_TB_RebornSchool_STR[GetPlayerRebornParam(1)]);
            tinsert(tbSays, VIE_201005_REBORN_STR_NpcDialog[3][33].."/#add_cloth_effect(2)");
        end
    else                                                                        --δת��
        szSay = szSay..VIE_201005_REBORN_STR_NpcDialog[3][29];
    end
    tinsert(tbSays, VIE_201005_REBORN_STR_NpcDialog[3][27].."/gf_DoNothing");
    Say(szSay, getn(tbSays), tbSays);
end

--[��װ����]--
function add_cloth_effect(nEffectType)
    local tbSays = {
        VIE_201005_REBORN_STR_NpcDialog[3][6].."/#cloth_effect_lv_list( 6"..","..nEffectType..")",
        VIE_201005_REBORN_STR_NpcDialog[3][7].."/#cloth_effect_lv_list( 7"..","..nEffectType..")",
        VIE_201005_REBORN_STR_NpcDialog[3][8].."/#cloth_effect_lv_list( 8"..","..nEffectType..")",
        VIE_201005_REBORN_STR_NpcDialog[3][27].."/gf_DoNothing",
    };
    Say(VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[3][5], getn(tbSays), tbSays);
end

--������װ�������Եȼ�ѡ��--
--Ϊ�˷��㣬��ͨ���Ժ��Ż����Ժ���һ��������                                
--[ģ��Ի���]--------------------------------------------------------------------------------------------------
--��Ҫ������װ���ڡ����鼸�������أ�(���Ѿ��������ӻᣬ��װ���ڽ����Ź����˺��ӳɡ��������Ե����ӵ�Ч��)       |
--  ��װ1������(�����˺��ӳ�5%���������Ե�����3)                                                               |
--  ��װ2������(�����˺��ӳ�6%���������Ե�����6)                                							   |
--  ��װ3������(�����˺��ӳ�7%���������Ե�����9)															   |
--  ��װ4������(�����˺��ӳ�8%���������Ե�����12)                                                               |                         																		                           																																		 |
--  ���ٿ��ǿ���                                                                                               |                        																	
----------------------------------------------------------------------------------------------------------------
function cloth_effect_lv_list(nEquipPos, nEffectType)
    local nEquipIndex = GetPlayerEquipIndex(nEquipPos); 
    if cloth_effect_suit_chk(nEquipPos) ~= 1 then                               --����װ���ܷ�����
        return 0;
    end
    --Say����
    local szSay = format(VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[3][13], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos]);
    local tbEffectAttr = VIE_201005_REBORN_TB_ClothEffectAttr_Normal_Test[nEquipPos];
    if GetPlayerRebornParam(0) > 0 and GetPlayerRebornParam(1) > 0 and nEffectType == 2 then          --�Ѿ�ת�������Ż���ѡ�����Ż�����
        tbEffectAttr = VIE_201005_REBORN_TB_ClothEffectAttr_Special[GetPlayerRebornParam(1)][nEquipPos];
    end
    local cloth_effect_str = "<color=yellow>";
    for i = 1, getn(tbEffectAttr) do
        cloth_effect_str = cloth_effect_str..tbEffectAttr[i].attr_name..","
    end
    cloth_effect_str = cloth_effect_str.."<color>";
    if GetPlayerRebornParam(0) > 0 and GetPlayerRebornParam(1) > 0 then          --�Ѿ�ת�������Ż���ѡ�����Ż�����
        szSay = szSay..format(VIE_201005_REBORN_STR_NpcDialog[3][15], VIE_201005_REBORN_TB_RebornSchool_STR[GetPlayerRebornParam(1)], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos], cloth_effect_str);
    else
        szSay = szSay..format(VIE_201005_REBORN_STR_NpcDialog[3][14], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos], cloth_effect_str);
    end
    --tbSays����
    local tbSays = {};
    for i = 1, 4 do
        local cloth_effect_str = "";
        for j = 1, getn(tbEffectAttr) do
            cloth_effect_str = cloth_effect_str..tbEffectAttr[j].attr_name;
            cloth_effect_str = cloth_effect_str..tbEffectAttr[j].attr_point[i].." ";
        end
        tinsert(tbSays, format(VIE_201005_REBORN_STR_NpcDialog[3][18].."/#cloth_effect_add_determine(%d, %d, %d)", i, cloth_effect_str, nEquipPos, i, nEffectType));
    end
    tinsert(tbSays, VIE_201005_REBORN_STR_NpcDialog[3][27].."/gf_DoNothing");
    Say(szSay, getn(tbSays), tbSays);
end

-------------------------------------------------[ģ��Ի���]-------------------------------------------------
--��ȷ��Ҫ��������װ��������<color=yellow>2��<color>�������𣿶�Ӧ������Ϊ��100�� 5����ҫ���x 8���߼�������  |
--��ȷ��Ҫ���飬���憪��                                                                                     |
--���ٿ��ǿ���                                                                                               |
--------------------------------------------------------------------------------------------------------------
function cloth_effect_add_determine(nEquipPos, nLv, nEffectType)
    --�����ַ�������
    local szSay = VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][21], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos],nLv, cloth_effect_cost_string_build(nLv));
    --�Ի�չ��
    local tbSays = {
        [1] = VIE_201005_REBORN_STR_NpcDialog[3][28].."/#cloth_effect_add_final("..nEquipPos..","..nLv..","..nEffectType..")",
        [2] = VIE_201005_REBORN_STR_NpcDialog[3][27].."/gf_DoNothing",
    };
    Say(szSay, getn(tbSays), tbSays);
end

--[���մ���]
function cloth_effect_add_final(nEquipPos, nLevel, nEffectType)
    --Ҫ��һ������
    if gf_Judge_Room_Weight(2, 10, "") == 0 then
        return 0;
    end
    --װ���ж�
    if cloth_effect_suit_chk(nEquipPos) ~= 1 then
        return 0;
    end
    --����Я���ж�
    if cloth_effect_mertiral_chk(nLevel, 1) ~= 1 then
        return 0;
    end
    --��ö�Ӧλ�õ�װ������
    local nEquipIndex = GetPlayerEquipIndex(nEquipPos);
    --ɾ����װ
    local nGenreId, nGetailId, nParticularId = GetItemGenre(nEquipIndex), GetItemDetail(nEquipIndex), GetItemParticular(nEquipIndex);
    if DelItemByIndex(nEquipIndex, -1) ~= 1 then
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][22], GetItemName(nEquipIndex)));
        return 0;
    end
    --����ɾ���ж�
    if cloth_effect_mertiral_chk(nLevel, 2) ~= 1 then
        return 0;
    end
    --����װ����
    local tbAtrr = VIE_201005_REBORN_TB_ClothEffectAttr_Normal_Test[nEquipPos];
    if GetPlayerRebornParam(0) > 0 and GetPlayerRebornParam(1) > 0 and nEffectType == 2 then          --�Ѿ�ת��,�Ҽ����Ż�
        tbAtrr = VIE_201005_REBORN_TB_ClothEffectAttr_Special[GetPlayerRebornParam(1)][nEquipPos];
    end
    local nAddFlag = 0;
    if getn(tbAtrr) == 2 then
        nAddFlag, nItemIndex = AddItem(nGenreId, nGetailId, nParticularId, 1, 1, tbAtrr[1].attr_id_level[nLevel], tbAtrr[1].attr_id[nLevel], tbAtrr[2].attr_id_level[nLevel], tbAtrr[2].attr_id[nLevel]);
        SetItemExpireTime(nItemIndex, 30*24*3600);
    end
    if getn(tbAtrr) == 3 then
        nAddFlag = AddItem(nGenreId, nGetailId, nParticularId, 1, 1, tbAtrr[1].attr_id_level[nLevel], tbAtrr[1].attr_id[nLevel], tbAtrr[2].attr_id_level[nLevel], tbAtrr[2].attr_id[nLevel], tbAtrr[3].attr_id_level[nLevel], tbAtrr[3].attr_id[nLevel]);
        SetItemExpireTime(nItemIndex, 30*24*3600);
    end
    if nAddFlag == 1 then
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][23], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos]));
        gf_WriteLogEx(VIE_201005_REBORN_STR_LogTitle[2][1], format(VIE_201005_REBORN_STR_LogAction[2][1], nLevel), 1, "", 1, "", VIE_201005_REBORN_STR_LogAction[0][1]);
        if nLevel >= 3 and nEffectType == 2 then
            AddGlobalNews(format(VIE_201005_REBORN_STR_NpcDialog[3][24], GetName(), VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos], nLevel, VIE_201005_REBORN_STR_NpcDialog[3][33]));
        end
    else
    gf_WriteLogEx(VIE_201005_REBORN_STR_LogTitle[2][1], format(VIE_201005_REBORN_STR_LogAction[2][1], nLevel), 1, "", 0, "", VIE_201005_REBORN_STR_LogAction[0][2]);
    end
end
 
function del_cloth_effect()
    local szSay = VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[3][36];
    local tbSays = {
        VIE_201005_REBORN_STR_NpcDialog[3][6].."/#del_cloth_effect_determine(6)",
        VIE_201005_REBORN_STR_NpcDialog[3][7].."/#del_cloth_effect_determine(7)",
        VIE_201005_REBORN_STR_NpcDialog[3][8].."/#del_cloth_effect_determine(8)",
        VIE_201005_REBORN_STR_NpcDialog[3][27].."/gf_DoNothing",
    };
    Say(szSay, getn(tbSays), tbSays);
end

function del_cloth_effect_determine(nEquipPos)
    if cloth_effect_suit_chk(nEquipPos) == 0 then
        return 0;
    end
    local szSay = VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][25], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos]);
    local tbSays = {
        [1] = VIE_201005_REBORN_STR_NpcDialog[3][28].."/#del_cloth_effect_final("..nEquipPos..")",
        [2] = VIE_201005_REBORN_STR_NpcDialog[3][27].."/gf_DoNothing",
    }
    Say(szSay, getn(tbSays), tbSays);
end

function del_cloth_effect_final(nEquipPos)
	if GetItemCount(2,1,30230) < 1500 then  -- modify by Trungbt
		Talk(1, "", "��i hi�p kh�ng mang �� Xu v�t ph�m")
		return 0
	end
    --�����������װֱ�ӷ��أ���Ϊ�϶�������������
    if cloth_effect_suit_chk(nEquipPos) == 0 then
        return 0;
    end
    --��װ�Ƿ������飬û���������װ��������
    local nEquipIndex = GetPlayerEquipIndex(nEquipPos);
    local nAttrId, nAttrLv = GetItemAttr(nEquipIndex, 1);
    if nAttrLv == 0 then
        return 0;
    end
    --Ҫ��һ������
    if gf_Judge_Room_Weight(2, 10, "") == 0 then
        return 0;
    end
    --ɾ����װ
    local nEquipIndex = GetPlayerEquipIndex(nEquipPos);
    local nGenreId, nGetailId, nParticularId = GetItemGenre(nEquipIndex), GetItemDetail(nEquipIndex), GetItemParticular(nEquipIndex);
    if DelItemByIndex(nEquipIndex, -1) ~= 1 then
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][22], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos]));
        return 0;
    end
    DelItem(2,1,30230, 1500) 	--modify by Trungbt
    --add��װ
    AddItem(nGenreId, nGetailId, nParticularId, 1, 1);
    gf_WriteLogEx("MUA NGOAI TRANG VV", "mua th�nh c�ng", 1, "Ngo�i trang vv")
end

--[��ͨ��װ�������⴦��]--
--˵���������ͨ��װ���Ա������Ż���װ���Ա�������������̣���������������̴���
function add_cloth_effect_normal()
    local tbSays = {
        VIE_201005_REBORN_STR_NpcDialog[3][6].."/#cloth_effect_normal_attr_list(6)",
        VIE_201005_REBORN_STR_NpcDialog[3][7].."/#cloth_effect_normal_attr_list(7)",
        VIE_201005_REBORN_STR_NpcDialog[3][8].."/#cloth_effect_normal_attr_list(8)",
        VIE_201005_REBORN_STR_NpcDialog[3][27].."/gf_DoNothing",
    };
    Say(VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[3][5], getn(tbSays), tbSays);
end

function cloth_effect_normal_attr_list(nEquipPos)
    local szSay = VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][37], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos]);
    local tbSays = {
        VIE_201005_REBORN_TB_ClothEffectAttr_STR[14].."/#cloth_effect_normal_attr_lv_list("..nEquipPos..", 1)",
        VIE_201005_REBORN_TB_ClothEffectAttr_STR[15].."/#cloth_effect_normal_attr_lv_list("..nEquipPos..", 2)",
        VIE_201005_REBORN_TB_ClothEffectAttr_STR[16].."/#cloth_effect_normal_attr_lv_list("..nEquipPos..", 3)",
        VIE_201005_REBORN_TB_ClothEffectAttr_STR[17].."/#cloth_effect_normal_attr_lv_list("..nEquipPos..", 4)",
        VIE_201005_REBORN_TB_ClothEffectAttr_STR[18].."/#cloth_effect_normal_attr_lv_list("..nEquipPos..", 5)",
        VIE_201005_REBORN_STR_NpcDialog[3][27].."/gf_DoNothing",
    };
    Say(szSay, getn(tbSays), tbSays);
end

function cloth_effect_normal_attr_lv_list(nEquipPos, nAttrType)
    local szSay = VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][38], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos], VIE_201005_REBORN_TB_ClothEffectAttr_Normal[nAttrType].attr_name);
    --tbSays����
    local tbEffectAttr = VIE_201005_REBORN_TB_ClothEffectAttr_Normal[nAttrType];
    local tbSays = {};
    for i = 1, 3 do
        local cloth_effect_str = "";
        cloth_effect_str = cloth_effect_str..tbEffectAttr.attr_name;
        cloth_effect_str = cloth_effect_str..tbEffectAttr.attr_point[i];
        tinsert(tbSays, format(VIE_201005_REBORN_STR_NpcDialog[3][18].."/#cloth_effect_normal_add_determine(%d, %d, %d)", i, cloth_effect_str, nEquipPos, i, nAttrType));
    end
    Say(szSay, getn(tbSays), tbSays);
end

-------------------------------------------------[ģ��Ի���]-------------------------------------------------
--��ȷ��Ҫ��������װ��������<color=yellow>2��<color>�������𣿶�Ӧ������Ϊ��100�� 5����ҫ���x 8���߼�������  |
--��ȷ��Ҫ���飬���憪��                                                                                     |
--���ٿ��ǿ���                                                                                               |
--------------------------------------------------------------------------------------------------------------
function cloth_effect_normal_add_determine(nEquipPos, nLv, nAttrType)
    --�����ַ�������
    local szSay = VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][21], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos], nLv, cloth_effect_cost_string_build(nLv));
    --�Ի�չ��
    local tbSays = {
        [1] = VIE_201005_REBORN_STR_NpcDialog[3][28].."/#cloth_effect_normal_add_final("..nEquipPos..","..nLv..","..nAttrType..")",
        [2] = VIE_201005_REBORN_STR_NpcDialog[3][27].."/gf_DoNothing",
    };
    Say(szSay, getn(tbSays), tbSays);
end

--[���մ���]
function cloth_effect_normal_add_final(nEquipPos, nLevel, nAttrType)
    --Ҫ��һ������
    if gf_Judge_Room_Weight(2, 10, "") == 0 then
        return 0;
    end
    --װ���ж�
    if cloth_effect_suit_chk(nEquipPos) ~= 1 then
        return 0;
    end
    --����Я���ж�
    if cloth_effect_mertiral_chk(nLevel, 1) ~= 1 then
        return 0;
    end
    --��ö�Ӧλ�õ�װ������
    local nEquipIndex = GetPlayerEquipIndex(nEquipPos);
    --ɾ����װ
    local nGenreId, nGetailId, nParticularId = GetItemGenre(nEquipIndex), GetItemDetail(nEquipIndex), GetItemParticular(nEquipIndex);
    if DelItemByIndex(nEquipIndex, -1) ~= 1 then
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][22], GetItemName(nEquipIndex)));
        return 0;
    end
    --����ɾ���ж�
    if cloth_effect_mertiral_chk(nLevel, 2) ~= 1 then
        return 0;
    end
    --����װ����
    local tbAtrr = VIE_201005_REBORN_TB_ClothEffectAttr_Normal[nAttrType];
    local nAddFlag = 0;
    nAddFlag, nItemIndex = AddItem(nGenreId, nGetailId, nParticularId, 1, 1, tbAtrr.attr_id_level[nLevel], tbAtrr.attr_id[nLevel]);
    SetItemExpireTime(nItemIndex, 30*24*3600);
    if nAddFlag == 1 then
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][23], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos]));
        gf_WriteLogEx(VIE_201005_REBORN_STR_LogTitle[2][1], format(VIE_201005_REBORN_STR_LogAction[2][1], nLevel), 1, "", 1, "", VIE_201005_REBORN_STR_LogAction[0][1]);
    else
    gf_WriteLogEx(VIE_201005_REBORN_STR_LogTitle[2][1], format(VIE_201005_REBORN_STR_LogAction[2][1], nLevel), 1, "", 0, "", VIE_201005_REBORN_STR_LogAction[0][2]);
    end
end

--================================================================================================================================--
--�ڲ�����
--//����װ�����
--�����װ�Ƿ������������
function cloth_effect_suit_chk(nEquipPos)
    local nEquipIndex = GetPlayerEquipIndex(nEquipPos);
    if nEquipIndex == 0 then                                                    --�ж��Ƿ���װ��
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][9], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos]));
        return 0;
    end	
    if GetItemSpecialAttr(nEquipIndex, "LOCK") == 1 then                        --�Ƿ������ж�
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][10], VIE_201005_REBORN_STR_NpcDialog[3][nEquipPos]));
        return 0;
    end
    if AbradeItem(nEquipIndex, 0) == 0 then --�ж�װ���;�
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[3][11]);
        return 0;
    end
    --�ܷ������ж�
    local nGenreId, nDetailId, nParticularId = GetItemGenre(nEquipIndex), GetItemDetail(nEquipIndex), GetItemParticular(nEquipIndex);
    local bChkFlag = 0;
    for i = 1, getn(VIE_201005_REBORN_TB_SuitCanAddEffect) do
        if nGenreId == VIE_201005_REBORN_TB_SuitCanAddEffect[i][1] and nDetailId == VIE_201005_REBORN_TB_SuitCanAddEffect[i][2] and nParticularId == VIE_201005_REBORN_TB_SuitCanAddEffect[i][3] then
            bChkFlag = 1;
            break;
        end
    end
    if bChkFlag == 0 then
        Talk(1, "", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[3][12]);
        return 0;
    end
    return 1;
end

--//���ϴ�����
--nLevel: ����ĵȼ�
--bFlag: ѡ���⻹��ɾ��
function cloth_effect_mertiral_chk(nLevel, bFlag)
    local nCheckFlag = 1;
    --��Ǯ���
    if VIE_201005_REBORN_TB_ClothEffectCostInfo[nLevel][1] ~= 0 then
        if bFlag == 1 then
            if GetCash() < (VIE_201005_REBORN_TB_ClothEffectCostInfo[nLevel][1] * 10000) then
                 nCheckFlag = 0;
            end
        else
            if Pay(VIE_201005_REBORN_TB_ClothEffectCostInfo[nLevel][1] * 10000) ~= 1 then
                nCheckFlag = 0;
            end
        end
		if nCheckFlag == 0 then
            Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][19], VIE_201005_REBORN_TB_ClothEffectCostInfo[nLevel][1]));
            return 0;
        end
    end
    --���ϼ��
    local tbMaterial = VIE_201005_REBORN_TB_ClothEffectCostInfo[nLevel][2];
    if getn(tbMaterial) ~= 0 then
        if bFlag == 1 then
            for i = 1, getn(tbMaterial) do
                local nMaterial = tbMaterial[i][1];
                if GetItemCount(VIE_201005_REBORN_TB_MaterialInfo[nMaterial][1], VIE_201005_REBORN_TB_MaterialInfo[nMaterial][2], VIE_201005_REBORN_TB_MaterialInfo[nMaterial][3]) <  tbMaterial[i][2] then
                    Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][34], VIE_201005_REBORN_TB_MaterialInfo[nMaterial][4], tbMaterial[i][2]));
                    nCheckFlag = 0;
                    return 0;
                end
            end
            return 1;
        else
            for i = 1, getn(tbMaterial) do
                local nMaterial = tbMaterial[i][1];
                if DelItem(VIE_201005_REBORN_TB_MaterialInfo[nMaterial][1], VIE_201005_REBORN_TB_MaterialInfo[nMaterial][2], VIE_201005_REBORN_TB_MaterialInfo[nMaterial][3], tbMaterial[i][2]) ~= 1 then
                    Talk(1, "", VIE_201005_REBORN_STR_NpcName..format(VIE_201005_REBORN_STR_NpcDialog[3][34], VIE_201005_REBORN_TB_MaterialInfo[nMaterial][4], tbMaterial[i][2]));
                    nCheckFlag = 0;
                    return 0;
                end
            end
            return 1;
        end
    end
    return 1;
end

--//���ĶԻ��ַ�������
function cloth_effect_cost_string_build(nLevel)
    --��������	
    local szCostString = format(VIE_201005_REBORN_STR_NpcDialog[3][20], VIE_201005_REBORN_TB_ClothEffectCostInfo[nLevel][1] );
    local tbMaterial = VIE_201005_REBORN_TB_ClothEffectCostInfo[nLevel][2];
    for i = 1, getn(tbMaterial) do
        local nMaterial = tbMaterial[i][1];
        szCostString = szCostString..format(VIE_201005_REBORN_STR_NpcDialog[3][35], tbMaterial[i][2], VIE_201005_REBORN_TB_MaterialInfo[nMaterial][4]);
        if i ~= getn(tbMaterial) then
	        szCostString = szCostString..",";
		end	
	end
    return szCostString;
end

--//guide����
function cloth_effect_guide()
    local tbSays = {
        [1] = VIE_201005_REBORN_STR_NpcDialog[4][1].."/cloth_effect_type_info",
        [2] = VIE_201005_REBORN_STR_NpcDialog[4][2].."/cloth_effect_mertiral_info",
        [3] = VIE_201005_REBORN_STR_NpcDialog[4][4].."/cloth_effect_require_info",
        [4] = VIE_201005_REBORN_STR_NpcDialog[4][11].."/cloth_effect"
    };
    Say(VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[4][3], getn(tbSays), tbSays);
end

--[���Ҫ����Ϣ]
function cloth_effect_require_info()
    Talk(1, "cloth_effect_guide", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[4][5]);
end

--[��������˵��]
function cloth_effect_type_info()
    Talk(1, "cloth_effect_guide", VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[4][9]);
end

--[���������ʾ]
function cloth_effect_mertiral_info()
    local szDialogString = VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[4][6];
    for i = 1, 4 do
        szDialogString = szDialogString..format(VIE_201005_REBORN_STR_NpcDialog[4][7], i);
        if VIE_201005_REBORN_TB_ClothEffectCostInfo[i][1] ~= 0 then           --��Ǯ����
            szDialogString = szDialogString..format(VIE_201005_REBORN_STR_NpcDialog[4][8], VIE_201005_REBORN_TB_ClothEffectCostInfo[i][1]);
        end
        local tbMaterial = VIE_201005_REBORN_TB_ClothEffectCostInfo[i][2];
        for j = 1, getn(tbMaterial) do  
            szDialogString = szDialogString..format(VIE_201005_REBORN_STR_NpcDialog[4][10], tbMaterial[j][2], VIE_201005_REBORN_TB_MaterialInfo[tbMaterial[j][1]][4]);
            szDialogString = szDialogString.." "
        end
        szDialogString = szDialogString.."\n";
    end
    Talk(1, "cloth_effect_guide", szDialogString);
end