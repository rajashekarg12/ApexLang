prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Request Employee Appraisal '
,p_alias=>'REQUEST-EMPLOYEE-APPRAISAL'
,p_page_mode=>'MODAL'
,p_step_title=>'Request Appraisal for'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''.ui-dialog-title'', ',
'   parent ? parent.document ',
'          : document).text(',
'             ''Request Appraisal for '' + ',
'             apex.items.P16_ENAME.value );',
'',
'apex.items.P16_APPRAISAL_DATE.dayFormatter = function (pDateISOString) {',
'  const day = apex.date.parse(pDateISOString, "YYYY-MM-DD").getDay();',
'  return {',
'      // disable when day is Saturday or Sunday',
'      disabled: [0, 6].includes(day),',
'      // set a styling css class like u-danger-text',
'      class: null,',
'      // set a tooltip that is shown on hover',
'      tooltip: null',
'  };',
'};',
'apex.items.P16_APPRAISAL_DATE.refresh();             '))
,p_inline_css=>'.a-DatePicker { flex-grow: 1; }'
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_width=>'400'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1837920428253463420)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2127905476394690047
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1837913877484463392)
,p_plug_name=>'Request Appraisal Input'
,p_static_id=>'request-appraisal-input'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_APPR_APPRAISALS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1224386661761340661)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1837920428253463420)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_show_as_disabled=>false
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1224387008874340661)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(1837920428253463420)
,p_button_name=>'SUBMIT_APPRAISAL'
,p_static_id=>'submit-appraisal'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'NEXT'
,p_grid_new_row=>'Y'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1223090625153827513)
,p_name=>'P16_APPRAISAL_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1837913877484463392)
,p_item_source_plug_id=>wwv_flow_imp.id(1837913877484463392)
,p_item_default=>'sysdate + 14'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Appraisal Date'
,p_source=>'APPRAISAL_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_grid_row_css_classes=>'u-align-items-center'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'INLINE',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1495528050702018532)
,p_name=>'P16_APPRAISAL_PERIOD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1837913877484463392)
,p_prompt=>'Appraisal Period'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1837914779855463405)
,p_name=>'P16_EMPNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1837913877484463392)
,p_item_source_plug_id=>wwv_flow_imp.id(1837913877484463392)
,p_source=>'EMPNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1495528704624018539)
,p_name=>'P16_ENAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1837913877484463392)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1223090306350827510)
,p_name=>'P16_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1837913877484463392)
,p_item_source_plug_id=>wwv_flow_imp.id(1837913877484463392)
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1223090512877827512)
,p_name=>'P16_PERIOD_END'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1837913877484463392)
,p_item_source_plug_id=>wwv_flow_imp.id(1837913877484463392)
,p_item_default=>'add_months( last_day(sysdate) , -1) '
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'PERIOD_END'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1223090440672827511)
,p_name=>'P16_PERIOD_START'
,p_source_data_type=>'DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1837913877484463392)
,p_item_source_plug_id=>wwv_flow_imp.id(1837913877484463392)
,p_item_default=>'add_months( last_day(sysdate) , -13) +1'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'PERIOD_START'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1495528814282018540)
,p_computation_sequence=>10
,p_computation_item=>'P16_ENAME'
,p_static_id=>'p16-ename'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename',
'from eba_demo_appr_emp',
'where empno = :P16_EMPNO'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1224389728219340668)
,p_name=>'Cancel Dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1224386661761340661)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1224390195708340669)
,p_event_id=>wwv_flow_imp.id(1224389728219340668)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1224389352314340667)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SUBMIT_APPRAISAL,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>578522973493331559
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1495528123434018533)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Compute Appraisal Period'
,p_static_id=>'compute-appraisal-period'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'EBA_DEMO_APPR',
  'package_method', 'APPRAISAL_PERIOD',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_internal_uid=>849661744613009425
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1495528622476018538)
,p_page_process_id=>wwv_flow_imp.id(1495528123434018533)
,p_page_id=>16
,p_name=>'p_end_date'
,p_direction=>'IN'
,p_data_type=>'DATE'
,p_has_default=>false
,p_display_sequence=>30
,p_value_type=>'ITEM'
,p_value=>'P16_PERIOD_END'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1495528542292018537)
,p_page_process_id=>wwv_flow_imp.id(1495528123434018533)
,p_page_id=>16
,p_name=>'p_start_date'
,p_direction=>'IN'
,p_data_type=>'DATE'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'ITEM'
,p_value=>'P16_PERIOD_START'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1495528239284018534)
,p_page_process_id=>wwv_flow_imp.id(1495528123434018533)
,p_page_id=>16
,p_param_type=>'FUNCTION_RESULT'
,p_direction=>'OUT'
,p_data_type=>'VARCHAR2'
,p_ignore_output=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P16_APPRAISAL_PERIOD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1224385537663340659)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(1837913877484463392)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Request Salary Change'
,p_static_id=>'initialize-form-request-salary-change'
,p_internal_uid=>578519158842331551
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1224385949341340660)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(1837913877484463392)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form RequestAppraisal Input'
,p_static_id=>'process-form-requestappraisal-input'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>578519570520331552
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1224388473998340666)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_WORKFLOW'
,p_process_name=>'Start Employee Appraisal Workflow'
,p_static_id=>'start-employee-appraisal-workflow'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'details_primary_key_item', 'P16_ID',
  'type', 'START',
  'workflow_definition_id', wwv_flow_imp.id(1495529844731018550))).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1224387008874340661)
,p_internal_uid=>578522095177331558
);
wwv_flow_imp_shared.create_workflow_comp_param(
 p_id=>wwv_flow_imp.id(3833158740313874)
,p_page_process_id=>wwv_flow_imp.id(1224388473998340666)
,p_workflow_variable_id=>wwv_flow_imp.id(1515754494707040019)
,p_page_id=>16
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>':P16_ENAME ||'' (''|| :P16_APPRAISAL_PERIOD ||'')'''
);
wwv_flow_imp.component_end;
end;
/
