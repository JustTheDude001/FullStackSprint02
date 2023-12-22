#!/bin/bash

#Example from Command Line
user="root"
#mysql -u $user -p -e 'select * from schema.table'
#select * from schema.table'
#select * from Universidad

select * from information_schema.tables;
select table_name from information_schema.tables;
