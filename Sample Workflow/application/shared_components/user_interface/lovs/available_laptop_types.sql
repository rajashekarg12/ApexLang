prompt --application/shared_components/user_interface/lovs/available_laptop_types
begin
--   Manifest
--     AVAILABLE_LAPTOP_TYPES
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
 p_id=>wwv_flow_imp.id(1262868091226013567)
,p_lov_name=>'AVAILABLE_LAPTOP_TYPES'
,p_static_id=>'available-laptop-types'
,p_lov_query=>'.'||wwv_flow_imp.id(1262868091226013567)||'.'
,p_location=>'STATIC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1262868853857013568)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Lenovo T490'
,p_lov_return_value=>'WIN'
,p_static_id=>'lenovo-t'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1262868438415013568)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'MacBook Pro 14"'
,p_lov_return_value=>'MAC'
,p_static_id=>'macbook-pro'
);
wwv_flow_imp.component_end;
end;
/
