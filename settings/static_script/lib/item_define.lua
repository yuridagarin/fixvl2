------------------------------------------------------------------------
--enum ITEMGENRE
	item_equip				= 0;	-- װ��
	item_use				= 1;	-- ����Ʒ
	item_other				= 2;	-- ��������
	item_number				= 3;	-- ������Ŀ
--enum ITEMGENRE
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum enumEQUIP_DETAIL
	enumWD_BEGIN			= 0;
	enumWD_CUFF				= 1;	--ȭ
	enumWD_RANGE			= 2;	--��
	enumWD_SWORD			= 3;	--��
	enumWD_BLADE			= 4;	--��
	enumWD_BOW				= 5;	--��
	enumWD_STAFF			= 6;	--��
	enumWD_LANCE			= 7;	--ǹ
	enumWD_DUAL_BLADE		= 8;	--˫��
	enumWD_CLUB				= 9;	--����
	enumWD_BRUSH			= 10;	--��
	enumWD_STRING			= 11;	--��
	enumWD_CLAW				= 12;	--צ
	enumWD_STAFF_FLUTE		= 13;	--���ӷ���
	enumWD_STAFF_PLANT		= 14;	--ֲ�﷨��
	enumWD_DUAL_DAGGER		= 15;	--˫ذ��
	enumWD_NUM				= 16;	--������������
	enumBD_CLOTH			= 100;	--��
	enumBD_FOOT				= 101;	--Ь
	enumBD_ADORN			= 102;	--��
	enumBD_HEAD				= 103;	--ñ
	enumBD_CLOAK			= 104;	--��
	enumBD_HORSE			= 105;	--��
	enumBD_PET				= 106;	--����
	enumBD_BOOK				= 107;	--�ؼ�
	enumBD_COAT_CAP			= 108;	--����ñ��
	enumBD_COAT_CLOTH		= 109;	--�����·�
	enumBD_COAT_TROUSERS	= 110;	--����Ь��
	enumBD_COAT_SET			= 111;	--������װ
	enumBD_GREAT_BOOK		= 112;	--�����ؼ�
	enumBD_ARMORY_CLOTH		= 113;	--����-��
	enumBD_ARMORY_FOOT		= 114;	--����-Ь
	enumBD_ARMORY_ADORN		= 115;	--����-��
	enumBD_ARMORY_HEAD		= 116;	--����-ñ
	enumBD_BADGE			= 117;	--����
	enumBD_DRESS_SMOCK		= 118;	--����
	enumBD_ORNAMENT_CAP		= 119;	--��Ʒ-ñ
	enumBD_ORNAMENT_CLOTH	= 120;	--��Ʒ-��
	enumBD_ORNAMENT_FOOT	= 121;	--��Ʒ-Ь
	enumBD_SERIES_APP		= 122;	--����������
	enumBD_MERIDIANS_APP	= 123;	--������
	enumBD_XIAKELING		= 124;  --������
	enumBD_END				= 125;	--�����
	enumBD_NUM				= enumBD_END - enumBD_CLOTH;
	enumTD_TOOLS			= 200;	--��������
	enumTD_END				= 201;	--�����
	enumTD_NUM				= enumTD_END - enumTD_TOOLS;
	enumED_INNER_STONE		= 210;	--�ڵ�
	enumED_NUM				= enumWD_NUM + enumBD_NUM;
--enum enumEQUIP_DETAIL
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum enumUSE_DETAIL
	enumUS_MEDICINE			= 0;	--��ҩ
	enumUS_FOOD				= 1;	--ʳ��
	enumUS_MEDICINE_RESOURCE= 2;	--��ҩ(�ɺϳɵ�ҩ��Ҳ���Գ�)
	enumUS_FOOD_RESOURCE	= 3;	--ʳ��(�ɺϳ�ʳ�Ҳ���Գ�)
	enumUS_TELEPORT			= 4;	--������
	enumUS_CORPSE			= 6;	--��ʬ��
	enumUS_NUM				= 7;
--enum enumUSE_DETAIL
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum enumOTHER_DETAIL
	enumOD_QUEST			= 0;	--������Ʒ
	enumOD_MYSTER			= 1;	--������Ʒ
	enumOD_COMPOUND			= 2;	--�ϳ���Ʒ
	enumOD_SKILL_COST		= 3;	--����������Ʒ
	enumOD_STONE			= 4;	--سʯ
	enumOD_SCROLL			= 5;	--����
	enumOD_ADDENDA			= 6;	--�书�ĵ�
	enumOD_ORIGIN_WOOD		= 7;	--ԭľ
	enumOD_ORIGIN_STONE		= 8;	--ԭʯ
	enumOD_ORIGIN_SILK		= 9;	--ԭʬ
	enumOD_ORIGIN_SKIN		= 10;	--ԲƤ
	enumOD_ANQI				= 11;	--����
	enumOD_BATTLE			= 12;	--ս��ר����Ʒ
	enumOD_SERIES_STONE		= 13;	--����ʯ
	enumOD_TREASURE_SHOW	= 14;	--�ر�ͼ
	enumOD_ARROW			= 15;	--��ʸ
	enumOD_GU_MATRIX		= 16;	--��ĸ
	enumOD_GU_INSECT		= 17;	--�Ƴ�
	enumOD_LING_STONE		= 18;	--��ʯ
	enumOD_LIFE_SCROLL		= 19;	--����ܾ��� - Jeep tag
	enumOD_SUNMMON			= 20;	--�ٻ�����/������
	enumOD_LING_SHI_PEIFANG	= 21;	--��ʯ�ϳ��䷽
	enumOD_GEM		= 22;	--VN��ʯ
	enumOD_NUM				= 203;
--enum enumOTHER_DETAIL
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum ITEM_PART
	itempart_head			= 0;	-- ͷ
	itempart_body			= 1;	-- ����
	itempart_weapon			= 2;	-- ����
	itempart_foot			= 3;	-- �Ų�
	itempart_ring			= 4;	-- װ����1
	itempart_ring2			= 5;	-- װ����2
	itempart_mask			= 6;	-- ���
	itempart_cloth			= 7;	-- ����
	itempart_outfoot		= 8;	-- �°��������
	itempart_great_book		= 9;	-- ���ؼ�
	itempart_horse			= 10;	-- ��
	itempart_book			= 11;	-- �ؼ�
	itempart_weapon_extend	= 12;	-- ������չ(����;��ʸ)
	itempart_innerstone1	= 13;	-- �ڵ�1
	itempart_innerstone2	= 14;	-- �ڵ�2
	itempart_innerstone3	= 15;	-- �ڵ�3
	itempart_innerstone4	= 16;	-- �ڵ�4
	itempart_armory_head	= 17;	-- ����-��
	itempart_armory_body	= 18;	-- ����-��
	itempart_armory_foot	= 19;	-- ����-װ
	itempart_armory_ring1	= 20;	-- ����-��ָ1
	itempart_armory_ring2	= 21;	-- ����-��ָ2
	itempart_badge			= 22;	-- ����
	itempart_dress_smock	= 23;	-- ����
	itempart_ornament_cap	= 24;	-- ��Ʒ-ñ
	itempart_ornament_cloth	= 25;	-- ��Ʒ-��
	itempart_ornament_foot	= 26;	-- ��Ʒ-Ь
	itempart_series_app		= 27;	-- ����������
	itempart_meridians_app	= 28;	-- ������
	itempart_xiakeling		= 29;	-- ������
--enum ITEM_PART
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum ITEM_POSITION
	pos_hand				= 0;	-- ����
	pos_equip				= 1;	-- װ���ŵ�
	pos_equiproom			= 2;	-- ������
	pos_repositoryroom		= 3;	-- ������
	pos_immediacy			= 4;	-- �����Ʒ
	pos_tradeself			= 5;	-- �Լ��Ľ�����
	pos_tradeother			= 6;	-- ���˵Ľ�����
	pos_stallself			= 7;	-- �Լ��İ�̯�ռ�
	pos_compose				= 8;	-- �ϳ��丽����Ʒ��
	pos_stallother			= 9;	-- ���˵İ�̯�ռ�
	pos_slaveitem			= 10;	-- ��һ�������Ʒ�е����
	pos_packageitem			= 11;	-- ��һ�������Ʒ��������Ʒ
	pos_bagua_compose		= 12;	-- ���Ժϳɵ������
	pos_bagua_depose		= 13;	-- ���Դ�ɢ��װ�������
	pos_bagua_part_item		= 14;	-- ���Ժϳ��������Ʒ����
	pos_bagua_item			= 15;	-- ���ɵİ�����װ����
	pos_smelt_circle		= 16;	-- �ڵ���������
	pos_offline_trade		= 17;	-- ���½���
	pos_skill_app			= 18;	-- ����ʯ
	pos_temp_immediacy		= 19;	-- ��ʱ�����Ʒ
--enum ITEM_POSITION
------------------------------------------------------------------------
