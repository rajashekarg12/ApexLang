prompt --application/shared_components/security/authorizations/operations_team
begin
--   Manifest
--     SECURITY SCHEME: Operations Team
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(1256045581670493716)
,p_name=>'Operations Team'
,p_static_id=>'operations-team'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select null',
    'from eba_demo_appr_emp',
    'where ename = :APP_USER',
    'and deptno  = 40 /* OPERATIONS */')))).to_clob
,p_error_message=>'Insufficient privileges, user is not on the Operations team'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_imp.component_end;
end;
/
