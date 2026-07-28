prompt --application/shared_components/workflow/workflows/laptop_procurement
begin
--   Manifest
--     WORKFLOW: Laptop Procurement
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_workflow(
 p_id=>wwv_flow_imp.id(18097790153382284)
,p_name=>'Laptop Procurement'
,p_static_id=>'LAPTOP_PROCUREMENT'
,p_title=>'Laptop Procurement'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(18100973377382316)
,p_workflow_id=>wwv_flow_imp.id(18097790153382284)
,p_label=>'Delivered from Stock'
,p_static_id=>'P_DELIVERED_FROM_STOCK'
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_workflow_version(
 p_id=>wwv_flow_imp.id(18097917922382285)
,p_workflow_id=>wwv_flow_imp.id(18097790153382284)
,p_version=>'1.0'
,p_state=>'DEVELOPMENT'
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_APPR_LAPTOP_REQUESTS'
,p_pk_column=>'ID'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(18099504723382301)
,p_workflow_version_id=>wwv_flow_imp.id(18097917922382285)
,p_label=>'Approver'
,p_static_id=>'APPROVER'
,p_direction=>'VARIABLE'
,p_data_type=>'VARCHAR2'
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(18099542812382302)
,p_workflow_version_id=>wwv_flow_imp.id(18097917922382285)
,p_label=>'TaskOutcome'
,p_static_id=>'TASK_OUTCOME'
,p_direction=>'VARIABLE'
,p_data_type=>'VARCHAR2'
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(18099918339382305)
,p_workflow_version_id=>wwv_flow_imp.id(18097917922382285)
,p_label=>'Delivery Action Task Id'
,p_static_id=>'V_DELIVERY_ACTION_TASK_ID'
,p_direction=>'VARIABLE'
,p_data_type=>'VARCHAR2'
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(18099365051382300)
,p_workflow_version_id=>wwv_flow_imp.id(18097917922382285)
,p_name=>'Confirm Delivery'
,p_static_id=>'ConfirmDelivery'
,p_display_sequence=>80
,p_activity_type=>'NATIVE_CREATE_TASK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'details_primary_key_item', 'APEX$WORKFLOW_DETAIL_PK',
  'task_definition_id', wwv_flow_imp.id(1525904919785328499),
  'task_id_item', 'V_DELIVERY_ACTION_TASK_ID')).to_clob
,p_diagram=>'{"position":{"x":730,"y":1310},"z":14}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(18097959621382286)
,p_workflow_version_id=>wwv_flow_imp.id(18097917922382285)
,p_name=>'Start'
,p_static_id=>'New'
,p_display_sequence=>10
,p_activity_type=>'NATIVE_WORKFLOW_START'
,p_diagram=>'{"position":{"x":560,"y":970},"z":1}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(18098075591382287)
,p_workflow_version_id=>wwv_flow_imp.id(18097917922382285)
,p_name=>'In Stock?'
,p_static_id=>'New_1'
,p_display_sequence=>20
,p_activity_type=>'NATIVE_WORKFLOW_SWITCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'condition_language', 'PLSQL',
  'condition_plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P_DELIVERED_FROM_STOCK := case ',
    '                           when eba_demo_appr.laptop_in_stock(:LAPTOP_TYPE) then ''Y''',
    '                           else ''N''',
    '                           end;',
    'return :P_DELIVERED_FROM_STOCK = ''Y'';')),
  'condition_type', 'FUNCTION_BODY',
  'type', 'TRUE_FALSE_CHECK')).to_clob
,p_diagram=>'{"position":{"x":730,"y":970},"z":2}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(18098156261382288)
,p_workflow_version_id=>wwv_flow_imp.id(18097917922382285)
,p_name=>'End'
,p_static_id=>'New_2'
,p_display_sequence=>30
,p_activity_type=>'NATIVE_WORKFLOW_END'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'end_state', 'COMPLETED')).to_clob
,p_diagram=>'{"position":{"x":1380,"y":970},"z":3}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(18098593599382292)
,p_workflow_version_id=>wwv_flow_imp.id(18097917922382285)
,p_name=>'Update for Delivery'
,p_static_id=>'New_3'
,p_display_sequence=>40
,p_activity_type=>'NATIVE_INVOKE_API'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'EBA_DEMO_APPR',
  'package_method', 'UPDATE_LAPTOP_REQUEST',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_diagram=>'{"position":{"x":1090,"y":1150},"z":6}'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(18100593312382312)
,p_workflow_activity_id=>wwv_flow_imp.id(18098593599382292)
,p_name=>'p_approval_task_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>40
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(18100772533382314)
,p_workflow_activity_id=>wwv_flow_imp.id(18098593599382292)
,p_name=>'p_approver'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>60
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(18100871374382315)
,p_workflow_activity_id=>wwv_flow_imp.id(18098593599382292)
,p_name=>'p_decision_date'
,p_direction=>'IN'
,p_data_type=>'DATE'
,p_has_default=>true
,p_display_sequence=>70
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(18100653105382313)
,p_workflow_activity_id=>wwv_flow_imp.id(18098593599382292)
,p_name=>'p_delivery_action_task_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>50
,p_value_type=>'ITEM'
,p_value=>'V_DELIVERY_ACTION_TASK_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(18100290056382309)
,p_workflow_activity_id=>wwv_flow_imp.id(18098593599382292)
,p_name=>'p_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'APEX$WORKFLOW_DETAIL_PK'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(18100416264382310)
,p_workflow_activity_id=>wwv_flow_imp.id(18098593599382292)
,p_name=>'p_status'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'DELIVERED'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(18100488840382311)
,p_workflow_activity_id=>wwv_flow_imp.id(18098593599382292)
,p_name=>'p_workflow_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>30
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(18098688206382293)
,p_workflow_version_id=>wwv_flow_imp.id(18097917922382285)
,p_name=>'Deliver from Stock'
,p_static_id=>'New_4'
,p_display_sequence=>50
,p_activity_type=>'NATIVE_INVOKE_API'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'EBA_DEMO_APPR',
  'package_method', 'DELIVER_LAPTOP_FROM_STOCK',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_diagram=>'{"position":{"x":1090,"y":970},"z":7}'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(22044885786184371)
,p_workflow_activity_id=>wwv_flow_imp.id(18098688206382293)
,p_name=>'p_laptop_request_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'APEX$WORKFLOW_DETAIL_PK'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(22044727847184370)
,p_workflow_activity_id=>wwv_flow_imp.id(18098688206382293)
,p_name=>'p_laptop_type'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'LAPTOP_TYPE'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(18099295696382299)
,p_workflow_version_id=>wwv_flow_imp.id(18097917922382285)
,p_name=>'Order Laptop'
,p_static_id=>'New_6'
,p_display_sequence=>70
,p_activity_type=>'NATIVE_INVOKE_API'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'EBA_DEMO_APPR',
  'package_method', 'ORDER_LAPTOP_FROM_SUPPLIER',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_diagram=>'{"position":{"x":730,"y":1150},"z":13}'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(22045030183184373)
,p_workflow_activity_id=>wwv_flow_imp.id(18099295696382299)
,p_name=>'p_laptop_request_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'APEX$WORKFLOW_DETAIL_PK'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(22045019632184372)
,p_workflow_activity_id=>wwv_flow_imp.id(18099295696382299)
,p_name=>'p_laptop_type'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'LAPTOP_TYPE'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3838040721313901)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(18099365051382300)
,p_to_activity_id=>wwv_flow_imp.id(18098593599382292)
,p_diagram=>'{"source":{"args":{"dx":-10,"dy":0},"name":"right"},"target":{"args":{"dx":"59.091%","dy":"50%","rotate":true},"name":"topLeft"},"vertices":[{"x":1220,"y":1340}],"z":16,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3838150055313901)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(18097959621382286)
,p_to_activity_id=>wwv_flow_imp.id(18098075591382287)
,p_diagram=>'{"source":{},"target":{"name":"topLeft","args":{"dx":"45.457%","dy":"50%","rotate":true}},"vertices":[],"z":4,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3838293263313901)
,p_name=>'Yes'
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(18098075591382287)
,p_to_activity_id=>wwv_flow_imp.id(18098688206382293)
,p_condition_expr1=>'TRUE'
,p_diagram=>'{"source":{"name":"right","args":{"dx":-10,"dy":0}},"target":{"name":"topLeft","args":{"dx":"50%","dy":"50%","rotate":true}},"vertices":[],"z":5,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3838378548313901)
,p_name=>'No'
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(18098075591382287)
,p_to_activity_id=>wwv_flow_imp.id(18099295696382299)
,p_condition_expr1=>'FALSE'
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"54.548%","dy":"83.321%","rotate":true}},"target":{"name":"topLeft","args":{"dx":"54.545%","dy":"66.667%","rotate":true}},"vertices":[],"z":8,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3838415538313901)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(18098593599382292)
,p_to_activity_id=>wwv_flow_imp.id(18098156261382288)
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"59.091%","dy":"16.667%","rotate":true}},"target":{"args":{"dx":"50%","dy":"66.667%","rotate":true},"name":"topLeft"},"vertices":[{"x":1220,"y":1090},{"x":1410,"y":1090}],"z":12,"label":{"distance":0.5,"offset'
||'":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3838557086313901)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(18098688206382293)
,p_to_activity_id=>wwv_flow_imp.id(18098156261382288)
,p_diagram=>'{"source":{"name":"right","args":{"dx":-10,"dy":0}},"target":{"name":"topLeft","args":{"dx":"50%","dy":"50%","rotate":true}},"vertices":[],"z":11,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3838608456313901)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(18099295696382299)
,p_to_activity_id=>wwv_flow_imp.id(18099365051382300)
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"54.545%","dy":"33.333%","rotate":true}},"target":{"name":"topLeft","args":{"dx":"54.545%","dy":"50%","rotate":true}},"vertices":[],"z":15,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp.component_end;
end;
/
