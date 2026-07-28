prompt --application/shared_components/workflow/task_definitions/laptop_delivered
begin
--   Manifest
--     TASK_DEF: Laptop Delivered
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
 p_id=>wwv_flow_imp.id(1525904919785328499)
,p_name=>'Laptop Delivered'
,p_static_id=>'LAPTOP_DELIVERED'
,p_subject=>'Awaiting delivery of &LAPTOP_TYPE. laptop for &ENAME.'
,p_task_type=>'ACTION'
,p_priority=>3
,p_actions_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename,',
'       case laptop_type when ''MAC'' then ''MacBook Pro'' when ''WIN'' then ''Lenovo T490'' end as laptop_type',
'from eba_demo_appr_laptop_requests lr',
'left outer join eba_demo_appr_emp e on e.empno = lr.empno',
'where lr.id = :APEX$TASK_PK'))
,p_initiator_can_complete=>false
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(3828305180313742)
,p_task_def_id=>wwv_flow_imp.id(1525904919785328499)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'eba_demo_appr.userlist_for_department(''OPERATIONS'')'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(3828435743313742)
,p_task_def_id=>wwv_flow_imp.id(1525904919785328499)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'PAT'
);
wwv_flow_imp.component_end;
end;
/
