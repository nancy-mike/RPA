namespace: product
flow:
  name: get_products
  inputs:
    - aos_url: 'http://localhost:8082/'
    - file_path: "c:\\\\temp\\\\products.txt"
  workflow:
    - http_client_get:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: '${aos_url+"/catalog/api/v1/categories/all_data"}'
        publish:
          - json: '${return_result}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      http_client_get:
        x: 42
        'y': 88.5
        navigate:
          992e1964-e810-c9ad-de21-ebf2d044ad1e:
            targetId: e51ae59b-ba21-3c5a-8030-9ed2a400c22e
            port: SUCCESS
    results:
      SUCCESS:
        e51ae59b-ba21-3c5a-8030-9ed2a400c22e:
          x: 397
          'y': 103
