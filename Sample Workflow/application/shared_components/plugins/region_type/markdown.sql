prompt --application/shared_components/plugins/region_type/markdown
begin
--   Manifest
--     PLUGIN: MARKDOWN
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>1501507331239726
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'APX26'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(16600704518277050)
,p_plugin_type=>'REGION TYPE'
,p_name=>'MARKDOWN'
,p_display_name=>'Markdown Region'
,p_apexlang_name=>'markdownRegion'
,p_image_prefix=>nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','MARKDOWN'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure render (',
'    p_plugin in            apex_plugin.t_plugin,',
'    p_region in            apex_plugin.t_region,',
'    p_param  in            apex_plugin.t_region_render_param,',
'    p_result in out nocopy apex_plugin.t_region_render_result )',
'as',
'    l_clob_md   clob;',
'    l_clob_html clob;',
'    l_based_on  varchar2(23) := p_region.attributes.get_varchar2(''source'');',
'    l_file_name varchar2(200);',
'    l_to_return apex_plugin.t_region_render_result;',
'begin',
'    if l_based_on = ''INLINE'' then',
'        l_clob_md := p_region.attributes.get_varchar2(''content'');',
'    elsif l_based_on = ''APPLICATION_STATIC_FILE'' then',
'        l_file_name := p_region.attributes.get_varchar2(''file_name'');',
'        begin',
'            select replace(to_clob( file_content ),''#''||''APP_FILES''||''#'',V(''APP_FILES''))',
'              into l_clob_md',
'              from apex_application_static_files',
'             where application_id = :APP_ID',
'               and file_name      = l_file_name',
'               and mime_type      like ''text/%'';',
'        exception',
'            when no_data_found then',
'                raise_application_error( -20000, ''Application static file "'' || l_file_name || ''" not found or is not text/%'' );',
'        end;',
'    end if;',
'    l_clob_html := apex_markdown.to_html( l_clob_md );',
'',
'    apex_util.prn(',
'        p_clob      => ''<div class="is-markdownified">'' || l_clob_html || ''</div>'',',
'        p_escape    => false );',
'end render;'))
,p_api_version=>3
,p_render_function=>'render'
,p_help_text=>'Displays HTML for Markdown content from a static application file or entered directly by the developer.'
,p_version_identifier=>'1.0'
,p_files_version=>2461249125024
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(16602307031294338)
,p_plugin_id=>wwv_flow_imp.id(16600704518277050)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'content'
,p_prompt=>'Content'
,p_apexlang_name=>'content'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(16601070468280417)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'INLINE'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(16602620852296296)
,p_plugin_id=>wwv_flow_imp.id(16600704518277050)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'file_name'
,p_prompt=>'File Name'
,p_apexlang_name=>'fileName'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(16601070468280417)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'APPLICATION_STATIC_FILE'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(16601070468280417)
,p_plugin_id=>wwv_flow_imp.id(16600704518277050)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'source'
,p_prompt=>'Source'
,p_apexlang_name=>'source'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(16601795100283449)
,p_plugin_attribute_id=>wwv_flow_imp.id(16601070468280417)
,p_display_sequence=>20
,p_display_value=>'Application Static File'
,p_return_value=>'APPLICATION_STATIC_FILE'
,p_apexlang_name=>'applicationStaticFile'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(16601422139281762)
,p_plugin_attribute_id=>wwv_flow_imp.id(16601070468280417)
,p_display_sequence=>10
,p_display_value=>'Inline'
,p_return_value=>'INLINE'
,p_apexlang_name=>'inline'
);
end;
/
begin
wwv_flow_imp.component_end;
end;
/
