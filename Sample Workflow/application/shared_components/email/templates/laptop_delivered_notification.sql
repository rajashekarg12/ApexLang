prompt --application/shared_components/email/templates/laptop_delivered_notification
begin
--   Manifest
--     EMAIL TEMPLATE: Laptop Delivered Notification
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_email_template(
 p_id=>wwv_flow_imp.id(22030960339977754)
,p_name=>'Laptop Delivered Notification'
,p_static_id=>'LAPTOP_DELIVERED_NOTIFICATION'
,p_version_number=>2
,p_subject=>'#P_LAPTOP_TYPE# Laptop for #P_ENAME# Completed'
,p_html_body=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Dear &P_ENAME.,<br><br>',
'',
'Congratulations, your new #P_LAPTOP_TYPE# laptop has been delivered. <br><br>',
'',
'{if P_DELIVERED_FROM_STOCK/}We used stock on hand to get it to you more quickly.<br><br>{endif/}',
'',
'Best Regards,',
'  The backoffice team'))
,p_html_header=>'<b style="font-size: 24px;">Sample Workflow, Approvals, and Tasks</b>'
,p_version_scn=>'SH256:qG_ZLNiMowsv2PV8VxqmsnOH_jX2tABAwlt8xb8zsRA'
);
wwv_flow_imp.component_end;
end;
/
