set @query_script_skip_cleanup := true;
set @query := 'DELETE FROM test_cs.some_table WHERE val=3';
call _interpret(@query, false);
call _get_split_query_type(1,10000, @query_type, @split_query_id_from, @split_query_following_select_id);

select @query_type = 'delete';
