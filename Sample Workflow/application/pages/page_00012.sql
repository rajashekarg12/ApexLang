prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_page.create_page(
 p_id=>12
,p_name=>'Pending Approvals'
,p_alias=>'PENDING-APPROVALS'
,p_step_title=>'Pending Approvals'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.actions.add([',
'{',
'  name: "handle-task-deadlines-action",',
'  action: function( event, element, args)',
'  {',
'    // Trigger custom event to perform the server-side call',
'    $("body").trigger("handle-task-deadlines-event");',
'  }',
'},',
'{',
'  name: "refresh-action",',
'  action: function( event, element, args)',
'  {',
'    // Trigger custom event to perform the refresh',
'    $("body").trigger("refresh-event");',
'  }',
'}',
'])'))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3864197741890052116)
,p_plug_name=>'About this page'
,p_static_id=>'about-this-page'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2665811232373458102
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This page is handy for demo purposes since it shows the relevant approvers and administrators',
'    determined at task creation time for each pending approval task. Use this information',
'    to know which sample user to log in as to approve or administer a given approval task. ',
'</p>',
'<ul>',
'    <li>',
'        The Job Change approval task definition configures its participants at design time.',
'    </li>',
'    <li>',
'        The Salary Change approval task definition dynamically computes its participants at',
'        runtime by calling a PL/SQL function that uses the rows in the EBA_DEMO_APPR_APPROVERS',
'        table to determine the approvers and administrators based on the job code of',
'        the employee changing roles as well as the proposed new salary.',
'    </li>',
'    <li>',
'        The <em>Laptop Approval</em> approval task definition dynamically computes its participants at',
'        runtime by calling a PL/SQL function that uses the number of times the task has been',
'        renewed to determine to whom to assign it.',
'    </li>',
'</ul>',
'<p>',
'    Since by design the same user cannot approve an approval task they initiated, even if the',
'    current user <em>would</em> technically be a valid "potential owner" participant, their',
'    username won''t appear as an approver on a job or salary request they created.',
'</p>',
'<p>',
'    This page''s classic report region queries data from <strong>APEX_TASKS</strong>, ',
'    <strong>APEX_TASK_PARTICIPANTS</strong>, and ',
'    <strong>APEX_APPL_TASKDEFS</strong> views. It filters the list to only include approval',
'    tasks using the WHERE clause <code>TASK_TYPE_CODE = ''APPROVAL''</code>. Most applications ',
'    using approvals would typically only need one or more of the unified task list pages to allow',
'    end users to work with tasks. This sample includes <strong>My Tasks</strong>, ',
'    <strong>My Requests</strong>, and <strong>Approvals Administration</strong>',
'    unified task list pages for that purpose.',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(962828204015474625)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(1255848005933493449)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1525973518767024119)
,p_plug_name=>'Handle Deadlines and Refresh'
,p_static_id=>'handle-deadlines-and-refresh'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3372714138756020509
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'An hourly job handles task deadlines, but you can ',
'<a href="#action$handle-task-deadlines-action">handle them now</a>',
'or just',
'<a href="#action$refresh-action">update the list</a>.',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(962828855020474641)
,p_name=>'Pending Approvals'
,p_static_id=>'pending-approvals'
,p_template=>4073835273271169698
,p_display_sequence=>30
,p_region_css_classes=>'margin-top-md'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.task_id, ',
'       t.subject,',
'       t.priority,',
'       t.initiator,',
'       case ',
'            when t.state_code = ''ASSIGNED'' then ',
'                t.state||'' to ''||t.actual_owner',
'            when t.state_code = ''UNASSIGNED'' then ',
'                t.state||'' (''||eba_demo_appr.approvers_for_task(t.task_id)||'')''',
'            when t.state_code = ''EXPIRED'' then',
'                ''Expired after ''||',
unistr('                (select listagg(t3.actual_owner,''\2190'')'),
'                   from apex_tasks t3',
'                   connect by prior t3.previous_task_id = t3.task_id',
'                   start with t3.task_id = t.task_id)',
'        end status,',
'        eba_demo_appr.admins_for_task(t.task_id) as admins,',
'        t.due_on due_by,',
'        eba_demo_appr.details_task_url(',
'          p_url     => d.details_link_target,',
'          p_app_id  => d.application_id,',
'          p_task_id => t.task_id) details_link_target,',
'       due_in, ',
'       case ',
'          when due_in_hours <   0 then ''OVERDUE''',
'          when due_in_hours <   1 then ''NEXT_HOUR''',
'          when due_in_hours <  24 then ''NEXT_24_HOURS''',
'          when due_in_hours < 168 then ''NEXT_7_DAYS''',
'          when due_in_hours < 720 then ''NEXT_30_DAYS''',
'          else            ''MORE_THAN_30_DAYS''',
'      end due_code,',
'      case when state_code in (''COMPLETED'', ''CANCELED'') ',
'                                               then ''Y''',
'                                               else ''N''',
'                                          end is_completed         ',
'from (',
'select task_id,',
'       task_def_id,',
'       subject,',
'       priority,',
'       initiator,',
'       actual_owner,',
'       due_on,',
'       apex_util.get_since(due_on) due_in,',
'       round((cast(due_on as date) - sysdate) * 24, 1) due_in_hours,',
'       state_code,',
'       state,',
'       task_type_code,',
'       application_id',
'       from apex_Tasks',
') t',
'left join apex_appl_taskdefs d on d.task_def_id = t.task_def_id',
'where t.application_id = :APP_ID',
'  and t.task_type_code = ''APPROVAL''',
'  and (',
'        (t.state_code in (''UNASSIGNED'',''ASSIGNED'')',
'      or',
'      (',
'          t.state_code = ''EXPIRED'' ',
'           and not exists (select 1 ',
'                             from apex_tasks t2 ',
'                            where previous_task_id = t.task_id)',
'      )',
'      ))',
'order by due_by'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No pending approvals'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1180547890811674028)
,p_query_column_id=>6
,p_column_alias=>'ADMINS'
,p_column_display_sequence=>51
,p_column_heading=>'Admins'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1160560804540292111)
,p_query_column_id=>8
,p_column_alias=>'DETAILS_LINK_TARGET'
,p_column_display_sequence=>71
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(962598739441289124)
,p_query_column_id=>7
,p_column_alias=>'DUE_BY'
,p_column_display_sequence=>61
,p_column_heading=>'Due'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if !IS_COMPLETED/}',
'    {case DUE_CODE/}',
'        {when OVERDUE/}',
'            <strong class="u-danger-text">#DUE_IN#</strong>',
'        {when NEXT_HOUR/}',
'            <strong class="u-danger-text">#DUE_IN#</strong>',
'        {when NEXT_24_HOURS/}',
'            <span class="u-danger-text">#DUE_IN#</span>',
'        {otherwise/}',
'            {if DUE_IN/}<span>#DUE_IN#</span>{endif/}',
'    {endcase/}',
'{endif/} '))
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1525974329748024127)
,p_query_column_id=>10
,p_column_alias=>'DUE_CODE'
,p_column_display_sequence=>101
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1525974195690024126)
,p_query_column_id=>9
,p_column_alias=>'DUE_IN'
,p_column_display_sequence=>91
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1525974126758024125)
,p_query_column_id=>4
,p_column_alias=>'INITIATOR'
,p_column_display_sequence=>31
,p_column_heading=>'Requester'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1525974470851024128)
,p_query_column_id=>11
,p_column_alias=>'IS_COMPLETED'
,p_column_display_sequence=>111
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(962598424993289121)
,p_query_column_id=>3
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>21
,p_column_heading=>'Priority'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(962598560584289122)
,p_query_column_id=>5
,p_column_alias=>'STATUS'
,p_column_display_sequence=>41
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(962598331714289120)
,p_query_column_id=>2
,p_column_alias=>'SUBJECT'
,p_column_display_sequence=>11
,p_column_heading=>'Subject'
,p_column_link=>'#DETAILS_LINK_TARGET#'
,p_column_linktext=>'#SUBJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(962829187167474657)
,p_query_column_id=>1
,p_column_alias=>'TASK_ID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1525973584376024120)
,p_name=>'Handle Task Deadlines'
,p_static_id=>'handle-task-deadlines'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'handle-task-deadlines-event'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1525973755381024121)
,p_event_id=>wwv_flow_imp.id(1525973584376024120)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Handle Task Deadlines'
,p_static_id=>'handle-task-deadlines'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', 'apex_approval.handle_task_deadlines;',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1525973779114024122)
,p_event_id=>wwv_flow_imp.id(1525973584376024120)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Pending Approvals'
,p_static_id=>'refresh-pending-approvals'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(962828855020474641)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1525973975646024123)
,p_name=>'Refresh Approvals List'
,p_static_id=>'refresh-approvals-list'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'refresh-event'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1525974004298024124)
,p_event_id=>wwv_flow_imp.id(1525973975646024123)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Pending Approvals'
,p_static_id=>'refresh-pending-approvals'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(962828855020474641)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1525975827158024142)
,p_name=>'When Dialog Closed'
,p_static_id=>'when-dialog-closed'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(962828855020474641)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1525975892695024143)
,p_event_id=>wwv_flow_imp.id(1525975827158024142)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(962828855020474641)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
