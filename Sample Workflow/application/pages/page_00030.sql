prompt --application/pages/page_00030
begin
--   Manifest
--     PAGE: 00030
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
 p_id=>30
,p_name=>'Workflow Dashboard'
,p_alias=>'WORKFLOW-DASHBOARD'
,p_step_title=>'Workflow Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(1256045581670493716)
,p_protection_level=>'C'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21086602437919698)
,p_plug_name=>'Active Workflows'
,p_static_id=>'active-workflows'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2'
,p_plug_template=>2323592004483952560
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21090092993919701)
,p_plug_name=>'Activities'
,p_static_id=>'activities'
,p_region_name=>'active-workload-details'
,p_parent_plug_id=>wwv_flow_imp.id(21086602437919698)
,p_region_template_options=>'#DEFAULT#:js-headingLevel-3:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(21090472121919702)
,p_region_id=>wwv_flow_imp.id(21090092993919701)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'Please select a Workflow in the Overview region to see further details'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(21091016869919703)
,p_chart_id=>wwv_flow_imp.id(21090472121919702)
,p_static_id=>'activities'
,p_seq=>10
,p_name=>'Activities'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name activity, count(distinct(workflow_id)) instances ',
'  from apex_workflow_activities',
' where state in (''WAITING'',''ACTIVE'')',
'   and workspace_id = :WORKSPACE_ID',
'   and workflow_def_name = :P30_ACTIVE_DEF_NAME',
' group by name'))
,p_ajax_items_to_submit=>'P30_ACTIVE_DEF_NAME'
,p_series_type=>'bar'
,p_items_value_column_name=>'INSTANCES'
,p_items_label_column_name=>'ACTIVITY'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(21091527300919703)
,p_chart_id=>wwv_flow_imp.id(21090472121919702)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Activities'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(21092157239919703)
,p_chart_id=>wwv_flow_imp.id(21090472121919702)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Instances'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_step=>1
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21097143464919707)
,p_plug_name=>'Activities'
,p_static_id=>'activities-2'
,p_region_name=>'fault-workload-details'
,p_parent_plug_id=>wwv_flow_imp.id(21093666522919704)
,p_region_template_options=>'#DEFAULT#:js-headingLevel-3:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(21097585845919707)
,p_region_id=>wwv_flow_imp.id(21097143464919707)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'Please select a Workflow in the Overview region to see further details'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(21098027606919707)
,p_chart_id=>wwv_flow_imp.id(21097585845919707)
,p_static_id=>'activities'
,p_seq=>10
,p_name=>'Activities'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name activity, count(distinct(workflow_id)) instances ',
'  from apex_workflow_activities',
'where state = ''FAULTED''',
'   and workspace_id = :WORKSPACE_ID',
'   and workflow_def_name = :P30_FAULT_DEF_NAME',
' group by name'))
,p_ajax_items_to_submit=>'P30_FAULT_DEF_NAME'
,p_series_type=>'bar'
,p_items_value_column_name=>'INSTANCES'
,p_items_label_column_name=>'ACTIVITY'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(21098702526919707)
,p_chart_id=>wwv_flow_imp.id(21097585845919707)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Activities'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(21099254135919707)
,p_chart_id=>wwv_flow_imp.id(21097585845919707)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Instances'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_step=>1
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21101173978919708)
,p_plug_name=>'Average Completion Time'
,p_static_id=>'average-completion-time'
,p_region_name=>'performance-chart'
,p_parent_plug_id=>wwv_flow_imp.id(21100741674919708)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'N'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_landmark_type=>'region'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(21102522348919711)
,p_region_id=>wwv_flow_imp.id(21101173978919708)
,p_chart_type=>'bar'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_time_axis_type=>'auto'
,p_no_data_found_message=>'No Completed or Terminated Workflows found'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(21102975007919712)
,p_chart_id=>wwv_flow_imp.id(21102522348919711)
,p_static_id=>'average-completion-time'
,p_seq=>10
,p_name=>'Average Completion Time'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  workflow_def_name,',
'  avg( duration_seconds ) / ',
'  case :P30_TIME_UNIT',
'        when ''SEC'' then 1',
'        when ''MIN'' then 60',
'        when ''HOUR'' then 3600',
'        when ''DAY'' then ( 3600 * 24 )',
'   end  as avg_time',
' from table ( apex_workflow.get_workflows (',
'                   p_context => ''MY_WORKFLOWS''',
'                   --, p_application_id => :APP_ID',
'                   ) )    ',
'where state_code in (''COMPLETED'',''TERMINATED'')        ',
'group by workflow_def_name'))
,p_max_row_count=>50
,p_ajax_items_to_submit=>'P30_TIME_UNIT'
,p_series_type=>'bar'
,p_items_value_column_name=>'AVG_TIME'
,p_items_label_column_name=>'WORKFLOW_DEF_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(21103601787919713)
,p_chart_id=>wwv_flow_imp.id(21102522348919711)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Workflows'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(21104195778919713)
,p_chart_id=>wwv_flow_imp.id(21102522348919711)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Average Completion Time'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21079539479919687)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(1255848005933493449)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21082954069919692)
,p_plug_name=>'Details'
,p_static_id=>'details'
,p_region_name=>'workflow-state-details'
,p_parent_plug_id=>wwv_flow_imp.id(21080707925919688)
,p_region_template_options=>'#DEFAULT#:js-headingLevel-3:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_landmark_type=>'region'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(21083355935919693)
,p_region_id=>wwv_flow_imp.id(21082954069919692)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'Please select a workflow state in the Overview chart to see further details'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(21083884558919694)
,p_chart_id=>wwv_flow_imp.id(21083355935919693)
,p_static_id=>'instances-per-workflow'
,p_seq=>10
,p_name=>'Instances Per Workflow'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select workflow_def_name, count(workflow_id) instances  ',
'  from table ( apex_workflow.get_workflows (',
'                   p_context => ''MY_WORKFLOWS''',
'                   --, p_application_id => :APP_ID',
'                   ) )',
'   where state=:P30_STATE',
'   group by workflow_def_name;                '))
,p_ajax_items_to_submit=>'P30_STATE'
,p_series_type=>'bar'
,p_items_value_column_name=>'INSTANCES'
,p_items_label_column_name=>'WORKFLOW_DEF_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(21084475597919696)
,p_chart_id=>wwv_flow_imp.id(21083355935919693)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Workflows'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(21085036174919697)
,p_chart_id=>wwv_flow_imp.id(21083355935919693)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Instances'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_step=>1
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21093666522919704)
,p_plug_name=>'Faulted Workflows'
,p_static_id=>'faulted-workflows'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2'
,p_plug_template=>2323592004483952560
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21081047342919690)
,p_plug_name=>'Overview'
,p_static_id=>'overview'
,p_parent_plug_id=>wwv_flow_imp.id(21080707925919688)
,p_region_template_options=>'#DEFAULT#:js-headingLevel-3:t-Region--scrollBody'
,p_escape_on_http_output=>'N'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_landmark_type=>'region'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(21081905484919691)
,p_region_id=>wwv_flow_imp.id(21081047342919690)
,p_chart_type=>'pie'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(21082419758919691)
,p_chart_id=>wwv_flow_imp.id(21081905484919691)
,p_static_id=>'overview-series'
,p_seq=>10
,p_name=>'Overview Series'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select state, count(workflow_id) workflows ',
'  from table ( apex_workflow.get_workflows (',
'                   p_context => ''MY_WORKFLOWS''',
'                   --, p_application_id => :APP_ID',
'                   ) )              ',
' group by state               '))
,p_max_row_count=>20
,p_series_type=>'pie'
,p_items_value_column_name=>'WORKFLOWS'
,p_items_label_column_name=>'STATE'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:apex.item(''P30_STATE'').setValue(''&STATE!JS.'');'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21087014422919699)
,p_plug_name=>'Overview'
,p_static_id=>'overview-2'
,p_parent_plug_id=>wwv_flow_imp.id(21086602437919698)
,p_region_template_options=>'#DEFAULT#:js-headingLevel-3:t-Region--scrollBody'
,p_region_attributes=>'aria-controls="active-workload-details"'
,p_escape_on_http_output=>'N'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(21087803352919699)
,p_region_id=>wwv_flow_imp.id(21087014422919699)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No Active Workflows found'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(21088317273919700)
,p_chart_id=>wwv_flow_imp.id(21087803352919699)
,p_static_id=>'workflows'
,p_seq=>10
,p_name=>'Workflows'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select workflow_def_name, ',
'       count(workflow_id) workflows ',
'  from table ( apex_workflow.get_workflows (',
'                   p_context => ''MY_WORKFLOWS''',
'                   --, p_application_id => :APP_ID',
'                   ) )',
'where state_code in (''ACTIVE'',''SUSPENDED'') ',
'group by workflow_def_name               '))
,p_max_row_count=>20
,p_series_type=>'bar'
,p_items_value_column_name=>'WORKFLOWS'
,p_items_label_column_name=>'WORKFLOW_DEF_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:apex.item(''P30_ACTIVE_DEF_NAME'').setValue(''&WORKFLOW_DEF_NAME!JS.'');'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(21088911451919701)
,p_chart_id=>wwv_flow_imp.id(21087803352919699)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Workflows'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(21089481420919701)
,p_chart_id=>wwv_flow_imp.id(21087803352919699)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Instances'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_step=>1
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21094072242919705)
,p_plug_name=>'Overview'
,p_static_id=>'overview-3'
,p_parent_plug_id=>wwv_flow_imp.id(21093666522919704)
,p_region_template_options=>'#DEFAULT#:js-headingLevel-3:t-Region--scrollBody'
,p_region_attributes=>'aria-controls="fault-workload-details"'
,p_escape_on_http_output=>'N'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(21094917088919705)
,p_region_id=>wwv_flow_imp.id(21094072242919705)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No Faulted Workflows found'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(21095377013919706)
,p_chart_id=>wwv_flow_imp.id(21094917088919705)
,p_static_id=>'workflows'
,p_seq=>10
,p_name=>'Workflows'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select workflow_def_name, ',
'       count(workflow_id) workflows ',
'  from table ( apex_workflow.get_workflows (',
'                   p_context => ''MY_WORKFLOWS''',
'                   --, p_application_id => :APP_ID',
'                   ) )',
'where state_code = ''FAULTED''',
'group by workflow_def_name               '))
,p_max_row_count=>20
,p_series_type=>'bar'
,p_items_value_column_name=>'WORKFLOWS'
,p_items_label_column_name=>'WORKFLOW_DEF_NAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'javascript:apex.item(''P30_FAULT_DEF_NAME'').setValue(''&WORKFLOW_DEF_NAME!JS.'');'
,p_link_target_type=>'REDIRECT_URL'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(21095970625919706)
,p_chart_id=>wwv_flow_imp.id(21094917088919705)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Workflows'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(21096603473919706)
,p_chart_id=>wwv_flow_imp.id(21094917088919705)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Instances'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_step=>1
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21100741674919708)
,p_plug_name=>'Performance'
,p_static_id=>'performance'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2'
,p_plug_template=>2323592004483952560
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21080294266919687)
,p_plug_name=>'Region Display Selector'
,p_static_id=>'region-display-selector'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3372714138756020509
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21080707925919688)
,p_plug_name=>'Workflows By State'
,p_static_id=>'workflows-by-state'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2'
,p_region_attributes=>'aria-controls="workflow-state-details"'
,p_plug_template=>2323592004483952560
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21087381142919699)
,p_name=>'P30_ACTIVE_DEF_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(21087014422919699)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21094492692919705)
,p_name=>'P30_FAULT_DEF_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(21094072242919705)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21081482575919690)
,p_name=>'P30_STATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(21081047342919690)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21101595986919709)
,p_name=>'P30_TIME_UNIT'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(21101173978919708)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'HOUR'
,p_prompt=>'Time Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'WORKFLOW_CHARTS.LOV.TIME_UNIT'
,p_cHeight=>1
,p_tag_attributes=>'aria-controls="performance-chart"'
,p_field_template=>1610598304472262251
,p_item_template_options=>'t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_help_text=>'Select the time unit to display within the Performance chart.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(21092789971919704)
,p_name=>'Refresh Activities'
,p_static_id=>'refresh-activities'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_ACTIVE_DEF_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21093128728919704)
,p_event_id=>wwv_flow_imp.id(21092789971919704)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(21090092993919701)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(21099830438919707)
,p_name=>'Refresh Activities'
,p_static_id=>'refresh-activities-2'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_FAULT_DEF_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21100321898919708)
,p_event_id=>wwv_flow_imp.id(21099830438919707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(21097143464919707)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(21104793303919714)
,p_name=>'Refresh Performance Chart'
,p_static_id=>'refresh-performance-chart'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_TIME_UNIT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21105147728919714)
,p_event_id=>wwv_flow_imp.id(21104793303919714)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(21101173978919708)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(21085633726919698)
,p_name=>'Refresh Workflow Per State Details Region'
,p_static_id=>'refresh-workflow-per-state-details-region'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_STATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21086097811919698)
,p_event_id=>wwv_flow_imp.id(21085633726919698)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(21082954069919692)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
