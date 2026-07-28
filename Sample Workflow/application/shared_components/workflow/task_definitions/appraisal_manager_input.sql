prompt --application/shared_components/workflow/task_definitions/appraisal_manager_input
begin
--   Manifest
--     TASK_DEF: Appraisal - Manager Input
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
 p_id=>wwv_flow_imp.id(1509127072699244428)
,p_name=>'Appraisal - Manager Input'
,p_static_id=>'APPRAISAL_MANAGER_INPUT'
,p_subject=>'Evaluate &ENAME.'
,p_task_type=>'ACTION'
,p_priority=>3
,p_details_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:17,RP:P17_TASK_ID:&TASK_ID.'
,p_actions_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.ename',
'from eba_demo_appr_appraisals a',
'left join eba_demo_appr_emp e on e.empno = a.empno',
'where a.id = :APEX$TASK_PK'))
,p_initiator_can_complete=>false
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(3827901719313742)
,p_task_def_id=>wwv_flow_imp.id(1509127072699244428)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'PAT'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(3828082096313742)
,p_task_def_id=>wwv_flow_imp.id(1509127072699244428)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'eba_demo_appr.get_appraisal_manager(:APEX$TASK_PK)'
);
wwv_flow_imp.component_end;
end;
/
