** Settings **
Library  RequestsLibrary
Library    String

*** Variables ***
${HOST}    	https://dummyjson.com

${DELETE_PRODUCT}    products/id-produto-delete


*** Keywords ***
Deletar um produto por id ${id}

    &{HEADERS}    Create Dictionary    Content-Type=application/json

    ${DELETE_PRODUCT}=    Replace String    ${DELETE_PRODUCT}    id-produto-delete    ${id}

    DELETE   url=${HOST}/${DELETE_PRODUCT}    headers=&{HEADERS}


** Test Cases **
CT01: Deletar um produto 
    Deletar um produto por id 9

    