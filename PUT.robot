** Settings **
Library  RequestsLibrary
Library    String

*** Variables ***
${HOST}    	https://dummyjson.com

${UPDATE_PRODUCT}    products/id-produto

*** Keywords ***
Atualizar um produto
#para deixar um argumento de modo opicional é só add "=none", porém ele deve estar em último
    [Arguments]    ${id}    ${title}    ${description}    ${price}    ${brand} 

    &{HEADERS}    Create Dictionary    Content-Type=application/json
    &{BODY}       Create Dictionary    title=${title}    description=${description}    price=${price}    brand=${brand}
    
    ${UPDATE_PRODUCT}=    Replace String    ${UPDATE_PRODUCT}    id-produto    ${id}

    PUT    url=${HOST}/${UPDATE_PRODUCT}    headers=&{HEADERS}    json=&{BODY}

*** Test Cases ***
CT01 - Atualizar produto
    Atualizar um produto    id=7  title=Iphone 15  description=celular  price=9000  brand=Apple