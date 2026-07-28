prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 104
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(333651782488475025)
,p_name=>'SUBSTITUTE_SAME_AS_ORIGINAL'
,p_message_text=>'The substitute user must be different from the original user.'
);
wwv_flow_imp.component_end;
end;
/
