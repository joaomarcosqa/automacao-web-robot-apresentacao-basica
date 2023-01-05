*** Settings ***
Library    SeleniumLibrary

*** keywords ***

Abrir Navegador
    Open Browser                    https://bugbank.netlify.app/             chrome

Fechar Navegador
    Close Browser

*** Settings ***
Test Setup                               Abrir navegador
Test Teardown                    Fechar navegador

*** Variable ***
${IMAGEM_}                  //img[contains(@alt,'')]
${CLICAR_SAIR}                      //button[@type='button'][contains(.,'Sair')]
${APROVACAO_ALCADA}         (//div[contains(@class,'css-1rs9g1u')])[3]
${GESTAO_USUARIOS}                          (//div[contains(@class,'css-1rs9g1u')])[1]
${CADASTRO-USUARIO}         //div[@class='css-1rs9g1u'][contains(.,'Cadastrar novo usuárioInsira novos usuários na base de dados')]
${SALVAR}                           //span[contains(.,'Salvar')]
${EDITAR USUARIO}           //div[@class='css-1rs9g1u'][contains(.,'Editar usuáriosEdite as informações de usuários já cadastrados')]
${INSERIR_BUSCA}                 //input[@class='css-13448fz'] 
${LUPA_PESQUISA}                           //html[1]/body[1]/div[1]/div[2]/div[3]/div[1]/*
${LOGO_RETORNO_}            //div[contains(@class,'css-v1acfh')]
${GESTÃO_CAMPANHAS}           (//div[contains(@class,'css-1rs9g1u')])[2]
${CLICAR_PLANO_DE_TAXAS}        //div[@class='css-1rs9g1u'][contains(.,'Planos de taxasGerencie os planos de taxas ')]
${CLICAR_NOVO_PLANO}                  //div[@class='css-1rs9g1u'][contains(.,'Novo plano de taxasCadastre um novo plano de taxas em sua base de dados')]
${CLICAR_EDITAR_PLANO}      //div[@class='css-1rs9g1u'][contains(.,'Editar plano de taxasEdite as informações de um plano de taxas já cadastrado')]
${AÇOES_EDITAR_PLANO}       (//div[@class="css-chp4c5"])[3]
${GRUPOS_MMCS}                           //div[@class='css-1rs9g1u'][contains(.,'Grupos de MCCsGerencie os grupos de MCCs cadastrados na base')]
${NOVO_GRUPO}                    //div[@class='css-1rs9g1u'][contains(.,'Novo Grupo MCCCadastre um novo grupo MCC na sua base de dados')]

*** Keywords ***
Acessar site
    Sleep       10

Inserir email
    Sleep       10
    Input Text                    //*[@id="__next"]/div/div[2]/div/div[1]/form/div[1]/input               teste@gmail.com

Inserir senha
    Sleep       10
    Input Text                         //*[@id="__next"]/div/div[2]/div/div[1]/form/div[2]/div/input               123456

Clicar em acessar
    Sleep       10
    Click Element                //*[@id="__next"]/div/div[2]/div/div[1]/form/div[3]/button[1]
    Sleep       10


Quando clico em Sair
    Wait Until Element Is Visible             locator=//button[@class='css-1w3o441'][contains(.,'Sair')]
    Click Element                            locator=//button[@class='css-1w3o441'][contains(.,'Sair')]

Então valido texto de saída "${TEXTO SAÍDA}"
    Wait Until Page Contains                                    text=${TEXTO SAÍDA}
    Click Element                             locator=(//span[@class="css-1qtc2j3"])[3]


Quando clico em "Aprovação por alçada"
    Wait Until Element Is Visible                  locator=${APROVACAO_ALCADA}
    Click Element                             locator=${APROVACAO_ALCADA}

E valido título da page "Força de Vendas"
    Title Should Be                            title=Força de Vendas

E pesquiso "${TAXAS}"
    Click Element                               locator=//input[@type='text']
    Input Text                                 locator=//input[@type='text']                                             text=Taxas
    Click Element                               locator=//div[contains(@class,'css-gjzoi4')]

Mas opção máquinas não disponível
    Wait Until Page Contains                       text=maquinas

E pesquiso Máquinas
    Click Element                              locator=//input[@type='text']
    Input Text                                 locator=//input[@type='text']                                             text=MÁQUINAS
    Click Element                         locator=//div[contains(@class,'css-gjzoi4')]

Mas opção taxas não disponível
    Wait Until Page Contains                      text=taxas


E clico em ver detalhes
    Click Element                        locator=(//div[@class="css-1h5x3dy"])[1]

Então valido o campo ID
    Wait Until Page Contains                text=ID

Então valido o campo Status
    Wait Until Page Contains            text=Status

Então valido o campo Aprovação por alçada
    Wait Until Page Contains                text=Aprovação por alçada


Quando clicar em Gestão de usuário
    Wait Until Element Is Visible    locator=${GESTAO_USUARIOS}
    Click Element                               locator=${GESTAO_USUARIOS}

E em Cadastro novo usuário
    Wait Until Element Is Visible                    locator=${CADASTRO-USUARIO}
    Click Element                            locator=${CADASTRO-USUARIO}

E validar texto "${USUARIO}"
    Wait Until Page Contains                      text=${USUARIO}

Quando preencher todos os campos
    Input Text                       locator=add-user-name                                                     text=Alexandro Medeiros
    Input Text                                   locator=add-user-email                                                    text=alex.medeiros@teste.com.br
    Input Text                       locator=add-user-company                                                  text=Luxo e Estética LTDA
    Click Element                                 locator=add-user-user_type
    Click Element                    locator=add-user-user_type
    Input Text                                locator=partner_code                                                      text=PYALRFGH
    Input Text                       locator=add-user-subgroup                                                 text=Premium
    Wait Until Element Is Visible    locator=${SALVAR}
    Click Element                           locator=${SALVAR}

Então valido "${SUCESSO_CADASTRO}"
    Wait Until Page Contains                        text=${SUCESSO_CADASTRO}

E Editar Usuário
    Wait Until Element Is Visible    locator=${EDITAR USUARIO}
    Click Element                          locator=${EDITAR USUARIO}
    Wait Until Page Contains         text=Edição de usuários
    Click Element                              locator=//select[@name='status']
    Click Element                    locator=//option[@value='inativos'][contains(.,'Usuários inativados')]
    Click Element                               locator=//option[contains(.,'Todos os tipos')]
    Click Element                    locator=//option[contains(.,'Todas as empresas')]
    Click Element                                locator=//option[contains(.,'Todos os subgrupos')]

Então sucesso ao limpar filtro
    Click Element                    locator=//p[@class='css-f34r9d'][contains(.,'Limpar filtros')]

E clicar em editar usuário
    Wait Until Element Is Visible    locator=${EDITAR USUARIO}
    Click Element                                locator=${EDITAR USUARIO}



E preencher campo busca com "${NOME_BUSCA}"
    Click Element                    locator=${INSERIR_BUSCA}
    Input Text                  locator=${INSERIR_BUSCA}                                                  text=${NOME_BUSCA}
    Wait Until Page Contains         text=Buscar
    Click Element               locator=${LUPA_PESQUISA}

Então realiza busca com sucesso
    Wait Until Page Contains         text=text

E Preencher campo busca com "iteris"
    Click Element                    locator=${INSERIR_BUSCA}
    Input Text                   locator=${INSERIR_BUSCA}                                                  text=iteris
    Wait Until Page Contains      text=Buscar
    Click Element                 locator=${LUPA_PESQUISA}

Então busca realizada com sucesso
    Wait Until Page Contains     text=iteris



Preencher campo busca com "subgrupo"
    Input Text                                   locator=${INSERIR_BUSCA}                                                  text=Premium
    Click Element                                locator=${LUPA_PESQUISA}

Então busca efetuada com sucesso
    Wait Until Page Contains                  text=subgrupo

E validar texto "Edição de usuários"
    Wait Until Page Contains                  text=Edição de usuários

E Clicar em     Click Element                    locator=${LOGO_RETORNO_

Então Valido retorno página de início
    Wait Until Page Contains                     text=Olá

Quando clicar em "Gestão de campanhas"
    Wait Until Element Is Visible            locator=${GESTÃO_CAMPANHAS}
    Click Element                                locator=${GESTÃO_CAMPANHAS}

E clicar em Plano de Taxas
    Click Element                                       locator=${CLICAR_PLANO_DE_TAXAS}

E clicar em Editar Plano de Taxas
    Click Element                                locator=${CLICAR_EDITAR_PLANO}
    Wait Until Page Contains                    text=Lista de planos de taxas
    Click Element                           locator=(//div[@class="css-chp4c5"])[3]
    Click Element                               locator=(//p[@class="css-14hwjwo"])[1]

    # Input Text    locator=add-rate-plans-url     text=https://automacaorobot.com.br
    # # Wait Until Element Is Visible    locator=input_12537
    # Input Text    locator=input_12537            text=2%
    # Input Text    locator=input_12419            text=2%
    # Input Text    locator=input_12420            text=2,2%
    # Input Text    locator=input_12421            text=2,2%

    #Filtro Aprovação por alçada Click Element    locator=select_143

E preencher dados em Novo plano de Taxas
    Click Element                             locator=${CLICAR_NOVO_PLANO}
    Input Text                               locator=add-rate-plans-nome                                               text=automação
    Input Text                               locator=//input[contains(@name,'url')]                                    text=https://www.automacao.com.br

E clicar em Grupos
    Click Element                                locator=${GRUPOS_MMCS}

E preencher novo grupo
    Click Element                             locator=${NOVO_GRUPO}
    Input Text                               locator=(//input[@id="add-mcc-group-name"])                               text=Grupo Automação
    Wait Until Page Contains                 text=Título
    Select Checkbox                       locator=(//input[@id="checkbox_3608"])[1]

*** Test Case ***

Caso de Teste 01 - teste
    Acessar site
    Inserir email
    Inserir senha
    Clicar em acessar