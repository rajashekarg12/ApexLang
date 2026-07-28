prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
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
 p_id=>14
,p_name=>'More Information'
,p_alias=>'MORE-INFORMATION'
,p_step_title=>'More Information'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.is-markdownified code {',
'   background-color: inherit !important;',
'   border-style: none !important;',
'}'))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1184774046734195485)
,p_plug_name=>'Approvals and Tasks Features'
,p_static_id=>'approvals-and-tasks-features'
,p_parent_plug_id=>wwv_flow_imp.id(1180548421659674033)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3372714138756020509
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'PLUGIN_MARKDOWN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'file_name', 'AboutTheApprovalsFeature.md',
  'source', 'APPLICATION_STATIC_FILE')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1184773427720195483)
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
 p_id=>wwv_flow_imp.id(1180548421659674033)
,p_plug_name=>'More Information'
,p_static_id=>'more-information'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>3224648155363603145
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    The <em>Sample Workflow, Approvals, and Tasks</em> app illustrates',
'    the key functionality of the Oracle APEX Workflow, Approvals, and Tasks components. ',
'    It lets users manage requests to change an employee''s salary, job, and bank acount,',
'    as well as request a new laptop, after getting the approval of an appropriate individual. ',
'    Managers can also initiate a subordinate''s appraisal process.',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1180548568296674034)
,p_plug_name=>'Sample Application'
,p_static_id=>'sample-application'
,p_parent_plug_id=>wwv_flow_imp.id(1180548421659674033)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3372714138756020509
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'PLUGIN_MARKDOWN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'file_name', 'AboutTheSampleApplication.md',
  'source', 'APPLICATION_STATIC_FILE')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1525975735938024141)
,p_plug_name=>'Using the Sample'
,p_static_id=>'using-the-sample'
,p_parent_plug_id=>wwv_flow_imp.id(1180548421659674033)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3372714138756020509
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'PLUGIN_MARKDOWN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'file_name', 'UsingTheSample.md',
  'source', 'APPLICATION_STATIC_FILE')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1525973402409024118)
,p_plug_name=>'Workflow Features'
,p_static_id=>'workflow-features'
,p_parent_plug_id=>wwv_flow_imp.id(1180548421659674033)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3372714138756020509
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'PLUGIN_MARKDOWN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'file_name', 'AboutTheWorkflowFeature.md',
  'source', 'APPLICATION_STATIC_FILE')).to_clob
);
wwv_flow_imp.component_end;
end;
/
