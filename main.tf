terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "TEST_SYNERGY"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB2"
  comment = "Database for Snowflake Terraform demo"
}
resource "snowflake_schema" "SCH_DEMO01" {
  database = snowflake_database.demo_db.name
  name     = "SCH_DM01"
  comment  = "Schema for Snowflake Terraform demo"
}
resource "snowflake_schema" "SCH_DEMO02" {
  database = snowflake_database.demo_db.name
  name     = "SCH_DM02"
  comment  = "Schema for Snowflake Terraform demo"
}
resource "snowflake_table" "TB_DEMO01" {
  database = snowflake_database.demo_db.name
  schema   = snowflake_schema.SCH_DEMO01.name
  name     = "TB_DEMO01"

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
