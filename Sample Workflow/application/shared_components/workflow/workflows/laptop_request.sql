prompt --application/shared_components/workflow/workflows/laptop_request
begin
--   Manifest
--     WORKFLOW: Laptop Request
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
 p_id=>wwv_flow_imp.id(1246729829155507218)
,p_name=>'Laptop Request'
,p_static_id=>'LAPTOP_REQUEST'
,p_title=>'Request for &P_LAPTOP_TYPE. by emp ID &P_EMPNO.'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(1246730556217507225)
,p_workflow_id=>wwv_flow_imp.id(1246729829155507218)
,p_label=>'Employee ID'
,p_static_id=>'P_EMPNO'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_is_required=>true
,p_value=>'Y'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(1246730637794507226)
,p_workflow_id=>wwv_flow_imp.id(1246729829155507218)
,p_label=>'Laptop Request ID'
,p_static_id=>'P_LAPTOP_REQUEST_ID'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_is_required=>true
,p_value=>'Y'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(1246730679972507227)
,p_workflow_id=>wwv_flow_imp.id(1246729829155507218)
,p_label=>'Laptop Type'
,p_static_id=>'P_LAPTOP_TYPE'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_value=>'Y'
);
wwv_flow_imp_shared.create_workflow_version(
 p_id=>wwv_flow_imp.id(1246729900839507219)
,p_workflow_id=>wwv_flow_imp.id(1246729829155507218)
,p_version=>'1.0'
,p_state=>'DEVELOPMENT'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(1515754693272040021)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_label=>'Approval Task ID'
,p_static_id=>'V_APPROVAL_TASK_ID'
,p_direction=>'VARIABLE'
,p_data_type=>'NUMBER'
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(1246731488082507235)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_label=>'Laptop Approver'
,p_static_id=>'V_APPROVER'
,p_direction=>'VARIABLE'
,p_data_type=>'VARCHAR2'
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(18101133230382318)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_label=>'Delivered from Stock'
,p_static_id=>'V_DELIVERED_FROM_STOCK'
,p_direction=>'VARIABLE'
,p_data_type=>'VARCHAR2'
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(1515757894872040053)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_label=>'Email to Notify'
,p_static_id=>'V_EMAIL_TO_NOTIFY'
,p_direction=>'VARIABLE'
,p_data_type=>'VARCHAR2'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'apex_app_setting.get_value(''DEMO_NOTIFICATION_EMAIL'')'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(1246731580395507236)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_label=>'Laptop Approval Outcome'
,p_static_id=>'V_TASK_OUTCOME'
,p_direction=>'VARIABLE'
,p_data_type=>'VARCHAR2'
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1246731462434507234)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'Approve Request'
,p_static_id=>'ApproveRequest'
,p_display_sequence=>40
,p_activity_type=>'NATIVE_CREATE_TASK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'details_primary_key_item', 'P_LAPTOP_REQUEST_ID',
  'initiator_can_complete', 'N',
  'outcome_item', 'V_TASK_OUTCOME',
  'owner_item', 'V_APPROVER',
  'task_definition_id', wwv_flow_imp.id(1259637593550539755),
  'task_id_item', 'V_APPROVAL_TASK_ID')).to_clob
,p_diagram=>'{"position":{"x":1200,"y":770},"z":-123}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1246732539521507245)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'Approved?'
,p_static_id=>'Approved'
,p_display_sequence=>60
,p_activity_type=>'NATIVE_WORKFLOW_SWITCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'compare_variable', 'V_TASK_OUTCOME',
  'type', 'CHECK_WF_VARIABLE')).to_clob
,p_diagram=>'{"position":{"x":890,"y":890},"z":-125}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1246733070833507250)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'Email Approved'
,p_static_id=>'EmailApproved'
,p_display_sequence=>90
,p_query_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename,',
'       case :P_LAPTOP_TYPE when ''MAC'' then ''MacBook Pro''',
'                           when ''WIN'' then ''Lenovo T490''',
'       end as laptop_type',
'from eba_demo_appr_emp',
'where empno = :P_EMPNO'))
,p_activity_type=>'NATIVE_SEND_EMAIL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'body_plain_text', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Dear &ENAME.,',
    '',
    'Congratulations, your laptop request for &LAPTOP_TYPE. has been approved.',
    '',
    'Best Regards,',
    '  The backoffice team')),
  'from', '&APP_EMAIL.',
  'send_immediately', 'Y',
  'subject', '&LAPTOP_TYPE. Laptop for &ENAME. Approved',
  'to', '&V_EMAIL_TO_NOTIFY.')).to_clob
,p_diagram=>'{"position":{"x":890,"y":1140},"z":-127}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1515755410141040028)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'Email Delivered'
,p_static_id=>'EmailDelivered'
,p_display_sequence=>130
,p_query_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename,',
'       case :P_LAPTOP_TYPE when ''MAC'' then ''MacBook Pro''',
'                           when ''WIN'' then ''Lenovo T490''',
'       end as laptop_type',
'from eba_demo_appr_emp',
'where empno = :P_EMPNO'))
,p_activity_type=>'NATIVE_SEND_EMAIL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'email_template_id', wwv_flow_imp.id(22030960339977754),
  'from', '&APP_EMAIL.',
  'placeholder_values', '{"P_LAPTOP_TYPE":"&LAPTOP_TYPE.","P_ENAME":"&ENAME.","P_DELIVERED_FROM_STOCK":"&V_DELIVERED_FROM_STOCK."}',
  'send_immediately', 'Y',
  'to', '&V_EMAIL_TO_NOTIFY.')).to_clob
,p_diagram=>'{"position":{"x":1510,"y":1140},"z":-131}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1515757349339040047)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'Email Rejected'
,p_static_id=>'EmailRejected'
,p_display_sequence=>100
,p_query_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename,',
'       case :P_LAPTOP_TYPE when ''MAC'' then ''MacBook Pro''',
'                           when ''WIN'' then ''Lenovo T490''',
'       end as laptop_type',
'from eba_demo_appr_emp',
'where empno = :P_EMPNO'))
,p_activity_type=>'NATIVE_SEND_EMAIL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'body_plain_text', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Dear &ENAME.,',
    '',
    'Sorry, your laptop request for &LAPTOP_TYPE. was not approved.',
    '',
    'Best Regards,',
    '  The backoffice team')),
  'from', '&APP_EMAIL.',
  'send_immediately', 'Y',
  'subject', '&LAPTOP_TYPE. Laptop for &ENAME. Rejected',
  'to', '&DEMO_NOTIFICATION_EMAIL.')).to_clob
,p_diagram=>'{"position":{"x":1690,"y":890},"z":-120}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1246730022874507220)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'Start'
,p_static_id=>'New'
,p_display_sequence=>10
,p_activity_type=>'NATIVE_WORKFLOW_START'
,p_diagram=>'{"position":{"x":970,"y":670},"z":1}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1525973001839024114)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'Notify Rejected?'
,p_static_id=>'New_1'
,p_display_sequence=>180
,p_activity_type=>'NATIVE_WORKFLOW_SWITCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'condition_type', 'WF_VARIABLE_NOT_NULL',
  'condition_workflow_variable', 'V_EMAIL_TO_NOTIFY',
  'type', 'TRUE_FALSE_CHECK')).to_clob
,p_diagram=>'{"position":{"x":1380,"y":890},"z":-122}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1515756941386040043)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'New'
,p_static_id=>'New_2'
,p_display_sequence=>150
,p_activity_type=>'NATIVE_WORKFLOW_WAIT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lang_expression', 'PLSQL',
  'plsql_expression', 'eba_demo_appr.rejection_delay_until_time',
  'timeout_type', 'EXPRESSION')).to_clob
,p_diagram=>'{"position":{"x":1270,"y":890},"z":22}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(18099987871382306)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'Procure Laptop'
,p_static_id=>'New_3'
,p_display_sequence=>190
,p_activity_type=>'NATIVE_INVOKE_WF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'details_primary_key_item', 'P_LAPTOP_REQUEST_ID',
  'retry_point', 'RESUME',
  'wait_for_completion', 'Y',
  'workflow_definition_id', wwv_flow_imp.id(18097790153382284))).to_clob
,p_diagram=>'{"position":{"x":1220,"y":1140},"z":36}'
);
wwv_flow_imp_shared.create_workflow_comp_param(
 p_id=>wwv_flow_imp.id(3839855290313903)
,p_workflow_activity_id=>wwv_flow_imp.id(18099987871382306)
,p_workflow_variable_id=>wwv_flow_imp.id(18100973377382316)
,p_value=>'V_DELIVERED_FROM_STOCK'
,p_ignore_output=>false
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1246732815787507248)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'End'
,p_static_id=>'New_6'
,p_display_sequence=>140
,p_activity_type=>'NATIVE_WORKFLOW_END'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'end_state', 'COMPLETED')).to_clob
,p_diagram=>'{"position":{"x":1790,"y":1040},"z":12}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1515757671774040050)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'Notify Approved?'
,p_static_id=>'NotifyApproved'
,p_display_sequence=>160
,p_activity_type=>'NATIVE_WORKFLOW_SWITCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'condition_type', 'WF_VARIABLE_NOT_NULL',
  'condition_workflow_variable', 'V_EMAIL_TO_NOTIFY',
  'type', 'TRUE_FALSE_CHECK')).to_clob
,p_diagram=>'{"position":{"x":890,"y":1020},"z":-126}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1515758219015040056)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'Notify Delivered?'
,p_static_id=>'NotifyDelivered'
,p_display_sequence=>170
,p_activity_type=>'NATIVE_WORKFLOW_SWITCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'condition_type', 'WF_VARIABLE_NOT_NULL',
  'condition_workflow_variable', 'V_EMAIL_TO_NOTIFY',
  'type', 'TRUE_FALSE_CHECK')).to_clob
,p_diagram=>'{"position":{"x":1220,"y":1270},"z":-130}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1246730160774507221)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'Request Pending'
,p_static_id=>'RequestPending'
,p_display_sequence=>20
,p_activity_type=>'NATIVE_INVOKE_API'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'EBA_DEMO_APPR',
  'package_method', 'UPDATE_LAPTOP_REQUEST',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_diagram=>'{"position":{"x":890,"y":770},"z":-124}'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1515756717971040041)
,p_workflow_activity_id=>wwv_flow_imp.id(1246730160774507221)
,p_name=>'p_approval_task_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>70
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1246731188719507232)
,p_workflow_activity_id=>wwv_flow_imp.id(1246730160774507221)
,p_name=>'p_approver'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>50
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1246731332722507233)
,p_workflow_activity_id=>wwv_flow_imp.id(1246730160774507221)
,p_name=>'p_decision_date'
,p_direction=>'IN'
,p_data_type=>'DATE'
,p_has_default=>true
,p_display_sequence=>60
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1515756875611040042)
,p_workflow_activity_id=>wwv_flow_imp.id(1246730160774507221)
,p_name=>'p_delivery_action_task_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>80
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1246730863078507228)
,p_workflow_activity_id=>wwv_flow_imp.id(1246730160774507221)
,p_name=>'p_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P_LAPTOP_REQUEST_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1246730905723507229)
,p_workflow_activity_id=>wwv_flow_imp.id(1246730160774507221)
,p_name=>'p_status'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'PENDING'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1246731052712507230)
,p_workflow_activity_id=>wwv_flow_imp.id(1246730160774507221)
,p_name=>'p_workflow_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>30
,p_value_type=>'STATIC'
,p_value=>'&APEX$WORKFLOW_ID.'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1246731873503507238)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_name=>'Update Request'
,p_static_id=>'UpdateRequest'
,p_display_sequence=>50
,p_activity_type=>'NATIVE_INVOKE_API'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'EBA_DEMO_APPR',
  'package_method', 'UPDATE_LAPTOP_REQUEST',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_diagram=>'{"position":{"x":1480,"y":770},"z":-121}'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1515754925091040023)
,p_workflow_activity_id=>wwv_flow_imp.id(1246731873503507238)
,p_name=>'p_approval_task_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>70
,p_value_type=>'ITEM'
,p_value=>'V_APPROVAL_TASK_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1246732365066507243)
,p_workflow_activity_id=>wwv_flow_imp.id(1246731873503507238)
,p_name=>'p_approver'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>50
,p_value_type=>'ITEM'
,p_value=>'V_APPROVER'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1246732389549507244)
,p_workflow_activity_id=>wwv_flow_imp.id(1246731873503507238)
,p_name=>'p_decision_date'
,p_direction=>'IN'
,p_data_type=>'DATE'
,p_has_default=>true
,p_display_sequence=>60
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'sysdate'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1515755074081040024)
,p_workflow_activity_id=>wwv_flow_imp.id(1246731873503507238)
,p_name=>'p_delivery_action_task_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>80
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1246731911643507239)
,p_workflow_activity_id=>wwv_flow_imp.id(1246731873503507238)
,p_name=>'p_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P_LAPTOP_REQUEST_ID'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1246731998843507240)
,p_workflow_activity_id=>wwv_flow_imp.id(1246731873503507238)
,p_name=>'p_status'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'V_TASK_OUTCOME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1246732113208507241)
,p_workflow_activity_id=>wwv_flow_imp.id(1246731873503507238)
,p_name=>'p_workflow_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>true
,p_display_sequence=>30
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3838774336313901)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1246731462434507234)
,p_to_activity_id=>wwv_flow_imp.id(1246731873503507238)
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"13.636%","dy":"50%","rotate":true}},"target":{},"vertices":[],"z":5,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3838833550313901)
,p_name=>'Rejected'
,p_execution_sequence=>10
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(1246732539521507245)
,p_to_activity_id=>wwv_flow_imp.id(1515756941386040043)
,p_condition_type=>'EQUALS'
,p_condition_expr1=>'REJECTED'
,p_diagram=>'{"source":{},"target":{},"vertices":[],"z":11,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3838903115313901)
,p_name=>'Approved'
,p_execution_sequence=>10
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(1246732539521507245)
,p_to_activity_id=>wwv_flow_imp.id(1515757671774040050)
,p_condition_type=>'EQUALS'
,p_condition_expr1=>'APPROVED'
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"50.003%","dy":"50%","rotate":true}},"target":{"name":"topLeft","args":{"dx":"50.003%","dy":"66.66%","rotate":true}},"vertices":[],"z":13,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3839086778313901)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1246733070833507250)
,p_to_activity_id=>wwv_flow_imp.id(18099987871382306)
,p_diagram=>'{"source":{},"target":{},"vertices":[],"z":15,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3839123793313901)
,p_name=>'Done'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1515755410141040028)
,p_to_activity_id=>wwv_flow_imp.id(1246732815787507248)
,p_diagram=>'{"source":{"args":{"dx":"31.818%","dy":"50%","rotate":true},"name":"topLeft"},"target":{"args":{"dx":"33.333%","dy":"33.333%","rotate":true},"name":"topLeft"},"vertices":[{"x":1810,"y":1170}],"z":19,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3839208089313902)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1515757349339040047)
,p_to_activity_id=>wwv_flow_imp.id(1246732815787507248)
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"59.091%","dy":"50%","rotate":true}},"target":{"args":{"dx":"50%","dy":"50%","rotate":true},"name":"topLeft"},"vertices":[],"z":25,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3839336204313902)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1246730022874507220)
,p_to_activity_id=>wwv_flow_imp.id(1246730160774507221)
,p_diagram=>'{"source":{},"target":{},"vertices":[],"z":4,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3839457498313902)
,p_name=>'Yes'
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(1525973001839024114)
,p_to_activity_id=>wwv_flow_imp.id(1515757349339040047)
,p_condition_expr1=>'TRUE'
,p_diagram=>'{"source":{},"target":{"args":{"dx":"90.909%","dy":"50%","rotate":true},"name":"topLeft"},"vertices":[],"z":34,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3839588892313902)
,p_name=>'No'
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(1525973001839024114)
,p_to_activity_id=>wwv_flow_imp.id(1246732815787507248)
,p_condition_expr1=>'FALSE'
,p_diagram=>'{"source":{"name":"bottom","args":{"dx":0,"dy":-10}},"target":{"name":"topLeft","args":{"dx":"50%","dy":"50%","rotate":true}},"vertices":[{"x":1490,"y":1070}],"z":35,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3839653608313903)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1515756941386040043)
,p_to_activity_id=>wwv_flow_imp.id(1525973001839024114)
,p_diagram=>'{"source":{"args":{"dx":"50%","dy":"50%","rotate":true},"name":"topLeft"},"target":{},"vertices":[],"z":23,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3839747615313903)
,p_name=>'New_1'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(18099987871382306)
,p_to_activity_id=>wwv_flow_imp.id(1515758219015040056)
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"59.091%","dy":"66.667%","rotate":true}},"target":{"name":"topLeft","args":{"dx":"59.093%","dy":"50%","rotate":true}},"vertices":[],"z":38,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3839965952313903)
,p_name=>'Yes'
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(1515757671774040050)
,p_to_activity_id=>wwv_flow_imp.id(1246733070833507250)
,p_condition_expr1=>'TRUE'
,p_diagram=>'{"source":{"args":{"dx":"50.003%","dy":"50%","rotate":true},"name":"topLeft"},"target":{"name":"topLeft","args":{"dx":"50%","dy":"33.333%","rotate":true}},"vertices":[],"z":27,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3840072225313903)
,p_name=>'No'
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(1515757671774040050)
,p_to_activity_id=>wwv_flow_imp.id(18099987871382306)
,p_condition_expr1=>'FALSE'
,p_diagram=>'{"source":{"args":{"dx":"36.367%","dy":"50%","rotate":true},"name":"topLeft"},"target":{"args":{"dx":"59.091%","dy":"33.333%","rotate":true},"name":"topLeft"},"vertices":[{"x":1350,"y":1050}],"z":28,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3840158446313903)
,p_name=>'Yes'
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(1515758219015040056)
,p_to_activity_id=>wwv_flow_imp.id(1515755410141040028)
,p_condition_expr1=>'TRUE'
,p_diagram=>'{"source":{"args":{"dx":-10,"dy":0},"name":"right"},"target":{"name":"topLeft","args":{"dx":"59.091%","dy":"50%","rotate":true}},"vertices":[{"x":1640,"y":1300}],"z":31,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3840285048313903)
,p_name=>'No'
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(1515758219015040056)
,p_to_activity_id=>wwv_flow_imp.id(1246732815787507248)
,p_condition_expr1=>'FALSE'
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"59.093%","dy":"66.66%","rotate":true}},"target":{"args":{"dx":"66.667%","dy":"50%","rotate":true},"name":"topLeft"},"vertices":[{"x":1350,"y":1360},{"x":1830,"y":1360}],"z":32,"label":{"distance":0.5,"offset"'
||':0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3840371215313903)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1246730160774507221)
,p_to_activity_id=>wwv_flow_imp.id(1246731462434507234)
,p_diagram=>'{"source":{},"target":{},"vertices":[],"z":7,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3840460238313903)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1246731873503507238)
,p_to_activity_id=>wwv_flow_imp.id(1246732539521507245)
,p_diagram=>'{"source":{},"target":{},"vertices":[{"x":1590,"y":860},{"x":1000,"y":860}],"z":10,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_participant(
 p_id=>wwv_flow_imp.id(3840520477313903)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_participant_type=>'ADMIN'
,p_name=>'Administrator'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'PAT'
);
wwv_flow_imp_shared.create_workflow_participant(
 p_id=>wwv_flow_imp.id(3840626472313903)
,p_workflow_version_id=>wwv_flow_imp.id(1246729900839507219)
,p_participant_type=>'OWNER'
,p_name=>'Owner'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'eba_demo_appr.userlist_for_department(''OPERATIONS'')'
);
wwv_flow_imp.component_end;
end;
/
