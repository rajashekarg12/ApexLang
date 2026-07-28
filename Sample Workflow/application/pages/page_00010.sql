prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
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
 p_id=>10
,p_name=>'Test Approver Assignment'
,p_alias=>'TEST-APPROVER-ASSIGNMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Test Approver Assignment'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_width=>'300'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1540307520125427189)
,p_plug_name=>'Test Salary Change Approver Assignments'
,p_static_id=>'test-salary-change-approver-assignments'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1271662488772022973)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(1540307520125427189)
,p_button_name=>'Test'
,p_static_id=>'test'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Test'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1271662882606022974)
,p_name=>'P10_EMPNO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1540307520125427189)
,p_prompt=>'Empno'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename||'' [''||job||'']'', empno',
'from eba_demo_appr_emp',
'order by ename'))
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1271663226309022984)
,p_name=>'P10_PROPOSED_SALARY'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1540307520125427189)
,p_prompt=>'Proposed Salary'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1271664467430022985)
,p_name=>'P10_TEST_RESULT_ADMIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1540307520125427189)
,p_prompt=>'Admin'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1271664065785022985)
,p_name=>'P10_TEST_RESULT_APPROVER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1540307520125427189)
,p_prompt=>'Approver'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1271669833164023007)
,p_name=>'When Test Button Clicked'
,p_static_id=>'when-test-button-clicked'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1271662488772022973)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1271670343155023010)
,p_event_id=>wwv_flow_imp.id(1271669833164023007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P10_TEST_RESULT_APPROVER,P10_TEST_RESULT_ADMIN',
  'items_to_submit', 'P10_EMPNO,P10_PROPOSED_SALARY',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'eba_demo_appr.validate_admin_and_approver(''SALARY_CHANGE'',',
    '                                          :P10_EMPNO,',
    '                                          :P10_PROPOSED_SALARY,',
    '                                          :P10_TEST_RESULT_ADMIN,',
    '                                          :P10_TEST_RESULT_APPROVER);',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1180548309347674032)
,p_event_id=>wwv_flow_imp.id(1271669833164023007)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.message.clearErrors();',
    'let approver_missing = $v(''P10_TEST_RESULT_APPROVER'') === '''';',
    'let admin_missing = $v(''P10_TEST_RESULT_ADMIN'') === '''';',
    'let problems = [];',
    'if (approver_missing) {',
    '    problems.push(',
    '        {',
    '            "type" : "error",',
    '            "location" : "page",',
    '            "message": ''No salary change approver was available to assign (after excluding your username). Check Approver participant entries.''',
    '        }',
    '    ); ',
    '}',
    'if (admin_missing) {',
    '    problems.push(',
    '        {',
    '            "type" : "error",',
    '            "location" : "page",',
    '            "message": ''No salary change admin was available to assign. Check Admin participant entries.''',
    '        }',
    '    );',
    '}',
    'if (problems.length > 0) {',
    '    apex.message.showErrors(problems);',
    '}',
    '')))).to_clob
);
wwv_flow_imp.component_end;
end;
/
