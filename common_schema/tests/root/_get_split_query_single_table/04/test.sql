set @query_script_skip_cleanup := true;
set @query := 'delete from test12.some_table using `test12`.some_table, test12.another_table where id < 10';
call _interpret(@query, false);
call _get_split_query_single_table (
   1, 10000, @query_type_supported, @tables_found, @table_schema, @table_name
);

select 
  @query_type_supported = 1
  and @tables_found = 'multi' 
  and @table_schema is null
  and @table_name is null;
