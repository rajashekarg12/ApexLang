prompt --application/shared_components/logic/application_computations/p29_show_for_subordinates
begin
--   Manifest
--     APPLICATION COMPUTATION: P29_SHOW_FOR_SUBORDINATES
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
 p_id=>wwv_flow_imp.id(1518004582168953410)
,p_computation_sequence=>10
,p_computation_item=>'P29_SHOW_FOR_SUBORDINATES'
,p_static_id=>'p29-show-for-subordinates'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'null'
);
wwv_flow_imp.component_end;
end;
/
