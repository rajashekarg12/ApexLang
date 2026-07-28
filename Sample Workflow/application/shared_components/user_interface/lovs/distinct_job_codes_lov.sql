prompt --application/shared_components/user_interface/lovs/distinct_job_codes_lov
begin
--   Manifest
--     DISTINCT_JOB_CODES_LOV
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
 p_id=>wwv_flow_imp.id(1271567391406258268)
,p_lov_name=>'DISTINCT_JOB_CODES_LOV'
,p_static_id=>'distinct-job-codes-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select job dv, job rv',
'from (',
'    select distinct job from eba_demo_appr_emp',
')',
'order by job'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'RV'
,p_display_column_name=>'DV'
,p_default_sort_column_name=>'DV'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
