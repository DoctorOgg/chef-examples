default["oun-ServiceAPI"]["home_dir"]                                                       = "/opt/oun"
default["oun-ServiceAPI"]["sapi_home_dir"]                                                  = "#{node["oun-ServiceAPI"]["home_dir"]}/sapi"
default["oun-ServiceAPI"]["mongo_driver_file"]                                              = "php5-mongo_1.6.11-1_amd64.deb"
default["oun-ServiceAPI"]["s3_builds_bucket"]                                               = "oun-builds"
default["oun-ServiceAPI"]["s3_build_folder"]                                                = "php_mongo_driver/ubuntu_14.04"
default["oun-ServiceAPI"]["git"]["api_version"]                                             = "dev"
default["oun-ServiceAPI"]["git"]["branch"]                                                  = "dev1"
default["oun-ServiceAPI"]["git"]["url"]                                                     = "https://github.com/oneuni/ServiceAPI.git"
default["oun-ServiceAPI"]["redirect_ssl"]                                                   = true

##################################################
# Main Config
##################################################
default["oun-ServiceAPI"]["main_config"]["api_central_db"]                                  = "central"
default["oun-ServiceAPI"]["main_config"]["api_baseuri"]                                     = "http://sapi.local/"
default["oun-ServiceAPI"]["main_config"]["api_security_enabled"]                            = true
default["oun-ServiceAPI"]["main_config"]["api_authtoken_enabled"]                           = true
default["oun-ServiceAPI"]["main_config"]["api_authtoken_expire"]                            = 604800
default["oun-ServiceAPI"]["main_config"]["api_authtoken_redis_database_index"]              = 1
default["oun-ServiceAPI"]["main_config"]["api_accesstoken_session_expire"]                  = 604800
default["oun-ServiceAPI"]["main_config"]["api_requesttoken_expire"]                         = 60
default["oun-ServiceAPI"]["main_config"]["api_cryption_cipher"]                             = "MCRYPT_3DES"
default["oun-ServiceAPI"]["main_config"]["api_cryption_key"]                                = "TRIPLEDESKEY24BYTES12345"
default["oun-ServiceAPI"]["main_config"]["api_cryption_mode"]                               = "MCRYPT_MODE_OFB"
default["oun-ServiceAPI"]["main_config"]["api_cryption_ivkey"]                              = "TESTIV99"
default["oun-ServiceAPI"]["main_config"]["cache_enabled"]                                   = true
default["oun-ServiceAPI"]["main_config"]["cache_default_time_policy"]                       = "1 hour"
default["oun-ServiceAPI"]["main_config"]["cache_type"]                                      = "file"
default["oun-ServiceAPI"]["main_config"]["webapp_redis_url"]                                = "tcp://redis.local:6379"
default["oun-ServiceAPI"]["main_config"]["log_mongo_enabled"]                               = true
default["oun-ServiceAPI"]["main_config"]["log_syslog_enabled"]                              = false
default["oun-ServiceAPI"]["main_config"]["log_webserver_enabled"]                           = false
default["oun-ServiceAPI"]["main_config"]["log_level"]                                       = 4 # 0 = Off, 1=Critical, 2=Error, 3=Warning, 4=Information, 5=Debug
default["oun-ServiceAPI"]["main_config"]["log_length"]                                      = "2 days"
default["oun-ServiceAPI"]["main_config"]["log_archive_length"]                              = "2 weeks"
default["oun-ServiceAPI"]["main_config"]["api_arn_messagequeue"]                            = "arn:aws:sns:us-east-1:xxxxxxxxxxx:messagequeue"
default["oun-ServiceAPI"]["main_config"]["api_arn_mq"]                                      = "arn_messagequeue"
default["oun-ServiceAPI"]["main_config"]["api_arn_prefix"]                                  = "arn:aws:sns:us-east-1:xxxxxxxxxxxx:"
default["oun-ServiceAPI"]["main_config"]["api_topic_environment"]                           = "dev"
default["oun-ServiceAPI"]["main_config"]["api_s3_bucketname"]                               = "SETME"
default["oun-ServiceAPI"]["main_config"]["api_s3_profile_avatar_path"]                      = "profiles/avatars/"
default["oun-ServiceAPI"]["main_config"]["api_s3_counselor_report_path"]                    = "reports/assessments_summary/"
default["oun-ServiceAPI"]["main_config"]["api_s3_content_sections_path"]                    = "content/sections/"
default["oun-ServiceAPI"]["main_config"]["api_s3_content_careers_path"]                     = "content/careers/"
default["oun-ServiceAPI"]["main_config"]["api_use_sns_as_mq"]                               = true
default["oun-ServiceAPI"]["main_config"]["canvas_access_token"]                             = "SETME"
default["oun-ServiceAPI"]["main_config"]["canvas_baseurl"]                                  = "SETME"
default["oun-ServiceAPI"]["main_config"]["canvas_accountid"]                                = "SETME"
default["oun-ServiceAPI"]["main_config"]["canvas_url"]                                      = "SETME"
default["oun-ServiceAPI"]["main_config"]["canvas_allow_nonpublished_instructor_enrollment"] = false
default["oun-ServiceAPI"]["main_config"]["send_alerts"]                                     = false
default["oun-ServiceAPI"]["main_config"]["raise_email_alerts"]                              = false
default["oun-ServiceAPI"]["main_config"]["email_section_ready_canvas"]                      = ""
default["oun-ServiceAPI"]["main_config"]["enrollrules_days_before_class"]                   = 15
default["oun-ServiceAPI"]["main_config"]["enrollrules_orientation_days_before_class"]       = 35
default["oun-ServiceAPI"]["main_config"]["enrollrules_statuses"]                            = "'Enrolled Partial Pay', 'Enrolled Paid', 'Active', 'Converted'"
default["oun-ServiceAPI"]["main_config"]["content_max_video_size_for_archive"]              = 367000000

##################################################
# EEC Config
##################################################
default["oun-ServiceAPI"]["eec_config"]["redis_url"]                                        = "tcp://redis.local:6379"
default["oun-ServiceAPI"]["eec_config"]["mysql_host"]                                       = "SETME"
default["oun-ServiceAPI"]["eec_config"]["mysql_port"]                                       = "3306"
default["oun-ServiceAPI"]["eec_config"]["mysql_username"]                                   = "SETME"
default["oun-ServiceAPI"]["eec_config"]["mysql_password"]                                   = "SETME"
default["oun-ServiceAPI"]["eec_config"]["mysql_database"]                                   = "eec"

##################################################
#  AWS Config
##################################################
default["oun-ServiceAPI"]["aws"]["api_aws_key"]                                             = "SETME"
default["oun-ServiceAPI"]["aws"]["api_aws_secret_key"]                                      = "SETME"
default["oun-ServiceAPI"]["aws"]["api_aws_account_id"]                                      = "SETME"
default["oun-ServiceAPI"]["aws"]["api_aws_canonical_id"]                                    = "SETME"
default["oun-ServiceAPI"]["aws"]["api_aws_canonical_name"]                                  = "SETME"

##################################################
# Mongo Config
##################################################
default["oun-ServiceAPI"]["mongo"]["mongo_host"]                                            = []
default["oun-ServiceAPI"]["mongo"]["mongo_mold_host"]                                       = "SETME"
default["oun-ServiceAPI"]["mongo"]["mongo_port"]                                            = "27017"
default["oun-ServiceAPI"]["mongo"]["api_mongo_db"]                                          = "user"
default["oun-ServiceAPI"]["mongo"]["mongo_persist"]                                         = "TRUE"
default["oun-ServiceAPI"]["mongo"]["mongo_persist_key"]                                     = "ci_mongo_persist"
default["oun-ServiceAPI"]["mongo"]["api_mongo_return"]                                      = "array"
default["oun-ServiceAPI"]["mongo"]["mongo_query_safety"]                                    = "safe"
default["oun-ServiceAPI"]["mongo"]["mongo_supress_connect_error"]                           = "TRUE"
default["oun-ServiceAPI"]["mongo"]["mongo_host_db_flag"]                                    = false
default["oun-ServiceAPI"]["mongo"]["mongo_slaveok"]                                         = true
default["oun-ServiceAPI"]["mongo"]["mongo_option_user"]                                     = "admin"
default["oun-ServiceAPI"]["mongo"]["mongo_option_pass"]                                     = "SETME"
default["oun-ServiceAPI"]["mongo"]["api_mongo_db_api"]                                      = "api"
default["oun-ServiceAPI"]["mongo"]["api_mongo_db_user"]                                     = "user"
default["oun-ServiceAPI"]["mongo"]["api_mongo_db_eventlog"]                                 = "eventlog"
default["oun-ServiceAPI"]["mongo"]["mongo_replicaset"]                                      = "SETME"
default["oun-ServiceAPI"]["mongo"]["mongo_timeout"]                                         = 100
default["oun-ServiceAPI"]["mongo"]["eci_db"]                                                = "eci"
default["oun-ServiceAPI"]["mongo"]["leads_db"]                                              = "leads"
default["oun-ServiceAPI"]["mongo"]["events_db"]                                             = "events"
default["oun-ServiceAPI"]["mongo"]["security_db"]                                           = "security"
default["oun-ServiceAPI"]["mongo"]["resources_db"]                                          = "resources"
default["oun-ServiceAPI"]["mongo"]["mq_db"]                                                 = "mq"
default["oun-ServiceAPI"]["mongo"]["oauth_db"]                                              = "security"

###################################################
#  LDAP Config
##################################################
default["oun-ServiceAPI"]["ldap"]["ldap_url"]                  = "SETME"
default["oun-ServiceAPI"]["ldap"]["ldap_escadmin_base"]        = "SETME"
default["oun-ServiceAPI"]["ldap"]["ldap_escadmin_lookupfield"] = "memberUid"
default["oun-ServiceAPI"]["ldap"]["ldap_base"]                 = "SETME"
default["oun-ServiceAPI"]["ldap"]["ldap_auth_lookupfield"]     = "uid"
default["oun-ServiceAPI"]["ldap"]["ldap_version"]              = "3"


##################################################
# SALESFORCE
##################################################
default["oun-ServiceAPI"]["salesforce"]["api_salesforce_username"]                          = "SETME"
default["oun-ServiceAPI"]["salesforce"]["api_salesforce_password"]                          = "SETME"
default["oun-ServiceAPI"]["salesforce"]["api_salesforce_token"]                             = "SETME"
default["oun-ServiceAPI"]["salesforce"]["api_salesforce_use_sandbox"]                       = "SETME"

##################################################
#  REMINDER NOTIFICATIONS
##################################################
default["oun-ServiceAPI"]["reminders"]["avatar_period_after_login"]                         = "7 days"
default["oun-ServiceAPI"]["reminders"]["assignment_write_period_before_due"]                = "2 days"
default["oun-ServiceAPI"]["reminders"]["assignment_discussion_period_before_due"]           = "1 day"
default["oun-ServiceAPI"]["reminders"]["assignment_group_period_before_due"]                = "1 hour"

##################################################
# WSO2 Resources
##################################################
default["oun-ServiceAPI"]["wso2"]['wso2_remote_user_store_wsdl_url']                        = "https://SETME/services/RemoteUserStoreManagerService?wsdl"
default["oun-ServiceAPI"]["wso2"]['wso2_user_info_recovery_wsdl_url']                       = "https://SETME/services/UserInformationRecoveryService?wsdl";
default["oun-ServiceAPI"]["wso2"]["idr_bulk_add_user_strategy"]                             = "wso2"


##################################################
# Error Reporting
##################################################
default["oun-ServiceAPI"]["php"]["error_reporting"]                                         = 1
default["oun-ServiceAPI"]["php"]["display_errors"]                                          = "off"
default["oun-ServiceAPI"]["php"]["display_startup_errors"]                                  = "off"
default["oun-ServiceAPI"]["php"]["html_errors"]                                             = "off"
default["oun-ServiceAPI"]["php"]["log_errors"]                                              = "on"

##################################################
# Viddler
##################################################
default["oun-ServiceAPI"]["viddler"]["viddlerUsername"] = "SETME"
default["oun-ServiceAPI"]["viddler"]["viddlerPassword"] = "SETME"
default["oun-ServiceAPI"]["viddler"]["viddlerApiKey"]   = "SETME"

##################################################
# Zendesk
##################################################
default["oun-ServiceAPI"]["zendesk"]["subdomain"] = "oun"
default["oun-ServiceAPI"]["zendesk"]["username"] = "SETME"
default["oun-ServiceAPI"]["zendesk"]["token"] = "SETME"
default["oun-ServiceAPI"]["zendesk"]["newticketparams"] = {}
# "{\"tags\": [\"other\",\"other_request\"],\"status\": \"new\",\"priority\": \"normal\",\"type\": \"incident\"}";

##################################################
# SAML
##################################################
default["oun-ServiceAPI"]["saml"]["idp_sso_target_url"]                                     = ""
default["oun-ServiceAPI"]["saml"]["assertion_consumer_service_url"]                         = ""
default["oun-ServiceAPI"]["saml"]["saml_issuer"]                                            = ""
default["oun-ServiceAPI"]["saml"]["idr_logout_servlet"]                                     = ""
default["oun-ServiceAPI"]["saml"]["idr_login_servlet"]                                      = ""
default["oun-ServiceAPI"]["saml"]["x509certificate_file"]                                   = ""
default["oun-ServiceAPI"]["saml"]["name_identifier_format"]                                 = ""
default["oun-ServiceAPI"]["admin"] = {}
# {
# "api_system_username":"admin_system",
# "api_system_api_key":"djgfd1jgf23djde87a08sd595f1o23fsdf9759764hjljbndfphgfifFHGFIiuykhv12",
# "api_system_app_id":"alexandria_v1",
# "mongo_db_eventlog":"admin_eventlog",
# "eci_db":"admin_eci",
# "leads_db":"admin_leads",
# "events_db":"admin_events",
# "resources_db":"admin_resources",
# "test_db":"admin_test",
# "wso2_tenant_domain_name":"SETME",
# "wso2_tenant_admin_username":"SETME",
# "wso2_tenant_admin_password":"SETME"
# }
default["oun-ServiceAPI"]["tenants"] = []
#
# {
#   "tenant_name": "Demo University",
#   "tenant_id": "DemoU",
#   "config":{
#     "api_system_username":"",
#     "api_system_username":"system",
#     "api_system_api_key":"cccccceefjgufjukceldrcrkuvhgregelgrllgcnreee",
#     "api_system_app_id":"ipad_v1",
#     "canvas_access_token":"",
#     "canvas_api_baseurl":"",
#     "canvas_accountid":"",
#     "canvas_url":"",
#     "canvas_allow_nonpublished_instructor_enrollment":"",
#     "s3_profile_avatar_path":"",
#     "s3_content_sections_path":"",
#     "s3_content_careers_path":"",
#     "s3_media_path":"",
#     "mongo_db_eventlog":"",
#     "eci_db":"",
#     "leads_db":"",
#     "events_db":"",
#     "resources_db":"",
#     "salesforce_username":"",
#     "salesforce_password":"",
#     "salesforce_token":"",
#     "salesforce_use_sandbox":false,
#     "enrollrules_days_before_class": 20,
#     "enrollrules_orientation_days_before_class":20,
#     "enrollrules_statuses":"",
#     "notify_announcement":"",
#     "notify_discussion":"",
#     "notify_studygroup_discussion":"",
#     "notify_grade":"",
#     "notify_grade_comment":"",
#     "notify_instructor_message":"",
#     "notify_student_message":"",
#     "notify_support":"",
#     "notify_submission_processed":"",
#     "notify_content_change":"",
#     "notify_blog":"",
#     "notify_reminder":"",
#     "video_conference_tool":"",
#     "video_conference_config":"",
#     "hide_student_email":true,
#     "wso2_tenant_domain_name":"",
#     "wso2_tenant_admin_username":"",
#     "wso2_tenant_admin_password":""
#   }
# }
