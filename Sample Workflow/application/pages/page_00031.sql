prompt --application/pages/page_00031
begin
--   Manifest
--     PAGE: 00031
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
 p_id=>31
,p_name=>'Workflow Diagram'
,p_alias=>'WORKFLOW-DIAGRAM'
,p_page_mode=>'MODAL'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.diagram-vstretch {',
'   height: calc( 100vh - 10rem);',
'}'))
,p_step_template=>2101883943284197310
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_required_role=>wwv_flow_imp.id(1256045581670493716)
,p_dialog_height=>'640'
,p_dialog_width=>'1000'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15896284337554477)
,p_plug_name=>'Workflow Diagram'
,p_static_id=>'workflow-diagram'
,p_region_name=>'workflow_diagram'
,p_region_css_classes=>'diagram-vstretch'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_WORKFLOW_DIAGRAM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_navigator', 'N',
  'initial_zoom', '0',
  'workflow_id', 'P31_CURRENT_WORKFLOW')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22046016081184382)
,p_name=>'P31_CURRENT_WORKFLOW'
,p_item_sequence=>10
,p_item_default=>'P31_WORKFLOW_ID'
,p_item_default_type=>'ITEM'
,p_prompt=>'Workflow'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select workflow_def_name, workflow_id',
'from apex_workflows',
'connect by prior workflow_id = parent_workflow_id',
'start with workflow_id = :P31_WORKFLOW_ID'))
,p_cHeight=>1
,p_field_template=>1610598304472262251
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15896345714554478)
,p_name=>'P31_WORKFLOW_ID'
,p_item_sequence=>40
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15896875769554483)
,p_name=>'P31_WORKFLOW_TITLE'
,p_item_sequence=>50
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(15896981839554484)
,p_computation_sequence=>10
,p_computation_item=>'P31_WORKFLOW_TITLE'
,p_static_id=>'p31-workflow-title'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select title',
'from apex_workflows',
'where workflow_id = :P31_WORKFLOW_ID'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(22046070275184383)
,p_name=>'On Change Current Workflow'
,p_static_id=>'on-change-current-workflow'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P31_CURRENT_WORKFLOW'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(22046165806184384)
,p_event_id=>wwv_flow_imp.id(22046070275184383)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Diagram'
,p_static_id=>'refresh-diagram'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(15896284337554477)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15896650649554481)
,p_name=>'Set Dialog Title to Workflow Title'
,p_static_id=>'set-dialog-title-to-workflow-title'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15896763740554482)
,p_event_id=>wwv_flow_imp.id(15896650649554481)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.util.getTopApex()',
    '         .jQuery(".ui-dialog-content")',
    '         .dialog("option", ',
    '                 "title",',
    '                 apex.items.P31_WORKFLOW_TITLE.value);')))).to_clob
);
wwv_flow_imp.component_end;
end;
/
