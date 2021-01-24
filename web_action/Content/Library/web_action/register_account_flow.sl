namespace: web_action
flow:
  name: register_account_flow
  inputs:
    - url
    - username
    - password:
        sensitive: false
    - first_name
    - last_name
    - email
  workflow:
    - reg_user:
        do:
          web_action.reg_user:
            - username: '${username}'
            - email: '${email}'
            - first_name: '${first_name}'
            - last_name: '${last_name}'
            - password: '${password}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  outputs:
    - return_result
    - error_message
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      reg_user:
        x: 103
        'y': 161
        navigate:
          bca40d90-5945-b824-f8ff-f8cdad992d9f:
            targetId: 292b27dd-6a6e-d795-4a0f-462ae964ef02
            port: SUCCESS
          62e4209b-b4f5-cb3f-297a-e3070b37b2ee:
            targetId: 292b27dd-6a6e-d795-4a0f-462ae964ef02
            port: WARNING
    results:
      SUCCESS:
        292b27dd-6a6e-d795-4a0f-462ae964ef02:
          x: 400
          'y': 150
