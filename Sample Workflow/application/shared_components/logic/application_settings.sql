prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 104
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(1177371927777744418)
,p_name=>'DEMO_NOTIFICATION_EMAIL'
,p_is_required=>'N'
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(334138669652254381)
,p_name=>'EMP_APPRAISAL_EXTRA_VP_REVIEWERS'
,p_is_required=>'N'
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(334141554003457785)
,p_name=>'TEMPORARY_BUSINESS_ADMIN'
,p_is_required=>'N'
);
wwv_flow_imp.component_end;
end;
/
