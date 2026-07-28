prompt --application/pages/page_00008
begin
--   Manifest
--     PAGE: 00008
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
 p_id=>8
,p_name=>'Employees'
,p_alias=>'EMPLOYEES'
,p_step_title=>'Employees'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root {',
'   --a-cv-item-width: 24rem;',
'}'))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2254003341008210104)
,p_plug_name=>'About this page'
,p_static_id=>'about-this-page'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2665811232373458102
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This page shows all employees and allows a user to initiate a request ',
'    for a job change, salary change, or laptop by clicking the appropriate',
'    button on an employee''s card. Managers can initiate a request for an',
'    employee appraisal by clicking the (Appraisal) button on any of their',
'    subordinates'' cards.',
'</p>',
'<p>    ',
'    The respective buttons are hidden on a given employee''s card if the',
'    corresponding request is currently pending. In addition, the ',
'    <strong>Appraisal</strong> button only shows for <em>subordinates</em>',
'    of the currently logged-in user. ',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1572792102359814900)
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
 p_id=>wwv_flow_imp.id(1572790579723814895)
,p_plug_name=>'Employees'
,p_static_id=>'employees'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_plug_template=>2074200852440250129
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with reports as (',
'    select empno',
'        from (',
'            select empno, ename',
'              from eba_demo_appr_emp',
'              start with empno = :CURRENT_USER_EMPNO',
'              connect by prior empno = mgr',
'        )',
'    where empno != :CURRENT_USER_EMPNO',
')',
'select e.EMPNO,',
'       e.ENAME,',
'       e.JOB,',
'       e.SAL,',
'       CASE WHEN t1.task_id IS NOT NULL THEN ''Y'' ELSE ''N'' end as pending_sal_approval,',
'       CASE WHEN t2.task_id IS NOT NULL THEN ''Y'' ELSE ''N'' end as pending_job_approval,',
'       CASE WHEN t3.task_id IS NOT NULL THEN ''Y'' ELSE ''N'' end as pending_bank_approval,',
'       CASE WHEN lr.status IN (''PENDING'',''APPROVED'') THEN ''Y'' ELSE ''N'' end as pending_laptop_delivery,',
'       CASE WHEN a.id IS NULL and e.empno in (select empno from reports) THEN ''Y'' ELSE ''N'' end as is_direct_or_indirect_rep',
'  from EBA_DEMO_APPR_EMP e',
'  left outer join APEX_TASKS T1 ',
'    on t1.detail_pk = e.empno ',
'    and t1.application_id = :APP_ID ',
'    and t1.task_def_static_id = ''SALARY_CHANGE''',
'    and t1.state_code in (''UNASSIGNED'',''ASSIGNED'')',
'  left outer join APEX_TASKS T2 ',
'    on t2.detail_pk = e.empno ',
'    and t2.application_id = :APP_ID ',
'    and t2.task_def_static_id = ''JOB_CHANGE''',
'    and t2.state_code in (''UNASSIGNED'',''ASSIGNED'')',
'  left outer join APEX_TASKS T3',
'    on t3.detail_pk = e.empno ',
'    and t3.application_id = :APP_ID ',
'    and t3.task_def_static_id = ''BANK_ACCOUNT_CHANGE''',
'    and t3.state_code in (''UNASSIGNED'',''ASSIGNED'')',
'  left outer join EBA_DEMO_APPR_LAPTOP_REQUESTS LR ',
'    on lr.empno = e.empno ',
'    and lr.status in (''PENDING'',''APPROVED'')',
'   left outer join eba_demo_appr_appraisals a',
'    on a.empno = e.empno',
'    and add_months( last_day(sysdate) , -13) + 1 between a.period_start and a.period_end',
'where :P8_SHOW_ONLY_SUBORDINATES = ''N'' or e.empno in (select empno from reports)      '))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"itemName":"P8_ORDER_BY","orderBys":[{"key":"ENAME","expr":"ENAME"},{"key":"JOB","expr":"JOB"},{"key":"SAL","expr":"SAL DESC"}]}'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P8_SHOW_ONLY_SUBORDINATES'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_no_data_found=>'No employees to display'
,p_no_data_found_icon_classes=>'fa-user'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(962604797565330235)
,p_region_id=>wwv_flow_imp.id(1572790579723814895)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<strong>Job:</strong> &JOB.<br />',
'<strong>Salary:</strong> $&SAL.'))
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'ENAME'
,p_icon_position=>'END'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(962605366701330238)
,p_card_id=>wwv_flow_imp.id(962604797565330235)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>10
,p_label=>'Salary'
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::P4_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-edit'
,p_action_css_classes=>'t-Button--small'
,p_is_hot=>false
,p_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_condition_expr1=>'PENDING_SAL_APPROVAL'
,p_condition_expr2=>'N'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(962605900876330260)
,p_card_id=>wwv_flow_imp.id(962604797565330235)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>20
,p_label=>'Job'
,p_static_id=>'action-2'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::P7_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-edit'
,p_action_css_classes=>'t-Button--small'
,p_is_hot=>false
,p_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_condition_expr1=>'PENDING_JOB_APPROVAL'
,p_condition_expr2=>'N'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(331630960332823040)
,p_card_id=>wwv_flow_imp.id(962604797565330235)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>30
,p_label=>'Bank'
,p_static_id=>'action-3'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.::P28_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-building'
,p_action_css_classes=>'t-Button--small'
,p_is_hot=>false
,p_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_condition_expr1=>'PENDING_BANK_APPROVAL'
,p_condition_expr2=>'N'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(1223090206418827509)
,p_card_id=>wwv_flow_imp.id(962604797565330235)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>40
,p_label=>'Appraisal'
,p_static_id=>'action-4'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:16:P16_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-server-user'
,p_action_css_classes=>'t-Button--small'
,p_is_hot=>false
,p_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_condition_expr1=>'IS_DIRECT_OR_INDIRECT_REP'
,p_condition_expr2=>'Y'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(1260867627415913419)
,p_card_id=>wwv_flow_imp.id(962604797565330235)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>50
,p_label=>'Laptop'
,p_static_id=>'action-5'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:22:P22_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-laptop'
,p_action_css_classes=>'t-Button--small'
,p_is_hot=>false
,p_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_condition_expr1=>'PENDING_LAPTOP_DELIVERY'
,p_condition_expr2=>'N'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1181650557762049513)
,p_plug_name=>'Form Region'
,p_static_id=>'form-region'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3372714138756020509
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(962606502222330260)
,p_name=>'P8_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1572790579723814895)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'ENAME'
,p_prompt=>'Order By'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Name;ENAME,Job;JOB,Salary;SAL'
,p_cHeight=>1
,p_tag_css_classes=>'mnw160'
,p_grid_label_column_span=>0
,p_field_template=>2042262243893469891
,p_item_css_classes=>'u-pullRight'
,p_item_icon_css_classes=>'fa-sort-amount-desc'
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1495528914894018541)
,p_name=>'P8_SHOW_ONLY_SUBORDINATES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1572790579723814895)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'N'
,p_prompt=>'Show Only Subordinates?'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>2320077351817916916
,p_item_css_classes=>'u-align-self-center'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(962607214425330277)
,p_name=>'On Modal Dialog Closed'
,p_static_id=>'on-modal-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(962607713168330292)
,p_event_id=>wwv_flow_imp.id(962607214425330277)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1572790579723814895)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1495529070342018542)
,p_name=>'When Subordinates Switched'
,p_static_id=>'when-subordinates-switched'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_SHOW_ONLY_SUBORDINATES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1495529163654018543)
,p_event_id=>wwv_flow_imp.id(1495529070342018542)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1572790579723814895)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
