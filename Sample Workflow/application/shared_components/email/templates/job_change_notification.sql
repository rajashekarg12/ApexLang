prompt --application/shared_components/email/templates/job_change_notification
begin
--   Manifest
--     EMAIL TEMPLATE: Job Change Notification
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
 p_id=>wwv_flow_imp.id(1272545818417829856)
,p_name=>'Job Change Notification'
,p_static_id=>'JOB_CHANGE_NOTIFICATION'
,p_version_number=>2
,p_subject=>'Job Change for #P_ENAME# Completed'
,p_html_body=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Hello,<br>',
'The job change for #P_ENAME# from #P_JOB_BEFORE# to #P_JOB_AFTER# has been approved and is now complete.'))
,p_html_header=>'<b style="font-size: 24px;">Sample Workflow, Approvals, and Tasks</b>'
,p_version_scn=>'SH256:k_DvJlmy1QZ1EtxttaAPtlWgRfYAMQ2KHnXSWGRDOD0'
);
wwv_flow_imp.component_end;
end;
/
