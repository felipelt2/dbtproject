SELECT  DISTINCT 
 event_name as tipo
,event_timestamp as datahora
,event_schema as schema
,event_model as modelo
,event_user as usuario
,event_target event_target
from {{target.schema}}_meta.dbt_audit_log