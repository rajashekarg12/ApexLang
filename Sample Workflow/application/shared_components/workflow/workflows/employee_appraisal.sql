prompt --application/shared_components/workflow/workflows/employee_appraisal
begin
--   Manifest
--     WORKFLOW: Employee Appraisal
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
 p_id=>wwv_flow_imp.id(1495529844731018550)
,p_name=>'Employee Appraisal'
,p_static_id=>'EMPLOYEE_APPRAISAL'
,p_title=>'Appraisal for &SUBJECT.'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(1515754494707040019)
,p_workflow_id=>wwv_flow_imp.id(1495529844731018550)
,p_label=>'Subject'
,p_static_id=>'SUBJECT'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
);
wwv_flow_imp_shared.create_workflow_version(
 p_id=>wwv_flow_imp.id(1495529969457018551)
,p_workflow_id=>wwv_flow_imp.id(1495529844731018550)
,p_version=>'1.0'
,p_state=>'DEVELOPMENT'
,p_query_type=>'SQL'
,p_query_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id, a.appraisal_date',
'from eba_demo_appr_appraisals a',
'left join eba_demo_appr_emp e',
'       on e.empno = a.empno',
'where a.id = :APEX$WORKFLOW_DETAIL_PK'))
,p_diagram=>'orthogonal'
);
wwv_flow_imp_shared.create_workflow_variable(
 p_id=>wwv_flow_imp.id(1512147507786437720)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_label=>'VP Username'
,p_static_id=>'VP_USERNAME'
,p_direction=>'VARIABLE'
,p_data_type=>'VARCHAR2'
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1509103696266176829)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_name=>'Appraisal Originated'
,p_static_id=>'AppraisalOriginated'
,p_display_sequence=>20
,p_activity_type=>'NATIVE_INVOKE_API'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'EBA_DEMO_APPR',
  'package_method', 'UPDATE_APPRAISAL_STATUS',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_diagram=>'{"position":{"x":1020,"y":710},"z":-72}'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1509103949570176831)
,p_workflow_activity_id=>wwv_flow_imp.id(1509103696266176829)
,p_name=>'p_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'APEX$WORKFLOW_DETAIL_PK'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1509103984825176832)
,p_workflow_activity_id=>wwv_flow_imp.id(1509103696266176829)
,p_name=>'p_status'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'ORIGINATED'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1509102475359176816)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_name=>'Appraisal Submitted'
,p_static_id=>'AppraisalSubmitted'
,p_display_sequence=>40
,p_activity_type=>'NATIVE_INVOKE_API'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'EBA_DEMO_APPR',
  'package_method', 'UPDATE_APPRAISAL_STATUS',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_diagram=>'{"position":{"x":1200,"y":840},"z":-73}'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1509102672956176818)
,p_workflow_activity_id=>wwv_flow_imp.id(1509102475359176816)
,p_name=>'p_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'APEX$WORKFLOW_DETAIL_PK'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1509102777712176819)
,p_workflow_activity_id=>wwv_flow_imp.id(1509102475359176816)
,p_name=>'p_status'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'SUBMITTED'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1512146959763437714)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_name=>'Determine VP'
,p_static_id=>'DetermineVP'
,p_display_sequence=>110
,p_activity_type=>'NATIVE_INVOKE_API'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'EBA_DEMO_APPR',
  'package_method', 'DETERMINE_APPRAISAL_VP',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_diagram=>'{"position":{"x":850,"y":1080},"z":-77}'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1512147215714437717)
,p_workflow_activity_id=>wwv_flow_imp.id(1512146959763437714)
,p_name=>'p_appraisal_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'APEX$WORKFLOW_DETAIL_PK'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1545679556377749652)
,p_workflow_activity_id=>wwv_flow_imp.id(1512146959763437714)
,p_name=>'p_vp_username'
,p_direction=>'IN_OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'VP_USERNAME'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1509101765048176809)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_name=>'Manager Appraisal'
,p_static_id=>'ManagerAppraisal'
,p_display_sequence=>50
,p_activity_type=>'NATIVE_CREATE_TASK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'details_primary_key_item', 'APEX$WORKFLOW_DETAIL_PK',
  'initiator_can_complete', 'N',
  'task_definition_id', wwv_flow_imp.id(1509127072699244428))).to_clob
,p_diagram=>'{"position":{"x":850,"y":960},"z":-75}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1509102787663176820)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_name=>'Manager Submitted'
,p_static_id=>'ManagerSubmitted'
,p_display_sequence=>60
,p_activity_type=>'NATIVE_INVOKE_API'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'EBA_DEMO_APPR',
  'package_method', 'UPDATE_APPRAISAL_STATUS',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_diagram=>'{"position":{"x":1200,"y":960},"z":-76}'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1509103045077176822)
,p_workflow_activity_id=>wwv_flow_imp.id(1509102787663176820)
,p_name=>'p_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'APEX$WORKFLOW_DETAIL_PK'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1509103115979176823)
,p_workflow_activity_id=>wwv_flow_imp.id(1509102787663176820)
,p_name=>'p_status'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'MGR_SUBMITTED'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1495530064427018552)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_name=>'Start'
,p_static_id=>'New'
,p_display_sequence=>10
,p_activity_type=>'NATIVE_WORKFLOW_START'
,p_diagram=>'{"position":{"x":690,"y":710},"z":-83}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1495530238201018554)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_name=>'End'
,p_static_id=>'New_2'
,p_display_sequence=>100
,p_activity_type=>'NATIVE_WORKFLOW_END'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'end_state', 'COMPLETED')).to_clob
,p_diagram=>'{"position":{"x":690,"y":1300},"z":-82}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1512147390134437719)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_name=>'VP Required?'
,p_static_id=>'New_3'
,p_display_sequence=>120
,p_activity_type=>'NATIVE_WORKFLOW_SWITCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'condition_type', 'WF_VARIABLE_NEQ_VAL',
  'condition_workflow_variable', 'VP_USERNAME',
  'type', 'TRUE_FALSE_CHECK',
  'value', 'NONE')).to_clob
,p_diagram=>'{"position":{"x":1200,"y":1080},"z":-78}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1495530088571018553)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_name=>'Self-Evaluation'
,p_static_id=>'SelfEvaluation'
,p_display_sequence=>30
,p_activity_type=>'NATIVE_CREATE_TASK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'details_primary_key_item', 'APEX$WORKFLOW_DETAIL_PK',
  'initiator_can_complete', 'N',
  'task_definition_id', wwv_flow_imp.id(1226312459618344767))).to_clob
,p_due_on_type=>'EXPRESSION'
,p_due_on_language=>'PLSQL'
,p_due_on_value=>':APPRAISAL_DATE'
,p_diagram=>'{"position":{"x":850,"y":840},"z":-74}'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1509101794741176810)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_name=>'VP Review'
,p_static_id=>'VPReview'
,p_display_sequence=>70
,p_activity_type=>'NATIVE_CREATE_TASK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'details_primary_key_item', 'APEX$WORKFLOW_DETAIL_PK',
  'initiator_can_complete', 'N',
  'task_definition_id', wwv_flow_imp.id(1509125581424240407))).to_clob
,p_diagram=>'{"position":{"x":850,"y":1210},"z":-79}'
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(3841744457313904)
,p_workflow_activity_id=>wwv_flow_imp.id(1509101794741176810)
,p_task_def_param_id=>wwv_flow_imp.id(1513279035535415443)
,p_value_type=>'ITEM'
,p_value=>'VP_USERNAME'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1509103232434176824)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_name=>'VP Reviewed'
,p_static_id=>'VPReviewed'
,p_display_sequence=>80
,p_activity_type=>'NATIVE_INVOKE_API'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'EBA_DEMO_APPR',
  'package_method', 'UPDATE_APPRAISAL_STATUS',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_diagram=>'{"position":{"x":1200,"y":1210},"z":-80}'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1509103295997176825)
,p_workflow_activity_id=>wwv_flow_imp.id(1509103232434176824)
,p_name=>'p_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'APEX$WORKFLOW_DETAIL_PK'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1509103477473176826)
,p_workflow_activity_id=>wwv_flow_imp.id(1509103232434176824)
,p_name=>'p_status'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'VP_REVIEWED'
);
wwv_flow_imp_shared.create_workflow_activity(
 p_id=>wwv_flow_imp.id(1512147652217437721)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_name=>'Appraisal Completed'
,p_static_id=>'VPReviewed_1'
,p_display_sequence=>90
,p_activity_type=>'NATIVE_INVOKE_API'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'EBA_DEMO_APPR',
  'package_method', 'UPDATE_APPRAISAL_STATUS',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_diagram=>'{"position":{"x":1020,"y":1300},"z":-81}'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1512147829537437723)
,p_workflow_activity_id=>wwv_flow_imp.id(1512147652217437721)
,p_name=>'p_id'
,p_direction=>'IN'
,p_data_type=>'NUMBER'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'APEX$WORKFLOW_DETAIL_PK'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1512147947695437724)
,p_workflow_activity_id=>wwv_flow_imp.id(1512147652217437721)
,p_name=>'p_status'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'STATIC'
,p_value=>'COMPLETED'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3840775646313903)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1509103696266176829)
,p_to_activity_id=>wwv_flow_imp.id(1495530088571018553)
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"59.091%","dy":"33.333%","rotate":true}},"target":{"name":"topLeft","args":{"dx":"54.545%","dy":"16.667%","rotate":true}},"vertices":[{"x":1040,"y":800}],"z":17,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3840815883313903)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1509102475359176816)
,p_to_activity_id=>wwv_flow_imp.id(1509101765048176809)
,p_diagram=>'{"source":{"args":{"dx":"59.091%","dy":"83.333%","rotate":true},"name":"topLeft"},"target":{"args":{"dx":"54.545%","dy":"50%","rotate":true},"name":"topLeft"},"vertices":[{"x":1020,"y":930}],"z":11,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3840998467313903)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1512146959763437714)
,p_to_activity_id=>wwv_flow_imp.id(1512147390134437719)
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"31.818%","dy":"50%","rotate":true}},"target":{"name":"topLeft","args":{"dx":"63.638%","dy":"50%","rotate":true}},"vertices":[],"z":14,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3841006197313903)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1509101765048176809)
,p_to_activity_id=>wwv_flow_imp.id(1509102787663176820)
,p_diagram=>'{"source":{"args":{"dx":"54.545%","dy":"50%","rotate":true},"name":"topLeft"},"target":{"name":"topLeft","args":{"dx":"81.818%","dy":"50%","rotate":true}},"vertices":[],"z":9,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3841113466313904)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1509102787663176820)
,p_to_activity_id=>wwv_flow_imp.id(1512146959763437714)
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"59.091%","dy":"50%","rotate":true}},"target":{"name":"topLeft","args":{"dx":"45.455%","dy":"50%","rotate":true}},"vertices":[{"x":840,"y":1060}],"z":19,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3841229170313904)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1495530064427018552)
,p_to_activity_id=>wwv_flow_imp.id(1509103696266176829)
,p_diagram=>'{"source":{},"target":{"name":"topLeft","args":{"dx":"68.182%","dy":"50%","rotate":true}},"vertices":[],"z":4,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3841347174313904)
,p_name=>'No VP Available'
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(1512147390134437719)
,p_to_activity_id=>wwv_flow_imp.id(1512147652217437721)
,p_condition_expr1=>'FALSE'
,p_diagram=>'{"source":{"args":{"dx":"31.822%","dy":"50%","rotate":true},"name":"topLeft"},"target":{"args":{"dx":"63.636%","dy":"66.667%","rotate":true},"name":"topLeft"},"vertices":[{"x":1460,"y":1160}],"z":24,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3841414180313904)
,p_name=>'Yes'
,p_transition_type=>'BRANCH'
,p_from_activity_id=>wwv_flow_imp.id(1512147390134437719)
,p_to_activity_id=>wwv_flow_imp.id(1509101794741176810)
,p_condition_expr1=>'TRUE'
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"59.093%","dy":"50%","rotate":true}},"target":{"name":"topLeft","args":{"dx":"50%","dy":"50%","rotate":true}},"vertices":[{"x":1090,"y":1170}],"z":25,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3841533536313904)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1495530088571018553)
,p_to_activity_id=>wwv_flow_imp.id(1509102475359176816)
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"18.182%","dy":"50%","rotate":true}},"target":{"name":"topLeft","args":{"dx":"90.909%","dy":"50%","rotate":true}},"vertices":[],"z":8,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3841694318313904)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1509101794741176810)
,p_to_activity_id=>wwv_flow_imp.id(1509103232434176824)
,p_diagram=>'{"source":{"args":{"dx":"50%","dy":"50%","rotate":true},"name":"topLeft"},"target":{"name":"topLeft","args":{"dx":"50%","dy":"50%","rotate":true}},"vertices":[],"z":5,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3841892465313904)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1509103232434176824)
,p_to_activity_id=>wwv_flow_imp.id(1512147652217437721)
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"54.545%","dy":"16.667%","rotate":true}},"target":{"name":"topLeft","args":{"dx":"68.182%","dy":"33.333%","rotate":true}},"vertices":[{"x":1290,"y":1320}],"router":{"name":"orthogonal","args":{"padding":20}},"'
||'z":23,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_transition(
 p_id=>wwv_flow_imp.id(3841969011313904)
,p_name=>'New'
,p_transition_type=>'NORMAL'
,p_from_activity_id=>wwv_flow_imp.id(1512147652217437721)
,p_to_activity_id=>wwv_flow_imp.id(1495530238201018554)
,p_diagram=>'{"source":{"name":"topLeft","args":{"dx":"22.727%","dy":"50%","rotate":true}},"target":{"name":"topLeft","args":{"dx":"66.667%","dy":"50%","rotate":true}},"vertices":[],"z":22,"label":{"distance":0.5,"offset":0}}'
);
wwv_flow_imp_shared.create_workflow_participant(
 p_id=>wwv_flow_imp.id(3842076912313904)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_participant_type=>'OWNER'
,p_name=>'New'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'eba_demo_appr.userlist_for_department(''OPERATIONS'')'
);
wwv_flow_imp_shared.create_workflow_participant(
 p_id=>wwv_flow_imp.id(3842143616313904)
,p_workflow_version_id=>wwv_flow_imp.id(1495529969457018551)
,p_participant_type=>'ADMIN'
,p_name=>'New_1'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'PAT'
);
wwv_flow_imp.component_end;
end;
/
