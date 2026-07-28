prompt --application/shared_components/user_interface/lovs/workflow_charts_lov_time_unit
begin
--   Manifest
--     WORKFLOW_CHARTS.LOV.TIME_UNIT
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
 p_id=>wwv_flow_imp.id(15895500380933293)
,p_lov_name=>'WORKFLOW_CHARTS.LOV.TIME_UNIT'
,p_static_id=>'workflow-charts-lov-time-unit'
,p_lov_query=>'.'||wwv_flow_imp.id(15895500380933293)||'.'
,p_location=>'STATIC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(15896983764933298)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Days'
,p_lov_return_value=>'DAY'
,p_static_id=>'days'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(15896615882933298)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Hours'
,p_lov_return_value=>'HOUR'
,p_static_id=>'hours'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(15896209057933297)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Minutes'
,p_lov_return_value=>'MIN'
,p_static_id=>'minutes'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(15895742254933294)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Seconds'
,p_lov_return_value=>'SEC'
,p_static_id=>'seconds'
);
wwv_flow_imp.component_end;
end;
/
