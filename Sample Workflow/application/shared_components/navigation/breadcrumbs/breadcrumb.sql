prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(1255848005933493449)
,p_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1515925092896144711)
,p_short_name=>'Appraisal History'
,p_static_id=>'appraisal-history'
,p_link=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.'
,p_page_id=>29
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1177325920248800217)
,p_parent_id=>wwv_flow_imp.id(962610741285379203)
,p_short_name=>'Email Settings'
,p_static_id=>'email-settings'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1177326517071810573)
,p_short_name=>'Employees'
,p_static_id=>'employees'
,p_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.'
,p_page_id=>8
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1179225778000666820)
,p_short_name=>'Employees'
,p_static_id=>'employees-2'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1295498497057381183)
,p_short_name=>'Laptop Order Management'
,p_static_id=>'laptop-order-management'
,p_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.'
,p_page_id=>23
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(22036932499150415)
,p_short_name=>'Manage Laptop Stock'
,p_static_id=>'manage-laptop-stock'
,p_link=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.'
,p_page_id=>32
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1177326094827803680)
,p_parent_id=>wwv_flow_imp.id(962610741285379203)
,p_short_name=>'Manage Sample Data'
,p_static_id=>'manage-sample-data'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.'
,p_page_id=>18
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(333654082262505768)
,p_short_name=>'Manage Vacation Rules'
,p_static_id=>'manage-vacation-rules'
,p_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.'
,p_page_id=>20
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1184773790923195484)
,p_short_name=>'More Information'
,p_static_id=>'more-information'
,p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.'
,p_page_id=>14
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(22068850178671125)
,p_short_name=>'My Requests'
,p_static_id=>'my-requests'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.'
,p_page_id=>5
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(15818784666986951)
,p_short_name=>'My Tasks'
,p_static_id=>'my-tasks'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.'
,p_page_id=>3
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1227383807154875300)
,p_short_name=>'My Tasks'
,p_static_id=>'my-tasks-2'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.'
,p_page_id=>3
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1517884201503470915)
,p_short_name=>'Pending Actions'
,p_static_id=>'pending-actions'
,p_link=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.'
,p_page_id=>25
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(962828677971474626)
,p_short_name=>'Pending Approvals'
,p_static_id=>'pending-approvals'
,p_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.'
,p_page_id=>12
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1177326333170806568)
,p_parent_id=>wwv_flow_imp.id(962610741285379203)
,p_short_name=>'Salary Change Approvers'
,p_static_id=>'salary-change-approvers'
,p_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.'
,p_page_id=>9
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(962610741285379203)
,p_short_name=>'Setup'
,p_static_id=>'setup'
,p_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.'
,p_page_id=>21
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(15855107115051538)
,p_short_name=>'Task Administration'
,p_static_id=>'task-administration'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.'
,p_page_id=>6
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1246697691487211544)
,p_short_name=>'Task Administration'
,p_static_id=>'task-administration-2'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.'
,p_page_id=>6
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(21080059172919687)
,p_short_name=>'Workflow Dashboard'
,p_static_id=>'workflow-dashboard'
,p_link=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.'
,p_page_id=>30
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1512161750229495916)
,p_short_name=>'Workflow Debug Messages'
,p_static_id=>'workflow-debug-messages'
,p_link=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.'
,p_page_id=>27
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(21024329789919612)
,p_short_name=>'Workflow Status'
,p_static_id=>'workflow-status'
,p_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.'
,p_page_id=>19
);
wwv_flow_imp.component_end;
end;
/
