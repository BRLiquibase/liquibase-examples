--liquibase formatted sql

-- include everything under SchemaA (runs files in alpha order)
--includeAll path:SchemaA relativeToChangelogFile:true

-- include everything under SchemaB
--include file:SchemaB/tables/010_schemaB_create_tables.sql relativeToChangelogFile:true
--includeAll path:SchemaB/views relativeToChangelogFile:true
