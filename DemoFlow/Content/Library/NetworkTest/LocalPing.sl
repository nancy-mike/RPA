namespace: NetworkTest
flow:
  name: LocalPing
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
        x: 143.7578125
        'y': 112.0234375
        navigate:
          5fd30c69-926b-6793-0bcf-68cd716638f5:
            targetId: 17995de4-12fc-177c-02d0-d6cbad7c3317
            port: SUCCESS
    results:
      SUCCESS:
        17995de4-12fc-177c-02d0-d6cbad7c3317:
          x: 379.7578125
          'y': 87.78515625
