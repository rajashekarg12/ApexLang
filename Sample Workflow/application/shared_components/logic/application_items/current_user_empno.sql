prompt --application/shared_components/logic/application_items/current_user_empno
begin
--   Manifest
--     APPLICATION ITEM: CURRENT_USER_EMPNO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(1515767231073124654)
,p_name=>'CURRENT_USER_EMPNO'
,p_protection_level=>'I'
);
wwv_flow_imp.component_end;
end;
/
