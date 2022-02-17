@echo off
call do_php %PATH_UTILS%\sub\%1.php %PATH_INSTALL%\_proj\lib
call do_php %PATH_UTILS%\sub\%1.php %PATH_INSTALL%\_geographiclib\lib
call do_php %PATH_UTILS%\sub\%1.php %PATH_INSTALL%\lib