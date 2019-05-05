--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY userstorage.attribute_value DROP CONSTRAINT IF EXISTS attribute_value_parent_id_fkey;
ALTER TABLE IF EXISTS ONLY userstorage.attribute_value DROP CONSTRAINT IF EXISTS attribute_value_descriptor_id_fkey;
ALTER TABLE IF EXISTS ONLY userstorage.attribute_descriptor DROP CONSTRAINT IF EXISTS attribute_descriptor_parent_id_fkey;
ALTER TABLE IF EXISTS ONLY template.i18n_params DROP CONSTRAINT IF EXISTS i18n_params_template_id_fkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_triggers DROP CONSTRAINT IF EXISTS qrtz_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_simprop_triggers DROP CONSTRAINT IF EXISTS qrtz_simprop_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_simple_triggers DROP CONSTRAINT IF EXISTS qrtz_simple_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_cron_triggers DROP CONSTRAINT IF EXISTS qrtz_cron_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_blob_triggers DROP CONSTRAINT IF EXISTS qrtz_blob_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.task_log DROP CONSTRAINT IF EXISTS fk_task_id__periodic_task_id;
ALTER TABLE IF EXISTS ONLY telegram_handler.task_log_aggregation DROP CONSTRAINT IF EXISTS fk_id__periodic_task_id;
ALTER TABLE IF EXISTS ONLY telegram_handler.periodic_task DROP CONSTRAINT IF EXISTS fk_group_id__bot_listener__id;
ALTER TABLE IF EXISTS ONLY telegram_handler.command DROP CONSTRAINT IF EXISTS fk_group_id__bot_listener__bot_name;
ALTER TABLE IF EXISTS ONLY telegram_handler.command_error DROP CONSTRAINT IF EXISTS fk_command_id__command__id;
ALTER TABLE IF EXISTS ONLY telegram_handler.command DROP CONSTRAINT IF EXISTS fk_bot_name__command_group__id;
ALTER TABLE IF EXISTS ONLY telegram_handler.default_keyboard DROP CONSTRAINT IF EXISTS fk_bot_name__bot_listener__bot_name;
ALTER TABLE IF EXISTS ONLY telegram_handler.stored_procedure DROP CONSTRAINT IF EXISTS fk_bot_id__bot_listener__id;
ALTER TABLE IF EXISTS ONLY telegram_handler.command_group DROP CONSTRAINT IF EXISTS fk_bot_id__bot_listener__bot_name;
ALTER TABLE IF EXISTS ONLY sms.sms_message DROP CONSTRAINT IF EXISTS sms_message_routing_id_fkey;
ALTER TABLE IF EXISTS ONLY sms.sms_message DROP CONSTRAINT IF EXISTS sms_message_client_id_fkey;
ALTER TABLE IF EXISTS ONLY sms.routing DROP CONSTRAINT IF EXISTS routing_provider_id_fkey;
ALTER TABLE IF EXISTS ONLY sms.routing DROP CONSTRAINT IF EXISTS routing_client_id_fkey;
ALTER TABLE IF EXISTS ONLY script_backend.script_endpoint DROP CONSTRAINT IF EXISTS script_endpoint_backend_id_fkey;
ALTER TABLE IF EXISTS ONLY scheduling.time_task DROP CONSTRAINT IF EXISTS fk__time_task__abstract_task;
ALTER TABLE IF EXISTS ONLY scheduling.cron_task DROP CONSTRAINT IF EXISTS fk__cron_task__abstract_task;
ALTER TABLE IF EXISTS ONLY scheduling.abstract_task DROP CONSTRAINT IF EXISTS fk__abstract_task__end_point_descriptor;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_triggers DROP CONSTRAINT IF EXISTS qrtz_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_simprop_triggers DROP CONSTRAINT IF EXISTS qrtz_simprop_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_simple_triggers DROP CONSTRAINT IF EXISTS qrtz_simple_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_cron_triggers DROP CONSTRAINT IF EXISTS qrtz_cron_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_blob_triggers DROP CONSTRAINT IF EXISTS qrtz_blob_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY resource_structure.schedule_gap DROP CONSTRAINT IF EXISTS "FK_scheduleId_schedule_id";
ALTER TABLE IF EXISTS ONLY resource_structure.schedule DROP CONSTRAINT IF EXISTS "FK_resourceInstanceId_resourceInstance_id";
ALTER TABLE IF EXISTS ONLY resource_structure.resource_instance DROP CONSTRAINT IF EXISTS "FK_resourceId_resource_id";
ALTER TABLE IF EXISTS ONLY resource_structure.schedule DROP CONSTRAINT IF EXISTS "FK_resourceId_resource_id";
ALTER TABLE IF EXISTS ONLY resource_structure.resource DROP CONSTRAINT IF EXISTS "FK_parentId_resource_id";
ALTER TABLE IF EXISTS ONLY resource_structure.resource_instance DROP CONSTRAINT IF EXISTS "FK_parentId_resourceInstance_id";
ALTER TABLE IF EXISTS ONLY push.certificate_winphone DROP CONSTRAINT IF EXISTS fk_certificate_winphone_certificate;
ALTER TABLE IF EXISTS ONLY push.certificate_ios DROP CONSTRAINT IF EXISTS fk_certificate_ios_certificate;
ALTER TABLE IF EXISTS ONLY push.certificate_android DROP CONSTRAINT IF EXISTS fk_certificate_android_certificate;
ALTER TABLE IF EXISTS ONLY poll.user_point_history DROP CONSTRAINT IF EXISTS user_point_history_user_id_fkey;
ALTER TABLE IF EXISTS ONLY poll.user_answer DROP CONSTRAINT IF EXISTS user_answer_user_question_id_fkey;
ALTER TABLE IF EXISTS ONLY poll.question DROP CONSTRAINT IF EXISTS question_poll_id_fkey;
ALTER TABLE IF EXISTS ONLY poll.answer DROP CONSTRAINT IF EXISTS answer_question_id_fkey;
ALTER TABLE IF EXISTS ONLY large_obj_storage.file_info DROP CONSTRAINT IF EXISTS file_info_bucket_id_fkey;
ALTER TABLE IF EXISTS ONLY email.email_account DROP CONSTRAINT IF EXISTS email_account_smtp_server_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_triggers DROP CONSTRAINT IF EXISTS qrtz_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_simprop_triggers DROP CONSTRAINT IF EXISTS qrtz_simprop_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_simple_triggers DROP CONSTRAINT IF EXISTS qrtz_simple_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_cron_triggers DROP CONSTRAINT IF EXISTS qrtz_cron_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_blob_triggers DROP CONSTRAINT IF EXISTS qrtz_blob_triggers_sched_name_fkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_template DROP CONSTRAINT IF EXISTS "FK_distribution_template_distribution_template_2";
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_template DROP CONSTRAINT IF EXISTS "FK_distribution_template_distribution_template_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_log DROP CONSTRAINT IF EXISTS "FK_distribution_log_id.distribution_id";
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution DROP CONSTRAINT IF EXISTS "FK_distribution_distributionTemplate_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution DROP CONSTRAINT IF EXISTS "FK_distribution_distributionGroup_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution DROP CONSTRAINT IF EXISTS "FK_distribution_communication_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_template_group DROP CONSTRAINT IF EXISTS "FK_distributionTemplate_communication_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_journal DROP CONSTRAINT IF EXISTS "FK_distributionJournal_distribution_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_journal DROP CONSTRAINT IF EXISTS "FK_distributionJournal_account_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_has_distribution_template DROP CONSTRAINT IF EXISTS "FK_distributionHasDistributionTemplate_distribution_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_has_distribution_template DROP CONSTRAINT IF EXISTS "FK_distributionHasDistributionTemplate_distributionTemplate_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_group DROP CONSTRAINT IF EXISTS "FK_distributionGroup_communication_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_group_has_user DROP CONSTRAINT IF EXISTS "FK_distributionGroupHasUser_distribution_group_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.communication_statistic_value DROP CONSTRAINT IF EXISTS "FK_communicationStatisticValue_communication_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.communication_statistic_value DROP CONSTRAINT IF EXISTS "FK_communicationStatisticValue_communicationStatisticType_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.communication_journal DROP CONSTRAINT IF EXISTS "FK_communicationJournal_communication_1";
ALTER TABLE IF EXISTS ONLY cityservices_communication.communication_journal DROP CONSTRAINT IF EXISTS "FK_communicationJournal_account_1";
ALTER TABLE IF EXISTS ONLY cityservices_chats.chat DROP CONSTRAINT IF EXISTS "FK_userId__userInfo_id";
ALTER TABLE IF EXISTS ONLY cityservices_chats.chat_message DROP CONSTRAINT IF EXISTS "FK_chatId__chat_id";
ALTER TABLE IF EXISTS ONLY cityservices_chats.chat DROP CONSTRAINT IF EXISTS "FK_channelId__chat_channelId";
ALTER TABLE IF EXISTS ONLY cityservices.water_meter_value DROP CONSTRAINT IF EXISTS water_meter_value_meter_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.water_meter DROP CONSTRAINT IF EXISTS water_meter_house_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.vaccination_plan DROP CONSTRAINT IF EXISTS vaccination_plan_user_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.vaccination_plan DROP CONSTRAINT IF EXISTS vaccination_plan_type_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.vaccination_plan DROP CONSTRAINT IF EXISTS vaccination_plan_statusid_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_sos DROP CONSTRAINT IF EXISTS user_request_sos_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_history DROP CONSTRAINT IF EXISTS user_request_history_user_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_history DROP CONSTRAINT IF EXISTS user_request_history_request_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_history DROP CONSTRAINT IF EXISTS user_request_history_operator_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_feedback DROP CONSTRAINT IF EXISTS user_request_feedback_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_epd DROP CONSTRAINT IF EXISTS user_request_epd_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_epd DROP CONSTRAINT IF EXISTS user_request_epd_house_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_abstract DROP CONSTRAINT IF EXISTS user_request_abstract_user_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_abstract DROP CONSTRAINT IF EXISTS user_request_abstract_operator_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_profile_info DROP CONSTRAINT IF EXISTS user_profile_info_user_info_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_info DROP CONSTRAINT IF EXISTS user_info_policy_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_houses DROP CONSTRAINT IF EXISTS user_houses_user_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_houses DROP CONSTRAINT IF EXISTS user_houses_house_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_answers DROP CONSTRAINT IF EXISTS user_answers_question_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_answers DROP CONSTRAINT IF EXISTS user_answers_person_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_answers DROP CONSTRAINT IF EXISTS user_answers_answer_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.transaction DROP CONSTRAINT IF EXISTS transaction_message_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.text_service DROP CONSTRAINT IF EXISTS text_service_group_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.text_service_group DROP CONSTRAINT IF EXISTS text_service_group_category_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_subscription DROP CONSTRAINT IF EXISTS service_subscription_service_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_subscription_param DROP CONSTRAINT IF EXISTS service_subscription_param_subscription_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_subscription_param DROP CONSTRAINT IF EXISTS service_subscription_param_param_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_param DROP CONSTRAINT IF EXISTS service_param_service_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_history DROP CONSTRAINT IF EXISTS service_history_service_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_history_param DROP CONSTRAINT IF EXISTS service_history_param_service_history_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_history_param DROP CONSTRAINT IF EXISTS service_history_param_param_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_favorite DROP CONSTRAINT IF EXISTS service_favorite_user_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_favorite DROP CONSTRAINT IF EXISTS service_favorite_service_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_favorite_param DROP CONSTRAINT IF EXISTS service_favorite_param_favorite_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.service DROP CONSTRAINT IF EXISTS service_category_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.questions DROP CONSTRAINT IF EXISTS questions_poll_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.published DROP CONSTRAINT IF EXISTS published_poll_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.published DROP CONSTRAINT IF EXISTS published_person_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.offence DROP CONSTRAINT IF EXISTS offence_user_info_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.news_element_has_tag DROP CONSTRAINT IF EXISTS news_element_has_tag_news_tag_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.news_element_has_tag DROP CONSTRAINT IF EXISTS news_element_has_tag_news_element_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.message_tag DROP CONSTRAINT IF EXISTS message_tag_message_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.message DROP CONSTRAINT IF EXISTS message_mime_type_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_treatment_slot DROP CONSTRAINT IF EXISTS med_treatment_slot_policy_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_treatment_slot DROP CONSTRAINT IF EXISTS med_treatment_slot_day_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_treatment_day DROP CONSTRAINT IF EXISTS med_treatment_day_unit_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_hospital_unit DROP CONSTRAINT IF EXISTS med_hospital_unit_speciality_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_hospital_unit DROP CONSTRAINT IF EXISTS med_hospital_unit_hospital_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_hospital_unit_favorite DROP CONSTRAINT IF EXISTS med_hospital_unit_favorite_user_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_hospital_unit_favorite DROP CONSTRAINT IF EXISTS med_hospital_unit_favorite_hospital_unit_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_hospital_unit DROP CONSTRAINT IF EXISTS med_hospital_unit_doctor_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_hospital_policy DROP CONSTRAINT IF EXISTS med_hospital_policy_policy_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_hospital_policy DROP CONSTRAINT IF EXISTS med_hospital_policy_hospital_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_subscription DROP CONSTRAINT IF EXISTS fk_user_id__user_info_external_id;
ALTER TABLE IF EXISTS ONLY cityservices.med_clinic_link DROP CONSTRAINT IF EXISTS fk_operator_id__account_id;
ALTER TABLE IF EXISTS ONLY cityservices.slot_history_attachment DROP CONSTRAINT IF EXISTS fk_history_id__slot_history_id;
ALTER TABLE IF EXISTS ONLY cityservices.electricity_meter_value DROP CONSTRAINT IF EXISTS electricity_meter_value_meter_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.electricity_meter DROP CONSTRAINT IF EXISTS electricity_meter_house_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_type_news_category DROP CONSTRAINT IF EXISTS complain_type_news_category_news_category_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_type_news_category DROP CONSTRAINT IF EXISTS complain_type_news_category_complain_type_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_type DROP CONSTRAINT IF EXISTS complain_type_flow_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_status_workflow DROP CONSTRAINT IF EXISTS complain_status_workflow_old_complain_status_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_status_workflow DROP CONSTRAINT IF EXISTS complain_status_workflow_new_complain_status_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_status_workflow DROP CONSTRAINT IF EXISTS complain_status_workflow_complain_group_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_status DROP CONSTRAINT IF EXISTS complain_status_flow_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_group DROP CONSTRAINT IF EXISTS complain_group_complain_type_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_field_value DROP CONSTRAINT IF EXISTS complain_field_value_complain_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_field_value DROP CONSTRAINT IF EXISTS complain_field_value_complain_field_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain DROP CONSTRAINT IF EXISTS complain_complain_status_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain DROP CONSTRAINT IF EXISTS complain_complain_group_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.bookmark_history_screen DROP CONSTRAINT IF EXISTS bookmark_history_screen_user_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.bookmark_favorite_screen DROP CONSTRAINT IF EXISTS bookmark_favorite_screen_user_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.attachment DROP CONSTRAINT IF EXISTS attachment_message_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.answers DROP CONSTRAINT IF EXISTS answers_questions_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.account_roles DROP CONSTRAINT IF EXISTS account_roles_role_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.account_roles DROP CONSTRAINT IF EXISTS account_roles_account_id_fkey;
ALTER TABLE IF EXISTS ONLY cityservices.chat_message DROP CONSTRAINT IF EXISTS "FK_userId_userInfo_id";
ALTER TABLE IF EXISTS ONLY cityservices.polls DROP CONSTRAINT IF EXISTS "FK_polls_newsCategory_categoryId";
ALTER TABLE IF EXISTS ONLY cityservices.role_links DROP CONSTRAINT IF EXISTS "FK_parent_id__role_id";
ALTER TABLE IF EXISTS ONLY cityservices.complaint_performance_value DROP CONSTRAINT IF EXISTS "FK_complaint_type_id.complaint_performance_type.id";
ALTER TABLE IF EXISTS ONLY cityservices.statistic_value DROP CONSTRAINT IF EXISTS "FK_complaint_type_id.complain_type.id";
ALTER TABLE IF EXISTS ONLY cityservices.complaint_statistic_by_type DROP CONSTRAINT IF EXISTS "FK_complaint_type_id.complain_type.id";
ALTER TABLE IF EXISTS ONLY cityservices.role_links DROP CONSTRAINT IF EXISTS "FK_child_id__role_id";
ALTER TABLE IF EXISTS ONLY cityservices.news_element_has_category DROP CONSTRAINT IF EXISTS "FK_NewsElementCategory_NewsElementId_NewsElement_Id";
ALTER TABLE IF EXISTS ONLY cityservices.news_element_has_category DROP CONSTRAINT IF EXISTS "FK_NewsElementCategory_NewsCategoryId_NewsCategory_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain DROP CONSTRAINT IF EXISTS "FK_Complain_UserId_UserInfo_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain DROP CONSTRAINT IF EXISTS "FK_Complain_OperatorId_Account_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain DROP CONSTRAINT IF EXISTS "FK_Complain_InWorkOperatorId_Account_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_workflow_has_role DROP CONSTRAINT IF EXISTS "FK_ComplainWorkflowRole_RoleId_Role_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_workflow_has_role DROP CONSTRAINT IF EXISTS "FK_ComplainWorkflowRole_ComplainStatusWorkflowId_ComplainStatus";
ALTER TABLE IF EXISTS ONLY cityservices.complain_workflow_has_field DROP CONSTRAINT IF EXISTS "FK_ComplainWorkflowField_FieldId_Field_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_workflow_has_field DROP CONSTRAINT IF EXISTS "FK_ComplainWorkflowField_ComplainWorkflowId_ComplainWorkflow_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_status_has_role DROP CONSTRAINT IF EXISTS "FK_ComplainStatusRole_RoleId_Role_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_status_has_role DROP CONSTRAINT IF EXISTS "FK_ComplainStatusRole_ComplainStatusId_ComplainStatus_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_history DROP CONSTRAINT IF EXISTS "FK_ComplainHistory_UserId_UserInfo_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_history DROP CONSTRAINT IF EXISTS "FK_ComplainHistory_StatusToId_ComplainStatus_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_history DROP CONSTRAINT IF EXISTS "FK_ComplainHistory_StatusFromId_ComplainStatus_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_history DROP CONSTRAINT IF EXISTS "FK_ComplainHistory_OperatorId_Account_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_history DROP CONSTRAINT IF EXISTS "FK_ComplainHistory_ComplainId_Complain_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_group DROP CONSTRAINT IF EXISTS "FK_ComplainGroup_StartStatusId_ComplainStatus_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_group_has_role DROP CONSTRAINT IF EXISTS "FK_ComplainGroupRole_RoleId_Role_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_group_has_role DROP CONSTRAINT IF EXISTS "FK_ComplainGroupRole_ComplainGroupId_ComplainGroup_Id";
ALTER TABLE IF EXISTS ONLY cityservices.complain_field DROP CONSTRAINT IF EXISTS "FK_ComplainGroupId_Complain_Id";
ALTER TABLE IF EXISTS ONLY backend.split_endpoint_descriptor DROP CONSTRAINT IF EXISTS split_endpoint_descriptor_target_endpoint_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.split_endpoint_descriptor DROP CONSTRAINT IF EXISTS split_endpoint_descriptor_source_endpoint_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.join_aggregate_endpoint DROP CONSTRAINT IF EXISTS join_aggregate_endpoint_child_endpoint_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.join_aggregate_endpoint DROP CONSTRAINT IF EXISTS join_aggregate_endpoint_aggregate_endpoint_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.jdbc_url_parameter_string_example_value DROP CONSTRAINT IF EXISTS jdbc_url_parameter_string_example_va_jdbc_url_parameter_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.jdbc_url_parameter DROP CONSTRAINT IF EXISTS jdbc_url_parameter_jdbc_driver_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.jdbc_backend_descriptor DROP CONSTRAINT IF EXISTS jdbc_backend_descriptor_driver_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.endpoint_isolation DROP CONSTRAINT IF EXISTS fk_isolation_endpoint_descriptor;
ALTER TABLE IF EXISTS ONLY backend.external_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk_external_endpoint;
ALTER TABLE IF EXISTS ONLY backend.external_backend_descriptor DROP CONSTRAINT IF EXISTS fk_external_backend;
ALTER TABLE IF EXISTS ONLY backend.data_type_object_property DROP CONSTRAINT IF EXISTS fk_data_type_object_data_id;
ALTER TABLE IF EXISTS ONLY backend.data_type DROP CONSTRAINT IF EXISTS fk_data_type_element_type_id;
ALTER TABLE IF EXISTS ONLY backend.data_type_object_property DROP CONSTRAINT IF EXISTS fk_data_type_data_type_id;
ALTER TABLE IF EXISTS ONLY backend.abstract_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk_data_type;
ALTER TABLE IF EXISTS ONLY backend.abstract_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk_backend_descriptor;
ALTER TABLE IF EXISTS ONLY backend.adapter_endpoint_default_param DROP CONSTRAINT IF EXISTS fk_adapter_endpoint_default_param_adapter_endpoint;
ALTER TABLE IF EXISTS ONLY backend.split_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk__split_endpoint__abstract_endpoint;
ALTER TABLE IF EXISTS ONLY backend.rest_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk__rest_endpoint__abstract_endpoint;
ALTER TABLE IF EXISTS ONLY backend.rest_backend_descriptor DROP CONSTRAINT IF EXISTS fk__rest_backend__abstract_backend;
ALTER TABLE IF EXISTS ONLY backend.emp_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk__mq_endpoint__rest_endpoint;
ALTER TABLE IF EXISTS ONLY backend.chain_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk__mq_endpoint__abstract_endpoint;
ALTER TABLE IF EXISTS ONLY backend.mq_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk__mq_endpoint__abstract_endpoint;
ALTER TABLE IF EXISTS ONLY backend.emp_backend_descriptor DROP CONSTRAINT IF EXISTS fk__mq_backend__rest_backend;
ALTER TABLE IF EXISTS ONLY backend.mq_backend_descriptor DROP CONSTRAINT IF EXISTS fk__mq_backend__abstract_backend;
ALTER TABLE IF EXISTS ONLY backend.mongo_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk__mongo_endpoint__abstract_endpoint;
ALTER TABLE IF EXISTS ONLY backend.mongo_backend_descriptor DROP CONSTRAINT IF EXISTS fk__mongo_backend__abstract_backend;
ALTER TABLE IF EXISTS ONLY backend.mdm_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk__mdm_endpoint__abstract_endpoint;
ALTER TABLE IF EXISTS ONLY backend.mdm_backend_descriptor DROP CONSTRAINT IF EXISTS fk__mdm_backend__abstract_backend;
ALTER TABLE IF EXISTS ONLY backend.jdbc_backend_descriptor DROP CONSTRAINT IF EXISTS fk__jdbc_backend__abstract_backend;
ALTER TABLE IF EXISTS ONLY backend.endpoint_param_descriptor DROP CONSTRAINT IF EXISTS fk__endpoint_param_descriptor__endpoint;
ALTER TABLE IF EXISTS ONLY backend.endpoint_param_descriptor DROP CONSTRAINT IF EXISTS fk__endpoint_param_descriptor__datatype;
ALTER TABLE IF EXISTS ONLY backend.jdbc_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk__endpoint__abstract_endpoint;
ALTER TABLE IF EXISTS ONLY backend.awip_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk__endpoint__abstract_endpoint;
ALTER TABLE IF EXISTS ONLY backend.chain_target_mapping DROP CONSTRAINT IF EXISTS fk__chain_target_mapping__chain_parameter_mapping;
ALTER TABLE IF EXISTS ONLY backend.chain_target_mapping DROP CONSTRAINT IF EXISTS fk__chain_target_mapping__chain_endpoint;
ALTER TABLE IF EXISTS ONLY backend.chain_source_mapping DROP CONSTRAINT IF EXISTS fk__chain_source_mapping__chain_parameter_mapping;
ALTER TABLE IF EXISTS ONLY backend.chain_source_mapping DROP CONSTRAINT IF EXISTS fk__chain_source_mapping__chain_endpoint;
ALTER TABLE IF EXISTS ONLY backend.awip_backend_descriptor DROP CONSTRAINT IF EXISTS fk__backend__abstract_backend;
ALTER TABLE IF EXISTS ONLY backend.adapter_result_convertation DROP CONSTRAINT IF EXISTS fk__adapter_result_convertation__convertation;
ALTER TABLE IF EXISTS ONLY backend.adapter_result_convertation DROP CONSTRAINT IF EXISTS fk__adapter_result_convertation__adapter_endpoint;
ALTER TABLE IF EXISTS ONLY backend.adapter_param_convertation DROP CONSTRAINT IF EXISTS fk__adapter_param_convertation__convertation;
ALTER TABLE IF EXISTS ONLY backend.adapter_param_convertation DROP CONSTRAINT IF EXISTS fk__adapter_param_convertation__adapter_endpoint;
ALTER TABLE IF EXISTS ONLY backend.adapter_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk__adapter_endpoint__target_endpoint;
ALTER TABLE IF EXISTS ONLY backend.adapter_endpoint_descriptor DROP CONSTRAINT IF EXISTS fk__adapter_endpoint__abstract_endpoint;
ALTER TABLE IF EXISTS ONLY backend.data_type DROP CONSTRAINT IF EXISTS data_type_mdm_type_settings_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.data_type_mdm_settings DROP CONSTRAINT IF EXISTS data_type_mdm_settings_value_type_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.data_type_mdm_settings DROP CONSTRAINT IF EXISTS data_type_mdm_settings_key_type_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.composite_backend_descriptor DROP CONSTRAINT IF EXISTS composite_backend_descriptor_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.chain_endpoint_descriptor DROP CONSTRAINT IF EXISTS chain_endpoint_descriptor_target_endpoint_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.chain_endpoint_descriptor DROP CONSTRAINT IF EXISTS chain_endpoint_descriptor_source_endpoint_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.cache_settings DROP CONSTRAINT IF EXISTS cache_settings_end_point_descriptor_id_fkey;
ALTER TABLE IF EXISTS ONLY backend.aggregate_endpoint_descriptor DROP CONSTRAINT IF EXISTS aggregate_endpoint_descriptor_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.user_roles_permissions DROP CONSTRAINT IF EXISTS user_roles_permissions_role_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.user_roles_permissions DROP CONSTRAINT IF EXISTS user_roles_permissions_permission_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.user_role DROP CONSTRAINT IF EXISTS user_role_application_group_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.user_permission DROP CONSTRAINT IF EXISTS user_permission_permission_type_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.user_permission DROP CONSTRAINT IF EXISTS user_permission_application_group_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.user_data_property DROP CONSTRAINT IF EXISTS user_data_property_user_account_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.user_data_property DROP CONSTRAINT IF EXISTS user_data_property_data_property_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.user_accounts_roles DROP CONSTRAINT IF EXISTS user_accounts_roles_role_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.user_accounts_roles DROP CONSTRAINT IF EXISTS user_accounts_roles_account_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.user_account DROP CONSTRAINT IF EXISTS user_account_password_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.user_account DROP CONSTRAINT IF EXISTS user_account_application_group_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.service_role_permissions DROP CONSTRAINT IF EXISTS service_role_permissions_role_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.service_role_permissions DROP CONSTRAINT IF EXISTS service_role_permissions_permission_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.service_role DROP CONSTRAINT IF EXISTS service_role_application_group_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.service_permission DROP CONSTRAINT IF EXISTS service_permission_application_group_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.service_account_roles DROP CONSTRAINT IF EXISTS service_account_roles_role_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.service_account_roles DROP CONSTRAINT IF EXISTS service_account_roles_account_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.service_account DROP CONSTRAINT IF EXISTS service_account_application_group_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.mobile_app_instance DROP CONSTRAINT IF EXISTS mobile_app_instance_user_account_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.mobile_app_instance DROP CONSTRAINT IF EXISTS mobile_app_instance_mobile_app_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.mobile_app_domain DROP CONSTRAINT IF EXISTS mobile_app_domain_application_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.mobile_app DROP CONSTRAINT IF EXISTS mobile_app_application_group_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.ldap_configuration DROP CONSTRAINT IF EXISTS ldap_configuration_application_group_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.data_property_section DROP CONSTRAINT IF EXISTS data_property_section_application_group_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.data_property_group DROP CONSTRAINT IF EXISTS data_property_group_data_property_section_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.data_property DROP CONSTRAINT IF EXISTS data_property_data_property_group_id_fkey;
ALTER TABLE IF EXISTS ONLY aaa.confirmation DROP CONSTRAINT IF EXISTS confirmation_user_account_id_fkey;
DROP TRIGGER IF EXISTS updatetasklogaggregation ON telegram_handler.task_log;
DROP TRIGGER IF EXISTS insertnewlogaggregation ON telegram_handler.periodic_task;
DROP TRIGGER IF EXISTS parent_tree_tgr ON resource_structure.resource_instance;
DROP TRIGGER IF EXISTS parent_tree_tgr ON resource_structure.resource;
DROP TRIGGER IF EXISTS user_status_log_trigger ON poll.user_status;
DROP TRIGGER IF EXISTS user_points_update_trigger ON poll.user_point_history;
DROP TRIGGER IF EXISTS "incrementMessagesCount" ON cityservices_chats.chat_message;
DROP TRIGGER IF EXISTS set_updated_at ON cityservices.ui_config;
DROP TRIGGER IF EXISTS set_updated_at ON cityservices.user_translation;
DROP INDEX IF EXISTS userstorage.unqi__attribute_descriptor__group_id__name;
DROP INDEX IF EXISTS userstorage.i__attribute_value__group_id__user_id;
DROP INDEX IF EXISTS telegram_handler.ix_command_error__command_id;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_t_state;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_t_nft_st_misfire_grp;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_t_nft_st_misfire;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_t_nft_st;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_t_nft_misfire;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_t_next_fire_time;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_t_n_state;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_t_n_g_state;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_t_jg;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_t_j;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_t_g;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_t_c;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_j_req_recovery;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_j_grp;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_ft_trig_inst_name;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_ft_tg;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_ft_t_g;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_ft_jg;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_ft_j_g;
DROP INDEX IF EXISTS telegram_handler.idx_qrtz_ft_inst_job_req_rcvry;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_t_state;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_t_nft_st_misfire_grp;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_t_nft_st_misfire;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_t_nft_st;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_t_nft_misfire;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_t_next_fire_time;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_t_n_state;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_t_n_g_state;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_t_jg;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_t_j;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_t_g;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_t_c;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_j_req_recovery;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_j_grp;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_ft_trig_inst_name;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_ft_tg;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_ft_t_g;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_ft_jg;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_ft_j_g;
DROP INDEX IF EXISTS resource_structure.idx_qrtz_ft_inst_job_req_rcvry;
DROP INDEX IF EXISTS resource_structure."IX_schedule_resourceInstanceId";
DROP INDEX IF EXISTS resource_structure."IX_schedule_resourceId";
DROP INDEX IF EXISTS resource_structure."IX_scheduleGap_scheduleId";
DROP INDEX IF EXISTS resource_structure."IX_resource_tree";
DROP INDEX IF EXISTS resource_structure."IX_resource_parentId";
DROP INDEX IF EXISTS resource_structure."IX_resource_instanceId";
DROP INDEX IF EXISTS resource_structure."IX_resourceInstance_tree";
DROP INDEX IF EXISTS resource_structure."IX_resourceInstance_resourceId";
DROP INDEX IF EXISTS resource_structure."IX_resourceInstance_parentId";
DROP INDEX IF EXISTS poll.idx_user_id;
DROP INDEX IF EXISTS mobile_store.view_mobile_application_id_idx;
DROP INDEX IF EXISTS mobile_store.config_mobile_application_id_idx;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_t_state;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_t_nft_st_misfire_grp;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_t_nft_st_misfire;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_t_nft_st;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_t_nft_misfire;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_t_next_fire_time;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_t_n_state;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_t_n_g_state;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_t_jg;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_t_j;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_t_g;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_t_c;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_j_req_recovery;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_j_grp;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_ft_trig_inst_name;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_ft_tg;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_ft_t_g;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_ft_jg;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_ft_j_g;
DROP INDEX IF EXISTS cityservices_communication.idx_qrtz_ft_inst_job_req_rcvry;
DROP INDEX IF EXISTS cityservices_communication."IX_distribution_template_distribution_template";
DROP INDEX IF EXISTS cityservices_communication."IX_distribution_distributionTemplate_distributionTemplateId";
DROP INDEX IF EXISTS cityservices_communication."IX_distribution_distributionGroup_distributionGroupId";
DROP INDEX IF EXISTS cityservices_communication."IX_distribution_communication_communicationId";
DROP INDEX IF EXISTS cityservices_communication."IX_distributionTemplate_communication_communicationId";
DROP INDEX IF EXISTS cityservices_communication."IX_distributionJourna_distribution_distributionId";
DROP INDEX IF EXISTS cityservices_communication."IX_distributionHasDistributionTemplate_dTId";
DROP INDEX IF EXISTS cityservices_communication."IX_distributionHasDistributionTemplate_dId";
DROP INDEX IF EXISTS cityservices_communication."IX_distributionGroup_communication_communicationId";
DROP INDEX IF EXISTS cityservices_communication."IX_distributionGroupHasUser_groupId";
DROP INDEX IF EXISTS cityservices_communication."IX_communicationStatisticValue_communication_communicationId";
DROP INDEX IF EXISTS cityservices_communication."IX_communicationSV_communicationST_communicationSTId";
DROP INDEX IF EXISTS cityservices_communication."IX_communicationJournal_communication_communicationId";
DROP INDEX IF EXISTS cityservices.question_id;
DROP INDEX IF EXISTS cityservices.person_id;
DROP INDEX IF EXISTS cityservices.ix_operator_id;
DROP INDEX IF EXISTS cityservices.ix_clinic_id;
DROP INDEX IF EXISTS cityservices.fk_slot_history_slot_id;
DROP INDEX IF EXISTS cityservices.answer_id;
DROP INDEX IF EXISTS cityservices."IX_userId__chatId";
DROP INDEX IF EXISTS cityservices."IX_externalId";
DROP INDEX IF EXISTS cityservices."IX_NewsElementCategory_NewsElementId";
DROP INDEX IF EXISTS cityservices."IX_NewsElementCategory_NewsCategoryId";
DROP INDEX IF EXISTS cityservices."IX_Complain_UserId";
DROP INDEX IF EXISTS cityservices."IX_Complain_OperatorId";
DROP INDEX IF EXISTS cityservices."IX_Complain_Name";
DROP INDEX IF EXISTS cityservices."IX_Complain_ComplainStatusId";
DROP INDEX IF EXISTS cityservices."IX_Complain_ComplainGroupId";
DROP INDEX IF EXISTS cityservices."IX_ComplainWorkflowRole_RoleId";
DROP INDEX IF EXISTS cityservices."IX_ComplainWorkflowRole_ComplainStatusWorkflowId";
DROP INDEX IF EXISTS cityservices."IX_ComplainWorkflowField_FieldId";
DROP INDEX IF EXISTS cityservices."IX_ComplainWorkflowField_ComplainWorkflowId";
DROP INDEX IF EXISTS cityservices."IX_ComplainType_Name";
DROP INDEX IF EXISTS cityservices."IX_ComplainStatusWorkflow_OldNewStatusGroup";
DROP INDEX IF EXISTS cityservices."IX_ComplainStatusWorkflow_ComplainGroupId";
DROP INDEX IF EXISTS cityservices."IX_ComplainStatusRole_RoleId";
DROP INDEX IF EXISTS cityservices."IX_ComplainStatusRole_ComplainStatusId";
DROP INDEX IF EXISTS cityservices."IX_ComplainHistory_UserId";
DROP INDEX IF EXISTS cityservices."IX_ComplainHistory_OperatorId";
DROP INDEX IF EXISTS cityservices."IX_ComplainHistory_ComplainId";
DROP INDEX IF EXISTS cityservices."IX_ComplainGroup_ComplainTypeIdName";
DROP INDEX IF EXISTS cityservices."IX_ComplainGroupRole_RoleId";
DROP INDEX IF EXISTS cityservices."IX_ComplainGroupRole_ComplainGroupId";
DROP INDEX IF EXISTS cityservices."IX_ComplainField_ComplainGroupId";
DROP INDEX IF EXISTS cityservices."IX_ComplainFieldValue_ComplainIdFieldId";
DROP INDEX IF EXISTS cityservices."INX_statistic_value.date";
DROP INDEX IF EXISTS cityservices."INX_complaint_statistic_by_type.date";
DROP INDEX IF EXISTS cityservices."INX_complaint_performance_value.date";
DROP INDEX IF EXISTS cityservices."FK_slotHistoryAttachment_historyId";
DROP INDEX IF EXISTS booking.ix_slots_to;
DROP INDEX IF EXISTS booking.ix_slots_resource_id;
DROP INDEX IF EXISTS booking.ix_slots_properties;
DROP INDEX IF EXISTS booking.ix_slots_owner;
DROP INDEX IF EXISTS booking.ix_slots_hash;
DROP INDEX IF EXISTS booking.ix_slots_from;
DROP INDEX IF EXISTS aaa.unqi__user_account__uuid;
DROP INDEX IF EXISTS aaa.i__user_session__user_uuid;
ALTER TABLE IF EXISTS ONLY webadmin.user_role DROP CONSTRAINT IF EXISTS user_role_pkey;
ALTER TABLE IF EXISTS ONLY webadmin.user_account DROP CONSTRAINT IF EXISTS user_account_pkey;
ALTER TABLE IF EXISTS ONLY webadmin.task_meta_data DROP CONSTRAINT IF EXISTS task_meta_data_pkey;
ALTER TABLE IF EXISTS ONLY webadmin.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY userstorage.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY userstorage.attribute_value DROP CONSTRAINT IF EXISTS attribute_value_pkey;
ALTER TABLE IF EXISTS ONLY userstorage.attribute_type DROP CONSTRAINT IF EXISTS attribute_type_pkey;
ALTER TABLE IF EXISTS ONLY userstorage.attribute_type DROP CONSTRAINT IF EXISTS attribute_type_application_group_id_name_key;
ALTER TABLE IF EXISTS ONLY userstorage.attribute_descriptor DROP CONSTRAINT IF EXISTS attribute_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY userstorage.attribute_descriptor DROP CONSTRAINT IF EXISTS attribute_descriptor_application_group_id_parent_id_name_key;
ALTER TABLE IF EXISTS ONLY template.template DROP CONSTRAINT IF EXISTS template_pkey;
ALTER TABLE IF EXISTS ONLY template.template DROP CONSTRAINT IF EXISTS template_name_application_group_id_key;
ALTER TABLE IF EXISTS ONLY template.i18n_params DROP CONSTRAINT IF EXISTS i18n_params_pkey;
ALTER TABLE IF EXISTS ONLY telegram_transport.telegram_bot DROP CONSTRAINT IF EXISTS telegram_bot_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.command DROP CONSTRAINT IF EXISTS uq_bot_name_command;
ALTER TABLE IF EXISTS ONLY telegram_handler.bot_listener DROP CONSTRAINT IF EXISTS uq_bot_name;
ALTER TABLE IF EXISTS ONLY telegram_handler.task_log DROP CONSTRAINT IF EXISTS task_log_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.task_log_aggregation DROP CONSTRAINT IF EXISTS task_log_aggregation_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.stored_procedure DROP CONSTRAINT IF EXISTS stored_procedure_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_triggers DROP CONSTRAINT IF EXISTS qrtz_triggers_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_simprop_triggers DROP CONSTRAINT IF EXISTS qrtz_simprop_triggers_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_simple_triggers DROP CONSTRAINT IF EXISTS qrtz_simple_triggers_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_scheduler_state DROP CONSTRAINT IF EXISTS qrtz_scheduler_state_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_paused_trigger_grps DROP CONSTRAINT IF EXISTS qrtz_paused_trigger_grps_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_locks DROP CONSTRAINT IF EXISTS qrtz_locks_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_job_details DROP CONSTRAINT IF EXISTS qrtz_job_details_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_fired_triggers DROP CONSTRAINT IF EXISTS qrtz_fired_triggers_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_cron_triggers DROP CONSTRAINT IF EXISTS qrtz_cron_triggers_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_calendars DROP CONSTRAINT IF EXISTS qrtz_calendars_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.qrtz_blob_triggers DROP CONSTRAINT IF EXISTS qrtz_blob_triggers_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.periodic_task DROP CONSTRAINT IF EXISTS periodic_task_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.default_keyboard DROP CONSTRAINT IF EXISTS default_keyboard_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.command DROP CONSTRAINT IF EXISTS command_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.command_group DROP CONSTRAINT IF EXISTS command_group_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.command_error DROP CONSTRAINT IF EXISTS command_error_pkey;
ALTER TABLE IF EXISTS ONLY telegram_handler.bot_listener DROP CONSTRAINT IF EXISTS bot_listener_pkey;
ALTER TABLE IF EXISTS ONLY telegram_bot.telegram_bot DROP CONSTRAINT IF EXISTS telegram_bot_token_key;
ALTER TABLE IF EXISTS ONLY telegram_bot.telegram_bot DROP CONSTRAINT IF EXISTS telegram_bot_pkey;
ALTER TABLE IF EXISTS ONLY telegram_bot.telegram_bot DROP CONSTRAINT IF EXISTS telegram_bot_name_key;
ALTER TABLE IF EXISTS ONLY telegram_bot.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY storage.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY sms.sms_transaction DROP CONSTRAINT IF EXISTS sms_transaction_provider_provider_msg_id_key;
ALTER TABLE IF EXISTS ONLY sms.sms_transaction DROP CONSTRAINT IF EXISTS sms_transaction_pkey;
ALTER TABLE IF EXISTS ONLY sms.sms_message DROP CONSTRAINT IF EXISTS sms_message_sms_id_client_id_key;
ALTER TABLE IF EXISTS ONLY sms.sms_message DROP CONSTRAINT IF EXISTS sms_message_pkey;
ALTER TABLE IF EXISTS ONLY sms.routing DROP CONSTRAINT IF EXISTS routing_provider_id_sender_route_pattern_key;
ALTER TABLE IF EXISTS ONLY sms.routing DROP CONSTRAINT IF EXISTS routing_pkey;
ALTER TABLE IF EXISTS ONLY sms.provider DROP CONSTRAINT IF EXISTS provider_pkey;
ALTER TABLE IF EXISTS ONLY sms.provider DROP CONSTRAINT IF EXISTS provider_name_key;
ALTER TABLE IF EXISTS ONLY sms.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY sms.client DROP CONSTRAINT IF EXISTS client_pkey;
ALTER TABLE IF EXISTS ONLY sms.client DROP CONSTRAINT IF EXISTS client_name_key;
ALTER TABLE IF EXISTS ONLY script_backend.script_endpoint DROP CONSTRAINT IF EXISTS script_endpoint_pkey;
ALTER TABLE IF EXISTS ONLY script_backend.script_endpoint DROP CONSTRAINT IF EXISTS script_endpoint_name_backend_id_key;
ALTER TABLE IF EXISTS ONLY script_backend.script_backend DROP CONSTRAINT IF EXISTS script_backend_pkey;
ALTER TABLE IF EXISTS ONLY script_backend.script_backend DROP CONSTRAINT IF EXISTS script_backend_name_key;
ALTER TABLE IF EXISTS ONLY script_backend.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY scheduling.time_task DROP CONSTRAINT IF EXISTS time_task_pkey;
ALTER TABLE IF EXISTS ONLY scheduling.task_execution DROP CONSTRAINT IF EXISTS task_execution_pkey;
ALTER TABLE IF EXISTS ONLY scheduling.cron_task DROP CONSTRAINT IF EXISTS cron_task_pkey;
ALTER TABLE IF EXISTS ONLY scheduling.abstract_task DROP CONSTRAINT IF EXISTS abstract_task_pkey;
ALTER TABLE IF EXISTS ONLY scheduling.abstract_task DROP CONSTRAINT IF EXISTS abstract_task_name_key;
ALTER TABLE IF EXISTS ONLY resource_structure.scheduler_log DROP CONSTRAINT IF EXISTS scheduler_log_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.schedule DROP CONSTRAINT IF EXISTS schedule_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.schedule_gap DROP CONSTRAINT IF EXISTS schedule_gap_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.resource DROP CONSTRAINT IF EXISTS resource_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.resource_instance DROP CONSTRAINT IF EXISTS resource_instance_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.resource DROP CONSTRAINT IF EXISTS "resource_instanceId_systemName_key";
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_triggers DROP CONSTRAINT IF EXISTS qrtz_triggers_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_simprop_triggers DROP CONSTRAINT IF EXISTS qrtz_simprop_triggers_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_simple_triggers DROP CONSTRAINT IF EXISTS qrtz_simple_triggers_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_scheduler_state DROP CONSTRAINT IF EXISTS qrtz_scheduler_state_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_paused_trigger_grps DROP CONSTRAINT IF EXISTS qrtz_paused_trigger_grps_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_locks DROP CONSTRAINT IF EXISTS qrtz_locks_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_job_details DROP CONSTRAINT IF EXISTS qrtz_job_details_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_fired_triggers DROP CONSTRAINT IF EXISTS qrtz_fired_triggers_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_cron_triggers DROP CONSTRAINT IF EXISTS qrtz_cron_triggers_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_calendars DROP CONSTRAINT IF EXISTS qrtz_calendars_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.qrtz_blob_triggers DROP CONSTRAINT IF EXISTS qrtz_blob_triggers_pkey;
ALTER TABLE IF EXISTS ONLY resource_structure.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY resource_structure.schedule DROP CONSTRAINT IF EXISTS "UQ_dayOfWeek";
ALTER TABLE IF EXISTS ONLY push.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY push.certificate_winphone DROP CONSTRAINT IF EXISTS certificate_winphone_pkey;
ALTER TABLE IF EXISTS ONLY push.certificate DROP CONSTRAINT IF EXISTS certificate_pkey;
ALTER TABLE IF EXISTS ONLY push.certificate_ios DROP CONSTRAINT IF EXISTS certificate_ios_pkey;
ALTER TABLE IF EXISTS ONLY push.certificate DROP CONSTRAINT IF EXISTS certificate_ext_id_key;
ALTER TABLE IF EXISTS ONLY push.certificate_android DROP CONSTRAINT IF EXISTS certificate_android_pkey;
ALTER TABLE IF EXISTS ONLY public.sample_data DROP CONSTRAINT IF EXISTS sample_data_pkey;
ALTER TABLE IF EXISTS ONLY public.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY poll.user_status DROP CONSTRAINT IF EXISTS user_status_user_id_poll_id_key;
ALTER TABLE IF EXISTS ONLY poll.user_status DROP CONSTRAINT IF EXISTS user_status_pkey;
ALTER TABLE IF EXISTS ONLY poll.user_status_log DROP CONSTRAINT IF EXISTS user_status_log_pkey;
ALTER TABLE IF EXISTS ONLY poll.user_question DROP CONSTRAINT IF EXISTS user_question_user_id_question_id_key;
ALTER TABLE IF EXISTS ONLY poll.user_question DROP CONSTRAINT IF EXISTS user_question_pkey;
ALTER TABLE IF EXISTS ONLY poll.user_profiling_points DROP CONSTRAINT IF EXISTS user_profiling_points_pkey;
ALTER TABLE IF EXISTS ONLY poll.user_point_history DROP CONSTRAINT IF EXISTS user_point_history_pkey;
ALTER TABLE IF EXISTS ONLY poll.user_answer DROP CONSTRAINT IF EXISTS user_answer_user_question_id_answer_id_key;
ALTER TABLE IF EXISTS ONLY poll.user_answer DROP CONSTRAINT IF EXISTS user_answer_pkey;
ALTER TABLE IF EXISTS ONLY poll.question DROP CONSTRAINT IF EXISTS question_poll_id_index_key;
ALTER TABLE IF EXISTS ONLY poll.question DROP CONSTRAINT IF EXISTS question_pkey;
ALTER TABLE IF EXISTS ONLY poll.publishing DROP CONSTRAINT IF EXISTS publishing_poll_id_user_id_key;
ALTER TABLE IF EXISTS ONLY poll.publishing DROP CONSTRAINT IF EXISTS publishing_pkey;
ALTER TABLE IF EXISTS ONLY poll.poll DROP CONSTRAINT IF EXISTS poll_pkey;
ALTER TABLE IF EXISTS ONLY poll.poll_answer_profiling_point DROP CONSTRAINT IF EXISTS poll_answer_profiling_point_pkey;
ALTER TABLE IF EXISTS ONLY poll.answer DROP CONSTRAINT IF EXISTS answer_pkey;
ALTER TABLE IF EXISTS ONLY notification.log DROP CONSTRAINT IF EXISTS log_pkey;
ALTER TABLE IF EXISTS ONLY mobile_store.view DROP CONSTRAINT IF EXISTS view_pkey;
ALTER TABLE IF EXISTS ONLY mobile_store.view DROP CONSTRAINT IF EXISTS view_mobile_application_id_name_key;
ALTER TABLE IF EXISTS ONLY mobile_store.message_bundle DROP CONSTRAINT IF EXISTS message_bundle_pkey;
ALTER TABLE IF EXISTS ONLY mobile_store.message_bundle DROP CONSTRAINT IF EXISTS message_bundle_application_group_id_locale_key;
ALTER TABLE IF EXISTS ONLY mobile_store.image DROP CONSTRAINT IF EXISTS image_pkey;
ALTER TABLE IF EXISTS ONLY mobile_store.image DROP CONSTRAINT IF EXISTS image_mobile_application_id_is_main_key;
ALTER TABLE IF EXISTS ONLY mobile_store.config DROP CONSTRAINT IF EXISTS config_pkey;
ALTER TABLE IF EXISTS ONLY mobile_store.config DROP CONSTRAINT IF EXISTS config_mobile_application_id_key;
ALTER TABLE IF EXISTS ONLY large_obj_storage.file_info DROP CONSTRAINT IF EXISTS file_info_pkey;
ALTER TABLE IF EXISTS ONLY large_obj_storage.file_info DROP CONSTRAINT IF EXISTS file_info_name_bucket_id_key;
ALTER TABLE IF EXISTS ONLY large_obj_storage.bucket_info DROP CONSTRAINT IF EXISTS bucket_info_pkey;
ALTER TABLE IF EXISTS ONLY large_obj_storage.bucket_info DROP CONSTRAINT IF EXISTS bucket_info_name_key;
ALTER TABLE IF EXISTS ONLY gis.address_cache DROP CONSTRAINT IF EXISTS address_cache_pkey;
ALTER TABLE IF EXISTS ONLY email.smtp_server DROP CONSTRAINT IF EXISTS smtp_server_pkey;
ALTER TABLE IF EXISTS ONLY email.smtp_server DROP CONSTRAINT IF EXISTS smtp_server_host_port_encryption_key;
ALTER TABLE IF EXISTS ONLY email.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY email.email_account DROP CONSTRAINT IF EXISTS email_account_pkey;
ALTER TABLE IF EXISTS ONLY email.email_account DROP CONSTRAINT IF EXISTS email_account_ext_id_key;
ALTER TABLE IF EXISTS ONLY cityservices_metric.profile_info_index DROP CONSTRAINT IF EXISTS profile_info_index_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_metric.profile_info_index DROP CONSTRAINT IF EXISTS profile_info_date_time_unique_idx;
ALTER TABLE IF EXISTS ONLY cityservices_metric.event DROP CONSTRAINT IF EXISTS event_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_metric.engagement_index DROP CONSTRAINT IF EXISTS engagement_index_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_metric.engagement_index DROP CONSTRAINT IF EXISTS date_time_unique_idx;
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_template DROP CONSTRAINT IF EXISTS uniq_distribution_template_distribution_template;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_triggers DROP CONSTRAINT IF EXISTS qrtz_triggers_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_simprop_triggers DROP CONSTRAINT IF EXISTS qrtz_simprop_triggers_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_simple_triggers DROP CONSTRAINT IF EXISTS qrtz_simple_triggers_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_scheduler_state DROP CONSTRAINT IF EXISTS qrtz_scheduler_state_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_paused_trigger_grps DROP CONSTRAINT IF EXISTS qrtz_paused_trigger_grps_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_locks DROP CONSTRAINT IF EXISTS qrtz_locks_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_job_details DROP CONSTRAINT IF EXISTS qrtz_job_details_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_fired_triggers DROP CONSTRAINT IF EXISTS qrtz_fired_triggers_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_cron_triggers DROP CONSTRAINT IF EXISTS qrtz_cron_triggers_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_calendars DROP CONSTRAINT IF EXISTS qrtz_calendars_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.qrtz_blob_triggers DROP CONSTRAINT IF EXISTS qrtz_blob_triggers_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_template DROP CONSTRAINT IF EXISTS distribution_template_pkey1;
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_template_group DROP CONSTRAINT IF EXISTS distribution_template_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution DROP CONSTRAINT IF EXISTS distribution_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_log DROP CONSTRAINT IF EXISTS distribution_log_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_journal DROP CONSTRAINT IF EXISTS distribution_journal_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_has_distribution_template DROP CONSTRAINT IF EXISTS distribution_has_distribution_template_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_group DROP CONSTRAINT IF EXISTS distribution_group_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_group_has_user DROP CONSTRAINT IF EXISTS distribution_group_has_user_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.distribution_channel DROP CONSTRAINT IF EXISTS distribution_channel_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.communication_statistic_value DROP CONSTRAINT IF EXISTS communication_statistic_value_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.communication_statistic_type DROP CONSTRAINT IF EXISTS communication_statistic_type_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.communication DROP CONSTRAINT IF EXISTS communication_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_communication.communication_journal DROP CONSTRAINT IF EXISTS communication_journal_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_chats.chat DROP CONSTRAINT IF EXISTS chat_pkey;
ALTER TABLE IF EXISTS ONLY cityservices_chats.chat DROP CONSTRAINT IF EXISTS "UQ_userId__channelId";
ALTER TABLE IF EXISTS ONLY cityservices.water_meter_value DROP CONSTRAINT IF EXISTS water_meter_value_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.water_meter DROP CONSTRAINT IF EXISTS water_meter_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.vaccination_status DROP CONSTRAINT IF EXISTS vaccination_status_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.vaccination_plan_type DROP CONSTRAINT IF EXISTS vaccination_plan_type_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.vaccination_plan DROP CONSTRAINT IF EXISTS vaccination_plan_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_translation DROP CONSTRAINT IF EXISTS user_translation_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_subscription DROP CONSTRAINT IF EXISTS user_subscription_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_sos DROP CONSTRAINT IF EXISTS user_request_sos_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_history DROP CONSTRAINT IF EXISTS user_request_history_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_feedback DROP CONSTRAINT IF EXISTS user_request_feedback_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_epd DROP CONSTRAINT IF EXISTS user_request_epd_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_request_abstract DROP CONSTRAINT IF EXISTS user_request_abstract_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_profile_info DROP CONSTRAINT IF EXISTS user_profile_info_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_profile_info DROP CONSTRAINT IF EXISTS user_info_unique_idx;
ALTER TABLE IF EXISTS ONLY cityservices.user_info DROP CONSTRAINT IF EXISTS user_info_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_info DROP CONSTRAINT IF EXISTS user_info_external_id_key;
ALTER TABLE IF EXISTS ONLY cityservices.user_houses DROP CONSTRAINT IF EXISTS user_houses_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_answers DROP CONSTRAINT IF EXISTS user_answers_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.user_answers DROP CONSTRAINT IF EXISTS user_answers_person_id_question_id_key;
ALTER TABLE IF EXISTS ONLY cityservices.user_subscription DROP CONSTRAINT IF EXISTS uq_user_id__type__channel;
ALTER TABLE IF EXISTS ONLY cityservices.med_clinic_link DROP CONSTRAINT IF EXISTS uq_clinic_id__link_type__operator_id;
ALTER TABLE IF EXISTS ONLY cityservices.ui_config DROP CONSTRAINT IF EXISTS ui_config_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.translation DROP CONSTRAINT IF EXISTS translation_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.transaction DROP CONSTRAINT IF EXISTS transaction_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.transaction DROP CONSTRAINT IF EXISTS transaction_message_id_status_key;
ALTER TABLE IF EXISTS ONLY cityservices.text_service DROP CONSTRAINT IF EXISTS text_service_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.text_service_group DROP CONSTRAINT IF EXISTS text_service_group_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.text_service_group DROP CONSTRAINT IF EXISTS text_service_group_name_key;
ALTER TABLE IF EXISTS ONLY cityservices.text_service DROP CONSTRAINT IF EXISTS text_service_command_regexp_channel_type_key;
ALTER TABLE IF EXISTS ONLY cityservices.text_service_category DROP CONSTRAINT IF EXISTS text_service_category_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.text_service_category DROP CONSTRAINT IF EXISTS text_service_category_name_key;
ALTER TABLE IF EXISTS ONLY cityservices.supervisor DROP CONSTRAINT IF EXISTS supervisor_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.statistic_value DROP CONSTRAINT IF EXISTS statistic_value_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.statistic_type DROP CONSTRAINT IF EXISTS statistic_type_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.slot_history DROP CONSTRAINT IF EXISTS slot_history_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.slot_history_attachment DROP CONSTRAINT IF EXISTS slot_history_attachment_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.slot_group DROP CONSTRAINT IF EXISTS slot_group_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_subscription DROP CONSTRAINT IF EXISTS service_subscription_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_subscription_param DROP CONSTRAINT IF EXISTS service_subscription_param_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.service DROP CONSTRAINT IF EXISTS service_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_param DROP CONSTRAINT IF EXISTS service_param_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_history DROP CONSTRAINT IF EXISTS service_history_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_history_param DROP CONSTRAINT IF EXISTS service_history_param_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_favorite DROP CONSTRAINT IF EXISTS service_favorite_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_favorite_param DROP CONSTRAINT IF EXISTS service_favorite_param_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.service_category DROP CONSTRAINT IF EXISTS service_category_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.role DROP CONSTRAINT IF EXISTS role_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.role_links DROP CONSTRAINT IF EXISTS role_links_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.questions DROP CONSTRAINT IF EXISTS questions_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.published DROP CONSTRAINT IF EXISTS published_poll_id_person_id_key;
ALTER TABLE IF EXISTS ONLY cityservices.published DROP CONSTRAINT IF EXISTS published_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.profile_important_attribute DROP CONSTRAINT IF EXISTS profile_important_attribute_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.profile_attribute DROP CONSTRAINT IF EXISTS profile_attribute_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.polls DROP CONSTRAINT IF EXISTS polls_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY cityservices.offence DROP CONSTRAINT IF EXISTS offence_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.news_user_info DROP CONSTRAINT IF EXISTS news_user_info_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.news_user_info DROP CONSTRAINT IF EXISTS news_user_info_news_id_user_id_key;
ALTER TABLE IF EXISTS ONLY cityservices.news_tag DROP CONSTRAINT IF EXISTS news_tag_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.news_element DROP CONSTRAINT IF EXISTS news_element_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.news_element_has_tag DROP CONSTRAINT IF EXISTS news_element_has_tag_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.news_element_has_category DROP CONSTRAINT IF EXISTS news_element_has_category_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.news_category DROP CONSTRAINT IF EXISTS news_category_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.mime_type DROP CONSTRAINT IF EXISTS mime_type_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.mime_type DROP CONSTRAINT IF EXISTS mime_type_name_key;
ALTER TABLE IF EXISTS ONLY cityservices.message_tag DROP CONSTRAINT IF EXISTS message_tag_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.message DROP CONSTRAINT IF EXISTS message_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_treatment_slot DROP CONSTRAINT IF EXISTS med_treatment_slot_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_treatment_day DROP CONSTRAINT IF EXISTS med_treatment_day_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_speciality DROP CONSTRAINT IF EXISTS med_speciality_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_policy DROP CONSTRAINT IF EXISTS med_policy_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_hospital_unit DROP CONSTRAINT IF EXISTS med_hospital_unit_unique;
ALTER TABLE IF EXISTS ONLY cityservices.med_hospital_unit DROP CONSTRAINT IF EXISTS med_hospital_unit_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_hospital_unit_favorite DROP CONSTRAINT IF EXISTS med_hospital_unit_favorite_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_hospital DROP CONSTRAINT IF EXISTS med_hospital_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_doctor_speciality DROP CONSTRAINT IF EXISTS med_doctor_speciality_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_doctor DROP CONSTRAINT IF EXISTS med_doctor_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.med_clinic_link DROP CONSTRAINT IF EXISTS med_clinic_link_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.house DROP CONSTRAINT IF EXISTS house_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.flow DROP CONSTRAINT IF EXISTS flow_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.evacuation DROP CONSTRAINT IF EXISTS evacuation_sts_key;
ALTER TABLE IF EXISTS ONLY cityservices.evacuation DROP CONSTRAINT IF EXISTS evacuation_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.evacuation DROP CONSTRAINT IF EXISTS evacuation_grn_key;
ALTER TABLE IF EXISTS ONLY cityservices.electricity_meter_value DROP CONSTRAINT IF EXISTS electricity_meter_value_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.electricity_meter DROP CONSTRAINT IF EXISTS electricity_meter_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.confirmation DROP CONSTRAINT IF EXISTS confirmation_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complaint_statistic_by_type DROP CONSTRAINT IF EXISTS complaint_statistic_by_type_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complaint_performance_value DROP CONSTRAINT IF EXISTS complaint_performance_value_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complaint_performance_type DROP CONSTRAINT IF EXISTS complaint_performance_type_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_workflow_has_role DROP CONSTRAINT IF EXISTS complain_workflow_has_role_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_workflow_has_field DROP CONSTRAINT IF EXISTS complain_workflow_has_field_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_type DROP CONSTRAINT IF EXISTS complain_type_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_type_news_category DROP CONSTRAINT IF EXISTS complain_type_news_category_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_status_workflow DROP CONSTRAINT IF EXISTS complain_status_workflow_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_status DROP CONSTRAINT IF EXISTS complain_status_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_status_has_role DROP CONSTRAINT IF EXISTS complain_status_has_role_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain DROP CONSTRAINT IF EXISTS complain_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_history DROP CONSTRAINT IF EXISTS complain_history_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_group DROP CONSTRAINT IF EXISTS complain_group_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_group_has_role DROP CONSTRAINT IF EXISTS complain_group_has_role_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_field_value DROP CONSTRAINT IF EXISTS complain_field_value_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.complain_field DROP CONSTRAINT IF EXISTS complain_field_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.chat_channel DROP CONSTRAINT IF EXISTS chat_channel_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.chat_channel DROP CONSTRAINT IF EXISTS chat_channel_name_key;
ALTER TABLE IF EXISTS ONLY cityservices.bookmark_history_screen DROP CONSTRAINT IF EXISTS bookmark_history_screen_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.bookmark_favorite_screen DROP CONSTRAINT IF EXISTS bookmark_favorite_screen_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.available_endpoint DROP CONSTRAINT IF EXISTS available_endpoint_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.attachment DROP CONSTRAINT IF EXISTS attachment_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.answers DROP CONSTRAINT IF EXISTS answers_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.account_roles DROP CONSTRAINT IF EXISTS account_roles_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.account DROP CONSTRAINT IF EXISTS account_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.account DROP CONSTRAINT IF EXISTS account_login_key;
ALTER TABLE IF EXISTS ONLY cityservices.account_action DROP CONSTRAINT IF EXISTS account_action_pkey;
ALTER TABLE IF EXISTS ONLY cityservices.role DROP CONSTRAINT IF EXISTS "UQ_role_name";
ALTER TABLE IF EXISTS ONLY booking.slots DROP CONSTRAINT IF EXISTS slots_pkey;
ALTER TABLE IF EXISTS ONLY backend.endpoint_param_descriptor DROP CONSTRAINT IF EXISTS uniq_endpoint_param_name__endpoint;
ALTER TABLE IF EXISTS ONLY backend.abstract_endpoint_descriptor DROP CONSTRAINT IF EXISTS uniq_endpoint_name__backend;
ALTER TABLE IF EXISTS ONLY backend.split_endpoint_descriptor DROP CONSTRAINT IF EXISTS split_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.rest_endpoint_descriptor DROP CONSTRAINT IF EXISTS rest_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.rest_backend_descriptor DROP CONSTRAINT IF EXISTS rest_backend_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.mq_endpoint_descriptor DROP CONSTRAINT IF EXISTS mq_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.mq_backend_descriptor DROP CONSTRAINT IF EXISTS mq_backend_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.mongo_endpoint_descriptor DROP CONSTRAINT IF EXISTS mongo_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.mongo_backend_descriptor DROP CONSTRAINT IF EXISTS mongo_backend_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.mdm_endpoint_descriptor DROP CONSTRAINT IF EXISTS mdm_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.mdm_backend_descriptor DROP CONSTRAINT IF EXISTS mdm_backend_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.jdbc_url_parameter_string_example_value DROP CONSTRAINT IF EXISTS jdbc_url_parameter_string_example_value_pkey;
ALTER TABLE IF EXISTS ONLY backend.jdbc_url_parameter DROP CONSTRAINT IF EXISTS jdbc_url_parameter_pkey;
ALTER TABLE IF EXISTS ONLY backend.jdbc_endpoint_descriptor DROP CONSTRAINT IF EXISTS jdbc_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.jdbc_driver DROP CONSTRAINT IF EXISTS jdbc_driver_pkey;
ALTER TABLE IF EXISTS ONLY backend.jdbc_driver DROP CONSTRAINT IF EXISTS jdbc_driver_driver_class_key;
ALTER TABLE IF EXISTS ONLY backend.jdbc_backend_descriptor DROP CONSTRAINT IF EXISTS jdbc_backend_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.external_endpoint_descriptor DROP CONSTRAINT IF EXISTS external_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.external_backend_descriptor DROP CONSTRAINT IF EXISTS external_backend_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.endpoint_param_descriptor DROP CONSTRAINT IF EXISTS endpoint_param_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.emp_endpoint_descriptor DROP CONSTRAINT IF EXISTS emp_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.emp_backend_descriptor DROP CONSTRAINT IF EXISTS emp_backend_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.data_type DROP CONSTRAINT IF EXISTS data_type_pkey;
ALTER TABLE IF EXISTS ONLY backend.data_type_object_property DROP CONSTRAINT IF EXISTS data_type_object_property_pkey;
ALTER TABLE IF EXISTS ONLY backend.data_type_mdm_settings DROP CONSTRAINT IF EXISTS data_type_mdm_settings_pkey;
ALTER TABLE IF EXISTS ONLY backend.data_type_mdm_settings DROP CONSTRAINT IF EXISTS data_type_mdm_settings_application_group_id_collection_key;
ALTER TABLE IF EXISTS ONLY backend.composite_backend_descriptor DROP CONSTRAINT IF EXISTS composite_backend_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.chain_parameter_mapping DROP CONSTRAINT IF EXISTS chain_parameter_mapping_pkey;
ALTER TABLE IF EXISTS ONLY backend.chain_endpoint_descriptor DROP CONSTRAINT IF EXISTS chain_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.cache_settings DROP CONSTRAINT IF EXISTS cache_settings_pkey;
ALTER TABLE IF EXISTS ONLY backend.awip_endpoint_descriptor DROP CONSTRAINT IF EXISTS awip_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.awip_backend_descriptor DROP CONSTRAINT IF EXISTS awip_backend_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.aggregate_endpoint_descriptor DROP CONSTRAINT IF EXISTS aggregate_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.adapter_endpoint_descriptor DROP CONSTRAINT IF EXISTS adapter_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.adapter_endpoint_default_param DROP CONSTRAINT IF EXISTS adapter_endpoint_default_param_pkey;
ALTER TABLE IF EXISTS ONLY backend.adapter_backend_convertation DROP CONSTRAINT IF EXISTS adapter_backend_convertation_pkey;
ALTER TABLE IF EXISTS ONLY backend.abstract_endpoint_descriptor DROP CONSTRAINT IF EXISTS abstract_endpoint_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.abstract_backend_descriptor DROP CONSTRAINT IF EXISTS abstract_backend_descriptor_pkey;
ALTER TABLE IF EXISTS ONLY backend.abstract_backend_descriptor DROP CONSTRAINT IF EXISTS abstract_backend_descriptor_application_group_id_name_key;
ALTER TABLE IF EXISTS ONLY aaa.user_session DROP CONSTRAINT IF EXISTS user_session_pkey;
ALTER TABLE IF EXISTS ONLY aaa.user_roles_permissions DROP CONSTRAINT IF EXISTS user_roles_permissions_pkey;
ALTER TABLE IF EXISTS ONLY aaa.user_role DROP CONSTRAINT IF EXISTS user_role_pkey;
ALTER TABLE IF EXISTS ONLY aaa.user_role DROP CONSTRAINT IF EXISTS user_role_name_by_group_unique;
ALTER TABLE IF EXISTS ONLY aaa.user_role DROP CONSTRAINT IF EXISTS user_role_name_application_group_id_key;
ALTER TABLE IF EXISTS ONLY aaa.user_permission DROP CONSTRAINT IF EXISTS user_resource_type_group_unique;
ALTER TABLE IF EXISTS ONLY aaa.user_permission_type DROP CONSTRAINT IF EXISTS user_permission_type_pkey;
ALTER TABLE IF EXISTS ONLY aaa.user_permission DROP CONSTRAINT IF EXISTS user_permission_pkey;
ALTER TABLE IF EXISTS ONLY aaa.user_data_property DROP CONSTRAINT IF EXISTS user_data_property_pkey;
ALTER TABLE IF EXISTS ONLY aaa.user_accounts_roles DROP CONSTRAINT IF EXISTS user_accounts_roles_pkey;
ALTER TABLE IF EXISTS ONLY aaa.user_account DROP CONSTRAINT IF EXISTS user_account_pkey;
ALTER TABLE IF EXISTS ONLY aaa.user_account DROP CONSTRAINT IF EXISTS user_account_login_service_id_key;
ALTER TABLE IF EXISTS ONLY aaa.user_account DROP CONSTRAINT IF EXISTS user_account_application_group_id_oauth2_vkontakte_user_id_key;
ALTER TABLE IF EXISTS ONLY aaa.user_account DROP CONSTRAINT IF EXISTS user_account_application_group_id_oauth2_telegram_user_id_key;
ALTER TABLE IF EXISTS ONLY aaa.user_account DROP CONSTRAINT IF EXISTS user_account_application_group_id_oauth2_microsoft_user_id_key;
ALTER TABLE IF EXISTS ONLY aaa.user_account DROP CONSTRAINT IF EXISTS user_account_application_group_id_oauth2_google_user_id_key;
ALTER TABLE IF EXISTS ONLY aaa.user_account DROP CONSTRAINT IF EXISTS user_account_application_group_id_oauth2_facebook_user_id_key;
ALTER TABLE IF EXISTS ONLY aaa.user_account DROP CONSTRAINT IF EXISTS user_account_application_group_id_oauth1_twitter_user_id_key;
ALTER TABLE IF EXISTS ONLY aaa.user_account DROP CONSTRAINT IF EXISTS user_account_application_group_id_msisdn_key;
ALTER TABLE IF EXISTS ONLY aaa.user_account DROP CONSTRAINT IF EXISTS user_account_application_group_id_email_key;
ALTER TABLE IF EXISTS ONLY aaa.service_session DROP CONSTRAINT IF EXISTS service_session_pkey;
ALTER TABLE IF EXISTS ONLY aaa.service_role DROP CONSTRAINT IF EXISTS service_role_pkey;
ALTER TABLE IF EXISTS ONLY aaa.service_role_permissions DROP CONSTRAINT IF EXISTS service_role_permissions_pkey;
ALTER TABLE IF EXISTS ONLY aaa.service_role DROP CONSTRAINT IF EXISTS service_role_name_by_group_unique;
ALTER TABLE IF EXISTS ONLY aaa.service_permission DROP CONSTRAINT IF EXISTS service_resource_type_group_unique;
ALTER TABLE IF EXISTS ONLY aaa.application_group DROP CONSTRAINT IF EXISTS service_pkey;
ALTER TABLE IF EXISTS ONLY aaa.service_permission_type DROP CONSTRAINT IF EXISTS service_permission_type_pkey;
ALTER TABLE IF EXISTS ONLY aaa.service_permission DROP CONSTRAINT IF EXISTS service_permission_pkey;
ALTER TABLE IF EXISTS ONLY aaa.application_group DROP CONSTRAINT IF EXISTS service_name_key;
ALTER TABLE IF EXISTS ONLY aaa.service_account DROP CONSTRAINT IF EXISTS service_account_uuid_key;
ALTER TABLE IF EXISTS ONLY aaa.service_account_roles DROP CONSTRAINT IF EXISTS service_account_roles_pkey;
ALTER TABLE IF EXISTS ONLY aaa.service_account DROP CONSTRAINT IF EXISTS service_account_pkey;
ALTER TABLE IF EXISTS ONLY aaa.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY aaa.user_password DROP CONSTRAINT IF EXISTS password_pkey;
ALTER TABLE IF EXISTS ONLY aaa.mobile_app DROP CONSTRAINT IF EXISTS mobile_app_pkey;
ALTER TABLE IF EXISTS ONLY aaa.mobile_app_instance DROP CONSTRAINT IF EXISTS mobile_app_instance_pkey;
ALTER TABLE IF EXISTS ONLY aaa.mobile_app_instance DROP CONSTRAINT IF EXISTS mobile_app_instance_external_id_key;
ALTER TABLE IF EXISTS ONLY aaa.mobile_app_domain DROP CONSTRAINT IF EXISTS mobile_app_domain_pkey;
ALTER TABLE IF EXISTS ONLY aaa.mobile_app_domain DROP CONSTRAINT IF EXISTS mobile_app_domain_domain_name_key;
ALTER TABLE IF EXISTS ONLY aaa.service_account DROP CONSTRAINT IF EXISTS login_unique;
ALTER TABLE IF EXISTS ONLY aaa.ldap_configuration DROP CONSTRAINT IF EXISTS ldap_configuration_pkey;
ALTER TABLE IF EXISTS ONLY aaa.ldap_configuration DROP CONSTRAINT IF EXISTS ldap_configuration_application_group_id_domain_key;
ALTER TABLE IF EXISTS ONLY aaa.data_property_section DROP CONSTRAINT IF EXISTS data_property_section_pkey;
ALTER TABLE IF EXISTS ONLY aaa.data_property_section DROP CONSTRAINT IF EXISTS data_property_section_name_application_group_id_key;
ALTER TABLE IF EXISTS ONLY aaa.data_property DROP CONSTRAINT IF EXISTS data_property_pkey;
ALTER TABLE IF EXISTS ONLY aaa.data_property DROP CONSTRAINT IF EXISTS data_property_name_data_property_group_id_key;
ALTER TABLE IF EXISTS ONLY aaa.data_property_group DROP CONSTRAINT IF EXISTS data_property_group_pkey;
ALTER TABLE IF EXISTS ONLY aaa.data_property_group DROP CONSTRAINT IF EXISTS data_property_group_name_data_property_section_id_key;
ALTER TABLE IF EXISTS ONLY aaa.confirmation DROP CONSTRAINT IF EXISTS confirmation_pkey;
ALTER TABLE IF EXISTS ONLY aaa.confirmation DROP CONSTRAINT IF EXISTS confirmation_action_user_account_id_code_confirmed_expirati_key;
ALTER TABLE IF EXISTS webadmin.user_account ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS userstorage.attribute_value ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS userstorage.attribute_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS userstorage.attribute_descriptor ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS template.template ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS telegram_handler.task_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS telegram_handler.stored_procedure ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS telegram_handler.periodic_task ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS telegram_handler.default_keyboard ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS telegram_handler.command_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS telegram_handler.command_error ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS telegram_handler.command ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS telegram_handler.bot_listener ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS telegram_bot.telegram_bot ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS sms.sms_transaction ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS sms.sms_message ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS sms.routing ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS sms.provider ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS sms.client ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS script_backend.script_endpoint ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS script_backend.script_backend ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS scheduling.task_execution ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS scheduling.abstract_task ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS resource_structure.scheduler_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS resource_structure.schedule_gap ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS resource_structure.schedule ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS resource_structure.resource_instance ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS resource_structure.resource ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS push.certificate ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.sample_data ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS poll.user_status_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS poll.user_status ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS poll.user_question ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS poll.user_point_history ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS poll.user_answer ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS poll.question ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS poll.publishing ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS poll.poll ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS poll.answer ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS notification.log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS mobile_store.view ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS mobile_store.message_bundle ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS mobile_store.config ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS large_obj_storage.file_info ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS large_obj_storage.bucket_info ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS email.smtp_server ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS email.email_account ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_metric.profile_info_index ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_metric.event ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_metric.engagement_index ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_communication.distribution_template_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_communication.distribution_template ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_communication.distribution_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_communication.distribution_journal ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_communication.distribution_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_communication.distribution_channel ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_communication.distribution ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_communication.communication_statistic_value ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_communication.communication_statistic_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_communication.communication_journal ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_communication.communication ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_chats.chat_message ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices_chats.chat ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.water_meter_value ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.water_meter ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.vaccination_status ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.vaccination_plan_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.vaccination_plan ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.user_subscription ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.user_request_history ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.user_request_abstract ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.user_profile_info ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.user_info ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.user_houses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.user_geoposition ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.user_answers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.transaction ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.text_service_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.text_service_category ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.text_service ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.supervisor ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.statistic_value ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.statistic_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.slot_history_attachment ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.slot_history ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.slot_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.service_subscription_param ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.service_subscription ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.service_param ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.service_history_param ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.service_history ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.service_favorite_param ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.service_favorite ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.service_category ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.service ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.role ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.questions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.published ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.profile_important_attribute ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.profile_attribute ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.polls ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.offence ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.news_user_info ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.news_tag ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.news_element ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.news_category ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.mime_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.message_tag ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.message ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.med_treatment_slot ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.med_treatment_day ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.med_speciality ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.med_policy ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.med_hospital_unit_favorite ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.med_hospital_unit ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.med_hospital ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.med_doctor_speciality ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.med_doctor ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.med_clinic_link ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.house ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.flow ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.evacuation ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.electricity_meter_value ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.electricity_meter ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.confirmation ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.complaint_statistic_by_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.complaint_performance_value ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.complaint_performance_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.complain_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.complain_status_workflow ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.complain_status ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.complain_history ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.complain_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.complain_field_value ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.complain_field ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.complain ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.chat_message ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.chat_channel ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.bookmark_history_screen ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.bookmark_favorite_screen ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.available_endpoint ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.attachment ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.answers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.account_action ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS cityservices.account ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS booking.slots ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS backend.jdbc_url_parameter_string_example_value ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS backend.jdbc_url_parameter ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS backend.jdbc_driver ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS backend.endpoint_param_descriptor ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS backend.data_type_object_property ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS backend.data_type_mdm_settings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS backend.data_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS backend.chain_parameter_mapping ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS backend.adapter_endpoint_default_param ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS backend.adapter_backend_convertation ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS backend.abstract_endpoint_descriptor ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS backend.abstract_backend_descriptor ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.user_role ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.user_permission_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.user_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.user_password ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.user_data_property ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.user_account ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.service_role ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.service_permission_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.service_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.service_account ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.mobile_app_instance ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.mobile_app ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.ldap_configuration ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.data_property_section ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.data_property_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.data_property ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.confirmation ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS aaa.application_group ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS webadmin.user_role;
DROP SEQUENCE IF EXISTS webadmin.user_account_id_seq;
DROP TABLE IF EXISTS webadmin.user_account;
DROP TABLE IF EXISTS webadmin.task_meta_data;
DROP TABLE IF EXISTS webadmin.databasechangeloglock;
DROP TABLE IF EXISTS webadmin.databasechangelog;
DROP TABLE IF EXISTS userstorage.databasechangeloglock;
DROP TABLE IF EXISTS userstorage.databasechangelog;
DROP SEQUENCE IF EXISTS userstorage.attribute_value_id_seq;
DROP TABLE IF EXISTS userstorage.attribute_value;
DROP SEQUENCE IF EXISTS userstorage.attribute_type_id_seq;
DROP TABLE IF EXISTS userstorage.attribute_type;
DROP SEQUENCE IF EXISTS userstorage.attribute_descriptor_id_seq;
DROP TABLE IF EXISTS userstorage.attribute_descriptor;
DROP SEQUENCE IF EXISTS template.template_id_seq;
DROP TABLE IF EXISTS template.template;
DROP TABLE IF EXISTS template.i18n_params;
DROP TABLE IF EXISTS temp.template;
DROP TABLE IF EXISTS temp.i18n_params;
DROP TABLE IF EXISTS telegram_transport.telegram_bot;
DROP SEQUENCE IF EXISTS telegram_handler.task_log_id_seq;
DROP TABLE IF EXISTS telegram_handler.task_log_aggregation;
DROP TABLE IF EXISTS telegram_handler.task_log;
DROP SEQUENCE IF EXISTS telegram_handler.stored_procedure_id_seq;
DROP TABLE IF EXISTS telegram_handler.stored_procedure;
DROP TABLE IF EXISTS telegram_handler.qrtz_triggers;
DROP TABLE IF EXISTS telegram_handler.qrtz_simprop_triggers;
DROP TABLE IF EXISTS telegram_handler.qrtz_simple_triggers;
DROP TABLE IF EXISTS telegram_handler.qrtz_scheduler_state;
DROP TABLE IF EXISTS telegram_handler.qrtz_paused_trigger_grps;
DROP TABLE IF EXISTS telegram_handler.qrtz_locks;
DROP TABLE IF EXISTS telegram_handler.qrtz_job_details;
DROP TABLE IF EXISTS telegram_handler.qrtz_fired_triggers;
DROP TABLE IF EXISTS telegram_handler.qrtz_cron_triggers;
DROP TABLE IF EXISTS telegram_handler.qrtz_calendars;
DROP TABLE IF EXISTS telegram_handler.qrtz_blob_triggers;
DROP SEQUENCE IF EXISTS telegram_handler.periodic_task_id_seq;
DROP TABLE IF EXISTS telegram_handler.periodic_task;
DROP SEQUENCE IF EXISTS telegram_handler.default_keyboard_id_seq;
DROP TABLE IF EXISTS telegram_handler.default_keyboard;
DROP SEQUENCE IF EXISTS telegram_handler.command_id_seq;
DROP SEQUENCE IF EXISTS telegram_handler.command_group_id_seq;
DROP TABLE IF EXISTS telegram_handler.command_group;
DROP SEQUENCE IF EXISTS telegram_handler.command_error_id_seq;
DROP TABLE IF EXISTS telegram_handler.command_error;
DROP TABLE IF EXISTS telegram_handler.command;
DROP SEQUENCE IF EXISTS telegram_handler.bot_listener_id_seq;
DROP TABLE IF EXISTS telegram_handler.bot_listener;
DROP SEQUENCE IF EXISTS telegram_bot.telegram_bot_id_seq;
DROP TABLE IF EXISTS telegram_bot.telegram_bot;
DROP TABLE IF EXISTS telegram_bot.databasechangeloglock;
DROP TABLE IF EXISTS telegram_bot.databasechangelog;
DROP TABLE IF EXISTS storage.databasechangeloglock;
DROP TABLE IF EXISTS storage.databasechangelog;
DROP SEQUENCE IF EXISTS sms.sms_transaction_id_seq;
DROP TABLE IF EXISTS sms.sms_transaction;
DROP SEQUENCE IF EXISTS sms.sms_message_id_seq;
DROP TABLE IF EXISTS sms.sms_message;
DROP SEQUENCE IF EXISTS sms.routing_id_seq;
DROP TABLE IF EXISTS sms.routing;
DROP SEQUENCE IF EXISTS sms.provider_id_seq;
DROP TABLE IF EXISTS sms.provider;
DROP TABLE IF EXISTS sms.databasechangeloglock;
DROP TABLE IF EXISTS sms.databasechangelog;
DROP SEQUENCE IF EXISTS sms.client_id_seq;
DROP TABLE IF EXISTS sms.client;
DROP SEQUENCE IF EXISTS script_backend.script_endpoint_id_seq;
DROP TABLE IF EXISTS script_backend.script_endpoint;
DROP SEQUENCE IF EXISTS script_backend.script_backend_id_seq;
DROP TABLE IF EXISTS script_backend.script_backend;
DROP TABLE IF EXISTS script_backend.databasechangeloglock;
DROP TABLE IF EXISTS script_backend.databasechangelog;
DROP TABLE IF EXISTS scheduling.time_task;
DROP SEQUENCE IF EXISTS scheduling.task_execution_id_seq;
DROP TABLE IF EXISTS scheduling.task_execution;
DROP TABLE IF EXISTS scheduling.cron_task;
DROP SEQUENCE IF EXISTS scheduling.abstract_task_id_seq;
DROP TABLE IF EXISTS scheduling.abstract_task;
DROP SEQUENCE IF EXISTS resource_structure.scheduler_log_id_seq;
DROP TABLE IF EXISTS resource_structure.scheduler_log;
DROP SEQUENCE IF EXISTS resource_structure.schedule_id_seq;
DROP SEQUENCE IF EXISTS resource_structure.schedule_gap_id_seq;
DROP TABLE IF EXISTS resource_structure.schedule_gap;
DROP TABLE IF EXISTS resource_structure.schedule;
DROP SEQUENCE IF EXISTS resource_structure.resource_instance_id_seq;
DROP TABLE IF EXISTS resource_structure.resource_instance;
DROP SEQUENCE IF EXISTS resource_structure.resource_id_seq;
DROP TABLE IF EXISTS resource_structure.resource;
DROP TABLE IF EXISTS resource_structure.qrtz_triggers;
DROP TABLE IF EXISTS resource_structure.qrtz_simprop_triggers;
DROP TABLE IF EXISTS resource_structure.qrtz_simple_triggers;
DROP TABLE IF EXISTS resource_structure.qrtz_scheduler_state;
DROP TABLE IF EXISTS resource_structure.qrtz_paused_trigger_grps;
DROP TABLE IF EXISTS resource_structure.qrtz_locks;
DROP TABLE IF EXISTS resource_structure.qrtz_job_details;
DROP TABLE IF EXISTS resource_structure.qrtz_fired_triggers;
DROP TABLE IF EXISTS resource_structure.qrtz_cron_triggers;
DROP TABLE IF EXISTS resource_structure.qrtz_calendars;
DROP TABLE IF EXISTS resource_structure.qrtz_blob_triggers;
DROP TABLE IF EXISTS resource_structure.databasechangeloglock;
DROP TABLE IF EXISTS resource_structure.databasechangelog;
DROP TABLE IF EXISTS push.databasechangeloglock;
DROP TABLE IF EXISTS push.databasechangelog;
DROP TABLE IF EXISTS push.certificate_winphone;
DROP TABLE IF EXISTS push.certificate_ios;
DROP SEQUENCE IF EXISTS push.certificate_id_seq;
DROP TABLE IF EXISTS push.certificate_android;
DROP TABLE IF EXISTS push.certificate;
DROP SEQUENCE IF EXISTS public.sample_data_id_seq;
DROP TABLE IF EXISTS public.sample_data;
DROP TABLE IF EXISTS public.databasechangeloglock;
DROP TABLE IF EXISTS public.databasechangelog;
DROP SEQUENCE IF EXISTS poll.user_status_log_id_seq;
DROP TABLE IF EXISTS poll.user_status_log;
DROP SEQUENCE IF EXISTS poll.user_status_id_seq;
DROP TABLE IF EXISTS poll.user_status;
DROP SEQUENCE IF EXISTS poll.user_question_id_seq;
DROP TABLE IF EXISTS poll.user_question;
DROP TABLE IF EXISTS poll.user_profiling_points;
DROP SEQUENCE IF EXISTS poll.user_point_history_id_seq;
DROP TABLE IF EXISTS poll.user_point_history;
DROP SEQUENCE IF EXISTS poll.user_answer_id_seq;
DROP TABLE IF EXISTS poll.user_answer;
DROP SEQUENCE IF EXISTS poll.question_id_seq;
DROP TABLE IF EXISTS poll.question;
DROP SEQUENCE IF EXISTS poll.publishing_id_seq;
DROP TABLE IF EXISTS poll.publishing;
DROP SEQUENCE IF EXISTS poll.poll_id_seq;
DROP TABLE IF EXISTS poll.poll_answer_profiling_point;
DROP TABLE IF EXISTS poll.poll;
DROP SEQUENCE IF EXISTS poll.answer_id_seq;
DROP TABLE IF EXISTS poll.answer;
DROP SEQUENCE IF EXISTS notification.log_id_seq;
DROP TABLE IF EXISTS notification.log;
DROP SEQUENCE IF EXISTS mobile_store.view_id_seq;
DROP TABLE IF EXISTS mobile_store.view;
DROP SEQUENCE IF EXISTS mobile_store.message_bundle_id_seq;
DROP TABLE IF EXISTS mobile_store.message_bundle;
DROP TABLE IF EXISTS mobile_store.image;
DROP SEQUENCE IF EXISTS mobile_store.config_id_seq;
DROP TABLE IF EXISTS mobile_store.config;
DROP SEQUENCE IF EXISTS large_obj_storage.file_info_id_seq;
DROP TABLE IF EXISTS large_obj_storage.file_info;
DROP SEQUENCE IF EXISTS large_obj_storage.bucket_info_id_seq;
DROP TABLE IF EXISTS large_obj_storage.bucket_info;
DROP TABLE IF EXISTS gis.address_cache;
DROP SEQUENCE IF EXISTS email.smtp_server_id_seq;
DROP TABLE IF EXISTS email.smtp_server;
DROP SEQUENCE IF EXISTS email.email_account_id_seq;
DROP TABLE IF EXISTS email.email_account;
DROP TABLE IF EXISTS email.databasechangeloglock;
DROP TABLE IF EXISTS email.databasechangelog;
DROP SEQUENCE IF EXISTS cityservices_metric.profile_info_index_id_seq;
DROP TABLE IF EXISTS cityservices_metric.profile_info_index;
DROP SEQUENCE IF EXISTS cityservices_metric.event_id_seq;
DROP TABLE IF EXISTS cityservices_metric.event;
DROP SEQUENCE IF EXISTS cityservices_metric.engagement_index_id_seq;
DROP TABLE IF EXISTS cityservices_metric.engagement_index;
DROP TABLE IF EXISTS cityservices_communication.qrtz_triggers;
DROP TABLE IF EXISTS cityservices_communication.qrtz_simprop_triggers;
DROP TABLE IF EXISTS cityservices_communication.qrtz_simple_triggers;
DROP TABLE IF EXISTS cityservices_communication.qrtz_scheduler_state;
DROP TABLE IF EXISTS cityservices_communication.qrtz_paused_trigger_grps;
DROP TABLE IF EXISTS cityservices_communication.qrtz_locks;
DROP TABLE IF EXISTS cityservices_communication.qrtz_job_details;
DROP TABLE IF EXISTS cityservices_communication.qrtz_fired_triggers;
DROP TABLE IF EXISTS cityservices_communication.qrtz_cron_triggers;
DROP TABLE IF EXISTS cityservices_communication.qrtz_calendars;
DROP TABLE IF EXISTS cityservices_communication.qrtz_blob_triggers;
DROP SEQUENCE IF EXISTS cityservices_communication.distribution_template_id_seq1;
DROP SEQUENCE IF EXISTS cityservices_communication.distribution_template_id_seq;
DROP TABLE IF EXISTS cityservices_communication.distribution_template_group;
DROP TABLE IF EXISTS cityservices_communication.distribution_template;
DROP SEQUENCE IF EXISTS cityservices_communication.distribution_log_id_seq;
DROP TABLE IF EXISTS cityservices_communication.distribution_log;
DROP SEQUENCE IF EXISTS cityservices_communication.distribution_journal_id_seq;
DROP TABLE IF EXISTS cityservices_communication.distribution_journal;
DROP SEQUENCE IF EXISTS cityservices_communication.distribution_id_seq;
DROP TABLE IF EXISTS cityservices_communication.distribution_has_distribution_template;
DROP SEQUENCE IF EXISTS cityservices_communication.distribution_group_id_seq;
DROP TABLE IF EXISTS cityservices_communication.distribution_group_has_user;
DROP TABLE IF EXISTS cityservices_communication.distribution_group;
DROP SEQUENCE IF EXISTS cityservices_communication.distribution_channel_id_seq;
DROP TABLE IF EXISTS cityservices_communication.distribution_channel;
DROP TABLE IF EXISTS cityservices_communication.distribution;
DROP SEQUENCE IF EXISTS cityservices_communication.communication_statistic_value_id_seq;
DROP TABLE IF EXISTS cityservices_communication.communication_statistic_value;
DROP SEQUENCE IF EXISTS cityservices_communication.communication_statistic_type_id_seq;
DROP TABLE IF EXISTS cityservices_communication.communication_statistic_type;
DROP SEQUENCE IF EXISTS cityservices_communication.communication_journal_id_seq;
DROP TABLE IF EXISTS cityservices_communication.communication_journal;
DROP SEQUENCE IF EXISTS cityservices_communication.communication_id_seq;
DROP TABLE IF EXISTS cityservices_communication.communication;
DROP SEQUENCE IF EXISTS cityservices_chats.chat_message_id_seq;
DROP TABLE IF EXISTS cityservices_chats.chat_message;
DROP SEQUENCE IF EXISTS cityservices_chats.chat_id_seq;
DROP TABLE IF EXISTS cityservices_chats.chat;
DROP SEQUENCE IF EXISTS cityservices.water_meter_value_id_seq;
DROP TABLE IF EXISTS cityservices.water_meter_value;
DROP SEQUENCE IF EXISTS cityservices.water_meter_id_seq;
DROP TABLE IF EXISTS cityservices.water_meter;
DROP SEQUENCE IF EXISTS cityservices.vaccination_status_id_seq;
DROP TABLE IF EXISTS cityservices.vaccination_status;
DROP SEQUENCE IF EXISTS cityservices.vaccination_plan_type_id_seq;
DROP TABLE IF EXISTS cityservices.vaccination_plan_type;
DROP SEQUENCE IF EXISTS cityservices.vaccination_plan_id_seq;
DROP TABLE IF EXISTS cityservices.vaccination_plan;
DROP TABLE IF EXISTS cityservices.user_translation;
DROP SEQUENCE IF EXISTS cityservices.user_subscription_id_seq;
DROP TABLE IF EXISTS cityservices.user_subscription;
DROP TABLE IF EXISTS cityservices.user_request_sos;
DROP SEQUENCE IF EXISTS cityservices.user_request_history_id_seq;
DROP TABLE IF EXISTS cityservices.user_request_history;
DROP TABLE IF EXISTS cityservices.user_request_feedback;
DROP TABLE IF EXISTS cityservices.user_request_epd;
DROP SEQUENCE IF EXISTS cityservices.user_request_abstract_id_seq;
DROP TABLE IF EXISTS cityservices.user_request_abstract;
DROP SEQUENCE IF EXISTS cityservices.user_profile_info_id_seq;
DROP TABLE IF EXISTS cityservices.user_profile_info;
DROP SEQUENCE IF EXISTS cityservices.user_info_id_seq;
DROP TABLE IF EXISTS cityservices.user_info;
DROP SEQUENCE IF EXISTS cityservices.user_houses_id_seq;
DROP TABLE IF EXISTS cityservices.user_houses;
DROP SEQUENCE IF EXISTS cityservices.user_geoposition_id_seq;
DROP TABLE IF EXISTS cityservices.user_geoposition;
DROP SEQUENCE IF EXISTS cityservices.user_answers_id_seq;
DROP TABLE IF EXISTS cityservices.user_answers;
DROP TABLE IF EXISTS cityservices.ui_config;
DROP TABLE IF EXISTS cityservices.translation;
DROP SEQUENCE IF EXISTS cityservices.transaction_id_seq;
DROP TABLE IF EXISTS cityservices.transaction;
DROP SEQUENCE IF EXISTS cityservices.text_service_id_seq;
DROP SEQUENCE IF EXISTS cityservices.text_service_group_id_seq;
DROP TABLE IF EXISTS cityservices.text_service_group;
DROP SEQUENCE IF EXISTS cityservices.text_service_category_id_seq;
DROP TABLE IF EXISTS cityservices.text_service_category;
DROP TABLE IF EXISTS cityservices.text_service;
DROP SEQUENCE IF EXISTS cityservices.supervisor_id_seq;
DROP TABLE IF EXISTS cityservices.supervisor;
DROP SEQUENCE IF EXISTS cityservices.statistic_value_id_seq;
DROP TABLE IF EXISTS cityservices.statistic_value;
DROP SEQUENCE IF EXISTS cityservices.statistic_type_id_seq;
DROP TABLE IF EXISTS cityservices.statistic_type;
DROP SEQUENCE IF EXISTS cityservices.slot_history_id_seq;
DROP SEQUENCE IF EXISTS cityservices.slot_history_attachment_id_seq;
DROP TABLE IF EXISTS cityservices.slot_history_attachment;
DROP TABLE IF EXISTS cityservices.slot_history;
DROP SEQUENCE IF EXISTS cityservices.slot_group_id_seq;
DROP TABLE IF EXISTS cityservices.slot_group;
DROP SEQUENCE IF EXISTS cityservices.service_subscription_param_id_seq;
DROP TABLE IF EXISTS cityservices.service_subscription_param;
DROP SEQUENCE IF EXISTS cityservices.service_subscription_id_seq;
DROP TABLE IF EXISTS cityservices.service_subscription;
DROP SEQUENCE IF EXISTS cityservices.service_param_id_seq;
DROP TABLE IF EXISTS cityservices.service_param;
DROP SEQUENCE IF EXISTS cityservices.service_id_seq;
DROP SEQUENCE IF EXISTS cityservices.service_history_param_id_seq;
DROP TABLE IF EXISTS cityservices.service_history_param;
DROP SEQUENCE IF EXISTS cityservices.service_history_id_seq;
DROP TABLE IF EXISTS cityservices.service_history;
DROP SEQUENCE IF EXISTS cityservices.service_favorite_param_id_seq;
DROP TABLE IF EXISTS cityservices.service_favorite_param;
DROP SEQUENCE IF EXISTS cityservices.service_favorite_id_seq;
DROP TABLE IF EXISTS cityservices.service_favorite;
DROP SEQUENCE IF EXISTS cityservices.service_category_id_seq;
DROP TABLE IF EXISTS cityservices.service_category;
DROP TABLE IF EXISTS cityservices.service;
DROP TABLE IF EXISTS cityservices.role_links;
DROP SEQUENCE IF EXISTS cityservices.role_id_seq;
DROP TABLE IF EXISTS cityservices.role;
DROP SEQUENCE IF EXISTS cityservices.questions_id_seq;
DROP TABLE IF EXISTS cityservices.questions;
DROP SEQUENCE IF EXISTS cityservices.published_id_seq;
DROP TABLE IF EXISTS cityservices.published;
DROP SEQUENCE IF EXISTS cityservices.profile_important_attribute_id_seq;
DROP TABLE IF EXISTS cityservices.profile_important_attribute;
DROP SEQUENCE IF EXISTS cityservices.profile_attribute_id_seq;
DROP TABLE IF EXISTS cityservices.profile_attribute;
DROP SEQUENCE IF EXISTS cityservices.polls_id_seq;
DROP TABLE IF EXISTS cityservices.polls;
DROP SEQUENCE IF EXISTS cityservices.offence_id_seq;
DROP TABLE IF EXISTS cityservices.offence;
DROP SEQUENCE IF EXISTS cityservices.news_user_info_id_seq;
DROP TABLE IF EXISTS cityservices.news_user_info;
DROP SEQUENCE IF EXISTS cityservices.news_tag_id_seq;
DROP TABLE IF EXISTS cityservices.news_tag;
DROP SEQUENCE IF EXISTS cityservices.news_element_id_seq;
DROP TABLE IF EXISTS cityservices.news_element_has_tag;
DROP TABLE IF EXISTS cityservices.news_element_has_category;
DROP TABLE IF EXISTS cityservices.news_element;
DROP SEQUENCE IF EXISTS cityservices.news_category_id_seq;
DROP TABLE IF EXISTS cityservices.news_category;
DROP SEQUENCE IF EXISTS cityservices.mime_type_id_seq;
DROP TABLE IF EXISTS cityservices.mime_type;
DROP SEQUENCE IF EXISTS cityservices.message_tag_id_seq;
DROP TABLE IF EXISTS cityservices.message_tag;
DROP SEQUENCE IF EXISTS cityservices.message_id_seq;
DROP TABLE IF EXISTS cityservices.message;
DROP SEQUENCE IF EXISTS cityservices.med_treatment_slot_id_seq;
DROP TABLE IF EXISTS cityservices.med_treatment_slot;
DROP SEQUENCE IF EXISTS cityservices.med_treatment_day_id_seq;
DROP TABLE IF EXISTS cityservices.med_treatment_day;
DROP SEQUENCE IF EXISTS cityservices.med_speciality_id_seq;
DROP TABLE IF EXISTS cityservices.med_speciality;
DROP SEQUENCE IF EXISTS cityservices.med_policy_id_seq;
DROP TABLE IF EXISTS cityservices.med_policy;
DROP SEQUENCE IF EXISTS cityservices.med_hospital_unit_id_seq;
DROP SEQUENCE IF EXISTS cityservices.med_hospital_unit_favorite_id_seq;
DROP TABLE IF EXISTS cityservices.med_hospital_unit_favorite;
DROP TABLE IF EXISTS cityservices.med_hospital_unit;
DROP TABLE IF EXISTS cityservices.med_hospital_policy;
DROP SEQUENCE IF EXISTS cityservices.med_hospital_id_seq;
DROP TABLE IF EXISTS cityservices.med_hospital;
DROP SEQUENCE IF EXISTS cityservices.med_doctor_speciality_id_seq;
DROP TABLE IF EXISTS cityservices.med_doctor_speciality;
DROP SEQUENCE IF EXISTS cityservices.med_doctor_id_seq;
DROP TABLE IF EXISTS cityservices.med_doctor;
DROP SEQUENCE IF EXISTS cityservices.med_clinic_link_id_seq;
DROP TABLE IF EXISTS cityservices.med_clinic_link;
DROP SEQUENCE IF EXISTS cityservices.house_id_seq;
DROP TABLE IF EXISTS cityservices.house;
DROP SEQUENCE IF EXISTS cityservices.flow_id_seq;
DROP TABLE IF EXISTS cityservices.flow;
DROP SEQUENCE IF EXISTS cityservices.evacuation_id_seq;
DROP TABLE IF EXISTS cityservices.evacuation;
DROP SEQUENCE IF EXISTS cityservices.electricity_meter_value_id_seq;
DROP TABLE IF EXISTS cityservices.electricity_meter_value;
DROP SEQUENCE IF EXISTS cityservices.electricity_meter_id_seq;
DROP TABLE IF EXISTS cityservices.electricity_meter;
DROP TABLE IF EXISTS cityservices.databasechangeloglock;
DROP TABLE IF EXISTS cityservices.databasechangelog;
DROP SEQUENCE IF EXISTS cityservices.confirmation_id_seq;
DROP TABLE IF EXISTS cityservices.confirmation;
DROP SEQUENCE IF EXISTS cityservices.complaint_statistic_by_type_id_seq;
DROP TABLE IF EXISTS cityservices.complaint_statistic_by_type;
DROP SEQUENCE IF EXISTS cityservices.complaint_performance_value_id_seq;
DROP TABLE IF EXISTS cityservices.complaint_performance_value;
DROP SEQUENCE IF EXISTS cityservices.complaint_performance_type_id_seq;
DROP TABLE IF EXISTS cityservices.complaint_performance_type;
DROP TABLE IF EXISTS cityservices.complain_workflow_has_role;
DROP TABLE IF EXISTS cityservices.complain_workflow_has_field;
DROP TABLE IF EXISTS cityservices.complain_type_news_category;
DROP SEQUENCE IF EXISTS cityservices.complain_type_id_seq;
DROP TABLE IF EXISTS cityservices.complain_type;
DROP SEQUENCE IF EXISTS cityservices.complain_status_workflow_id_seq;
DROP TABLE IF EXISTS cityservices.complain_status_workflow;
DROP SEQUENCE IF EXISTS cityservices.complain_status_id_seq;
DROP TABLE IF EXISTS cityservices.complain_status_has_role;
DROP TABLE IF EXISTS cityservices.complain_status;
DROP SEQUENCE IF EXISTS cityservices.complain_id_seq;
DROP SEQUENCE IF EXISTS cityservices.complain_history_id_seq;
DROP TABLE IF EXISTS cityservices.complain_history;
DROP SEQUENCE IF EXISTS cityservices.complain_group_id_seq;
DROP TABLE IF EXISTS cityservices.complain_group_has_role;
DROP TABLE IF EXISTS cityservices.complain_group;
DROP SEQUENCE IF EXISTS cityservices.complain_field_value_id_seq;
DROP TABLE IF EXISTS cityservices.complain_field_value;
DROP SEQUENCE IF EXISTS cityservices.complain_field_id_seq;
DROP TABLE IF EXISTS cityservices.complain_field;
DROP TABLE IF EXISTS cityservices.complain;
DROP SEQUENCE IF EXISTS cityservices.chat_message_id_seq;
DROP TABLE IF EXISTS cityservices.chat_message;
DROP SEQUENCE IF EXISTS cityservices.chat_channel_id_seq;
DROP TABLE IF EXISTS cityservices.chat_channel;
DROP SEQUENCE IF EXISTS cityservices.bookmark_history_screen_id_seq;
DROP TABLE IF EXISTS cityservices.bookmark_history_screen;
DROP SEQUENCE IF EXISTS cityservices.bookmark_favorite_screen_id_seq;
DROP TABLE IF EXISTS cityservices.bookmark_favorite_screen;
DROP SEQUENCE IF EXISTS cityservices.available_endpoint_id_seq;
DROP TABLE IF EXISTS cityservices.available_endpoint;
DROP SEQUENCE IF EXISTS cityservices.attachment_id_seq;
DROP TABLE IF EXISTS cityservices.attachment;
DROP SEQUENCE IF EXISTS cityservices.answers_id_seq;
DROP TABLE IF EXISTS cityservices.answers;
DROP TABLE IF EXISTS cityservices.account_roles;
DROP SEQUENCE IF EXISTS cityservices.account_id_seq;
DROP SEQUENCE IF EXISTS cityservices.account_action_id_seq;
DROP TABLE IF EXISTS cityservices.account_action;
DROP TABLE IF EXISTS cityservices.account;
DROP SEQUENCE IF EXISTS booking.slots_id_seq;
DROP TABLE IF EXISTS booking.slots;
DROP TABLE IF EXISTS backend.split_endpoint_descriptor;
DROP TABLE IF EXISTS backend.rest_endpoint_descriptor;
DROP TABLE IF EXISTS backend.rest_backend_descriptor;
DROP TABLE IF EXISTS backend.mq_endpoint_descriptor;
DROP TABLE IF EXISTS backend.mq_backend_descriptor;
DROP TABLE IF EXISTS backend.mongo_endpoint_descriptor;
DROP TABLE IF EXISTS backend.mongo_backend_descriptor;
DROP TABLE IF EXISTS backend.mdm_endpoint_descriptor;
DROP TABLE IF EXISTS backend.mdm_backend_descriptor;
DROP TABLE IF EXISTS backend.join_aggregate_endpoint;
DROP SEQUENCE IF EXISTS backend.jdbc_url_parameter_string_example_value_id_seq;
DROP TABLE IF EXISTS backend.jdbc_url_parameter_string_example_value;
DROP SEQUENCE IF EXISTS backend.jdbc_url_parameter_id_seq;
DROP TABLE IF EXISTS backend.jdbc_url_parameter;
DROP TABLE IF EXISTS backend.jdbc_endpoint_descriptor;
DROP SEQUENCE IF EXISTS backend.jdbc_driver_id_seq;
DROP TABLE IF EXISTS backend.jdbc_driver;
DROP TABLE IF EXISTS backend.jdbc_backend_descriptor;
DROP TABLE IF EXISTS backend.external_endpoint_descriptor;
DROP TABLE IF EXISTS backend.external_backend_descriptor;
DROP SEQUENCE IF EXISTS backend.endpoint_param_descriptor_id_seq;
DROP TABLE IF EXISTS backend.endpoint_param_descriptor;
DROP TABLE IF EXISTS backend.endpoint_isolation;
DROP TABLE IF EXISTS backend.emp_endpoint_descriptor;
DROP TABLE IF EXISTS backend.emp_backend_descriptor;
DROP SEQUENCE IF EXISTS backend.data_type_object_property_id_seq;
DROP TABLE IF EXISTS backend.data_type_object_property;
DROP SEQUENCE IF EXISTS backend.data_type_mdm_settings_id_seq;
DROP TABLE IF EXISTS backend.data_type_mdm_settings;
DROP SEQUENCE IF EXISTS backend.data_type_id_seq;
DROP TABLE IF EXISTS backend.data_type;
DROP TABLE IF EXISTS backend.composite_backend_descriptor;
DROP TABLE IF EXISTS backend.chain_target_mapping;
DROP TABLE IF EXISTS backend.chain_source_mapping;
DROP SEQUENCE IF EXISTS backend.chain_parameter_mapping_id_seq;
DROP TABLE IF EXISTS backend.chain_parameter_mapping;
DROP TABLE IF EXISTS backend.chain_endpoint_descriptor;
DROP TABLE IF EXISTS backend.cache_settings;
DROP TABLE IF EXISTS backend.awip_endpoint_descriptor;
DROP TABLE IF EXISTS backend.awip_backend_descriptor;
DROP TABLE IF EXISTS backend.aggregate_endpoint_descriptor;
DROP TABLE IF EXISTS backend.adapter_result_convertation;
DROP TABLE IF EXISTS backend.adapter_param_convertation;
DROP TABLE IF EXISTS backend.adapter_endpoint_descriptor;
DROP SEQUENCE IF EXISTS backend.adapter_endpoint_default_param_id_seq;
DROP TABLE IF EXISTS backend.adapter_endpoint_default_param;
DROP SEQUENCE IF EXISTS backend.adapter_backend_convertation_id_seq;
DROP TABLE IF EXISTS backend.adapter_backend_convertation;
DROP SEQUENCE IF EXISTS backend.abstract_endpoint_descriptor_id_seq;
DROP TABLE IF EXISTS backend.abstract_endpoint_descriptor;
DROP SEQUENCE IF EXISTS backend.abstract_backend_descriptor_id_seq;
DROP TABLE IF EXISTS backend.abstract_backend_descriptor;
DROP TABLE IF EXISTS aaa.user_session;
DROP TABLE IF EXISTS aaa.user_roles_permissions;
DROP SEQUENCE IF EXISTS aaa.user_role_id_seq;
DROP TABLE IF EXISTS aaa.user_role;
DROP SEQUENCE IF EXISTS aaa.user_permission_type_id_seq;
DROP TABLE IF EXISTS aaa.user_permission_type;
DROP SEQUENCE IF EXISTS aaa.user_permission_id_seq;
DROP TABLE IF EXISTS aaa.user_permission;
DROP SEQUENCE IF EXISTS aaa.user_data_property_id_seq;
DROP TABLE IF EXISTS aaa.user_data_property;
DROP TABLE IF EXISTS aaa.user_accounts_roles;
DROP SEQUENCE IF EXISTS aaa.user_account_id_seq;
DROP TABLE IF EXISTS aaa.user_account;
DROP TABLE IF EXISTS aaa.service_session;
DROP TABLE IF EXISTS aaa.service_role_permissions;
DROP SEQUENCE IF EXISTS aaa.service_role_id_seq;
DROP TABLE IF EXISTS aaa.service_role;
DROP SEQUENCE IF EXISTS aaa.service_permission_type_id_seq;
DROP TABLE IF EXISTS aaa.service_permission_type;
DROP SEQUENCE IF EXISTS aaa.service_permission_id_seq;
DROP TABLE IF EXISTS aaa.service_permission;
DROP TABLE IF EXISTS aaa.service_account_roles;
DROP SEQUENCE IF EXISTS aaa.service_account_id_seq;
DROP TABLE IF EXISTS aaa.service_account;
DROP SEQUENCE IF EXISTS aaa.password_id_seq;
DROP TABLE IF EXISTS aaa.user_password;
DROP SEQUENCE IF EXISTS aaa.mobile_app_instance_id_seq;
DROP TABLE IF EXISTS aaa.mobile_app_instance;
DROP SEQUENCE IF EXISTS aaa.mobile_app_id_seq;
DROP TABLE IF EXISTS aaa.mobile_app_domain;
DROP TABLE IF EXISTS aaa.mobile_app;
DROP SEQUENCE IF EXISTS aaa.ldap_configuration_id_seq;
DROP TABLE IF EXISTS aaa.ldap_configuration;
DROP TABLE IF EXISTS aaa.databasechangeloglock;
DROP TABLE IF EXISTS aaa.databasechangelog;
DROP SEQUENCE IF EXISTS aaa.data_property_section_id_seq;
DROP TABLE IF EXISTS aaa.data_property_section;
DROP SEQUENCE IF EXISTS aaa.data_property_id_seq;
DROP SEQUENCE IF EXISTS aaa.data_property_group_id_seq;
DROP TABLE IF EXISTS aaa.data_property_group;
DROP TABLE IF EXISTS aaa.data_property;
DROP SEQUENCE IF EXISTS aaa.confirmation_id_seq;
DROP TABLE IF EXISTS aaa.confirmation;
DROP SEQUENCE IF EXISTS aaa.application_group_id_seq;
DROP TABLE IF EXISTS aaa.application_group;
DROP FUNCTION IF EXISTS telegram_handler.oninserttasklog();
DROP FUNCTION IF EXISTS telegram_handler.oninserttask();
DROP FUNCTION IF EXISTS resource_structure.update_parent_path();
DROP FUNCTION IF EXISTS cityservices_chats.inccount();
DROP FUNCTION IF EXISTS cityservices.user_status_log_function();
DROP FUNCTION IF EXISTS cityservices.user_points_update_function();
DROP FUNCTION IF EXISTS cityservices.update_last_translation_date();
DROP FUNCTION IF EXISTS aaa.delete_user(user_ids uuid[]);
DROP EXTENSION IF EXISTS "uuid-ossp";
DROP EXTENSION IF EXISTS postgis;
DROP EXTENSION IF EXISTS ltree;
DROP EXTENSION IF EXISTS hstore;
DROP EXTENSION IF EXISTS plpgsql;
DROP SCHEMA IF EXISTS webadmin;
DROP SCHEMA IF EXISTS userstorage;
DROP SCHEMA IF EXISTS text_service;
DROP SCHEMA IF EXISTS template;
DROP SCHEMA IF EXISTS temp;
DROP SCHEMA IF EXISTS telegram_transport;
DROP SCHEMA IF EXISTS telegram_handler;
DROP SCHEMA IF EXISTS telegram_bot;
DROP SCHEMA IF EXISTS storage;
DROP SCHEMA IF EXISTS sms;
DROP SCHEMA IF EXISTS script_backend;
DROP SCHEMA IF EXISTS scheduling;
DROP SCHEMA IF EXISTS resource_structure;
DROP SCHEMA IF EXISTS push;
DROP SCHEMA IF EXISTS public;
DROP SCHEMA IF EXISTS poll;
DROP SCHEMA IF EXISTS payments;
DROP SCHEMA IF EXISTS object_storage;
DROP SCHEMA IF EXISTS notification;
DROP SCHEMA IF EXISTS mobile_store;
DROP SCHEMA IF EXISTS mdm;
DROP SCHEMA IF EXISTS large_obj_storage;
DROP SCHEMA IF EXISTS gis;
DROP SCHEMA IF EXISTS email;
DROP SCHEMA IF EXISTS cityservices_metric;
DROP SCHEMA IF EXISTS cityservices_communication;
DROP SCHEMA IF EXISTS cityservices_chats;
DROP SCHEMA IF EXISTS cityservices;
DROP SCHEMA IF EXISTS booking;
DROP SCHEMA IF EXISTS backend;
DROP SCHEMA IF EXISTS aaa;
--
-- Name: aaa; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA aaa;


--
-- Name: backend; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA backend;


--
-- Name: booking; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA booking;


--
-- Name: cityservices; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA cityservices;


--
-- Name: cityservices_chats; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA cityservices_chats;


--
-- Name: cityservices_communication; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA cityservices_communication;


--
-- Name: cityservices_metric; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA cityservices_metric;


--
-- Name: email; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA email;


--
-- Name: gis; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA gis;


--
-- Name: large_obj_storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA large_obj_storage;


--
-- Name: mdm; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA mdm;


--
-- Name: mobile_store; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA mobile_store;


--
-- Name: notification; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA notification;


--
-- Name: object_storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA object_storage;


--
-- Name: payments; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA payments;


--
-- Name: poll; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA poll;


--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: push; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA push;


--
-- Name: resource_structure; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA resource_structure;


--
-- Name: scheduling; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA scheduling;


--
-- Name: script_backend; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA script_backend;


--
-- Name: sms; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA sms;


--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA storage;


--
-- Name: telegram_bot; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA telegram_bot;


--
-- Name: telegram_handler; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA telegram_handler;


--
-- Name: telegram_transport; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA telegram_transport;


--
-- Name: temp; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA temp;


--
-- Name: template; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA template;


--
-- Name: text_service; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA text_service;


--
-- Name: userstorage; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA userstorage;


--
-- Name: webadmin; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA webadmin;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: delete_user(uuid[]); Type: FUNCTION; Schema: aaa; Owner: -
--

CREATE FUNCTION aaa.delete_user(user_ids uuid[]) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    result BOOLEAN := 1;
BEGIN
-- CALL EXAMPLE
-- SELECT aaa.delete_user(ARRAY['be4a4445-0308-4e4e-816f-dbf291362905']::UUID[]);

	--DELETE FROM aaa.confirmation;
	--DELETE FROM aaa.user_session;
	--DELETE FROM userstorage.attribute_value;
	--DELETE FROM aaa.mobile_app_instance;
	--DELETE FROM aaa.user_accounts_roles;
	--DELETE FROM aaa.user_data_property;
	--DELETE FROM aaa.user_account WHERE application_group_id = 1;

	DELETE FROM aaa.user_session WHERE user_uuid = ANY (user_ids);
	DELETE FROM userstorage.attribute_value WHERE user_id = ANY (user_ids);
	DELETE FROM aaa.mobile_app_instance WHERE user_account_id IN (SELECT id FROM aaa.user_account WHERE uuid = ANY (user_ids));
	DELETE FROM aaa.user_accounts_roles WHERE account_id IN (SELECT id FROM aaa.user_account WHERE uuid = ANY (user_ids));
	DELETE FROM aaa.user_account WHERE uuid = ANY (user_ids);
    
    RETURN true;
END;
$$;


--
-- Name: update_last_translation_date(); Type: FUNCTION; Schema: cityservices; Owner: -
--

CREATE FUNCTION cityservices.update_last_translation_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
		NEW.updated_at = now() AT TIME ZONE 'UTC';
        RETURN NEW;
    END;
$$;


--
-- Name: user_points_update_function(); Type: FUNCTION; Schema: cityservices; Owner: -
--

CREATE FUNCTION cityservices.user_points_update_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        UPDATE cityservices.user_info set points = COALESCE(points, 0) + NEW.amount *  NEW.multiplier where id = NEW.user_id;
        RETURN NULL;
    END;
$$;


--
-- Name: user_status_log_function(); Type: FUNCTION; Schema: cityservices; Owner: -
--

CREATE FUNCTION cityservices.user_status_log_function() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        INSERT INTO poll.user_status_log(user_id, poll_id, total_questions, next_question_id, next_question_index, status)
        VALUES (NEW.user_id, NEW.poll_id, NEW.total_questions, NEW.next_question_id, NEW.next_question_index, NEW.status);
        RETURN NULL;
    END;
$$;


--
-- Name: inccount(); Type: FUNCTION; Schema: cityservices_chats; Owner: -
--

CREATE FUNCTION cityservices_chats.inccount() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.outcome = TRUE
  THEN
    UPDATE "cityservices_chats"."chat"
    SET message_count            = message_count + 1,
      new_operator_message_count = new_operator_message_count + 1,
      updated_at                 = now()
    WHERE id = NEW.chat_id;
  ELSE
    UPDATE "cityservices_chats"."chat"
    SET message_count        = message_count + 1,
      new_user_message_count = new_user_message_count + 1,
      updated_at             = now()
    WHERE id = NEW.chat_id;
  END IF;
  RETURN NEW;
END;
$$;


--
-- Name: update_parent_path(); Type: FUNCTION; Schema: resource_structure; Owner: -
--

CREATE FUNCTION resource_structure.update_parent_path() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
        path text;
    BEGIN
        IF NEW.parent_id IS NULL THEN
            NEW.tree = 'root'::ltree;
        ELSEIF TG_OP = 'INSERT' OR OLD.parent_id IS NULL OR OLD.parent_id != NEW.parent_id THEN
            EXECUTE format('SELECT tree FROM %I.%I WHERE id = ' || NEW.parent_id,TG_TABLE_SCHEMA,TG_TABLE_NAME) INTO path;
            IF path IS NULL THEN
                RAISE EXCEPTION 'Invalid parent_id %', NEW.parent_id;
            END IF;
			NEW.tree = (path || '.' || NEW.parent_id)::ltree;
        END IF;
        RETURN NEW;
    END;
$$;


--
-- Name: oninserttask(); Type: FUNCTION; Schema: telegram_handler; Owner: -
--

CREATE FUNCTION telegram_handler.oninserttask() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO telegram_handler.task_log_aggregation
  (id, last_status, last_start, last_finish, next_start, average_exe_time_ms)
  VALUES (new.id, NULL, NULL, NULL, NULL, 0);
  RETURN NEW;
END;
$$;


--
-- Name: oninserttasklog(); Type: FUNCTION; Schema: telegram_handler; Owner: -
--

CREATE FUNCTION telegram_handler.oninserttasklog() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  inc_error   INT := 0;
  inc_success INT := 0;
  avg         INT := 0;
BEGIN
  CASE new.action
    WHEN 'START'
    THEN
      UPDATE telegram_handler.task_log_aggregation
      SET last_start = now() AT TIME ZONE 'UTC', last_finish = NULL, next_start = NULL, last_status = 'RUNNING'
      WHERE id = new.task_id;
    WHEN 'FINISH'
    THEN
      SELECT avg((payload ->> 'msToExecute') :: INTEGER) :: INTEGER
      INTO STRICT avg
      FROM telegram_handler.task_log
      WHERE task_id = new.task_id AND action = 'FINISH';

      IF new.status = 'FAILED'
      THEN inc_error = 1;
      ELSE inc_success = 1;
      END IF;

      UPDATE telegram_handler.task_log_aggregation
      SET
        last_finish         = now() AT TIME ZONE 'UTC',
        last_status         = new.status,
        error_count         = error_count + inc_error,
        success_count       = success_count + inc_success,
        average_exe_time_ms = avg
      WHERE id = new.task_id;
    WHEN 'SCHEDULED'
    THEN
      UPDATE telegram_handler.task_log_aggregation
      SET next_start = to_timestamp((new.payload ->> 'nextTime') :: INTEGER) AT TIME ZONE 'UTC'
      WHERE id = new.task_id;
    WHEN 'CANCEL'
    THEN
      UPDATE telegram_handler.task_log_aggregation
      SET next_start = NULL
      WHERE id = new.task_id;
  END CASE;
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: application_group; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.application_group (
    id smallint NOT NULL,
    name character varying(255) NOT NULL,
    user_session_expiration_interval_seconds bigint DEFAULT 3600 NOT NULL,
    confirm_subject_user_registration_template character varying(128) DEFAULT 'confirm_user_registration_subject'::character varying,
    confirm_body_user_registration_template character varying(255) DEFAULT 'confirm_user_registration_body'::character varying,
    confirm_handling_method integer,
    confirm_expiration_interval_seconds integer DEFAULT 600,
    confirm_from_name character varying(255) DEFAULT 'Единый сервис регистрации'::character varying,
    login_method integer DEFAULT 0 NOT NULL,
    authentication_url text,
    confirm_body_password_reset_template text DEFAULT 'confirm_password_reset_body'::text,
    sms_sender_name character varying(256) DEFAULT NULL::character varying,
    confirm_subject_password_reset_template character varying(255) DEFAULT 'confirm_password_reset_subject'::character varying,
    login_request_pattern character varying(255),
    login_response_json_path character varying(255),
    login_error_message_json_path character varying(255),
    service_session_expiration_interval_seconds bigint DEFAULT 315360000 NOT NULL,
    oauth_vkontakte_client_id character varying(255),
    oauth_vkontakte_client_secret character varying(255),
    oauth_facebook_client_id character varying(255),
    oauth_facebook_client_secret character varying(255),
    oauth_google_client_id character varying(255),
    oauth_google_client_secret character varying(255),
    oauth_microsoft_client_id character varying(255),
    oauth_microsoft_client_secret character varying(255),
    oauth_twitter_consumer_key character varying(255),
    oauth_twitter_consumer_secret character varying(255),
    oauth_vkontakte_redirect_url character varying(255),
    oauth_facebook_redirect_url character varying(255),
    oauth_google_redirect_url character varying(255),
    oauth_microsoft_redirect_url character varying(255),
    oauth_twitter_redirect_url character varying(255),
    use_ldap boolean DEFAULT false NOT NULL,
    ldap_synchronization_allow_users_deletion boolean DEFAULT true NOT NULL,
    ldap_synchronization_allow_roles_deletion boolean DEFAULT true NOT NULL,
    user_password_complexity_regexp character varying(64) DEFAULT '[\w]{6,64}'::character varying NOT NULL,
    service_password_complexity_regexp character varying(64) DEFAULT '[\w]{6,64}'::character varying NOT NULL,
    confirm_body_user_login_template character varying(255) DEFAULT 'aaa.confirm_body_user_login_template'::character varying,
    confirm_subject_user_login_template character varying(255) DEFAULT 'aaa.confirm_subject_user_login_template'::character varying
);


--
-- Name: COLUMN application_group.confirm_handling_method; Type: COMMENT; Schema: aaa; Owner: -
--

COMMENT ON COLUMN aaa.application_group.confirm_handling_method IS '0 - WEB_LINK, 1 - SHORT_CODE';


--
-- Name: COLUMN application_group.login_method; Type: COMMENT; Schema: aaa; Owner: -
--

COMMENT ON COLUMN aaa.application_group.login_method IS '0 - AAA, 1 - THIRDPARTY';


--
-- Name: COLUMN application_group.login_request_pattern; Type: COMMENT; Schema: aaa; Owner: -
--

COMMENT ON COLUMN aaa.application_group.login_request_pattern IS 'Pattern for use in String.format(), must contain two arguments - login and password in that order';


--
-- Name: COLUMN application_group.login_response_json_path; Type: COMMENT; Schema: aaa; Owner: -
--

COMMENT ON COLUMN aaa.application_group.login_response_json_path IS 'JsonPath expression for parse boolean value from thirdparty server response, [{ "loginSystemResponse": true }] for example. See https://github.com/jayway/JsonPath';


--
-- Name: application_group_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.application_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: application_group_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.application_group_id_seq OWNED BY aaa.application_group.id;


--
-- Name: confirmation; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.confirmation (
    id bigint NOT NULL,
    action integer NOT NULL,
    delivery_method integer NOT NULL,
    user_account_id bigint NOT NULL,
    expiration_date timestamp without time zone NOT NULL,
    code character varying(36) NOT NULL,
    confirmed boolean DEFAULT false NOT NULL,
    handling_method integer NOT NULL,
    data text
);


--
-- Name: confirmation_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.confirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: confirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.confirmation_id_seq OWNED BY aaa.confirmation.id;


--
-- Name: data_property; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.data_property (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    name_i18n_key character varying(64),
    validation_regexp character varying(64),
    validation_regexp_violation_i18n_key character varying(64),
    mandatory boolean DEFAULT true NOT NULL,
    uniques boolean DEFAULT true NOT NULL,
    cardinality_min integer DEFAULT 1 NOT NULL,
    cardinality_max integer DEFAULT 1 NOT NULL,
    cardinality_violation_i18n_key character varying(64),
    data_property_group_id integer NOT NULL,
    shared boolean DEFAULT false NOT NULL,
    preview boolean DEFAULT false NOT NULL,
    searchable boolean DEFAULT false NOT NULL
);


--
-- Name: data_property_group; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.data_property_group (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    name_i18n_key character varying(64),
    data_property_section_id integer NOT NULL
);


--
-- Name: data_property_group_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.data_property_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_property_group_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.data_property_group_id_seq OWNED BY aaa.data_property_group.id;


--
-- Name: data_property_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.data_property_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_property_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.data_property_id_seq OWNED BY aaa.data_property.id;


--
-- Name: data_property_section; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.data_property_section (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    name_i18n_key character varying(64),
    application_group_id smallint NOT NULL
);


--
-- Name: data_property_section_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.data_property_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_property_section_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.data_property_section_id_seq OWNED BY aaa.data_property_section.id;


--
-- Name: databasechangelog; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: ldap_configuration; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.ldap_configuration (
    id smallint NOT NULL,
    application_group_id smallint NOT NULL,
    domain character varying(255) NOT NULL,
    connect_url character varying(255) NOT NULL,
    connect_base character varying(512) NOT NULL,
    connect_user_dn character varying(512),
    connect_referral character varying(64),
    connect_user_password character varying(512),
    search_attribute_member_of character varying(512) NOT NULL,
    search_attribute_uid character varying(512) NOT NULL,
    search_concrete_user_filter_pattern character varying(512) NOT NULL,
    search_users_filter character varying(512),
    synchronization_synchronize_groups boolean DEFAULT true NOT NULL,
    search_member_of_filter_pattern character varying(512),
    search_groups_filter character varying(512),
    synchronization_periodically_synchronize boolean DEFAULT true NOT NULL
);


--
-- Name: ldap_configuration_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.ldap_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ldap_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.ldap_configuration_id_seq OWNED BY aaa.ldap_configuration.id;


--
-- Name: mobile_app; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.mobile_app (
    id smallint NOT NULL,
    name character varying(256) NOT NULL,
    application_group_id smallint NOT NULL,
    cert_iphone_ext_id character varying(36) DEFAULT NULL::character varying,
    cert_android_ext_id character varying(36) DEFAULT NULL::character varying,
    cert_winphone_ext_id character varying(36) DEFAULT NULL::character varying,
    admin_gui_logo bytea
);


--
-- Name: mobile_app_domain; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.mobile_app_domain (
    domain_name character varying(512) NOT NULL,
    application_id smallint NOT NULL
);


--
-- Name: mobile_app_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.mobile_app_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mobile_app_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.mobile_app_id_seq OWNED BY aaa.mobile_app.id;


--
-- Name: mobile_app_instance; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.mobile_app_instance (
    id bigint NOT NULL,
    cloud_id character varying(255) DEFAULT NULL::character varying,
    user_account_id bigint,
    mobile_app_id smallint NOT NULL,
    external_id character varying(255) NOT NULL,
    platform integer NOT NULL,
    update_date timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    locale character varying(20),
    device_info jsonb
);


--
-- Name: mobile_app_instance_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.mobile_app_instance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mobile_app_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.mobile_app_instance_id_seq OWNED BY aaa.mobile_app_instance.id;


--
-- Name: user_password; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.user_password (
    id bigint NOT NULL,
    digest character varying(64),
    last_update timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: password_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.password_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: password_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.password_id_seq OWNED BY aaa.user_password.id;


--
-- Name: service_account; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.service_account (
    id integer NOT NULL,
    login character varying(64) NOT NULL,
    password character varying(1024) NOT NULL,
    application_group_id smallint NOT NULL,
    uuid uuid DEFAULT uuid_generate_v1() NOT NULL,
    locked boolean DEFAULT false NOT NULL
);


--
-- Name: service_account_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.service_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_account_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.service_account_id_seq OWNED BY aaa.service_account.id;


--
-- Name: service_account_roles; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.service_account_roles (
    role_id integer NOT NULL,
    account_id integer NOT NULL
);


--
-- Name: service_permission; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.service_permission (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    permission_type_id integer NOT NULL,
    application_group_id smallint NOT NULL
);


--
-- Name: service_permission_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.service_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.service_permission_id_seq OWNED BY aaa.service_permission.id;


--
-- Name: service_permission_type; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.service_permission_type (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(512)
);


--
-- Name: service_permission_type_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.service_permission_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_permission_type_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.service_permission_type_id_seq OWNED BY aaa.service_permission_type.id;


--
-- Name: service_role; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.service_role (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    system boolean DEFAULT false NOT NULL,
    application_group_id smallint NOT NULL
);


--
-- Name: service_role_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.service_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_role_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.service_role_id_seq OWNED BY aaa.service_role.id;


--
-- Name: service_role_permissions; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.service_role_permissions (
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: service_session; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.service_session (
    id uuid NOT NULL,
    user_uuid uuid NOT NULL,
    creation_time timestamp without time zone NOT NULL,
    last_access_time timestamp without time zone NOT NULL
);


--
-- Name: user_account; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.user_account (
    id bigint NOT NULL,
    uuid uuid NOT NULL,
    login character varying(64),
    application_group_id smallint NOT NULL,
    create_date timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    confirmed boolean NOT NULL,
    password_id bigint,
    locale character varying(20),
    locked boolean DEFAULT false NOT NULL,
    creation_type integer DEFAULT 0 NOT NULL,
    update_date timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    email character varying(64),
    msisdn character varying(64),
    oauth2_vkontakte_user_id character varying(64),
    oauth2_facebook_user_id character varying(64),
    oauth2_google_user_id character varying(64),
    oauth2_microsoft_user_id character varying(64),
    oauth1_twitter_user_id character varying(64),
    oauth2_telegram_user_id character varying(64),
    name character varying(256),
    birth_date date,
    photo_url character varying(512),
    gender integer DEFAULT 0 NOT NULL
);


--
-- Name: user_account_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.user_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_account_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.user_account_id_seq OWNED BY aaa.user_account.id;


--
-- Name: user_accounts_roles; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.user_accounts_roles (
    role_id integer NOT NULL,
    account_id bigint NOT NULL
);


--
-- Name: user_data_property; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.user_data_property (
    id integer NOT NULL,
    user_account_id bigint NOT NULL,
    data_property_id integer NOT NULL,
    data_property_value text NOT NULL
);


--
-- Name: user_data_property_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.user_data_property_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_data_property_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.user_data_property_id_seq OWNED BY aaa.user_data_property.id;


--
-- Name: user_permission; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.user_permission (
    id integer NOT NULL,
    resource_id integer NOT NULL,
    permission_type_id integer NOT NULL,
    application_group_id smallint NOT NULL
);


--
-- Name: user_permission_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.user_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.user_permission_id_seq OWNED BY aaa.user_permission.id;


--
-- Name: user_permission_type; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.user_permission_type (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(512)
);


--
-- Name: user_permission_type_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.user_permission_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_permission_type_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.user_permission_type_id_seq OWNED BY aaa.user_permission_type.id;


--
-- Name: user_role; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.user_role (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    system boolean DEFAULT false NOT NULL,
    application_group_id smallint NOT NULL,
    creation_type integer DEFAULT 0 NOT NULL,
    update_date timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: user_role_id_seq; Type: SEQUENCE; Schema: aaa; Owner: -
--

CREATE SEQUENCE aaa.user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: aaa; Owner: -
--

ALTER SEQUENCE aaa.user_role_id_seq OWNED BY aaa.user_role.id;


--
-- Name: user_roles_permissions; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.user_roles_permissions (
    permission_id integer NOT NULL,
    role_id integer NOT NULL
);


--
-- Name: user_session; Type: TABLE; Schema: aaa; Owner: -
--

CREATE TABLE aaa.user_session (
    id uuid NOT NULL,
    user_uuid uuid NOT NULL,
    creation_time timestamp without time zone NOT NULL,
    last_access_time timestamp without time zone NOT NULL
);


--
-- Name: abstract_backend_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.abstract_backend_descriptor (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(512),
    type character varying(50) NOT NULL,
    application_group_id smallint NOT NULL
);


--
-- Name: abstract_backend_descriptor_id_seq; Type: SEQUENCE; Schema: backend; Owner: -
--

CREATE SEQUENCE backend.abstract_backend_descriptor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: abstract_backend_descriptor_id_seq; Type: SEQUENCE OWNED BY; Schema: backend; Owner: -
--

ALTER SEQUENCE backend.abstract_backend_descriptor_id_seq OWNED BY backend.abstract_backend_descriptor.id;


--
-- Name: abstract_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.abstract_endpoint_descriptor (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(512),
    result_type_id integer,
    type character varying(50) NOT NULL,
    backend_descriptor_id integer
);


--
-- Name: abstract_endpoint_descriptor_id_seq; Type: SEQUENCE; Schema: backend; Owner: -
--

CREATE SEQUENCE backend.abstract_endpoint_descriptor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: abstract_endpoint_descriptor_id_seq; Type: SEQUENCE OWNED BY; Schema: backend; Owner: -
--

ALTER SEQUENCE backend.abstract_endpoint_descriptor_id_seq OWNED BY backend.abstract_endpoint_descriptor.id;


--
-- Name: adapter_backend_convertation; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.adapter_backend_convertation (
    id integer NOT NULL,
    param character varying(128) NOT NULL,
    target character varying(128) NOT NULL,
    operation character varying(32) NOT NULL,
    pattern character varying(128)
);


--
-- Name: adapter_backend_convertation_id_seq; Type: SEQUENCE; Schema: backend; Owner: -
--

CREATE SEQUENCE backend.adapter_backend_convertation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: adapter_backend_convertation_id_seq; Type: SEQUENCE OWNED BY; Schema: backend; Owner: -
--

ALTER SEQUENCE backend.adapter_backend_convertation_id_seq OWNED BY backend.adapter_backend_convertation.id;


--
-- Name: adapter_endpoint_default_param; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.adapter_endpoint_default_param (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    data jsonb NOT NULL,
    adapter_endpoint_id integer
);


--
-- Name: adapter_endpoint_default_param_id_seq; Type: SEQUENCE; Schema: backend; Owner: -
--

CREATE SEQUENCE backend.adapter_endpoint_default_param_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: adapter_endpoint_default_param_id_seq; Type: SEQUENCE OWNED BY; Schema: backend; Owner: -
--

ALTER SEQUENCE backend.adapter_endpoint_default_param_id_seq OWNED BY backend.adapter_endpoint_default_param.id;


--
-- Name: adapter_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.adapter_endpoint_descriptor (
    id integer NOT NULL,
    target_endpoint_id integer NOT NULL
);


--
-- Name: adapter_param_convertation; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.adapter_param_convertation (
    adapter_endpoint_id integer NOT NULL,
    convertation_id integer NOT NULL
);


--
-- Name: adapter_result_convertation; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.adapter_result_convertation (
    adapter_endpoint_id integer NOT NULL,
    convertation_id integer NOT NULL
);


--
-- Name: aggregate_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.aggregate_endpoint_descriptor (
    id integer NOT NULL,
    fail_on_error boolean NOT NULL
);


--
-- Name: awip_backend_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.awip_backend_descriptor (
    id integer NOT NULL,
    url character varying(2048) NOT NULL,
    client_pool_size integer DEFAULT 30,
    request_timeout integer DEFAULT '-1'::integer
);


--
-- Name: awip_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.awip_endpoint_descriptor (
    id integer NOT NULL
);


--
-- Name: cache_settings; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.cache_settings (
    end_point_descriptor_id integer NOT NULL,
    name character varying(50) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    properties hstore
);


--
-- Name: chain_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.chain_endpoint_descriptor (
    id integer NOT NULL,
    source_endpoint_id integer NOT NULL,
    target_endpoint_id integer NOT NULL
);


--
-- Name: chain_parameter_mapping; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.chain_parameter_mapping (
    id integer NOT NULL,
    mapping_type character varying(20) NOT NULL,
    endpoint_param_name character varying(50) NOT NULL,
    chain_param_name character varying(50)
);


--
-- Name: chain_parameter_mapping_id_seq; Type: SEQUENCE; Schema: backend; Owner: -
--

CREATE SEQUENCE backend.chain_parameter_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chain_parameter_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: backend; Owner: -
--

ALTER SEQUENCE backend.chain_parameter_mapping_id_seq OWNED BY backend.chain_parameter_mapping.id;


--
-- Name: chain_source_mapping; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.chain_source_mapping (
    chain_endpoint_id integer NOT NULL,
    parameter_mapping_id integer NOT NULL
);


--
-- Name: chain_target_mapping; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.chain_target_mapping (
    chain_endpoint_id integer NOT NULL,
    parameter_mapping_id integer NOT NULL
);


--
-- Name: composite_backend_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.composite_backend_descriptor (
    id integer NOT NULL
);


--
-- Name: data_type; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.data_type (
    type character varying(32) NOT NULL,
    id integer NOT NULL,
    primitive_data_type character varying(255),
    element_type_id integer,
    mdm_type_settings_id integer
);


--
-- Name: data_type_id_seq; Type: SEQUENCE; Schema: backend; Owner: -
--

CREATE SEQUENCE backend.data_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_type_id_seq; Type: SEQUENCE OWNED BY; Schema: backend; Owner: -
--

ALTER SEQUENCE backend.data_type_id_seq OWNED BY backend.data_type.id;


--
-- Name: data_type_mdm_settings; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.data_type_mdm_settings (
    id integer NOT NULL,
    collection character varying(50),
    key_type_id integer,
    value_type_id integer,
    application_group_id smallint NOT NULL
);


--
-- Name: data_type_mdm_settings_id_seq; Type: SEQUENCE; Schema: backend; Owner: -
--

CREATE SEQUENCE backend.data_type_mdm_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_type_mdm_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: backend; Owner: -
--

ALTER SEQUENCE backend.data_type_mdm_settings_id_seq OWNED BY backend.data_type_mdm_settings.id;


--
-- Name: data_type_object_property; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.data_type_object_property (
    id integer NOT NULL,
    name character varying(255),
    data_type_id integer NOT NULL,
    object_data_id integer
);


--
-- Name: data_type_object_property_id_seq; Type: SEQUENCE; Schema: backend; Owner: -
--

CREATE SEQUENCE backend.data_type_object_property_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_type_object_property_id_seq; Type: SEQUENCE OWNED BY; Schema: backend; Owner: -
--

ALTER SEQUENCE backend.data_type_object_property_id_seq OWNED BY backend.data_type_object_property.id;


--
-- Name: emp_backend_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.emp_backend_descriptor (
    id integer NOT NULL,
    token character varying(64) NOT NULL
);


--
-- Name: emp_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.emp_endpoint_descriptor (
    id integer NOT NULL,
    dataset character varying(64) NOT NULL
);


--
-- Name: endpoint_isolation; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.endpoint_isolation (
    endpoint_descriptor_id integer NOT NULL,
    isolation character varying(32)
);


--
-- Name: endpoint_param_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.endpoint_param_descriptor (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(512),
    endpoint_descriptor_id integer,
    datatype_id integer NOT NULL
);


--
-- Name: endpoint_param_descriptor_id_seq; Type: SEQUENCE; Schema: backend; Owner: -
--

CREATE SEQUENCE backend.endpoint_param_descriptor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: endpoint_param_descriptor_id_seq; Type: SEQUENCE OWNED BY; Schema: backend; Owner: -
--

ALTER SEQUENCE backend.endpoint_param_descriptor_id_seq OWNED BY backend.endpoint_param_descriptor.id;


--
-- Name: external_backend_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.external_backend_descriptor (
    id integer NOT NULL,
    backend_type character varying(50) NOT NULL
);


--
-- Name: external_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.external_endpoint_descriptor (
    id integer NOT NULL
);


--
-- Name: jdbc_backend_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.jdbc_backend_descriptor (
    id integer NOT NULL,
    connection character varying(1024) NOT NULL,
    pool_parameters hstore,
    active boolean DEFAULT false,
    driver_id integer NOT NULL
);


--
-- Name: jdbc_driver; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.jdbc_driver (
    id integer NOT NULL,
    display_name character varying(256) NOT NULL,
    driver_class character varying(256) NOT NULL,
    help_url text
);


--
-- Name: jdbc_driver_id_seq; Type: SEQUENCE; Schema: backend; Owner: -
--

CREATE SEQUENCE backend.jdbc_driver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jdbc_driver_id_seq; Type: SEQUENCE OWNED BY; Schema: backend; Owner: -
--

ALTER SEQUENCE backend.jdbc_driver_id_seq OWNED BY backend.jdbc_driver.id;


--
-- Name: jdbc_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.jdbc_endpoint_descriptor (
    id integer NOT NULL,
    query character varying(2048) NOT NULL,
    query_type character varying(20) DEFAULT 'QUERY'::character varying NOT NULL,
    query_table character varying(50)
);


--
-- Name: jdbc_url_parameter; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.jdbc_url_parameter (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description text,
    frontend_input_data_type character varying(32) NOT NULL,
    default_boolean_value boolean,
    double_from double precision,
    double_to double precision,
    default_double_value double precision,
    integer_from integer,
    integer_to integer,
    default_integer_value integer,
    default_string_value character varying(256),
    display_order integer DEFAULT 1 NOT NULL,
    jdbc_driver_id integer
);


--
-- Name: jdbc_url_parameter_id_seq; Type: SEQUENCE; Schema: backend; Owner: -
--

CREATE SEQUENCE backend.jdbc_url_parameter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jdbc_url_parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: backend; Owner: -
--

ALTER SEQUENCE backend.jdbc_url_parameter_id_seq OWNED BY backend.jdbc_url_parameter.id;


--
-- Name: jdbc_url_parameter_string_example_value; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.jdbc_url_parameter_string_example_value (
    id integer NOT NULL,
    string_value character varying(256) NOT NULL,
    jdbc_url_parameter_id integer
);


--
-- Name: jdbc_url_parameter_string_example_value_id_seq; Type: SEQUENCE; Schema: backend; Owner: -
--

CREATE SEQUENCE backend.jdbc_url_parameter_string_example_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jdbc_url_parameter_string_example_value_id_seq; Type: SEQUENCE OWNED BY; Schema: backend; Owner: -
--

ALTER SEQUENCE backend.jdbc_url_parameter_string_example_value_id_seq OWNED BY backend.jdbc_url_parameter_string_example_value.id;


--
-- Name: join_aggregate_endpoint; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.join_aggregate_endpoint (
    aggregate_endpoint_id integer NOT NULL,
    child_endpoint_id integer NOT NULL
);


--
-- Name: mdm_backend_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.mdm_backend_descriptor (
    id integer NOT NULL,
    collection character varying(50) NOT NULL
);


--
-- Name: mdm_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.mdm_endpoint_descriptor (
    id integer NOT NULL,
    is_key_filtering boolean,
    filtering_property_path character varying(512),
    filtering_operator character varying(30),
    filtering_parameter_name character varying(50),
    is_key_sorting boolean,
    order_property_path character varying(512),
    order_direction character varying(10),
    order_nulls_position character varying(10)
);


--
-- Name: mongo_backend_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.mongo_backend_descriptor (
    id integer NOT NULL,
    url character varying(1024) NOT NULL,
    active boolean DEFAULT false
);


--
-- Name: mongo_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.mongo_endpoint_descriptor (
    id integer NOT NULL,
    command character varying(1024) NOT NULL,
    result_type character varying(64) NOT NULL,
    result_template character varying(1024)
);


--
-- Name: mq_backend_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.mq_backend_descriptor (
    id integer NOT NULL,
    url character varying(1024) NOT NULL,
    active boolean DEFAULT false,
    parameters hstore,
    admin_port integer DEFAULT 15672 NOT NULL
);


--
-- Name: mq_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.mq_endpoint_descriptor (
    id integer NOT NULL,
    direction character varying(10) NOT NULL,
    queue character varying(64),
    routing_key character varying(64),
    exchange character varying(64) DEFAULT ''::character varying
);


--
-- Name: rest_backend_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.rest_backend_descriptor (
    id integer NOT NULL,
    url character varying(1024) NOT NULL,
    key_store bytea,
    login character varying(255),
    password character varying(255),
    client_pool_size integer DEFAULT 30,
    settings hstore DEFAULT ''::hstore
);


--
-- Name: rest_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.rest_endpoint_descriptor (
    id integer NOT NULL,
    type character varying(32) NOT NULL,
    method character varying(32) NOT NULL,
    path character varying(512),
    headers hstore,
    settings hstore,
    request_template character varying(4096),
    response_root_path character varying(512),
    response_template character varying(4096)
);


--
-- Name: split_endpoint_descriptor; Type: TABLE; Schema: backend; Owner: -
--

CREATE TABLE backend.split_endpoint_descriptor (
    id integer NOT NULL,
    source_endpoint_id integer NOT NULL,
    target_endpoint_id integer NOT NULL
);


--
-- Name: slots; Type: TABLE; Schema: booking; Owner: -
--

CREATE TABLE booking.slots (
    id bigint NOT NULL,
    from_time timestamp without time zone NOT NULL,
    to_time timestamp without time zone NOT NULL,
    owner_id integer,
    assignee_id integer,
    assignee_type character varying(255),
    assign_date timestamp without time zone,
    resource_id integer NOT NULL,
    resource_instance_id bigint NOT NULL,
    properties jsonb DEFAULT '{}'::json NOT NULL,
    properties_hash character varying(128),
    close_status character varying(128),
    close_comment text
);


--
-- Name: slots_id_seq; Type: SEQUENCE; Schema: booking; Owner: -
--

CREATE SEQUENCE booking.slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slots_id_seq; Type: SEQUENCE OWNED BY; Schema: booking; Owner: -
--

ALTER SEQUENCE booking.slots_id_seq OWNED BY booking.slots.id;


--
-- Name: account; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.account (
    id integer NOT NULL,
    login character varying(64) NOT NULL,
    password character varying(256),
    email character varying(64),
    phone character varying(21),
    first_name character varying(64),
    last_name character varying(64),
    avatar text,
    blocked boolean DEFAULT false,
    created timestamp without time zone DEFAULT now() NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    user_id character varying(36) NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);


--
-- Name: account_action; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.account_action (
    id integer NOT NULL,
    account_id integer,
    ip character varying(64),
    action character varying(64),
    action_date timestamp without time zone,
    detail text
);


--
-- Name: account_action_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.account_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_action_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.account_action_id_seq OWNED BY cityservices.account_action.id;


--
-- Name: account_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.account_id_seq OWNED BY cityservices.account.id;


--
-- Name: account_roles; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.account_roles (
    account_id integer NOT NULL,
    role_id integer NOT NULL
);


--
-- Name: answers; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.answers (
    id integer NOT NULL,
    questions_id integer NOT NULL,
    answer_description text NOT NULL,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    answer_prio integer DEFAULT 100,
    answer_icon character varying(2048) DEFAULT ''::character varying,
    answer_image character varying(2048) DEFAULT ''::character varying
);


--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.answers_id_seq OWNED BY cityservices.answers.id;


--
-- Name: attachment; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.attachment (
    id bigint NOT NULL,
    message_id bigint NOT NULL,
    type character varying(32) NOT NULL,
    data bytea,
    link character varying(256),
    name character varying(512),
    size double precision,
    mime_type character varying(128)
);


--
-- Name: attachment_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.attachment_id_seq OWNED BY cityservices.attachment.id;


--
-- Name: available_endpoint; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.available_endpoint (
    id integer NOT NULL,
    path character varying(64) NOT NULL
);


--
-- Name: available_endpoint_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.available_endpoint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: available_endpoint_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.available_endpoint_id_seq OWNED BY cityservices.available_endpoint.id;


--
-- Name: bookmark_favorite_screen; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.bookmark_favorite_screen (
    id integer NOT NULL,
    screen_name character varying(256),
    screen character varying(256),
    user_id integer,
    params text,
    type integer
);


--
-- Name: bookmark_favorite_screen_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.bookmark_favorite_screen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bookmark_favorite_screen_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.bookmark_favorite_screen_id_seq OWNED BY cityservices.bookmark_favorite_screen.id;


--
-- Name: bookmark_history_screen; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.bookmark_history_screen (
    id integer NOT NULL,
    screen_name character varying(256),
    screen character varying(256),
    user_id integer,
    params text,
    type integer,
    execution_time timestamp without time zone
);


--
-- Name: bookmark_history_screen_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.bookmark_history_screen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bookmark_history_screen_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.bookmark_history_screen_id_seq OWNED BY cityservices.bookmark_history_screen.id;


--
-- Name: chat_channel; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.chat_channel (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


--
-- Name: chat_channel_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.chat_channel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.chat_channel_id_seq OWNED BY cityservices.chat_channel.id;


--
-- Name: chat_message; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.chat_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    chat_id integer NOT NULL,
    message text NOT NULL,
    message_type character varying(255) DEFAULT 'TEXT'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    sent boolean DEFAULT false NOT NULL,
    received boolean DEFAULT false NOT NULL,
    outcome boolean DEFAULT false NOT NULL
);


--
-- Name: chat_message_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.chat_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_message_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.chat_message_id_seq OWNED BY cityservices.chat_message.id;


--
-- Name: complain; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain (
    id integer NOT NULL,
    complain_group_id integer NOT NULL,
    complain_status_id integer NOT NULL,
    title character varying(255) NOT NULL,
    message text,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    user_id integer NOT NULL,
    operator_id integer,
    lat double precision,
    lng double precision,
    deleted boolean,
    in_work_operator_id integer
);


--
-- Name: complain_field; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain_field (
    id integer NOT NULL,
    name character varying(50) DEFAULT ''::character varying NOT NULL,
    field_format character varying(50) DEFAULT ''::character varying NOT NULL,
    possible_values text,
    regexp character varying DEFAULT ''::character varying,
    min_length integer,
    max_length integer,
    is_required boolean DEFAULT false NOT NULL,
    is_filter boolean DEFAULT false NOT NULL,
    "position" integer,
    searchable boolean DEFAULT false,
    default_value text,
    editable boolean DEFAULT true,
    visible boolean DEFAULT true NOT NULL,
    multiple boolean DEFAULT false,
    description text,
    complain_group_id integer NOT NULL,
    required_error_text character varying(255),
    regexp_error_text character varying(255),
    label character varying(255),
    mask character varying(255),
    placeholder character varying(255),
    is_for_operator boolean DEFAULT false NOT NULL
);


--
-- Name: complain_field_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.complain_field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complain_field_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.complain_field_id_seq OWNED BY cityservices.complain_field.id;


--
-- Name: complain_field_value; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain_field_value (
    id integer NOT NULL,
    complain_id integer NOT NULL,
    complain_field_id integer NOT NULL,
    value text,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL
);


--
-- Name: complain_field_value_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.complain_field_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complain_field_value_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.complain_field_value_id_seq OWNED BY cityservices.complain_field_value.id;


--
-- Name: complain_group; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain_group (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    complain_type_id integer NOT NULL,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    description text,
    img_url character varying(512),
    icon_url character varying(512),
    start_status_id integer NOT NULL
);


--
-- Name: complain_group_has_role; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain_group_has_role (
    complaint_group_id integer NOT NULL,
    role_id integer NOT NULL
);


--
-- Name: complain_group_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.complain_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complain_group_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.complain_group_id_seq OWNED BY cityservices.complain_group.id;


--
-- Name: complain_history; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain_history (
    id integer NOT NULL,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    message text,
    title character varying(1024),
    status_from_id integer,
    status_from_text character varying(255),
    status_to_id integer,
    status_to_text character varying(255),
    lat double precision,
    lng double precision,
    complain_id integer NOT NULL,
    user_id integer,
    operator_id integer
);


--
-- Name: complain_history_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.complain_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complain_history_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.complain_history_id_seq OWNED BY cityservices.complain_history.id;


--
-- Name: complain_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.complain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complain_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.complain_id_seq OWNED BY cityservices.complain.id;


--
-- Name: complain_status; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain_status (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_start boolean DEFAULT false NOT NULL,
    is_end boolean DEFAULT false NOT NULL,
    handle_by_operator boolean DEFAULT false NOT NULL,
    "position" integer,
    description text,
    flow_id integer DEFAULT 1 NOT NULL
);


--
-- Name: complain_status_has_role; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain_status_has_role (
    complaint_status_id integer NOT NULL,
    role_id integer NOT NULL
);


--
-- Name: complain_status_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.complain_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complain_status_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.complain_status_id_seq OWNED BY cityservices.complain_status.id;


--
-- Name: complain_status_workflow; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain_status_workflow (
    id integer NOT NULL,
    old_complain_status_id integer DEFAULT 0 NOT NULL,
    new_complain_status_id integer DEFAULT 0 NOT NULL,
    complain_group_id integer NOT NULL,
    notify_user boolean DEFAULT false NOT NULL,
    auto_change_status boolean DEFAULT false NOT NULL,
    notify_service character varying(255),
    comment boolean DEFAULT false NOT NULL,
    comment_required boolean DEFAULT false NOT NULL,
    description text,
    user_message character varying(255)
);


--
-- Name: complain_status_workflow_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.complain_status_workflow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complain_status_workflow_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.complain_status_workflow_id_seq OWNED BY cityservices.complain_status_workflow.id;


--
-- Name: complain_type; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain_type (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    description text,
    img_url character varying(512),
    icon_url character varying(512),
    flow_id integer DEFAULT 1 NOT NULL
);


--
-- Name: complain_type_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.complain_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complain_type_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.complain_type_id_seq OWNED BY cityservices.complain_type.id;


--
-- Name: complain_type_news_category; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain_type_news_category (
    complain_type_id integer NOT NULL,
    news_category_id integer NOT NULL,
    rating real NOT NULL,
    weight real NOT NULL
);


--
-- Name: complain_workflow_has_field; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain_workflow_has_field (
    complaint_workflow_id integer NOT NULL,
    field_id integer NOT NULL
);


--
-- Name: complain_workflow_has_role; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complain_workflow_has_role (
    complain_status_workflow_id integer NOT NULL,
    role_id integer NOT NULL
);


--
-- Name: complaint_performance_type; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complaint_performance_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value bigint NOT NULL
);


--
-- Name: complaint_performance_type_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.complaint_performance_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complaint_performance_type_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.complaint_performance_type_id_seq OWNED BY cityservices.complaint_performance_type.id;


--
-- Name: complaint_performance_value; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complaint_performance_value (
    id integer NOT NULL,
    value double precision NOT NULL,
    type_id integer NOT NULL,
    date date DEFAULT now() NOT NULL
);


--
-- Name: complaint_performance_value_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.complaint_performance_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complaint_performance_value_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.complaint_performance_value_id_seq OWNED BY cityservices.complaint_performance_value.id;


--
-- Name: complaint_statistic_by_type; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.complaint_statistic_by_type (
    date date NOT NULL,
    complaint_type_id integer NOT NULL,
    value real NOT NULL,
    id integer NOT NULL
);


--
-- Name: complaint_statistic_by_type_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.complaint_statistic_by_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complaint_statistic_by_type_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.complaint_statistic_by_type_id_seq OWNED BY cityservices.complaint_statistic_by_type.id;


--
-- Name: confirmation; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.confirmation (
    id bigint NOT NULL,
    delivery_method character varying(16) NOT NULL,
    user_id uuid NOT NULL,
    expiration_date timestamp without time zone NOT NULL,
    code character varying(36) NOT NULL,
    confirmed boolean DEFAULT false NOT NULL,
    data character varying
);


--
-- Name: confirmation_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.confirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: confirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.confirmation_id_seq OWNED BY cityservices.confirmation.id;


--
-- Name: databasechangelog; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: electricity_meter; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.electricity_meter (
    id integer NOT NULL,
    type integer,
    number character varying(32),
    contract_number character varying(32),
    house_id integer
);


--
-- Name: electricity_meter_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.electricity_meter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: electricity_meter_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.electricity_meter_id_seq OWNED BY cityservices.electricity_meter.id;


--
-- Name: electricity_meter_value; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.electricity_meter_value (
    id integer NOT NULL,
    value double precision,
    day date,
    meter_id integer
);


--
-- Name: electricity_meter_value_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.electricity_meter_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: electricity_meter_value_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.electricity_meter_value_id_seq OWNED BY cityservices.electricity_meter_value.id;


--
-- Name: evacuation; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.evacuation (
    id integer NOT NULL,
    evacuation_date timestamp without time zone NOT NULL,
    place character varying(512) NOT NULL,
    reason character varying(512) NOT NULL,
    act_number character varying(32) NOT NULL,
    grn character varying(32),
    sts character varying(32),
    parking_address character varying(512) NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    CONSTRAINT ck_valid_evacuation CHECK (((grn IS NOT NULL) OR (sts IS NOT NULL)))
);


--
-- Name: evacuation_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.evacuation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: evacuation_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.evacuation_id_seq OWNED BY cityservices.evacuation.id;


--
-- Name: flow; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.flow (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    system_name character varying(255) NOT NULL
);


--
-- Name: flow_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.flow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flow_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.flow_id_seq OWNED BY cityservices.flow.id;


--
-- Name: house; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.house (
    id integer NOT NULL,
    street character varying(64),
    home character varying(32),
    flat character varying(32),
    house_account character varying(32)
);


--
-- Name: house_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.house_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: house_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.house_id_seq OWNED BY cityservices.house.id;


--
-- Name: med_clinic_link; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.med_clinic_link (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    operator_id integer NOT NULL,
    clinic_id bigint NOT NULL,
    link_type character varying(128) NOT NULL,
    doctor_id bigint,
    CONSTRAINT check_doctor_id CHECK ((((((link_type)::text = 'DOCTOR'::text))::integer + ((doctor_id IS NOT NULL))::integer) = ANY (ARRAY[0, 2])))
);


--
-- Name: med_clinic_link_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.med_clinic_link_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: med_clinic_link_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.med_clinic_link_id_seq OWNED BY cityservices.med_clinic_link.id;


--
-- Name: med_doctor; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.med_doctor (
    id integer NOT NULL,
    fio character varying(256)
);


--
-- Name: med_doctor_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.med_doctor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: med_doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.med_doctor_id_seq OWNED BY cityservices.med_doctor.id;


--
-- Name: med_doctor_speciality; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.med_doctor_speciality (
    id integer NOT NULL,
    name character varying(256),
    description text
);


--
-- Name: med_doctor_speciality_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.med_doctor_speciality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: med_doctor_speciality_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.med_doctor_speciality_id_seq OWNED BY cityservices.med_doctor_speciality.id;


--
-- Name: med_hospital; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.med_hospital (
    id integer NOT NULL,
    name character varying(512),
    address character varying(512)
);


--
-- Name: med_hospital_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.med_hospital_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: med_hospital_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.med_hospital_id_seq OWNED BY cityservices.med_hospital.id;


--
-- Name: med_hospital_policy; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.med_hospital_policy (
    hospital_id integer,
    policy_id integer
);


--
-- Name: med_hospital_unit; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.med_hospital_unit (
    id integer NOT NULL,
    doctor_id integer NOT NULL,
    speciality_id integer NOT NULL,
    hospital_id integer NOT NULL
);


--
-- Name: med_hospital_unit_favorite; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.med_hospital_unit_favorite (
    id integer NOT NULL,
    name character varying(256),
    user_id integer,
    hospital_unit_id integer
);


--
-- Name: med_hospital_unit_favorite_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.med_hospital_unit_favorite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: med_hospital_unit_favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.med_hospital_unit_favorite_id_seq OWNED BY cityservices.med_hospital_unit_favorite.id;


--
-- Name: med_hospital_unit_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.med_hospital_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: med_hospital_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.med_hospital_unit_id_seq OWNED BY cityservices.med_hospital_unit.id;


--
-- Name: med_policy; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.med_policy (
    id integer NOT NULL,
    oms character varying(512)
);


--
-- Name: med_policy_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.med_policy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: med_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.med_policy_id_seq OWNED BY cityservices.med_policy.id;


--
-- Name: med_speciality; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.med_speciality (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    instance_id integer NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: med_speciality_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.med_speciality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: med_speciality_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.med_speciality_id_seq OWNED BY cityservices.med_speciality.id;


--
-- Name: med_treatment_day; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.med_treatment_day (
    id integer NOT NULL,
    unit_id integer NOT NULL,
    day date NOT NULL
);


--
-- Name: med_treatment_day_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.med_treatment_day_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: med_treatment_day_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.med_treatment_day_id_seq OWNED BY cityservices.med_treatment_day.id;


--
-- Name: med_treatment_slot; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.med_treatment_slot (
    id integer NOT NULL,
    "time" time without time zone NOT NULL,
    status character varying(64),
    room character varying(256),
    policy_id integer,
    day_id integer
);


--
-- Name: med_treatment_slot_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.med_treatment_slot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: med_treatment_slot_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.med_treatment_slot_id_seq OWNED BY cityservices.med_treatment_slot.id;


--
-- Name: message; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.message (
    id bigint NOT NULL,
    recipient uuid NOT NULL,
    sender character varying(64) NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    mime_type_id integer,
    properties hstore,
    is_deleted boolean DEFAULT false NOT NULL,
    created timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    pic character varying(512)
);


--
-- Name: message_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: message_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.message_id_seq OWNED BY cityservices.message.id;


--
-- Name: message_tag; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.message_tag (
    id integer NOT NULL,
    message_id bigint NOT NULL,
    value character varying(256)
);


--
-- Name: message_tag_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.message_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: message_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.message_tag_id_seq OWNED BY cityservices.message_tag.id;


--
-- Name: mime_type; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.mime_type (
    id integer NOT NULL,
    name character varying(32) NOT NULL
);


--
-- Name: mime_type_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.mime_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mime_type_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.mime_type_id_seq OWNED BY cityservices.mime_type.id;


--
-- Name: news_category; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.news_category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: news_category_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.news_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: news_category_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.news_category_id_seq OWNED BY cityservices.news_category.id;


--
-- Name: news_element; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.news_element (
    id integer NOT NULL,
    text text NOT NULL,
    img_url character varying(512),
    deleted boolean DEFAULT true,
    operator_id character varying(128),
    update_at timestamp without time zone DEFAULT now(),
    title character varying(256) DEFAULT 'Стандартный заголовок новости'::character varying NOT NULL,
    publish_date timestamp without time zone DEFAULT '1970-01-30 11:30:50'::timestamp without time zone NOT NULL,
    source_url character varying(512),
    notify_user boolean DEFAULT false,
    lat double precision,
    lng double precision,
    address character varying(128),
    place_name character varying(128)
);


--
-- Name: news_element_has_category; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.news_element_has_category (
    news_element_id integer NOT NULL,
    news_category_id integer NOT NULL
);


--
-- Name: news_element_has_tag; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.news_element_has_tag (
    news_element_id integer NOT NULL,
    news_tag_id integer NOT NULL
);


--
-- Name: news_element_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.news_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: news_element_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.news_element_id_seq OWNED BY cityservices.news_element.id;


--
-- Name: news_tag; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.news_tag (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    create_date timestamp without time zone DEFAULT now() NOT NULL,
    update_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: news_tag_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.news_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: news_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.news_tag_id_seq OWNED BY cityservices.news_tag.id;


--
-- Name: news_user_info; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.news_user_info (
    id integer NOT NULL,
    news_id integer NOT NULL,
    user_id integer NOT NULL,
    is_like boolean,
    like_time timestamp without time zone DEFAULT now(),
    is_read boolean NOT NULL,
    read_time timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: news_user_info_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.news_user_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: news_user_info_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.news_user_info_id_seq OWNED BY cityservices.news_user_info.id;


--
-- Name: offence; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.offence (
    id bigint NOT NULL,
    date timestamp without time zone NOT NULL,
    sum numeric NOT NULL,
    location character varying(512) NOT NULL,
    reason integer NOT NULL,
    act_number character varying(512) NOT NULL,
    grn character varying(32),
    sts character varying(32),
    vu character varying(32),
    type integer NOT NULL,
    status integer NOT NULL,
    user_info_id integer,
    read boolean DEFAULT false NOT NULL,
    CONSTRAINT ck_valid_offence CHECK ((((grn IS NOT NULL) AND (sts IS NOT NULL)) OR (vu IS NOT NULL)))
);


--
-- Name: offence_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.offence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offence_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.offence_id_seq OWNED BY cityservices.offence.id;


--
-- Name: polls; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.polls (
    id integer NOT NULL,
    poll_title text,
    poll_description text,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    category_id integer,
    award integer,
    image text
);


--
-- Name: polls_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.polls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: polls_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.polls_id_seq OWNED BY cityservices.polls.id;


--
-- Name: profile_attribute; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.profile_attribute (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    display_name character varying(255),
    "group" character varying(255)
);


--
-- Name: profile_attribute_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.profile_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profile_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.profile_attribute_id_seq OWNED BY cityservices.profile_attribute.id;


--
-- Name: profile_important_attribute; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.profile_important_attribute (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    active boolean NOT NULL
);


--
-- Name: profile_important_attribute_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.profile_important_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profile_important_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.profile_important_attribute_id_seq OWNED BY cityservices.profile_important_attribute.id;


--
-- Name: published; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.published (
    poll_id integer NOT NULL,
    person_id integer NOT NULL,
    id integer NOT NULL,
    start_time timestamp(6) without time zone DEFAULT now() NOT NULL,
    end_time timestamp(6) without time zone NOT NULL
);


--
-- Name: published_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.published_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: published_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.published_id_seq OWNED BY cityservices.published.id;


--
-- Name: questions; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.questions (
    id integer NOT NULL,
    question_title text,
    question_description text,
    poll_id integer NOT NULL,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    question_prio integer DEFAULT 100,
    question_type integer DEFAULT 1
);


--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.questions_id_seq OWNED BY cityservices.questions.id;


--
-- Name: role; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.role (
    id integer NOT NULL,
    name character varying(64),
    rights hstore,
    description text DEFAULT ''::text,
    system_role boolean DEFAULT false NOT NULL
);


--
-- Name: role_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.role_id_seq OWNED BY cityservices.role.id;


--
-- Name: role_links; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.role_links (
    parent_id integer NOT NULL,
    child_id integer NOT NULL
);


--
-- Name: service; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.service (
    id integer NOT NULL,
    category_id integer,
    name character varying(256),
    code character varying(32)
);


--
-- Name: service_category; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.service_category (
    id integer NOT NULL,
    name character varying(256),
    code character varying(32)
);


--
-- Name: service_category_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.service_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_category_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.service_category_id_seq OWNED BY cityservices.service_category.id;


--
-- Name: service_favorite; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.service_favorite (
    id integer NOT NULL,
    service_id integer,
    user_id integer
);


--
-- Name: service_favorite_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.service_favorite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.service_favorite_id_seq OWNED BY cityservices.service_favorite.id;


--
-- Name: service_favorite_param; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.service_favorite_param (
    id integer NOT NULL,
    favorite_id integer,
    param_name character varying(64) NOT NULL,
    param_value character varying(256)
);


--
-- Name: service_favorite_param_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.service_favorite_param_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_favorite_param_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.service_favorite_param_id_seq OWNED BY cityservices.service_favorite_param.id;


--
-- Name: service_history; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.service_history (
    id integer NOT NULL,
    service_id integer,
    user_id uuid,
    completion_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: service_history_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.service_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_history_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.service_history_id_seq OWNED BY cityservices.service_history.id;


--
-- Name: service_history_param; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.service_history_param (
    id integer NOT NULL,
    service_history_id integer,
    param_id integer,
    param_value character varying(256)
);


--
-- Name: service_history_param_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.service_history_param_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_history_param_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.service_history_param_id_seq OWNED BY cityservices.service_history_param.id;


--
-- Name: service_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.service_id_seq OWNED BY cityservices.service.id;


--
-- Name: service_param; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.service_param (
    id integer NOT NULL,
    service_id integer,
    endpoint_param character varying(256),
    profile_section character varying(256),
    profile_group character varying(256),
    profile_property character varying(256),
    data_position integer NOT NULL
);


--
-- Name: service_param_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.service_param_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_param_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.service_param_id_seq OWNED BY cityservices.service_param.id;


--
-- Name: service_subscription; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.service_subscription (
    id integer NOT NULL,
    service_id integer,
    user_id uuid
);


--
-- Name: service_subscription_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.service_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.service_subscription_id_seq OWNED BY cityservices.service_subscription.id;


--
-- Name: service_subscription_param; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.service_subscription_param (
    id integer NOT NULL,
    subscription_id integer,
    param_id integer,
    param_value character varying(256)
);


--
-- Name: service_subscription_param_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.service_subscription_param_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_subscription_param_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.service_subscription_param_id_seq OWNED BY cityservices.service_subscription_param.id;


--
-- Name: slot_group; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.slot_group (
    id integer NOT NULL,
    date date,
    has_slots boolean,
    slots text
);


--
-- Name: slot_group_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.slot_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slot_group_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.slot_group_id_seq OWNED BY cityservices.slot_group.id;


--
-- Name: slot_history; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.slot_history (
    id integer NOT NULL,
    slot_id bigint,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    action character varying(128),
    author_type character varying(255),
    author_id integer,
    private_info boolean
);


--
-- Name: slot_history_attachment; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.slot_history_attachment (
    id integer NOT NULL,
    history_id integer,
    type character varying(128),
    message text,
    private_info boolean
);


--
-- Name: slot_history_attachment_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.slot_history_attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slot_history_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.slot_history_attachment_id_seq OWNED BY cityservices.slot_history_attachment.id;


--
-- Name: slot_history_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.slot_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slot_history_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.slot_history_id_seq OWNED BY cityservices.slot_history.id;


--
-- Name: statistic_type; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.statistic_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: statistic_type_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.statistic_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: statistic_type_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.statistic_type_id_seq OWNED BY cityservices.statistic_type.id;


--
-- Name: statistic_value; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.statistic_value (
    date date NOT NULL,
    type_id integer NOT NULL,
    value real NOT NULL,
    id integer NOT NULL
);


--
-- Name: statistic_value_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.statistic_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: statistic_value_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.statistic_value_id_seq OWNED BY cityservices.statistic_value.id;


--
-- Name: supervisor; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.supervisor (
    id integer NOT NULL,
    email character varying(50),
    phone character varying(50),
    sos_template text
);


--
-- Name: supervisor_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.supervisor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: supervisor_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.supervisor_id_seq OWNED BY cityservices.supervisor.id;


--
-- Name: text_service; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.text_service (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    command_regexp character varying(64) NOT NULL,
    endpoint_attribute_name character varying(64) NOT NULL,
    profile_attribute_name character varying(64),
    endpoint_path character varying(64) NOT NULL,
    channel_type character varying(32) NOT NULL,
    empty_template text,
    not_empty_template text,
    void_template text,
    error_template text,
    is_void boolean DEFAULT false NOT NULL,
    group_id integer NOT NULL,
    active boolean DEFAULT false NOT NULL
);


--
-- Name: text_service_category; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.text_service_category (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


--
-- Name: text_service_category_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.text_service_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: text_service_category_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.text_service_category_id_seq OWNED BY cityservices.text_service_category.id;


--
-- Name: text_service_group; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.text_service_group (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    category_id integer NOT NULL
);


--
-- Name: text_service_group_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.text_service_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: text_service_group_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.text_service_group_id_seq OWNED BY cityservices.text_service_group.id;


--
-- Name: text_service_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.text_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: text_service_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.text_service_id_seq OWNED BY cityservices.text_service.id;


--
-- Name: transaction; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.transaction (
    id bigint NOT NULL,
    message_id bigint NOT NULL,
    status character varying(32) NOT NULL,
    "time" timestamp without time zone NOT NULL
);


--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.transaction_id_seq OWNED BY cityservices.transaction.id;


--
-- Name: translation; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.translation (
    lang character varying(32) NOT NULL,
    messages hstore
);


--
-- Name: ui_config; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.ui_config (
    system_name character varying(255) NOT NULL,
    settings jsonb DEFAULT '{}'::jsonb NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL
);


--
-- Name: user_answers; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.user_answers (
    person_id integer NOT NULL,
    question_id integer NOT NULL,
    answer_id integer NOT NULL,
    dt timestamp(6) without time zone DEFAULT now() NOT NULL,
    id integer NOT NULL
);


--
-- Name: user_answers_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.user_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.user_answers_id_seq OWNED BY cityservices.user_answers.id;


--
-- Name: user_geoposition; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.user_geoposition (
    id bigint NOT NULL,
    user_id integer,
    provider character varying(64),
    location_provider integer,
    latitude double precision,
    longitude double precision,
    speed double precision,
    accuracy double precision,
    altitude double precision,
    "time" timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    bearing double precision
);


--
-- Name: user_geoposition_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.user_geoposition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_geoposition_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.user_geoposition_id_seq OWNED BY cityservices.user_geoposition.id;


--
-- Name: user_houses; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.user_houses (
    id integer NOT NULL,
    name character varying(256),
    user_id integer,
    house_id integer
);


--
-- Name: user_houses_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.user_houses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_houses_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.user_houses_id_seq OWNED BY cityservices.user_houses.id;


--
-- Name: user_info; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.user_info (
    id integer NOT NULL,
    external_id uuid NOT NULL,
    policy_id integer,
    online boolean DEFAULT false NOT NULL,
    points integer DEFAULT 0,
    locked boolean DEFAULT false
);


--
-- Name: user_info_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.user_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_info_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.user_info_id_seq OWNED BY cityservices.user_info.id;


--
-- Name: user_profile_info; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.user_profile_info (
    id integer NOT NULL,
    user_info_id integer,
    profile_fill_percent double precision,
    birth_date date,
    parent boolean DEFAULT false,
    have_car boolean DEFAULT false,
    gender character varying(6),
    create_date timestamp without time zone DEFAULT now() NOT NULL,
    update_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: user_profile_info_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.user_profile_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_profile_info_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.user_profile_info_id_seq OWNED BY cityservices.user_profile_info.id;


--
-- Name: user_request_abstract; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.user_request_abstract (
    id integer NOT NULL,
    user_id integer,
    operator_id integer,
    current_status integer,
    creation_time timestamp without time zone,
    request_type character varying(32),
    lat double precision,
    lon double precision,
    updated_at timestamp without time zone
);


--
-- Name: user_request_abstract_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.user_request_abstract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_request_abstract_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.user_request_abstract_id_seq OWNED BY cityservices.user_request_abstract.id;


--
-- Name: user_request_epd; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.user_request_epd (
    id integer NOT NULL,
    year integer,
    month integer,
    house_id integer
);


--
-- Name: user_request_feedback; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.user_request_feedback (
    id integer NOT NULL,
    text text,
    title character varying(128),
    feedback_type integer
);


--
-- Name: user_request_history; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.user_request_history (
    id integer NOT NULL,
    creation_time timestamp without time zone,
    message text,
    title character varying(128),
    status_from integer,
    status_to integer,
    lat double precision,
    lon double precision,
    status_text character varying(1024),
    request_id integer,
    user_id integer,
    operator_id integer
);


--
-- Name: user_request_history_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.user_request_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_request_history_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.user_request_history_id_seq OWNED BY cityservices.user_request_history.id;


--
-- Name: user_request_sos; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.user_request_sos (
    id integer NOT NULL,
    start timestamp without time zone,
    stop timestamp without time zone,
    sos_status integer
);


--
-- Name: user_subscription; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.user_subscription (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    type character varying(255) NOT NULL,
    channel character varying(255) NOT NULL,
    messenger_user_id bigint NOT NULL
);


--
-- Name: user_subscription_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.user_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.user_subscription_id_seq OWNED BY cityservices.user_subscription.id;


--
-- Name: user_translation; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.user_translation (
    lang character varying(32) NOT NULL,
    messages hstore,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: vaccination_plan; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.vaccination_plan (
    id integer NOT NULL,
    title text,
    description text,
    fromdt date,
    todt date,
    statusid integer NOT NULL,
    lat double precision,
    lng double precision,
    place_name text,
    place_addr text,
    user_id integer,
    operator_id character varying(36),
    recommendations text,
    type_id integer NOT NULL,
    reminder timestamp(6) without time zone
);


--
-- Name: vaccination_plan_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.vaccination_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vaccination_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.vaccination_plan_id_seq OWNED BY cityservices.vaccination_plan.id;


--
-- Name: vaccination_plan_type; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.vaccination_plan_type (
    id integer NOT NULL,
    name text,
    notification_message_template text,
    notification_subject_template text
);


--
-- Name: vaccination_plan_type_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.vaccination_plan_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vaccination_plan_type_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.vaccination_plan_type_id_seq OWNED BY cityservices.vaccination_plan_type.id;


--
-- Name: vaccination_status; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.vaccination_status (
    id integer NOT NULL,
    name text
);


--
-- Name: vaccination_status_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.vaccination_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vaccination_status_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.vaccination_status_id_seq OWNED BY cityservices.vaccination_status.id;


--
-- Name: water_meter; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.water_meter (
    id integer NOT NULL,
    type integer,
    number character varying(32),
    house_id integer
);


--
-- Name: water_meter_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.water_meter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: water_meter_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.water_meter_id_seq OWNED BY cityservices.water_meter.id;


--
-- Name: water_meter_value; Type: TABLE; Schema: cityservices; Owner: -
--

CREATE TABLE cityservices.water_meter_value (
    id integer NOT NULL,
    value double precision,
    day date,
    meter_id integer
);


--
-- Name: water_meter_value_id_seq; Type: SEQUENCE; Schema: cityservices; Owner: -
--

CREATE SEQUENCE cityservices.water_meter_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: water_meter_value_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices; Owner: -
--

ALTER SEQUENCE cityservices.water_meter_value_id_seq OWNED BY cityservices.water_meter_value.id;


--
-- Name: chat; Type: TABLE; Schema: cityservices_chats; Owner: -
--

CREATE TABLE cityservices_chats.chat (
    id integer NOT NULL,
    user_id integer NOT NULL,
    channel_id integer NOT NULL,
    message_count integer DEFAULT 0 NOT NULL,
    new_user_message_count integer DEFAULT 0 NOT NULL,
    new_operator_message_count integer DEFAULT 0 NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: chat_id_seq; Type: SEQUENCE; Schema: cityservices_chats; Owner: -
--

CREATE SEQUENCE cityservices_chats.chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_chats; Owner: -
--

ALTER SEQUENCE cityservices_chats.chat_id_seq OWNED BY cityservices_chats.chat.id;


--
-- Name: chat_message; Type: TABLE; Schema: cityservices_chats; Owner: -
--

CREATE TABLE cityservices_chats.chat_message (
    id bigint NOT NULL,
    chat_id integer NOT NULL,
    message text NOT NULL,
    message_type character varying(255) DEFAULT 'TEXT'::character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    sent boolean DEFAULT false NOT NULL,
    received boolean DEFAULT false NOT NULL,
    outcome boolean DEFAULT false NOT NULL
);


--
-- Name: chat_message_id_seq; Type: SEQUENCE; Schema: cityservices_chats; Owner: -
--

CREATE SEQUENCE cityservices_chats.chat_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_message_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_chats; Owner: -
--

ALTER SEQUENCE cityservices_chats.chat_message_id_seq OWNED BY cityservices_chats.chat_message.id;


--
-- Name: communication; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.communication (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: communication_id_seq; Type: SEQUENCE; Schema: cityservices_communication; Owner: -
--

CREATE SEQUENCE cityservices_communication.communication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: communication_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_communication; Owner: -
--

ALTER SEQUENCE cityservices_communication.communication_id_seq OWNED BY cityservices_communication.communication.id;


--
-- Name: communication_journal; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.communication_journal (
    id integer NOT NULL,
    communication_id integer NOT NULL,
    operator_id integer,
    action character varying(255) NOT NULL,
    message text,
    ip inet,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: communication_journal_id_seq; Type: SEQUENCE; Schema: cityservices_communication; Owner: -
--

CREATE SEQUENCE cityservices_communication.communication_journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: communication_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_communication; Owner: -
--

ALTER SEQUENCE cityservices_communication.communication_journal_id_seq OWNED BY cityservices_communication.communication_journal.id;


--
-- Name: communication_statistic_type; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.communication_statistic_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: communication_statistic_type_id_seq; Type: SEQUENCE; Schema: cityservices_communication; Owner: -
--

CREATE SEQUENCE cityservices_communication.communication_statistic_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: communication_statistic_type_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_communication; Owner: -
--

ALTER SEQUENCE cityservices_communication.communication_statistic_type_id_seq OWNED BY cityservices_communication.communication_statistic_type.id;


--
-- Name: communication_statistic_value; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.communication_statistic_value (
    id integer NOT NULL,
    communication_id integer NOT NULL,
    communication_statistic_type_id integer NOT NULL,
    value double precision NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: communication_statistic_value_id_seq; Type: SEQUENCE; Schema: cityservices_communication; Owner: -
--

CREATE SEQUENCE cityservices_communication.communication_statistic_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: communication_statistic_value_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_communication; Owner: -
--

ALTER SEQUENCE cityservices_communication.communication_statistic_value_id_seq OWNED BY cityservices_communication.communication_statistic_value.id;


--
-- Name: distribution; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.distribution (
    id integer NOT NULL,
    communication_id integer NOT NULL,
    distribution_template_group_id integer NOT NULL,
    distribution_group_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    info text NOT NULL,
    next_execute_time timestamp without time zone,
    status character varying(50),
    cron_expression character varying(255),
    use_cron_expression boolean DEFAULT false NOT NULL,
    minute_offset smallint
);


--
-- Name: distribution_channel; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.distribution_channel (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: distribution_channel_id_seq; Type: SEQUENCE; Schema: cityservices_communication; Owner: -
--

CREATE SEQUENCE cityservices_communication.distribution_channel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distribution_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_communication; Owner: -
--

ALTER SEQUENCE cityservices_communication.distribution_channel_id_seq OWNED BY cityservices_communication.distribution_channel.id;


--
-- Name: distribution_group; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.distribution_group (
    id integer NOT NULL,
    communication_id integer NOT NULL,
    condition text,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(255) NOT NULL,
    static_group boolean DEFAULT false NOT NULL
);


--
-- Name: distribution_group_has_user; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.distribution_group_has_user (
    distribution_group_id integer NOT NULL,
    user_id uuid NOT NULL
);


--
-- Name: distribution_group_id_seq; Type: SEQUENCE; Schema: cityservices_communication; Owner: -
--

CREATE SEQUENCE cityservices_communication.distribution_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distribution_group_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_communication; Owner: -
--

ALTER SEQUENCE cityservices_communication.distribution_group_id_seq OWNED BY cityservices_communication.distribution_group.id;


--
-- Name: distribution_has_distribution_template; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.distribution_has_distribution_template (
    distribution_template_id integer NOT NULL,
    distribution_id integer NOT NULL
);


--
-- Name: distribution_id_seq; Type: SEQUENCE; Schema: cityservices_communication; Owner: -
--

CREATE SEQUENCE cityservices_communication.distribution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distribution_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_communication; Owner: -
--

ALTER SEQUENCE cityservices_communication.distribution_id_seq OWNED BY cityservices_communication.distribution.id;


--
-- Name: distribution_journal; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.distribution_journal (
    id integer NOT NULL,
    distribution_id integer NOT NULL,
    operator_id integer,
    action character varying(255) NOT NULL,
    message text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: distribution_journal_id_seq; Type: SEQUENCE; Schema: cityservices_communication; Owner: -
--

CREATE SEQUENCE cityservices_communication.distribution_journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distribution_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_communication; Owner: -
--

ALTER SEQUENCE cityservices_communication.distribution_journal_id_seq OWNED BY cityservices_communication.distribution_journal.id;


--
-- Name: distribution_log; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.distribution_log (
    id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    message text NOT NULL,
    distribution_id integer NOT NULL
);


--
-- Name: distribution_log_id_seq; Type: SEQUENCE; Schema: cityservices_communication; Owner: -
--

CREATE SEQUENCE cityservices_communication.distribution_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distribution_log_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_communication; Owner: -
--

ALTER SEQUENCE cityservices_communication.distribution_log_id_seq OWNED BY cityservices_communication.distribution_log.id;


--
-- Name: distribution_template; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.distribution_template (
    id integer NOT NULL,
    group_id integer NOT NULL,
    channel_id integer NOT NULL,
    template text NOT NULL
);


--
-- Name: distribution_template_group; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.distribution_template_group (
    id integer NOT NULL,
    communication_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: distribution_template_id_seq; Type: SEQUENCE; Schema: cityservices_communication; Owner: -
--

CREATE SEQUENCE cityservices_communication.distribution_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distribution_template_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_communication; Owner: -
--

ALTER SEQUENCE cityservices_communication.distribution_template_id_seq OWNED BY cityservices_communication.distribution_template_group.id;


--
-- Name: distribution_template_id_seq1; Type: SEQUENCE; Schema: cityservices_communication; Owner: -
--

CREATE SEQUENCE cityservices_communication.distribution_template_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distribution_template_id_seq1; Type: SEQUENCE OWNED BY; Schema: cityservices_communication; Owner: -
--

ALTER SEQUENCE cityservices_communication.distribution_template_id_seq1 OWNED BY cityservices_communication.distribution_template.id;


--
-- Name: qrtz_blob_triggers; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);


--
-- Name: qrtz_calendars; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);


--
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);


--
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint NOT NULL,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent boolean,
    requests_recovery boolean
);


--
-- Name: qrtz_job_details; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable boolean NOT NULL,
    is_nonconcurrent boolean NOT NULL,
    is_update_data boolean NOT NULL,
    requests_recovery boolean NOT NULL,
    job_data bytea
);


--
-- Name: qrtz_locks; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);


--
-- Name: qrtz_paused_trigger_grps; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);


--
-- Name: qrtz_scheduler_state; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);


--
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);


--
-- Name: qrtz_simprop_triggers; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);


--
-- Name: qrtz_triggers; Type: TABLE; Schema: cityservices_communication; Owner: -
--

CREATE TABLE cityservices_communication.qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);


--
-- Name: engagement_index; Type: TABLE; Schema: cityservices_metric; Owner: -
--

CREATE TABLE cityservices_metric.engagement_index (
    id integer NOT NULL,
    date date,
    read_news bigint,
    like_news bigint,
    dislike_news bigint,
    polls_finished bigint,
    complaint bigint,
    chat_messages bigint,
    inmail_messages bigint,
    total_users bigint,
    "time" time without time zone
);


--
-- Name: engagement_index_id_seq; Type: SEQUENCE; Schema: cityservices_metric; Owner: -
--

CREATE SEQUENCE cityservices_metric.engagement_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: engagement_index_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_metric; Owner: -
--

ALTER SEQUENCE cityservices_metric.engagement_index_id_seq OWNED BY cityservices_metric.engagement_index.id;


--
-- Name: event; Type: TABLE; Schema: cityservices_metric; Owner: -
--

CREATE TABLE cityservices_metric.event (
    id bigint NOT NULL,
    type character varying(32),
    date timestamp without time zone,
    data jsonb
);


--
-- Name: event_id_seq; Type: SEQUENCE; Schema: cityservices_metric; Owner: -
--

CREATE SEQUENCE cityservices_metric.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_metric; Owner: -
--

ALTER SEQUENCE cityservices_metric.event_id_seq OWNED BY cityservices_metric.event.id;


--
-- Name: profile_info_index; Type: TABLE; Schema: cityservices_metric; Owner: -
--

CREATE TABLE cityservices_metric.profile_info_index (
    id integer NOT NULL,
    date date,
    total_users bigint,
    users_with_email bigint,
    users_with_car bigint,
    users_with_home_address bigint,
    users_with_children_info bigint,
    average_fill_percent double precision,
    "time" time without time zone
);


--
-- Name: profile_info_index_id_seq; Type: SEQUENCE; Schema: cityservices_metric; Owner: -
--

CREATE SEQUENCE cityservices_metric.profile_info_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profile_info_index_id_seq; Type: SEQUENCE OWNED BY; Schema: cityservices_metric; Owner: -
--

ALTER SEQUENCE cityservices_metric.profile_info_index_id_seq OWNED BY cityservices_metric.profile_info_index.id;


--
-- Name: databasechangelog; Type: TABLE; Schema: email; Owner: -
--

CREATE TABLE email.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: email; Owner: -
--

CREATE TABLE email.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: email_account; Type: TABLE; Schema: email; Owner: -
--

CREATE TABLE email.email_account (
    id bigint NOT NULL,
    description character varying(255),
    application_group text NOT NULL,
    default_from_name character varying(255),
    address character varying(255) NOT NULL,
    auth boolean DEFAULT false NOT NULL,
    username character varying(255),
    password character varying(255),
    update_date timestamp without time zone DEFAULT now() NOT NULL,
    smtp_server_id bigint NOT NULL
);


--
-- Name: email_account_id_seq; Type: SEQUENCE; Schema: email; Owner: -
--

CREATE SEQUENCE email.email_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_account_id_seq; Type: SEQUENCE OWNED BY; Schema: email; Owner: -
--

ALTER SEQUENCE email.email_account_id_seq OWNED BY email.email_account.id;


--
-- Name: smtp_server; Type: TABLE; Schema: email; Owner: -
--

CREATE TABLE email.smtp_server (
    id bigint NOT NULL,
    description character varying(255),
    host character varying(255) NOT NULL,
    port integer NOT NULL,
    encryption integer DEFAULT 0 NOT NULL,
    update_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: smtp_server_id_seq; Type: SEQUENCE; Schema: email; Owner: -
--

CREATE SEQUENCE email.smtp_server_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: smtp_server_id_seq; Type: SEQUENCE OWNED BY; Schema: email; Owner: -
--

ALTER SEQUENCE email.smtp_server_id_seq OWNED BY email.smtp_server.id;


--
-- Name: address_cache; Type: TABLE; Schema: gis; Owner: -
--

CREATE TABLE gis.address_cache (
    lat double precision NOT NULL,
    lon double precision NOT NULL,
    address character varying(2048)
);


--
-- Name: bucket_info; Type: TABLE; Schema: large_obj_storage; Owner: -
--

CREATE TABLE large_obj_storage.bucket_info (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    application_group_id smallint NOT NULL
);


--
-- Name: bucket_info_id_seq; Type: SEQUENCE; Schema: large_obj_storage; Owner: -
--

CREATE SEQUENCE large_obj_storage.bucket_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bucket_info_id_seq; Type: SEQUENCE OWNED BY; Schema: large_obj_storage; Owner: -
--

ALTER SEQUENCE large_obj_storage.bucket_info_id_seq OWNED BY large_obj_storage.bucket_info.id;


--
-- Name: file_info; Type: TABLE; Schema: large_obj_storage; Owner: -
--

CREATE TABLE large_obj_storage.file_info (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    public_file boolean DEFAULT false NOT NULL,
    bucket_id integer NOT NULL,
    folder boolean DEFAULT false NOT NULL
);


--
-- Name: file_info_id_seq; Type: SEQUENCE; Schema: large_obj_storage; Owner: -
--

CREATE SEQUENCE large_obj_storage.file_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: file_info_id_seq; Type: SEQUENCE OWNED BY; Schema: large_obj_storage; Owner: -
--

ALTER SEQUENCE large_obj_storage.file_info_id_seq OWNED BY large_obj_storage.file_info.id;


--
-- Name: config; Type: TABLE; Schema: mobile_store; Owner: -
--

CREATE TABLE mobile_store.config (
    id integer NOT NULL,
    data text,
    ttl bigint NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    mobile_application_id smallint NOT NULL
);


--
-- Name: config_id_seq; Type: SEQUENCE; Schema: mobile_store; Owner: -
--

CREATE SEQUENCE mobile_store.config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: config_id_seq; Type: SEQUENCE OWNED BY; Schema: mobile_store; Owner: -
--

ALTER SEQUENCE mobile_store.config_id_seq OWNED BY mobile_store.config.id;


--
-- Name: image; Type: TABLE; Schema: mobile_store; Owner: -
--

CREATE TABLE mobile_store.image (
    id uuid NOT NULL,
    data text,
    is_main boolean DEFAULT false,
    mobile_application_id smallint
);


--
-- Name: message_bundle; Type: TABLE; Schema: mobile_store; Owner: -
--

CREATE TABLE mobile_store.message_bundle (
    id integer NOT NULL,
    is_default boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    locale character varying(20) NOT NULL,
    ttl bigint NOT NULL,
    name_value_parameter_map hstore NOT NULL,
    application_group_id smallint NOT NULL
);


--
-- Name: message_bundle_id_seq; Type: SEQUENCE; Schema: mobile_store; Owner: -
--

CREATE SEQUENCE mobile_store.message_bundle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: message_bundle_id_seq; Type: SEQUENCE OWNED BY; Schema: mobile_store; Owner: -
--

ALTER SEQUENCE mobile_store.message_bundle_id_seq OWNED BY mobile_store.message_bundle.id;


--
-- Name: view; Type: TABLE; Schema: mobile_store; Owner: -
--

CREATE TABLE mobile_store.view (
    id integer NOT NULL,
    name character varying(128),
    data text,
    last_modified timestamp without time zone NOT NULL,
    ttl integer NOT NULL,
    mobile_application_id smallint NOT NULL,
    meta_data text,
    layout_type character varying(255),
    application_group_id smallint NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: view_id_seq; Type: SEQUENCE; Schema: mobile_store; Owner: -
--

CREATE SEQUENCE mobile_store.view_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: view_id_seq; Type: SEQUENCE OWNED BY; Schema: mobile_store; Owner: -
--

ALTER SEQUENCE mobile_store.view_id_seq OWNED BY mobile_store.view.id;


--
-- Name: log; Type: TABLE; Schema: notification; Owner: -
--

CREATE TABLE notification.log (
    id bigint NOT NULL,
    type character varying(32) NOT NULL,
    level character varying(32) NOT NULL,
    data text,
    result text,
    recipient character varying(64) NOT NULL,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL
);


--
-- Name: log_id_seq; Type: SEQUENCE; Schema: notification; Owner: -
--

CREATE SEQUENCE notification.log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: notification; Owner: -
--

ALTER SEQUENCE notification.log_id_seq OWNED BY notification.log.id;


--
-- Name: answer; Type: TABLE; Schema: poll; Owner: -
--

CREATE TABLE poll.answer (
    id integer NOT NULL,
    question_id integer NOT NULL,
    text text NOT NULL,
    index integer NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    image_link character varying(2048),
    type character varying(64),
    input_type character varying(64)
);


--
-- Name: answer_id_seq; Type: SEQUENCE; Schema: poll; Owner: -
--

CREATE SEQUENCE poll.answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answer_id_seq; Type: SEQUENCE OWNED BY; Schema: poll; Owner: -
--

ALTER SEQUENCE poll.answer_id_seq OWNED BY poll.answer.id;


--
-- Name: poll; Type: TABLE; Schema: poll; Owner: -
--

CREATE TABLE poll.poll (
    id integer NOT NULL,
    title text NOT NULL,
    description text,
    image_link character varying(2048),
    points integer DEFAULT 0 NOT NULL,
    place_name character varying(256),
    place_lat double precision,
    place_lon double precision,
    category_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    archived boolean DEFAULT false NOT NULL
);


--
-- Name: poll_answer_profiling_point; Type: TABLE; Schema: poll; Owner: -
--

CREATE TABLE poll.poll_answer_profiling_point (
    answer_id integer NOT NULL,
    category_id integer NOT NULL,
    rating real NOT NULL,
    weight real NOT NULL
);


--
-- Name: poll_id_seq; Type: SEQUENCE; Schema: poll; Owner: -
--

CREATE SEQUENCE poll.poll_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: poll_id_seq; Type: SEQUENCE OWNED BY; Schema: poll; Owner: -
--

ALTER SEQUENCE poll.poll_id_seq OWNED BY poll.poll.id;


--
-- Name: publishing; Type: TABLE; Schema: poll; Owner: -
--

CREATE TABLE poll.publishing (
    id integer NOT NULL,
    poll_id integer NOT NULL,
    important boolean DEFAULT false NOT NULL,
    user_id integer NOT NULL,
    start_time timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    end_time timestamp without time zone NOT NULL
);


--
-- Name: publishing_id_seq; Type: SEQUENCE; Schema: poll; Owner: -
--

CREATE SEQUENCE poll.publishing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: publishing_id_seq; Type: SEQUENCE OWNED BY; Schema: poll; Owner: -
--

ALTER SEQUENCE poll.publishing_id_seq OWNED BY poll.publishing.id;


--
-- Name: question; Type: TABLE; Schema: poll; Owner: -
--

CREATE TABLE poll.question (
    id integer NOT NULL,
    title text,
    description text,
    poll_id integer NOT NULL,
    index integer NOT NULL,
    answers_min integer DEFAULT 0 NOT NULL,
    answers_max integer DEFAULT 10 NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: question_id_seq; Type: SEQUENCE; Schema: poll; Owner: -
--

CREATE SEQUENCE poll.question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: poll; Owner: -
--

ALTER SEQUENCE poll.question_id_seq OWNED BY poll.question.id;


--
-- Name: user_answer; Type: TABLE; Schema: poll; Owner: -
--

CREATE TABLE poll.user_answer (
    id integer NOT NULL,
    user_question_id integer NOT NULL,
    answer_id integer NOT NULL,
    value text,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: user_answer_id_seq; Type: SEQUENCE; Schema: poll; Owner: -
--

CREATE SEQUENCE poll.user_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: poll; Owner: -
--

ALTER SEQUENCE poll.user_answer_id_seq OWNED BY poll.user_answer.id;


--
-- Name: user_point_history; Type: TABLE; Schema: poll; Owner: -
--

CREATE TABLE poll.user_point_history (
    id integer NOT NULL,
    user_id integer NOT NULL,
    poll_id integer DEFAULT 0 NOT NULL,
    multiplier integer DEFAULT 0 NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT user_point_history_amount_check CHECK ((amount >= 0))
);


--
-- Name: user_point_history_id_seq; Type: SEQUENCE; Schema: poll; Owner: -
--

CREATE SEQUENCE poll.user_point_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_point_history_id_seq; Type: SEQUENCE OWNED BY; Schema: poll; Owner: -
--

ALTER SEQUENCE poll.user_point_history_id_seq OWNED BY poll.user_point_history.id;


--
-- Name: user_profiling_points; Type: TABLE; Schema: poll; Owner: -
--

CREATE TABLE poll.user_profiling_points (
    user_id integer NOT NULL,
    category_id integer NOT NULL,
    rating_sum real DEFAULT 0 NOT NULL,
    weight_sum real DEFAULT 1 NOT NULL,
    rate real DEFAULT 0 NOT NULL
);


--
-- Name: user_question; Type: TABLE; Schema: poll; Owner: -
--

CREATE TABLE poll.user_question (
    id integer NOT NULL,
    user_id integer NOT NULL,
    question_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


--
-- Name: user_question_id_seq; Type: SEQUENCE; Schema: poll; Owner: -
--

CREATE SEQUENCE poll.user_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_question_id_seq; Type: SEQUENCE OWNED BY; Schema: poll; Owner: -
--

ALTER SEQUENCE poll.user_question_id_seq OWNED BY poll.user_question.id;


--
-- Name: user_status; Type: TABLE; Schema: poll; Owner: -
--

CREATE TABLE poll.user_status (
    id integer NOT NULL,
    user_id integer NOT NULL,
    poll_id integer NOT NULL,
    updated_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    total_questions integer NOT NULL,
    next_question_id integer,
    next_question_index integer,
    status character varying(64) NOT NULL
);


--
-- Name: user_status_id_seq; Type: SEQUENCE; Schema: poll; Owner: -
--

CREATE SEQUENCE poll.user_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_status_id_seq; Type: SEQUENCE OWNED BY; Schema: poll; Owner: -
--

ALTER SEQUENCE poll.user_status_id_seq OWNED BY poll.user_status.id;


--
-- Name: user_status_log; Type: TABLE; Schema: poll; Owner: -
--

CREATE TABLE poll.user_status_log (
    id integer NOT NULL,
    user_id integer NOT NULL,
    poll_id integer NOT NULL,
    updated_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    total_questions integer NOT NULL,
    next_question_id integer,
    next_question_index integer,
    status character varying(64) NOT NULL
);


--
-- Name: user_status_log_id_seq; Type: SEQUENCE; Schema: poll; Owner: -
--

CREATE SEQUENCE poll.user_status_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_status_log_id_seq; Type: SEQUENCE OWNED BY; Schema: poll; Owner: -
--

ALTER SEQUENCE poll.user_status_log_id_seq OWNED BY poll.user_status_log.id;


--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: sample_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sample_data (
    id integer NOT NULL,
    name character varying(10),
    user_identifier character varying(36),
    appgroup_identifier smallint
);


--
-- Name: sample_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sample_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sample_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sample_data_id_seq OWNED BY public.sample_data.id;


--
-- Name: certificate; Type: TABLE; Schema: push; Owner: -
--

CREATE TABLE push.certificate (
    id bigint NOT NULL,
    name character varying(256) NOT NULL,
    ext_id character varying(36) NOT NULL,
    type character varying(32) NOT NULL,
    update_date timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: certificate_android; Type: TABLE; Schema: push; Owner: -
--

CREATE TABLE push.certificate_android (
    id bigint NOT NULL,
    certificate character varying(256) NOT NULL
);


--
-- Name: certificate_id_seq; Type: SEQUENCE; Schema: push; Owner: -
--

CREATE SEQUENCE push.certificate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: certificate_id_seq; Type: SEQUENCE OWNED BY; Schema: push; Owner: -
--

ALTER SEQUENCE push.certificate_id_seq OWNED BY push.certificate.id;


--
-- Name: certificate_ios; Type: TABLE; Schema: push; Owner: -
--

CREATE TABLE push.certificate_ios (
    id bigint NOT NULL,
    certificate bytea NOT NULL,
    password character varying(256) DEFAULT NULL::character varying,
    is_prod boolean NOT NULL
);


--
-- Name: certificate_winphone; Type: TABLE; Schema: push; Owner: -
--

CREATE TABLE push.certificate_winphone (
    id bigint NOT NULL
);


--
-- Name: databasechangelog; Type: TABLE; Schema: push; Owner: -
--

CREATE TABLE push.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: push; Owner: -
--

CREATE TABLE push.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: databasechangelog; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: qrtz_blob_triggers; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);


--
-- Name: qrtz_calendars; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);


--
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);


--
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint NOT NULL,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent boolean,
    requests_recovery boolean
);


--
-- Name: qrtz_job_details; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable boolean NOT NULL,
    is_nonconcurrent boolean NOT NULL,
    is_update_data boolean NOT NULL,
    requests_recovery boolean NOT NULL,
    job_data bytea
);


--
-- Name: qrtz_locks; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);


--
-- Name: qrtz_paused_trigger_grps; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);


--
-- Name: qrtz_scheduler_state; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);


--
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);


--
-- Name: qrtz_simprop_triggers; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);


--
-- Name: qrtz_triggers; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);


--
-- Name: resource; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.resource (
    id integer NOT NULL,
    instance_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    create_schedule boolean DEFAULT false NOT NULL,
    create_schedule_start_time time(6) without time zone DEFAULT '00:00:00'::time without time zone NOT NULL,
    schedule_for_next_hours integer DEFAULT 24 NOT NULL,
    schedule_gaps_between_slots_mins integer DEFAULT 5 NOT NULL,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    tree ltree DEFAULT 'root'::ltree NOT NULL,
    parent_id bigint,
    system_name character varying(255) NOT NULL
);


--
-- Name: COLUMN resource.create_schedule; Type: COMMENT; Schema: resource_structure; Owner: -
--

COMMENT ON COLUMN resource_structure.resource.create_schedule IS 'Need or not create schedule automatic';


--
-- Name: COLUMN resource.create_schedule_start_time; Type: COMMENT; Schema: resource_structure; Owner: -
--

COMMENT ON COLUMN resource_structure.resource.create_schedule_start_time IS 'At what time will start creating a schedule';


--
-- Name: COLUMN resource.schedule_for_next_hours; Type: COMMENT; Schema: resource_structure; Owner: -
--

COMMENT ON COLUMN resource_structure.resource.schedule_for_next_hours IS 'Create a schedule for next x hours. Example: value 24 means that a schedule will be created for 1 day';


--
-- Name: COLUMN resource.schedule_gaps_between_slots_mins; Type: COMMENT; Schema: resource_structure; Owner: -
--

COMMENT ON COLUMN resource_structure.resource.schedule_gaps_between_slots_mins IS 'Time in minutes between the created slots';


--
-- Name: COLUMN resource.tree; Type: COMMENT; Schema: resource_structure; Owner: -
--

COMMENT ON COLUMN resource_structure.resource.tree IS 'The service structure for hierarchy';


--
-- Name: resource_id_seq; Type: SEQUENCE; Schema: resource_structure; Owner: -
--

CREATE SEQUENCE resource_structure.resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_id_seq; Type: SEQUENCE OWNED BY; Schema: resource_structure; Owner: -
--

ALTER SEQUENCE resource_structure.resource_id_seq OWNED BY resource_structure.resource.id;


--
-- Name: resource_instance; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.resource_instance (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    create_schedule boolean,
    create_schedule_start_time time(6) without time zone,
    schedule_for_next_hours integer,
    schedule_gaps_between_slots_mins integer,
    properties jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    tree ltree DEFAULT 'root'::ltree NOT NULL,
    parent_id bigint,
    next_fire_time timestamp without time zone,
    last_scheduled_date timestamp without time zone,
    resource_id integer NOT NULL
);


--
-- Name: COLUMN resource_instance.properties; Type: COMMENT; Schema: resource_structure; Owner: -
--

COMMENT ON COLUMN resource_structure.resource_instance.properties IS 'A map of different properties like {"address": "street ..."} or {"address": {"value": "street", "name": "Адрес"}}';


--
-- Name: resource_instance_id_seq; Type: SEQUENCE; Schema: resource_structure; Owner: -
--

CREATE SEQUENCE resource_structure.resource_instance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resource_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: resource_structure; Owner: -
--

ALTER SEQUENCE resource_structure.resource_instance_id_seq OWNED BY resource_structure.resource_instance.id;


--
-- Name: schedule; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.schedule (
    id bigint NOT NULL,
    resource_id integer,
    resource_instance_id bigint,
    day_of_week integer NOT NULL,
    start_time time(6) without time zone DEFAULT '08:00:00'::time without time zone NOT NULL,
    end_time time(6) without time zone DEFAULT '18:00:00'::time without time zone NOT NULL,
    description text,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL,
    slot_duration_mins integer NOT NULL,
    CONSTRAINT dayofweekmustbemorezeroandlesseight CHECK (((day_of_week >= 1) AND (day_of_week <= 7))),
    CONSTRAINT resourceorresourceinstancemustbenotnull CHECK (((((resource_id IS NOT NULL))::integer + ((resource_instance_id IS NOT NULL))::integer) > 0))
);


--
-- Name: COLUMN schedule.day_of_week; Type: COMMENT; Schema: resource_structure; Owner: -
--

COMMENT ON COLUMN resource_structure.schedule.day_of_week IS 'Day of a week:
1 - Mon
2 - Tue
3 - Wed
4 - Thu
5 - Fri
6 - Sat
7 - Sun';


--
-- Name: schedule_gap; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.schedule_gap (
    id bigint NOT NULL,
    schedule_id bigint NOT NULL,
    start_time time(6) without time zone NOT NULL,
    end_time time(6) without time zone NOT NULL,
    description text,
    created_at timestamp(6) without time zone DEFAULT now() NOT NULL
);


--
-- Name: schedule_gap_id_seq; Type: SEQUENCE; Schema: resource_structure; Owner: -
--

CREATE SEQUENCE resource_structure.schedule_gap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schedule_gap_id_seq; Type: SEQUENCE OWNED BY; Schema: resource_structure; Owner: -
--

ALTER SEQUENCE resource_structure.schedule_gap_id_seq OWNED BY resource_structure.schedule_gap.id;


--
-- Name: schedule_id_seq; Type: SEQUENCE; Schema: resource_structure; Owner: -
--

CREATE SEQUENCE resource_structure.schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: resource_structure; Owner: -
--

ALTER SEQUENCE resource_structure.schedule_id_seq OWNED BY resource_structure.schedule.id;


--
-- Name: scheduler_log; Type: TABLE; Schema: resource_structure; Owner: -
--

CREATE TABLE resource_structure.scheduler_log (
    id bigint NOT NULL,
    action character varying(255) NOT NULL,
    data text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    resource_instance_id bigint NOT NULL,
    executed_time bigint
);


--
-- Name: scheduler_log_id_seq; Type: SEQUENCE; Schema: resource_structure; Owner: -
--

CREATE SEQUENCE resource_structure.scheduler_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: scheduler_log_id_seq; Type: SEQUENCE OWNED BY; Schema: resource_structure; Owner: -
--

ALTER SEQUENCE resource_structure.scheduler_log_id_seq OWNED BY resource_structure.scheduler_log.id;


--
-- Name: abstract_task; Type: TABLE; Schema: scheduling; Owner: -
--

CREATE TABLE scheduling.abstract_task (
    id integer NOT NULL,
    endpoint_descriptor_id integer NOT NULL,
    name character varying(50),
    description character varying(512),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    thread_count integer,
    is_active boolean DEFAULT false,
    type character varying(16) NOT NULL,
    application_id smallint,
    application_group_id smallint NOT NULL
);


--
-- Name: abstract_task_id_seq; Type: SEQUENCE; Schema: scheduling; Owner: -
--

CREATE SEQUENCE scheduling.abstract_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: abstract_task_id_seq; Type: SEQUENCE OWNED BY; Schema: scheduling; Owner: -
--

ALTER SEQUENCE scheduling.abstract_task_id_seq OWNED BY scheduling.abstract_task.id;


--
-- Name: cron_task; Type: TABLE; Schema: scheduling; Owner: -
--

CREATE TABLE scheduling.cron_task (
    id integer NOT NULL,
    cron_expression character varying(128) NOT NULL
);


--
-- Name: task_execution; Type: TABLE; Schema: scheduling; Owner: -
--

CREATE TABLE scheduling.task_execution (
    id bigint NOT NULL,
    task_id integer,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    successful boolean DEFAULT true NOT NULL,
    error_code integer,
    error_message character varying(512)
);


--
-- Name: task_execution_id_seq; Type: SEQUENCE; Schema: scheduling; Owner: -
--

CREATE SEQUENCE scheduling.task_execution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: task_execution_id_seq; Type: SEQUENCE OWNED BY; Schema: scheduling; Owner: -
--

ALTER SEQUENCE scheduling.task_execution_id_seq OWNED BY scheduling.task_execution.id;


--
-- Name: time_task; Type: TABLE; Schema: scheduling; Owner: -
--

CREATE TABLE scheduling.time_task (
    id integer NOT NULL,
    interval_ms bigint NOT NULL,
    repeat_count integer NOT NULL
);


--
-- Name: databasechangelog; Type: TABLE; Schema: script_backend; Owner: -
--

CREATE TABLE script_backend.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: script_backend; Owner: -
--

CREATE TABLE script_backend.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: script_backend; Type: TABLE; Schema: script_backend; Owner: -
--

CREATE TABLE script_backend.script_backend (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    group_id integer DEFAULT 0 NOT NULL
);


--
-- Name: script_backend_id_seq; Type: SEQUENCE; Schema: script_backend; Owner: -
--

CREATE SEQUENCE script_backend.script_backend_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: script_backend_id_seq; Type: SEQUENCE OWNED BY; Schema: script_backend; Owner: -
--

ALTER SEQUENCE script_backend.script_backend_id_seq OWNED BY script_backend.script_backend.id;


--
-- Name: script_endpoint; Type: TABLE; Schema: script_backend; Owner: -
--

CREATE TABLE script_backend.script_endpoint (
    id integer NOT NULL,
    backend_id integer NOT NULL,
    name character varying(50) NOT NULL,
    script_text text NOT NULL,
    script_base_class text,
    request_data_type jsonb NOT NULL,
    response_data_type jsonb NOT NULL,
    isolation jsonb
);


--
-- Name: script_endpoint_id_seq; Type: SEQUENCE; Schema: script_backend; Owner: -
--

CREATE SEQUENCE script_backend.script_endpoint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: script_endpoint_id_seq; Type: SEQUENCE OWNED BY; Schema: script_backend; Owner: -
--

ALTER SEQUENCE script_backend.script_endpoint_id_seq OWNED BY script_backend.script_endpoint.id;


--
-- Name: client; Type: TABLE; Schema: sms; Owner: -
--

CREATE TABLE sms.client (
    id integer NOT NULL,
    name character varying(36) NOT NULL,
    token character varying(36) NOT NULL,
    notification_url character varying(255),
    message_url character varying(255),
    text_service boolean DEFAULT false NOT NULL
);


--
-- Name: client_id_seq; Type: SEQUENCE; Schema: sms; Owner: -
--

CREATE SEQUENCE sms.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: sms; Owner: -
--

ALTER SEQUENCE sms.client_id_seq OWNED BY sms.client.id;


--
-- Name: databasechangelog; Type: TABLE; Schema: sms; Owner: -
--

CREATE TABLE sms.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: sms; Owner: -
--

CREATE TABLE sms.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: provider; Type: TABLE; Schema: sms; Owner: -
--

CREATE TABLE sms.provider (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    active boolean DEFAULT false NOT NULL,
    queue character varying(60) NOT NULL,
    connection_url character varying(255)
);


--
-- Name: provider_id_seq; Type: SEQUENCE; Schema: sms; Owner: -
--

CREATE SEQUENCE sms.provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: provider_id_seq; Type: SEQUENCE OWNED BY; Schema: sms; Owner: -
--

ALTER SEQUENCE sms.provider_id_seq OWNED BY sms.provider.id;


--
-- Name: routing; Type: TABLE; Schema: sms; Owner: -
--

CREATE TABLE sms.routing (
    id integer NOT NULL,
    client_id integer NOT NULL,
    provider_id integer NOT NULL,
    route character varying(10) NOT NULL,
    sender character varying(21) NOT NULL,
    pattern character varying(50),
    priority smallint DEFAULT 0 NOT NULL,
    active boolean DEFAULT false NOT NULL
);


--
-- Name: routing_id_seq; Type: SEQUENCE; Schema: sms; Owner: -
--

CREATE SEQUENCE sms.routing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routing_id_seq; Type: SEQUENCE OWNED BY; Schema: sms; Owner: -
--

ALTER SEQUENCE sms.routing_id_seq OWNED BY sms.routing.id;


--
-- Name: sms_message; Type: TABLE; Schema: sms; Owner: -
--

CREATE TABLE sms.sms_message (
    id integer NOT NULL,
    sms_id character varying(36),
    client_id integer,
    routing_id integer,
    sender character varying(21) NOT NULL,
    msisdn character varying(21) NOT NULL,
    message text NOT NULL,
    status character varying(20) NOT NULL,
    error character varying(50),
    created timestamp without time zone,
    submitted timestamp without time zone,
    delivered timestamp without time zone
);


--
-- Name: sms_message_id_seq; Type: SEQUENCE; Schema: sms; Owner: -
--

CREATE SEQUENCE sms.sms_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sms_message_id_seq; Type: SEQUENCE OWNED BY; Schema: sms; Owner: -
--

ALTER SEQUENCE sms.sms_message_id_seq OWNED BY sms.sms_message.id;


--
-- Name: sms_transaction; Type: TABLE; Schema: sms; Owner: -
--

CREATE TABLE sms.sms_transaction (
    id integer NOT NULL,
    msg_id integer,
    msg_ref integer DEFAULT 0 NOT NULL,
    msg_part integer DEFAULT 0 NOT NULL,
    msg_count integer DEFAULT 0 NOT NULL,
    provider character varying(36),
    provider_msg_id character varying(36),
    status character varying(16),
    error character varying(16),
    created timestamp without time zone,
    submitted timestamp without time zone,
    route character varying(10) NOT NULL,
    sender character varying(21) NOT NULL,
    msisdn character varying(21) NOT NULL,
    body text,
    delivered timestamp without time zone
);


--
-- Name: sms_transaction_id_seq; Type: SEQUENCE; Schema: sms; Owner: -
--

CREATE SEQUENCE sms.sms_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sms_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: sms; Owner: -
--

ALTER SEQUENCE sms.sms_transaction_id_seq OWNED BY sms.sms_transaction.id;


--
-- Name: databasechangelog; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: storage; Owner: -
--

CREATE TABLE storage.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: databasechangelog; Type: TABLE; Schema: telegram_bot; Owner: -
--

CREATE TABLE telegram_bot.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: telegram_bot; Owner: -
--

CREATE TABLE telegram_bot.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: telegram_bot; Type: TABLE; Schema: telegram_bot; Owner: -
--

CREATE TABLE telegram_bot.telegram_bot (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    registration_url character varying(255),
    handler_url character varying(255) NOT NULL,
    application_group character varying(255),
    application character varying(255),
    default_locale character varying(255) DEFAULT 'en'::character varying NOT NULL
);


--
-- Name: telegram_bot_id_seq; Type: SEQUENCE; Schema: telegram_bot; Owner: -
--

CREATE SEQUENCE telegram_bot.telegram_bot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: telegram_bot_id_seq; Type: SEQUENCE OWNED BY; Schema: telegram_bot; Owner: -
--

ALTER SEQUENCE telegram_bot.telegram_bot_id_seq OWNED BY telegram_bot.telegram_bot.id;


--
-- Name: bot_listener; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.bot_listener (
    id integer NOT NULL,
    bot_name character varying(255) NOT NULL,
    enable boolean DEFAULT false NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    welcome_template text,
    not_registered_welcome_template text,
    default_keyboard_id integer,
    not_registered_keyboard_id integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    error_template text,
    unknown_command_template text,
    debug_mode boolean DEFAULT false NOT NULL,
    not_found_keyboard_template text
);


--
-- Name: bot_listener_id_seq; Type: SEQUENCE; Schema: telegram_handler; Owner: -
--

CREATE SEQUENCE telegram_handler.bot_listener_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bot_listener_id_seq; Type: SEQUENCE OWNED BY; Schema: telegram_handler; Owner: -
--

ALTER SEQUENCE telegram_handler.bot_listener_id_seq OWNED BY telegram_handler.bot_listener.id;


--
-- Name: command; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.command (
    id integer NOT NULL,
    bot_id integer NOT NULL,
    group_id integer NOT NULL,
    command character varying(255) NOT NULL,
    command_type character varying(255) NOT NULL,
    method_url character varying(512),
    params text DEFAULT '[]'::text NOT NULL,
    additional_params text DEFAULT '[]'::text NOT NULL,
    script text,
    text_template text,
    required_registration boolean DEFAULT true NOT NULL,
    enable boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: command_error; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.command_error (
    id integer NOT NULL,
    command character varying(512) NOT NULL,
    command_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    type character varying(255),
    message text
);


--
-- Name: command_error_id_seq; Type: SEQUENCE; Schema: telegram_handler; Owner: -
--

CREATE SEQUENCE telegram_handler.command_error_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: command_error_id_seq; Type: SEQUENCE OWNED BY; Schema: telegram_handler; Owner: -
--

ALTER SEQUENCE telegram_handler.command_error_id_seq OWNED BY telegram_handler.command_error.id;


--
-- Name: command_group; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.command_group (
    id integer NOT NULL,
    bot_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: command_group_id_seq; Type: SEQUENCE; Schema: telegram_handler; Owner: -
--

CREATE SEQUENCE telegram_handler.command_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: command_group_id_seq; Type: SEQUENCE OWNED BY; Schema: telegram_handler; Owner: -
--

ALTER SEQUENCE telegram_handler.command_group_id_seq OWNED BY telegram_handler.command_group.id;


--
-- Name: command_id_seq; Type: SEQUENCE; Schema: telegram_handler; Owner: -
--

CREATE SEQUENCE telegram_handler.command_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: command_id_seq; Type: SEQUENCE OWNED BY; Schema: telegram_handler; Owner: -
--

ALTER SEQUENCE telegram_handler.command_id_seq OWNED BY telegram_handler.command.id;


--
-- Name: default_keyboard; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.default_keyboard (
    id integer NOT NULL,
    bot_id integer NOT NULL,
    buttons text DEFAULT '[]'::text NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    description text,
    navigate_message text
);


--
-- Name: default_keyboard_id_seq; Type: SEQUENCE; Schema: telegram_handler; Owner: -
--

CREATE SEQUENCE telegram_handler.default_keyboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: default_keyboard_id_seq; Type: SEQUENCE OWNED BY; Schema: telegram_handler; Owner: -
--

ALTER SEQUENCE telegram_handler.default_keyboard_id_seq OWNED BY telegram_handler.default_keyboard.id;


--
-- Name: periodic_task; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.periodic_task (
    id integer NOT NULL,
    bot_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    script text NOT NULL,
    method_url character varying(512) NOT NULL,
    next_execute_time timestamp without time zone,
    execute_time timestamp without time zone,
    cron_expression character varying(255),
    execute_type character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    time_zone integer DEFAULT 0 NOT NULL
);


--
-- Name: periodic_task_id_seq; Type: SEQUENCE; Schema: telegram_handler; Owner: -
--

CREATE SEQUENCE telegram_handler.periodic_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: periodic_task_id_seq; Type: SEQUENCE OWNED BY; Schema: telegram_handler; Owner: -
--

ALTER SEQUENCE telegram_handler.periodic_task_id_seq OWNED BY telegram_handler.periodic_task.id;


--
-- Name: qrtz_blob_triggers; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);


--
-- Name: qrtz_calendars; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);


--
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);


--
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint NOT NULL,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent boolean,
    requests_recovery boolean
);


--
-- Name: qrtz_job_details; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable boolean NOT NULL,
    is_nonconcurrent boolean NOT NULL,
    is_update_data boolean NOT NULL,
    requests_recovery boolean NOT NULL,
    job_data bytea
);


--
-- Name: qrtz_locks; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);


--
-- Name: qrtz_paused_trigger_grps; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);


--
-- Name: qrtz_scheduler_state; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);


--
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);


--
-- Name: qrtz_simprop_triggers; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);


--
-- Name: qrtz_triggers; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);


--
-- Name: stored_procedure; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.stored_procedure (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    bot_id integer NOT NULL,
    text text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: stored_procedure_id_seq; Type: SEQUENCE; Schema: telegram_handler; Owner: -
--

CREATE SEQUENCE telegram_handler.stored_procedure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stored_procedure_id_seq; Type: SEQUENCE OWNED BY; Schema: telegram_handler; Owner: -
--

ALTER SEQUENCE telegram_handler.stored_procedure_id_seq OWNED BY telegram_handler.stored_procedure.id;


--
-- Name: task_log; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.task_log (
    id integer NOT NULL,
    task_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    action character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    payload jsonb DEFAULT '{}'::jsonb NOT NULL
);


--
-- Name: task_log_aggregation; Type: TABLE; Schema: telegram_handler; Owner: -
--

CREATE TABLE telegram_handler.task_log_aggregation (
    id integer NOT NULL,
    success_count integer DEFAULT 0 NOT NULL,
    error_count integer DEFAULT 0 NOT NULL,
    last_status character varying(255),
    last_start timestamp without time zone,
    last_finish timestamp without time zone,
    next_start timestamp without time zone,
    additional_values jsonb DEFAULT '{}'::jsonb NOT NULL,
    average_exe_time_ms integer
);


--
-- Name: task_log_id_seq; Type: SEQUENCE; Schema: telegram_handler; Owner: -
--

CREATE SEQUENCE telegram_handler.task_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: task_log_id_seq; Type: SEQUENCE OWNED BY; Schema: telegram_handler; Owner: -
--

ALTER SEQUENCE telegram_handler.task_log_id_seq OWNED BY telegram_handler.task_log.id;


--
-- Name: i18n_params; Type: TABLE; Schema: temp; Owner: -
--

CREATE TABLE temp.i18n_params (
    template_id integer,
    parameter character varying(128)
);


--
-- Name: template; Type: TABLE; Schema: temp; Owner: -
--

CREATE TABLE temp.template (
    id integer,
    name character varying(128),
    description character varying(512),
    template text,
    application_group_id smallint,
    html boolean
);


--
-- Name: i18n_params; Type: TABLE; Schema: template; Owner: -
--

CREATE TABLE template.i18n_params (
    template_id integer NOT NULL,
    parameter character varying(128) NOT NULL
);


--
-- Name: template; Type: TABLE; Schema: template; Owner: -
--

CREATE TABLE template.template (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(512),
    template text NOT NULL,
    application_group_id smallint NOT NULL,
    html boolean DEFAULT false
);


--
-- Name: template_id_seq; Type: SEQUENCE; Schema: template; Owner: -
--

CREATE SEQUENCE template.template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: template_id_seq; Type: SEQUENCE OWNED BY; Schema: template; Owner: -
--

ALTER SEQUENCE template.template_id_seq OWNED BY template.template.id;


--
-- Name: attribute_descriptor; Type: TABLE; Schema: userstorage; Owner: -
--

CREATE TABLE userstorage.attribute_descriptor (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    name_i18n_key character varying(64),
    validation_regexp character varying(64),
    validation_regexp_violation_i18n_key character varying(64),
    mandatory boolean DEFAULT true NOT NULL,
    uniques boolean DEFAULT false NOT NULL,
    shared boolean DEFAULT false NOT NULL,
    cardinality_min integer DEFAULT 1 NOT NULL,
    cardinality_max integer DEFAULT 1 NOT NULL,
    cardinality_violation_i18n_key character varying(64),
    parent_id integer,
    application_group_id smallint NOT NULL,
    is_group boolean DEFAULT false NOT NULL,
    read_only boolean DEFAULT false NOT NULL,
    type character varying(16) DEFAULT 'STRING'::character varying
);


--
-- Name: attribute_descriptor_id_seq; Type: SEQUENCE; Schema: userstorage; Owner: -
--

CREATE SEQUENCE userstorage.attribute_descriptor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attribute_descriptor_id_seq; Type: SEQUENCE OWNED BY; Schema: userstorage; Owner: -
--

ALTER SEQUENCE userstorage.attribute_descriptor_id_seq OWNED BY userstorage.attribute_descriptor.id;


--
-- Name: attribute_type; Type: TABLE; Schema: userstorage; Owner: -
--

CREATE TABLE userstorage.attribute_type (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    application_group_id smallint NOT NULL
);


--
-- Name: attribute_type_id_seq; Type: SEQUENCE; Schema: userstorage; Owner: -
--

CREATE SEQUENCE userstorage.attribute_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attribute_type_id_seq; Type: SEQUENCE OWNED BY; Schema: userstorage; Owner: -
--

ALTER SEQUENCE userstorage.attribute_type_id_seq OWNED BY userstorage.attribute_type.id;


--
-- Name: attribute_value; Type: TABLE; Schema: userstorage; Owner: -
--

CREATE TABLE userstorage.attribute_value (
    id bigint NOT NULL,
    data character varying(512) NOT NULL,
    application_group_id smallint NOT NULL,
    user_id uuid NOT NULL,
    parent_id bigint,
    descriptor_id integer NOT NULL
);


--
-- Name: attribute_value_id_seq; Type: SEQUENCE; Schema: userstorage; Owner: -
--

CREATE SEQUENCE userstorage.attribute_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attribute_value_id_seq; Type: SEQUENCE OWNED BY; Schema: userstorage; Owner: -
--

ALTER SEQUENCE userstorage.attribute_value_id_seq OWNED BY userstorage.attribute_value.id;


--
-- Name: databasechangelog; Type: TABLE; Schema: userstorage; Owner: -
--

CREATE TABLE userstorage.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: userstorage; Owner: -
--

CREATE TABLE userstorage.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: databasechangelog; Type: TABLE; Schema: webadmin; Owner: -
--

CREATE TABLE webadmin.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: webadmin; Owner: -
--

CREATE TABLE webadmin.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: task_meta_data; Type: TABLE; Schema: webadmin; Owner: -
--

CREATE TABLE webadmin.task_meta_data (
    id integer NOT NULL,
    timing_type character varying(30),
    period_type character varying(30),
    cron_expression character varying(30)
);


--
-- Name: user_account; Type: TABLE; Schema: webadmin; Owner: -
--

CREATE TABLE webadmin.user_account (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    enable boolean DEFAULT false NOT NULL,
    name character varying(100),
    email character varying(255),
    avatar bytea
);


--
-- Name: user_account_id_seq; Type: SEQUENCE; Schema: webadmin; Owner: -
--

CREATE SEQUENCE webadmin.user_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_account_id_seq; Type: SEQUENCE OWNED BY; Schema: webadmin; Owner: -
--

ALTER SEQUENCE webadmin.user_account_id_seq OWNED BY webadmin.user_account.id;


--
-- Name: user_role; Type: TABLE; Schema: webadmin; Owner: -
--

CREATE TABLE webadmin.user_role (
    user_id integer NOT NULL,
    role character varying(50) NOT NULL
);


--
-- Name: application_group id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.application_group ALTER COLUMN id SET DEFAULT nextval('aaa.application_group_id_seq'::regclass);


--
-- Name: confirmation id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.confirmation ALTER COLUMN id SET DEFAULT nextval('aaa.confirmation_id_seq'::regclass);


--
-- Name: data_property id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.data_property ALTER COLUMN id SET DEFAULT nextval('aaa.data_property_id_seq'::regclass);


--
-- Name: data_property_group id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.data_property_group ALTER COLUMN id SET DEFAULT nextval('aaa.data_property_group_id_seq'::regclass);


--
-- Name: data_property_section id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.data_property_section ALTER COLUMN id SET DEFAULT nextval('aaa.data_property_section_id_seq'::regclass);


--
-- Name: ldap_configuration id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.ldap_configuration ALTER COLUMN id SET DEFAULT nextval('aaa.ldap_configuration_id_seq'::regclass);


--
-- Name: mobile_app id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.mobile_app ALTER COLUMN id SET DEFAULT nextval('aaa.mobile_app_id_seq'::regclass);


--
-- Name: mobile_app_instance id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.mobile_app_instance ALTER COLUMN id SET DEFAULT nextval('aaa.mobile_app_instance_id_seq'::regclass);


--
-- Name: service_account id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_account ALTER COLUMN id SET DEFAULT nextval('aaa.service_account_id_seq'::regclass);


--
-- Name: service_permission id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_permission ALTER COLUMN id SET DEFAULT nextval('aaa.service_permission_id_seq'::regclass);


--
-- Name: service_permission_type id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_permission_type ALTER COLUMN id SET DEFAULT nextval('aaa.service_permission_type_id_seq'::regclass);


--
-- Name: service_role id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_role ALTER COLUMN id SET DEFAULT nextval('aaa.service_role_id_seq'::regclass);


--
-- Name: user_account id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account ALTER COLUMN id SET DEFAULT nextval('aaa.user_account_id_seq'::regclass);


--
-- Name: user_data_property id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_data_property ALTER COLUMN id SET DEFAULT nextval('aaa.user_data_property_id_seq'::regclass);


--
-- Name: user_password id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_password ALTER COLUMN id SET DEFAULT nextval('aaa.password_id_seq'::regclass);


--
-- Name: user_permission id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_permission ALTER COLUMN id SET DEFAULT nextval('aaa.user_permission_id_seq'::regclass);


--
-- Name: user_permission_type id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_permission_type ALTER COLUMN id SET DEFAULT nextval('aaa.user_permission_type_id_seq'::regclass);


--
-- Name: user_role id; Type: DEFAULT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_role ALTER COLUMN id SET DEFAULT nextval('aaa.user_role_id_seq'::regclass);


--
-- Name: abstract_backend_descriptor id; Type: DEFAULT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.abstract_backend_descriptor ALTER COLUMN id SET DEFAULT nextval('backend.abstract_backend_descriptor_id_seq'::regclass);


--
-- Name: abstract_endpoint_descriptor id; Type: DEFAULT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.abstract_endpoint_descriptor ALTER COLUMN id SET DEFAULT nextval('backend.abstract_endpoint_descriptor_id_seq'::regclass);


--
-- Name: adapter_backend_convertation id; Type: DEFAULT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.adapter_backend_convertation ALTER COLUMN id SET DEFAULT nextval('backend.adapter_backend_convertation_id_seq'::regclass);


--
-- Name: adapter_endpoint_default_param id; Type: DEFAULT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.adapter_endpoint_default_param ALTER COLUMN id SET DEFAULT nextval('backend.adapter_endpoint_default_param_id_seq'::regclass);


--
-- Name: chain_parameter_mapping id; Type: DEFAULT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.chain_parameter_mapping ALTER COLUMN id SET DEFAULT nextval('backend.chain_parameter_mapping_id_seq'::regclass);


--
-- Name: data_type id; Type: DEFAULT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type ALTER COLUMN id SET DEFAULT nextval('backend.data_type_id_seq'::regclass);


--
-- Name: data_type_mdm_settings id; Type: DEFAULT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type_mdm_settings ALTER COLUMN id SET DEFAULT nextval('backend.data_type_mdm_settings_id_seq'::regclass);


--
-- Name: data_type_object_property id; Type: DEFAULT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type_object_property ALTER COLUMN id SET DEFAULT nextval('backend.data_type_object_property_id_seq'::regclass);


--
-- Name: endpoint_param_descriptor id; Type: DEFAULT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.endpoint_param_descriptor ALTER COLUMN id SET DEFAULT nextval('backend.endpoint_param_descriptor_id_seq'::regclass);


--
-- Name: jdbc_driver id; Type: DEFAULT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_driver ALTER COLUMN id SET DEFAULT nextval('backend.jdbc_driver_id_seq'::regclass);


--
-- Name: jdbc_url_parameter id; Type: DEFAULT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_url_parameter ALTER COLUMN id SET DEFAULT nextval('backend.jdbc_url_parameter_id_seq'::regclass);


--
-- Name: jdbc_url_parameter_string_example_value id; Type: DEFAULT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_url_parameter_string_example_value ALTER COLUMN id SET DEFAULT nextval('backend.jdbc_url_parameter_string_example_value_id_seq'::regclass);


--
-- Name: slots id; Type: DEFAULT; Schema: booking; Owner: -
--

ALTER TABLE ONLY booking.slots ALTER COLUMN id SET DEFAULT nextval('booking.slots_id_seq'::regclass);


--
-- Name: account id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.account ALTER COLUMN id SET DEFAULT nextval('cityservices.account_id_seq'::regclass);


--
-- Name: account_action id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.account_action ALTER COLUMN id SET DEFAULT nextval('cityservices.account_action_id_seq'::regclass);


--
-- Name: answers id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.answers ALTER COLUMN id SET DEFAULT nextval('cityservices.answers_id_seq'::regclass);


--
-- Name: attachment id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.attachment ALTER COLUMN id SET DEFAULT nextval('cityservices.attachment_id_seq'::regclass);


--
-- Name: available_endpoint id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.available_endpoint ALTER COLUMN id SET DEFAULT nextval('cityservices.available_endpoint_id_seq'::regclass);


--
-- Name: bookmark_favorite_screen id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.bookmark_favorite_screen ALTER COLUMN id SET DEFAULT nextval('cityservices.bookmark_favorite_screen_id_seq'::regclass);


--
-- Name: bookmark_history_screen id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.bookmark_history_screen ALTER COLUMN id SET DEFAULT nextval('cityservices.bookmark_history_screen_id_seq'::regclass);


--
-- Name: chat_channel id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.chat_channel ALTER COLUMN id SET DEFAULT nextval('cityservices.chat_channel_id_seq'::regclass);


--
-- Name: chat_message id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.chat_message ALTER COLUMN id SET DEFAULT nextval('cityservices.chat_message_id_seq'::regclass);


--
-- Name: complain id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain ALTER COLUMN id SET DEFAULT nextval('cityservices.complain_id_seq'::regclass);


--
-- Name: complain_field id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_field ALTER COLUMN id SET DEFAULT nextval('cityservices.complain_field_id_seq'::regclass);


--
-- Name: complain_field_value id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_field_value ALTER COLUMN id SET DEFAULT nextval('cityservices.complain_field_value_id_seq'::regclass);


--
-- Name: complain_group id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_group ALTER COLUMN id SET DEFAULT nextval('cityservices.complain_group_id_seq'::regclass);


--
-- Name: complain_history id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_history ALTER COLUMN id SET DEFAULT nextval('cityservices.complain_history_id_seq'::regclass);


--
-- Name: complain_status id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_status ALTER COLUMN id SET DEFAULT nextval('cityservices.complain_status_id_seq'::regclass);


--
-- Name: complain_status_workflow id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_status_workflow ALTER COLUMN id SET DEFAULT nextval('cityservices.complain_status_workflow_id_seq'::regclass);


--
-- Name: complain_type id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_type ALTER COLUMN id SET DEFAULT nextval('cityservices.complain_type_id_seq'::regclass);


--
-- Name: complaint_performance_type id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complaint_performance_type ALTER COLUMN id SET DEFAULT nextval('cityservices.complaint_performance_type_id_seq'::regclass);


--
-- Name: complaint_performance_value id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complaint_performance_value ALTER COLUMN id SET DEFAULT nextval('cityservices.complaint_performance_value_id_seq'::regclass);


--
-- Name: complaint_statistic_by_type id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complaint_statistic_by_type ALTER COLUMN id SET DEFAULT nextval('cityservices.complaint_statistic_by_type_id_seq'::regclass);


--
-- Name: confirmation id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.confirmation ALTER COLUMN id SET DEFAULT nextval('cityservices.confirmation_id_seq'::regclass);


--
-- Name: electricity_meter id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.electricity_meter ALTER COLUMN id SET DEFAULT nextval('cityservices.electricity_meter_id_seq'::regclass);


--
-- Name: electricity_meter_value id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.electricity_meter_value ALTER COLUMN id SET DEFAULT nextval('cityservices.electricity_meter_value_id_seq'::regclass);


--
-- Name: evacuation id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.evacuation ALTER COLUMN id SET DEFAULT nextval('cityservices.evacuation_id_seq'::regclass);


--
-- Name: flow id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.flow ALTER COLUMN id SET DEFAULT nextval('cityservices.flow_id_seq'::regclass);


--
-- Name: house id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.house ALTER COLUMN id SET DEFAULT nextval('cityservices.house_id_seq'::regclass);


--
-- Name: med_clinic_link id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_clinic_link ALTER COLUMN id SET DEFAULT nextval('cityservices.med_clinic_link_id_seq'::regclass);


--
-- Name: med_doctor id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_doctor ALTER COLUMN id SET DEFAULT nextval('cityservices.med_doctor_id_seq'::regclass);


--
-- Name: med_doctor_speciality id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_doctor_speciality ALTER COLUMN id SET DEFAULT nextval('cityservices.med_doctor_speciality_id_seq'::regclass);


--
-- Name: med_hospital id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital ALTER COLUMN id SET DEFAULT nextval('cityservices.med_hospital_id_seq'::regclass);


--
-- Name: med_hospital_unit id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital_unit ALTER COLUMN id SET DEFAULT nextval('cityservices.med_hospital_unit_id_seq'::regclass);


--
-- Name: med_hospital_unit_favorite id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital_unit_favorite ALTER COLUMN id SET DEFAULT nextval('cityservices.med_hospital_unit_favorite_id_seq'::regclass);


--
-- Name: med_policy id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_policy ALTER COLUMN id SET DEFAULT nextval('cityservices.med_policy_id_seq'::regclass);


--
-- Name: med_speciality id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_speciality ALTER COLUMN id SET DEFAULT nextval('cityservices.med_speciality_id_seq'::regclass);


--
-- Name: med_treatment_day id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_treatment_day ALTER COLUMN id SET DEFAULT nextval('cityservices.med_treatment_day_id_seq'::regclass);


--
-- Name: med_treatment_slot id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_treatment_slot ALTER COLUMN id SET DEFAULT nextval('cityservices.med_treatment_slot_id_seq'::regclass);


--
-- Name: message id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.message ALTER COLUMN id SET DEFAULT nextval('cityservices.message_id_seq'::regclass);


--
-- Name: message_tag id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.message_tag ALTER COLUMN id SET DEFAULT nextval('cityservices.message_tag_id_seq'::regclass);


--
-- Name: mime_type id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.mime_type ALTER COLUMN id SET DEFAULT nextval('cityservices.mime_type_id_seq'::regclass);


--
-- Name: news_category id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_category ALTER COLUMN id SET DEFAULT nextval('cityservices.news_category_id_seq'::regclass);


--
-- Name: news_element id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_element ALTER COLUMN id SET DEFAULT nextval('cityservices.news_element_id_seq'::regclass);


--
-- Name: news_tag id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_tag ALTER COLUMN id SET DEFAULT nextval('cityservices.news_tag_id_seq'::regclass);


--
-- Name: news_user_info id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_user_info ALTER COLUMN id SET DEFAULT nextval('cityservices.news_user_info_id_seq'::regclass);


--
-- Name: offence id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.offence ALTER COLUMN id SET DEFAULT nextval('cityservices.offence_id_seq'::regclass);


--
-- Name: polls id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.polls ALTER COLUMN id SET DEFAULT nextval('cityservices.polls_id_seq'::regclass);


--
-- Name: profile_attribute id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.profile_attribute ALTER COLUMN id SET DEFAULT nextval('cityservices.profile_attribute_id_seq'::regclass);


--
-- Name: profile_important_attribute id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.profile_important_attribute ALTER COLUMN id SET DEFAULT nextval('cityservices.profile_important_attribute_id_seq'::regclass);


--
-- Name: published id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.published ALTER COLUMN id SET DEFAULT nextval('cityservices.published_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.questions ALTER COLUMN id SET DEFAULT nextval('cityservices.questions_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.role ALTER COLUMN id SET DEFAULT nextval('cityservices.role_id_seq'::regclass);


--
-- Name: service id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service ALTER COLUMN id SET DEFAULT nextval('cityservices.service_id_seq'::regclass);


--
-- Name: service_category id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_category ALTER COLUMN id SET DEFAULT nextval('cityservices.service_category_id_seq'::regclass);


--
-- Name: service_favorite id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_favorite ALTER COLUMN id SET DEFAULT nextval('cityservices.service_favorite_id_seq'::regclass);


--
-- Name: service_favorite_param id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_favorite_param ALTER COLUMN id SET DEFAULT nextval('cityservices.service_favorite_param_id_seq'::regclass);


--
-- Name: service_history id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_history ALTER COLUMN id SET DEFAULT nextval('cityservices.service_history_id_seq'::regclass);


--
-- Name: service_history_param id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_history_param ALTER COLUMN id SET DEFAULT nextval('cityservices.service_history_param_id_seq'::regclass);


--
-- Name: service_param id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_param ALTER COLUMN id SET DEFAULT nextval('cityservices.service_param_id_seq'::regclass);


--
-- Name: service_subscription id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_subscription ALTER COLUMN id SET DEFAULT nextval('cityservices.service_subscription_id_seq'::regclass);


--
-- Name: service_subscription_param id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_subscription_param ALTER COLUMN id SET DEFAULT nextval('cityservices.service_subscription_param_id_seq'::regclass);


--
-- Name: slot_group id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.slot_group ALTER COLUMN id SET DEFAULT nextval('cityservices.slot_group_id_seq'::regclass);


--
-- Name: slot_history id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.slot_history ALTER COLUMN id SET DEFAULT nextval('cityservices.slot_history_id_seq'::regclass);


--
-- Name: slot_history_attachment id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.slot_history_attachment ALTER COLUMN id SET DEFAULT nextval('cityservices.slot_history_attachment_id_seq'::regclass);


--
-- Name: statistic_type id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.statistic_type ALTER COLUMN id SET DEFAULT nextval('cityservices.statistic_type_id_seq'::regclass);


--
-- Name: statistic_value id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.statistic_value ALTER COLUMN id SET DEFAULT nextval('cityservices.statistic_value_id_seq'::regclass);


--
-- Name: supervisor id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.supervisor ALTER COLUMN id SET DEFAULT nextval('cityservices.supervisor_id_seq'::regclass);


--
-- Name: text_service id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.text_service ALTER COLUMN id SET DEFAULT nextval('cityservices.text_service_id_seq'::regclass);


--
-- Name: text_service_category id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.text_service_category ALTER COLUMN id SET DEFAULT nextval('cityservices.text_service_category_id_seq'::regclass);


--
-- Name: text_service_group id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.text_service_group ALTER COLUMN id SET DEFAULT nextval('cityservices.text_service_group_id_seq'::regclass);


--
-- Name: transaction id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.transaction ALTER COLUMN id SET DEFAULT nextval('cityservices.transaction_id_seq'::regclass);


--
-- Name: user_answers id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_answers ALTER COLUMN id SET DEFAULT nextval('cityservices.user_answers_id_seq'::regclass);


--
-- Name: user_geoposition id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_geoposition ALTER COLUMN id SET DEFAULT nextval('cityservices.user_geoposition_id_seq'::regclass);


--
-- Name: user_houses id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_houses ALTER COLUMN id SET DEFAULT nextval('cityservices.user_houses_id_seq'::regclass);


--
-- Name: user_info id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_info ALTER COLUMN id SET DEFAULT nextval('cityservices.user_info_id_seq'::regclass);


--
-- Name: user_profile_info id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_profile_info ALTER COLUMN id SET DEFAULT nextval('cityservices.user_profile_info_id_seq'::regclass);


--
-- Name: user_request_abstract id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_abstract ALTER COLUMN id SET DEFAULT nextval('cityservices.user_request_abstract_id_seq'::regclass);


--
-- Name: user_request_history id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_history ALTER COLUMN id SET DEFAULT nextval('cityservices.user_request_history_id_seq'::regclass);


--
-- Name: user_subscription id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_subscription ALTER COLUMN id SET DEFAULT nextval('cityservices.user_subscription_id_seq'::regclass);


--
-- Name: vaccination_plan id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.vaccination_plan ALTER COLUMN id SET DEFAULT nextval('cityservices.vaccination_plan_id_seq'::regclass);


--
-- Name: vaccination_plan_type id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.vaccination_plan_type ALTER COLUMN id SET DEFAULT nextval('cityservices.vaccination_plan_type_id_seq'::regclass);


--
-- Name: vaccination_status id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.vaccination_status ALTER COLUMN id SET DEFAULT nextval('cityservices.vaccination_status_id_seq'::regclass);


--
-- Name: water_meter id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.water_meter ALTER COLUMN id SET DEFAULT nextval('cityservices.water_meter_id_seq'::regclass);


--
-- Name: water_meter_value id; Type: DEFAULT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.water_meter_value ALTER COLUMN id SET DEFAULT nextval('cityservices.water_meter_value_id_seq'::regclass);


--
-- Name: chat id; Type: DEFAULT; Schema: cityservices_chats; Owner: -
--

ALTER TABLE ONLY cityservices_chats.chat ALTER COLUMN id SET DEFAULT nextval('cityservices_chats.chat_id_seq'::regclass);


--
-- Name: chat_message id; Type: DEFAULT; Schema: cityservices_chats; Owner: -
--

ALTER TABLE ONLY cityservices_chats.chat_message ALTER COLUMN id SET DEFAULT nextval('cityservices_chats.chat_message_id_seq'::regclass);


--
-- Name: communication id; Type: DEFAULT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.communication ALTER COLUMN id SET DEFAULT nextval('cityservices_communication.communication_id_seq'::regclass);


--
-- Name: communication_journal id; Type: DEFAULT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.communication_journal ALTER COLUMN id SET DEFAULT nextval('cityservices_communication.communication_journal_id_seq'::regclass);


--
-- Name: communication_statistic_type id; Type: DEFAULT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.communication_statistic_type ALTER COLUMN id SET DEFAULT nextval('cityservices_communication.communication_statistic_type_id_seq'::regclass);


--
-- Name: communication_statistic_value id; Type: DEFAULT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.communication_statistic_value ALTER COLUMN id SET DEFAULT nextval('cityservices_communication.communication_statistic_value_id_seq'::regclass);


--
-- Name: distribution id; Type: DEFAULT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution ALTER COLUMN id SET DEFAULT nextval('cityservices_communication.distribution_id_seq'::regclass);


--
-- Name: distribution_channel id; Type: DEFAULT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_channel ALTER COLUMN id SET DEFAULT nextval('cityservices_communication.distribution_channel_id_seq'::regclass);


--
-- Name: distribution_group id; Type: DEFAULT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_group ALTER COLUMN id SET DEFAULT nextval('cityservices_communication.distribution_group_id_seq'::regclass);


--
-- Name: distribution_journal id; Type: DEFAULT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_journal ALTER COLUMN id SET DEFAULT nextval('cityservices_communication.distribution_journal_id_seq'::regclass);


--
-- Name: distribution_log id; Type: DEFAULT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_log ALTER COLUMN id SET DEFAULT nextval('cityservices_communication.distribution_log_id_seq'::regclass);


--
-- Name: distribution_template id; Type: DEFAULT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_template ALTER COLUMN id SET DEFAULT nextval('cityservices_communication.distribution_template_id_seq1'::regclass);


--
-- Name: distribution_template_group id; Type: DEFAULT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_template_group ALTER COLUMN id SET DEFAULT nextval('cityservices_communication.distribution_template_id_seq'::regclass);


--
-- Name: engagement_index id; Type: DEFAULT; Schema: cityservices_metric; Owner: -
--

ALTER TABLE ONLY cityservices_metric.engagement_index ALTER COLUMN id SET DEFAULT nextval('cityservices_metric.engagement_index_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: cityservices_metric; Owner: -
--

ALTER TABLE ONLY cityservices_metric.event ALTER COLUMN id SET DEFAULT nextval('cityservices_metric.event_id_seq'::regclass);


--
-- Name: profile_info_index id; Type: DEFAULT; Schema: cityservices_metric; Owner: -
--

ALTER TABLE ONLY cityservices_metric.profile_info_index ALTER COLUMN id SET DEFAULT nextval('cityservices_metric.profile_info_index_id_seq'::regclass);


--
-- Name: email_account id; Type: DEFAULT; Schema: email; Owner: -
--

ALTER TABLE ONLY email.email_account ALTER COLUMN id SET DEFAULT nextval('email.email_account_id_seq'::regclass);


--
-- Name: smtp_server id; Type: DEFAULT; Schema: email; Owner: -
--

ALTER TABLE ONLY email.smtp_server ALTER COLUMN id SET DEFAULT nextval('email.smtp_server_id_seq'::regclass);


--
-- Name: bucket_info id; Type: DEFAULT; Schema: large_obj_storage; Owner: -
--

ALTER TABLE ONLY large_obj_storage.bucket_info ALTER COLUMN id SET DEFAULT nextval('large_obj_storage.bucket_info_id_seq'::regclass);


--
-- Name: file_info id; Type: DEFAULT; Schema: large_obj_storage; Owner: -
--

ALTER TABLE ONLY large_obj_storage.file_info ALTER COLUMN id SET DEFAULT nextval('large_obj_storage.file_info_id_seq'::regclass);


--
-- Name: config id; Type: DEFAULT; Schema: mobile_store; Owner: -
--

ALTER TABLE ONLY mobile_store.config ALTER COLUMN id SET DEFAULT nextval('mobile_store.config_id_seq'::regclass);


--
-- Name: message_bundle id; Type: DEFAULT; Schema: mobile_store; Owner: -
--

ALTER TABLE ONLY mobile_store.message_bundle ALTER COLUMN id SET DEFAULT nextval('mobile_store.message_bundle_id_seq'::regclass);


--
-- Name: view id; Type: DEFAULT; Schema: mobile_store; Owner: -
--

ALTER TABLE ONLY mobile_store.view ALTER COLUMN id SET DEFAULT nextval('mobile_store.view_id_seq'::regclass);


--
-- Name: log id; Type: DEFAULT; Schema: notification; Owner: -
--

ALTER TABLE ONLY notification.log ALTER COLUMN id SET DEFAULT nextval('notification.log_id_seq'::regclass);


--
-- Name: answer id; Type: DEFAULT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.answer ALTER COLUMN id SET DEFAULT nextval('poll.answer_id_seq'::regclass);


--
-- Name: poll id; Type: DEFAULT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.poll ALTER COLUMN id SET DEFAULT nextval('poll.poll_id_seq'::regclass);


--
-- Name: publishing id; Type: DEFAULT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.publishing ALTER COLUMN id SET DEFAULT nextval('poll.publishing_id_seq'::regclass);


--
-- Name: question id; Type: DEFAULT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.question ALTER COLUMN id SET DEFAULT nextval('poll.question_id_seq'::regclass);


--
-- Name: user_answer id; Type: DEFAULT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_answer ALTER COLUMN id SET DEFAULT nextval('poll.user_answer_id_seq'::regclass);


--
-- Name: user_point_history id; Type: DEFAULT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_point_history ALTER COLUMN id SET DEFAULT nextval('poll.user_point_history_id_seq'::regclass);


--
-- Name: user_question id; Type: DEFAULT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_question ALTER COLUMN id SET DEFAULT nextval('poll.user_question_id_seq'::regclass);


--
-- Name: user_status id; Type: DEFAULT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_status ALTER COLUMN id SET DEFAULT nextval('poll.user_status_id_seq'::regclass);


--
-- Name: user_status_log id; Type: DEFAULT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_status_log ALTER COLUMN id SET DEFAULT nextval('poll.user_status_log_id_seq'::regclass);


--
-- Name: sample_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sample_data ALTER COLUMN id SET DEFAULT nextval('public.sample_data_id_seq'::regclass);


--
-- Name: certificate id; Type: DEFAULT; Schema: push; Owner: -
--

ALTER TABLE ONLY push.certificate ALTER COLUMN id SET DEFAULT nextval('push.certificate_id_seq'::regclass);


--
-- Name: resource id; Type: DEFAULT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.resource ALTER COLUMN id SET DEFAULT nextval('resource_structure.resource_id_seq'::regclass);


--
-- Name: resource_instance id; Type: DEFAULT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.resource_instance ALTER COLUMN id SET DEFAULT nextval('resource_structure.resource_instance_id_seq'::regclass);


--
-- Name: schedule id; Type: DEFAULT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.schedule ALTER COLUMN id SET DEFAULT nextval('resource_structure.schedule_id_seq'::regclass);


--
-- Name: schedule_gap id; Type: DEFAULT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.schedule_gap ALTER COLUMN id SET DEFAULT nextval('resource_structure.schedule_gap_id_seq'::regclass);


--
-- Name: scheduler_log id; Type: DEFAULT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.scheduler_log ALTER COLUMN id SET DEFAULT nextval('resource_structure.scheduler_log_id_seq'::regclass);


--
-- Name: abstract_task id; Type: DEFAULT; Schema: scheduling; Owner: -
--

ALTER TABLE ONLY scheduling.abstract_task ALTER COLUMN id SET DEFAULT nextval('scheduling.abstract_task_id_seq'::regclass);


--
-- Name: task_execution id; Type: DEFAULT; Schema: scheduling; Owner: -
--

ALTER TABLE ONLY scheduling.task_execution ALTER COLUMN id SET DEFAULT nextval('scheduling.task_execution_id_seq'::regclass);


--
-- Name: script_backend id; Type: DEFAULT; Schema: script_backend; Owner: -
--

ALTER TABLE ONLY script_backend.script_backend ALTER COLUMN id SET DEFAULT nextval('script_backend.script_backend_id_seq'::regclass);


--
-- Name: script_endpoint id; Type: DEFAULT; Schema: script_backend; Owner: -
--

ALTER TABLE ONLY script_backend.script_endpoint ALTER COLUMN id SET DEFAULT nextval('script_backend.script_endpoint_id_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.client ALTER COLUMN id SET DEFAULT nextval('sms.client_id_seq'::regclass);


--
-- Name: provider id; Type: DEFAULT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.provider ALTER COLUMN id SET DEFAULT nextval('sms.provider_id_seq'::regclass);


--
-- Name: routing id; Type: DEFAULT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.routing ALTER COLUMN id SET DEFAULT nextval('sms.routing_id_seq'::regclass);


--
-- Name: sms_message id; Type: DEFAULT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.sms_message ALTER COLUMN id SET DEFAULT nextval('sms.sms_message_id_seq'::regclass);


--
-- Name: sms_transaction id; Type: DEFAULT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.sms_transaction ALTER COLUMN id SET DEFAULT nextval('sms.sms_transaction_id_seq'::regclass);


--
-- Name: telegram_bot id; Type: DEFAULT; Schema: telegram_bot; Owner: -
--

ALTER TABLE ONLY telegram_bot.telegram_bot ALTER COLUMN id SET DEFAULT nextval('telegram_bot.telegram_bot_id_seq'::regclass);


--
-- Name: bot_listener id; Type: DEFAULT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.bot_listener ALTER COLUMN id SET DEFAULT nextval('telegram_handler.bot_listener_id_seq'::regclass);


--
-- Name: command id; Type: DEFAULT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.command ALTER COLUMN id SET DEFAULT nextval('telegram_handler.command_id_seq'::regclass);


--
-- Name: command_error id; Type: DEFAULT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.command_error ALTER COLUMN id SET DEFAULT nextval('telegram_handler.command_error_id_seq'::regclass);


--
-- Name: command_group id; Type: DEFAULT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.command_group ALTER COLUMN id SET DEFAULT nextval('telegram_handler.command_group_id_seq'::regclass);


--
-- Name: default_keyboard id; Type: DEFAULT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.default_keyboard ALTER COLUMN id SET DEFAULT nextval('telegram_handler.default_keyboard_id_seq'::regclass);


--
-- Name: periodic_task id; Type: DEFAULT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.periodic_task ALTER COLUMN id SET DEFAULT nextval('telegram_handler.periodic_task_id_seq'::regclass);


--
-- Name: stored_procedure id; Type: DEFAULT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.stored_procedure ALTER COLUMN id SET DEFAULT nextval('telegram_handler.stored_procedure_id_seq'::regclass);


--
-- Name: task_log id; Type: DEFAULT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.task_log ALTER COLUMN id SET DEFAULT nextval('telegram_handler.task_log_id_seq'::regclass);


--
-- Name: template id; Type: DEFAULT; Schema: template; Owner: -
--

ALTER TABLE ONLY template.template ALTER COLUMN id SET DEFAULT nextval('template.template_id_seq'::regclass);


--
-- Name: attribute_descriptor id; Type: DEFAULT; Schema: userstorage; Owner: -
--

ALTER TABLE ONLY userstorage.attribute_descriptor ALTER COLUMN id SET DEFAULT nextval('userstorage.attribute_descriptor_id_seq'::regclass);


--
-- Name: attribute_type id; Type: DEFAULT; Schema: userstorage; Owner: -
--

ALTER TABLE ONLY userstorage.attribute_type ALTER COLUMN id SET DEFAULT nextval('userstorage.attribute_type_id_seq'::regclass);


--
-- Name: attribute_value id; Type: DEFAULT; Schema: userstorage; Owner: -
--

ALTER TABLE ONLY userstorage.attribute_value ALTER COLUMN id SET DEFAULT nextval('userstorage.attribute_value_id_seq'::regclass);


--
-- Name: user_account id; Type: DEFAULT; Schema: webadmin; Owner: -
--

ALTER TABLE ONLY webadmin.user_account ALTER COLUMN id SET DEFAULT nextval('webadmin.user_account_id_seq'::regclass);


--
-- Data for Name: application_group; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.application_group (id, name, user_session_expiration_interval_seconds, confirm_subject_user_registration_template, confirm_body_user_registration_template, confirm_handling_method, confirm_expiration_interval_seconds, confirm_from_name, login_method, authentication_url, confirm_body_password_reset_template, sms_sender_name, confirm_subject_password_reset_template, login_request_pattern, login_response_json_path, login_error_message_json_path, service_session_expiration_interval_seconds, oauth_vkontakte_client_id, oauth_vkontakte_client_secret, oauth_facebook_client_id, oauth_facebook_client_secret, oauth_google_client_id, oauth_google_client_secret, oauth_microsoft_client_id, oauth_microsoft_client_secret, oauth_twitter_consumer_key, oauth_twitter_consumer_secret, oauth_vkontakte_redirect_url, oauth_facebook_redirect_url, oauth_google_redirect_url, oauth_microsoft_redirect_url, oauth_twitter_redirect_url, use_ldap, ldap_synchronization_allow_users_deletion, ldap_synchronization_allow_roles_deletion, user_password_complexity_regexp, service_password_complexity_regexp, confirm_body_user_login_template, confirm_subject_user_login_template) FROM stdin;
\.


--
-- Name: application_group_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.application_group_id_seq', 5, true);


--
-- Data for Name: confirmation; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.confirmation (id, action, delivery_method, user_account_id, expiration_date, code, confirmed, handling_method, data) FROM stdin;
\.


--
-- Name: confirmation_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.confirmation_id_seq', 775, true);


--
-- Data for Name: data_property; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.data_property (id, name, name_i18n_key, validation_regexp, validation_regexp_violation_i18n_key, mandatory, uniques, cardinality_min, cardinality_max, cardinality_violation_i18n_key, data_property_group_id, shared, preview, searchable) FROM stdin;
\.


--
-- Data for Name: data_property_group; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.data_property_group (id, name, name_i18n_key, data_property_section_id) FROM stdin;
\.


--
-- Name: data_property_group_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.data_property_group_id_seq', 3, true);


--
-- Name: data_property_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.data_property_id_seq', 3, true);


--
-- Data for Name: data_property_section; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.data_property_section (id, name, name_i18n_key, application_group_id) FROM stdin;
\.


--
-- Name: data_property_section_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.data_property_section_id_seq', 1, true);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
changing_package	sorlov	classpath:liquibase/migration/0-changing_package.sql	2017-06-23 13:54:18.536148	1	EXECUTED	7:fc5bbf9d73f87eebd38eabf3d4c677ba	sql		\N	3.5.3	common	\N	8226058497
3	dminbaev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.437885	3	EXECUTED	7:5cfb90553650c8ec45849a849ab9b142	sql		\N	3.5.3	common	\N	8226058497
4	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.598472	4	EXECUTED	7:72f5c72ad555179d294eaf3bf3fa63fe	sql		\N	3.5.3	common	\N	8226058497
5	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.644409	5	EXECUTED	7:73f69adf520465e97f8619b41ce7e2b6	sql		\N	3.5.3	common	\N	8226058497
7	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.651657	6	EXECUTED	7:44771e5c09025b67223849aa0e082b30	sql		\N	3.5.3	common	\N	8226058497
8	dminbaev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.672755	7	EXECUTED	7:af2acef6a372b8c1fd3b820c7261cab7	sql		\N	3.5.3	common	\N	8226058497
9	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.790647	8	EXECUTED	7:0889e2e3c8c0d071fcc44502148acd9f	sql		\N	3.5.3	common	\N	8226058497
11	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.830274	9	EXECUTED	7:d904c7fd95890d46923619310a4ce538	sql		\N	3.5.3	common	\N	8226058497
13	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.852694	10	EXECUTED	7:fc5883954dd81bfac84be17e10f90fcc	sql		\N	3.5.3	common	\N	8226058497
14	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.862685	11	EXECUTED	7:4476357680997cd32b89bb7afd25e6a3	sql		\N	3.5.3	common	\N	8226058497
15	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.871527	12	EXECUTED	7:f71277c601b3e922029ce8dc53d3ac00	sql		\N	3.5.3	common	\N	8226058497
17_change_to_storage_template	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.880793	13	EXECUTED	7:af15df6601cbfecd58ec443cf1a32a93	sql		\N	3.5.3	common	\N	8226058497
18	dminbaev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.929896	14	EXECUTED	7:2694ac34147e6d57314ecc6b3c990354	sql		\N	3.5.3	common	\N	8226058497
add-service-permission	iboychuk	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.976356	15	EXECUTED	7:87f07c82847b0851dec253cf48b56c33	sql		\N	3.5.3	common	\N	8226058497
20_addtelegram_identity_table	dminbaev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.990008	16	EXECUTED	7:24476362ecdc44b945c0816e1e116a8c	sql		\N	3.5.3	common	\N	8226058497
21_rename_service_to_application_group	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.999048	17	EXECUTED	7:309734b765f9c34048eeb94ba89c5f6c	sql		\N	3.5.3	common	\N	8226058497
add-data-profile-properties	iboychuk	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.048722	18	EXECUTED	7:df45c6cfacc164460be5a8ed0a47fe6d	sql		\N	3.5.3	common	\N	8226058497
22_rename_aa_group_columns	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.055682	19	EXECUTED	7:9cc4f7a2714b693ff136a09f115d6da7	sql		\N	3.5.3	common	\N	8226058497
23_mobile_app_cert_columns	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.061685	20	EXECUTED	7:0c0af634f0e146fe2aa8a19cc537b891	sql		\N	3.5.3	common	\N	8226058497
24_add_user_groups	dminbaev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.086678	21	EXECUTED	7:ab5eda4a4e3193614d04fb1934d0c940	sql		\N	3.5.3	common	\N	8226058497
26_drop_unnecessary_not_nulls	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.093654	22	EXECUTED	7:0651a38ce10b09a723d0b40f2d763232	sql		\N	3.5.3	common	\N	8226058497
27_change_roles_structure	dminbaev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.217285	23	EXECUTED	7:0fae591e6d9e19b97a4a45d3527db611	sql		\N	3.5.3	common	\N	8226058497
27_drop_unnecessary_social_tokens	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.250092	24	EXECUTED	7:ba10dfaf8ba6ca6764f04da72e6e8b96	sql		\N	3.5.3	common	\N	8226058497
28_remove_soesg_and_device	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.265499	25	EXECUTED	7:87788c264e9fb088ea7e81412cd06915	sql		\N	3.5.3	common	\N	8226058497
29_service	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.305564	26	EXECUTED	7:5796284c7b2a2b26bb0a42bd258d39bc	sql		\N	3.5.3	common	\N	8226058497
30_locking_user	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.358616	27	EXECUTED	7:2f459365062ffeef8693469745c92b81	sql		\N	3.5.3	common	\N	8226058497
30_add_messenger_permission_type	iboychuk	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.364958	28	EXECUTED	7:cd968afb008a196015e2f703a344415e	sql		\N	3.5.3	common	\N	8226058497
31_uuid_to_byte	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.889916	29	EXECUTED	7:7b39d16070bc9dd1ae6fad3a78a0dfa7	sql		\N	3.5.3	common	\N	8226058497
change_name_for_default_template	sorlov	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.898134	30	EXECUTED	7:52dfeb217ee2b317d96dee31647ae526	sql		\N	3.5.3	common	\N	8226058497
add_social	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.90899	31	EXECUTED	7:9c8266483c553029421ce4496266b1b4	sql		\N	3.5.3	common	\N	8226058497
add_social_redirect	dminbaev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.914747	32	EXECUTED	7:139e7f3544be23fbdd60b8e05b55a3f7	sql		\N	3.5.3	common	\N	8226058497
profile-settings-flags	iboychuk	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.935131	33	EXECUTED	7:a892bd6bb39037a4f3927fda9168e4e2	sql		\N	3.5.3	common	\N	8226058497
ldap	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.964395	34	EXECUTED	7:37f0f5647015f0c70c199d7115678ae6	sql		\N	3.5.3	common	\N	8226058497
restore_user_role_constraint	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:20.971613	35	EXECUTED	7:4c99cfcdd8cd1098cce2d89fecadf685	sql		\N	3.5.3	common	\N	8226058497
ldap_fetch_users_and_groups	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:21.020164	36	EXECUTED	7:7da5ed61a80b32f873db1fa123c952f8	sql		\N	3.5.3	common	\N	8226058497
ldap_delete_task	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:21.09488	37	EXECUTED	7:53e5e011efa4c6389f0d470eb0820445	sql		\N	3.5.3	common	\N	8226058497
change_msisdn:common	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:21.101331	38	EXECUTED	7:36a39ee54fa91e7fc43fda15ff4bdc3b	sql		\N	3.5.3	\N	\N	8226058497
add_forgotten_identity_tw	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:21.117576	39	EXECUTED	7:fdf407d5359fb9b0e78e0a8d148b48a9	sql		\N	3.5.3	common	\N	8226058497
move_user_identity_to_user_account	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:21.215391	40	EXECUTED	7:89673cf5c55837db19f6a2e9ac8b6322	sql		\N	3.5.3	common	\N	8226058497
change_confirm_template	iboychuk	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:21.222296	41	EXECUTED	7:a0e7b2aca9da5cdc59f4bdfc16ec2b0f	sql		\N	3.5.3	common	\N	8226058497
delete-cascade-profile	iboychuk	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:21.232017	42	EXECUTED	7:1dfe4373e082888b4e19c63531dc7824	sql		\N	3.5.3	common	\N	8226058497
utc_entities	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:21.238254	43	EXECUTED	7:c56b40c3ea9402c276cea31f9596c7df	sql		\N	3.5.3	common	\N	8226058497
default_service	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-07-03 05:25:42.419564	44	EXECUTED	7:c5a653e56546156cbfac952ea2bb5b79	sql		\N	3.5.3	common	\N	9059542385
add_common_user_columns	nkonev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-07-17 16:10:02.753484	45	EXECUTED	7:b294a61b078887f930131d244cdca50d	sql		\N	3.5.3	common	\N	0307802038
add_confirm_template_for_login	sorlov	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-08-22 07:57:07.655053	46	EXECUTED	7:5c3c67acea87f1d4f70c7df7fdec3aa4	sql		\N	3.5.3	common	\N	3388627543
persistent_session	sorlov	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-08-22 07:57:08.277195	47	EXECUTED	7:539da6951f7b00ae516967ff359c52ed	sql		\N	3.5.3	common	\N	3388627543
0	dminbaev	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-06-23 13:54:19.410896	2	EXECUTED	7:637656b6bdeecca7cdd5c7d53f1e4352	sql		\N	3.5.3	common	\N	8226058497
application_group_confirm_login_null	sorlov	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2017-11-07 07:29:18.029955	48	EXECUTED	7:0a1ac7439155840cbe9be1fe09c8df06	sql		\N	3.5.3	common	\N	0039757995
application_group_domain	iboychuk	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2018-01-16 09:41:58.866954	49	EXECUTED	7:6b540b51f98190a6d1f9ecbb388e2e76	sql		\N	3.5.3	common	\N	6095718766
application_domain	sorlov	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2018-01-16 09:41:58.924308	50	EXECUTED	7:aed7a53ba5f207753f9524f6b2831f79	sql		\N	3.5.3	common	\N	6095718766
increase_external_id	sorlov	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2018-01-16 09:41:58.968672	51	EXECUTED	7:901f7d7f595ca165ea965b1bb5b3eecf	sql		\N	3.5.3	common	\N	6095718766
add_device_info	sorlov	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2018-02-12 13:06:13.635062	52	EXECUTED	7:948eebd96bf50e78ede94140d3eab981	sql		\N	3.5.3	common	\N	8440773622
unique_index_on_user_account_uuid	sorlov	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2018-02-12 13:06:13.654329	53	EXECUTED	7:09e16c550eb33da3291492917b02f34f	sql		\N	3.5.3	common	\N	8440773622
index_on_user_session__user_uuid	sorlov	classpath:liquibase/migration/2016-12-01-bootstrap.sql	2018-02-12 13:06:13.672583	54	EXECUTED	7:fc8fa4517987a08a0195828b2c38472f	sql		\N	3.5.3	common	\N	8440773622
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: ldap_configuration; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.ldap_configuration (id, application_group_id, domain, connect_url, connect_base, connect_user_dn, connect_referral, connect_user_password, search_attribute_member_of, search_attribute_uid, search_concrete_user_filter_pattern, search_users_filter, synchronization_synchronize_groups, search_member_of_filter_pattern, search_groups_filter, synchronization_periodically_synchronize) FROM stdin;
\.


--
-- Name: ldap_configuration_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.ldap_configuration_id_seq', 1, false);


--
-- Data for Name: mobile_app; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.mobile_app (id, name, application_group_id, cert_iphone_ext_id, cert_android_ext_id, cert_winphone_ext_id, admin_gui_logo) FROM stdin;
\.


--
-- Data for Name: mobile_app_domain; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.mobile_app_domain (domain_name, application_id) FROM stdin;
\.


--
-- Name: mobile_app_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.mobile_app_id_seq', 26, true);


--
-- Data for Name: mobile_app_instance; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.mobile_app_instance (id, cloud_id, user_account_id, mobile_app_id, external_id, platform, update_date, locale, device_info) FROM stdin;
\.


--
-- Name: mobile_app_instance_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.mobile_app_instance_id_seq', 495, true);


--
-- Name: password_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.password_id_seq', 27, true);


--
-- Data for Name: service_account; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.service_account (id, login, password, application_group_id, uuid, locked) FROM stdin;
\.


--
-- Name: service_account_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.service_account_id_seq', 4, true);


--
-- Data for Name: service_account_roles; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.service_account_roles (role_id, account_id) FROM stdin;
\.


--
-- Data for Name: service_permission; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.service_permission (id, resource_id, permission_type_id, application_group_id) FROM stdin;
\.


--
-- Name: service_permission_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.service_permission_id_seq', 291, true);


--
-- Data for Name: service_permission_type; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.service_permission_type (id, name, description) FROM stdin;
\.


--
-- Name: service_permission_type_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.service_permission_type_id_seq', 5, true);


--
-- Data for Name: service_role; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.service_role (id, name, system, application_group_id) FROM stdin;
\.


--
-- Name: service_role_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.service_role_id_seq', 6, true);


--
-- Data for Name: service_role_permissions; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.service_role_permissions (role_id, permission_id) FROM stdin;
\.


--
-- Data for Name: service_session; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.service_session (id, user_uuid, creation_time, last_access_time) FROM stdin;
\.


--
-- Data for Name: user_account; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.user_account (id, uuid, login, application_group_id, create_date, confirmed, password_id, locale, locked, creation_type, update_date, email, msisdn, oauth2_vkontakte_user_id, oauth2_facebook_user_id, oauth2_google_user_id, oauth2_microsoft_user_id, oauth1_twitter_user_id, oauth2_telegram_user_id, name, birth_date, photo_url, gender) FROM stdin;
\.


--
-- Name: user_account_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.user_account_id_seq', 213, true);


--
-- Data for Name: user_accounts_roles; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.user_accounts_roles (role_id, account_id) FROM stdin;
\.


--
-- Data for Name: user_data_property; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.user_data_property (id, user_account_id, data_property_id, data_property_value) FROM stdin;
\.


--
-- Name: user_data_property_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.user_data_property_id_seq', 1662, true);


--
-- Data for Name: user_password; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.user_password (id, digest, last_update) FROM stdin;
\.


--
-- Data for Name: user_permission; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.user_permission (id, resource_id, permission_type_id, application_group_id) FROM stdin;
\.


--
-- Name: user_permission_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.user_permission_id_seq', 66, true);


--
-- Data for Name: user_permission_type; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.user_permission_type (id, name, description) FROM stdin;
\.


--
-- Name: user_permission_type_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.user_permission_type_id_seq', 8, true);


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.user_role (id, name, system, application_group_id, creation_type, update_date) FROM stdin;
\.


--
-- Name: user_role_id_seq; Type: SEQUENCE SET; Schema: aaa; Owner: -
--

SELECT pg_catalog.setval('aaa.user_role_id_seq', 207, true);


--
-- Data for Name: user_roles_permissions; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.user_roles_permissions (permission_id, role_id) FROM stdin;
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: aaa; Owner: -
--

COPY aaa.user_session (id, user_uuid, creation_time, last_access_time) FROM stdin;
\.


--
-- Data for Name: abstract_backend_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.abstract_backend_descriptor (id, name, description, type, application_group_id) FROM stdin;
\.


--
-- Name: abstract_backend_descriptor_id_seq; Type: SEQUENCE SET; Schema: backend; Owner: -
--

SELECT pg_catalog.setval('backend.abstract_backend_descriptor_id_seq', 2, true);


--
-- Data for Name: abstract_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.abstract_endpoint_descriptor (id, name, description, result_type_id, type, backend_descriptor_id) FROM stdin;
\.


--
-- Name: abstract_endpoint_descriptor_id_seq; Type: SEQUENCE SET; Schema: backend; Owner: -
--

SELECT pg_catalog.setval('backend.abstract_endpoint_descriptor_id_seq', 302, true);


--
-- Data for Name: adapter_backend_convertation; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.adapter_backend_convertation (id, param, target, operation, pattern) FROM stdin;
\.


--
-- Name: adapter_backend_convertation_id_seq; Type: SEQUENCE SET; Schema: backend; Owner: -
--

SELECT pg_catalog.setval('backend.adapter_backend_convertation_id_seq', 1, false);


--
-- Data for Name: adapter_endpoint_default_param; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.adapter_endpoint_default_param (id, name, data, adapter_endpoint_id) FROM stdin;
\.


--
-- Name: adapter_endpoint_default_param_id_seq; Type: SEQUENCE SET; Schema: backend; Owner: -
--

SELECT pg_catalog.setval('backend.adapter_endpoint_default_param_id_seq', 1, false);


--
-- Data for Name: adapter_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.adapter_endpoint_descriptor (id, target_endpoint_id) FROM stdin;
\.


--
-- Data for Name: adapter_param_convertation; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.adapter_param_convertation (adapter_endpoint_id, convertation_id) FROM stdin;
\.


--
-- Data for Name: adapter_result_convertation; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.adapter_result_convertation (adapter_endpoint_id, convertation_id) FROM stdin;
\.


--
-- Data for Name: aggregate_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.aggregate_endpoint_descriptor (id, fail_on_error) FROM stdin;
\.


--
-- Data for Name: awip_backend_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.awip_backend_descriptor (id, url, client_pool_size, request_timeout) FROM stdin;
\.


--
-- Data for Name: awip_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.awip_endpoint_descriptor (id) FROM stdin;
\.


--
-- Data for Name: cache_settings; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.cache_settings (end_point_descriptor_id, name, enabled, properties) FROM stdin;
\.


--
-- Data for Name: chain_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.chain_endpoint_descriptor (id, source_endpoint_id, target_endpoint_id) FROM stdin;
\.


--
-- Data for Name: chain_parameter_mapping; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.chain_parameter_mapping (id, mapping_type, endpoint_param_name, chain_param_name) FROM stdin;
\.


--
-- Name: chain_parameter_mapping_id_seq; Type: SEQUENCE SET; Schema: backend; Owner: -
--

SELECT pg_catalog.setval('backend.chain_parameter_mapping_id_seq', 1, false);


--
-- Data for Name: chain_source_mapping; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.chain_source_mapping (chain_endpoint_id, parameter_mapping_id) FROM stdin;
\.


--
-- Data for Name: chain_target_mapping; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.chain_target_mapping (chain_endpoint_id, parameter_mapping_id) FROM stdin;
\.


--
-- Data for Name: composite_backend_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.composite_backend_descriptor (id) FROM stdin;
\.


--
-- Data for Name: data_type; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.data_type (type, id, primitive_data_type, element_type_id, mdm_type_settings_id) FROM stdin;
\.


--
-- Name: data_type_id_seq; Type: SEQUENCE SET; Schema: backend; Owner: -
--

SELECT pg_catalog.setval('backend.data_type_id_seq', 11736, true);


--
-- Data for Name: data_type_mdm_settings; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.data_type_mdm_settings (id, collection, key_type_id, value_type_id, application_group_id) FROM stdin;
\.


--
-- Name: data_type_mdm_settings_id_seq; Type: SEQUENCE SET; Schema: backend; Owner: -
--

SELECT pg_catalog.setval('backend.data_type_mdm_settings_id_seq', 1, false);


--
-- Data for Name: data_type_object_property; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.data_type_object_property (id, name, data_type_id, object_data_id) FROM stdin;
\.


--
-- Name: data_type_object_property_id_seq; Type: SEQUENCE SET; Schema: backend; Owner: -
--

SELECT pg_catalog.setval('backend.data_type_object_property_id_seq', 7855, true);


--
-- Data for Name: emp_backend_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.emp_backend_descriptor (id, token) FROM stdin;
\.


--
-- Data for Name: emp_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.emp_endpoint_descriptor (id, dataset) FROM stdin;
\.


--
-- Data for Name: endpoint_isolation; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.endpoint_isolation (endpoint_descriptor_id, isolation) FROM stdin;
\.


--
-- Data for Name: endpoint_param_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.endpoint_param_descriptor (id, name, description, endpoint_descriptor_id, datatype_id) FROM stdin;
\.


--
-- Name: endpoint_param_descriptor_id_seq; Type: SEQUENCE SET; Schema: backend; Owner: -
--

SELECT pg_catalog.setval('backend.endpoint_param_descriptor_id_seq', 2477, true);


--
-- Data for Name: external_backend_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.external_backend_descriptor (id, backend_type) FROM stdin;
\.


--
-- Data for Name: external_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.external_endpoint_descriptor (id) FROM stdin;
\.


--
-- Data for Name: jdbc_backend_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.jdbc_backend_descriptor (id, connection, pool_parameters, active, driver_id) FROM stdin;
\.


--
-- Data for Name: jdbc_driver; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.jdbc_driver (id, display_name, driver_class, help_url) FROM stdin;
1	PostgreSQL JDBC Driver 9.4.1208	org.postgresql.Driver	https://jdbc.postgresql.org/documentation/head/connect.html
2	MySQL Connector/J 5.1.38	com.mysql.jdbc.Driver	https://dev.mysql.com/doc/connector-j/5.1/en/connector-j-reference-configuration-properties.html
3	Microsoft JDBC Driver for SQL Server sqljdbc4 4.2	com.microsoft.sqlserver.jdbc.SQLServerDriver	https://msdn.microsoft.com/en-us/library/ms378988(v=sql.110).aspx
4	OracleDriver ojdbc7 12.1.0.2	oracle.jdbc.driver.OracleDriver	https://docs.oracle.com/cd/E11882_01/appdev.112/e13995/oracle/jdbc/OracleDriver.html
\.


--
-- Name: jdbc_driver_id_seq; Type: SEQUENCE SET; Schema: backend; Owner: -
--

SELECT pg_catalog.setval('backend.jdbc_driver_id_seq', 4, true);


--
-- Data for Name: jdbc_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.jdbc_endpoint_descriptor (id, query, query_type, query_table) FROM stdin;
\.


--
-- Data for Name: jdbc_url_parameter; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.jdbc_url_parameter (id, name, description, frontend_input_data_type, default_boolean_value, double_from, double_to, default_double_value, integer_from, integer_to, default_integer_value, default_string_value, display_order, jdbc_driver_id) FROM stdin;
1	host	The host name of the server. Defaults to localhost. To specify an IPv6 address your must enclose the host parameter with square brackets, for example: jdbc:postgresql://[::1]:5740/accounting	string	\N	\N	\N	\N	\N	\N	\N	localhost	2	1
2	port	The port number the server is listening on. Defaults to the PostgreSQL™ standard port number (5432).	integer	\N	\N	\N	\N	\N	\N	5432	\N	2	1
3	database	The database name. The default is to connect to a database with the same name as the user name.	string	\N	\N	\N	\N	\N	\N	\N	\N	2	1
4	user	The database user on whose behalf the connection is being made.	string	\N	\N	\N	\N	\N	\N	\N	\N	2	1
5	password	The database user's password.	string	\N	\N	\N	\N	\N	\N	\N	\N	2	1
6	charSet	The character set to use for data sent to the database or received from the database. This property is only relevant for server versions less than or equal to 7.2. The 7.3 release was the first with multibyte support compiled by default and the driver uses its character set translation facilities instead of trying to do it itself.	string	\N	\N	\N	\N	\N	\N	\N	\N	1	1
7	user	The user to connect as	string	\N	\N	\N	\N	\N	\N	\N	\N	2	2
8	password	The password to use when connecting	string	\N	\N	\N	\N	\N	\N	\N	\N	2	2
9	useUnicode	Should the driver use Unicode character encodings when handling strings? Should only be used when the driver can't determine the character set mapping, or you are trying to 'force' the driver to use a character set that MySQL either doesn't natively support (such as UTF-8), true/false, defaults to 'true'	boolean	t	\N	\N	\N	\N	\N	\N	\N	1	2
11	databaseName	The name of the database to connect to. If not stated, a connection is made to the default database.	string	\N	\N	\N	\N	\N	\N	\N	\N	2	3
12	database	The name of the database to connect to. If not stated, a connection is made to the default database.	string	\N	\N	\N	\N	\N	\N	\N	\N	2	3
13	password	The database password. [<=128 char]	string	\N	\N	\N	\N	\N	\N	\N	\N	2	3
14	portNumber	The port where SQL Server is listening. If the port number is specified in the connection string, no request to sqlbrowser is made. When the port and instanceName are both specified, the connection is made to the specified port. However, the instanceName is validated and an error is thrown if it does not match the port. Important: We recommend that the port number always be specified, as this is more secure than using sqlbrowser.	integer	\N	\N	\N	\N	0	65535	1433	\N	2	3
15	port	The port where SQL Server is listening. If the port number is specified in the connection string, no request to sqlbrowser is made. When the port and instanceName are both specified, the connection is made to the specified port. However, the instanceName is validated and an error is thrown if it does not match the port. Important: We recommend that the port number always be specified, as this is more secure than using sqlbrowser.	integer	\N	\N	\N	\N	0	65535	1433	\N	2	3
16	userName	The database user. [<=128 char]	string	\N	\N	\N	\N	\N	\N	\N	\N	2	3
17	user	The database user. [<=128 char]	string	\N	\N	\N	\N	\N	\N	\N	\N	2	3
18	user	the user name for logging into the database	string	\N	\N	\N	\N	\N	\N	\N	\N	2	4
19	password	the password for logging into the database	string	\N	\N	\N	\N	\N	\N	\N	\N	2	4
20	database	the connect string for the database	string	\N	\N	\N	\N	\N	\N	\N	\N	2	4
21	server	the connect string for the database	string	\N	\N	\N	\N	\N	\N	\N	\N	1	4
22	SID		string	\N	\N	\N	\N	\N	\N	\N	XE	1	4
23	autoReconnect	Should the driver try to re-establish stale and/or dead connections? If enabled the driver will throw an exception for a queries issued on a stale or dead connection, which belong to the current transaction, but will attempt reconnect before the next query issued on the connection in a new transaction. The use of this feature is not recommended, because it has side effects related to session state and data consistency when applications don not handle SQLExceptions properly, and is only designed to be used when you are unable to configure your application to handle SQLExceptions resulting from dead and stale connections properly. Alternatively, as a last option, investigate setting the MySQL server variable "wait_timeout" to a high value, rather than the default of 8 hours	boolean	t	\N	\N	\N	\N	\N	\N	\N	3	2
24	autoReconnectForPools	Use a reconnection strategy appropriate for connection pools (defaults to "false")	boolean	f	\N	\N	\N	\N	\N	\N	\N	4	2
10	characterEncoding	If 'useUnicode' is set to true, what character encoding should the driver use when dealing with strings? (defaults is to 'autodetect')	string	\N	\N	\N	\N	\N	\N	\N	\N	1	2
\.


--
-- Name: jdbc_url_parameter_id_seq; Type: SEQUENCE SET; Schema: backend; Owner: -
--

SELECT pg_catalog.setval('backend.jdbc_url_parameter_id_seq', 24, true);


--
-- Data for Name: jdbc_url_parameter_string_example_value; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.jdbc_url_parameter_string_example_value (id, string_value, jdbc_url_parameter_id) FROM stdin;
\.


--
-- Name: jdbc_url_parameter_string_example_value_id_seq; Type: SEQUENCE SET; Schema: backend; Owner: -
--

SELECT pg_catalog.setval('backend.jdbc_url_parameter_string_example_value_id_seq', 1, false);


--
-- Data for Name: join_aggregate_endpoint; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.join_aggregate_endpoint (aggregate_endpoint_id, child_endpoint_id) FROM stdin;
\.


--
-- Data for Name: mdm_backend_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.mdm_backend_descriptor (id, collection) FROM stdin;
\.


--
-- Data for Name: mdm_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.mdm_endpoint_descriptor (id, is_key_filtering, filtering_property_path, filtering_operator, filtering_parameter_name, is_key_sorting, order_property_path, order_direction, order_nulls_position) FROM stdin;
\.


--
-- Data for Name: mongo_backend_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.mongo_backend_descriptor (id, url, active) FROM stdin;
\.


--
-- Data for Name: mongo_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.mongo_endpoint_descriptor (id, command, result_type, result_template) FROM stdin;
\.


--
-- Data for Name: mq_backend_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.mq_backend_descriptor (id, url, active, parameters, admin_port) FROM stdin;
\.


--
-- Data for Name: mq_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.mq_endpoint_descriptor (id, direction, queue, routing_key, exchange) FROM stdin;
\.


--
-- Data for Name: rest_backend_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.rest_backend_descriptor (id, url, key_store, login, password, client_pool_size, settings) FROM stdin;
\.


--
-- Data for Name: rest_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.rest_endpoint_descriptor (id, type, method, path, headers, settings, request_template, response_root_path, response_template) FROM stdin;
\.


--
-- Data for Name: split_endpoint_descriptor; Type: TABLE DATA; Schema: backend; Owner: -
--

COPY backend.split_endpoint_descriptor (id, source_endpoint_id, target_endpoint_id) FROM stdin;
\.


--
-- Data for Name: slots; Type: TABLE DATA; Schema: booking; Owner: -
--

COPY booking.slots (id, from_time, to_time, owner_id, assignee_id, assignee_type, assign_date, resource_id, resource_instance_id, properties, properties_hash, close_status, close_comment) FROM stdin;
\.


--
-- Name: slots_id_seq; Type: SEQUENCE SET; Schema: booking; Owner: -
--

SELECT pg_catalog.setval('booking.slots_id_seq', 1, false);


--
-- Data for Name: account; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.account (id, login, password, email, phone, first_name, last_name, avatar, blocked, created, updated, user_id, hidden) FROM stdin;
1	admin	$2a$11$bQ2kLrv7/wqLYZkRRI6uO.jP0EfEhTs1flIJQdKXsu4lr2xs1aFKi	admin@alx.ru	900	Admin	Admin	\N	f	2018-02-22 12:25:40.764614	2018-02-22 12:25:40.764614	37230269-b326-39c3-ba19-b43b233bf9fc	f
\.


--
-- Data for Name: account_action; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.account_action (id, account_id, ip, action, action_date, detail) FROM stdin;
\.


--
-- Name: account_action_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.account_action_id_seq', 1, false);


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.account_id_seq', 1, true);


--
-- Data for Name: account_roles; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.account_roles (account_id, role_id) FROM stdin;
1	1
1	2
\.


--
-- Data for Name: answers; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.answers (id, questions_id, answer_description, created_at, updated_at, answer_prio, answer_icon, answer_image) FROM stdin;
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.answers_id_seq', 1, false);


--
-- Data for Name: attachment; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.attachment (id, message_id, type, data, link, name, size, mime_type) FROM stdin;
\.


--
-- Name: attachment_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.attachment_id_seq', 1, false);


--
-- Data for Name: available_endpoint; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.available_endpoint (id, path) FROM stdin;
\.


--
-- Name: available_endpoint_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.available_endpoint_id_seq', 1, false);


--
-- Data for Name: bookmark_favorite_screen; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.bookmark_favorite_screen (id, screen_name, screen, user_id, params, type) FROM stdin;
\.


--
-- Name: bookmark_favorite_screen_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.bookmark_favorite_screen_id_seq', 1, false);


--
-- Data for Name: bookmark_history_screen; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.bookmark_history_screen (id, screen_name, screen, user_id, params, type, execution_time) FROM stdin;
\.


--
-- Name: bookmark_history_screen_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.bookmark_history_screen_id_seq', 1, false);


--
-- Data for Name: chat_channel; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.chat_channel (id, name, description) FROM stdin;
\.


--
-- Name: chat_channel_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.chat_channel_id_seq', 1, false);


--
-- Data for Name: chat_message; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.chat_message (id, user_id, chat_id, message, message_type, created_at, sent, received, outcome) FROM stdin;
\.


--
-- Name: chat_message_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.chat_message_id_seq', 1, false);


--
-- Data for Name: complain; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain (id, complain_group_id, complain_status_id, title, message, created_at, updated_at, user_id, operator_id, lat, lng, deleted, in_work_operator_id) FROM stdin;
\.


--
-- Data for Name: complain_field; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain_field (id, name, field_format, possible_values, regexp, min_length, max_length, is_required, is_filter, "position", searchable, default_value, editable, visible, multiple, description, complain_group_id, required_error_text, regexp_error_text, label, mask, placeholder, is_for_operator) FROM stdin;
\.


--
-- Name: complain_field_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.complain_field_id_seq', 1, false);


--
-- Data for Name: complain_field_value; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain_field_value (id, complain_id, complain_field_id, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: complain_field_value_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.complain_field_value_id_seq', 1, false);


--
-- Data for Name: complain_group; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain_group (id, name, complain_type_id, created_at, updated_at, description, img_url, icon_url, start_status_id) FROM stdin;
\.


--
-- Data for Name: complain_group_has_role; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain_group_has_role (complaint_group_id, role_id) FROM stdin;
\.


--
-- Name: complain_group_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.complain_group_id_seq', 1, false);


--
-- Data for Name: complain_history; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain_history (id, created_at, message, title, status_from_id, status_from_text, status_to_id, status_to_text, lat, lng, complain_id, user_id, operator_id) FROM stdin;
\.


--
-- Name: complain_history_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.complain_history_id_seq', 1, false);


--
-- Name: complain_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.complain_id_seq', 1, false);


--
-- Data for Name: complain_status; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain_status (id, name, is_start, is_end, handle_by_operator, "position", description, flow_id) FROM stdin;
\.


--
-- Data for Name: complain_status_has_role; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain_status_has_role (complaint_status_id, role_id) FROM stdin;
\.


--
-- Name: complain_status_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.complain_status_id_seq', 1, false);


--
-- Data for Name: complain_status_workflow; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain_status_workflow (id, old_complain_status_id, new_complain_status_id, complain_group_id, notify_user, auto_change_status, notify_service, comment, comment_required, description, user_message) FROM stdin;
\.


--
-- Name: complain_status_workflow_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.complain_status_workflow_id_seq', 1, false);


--
-- Data for Name: complain_type; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain_type (id, name, created_at, updated_at, description, img_url, icon_url, flow_id) FROM stdin;
\.


--
-- Name: complain_type_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.complain_type_id_seq', 1, false);


--
-- Data for Name: complain_type_news_category; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain_type_news_category (complain_type_id, news_category_id, rating, weight) FROM stdin;
\.


--
-- Data for Name: complain_workflow_has_field; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain_workflow_has_field (complaint_workflow_id, field_id) FROM stdin;
\.


--
-- Data for Name: complain_workflow_has_role; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complain_workflow_has_role (complain_status_workflow_id, role_id) FROM stdin;
\.


--
-- Data for Name: complaint_performance_type; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complaint_performance_type (id, name, value) FROM stdin;
1	Closed in 24h	86400
2	Closed in 48h	172800
3	Closed in 3 days	259200
4	Closed in 1 week	604800
5	More than 1 week	604801
\.


--
-- Name: complaint_performance_type_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.complaint_performance_type_id_seq', 1, false);


--
-- Data for Name: complaint_performance_value; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complaint_performance_value (id, value, type_id, date) FROM stdin;
\.


--
-- Name: complaint_performance_value_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.complaint_performance_value_id_seq', 1, false);


--
-- Data for Name: complaint_statistic_by_type; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.complaint_statistic_by_type (date, complaint_type_id, value, id) FROM stdin;
\.


--
-- Name: complaint_statistic_by_type_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.complaint_statistic_by_type_id_seq', 1, false);


--
-- Data for Name: confirmation; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.confirmation (id, delivery_method, user_id, expiration_date, code, confirmed, data) FROM stdin;
\.


--
-- Name: confirmation_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.confirmation_id_seq', 1, false);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
user	sorlov	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.334306	1	EXECUTED	7:1b4ef93cef3a6cd564dc7cb2fa342052	sql		\N	3.5.3	common	\N	9302340226
addcolumncreated	sorlov	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.370111	2	EXECUTED	7:ca12cc8858f5c0e0961dcbbbcc688f72	sql		\N	3.5.3	common	\N	9302340226
updateattachment	sorlov	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.383983	3	EXECUTED	7:7a4b0bbdbd02450235ddf6d9f92577de	sql		\N	3.5.3	common	\N	9302340226
piccolumn	sorlov	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.394458	4	EXECUTED	7:69793cf8f06f3d4f6716149a5e1e9f6c	sql		\N	3.5.3	common	\N	9302340226
news	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.429967	5	EXECUTED	7:6b72f8b6bdacec1d0d7df97bf0abd1c4	sql		\N	3.5.3	common	\N	9302340226
news_newfield	sorlov	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.455401	6	EXECUTED	7:47ce9db063093521980b2424a0e48b20	sql		\N	3.5.3	common	\N	9302340226
news_content	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.464711	7	EXECUTED	7:4f5ed1d5fa6d0001e5140b84657f07e0	sql		\N	3.5.3	common	\N	9302340226
services_categories_classifier	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.570379	8	EXECUTED	7:9b0f774605394eefd727ec48e3949971	sql		\N	3.5.3	common	\N	9302340226
med_services_init	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.685591	9	EXECUTED	7:526282cd63de901bd2074062fb5253ed	sql		\N	3.5.3	common	\N	9302340226
med_fake_data	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.758475	10	EXECUTED	7:068da028db6228d5c0ba6c292a1f6690	sql		\N	3.5.3	common	\N	9302340226
operators	iboychuk	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.822833	11	EXECUTED	7:0e720206f0ffd5847c810924f6828244	sql		\N	3.5.3	common	\N	9302340226
alter_news	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.874806	12	EXECUTED	7:2dea81608c2c2707e33ec1996c216387	sql		\N	3.5.3	common	\N	9302340226
ecu-message-sender	iboychuk	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.907981	13	EXECUTED	7:28963ed5a8443b951450d7ec57c284c4	sql		\N	3.5.3	common	\N	9302340226
add_favorites_tables	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.947304	14	EXECUTED	7:4db79b37628c31911b59da000ebf8da5	sql		\N	3.5.3	common	\N	9302340226
create_offences	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.976095	15	EXECUTED	7:50ce169b7f08a33c67ec52dbc8510f73	sql		\N	3.5.3	common	\N	9302340226
offences_valid_constraint	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:40.98709	16	EXECUTED	7:de5fea79321361dc2aeb67d249feb1b9	sql		\N	3.5.3	common	\N	9302340226
offences_user_uuid	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.014637	17	EXECUTED	7:9ab7a26fd97a60230f189ac7ebf3051f	sql		\N	3.5.3	common	\N	9302340226
offences_more	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.025451	18	EXECUTED	7:d901fca5a2be76e14f690e04726207a1	sql		\N	3.5.3	common	\N	9302340226
offences_correct	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.040606	19	EXECUTED	7:12bf54c4f99117fe9f53c5a2d9144fcc	sql		\N	3.5.3	common	\N	9302340226
evacuation	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.068336	20	EXECUTED	7:de9d86193a0cf8b2c56ade13c7c865c9	sql		\N	3.5.3	common	\N	9302340226
sos	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.094974	21	EXECUTED	7:981316a4c806835df3fb98aec70cdcbc	sql		\N	3.5.3	common	\N	9302340226
feedback	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.13906	22	EXECUTED	7:098a4d056f2a83be4c03cf8d50376dd5	sql		\N	3.5.3	common	\N	9302340226
communal	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.202322	23	EXECUTED	7:b7057a242da5774a445d25fa54e69eb5	sql		\N	3.5.3	common	\N	9302340226
favorite_hospital_units	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.222806	24	EXECUTED	7:649fddfc636059740896da73bc40408e	sql		\N	3.5.3	common	\N	9302340226
add_medical_policies	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.236205	25	EXECUTED	7:6dd93f81a299cf82daa851dc4fdcc387	sql		\N	3.5.3	common	\N	9302340226
grn_in_sql	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.245801	26	EXECUTED	7:c159eba6d386a4c70eab34c1c14c683c	sql		\N	3.5.3	common	\N	9302340226
evac_alter	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.255162	27	EXECUTED	7:cb6288176efb14664743433a9af101c8	sql		\N	3.5.3	common	\N	9302340226
evac_content	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.264979	28	EXECUTED	7:4edcead003709831977e892f3a9b6a20	sql		\N	3.5.3	common	\N	9302340226
evac_new_requirements	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.314707	29	EXECUTED	7:b5fab0d0c4b4c836375cfffa4412a312	sql		\N	3.5.3	common	\N	9302340226
profile_changes	iboychuk	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.339657	30	EXECUTED	7:dbd81baf3d07e6ed4acbb8c78d43d4c0	sql		\N	3.5.3	common	\N	9302340226
add_role_to_user	iboychuk	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.357092	31	EXECUTED	7:84a9f6eee02597024b09f6946ce72b72	sql		\N	3.5.3	common	\N	9302340226
alter_feedback_history_add_status	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.371287	32	EXECUTED	7:440b9ca7de3c0c82ee27b9cdb24ec88e	sql		\N	3.5.3	common	\N	9302340226
add_bookmark_favorite_screen	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.399619	33	EXECUTED	7:84c645d8be01e1758833191d26c1eed5	sql		\N	3.5.3	common	\N	9302340226
add_account_user_id	iboychuk	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.416566	34	EXECUTED	7:08efc8b051c2a4a883dd891d9f0047af	sql		\N	3.5.3	common	\N	9302340226
add_account_user_id_value	sorlov	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.424728	35	EXECUTED	7:e5a99f7b69cd57a321ae6cea138f1f6f	sql		\N	3.5.3	common	\N	9302340226
add_favorite_screen_type	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.433143	36	EXECUTED	7:cdfd1fea8f60e3309c5cb1be3cbefa4c	sql		\N	3.5.3	common	\N	9302340226
migrate_image_to_cityservices_service	nkonev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.444578	37	EXECUTED	7:a596956e95796b899140866efe606081	sql		\N	3.5.3	common	\N	9302340226
change_default_rights	k	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.45264	38	EXECUTED	7:e991cd19044ff2c358260bb1fd3fe6c7	sql		\N	3.5.3	common	\N	9302340226
change_user_requests_tables	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.528736	39	EXECUTED	7:ff9d64afa8b2e67669e1e742535e5d8a	sql		\N	3.5.3	common	\N	9302340226
add_bookmark_history_screen	dminbaev	classpath:liquibase/migration/2017-06-27-bootstrap.sql	2018-02-22 12:25:41.561808	40	EXECUTED	7:cda30fbf221bf24262dd476e835cc8d1	sql		\N	3.5.3	common	\N	9302340226
answers	savchuk	classpath:liquibase/migration/2017-07-24.sql	2018-02-22 12:25:41.648915	41	EXECUTED	7:362ba91adc7b5f97a925b7f9269a523b	sql		\N	3.5.3	common	\N	9302340226
add_updated_at_news_default_value	savchuk	classpath:liquibase/migration/2017-07-24.sql	2018-02-22 12:25:41.658165	42	EXECUTED	7:51fc7298d3da3223e32b129ab8a854d5	sql		\N	3.5.3	common	\N	9302340226
add_cascade_to_foreign_key_question_answer	savchuk	classpath:liquibase/migration/2017-07-24.sql	2018-02-22 12:25:41.671383	43	EXECUTED	7:f3c7b0fe05a080b329ff47a5321674e7	sql		\N	3.5.3	common	\N	9302340226
translations	komissarov	classpath:liquibase/migration/2017-07-27.sql	2018-02-22 12:25:41.694025	44	EXECUTED	7:b8815a479430413f510a40fb26486b55	sql		\N	3.5.3	common	\N	9302340226
change_requests_field	komissarov	classpath:liquibase/migration/2017-07-27.sql	2018-02-22 12:25:41.704751	45	EXECUTED	7:47265b88f88a91ccad2245ab686e7222	sql		\N	3.5.3	common	\N	9302340226
add_new_user_rights	savchuk	classpath:liquibase/migration/2017-07-27.sql	2018-02-22 12:25:41.712546	46	EXECUTED	7:9f6e90a47e1b5de8a18a55230355c802	sql		\N	3.5.3	common	\N	9302340226
add_updated_at_field_request	komissarov	classpath:liquibase/migration/2017-07-27.sql	2018-02-22 12:25:41.719558	47	EXECUTED	7:55cddfff0a99d34b81e973e472f1c702	sql		\N	3.5.3	common	\N	9302340226
workflow_and_complains	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:41.916943	48	EXECUTED	7:11abe63e175be1abf3f369038aa793af	sql		\N	3.5.3	common	\N	9302340226
change_complain_field_relation	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:41.932206	49	EXECUTED	7:0326a4ecb079772fd09a36a8b93f862f	sql		\N	3.5.3	common	\N	9302340226
add_new_field_to_complain	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:41.986502	50	EXECUTED	7:23a8e9e11af123dc3d462f1b830d208a	sql		\N	3.5.3	common	\N	9302340226
add_new_user_rights	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:41.99523	51	EXECUTED	7:a00812c354b43d89c864a5842c1ac7bb	sql		\N	3.5.3	common	\N	9302340226
remove_not_null_from_complain_operator	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:42.00453	52	EXECUTED	7:05e6a482b9d39c4f40d80325aa6e6cc2	sql		\N	3.5.3	common	\N	9302340226
add_error_message_to_field_table	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:42.01531	53	EXECUTED	7:d876044b1ce81796a23e1c34a0ae0c0f	sql		\N	3.5.3	common	\N	9302340226
change_title_character_count	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:42.026915	54	EXECUTED	7:589c3956ecddada193eb05c88a125de7	sql		\N	3.5.3	common	\N	9302340226
add_icon_to_complain_group_and_type	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:42.037985	55	EXECUTED	7:26a42808c68a8c8989bcfb2c219bfab9	sql		\N	3.5.3	common	\N	9302340226
add_label_to_complain_field	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:42.046984	56	EXECUTED	7:743d3209b7e59a0669ca8fa719ab4572	sql		\N	3.5.3	common	\N	9302340226
add_mask_and_placeholder_to_complain_field	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:42.056247	57	EXECUTED	7:0813aa110caba4c80feb72ee8e78db1f	sql		\N	3.5.3	common	\N	9302340226
add_start_status_for_complaint_group	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:42.064077	58	EXECUTED	7:5fa9b167aad650ed1ca883b026b12c20	sql		\N	3.5.3	common	\N	9302340226
set_start_status_for_complaint_group_no_null	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:42.071463	59	EXECUTED	7:ddc1f01263230938d7485556629eb203	sql		\N	3.5.3	common	\N	9302340226
fix_user_rights_name	savchuk	classpath:liquibase/migration/2017-07-31.sql	2018-02-22 12:25:42.078774	60	EXECUTED	7:ca93cbfe872d51c91a85eb0674cba12e	sql		\N	3.5.3	common	\N	9302340226
add_workflow_role	savchuk	classpath:liquibase/migration/2017-08-17.sql	2018-02-22 12:25:42.156905	61	EXECUTED	7:31fbf229abed196871672f22274e5a7b	sql		\N	3.5.3	common	\N	9302340226
group_role_many_to_many	komissarov	classpath:liquibase/migration/2017-08-17.sql	2018-02-22 12:25:42.182794	62	EXECUTED	7:4edb2a82c2719e99328200f70e1543c5	sql		\N	3.5.3	common	\N	9302340226
news_add_geo_and_categories	savchuk	classpath:liquibase/migration/2017-08-17.sql	2018-02-22 12:25:42.230191	63	EXECUTED	7:989f106a509b48cf26f46f873871030d	sql		\N	3.5.3	common	\N	9302340226
complain_operator	komissarov	classpath:liquibase/migration/2017-08-17.sql	2018-02-22 12:25:42.243295	64	EXECUTED	7:b8150c147057bd5db4b02794b7d49f88	sql		\N	3.5.3	common	\N	9302340226
add_workflow_fields_many_to_many	komissarov	classpath:liquibase/migration/2017-08-17.sql	2018-02-22 12:25:42.269716	65	EXECUTED	7:294dccfff5807636c11f1f6484fbaef2	sql		\N	3.5.3	common	\N	9302340226
add_new_user_rights	komissarov	classpath:liquibase/migration/2017-08-17.sql	2018-02-22 12:25:42.281084	66	EXECUTED	7:17255873963289919e5a00d2bf6cf1ba	sql		\N	3.5.3	common	\N	9302340226
add_new_user_rights	savchuk	classpath:liquibase/migration/2017-08-17.sql	2018-02-22 12:25:42.290784	67	EXECUTED	7:5e3da231a2a6f8f4156751f5d005de9e	sql		\N	3.5.3	common	\N	9302340226
add_new_user_rights_and_role	savchuk	classpath:liquibase/migration/2017-08-17.sql	2018-02-22 12:25:42.314812	68	EXECUTED	7:a982d6c31dc710f7be55c9e6d1e5ff4f	sql		\N	3.5.3	common	\N	9302340226
update_manager_rights	savchuk	classpath:liquibase/migration/2017-08-17.sql	2018-02-22 12:25:42.324691	69	EXECUTED	7:db20680ad175d8809b1dddf9772324bd	sql		\N	3.5.3	common	\N	9302340226
add_new_fields_for_complaint_workflow	komissarov	classpath:liquibase/migration/2017-08-17.sql	2018-02-22 12:25:42.342833	70	EXECUTED	7:af9f15fa005edccaad0465d56dfd8900	sql		\N	3.5.3	common	\N	9302340226
cityservices_communication_schema	savchuk	classpath:liquibase/migration/distribution/2017-08-21.sql	2018-02-22 12:26:49.739181	71	EXECUTED	7:83e2d99cc43e5a242fab7bbb4874859e	sql		\N	3.5.3	common	\N	9302409533
add_foreign_keys_to_cityservices	savchuk	classpath:liquibase/migration/distribution/2017-08-21.sql	2018-02-22 12:26:49.755455	72	EXECUTED	7:5e15749f4ef3ce830384ed75282eec0e	sql		\N	3.5.3	common	\N	9302409533
change_communication_templates	komissarov	classpath:liquibase/migration/distribution/2017-08-21.sql	2018-02-22 12:26:49.801366	73	EXECUTED	7:ccc79444f06f95ad7af59584d35bfa30	sql		\N	3.5.3	common	\N	9302409533
communication_templates_fk	komissarov	classpath:liquibase/migration/distribution/2017-08-21.sql	2018-02-22 12:26:49.812708	74	EXECUTED	7:8f0b72c41123ed65960d709d36d2033a	sql		\N	3.5.3	common	\N	9302409533
add+_channels	komissarov	classpath:liquibase/migration/distribution/2017-08-21.sql	2018-02-22 12:26:49.824273	75	EXECUTED	7:10dae3a9d1e307eb7ab04fc6b2a6b946	sql		\N	3.5.3	common	\N	9302409533
add_name_to_distribution	savchuk	classpath:liquibase/migration/distribution/2017-08-21.sql	2018-02-22 12:26:49.845211	76	EXECUTED	7:82bab053259194b00df30ed0dcdd7111	sql		\N	3.5.3	common	\N	9302409533
add_time_to_distribution	savchuk	classpath:liquibase/migration/distribution/2017-08-21.sql	2018-02-22 12:26:49.880373	77	EXECUTED	7:b8b21394793d1e8738f63090e8abbbc9	sql		\N	3.5.3	common	\N	9302409533
remove_distribution_channel_id	savchuk	classpath:liquibase/migration/distribution/2017-08-21.sql	2018-02-22 12:26:49.889781	78	EXECUTED	7:6d0b75675f1623bf9092fcc2b26cf25f	sql		\N	3.5.3	common	\N	9302409533
add_table_distribution_has_distribution_template	savchuk	classpath:liquibase/migration/distribution/2017-08-21.sql	2018-02-22 12:26:49.920946	79	EXECUTED	7:f7e7946342db20dedfd9a4caf0b9ffa2	sql		\N	3.5.3	common	\N	9302409533
add_static_distribute_group	komissarov	classpath:liquibase/migration/distribution/2017-08-21.sql	2018-02-22 12:26:49.960941	80	EXECUTED	7:98b1208d08baef2f723a8f6b951b1d3e	sql		\N	3.5.3	common	\N	9302409533
update_news_user_links	dminbaev	classpath:liquibase/migration/2017-08-25.sql	2018-02-22 12:26:50.007049	81	EXECUTED	7:0be9b1e6b9dfe92358cbff5b289ce152	sql		\N	3.5.3	common	\N	9302409533
quartz_tables	komissarov	classpath:liquibase/migration/quartz/2017-08-25.sql	2018-02-22 12:26:50.304061	82	EXECUTED	7:b0403a7456b9993fee15587514477fe5	sql		\N	3.5.3	common	\N	9302409533
add_title_and_sender_distribution	komissarov	classpath:liquibase/migration/distribution/2017-08-29.sql	2018-02-22 12:26:50.362188	83	EXECUTED	7:45c3c563dc97b11de21c22a3884f43cd	sql		\N	3.5.3	common	\N	9302409533
remove_title_and_sender_distribution	komissarov	classpath:liquibase/migration/distribution/2017-08-29.sql	2018-02-22 12:26:50.375113	84	EXECUTED	7:9a9056a27567b8326317843d33969b66	sql		\N	3.5.3	common	\N	9302409533
add_new_field_into_distribution	savchuk	classpath:liquibase/migration/distribution/2017-08-29.sql	2018-02-22 12:26:50.416278	85	EXECUTED	7:b39939e88666a75ebe81551e8261e4fd	sql		\N	3.5.3	common	\N	9302409533
rename_new_field	savchuk	classpath:liquibase/migration/distribution/2017-08-29.sql	2018-02-22 12:26:50.426295	86	EXECUTED	7:375501be70f37f8ef8c6b6e169ad5921	sql		\N	3.5.3	common	\N	9302409533
add_communication_permission	savchuk	classpath:liquibase/migration/distribution/2017-08-29.sql	2018-02-22 12:26:50.437273	87	EXECUTED	7:fa5d9cf775ed2124726e7913adea666e	sql		\N	3.5.3	common	\N	9302409533
add_offset_field_in_distribution	komissarov	classpath:liquibase/migration/distribution/2017-08-29.sql	2018-02-22 12:26:50.446844	88	EXECUTED	7:9ed8ffc98b7b800d7fb2ca58fab3f8fe	sql		\N	3.5.3	common	\N	9302409533
add_place_name_to_news	dminbaev	classpath:liquibase/migration/2017-08-30.sql	2018-02-22 12:26:50.455606	89	EXECUTED	7:7c0e29e0ed4a39ee0b879850a6605f9c	sql		\N	3.5.3	common	\N	9302409533
new_tables_statistic	komissarov	classpath:liquibase/migration/statistic/2017-08-31.sql	2018-02-22 12:26:50.517074	90	EXECUTED	7:e5951ff1710decbd84b8a1f693525758	sql		\N	3.5.3	common	\N	9302409533
rename_new_table_field	komissarov	classpath:liquibase/migration/statistic/2017-08-31.sql	2018-02-22 12:26:50.527917	91	EXECUTED	7:f11aa852760de031e9d748e7a7ceadcd	sql		\N	3.5.3	common	\N	9302409533
add_indexes_and_field	komissarov	classpath:liquibase/migration/statistic/2017-08-31.sql	2018-02-22 12:26:50.576206	92	EXECUTED	7:38678943829afc7c5ca8a98fb747ed87	sql		\N	3.5.3	common	\N	9302409533
confirmation	sorlov	classpath:liquibase/migration/2017-09-03.sql	2018-02-22 12:26:50.602948	93	EXECUTED	7:89612537f07731a3ce3976ecbb1254c4	sql		\N	3.5.3	common	\N	9302409533
distribution_logging_table	komissarov	classpath:liquibase/migration/distribution/2017-09-05.sql	2018-02-22 12:26:50.628488	94	EXECUTED	7:23128a026d412cba38b3f9a1aef62fe8	sql		\N	3.5.3	common	\N	9302409533
add_new_channel	komissarov	classpath:liquibase/migration/distribution/2017-09-05.sql	2018-02-22 12:26:50.639516	95	EXECUTED	7:060b85930c9dd1987652ca751049bb2c	sql		\N	3.5.3	common	\N	9302409533
confirmation	sorlov	classpath:liquibase/migration/textservice/2017-09-06.sql	2018-02-22 12:26:50.682975	96	EXECUTED	7:0869a4443b1563aa41e4446cadd5be2f	sql		\N	3.5.3	common	\N	9302409533
category	sorlov	classpath:liquibase/migration/textservice/2017-09-06.sql	2018-02-22 12:26:50.722432	97	EXECUTED	7:087a75b1d0d70c9f4aa32db10e7b533d	sql		\N	3.5.3	common	\N	9302409533
profile_important_attribute	dminbaev	classpath:liquibase/migration/2017-09-07.sql	2018-02-22 12:26:50.741282	98	EXECUTED	7:1b8faad386a73025a8867e32c9e7496f	sql		\N	3.5.3	common	\N	9302409533
create_table_chat_message	savchuk	classpath:liquibase/migration/chat/2017-09-07.sql	2018-02-22 12:26:50.770378	99	EXECUTED	7:94ea2e00dfefa849c24e0d50d29a8c68	sql		\N	3.5.3	common	\N	9302409533
add_vaccinations_tables	komissarov	classpath:liquibase/migration/2017-09-08.sql	2018-02-22 12:26:50.833783	100	EXECUTED	7:b526d01cce36ece669e3fc7499ad090f	sql		\N	3.5.3	common	\N	9302409533
change_request_history	savchuk	classpath:liquibase/migration/2017-09-08.sql	2018-02-22 12:26:50.846278	101	EXECUTED	7:524afcd892a4ae56c1d9c17f3d5c28fa	sql		\N	3.5.3	common	\N	9302409533
add_supervisor_table	iboychuk	classpath:liquibase/migration/2017-09-11.sql	2018-02-22 12:26:50.870576	102	EXECUTED	7:2e9be7860912225a1acb861c1fe804cc	sql		\N	3.5.3	common	\N	9302409533
add_vaccinations_notification_message	sorlov	classpath:liquibase/migration/2017-09-11.sql	2018-02-22 12:26:50.88125	103	EXECUTED	7:d6a779628bfceb663774740569618e2c	sql		\N	3.5.3	common	\N	9302409533
add_vaccinations_notification_default_template	sorlov	classpath:liquibase/migration/2017-09-11.sql	2018-02-22 12:26:50.892191	104	EXECUTED	7:f6b6ef88e6c432c8c3529edee140b0ea	sql		\N	3.5.3	common	\N	9302409533
add_chat_channel_table	savchuk	classpath:liquibase/migration/2017-09-11.sql	2018-02-22 12:26:50.927829	105	EXECUTED	7:b81dd4919bb2e63cad54605a097406a6	sql		\N	3.5.3	common	\N	9302409533
add_new_field_into_polls	savchuk	classpath:liquibase/migration/2017-09-11.sql	2018-02-22 12:26:50.94109	106	EXECUTED	7:094fc44acfb91c1225d60f91417646b7	sql		\N	3.5.3	common	\N	9302409533
unique_on_user_news_info	sorlov	classpath:liquibase/migration/2017-09-12.sql	2018-02-22 12:26:50.959482	107	EXECUTED	7:ee36d2a5047edb8d96c3af3023b242c2	sql		\N	3.5.3	common	\N	9302409533
addition_fields_for_polls	sorlov	classpath:liquibase/migration/2017-09-12.sql	2018-02-22 12:26:50.969545	108	EXECUTED	7:ecfebc2c1882be9ad11e8bb5d9495463	sql		\N	3.5.3	common	\N	9302409533
user_attributes_table	komissarov	classpath:liquibase/migration/2017-09-12.sql	2018-02-22 12:26:50.993234	109	EXECUTED	7:793526e4f51bc3c3f0d6d9a0f79d6e35	sql		\N	3.5.3	common	\N	9302409533
add_rights_for_chat	komissarov	classpath:liquibase/migration/2017-09-12.sql	2018-02-22 12:26:51.003061	110	EXECUTED	7:23bc1ec88a6dfe53c2d93143ccc42ef7	sql		\N	3.5.3	common	\N	9302409533
add_online_flag_to_user	savchuk	classpath:liquibase/migration/2017-09-12.sql	2018-02-22 12:26:51.031593	111	EXECUTED	7:a6f49c307c4832e6b86662da9c7e70c9	sql		\N	3.5.3	common	\N	9302409533
add_index_field_external_id_user	savchuk	classpath:liquibase/migration/2017-09-12.sql	2018-02-22 12:26:51.041243	112	EXECUTED	7:b380364b6d8ee557baf597ff4ad1508f	sql		\N	3.5.3	common	\N	9302409533
create_schema_poll	sorlov	classpath:liquibase/migration/poll/2017-09-19.sql	2018-02-22 12:26:51.232194	113	EXECUTED	7:31d5cf72ff5426e8489cf67a5d4f6ee6	sql		\N	3.5.3	common	\N	9302409533
rename_fields_for_question	sorlov	classpath:liquibase/migration/poll/2017-09-19.sql	2018-02-22 12:26:51.244676	114	EXECUTED	7:ccab9a92c13a26e56927e29ab30ac35b	sql		\N	3.5.3	common	\N	9302409533
poll_deleted	sorlov	classpath:liquibase/migration/poll/2017-09-19.sql	2018-02-22 12:26:51.272053	115	EXECUTED	7:925502871cc7c072f6fc8e82edd5afc7	sql		\N	3.5.3	common	\N	9302409533
create_schema_gis	sorlov	classpath:liquibase/migration/gis/2017-09-20.sql	2018-02-22 12:26:51.28569	116	EXECUTED	7:3bfdae07f96dadd41c42e2150ebd7962	sql		\N	3.5.3	common	\N	9302409533
init_schema_poll	sorlov	classpath:liquibase/migration/gis/2017-09-20.sql	2018-02-22 12:27:44.55742	117	EXECUTED	7:6bbc79efaa3d9e9547c40ed8f101915e	sql		\N	3.5.3	common	\N	9302464516
cityservices_chats_schema	komissarov	classpath:liquibase/migration/chat/2017-09-21.sql	2018-02-22 12:27:44.623072	118	EXECUTED	7:aa791c93b68171a6bd431814adfdd1b4	sql		\N	3.5.3	common	\N	9302464516
change_chat_channel_table	savchuk	classpath:liquibase/migration/chat/2017-09-21.sql	2018-02-22 12:27:44.639347	119	EXECUTED	7:f9d416f0476964e2a54d0182eb95162a	sql		\N	3.5.3	common	\N	9302464516
metrics_schema_init	dminbaev	classpath:liquibase/migration/metric/2017-09-26.sql	2018-02-22 12:27:44.678432	120	EXECUTED	7:a98284972ec7763ef8886164c7870e7b	sql		\N	3.5.3	common	\N	9302464516
add_new_roles_table	komissarov	classpath:liquibase/migration/2017-10-04.sql	2018-02-22 12:27:44.698848	121	EXECUTED	7:b70ca63cd09548ab3e9b805d613d4932	sql		\N	3.5.3	common	\N	9302464516
fix_fk_ror_roles	komissarov	classpath:liquibase/migration/2017-10-04.sql	2018-02-22 12:27:44.732638	122	EXECUTED	7:a0e8c23f26c2db111bba6796e72915eb	sql		\N	3.5.3	common	\N	9302464516
add_med_slot_history	komissarov	classpath:liquibase/migration/med/2017-11-02.sql	2018-02-22 12:27:44.780837	123	EXECUTED	7:5630bcb957593e031ba7d973822f6ee8	sql		\N	3.5.3	common	\N	9302464516
add_slot_group_table	komissarov	classpath:liquibase/migration/med/2017-11-02.sql	2018-02-22 12:27:44.803662	124	EXECUTED	7:3f4304fbd1bf024d7777faf753c6df1e	sql		\N	3.5.3	common	\N	9302464516
add_clinic_doctor_link_table	komissarov	classpath:liquibase/migration/med/2017-11-02.sql	2018-02-22 12:27:44.861285	125	EXECUTED	7:474f325774b9a9dd1999795e47c3b43d	sql		\N	3.5.3	common	\N	9302464516
add_index_to_slot_history_attachment	asavchuk	classpath:liquibase/migration/med/2017-11-02.sql	2018-02-22 12:27:44.872561	126	EXECUTED	7:61cab5507fdf98c708b5256b6f0e1c7e	sql		\N	3.5.3	common	\N	9302464516
add_med_speciality_table	komissarov	classpath:liquibase/migration/med/2017-11-02.sql	2018-02-22 12:27:44.902529	127	EXECUTED	7:eb8d00ed8bcb7d990e24d7b4321bd258	sql		\N	3.5.3	common	\N	9302464516
add_new_user_rights_medicin	asavchuk	classpath:liquibase/migration/roles/2017-11-08.sql	2018-02-22 12:27:44.919777	128	EXECUTED	7:55bbbc3ec6182c925c70d1866d94d036	sql		\N	3.5.3	common	\N	9302464516
add_new_field_system_role_to_role_table	asavchuk	classpath:liquibase/migration/roles/2017-11-08.sql	2018-02-22 12:27:44.959019	129	EXECUTED	7:62e3d6773e280c5b5e52be1c331be8d8	sql		\N	3.5.3	common	\N	9302464516
mark_doctor_role_as_system	asavchuk	classpath:liquibase/migration/roles/2017-11-08.sql	2018-02-22 12:27:44.969982	130	EXECUTED	7:d657ab9699e4577686fa7e3752103e3a	sql		\N	3.5.3	common	\N	9302464516
change_table_med_clinic_link_add_doctor_id_and_check	asavchuk	classpath:liquibase/migration/roles/2017-11-08.sql	2018-02-22 12:27:44.986986	131	EXECUTED	7:b33393aab5b420e803f88c55b1507173	sql		\N	3.5.3	common	\N	9302464516
change_doctor_role_permission_to_see_patient	asavchuk	classpath:liquibase/migration/roles/2017-11-08.sql	2018-02-22 12:27:44.99747	132	EXECUTED	7:7253ca360f1006b480dd0480efc76593	sql		\N	3.5.3	common	\N	9302464516
telegram_add_telegram_handler_schema	komissarov	classpath:telegram/handler/migration/init.sql	2018-02-22 12:28:20.744743	133	EXECUTED	7:86181f0612d4558b44f640df6a2c44df	sql		\N	3.5.3	common	\N	9302500639
add_error_template_columns	komissarov	classpath:telegram/handler/migration/init.sql	2018-02-22 12:28:20.759537	134	EXECUTED	7:fdd6a4ace4a3c44f88ca4d4cec5e76a4	sql		\N	3.5.3	common	\N	9302500639
remove_unused_columns	komissarov	classpath:telegram/handler/migration/init.sql	2018-02-22 12:28:20.769699	135	EXECUTED	7:6e3f05290339b4511e5d11d26144e1ea	sql		\N	3.5.3	common	\N	9302500639
add_command_error_table	komissarov	classpath:telegram/handler/migration/init.sql	2018-02-22 12:28:20.796201	136	EXECUTED	7:31dde242cc049e5046035cf8a0f9fd2f	sql		\N	3.5.3	common	\N	9302500639
add_keyboard_column_description	komissarov	classpath:telegram/handler/migration/init.sql	2018-02-22 12:28:20.834906	137	EXECUTED	7:4c93b8a7efe463ea934606945d17d644	sql		\N	3.5.3	common	\N	9302500639
add_periodic_task_table	komissarov	classpath:telegram/handler/migration/init.sql	2018-02-22 12:28:20.867725	138	EXECUTED	7:e1d3a5a193af34cd1f3f9eaa0c423f60	sql		\N	3.5.3	common	\N	9302500639
add_new_field_timeZone	asavchuk	classpath:telegram/handler/migration/init.sql	2018-02-22 12:28:20.892544	139	EXECUTED	7:6bcde73c307a7566e203935cd870b9da	sql		\N	3.5.3	common	\N	9302500639
add_keyboard_navigation_fields	komissarov	classpath:telegram/handler/migration/init.sql	2018-02-22 12:28:20.901033	140	EXECUTED	7:7b084a63b65fc5cc4a45f5ee10388afa	sql		\N	3.5.3	common	\N	9302500639
add_user_geoposition	dminbaev	classpath:liquibase/migration/2017-12-06.sql	2018-02-22 12:28:20.91333	141	EXECUTED	7:d6f422562de0f730a9d73e6002df7cfd	sql		\N	3.5.3	common	\N	9302500639
drop_constrain	dminbaev	classpath:liquibase/migration/2017-12-06.sql	2018-02-22 12:28:20.925825	142	EXECUTED	7:8237396bfc4a2067f664961ab5cc415b	sql		\N	3.5.3	common	\N	9302500639
engagement_index_table	dminbaev	classpath:liquibase/migration/metric/2017-12-07.sql	2018-02-22 12:28:20.946244	143	EXECUTED	7:0687172803c3772f03426bad603ba01f	sql		\N	3.5.3	common	\N	9302500639
citizen_opinion_table	dminbaev	classpath:liquibase/migration/metric/2017-12-07.sql	2018-02-22 12:28:20.964265	144	EXECUTED	7:66406cffa59f58bca2613b6a0ae0b0a2	sql		\N	3.5.3	common	\N	9302500639
update_engagement_index	dminbaev	classpath:liquibase/migration/metric/2017-12-07.sql	2018-02-22 12:28:20.984648	145	EXECUTED	7:097f145f8d7c831e1009a09cb1366d89	sql		\N	3.5.3	common	\N	9302500639
drop_citizen_opinion_table	dminbaev	classpath:liquibase/migration/metric/2017-12-07.sql	2018-02-22 12:28:20.995362	146	EXECUTED	7:5605514c0ef8a79d99e341ce8a78a1b8	sql		\N	3.5.3	common	\N	9302500639
engagement_index_table	dminbaev	classpath:liquibase/migration/complain/2017-12-08.sql	2018-02-22 12:28:21.020521	147	EXECUTED	7:1a565778e10e9d99cb7569e3f30dd5f8	sql		\N	3.5.3	common	\N	9302500639
add_new_flow_table	ykomissarov	classpath:liquibase/migration/complain/2017-12-08.sql	2018-02-22 12:28:21.096516	148	EXECUTED	7:c0dc29b9ede9e8231b1f493d4e70b135	sql		\N	3.5.3	common	\N	9302500639
add_profile_fill_percent	dminbaev	classpath:liquibase/migration/2017-12-11.sql	2018-02-22 12:28:21.109744	149	EXECUTED	7:bf78524f39b713e90539cd1ef44c29be	sql		\N	3.5.3	common	\N	9302500639
add_user_table_translation	komissarov	classpath:liquibase/migration/2017-12-11.sql	2018-02-22 12:28:21.145625	150	EXECUTED	7:2b3f63060950e8f2409e9978ec650a3f	sql		\N	3.5.3	common	\N	9302500639
add_profile_info_table	dminbaev	classpath:liquibase/migration/2017-12-11.sql	2018-02-22 12:28:21.166812	151	EXECUTED	7:5c890a5c178caff0107593f388405c52	sql		\N	3.5.3	common	\N	9302500639
telegram_notification_service	komissarov	classpath:liquibase/migration/2017-12-11.sql	2018-02-22 12:28:21.215196	152	EXECUTED	7:7c4d44405608398590fc4abd8b7d4225	sql		\N	3.5.3	common	\N	9302500639
profile_index_table	dminbaev	classpath:liquibase/migration/metric/2017-12-11.sql	2018-02-22 12:28:21.24598	153	EXECUTED	7:5540071ca7999fc060158d32f3691de3	sql		\N	3.5.3	common	\N	9302500639
quartz_tables_for_telegram_handler	komissarov	classpath:telegram/handler/migration/quartz.sql	2018-02-22 12:28:21.495627	154	EXECUTED	7:8a9500355526a93ff8b46fb4d498264e	sql		\N	3.5.3	common	\N	9302500639
telegram_task_statistics	komissarov	classpath:telegram/handler/migration/statistic.sql	2018-02-22 12:28:21.542662	155	EXECUTED	7:d04f3ae3cbe745800f314a2c79912012	sql		\N	3.5.3	common	\N	9302500639
change_time_zone_into_function	asavchuk	classpath:telegram/handler/migration/statistic.sql	2018-02-22 12:28:21.555916	156	EXECUTED	7:7ad6f41b3663eb359875dacb1d1ab9d3	sql		\N	3.5.3	common	\N	9302500639
add_time_to_engagement_index	dminbaev	classpath:liquibase/migration/metric/2018-01-11.sql	2018-02-22 12:28:21.566504	157	EXECUTED	7:ae7c24ccc4bcc566db60287258cb6734	sql		\N	3.5.3	common	\N	9302500639
add_last_update_time_user_translation	asavchuk	classpath:liquibase/migration/2018-01-12.sql	2018-02-22 12:28:21.59397	158	EXECUTED	7:d862444beed83aa6b10e0ad93eb8eb8a	sql		\N	3.5.3	common	\N	9302500639
add_available_modules_table	komissarov	classpath:liquibase/migration/2018-01-12.sql	2018-02-22 12:28:21.622551	159	EXECUTED	7:a71b18b20b686b8d95904eeb31cf6a46	sql		\N	3.5.3	common	\N	9302500639
change_module_table_to_settings	asavchuk	classpath:liquibase/migration/2018-01-12.sql	2018-02-22 12:28:21.648148	160	EXECUTED	7:f8aecbf4ff6fb0fcdbcd6cfa1b8831c8	sql		\N	3.5.3	common	\N	9302500639
add_unique_on_time_to_engagement_index	dminbaev	classpath:liquibase/migration/metric/2018-01-16.sql	2018-02-22 12:28:21.666021	161	EXECUTED	7:a99027c28d93a6fd0f34a8c6fa1a42a8	sql		\N	3.5.3	common	\N	9302500639
add_time_to_profile_info_index	dminbaev	classpath:liquibase/migration/metric/2018-01-16.sql	2018-02-22 12:28:21.688464	162	EXECUTED	7:52490631c833c216260d9b086925a84f	sql		\N	3.5.3	common	\N	9302500639
add_unique_to_user_profile_info	dminbaev	classpath:liquibase/migration/2018-01-25.sql	2018-02-22 12:28:21.703525	163	EXECUTED	7:eb33d7efdaff4b598800483883cdb70d	sql		\N	3.5.3	common	\N	9302500639
notification_schema_init	sorlov	classpath:liquibase/migration/notification/2018-01-26.sql	2018-02-22 12:28:42.548947	164	EXECUTED	7:c3af3c3580e1e7d459815b78584d6cb2	sql		\N	3.5.3	common	\N	9302522510
add_field_blocked_to_user_info	sorlov	classpath:liquibase/migration/2018-02-01.sql	2018-02-22 12:28:42.580982	165	EXECUTED	7:000c229899a1a77160b247d78d768ff5	sql		\N	3.5.3	common	\N	9302522510
add_stored_procedures_tables	komissarov	classpath:telegram/handler/migration/procedures.sql	2018-02-22 12:28:42.625763	166	EXECUTED	7:8fd92a659ae70a66d6bcafc5a0aeb4ae	sql		\N	3.5.3	common	\N	9302522510
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: electricity_meter; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.electricity_meter (id, type, number, contract_number, house_id) FROM stdin;
\.


--
-- Name: electricity_meter_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.electricity_meter_id_seq', 1, false);


--
-- Data for Name: electricity_meter_value; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.electricity_meter_value (id, value, day, meter_id) FROM stdin;
\.


--
-- Name: electricity_meter_value_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.electricity_meter_value_id_seq', 1, false);


--
-- Data for Name: evacuation; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.evacuation (id, evacuation_date, place, reason, act_number, grn, sts, parking_address, status) FROM stdin;
\.


--
-- Name: evacuation_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.evacuation_id_seq', 5, true);


--
-- Data for Name: flow; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.flow (id, name, description, created_at, updated_at, system_name) FROM stdin;
1	Complaints	Complaints	2018-02-22 12:28:21.026457	2018-02-22 12:28:21.026457	complaint
\.


--
-- Name: flow_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.flow_id_seq', 1, false);


--
-- Data for Name: house; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.house (id, street, home, flat, house_account) FROM stdin;
\.


--
-- Name: house_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.house_id_seq', 1, false);


--
-- Data for Name: med_clinic_link; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.med_clinic_link (id, created_at, operator_id, clinic_id, link_type, doctor_id) FROM stdin;
\.


--
-- Name: med_clinic_link_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.med_clinic_link_id_seq', 1, false);


--
-- Data for Name: med_doctor; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.med_doctor (id, fio) FROM stdin;
\.


--
-- Name: med_doctor_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.med_doctor_id_seq', 4, true);


--
-- Data for Name: med_doctor_speciality; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.med_doctor_speciality (id, name, description) FROM stdin;
\.


--
-- Name: med_doctor_speciality_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.med_doctor_speciality_id_seq', 4, true);


--
-- Data for Name: med_hospital; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.med_hospital (id, name, address) FROM stdin;
\.


--
-- Name: med_hospital_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.med_hospital_id_seq', 3, true);


--
-- Data for Name: med_hospital_policy; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.med_hospital_policy (hospital_id, policy_id) FROM stdin;
\.


--
-- Data for Name: med_hospital_unit; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.med_hospital_unit (id, doctor_id, speciality_id, hospital_id) FROM stdin;
\.


--
-- Data for Name: med_hospital_unit_favorite; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.med_hospital_unit_favorite (id, name, user_id, hospital_unit_id) FROM stdin;
\.


--
-- Name: med_hospital_unit_favorite_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.med_hospital_unit_favorite_id_seq', 1, false);


--
-- Name: med_hospital_unit_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.med_hospital_unit_id_seq', 8, true);


--
-- Data for Name: med_policy; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.med_policy (id, oms) FROM stdin;
\.


--
-- Name: med_policy_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.med_policy_id_seq', 8, true);


--
-- Data for Name: med_speciality; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.med_speciality (id, name, instance_id, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: med_speciality_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.med_speciality_id_seq', 1, false);


--
-- Data for Name: med_treatment_day; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.med_treatment_day (id, unit_id, day) FROM stdin;
\.


--
-- Name: med_treatment_day_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.med_treatment_day_id_seq', 24, true);


--
-- Data for Name: med_treatment_slot; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.med_treatment_slot (id, "time", status, room, policy_id, day_id) FROM stdin;
\.


--
-- Name: med_treatment_slot_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.med_treatment_slot_id_seq', 96, true);


--
-- Data for Name: message; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.message (id, recipient, sender, title, content, mime_type_id, properties, is_deleted, created, pic) FROM stdin;
\.


--
-- Name: message_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.message_id_seq', 1, false);


--
-- Data for Name: message_tag; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.message_tag (id, message_id, value) FROM stdin;
\.


--
-- Name: message_tag_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.message_tag_id_seq', 1, false);


--
-- Data for Name: mime_type; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.mime_type (id, name) FROM stdin;
\.


--
-- Name: mime_type_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.mime_type_id_seq', 1, false);


--
-- Data for Name: news_category; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.news_category (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: news_category_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.news_category_id_seq', 1, false);


--
-- Data for Name: news_element; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.news_element (id, text, img_url, deleted, operator_id, update_at, title, publish_date, source_url, notify_user, lat, lng, address, place_name) FROM stdin;
\.


--
-- Data for Name: news_element_has_category; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.news_element_has_category (news_element_id, news_category_id) FROM stdin;
\.


--
-- Data for Name: news_element_has_tag; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.news_element_has_tag (news_element_id, news_tag_id) FROM stdin;
\.


--
-- Name: news_element_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.news_element_id_seq', 5, true);


--
-- Data for Name: news_tag; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.news_tag (id, name, create_date, update_date) FROM stdin;
\.


--
-- Name: news_tag_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.news_tag_id_seq', 1, false);


--
-- Data for Name: news_user_info; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.news_user_info (id, news_id, user_id, is_like, like_time, is_read, read_time) FROM stdin;
\.


--
-- Name: news_user_info_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.news_user_info_id_seq', 1, false);


--
-- Data for Name: offence; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.offence (id, date, sum, location, reason, act_number, grn, sts, vu, type, status, user_info_id, read) FROM stdin;
\.


--
-- Name: offence_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.offence_id_seq', 16, true);


--
-- Data for Name: polls; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.polls (id, poll_title, poll_description, created_at, updated_at, category_id, award, image) FROM stdin;
\.


--
-- Name: polls_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.polls_id_seq', 1, false);


--
-- Data for Name: profile_attribute; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.profile_attribute (id, name, display_name, "group") FROM stdin;
\.


--
-- Name: profile_attribute_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.profile_attribute_id_seq', 1, false);


--
-- Data for Name: profile_important_attribute; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.profile_important_attribute (id, name, active) FROM stdin;
\.


--
-- Name: profile_important_attribute_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.profile_important_attribute_id_seq', 43, true);


--
-- Data for Name: published; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.published (poll_id, person_id, id, start_time, end_time) FROM stdin;
\.


--
-- Name: published_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.published_id_seq', 1, false);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.questions (id, question_title, question_description, poll_id, created_at, updated_at, question_prio, question_type) FROM stdin;
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.questions_id_seq', 1, false);


--
-- Data for Name: role; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.role (id, name, rights, description, system_role) FROM stdin;
3	DOCTOR_ROLE	"medAuthorities"=>"262631", "profileAuthorities"=>"7"		t
2	manager	"chatAuthorities"=>"0", "newsAuthorities"=>"114", "operatorsAuthorities"=>"1", "complaintsAuthorities"=>"8388607", "complaintAssignRightName"=>"1", "complaintAssignedRightName"=>"1"		f
1	user	"medAuthorities"=>"4194303", "chatAuthorities"=>"4194303", "newsAuthorities"=>"127", "pollsAuthorities"=>"4194303", "rolesAuthorities"=>"4194303", "profileAuthorities"=>"4194303", "requestAuthorities"=>"4194303", "operatorsAuthorities"=>"4194303", "telegramBotAuthority"=>"524287", "complaintsAuthorities"=>"4194303", "mobileUserAuthorities"=>"4194303", "communicationAuthorities"=>"4194303", "complaintAssignRightName"=>"4194303"		f
\.


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.role_id_seq', 3, true);


--
-- Data for Name: role_links; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.role_links (parent_id, child_id) FROM stdin;
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.service (id, category_id, name, code) FROM stdin;
1	1	Мой ребенок в школе	child_in_school
2	1	Электронный дневник	electronic_diary
3	2	Начисления за ЖКУ	communal_payments
4	2	Счетчики электроэнергии	electricity_meters
5	2	Счетчики водоснабжения	water_meters
6	2	Отключение горячей воды	hot_water_prevention
7	3	Штрафы ГИБДД	fines_auto
8	3	Проверка эвакуации ТС	evacuation_checking
9	3	Проверка лицензии такси	tax_license
10	4	Запись к врачу	doctor_booking
11	4	Информация о центрах госуслуг	city_services_info
\.


--
-- Data for Name: service_category; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.service_category (id, name, code) FROM stdin;
1	Образовательные	education
2	Коммунальные	communal
3	Транспортные	transport
4	Социальные	social
\.


--
-- Name: service_category_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.service_category_id_seq', 4, true);


--
-- Data for Name: service_favorite; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.service_favorite (id, service_id, user_id) FROM stdin;
\.


--
-- Name: service_favorite_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.service_favorite_id_seq', 1, false);


--
-- Data for Name: service_favorite_param; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.service_favorite_param (id, favorite_id, param_name, param_value) FROM stdin;
\.


--
-- Name: service_favorite_param_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.service_favorite_param_id_seq', 1, false);


--
-- Data for Name: service_history; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.service_history (id, service_id, user_id, completion_date) FROM stdin;
\.


--
-- Name: service_history_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.service_history_id_seq', 1, false);


--
-- Data for Name: service_history_param; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.service_history_param (id, service_history_id, param_id, param_value) FROM stdin;
\.


--
-- Name: service_history_param_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.service_history_param_id_seq', 1, false);


--
-- Name: service_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.service_id_seq', 11, true);


--
-- Data for Name: service_param; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.service_param (id, service_id, endpoint_param, profile_section, profile_group, profile_property, data_position) FROM stdin;
1	3	street	habitation	house	address	0
2	3	house	habitation	house	address	1
3	3	flat	habitation	house	address	2
4	3	payer_code	habitation	house	address	3
5	4	account_number	city_services	electricity	account	0
6	4	meter_number	city_services	electricity	account	1
7	5	street	habitation	house	address	0
8	5	house	habitation	house	address	1
9	5	flat	habitation	house	address	2
10	5	payer_code	habitation	house	address	3
11	7	sts	estate	car	car	0
12	7	vu	estate	car	vu	1
13	7	grz	estate	car	car	2
14	8	car_number	estate	car	car	0
15	8	registration_number	estate	car	car	1
\.


--
-- Name: service_param_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.service_param_id_seq', 15, true);


--
-- Data for Name: service_subscription; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.service_subscription (id, service_id, user_id) FROM stdin;
\.


--
-- Name: service_subscription_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.service_subscription_id_seq', 1, false);


--
-- Data for Name: service_subscription_param; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.service_subscription_param (id, subscription_id, param_id, param_value) FROM stdin;
\.


--
-- Name: service_subscription_param_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.service_subscription_param_id_seq', 1, false);


--
-- Data for Name: slot_group; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.slot_group (id, date, has_slots, slots) FROM stdin;
\.


--
-- Name: slot_group_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.slot_group_id_seq', 1, false);


--
-- Data for Name: slot_history; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.slot_history (id, slot_id, created_at, action, author_type, author_id, private_info) FROM stdin;
\.


--
-- Data for Name: slot_history_attachment; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.slot_history_attachment (id, history_id, type, message, private_info) FROM stdin;
\.


--
-- Name: slot_history_attachment_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.slot_history_attachment_id_seq', 1, false);


--
-- Name: slot_history_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.slot_history_id_seq', 1, false);


--
-- Data for Name: statistic_type; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.statistic_type (id, name) FROM stdin;
1	Users
2	Complaints
3	Voters
\.


--
-- Name: statistic_type_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.statistic_type_id_seq', 1, false);


--
-- Data for Name: statistic_value; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.statistic_value (date, type_id, value, id) FROM stdin;
\.


--
-- Name: statistic_value_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.statistic_value_id_seq', 1, false);


--
-- Data for Name: supervisor; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.supervisor (id, email, phone, sos_template) FROM stdin;
\.


--
-- Name: supervisor_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.supervisor_id_seq', 1, false);


--
-- Data for Name: text_service; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.text_service (id, name, command_regexp, endpoint_attribute_name, profile_attribute_name, endpoint_path, channel_type, empty_template, not_empty_template, void_template, error_template, is_void, group_id, active) FROM stdin;
\.


--
-- Data for Name: text_service_category; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.text_service_category (id, name) FROM stdin;
\.


--
-- Name: text_service_category_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.text_service_category_id_seq', 1, false);


--
-- Data for Name: text_service_group; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.text_service_group (id, name, category_id) FROM stdin;
\.


--
-- Name: text_service_group_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.text_service_group_id_seq', 1, false);


--
-- Name: text_service_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.text_service_id_seq', 1, false);


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.transaction (id, message_id, status, "time") FROM stdin;
\.


--
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.transaction_id_seq', 1, false);


--
-- Data for Name: translation; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.translation (lang, messages) FROM stdin;
\.


--
-- Data for Name: ui_config; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.ui_config (system_name, settings, updated_at) FROM stdin;
operator	{"defaultLanguage": "en", "availableModules": ["complaints", "polls", "alarms", "chat", "news", "communications", "textServices", "telegramBot", "citizens", "medicine", "inMails"], "availableLanguages": ["en", "es", "pt", "he", "ru"]}	2018-02-22 12:55:58.823673
lk	{"formats": {"idCard": {"mask": "9999 999999", "placeholder": "Format 9999 999999"}, "vehicle": {"mask": "aaa999", "placeholder": "Registration number format aaa999"}, "phoneNumber": {"mask": "+79999999999", "placeholder": "Number format +79999999999"}, "driverLicense": {"mask": "999 999", "placeholder": "Format 999 999"}, "socialSecurity": {"mask": "999999999 99", "placeholder": "Format 999999999 99"}}, "defaultLanguage": "en", "availableModules": ["complaints", "polls", "alarms", "chat", "news", "communications", "textServices", "telegramBot", "citizens", "medicine", "inMails"], "availableLanguages": [{"lang": "en", "isRTLanguage": false}, {"lang": "es", "isRTLanguage": false}, {"lang": "pt", "isRTLanguage": false}, {"lang": "he", "isRTLanguage": true}, {"lang": "ru", "isRTLanguage": false}]}	2018-02-22 12:55:59.929383
\.


--
-- Data for Name: user_answers; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.user_answers (person_id, question_id, answer_id, dt, id) FROM stdin;
\.


--
-- Name: user_answers_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.user_answers_id_seq', 1, false);


--
-- Data for Name: user_geoposition; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.user_geoposition (id, user_id, provider, location_provider, latitude, longitude, speed, accuracy, altitude, "time", bearing) FROM stdin;
\.


--
-- Name: user_geoposition_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.user_geoposition_id_seq', 1, false);


--
-- Data for Name: user_houses; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.user_houses (id, name, user_id, house_id) FROM stdin;
\.


--
-- Name: user_houses_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.user_houses_id_seq', 1, false);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.user_info (id, external_id, policy_id, online, points, locked) FROM stdin;
\.


--
-- Name: user_info_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.user_info_id_seq', 2, true);


--
-- Data for Name: user_profile_info; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.user_profile_info (id, user_info_id, profile_fill_percent, birth_date, parent, have_car, gender, create_date, update_date) FROM stdin;
\.


--
-- Name: user_profile_info_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.user_profile_info_id_seq', 2, true);


--
-- Data for Name: user_request_abstract; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.user_request_abstract (id, user_id, operator_id, current_status, creation_time, request_type, lat, lon, updated_at) FROM stdin;
\.


--
-- Name: user_request_abstract_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.user_request_abstract_id_seq', 1, false);


--
-- Data for Name: user_request_epd; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.user_request_epd (id, year, month, house_id) FROM stdin;
\.


--
-- Data for Name: user_request_feedback; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.user_request_feedback (id, text, title, feedback_type) FROM stdin;
\.


--
-- Data for Name: user_request_history; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.user_request_history (id, creation_time, message, title, status_from, status_to, lat, lon, status_text, request_id, user_id, operator_id) FROM stdin;
\.


--
-- Name: user_request_history_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.user_request_history_id_seq', 1, false);


--
-- Data for Name: user_request_sos; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.user_request_sos (id, start, stop, sos_status) FROM stdin;
\.


--
-- Data for Name: user_subscription; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.user_subscription (id, user_id, type, channel, messenger_user_id) FROM stdin;
\.


--
-- Name: user_subscription_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.user_subscription_id_seq', 1, false);


--
-- Data for Name: user_translation; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.user_translation (lang, messages, updated_at) FROM stdin;
he	"keys.dayMap.0"=>"HB Sun", "keys.dayMap.1"=>"HB Mon", "keys.dayMap.2"=>"HB Tue", "keys.dayMap.3"=>"HB Wed", "keys.dayMap.4"=>"HB Thu", "keys.dayMap.5"=>"HB Fri", "keys.dayMap.6"=>"HB Sat", "keys.menu.news"=>"HB News", "keys.menu.polls"=>"HB Polls", "keys.mounthMap.0"=>"HB jan", "keys.mounthMap.1"=>"HB feb", "keys.mounthMap.2"=>"HB mar", "keys.mounthMap.3"=>"HB apr", "keys.mounthMap.4"=>"HB may", "keys.mounthMap.5"=>"HB jun", "keys.mounthMap.6"=>"HB jul", "keys.mounthMap.7"=>"HB aug", "keys.mounthMap.8"=>"HB sep", "keys.mounthMap.9"=>"HB oct", "keys.mounthMap.10"=>"HB nov", "keys.mounthMap.11"=>"HB dec", "keys.signOut.text"=>"HB Do you want to exit?", "keys.telegram.add"=>"HB Add telegram account", "keys.menu.cityToday"=>"HB City today", "keys.telegram.title"=>"HB Telegram", "keys.menu.cityInmail"=>"HB City inmail", "keys.menu.complaints"=>"HB Complaints", "keys.signOut.btnExit"=>"HB Exit", "keys.userRow.btnExit"=>"HB Exit", "keys.menu.appointments"=>"HB My appointments", "keys.signOut.btnCancel"=>"HB Cancel", "keys.telegram.verified"=>"HB Telegram account verified", "keys.telegram.modalName"=>"HB Telegram", "keys.telegram.confirm.code"=>"HB Your confirmation code", "routes.news.keys.pageTitle"=>"HB News", "routes.inmail.keys.pageTitle"=>"HB City inmail", "keys.userRow.modalSignOutName"=>"HB Sign out", "routes.profile.keys.pageTitle"=>"HB Profile", "keys.telegram.confirm.btnCancel"=>"HB Cancel", "routes.cityToday.keys.pageTitle"=>"HB City today", "keys.telegram.confirm.btnOpenBot"=>"HB Open citymatica bot", "routes.complaints.keys.pageTitle"=>"HB Complaints", "routes.inmail.keys.pageTabs.inbox"=>"HB Inbox", "routes.appointments.keys.pageTitle"=>"HB Appointments", "routes.inmail.keys.pageToolbar.add"=>"HB New Message", "routes.cityToday.keys.newsList.title"=>"HB News", "routes.cityToday.keys.pollsList.title"=>"HB Polls", "routes.complaints.keys.pageToolbar.add"=>"HB Add complaint", "routes.complaints.routes.add.pageTitle"=>"HB Add complaint", "routes.inmail.keys.pageTabs.myMessages"=>"HB My messages", "routes.profile.keys.pageTabs.workPlace"=>"HB Work place", "routes.profile.keys.pageToolbar.points"=>"HB City points", "routes.complaints.routes.entity.history"=>"HB History", "routes.inmail.routes.add.keys.pageTitle"=>"HB Add message", "routes.appointments.keys.pageToolbar.add"=>"HB Add appointment", "routes.news.routes.entity.keys.pageTitle"=>"HB news", "routes.profile.keys.pageTabs.citizenData"=>"HB Citizen data", "routes.appointments.keys.pageTabs.planned"=>"HB Planned", "routes.cityToday.keys.newsList.btnViewAll"=>"HB View All", "routes.complaints.routes.add.form.btnSend"=>"HB Send", "routes.complaints.routes.entity.pageTitle"=>"HB Complaint", "routes.news.routes.entity.keys.like.btnNo"=>"HB No", "routes.news.routes.entity.keys.like.liked"=>"HB You liked this news", "routes.news.routes.entity.keys.like.title"=>"HB Did you like this news?", "routes.profile.keys.pageTabs.personalData"=>"HB Personal data", "routes.profile.keys.pageToolbar.completed"=>"HB Profile completed", "routes.appointments.keys.pageTabs.previous"=>"HB Previous", "routes.cityToday.keys.pollsList.btnViewAll"=>"HB View All", "routes.inmail.routes.add.keys.form.btnSend"=>"HB Send", "routes.inmail.routes.entity.keys.pageTitle"=>"HB Message", "routes.news.routes.entity.keys.like.btnYes"=>"HB Yes", "routes.profile.keys.pageTabs.notifications"=>"HB Notifications", "routes.complaints.routes.add.form.btnCancel"=>"HB Cancel", "routes.complaints.routes.add.form.type.label"=>"HB Type", "routes.inmail.routes.add.keys.form.btnCancel"=>"HB Cancel", "routes.news.routes.entity.keys.like.disliked"=>"HB You disliked this news", "routes.appointments.routes.add.keys.pageTitle"=>"HB Add appointment", "routes.news.keys.pageToolbar.filter.btnFilter"=>"HB Filter", "routes.appointments.routes.add.keys.dates.title"=>"HB Available time", "routes.appointments.routes.add.keys.specs.title"=>"HB Specialists", "routes.complaints.routes.entity.pageToolbar.add"=>"HB Add complaint", "routes.appointments.routes.entity.keys.pageTitle"=>"HB Appointment", "routes.complaints.routes.add.form.category.label"=>"HB Category", "routes.inmail.routes.add.keys.form.message.label"=>"HB Message", "routes.appointments.routes.add.keys.doctors.title"=>"HB Doctors", "routes.inmail.routes.add.keys.form.category.label"=>"HB Category", "routes.complaints.routes.add.form.type.placeholder"=>"HB Choose type...", "routes.appointments.routes.add.keys.dates.btnChoose"=>"HB Choose", "routes.appointments.routes.add.keys.hospitals.title"=>"HB Medical organisations", "routes.appointments.routes.add.keys.specs.btnChoose"=>"HB Choose", "routes.complaints.routes.add.form.type.errorMessage"=>"HB Choose type", "routes.complaints.routes.entity.status.onModeration"=>"HB On moderation", "routes.news.keys.pageToolbar.filter.modalFilterName"=>"HB Filter", "routes.appointments.routes.entity.keys.pageTabs.info"=>"HB info", "routes.profile.routes.personalData.keys.form.btnSave"=>"HB Save", "routes.appointments.routes.add.keys.doctors.btnChoose"=>"HB Choose", "routes.appointments.routes.add.keys.hospitals.btnDate"=>"HB On the date", "routes.profile.routes.notifications.keys.form.btnSave"=>"HB Save", "routes.profile.routes.workPlace.keys.form.house.label"=>"HB House", "routes.complaints.routes.add.form.category.placeholder"=>"HB Choose category...", "routes.inmail.routes.add.keys.form.message.placeholder"=>"HB Write your text here", "routes.profile.routes.workPlace.keys.form.btnSave.text"=>"HB Save", "routes.profile.routes.workPlace.keys.form.office.label"=>"HB Office", "routes.profile.routes.workPlace.keys.form.street.label"=>"HB Street", "routes.appointments.routes.add.keys.hospitals.btnDoctor"=>"HB To the doctor", "routes.complaints.routes.add.form.category.errorMessage"=>"HB Choose category", "routes.inmail.routes.add.keys.form.message.errorMessage"=>"HB Type your message", "routes.profile.routes.personalData.keys.form.name.label"=>"HB Name", "routes.appointments.routes.entity.keys.pageTabs.comments"=>"HB comments", "routes.inmail.routes.add.keys.form.category.errorMessage"=>"HB Choose category", "routes.profile.routes.notifications.keys.form.news.label"=>"HB News", "routes.profile.routes.personalData.keys.form.email.label"=>"HB E-mail", "routes.profile.routes.personalData.keys.form.phone.label"=>"HB Phone", "routes.appointments.routes.entity.keys.pageTabs.anamnesis"=>"HB anamnesis", "routes.profile.routes.citizenData.routes.kids.keys.addBtn"=>"HB Add kid", "routes.profile.routes.notifications.keys.sosNumbers.label"=>"HB SOS numbers", "routes.profile.routes.personalData.keys.form.gender.label"=>"HB Gender", "routes.profile.routes.personalData.keys.form.upload.label"=>"HB Upload", "routes.profile.routes.notifications.keys.sosNumbers.btnAdd"=>"HB Add SOS numbers", "routes.profile.routes.personalData.keys.form.surname.label"=>"HB Surname", "routes.appointments.routes.entity.keys.pageTabs.attachments"=>"HB attachments", "routes.profile.routes.citizenData.routes.house.keys.btnSave"=>"HB Save", "routes.profile.routes.workPlace.keys.form.companyName.label"=>"HB Company name", "routes.appointments.routes.entity.routes.info.keys.btnCancel"=>"HB Cancel", "routes.profile.routes.citizenData.routes.vehicle.keys.addBtn"=>"HB Add vehicle", "routes.profile.routes.notifications.keys.form.news.sms.label"=>"HB SMS", "routes.profile.routes.personalData.keys.form.birthdate.label"=>"HB Birthdate", "routes.profile.routes.citizenData.routes.house.keys.pageTitle"=>"HB House", "routes.profile.routes.notifications.keys.form.news.push.label"=>"HB Push", "routes.profile.routes.citizenData.routes.house.keys.city.label"=>"HB City", "routes.profile.routes.notifications.keys.form.complaints.label"=>"HB Complaints", "routes.profile.routes.notifications.keys.form.news.email.label"=>"HB E-mail", "routes.profile.routes.citizenData.routes.documents.keys.btnSave"=>"HB Save", "routes.profile.routes.citizenData.routes.house.keys.house.label"=>"HB House", "routes.profile.routes.citizenData.routes.kids.keys.modalAddName"=>"HB Add kid", "routes.profile.routes.citizenData.routes.vehicle.keys.pageTitle"=>"HB Vehicle", "routes.profile.routes.notifications.keys.form.news.inmail.label"=>"HB Inmail", "routes.profile.routes.notifications.keys.form.vaccination.label"=>"HB Vaccination", "routes.profile.routes.citizenData.routes.house.keys.street.label"=>"HB Street", "routes.profile.routes.citizenData.routes.kids.keys.modalEditName"=>"HB Edit kid", "routes.profile.routes.citizenData.routes.paymentData.keys.addBtn"=>"HB Add payment", "routes.profile.routes.notifications.keys.sosNumbers.modalAddName"=>"HB Add sos number", "routes.profile.routes.personalData.keys.form.maritalStatus.label"=>"HB Marital status", "routes.appointments.routes.entity.routes.info.keys.itemWhereTitle"=>"HB Where", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.btnAdd"=>"HB Add", "routes.profile.routes.notifications.keys.form.news.telegram.label"=>"HB Telegram", "routes.profile.routes.notifications.keys.sosNumbers.modalEditName"=>"HB Edit sos number", "routes.appointments.routes.entity.routes.info.keys.itemDoctorTitle"=>"HB Doctor", "routes.profile.routes.citizenData.routes.vehicle.keys.modalAddName"=>"HB Add vehicle", "routes.profile.routes.notifications.keys.form.complaints.sms.label"=>"HB SMS", "routes.profile.routes.citizenData.routes.house.keys.apartment.label"=>"HB Apartment", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.btnEdit"=>"HB Edit", "routes.profile.routes.citizenData.routes.vehicle.keys.modalEditName"=>"HB Edit vehicle", "routes.profile.routes.notifications.keys.form.complaints.push.label"=>"HB Push", "routes.profile.routes.notifications.keys.form.vaccination.sms.label"=>"HB SMS", "routes.profile.routes.personalData.keys.form.gender.keys.male.label"=>"HB Male", "routes.profile.routes.citizenData.routes.documents.keys.idCard.label"=>"HB Id card", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.btnCancel"=>"HB Cancel", "routes.profile.routes.citizenData.routes.vehicle.keys.formAdd.btnAdd"=>"HB Add", "routes.profile.routes.notifications.keys.form.complaints.email.label"=>"HB E-mail", "routes.profile.routes.notifications.keys.form.vaccination.push.label"=>"HB Push", "routes.profile.routes.notifications.keys.sosNumbers.formEdit.btnEdit"=>"HB Edit", "routes.profile.routes.citizenData.routes.house.keys.gasMetering.label"=>"HB Gas metering", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.name.label"=>"HB Name", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.btnRemove"=>"HB Remove", "routes.profile.routes.citizenData.routes.vehicle.keys.formEdit.btnAdd"=>"HB Add", "routes.profile.routes.notifications.keys.form.complaints.inmail.label"=>"HB Inmail", "routes.profile.routes.notifications.keys.form.vaccination.email.label"=>"HB E-mail", "routes.profile.routes.personalData.keys.form.gender.keys.female.label"=>"HB Female", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.name.label"=>"HB Name", "routes.profile.routes.citizenData.routes.paymentData.keys.modalAddName"=>"HB Add payment", "routes.profile.routes.notifications.keys.form.vaccination.inmail.label"=>"HB Inmail", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.name.label"=>"HB Name", "routes.profile.routes.notifications.keys.sosNumbers.formEdit.btnRemove"=>"HB Remove", "routes.profile.routes.citizenData.routes.house.keys.waterMetering.label"=>"HB Water metering", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.gender.label"=>"HB Gender", "routes.profile.routes.citizenData.routes.paymentData.keys.modalEditName"=>"HB Edit payment", "routes.profile.routes.citizenData.routes.vehicle.keys.formAdd.btnCancel"=>"HB Cancel", "routes.profile.routes.notifications.keys.form.complaints.telegram.label"=>"HB Telegram", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.btnAdd.text"=>"HB Add", "routes.profile.routes.notifications.keys.sosNumbers.formEdit.name.label"=>"HB Name", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.surname.label"=>"HB surname", "routes.profile.routes.citizenData.routes.paymentData.keys.formAdd.btnAdd"=>"HB Add", "routes.profile.routes.citizenData.routes.vehicle.keys.formEdit.btnRemove"=>"HB Remove", "routes.profile.routes.notifications.keys.form.vaccination.telegram.label"=>"HB Telegram", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.surname.label"=>"HB surname", "routes.profile.routes.citizenData.routes.vehicle.keys.formAdd.model.label"=>"HB Model", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.birthdate.label"=>"HB Birthdate", "routes.profile.routes.citizenData.routes.paymentData.keys.formEdit.btnEdit"=>"HB Edit", "routes.profile.routes.citizenData.routes.vehicle.keys.formEdit.model.label"=>"HB Model", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.btnCancel.text"=>"HB Cancel", "routes.profile.routes.citizenData.routes.documents.keys.driverLicense.label"=>"HB Driver license", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.birthdate.label"=>"HB Birthdate", "routes.profile.routes.citizenData.routes.paymentData.keys.formAdd.CVC.label"=>"HB CVC / CVV", "routes.profile.routes.citizenData.routes.paymentData.keys.formAdd.btnCancel"=>"HB Cancel", "routes.profile.routes.citizenData.routes.documents.keys.socialSecurity.label"=>"HB Social security", "routes.profile.routes.citizenData.routes.paymentData.keys.formEdit.CVC.label"=>"HB CVC / CVV", "routes.profile.routes.citizenData.routes.paymentData.keys.formEdit.btnRemove"=>"HB Remove", "routes.profile.routes.personalData.keys.form.maritalStatus.keys.single.label"=>"HB Single", "routes.profile.routes.citizenData.routes.house.keys.electricityMetering.label"=>"HB Electricity metering", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.gender.male.label"=>"HB Male", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.phoneNumber.label"=>"HB Phone Number", "routes.profile.routes.personalData.keys.form.maritalStatus.keys.married.label"=>"HB Married", "routes.profile.routes.personalData.keys.form.maritalStatus.keys.widowed.label"=>"HB Widowed", "routes.profile.routes.notifications.keys.sosNumbers.formEdit.phoneNumber.label"=>"HB Phone Number", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.gender.female.label"=>"HB Female", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.gender.keys.male.label"=>"HB Male", "routes.profile.routes.citizenData.routes.paymentData.keys.formAdd.cardNumber.label"=>"HB Card number", "routes.profile.routes.citizenData.routes.paymentData.keys.formAdd.holderName.label"=>"HB Holder name", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.gender.keys.female.label"=>"HB Female", "routes.profile.routes.citizenData.routes.paymentData.keys.formEdit.cardNumber.label"=>"HB Card number", "routes.profile.routes.citizenData.routes.paymentData.keys.formEdit.holderName.label"=>"HB Holder name", "routes.profile.routes.citizenData.routes.paymentData.keys.formAdd.expirationDate.label"=>"HB Expiration date ('00/0000')", "routes.profile.routes.citizenData.routes.vehicle.keys.formAdd.registrationNumber.label"=>"HB Registration number", "routes.profile.routes.citizenData.routes.paymentData.keys.formEdit.expirationDate.label"=>"HB Expiration date (u201C00/0000u201D)", "routes.profile.routes.citizenData.routes.vehicle.keys.formEdit.registrationNumber.label"=>"HB Registration number"	2018-02-22 12:54:05.162844
es	"keys.dayMap.0"=>"domingo", "keys.dayMap.1"=>"lunes", "keys.dayMap.2"=>"martes", "keys.dayMap.3"=>"miércoles", "keys.dayMap.4"=>"jueves", "keys.dayMap.5"=>"viernes", "keys.dayMap.6"=>"sábado", "keys.menu.news"=>"Noticias de nuestra ciudad", "keys.menu.polls"=>"Encuestas", "keys.mounthMap.0"=>"enero", "keys.mounthMap.1"=>"feb.", "keys.mounthMap.2"=>"mayo", "keys.mounthMap.3"=>"jun.", "keys.mounthMap.4"=>"jul.", "keys.mounthMap.5"=>"agosto", "keys.mounthMap.6"=>"sept.", "keys.mounthMap.7"=>"oct.", "keys.mounthMap.8"=>"nov.", "keys.mounthMap.9"=>"dic.", "keys.form.btnSave"=>"Guardar", "keys.mounthMap.10"=>"marzo", "keys.mounthMap.11"=>"abr.", "keys.signOut.text"=>"¿Quieres salir?", "keys.telegram.add"=>"Agregar cuenta de Telegram", "keys.form.btnCancel"=>"Cancelar", "keys.menu.cityToday"=>"Ciudad hoy", "keys.telegram.title"=>"Telegram", "keys.menu.cityInmail"=>"Ciudad enmail", "keys.menu.complaints"=>"Peticiones, quejas y reclamos (PQR)", "keys.signOut.btnExit"=>"Salir", "keys.userRow.btnExit"=>"Salir", "keys.menu.appointments"=>"Mis citas", "keys.signOut.btnCancel"=>"Cancelar", "keys.telegram.verified"=>"Cuenta de Telegram verificada", "keys.telegram.modalName"=>"Telegram", "keys.telegram.confirm.code"=>"Tu código de confirmación", "routes.auth.keys.pageTitle"=>"Entrar", "routes.news.keys.pageTitle"=>"Noticias de nuestra ciudad", "routes.polls.keys.pageTitle"=>"Encuestas", "routes.inmail.keys.pageTitle"=>"Nuevo mensaje", "keys.userRow.modalSignOutName"=>"desconectar", "routes.profile.keys.pageTitle"=>"Perfil", "keys.telegram.confirm.btnCancel"=>"Cancelar", "routes.cityToday.keys.pageTitle"=>"Ciudad hoy", "keys.telegram.confirm.btnOpenBot"=>"Abrir Citymatica bot", "routes.auth.keys.enterPhone.text"=>"Ingrese su número de teléfono, le enviaremos un código de confirmación.", "routes.complaints.keys.pageTitle"=>"Peticiones, quejas y reclamos (PQR)", "routes.auth.keys.enterPhone.label"=>"Número de teléfono", "routes.inmail.keys.pageTabs.inbox"=>"INBOX", "routes.polls.keys.pageTabs.active"=>"Activas", "routes.appointments.keys.pageTitle"=>"Equipo", "routes.auth.keys.confirmPhone.text"=>"Por favor, confirme su número de teléfono con el código que recibió por SMS.", "routes.inmail.keys.pageToolbar.add"=>"Nuevo mensaje", "routes.auth.keys.confirmPhone.label"=>"Código", "routes.auth.keys.enterPhone.btnSend"=>"Envíar", "routes.polls.keys.pageTabs.finished"=>"Terminadas", "routes.cityToday.keys.newsList.title"=>"Noticias de nuestra ciudad", "routes.polls.keys.pageTabs.suggested"=>"Recomendadas", "routes.cityToday.keys.pollsList.title"=>"Encuestas", "routes.complaints.keys.pageToolbar.add"=>"Añadir queja", "routes.complaints.routes.add.pageTitle"=>"Añadir queja", "routes.inmail.keys.pageTabs.myMessages"=>"Mis mensajes", "routes.profile.keys.pageTabs.workPlace"=>"Lugar de trabajo", "routes.profile.keys.pageToolbar.points"=>"Puntos de la ciudad", "routes.auth.keys.confirmPhone.errorText"=>"¡Codigo erroneo!", "routes.complaints.routes.entity.history"=>"História", "routes.inmail.routes.add.keys.pageTitle"=>"Agregar mensaje", "routes.polls.routes.question.keys.title"=>"Elija una de las opciones", "routes.appointments.keys.pageToolbar.add"=>"Agregar cita", "routes.auth.keys.confirmPhone.btnConfirm"=>"Confirmar", "routes.news.routes.entity.keys.pageTitle"=>"Noticias de nuestra ciudad", "routes.polls.routes.entity.keys.btnStart"=>"Iniciar", "routes.polls.routes.entity.keys.finished"=>"Terminadas", "routes.profile.keys.pageTabs.citizenData"=>"Datos de ciudadano", "routes.appointments.keys.pageTabs.planned"=>"Planificado", "routes.cityToday.keys.newsList.btnViewAll"=>"Ver todo", "routes.complaints.routes.add.form.btnSend"=>"Envíar", "routes.complaints.routes.entity.pageTitle"=>"Queja", "routes.news.routes.entity.keys.like.btnNo"=>"No", "routes.news.routes.entity.keys.like.liked"=>"Te gustó esta noticia", "routes.news.routes.entity.keys.like.title"=>"¿Le gustó esta noticia?", "routes.polls.routes.question.keys.btnNext"=>"Siguiente", "routes.profile.keys.pageTabs.personalData"=>"Datos personales", "routes.profile.keys.pageToolbar.completed"=>"Perfil completado", "routes.appointments.keys.pageTabs.previous"=>"Anterior", "routes.auth.keys.confirmPhone.btnSendAgain"=>"Enviar de nuevo", "routes.cityToday.keys.pollsList.btnViewAll"=>"Ver todo", "routes.inmail.routes.add.keys.form.btnSend"=>"Envíar", "routes.inmail.routes.entity.keys.pageTitle"=>"Mensaje", "routes.news.routes.entity.keys.like.btnYes"=>"Sí", "routes.polls.routes.entity.keys.cityPoints"=>"Puntos de la ciudad", "routes.profile.keys.pageTabs.notifications"=>"Notificaciones", "routes.complaints.routes.add.form.btnCancel"=>"Cancelar", "routes.polls.routes.question.keys.btnFinish"=>"Terminar", "routes.complaints.routes.add.form.type.label"=>"Tipo", "routes.inmail.routes.add.keys.form.btnCancel"=>"Cancelar", "routes.news.routes.entity.keys.like.disliked"=>"No le gustaron estas noticias", "routes.appointments.routes.add.keys.pageTitle"=>"Agregar cita", "routes.auth.keys.confirmPhone.btnChangeNumber"=>"Cambie el número", "routes.news.keys.pageToolbar.filter.btnFilter"=>"Filtrar", "routes.polls.routes.entity.keys.answers.title"=>"Tus respuestas", "routes.appointments.routes.add.keys.dates.title"=>"Tiempo disponible", "routes.appointments.routes.add.keys.specs.title"=>"Especialistas", "routes.complaints.routes.entity.pageToolbar.add"=>"Añadir queja", "routes.appointments.routes.entity.keys.pageTitle"=>"Cita", "routes.complaints.routes.add.form.category.label"=>"Categoria", "routes.inmail.routes.add.keys.form.message.label"=>"Mensaje", "routes.polls.routes.question.keys.modalDone.text"=>"Gracias por tomar parte en la vida de la ciudad. Tienes % puntos de ciudad", "routes.appointments.routes.add.keys.doctors.title"=>"Doctores", "routes.inmail.routes.add.keys.form.category.label"=>"Categoria", "routes.polls.routes.question.keys.modalDone.btnOk"=>"Lo tengo", "routes.polls.routes.question.keys.modalDone.title"=>"¡Hecho!", "routes.complaints.routes.add.form.type.placeholder"=>"Elige tipo ...", "routes.appointments.routes.add.keys.dates.btnChoose"=>"Elija", "routes.appointments.routes.add.keys.hospitals.title"=>"Organizaciones de medicina", "routes.appointments.routes.add.keys.specs.btnChoose"=>"Elija", "routes.complaints.routes.add.form.type.errorMessage"=>"Elija tipo", "routes.complaints.routes.entity.status.onModeration"=>"En moderación", "routes.news.keys.pageToolbar.filter.modalFilterName"=>"Filtrar", "routes.appointments.routes.entity.keys.pageTabs.info"=>"información", "routes.profile.routes.personalData.keys.form.btnSave"=>"Subir", "routes.appointments.routes.add.keys.doctors.btnChoose"=>"Elija", "routes.appointments.routes.add.keys.hospitals.btnDate"=>"Por fecha", "routes.profile.routes.notifications.keys.form.btnSave"=>"Guardar", "routes.profile.routes.workPlace.keys.form.house.label"=>"Casa", "routes.complaints.routes.add.form.category.placeholder"=>"Elegir la categoría...", "routes.inmail.routes.add.keys.form.message.placeholder"=>"Escribe tu texto aquí", "routes.polls.routes.question.keys.modalDone.btnResults"=>"Ver resultados", "routes.profile.routes.workPlace.keys.form.btnSave.text"=>"Guardar", "routes.profile.routes.workPlace.keys.form.office.label"=>"Oficina", "routes.profile.routes.workPlace.keys.form.street.label"=>"Dirección", "routes.appointments.routes.add.keys.hospitals.btnDoctor"=>"Por doctor", "routes.complaints.routes.add.form.category.errorMessage"=>"Seleccionar categoría", "routes.inmail.routes.add.keys.form.message.errorMessage"=>"Escribe tu mensaje", "routes.profile.routes.personalData.keys.form.name.label"=>"Nombre", "routes.appointments.routes.entity.keys.pageTabs.comments"=>"comentarios", "routes.inmail.routes.add.keys.form.category.errorMessage"=>"Seleccionar categoría", "routes.profile.routes.notifications.keys.form.news.label"=>"Noticias de nuestra ciudad", "routes.profile.routes.personalData.keys.form.email.label"=>"Email", "routes.profile.routes.personalData.keys.form.phone.label"=>"Teléfono", "routes.appointments.routes.entity.keys.pageTabs.anamnesis"=>"anamnesia", "routes.profile.routes.citizenData.routes.kids.keys.addBtn"=>"Añadir Hijo", "routes.profile.routes.notifications.keys.sosNumbers.label"=>"Fecha de nacimiento", "routes.profile.routes.personalData.keys.form.gender.label"=>"Sexo", "routes.profile.routes.personalData.keys.form.upload.label"=>"Subir", "routes.profile.routes.notifications.keys.sosNumbers.btnAdd"=>"Agregar números de SOS", "routes.profile.routes.personalData.keys.form.surname.label"=>"Apellidos", "routes.appointments.routes.entity.keys.pageTabs.attachments"=>"archivos adjuntos", "routes.profile.routes.citizenData.routes.house.keys.btnSave"=>"Guardar", "routes.profile.routes.workPlace.keys.form.companyName.label"=>"Nómbre de empresa", "routes.appointments.routes.entity.routes.info.keys.btnCancel"=>"Cancelar", "routes.profile.routes.citizenData.routes.vehicle.keys.addBtn"=>"Añadir vehiculo", "routes.profile.routes.notifications.keys.form.news.sms.label"=>"SMS", "routes.profile.routes.personalData.keys.form.birthdate.label"=>"Fecha de nacimiento", "routes.profile.routes.citizenData.routes.house.keys.pageTitle"=>"Casa", "routes.profile.routes.notifications.keys.form.news.push.label"=>"Push", "routes.profile.routes.citizenData.routes.house.keys.city.label"=>"Ciudad", "routes.profile.routes.notifications.keys.form.complaints.label"=>"Peticiones, quejas y reclamos (PQR)", "routes.profile.routes.notifications.keys.form.news.email.label"=>"Email", "routes.profile.routes.citizenData.routes.documents.keys.btnSave"=>"Guardar", "routes.profile.routes.citizenData.routes.house.keys.house.label"=>"Casa", "routes.profile.routes.citizenData.routes.kids.keys.modalAddName"=>"Añadir Hijo", "routes.profile.routes.citizenData.routes.vehicle.keys.pageTitle"=>"Vehículo ", "routes.profile.routes.notifications.keys.form.news.inmail.label"=>"InMail", "routes.profile.routes.notifications.keys.form.vaccination.label"=>"Vacunación", "routes.profile.routes.citizenData.routes.house.keys.street.label"=>"Dirección", "routes.profile.routes.citizenData.routes.kids.keys.modalEditName"=>"Redactar niño", "routes.profile.routes.citizenData.routes.paymentData.keys.addBtn"=>"Agregar pago", "routes.profile.routes.notifications.keys.sosNumbers.modalAddName"=>"Subir", "routes.profile.routes.personalData.keys.form.maritalStatus.label"=>"Estado civil", "routes.appointments.routes.entity.routes.info.keys.itemWhereTitle"=>"Dónde", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.btnAdd"=>"Fecha de nacimiento", "routes.profile.routes.notifications.keys.form.news.telegram.label"=>"Telegram", "routes.profile.routes.notifications.keys.sosNumbers.modalEditName"=>"Redactar contacto de emergencia", "routes.appointments.routes.entity.routes.info.keys.itemDoctorTitle"=>"Doctor", "routes.profile.routes.citizenData.routes.vehicle.keys.modalAddName"=>"Añadir vehiculo", "routes.profile.routes.notifications.keys.form.complaints.sms.label"=>"SMS", "routes.profile.routes.citizenData.routes.house.keys.apartment.label"=>"Apartamento", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.btnEdit"=>"Editar", "routes.profile.routes.citizenData.routes.vehicle.keys.modalEditName"=>"Redactar vehículo", "routes.profile.routes.notifications.keys.form.complaints.push.label"=>"Push", "routes.profile.routes.notifications.keys.form.vaccination.sms.label"=>"SMS", "routes.profile.routes.personalData.keys.form.gender.keys.male.label"=>"Hombre", "routes.profile.routes.citizenData.routes.documents.keys.idCard.label"=>"Documento de identidad", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.btnCancel"=>"Cancelar", "routes.profile.routes.citizenData.routes.vehicle.keys.formAdd.btnAdd"=>"Añadir", "routes.profile.routes.notifications.keys.form.complaints.email.label"=>"Email", "routes.profile.routes.notifications.keys.form.vaccination.push.label"=>"Push", "routes.profile.routes.citizenData.routes.house.keys.gasMetering.label"=>"Metrónomo de gas", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.name.label"=>"Nombre", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.btnRemove"=>"Retirar", "routes.profile.routes.citizenData.routes.paymentData.keys.form.btnAdd"=>"Añadir", "routes.profile.routes.citizenData.routes.vehicle.keys.formEdit.btnAdd"=>"Añadir", "routes.profile.routes.notifications.keys.form.complaints.inmail.label"=>"InMail", "routes.profile.routes.notifications.keys.form.vaccination.email.label"=>"Email", "routes.profile.routes.personalData.keys.form.gender.keys.female.label"=>"Mujer", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.name.label"=>"Nombre", "routes.profile.routes.citizenData.routes.paymentData.keys.form.btnEdit"=>"Cambio", "routes.profile.routes.citizenData.routes.paymentData.keys.modalAddName"=>"Agregar pago", "routes.profile.routes.notifications.keys.form.vaccination.inmail.label"=>"InMail", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.name.label"=>"Nombre", "routes.profile.routes.citizenData.routes.house.keys.waterMetering.label"=>"Metrónomo de agua", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.gender.label"=>"Sexo", "routes.profile.routes.citizenData.routes.paymentData.keys.modalEditName"=>"Editar pago", "routes.profile.routes.citizenData.routes.vehicle.keys.formAdd.btnCancel"=>"Cancelar", "routes.profile.routes.notifications.keys.form.complaints.telegram.label"=>"Telegram", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.btnAdd.text"=>"Añadir", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.name.format"=>"Formato de nombre incorrecto", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.surname.label"=>"Apellidos", "routes.profile.routes.citizenData.routes.paymentData.keys.form.CVC.label"=>"CVC / CVV", "routes.profile.routes.citizenData.routes.paymentData.keys.form.btnCancel"=>"Cancelar", "routes.profile.routes.citizenData.routes.paymentData.keys.form.btnRemove"=>"Retirar", "routes.profile.routes.citizenData.routes.vehicle.keys.formEdit.btnRemove"=>"Retirar", "routes.profile.routes.notifications.keys.form.vaccination.telegram.label"=>"Telegram", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.btnEdit.text"=>"Editar", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.surname.label"=>"Apellidos", "routes.profile.routes.citizenData.routes.vehicle.keys.formAdd.model.label"=>"Modelo", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.name.required"=>"Ingrese su nombre", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.birthdate.label"=>"Fecha de nacimiento", "routes.profile.routes.citizenData.routes.vehicle.keys.formEdit.model.label"=>"Modelo", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.btnCancel.text"=>"Cancelar", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.btnRemove.text"=>"Retirar", "routes.profile.routes.citizenData.routes.documents.keys.driverLicense.label"=>"Licencia de conducción", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.birthdate.label"=>"Fecha de nacimiento", "routes.profile.routes.citizenData.routes.paymentData.keys.form.CVC.required"=>"Ingrese CVC / CVV", "routes.profile.routes.citizenData.routes.documents.keys.socialSecurity.label"=>"Seguridad social", "routes.profile.routes.personalData.keys.form.maritalStatus.keys.single.label"=>"Soltero/a", "routes.profile.routes.citizenData.routes.house.keys.electricityMetering.label"=>"Metrónomo de electricidad", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.gender.male.label"=>"Hombre", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.phoneNumber.label"=>"Número de teléfono", "routes.profile.routes.personalData.keys.form.maritalStatus.keys.married.label"=>"Casado/a", "routes.profile.routes.personalData.keys.form.maritalStatus.keys.widowed.label"=>"Viudo/a", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.gender.female.label"=>"Mujer", "routes.profile.routes.citizenData.routes.paymentData.keys.form.cardNumber.label"=>"Número de tarjeta", "routes.profile.routes.citizenData.routes.paymentData.keys.form.holderName.label"=>"Nombre de detentor", "routes.profile.routes.citizenData.routes.paymentData.keys.form.holderName.format"=>"Formato de nombre de titular incorrecto", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.phoneNumber.required"=>"Ingresa número telefónico", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.gender.keys.male.label"=>"Hombre", "routes.profile.routes.citizenData.routes.paymentData.keys.form.cardNumber.required"=>"Ingrese el número de tarjeta", "routes.profile.routes.citizenData.routes.paymentData.keys.form.holderName.required"=>"Ingrese el nombre del titular", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.gender.keys.female.label"=>"Mujer", "routes.profile.routes.citizenData.routes.paymentData.keys.form.expirationDate.label"=>"Fecha de caducidad ('00 / 0000 ')", "routes.profile.routes.citizenData.routes.paymentData.keys.form.expirationDate.format"=>"Fecha de vencimiento incorrecta", "routes.profile.routes.citizenData.routes.paymentData.keys.form.expirationDate.required"=>"Ingrese la fecha de vencimiento ('00 / 0000 ')", "routes.profile.routes.citizenData.routes.vehicle.keys.formAdd.registrationNumber.label"=>"Número de registro", "routes.profile.routes.citizenData.routes.vehicle.keys.formEdit.registrationNumber.label"=>"Número de registro"	2018-02-22 12:54:05.354086
en	"keys.dayMap.0"=>"Sun", "keys.dayMap.1"=>"Mon", "keys.dayMap.2"=>"Tue", "keys.dayMap.3"=>"Wed", "keys.dayMap.4"=>"Thu", "keys.dayMap.5"=>"Fri", "keys.dayMap.6"=>"Sat", "keys.menu.news"=>"News", "keys.menu.polls"=>"Polls", "keys.mounthMap.0"=>"jan", "keys.mounthMap.1"=>"feb", "keys.mounthMap.2"=>"mar", "keys.mounthMap.3"=>"apr", "keys.mounthMap.4"=>"may", "keys.mounthMap.5"=>"jun", "keys.mounthMap.6"=>"jul", "keys.mounthMap.7"=>"aug", "keys.mounthMap.8"=>"sep", "keys.mounthMap.9"=>"oct", "keys.mounthMap.10"=>"nov", "keys.mounthMap.11"=>"dec", "keys.signOut.text"=>"Do you want to exit?", "keys.telegram.add"=>"Add telegram account", "keys.menu.cityToday"=>"City today", "keys.telegram.title"=>"Telegram", "keys.menu.cityInmail"=>"City inmail", "keys.menu.complaints"=>"Complaints", "keys.signOut.btnExit"=>"Exit", "keys.userRow.btnExit"=>"Exit", "keys.menu.appointments"=>"My appointments", "keys.signOut.btnCancel"=>"Cancel", "keys.telegram.verified"=>"Telegram account verified", "keys.telegram.modalName"=>"Telegram", "keys.telegram.confirm.code"=>"Your confirmation code", "routes.auth.keys.pageTitle"=>"Sign in", "routes.news.keys.pageTitle"=>"News", "routes.polls.keys.pageTitle"=>"Polls", "routes.inmail.keys.pageTitle"=>"City inmail", "keys.userRow.modalSignOutName"=>"Sign out", "routes.profile.keys.pageTitle"=>"Profile", "keys.telegram.confirm.btnCancel"=>"Cancel", "routes.cityToday.keys.pageTitle"=>"City today", "keys.telegram.confirm.btnOpenBot"=>"Open citymatica bot", "routes.auth.keys.enterPhone.text"=>"Input your phone number, we'll send you a confirmation code.", "routes.complaints.keys.pageTitle"=>"Complaints", "routes.auth.keys.enterPhone.label"=>"Phone number", "routes.inmail.keys.pageTabs.inbox"=>"Inbox", "routes.polls.keys.pageTabs.active"=>"Active", "routes.appointments.keys.pageTitle"=>"Appointments", "routes.auth.keys.confirmPhone.text"=>"Please, confirm your phone number with code you received via SMS.", "routes.inmail.keys.pageToolbar.add"=>"New Message", "routes.auth.keys.confirmPhone.label"=>"Code", "routes.auth.keys.enterPhone.btnSend"=>"Send", "routes.polls.keys.pageTabs.finished"=>"Finished", "routes.cityToday.keys.newsList.title"=>"News", "routes.polls.keys.pageTabs.suggested"=>"Suggested", "routes.cityToday.keys.pollsList.title"=>"Polls", "routes.complaints.keys.pageToolbar.add"=>"Add complaint", "routes.complaints.routes.add.pageTitle"=>"Add complaint", "routes.inmail.keys.pageTabs.myMessages"=>"My messages", "routes.profile.keys.pageTabs.workPlace"=>"Work place", "routes.profile.keys.pageToolbar.points"=>"City points", "routes.complaints.routes.entity.history"=>"History", "routes.inmail.routes.add.keys.pageTitle"=>"Add message", "routes.polls.routes.question.keys.title"=>"Choose one of the variants", "routes.appointments.keys.pageToolbar.add"=>"Add appointment", "routes.auth.keys.confirmPhone.btnConfirm"=>"Confirm", "routes.news.routes.entity.keys.pageTitle"=>"news", "routes.polls.routes.entity.keys.btnStart"=>"Start", "routes.polls.routes.entity.keys.finished"=>"Finished", "routes.profile.keys.pageTabs.citizenData"=>"Citizen data", "routes.appointments.keys.pageTabs.planned"=>"Planned", "routes.cityToday.keys.newsList.btnViewAll"=>"View All", "routes.complaints.routes.add.form.btnSend"=>"Send", "routes.complaints.routes.entity.pageTitle"=>"Complaint", "routes.news.routes.entity.keys.like.btnNo"=>"No", "routes.news.routes.entity.keys.like.liked"=>"You liked this news", "routes.news.routes.entity.keys.like.title"=>"Did you like this news?", "routes.polls.routes.question.keys.btnNext"=>"Next", "routes.profile.keys.pageTabs.personalData"=>"Personal data", "routes.profile.keys.pageToolbar.completed"=>"Profile completed", "routes.appointments.keys.pageTabs.previous"=>"Previous", "routes.auth.keys.confirmPhone.btnSendAgain"=>"Send again", "routes.cityToday.keys.pollsList.btnViewAll"=>"View All", "routes.inmail.routes.add.keys.form.btnSend"=>"Send", "routes.inmail.routes.entity.keys.pageTitle"=>"Message", "routes.news.routes.entity.keys.like.btnYes"=>"Yes", "routes.polls.routes.entity.keys.cityPoints"=>"city points", "routes.profile.keys.pageTabs.notifications"=>"Notifications", "routes.complaints.routes.add.form.btnCancel"=>"Cancel", "routes.polls.routes.question.keys.btnFinish"=>"Finish", "routes.complaints.routes.add.form.type.label"=>"Type", "routes.inmail.routes.add.keys.form.btnCancel"=>"Cancel", "routes.news.routes.entity.keys.like.disliked"=>"You disliked this news", "routes.appointments.routes.add.keys.pageTitle"=>"Add appointment", "routes.auth.keys.confirmPhone.btnChangeNumber"=>"Change number", "routes.news.keys.pageToolbar.filter.btnFilter"=>"Filter", "routes.polls.routes.entity.keys.answers.title"=>"Your answers", "routes.appointments.routes.add.keys.dates.title"=>"Available time", "routes.appointments.routes.add.keys.specs.title"=>"Specialists", "routes.complaints.routes.entity.pageToolbar.add"=>"Add complaint", "routes.appointments.routes.entity.keys.pageTitle"=>"Appointment", "routes.complaints.routes.add.form.category.label"=>"Category", "routes.inmail.routes.add.keys.form.message.label"=>"Message", "routes.polls.routes.question.keys.modalDone.text"=>"Thank you for taking part in city life. You've got % city points", "routes.appointments.routes.add.keys.doctors.title"=>"Doctors", "routes.inmail.routes.add.keys.form.category.label"=>"Category", "routes.polls.routes.question.keys.modalDone.btnOk"=>"Got it", "routes.polls.routes.question.keys.modalDone.title"=>"Done!", "routes.complaints.routes.add.form.type.placeholder"=>"Choose type...", "routes.appointments.routes.add.keys.dates.btnChoose"=>"Choose", "routes.appointments.routes.add.keys.hospitals.title"=>"Medical organisations", "routes.appointments.routes.add.keys.specs.btnChoose"=>"Choose", "routes.complaints.routes.add.form.type.errorMessage"=>"Choose type", "routes.complaints.routes.entity.status.onModeration"=>"On moderation", "routes.news.keys.pageToolbar.filter.modalFilterName"=>"Filter", "routes.appointments.routes.entity.keys.pageTabs.info"=>"info", "routes.profile.routes.personalData.keys.form.btnSave"=>"Save", "routes.appointments.routes.add.keys.doctors.btnChoose"=>"Choose", "routes.appointments.routes.add.keys.hospitals.btnDate"=>"On the date", "routes.profile.routes.notifications.keys.form.btnSave"=>"Save", "routes.profile.routes.workPlace.keys.form.house.label"=>"House", "routes.complaints.routes.add.form.category.placeholder"=>"Choose category...", "routes.inmail.routes.add.keys.form.message.placeholder"=>"Write your text here", "routes.polls.routes.question.keys.modalDone.btnResults"=>"See results", "routes.profile.routes.workPlace.keys.form.btnSave.text"=>"Save", "routes.profile.routes.workPlace.keys.form.office.label"=>"Office", "routes.profile.routes.workPlace.keys.form.street.label"=>"Street", "routes.appointments.routes.add.keys.hospitals.btnDoctor"=>"To the doctor", "routes.complaints.routes.add.form.category.errorMessage"=>"Choose category", "routes.inmail.routes.add.keys.form.message.errorMessage"=>"Type your message", "routes.profile.routes.personalData.keys.form.name.label"=>"Name", "routes.appointments.routes.entity.keys.pageTabs.comments"=>"comments", "routes.inmail.routes.add.keys.form.category.errorMessage"=>"Choose category", "routes.profile.routes.notifications.keys.form.news.label"=>"News", "routes.profile.routes.personalData.keys.form.email.label"=>"E-mail", "routes.profile.routes.personalData.keys.form.phone.label"=>"Phone", "routes.appointments.routes.entity.keys.pageTabs.anamnesis"=>"anamnesis", "routes.profile.routes.citizenData.routes.kids.keys.addBtn"=>"Add kid", "routes.profile.routes.notifications.keys.sosNumbers.label"=>"SOS numbers", "routes.profile.routes.personalData.keys.form.gender.label"=>"Gender", "routes.profile.routes.personalData.keys.form.upload.label"=>"Upload", "routes.profile.routes.notifications.keys.sosNumbers.btnAdd"=>"Add SOS numbers", "routes.profile.routes.personalData.keys.form.surname.label"=>"Surname", "routes.appointments.routes.entity.keys.pageTabs.attachments"=>"attachments", "routes.profile.routes.citizenData.routes.house.keys.btnSave"=>"Save", "routes.profile.routes.workPlace.keys.form.companyName.label"=>"Company name", "routes.appointments.routes.entity.routes.info.keys.btnCancel"=>"Cancel", "routes.profile.routes.citizenData.routes.vehicle.keys.addBtn"=>"Add vehicle", "routes.profile.routes.notifications.keys.form.news.sms.label"=>"SMS", "routes.profile.routes.personalData.keys.form.birthdate.label"=>"Birthdate", "routes.profile.routes.citizenData.routes.house.keys.pageTitle"=>"House", "routes.profile.routes.notifications.keys.form.news.push.label"=>"Push", "routes.profile.routes.citizenData.routes.house.keys.city.label"=>"City", "routes.profile.routes.notifications.keys.form.complaints.label"=>"Complaints", "routes.profile.routes.notifications.keys.form.news.email.label"=>"E-mail", "routes.profile.routes.citizenData.routes.documents.keys.btnSave"=>"Save", "routes.profile.routes.citizenData.routes.house.keys.house.label"=>"House", "routes.profile.routes.citizenData.routes.kids.keys.modalAddName"=>"Add kid", "routes.profile.routes.citizenData.routes.vehicle.keys.pageTitle"=>"Vehicle", "routes.profile.routes.notifications.keys.form.news.inmail.label"=>"Inmail", "routes.profile.routes.notifications.keys.form.vaccination.label"=>"Vaccination", "routes.profile.routes.citizenData.routes.house.keys.street.label"=>"Street", "routes.profile.routes.citizenData.routes.kids.keys.modalEditName"=>"Edit kid", "routes.profile.routes.citizenData.routes.paymentData.keys.addBtn"=>"Add payment", "routes.profile.routes.notifications.keys.sosNumbers.modalAddName"=>"Add sos number", "routes.profile.routes.personalData.keys.form.maritalStatus.label"=>"Marital status", "routes.appointments.routes.entity.routes.info.keys.itemWhereTitle"=>"Where", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.btnAdd"=>"Add", "routes.profile.routes.notifications.keys.form.news.telegram.label"=>"Telegram", "routes.profile.routes.notifications.keys.sosNumbers.modalEditName"=>"Edit sos number", "routes.appointments.routes.entity.routes.info.keys.itemDoctorTitle"=>"Doctor", "routes.profile.routes.citizenData.routes.vehicle.keys.modalAddName"=>"Add vehicle", "routes.profile.routes.notifications.keys.form.complaints.sms.label"=>"SMS", "routes.profile.routes.citizenData.routes.house.keys.apartment.label"=>"Apartment", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.btnEdit"=>"Edit", "routes.profile.routes.citizenData.routes.vehicle.keys.modalEditName"=>"Edit vehicle", "routes.profile.routes.notifications.keys.form.complaints.push.label"=>"Push", "routes.profile.routes.notifications.keys.form.vaccination.sms.label"=>"SMS", "routes.profile.routes.personalData.keys.form.gender.keys.male.label"=>"Male", "routes.profile.routes.citizenData.routes.documents.keys.idCard.label"=>"Id card", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.btnCancel"=>"Cancel", "routes.profile.routes.citizenData.routes.vehicle.keys.formAdd.btnAdd"=>"Add", "routes.profile.routes.notifications.keys.form.complaints.email.label"=>"E-mail", "routes.profile.routes.notifications.keys.form.vaccination.push.label"=>"Push", "routes.profile.routes.notifications.keys.sosNumbers.formEdit.btnEdit"=>"Edit", "routes.profile.routes.citizenData.routes.house.keys.gasMetering.label"=>"Gas metering", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.name.label"=>"Name", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.btnRemove"=>"Remove", "routes.profile.routes.citizenData.routes.vehicle.keys.formEdit.btnAdd"=>"Add", "routes.profile.routes.notifications.keys.form.complaints.inmail.label"=>"Inmail", "routes.profile.routes.notifications.keys.form.vaccination.email.label"=>"E-mail", "routes.profile.routes.personalData.keys.form.gender.keys.female.label"=>"Female", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.name.label"=>"Name", "routes.profile.routes.citizenData.routes.paymentData.keys.modalAddName"=>"Add payment", "routes.profile.routes.notifications.keys.form.vaccination.inmail.label"=>"Inmail", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.name.label"=>"Name", "routes.profile.routes.notifications.keys.sosNumbers.formEdit.btnRemove"=>"Remove", "routes.profile.routes.citizenData.routes.house.keys.waterMetering.label"=>"Water metering", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.gender.label"=>"Gender", "routes.profile.routes.citizenData.routes.paymentData.keys.modalEditName"=>"Edit payment", "routes.profile.routes.citizenData.routes.vehicle.keys.formAdd.btnCancel"=>"Cancel", "routes.profile.routes.notifications.keys.form.complaints.telegram.label"=>"Telegram", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.btnAdd.text"=>"Add", "routes.profile.routes.notifications.keys.sosNumbers.formEdit.name.label"=>"Name", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.surname.label"=>"surname", "routes.profile.routes.citizenData.routes.paymentData.keys.formAdd.btnAdd"=>"Add", "routes.profile.routes.citizenData.routes.vehicle.keys.formEdit.btnRemove"=>"Remove", "routes.profile.routes.notifications.keys.form.vaccination.telegram.label"=>"Telegram", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.surname.label"=>"surname", "routes.profile.routes.citizenData.routes.vehicle.keys.formAdd.model.label"=>"Model", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.birthdate.label"=>"Birthdate", "routes.profile.routes.citizenData.routes.paymentData.keys.formEdit.btnEdit"=>"Edit", "routes.profile.routes.citizenData.routes.vehicle.keys.formEdit.model.label"=>"Model", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.btnCancel.text"=>"Cancel", "routes.profile.routes.citizenData.routes.documents.keys.driverLicense.label"=>"Driver license", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.birthdate.label"=>"Birthdate", "routes.profile.routes.citizenData.routes.paymentData.keys.formAdd.CVC.label"=>"CVC / CVV", "routes.profile.routes.citizenData.routes.paymentData.keys.formAdd.btnCancel"=>"Cancel", "routes.profile.routes.citizenData.routes.documents.keys.socialSecurity.label"=>"Social security", "routes.profile.routes.citizenData.routes.paymentData.keys.formEdit.CVC.label"=>"CVC / CVV", "routes.profile.routes.citizenData.routes.paymentData.keys.formEdit.btnRemove"=>"Remove", "routes.profile.routes.personalData.keys.form.maritalStatus.keys.single.label"=>"Single", "routes.profile.routes.citizenData.routes.house.keys.electricityMetering.label"=>"Electricity metering", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.gender.male.label"=>"Male", "routes.profile.routes.notifications.keys.sosNumbers.formAdd.phoneNumber.label"=>"Phone Number", "routes.profile.routes.personalData.keys.form.maritalStatus.keys.married.label"=>"Married", "routes.profile.routes.personalData.keys.form.maritalStatus.keys.widowed.label"=>"Widowed", "routes.profile.routes.notifications.keys.sosNumbers.formEdit.phoneNumber.label"=>"Phone Number", "routes.profile.routes.citizenData.routes.kids.keys.formEdit.gender.female.label"=>"Female", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.gender.keys.male.label"=>"Male", "routes.profile.routes.citizenData.routes.paymentData.keys.formAdd.cardNumber.label"=>"Card number", "routes.profile.routes.citizenData.routes.paymentData.keys.formAdd.holderName.label"=>"Holder name", "routes.profile.routes.citizenData.routes.kids.keys.formAdd.gender.keys.female.label"=>"Female", "routes.profile.routes.citizenData.routes.paymentData.keys.formEdit.cardNumber.label"=>"Card number", "routes.profile.routes.citizenData.routes.paymentData.keys.formEdit.holderName.label"=>"Holder name", "routes.profile.routes.citizenData.routes.paymentData.keys.formAdd.expirationDate.label"=>"Expiration date ('00/0000')", "routes.profile.routes.citizenData.routes.vehicle.keys.formAdd.registrationNumber.label"=>"Registration number", "routes.profile.routes.citizenData.routes.paymentData.keys.formEdit.expirationDate.label"=>"Expiration date (u201C00/0000u201D)", "routes.profile.routes.citizenData.routes.vehicle.keys.formEdit.registrationNumber.label"=>"Registration number"	2018-02-22 12:54:05.454348
\.


--
-- Data for Name: vaccination_plan; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.vaccination_plan (id, title, description, fromdt, todt, statusid, lat, lng, place_name, place_addr, user_id, operator_id, recommendations, type_id, reminder) FROM stdin;
\.


--
-- Name: vaccination_plan_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.vaccination_plan_id_seq', 1, false);


--
-- Data for Name: vaccination_plan_type; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.vaccination_plan_type (id, name, notification_message_template, notification_subject_template) FROM stdin;
1	Visit	You have vaccination \\"${title}\\" tomorrow	Notification about vaccination
2	Vaccination	You have vaccination \\"${title}\\" tomorrow	Notification about vaccination
3	Checkup	You have vaccination \\"${title}\\" tomorrow	Notification about vaccination
\.


--
-- Name: vaccination_plan_type_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.vaccination_plan_type_id_seq', 1, false);


--
-- Data for Name: vaccination_status; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.vaccination_status (id, name) FROM stdin;
1	new
2	planned
3	missed
4	done
\.


--
-- Name: vaccination_status_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.vaccination_status_id_seq', 1, false);


--
-- Data for Name: water_meter; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.water_meter (id, type, number, house_id) FROM stdin;
\.


--
-- Name: water_meter_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.water_meter_id_seq', 1, false);


--
-- Data for Name: water_meter_value; Type: TABLE DATA; Schema: cityservices; Owner: -
--

COPY cityservices.water_meter_value (id, value, day, meter_id) FROM stdin;
\.


--
-- Name: water_meter_value_id_seq; Type: SEQUENCE SET; Schema: cityservices; Owner: -
--

SELECT pg_catalog.setval('cityservices.water_meter_value_id_seq', 1, false);


--
-- Data for Name: chat; Type: TABLE DATA; Schema: cityservices_chats; Owner: -
--

COPY cityservices_chats.chat (id, user_id, channel_id, message_count, new_user_message_count, new_operator_message_count, updated_at) FROM stdin;
\.


--
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: cityservices_chats; Owner: -
--

SELECT pg_catalog.setval('cityservices_chats.chat_id_seq', 1, false);


--
-- Data for Name: chat_message; Type: TABLE DATA; Schema: cityservices_chats; Owner: -
--

COPY cityservices_chats.chat_message (id, chat_id, message, message_type, created_at, sent, received, outcome) FROM stdin;
\.


--
-- Name: chat_message_id_seq; Type: SEQUENCE SET; Schema: cityservices_chats; Owner: -
--

SELECT pg_catalog.setval('cityservices_chats.chat_message_id_seq', 1, false);


--
-- Data for Name: communication; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.communication (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: communication_id_seq; Type: SEQUENCE SET; Schema: cityservices_communication; Owner: -
--

SELECT pg_catalog.setval('cityservices_communication.communication_id_seq', 1, false);


--
-- Data for Name: communication_journal; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.communication_journal (id, communication_id, operator_id, action, message, ip, created_at) FROM stdin;
\.


--
-- Name: communication_journal_id_seq; Type: SEQUENCE SET; Schema: cityservices_communication; Owner: -
--

SELECT pg_catalog.setval('cityservices_communication.communication_journal_id_seq', 1, false);


--
-- Data for Name: communication_statistic_type; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.communication_statistic_type (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: communication_statistic_type_id_seq; Type: SEQUENCE SET; Schema: cityservices_communication; Owner: -
--

SELECT pg_catalog.setval('cityservices_communication.communication_statistic_type_id_seq', 1, false);


--
-- Data for Name: communication_statistic_value; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.communication_statistic_value (id, communication_id, communication_statistic_type_id, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: communication_statistic_value_id_seq; Type: SEQUENCE SET; Schema: cityservices_communication; Owner: -
--

SELECT pg_catalog.setval('cityservices_communication.communication_statistic_value_id_seq', 1, false);


--
-- Data for Name: distribution; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.distribution (id, communication_id, distribution_template_group_id, distribution_group_id, name, description, created_at, updated_at, info, next_execute_time, status, cron_expression, use_cron_expression, minute_offset) FROM stdin;
\.


--
-- Data for Name: distribution_channel; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.distribution_channel (id, name, description, created_at, updated_at) FROM stdin;
1	EMAIL	email channel	2018-02-22 12:26:49.817725	2018-02-22 12:26:49.817725
2	SMS	sms channel	2018-02-22 12:26:49.817725	2018-02-22 12:26:49.817725
3	PUSH	push channel	2018-02-22 12:26:49.817725	2018-02-22 12:26:49.817725
4	INMAIL	notifier messages	2018-02-22 12:26:50.633829	2018-02-22 12:26:50.633829
\.


--
-- Name: distribution_channel_id_seq; Type: SEQUENCE SET; Schema: cityservices_communication; Owner: -
--

SELECT pg_catalog.setval('cityservices_communication.distribution_channel_id_seq', 1, false);


--
-- Data for Name: distribution_group; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.distribution_group (id, communication_id, condition, description, created_at, updated_at, name, static_group) FROM stdin;
\.


--
-- Data for Name: distribution_group_has_user; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.distribution_group_has_user (distribution_group_id, user_id) FROM stdin;
\.


--
-- Name: distribution_group_id_seq; Type: SEQUENCE SET; Schema: cityservices_communication; Owner: -
--

SELECT pg_catalog.setval('cityservices_communication.distribution_group_id_seq', 1, false);


--
-- Data for Name: distribution_has_distribution_template; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.distribution_has_distribution_template (distribution_template_id, distribution_id) FROM stdin;
\.


--
-- Name: distribution_id_seq; Type: SEQUENCE SET; Schema: cityservices_communication; Owner: -
--

SELECT pg_catalog.setval('cityservices_communication.distribution_id_seq', 1, false);


--
-- Data for Name: distribution_journal; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.distribution_journal (id, distribution_id, operator_id, action, message, created_at) FROM stdin;
\.


--
-- Name: distribution_journal_id_seq; Type: SEQUENCE SET; Schema: cityservices_communication; Owner: -
--

SELECT pg_catalog.setval('cityservices_communication.distribution_journal_id_seq', 1, false);


--
-- Data for Name: distribution_log; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.distribution_log (id, date, message, distribution_id) FROM stdin;
\.


--
-- Name: distribution_log_id_seq; Type: SEQUENCE SET; Schema: cityservices_communication; Owner: -
--

SELECT pg_catalog.setval('cityservices_communication.distribution_log_id_seq', 1, false);


--
-- Data for Name: distribution_template; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.distribution_template (id, group_id, channel_id, template) FROM stdin;
\.


--
-- Data for Name: distribution_template_group; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.distribution_template_group (id, communication_id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: distribution_template_id_seq; Type: SEQUENCE SET; Schema: cityservices_communication; Owner: -
--

SELECT pg_catalog.setval('cityservices_communication.distribution_template_id_seq', 1, false);


--
-- Name: distribution_template_id_seq1; Type: SEQUENCE SET; Schema: cityservices_communication; Owner: -
--

SELECT pg_catalog.setval('cityservices_communication.distribution_template_id_seq1', 1, false);


--
-- Data for Name: qrtz_blob_triggers; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
\.


--
-- Data for Name: qrtz_calendars; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
\.


--
-- Data for Name: qrtz_cron_triggers; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
\.


--
-- Data for Name: qrtz_fired_triggers; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
\.


--
-- Data for Name: qrtz_job_details; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
\.


--
-- Data for Name: qrtz_locks; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.qrtz_locks (sched_name, lock_name) FROM stdin;
schedulerFactoryBean	TRIGGER_ACCESS
\.


--
-- Data for Name: qrtz_paused_trigger_grps; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
\.


--
-- Data for Name: qrtz_scheduler_state; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
\.


--
-- Data for Name: qrtz_simple_triggers; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
\.


--
-- Data for Name: qrtz_simprop_triggers; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
\.


--
-- Data for Name: qrtz_triggers; Type: TABLE DATA; Schema: cityservices_communication; Owner: -
--

COPY cityservices_communication.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
\.


--
-- Data for Name: engagement_index; Type: TABLE DATA; Schema: cityservices_metric; Owner: -
--

COPY cityservices_metric.engagement_index (id, date, read_news, like_news, dislike_news, polls_finished, complaint, chat_messages, inmail_messages, total_users, "time") FROM stdin;
\.


--
-- Name: engagement_index_id_seq; Type: SEQUENCE SET; Schema: cityservices_metric; Owner: -
--

SELECT pg_catalog.setval('cityservices_metric.engagement_index_id_seq', 100, true);


--
-- Data for Name: event; Type: TABLE DATA; Schema: cityservices_metric; Owner: -
--

COPY cityservices_metric.event (id, type, date, data) FROM stdin;
\.


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: cityservices_metric; Owner: -
--

SELECT pg_catalog.setval('cityservices_metric.event_id_seq', 1, false);


--
-- Data for Name: profile_info_index; Type: TABLE DATA; Schema: cityservices_metric; Owner: -
--

COPY cityservices_metric.profile_info_index (id, date, total_users, users_with_email, users_with_car, users_with_home_address, users_with_children_info, average_fill_percent, "time") FROM stdin;
\.


--
-- Name: profile_info_index_id_seq; Type: SEQUENCE SET; Schema: cityservices_metric; Owner: -
--

SELECT pg_catalog.setval('cityservices_metric.profile_info_index_id_seq', 100, true);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: email; Owner: -
--

COPY email.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	email_service	classpath:database/email/db.changeset.sql	2017-06-23 13:57:22.669192	1	EXECUTED	7:c6c1ee8b7abb2bc685e02f3246d695b0	sql		\N	3.5.3	common	\N	8226241768
2	email_service	classpath:database/email/db.changeset.sql	2017-06-23 13:57:33.179998	2	EXECUTED	7:1070d457c3800c625ecb9dd47341b3a4	sql		\N	3.5.3	common	\N	8226241768
3	email_service	classpath:database/email/db.changeset.sql	2017-06-23 13:57:33.226117	3	EXECUTED	7:1e57066f43b019c8f88f698b5719d7d0	sql		\N	3.5.3	common	\N	8226241768
4	email_service	classpath:database/email/db.changeset.sql	2017-06-23 13:57:33.362415	4	EXECUTED	7:a5d12d4ab090fe9e697113afa768f38d	sql		\N	3.5.3	common	\N	8226241768
6	email_service	classpath:database/email/db.changeset.sql	2017-06-23 13:57:33.399586	5	EXECUTED	7:e780680e491da831ce5c675a196ae6b1	sql		\N	3.5.3	common	\N	8226241768
7	email_service	classpath:database/email/db.changeset.sql	2017-06-23 13:57:33.456231	6	EXECUTED	7:c462a44e5a8c27b41df8f397d7e9f48b	sql		\N	3.5.3	common	\N	8226241768
change_application_group_to_id	email_service	classpath:database/email/db.changeset.sql	2017-06-23 13:57:33.560098	7	EXECUTED	7:20aa5e1d2d6013d5d4861d0fa4102c79	sql		\N	3.5.3	common	\N	8226241768
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: email; Owner: -
--

COPY email.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: email_account; Type: TABLE DATA; Schema: email; Owner: -
--

COPY email.email_account (id, description, application_group, default_from_name, address, auth, username, password, update_date, smtp_server_id) FROM stdin;
\.


--
-- Name: email_account_id_seq; Type: SEQUENCE SET; Schema: email; Owner: -
--

SELECT pg_catalog.setval('email.email_account_id_seq', 16, true);


--
-- Data for Name: smtp_server; Type: TABLE DATA; Schema: email; Owner: -
--

COPY email.smtp_server (id, description, host, port, encryption, update_date) FROM stdin;
\.


--
-- Name: smtp_server_id_seq; Type: SEQUENCE SET; Schema: email; Owner: -
--

SELECT pg_catalog.setval('email.smtp_server_id_seq', 3, true);


--
-- Data for Name: address_cache; Type: TABLE DATA; Schema: gis; Owner: -
--

COPY gis.address_cache (lat, lon, address) FROM stdin;
\.


--
-- Data for Name: bucket_info; Type: TABLE DATA; Schema: large_obj_storage; Owner: -
--

COPY large_obj_storage.bucket_info (id, name, application_group_id) FROM stdin;
\.


--
-- Name: bucket_info_id_seq; Type: SEQUENCE SET; Schema: large_obj_storage; Owner: -
--

SELECT pg_catalog.setval('large_obj_storage.bucket_info_id_seq', 1, false);


--
-- Data for Name: file_info; Type: TABLE DATA; Schema: large_obj_storage; Owner: -
--

COPY large_obj_storage.file_info (id, name, public_file, bucket_id, folder) FROM stdin;
\.


--
-- Name: file_info_id_seq; Type: SEQUENCE SET; Schema: large_obj_storage; Owner: -
--

SELECT pg_catalog.setval('large_obj_storage.file_info_id_seq', 1, false);


--
-- Data for Name: config; Type: TABLE DATA; Schema: mobile_store; Owner: -
--

COPY mobile_store.config (id, data, ttl, last_modified, mobile_application_id) FROM stdin;
\.


--
-- Name: config_id_seq; Type: SEQUENCE SET; Schema: mobile_store; Owner: -
--

SELECT pg_catalog.setval('mobile_store.config_id_seq', 18, true);


--
-- Data for Name: image; Type: TABLE DATA; Schema: mobile_store; Owner: -
--

COPY mobile_store.image (id, data, is_main, mobile_application_id) FROM stdin;
\.


--
-- Data for Name: message_bundle; Type: TABLE DATA; Schema: mobile_store; Owner: -
--

COPY mobile_store.message_bundle (id, is_default, last_modified, locale, ttl, name_value_parameter_map, application_group_id) FROM stdin;
\.


--
-- Name: message_bundle_id_seq; Type: SEQUENCE SET; Schema: mobile_store; Owner: -
--

SELECT pg_catalog.setval('mobile_store.message_bundle_id_seq', 6, true);


--
-- Data for Name: view; Type: TABLE DATA; Schema: mobile_store; Owner: -
--

COPY mobile_store.view (id, name, data, last_modified, ttl, mobile_application_id, meta_data, layout_type, application_group_id, create_at) FROM stdin;
\.


--
-- Name: view_id_seq; Type: SEQUENCE SET; Schema: mobile_store; Owner: -
--

SELECT pg_catalog.setval('mobile_store.view_id_seq', 1, true);


--
-- Data for Name: log; Type: TABLE DATA; Schema: notification; Owner: -
--

COPY notification.log (id, type, level, data, result, recipient, created_at) FROM stdin;
\.


--
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: notification; Owner: -
--

SELECT pg_catalog.setval('notification.log_id_seq', 1, false);


--
-- Data for Name: answer; Type: TABLE DATA; Schema: poll; Owner: -
--

COPY poll.answer (id, question_id, text, index, description, created_at, updated_at, image_link, type, input_type) FROM stdin;
\.


--
-- Name: answer_id_seq; Type: SEQUENCE SET; Schema: poll; Owner: -
--

SELECT pg_catalog.setval('poll.answer_id_seq', 1, false);


--
-- Data for Name: poll; Type: TABLE DATA; Schema: poll; Owner: -
--

COPY poll.poll (id, title, description, image_link, points, place_name, place_lat, place_lon, category_id, created_at, updated_at, archived) FROM stdin;
\.


--
-- Data for Name: poll_answer_profiling_point; Type: TABLE DATA; Schema: poll; Owner: -
--

COPY poll.poll_answer_profiling_point (answer_id, category_id, rating, weight) FROM stdin;
\.


--
-- Name: poll_id_seq; Type: SEQUENCE SET; Schema: poll; Owner: -
--

SELECT pg_catalog.setval('poll.poll_id_seq', 1, false);


--
-- Data for Name: publishing; Type: TABLE DATA; Schema: poll; Owner: -
--

COPY poll.publishing (id, poll_id, important, user_id, start_time, end_time) FROM stdin;
\.


--
-- Name: publishing_id_seq; Type: SEQUENCE SET; Schema: poll; Owner: -
--

SELECT pg_catalog.setval('poll.publishing_id_seq', 1, false);


--
-- Data for Name: question; Type: TABLE DATA; Schema: poll; Owner: -
--

COPY poll.question (id, title, description, poll_id, index, answers_min, answers_max, created_at, updated_at) FROM stdin;
\.


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: poll; Owner: -
--

SELECT pg_catalog.setval('poll.question_id_seq', 1, false);


--
-- Data for Name: user_answer; Type: TABLE DATA; Schema: poll; Owner: -
--

COPY poll.user_answer (id, user_question_id, answer_id, value, created_at) FROM stdin;
\.


--
-- Name: user_answer_id_seq; Type: SEQUENCE SET; Schema: poll; Owner: -
--

SELECT pg_catalog.setval('poll.user_answer_id_seq', 1, false);


--
-- Data for Name: user_point_history; Type: TABLE DATA; Schema: poll; Owner: -
--

COPY poll.user_point_history (id, user_id, poll_id, multiplier, amount, created_at) FROM stdin;
\.


--
-- Name: user_point_history_id_seq; Type: SEQUENCE SET; Schema: poll; Owner: -
--

SELECT pg_catalog.setval('poll.user_point_history_id_seq', 1, false);


--
-- Data for Name: user_profiling_points; Type: TABLE DATA; Schema: poll; Owner: -
--

COPY poll.user_profiling_points (user_id, category_id, rating_sum, weight_sum, rate) FROM stdin;
\.


--
-- Data for Name: user_question; Type: TABLE DATA; Schema: poll; Owner: -
--

COPY poll.user_question (id, user_id, question_id, created_at) FROM stdin;
\.


--
-- Name: user_question_id_seq; Type: SEQUENCE SET; Schema: poll; Owner: -
--

SELECT pg_catalog.setval('poll.user_question_id_seq', 1, false);


--
-- Data for Name: user_status; Type: TABLE DATA; Schema: poll; Owner: -
--

COPY poll.user_status (id, user_id, poll_id, updated_at, total_questions, next_question_id, next_question_index, status) FROM stdin;
\.


--
-- Name: user_status_id_seq; Type: SEQUENCE SET; Schema: poll; Owner: -
--

SELECT pg_catalog.setval('poll.user_status_id_seq', 1, false);


--
-- Data for Name: user_status_log; Type: TABLE DATA; Schema: poll; Owner: -
--

COPY poll.user_status_log (id, user_id, poll_id, updated_at, total_questions, next_question_id, next_question_index, status) FROM stdin;
\.


--
-- Name: user_status_log_id_seq; Type: SEQUENCE SET; Schema: poll; Owner: -
--

SELECT pg_catalog.setval('poll.user_status_log_id_seq', 1, false);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
init_dbs	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.096738	2	EXECUTED	7:3597b593dfed93b5ec3e94118de265b5	sql		\N	3.5.3	common	\N	6097205901
add_resource_field_systemName	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.115298	3	EXECUTED	7:88ae31a5de9c50ac3c2a68f253033517	sql		\N	3.5.3	common	\N	6097205901
add_resource_field_systemName_change_not_null	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.136721	4	EXECUTED	7:615dd6dbea8bf7a0cf25197468b81f79	sql		\N	3.5.3	common	\N	6097205901
change_resource_field_instanceId_type	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.154138	5	EXECUTED	7:4bd378196fb21f032695c5256cceed84	sql		\N	3.5.3	common	\N	6097205901
add_next_fire_time_to_resource_instance	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.168908	6	EXECUTED	7:3ed0792f72f586d4a14ac95ada93b9a4	sql		\N	3.5.3	common	\N	6097205901
change_schedule_day_of_week_type	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.220655	7	EXECUTED	7:ddba9ddb131108e60fe75c2986a8f2bb	sql		\N	3.5.3	common	\N	6097205901
change_resource_instance_add_column_last_scheduled_date	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.271615	8	EXECUTED	7:19abe5e9d58b285a04431bcf66bf01a9	sql		\N	3.5.3	common	\N	6097205901
change_scheduler_log_add_column_resource_instance_id	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.288999	9	EXECUTED	7:8d09fe16bf637c6308afde60f4e73a50	sql		\N	3.5.3	common	\N	6097205901
change_column_last_scheduled_date_type	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.335983	10	EXECUTED	7:84f38331d778232c5e4b767ead04c455	sql		\N	3.5.3	common	\N	6097205901
change_table_schedule_add_unique	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.365516	11	EXECUTED	7:52d6dc57d0d795f4df777494285c6d67	sql		\N	3.5.3	common	\N	6097205901
change_schedule_add_column_slot_duration_mins	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.377711	12	EXECUTED	7:a1d50df48eaf3a5a70eb7ca444fd1d4d	sql		\N	3.5.3	common	\N	6097205901
change_resource_instance_add_column_resource_id	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.394767	13	EXECUTED	7:6e9d45b4dbae67001f40bdefb6a00b68	sql		\N	3.5.3	common	\N	6097205901
change_column_resource_ide_not_null	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-01-16 10:06:46.409463	14	EXECUTED	7:13cef5345dbb62fc96fb318497426425	sql		\N	3.5.3	common	\N	6097205901
quartz_tables	asavchuk	classpath:liquibase/migration/2017-11-03-quartz.sql	2018-01-16 10:06:46.84982	15	EXECUTED	7:a89eb1f9d2e5a999798adf038c7f8d22	sql		\N	3.5.3	common	\N	6097205901
change_unique_in_resource_instance	asavchuk	classpath:liquibase/migration/2017-11-17.sql	2018-01-16 10:06:46.877921	16	EXECUTED	7:7d3f104388aef02d00c85997d2db5be3	sql		\N	3.5.3	common	\N	6097205901
initial	komissarov	classpath:liquibase/migrations/init.sql	2018-01-16 10:11:42.244647	17	EXECUTED	7:2cd56211c455bb7a409b3aa8c42c839c	sql		\N	3.5.3	common	\N	6097502140
change_index	komissarov	classpath:liquibase/migrations/init.sql	2018-01-16 10:11:42.297589	18	EXECUTED	7:104015d071b5eaf9019c1ae8175f951d	sql		\N	3.5.3	common	\N	6097502140
change_type	komissarov	classpath:liquibase/migrations/init.sql	2018-01-16 10:11:42.428259	19	EXECUTED	7:895e62d916497c46b443af5d4bb8d3d4	sql		\N	3.5.3	common	\N	6097502140
add_new_fields	komissarov	classpath:liquibase/migrations/init.sql	2018-01-16 10:11:42.445175	20	EXECUTED	7:b514eb3127cc32aa1bb980cba3f681b2	sql		\N	3.5.3	common	\N	6097502140
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: sample_data; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sample_data (id, name, user_identifier, appgroup_identifier) FROM stdin;
1	ilya	37230269-b326-39c3-ba19-b43b233bf9fc	5
\.


--
-- Name: sample_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sample_data_id_seq', 1, true);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: certificate; Type: TABLE DATA; Schema: push; Owner: -
--

COPY push.certificate (id, name, ext_id, type, update_date) FROM stdin;
\.


--
-- Data for Name: certificate_android; Type: TABLE DATA; Schema: push; Owner: -
--

COPY push.certificate_android (id, certificate) FROM stdin;
\.


--
-- Name: certificate_id_seq; Type: SEQUENCE SET; Schema: push; Owner: -
--

SELECT pg_catalog.setval('push.certificate_id_seq', 3, true);


--
-- Data for Name: certificate_ios; Type: TABLE DATA; Schema: push; Owner: -
--

COPY push.certificate_ios (id, certificate, password, is_prod) FROM stdin;
\.


--
-- Data for Name: certificate_winphone; Type: TABLE DATA; Schema: push; Owner: -
--

COPY push.certificate_winphone (id) FROM stdin;
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: push; Owner: -
--

COPY push.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	push_service	classpath:database/push/db.changeset.sql	2017-06-23 13:56:56.280537	1	EXECUTED	7:868e1ac541c8b22c0ff7dc0fd584f4b1	sql		\N	3.5.3	common	\N	8226215870
3	push_service	classpath:database/push/db.changeset.sql	2017-06-23 13:57:06.765016	2	EXECUTED	7:0c7ffa418b09ee850565fb11f6a62866	sql		\N	3.5.3	common	\N	8226215870
4	push_service	classpath:database/push/db.changeset.sql	2017-06-23 13:57:06.90906	3	EXECUTED	7:6e9250d225dd2b7069879564fce318e8	sql		\N	3.5.3	common	\N	8226215870
5	push_service	classpath:database/push/db.changeset.sql	2017-06-23 13:57:07.049812	4	EXECUTED	7:fb3374ae97d8e36029cba80357bac7c0	sql		\N	3.5.3	common	\N	8226215870
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: push; Owner: -
--

COPY push.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
init_dbs	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.107297	1	EXECUTED	7:18cf89bb43b12330586ab4d47127443d	sql		\N	3.5.3	common	\N	8441016000
add_resource_field_systemName	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.120989	2	EXECUTED	7:88ae31a5de9c50ac3c2a68f253033517	sql		\N	3.5.3	common	\N	8441016000
add_resource_field_systemName_change_not_null	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.132053	3	EXECUTED	7:615dd6dbea8bf7a0cf25197468b81f79	sql		\N	3.5.3	common	\N	8441016000
change_resource_field_instanceId_type	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.143369	4	EXECUTED	7:4bd378196fb21f032695c5256cceed84	sql		\N	3.5.3	common	\N	8441016000
add_next_fire_time_to_resource_instance	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.152969	5	EXECUTED	7:3ed0792f72f586d4a14ac95ada93b9a4	sql		\N	3.5.3	common	\N	8441016000
change_schedule_day_of_week_type	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.182712	6	EXECUTED	7:ddba9ddb131108e60fe75c2986a8f2bb	sql		\N	3.5.3	common	\N	8441016000
change_resource_instance_add_column_last_scheduled_date	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.208405	7	EXECUTED	7:19abe5e9d58b285a04431bcf66bf01a9	sql		\N	3.5.3	common	\N	8441016000
change_scheduler_log_add_column_resource_instance_id	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.219406	8	EXECUTED	7:8d09fe16bf637c6308afde60f4e73a50	sql		\N	3.5.3	common	\N	8441016000
change_column_last_scheduled_date_type	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.244146	9	EXECUTED	7:84f38331d778232c5e4b767ead04c455	sql		\N	3.5.3	common	\N	8441016000
change_table_schedule_add_unique	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.26299	10	EXECUTED	7:52d6dc57d0d795f4df777494285c6d67	sql		\N	3.5.3	common	\N	8441016000
change_schedule_add_column_slot_duration_mins	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.273961	11	EXECUTED	7:a1d50df48eaf3a5a70eb7ca444fd1d4d	sql		\N	3.5.3	common	\N	8441016000
change_resource_instance_add_column_resource_id	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.287002	12	EXECUTED	7:6e9d45b4dbae67001f40bdefb6a00b68	sql		\N	3.5.3	common	\N	8441016000
change_column_resource_ide_not_null	asavchuk	classpath:liquibase/migration/2017-10-31-bootstrap.sql	2018-02-12 13:10:16.29876	13	EXECUTED	7:13cef5345dbb62fc96fb318497426425	sql		\N	3.5.3	common	\N	8441016000
quartz_tables	asavchuk	classpath:liquibase/migration/2017-11-03-quartz.sql	2018-02-12 13:10:16.578666	14	EXECUTED	7:a89eb1f9d2e5a999798adf038c7f8d22	sql		\N	3.5.3	common	\N	8441016000
change_unique_in_resource_instance	asavchuk	classpath:liquibase/migration/2017-11-17.sql	2018-02-12 13:10:16.59423	15	EXECUTED	7:7d3f104388aef02d00c85997d2db5be3	sql		\N	3.5.3	common	\N	8441016000
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: qrtz_blob_triggers; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
\.


--
-- Data for Name: qrtz_calendars; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
\.


--
-- Data for Name: qrtz_cron_triggers; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
\.


--
-- Data for Name: qrtz_fired_triggers; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
\.


--
-- Data for Name: qrtz_job_details; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
\.


--
-- Data for Name: qrtz_locks; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.qrtz_locks (sched_name, lock_name) FROM stdin;
schedulerFactoryBeanBooking	TRIGGER_ACCESS
\.


--
-- Data for Name: qrtz_paused_trigger_grps; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
\.


--
-- Data for Name: qrtz_scheduler_state; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
\.


--
-- Data for Name: qrtz_simple_triggers; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
\.


--
-- Data for Name: qrtz_simprop_triggers; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
\.


--
-- Data for Name: qrtz_triggers; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.resource (id, instance_id, name, description, create_schedule, create_schedule_start_time, schedule_for_next_hours, schedule_gaps_between_slots_mins, created_at, updated_at, tree, parent_id, system_name) FROM stdin;
\.


--
-- Name: resource_id_seq; Type: SEQUENCE SET; Schema: resource_structure; Owner: -
--

SELECT pg_catalog.setval('resource_structure.resource_id_seq', 1, false);


--
-- Data for Name: resource_instance; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.resource_instance (id, name, description, create_schedule, create_schedule_start_time, schedule_for_next_hours, schedule_gaps_between_slots_mins, properties, created_at, updated_at, tree, parent_id, next_fire_time, last_scheduled_date, resource_id) FROM stdin;
\.


--
-- Name: resource_instance_id_seq; Type: SEQUENCE SET; Schema: resource_structure; Owner: -
--

SELECT pg_catalog.setval('resource_structure.resource_instance_id_seq', 1, false);


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.schedule (id, resource_id, resource_instance_id, day_of_week, start_time, end_time, description, created_at, slot_duration_mins) FROM stdin;
\.


--
-- Data for Name: schedule_gap; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.schedule_gap (id, schedule_id, start_time, end_time, description, created_at) FROM stdin;
\.


--
-- Name: schedule_gap_id_seq; Type: SEQUENCE SET; Schema: resource_structure; Owner: -
--

SELECT pg_catalog.setval('resource_structure.schedule_gap_id_seq', 1, false);


--
-- Name: schedule_id_seq; Type: SEQUENCE SET; Schema: resource_structure; Owner: -
--

SELECT pg_catalog.setval('resource_structure.schedule_id_seq', 1, false);


--
-- Data for Name: scheduler_log; Type: TABLE DATA; Schema: resource_structure; Owner: -
--

COPY resource_structure.scheduler_log (id, action, data, created_at, resource_instance_id, executed_time) FROM stdin;
\.


--
-- Name: scheduler_log_id_seq; Type: SEQUENCE SET; Schema: resource_structure; Owner: -
--

SELECT pg_catalog.setval('resource_structure.scheduler_log_id_seq', 1, false);


--
-- Data for Name: abstract_task; Type: TABLE DATA; Schema: scheduling; Owner: -
--

COPY scheduling.abstract_task (id, endpoint_descriptor_id, name, description, start_date, end_date, thread_count, is_active, type, application_id, application_group_id) FROM stdin;
\.


--
-- Name: abstract_task_id_seq; Type: SEQUENCE SET; Schema: scheduling; Owner: -
--

SELECT pg_catalog.setval('scheduling.abstract_task_id_seq', 1, false);


--
-- Data for Name: cron_task; Type: TABLE DATA; Schema: scheduling; Owner: -
--

COPY scheduling.cron_task (id, cron_expression) FROM stdin;
\.


--
-- Data for Name: task_execution; Type: TABLE DATA; Schema: scheduling; Owner: -
--

COPY scheduling.task_execution (id, task_id, start_date, end_date, successful, error_code, error_message) FROM stdin;
\.


--
-- Name: task_execution_id_seq; Type: SEQUENCE SET; Schema: scheduling; Owner: -
--

SELECT pg_catalog.setval('scheduling.task_execution_id_seq', 1, false);


--
-- Data for Name: time_task; Type: TABLE DATA; Schema: scheduling; Owner: -
--

COPY scheduling.time_task (id, interval_ms, repeat_count) FROM stdin;
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: script_backend; Owner: -
--

COPY script_backend.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
bootstrap-schema	iboychuk	classpath:liquibase/migration/2016-09-26-bootstrap.sql	2017-10-18 20:19:23.2038	1	EXECUTED	7:89654178070c2bccc6ac63b7027fc513	sql		\N	3.5.3	common	\N	8347163706
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: script_backend; Owner: -
--

COPY script_backend.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: script_backend; Type: TABLE DATA; Schema: script_backend; Owner: -
--

COPY script_backend.script_backend (id, name, group_id) FROM stdin;
\.


--
-- Name: script_backend_id_seq; Type: SEQUENCE SET; Schema: script_backend; Owner: -
--

SELECT pg_catalog.setval('script_backend.script_backend_id_seq', 8, true);


--
-- Data for Name: script_endpoint; Type: TABLE DATA; Schema: script_backend; Owner: -
--

COPY script_backend.script_endpoint (id, backend_id, name, script_text, script_base_class, request_data_type, response_data_type, isolation) FROM stdin;
\.


--
-- Name: script_endpoint_id_seq; Type: SEQUENCE SET; Schema: script_backend; Owner: -
--

SELECT pg_catalog.setval('script_backend.script_endpoint_id_seq', 12, true);


--
-- Data for Name: client; Type: TABLE DATA; Schema: sms; Owner: -
--

COPY sms.client (id, name, token, notification_url, message_url, text_service) FROM stdin;
\.


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: sms; Owner: -
--

SELECT pg_catalog.setval('sms.client_id_seq', 2, true);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: sms; Owner: -
--

COPY sms.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
2	iboychuk	classpath:liquibase/migration/2016-04-01-bootstrap.sql	2017-06-23 13:57:05.730544	1	EXECUTED	7:6fb2e987224ca69a483db591986fe073	sql		\N	3.5.3	common	\N	8226225087
3	dminbaev	classpath:liquibase/migration/2016-04-01-bootstrap.sql	2017-06-23 13:57:14.217123	2	EXECUTED	7:b826b6a6460403690c6490c2f3ec9cc3	sql		\N	3.5.3	common	\N	8226225087
4	iboychuk	classpath:liquibase/migration/2016-04-01-bootstrap.sql	2017-06-23 13:57:14.244339	3	EXECUTED	7:2be9b4edfa8b667f8ef8281c3688b2af	sql		\N	3.5.3	common	\N	8226225087
5	iboychuk	classpath:liquibase/migration/2016-07-29-release-prepare.sql	2017-06-23 13:57:14.374028	4	EXECUTED	7:e1223cd8f09bbb38541f4400957be5b6	sql		\N	3.5.3	common	\N	8226225087
7	iboychuk	classpath:liquibase/migration/2016-07-29-release-prepare.sql	2017-06-23 13:57:14.500007	5	EXECUTED	7:86a3eb752e574482f4b183abf0f036e9	sql		\N	3.5.3	common	\N	8226225087
clear-structure	iboychuk	classpath:liquibase/migration/2016-12-13-clear-release.sql	2017-06-23 13:57:14.580508	6	EXECUTED	7:8b5e06272a4e7fcc377d1c897aacd209	sql		\N	3.5.3	common	\N	8226225087
create-structure	iboychuk	classpath:liquibase/migration/2016-12-13-clear-release.sql	2017-06-23 13:57:14.685766	7	EXECUTED	7:9a32b9e84eb6dd7b552ddb51fc4ca470	sql		\N	3.5.3	common	\N	8226225087
add-incoming-message-support	iboychuk	classpath:liquibase/migration/2016-12-13-clear-release.sql	2017-06-23 13:57:14.9791	8	EXECUTED	7:aa248984c47b73c28acf99482313f690	sql		\N	3.5.3	common	\N	8226225087
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: sms; Owner: -
--

COPY sms.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: provider; Type: TABLE DATA; Schema: sms; Owner: -
--

COPY sms.provider (id, name, active, queue, connection_url) FROM stdin;
\.


--
-- Name: provider_id_seq; Type: SEQUENCE SET; Schema: sms; Owner: -
--

SELECT pg_catalog.setval('sms.provider_id_seq', 4, true);


--
-- Data for Name: routing; Type: TABLE DATA; Schema: sms; Owner: -
--

COPY sms.routing (id, client_id, provider_id, route, sender, pattern, priority, active) FROM stdin;
\.


--
-- Name: routing_id_seq; Type: SEQUENCE SET; Schema: sms; Owner: -
--

SELECT pg_catalog.setval('sms.routing_id_seq', 3, true);


--
-- Data for Name: sms_message; Type: TABLE DATA; Schema: sms; Owner: -
--

COPY sms.sms_message (id, sms_id, client_id, routing_id, sender, msisdn, message, status, error, created, submitted, delivered) FROM stdin;
\.


--
-- Name: sms_message_id_seq; Type: SEQUENCE SET; Schema: sms; Owner: -
--

SELECT pg_catalog.setval('sms.sms_message_id_seq', 1746, true);


--
-- Data for Name: sms_transaction; Type: TABLE DATA; Schema: sms; Owner: -
--

COPY sms.sms_transaction (id, msg_id, msg_ref, msg_part, msg_count, provider, provider_msg_id, status, error, created, submitted, route, sender, msisdn, body, delivered) FROM stdin;
\.


--
-- Name: sms_transaction_id_seq; Type: SEQUENCE SET; Schema: sms; Owner: -
--

SELECT pg_catalog.setval('sms.sms_transaction_id_seq', 2250, true);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
create_schemas	nkonev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:27.943219	1	EXECUTED	7:9aa4ba0c2f1cd5f44ea8e5cfa37eb5f8	sql		\N	3.5.3	common	\N	9301607912
add-layout-image	sorlov	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.032989	2	EXECUTED	7:a8a5eb50c64de5d474b20e30a2e1393d	sql		\N	3.5.3	common	\N	9301607912
mobile_store	nkonev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.066931	3	EXECUTED	7:5ea5260698bd2021ea547f404e861044	sql		\N	3.5.3	common	\N	9301607912
init-backend-schema	dminbaev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.242949	4	EXECUTED	7:564efd834c744af4dbda9b42f68b1d5e	sql		\N	3.5.3	common	\N	9301607912
storage-mq-descriptors	iboychuk	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.305332	5	EXECUTED	7:269c73ced6d00a99aaac0c40b608301b	sql		\N	3.5.3	common	\N	9301607912
storage-emp-descriptors	sorlov	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.337217	6	EXECUTED	7:3c994be4364c962026ea140e3c137e49	sql		\N	3.5.3	common	\N	9301607912
add_template_tables	nkonev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.374921	7	EXECUTED	7:2ae8a3b2bb2636bc410275ce0da93675	sql		\N	3.5.3	common	\N	9301607912
add_aaa_message_bundles	nkonev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.387663	8	EXECUTED	7:52c75c38b0ffc0ffbcb9aacc18e408b5	sql		\N	3.5.3	common	\N	9301607912
rewrite_and_fix_template_migration_for_aaa	nkonev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.41428	9	EXECUTED	7:9cea713454b474cda3fc0712d9c73f73	sql		\N	3.5.3	common	\N	9301607912
storage-chain-descriptors	iboychuk	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.455194	10	EXECUTED	7:dc2ab02c038d02c522af6f465e8d3f74	sql		\N	3.5.3	common	\N	9301607912
add_adapter_backend	dminbaev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.513591	11	EXECUTED	7:c404bd9acb2bb77652ccfda669c8b943	sql		\N	3.5.3	common	\N	9301607912
aggregation_backend_proper	nkonev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.546402	12	EXECUTED	7:90c7c692f43c59f7c274452dc5c66c6d	sql		\N	3.5.3	common	\N	9301607912
scheduling_bootstrap	sorlov	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.585101	13	EXECUTED	7:159651cbd4f43b52509edd01b2879829	sql		\N	3.5.3	common	\N	9301607912
rename_parameters_to_pool_parameters	nkonev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.595394	14	EXECUTED	7:606d207183ced2d0f3f9dfb1e827cfd3	sql		\N	3.5.3	common	\N	9301607912
add_directory_for_frontend	nkonev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.695977	15	EXECUTED	7:a136dd664826a2a43822be6aad19cf5c	sql		\N	3.5.3	common	\N	9301607912
storage-split-descriptors	iboychuk	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.726735	16	EXECUTED	7:ad3a343dab82253815f223277bcd9dc1	sql		\N	3.5.3	common	\N	9301607912
endpoint-caching	iboychuk	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.762331	17	EXECUTED	7:6038212f483027d98a901187adf48e8c	sql		\N	3.5.3	common	\N	9301607912
add_mq_admin_port	nkonev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.807051	18	EXECUTED	7:bfe9c6c25985674e3c31af4513e52dd6	sql		\N	3.5.3	common	\N	9301607912
oracle_sid	sorlov	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.825727	19	EXECUTED	7:9dad81ff378465fbb58f4581a360a42d	sql		\N	3.5.3	common	\N	9301607912
cache-settings	iboychuk	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:13:28.858258	20	EXECUTED	7:ff072ce8d26ec5a4af6f2676263092d6	sql		\N	3.5.3	common	\N	9301607912
add_large_obj_storage_schema	dminbaev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:32.833186	21	EXECUTED	7:e9e127ccaa1730647bbb18f912314246	sql		\N	3.5.3	common	\N	9302572764
mdm-init	ilya.boychuk	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:32.864689	22	EXECUTED	7:546e6db985fe3d79dd40e8510dfd3c83	sql		\N	3.5.3	common	\N	9302572764
composite_backend	nkonev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:32.902877	23	EXECUTED	7:62b14c06e0d3ae52c3cf12ff1ce5f5b5	sql		\N	3.5.3	common	\N	9302572764
scheduling-log	sorlov	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:32.936145	24	EXECUTED	7:f87f0e1723088e981ab42bd229460e70	sql		\N	3.5.3	common	\N	9302572764
AL-128-scheduling-task-uniqueness	iboychuk	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:32.954636	25	EXECUTED	7:f9b2ae102b673ac7c4ed904af6046419	sql		\N	3.5.3	common	\N	9302572764
AL-16_uuid_to_short	nkonev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:33.063959	26	EXECUTED	7:29dc3b26b281d0a71bb37536af1639d3	sql		\N	3.5.3	common	\N	9302572764
change_name_for_default_template	sorlov	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:33.076826	27	EXECUTED	7:8fe0857bfc5c76f2e421b231f65220c1	sql		\N	3.5.3	common	\N	9302572764
remove_notnull_app_constraint	iboychuk	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:33.088227	28	EXECUTED	7:e4e3ad4e86b9ae96cd49bfbadefa5c39	sql		\N	3.5.3	common	\N	9302572764
create_schema_mdm	iboychuk	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:33.095633	29	EXECUTED	7:f3acaf7a536670130a2a2e23f7a82d7c	sql		\N	3.5.3	common	\N	9302572764
mdm_backend_tables	iboychuk	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:33.142355	30	EXECUTED	7:a0246e513f46c630f952ec2ca9a68f02	sql		\N	3.5.3	common	\N	9302572764
params_for_mysql	sorlov	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:33.155538	31	EXECUTED	7:35b0277ad01613be7f8272d57de37cc4	sql		\N	3.5.3	common	\N	9302572764
file_info_add_is_folder_flag	dminbaev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:33.184615	32	EXECUTED	7:7e1d54837a88f4a833124e44022a397f	sql		\N	3.5.3	common	\N	9302572764
change_confirm_template_fix	iboychuk	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:33.202644	33	EXECUTED	7:af88781badeac7ffe8c2caf21d4b7dcf	sql		\N	3.5.3	common	\N	9302572764
template_html_flag	nkonev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:33.244904	34	EXECUTED	7:578b9d3b2e1a38e29d4c8ea794d5ce54	sql		\N	3.5.3	common	\N	9302572764
template_for_user_login	sorlov	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:33.258144	35	EXECUTED	7:dd2e3a5f67594485db98d0d7cfde8fa7	sql		\N	3.5.3	common	\N	9302572764
mobile_store_indexes	sorlov	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:33.293716	36	EXECUTED	7:0a227652abe206a83a536a5fc7758865	sql		\N	3.5.3	common	\N	9302572764
add_rest_and_awip_request_timeout	dminbaev	classpath:liquibase/migration/2016-09-06-bootstrap.sql	2018-02-22 12:29:33.32143	37	EXECUTED	7:ad1dfb0febbc39e104b50d85a82b6006	sql		\N	3.5.3	common	\N	9302572764
create_external_backend	iboychuk	classpath:liquibase/migration/2017-09-28-external-backend.sql	2018-02-22 12:29:33.348465	38	EXECUTED	7:df8be3ec0eca89713d829c241cdba6a4	sql		\N	3.5.3	common	\N	9302572764
add_metadata_to_view	dminbaev	classpath:liquibase/migration/2018-02-01-add_metadata_to_view.sql	2018-02-22 12:29:33.359714	39	EXECUTED	7:306c55c568356e321bfd35cfc3783d09	sql		\N	3.5.3	common	\N	9302572764
add_layout_type_to_view	savchuk	classpath:liquibase/migration/2018-02-01-add_metadata_to_view.sql	2018-02-22 12:29:33.370421	40	EXECUTED	7:44293c424223fc5da6cfc2e3381bd597	sql		\N	3.5.3	common	\N	9302572764
add_layout_type_to_view	dminbaev	classpath:liquibase/migration/2018-02-01-add_metadata_to_view.sql	2018-02-22 12:29:33.381445	41	EXECUTED	7:044367a06d737624ad4e0293952ef1ae	sql		\N	3.5.3	common	\N	9302572764
add_create_at_to_view	savchuk	classpath:liquibase/migration/2018-02-01-add_metadata_to_view.sql	2018-02-22 12:29:33.415838	42	EXECUTED	7:1a7ab61e03b304938c1a7d8f1b5b04d1	sql		\N	3.5.3	common	\N	9302572764
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: storage; Owner: -
--

COPY storage.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: telegram_bot; Owner: -
--

COPY telegram_bot.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
telegram-bot1	dminbaev	classpath:liquibase/migration/2016-05-26-bootstrap.sql	2018-02-22 12:13:19.641492	1	EXECUTED	7:3dc51c1841915f0ff89890d0b59309cd	sql		\N	3.5.3	common	\N	9301599589
telegram-bot2-add_app_locale	dminbaev	classpath:liquibase/migration/2016-05-26-bootstrap.sql	2018-02-22 12:13:20.739773	2	EXECUTED	7:25ba003ab8f91d8cce3d8fe29062f0db	sql		\N	3.5.3	common	\N	9301599589
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: telegram_bot; Owner: -
--

COPY telegram_bot.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: telegram_bot; Type: TABLE DATA; Schema: telegram_bot; Owner: -
--

COPY telegram_bot.telegram_bot (id, name, token, registration_url, handler_url, application_group, application, default_locale) FROM stdin;
\.


--
-- Name: telegram_bot_id_seq; Type: SEQUENCE SET; Schema: telegram_bot; Owner: -
--

SELECT pg_catalog.setval('telegram_bot.telegram_bot_id_seq', 1, false);


--
-- Data for Name: bot_listener; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.bot_listener (id, bot_name, enable, name, description, welcome_template, not_registered_welcome_template, default_keyboard_id, not_registered_keyboard_id, created_at, updated_at, error_template, unknown_command_template, debug_mode, not_found_keyboard_template) FROM stdin;
\.


--
-- Name: bot_listener_id_seq; Type: SEQUENCE SET; Schema: telegram_handler; Owner: -
--

SELECT pg_catalog.setval('telegram_handler.bot_listener_id_seq', 1, false);


--
-- Data for Name: command; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.command (id, bot_id, group_id, command, command_type, method_url, params, additional_params, script, text_template, required_registration, enable, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: command_error; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.command_error (id, command, command_id, created_at, type, message) FROM stdin;
\.


--
-- Name: command_error_id_seq; Type: SEQUENCE SET; Schema: telegram_handler; Owner: -
--

SELECT pg_catalog.setval('telegram_handler.command_error_id_seq', 1, false);


--
-- Data for Name: command_group; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.command_group (id, bot_id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: command_group_id_seq; Type: SEQUENCE SET; Schema: telegram_handler; Owner: -
--

SELECT pg_catalog.setval('telegram_handler.command_group_id_seq', 1, false);


--
-- Name: command_id_seq; Type: SEQUENCE SET; Schema: telegram_handler; Owner: -
--

SELECT pg_catalog.setval('telegram_handler.command_id_seq', 1, false);


--
-- Data for Name: default_keyboard; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.default_keyboard (id, bot_id, buttons, name, created_at, updated_at, description, navigate_message) FROM stdin;
\.


--
-- Name: default_keyboard_id_seq; Type: SEQUENCE SET; Schema: telegram_handler; Owner: -
--

SELECT pg_catalog.setval('telegram_handler.default_keyboard_id_seq', 1, false);


--
-- Data for Name: periodic_task; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.periodic_task (id, bot_id, name, description, script, method_url, next_execute_time, execute_time, cron_expression, execute_type, status, created_at, updated_at, time_zone) FROM stdin;
\.


--
-- Name: periodic_task_id_seq; Type: SEQUENCE SET; Schema: telegram_handler; Owner: -
--

SELECT pg_catalog.setval('telegram_handler.periodic_task_id_seq', 1, false);


--
-- Data for Name: qrtz_blob_triggers; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
\.


--
-- Data for Name: qrtz_calendars; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
\.


--
-- Data for Name: qrtz_cron_triggers; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
\.


--
-- Data for Name: qrtz_fired_triggers; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
\.


--
-- Data for Name: qrtz_job_details; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
\.


--
-- Data for Name: qrtz_locks; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.qrtz_locks (sched_name, lock_name) FROM stdin;
\.


--
-- Data for Name: qrtz_paused_trigger_grps; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
\.


--
-- Data for Name: qrtz_scheduler_state; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
\.


--
-- Data for Name: qrtz_simple_triggers; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
\.


--
-- Data for Name: qrtz_simprop_triggers; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
\.


--
-- Data for Name: qrtz_triggers; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
\.


--
-- Data for Name: stored_procedure; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.stored_procedure (id, name, bot_id, text, created_at, updated_at) FROM stdin;
\.


--
-- Name: stored_procedure_id_seq; Type: SEQUENCE SET; Schema: telegram_handler; Owner: -
--

SELECT pg_catalog.setval('telegram_handler.stored_procedure_id_seq', 1, false);


--
-- Data for Name: task_log; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.task_log (id, task_id, created_at, action, status, payload) FROM stdin;
\.


--
-- Data for Name: task_log_aggregation; Type: TABLE DATA; Schema: telegram_handler; Owner: -
--

COPY telegram_handler.task_log_aggregation (id, success_count, error_count, last_status, last_start, last_finish, next_start, additional_values, average_exe_time_ms) FROM stdin;
\.


--
-- Name: task_log_id_seq; Type: SEQUENCE SET; Schema: telegram_handler; Owner: -
--

SELECT pg_catalog.setval('telegram_handler.task_log_id_seq', 1, false);


--
-- Data for Name: i18n_params; Type: TABLE DATA; Schema: temp; Owner: -
--

COPY temp.i18n_params (template_id, parameter) FROM stdin;
1	mb_confirm_user_registration_subject
2	mb_confirm_user_registration_body
3	mb_confirm_password_reset_subject
4	mb_confirm_password_reset_body
5	mb_confirm_user_registration_body_link
6	mb_confirm_password_reset_body_link
\.


--
-- Data for Name: template; Type: TABLE DATA; Schema: temp; Owner: -
--

COPY temp.template (id, name, description, template, application_group_id, html) FROM stdin;
2	aaa.confirm_user_registration_body	Шаблон тела email или SMS на подтверждение регистрации  пользователя	${mb_confirm_user_registration_body} ${code}	1	f
1	aaa.confirm_user_registration_subject	Шаблон темы email на подтверждение регистрации пользователя	${mb_confirm_user_registration_subject}	1	f
4	aaa.confirm_password_reset_body	Шаблон тела email или SMS на подтверждение сброса пароля	${mb_confirm_password_reset_body} ${code}	1	f
3	aaa.confirm_password_reset_subject	Шаблон темы email на подтверждение сброса пароля	${mb_confirm_password_reset_subject}	1	f
16	aaa.default_confirm_body_password_reset	Autogenerated template	Your url to confirm the password reset: ${web_link}	3	f
17	aaa.default_confirm_subject_password_reset	Autogenerated template	Confirm password reset in a server platform	3	f
18	aaa.default_confirm_body_user_registration	Autogenerated template	Your url to confirm the registration:  ${web_link}	3	f
19	aaa.default_confirm_subject_user_registration	Autogenerated template	Confirmation of registration in the service platform	3	f
5	aaa.confirm_user_registration_body_link	Шаблон тела email или SMS на подтверждение регистрации пользователя по ссылке	${mb_confirm_user_registration_body_link} http://alpha.uat.mp3.alx/aaa/v3/api/confirm/web?userId=${userId}&confirmAction=${confirmAction}&code=${code}	1	f
6	aaa.confirm_password_reset_body_link	Шаблон тела email или SMS на подтверждение сброса пароля по ссылке	${mb_confirm_password_reset_body_link} http://alpha.uat.mp3.alx/aaa/v3/api/confirm/web?userId=${userId}&confirmAction=${confirmAction}&code=${code}	1	f
24	aaa.confirm_user_login_subject	Шаблон темы email на подтверждение логина пользователя	User login	1	f
25	aaa.confirm_user_login_body	Шаблон тела email или SMS на подтверждение логина  пользователя	User login code ${code}	1	f
27	cityservices.confirm.msisdn	\N	Your confirmation code for Citymatica: ${code}	1	f
11	blah	\N	<p>&lt;gfxhdgshfghn\\&gt;</p>	1	t
26	cityservices.confirm.email	\N	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">\r\r\r\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\r\r\r\n    <head>\r\r\r\r\n        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\r\r\r\r\n        <meta name="viewport" content="width=device-width"/>\r\r\r\r\n    </head>\r\r\r\r\n    <body style="background: rgb(242,242,242);  width: 100% !important; height: 100%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif">\r\r\r\r\n        <table style="clear: both !important; margin: 0 auto !important; width: 100%; max-width:600px ">\r\r\r\r\n            <tr>\r\r\r\r\n                <td>\r\r\r\r\n                    <table  width="100%">\r\r\r\r\n                        <tr >\r\r\r\r\n                            <td bgcolor="#b6b6b6" align="center" style="padding: 40px 0;  background-image: url(http://images.smatrcityhub.msp.mobi/bg%402x.30990567.jpg); background-color: #b6b6b6; background-size: cover;   color: rgba(0,0,0,0.8);" >\r\r\r\r\n                                <h1 style="margin-top: 20px"><img src="http://images.smatrcityhub.msp.mobi/logo%403x.png" /></h1>\r\r\r\r\n                                <h4 style="margin-top: 40px">Smart way of urban life</h4>\r\r\r\r\n                            </td>\r\r\r\r\n                        </tr>\r\r\r\r\n                        <tr>\r\r\r\r\n                            <td bgcolor="#ffffff" style="background-color: white;     padding: 40px;">\r\r\r\r\n                                <h3>Thank you for updating your profile</h3>\r\r\r\r\n                                <p>Please, verify your email adress using link below.</p>\r\r\r\r\n                                <table width="100%">\r\r\r\r\n                                    <tr>\r\r\r\r\n                                        <td align="center">\r\r\r\r\n                                            <p>\r\r\r\r\n                                                <a href="http://alpha-cityservices.msp.mobi/confirmation.html?code=${code}" style="  display: inline-block;color: white; background: #00CE95; border: solid #00CE95; border-width: 10px 20px 8px; padding-left: 40px; padding-right: 40px; border-radius: 4px; text-decoration: none!important">Verify\r\r\r\r\n                                                </a>\r\r\r\r\n                                            </p>\r\r\r\r\n                                        </td>\r\r\r\r\n                                    </tr>\r\r\r\r\n                                </table>\r\r\r\r\n                            </td>\r\r\r\r\n                        </tr>\r\r\r\r\n                    </table>\r\r\r\r\n                </td>\r\r\r\r\n            </tr>\r\r\r\r\n        </table>\r\r\r\r\n    </body>\r\r\r\r\n</html>	1	t
43	cityservices.news.notification.push.body	\N	City news: ${text}	1	f
45	cityservices.news.notification.inmap.subject	\N	Latest city news: ${title}	1	f
44	cityservices.news.notification.push.subject	\N	Latest city news	1	f
36	citiservices.textservice.notfound	\N	${channelType} service ${message} is not found	1	f
38	cityservices.news.notification.sms.body	\N	Latest city news: ${title}	1	f
39	cityservices.news.notification.email.body	\N	City news: ${text}	1	f
40	cityservices.news.notification.email.subject	\N	Latest city news	1	f
41	cityservices.news.notification.telegram.body	\N	City news: ${text}	1	f
42	cityservices.news.notification.inmap.body	\N	City news: ${text}	1	f
65	cityservices.poll.unpublish.notification.telegram.body	\N	City poll unpublished: ${title}	1	f
64	cityservices.poll.unpublish.notification.email.subject	\N	City poll unpublished	1	f
62	cityservices.poll.unpublish.notification.sms.body	\N	City poll unpublished: ${title}	1	f
61	cityservices.poll.unpublish.notification.push.subject	\N	City poll unpublished	1	f
60	cityservices.poll.unpublish.notification.inmap.subject	\N	City poll unpublished: ${title}	1	f
59	cityservices.poll.unpublish.notification.push.body	\N	City poll unpublished: ${title}	1	f
58	cityservices.poll.publish.notification.inmap.body	\N	City poll published: ${title}	1	f
57	cityservices.poll.publish.notification.telegram.body	\N	City poll published: ${title}	1	f
56	cityservices.poll.publish.notification.email.subject	\N	City poll published	1	f
55	cityservices.poll.publish.notification.email.body	\N	City poll published: ${title}	1	f
54	cityservices.poll.publish.notification.sms.body	\N	City poll published: ${title}	1	f
53	cityservices.poll.publish.notification.push.subject	\N	City poll published	1	f
52	cityservices.poll.publish.notification.inmap.subject	\N	City poll published: ${title}	1	f
51	cityservices.poll.publish.notification.push.body	\N	City poll published: ${title}	1	f
35	cityservices.vaccination.notification.inmap.subject	\N	Vaccination reminder.	1	f
34	cityservices.vaccination.notification.push.subject	\N	Vaccination reminder.	1	f
33	cityservices.vaccination.notification.push.body	\N	You have planned vaccination "${title}" tomorrow. Recommendations: "${recommendations}"	1	f
32	cityservices.vaccination.notification.inmap.body	\N	You have planned vaccination "${title}" tomorrow. Recommendations: "${recommendations}"	1	f
31	cityservices.vaccination.notification.telegram.body	\N	You have planned vaccination "${title}" tomorrow. Recommendations: "${recommendations}"	1	f
30	cityservices.vaccination.notification.sms.body	\N	You have planned vaccination "${title}" tomorrow. Recommendations: "${recommendations}"	1	f
29	cityservices.vaccination.notification.email.subject	\N	Vaccination reminder.	1	f
28	cityservices.vaccination.notification.email.body	\N	You have planned vaccination "${title}" tomorrow. Recommendations: "${recommendations}"	1	f
66	cityservices.poll.unpublish.notification.inmap.body	\N	City poll unpublished: ${title}	1	f
63	cityservices.poll.unpublish.notification.email.body	\N	City poll unpublished: ${title}	1	f
37	citiservices.textservice.emptyparameter	\N	Attribute "${profileAttributeName}" is empty in your citizen profile	1	f
\.


--
-- Data for Name: i18n_params; Type: TABLE DATA; Schema: template; Owner: -
--

COPY template.i18n_params (template_id, parameter) FROM stdin;
1	mb_confirm_user_registration_subject
2	mb_confirm_user_registration_body
3	mb_confirm_password_reset_subject
4	mb_confirm_password_reset_body
5	mb_confirm_user_registration_body_link
6	mb_confirm_password_reset_body_link
\.


--
-- Data for Name: template; Type: TABLE DATA; Schema: template; Owner: -
--

COPY template.template (id, name, description, template, application_group_id, html) FROM stdin;
2	aaa.confirm_user_registration_body	Шаблон тела email или SMS на подтверждение регистрации  пользователя	${mb_confirm_user_registration_body} ${code}	1	f
1	aaa.confirm_user_registration_subject	Шаблон темы email на подтверждение регистрации пользователя	${mb_confirm_user_registration_subject}	1	f
4	aaa.confirm_password_reset_body	Шаблон тела email или SMS на подтверждение сброса пароля	${mb_confirm_password_reset_body} ${code}	1	f
3	aaa.confirm_password_reset_subject	Шаблон темы email на подтверждение сброса пароля	${mb_confirm_password_reset_subject}	1	f
5	aaa.confirm_user_registration_body_link	Шаблон тела email или SMS на подтверждение регистрации пользователя по ссылке	${mb_confirm_user_registration_body_link} ${web_link}	1	f
6	aaa.confirm_password_reset_body_link	Шаблон тела email или SMS на подтверждение сброса пароля по ссылке	${mb_confirm_password_reset_body_link} ${web_link}	1	f
7	aaa.confirm_user_login_subject	Шаблон темы email на подтверждение логина пользователя	User login	1	f
8	aaa.confirm_user_login_body	Шаблон тела email или SMS на подтверждение логина  пользователя	User login code ${code}	1	f
\.


--
-- Name: template_id_seq; Type: SEQUENCE SET; Schema: template; Owner: -
--

SELECT pg_catalog.setval('template.template_id_seq', 8, true);


--
-- Data for Name: attribute_descriptor; Type: TABLE DATA; Schema: userstorage; Owner: -
--

COPY userstorage.attribute_descriptor (id, name, name_i18n_key, validation_regexp, validation_regexp_violation_i18n_key, mandatory, uniques, shared, cardinality_min, cardinality_max, cardinality_violation_i18n_key, parent_id, application_group_id, is_group, read_only, type) FROM stdin;
\.


--
-- Name: attribute_descriptor_id_seq; Type: SEQUENCE SET; Schema: userstorage; Owner: -
--

SELECT pg_catalog.setval('userstorage.attribute_descriptor_id_seq', 109, true);


--
-- Data for Name: attribute_type; Type: TABLE DATA; Schema: userstorage; Owner: -
--

COPY userstorage.attribute_type (id, name, application_group_id) FROM stdin;
\.


--
-- Name: attribute_type_id_seq; Type: SEQUENCE SET; Schema: userstorage; Owner: -
--

SELECT pg_catalog.setval('userstorage.attribute_type_id_seq', 3, true);


--
-- Data for Name: attribute_value; Type: TABLE DATA; Schema: userstorage; Owner: -
--

COPY userstorage.attribute_value (id, data, application_group_id, user_id, parent_id, descriptor_id) FROM stdin;
\.


--
-- Name: attribute_value_id_seq; Type: SEQUENCE SET; Schema: userstorage; Owner: -
--

SELECT pg_catalog.setval('userstorage.attribute_value_id_seq', 15159, true);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: userstorage; Owner: -
--

COPY userstorage.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
init	sorlov	classpath:liquibase/migration/2017-08-01-bootstrap.sql	2017-08-16 14:28:04.904384	1	EXECUTED	7:bdc2336083904d6bb7496de77d65c658	sql		\N	3.5.3	common	\N	2893684544
enum_of_types	sorlov	classpath:liquibase/migration/2017-08-01-bootstrap.sql	2017-08-25 17:46:17.418027	2	EXECUTED	7:edcafda49413d6752d68f2bd78befae4	sql		\N	3.5.3	common	\N	3683177154
drop_unique	sorlov	classpath:liquibase/migration/2017-08-01-bootstrap.sql	2017-09-01 13:21:05.53967	3	EXECUTED	7:ee67266644f5dcc8262994f178302494	sql		\N	3.5.3	common	\N	4272065383
cascade_delete	sorlov	classpath:liquibase/migration/2017-08-01-bootstrap.sql	2017-10-03 16:22:04.555729	4	EXECUTED	7:49e901101229d359e0dc4ee0f1b3ddf0	sql		\N	3.5.3	common	\N	7047724381
second_unique_index_for_descriptor	sorlov	classpath:liquibase/migration/2017-08-01-bootstrap.sql	2018-02-12 13:03:57.349528	5	EXECUTED	7:82286ec4d3c4dd1641ae1409a6f037d4	sql		\N	3.5.3	common	\N	8440637303
index_for_attribute_value_by_application_group_and_user	sorlov	classpath:liquibase/migration/2017-08-01-bootstrap.sql	2018-02-12 13:03:58.382693	6	EXECUTED	7:40deefd50e3d5bcf253b5b6c0e6b4280	sql		\N	3.5.3	common	\N	8440637303
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: userstorage; Owner: -
--

COPY userstorage.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: webadmin; Owner: -
--

COPY webadmin.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
user	sorlov	classpath:liquibase/migration/2017-01-13-bootstrap.sql	2017-06-23 13:57:56.816749	1	EXECUTED	7:5ba56f9473802377d653a307a84c6028	sql		\N	3.5.3	common	\N	8226276678
scheduler-metadata	iboychuk	classpath:liquibase/migration/2017-01-13-bootstrap.sql	2017-06-23 13:58:05.436021	2	EXECUTED	7:7d1075a6d3439aeabf63c6fae75dfc97	sql		\N	3.5.3	common	\N	8226276678
scheduler-metadata-cron-expression	iboychuk	classpath:liquibase/migration/2017-01-13-bootstrap.sql	2017-06-23 13:58:05.452788	3	EXECUTED	7:239bfa6b09400ee05801109988cf0f56	sql		\N	3.5.3	common	\N	8226276678
superadmin	sorlov	classpath:liquibase/migration/2017-01-13-bootstrap.sql	2017-07-03 05:29:14.08225	4	EXECUTED	7:f98586e3310afc3954c8b6179dae3d44	sql		\N	3.5.3	common	\N	9059753912
new-fields	komissarov	classpath:liquibase/migration/2017-01-13-bootstrap.sql	2017-07-07 07:28:10.618178	5	EXECUTED	7:b9a89dd64a8ed8b61cf1e68d3fdfa7f7	sql		\N	3.5.3	common	\N	9412490251
add-admin-name	savchuk	classpath:liquibase/migration/2017-01-13-bootstrap.sql	2017-07-07 07:28:17.911495	6	EXECUTED	7:0af6d37fbc4069f3639722bbc772c23f	sql		\N	3.5.3	common	\N	9412490251
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: webadmin; Owner: -
--

COPY webadmin.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: task_meta_data; Type: TABLE DATA; Schema: webadmin; Owner: -
--

COPY webadmin.task_meta_data (id, timing_type, period_type, cron_expression) FROM stdin;
\.


--
-- Data for Name: user_account; Type: TABLE DATA; Schema: webadmin; Owner: -
--

COPY webadmin.user_account (id, username, password, enable, name, email, avatar) FROM stdin;
2	superadmin	$2a$10$1kYm074QefxNtkW0BXra2.HoWekdi3mlJQggmomMeePZdvcFpcrne	t	Super Admin	\N	\N
1	admin	$2a$10$jvA61wIVl9NhV2VMBDMTOeeMZ4LuJ373q4kG7jXDshVoxYz6Xbpn6	t	Admin	\N	\N
\.


--
-- Name: user_account_id_seq; Type: SEQUENCE SET; Schema: webadmin; Owner: -
--

SELECT pg_catalog.setval('webadmin.user_account_id_seq', 8, true);


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: webadmin; Owner: -
--

COPY webadmin.user_role (user_id, role) FROM stdin;
1	ADMIN
2	SUPERADMIN
\.


--
-- Name: confirmation confirmation_action_user_account_id_code_confirmed_expirati_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.confirmation
    ADD CONSTRAINT confirmation_action_user_account_id_code_confirmed_expirati_key UNIQUE (action, user_account_id, code, confirmed, expiration_date);


--
-- Name: confirmation confirmation_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.confirmation
    ADD CONSTRAINT confirmation_pkey PRIMARY KEY (id);


--
-- Name: data_property_group data_property_group_name_data_property_section_id_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.data_property_group
    ADD CONSTRAINT data_property_group_name_data_property_section_id_key UNIQUE (name, data_property_section_id);


--
-- Name: data_property_group data_property_group_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.data_property_group
    ADD CONSTRAINT data_property_group_pkey PRIMARY KEY (id);


--
-- Name: data_property data_property_name_data_property_group_id_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.data_property
    ADD CONSTRAINT data_property_name_data_property_group_id_key UNIQUE (name, data_property_group_id);


--
-- Name: data_property data_property_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.data_property
    ADD CONSTRAINT data_property_pkey PRIMARY KEY (id);


--
-- Name: data_property_section data_property_section_name_application_group_id_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.data_property_section
    ADD CONSTRAINT data_property_section_name_application_group_id_key UNIQUE (name, application_group_id);


--
-- Name: data_property_section data_property_section_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.data_property_section
    ADD CONSTRAINT data_property_section_pkey PRIMARY KEY (id);


--
-- Name: ldap_configuration ldap_configuration_application_group_id_domain_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.ldap_configuration
    ADD CONSTRAINT ldap_configuration_application_group_id_domain_key UNIQUE (application_group_id, domain);


--
-- Name: ldap_configuration ldap_configuration_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.ldap_configuration
    ADD CONSTRAINT ldap_configuration_pkey PRIMARY KEY (id);


--
-- Name: service_account login_unique; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_account
    ADD CONSTRAINT login_unique UNIQUE (login, application_group_id);


--
-- Name: mobile_app_domain mobile_app_domain_domain_name_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.mobile_app_domain
    ADD CONSTRAINT mobile_app_domain_domain_name_key UNIQUE (domain_name);


--
-- Name: mobile_app_domain mobile_app_domain_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.mobile_app_domain
    ADD CONSTRAINT mobile_app_domain_pkey PRIMARY KEY (domain_name, application_id);


--
-- Name: mobile_app_instance mobile_app_instance_external_id_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.mobile_app_instance
    ADD CONSTRAINT mobile_app_instance_external_id_key UNIQUE (external_id);


--
-- Name: mobile_app_instance mobile_app_instance_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.mobile_app_instance
    ADD CONSTRAINT mobile_app_instance_pkey PRIMARY KEY (id);


--
-- Name: mobile_app mobile_app_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.mobile_app
    ADD CONSTRAINT mobile_app_pkey PRIMARY KEY (id);


--
-- Name: user_password password_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_password
    ADD CONSTRAINT password_pkey PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: service_account service_account_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_account
    ADD CONSTRAINT service_account_pkey PRIMARY KEY (id);


--
-- Name: service_account_roles service_account_roles_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_account_roles
    ADD CONSTRAINT service_account_roles_pkey PRIMARY KEY (role_id, account_id);


--
-- Name: service_account service_account_uuid_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_account
    ADD CONSTRAINT service_account_uuid_key UNIQUE (uuid);


--
-- Name: application_group service_name_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.application_group
    ADD CONSTRAINT service_name_key UNIQUE (name);


--
-- Name: service_permission service_permission_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_permission
    ADD CONSTRAINT service_permission_pkey PRIMARY KEY (id);


--
-- Name: service_permission_type service_permission_type_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_permission_type
    ADD CONSTRAINT service_permission_type_pkey PRIMARY KEY (id);


--
-- Name: application_group service_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.application_group
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: service_permission service_resource_type_group_unique; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_permission
    ADD CONSTRAINT service_resource_type_group_unique UNIQUE (resource_id, permission_type_id, application_group_id);


--
-- Name: service_role service_role_name_by_group_unique; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_role
    ADD CONSTRAINT service_role_name_by_group_unique UNIQUE (name, application_group_id);


--
-- Name: service_role_permissions service_role_permissions_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_role_permissions
    ADD CONSTRAINT service_role_permissions_pkey PRIMARY KEY (role_id, permission_id);


--
-- Name: service_role service_role_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_role
    ADD CONSTRAINT service_role_pkey PRIMARY KEY (id);


--
-- Name: service_session service_session_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_session
    ADD CONSTRAINT service_session_pkey PRIMARY KEY (id);


--
-- Name: user_account user_account_application_group_id_email_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account
    ADD CONSTRAINT user_account_application_group_id_email_key UNIQUE (application_group_id, email);


--
-- Name: user_account user_account_application_group_id_msisdn_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account
    ADD CONSTRAINT user_account_application_group_id_msisdn_key UNIQUE (application_group_id, msisdn);


--
-- Name: user_account user_account_application_group_id_oauth1_twitter_user_id_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account
    ADD CONSTRAINT user_account_application_group_id_oauth1_twitter_user_id_key UNIQUE (application_group_id, oauth1_twitter_user_id);


--
-- Name: user_account user_account_application_group_id_oauth2_facebook_user_id_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account
    ADD CONSTRAINT user_account_application_group_id_oauth2_facebook_user_id_key UNIQUE (application_group_id, oauth2_facebook_user_id);


--
-- Name: user_account user_account_application_group_id_oauth2_google_user_id_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account
    ADD CONSTRAINT user_account_application_group_id_oauth2_google_user_id_key UNIQUE (application_group_id, oauth2_google_user_id);


--
-- Name: user_account user_account_application_group_id_oauth2_microsoft_user_id_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account
    ADD CONSTRAINT user_account_application_group_id_oauth2_microsoft_user_id_key UNIQUE (application_group_id, oauth2_microsoft_user_id);


--
-- Name: user_account user_account_application_group_id_oauth2_telegram_user_id_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account
    ADD CONSTRAINT user_account_application_group_id_oauth2_telegram_user_id_key UNIQUE (application_group_id, oauth2_telegram_user_id);


--
-- Name: user_account user_account_application_group_id_oauth2_vkontakte_user_id_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account
    ADD CONSTRAINT user_account_application_group_id_oauth2_vkontakte_user_id_key UNIQUE (application_group_id, oauth2_vkontakte_user_id);


--
-- Name: user_account user_account_login_service_id_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account
    ADD CONSTRAINT user_account_login_service_id_key UNIQUE (login, application_group_id);


--
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (id);


--
-- Name: user_accounts_roles user_accounts_roles_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_accounts_roles
    ADD CONSTRAINT user_accounts_roles_pkey PRIMARY KEY (role_id, account_id);


--
-- Name: user_data_property user_data_property_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_data_property
    ADD CONSTRAINT user_data_property_pkey PRIMARY KEY (id);


--
-- Name: user_permission user_permission_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_permission
    ADD CONSTRAINT user_permission_pkey PRIMARY KEY (id);


--
-- Name: user_permission_type user_permission_type_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_permission_type
    ADD CONSTRAINT user_permission_type_pkey PRIMARY KEY (id);


--
-- Name: user_permission user_resource_type_group_unique; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_permission
    ADD CONSTRAINT user_resource_type_group_unique UNIQUE (resource_id, permission_type_id, application_group_id);


--
-- Name: user_role user_role_name_application_group_id_key; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_role
    ADD CONSTRAINT user_role_name_application_group_id_key UNIQUE (name, application_group_id);


--
-- Name: user_role user_role_name_by_group_unique; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_role
    ADD CONSTRAINT user_role_name_by_group_unique UNIQUE (name, application_group_id);


--
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);


--
-- Name: user_roles_permissions user_roles_permissions_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_roles_permissions
    ADD CONSTRAINT user_roles_permissions_pkey PRIMARY KEY (role_id, permission_id);


--
-- Name: user_session user_session_pkey; Type: CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_session
    ADD CONSTRAINT user_session_pkey PRIMARY KEY (id);


--
-- Name: abstract_backend_descriptor abstract_backend_descriptor_application_group_id_name_key; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.abstract_backend_descriptor
    ADD CONSTRAINT abstract_backend_descriptor_application_group_id_name_key UNIQUE (application_group_id, name);


--
-- Name: abstract_backend_descriptor abstract_backend_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.abstract_backend_descriptor
    ADD CONSTRAINT abstract_backend_descriptor_pkey PRIMARY KEY (id);


--
-- Name: abstract_endpoint_descriptor abstract_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.abstract_endpoint_descriptor
    ADD CONSTRAINT abstract_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: adapter_backend_convertation adapter_backend_convertation_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.adapter_backend_convertation
    ADD CONSTRAINT adapter_backend_convertation_pkey PRIMARY KEY (id);


--
-- Name: adapter_endpoint_default_param adapter_endpoint_default_param_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.adapter_endpoint_default_param
    ADD CONSTRAINT adapter_endpoint_default_param_pkey PRIMARY KEY (id);


--
-- Name: adapter_endpoint_descriptor adapter_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.adapter_endpoint_descriptor
    ADD CONSTRAINT adapter_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: aggregate_endpoint_descriptor aggregate_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.aggregate_endpoint_descriptor
    ADD CONSTRAINT aggregate_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: awip_backend_descriptor awip_backend_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.awip_backend_descriptor
    ADD CONSTRAINT awip_backend_descriptor_pkey PRIMARY KEY (id);


--
-- Name: awip_endpoint_descriptor awip_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.awip_endpoint_descriptor
    ADD CONSTRAINT awip_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: cache_settings cache_settings_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.cache_settings
    ADD CONSTRAINT cache_settings_pkey PRIMARY KEY (end_point_descriptor_id);


--
-- Name: chain_endpoint_descriptor chain_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.chain_endpoint_descriptor
    ADD CONSTRAINT chain_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: chain_parameter_mapping chain_parameter_mapping_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.chain_parameter_mapping
    ADD CONSTRAINT chain_parameter_mapping_pkey PRIMARY KEY (id);


--
-- Name: composite_backend_descriptor composite_backend_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.composite_backend_descriptor
    ADD CONSTRAINT composite_backend_descriptor_pkey PRIMARY KEY (id);


--
-- Name: data_type_mdm_settings data_type_mdm_settings_application_group_id_collection_key; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type_mdm_settings
    ADD CONSTRAINT data_type_mdm_settings_application_group_id_collection_key UNIQUE (application_group_id, collection);


--
-- Name: data_type_mdm_settings data_type_mdm_settings_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type_mdm_settings
    ADD CONSTRAINT data_type_mdm_settings_pkey PRIMARY KEY (id);


--
-- Name: data_type_object_property data_type_object_property_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type_object_property
    ADD CONSTRAINT data_type_object_property_pkey PRIMARY KEY (id);


--
-- Name: data_type data_type_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type
    ADD CONSTRAINT data_type_pkey PRIMARY KEY (id);


--
-- Name: emp_backend_descriptor emp_backend_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.emp_backend_descriptor
    ADD CONSTRAINT emp_backend_descriptor_pkey PRIMARY KEY (id);


--
-- Name: emp_endpoint_descriptor emp_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.emp_endpoint_descriptor
    ADD CONSTRAINT emp_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: endpoint_param_descriptor endpoint_param_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.endpoint_param_descriptor
    ADD CONSTRAINT endpoint_param_descriptor_pkey PRIMARY KEY (id);


--
-- Name: external_backend_descriptor external_backend_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.external_backend_descriptor
    ADD CONSTRAINT external_backend_descriptor_pkey PRIMARY KEY (id);


--
-- Name: external_endpoint_descriptor external_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.external_endpoint_descriptor
    ADD CONSTRAINT external_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: jdbc_backend_descriptor jdbc_backend_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_backend_descriptor
    ADD CONSTRAINT jdbc_backend_descriptor_pkey PRIMARY KEY (id);


--
-- Name: jdbc_driver jdbc_driver_driver_class_key; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_driver
    ADD CONSTRAINT jdbc_driver_driver_class_key UNIQUE (driver_class);


--
-- Name: jdbc_driver jdbc_driver_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_driver
    ADD CONSTRAINT jdbc_driver_pkey PRIMARY KEY (id);


--
-- Name: jdbc_endpoint_descriptor jdbc_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_endpoint_descriptor
    ADD CONSTRAINT jdbc_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: jdbc_url_parameter jdbc_url_parameter_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_url_parameter
    ADD CONSTRAINT jdbc_url_parameter_pkey PRIMARY KEY (id);


--
-- Name: jdbc_url_parameter_string_example_value jdbc_url_parameter_string_example_value_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_url_parameter_string_example_value
    ADD CONSTRAINT jdbc_url_parameter_string_example_value_pkey PRIMARY KEY (id);


--
-- Name: mdm_backend_descriptor mdm_backend_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.mdm_backend_descriptor
    ADD CONSTRAINT mdm_backend_descriptor_pkey PRIMARY KEY (id);


--
-- Name: mdm_endpoint_descriptor mdm_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.mdm_endpoint_descriptor
    ADD CONSTRAINT mdm_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: mongo_backend_descriptor mongo_backend_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.mongo_backend_descriptor
    ADD CONSTRAINT mongo_backend_descriptor_pkey PRIMARY KEY (id);


--
-- Name: mongo_endpoint_descriptor mongo_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.mongo_endpoint_descriptor
    ADD CONSTRAINT mongo_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: mq_backend_descriptor mq_backend_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.mq_backend_descriptor
    ADD CONSTRAINT mq_backend_descriptor_pkey PRIMARY KEY (id);


--
-- Name: mq_endpoint_descriptor mq_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.mq_endpoint_descriptor
    ADD CONSTRAINT mq_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: rest_backend_descriptor rest_backend_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.rest_backend_descriptor
    ADD CONSTRAINT rest_backend_descriptor_pkey PRIMARY KEY (id);


--
-- Name: rest_endpoint_descriptor rest_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.rest_endpoint_descriptor
    ADD CONSTRAINT rest_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: split_endpoint_descriptor split_endpoint_descriptor_pkey; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.split_endpoint_descriptor
    ADD CONSTRAINT split_endpoint_descriptor_pkey PRIMARY KEY (id);


--
-- Name: abstract_endpoint_descriptor uniq_endpoint_name__backend; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.abstract_endpoint_descriptor
    ADD CONSTRAINT uniq_endpoint_name__backend UNIQUE (name, backend_descriptor_id);


--
-- Name: endpoint_param_descriptor uniq_endpoint_param_name__endpoint; Type: CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.endpoint_param_descriptor
    ADD CONSTRAINT uniq_endpoint_param_name__endpoint UNIQUE (name, endpoint_descriptor_id);


--
-- Name: slots slots_pkey; Type: CONSTRAINT; Schema: booking; Owner: -
--

ALTER TABLE ONLY booking.slots
    ADD CONSTRAINT slots_pkey PRIMARY KEY (id);


--
-- Name: role UQ_role_name; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.role
    ADD CONSTRAINT "UQ_role_name" UNIQUE (name);


--
-- Name: account_action account_action_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.account_action
    ADD CONSTRAINT account_action_pkey PRIMARY KEY (id);


--
-- Name: account account_login_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.account
    ADD CONSTRAINT account_login_key UNIQUE (login);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: account_roles account_roles_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.account_roles
    ADD CONSTRAINT account_roles_pkey PRIMARY KEY (account_id, role_id);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: attachment attachment_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.attachment
    ADD CONSTRAINT attachment_pkey PRIMARY KEY (id);


--
-- Name: available_endpoint available_endpoint_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.available_endpoint
    ADD CONSTRAINT available_endpoint_pkey PRIMARY KEY (id);


--
-- Name: bookmark_favorite_screen bookmark_favorite_screen_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.bookmark_favorite_screen
    ADD CONSTRAINT bookmark_favorite_screen_pkey PRIMARY KEY (id);


--
-- Name: bookmark_history_screen bookmark_history_screen_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.bookmark_history_screen
    ADD CONSTRAINT bookmark_history_screen_pkey PRIMARY KEY (id);


--
-- Name: chat_channel chat_channel_name_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.chat_channel
    ADD CONSTRAINT chat_channel_name_key UNIQUE (name);


--
-- Name: chat_channel chat_channel_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.chat_channel
    ADD CONSTRAINT chat_channel_pkey PRIMARY KEY (id);


--
-- Name: complain_field complain_field_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_field
    ADD CONSTRAINT complain_field_pkey PRIMARY KEY (id);


--
-- Name: complain_field_value complain_field_value_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_field_value
    ADD CONSTRAINT complain_field_value_pkey PRIMARY KEY (id);


--
-- Name: complain_group_has_role complain_group_has_role_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_group_has_role
    ADD CONSTRAINT complain_group_has_role_pkey PRIMARY KEY (complaint_group_id, role_id);


--
-- Name: complain_group complain_group_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_group
    ADD CONSTRAINT complain_group_pkey PRIMARY KEY (id);


--
-- Name: complain_history complain_history_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_history
    ADD CONSTRAINT complain_history_pkey PRIMARY KEY (id);


--
-- Name: complain complain_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain
    ADD CONSTRAINT complain_pkey PRIMARY KEY (id);


--
-- Name: complain_status_has_role complain_status_has_role_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_status_has_role
    ADD CONSTRAINT complain_status_has_role_pkey PRIMARY KEY (complaint_status_id, role_id);


--
-- Name: complain_status complain_status_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_status
    ADD CONSTRAINT complain_status_pkey PRIMARY KEY (id);


--
-- Name: complain_status_workflow complain_status_workflow_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_status_workflow
    ADD CONSTRAINT complain_status_workflow_pkey PRIMARY KEY (id);


--
-- Name: complain_type_news_category complain_type_news_category_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_type_news_category
    ADD CONSTRAINT complain_type_news_category_pkey PRIMARY KEY (complain_type_id);


--
-- Name: complain_type complain_type_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_type
    ADD CONSTRAINT complain_type_pkey PRIMARY KEY (id);


--
-- Name: complain_workflow_has_field complain_workflow_has_field_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_workflow_has_field
    ADD CONSTRAINT complain_workflow_has_field_pkey PRIMARY KEY (complaint_workflow_id, field_id);


--
-- Name: complain_workflow_has_role complain_workflow_has_role_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_workflow_has_role
    ADD CONSTRAINT complain_workflow_has_role_pkey PRIMARY KEY (complain_status_workflow_id, role_id);


--
-- Name: complaint_performance_type complaint_performance_type_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complaint_performance_type
    ADD CONSTRAINT complaint_performance_type_pkey PRIMARY KEY (id);


--
-- Name: complaint_performance_value complaint_performance_value_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complaint_performance_value
    ADD CONSTRAINT complaint_performance_value_pkey PRIMARY KEY (id);


--
-- Name: complaint_statistic_by_type complaint_statistic_by_type_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complaint_statistic_by_type
    ADD CONSTRAINT complaint_statistic_by_type_pkey PRIMARY KEY (id);


--
-- Name: confirmation confirmation_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.confirmation
    ADD CONSTRAINT confirmation_pkey PRIMARY KEY (id);


--
-- Name: electricity_meter electricity_meter_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.electricity_meter
    ADD CONSTRAINT electricity_meter_pkey PRIMARY KEY (id);


--
-- Name: electricity_meter_value electricity_meter_value_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.electricity_meter_value
    ADD CONSTRAINT electricity_meter_value_pkey PRIMARY KEY (id);


--
-- Name: evacuation evacuation_grn_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.evacuation
    ADD CONSTRAINT evacuation_grn_key UNIQUE (grn);


--
-- Name: evacuation evacuation_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.evacuation
    ADD CONSTRAINT evacuation_pkey PRIMARY KEY (id);


--
-- Name: evacuation evacuation_sts_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.evacuation
    ADD CONSTRAINT evacuation_sts_key UNIQUE (sts);


--
-- Name: flow flow_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.flow
    ADD CONSTRAINT flow_pkey PRIMARY KEY (id);


--
-- Name: house house_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.house
    ADD CONSTRAINT house_pkey PRIMARY KEY (id);


--
-- Name: med_clinic_link med_clinic_link_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_clinic_link
    ADD CONSTRAINT med_clinic_link_pkey PRIMARY KEY (id);


--
-- Name: med_doctor med_doctor_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_doctor
    ADD CONSTRAINT med_doctor_pkey PRIMARY KEY (id);


--
-- Name: med_doctor_speciality med_doctor_speciality_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_doctor_speciality
    ADD CONSTRAINT med_doctor_speciality_pkey PRIMARY KEY (id);


--
-- Name: med_hospital med_hospital_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital
    ADD CONSTRAINT med_hospital_pkey PRIMARY KEY (id);


--
-- Name: med_hospital_unit_favorite med_hospital_unit_favorite_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital_unit_favorite
    ADD CONSTRAINT med_hospital_unit_favorite_pkey PRIMARY KEY (id);


--
-- Name: med_hospital_unit med_hospital_unit_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital_unit
    ADD CONSTRAINT med_hospital_unit_pkey PRIMARY KEY (id);


--
-- Name: med_hospital_unit med_hospital_unit_unique; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital_unit
    ADD CONSTRAINT med_hospital_unit_unique UNIQUE (doctor_id, speciality_id, hospital_id);


--
-- Name: med_policy med_policy_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_policy
    ADD CONSTRAINT med_policy_pkey PRIMARY KEY (id);


--
-- Name: med_speciality med_speciality_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_speciality
    ADD CONSTRAINT med_speciality_pkey PRIMARY KEY (id);


--
-- Name: med_treatment_day med_treatment_day_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_treatment_day
    ADD CONSTRAINT med_treatment_day_pkey PRIMARY KEY (id);


--
-- Name: med_treatment_slot med_treatment_slot_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_treatment_slot
    ADD CONSTRAINT med_treatment_slot_pkey PRIMARY KEY (id);


--
-- Name: message message_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- Name: message_tag message_tag_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.message_tag
    ADD CONSTRAINT message_tag_pkey PRIMARY KEY (id);


--
-- Name: mime_type mime_type_name_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.mime_type
    ADD CONSTRAINT mime_type_name_key UNIQUE (name);


--
-- Name: mime_type mime_type_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.mime_type
    ADD CONSTRAINT mime_type_pkey PRIMARY KEY (id);


--
-- Name: news_category news_category_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_category
    ADD CONSTRAINT news_category_pkey PRIMARY KEY (id);


--
-- Name: news_element_has_category news_element_has_category_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_element_has_category
    ADD CONSTRAINT news_element_has_category_pkey PRIMARY KEY (news_element_id, news_category_id);


--
-- Name: news_element_has_tag news_element_has_tag_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_element_has_tag
    ADD CONSTRAINT news_element_has_tag_pkey PRIMARY KEY (news_element_id, news_tag_id);


--
-- Name: news_element news_element_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_element
    ADD CONSTRAINT news_element_pkey PRIMARY KEY (id);


--
-- Name: news_tag news_tag_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_tag
    ADD CONSTRAINT news_tag_pkey PRIMARY KEY (id);


--
-- Name: news_user_info news_user_info_news_id_user_id_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_user_info
    ADD CONSTRAINT news_user_info_news_id_user_id_key UNIQUE (news_id, user_id);


--
-- Name: news_user_info news_user_info_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_user_info
    ADD CONSTRAINT news_user_info_pkey PRIMARY KEY (id);


--
-- Name: offence offence_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.offence
    ADD CONSTRAINT offence_pkey PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: polls polls_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.polls
    ADD CONSTRAINT polls_pkey PRIMARY KEY (id);


--
-- Name: profile_attribute profile_attribute_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.profile_attribute
    ADD CONSTRAINT profile_attribute_pkey PRIMARY KEY (id);


--
-- Name: profile_important_attribute profile_important_attribute_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.profile_important_attribute
    ADD CONSTRAINT profile_important_attribute_pkey PRIMARY KEY (id);


--
-- Name: published published_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.published
    ADD CONSTRAINT published_pkey PRIMARY KEY (id);


--
-- Name: published published_poll_id_person_id_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.published
    ADD CONSTRAINT published_poll_id_person_id_key UNIQUE (poll_id, person_id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: role_links role_links_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.role_links
    ADD CONSTRAINT role_links_pkey PRIMARY KEY (parent_id, child_id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: service_category service_category_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_category
    ADD CONSTRAINT service_category_pkey PRIMARY KEY (id);


--
-- Name: service_favorite_param service_favorite_param_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_favorite_param
    ADD CONSTRAINT service_favorite_param_pkey PRIMARY KEY (id);


--
-- Name: service_favorite service_favorite_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_favorite
    ADD CONSTRAINT service_favorite_pkey PRIMARY KEY (id);


--
-- Name: service_history_param service_history_param_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_history_param
    ADD CONSTRAINT service_history_param_pkey PRIMARY KEY (id);


--
-- Name: service_history service_history_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_history
    ADD CONSTRAINT service_history_pkey PRIMARY KEY (id);


--
-- Name: service_param service_param_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_param
    ADD CONSTRAINT service_param_pkey PRIMARY KEY (id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: service_subscription_param service_subscription_param_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_subscription_param
    ADD CONSTRAINT service_subscription_param_pkey PRIMARY KEY (id);


--
-- Name: service_subscription service_subscription_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_subscription
    ADD CONSTRAINT service_subscription_pkey PRIMARY KEY (id);


--
-- Name: slot_group slot_group_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.slot_group
    ADD CONSTRAINT slot_group_pkey PRIMARY KEY (id);


--
-- Name: slot_history_attachment slot_history_attachment_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.slot_history_attachment
    ADD CONSTRAINT slot_history_attachment_pkey PRIMARY KEY (id);


--
-- Name: slot_history slot_history_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.slot_history
    ADD CONSTRAINT slot_history_pkey PRIMARY KEY (id);


--
-- Name: statistic_type statistic_type_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.statistic_type
    ADD CONSTRAINT statistic_type_pkey PRIMARY KEY (id);


--
-- Name: statistic_value statistic_value_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.statistic_value
    ADD CONSTRAINT statistic_value_pkey PRIMARY KEY (id);


--
-- Name: supervisor supervisor_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.supervisor
    ADD CONSTRAINT supervisor_pkey PRIMARY KEY (id);


--
-- Name: text_service_category text_service_category_name_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.text_service_category
    ADD CONSTRAINT text_service_category_name_key UNIQUE (name);


--
-- Name: text_service_category text_service_category_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.text_service_category
    ADD CONSTRAINT text_service_category_pkey PRIMARY KEY (id);


--
-- Name: text_service text_service_command_regexp_channel_type_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.text_service
    ADD CONSTRAINT text_service_command_regexp_channel_type_key UNIQUE (command_regexp, channel_type);


--
-- Name: text_service_group text_service_group_name_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.text_service_group
    ADD CONSTRAINT text_service_group_name_key UNIQUE (name);


--
-- Name: text_service_group text_service_group_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.text_service_group
    ADD CONSTRAINT text_service_group_pkey PRIMARY KEY (id);


--
-- Name: text_service text_service_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.text_service
    ADD CONSTRAINT text_service_pkey PRIMARY KEY (id);


--
-- Name: transaction transaction_message_id_status_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.transaction
    ADD CONSTRAINT transaction_message_id_status_key UNIQUE (message_id, status);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: translation translation_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.translation
    ADD CONSTRAINT translation_pkey PRIMARY KEY (lang);


--
-- Name: ui_config ui_config_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.ui_config
    ADD CONSTRAINT ui_config_pkey PRIMARY KEY (system_name);


--
-- Name: med_clinic_link uq_clinic_id__link_type__operator_id; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_clinic_link
    ADD CONSTRAINT uq_clinic_id__link_type__operator_id UNIQUE (clinic_id, link_type, operator_id);


--
-- Name: user_subscription uq_user_id__type__channel; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_subscription
    ADD CONSTRAINT uq_user_id__type__channel UNIQUE (user_id, type, channel);


--
-- Name: user_answers user_answers_person_id_question_id_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_answers
    ADD CONSTRAINT user_answers_person_id_question_id_key UNIQUE (person_id, question_id);


--
-- Name: user_answers user_answers_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_answers
    ADD CONSTRAINT user_answers_pkey PRIMARY KEY (id);


--
-- Name: user_houses user_houses_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_houses
    ADD CONSTRAINT user_houses_pkey PRIMARY KEY (id);


--
-- Name: user_info user_info_external_id_key; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_info
    ADD CONSTRAINT user_info_external_id_key UNIQUE (external_id);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (id);


--
-- Name: user_profile_info user_info_unique_idx; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_profile_info
    ADD CONSTRAINT user_info_unique_idx UNIQUE (user_info_id);


--
-- Name: user_profile_info user_profile_info_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_profile_info
    ADD CONSTRAINT user_profile_info_pkey PRIMARY KEY (id);


--
-- Name: user_request_abstract user_request_abstract_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_abstract
    ADD CONSTRAINT user_request_abstract_pkey PRIMARY KEY (id);


--
-- Name: user_request_epd user_request_epd_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_epd
    ADD CONSTRAINT user_request_epd_pkey PRIMARY KEY (id);


--
-- Name: user_request_feedback user_request_feedback_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_feedback
    ADD CONSTRAINT user_request_feedback_pkey PRIMARY KEY (id);


--
-- Name: user_request_history user_request_history_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_history
    ADD CONSTRAINT user_request_history_pkey PRIMARY KEY (id);


--
-- Name: user_request_sos user_request_sos_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_sos
    ADD CONSTRAINT user_request_sos_pkey PRIMARY KEY (id);


--
-- Name: user_subscription user_subscription_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_subscription
    ADD CONSTRAINT user_subscription_pkey PRIMARY KEY (id);


--
-- Name: user_translation user_translation_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_translation
    ADD CONSTRAINT user_translation_pkey PRIMARY KEY (lang);


--
-- Name: vaccination_plan vaccination_plan_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.vaccination_plan
    ADD CONSTRAINT vaccination_plan_pkey PRIMARY KEY (id);


--
-- Name: vaccination_plan_type vaccination_plan_type_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.vaccination_plan_type
    ADD CONSTRAINT vaccination_plan_type_pkey PRIMARY KEY (id);


--
-- Name: vaccination_status vaccination_status_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.vaccination_status
    ADD CONSTRAINT vaccination_status_pkey PRIMARY KEY (id);


--
-- Name: water_meter water_meter_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.water_meter
    ADD CONSTRAINT water_meter_pkey PRIMARY KEY (id);


--
-- Name: water_meter_value water_meter_value_pkey; Type: CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.water_meter_value
    ADD CONSTRAINT water_meter_value_pkey PRIMARY KEY (id);


--
-- Name: chat UQ_userId__channelId; Type: CONSTRAINT; Schema: cityservices_chats; Owner: -
--

ALTER TABLE ONLY cityservices_chats.chat
    ADD CONSTRAINT "UQ_userId__channelId" UNIQUE (user_id, channel_id);


--
-- Name: chat chat_pkey; Type: CONSTRAINT; Schema: cityservices_chats; Owner: -
--

ALTER TABLE ONLY cityservices_chats.chat
    ADD CONSTRAINT chat_pkey PRIMARY KEY (id);


--
-- Name: communication_journal communication_journal_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.communication_journal
    ADD CONSTRAINT communication_journal_pkey PRIMARY KEY (id);


--
-- Name: communication communication_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.communication
    ADD CONSTRAINT communication_pkey PRIMARY KEY (id);


--
-- Name: communication_statistic_type communication_statistic_type_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.communication_statistic_type
    ADD CONSTRAINT communication_statistic_type_pkey PRIMARY KEY (id);


--
-- Name: communication_statistic_value communication_statistic_value_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.communication_statistic_value
    ADD CONSTRAINT communication_statistic_value_pkey PRIMARY KEY (id);


--
-- Name: distribution_channel distribution_channel_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_channel
    ADD CONSTRAINT distribution_channel_pkey PRIMARY KEY (id);


--
-- Name: distribution_group_has_user distribution_group_has_user_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_group_has_user
    ADD CONSTRAINT distribution_group_has_user_pkey PRIMARY KEY (distribution_group_id, user_id);


--
-- Name: distribution_group distribution_group_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_group
    ADD CONSTRAINT distribution_group_pkey PRIMARY KEY (id);


--
-- Name: distribution_has_distribution_template distribution_has_distribution_template_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_has_distribution_template
    ADD CONSTRAINT distribution_has_distribution_template_pkey PRIMARY KEY (distribution_template_id, distribution_id);


--
-- Name: distribution_journal distribution_journal_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_journal
    ADD CONSTRAINT distribution_journal_pkey PRIMARY KEY (id);


--
-- Name: distribution_log distribution_log_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_log
    ADD CONSTRAINT distribution_log_pkey PRIMARY KEY (id);


--
-- Name: distribution distribution_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution
    ADD CONSTRAINT distribution_pkey PRIMARY KEY (id);


--
-- Name: distribution_template_group distribution_template_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_template_group
    ADD CONSTRAINT distribution_template_pkey PRIMARY KEY (id);


--
-- Name: distribution_template distribution_template_pkey1; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_template
    ADD CONSTRAINT distribution_template_pkey1 PRIMARY KEY (id);


--
-- Name: qrtz_blob_triggers qrtz_blob_triggers_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_calendars qrtz_calendars_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_calendars
    ADD CONSTRAINT qrtz_calendars_pkey PRIMARY KEY (sched_name, calendar_name);


--
-- Name: qrtz_cron_triggers qrtz_cron_triggers_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_fired_triggers qrtz_fired_triggers_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_fired_triggers
    ADD CONSTRAINT qrtz_fired_triggers_pkey PRIMARY KEY (sched_name, entry_id);


--
-- Name: qrtz_job_details qrtz_job_details_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_job_details
    ADD CONSTRAINT qrtz_job_details_pkey PRIMARY KEY (sched_name, job_name, job_group);


--
-- Name: qrtz_locks qrtz_locks_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_locks
    ADD CONSTRAINT qrtz_locks_pkey PRIMARY KEY (sched_name, lock_name);


--
-- Name: qrtz_paused_trigger_grps qrtz_paused_trigger_grps_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_paused_trigger_grps
    ADD CONSTRAINT qrtz_paused_trigger_grps_pkey PRIMARY KEY (sched_name, trigger_group);


--
-- Name: qrtz_scheduler_state qrtz_scheduler_state_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_scheduler_state
    ADD CONSTRAINT qrtz_scheduler_state_pkey PRIMARY KEY (sched_name, instance_name);


--
-- Name: qrtz_simple_triggers qrtz_simple_triggers_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers qrtz_triggers_pkey; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: distribution_template uniq_distribution_template_distribution_template; Type: CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_template
    ADD CONSTRAINT uniq_distribution_template_distribution_template UNIQUE (group_id, channel_id);


--
-- Name: engagement_index date_time_unique_idx; Type: CONSTRAINT; Schema: cityservices_metric; Owner: -
--

ALTER TABLE ONLY cityservices_metric.engagement_index
    ADD CONSTRAINT date_time_unique_idx UNIQUE (date, "time");


--
-- Name: engagement_index engagement_index_pkey; Type: CONSTRAINT; Schema: cityservices_metric; Owner: -
--

ALTER TABLE ONLY cityservices_metric.engagement_index
    ADD CONSTRAINT engagement_index_pkey PRIMARY KEY (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: cityservices_metric; Owner: -
--

ALTER TABLE ONLY cityservices_metric.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: profile_info_index profile_info_date_time_unique_idx; Type: CONSTRAINT; Schema: cityservices_metric; Owner: -
--

ALTER TABLE ONLY cityservices_metric.profile_info_index
    ADD CONSTRAINT profile_info_date_time_unique_idx UNIQUE (date, "time");


--
-- Name: profile_info_index profile_info_index_pkey; Type: CONSTRAINT; Schema: cityservices_metric; Owner: -
--

ALTER TABLE ONLY cityservices_metric.profile_info_index
    ADD CONSTRAINT profile_info_index_pkey PRIMARY KEY (id);


--
-- Name: email_account email_account_ext_id_key; Type: CONSTRAINT; Schema: email; Owner: -
--

ALTER TABLE ONLY email.email_account
    ADD CONSTRAINT email_account_ext_id_key UNIQUE (application_group);


--
-- Name: email_account email_account_pkey; Type: CONSTRAINT; Schema: email; Owner: -
--

ALTER TABLE ONLY email.email_account
    ADD CONSTRAINT email_account_pkey PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: email; Owner: -
--

ALTER TABLE ONLY email.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: smtp_server smtp_server_host_port_encryption_key; Type: CONSTRAINT; Schema: email; Owner: -
--

ALTER TABLE ONLY email.smtp_server
    ADD CONSTRAINT smtp_server_host_port_encryption_key UNIQUE (host, port, encryption);


--
-- Name: smtp_server smtp_server_pkey; Type: CONSTRAINT; Schema: email; Owner: -
--

ALTER TABLE ONLY email.smtp_server
    ADD CONSTRAINT smtp_server_pkey PRIMARY KEY (id);


--
-- Name: address_cache address_cache_pkey; Type: CONSTRAINT; Schema: gis; Owner: -
--

ALTER TABLE ONLY gis.address_cache
    ADD CONSTRAINT address_cache_pkey PRIMARY KEY (lat, lon);


--
-- Name: bucket_info bucket_info_name_key; Type: CONSTRAINT; Schema: large_obj_storage; Owner: -
--

ALTER TABLE ONLY large_obj_storage.bucket_info
    ADD CONSTRAINT bucket_info_name_key UNIQUE (name);


--
-- Name: bucket_info bucket_info_pkey; Type: CONSTRAINT; Schema: large_obj_storage; Owner: -
--

ALTER TABLE ONLY large_obj_storage.bucket_info
    ADD CONSTRAINT bucket_info_pkey PRIMARY KEY (id);


--
-- Name: file_info file_info_name_bucket_id_key; Type: CONSTRAINT; Schema: large_obj_storage; Owner: -
--

ALTER TABLE ONLY large_obj_storage.file_info
    ADD CONSTRAINT file_info_name_bucket_id_key UNIQUE (name, bucket_id);


--
-- Name: file_info file_info_pkey; Type: CONSTRAINT; Schema: large_obj_storage; Owner: -
--

ALTER TABLE ONLY large_obj_storage.file_info
    ADD CONSTRAINT file_info_pkey PRIMARY KEY (id);


--
-- Name: config config_mobile_application_id_key; Type: CONSTRAINT; Schema: mobile_store; Owner: -
--

ALTER TABLE ONLY mobile_store.config
    ADD CONSTRAINT config_mobile_application_id_key UNIQUE (mobile_application_id);


--
-- Name: config config_pkey; Type: CONSTRAINT; Schema: mobile_store; Owner: -
--

ALTER TABLE ONLY mobile_store.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id);


--
-- Name: image image_mobile_application_id_is_main_key; Type: CONSTRAINT; Schema: mobile_store; Owner: -
--

ALTER TABLE ONLY mobile_store.image
    ADD CONSTRAINT image_mobile_application_id_is_main_key UNIQUE (mobile_application_id, is_main);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: mobile_store; Owner: -
--

ALTER TABLE ONLY mobile_store.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: message_bundle message_bundle_application_group_id_locale_key; Type: CONSTRAINT; Schema: mobile_store; Owner: -
--

ALTER TABLE ONLY mobile_store.message_bundle
    ADD CONSTRAINT message_bundle_application_group_id_locale_key UNIQUE (application_group_id, locale);


--
-- Name: message_bundle message_bundle_pkey; Type: CONSTRAINT; Schema: mobile_store; Owner: -
--

ALTER TABLE ONLY mobile_store.message_bundle
    ADD CONSTRAINT message_bundle_pkey PRIMARY KEY (id);


--
-- Name: view view_mobile_application_id_name_key; Type: CONSTRAINT; Schema: mobile_store; Owner: -
--

ALTER TABLE ONLY mobile_store.view
    ADD CONSTRAINT view_mobile_application_id_name_key UNIQUE (mobile_application_id, name);


--
-- Name: view view_pkey; Type: CONSTRAINT; Schema: mobile_store; Owner: -
--

ALTER TABLE ONLY mobile_store.view
    ADD CONSTRAINT view_pkey PRIMARY KEY (id);


--
-- Name: log log_pkey; Type: CONSTRAINT; Schema: notification; Owner: -
--

ALTER TABLE ONLY notification.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id);


--
-- Name: answer answer_pkey; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);


--
-- Name: poll_answer_profiling_point poll_answer_profiling_point_pkey; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.poll_answer_profiling_point
    ADD CONSTRAINT poll_answer_profiling_point_pkey PRIMARY KEY (answer_id, category_id);


--
-- Name: poll poll_pkey; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.poll
    ADD CONSTRAINT poll_pkey PRIMARY KEY (id);


--
-- Name: publishing publishing_pkey; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.publishing
    ADD CONSTRAINT publishing_pkey PRIMARY KEY (id);


--
-- Name: publishing publishing_poll_id_user_id_key; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.publishing
    ADD CONSTRAINT publishing_poll_id_user_id_key UNIQUE (poll_id, user_id);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: question question_poll_id_index_key; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.question
    ADD CONSTRAINT question_poll_id_index_key UNIQUE (poll_id, index);


--
-- Name: user_answer user_answer_pkey; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_answer
    ADD CONSTRAINT user_answer_pkey PRIMARY KEY (id);


--
-- Name: user_answer user_answer_user_question_id_answer_id_key; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_answer
    ADD CONSTRAINT user_answer_user_question_id_answer_id_key UNIQUE (user_question_id, answer_id);


--
-- Name: user_point_history user_point_history_pkey; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_point_history
    ADD CONSTRAINT user_point_history_pkey PRIMARY KEY (id);


--
-- Name: user_profiling_points user_profiling_points_pkey; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_profiling_points
    ADD CONSTRAINT user_profiling_points_pkey PRIMARY KEY (user_id, category_id);


--
-- Name: user_question user_question_pkey; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_question
    ADD CONSTRAINT user_question_pkey PRIMARY KEY (id);


--
-- Name: user_question user_question_user_id_question_id_key; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_question
    ADD CONSTRAINT user_question_user_id_question_id_key UNIQUE (user_id, question_id);


--
-- Name: user_status_log user_status_log_pkey; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_status_log
    ADD CONSTRAINT user_status_log_pkey PRIMARY KEY (id);


--
-- Name: user_status user_status_pkey; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_status
    ADD CONSTRAINT user_status_pkey PRIMARY KEY (id);


--
-- Name: user_status user_status_user_id_poll_id_key; Type: CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_status
    ADD CONSTRAINT user_status_user_id_poll_id_key UNIQUE (user_id, poll_id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: sample_data sample_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sample_data
    ADD CONSTRAINT sample_data_pkey PRIMARY KEY (id);


--
-- Name: certificate_android certificate_android_pkey; Type: CONSTRAINT; Schema: push; Owner: -
--

ALTER TABLE ONLY push.certificate_android
    ADD CONSTRAINT certificate_android_pkey PRIMARY KEY (id);


--
-- Name: certificate certificate_ext_id_key; Type: CONSTRAINT; Schema: push; Owner: -
--

ALTER TABLE ONLY push.certificate
    ADD CONSTRAINT certificate_ext_id_key UNIQUE (ext_id);


--
-- Name: certificate_ios certificate_ios_pkey; Type: CONSTRAINT; Schema: push; Owner: -
--

ALTER TABLE ONLY push.certificate_ios
    ADD CONSTRAINT certificate_ios_pkey PRIMARY KEY (id);


--
-- Name: certificate certificate_pkey; Type: CONSTRAINT; Schema: push; Owner: -
--

ALTER TABLE ONLY push.certificate
    ADD CONSTRAINT certificate_pkey PRIMARY KEY (id);


--
-- Name: certificate_winphone certificate_winphone_pkey; Type: CONSTRAINT; Schema: push; Owner: -
--

ALTER TABLE ONLY push.certificate_winphone
    ADD CONSTRAINT certificate_winphone_pkey PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: push; Owner: -
--

ALTER TABLE ONLY push.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: schedule UQ_dayOfWeek; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.schedule
    ADD CONSTRAINT "UQ_dayOfWeek" UNIQUE (resource_id, resource_instance_id, day_of_week);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: qrtz_blob_triggers qrtz_blob_triggers_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_calendars qrtz_calendars_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_calendars
    ADD CONSTRAINT qrtz_calendars_pkey PRIMARY KEY (sched_name, calendar_name);


--
-- Name: qrtz_cron_triggers qrtz_cron_triggers_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_fired_triggers qrtz_fired_triggers_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_fired_triggers
    ADD CONSTRAINT qrtz_fired_triggers_pkey PRIMARY KEY (sched_name, entry_id);


--
-- Name: qrtz_job_details qrtz_job_details_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_job_details
    ADD CONSTRAINT qrtz_job_details_pkey PRIMARY KEY (sched_name, job_name, job_group);


--
-- Name: qrtz_locks qrtz_locks_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_locks
    ADD CONSTRAINT qrtz_locks_pkey PRIMARY KEY (sched_name, lock_name);


--
-- Name: qrtz_paused_trigger_grps qrtz_paused_trigger_grps_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_paused_trigger_grps
    ADD CONSTRAINT qrtz_paused_trigger_grps_pkey PRIMARY KEY (sched_name, trigger_group);


--
-- Name: qrtz_scheduler_state qrtz_scheduler_state_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_scheduler_state
    ADD CONSTRAINT qrtz_scheduler_state_pkey PRIMARY KEY (sched_name, instance_name);


--
-- Name: qrtz_simple_triggers qrtz_simple_triggers_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers qrtz_triggers_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: resource resource_instanceId_systemName_key; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.resource
    ADD CONSTRAINT "resource_instanceId_systemName_key" UNIQUE (instance_id, system_name);


--
-- Name: resource_instance resource_instance_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.resource_instance
    ADD CONSTRAINT resource_instance_pkey PRIMARY KEY (id);


--
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (id);


--
-- Name: schedule_gap schedule_gap_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.schedule_gap
    ADD CONSTRAINT schedule_gap_pkey PRIMARY KEY (id);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- Name: scheduler_log scheduler_log_pkey; Type: CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.scheduler_log
    ADD CONSTRAINT scheduler_log_pkey PRIMARY KEY (id);


--
-- Name: abstract_task abstract_task_name_key; Type: CONSTRAINT; Schema: scheduling; Owner: -
--

ALTER TABLE ONLY scheduling.abstract_task
    ADD CONSTRAINT abstract_task_name_key UNIQUE (name);


--
-- Name: abstract_task abstract_task_pkey; Type: CONSTRAINT; Schema: scheduling; Owner: -
--

ALTER TABLE ONLY scheduling.abstract_task
    ADD CONSTRAINT abstract_task_pkey PRIMARY KEY (id);


--
-- Name: cron_task cron_task_pkey; Type: CONSTRAINT; Schema: scheduling; Owner: -
--

ALTER TABLE ONLY scheduling.cron_task
    ADD CONSTRAINT cron_task_pkey PRIMARY KEY (id);


--
-- Name: task_execution task_execution_pkey; Type: CONSTRAINT; Schema: scheduling; Owner: -
--

ALTER TABLE ONLY scheduling.task_execution
    ADD CONSTRAINT task_execution_pkey PRIMARY KEY (id);


--
-- Name: time_task time_task_pkey; Type: CONSTRAINT; Schema: scheduling; Owner: -
--

ALTER TABLE ONLY scheduling.time_task
    ADD CONSTRAINT time_task_pkey PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: script_backend; Owner: -
--

ALTER TABLE ONLY script_backend.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: script_backend script_backend_name_key; Type: CONSTRAINT; Schema: script_backend; Owner: -
--

ALTER TABLE ONLY script_backend.script_backend
    ADD CONSTRAINT script_backend_name_key UNIQUE (name);


--
-- Name: script_backend script_backend_pkey; Type: CONSTRAINT; Schema: script_backend; Owner: -
--

ALTER TABLE ONLY script_backend.script_backend
    ADD CONSTRAINT script_backend_pkey PRIMARY KEY (id);


--
-- Name: script_endpoint script_endpoint_name_backend_id_key; Type: CONSTRAINT; Schema: script_backend; Owner: -
--

ALTER TABLE ONLY script_backend.script_endpoint
    ADD CONSTRAINT script_endpoint_name_backend_id_key UNIQUE (name, backend_id);


--
-- Name: script_endpoint script_endpoint_pkey; Type: CONSTRAINT; Schema: script_backend; Owner: -
--

ALTER TABLE ONLY script_backend.script_endpoint
    ADD CONSTRAINT script_endpoint_pkey PRIMARY KEY (id);


--
-- Name: client client_name_key; Type: CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.client
    ADD CONSTRAINT client_name_key UNIQUE (name);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: provider provider_name_key; Type: CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.provider
    ADD CONSTRAINT provider_name_key UNIQUE (name);


--
-- Name: provider provider_pkey; Type: CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (id);


--
-- Name: routing routing_pkey; Type: CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.routing
    ADD CONSTRAINT routing_pkey PRIMARY KEY (id);


--
-- Name: routing routing_provider_id_sender_route_pattern_key; Type: CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.routing
    ADD CONSTRAINT routing_provider_id_sender_route_pattern_key UNIQUE (provider_id, sender, route, pattern);


--
-- Name: sms_message sms_message_pkey; Type: CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.sms_message
    ADD CONSTRAINT sms_message_pkey PRIMARY KEY (id);


--
-- Name: sms_message sms_message_sms_id_client_id_key; Type: CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.sms_message
    ADD CONSTRAINT sms_message_sms_id_client_id_key UNIQUE (sms_id, client_id);


--
-- Name: sms_transaction sms_transaction_pkey; Type: CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.sms_transaction
    ADD CONSTRAINT sms_transaction_pkey PRIMARY KEY (id);


--
-- Name: sms_transaction sms_transaction_provider_provider_msg_id_key; Type: CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.sms_transaction
    ADD CONSTRAINT sms_transaction_provider_provider_msg_id_key UNIQUE (provider, provider_msg_id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: storage; Owner: -
--

ALTER TABLE ONLY storage.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: telegram_bot; Owner: -
--

ALTER TABLE ONLY telegram_bot.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: telegram_bot telegram_bot_name_key; Type: CONSTRAINT; Schema: telegram_bot; Owner: -
--

ALTER TABLE ONLY telegram_bot.telegram_bot
    ADD CONSTRAINT telegram_bot_name_key UNIQUE (name);


--
-- Name: telegram_bot telegram_bot_pkey; Type: CONSTRAINT; Schema: telegram_bot; Owner: -
--

ALTER TABLE ONLY telegram_bot.telegram_bot
    ADD CONSTRAINT telegram_bot_pkey PRIMARY KEY (id);


--
-- Name: telegram_bot telegram_bot_token_key; Type: CONSTRAINT; Schema: telegram_bot; Owner: -
--

ALTER TABLE ONLY telegram_bot.telegram_bot
    ADD CONSTRAINT telegram_bot_token_key UNIQUE (token);


--
-- Name: bot_listener bot_listener_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.bot_listener
    ADD CONSTRAINT bot_listener_pkey PRIMARY KEY (id);


--
-- Name: command_error command_error_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.command_error
    ADD CONSTRAINT command_error_pkey PRIMARY KEY (id);


--
-- Name: command_group command_group_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.command_group
    ADD CONSTRAINT command_group_pkey PRIMARY KEY (id);


--
-- Name: command command_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.command
    ADD CONSTRAINT command_pkey PRIMARY KEY (id);


--
-- Name: default_keyboard default_keyboard_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.default_keyboard
    ADD CONSTRAINT default_keyboard_pkey PRIMARY KEY (id);


--
-- Name: periodic_task periodic_task_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.periodic_task
    ADD CONSTRAINT periodic_task_pkey PRIMARY KEY (id);


--
-- Name: qrtz_blob_triggers qrtz_blob_triggers_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_calendars qrtz_calendars_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_calendars
    ADD CONSTRAINT qrtz_calendars_pkey PRIMARY KEY (sched_name, calendar_name);


--
-- Name: qrtz_cron_triggers qrtz_cron_triggers_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_fired_triggers qrtz_fired_triggers_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_fired_triggers
    ADD CONSTRAINT qrtz_fired_triggers_pkey PRIMARY KEY (sched_name, entry_id);


--
-- Name: qrtz_job_details qrtz_job_details_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_job_details
    ADD CONSTRAINT qrtz_job_details_pkey PRIMARY KEY (sched_name, job_name, job_group);


--
-- Name: qrtz_locks qrtz_locks_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_locks
    ADD CONSTRAINT qrtz_locks_pkey PRIMARY KEY (sched_name, lock_name);


--
-- Name: qrtz_paused_trigger_grps qrtz_paused_trigger_grps_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_paused_trigger_grps
    ADD CONSTRAINT qrtz_paused_trigger_grps_pkey PRIMARY KEY (sched_name, trigger_group);


--
-- Name: qrtz_scheduler_state qrtz_scheduler_state_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_scheduler_state
    ADD CONSTRAINT qrtz_scheduler_state_pkey PRIMARY KEY (sched_name, instance_name);


--
-- Name: qrtz_simple_triggers qrtz_simple_triggers_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers qrtz_triggers_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: stored_procedure stored_procedure_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.stored_procedure
    ADD CONSTRAINT stored_procedure_pkey PRIMARY KEY (id);


--
-- Name: task_log_aggregation task_log_aggregation_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.task_log_aggregation
    ADD CONSTRAINT task_log_aggregation_pkey PRIMARY KEY (id);


--
-- Name: task_log task_log_pkey; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.task_log
    ADD CONSTRAINT task_log_pkey PRIMARY KEY (id);


--
-- Name: bot_listener uq_bot_name; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.bot_listener
    ADD CONSTRAINT uq_bot_name UNIQUE (bot_name);


--
-- Name: command uq_bot_name_command; Type: CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.command
    ADD CONSTRAINT uq_bot_name_command UNIQUE (bot_id, command);

--
-- Name: i18n_params i18n_params_pkey; Type: CONSTRAINT; Schema: template; Owner: -
--

ALTER TABLE ONLY template.i18n_params
    ADD CONSTRAINT i18n_params_pkey PRIMARY KEY (template_id);


--
-- Name: template template_name_application_group_id_key; Type: CONSTRAINT; Schema: template; Owner: -
--

ALTER TABLE ONLY template.template
    ADD CONSTRAINT template_name_application_group_id_key UNIQUE (name, application_group_id);


--
-- Name: template template_pkey; Type: CONSTRAINT; Schema: template; Owner: -
--

ALTER TABLE ONLY template.template
    ADD CONSTRAINT template_pkey PRIMARY KEY (id);


--
-- Name: attribute_descriptor attribute_descriptor_application_group_id_parent_id_name_key; Type: CONSTRAINT; Schema: userstorage; Owner: -
--

ALTER TABLE ONLY userstorage.attribute_descriptor
    ADD CONSTRAINT attribute_descriptor_application_group_id_parent_id_name_key UNIQUE (application_group_id, parent_id, name);


--
-- Name: attribute_descriptor attribute_descriptor_pkey; Type: CONSTRAINT; Schema: userstorage; Owner: -
--

ALTER TABLE ONLY userstorage.attribute_descriptor
    ADD CONSTRAINT attribute_descriptor_pkey PRIMARY KEY (id);


--
-- Name: attribute_type attribute_type_application_group_id_name_key; Type: CONSTRAINT; Schema: userstorage; Owner: -
--

ALTER TABLE ONLY userstorage.attribute_type
    ADD CONSTRAINT attribute_type_application_group_id_name_key UNIQUE (application_group_id, name);


--
-- Name: attribute_type attribute_type_pkey; Type: CONSTRAINT; Schema: userstorage; Owner: -
--

ALTER TABLE ONLY userstorage.attribute_type
    ADD CONSTRAINT attribute_type_pkey PRIMARY KEY (id);


--
-- Name: attribute_value attribute_value_pkey; Type: CONSTRAINT; Schema: userstorage; Owner: -
--

ALTER TABLE ONLY userstorage.attribute_value
    ADD CONSTRAINT attribute_value_pkey PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: userstorage; Owner: -
--

ALTER TABLE ONLY userstorage.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: webadmin; Owner: -
--

ALTER TABLE ONLY webadmin.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: task_meta_data task_meta_data_pkey; Type: CONSTRAINT; Schema: webadmin; Owner: -
--

ALTER TABLE ONLY webadmin.task_meta_data
    ADD CONSTRAINT task_meta_data_pkey PRIMARY KEY (id);


--
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: webadmin; Owner: -
--

ALTER TABLE ONLY webadmin.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (id);


--
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: webadmin; Owner: -
--

ALTER TABLE ONLY webadmin.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role);


--
-- Name: i__user_session__user_uuid; Type: INDEX; Schema: aaa; Owner: -
--

CREATE INDEX i__user_session__user_uuid ON aaa.user_session USING btree (user_uuid);


--
-- Name: unqi__user_account__uuid; Type: INDEX; Schema: aaa; Owner: -
--

CREATE UNIQUE INDEX unqi__user_account__uuid ON aaa.user_account USING btree (uuid);


--
-- Name: ix_slots_from; Type: INDEX; Schema: booking; Owner: -
--

CREATE INDEX ix_slots_from ON booking.slots USING btree (from_time);


--
-- Name: ix_slots_hash; Type: INDEX; Schema: booking; Owner: -
--

CREATE INDEX ix_slots_hash ON booking.slots USING btree (properties_hash);


--
-- Name: ix_slots_owner; Type: INDEX; Schema: booking; Owner: -
--

CREATE INDEX ix_slots_owner ON booking.slots USING btree (owner_id);


--
-- Name: ix_slots_properties; Type: INDEX; Schema: booking; Owner: -
--

CREATE INDEX ix_slots_properties ON booking.slots USING gin (properties);


--
-- Name: ix_slots_resource_id; Type: INDEX; Schema: booking; Owner: -
--

CREATE INDEX ix_slots_resource_id ON booking.slots USING btree (resource_instance_id);


--
-- Name: ix_slots_to; Type: INDEX; Schema: booking; Owner: -
--

CREATE INDEX ix_slots_to ON booking.slots USING btree (to_time);


--
-- Name: FK_slotHistoryAttachment_historyId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "FK_slotHistoryAttachment_historyId" ON cityservices.slot_history_attachment USING hash (history_id);


--
-- Name: INX_complaint_performance_value.date; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "INX_complaint_performance_value.date" ON cityservices.complaint_performance_value USING btree (date);


--
-- Name: INX_complaint_statistic_by_type.date; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "INX_complaint_statistic_by_type.date" ON cityservices.complaint_statistic_by_type USING btree (date);


--
-- Name: INX_statistic_value.date; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "INX_statistic_value.date" ON cityservices.statistic_value USING btree (date);


--
-- Name: IX_ComplainFieldValue_ComplainIdFieldId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE UNIQUE INDEX "IX_ComplainFieldValue_ComplainIdFieldId" ON cityservices.complain_field_value USING btree (complain_id, complain_field_id);


--
-- Name: IX_ComplainField_ComplainGroupId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainField_ComplainGroupId" ON cityservices.complain_field USING hash (complain_group_id);


--
-- Name: IX_ComplainGroupRole_ComplainGroupId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainGroupRole_ComplainGroupId" ON cityservices.complain_group_has_role USING hash (complaint_group_id);


--
-- Name: IX_ComplainGroupRole_RoleId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainGroupRole_RoleId" ON cityservices.complain_group_has_role USING hash (role_id);


--
-- Name: IX_ComplainGroup_ComplainTypeIdName; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE UNIQUE INDEX "IX_ComplainGroup_ComplainTypeIdName" ON cityservices.complain_group USING btree (name, complain_type_id);


--
-- Name: IX_ComplainHistory_ComplainId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainHistory_ComplainId" ON cityservices.complain_history USING hash (complain_id);


--
-- Name: IX_ComplainHistory_OperatorId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainHistory_OperatorId" ON cityservices.complain_history USING hash (operator_id);


--
-- Name: IX_ComplainHistory_UserId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainHistory_UserId" ON cityservices.complain_history USING hash (user_id);


--
-- Name: IX_ComplainStatusRole_ComplainStatusId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainStatusRole_ComplainStatusId" ON cityservices.complain_status_has_role USING hash (complaint_status_id);


--
-- Name: IX_ComplainStatusRole_RoleId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainStatusRole_RoleId" ON cityservices.complain_status_has_role USING hash (role_id);


--
-- Name: IX_ComplainStatusWorkflow_ComplainGroupId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainStatusWorkflow_ComplainGroupId" ON cityservices.complain_status_workflow USING hash (complain_group_id);


--
-- Name: IX_ComplainStatusWorkflow_OldNewStatusGroup; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE UNIQUE INDEX "IX_ComplainStatusWorkflow_OldNewStatusGroup" ON cityservices.complain_status_workflow USING btree (old_complain_status_id, new_complain_status_id, complain_group_id);


--
-- Name: IX_ComplainType_Name; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE UNIQUE INDEX "IX_ComplainType_Name" ON cityservices.complain_type USING btree (name);


--
-- Name: IX_ComplainWorkflowField_ComplainWorkflowId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainWorkflowField_ComplainWorkflowId" ON cityservices.complain_workflow_has_field USING hash (complaint_workflow_id);


--
-- Name: IX_ComplainWorkflowField_FieldId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainWorkflowField_FieldId" ON cityservices.complain_workflow_has_field USING hash (field_id);


--
-- Name: IX_ComplainWorkflowRole_ComplainStatusWorkflowId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainWorkflowRole_ComplainStatusWorkflowId" ON cityservices.complain_workflow_has_role USING hash (complain_status_workflow_id);


--
-- Name: IX_ComplainWorkflowRole_RoleId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_ComplainWorkflowRole_RoleId" ON cityservices.complain_workflow_has_role USING btree (role_id);


--
-- Name: IX_Complain_ComplainGroupId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_Complain_ComplainGroupId" ON cityservices.complain USING hash (complain_group_id);


--
-- Name: IX_Complain_ComplainStatusId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_Complain_ComplainStatusId" ON cityservices.complain USING hash (complain_status_id);


--
-- Name: IX_Complain_Name; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE UNIQUE INDEX "IX_Complain_Name" ON cityservices.complain_status USING btree (name);


--
-- Name: IX_Complain_OperatorId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_Complain_OperatorId" ON cityservices.complain USING hash (operator_id);


--
-- Name: IX_Complain_UserId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_Complain_UserId" ON cityservices.complain USING hash (user_id);


--
-- Name: IX_NewsElementCategory_NewsCategoryId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_NewsElementCategory_NewsCategoryId" ON cityservices.news_element_has_category USING hash (news_category_id);


--
-- Name: IX_NewsElementCategory_NewsElementId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_NewsElementCategory_NewsElementId" ON cityservices.news_element_has_category USING hash (news_element_id);


--
-- Name: IX_externalId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_externalId" ON cityservices.user_info USING hash (external_id);


--
-- Name: IX_userId__chatId; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX "IX_userId__chatId" ON cityservices.chat_message USING btree (user_id, chat_id);


--
-- Name: answer_id; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX answer_id ON cityservices.user_answers USING hash (answer_id);


--
-- Name: fk_slot_history_slot_id; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX fk_slot_history_slot_id ON cityservices.slot_history USING btree (slot_id);


--
-- Name: ix_clinic_id; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX ix_clinic_id ON cityservices.med_clinic_link USING btree (clinic_id, link_type);


--
-- Name: ix_operator_id; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX ix_operator_id ON cityservices.med_clinic_link USING btree (operator_id);


--
-- Name: person_id; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX person_id ON cityservices.published USING hash (person_id);


--
-- Name: question_id; Type: INDEX; Schema: cityservices; Owner: -
--

CREATE INDEX question_id ON cityservices.user_answers USING hash (question_id);


--
-- Name: IX_communicationJournal_communication_communicationId; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX "IX_communicationJournal_communication_communicationId" ON cityservices_communication.communication_journal USING hash (communication_id);


--
-- Name: IX_communicationSV_communicationST_communicationSTId; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX "IX_communicationSV_communicationST_communicationSTId" ON cityservices_communication.communication_statistic_value USING hash (communication_statistic_type_id);


--
-- Name: IX_communicationStatisticValue_communication_communicationId; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX "IX_communicationStatisticValue_communication_communicationId" ON cityservices_communication.communication_statistic_value USING hash (communication_id);


--
-- Name: IX_distributionGroupHasUser_groupId; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX "IX_distributionGroupHasUser_groupId" ON cityservices_communication.distribution_group_has_user USING hash (distribution_group_id);


--
-- Name: IX_distributionGroup_communication_communicationId; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX "IX_distributionGroup_communication_communicationId" ON cityservices_communication.distribution_group USING hash (communication_id);


--
-- Name: IX_distributionHasDistributionTemplate_dId; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE UNIQUE INDEX "IX_distributionHasDistributionTemplate_dId" ON cityservices_communication.distribution_has_distribution_template USING btree (distribution_id, distribution_template_id);


--
-- Name: IX_distributionHasDistributionTemplate_dTId; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX "IX_distributionHasDistributionTemplate_dTId" ON cityservices_communication.distribution_has_distribution_template USING hash (distribution_template_id);


--
-- Name: IX_distributionJourna_distribution_distributionId; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX "IX_distributionJourna_distribution_distributionId" ON cityservices_communication.distribution_journal USING hash (distribution_id);


--
-- Name: IX_distributionTemplate_communication_communicationId; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX "IX_distributionTemplate_communication_communicationId" ON cityservices_communication.distribution_template_group USING hash (communication_id);


--
-- Name: IX_distribution_communication_communicationId; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX "IX_distribution_communication_communicationId" ON cityservices_communication.distribution USING hash (communication_id);


--
-- Name: IX_distribution_distributionGroup_distributionGroupId; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX "IX_distribution_distributionGroup_distributionGroupId" ON cityservices_communication.distribution USING hash (distribution_group_id);


--
-- Name: IX_distribution_distributionTemplate_distributionTemplateId; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX "IX_distribution_distributionTemplate_distributionTemplateId" ON cityservices_communication.distribution USING hash (distribution_template_group_id);


--
-- Name: IX_distribution_template_distribution_template; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE UNIQUE INDEX "IX_distribution_template_distribution_template" ON cityservices_communication.distribution_template USING btree (group_id, channel_id);


--
-- Name: idx_qrtz_ft_inst_job_req_rcvry; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON cityservices_communication.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);


--
-- Name: idx_qrtz_ft_j_g; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_ft_j_g ON cityservices_communication.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_ft_jg; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_ft_jg ON cityservices_communication.qrtz_fired_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_ft_t_g; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_ft_t_g ON cityservices_communication.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);


--
-- Name: idx_qrtz_ft_tg; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_ft_tg ON cityservices_communication.qrtz_fired_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_ft_trig_inst_name; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_ft_trig_inst_name ON cityservices_communication.qrtz_fired_triggers USING btree (sched_name, instance_name);


--
-- Name: idx_qrtz_j_grp; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_j_grp ON cityservices_communication.qrtz_job_details USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_j_req_recovery; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_j_req_recovery ON cityservices_communication.qrtz_job_details USING btree (sched_name, requests_recovery);


--
-- Name: idx_qrtz_t_c; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_t_c ON cityservices_communication.qrtz_triggers USING btree (sched_name, calendar_name);


--
-- Name: idx_qrtz_t_g; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_t_g ON cityservices_communication.qrtz_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_t_j; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_t_j ON cityservices_communication.qrtz_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_t_jg; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_t_jg ON cityservices_communication.qrtz_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_t_n_g_state; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_t_n_g_state ON cityservices_communication.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_n_state; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_t_n_state ON cityservices_communication.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_next_fire_time; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_t_next_fire_time ON cityservices_communication.qrtz_triggers USING btree (sched_name, next_fire_time);


--
-- Name: idx_qrtz_t_nft_misfire; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_t_nft_misfire ON cityservices_communication.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_t_nft_st ON cityservices_communication.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st_misfire; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_t_nft_st_misfire ON cityservices_communication.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);


--
-- Name: idx_qrtz_t_nft_st_misfire_grp; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON cityservices_communication.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_state; Type: INDEX; Schema: cityservices_communication; Owner: -
--

CREATE INDEX idx_qrtz_t_state ON cityservices_communication.qrtz_triggers USING btree (sched_name, trigger_state);


--
-- Name: config_mobile_application_id_idx; Type: INDEX; Schema: mobile_store; Owner: -
--

CREATE INDEX config_mobile_application_id_idx ON mobile_store.config USING btree (mobile_application_id);


--
-- Name: view_mobile_application_id_idx; Type: INDEX; Schema: mobile_store; Owner: -
--

CREATE INDEX view_mobile_application_id_idx ON mobile_store.view USING btree (mobile_application_id);


--
-- Name: idx_user_id; Type: INDEX; Schema: poll; Owner: -
--

CREATE INDEX idx_user_id ON poll.publishing USING btree (user_id);


--
-- Name: IX_resourceInstance_parentId; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX "IX_resourceInstance_parentId" ON resource_structure.resource_instance USING hash (parent_id);


--
-- Name: IX_resourceInstance_resourceId; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX "IX_resourceInstance_resourceId" ON resource_structure.resource_instance USING hash (resource_id);


--
-- Name: IX_resourceInstance_tree; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX "IX_resourceInstance_tree" ON resource_structure.resource_instance USING gist (tree);


--
-- Name: IX_resource_instanceId; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX "IX_resource_instanceId" ON resource_structure.resource USING hash (instance_id);


--
-- Name: IX_resource_parentId; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX "IX_resource_parentId" ON resource_structure.resource USING hash (parent_id);


--
-- Name: IX_resource_tree; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX "IX_resource_tree" ON resource_structure.resource USING gist (tree);


--
-- Name: IX_scheduleGap_scheduleId; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX "IX_scheduleGap_scheduleId" ON resource_structure.schedule_gap USING hash (schedule_id);


--
-- Name: IX_schedule_resourceId; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX "IX_schedule_resourceId" ON resource_structure.schedule USING hash (resource_id);


--
-- Name: IX_schedule_resourceInstanceId; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX "IX_schedule_resourceInstanceId" ON resource_structure.schedule USING hash (resource_instance_id);


--
-- Name: idx_qrtz_ft_inst_job_req_rcvry; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON resource_structure.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);


--
-- Name: idx_qrtz_ft_j_g; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_ft_j_g ON resource_structure.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_ft_jg; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_ft_jg ON resource_structure.qrtz_fired_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_ft_t_g; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_ft_t_g ON resource_structure.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);


--
-- Name: idx_qrtz_ft_tg; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_ft_tg ON resource_structure.qrtz_fired_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_ft_trig_inst_name; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_ft_trig_inst_name ON resource_structure.qrtz_fired_triggers USING btree (sched_name, instance_name);


--
-- Name: idx_qrtz_j_grp; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_j_grp ON resource_structure.qrtz_job_details USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_j_req_recovery; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_j_req_recovery ON resource_structure.qrtz_job_details USING btree (sched_name, requests_recovery);


--
-- Name: idx_qrtz_t_c; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_t_c ON resource_structure.qrtz_triggers USING btree (sched_name, calendar_name);


--
-- Name: idx_qrtz_t_g; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_t_g ON resource_structure.qrtz_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_t_j; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_t_j ON resource_structure.qrtz_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_t_jg; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_t_jg ON resource_structure.qrtz_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_t_n_g_state; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_t_n_g_state ON resource_structure.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_n_state; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_t_n_state ON resource_structure.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_next_fire_time; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_t_next_fire_time ON resource_structure.qrtz_triggers USING btree (sched_name, next_fire_time);


--
-- Name: idx_qrtz_t_nft_misfire; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_t_nft_misfire ON resource_structure.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_t_nft_st ON resource_structure.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st_misfire; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_t_nft_st_misfire ON resource_structure.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);


--
-- Name: idx_qrtz_t_nft_st_misfire_grp; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON resource_structure.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_state; Type: INDEX; Schema: resource_structure; Owner: -
--

CREATE INDEX idx_qrtz_t_state ON resource_structure.qrtz_triggers USING btree (sched_name, trigger_state);


--
-- Name: idx_qrtz_ft_inst_job_req_rcvry; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON telegram_handler.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);


--
-- Name: idx_qrtz_ft_j_g; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_ft_j_g ON telegram_handler.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_ft_jg; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_ft_jg ON telegram_handler.qrtz_fired_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_ft_t_g; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_ft_t_g ON telegram_handler.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);


--
-- Name: idx_qrtz_ft_tg; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_ft_tg ON telegram_handler.qrtz_fired_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_ft_trig_inst_name; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_ft_trig_inst_name ON telegram_handler.qrtz_fired_triggers USING btree (sched_name, instance_name);


--
-- Name: idx_qrtz_j_grp; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_j_grp ON telegram_handler.qrtz_job_details USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_j_req_recovery; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_j_req_recovery ON telegram_handler.qrtz_job_details USING btree (sched_name, requests_recovery);


--
-- Name: idx_qrtz_t_c; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_t_c ON telegram_handler.qrtz_triggers USING btree (sched_name, calendar_name);


--
-- Name: idx_qrtz_t_g; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_t_g ON telegram_handler.qrtz_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_t_j; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_t_j ON telegram_handler.qrtz_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_t_jg; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_t_jg ON telegram_handler.qrtz_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_t_n_g_state; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_t_n_g_state ON telegram_handler.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_n_state; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_t_n_state ON telegram_handler.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_next_fire_time; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_t_next_fire_time ON telegram_handler.qrtz_triggers USING btree (sched_name, next_fire_time);


--
-- Name: idx_qrtz_t_nft_misfire; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_t_nft_misfire ON telegram_handler.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_t_nft_st ON telegram_handler.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st_misfire; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_t_nft_st_misfire ON telegram_handler.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);


--
-- Name: idx_qrtz_t_nft_st_misfire_grp; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON telegram_handler.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_state; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX idx_qrtz_t_state ON telegram_handler.qrtz_triggers USING btree (sched_name, trigger_state);


--
-- Name: ix_command_error__command_id; Type: INDEX; Schema: telegram_handler; Owner: -
--

CREATE INDEX ix_command_error__command_id ON telegram_handler.command_error USING hash (command_id);


--
-- Name: i__attribute_value__group_id__user_id; Type: INDEX; Schema: userstorage; Owner: -
--

CREATE INDEX i__attribute_value__group_id__user_id ON userstorage.attribute_value USING btree (application_group_id, user_id);


--
-- Name: unqi__attribute_descriptor__group_id__name; Type: INDEX; Schema: userstorage; Owner: -
--

CREATE UNIQUE INDEX unqi__attribute_descriptor__group_id__name ON userstorage.attribute_descriptor USING btree (application_group_id, name) WHERE (parent_id IS NULL);


--
-- Name: user_translation set_updated_at; Type: TRIGGER; Schema: cityservices; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE INSERT OR UPDATE ON cityservices.user_translation FOR EACH ROW EXECUTE PROCEDURE cityservices.update_last_translation_date();


--
-- Name: ui_config set_updated_at; Type: TRIGGER; Schema: cityservices; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE INSERT OR UPDATE ON cityservices.ui_config FOR EACH ROW EXECUTE PROCEDURE cityservices.update_last_translation_date();


--
-- Name: chat_message incrementMessagesCount; Type: TRIGGER; Schema: cityservices_chats; Owner: -
--

CREATE TRIGGER "incrementMessagesCount" AFTER INSERT ON cityservices_chats.chat_message FOR EACH ROW EXECUTE PROCEDURE cityservices_chats.inccount();


--
-- Name: user_point_history user_points_update_trigger; Type: TRIGGER; Schema: poll; Owner: -
--

CREATE TRIGGER user_points_update_trigger AFTER INSERT ON poll.user_point_history FOR EACH ROW EXECUTE PROCEDURE cityservices.user_points_update_function();


--
-- Name: user_status user_status_log_trigger; Type: TRIGGER; Schema: poll; Owner: -
--

CREATE TRIGGER user_status_log_trigger AFTER INSERT OR UPDATE ON poll.user_status FOR EACH ROW EXECUTE PROCEDURE cityservices.user_status_log_function();


--
-- Name: resource parent_tree_tgr; Type: TRIGGER; Schema: resource_structure; Owner: -
--

CREATE TRIGGER parent_tree_tgr BEFORE INSERT OR UPDATE ON resource_structure.resource FOR EACH ROW EXECUTE PROCEDURE resource_structure.update_parent_path();


--
-- Name: resource_instance parent_tree_tgr; Type: TRIGGER; Schema: resource_structure; Owner: -
--

CREATE TRIGGER parent_tree_tgr BEFORE INSERT OR UPDATE ON resource_structure.resource_instance FOR EACH ROW EXECUTE PROCEDURE resource_structure.update_parent_path();


--
-- Name: periodic_task insertnewlogaggregation; Type: TRIGGER; Schema: telegram_handler; Owner: -
--

CREATE TRIGGER insertnewlogaggregation AFTER INSERT ON telegram_handler.periodic_task FOR EACH ROW EXECUTE PROCEDURE telegram_handler.oninserttask();


--
-- Name: task_log updatetasklogaggregation; Type: TRIGGER; Schema: telegram_handler; Owner: -
--

CREATE TRIGGER updatetasklogaggregation AFTER INSERT ON telegram_handler.task_log FOR EACH ROW EXECUTE PROCEDURE telegram_handler.oninserttasklog();


--
-- Name: confirmation confirmation_user_account_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.confirmation
    ADD CONSTRAINT confirmation_user_account_id_fkey FOREIGN KEY (user_account_id) REFERENCES aaa.user_account(id);


--
-- Name: data_property data_property_data_property_group_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.data_property
    ADD CONSTRAINT data_property_data_property_group_id_fkey FOREIGN KEY (data_property_group_id) REFERENCES aaa.data_property_group(id) ON DELETE CASCADE;


--
-- Name: data_property_group data_property_group_data_property_section_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.data_property_group
    ADD CONSTRAINT data_property_group_data_property_section_id_fkey FOREIGN KEY (data_property_section_id) REFERENCES aaa.data_property_section(id) ON DELETE CASCADE;


--
-- Name: data_property_section data_property_section_application_group_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.data_property_section
    ADD CONSTRAINT data_property_section_application_group_id_fkey FOREIGN KEY (application_group_id) REFERENCES aaa.application_group(id);


--
-- Name: ldap_configuration ldap_configuration_application_group_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.ldap_configuration
    ADD CONSTRAINT ldap_configuration_application_group_id_fkey FOREIGN KEY (application_group_id) REFERENCES aaa.application_group(id);


--
-- Name: mobile_app mobile_app_application_group_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.mobile_app
    ADD CONSTRAINT mobile_app_application_group_id_fkey FOREIGN KEY (application_group_id) REFERENCES aaa.application_group(id);


--
-- Name: mobile_app_domain mobile_app_domain_application_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.mobile_app_domain
    ADD CONSTRAINT mobile_app_domain_application_id_fkey FOREIGN KEY (application_id) REFERENCES aaa.mobile_app(id);


--
-- Name: mobile_app_instance mobile_app_instance_mobile_app_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.mobile_app_instance
    ADD CONSTRAINT mobile_app_instance_mobile_app_id_fkey FOREIGN KEY (mobile_app_id) REFERENCES aaa.mobile_app(id);


--
-- Name: mobile_app_instance mobile_app_instance_user_account_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.mobile_app_instance
    ADD CONSTRAINT mobile_app_instance_user_account_id_fkey FOREIGN KEY (user_account_id) REFERENCES aaa.user_account(id);


--
-- Name: service_account service_account_application_group_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_account
    ADD CONSTRAINT service_account_application_group_id_fkey FOREIGN KEY (application_group_id) REFERENCES aaa.application_group(id);


--
-- Name: service_account_roles service_account_roles_account_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_account_roles
    ADD CONSTRAINT service_account_roles_account_id_fkey FOREIGN KEY (account_id) REFERENCES aaa.service_account(id);


--
-- Name: service_account_roles service_account_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_account_roles
    ADD CONSTRAINT service_account_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES aaa.service_role(id);


--
-- Name: service_permission service_permission_application_group_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_permission
    ADD CONSTRAINT service_permission_application_group_id_fkey FOREIGN KEY (application_group_id) REFERENCES aaa.application_group(id);


--
-- Name: service_role service_role_application_group_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_role
    ADD CONSTRAINT service_role_application_group_id_fkey FOREIGN KEY (application_group_id) REFERENCES aaa.application_group(id);


--
-- Name: service_role_permissions service_role_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_role_permissions
    ADD CONSTRAINT service_role_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES aaa.service_permission(id);


--
-- Name: service_role_permissions service_role_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.service_role_permissions
    ADD CONSTRAINT service_role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES aaa.service_role(id);


--
-- Name: user_account user_account_application_group_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account
    ADD CONSTRAINT user_account_application_group_id_fkey FOREIGN KEY (application_group_id) REFERENCES aaa.application_group(id);


--
-- Name: user_account user_account_password_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_account
    ADD CONSTRAINT user_account_password_id_fkey FOREIGN KEY (password_id) REFERENCES aaa.user_password(id);


--
-- Name: user_accounts_roles user_accounts_roles_account_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_accounts_roles
    ADD CONSTRAINT user_accounts_roles_account_id_fkey FOREIGN KEY (account_id) REFERENCES aaa.user_account(id);


--
-- Name: user_accounts_roles user_accounts_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_accounts_roles
    ADD CONSTRAINT user_accounts_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES aaa.user_role(id);


--
-- Name: user_data_property user_data_property_data_property_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_data_property
    ADD CONSTRAINT user_data_property_data_property_id_fkey FOREIGN KEY (data_property_id) REFERENCES aaa.data_property(id);


--
-- Name: user_data_property user_data_property_user_account_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_data_property
    ADD CONSTRAINT user_data_property_user_account_id_fkey FOREIGN KEY (user_account_id) REFERENCES aaa.user_account(id);


--
-- Name: user_permission user_permission_application_group_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_permission
    ADD CONSTRAINT user_permission_application_group_id_fkey FOREIGN KEY (application_group_id) REFERENCES aaa.application_group(id);


--
-- Name: user_permission user_permission_permission_type_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_permission
    ADD CONSTRAINT user_permission_permission_type_id_fkey FOREIGN KEY (permission_type_id) REFERENCES aaa.user_permission_type(id);


--
-- Name: user_role user_role_application_group_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_role
    ADD CONSTRAINT user_role_application_group_id_fkey FOREIGN KEY (application_group_id) REFERENCES aaa.application_group(id);


--
-- Name: user_roles_permissions user_roles_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_roles_permissions
    ADD CONSTRAINT user_roles_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES aaa.user_permission(id);


--
-- Name: user_roles_permissions user_roles_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: aaa; Owner: -
--

ALTER TABLE ONLY aaa.user_roles_permissions
    ADD CONSTRAINT user_roles_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES aaa.user_role(id);


--
-- Name: aggregate_endpoint_descriptor aggregate_endpoint_descriptor_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.aggregate_endpoint_descriptor
    ADD CONSTRAINT aggregate_endpoint_descriptor_id_fkey FOREIGN KEY (id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: cache_settings cache_settings_end_point_descriptor_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.cache_settings
    ADD CONSTRAINT cache_settings_end_point_descriptor_id_fkey FOREIGN KEY (end_point_descriptor_id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: chain_endpoint_descriptor chain_endpoint_descriptor_source_endpoint_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.chain_endpoint_descriptor
    ADD CONSTRAINT chain_endpoint_descriptor_source_endpoint_id_fkey FOREIGN KEY (source_endpoint_id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: chain_endpoint_descriptor chain_endpoint_descriptor_target_endpoint_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.chain_endpoint_descriptor
    ADD CONSTRAINT chain_endpoint_descriptor_target_endpoint_id_fkey FOREIGN KEY (target_endpoint_id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: composite_backend_descriptor composite_backend_descriptor_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.composite_backend_descriptor
    ADD CONSTRAINT composite_backend_descriptor_id_fkey FOREIGN KEY (id) REFERENCES backend.abstract_backend_descriptor(id);


--
-- Name: data_type_mdm_settings data_type_mdm_settings_key_type_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type_mdm_settings
    ADD CONSTRAINT data_type_mdm_settings_key_type_id_fkey FOREIGN KEY (key_type_id) REFERENCES backend.data_type(id);


--
-- Name: data_type_mdm_settings data_type_mdm_settings_value_type_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type_mdm_settings
    ADD CONSTRAINT data_type_mdm_settings_value_type_id_fkey FOREIGN KEY (value_type_id) REFERENCES backend.data_type(id);


--
-- Name: data_type data_type_mdm_type_settings_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type
    ADD CONSTRAINT data_type_mdm_type_settings_id_fkey FOREIGN KEY (mdm_type_settings_id) REFERENCES backend.data_type_mdm_settings(id);


--
-- Name: adapter_endpoint_descriptor fk__adapter_endpoint__abstract_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.adapter_endpoint_descriptor
    ADD CONSTRAINT fk__adapter_endpoint__abstract_endpoint FOREIGN KEY (id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: adapter_endpoint_descriptor fk__adapter_endpoint__target_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.adapter_endpoint_descriptor
    ADD CONSTRAINT fk__adapter_endpoint__target_endpoint FOREIGN KEY (target_endpoint_id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: adapter_param_convertation fk__adapter_param_convertation__adapter_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.adapter_param_convertation
    ADD CONSTRAINT fk__adapter_param_convertation__adapter_endpoint FOREIGN KEY (adapter_endpoint_id) REFERENCES backend.adapter_endpoint_descriptor(id);


--
-- Name: adapter_param_convertation fk__adapter_param_convertation__convertation; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.adapter_param_convertation
    ADD CONSTRAINT fk__adapter_param_convertation__convertation FOREIGN KEY (convertation_id) REFERENCES backend.adapter_backend_convertation(id);


--
-- Name: adapter_result_convertation fk__adapter_result_convertation__adapter_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.adapter_result_convertation
    ADD CONSTRAINT fk__adapter_result_convertation__adapter_endpoint FOREIGN KEY (adapter_endpoint_id) REFERENCES backend.adapter_endpoint_descriptor(id);


--
-- Name: adapter_result_convertation fk__adapter_result_convertation__convertation; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.adapter_result_convertation
    ADD CONSTRAINT fk__adapter_result_convertation__convertation FOREIGN KEY (convertation_id) REFERENCES backend.adapter_backend_convertation(id);


--
-- Name: awip_backend_descriptor fk__backend__abstract_backend; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.awip_backend_descriptor
    ADD CONSTRAINT fk__backend__abstract_backend FOREIGN KEY (id) REFERENCES backend.abstract_backend_descriptor(id);


--
-- Name: chain_source_mapping fk__chain_source_mapping__chain_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.chain_source_mapping
    ADD CONSTRAINT fk__chain_source_mapping__chain_endpoint FOREIGN KEY (chain_endpoint_id) REFERENCES backend.chain_endpoint_descriptor(id);


--
-- Name: chain_source_mapping fk__chain_source_mapping__chain_parameter_mapping; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.chain_source_mapping
    ADD CONSTRAINT fk__chain_source_mapping__chain_parameter_mapping FOREIGN KEY (parameter_mapping_id) REFERENCES backend.chain_parameter_mapping(id);


--
-- Name: chain_target_mapping fk__chain_target_mapping__chain_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.chain_target_mapping
    ADD CONSTRAINT fk__chain_target_mapping__chain_endpoint FOREIGN KEY (chain_endpoint_id) REFERENCES backend.chain_endpoint_descriptor(id);


--
-- Name: chain_target_mapping fk__chain_target_mapping__chain_parameter_mapping; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.chain_target_mapping
    ADD CONSTRAINT fk__chain_target_mapping__chain_parameter_mapping FOREIGN KEY (parameter_mapping_id) REFERENCES backend.chain_parameter_mapping(id);


--
-- Name: awip_endpoint_descriptor fk__endpoint__abstract_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.awip_endpoint_descriptor
    ADD CONSTRAINT fk__endpoint__abstract_endpoint FOREIGN KEY (id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: jdbc_endpoint_descriptor fk__endpoint__abstract_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_endpoint_descriptor
    ADD CONSTRAINT fk__endpoint__abstract_endpoint FOREIGN KEY (id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: endpoint_param_descriptor fk__endpoint_param_descriptor__datatype; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.endpoint_param_descriptor
    ADD CONSTRAINT fk__endpoint_param_descriptor__datatype FOREIGN KEY (datatype_id) REFERENCES backend.data_type(id);


--
-- Name: endpoint_param_descriptor fk__endpoint_param_descriptor__endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.endpoint_param_descriptor
    ADD CONSTRAINT fk__endpoint_param_descriptor__endpoint FOREIGN KEY (endpoint_descriptor_id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: jdbc_backend_descriptor fk__jdbc_backend__abstract_backend; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_backend_descriptor
    ADD CONSTRAINT fk__jdbc_backend__abstract_backend FOREIGN KEY (id) REFERENCES backend.abstract_backend_descriptor(id);


--
-- Name: mdm_backend_descriptor fk__mdm_backend__abstract_backend; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.mdm_backend_descriptor
    ADD CONSTRAINT fk__mdm_backend__abstract_backend FOREIGN KEY (id) REFERENCES backend.abstract_backend_descriptor(id);


--
-- Name: mdm_endpoint_descriptor fk__mdm_endpoint__abstract_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.mdm_endpoint_descriptor
    ADD CONSTRAINT fk__mdm_endpoint__abstract_endpoint FOREIGN KEY (id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: mongo_backend_descriptor fk__mongo_backend__abstract_backend; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.mongo_backend_descriptor
    ADD CONSTRAINT fk__mongo_backend__abstract_backend FOREIGN KEY (id) REFERENCES backend.abstract_backend_descriptor(id);


--
-- Name: mongo_endpoint_descriptor fk__mongo_endpoint__abstract_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.mongo_endpoint_descriptor
    ADD CONSTRAINT fk__mongo_endpoint__abstract_endpoint FOREIGN KEY (id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: mq_backend_descriptor fk__mq_backend__abstract_backend; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.mq_backend_descriptor
    ADD CONSTRAINT fk__mq_backend__abstract_backend FOREIGN KEY (id) REFERENCES backend.abstract_backend_descriptor(id);


--
-- Name: emp_backend_descriptor fk__mq_backend__rest_backend; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.emp_backend_descriptor
    ADD CONSTRAINT fk__mq_backend__rest_backend FOREIGN KEY (id) REFERENCES backend.rest_backend_descriptor(id);


--
-- Name: mq_endpoint_descriptor fk__mq_endpoint__abstract_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.mq_endpoint_descriptor
    ADD CONSTRAINT fk__mq_endpoint__abstract_endpoint FOREIGN KEY (id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: chain_endpoint_descriptor fk__mq_endpoint__abstract_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.chain_endpoint_descriptor
    ADD CONSTRAINT fk__mq_endpoint__abstract_endpoint FOREIGN KEY (id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: emp_endpoint_descriptor fk__mq_endpoint__rest_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.emp_endpoint_descriptor
    ADD CONSTRAINT fk__mq_endpoint__rest_endpoint FOREIGN KEY (id) REFERENCES backend.rest_endpoint_descriptor(id);


--
-- Name: rest_backend_descriptor fk__rest_backend__abstract_backend; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.rest_backend_descriptor
    ADD CONSTRAINT fk__rest_backend__abstract_backend FOREIGN KEY (id) REFERENCES backend.abstract_backend_descriptor(id);


--
-- Name: rest_endpoint_descriptor fk__rest_endpoint__abstract_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.rest_endpoint_descriptor
    ADD CONSTRAINT fk__rest_endpoint__abstract_endpoint FOREIGN KEY (id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: split_endpoint_descriptor fk__split_endpoint__abstract_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.split_endpoint_descriptor
    ADD CONSTRAINT fk__split_endpoint__abstract_endpoint FOREIGN KEY (id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: adapter_endpoint_default_param fk_adapter_endpoint_default_param_adapter_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.adapter_endpoint_default_param
    ADD CONSTRAINT fk_adapter_endpoint_default_param_adapter_endpoint FOREIGN KEY (adapter_endpoint_id) REFERENCES backend.adapter_endpoint_descriptor(id);


--
-- Name: abstract_endpoint_descriptor fk_backend_descriptor; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.abstract_endpoint_descriptor
    ADD CONSTRAINT fk_backend_descriptor FOREIGN KEY (backend_descriptor_id) REFERENCES backend.abstract_backend_descriptor(id);


--
-- Name: abstract_endpoint_descriptor fk_data_type; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.abstract_endpoint_descriptor
    ADD CONSTRAINT fk_data_type FOREIGN KEY (result_type_id) REFERENCES backend.data_type(id);


--
-- Name: data_type_object_property fk_data_type_data_type_id; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type_object_property
    ADD CONSTRAINT fk_data_type_data_type_id FOREIGN KEY (data_type_id) REFERENCES backend.data_type(id);


--
-- Name: data_type fk_data_type_element_type_id; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type
    ADD CONSTRAINT fk_data_type_element_type_id FOREIGN KEY (element_type_id) REFERENCES backend.data_type(id);


--
-- Name: data_type_object_property fk_data_type_object_data_id; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.data_type_object_property
    ADD CONSTRAINT fk_data_type_object_data_id FOREIGN KEY (object_data_id) REFERENCES backend.data_type(id);


--
-- Name: external_backend_descriptor fk_external_backend; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.external_backend_descriptor
    ADD CONSTRAINT fk_external_backend FOREIGN KEY (id) REFERENCES backend.abstract_backend_descriptor(id);


--
-- Name: external_endpoint_descriptor fk_external_endpoint; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.external_endpoint_descriptor
    ADD CONSTRAINT fk_external_endpoint FOREIGN KEY (id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: endpoint_isolation fk_isolation_endpoint_descriptor; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.endpoint_isolation
    ADD CONSTRAINT fk_isolation_endpoint_descriptor FOREIGN KEY (endpoint_descriptor_id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: jdbc_backend_descriptor jdbc_backend_descriptor_driver_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_backend_descriptor
    ADD CONSTRAINT jdbc_backend_descriptor_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES backend.jdbc_driver(id);


--
-- Name: jdbc_url_parameter jdbc_url_parameter_jdbc_driver_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_url_parameter
    ADD CONSTRAINT jdbc_url_parameter_jdbc_driver_id_fkey FOREIGN KEY (jdbc_driver_id) REFERENCES backend.jdbc_driver(id);


--
-- Name: jdbc_url_parameter_string_example_value jdbc_url_parameter_string_example_va_jdbc_url_parameter_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.jdbc_url_parameter_string_example_value
    ADD CONSTRAINT jdbc_url_parameter_string_example_va_jdbc_url_parameter_id_fkey FOREIGN KEY (jdbc_url_parameter_id) REFERENCES backend.jdbc_url_parameter(id);


--
-- Name: join_aggregate_endpoint join_aggregate_endpoint_aggregate_endpoint_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.join_aggregate_endpoint
    ADD CONSTRAINT join_aggregate_endpoint_aggregate_endpoint_id_fkey FOREIGN KEY (aggregate_endpoint_id) REFERENCES backend.aggregate_endpoint_descriptor(id);


--
-- Name: join_aggregate_endpoint join_aggregate_endpoint_child_endpoint_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.join_aggregate_endpoint
    ADD CONSTRAINT join_aggregate_endpoint_child_endpoint_id_fkey FOREIGN KEY (child_endpoint_id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: split_endpoint_descriptor split_endpoint_descriptor_source_endpoint_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.split_endpoint_descriptor
    ADD CONSTRAINT split_endpoint_descriptor_source_endpoint_id_fkey FOREIGN KEY (source_endpoint_id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: split_endpoint_descriptor split_endpoint_descriptor_target_endpoint_id_fkey; Type: FK CONSTRAINT; Schema: backend; Owner: -
--

ALTER TABLE ONLY backend.split_endpoint_descriptor
    ADD CONSTRAINT split_endpoint_descriptor_target_endpoint_id_fkey FOREIGN KEY (target_endpoint_id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: complain_field FK_ComplainGroupId_Complain_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_field
    ADD CONSTRAINT "FK_ComplainGroupId_Complain_Id" FOREIGN KEY (complain_group_id) REFERENCES cityservices.complain_group(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_group_has_role FK_ComplainGroupRole_ComplainGroupId_ComplainGroup_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_group_has_role
    ADD CONSTRAINT "FK_ComplainGroupRole_ComplainGroupId_ComplainGroup_Id" FOREIGN KEY (complaint_group_id) REFERENCES cityservices.complain_group(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_group_has_role FK_ComplainGroupRole_RoleId_Role_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_group_has_role
    ADD CONSTRAINT "FK_ComplainGroupRole_RoleId_Role_Id" FOREIGN KEY (role_id) REFERENCES cityservices.role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_group FK_ComplainGroup_StartStatusId_ComplainStatus_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_group
    ADD CONSTRAINT "FK_ComplainGroup_StartStatusId_ComplainStatus_Id" FOREIGN KEY (start_status_id) REFERENCES cityservices.complain_status(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: complain_history FK_ComplainHistory_ComplainId_Complain_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_history
    ADD CONSTRAINT "FK_ComplainHistory_ComplainId_Complain_Id" FOREIGN KEY (complain_id) REFERENCES cityservices.complain(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_history FK_ComplainHistory_OperatorId_Account_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_history
    ADD CONSTRAINT "FK_ComplainHistory_OperatorId_Account_Id" FOREIGN KEY (operator_id) REFERENCES cityservices.account(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: complain_history FK_ComplainHistory_StatusFromId_ComplainStatus_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_history
    ADD CONSTRAINT "FK_ComplainHistory_StatusFromId_ComplainStatus_Id" FOREIGN KEY (status_from_id) REFERENCES cityservices.complain_status(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- Name: complain_history FK_ComplainHistory_StatusToId_ComplainStatus_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_history
    ADD CONSTRAINT "FK_ComplainHistory_StatusToId_ComplainStatus_Id" FOREIGN KEY (status_to_id) REFERENCES cityservices.complain_status(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- Name: complain_history FK_ComplainHistory_UserId_UserInfo_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_history
    ADD CONSTRAINT "FK_ComplainHistory_UserId_UserInfo_Id" FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_status_has_role FK_ComplainStatusRole_ComplainStatusId_ComplainStatus_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_status_has_role
    ADD CONSTRAINT "FK_ComplainStatusRole_ComplainStatusId_ComplainStatus_Id" FOREIGN KEY (complaint_status_id) REFERENCES cityservices.complain_status(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_status_has_role FK_ComplainStatusRole_RoleId_Role_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_status_has_role
    ADD CONSTRAINT "FK_ComplainStatusRole_RoleId_Role_Id" FOREIGN KEY (role_id) REFERENCES cityservices.role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_workflow_has_field FK_ComplainWorkflowField_ComplainWorkflowId_ComplainWorkflow_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_workflow_has_field
    ADD CONSTRAINT "FK_ComplainWorkflowField_ComplainWorkflowId_ComplainWorkflow_Id" FOREIGN KEY (complaint_workflow_id) REFERENCES cityservices.complain_status_workflow(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_workflow_has_field FK_ComplainWorkflowField_FieldId_Field_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_workflow_has_field
    ADD CONSTRAINT "FK_ComplainWorkflowField_FieldId_Field_Id" FOREIGN KEY (field_id) REFERENCES cityservices.complain_field(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_workflow_has_role FK_ComplainWorkflowRole_ComplainStatusWorkflowId_ComplainStatus; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_workflow_has_role
    ADD CONSTRAINT "FK_ComplainWorkflowRole_ComplainStatusWorkflowId_ComplainStatus" FOREIGN KEY (complain_status_workflow_id) REFERENCES cityservices.complain_status_workflow(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_workflow_has_role FK_ComplainWorkflowRole_RoleId_Role_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_workflow_has_role
    ADD CONSTRAINT "FK_ComplainWorkflowRole_RoleId_Role_Id" FOREIGN KEY (role_id) REFERENCES cityservices.role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain FK_Complain_InWorkOperatorId_Account_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain
    ADD CONSTRAINT "FK_Complain_InWorkOperatorId_Account_Id" FOREIGN KEY (in_work_operator_id) REFERENCES cityservices.account(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: complain FK_Complain_OperatorId_Account_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain
    ADD CONSTRAINT "FK_Complain_OperatorId_Account_Id" FOREIGN KEY (operator_id) REFERENCES cityservices.account(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: complain FK_Complain_UserId_UserInfo_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain
    ADD CONSTRAINT "FK_Complain_UserId_UserInfo_Id" FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: news_element_has_category FK_NewsElementCategory_NewsCategoryId_NewsCategory_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_element_has_category
    ADD CONSTRAINT "FK_NewsElementCategory_NewsCategoryId_NewsCategory_Id" FOREIGN KEY (news_category_id) REFERENCES cityservices.news_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: news_element_has_category FK_NewsElementCategory_NewsElementId_NewsElement_Id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_element_has_category
    ADD CONSTRAINT "FK_NewsElementCategory_NewsElementId_NewsElement_Id" FOREIGN KEY (news_element_id) REFERENCES cityservices.news_element(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: role_links FK_child_id__role_id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.role_links
    ADD CONSTRAINT "FK_child_id__role_id" FOREIGN KEY (child_id) REFERENCES cityservices.role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complaint_statistic_by_type FK_complaint_type_id.complain_type.id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complaint_statistic_by_type
    ADD CONSTRAINT "FK_complaint_type_id.complain_type.id" FOREIGN KEY (complaint_type_id) REFERENCES cityservices.complain_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: statistic_value FK_complaint_type_id.complain_type.id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.statistic_value
    ADD CONSTRAINT "FK_complaint_type_id.complain_type.id" FOREIGN KEY (type_id) REFERENCES cityservices.statistic_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complaint_performance_value FK_complaint_type_id.complaint_performance_type.id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complaint_performance_value
    ADD CONSTRAINT "FK_complaint_type_id.complaint_performance_type.id" FOREIGN KEY (type_id) REFERENCES cityservices.complaint_performance_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: role_links FK_parent_id__role_id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.role_links
    ADD CONSTRAINT "FK_parent_id__role_id" FOREIGN KEY (parent_id) REFERENCES cityservices.role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: polls FK_polls_newsCategory_categoryId; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.polls
    ADD CONSTRAINT "FK_polls_newsCategory_categoryId" FOREIGN KEY (category_id) REFERENCES cityservices.news_category(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: chat_message FK_userId_userInfo_id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.chat_message
    ADD CONSTRAINT "FK_userId_userInfo_id" FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: account_roles account_roles_account_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.account_roles
    ADD CONSTRAINT account_roles_account_id_fkey FOREIGN KEY (account_id) REFERENCES cityservices.account(id);


--
-- Name: account_roles account_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.account_roles
    ADD CONSTRAINT account_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES cityservices.role(id);


--
-- Name: answers answers_questions_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.answers
    ADD CONSTRAINT answers_questions_id_fkey FOREIGN KEY (questions_id) REFERENCES cityservices.questions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: attachment attachment_message_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.attachment
    ADD CONSTRAINT attachment_message_id_fkey FOREIGN KEY (message_id) REFERENCES cityservices.message(id);


--
-- Name: bookmark_favorite_screen bookmark_favorite_screen_user_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.bookmark_favorite_screen
    ADD CONSTRAINT bookmark_favorite_screen_user_id_fkey FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id);


--
-- Name: bookmark_history_screen bookmark_history_screen_user_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.bookmark_history_screen
    ADD CONSTRAINT bookmark_history_screen_user_id_fkey FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id);


--
-- Name: complain complain_complain_group_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain
    ADD CONSTRAINT complain_complain_group_id_fkey FOREIGN KEY (complain_group_id) REFERENCES cityservices.complain_group(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: complain complain_complain_status_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain
    ADD CONSTRAINT complain_complain_status_id_fkey FOREIGN KEY (complain_status_id) REFERENCES cityservices.complain_status(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: complain_field_value complain_field_value_complain_field_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_field_value
    ADD CONSTRAINT complain_field_value_complain_field_id_fkey FOREIGN KEY (complain_field_id) REFERENCES cityservices.complain_field(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_field_value complain_field_value_complain_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_field_value
    ADD CONSTRAINT complain_field_value_complain_id_fkey FOREIGN KEY (complain_id) REFERENCES cityservices.complain(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_group complain_group_complain_type_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_group
    ADD CONSTRAINT complain_group_complain_type_id_fkey FOREIGN KEY (complain_type_id) REFERENCES cityservices.complain_type(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: complain_status complain_status_flow_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_status
    ADD CONSTRAINT complain_status_flow_id_fkey FOREIGN KEY (flow_id) REFERENCES cityservices.flow(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_status_workflow complain_status_workflow_complain_group_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_status_workflow
    ADD CONSTRAINT complain_status_workflow_complain_group_id_fkey FOREIGN KEY (complain_group_id) REFERENCES cityservices.complain_group(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_status_workflow complain_status_workflow_new_complain_status_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_status_workflow
    ADD CONSTRAINT complain_status_workflow_new_complain_status_id_fkey FOREIGN KEY (new_complain_status_id) REFERENCES cityservices.complain_status(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_status_workflow complain_status_workflow_old_complain_status_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_status_workflow
    ADD CONSTRAINT complain_status_workflow_old_complain_status_id_fkey FOREIGN KEY (old_complain_status_id) REFERENCES cityservices.complain_status(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_type complain_type_flow_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_type
    ADD CONSTRAINT complain_type_flow_id_fkey FOREIGN KEY (flow_id) REFERENCES cityservices.flow(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_type_news_category complain_type_news_category_complain_type_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_type_news_category
    ADD CONSTRAINT complain_type_news_category_complain_type_id_fkey FOREIGN KEY (complain_type_id) REFERENCES cityservices.complain_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: complain_type_news_category complain_type_news_category_news_category_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.complain_type_news_category
    ADD CONSTRAINT complain_type_news_category_news_category_id_fkey FOREIGN KEY (news_category_id) REFERENCES cityservices.news_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: electricity_meter electricity_meter_house_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.electricity_meter
    ADD CONSTRAINT electricity_meter_house_id_fkey FOREIGN KEY (house_id) REFERENCES cityservices.house(id);


--
-- Name: electricity_meter_value electricity_meter_value_meter_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.electricity_meter_value
    ADD CONSTRAINT electricity_meter_value_meter_id_fkey FOREIGN KEY (meter_id) REFERENCES cityservices.electricity_meter(id);


--
-- Name: slot_history_attachment fk_history_id__slot_history_id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.slot_history_attachment
    ADD CONSTRAINT fk_history_id__slot_history_id FOREIGN KEY (history_id) REFERENCES cityservices.slot_history(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: med_clinic_link fk_operator_id__account_id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_clinic_link
    ADD CONSTRAINT fk_operator_id__account_id FOREIGN KEY (operator_id) REFERENCES cityservices.account(id);


--
-- Name: user_subscription fk_user_id__user_info_external_id; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_subscription
    ADD CONSTRAINT fk_user_id__user_info_external_id FOREIGN KEY (user_id) REFERENCES cityservices.user_info(external_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: med_hospital_policy med_hospital_policy_hospital_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital_policy
    ADD CONSTRAINT med_hospital_policy_hospital_id_fkey FOREIGN KEY (hospital_id) REFERENCES cityservices.med_hospital(id);


--
-- Name: med_hospital_policy med_hospital_policy_policy_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital_policy
    ADD CONSTRAINT med_hospital_policy_policy_id_fkey FOREIGN KEY (policy_id) REFERENCES cityservices.med_policy(id);


--
-- Name: med_hospital_unit med_hospital_unit_doctor_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital_unit
    ADD CONSTRAINT med_hospital_unit_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES cityservices.med_doctor(id);


--
-- Name: med_hospital_unit_favorite med_hospital_unit_favorite_hospital_unit_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital_unit_favorite
    ADD CONSTRAINT med_hospital_unit_favorite_hospital_unit_id_fkey FOREIGN KEY (hospital_unit_id) REFERENCES cityservices.med_hospital_unit(id);


--
-- Name: med_hospital_unit_favorite med_hospital_unit_favorite_user_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital_unit_favorite
    ADD CONSTRAINT med_hospital_unit_favorite_user_id_fkey FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id);


--
-- Name: med_hospital_unit med_hospital_unit_hospital_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital_unit
    ADD CONSTRAINT med_hospital_unit_hospital_id_fkey FOREIGN KEY (hospital_id) REFERENCES cityservices.med_hospital(id);


--
-- Name: med_hospital_unit med_hospital_unit_speciality_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_hospital_unit
    ADD CONSTRAINT med_hospital_unit_speciality_id_fkey FOREIGN KEY (speciality_id) REFERENCES cityservices.med_doctor_speciality(id);


--
-- Name: med_treatment_day med_treatment_day_unit_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_treatment_day
    ADD CONSTRAINT med_treatment_day_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES cityservices.med_hospital_unit(id);


--
-- Name: med_treatment_slot med_treatment_slot_day_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_treatment_slot
    ADD CONSTRAINT med_treatment_slot_day_id_fkey FOREIGN KEY (day_id) REFERENCES cityservices.med_treatment_day(id);


--
-- Name: med_treatment_slot med_treatment_slot_policy_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.med_treatment_slot
    ADD CONSTRAINT med_treatment_slot_policy_id_fkey FOREIGN KEY (policy_id) REFERENCES cityservices.med_policy(id);


--
-- Name: message message_mime_type_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.message
    ADD CONSTRAINT message_mime_type_id_fkey FOREIGN KEY (mime_type_id) REFERENCES cityservices.mime_type(id);


--
-- Name: message_tag message_tag_message_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.message_tag
    ADD CONSTRAINT message_tag_message_id_fkey FOREIGN KEY (message_id) REFERENCES cityservices.message(id);


--
-- Name: news_element_has_tag news_element_has_tag_news_element_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_element_has_tag
    ADD CONSTRAINT news_element_has_tag_news_element_id_fkey FOREIGN KEY (news_element_id) REFERENCES cityservices.news_element(id) ON DELETE CASCADE;


--
-- Name: news_element_has_tag news_element_has_tag_news_tag_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.news_element_has_tag
    ADD CONSTRAINT news_element_has_tag_news_tag_id_fkey FOREIGN KEY (news_tag_id) REFERENCES cityservices.news_tag(id) ON DELETE CASCADE;


--
-- Name: offence offence_user_info_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.offence
    ADD CONSTRAINT offence_user_info_id_fkey FOREIGN KEY (user_info_id) REFERENCES cityservices.user_info(id);


--
-- Name: published published_person_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.published
    ADD CONSTRAINT published_person_id_fkey FOREIGN KEY (person_id) REFERENCES cityservices.user_info(id);


--
-- Name: published published_poll_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.published
    ADD CONSTRAINT published_poll_id_fkey FOREIGN KEY (poll_id) REFERENCES cityservices.polls(id);


--
-- Name: questions questions_poll_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.questions
    ADD CONSTRAINT questions_poll_id_fkey FOREIGN KEY (poll_id) REFERENCES cityservices.polls(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: service service_category_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service
    ADD CONSTRAINT service_category_id_fkey FOREIGN KEY (category_id) REFERENCES cityservices.service_category(id);


--
-- Name: service_favorite_param service_favorite_param_favorite_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_favorite_param
    ADD CONSTRAINT service_favorite_param_favorite_id_fkey FOREIGN KEY (favorite_id) REFERENCES cityservices.service_favorite(id);


--
-- Name: service_favorite service_favorite_service_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_favorite
    ADD CONSTRAINT service_favorite_service_id_fkey FOREIGN KEY (service_id) REFERENCES cityservices.service(id);


--
-- Name: service_favorite service_favorite_user_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_favorite
    ADD CONSTRAINT service_favorite_user_id_fkey FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id);


--
-- Name: service_history_param service_history_param_param_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_history_param
    ADD CONSTRAINT service_history_param_param_id_fkey FOREIGN KEY (param_id) REFERENCES cityservices.service_param(id);


--
-- Name: service_history_param service_history_param_service_history_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_history_param
    ADD CONSTRAINT service_history_param_service_history_id_fkey FOREIGN KEY (service_history_id) REFERENCES cityservices.service_history(id);


--
-- Name: service_history service_history_service_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_history
    ADD CONSTRAINT service_history_service_id_fkey FOREIGN KEY (service_id) REFERENCES cityservices.service(id);


--
-- Name: service_param service_param_service_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_param
    ADD CONSTRAINT service_param_service_id_fkey FOREIGN KEY (service_id) REFERENCES cityservices.service(id);


--
-- Name: service_subscription_param service_subscription_param_param_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_subscription_param
    ADD CONSTRAINT service_subscription_param_param_id_fkey FOREIGN KEY (param_id) REFERENCES cityservices.service_param(id);


--
-- Name: service_subscription_param service_subscription_param_subscription_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_subscription_param
    ADD CONSTRAINT service_subscription_param_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES cityservices.service_subscription(id);


--
-- Name: service_subscription service_subscription_service_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.service_subscription
    ADD CONSTRAINT service_subscription_service_id_fkey FOREIGN KEY (service_id) REFERENCES cityservices.service(id);


--
-- Name: text_service_group text_service_group_category_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.text_service_group
    ADD CONSTRAINT text_service_group_category_id_fkey FOREIGN KEY (category_id) REFERENCES cityservices.text_service_category(id);


--
-- Name: text_service text_service_group_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.text_service
    ADD CONSTRAINT text_service_group_id_fkey FOREIGN KEY (group_id) REFERENCES cityservices.text_service_group(id);


--
-- Name: transaction transaction_message_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.transaction
    ADD CONSTRAINT transaction_message_id_fkey FOREIGN KEY (message_id) REFERENCES cityservices.message(id);


--
-- Name: user_answers user_answers_answer_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_answers
    ADD CONSTRAINT user_answers_answer_id_fkey FOREIGN KEY (answer_id) REFERENCES cityservices.answers(id);


--
-- Name: user_answers user_answers_person_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_answers
    ADD CONSTRAINT user_answers_person_id_fkey FOREIGN KEY (person_id) REFERENCES cityservices.user_info(id);


--
-- Name: user_answers user_answers_question_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_answers
    ADD CONSTRAINT user_answers_question_id_fkey FOREIGN KEY (question_id) REFERENCES cityservices.questions(id);


--
-- Name: user_houses user_houses_house_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_houses
    ADD CONSTRAINT user_houses_house_id_fkey FOREIGN KEY (house_id) REFERENCES cityservices.house(id);


--
-- Name: user_houses user_houses_user_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_houses
    ADD CONSTRAINT user_houses_user_id_fkey FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id);


--
-- Name: user_info user_info_policy_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_info
    ADD CONSTRAINT user_info_policy_id_fkey FOREIGN KEY (policy_id) REFERENCES cityservices.med_policy(id);


--
-- Name: user_profile_info user_profile_info_user_info_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_profile_info
    ADD CONSTRAINT user_profile_info_user_info_id_fkey FOREIGN KEY (user_info_id) REFERENCES cityservices.user_info(id);


--
-- Name: user_request_abstract user_request_abstract_operator_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_abstract
    ADD CONSTRAINT user_request_abstract_operator_id_fkey FOREIGN KEY (operator_id) REFERENCES cityservices.account(id);


--
-- Name: user_request_abstract user_request_abstract_user_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_abstract
    ADD CONSTRAINT user_request_abstract_user_id_fkey FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id);


--
-- Name: user_request_epd user_request_epd_house_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_epd
    ADD CONSTRAINT user_request_epd_house_id_fkey FOREIGN KEY (house_id) REFERENCES cityservices.house(id);


--
-- Name: user_request_epd user_request_epd_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_epd
    ADD CONSTRAINT user_request_epd_id_fkey FOREIGN KEY (id) REFERENCES cityservices.user_request_abstract(id);


--
-- Name: user_request_feedback user_request_feedback_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_feedback
    ADD CONSTRAINT user_request_feedback_id_fkey FOREIGN KEY (id) REFERENCES cityservices.user_request_abstract(id);


--
-- Name: user_request_history user_request_history_operator_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_history
    ADD CONSTRAINT user_request_history_operator_id_fkey FOREIGN KEY (operator_id) REFERENCES cityservices.account(id);


--
-- Name: user_request_history user_request_history_request_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_history
    ADD CONSTRAINT user_request_history_request_id_fkey FOREIGN KEY (request_id) REFERENCES cityservices.user_request_abstract(id);


--
-- Name: user_request_history user_request_history_user_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_history
    ADD CONSTRAINT user_request_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id);


--
-- Name: user_request_sos user_request_sos_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.user_request_sos
    ADD CONSTRAINT user_request_sos_id_fkey FOREIGN KEY (id) REFERENCES cityservices.user_request_abstract(id);


--
-- Name: vaccination_plan vaccination_plan_statusid_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.vaccination_plan
    ADD CONSTRAINT vaccination_plan_statusid_fkey FOREIGN KEY (statusid) REFERENCES cityservices.vaccination_status(id);


--
-- Name: vaccination_plan vaccination_plan_type_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.vaccination_plan
    ADD CONSTRAINT vaccination_plan_type_id_fkey FOREIGN KEY (type_id) REFERENCES cityservices.vaccination_plan_type(id);


--
-- Name: vaccination_plan vaccination_plan_user_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.vaccination_plan
    ADD CONSTRAINT vaccination_plan_user_id_fkey FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id);


--
-- Name: water_meter water_meter_house_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.water_meter
    ADD CONSTRAINT water_meter_house_id_fkey FOREIGN KEY (house_id) REFERENCES cityservices.house(id);


--
-- Name: water_meter_value water_meter_value_meter_id_fkey; Type: FK CONSTRAINT; Schema: cityservices; Owner: -
--

ALTER TABLE ONLY cityservices.water_meter_value
    ADD CONSTRAINT water_meter_value_meter_id_fkey FOREIGN KEY (meter_id) REFERENCES cityservices.water_meter(id);


--
-- Name: chat FK_channelId__chat_channelId; Type: FK CONSTRAINT; Schema: cityservices_chats; Owner: -
--

ALTER TABLE ONLY cityservices_chats.chat
    ADD CONSTRAINT "FK_channelId__chat_channelId" FOREIGN KEY (channel_id) REFERENCES cityservices.chat_channel(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: chat_message FK_chatId__chat_id; Type: FK CONSTRAINT; Schema: cityservices_chats; Owner: -
--

ALTER TABLE ONLY cityservices_chats.chat_message
    ADD CONSTRAINT "FK_chatId__chat_id" FOREIGN KEY (chat_id) REFERENCES cityservices_chats.chat(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: chat FK_userId__userInfo_id; Type: FK CONSTRAINT; Schema: cityservices_chats; Owner: -
--

ALTER TABLE ONLY cityservices_chats.chat
    ADD CONSTRAINT "FK_userId__userInfo_id" FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: communication_journal FK_communicationJournal_account_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.communication_journal
    ADD CONSTRAINT "FK_communicationJournal_account_1" FOREIGN KEY (operator_id) REFERENCES cityservices.account(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: communication_journal FK_communicationJournal_communication_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.communication_journal
    ADD CONSTRAINT "FK_communicationJournal_communication_1" FOREIGN KEY (communication_id) REFERENCES cityservices_communication.communication(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: communication_statistic_value FK_communicationStatisticValue_communicationStatisticType_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.communication_statistic_value
    ADD CONSTRAINT "FK_communicationStatisticValue_communicationStatisticType_1" FOREIGN KEY (communication_statistic_type_id) REFERENCES cityservices_communication.communication_statistic_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: communication_statistic_value FK_communicationStatisticValue_communication_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.communication_statistic_value
    ADD CONSTRAINT "FK_communicationStatisticValue_communication_1" FOREIGN KEY (communication_id) REFERENCES cityservices_communication.communication(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution_group_has_user FK_distributionGroupHasUser_distribution_group_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_group_has_user
    ADD CONSTRAINT "FK_distributionGroupHasUser_distribution_group_1" FOREIGN KEY (distribution_group_id) REFERENCES cityservices_communication.distribution_group(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution_group FK_distributionGroup_communication_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_group
    ADD CONSTRAINT "FK_distributionGroup_communication_1" FOREIGN KEY (communication_id) REFERENCES cityservices_communication.communication(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution_has_distribution_template FK_distributionHasDistributionTemplate_distributionTemplate_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_has_distribution_template
    ADD CONSTRAINT "FK_distributionHasDistributionTemplate_distributionTemplate_1" FOREIGN KEY (distribution_template_id) REFERENCES cityservices_communication.distribution_template(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution_has_distribution_template FK_distributionHasDistributionTemplate_distribution_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_has_distribution_template
    ADD CONSTRAINT "FK_distributionHasDistributionTemplate_distribution_1" FOREIGN KEY (distribution_id) REFERENCES cityservices_communication.distribution(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution_journal FK_distributionJournal_account_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_journal
    ADD CONSTRAINT "FK_distributionJournal_account_1" FOREIGN KEY (operator_id) REFERENCES cityservices.account(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution_journal FK_distributionJournal_distribution_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_journal
    ADD CONSTRAINT "FK_distributionJournal_distribution_1" FOREIGN KEY (distribution_id) REFERENCES cityservices_communication.distribution(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution_template_group FK_distributionTemplate_communication_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_template_group
    ADD CONSTRAINT "FK_distributionTemplate_communication_1" FOREIGN KEY (communication_id) REFERENCES cityservices_communication.communication(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution FK_distribution_communication_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution
    ADD CONSTRAINT "FK_distribution_communication_1" FOREIGN KEY (communication_id) REFERENCES cityservices_communication.communication(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution FK_distribution_distributionGroup_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution
    ADD CONSTRAINT "FK_distribution_distributionGroup_1" FOREIGN KEY (distribution_group_id) REFERENCES cityservices_communication.distribution_group(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution FK_distribution_distributionTemplate_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution
    ADD CONSTRAINT "FK_distribution_distributionTemplate_1" FOREIGN KEY (distribution_template_group_id) REFERENCES cityservices_communication.distribution_template_group(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution_log FK_distribution_log_id.distribution_id; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_log
    ADD CONSTRAINT "FK_distribution_log_id.distribution_id" FOREIGN KEY (distribution_id) REFERENCES cityservices_communication.distribution(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution_template FK_distribution_template_distribution_template_1; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_template
    ADD CONSTRAINT "FK_distribution_template_distribution_template_1" FOREIGN KEY (group_id) REFERENCES cityservices_communication.distribution_template_group(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: distribution_template FK_distribution_template_distribution_template_2; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.distribution_template
    ADD CONSTRAINT "FK_distribution_template_distribution_template_2" FOREIGN KEY (channel_id) REFERENCES cityservices_communication.distribution_channel(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: qrtz_blob_triggers qrtz_blob_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES cityservices_communication.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_cron_triggers qrtz_cron_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES cityservices_communication.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simple_triggers qrtz_simple_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES cityservices_communication.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES cityservices_communication.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers qrtz_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: cityservices_communication; Owner: -
--

ALTER TABLE ONLY cityservices_communication.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_sched_name_fkey FOREIGN KEY (sched_name, job_name, job_group) REFERENCES cityservices_communication.qrtz_job_details(sched_name, job_name, job_group);


--
-- Name: email_account email_account_smtp_server_id_fkey; Type: FK CONSTRAINT; Schema: email; Owner: -
--

ALTER TABLE ONLY email.email_account
    ADD CONSTRAINT email_account_smtp_server_id_fkey FOREIGN KEY (smtp_server_id) REFERENCES email.smtp_server(id);


--
-- Name: file_info file_info_bucket_id_fkey; Type: FK CONSTRAINT; Schema: large_obj_storage; Owner: -
--

ALTER TABLE ONLY large_obj_storage.file_info
    ADD CONSTRAINT file_info_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES large_obj_storage.bucket_info(id);


--
-- Name: answer answer_question_id_fkey; Type: FK CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.answer
    ADD CONSTRAINT answer_question_id_fkey FOREIGN KEY (question_id) REFERENCES poll.question(id);


--
-- Name: question question_poll_id_fkey; Type: FK CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.question
    ADD CONSTRAINT question_poll_id_fkey FOREIGN KEY (poll_id) REFERENCES poll.poll(id);


--
-- Name: user_answer user_answer_user_question_id_fkey; Type: FK CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_answer
    ADD CONSTRAINT user_answer_user_question_id_fkey FOREIGN KEY (user_question_id) REFERENCES poll.user_question(id);


--
-- Name: user_point_history user_point_history_user_id_fkey; Type: FK CONSTRAINT; Schema: poll; Owner: -
--

ALTER TABLE ONLY poll.user_point_history
    ADD CONSTRAINT user_point_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES cityservices.user_info(id);


--
-- Name: certificate_android fk_certificate_android_certificate; Type: FK CONSTRAINT; Schema: push; Owner: -
--

ALTER TABLE ONLY push.certificate_android
    ADD CONSTRAINT fk_certificate_android_certificate FOREIGN KEY (id) REFERENCES push.certificate(id);


--
-- Name: certificate_ios fk_certificate_ios_certificate; Type: FK CONSTRAINT; Schema: push; Owner: -
--

ALTER TABLE ONLY push.certificate_ios
    ADD CONSTRAINT fk_certificate_ios_certificate FOREIGN KEY (id) REFERENCES push.certificate(id);


--
-- Name: certificate_winphone fk_certificate_winphone_certificate; Type: FK CONSTRAINT; Schema: push; Owner: -
--

ALTER TABLE ONLY push.certificate_winphone
    ADD CONSTRAINT fk_certificate_winphone_certificate FOREIGN KEY (id) REFERENCES push.certificate(id);


--
-- Name: resource_instance FK_parentId_resourceInstance_id; Type: FK CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.resource_instance
    ADD CONSTRAINT "FK_parentId_resourceInstance_id" FOREIGN KEY (parent_id) REFERENCES resource_structure.resource_instance(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- Name: resource FK_parentId_resource_id; Type: FK CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.resource
    ADD CONSTRAINT "FK_parentId_resource_id" FOREIGN KEY (parent_id) REFERENCES resource_structure.resource(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- Name: schedule FK_resourceId_resource_id; Type: FK CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.schedule
    ADD CONSTRAINT "FK_resourceId_resource_id" FOREIGN KEY (resource_id) REFERENCES resource_structure.resource(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: resource_instance FK_resourceId_resource_id; Type: FK CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.resource_instance
    ADD CONSTRAINT "FK_resourceId_resource_id" FOREIGN KEY (resource_id) REFERENCES resource_structure.resource(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: schedule FK_resourceInstanceId_resourceInstance_id; Type: FK CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.schedule
    ADD CONSTRAINT "FK_resourceInstanceId_resourceInstance_id" FOREIGN KEY (resource_instance_id) REFERENCES resource_structure.resource_instance(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: schedule_gap FK_scheduleId_schedule_id; Type: FK CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.schedule_gap
    ADD CONSTRAINT "FK_scheduleId_schedule_id" FOREIGN KEY (schedule_id) REFERENCES resource_structure.schedule(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: qrtz_blob_triggers qrtz_blob_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES resource_structure.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_cron_triggers qrtz_cron_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES resource_structure.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simple_triggers qrtz_simple_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES resource_structure.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES resource_structure.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers qrtz_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: resource_structure; Owner: -
--

ALTER TABLE ONLY resource_structure.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_sched_name_fkey FOREIGN KEY (sched_name, job_name, job_group) REFERENCES resource_structure.qrtz_job_details(sched_name, job_name, job_group);


--
-- Name: abstract_task fk__abstract_task__end_point_descriptor; Type: FK CONSTRAINT; Schema: scheduling; Owner: -
--

ALTER TABLE ONLY scheduling.abstract_task
    ADD CONSTRAINT fk__abstract_task__end_point_descriptor FOREIGN KEY (endpoint_descriptor_id) REFERENCES backend.abstract_endpoint_descriptor(id);


--
-- Name: cron_task fk__cron_task__abstract_task; Type: FK CONSTRAINT; Schema: scheduling; Owner: -
--

ALTER TABLE ONLY scheduling.cron_task
    ADD CONSTRAINT fk__cron_task__abstract_task FOREIGN KEY (id) REFERENCES scheduling.abstract_task(id);


--
-- Name: time_task fk__time_task__abstract_task; Type: FK CONSTRAINT; Schema: scheduling; Owner: -
--

ALTER TABLE ONLY scheduling.time_task
    ADD CONSTRAINT fk__time_task__abstract_task FOREIGN KEY (id) REFERENCES scheduling.abstract_task(id);


--
-- Name: script_endpoint script_endpoint_backend_id_fkey; Type: FK CONSTRAINT; Schema: script_backend; Owner: -
--

ALTER TABLE ONLY script_backend.script_endpoint
    ADD CONSTRAINT script_endpoint_backend_id_fkey FOREIGN KEY (backend_id) REFERENCES script_backend.script_backend(id);


--
-- Name: routing routing_client_id_fkey; Type: FK CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.routing
    ADD CONSTRAINT routing_client_id_fkey FOREIGN KEY (client_id) REFERENCES sms.client(id);


--
-- Name: routing routing_provider_id_fkey; Type: FK CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.routing
    ADD CONSTRAINT routing_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES sms.provider(id);


--
-- Name: sms_message sms_message_client_id_fkey; Type: FK CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.sms_message
    ADD CONSTRAINT sms_message_client_id_fkey FOREIGN KEY (client_id) REFERENCES sms.client(id);


--
-- Name: sms_message sms_message_routing_id_fkey; Type: FK CONSTRAINT; Schema: sms; Owner: -
--

ALTER TABLE ONLY sms.sms_message
    ADD CONSTRAINT sms_message_routing_id_fkey FOREIGN KEY (routing_id) REFERENCES sms.routing(id);


--
-- Name: command_group fk_bot_id__bot_listener__bot_name; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.command_group
    ADD CONSTRAINT fk_bot_id__bot_listener__bot_name FOREIGN KEY (bot_id) REFERENCES telegram_handler.bot_listener(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: stored_procedure fk_bot_id__bot_listener__id; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.stored_procedure
    ADD CONSTRAINT fk_bot_id__bot_listener__id FOREIGN KEY (bot_id) REFERENCES telegram_handler.bot_listener(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: default_keyboard fk_bot_name__bot_listener__bot_name; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.default_keyboard
    ADD CONSTRAINT fk_bot_name__bot_listener__bot_name FOREIGN KEY (bot_id) REFERENCES telegram_handler.bot_listener(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: command fk_bot_name__command_group__id; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.command
    ADD CONSTRAINT fk_bot_name__command_group__id FOREIGN KEY (group_id) REFERENCES telegram_handler.command_group(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: command_error fk_command_id__command__id; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.command_error
    ADD CONSTRAINT fk_command_id__command__id FOREIGN KEY (command_id) REFERENCES telegram_handler.command(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: command fk_group_id__bot_listener__bot_name; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.command
    ADD CONSTRAINT fk_group_id__bot_listener__bot_name FOREIGN KEY (bot_id) REFERENCES telegram_handler.bot_listener(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: periodic_task fk_group_id__bot_listener__id; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.periodic_task
    ADD CONSTRAINT fk_group_id__bot_listener__id FOREIGN KEY (bot_id) REFERENCES telegram_handler.bot_listener(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: task_log_aggregation fk_id__periodic_task_id; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.task_log_aggregation
    ADD CONSTRAINT fk_id__periodic_task_id FOREIGN KEY (id) REFERENCES telegram_handler.periodic_task(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: task_log fk_task_id__periodic_task_id; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.task_log
    ADD CONSTRAINT fk_task_id__periodic_task_id FOREIGN KEY (task_id) REFERENCES telegram_handler.periodic_task(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: qrtz_blob_triggers qrtz_blob_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES telegram_handler.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_cron_triggers qrtz_cron_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES telegram_handler.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simple_triggers qrtz_simple_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES telegram_handler.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES telegram_handler.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers qrtz_triggers_sched_name_fkey; Type: FK CONSTRAINT; Schema: telegram_handler; Owner: -
--

ALTER TABLE ONLY telegram_handler.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_sched_name_fkey FOREIGN KEY (sched_name, job_name, job_group) REFERENCES telegram_handler.qrtz_job_details(sched_name, job_name, job_group);


--
-- Name: i18n_params i18n_params_template_id_fkey; Type: FK CONSTRAINT; Schema: template; Owner: -
--

ALTER TABLE ONLY template.i18n_params
    ADD CONSTRAINT i18n_params_template_id_fkey FOREIGN KEY (template_id) REFERENCES template.template(id);


--
-- Name: attribute_descriptor attribute_descriptor_parent_id_fkey; Type: FK CONSTRAINT; Schema: userstorage; Owner: -
--

ALTER TABLE ONLY userstorage.attribute_descriptor
    ADD CONSTRAINT attribute_descriptor_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES userstorage.attribute_descriptor(id);


--
-- Name: attribute_value attribute_value_descriptor_id_fkey; Type: FK CONSTRAINT; Schema: userstorage; Owner: -
--

ALTER TABLE ONLY userstorage.attribute_value
    ADD CONSTRAINT attribute_value_descriptor_id_fkey FOREIGN KEY (descriptor_id) REFERENCES userstorage.attribute_descriptor(id);


--
-- Name: attribute_value attribute_value_parent_id_fkey; Type: FK CONSTRAINT; Schema: userstorage; Owner: -
--

ALTER TABLE ONLY userstorage.attribute_value
    ADD CONSTRAINT attribute_value_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES userstorage.attribute_value(id) ON DELETE CASCADE;


--
-- Name: SCHEMA cityservices_chats; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA cityservices_chats TO mp;


--
-- Name: SCHEMA cityservices_communication; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA cityservices_communication TO mp;


--
-- Name: SCHEMA cityservices_metric; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA cityservices_metric TO mp;


--
-- Name: SCHEMA gis; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA gis TO mp;


--
-- Name: SCHEMA notification; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA notification TO mp;


--
-- Name: SCHEMA poll; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA poll TO mp;



--
-- PostgreSQL database dump complete
--

