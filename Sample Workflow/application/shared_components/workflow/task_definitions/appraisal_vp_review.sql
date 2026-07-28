prompt --application/shared_components/workflow/task_definitions/appraisal_vp_review
begin
--   Manifest
--     TASK_DEF: Appraisal - VP Review
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_task_def(
 p_id=>wwv_flow_imp.id(1509125581424240407)
,p_name=>'Appraisal - VP Review'
,p_static_id=>'APPRAISAL_VP_REVIEW'
,p_subject=>'Review Evaluation for &ENAME.'
,p_task_type=>'ACTION'
,p_priority=>3
,p_details_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:17,RP:P17_TASK_ID:&TASK_ID.'
,p_actions_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.ename',
'from eba_demo_appr_appraisals a',
'left join eba_demo_appr_emp e on e.empno = a.empno',
'where a.id = :APEX$TASK_PK'))
,p_initiator_can_complete=>false
,p_vacation_rule_procedure=>'eba_demo_appr.appraisal_vp_review_handler'
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(1513279035535415443)
,p_task_def_id=>wwv_flow_imp.id(1509125581424240407)
,p_label=>'P Vp Username'
,p_static_id=>'P_VP_USERNAME'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(3827766585313742)
,p_task_def_id=>wwv_flow_imp.id(1509125581424240407)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'PAT'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(3827858461313742)
,p_task_def_id=>wwv_flow_imp.id(1509125581424240407)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>':P_VP_USERNAME'
);
wwv_flow_imp.component_end;
end;
/
