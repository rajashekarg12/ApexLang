prompt --application/shared_components/workflow/task_definitions/laptop_approval
begin
--   Manifest
--     TASK_DEF: Laptop Approval
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
 p_id=>wwv_flow_imp.id(1259637593550539755)
,p_name=>'Laptop Approval'
,p_static_id=>'LAPTOP_APPROVAL'
,p_subject=>'&LAPTOP_TYPE. Laptop Request for &ENAME.'
,p_task_type=>'APPROVAL'
,p_priority=>3
,p_due_on_interval=>'FREQ=MINUTELY;INTERVAL=2'
,p_expiration_policy=>'RENEW'
,p_max_renewal_count=>2
,p_due_on_type=>'SCHEDULER_EXPRESSION'
,p_details_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2,RP:P2_TASK_ID:&TASK_ID.'
,p_actions_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename,',
'       case laptop_type when ''MAC'' then ''MacBook Pro'' when ''WIN'' then ''Lenovo T490'' end as laptop_type,',
'       apex_app_setting.get_value(''DEMO_NOTIFICATION_EMAIL'') as demo_notification_email ',
'from eba_demo_appr_laptop_requests lr',
'left outer join eba_demo_appr_emp e on e.empno = lr.empno',
'where lr.id = :APEX$TASK_PK'))
,p_initiator_can_complete=>false
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(1259702384398691645)
,p_task_def_id=>wwv_flow_imp.id(1259637593550539755)
,p_name=>'Before Expire: Send Reminder Email to Approver'
,p_static_id=>'before-expire-send-reminder-email-to-approver'
,p_execution_sequence=>30
,p_before_expire_interval=>'PT1M'
,p_on_event=>'BEFORE_EXPIRE'
,p_action_type=>'NATIVE_SEND_EMAIL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'body_html', wwv_flow_string.join(wwv_flow_t_varchar2(
    '<p>Hi &APEX$TASK_OWNER., please check your "My Approvals" inbox. The laptop request for &ENAME. requires your review ',
    '    and will expire shortly and be assigned to a colleague if you are unable to review it in a',
    '    timely manner. Thanks for your kind attention to this matter.</p>')),
  'body_plain_text', 'Hi &APEX$TASK_OWNER., please check your "My Approvals" inbox. The laptop request for &ENAME. requires your review and will expire shortly and be assigned to a colleague if you are unable to review it in a timely manner. Thanks for your kind attention'
||' to this matter.',
  'from', '&APP_EMAIL.',
  'send_immediately', 'N',
  'subject', 'Laptop Request for &ENAME. Requires Your Review',
  'to', '&DEMO_NOTIFICATION_EMAIL.')).to_clob
,p_stop_execution_on_error=>true
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>'apex_app_setting.get_value(''DEMO_NOTIFICATION_EMAIL'') is not null'
,p_condition_expr2=>'PLSQL'
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(1259704755412718431)
,p_task_def_id=>wwv_flow_imp.id(1259637593550539755)
,p_name=>'Push Email Queue for Sample'
,p_static_id=>'push-email-queue-for-sample'
,p_execution_sequence=>40
,p_before_expire_interval=>'PT1M'
,p_on_event=>'BEFORE_EXPIRE'
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>'apex_mail.push_queue;'
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
,p_condition_type=>'ITEM_IS_NOT_NULL'
,p_condition_expr1=>'DEMO_NOTIFICATION_EMAIL'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(3828131490313742)
,p_task_def_id=>wwv_flow_imp.id(1259637593550539755)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'PAT'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(3828267100313742)
,p_task_def_id=>wwv_flow_imp.id(1259637593550539755)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'eba_demo_appr.get_laptop_approver(:APEX$TASK_RENEWAL_COUNT)'
);
wwv_flow_imp.component_end;
end;
/
