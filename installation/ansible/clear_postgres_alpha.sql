truncate table aaa.user_session;
truncate table aaa.user_accounts_roles;
truncate table aaa.user_permission cascade;
truncate table aaa.user_role cascade;
truncate table aaa.user_roles_permissions cascade;
truncate table aaa.service_session;

truncate table aaa.mobile_app_instance;
truncate table aaa.confirmation;

truncate table aaa.user_data_property;

delete from aaa.user_account where login != 'admin' or login is null;

truncate table userstorage.attribute_value;

truncate table telegram_transport.telegram_bot;

truncate table resource_structure.schedule cascade;
truncate table resource_structure.resource_instance cascade;


truncate table poll.answer cascade;
truncate table poll.poll cascade;
truncate table poll.poll_answer_profiling_point cascade;
truncate table poll.publishing cascade;
truncate table poll.question cascade;
truncate table poll.user_answer cascade;
truncate table poll.user_point_history cascade;
truncate table poll.user_profiling_points cascade;
truncate table poll.user_question cascade;
truncate table poll.user_status cascade;
truncate table poll.user_status_log cascade;

truncate table notification.log cascade;

truncate table cityservices_metric.engagement_index cascade;
truncate table cityservices_metric.event cascade;
truncate table cityservices_metric.profile_info_index cascade;


truncate table cityservices_metric.engagement_index cascade;
truncate table cityservices_metric.event cascade;

SELECT 'TRUNCATE TABLE cityservices_communication.' ||  tablename || ' cascade;' FROM pg_tables WHERE schemaname = 'cityservices_communication';
-- TRUNCATE TABLE cityservices_communication.distribution_channel cascade;
-- TRUNCATE TABLE cityservices_communication.qrtz_locks cascade;
TRUNCATE TABLE cityservices_communication.qrtz_blob_triggers cascade;
TRUNCATE TABLE cityservices_communication.distribution_log cascade;
TRUNCATE TABLE cityservices_communication.qrtz_calendars cascade;
TRUNCATE TABLE cityservices_communication.qrtz_fired_triggers cascade;
TRUNCATE TABLE cityservices_communication.qrtz_paused_trigger_grps cascade;
TRUNCATE TABLE cityservices_communication.qrtz_scheduler_state cascade;
TRUNCATE TABLE cityservices_communication.qrtz_cron_triggers cascade;
TRUNCATE TABLE cityservices_communication.qrtz_simple_triggers cascade;
TRUNCATE TABLE cityservices_communication.distribution_group cascade;
TRUNCATE TABLE cityservices_communication.distribution_template cascade;
TRUNCATE TABLE cityservices_communication.communication_journal cascade;
TRUNCATE TABLE cityservices_communication.communication_statistic_type cascade;
TRUNCATE TABLE cityservices_communication.communication_statistic_value cascade;
TRUNCATE TABLE cityservices_communication.distribution_group_has_user cascade;
TRUNCATE TABLE cityservices_communication.distribution_has_distribution_template cascade;
TRUNCATE TABLE cityservices_communication.distribution_journal cascade;
TRUNCATE TABLE cityservices_communication.communication cascade;
TRUNCATE TABLE cityservices_communication.distribution cascade;
TRUNCATE TABLE cityservices_communication.distribution_template_group cascade;
TRUNCATE TABLE cityservices_communication.qrtz_simprop_triggers cascade;
TRUNCATE TABLE cityservices_communication.qrtz_job_details cascade;
TRUNCATE TABLE cityservices_communication.qrtz_triggers cascade;

TRUNCATE TABLE cityservices_chats.chat cascade;
TRUNCATE TABLE cityservices_chats.chat_message cascade;

SELECT 'TRUNCATE TABLE cityservices.' ||  tablename || ' cascade;' FROM pg_tables WHERE schemaname = 'cityservices' order by tablename;

delete from cityservices.account_roles where account_id != 1;


--TRUNCATE TABLE cityservices.account cascade;
TRUNCATE TABLE cityservices.account_action cascade;
--TRUNCATE TABLE cityservices.account_roles cascade;
TRUNCATE TABLE cityservices.answers cascade;
TRUNCATE TABLE cityservices.attachment cascade;
TRUNCATE TABLE cityservices.available_endpoint cascade;
TRUNCATE TABLE cityservices.bookmark_favorite_screen cascade;
TRUNCATE TABLE cityservices.bookmark_history_screen cascade;
TRUNCATE TABLE cityservices.chat_channel cascade;
TRUNCATE TABLE cityservices.chat_message cascade;
TRUNCATE TABLE cityservices.complain cascade;
TRUNCATE TABLE cityservices.complain_field cascade;
TRUNCATE TABLE cityservices.complain_field_value cascade;
TRUNCATE TABLE cityservices.complain_group cascade;
TRUNCATE TABLE cityservices.complain_group_has_role cascade;
TRUNCATE TABLE cityservices.complain_history cascade;
TRUNCATE TABLE cityservices.complain_status cascade;
TRUNCATE TABLE cityservices.complain_status_has_role cascade;
TRUNCATE TABLE cityservices.complain_status_workflow cascade;
TRUNCATE TABLE cityservices.complain_type cascade;
TRUNCATE TABLE cityservices.complain_type_news_category cascade;
TRUNCATE TABLE cityservices.complain_workflow_has_field cascade;
TRUNCATE TABLE cityservices.complain_workflow_has_role cascade;
TRUNCATE TABLE cityservices.complaint_performance_type cascade;
TRUNCATE TABLE cityservices.complaint_performance_value cascade;
TRUNCATE TABLE cityservices.complaint_statistic_by_type cascade;
TRUNCATE TABLE cityservices.confirmation cascade;
TRUNCATE TABLE cityservices.electricity_meter cascade;
TRUNCATE TABLE cityservices.electricity_meter_value cascade;
--TRUNCATE TABLE cityservices.electro_bills cascade;
TRUNCATE TABLE cityservices.evacuation cascade;
--TRUNCATE TABLE cityservices.fines cascade;
--TRUNCATE TABLE cityservices.flow cascade;
--TRUNCATE TABLE cityservices.gas_bills cascade;
TRUNCATE TABLE cityservices.house cascade;
TRUNCATE TABLE cityservices.med_clinic_link cascade;
TRUNCATE TABLE cityservices.med_doctor cascade;
TRUNCATE TABLE cityservices.med_doctor_speciality cascade;
TRUNCATE TABLE cityservices.med_hospital cascade;
TRUNCATE TABLE cityservices.med_hospital_policy cascade;
TRUNCATE TABLE cityservices.med_hospital_unit cascade;
TRUNCATE TABLE cityservices.med_hospital_unit_favorite cascade;
TRUNCATE TABLE cityservices.med_policy cascade;
TRUNCATE TABLE cityservices.med_speciality cascade;
TRUNCATE TABLE cityservices.med_treatment_day cascade;
TRUNCATE TABLE cityservices.med_treatment_slot cascade;
TRUNCATE TABLE cityservices.message cascade;
TRUNCATE TABLE cityservices.message_tag cascade;
--TRUNCATE TABLE cityservices.mime_type cascade;
TRUNCATE TABLE cityservices.news_category cascade;
TRUNCATE TABLE cityservices.news_element cascade;
TRUNCATE TABLE cityservices.news_element_has_category cascade;
TRUNCATE TABLE cityservices.news_element_has_tag cascade;
TRUNCATE TABLE cityservices.news_tag cascade;
TRUNCATE TABLE cityservices.news_user_info cascade;
TRUNCATE TABLE cityservices.offence cascade;
TRUNCATE TABLE cityservices.polls cascade;
--TRUNCATE TABLE cityservices.profile_attribute cascade;
--TRUNCATE TABLE cityservices.profile_important_attribute cascade;
TRUNCATE TABLE cityservices.published cascade;
TRUNCATE TABLE cityservices.questions cascade;
--TRUNCATE TABLE cityservices.role cascade;
TRUNCATE TABLE cityservices.role_links cascade;
--TRUNCATE TABLE cityservices.service cascade;
--TRUNCATE TABLE cityservices.service_category cascade;
TRUNCATE TABLE cityservices.service_favorite cascade;
TRUNCATE TABLE cityservices.service_favorite_param cascade;
TRUNCATE TABLE cityservices.service_history cascade;
TRUNCATE TABLE cityservices.service_history_param cascade;
TRUNCATE TABLE cityservices.service_param cascade;
TRUNCATE TABLE cityservices.service_subscription cascade;
TRUNCATE TABLE cityservices.service_subscription_param cascade;
TRUNCATE TABLE cityservices.slot_group cascade;
TRUNCATE TABLE cityservices.slot_history cascade;
TRUNCATE TABLE cityservices.slot_history_attachment cascade;
TRUNCATE TABLE cityservices.statistic_type cascade;
TRUNCATE TABLE cityservices.statistic_value cascade;
TRUNCATE TABLE cityservices.supervisor cascade;
TRUNCATE TABLE cityservices.text_service cascade;
TRUNCATE TABLE cityservices.text_service_category cascade;
TRUNCATE TABLE cityservices.text_service_group cascade;
TRUNCATE TABLE cityservices.transaction cascade;
--TRUNCATE TABLE cityservices.translation cascade;
--TRUNCATE TABLE cityservices.ui_config cascade;
TRUNCATE TABLE cityservices.user_answers cascade;
TRUNCATE TABLE cityservices.user_geoposition cascade;
TRUNCATE TABLE cityservices.user_geoposition_2 cascade;
TRUNCATE TABLE cityservices.user_houses cascade;TRUNCATE TABLE sms.sms_transaction cascade;
--TRUNCATE TABLE cityservices.user_info cascade;
--TRUNCATE TABLE cityservices.user_points cascade;
TRUNCATE TABLE cityservices.user_profile_info cascade;
TRUNCATE TABLE cityservices.user_request_abstract cascade;
TRUNCATE TABLE cityservices.user_request_epd cascade;
TRUNCATE TABLE cityservices.user_request_feedback cascade;
TRUNCATE TABLE cityservices.user_request_history cascade;
TRUNCATE TABLE cityservices.user_request_sos cascade;
TRUNCATE TABLE cityservices.user_subscription cascade;
--TRUNCATE TABLE cityservices.user_translation cascade;
TRUNCATE TABLE cityservices.vaccination_plan cascade;
TRUNCATE TABLE cityservices.vaccination_plan_type cascade;
--TRUNCATE TABLE cityservices.vaccination_status cascade;
--TRUNCATE TABLE cityservices.water_bills cascade;
TRUNCATE TABLE cityservices.water_meter cascade;
TRUNCATE TABLE cityservices.water_meter_value cascade;

delete from cityservices.account where login != 'admin';


TRUNCATE TABLE sms.sms_message cascade;
TRUNCATE TABLE sms.sms_transaction cascade;

TRUNCATE TABLE msp_events.event cascade;