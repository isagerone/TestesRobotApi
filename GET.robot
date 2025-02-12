** Settings **
Library  RequestsLibrary
Library    String

*** Variables ***
${HOST}    	https://dummyjson.com

${GET_ALL_PRODUCTS}    products
${GET_ONE_PRODUCT}     products/id-produto
${GET_PRODUCT}         products/search?q=phone

*** Keywords ***
Pegar todos os produtos

    &{HEADERS}    Create Dictionary    Content-Type=application/json

    GET    url=${HOST}/${GET_ALL_PRODUCTS}    headers=&{HEADERS}

Pegar um único produto de id ${id}

    &{HEADERS}    Create Dictionary    Content-Type=application/json

    ${GET_ONE_PRODUCT}=    Replace String    ${GET_ONE_PRODUCT}    id-produto    ${id}

    GET    url=${HOST}/${GET_ONE_PRODUCT}    headers=&{HEADERS}

Pegar um produto especifico ${nome_produto}

    &{HEADERS}    Create Dictionary    Content-Type=application/json

    ${GET_PRODUCT}=    Replace String    ${GET_PRODUCT}    phone    ${nome_produto}

    GET    url=${HOST}/${GET_PRODUCT}    headers=&{HEADERS}

** Test Cases **
CT01: Realizar busca de todos os produtos
    Pegar todos os produtos

CT02: Realizar busca de um único produto
    Pegar um único produto de id 13

CT03: Realizar busca de um produto específico
    Pegar um produto especifico airpods
    