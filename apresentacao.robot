*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

Abrir aplicação em localhost
    Open Browser    url=http://127.0.0.1:8000    browser=firefox
 
Abrir formulário para cadastro de usuário

    Click Element    //a[@class='nav-link'][contains(.,'Criar um Usuário')]

Preencher formulário e clicar no botão para cadastrar um usuário
    
    Click Element    //input[contains(@name,'firstName')]
    Sleep    1s
    Input Text    //input[contains(@name,'firstName')]    Sebastião
    Sleep    1s
    Click Element    //input[contains(@name,'lastName')]
    Sleep    1s
    Input Text    //input[contains(@name,'lastName')]    Cleto
    Sleep    1s
    Click Element    //input[contains(@name,'email')]
    Sleep    1s
    Input Text    //input[contains(@name,'email')]    professorcleto@gmail.com
    Sleep    1s
    Click Element    //input[contains(@name,'password')]
    Sleep    1s
    Input Password    //input[contains(@name,'password')]    ucb2024
    Sleep    1s
    Click Element    //button[@type='submit'][contains(.,'Criar usuário')]
    Sleep    1s
    Reload Page
    Sleep    1s

Abrir a home page e conferir se o usuário novo foi de fato criado
    Click Element    //a[@class='nav-link active'][contains(.,'Usuários')]
    Sleep    1s
    Reload Page
    Sleep    1s
    Go To    http://127.0.0.1:8000/?page=21
    Sleep    1s
    Reload Page
    Sleep    1s

Testar propositalmente fazer login com um usuario aleatorio/não cadastrado
    Click Element    //a[@class='nav-link'][contains(.,'Faça Login')]
    Sleep    1s
    Input Text    //input[contains(@type,'text')]    bahringer.dave@baumbach.net
    Sleep    1s
    Click Element    //input[contains(@type,'password')]
    Sleep    1s
    Input Text    //input[contains(@type,'password')]    123
    Sleep    1s
    Click Element    //button[@type='submit'][contains(.,'Login')]
    Sleep    1s


Fazer login com o usuário criado
    Click Element    //a[@class='nav-link'][contains(.,'Faça Login')]
    Sleep    1s
    Input Text    //input[contains(@type,'text')]    professorcleto@gmail.com
    Sleep    1s
    Click Element    //input[contains(@type,'password')]
    Sleep    1s
    Input Text    //input[contains(@type,'password')]    ucb2024
    Sleep    1s
    Click Element    //button[@type='submit'][contains(.,'Login')]
    Sleep    1s

Sair da conta do usuário Professor Cleto
    Click Element    //a[contains(.,'Logout')]
    Sleep    1s
    Reload Page
    Sleep    1s

Fazer Login com o Administrador 'Daniel'
    Click Element    //a[@class='nav-link'][contains(.,'Faça Login')]
    Sleep    1s
    Input Text    //input[contains(@type,'text')]    danielmatudaoficial@gmail.com
    Sleep    1s
    Click Element    //input[contains(@type,'password')]
    Sleep    1s 
    Input Text    //input[contains(@type,'password')]    123
    Sleep    1s
    Click Element    //button[@type='submit'][contains(.,'Login')]
    Sleep    1s

Ir até o primeiro usuário da listagem e alterar o sobrenome dele para Guilherme

    Click Element    //a[@class='nav-link active'][contains(.,'Usuários')]
    Sleep    1s
    Click Element    //a[@href='http://127.0.0.1:8000/user/edit/1']
    Sleep    1s
    Click Element   //input[contains(@name,'lastName')]
    Sleep    1s
    Input Text    //input[contains(@name,'lastName')]    Guilherme
    Sleep    1s
    Click Element    //button[@type='submit'][contains(.,'Editar Usuário')]
    Sleep    1s
    Go To    http://127.0.0.1:8000/?page=1
    Sleep    2s
    Reload Page
    Sleep    1s

Abrir a tela interna do primeiro usuário cadastrado na listagem
    Click Element    //a[@class='nav-link active'][contains(.,'Usuários')]
    Sleep    1s
    Click Element    //a[@href='http://127.0.0.1:8000/user/1']
    Sleep    1s


Mostrar a tela de listagem de aulas
    Click Element    //a[@class='nav-link'][contains(.,'Aulas')]
    Sleep    1s

Abrir o formulário para Criar Aula
    Click Element    //a[@class='nav-link'][contains(.,'Criar Aula')]
    Sleep    1s

Preencher formulário para Criar Aula
    Click Element    //input[contains(@name,'title')]
    Sleep    1s
    Input Text    //input[contains(@name,'title')]    Aula guitarra com Nelson Faria
    Sleep    1s
    Click Element    //input[contains(@name,'slug')]
    Sleep    1s
    Input Text    //input[contains(@name,'slug')]    musica
    Sleep    1s
    Click Element    //input[contains(@name,'content')]
    Sleep    1s
    Input Text    //input[contains(@name,'content')]    Aprenda a tocar guitarra com o mestre Nelson Faria que tocou na banda do Joao Bosco e diversos outros astros do mbp e rock nacional.
    Sleep    1s
    Click Element    //input[contains(@name,'user_id')]
    Sleep    1s
    Input Text    //input[contains(@name,'user_id')]    1
    Sleep    1s
    Click Element    //button[@type='submit'][contains(.,'Criar Aula')]
    Sleep    1s

Usar mecanismo de busca para achar a Aula criada
    Reload Page
    Click Element    //input[contains(@type,'search')]
    Sleep    1s
    Input Text    //input[contains(@type,'search')]    guitarra
    Sleep    1s
    Click Element    //button[contains(.,'Search')]
    Sleep    1s

Alterar a aula de guitarra para aula de instrumentos de corda modernos
    Click Element    (//a[contains(.,'Editar Aula')])[1]
    Sleep    1s

    Click Element    //input[contains(@name,'title')]  
    Sleep    1s
    Input Text    //input[contains(@name,'title')]    Aula de intrumentos de Corda modernos
    Click Element    //input[contains(@name,'slug')]   
    Sleep    1s
    Input Text    //input[contains(@name,'slug')]    aprendendo musica
    Sleep    1s
    Click Element    //input[contains(@name,'content')]      
    Sleep    1s
    Input Text    //input[contains(@name,'content')]     Aprenda a tocar violão, guitarra e baixo com o professor Nelson Faria, nesse curso você irá aprender ritmo, melodia e harmonia e a destrinchar o CAGED e outros sistemas musicais incríveis
    Sleep    1s

    Click Element    //button[contains(.,'Salvar')]

Deletar a primeira aula da tela de listagem
    Click Element    //a[@class='nav-link'][contains(.,'Aulas')]
    Sleep    1s
    Click Element    (//button[@class='btn btn-danger btn-sm mb-2'][contains(.,'Deletar Aula')])[1]
    Sleep    2s
    Reload Page
Deletar o Sebastião Cleto
    Go To    http://127.0.0.1:8000/?page=21
    Sleep    1s
    Click Element    (//button[@class='btn btn-danger btn-sm mb-2'][contains(.,'Deletar Usuário')])[2]
    Sleep    5s   


