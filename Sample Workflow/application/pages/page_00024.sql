prompt --application/pages/page_00024
begin
--   Manifest
--     PAGE: 00024
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
 p_id=>24
,p_name=>'Sample Login'
,p_alias=>'SAMPLE-LOGIN'
,p_step_title=>'Sample Login'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'table.overview td:first-child {',
'  text-align: right;',
'}',
'table.overview td {',
'  padding: 1em;',
'}',
'.left-side {',
'  min-width: 150px',
'}',
''))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1463086077775738844)
,p_plug_name=>'Demo Purposes Only Login'
,p_static_id=>'demo-purposes-only-login'
,p_region_name=>'userTree'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when connect_by_isleaf = 1 then 0',
'            when level = 1             then 1',
'            else                           -1',
'       end          as status, ',
'       level, ',
'       e.ename      as title, ',
'       ''fa ''||case when d.deptno = 40 ',
'                   then ''fa-user-headset'' ',
'                   else ''fa-user''',
'              end   as icon, ',
'       e.empno      as value, ',
'       null         as tooltip, ',
'       null         as link ',
'from eba_demo_appr_emp e',
'left outer join eba_demo_appr_dept d',
'             on d.deptno = e.deptno ',
'start with mgr is null',
'connect by prior empno = mgr',
'order siblings by ename'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_JSTREE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'activate_node_link_with', 'S',
  'default_icon_css_class', 'icon-tree-folder',
  'hierarchy_level_column', 'LEVEL',
  'icon_css_class_column', 'ICON',
  'icon_type_css_class', 'a-Icon',
  'link_column', 'LINK',
  'node_label_column', 'TITLE',
  'node_status_column', 'STATUS',
  'node_value_column', 'VALUE',
  'selected_node_page_item', 'P24_SELECTED_EMPNO',
  'tree_hierarchy', 'LEVEL',
  'tree_tooltip', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1463085851926738842)
,p_plug_name=>'Info'
,p_static_id=>'info'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info:t-Alert--accessibleHeading'
,p_plug_template=>2042159785845301134
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<p>You are not currently logged in. To login, select a user and click the (Login) button.</p>'
,p_plug_display_condition_type=>'USER_IS_PUBLIC_USER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1463085928362738843)
,p_plug_name=>'Info'
,p_static_id=>'info-2'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info:t-Alert--accessibleHeading'
,p_plug_template=>2042159785845301134
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<p>You are currently logged in as &APP_USER.. To switch user, select a different user and click the (Login) button.</p>'
,p_plug_display_condition_type=>'USER_IS_NOT_PUBLIC_USER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1525973292915024117)
,p_plug_name=>'Operations Team'
,p_static_id=>'operations-team'
,p_parent_plug_id=>wwv_flow_imp.id(1545678119227749638)
,p_icon_css_classes=>'fa-user-headset'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2675494171183407654
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1545678119227749638)
,p_plug_name=>'Right Side'
,p_static_id=>'right-side'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1545678065481749637)
,p_plug_name=>'Team Members'
,p_static_id=>'team-members'
,p_parent_plug_id=>wwv_flow_imp.id(1545678119227749638)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Everyone on the operations team helps with laptop order management and can review the status of workflows.</p>',
'<table class="overview">',
'    <tr>',
'        <td><strong>JANE</strong></td>',
'        <td>Initial assignee for laptop approvals. </td>',
'    </tr>',
'    <tr>',
'        <td><strong>STEVE</strong></td>',
'        <td>Second assignee for laptop approvals when first approval expires.</td>',
'    </tr>',
'    <tr>',
'        <td><strong>BO</strong></td>',
'        <td>Third assignee for laptop approvals when second approval expires.</td>',
'    </tr>',
'    <tr>',
'        <td><strong>PAT</strong></td>',
'        <td>Workflow and task administrator.</td>',
'    </tr>',
'</table>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1463086568688738849)
,p_button_sequence=>80
,p_button_name=>'LOGIN'
,p_static_id=>'login'
,p_button_static_id=>'loginButton'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Login'
,p_button_css_classes=>'margin-top-md'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1495526312808018515)
,p_name=>'P24_SELECTED_EMPNO'
,p_item_sequence=>70
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1463086313455738847)
,p_name=>'P24_SELECTED_USERNAME'
,p_item_sequence=>60
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1495526412949018516)
,p_computation_sequence=>10
,p_computation_item=>'P24_SELECTED_EMPNO'
,p_static_id=>'p24-selected-empno'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'CURRENT_USER_EMPNO'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1495526509496018517)
,p_computation_sequence=>20
,p_computation_item=>'P24_SELECTED_USERNAME'
,p_static_id=>'p24-selected-username'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_USER.'
,p_compute_when_type=>'USER_IS_PUBLIC_USER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1495525943204018511)
,p_name=>'Expand Tree'
,p_static_id=>'expand-tree'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1495526044431018512)
,p_event_id=>wwv_flow_imp.id(1495525943204018511)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_name=>'Expand Tree'
,p_static_id=>'expand-tree'
,p_action=>'NATIVE_TREE_EXPAND'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1463086077775738844)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1463086097738738845)
,p_name=>'When Node Changed'
,p_static_id=>'when-node-changed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(1463086077775738844)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_JSTREE|REGION TYPE|treeviewselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1463086417011738848)
,p_event_id=>wwv_flow_imp.id(1463086097738738845)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'Hide Login Button for Current User'
,p_static_id=>'hide-login-button-for-current-user'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(1463086568688738849)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P24_SELECTED_USERNAME'
,p_client_condition_expression=>'&APP_USER.'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1463086751397738851)
,p_event_id=>wwv_flow_imp.id(1463086097738738845)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Login Button'
,p_static_id=>'refresh-login-button'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#loginButton'
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P24_SELECTED_USERNAME'
,p_client_condition_expression=>'&APP_USER.'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1463086194459738846)
,p_event_id=>wwv_flow_imp.id(1463086097738738845)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Save Selected Emp in Page Item'
,p_static_id=>'save-selected-emp-in-page-item'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P24_SELECTED_USERNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_expression', 'apex.region("userTree").call("getSelectedNodes")[0]?.label',
  'suppress_change_event', 'N',
  'type', 'JAVASCRIPT_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1463086624559738850)
,p_event_id=>wwv_flow_imp.id(1463086097738738845)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_name=>'Show Login Button for Other User'
,p_static_id=>'show-login-button-for-other-user'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(1463086568688738849)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P24_SELECTED_USERNAME'
,p_client_condition_expression=>'&APP_USER.'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1495526101154018513)
,p_event_id=>wwv_flow_imp.id(1463086097738738845)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'Update Login Button Label'
,p_static_id=>'update-login-button-label'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("#loginButton span").text(''Login as ''+$v(''P24_SELECTED_USERNAME''));')).to_clob
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P24_SELECTED_USERNAME'
,p_client_condition_expression=>'&APP_USER.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1463087242435738856)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Login'
,p_static_id=>'login'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_AUTHENTICATION',
  'package_method', 'LOGIN',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>817220863614729748
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1463087421509738858)
,p_page_process_id=>wwv_flow_imp.id(1463087242435738856)
,p_page_id=>24
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>20
,p_value_type=>'NULL'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1495525846250018510)
,p_page_process_id=>wwv_flow_imp.id(1463087242435738856)
,p_page_id=>24
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>40
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1495525777649018509)
,p_page_process_id=>wwv_flow_imp.id(1463087242435738856)
,p_page_id=>24
,p_name=>'p_uppercase_username'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>30
,p_value_type=>'STATIC'
,p_value=>'TRUE'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1463087354895738857)
,p_page_process_id=>wwv_flow_imp.id(1463087242435738856)
,p_page_id=>24
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'ITEM'
,p_value=>'P24_SELECTED_USERNAME'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1463086846433738852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Set Username Cookie'
,p_static_id=>'set-username-cookie'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_AUTHENTICATION',
  'package_method', 'SEND_LOGIN_USERNAME_COOKIE',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>817220467612729744
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1463087146600738855)
,p_page_process_id=>wwv_flow_imp.id(1463086846433738852)
,p_page_id=>24
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>30
,p_value_type=>'STATIC'
,p_value=>'FALSE'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1463087008207738854)
,p_page_process_id=>wwv_flow_imp.id(1463086846433738852)
,p_page_id=>24
,p_name=>'p_cookie_name'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>true
,p_display_sequence=>20
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(1463086953345738853)
,p_page_process_id=>wwv_flow_imp.id(1463086846433738852)
,p_page_id=>24
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>10
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'lower( :P24_SELECTED_USERNAME )'
);
wwv_flow_imp.component_end;
end;
/
