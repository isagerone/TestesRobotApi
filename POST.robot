** Settings **
Library  RequestsLibrary
Library    String

*** Variables ***
${HOST}    	https://dummyjson.com

${ADD_NEW_PRODUCT}    products/add

*** Keywords ***
Adicionar um novo produto
    [Arguments]    ${title}    ${description}    ${price}    ${brand}

    &{HEADERS}    Create Dictionary    Content-Type=application/json
    &{BODY}       Create Dictionary    title=${title}    description=${description}    price=${price}    brand=${brand}

    POST    url=${HOST}/${ADD_NEW_PRODUCT}    headers=&{HEADERS}    json=&{BODY}

*** Test Cases ***
CT01 - Adicionar novo produto
    Adicionar um novo produto  title=Iphone 15  description=celular  price=9000  brand=Apple
