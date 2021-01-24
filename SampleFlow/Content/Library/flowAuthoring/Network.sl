namespace: flowAuthoring
flow:
  name: Network
  workflow:
    - run_command:
        do:
          io.cloudslang.base.cmd.run_command:
            - command: ipconfig
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      run_command:
        x: 106
        'y': 112
        navigate:
          a3de033e-b394-5ab9-615f-2a5d786f765a:
            targetId: 9c0b42ab-2adf-950c-aedb-bacd4c452487
            port: SUCCESS
    results:
      SUCCESS:
        9c0b42ab-2adf-950c-aedb-bacd4c452487:
          x: 354
          'y': 114
