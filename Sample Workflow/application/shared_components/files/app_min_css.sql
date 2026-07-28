prompt --application/shared_components/files/app_min_css
begin
--   Manifest
--     APP STATIC FILES: 104
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E6E6F2D616E696D202E612D43617264566965772D6974656D3E6469767B646973706C61793A6E6F6E657D';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(1259444864933418188)
,p_file_name=>'app.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
