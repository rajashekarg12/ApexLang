prompt --application/shared_components/user_interface/lovs/emp_ename
begin
--   Manifest
--     EMP.ENAME
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
 p_id=>wwv_flow_imp.id(1259399656718131875)
,p_lov_name=>'EMP.ENAME'
,p_static_id=>'emp-ename'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'EMP'
,p_return_column_name=>'EMPNO'
,p_display_column_name=>'ENAME'
,p_default_sort_column_name=>'ENAME'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
