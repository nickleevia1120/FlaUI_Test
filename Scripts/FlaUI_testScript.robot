*** Settings ***
Library    FlaUILibrary
Library    RPA.Tables
Library    RPA.Excel.Files


*** Variables ***
${loaniq_path}  C:/Users/User/OneDrive - Adventure Consultancy Solutions/Desktop/07- LIQ_back-up/Client/LoanIQJ.exe
${loaniq_datasets_path}    C:/Users/User/OneDrive - Adventure Consultancy Solutions/Desktop/TC_01_CreateBorrower.xlsx

### Dataset Row-Column Locators ###
&{username_cell}    row=2   col=A
&{password_cell}    row=2   col=B

### Object Locators ###
${Loaniq_Login_Window}         Window[1]/TitleBar
${Username_Textfield}    (/Window[1]/Pane)/Pane[2]/Edit
${Password_Textfield}    (/Window[1]/Pane)/Pane[3]/Edit
${Login_Button}          (Window/Pane)/Button
${Login_Popup_OK_Button}    Window[1]/Button
${Loaniq_Maximize_Window}     (Window/TitleBar)/Button[2]
${Loaniq_Close_Window}     (Window/TitleBar)/Button[3]
${Logout_Popup_OK_Button}   /Window[1]/Pane[1]/Button[1]

*** Keywords ***
Launched App
    [Documentation]    This keyword is use to open the LIQ app.
    ...    @author:    NOracion    24OCT2023    - initial create
    launch application    ${loaniq_path}
    sleep    20s
    wait until element is visible   ${Loaniq_Login_Window}
Login User Credentials
    [Documentation]    This keyword is use to login user credentials.
    ...    @author:    NOracion    24OCT2023    - initial create
    open workbook    ${loaniq_datasets_path}
    ${username}=    get cell value    ${username_cell}[row]     ${username_cell}[col]
    ${password}=    get cell value    ${password_cell}[row]     ${password_cell}[col]
    flaUILibrary.set text to textbox    ${username_textfield}   ${username}
    flaUILibrary.set text to textbox    ${password_textfield}   ${password}
    flaUILibrary.click    ${Login_Button}
    sleep    55s
    wait until element is visible    ${login_popup_ok_button}
    flaUILibrary.click    ${login_popup_ok_button}
    flaUILibrary.click     ${loaniq_maximize_window}
    sleep    2s
Logout User
    [Documentation]    This keyword is use to log out LIQ app.
    ...    @author:    NOracion    24OCT2023    - initial create
    flaUILibrary.click     ${loaniq_close_window}
    sleep    3s
    flaUILibrary.click     ${logout_popup_ok_button}

*** Test Cases ***
TC01
    launched app
    login user credentials
    logout user

