prompt --application/pages/page_00022
begin
--   Manifest
--     PAGE: 00022
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
 p_id=>22
,p_name=>'Request Laptop'
,p_alias=>'REQUEST-LAPTOP'
,p_page_mode=>'MODAL'
,p_step_title=>'Request Laptop'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.items.P22_NEED_BY.dayFormatter = function (pDateISOString) {',
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
'apex.items.P22_NEED_BY.refresh();'))
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_dialog_width=>'340'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1874005147327004639)
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
 p_id=>wwv_flow_imp.id(1873998596558004611)
,p_plug_name=>'Request Laptop'
,p_static_id=>'request-laptop'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_APPR_LAPTOP_REQUESTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1260471539651881884)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1874005147327004639)
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
 p_id=>wwv_flow_imp.id(1260471971798881885)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(1874005147327004639)
,p_button_name=>'SUBMIT_FOR_APPROVAL'
,p_static_id=>'submit-for-approval'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'NEXT'
,p_button_condition=>'P22_EMPNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1873999541703004627)
,p_name=>'P22_EMPNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1873998596558004611)
,p_item_source_plug_id=>wwv_flow_imp.id(1873998596558004611)
,p_prompt=>'Employee'
,p_source=>'EMPNO'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'EBA_DEMO_CONF_EMP_LOV'
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1246733334218507253)
,p_name=>'P22_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1873998596558004611)
,p_item_source_plug_id=>wwv_flow_imp.id(1873998596558004611)
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1260866645373913409)
,p_name=>'P22_LAPTOP_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1873998596558004611)
,p_item_source_plug_id=>wwv_flow_imp.id(1873998596558004611)
,p_prompt=>'Laptop Type'
,p_source=>'LAPTOP_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'AVAILABLE_LAPTOP_TYPES'
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1260867141072913414)
,p_name=>'P22_MINIMUM_DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1873998596558004611)
,p_format_mask=>'YYYYMMDDHH24MI'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1260866744087913410)
,p_name=>'P22_NEED_BY'
,p_source_data_type=>'DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1873998596558004611)
,p_item_source_plug_id=>wwv_flow_imp.id(1873998596558004611)
,p_prompt=>'Need By'
,p_format_mask=>'YYYYMMDDHH24MI'
,p_source=>'NEED_BY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_and_behavior', 'MONTH-PICKER',
  'days_outside_month', 'VISIBLE',
  'display_as', 'INLINE',
  'max_date', 'NONE',
  'min_date', 'ITEM',
  'min_item', 'P22_MINIMUM_DATE',
  'multiple_months', 'N',
  'show_on', 'FOCUS',
  'show_time', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1260867217538913415)
,p_computation_sequence=>10
,p_computation_item=>'P22_MINIMUM_DATE'
,p_static_id=>'p22-minimum-date'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'SQL'
,p_computation=>'to_char((sysdate + 7) + case to_char(sysdate + 7, ''fmDay'',''NLS_DATE_LANGUAGE = AMERICAN'') when ''Saturday'' then 2 when ''Sunday'' then 1 else 0 end,''YYYYMMDDHH24MI'') min_date'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1260867040430913413)
,p_computation_sequence=>10
,p_computation_item=>'P22_NEED_BY'
,p_static_id=>'p22-need-by'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'SQL'
,p_computation=>'to_char((sysdate + 14) + case to_char(sysdate + 14, ''fmDay'',''NLS_DATE_LANGUAGE = AMERICAN'') when ''Saturday'' then 2 when ''Sunday'' then 1 else 0 end,''YYYYMMDDHH24MI'') min_date'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1260474579183881897)
,p_name=>'Cancel Dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1260471539651881884)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1260475154596881898)
,p_event_id=>wwv_flow_imp.id(1260474579183881897)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1260474256099881896)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SUBMIT_FOR_APPROVAL,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>614607877278872788
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1260470390994881883)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(1873998596558004611)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Request Salary Change'
,p_static_id=>'initialize-form-request-salary-change'
,p_internal_uid=>614604012173872775
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1260470850121881883)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(1873998596558004611)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Request Laptop'
,p_static_id=>'process-form-request-laptop'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>614604471300872775
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1260473357088881895)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_WORKFLOW'
,p_process_name=>'Start Laptop Request Workflow'
,p_static_id=>'start-laptop-request-workflow'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'START',
  'workflow_definition_id', wwv_flow_imp.id(1246729829155507218))).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1260471971798881885)
,p_internal_uid=>614606978267872787
);
wwv_flow_imp_shared.create_workflow_comp_param(
 p_id=>wwv_flow_imp.id(3834800242313881)
,p_page_process_id=>wwv_flow_imp.id(1260473357088881895)
,p_workflow_variable_id=>wwv_flow_imp.id(1246730556217507225)
,p_page_id=>22
,p_value_type=>'ITEM'
,p_value=>'P22_EMPNO'
);
wwv_flow_imp_shared.create_workflow_comp_param(
 p_id=>wwv_flow_imp.id(3834939842313881)
,p_page_process_id=>wwv_flow_imp.id(1260473357088881895)
,p_workflow_variable_id=>wwv_flow_imp.id(1246730637794507226)
,p_page_id=>22
,p_value_type=>'ITEM'
,p_value=>'P22_ID'
);
wwv_flow_imp_shared.create_workflow_comp_param(
 p_id=>wwv_flow_imp.id(3835006002313881)
,p_page_process_id=>wwv_flow_imp.id(1260473357088881895)
,p_workflow_variable_id=>wwv_flow_imp.id(1246730679972507227)
,p_page_id=>22
,p_value_type=>'ITEM'
,p_value=>'P22_LAPTOP_TYPE'
);
wwv_flow_imp.component_end;
end;
/
