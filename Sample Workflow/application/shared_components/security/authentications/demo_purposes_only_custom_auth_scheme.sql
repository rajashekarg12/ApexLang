prompt --application/shared_components/security/authentications/demo_purposes_only_custom_auth_scheme
begin
--   Manifest
--     AUTHENTICATION: Demo Purposes Only Custom Auth Scheme
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(1495518361131915600)
,p_name=>'Demo Purposes Only Custom Auth Scheme'
,p_static_id=>'demo-purposes-only-custom-auth-scheme'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'authentication_function', 'is_authenticated_for_demo',
  'enable_legacy_attributes', 'N')).to_clob
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--===========================================================',
'-- Return true for any username in eba_demo_story_users table',
'--===========================================================',
'',
'function is_authenticated_for_demo(',
'    p_username in varchar2,',
'    p_password in varchar2)',
'    return        boolean',
'is',
'begin',
'    for j in (select ename ',
'                from eba_demo_appr_emp',
'               where upper(ename) = upper(p_username)) loop',
'       return true;',
'    end loop;',
'    return false; ',
'end;'))
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
wwv_flow_imp.component_end;
end;
/
