prompt --application/shared_components/navigation/lists/user_interface
begin
--   Manifest
--     LIST: User Interface
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(962618190985391045)
,p_name=>'User Interface'
,p_static_id=>'user-interface'
,p_required_patch=>wwv_flow_imp.id(962612228962390978)
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(962631882229639933)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Email Settings'
,p_static_id=>'email-settings'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.'
,p_list_item_icon=>'fa-envelope-wrench'
,p_list_text_01=>'Configure an email address to notify for job changes as well as laptop approval and delivery.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(22043727402171002)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Manage Laptop Stock'
,p_static_id=>'manage-laptop-stock'
,p_list_item_link_target=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.'
,p_list_item_icon=>'fa-laptop'
,p_list_text_01=>'Manage laptop stock amounts'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(962619571170397638)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Manage Sample Data'
,p_static_id=>'manage-sample-data'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.'
,p_list_item_icon=>'fa-pencil-square-o'
,p_list_text_01=>'Reset the data for the sample'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(962632696100653427)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Salary Change Approvers'
,p_static_id=>'salary-change-approvers'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.'
,p_list_item_icon=>'fa-badge-check'
,p_list_text_01=>'Manage and test salary change approver assignments'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(962618671000391045)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Theme Style Selection'
,p_static_id=>'theme-style-selection'
,p_list_item_link_target=>'f?p=&APP_ID.:10010:&SESSION.::&DEBUG.:10010'
,p_list_item_icon=>'fa-paint-brush'
,p_list_text_01=>'Set the default application look and feel'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
