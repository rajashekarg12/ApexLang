prompt --application/shared_components/logic/application_computations/current_user_empno
begin
--   Manifest
--     APPLICATION COMPUTATION: CURRENT_USER_EMPNO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(1515767689695132171)
,p_computation_sequence=>10
,p_computation_item=>'CURRENT_USER_EMPNO'
,p_static_id=>'current-user-empno'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select empno',
'  from eba_demo_appr_emp',
' where ename = :APP_USER'))
);
wwv_flow_imp.component_end;
end;
/
