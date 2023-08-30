resource "snowflake_table" "TB_DEMO03" {
  database = snowflake_database.demo_db.name
  schema   = snowflake_schema.SCH_DEMO01.name
  name     = "TB_DEMO03"

  column {
    name     = "id"
    type     = "int"
    nullable = true
  }

  column {
    name     = "identity"
    type     = "NUMBER(38,0)"
    nullable = true
  }

}
