*** Settings ***
Library    FlaUILibrary
Library    RPA.Tables
Library    RPA.Excel.Files


*** Variables ***
${loaniq_datasets_path}    C:/Users/User/OneDrive - Adventure Consultancy Solutions/Desktop/TC_01_CreateBorrower.xlsx

*** Tasks ***
Rows in the sheet
    [Setup]      Open Workbook    ${loaniq_datasets_path}
    @{sheets}=   List Worksheets
    FOR  ${sheet}  IN   @{sheets}
        ${count}=  Get row count in the sheet   ${sheet}
        ${cell1A}=  get cell value    1     A
        set cell value    1     A       edit-username
        ${editcell1A}=  get cell value    1     A
        log to console    Cell 1 A '${cell1A}' edited cell 1 A '${editcell1A}'
        log to console    Worksheet '${sheet}' has ${count} columns
    END
*** Keywords ***
Get row count in the sheet
    [Arguments]      ${SHEET_NAME}
    ${sheet}=        Read Worksheet   ${SHEET_NAME}
    ${rows}=         Get Length  ${sheet}
    [Return]         ${rows}

