namespace: web_action
flow:
  name: register_users_from_excel
  inputs:
    - excel_path: " C:\\\\Users\\\\Administrator\\\\Desktop\\\\users.xlsx"
    - sheet: Sheet1
    - login_header: 'Username '
    - password_header: Password
    - name_header: Full Name
    - email_header: Email
  workflow:
    - Get_Cell:
        do_external:
          5060d8cc-d03c-43fe-946f-7babaaec589f:
            - excelFileName: '${excel_path}'
            - worksheetName: '${sheet}'
            - hasHeader: 'Yes'
            - firstRowIndex: '0'
            - rowIndex: '0:1000'
            - columnIndex: '0:100'
            - rowDelimiter: '|'
            - columnDelimiter: ','
            - password_header: '${password_header}'
            - email_header: '${email_header}'
            - name_header: '${name_header}'
            - login_header: '${login_header}'
        publish:
          - data: '${returnResult}'
          - header
          - login_index: "${str(header.split(',').index(login_header))}"
          - password_index: "${str(header.split(',').index(password_header))}"
          - email_index: "${str(header.split(',').index(email_header))}"
          - name_index: "${str(header.split(',').index(name_header))}"
        navigate:
          - failure: on_failure
          - success: register_account_flow
    - register_account_flow:
        loop:
          for: 'row in data.split("|")'
          do:
            web_action.register_account_flow:
              - url: 'http://localhost:8082'
              - username: '${row.split(",")[int(login_index)]}'
              - password: '${row.split(",")[int(password_index)]}'
              - first_name: '${row.split(",")[int(name_index)].split()[0]}'
              - last_name: '${row.split(",")[int(name_index)].split()[-1]}'
              - email: '${row.split(",")[int(email_index)]}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Get_Cell:
        x: 87
        'y': 131
      register_account_flow:
        x: 304
        'y': 130
        navigate:
          4cbdeeb1-2785-99af-dd72-03a793572ee0:
            targetId: ef0366ed-22a9-f9b2-b2ab-ef41b45265f7
            port: SUCCESS
    results:
      SUCCESS:
        ef0366ed-22a9-f9b2-b2ab-ef41b45265f7:
          x: 505
          'y': 126
