prompt --application/shared_components/user_interface/lovs/unified_task_list_lov_priority
begin
--   Manifest
--     UNIFIED_TASK_LIST.LOV.PRIORITY
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(1179178922141593416)
,p_lov_name=>'UNIFIED_TASK_LIST.LOV.PRIORITY'
,p_static_id=>'unified-task-list-lov-priority'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select disp, ',
'       val ',
'  from table ( apex_approval.get_lov_priority )',
' order by insert_order'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'VAL'
,p_display_column_name=>'DISP'
);
wwv_flow_imp.component_end;
end;
/
