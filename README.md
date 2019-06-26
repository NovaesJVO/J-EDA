# The EDA Project #

**Atenção**: EDA **não** é um software clinico ou comercial. Ele é desenvolvido para fins educacionais e de demonstração.

EDA, é um ambiente que permite ao usuário analisar os resultados gerados por diferentes abordagens de busca por similaridade com diversidade. O sistema, utiliza técnicas de RF para incluir o usuário no processo de recuperação, de forma que ele possa, iterativamente, avaliar os resultados gerados e ajustar o processo à sua intenção, sem que seja necessario reformular a busca.

Ele foi implementado em [Java](https://www.oracle.com/technetwork/pt/java/javase/downloads/index.html), com o auxilio das bibliotecas [OpenCV 4](https://opencv.org/opencv-4-0/) e [JFreeChart](http://www.jfree.org/jfreechart/index.html).

Apesar dos esforços dos autores para liberar o prototipos sem erros, pode haver alguns problemas. Caso você encontre algum problema ou deseje adicionar novos recursos, por favor entre em contato.

**Citação**: Se você baixar ou utilizar EDA para testes ou anilises técnicas, nos pedimos que inclua a seguinte referência;

* Novaes, J.V.O; Santos, L. F. D; Traina, A.; Traina Jr., C; Bedo, M. V. N. SBBD 2019 Proceedings Satellite Events of the 34th Brazilian Symposium on Databases (SBBD) 2019: Pagina_Inicio-Pagina_Fim. Ceará, Brazil, October 7-10, 2019.

See DOI link [here](https://doi.org/).

### 1. Requisitos Minimos ###

* Screen resolution: 1280×800 (or higher)
* 200 MB free disk space (Para a instalação!).
* 2 GB RAM.
* Intel Core™2 Duo P8600 core processor.
* Java JDK 8 (or higher)
### 2. Usando o EDA ###

EDA foi desenvolvido para sistemas baseados no Linux. O processo de instalação descrito abaixo foi testado em um sistema [Ubuntu 18.04](http://releases.ubuntu.com/18.04/), para outras distribuições baseadas no Ubuntu o funcionamento pode ser parecido, mas pode ser necessario instalar manualmente alguns pacotes e, até o presente momento não foram testadas outras disbuições do Linux.

  ![Main](./Figures/Main.png)

  O seguinte [vídeo](http://youtube.com) apresenta de forma generica as funcionalidades do sistema.

**2.1 Download**

* Clone ou baixe o diretorio [master](https://github.com/NovaesJVO/EDA) desse projeto.
* Se necessario descompacte o arquivo baixado.
* Os seguintes arquivos devem estar no diretorio:

```
    EDA
    ├── Corel1000
    │   ├── 0.jpg
    │   ├── ...
    │   └── 999.jpg
    ├── Corel_class.txt
    ├── Corel_Colorhist.txt
    ├── dist
    │   ├── lib
    │   │   ├── jcommon-1.0.23.jar
    │   │   ├── jfreechart-1.0.19.jar
    │   │   └── opencv-400.jar
    │   └── Projeto.jar
    ├── Figures
    │   └── ...
    ├── lib
    │   └── libopencv_java400.so
    ├── README.md
    └── run.sh
    
    4 directories, 1012 files
```

**Query Parameters**
**2.2 Resources**

O seguinte recursos da literatura foram implementados, testados e, estão disponiveis no EDA:

* Sete extratores de caracteristicas: Color Layout, Color Structure, Dominant Color, Edge Historam, Haralick,Local Binary Pattern and Scalable Color.  
<br/>

* Cinco funções de distância: Bray-Curtis, Canberra, Chebychev, Euclidean and Manhatan.
<br/>

* Sete algoritmos de busca por similaridade (com ou sem diversidade): Better Result with Influence Diversification (BRIDk), First Match (FM), Greedy Marginal Contribution (GMC), k-Nearest Neighbors Query (k-NNq), Maximal Marginal Relevance (MMR), Relative Grouping based on Influence (ReGi) and Range Query (Rq).
<br/>

* Três técnicas de Realimentação de Relevância: Query Point Moviment, Support Vector Machine and Similarity Refinament Evaluator.
<br/>
* Seis Métricas de Avaliação: Precisão e Revocação, mean Average Precision - mAP, Average Recall - AR, Numero de Imagens relevantes e Irrelevantes por iteração e Tempo de Execução da busca e da técnica de RF.

**2.3 Run**
  O arquivo de execução é o run.sh. Inicialmente é necessário tornar este arquivo um execultavel, para isso utilize o comando: chmod +x run.sh e, para execultar utilize: ./run.sh.

  Na primeira execução pode ser necessario instalar alguns pacotes: **Listar Quais São?**, neste caso, a senha de administrador (root) pode ser solicitada.

**2.4 Datasets Settings**

Ao iniciar o EDA pela primeira vez, será necessario configurar, pelo menos, um dos datasets que serão utilizados. EDA permite que isso seja feito de duas formas:

  ![Dataset](./Figures/Dataset.png)
  
  1. O Sistema se encarrega de gerar as carcteristicas das imagens do dataset, cabendo ao usuário informar o nome do dataset e o diretorio onde as imagens se encontram.
<br/>

  2. Pode-se utilizar caracteristicas geradas de forma externa ao sistema. Neste caso, será necessario informar o nome do dataset, o nome do extrator de caracteristicas utilizado, o diretorio das imagens e, um arquivo (.txt) que contém as caracteristicas de extraidas. Este arquivo deve estar neste [formato](./Corel_Colorhist.txt):

      * Quantidade de imagens.
      * Numero de features.
      * As demais linhas devem conter as caracteristicas separadas por ; e terminar como o nome da imagem a qual as caracteristicas pertencem.

Ao concluir as configurações, o usuário deve salvar as modificações feitas. Neste momento, uma tela de loading irá aparecer, aguarde até que o processo seja finalizado. Quando isso acontecer, um botão para ir até a interface principal do EDA irá aparecer.  

**2.5 Explorer Module:**

O Explorer Module, é o primeiro a aparecer na interface principal, ele foi projetado para permitir que algumas funcionalidades do sistema possam ser testadas antes de e realizar algum tipo de experimento.

![Main](./Figures/Main.png)

Inicialmente, é necessario carregar uma imagem de consulta,  selecionar um dataset, uma função de distância, um extrator de caracteristicas, um algoritmo de busca, definir os parametros da busca e, então execultar a consulta. Depois de execultar a consulta, o sistema exibe o conjunto resultado na tela de visualização e mostra uma tela de seleção da técnica de RF. A partir disso, o usuário pode:
<br/>

* Clicar sobre uma das imagens recuperadas com o batão direito, enquanto mantém a tecla Shift pressionada, abre uma tela de exibição contendo a imagem. Caso o algoritmo de busca utilizado seja o ReGi, será utilizada a funcionalidade Group Viewer (2.6), essa funcionalidade exibe todas as imagens agrupadas com uma das imagens representativas recuperadas.
<br/>

* Clicar sobre as imagens recuperadas com o botão direito, enquanto mantém o tecla Ctrl pressionada, seleciona as imagens, que podem ser exibidas na tela de visualização ao clicar em "Show Selected Imagens".
<br/>

* Clicar duas vezes em uma imagem, com o botão direito do mouse rotula a imagem como relevante e com o botão esquerdo rotula a imagem como irrelevante.
<br/>

* Depois de rotular imagens como relevantes e/ou irrelevantes, o usuário pode selecionar uma técnica de RF e clicar em "Relevance Feedback", para realimentar o sistema. Uma nova busca será executada e, o seu resultado será exibido.

**2.6 Experment Module - Supervised Feedback:**

O Experment Module - Feedback Supervised, permite ao usuário avaliar a qualidade do processo de recuperação, executando várias buscas, com a mesma configuração e técnica de RF, mas com imagens de consulta diferentes. A configuração deste modulo é similar ao do modulo exploratorio, a principal diferença, é que ele permite carregar mais de uma imagem de consulta. Além disso, este é um modulo de experimentos, logo, a cada iteração informações como: o tempo de execução do algoritmo de busca, técnica de RF e a quantidade de imagens relevantes e irrelevantes recuperadas, são salvas e podem ser utilizadas em analises posteriores.

Ao iniciar o experimento, o resultado de uma busca utilizando a primeira imagem de consulta é exibido, o usuário pode então, rotular as imagens e realimentar o sistema ou execultar uma nova busca utilizando, se existir, a proxima imagem consulta.
<br/>

* A qualquer momento o usuário pode finalizar o experimento e, neste caso, todas as informações obtidas, são salvas.
<br/>

* Clicar sobre uma das imagens recuperadas com o batão direito, enquanto mantém a tecla Shift pressionada, abre uma tela de exibição contendo a imagem. Caso o algoritmo de busca utilizado seja o ReGi, será utilizada a funcionalidade Group Viewer (2.6), essa funcionalidade exibe todas as imagens agrupadas com uma das imagens representativas recuperadas.
<br/>

* Clicar sobre as imagens com o botão direito, enquanto mantém a tecla Ctrl pressionada, seleciona as imagens, que podem ser exibidas na tela de visualização ao clicar em "Show Selected Imagens".
<br/>

* Clicar duas vezes em uma imagem, com o botão direito do mouse rotula a imagem como relevante e com o botão esquerdo rotula a imagem como irrelevante.
<br/>

* Após rotular as imagens, o usuário pode cliclar em "Relevance Feedback" para realimenta o sistema. Uma nova busca será executada e o seu resultado será exibido.

**2.7 Group Viewer:**
Está funcionalidade, permite visualizar como o agrupamento gerado pelo ReGi está sendo gerado.

Ao utilizar o algoritmo de busca ReGi e, clicar sobre uma das imagens recuperadas com o botão direito enquanto preciona a tecla Shift, a interface dessa funcionalidade será exibida. Todas as imagens agrupadas serão exibidas em uma lista, ao clicar sobre uma das imagens da lista ela será exibida, no centro da interface, em tamanho maior. Caso, o usuário deseje visualizar a imagem em tamanho real, basta clicar duas vezes com o botão direito sobre a imagem no centro da interface. Para facilitar a interação do usuário, as imagens na lista são carregadas de 10 em 10, caso seja necessario carregar mais imagens basta cliclar em "Load More" e, caso existam mais imagens a serem carregadas, novas 10 imagens serão adicionadas a lista.

**2.8 Experment Module - Unsurpervised Feedback:**

O objetivo desse modulo é similar ao de Supervised Feedback, a principal diferença é que o processo de avaliação das imagens é feito de forma automática. De maneira análoga, essa modulo permite configurar a busca e selecionar a técnica de realimentação, mas permite que o usuário selecione as imagens que serão utilizadas durante os testes de três formas: aleatória, via script ou seleção manual:

* Seleção Aleatória: o usuário precisa informar o diretório das imagens que serão utilizadas no experimento e o número de imagens que devem ser selecionadas, a partir disso, o sistema escolhe aleatoriamente as imagens na quantidade de informada. Para permitir que os resultados gerados pela seleção aleatória possam ser replicados, o sistema gera um script, que permite re-executar o experimento.
<br/>
* Seleção via script: é necessario selecionar selecionar um arquivo que contém a configuração de busca, a técnica de RF e, uma lista com os caminhos de diretório de cada uma das imagens.
<br/>

* Seleção manual: o usuário tem que selecionar manualmente cada uma das imagens que serão utilizadas (similar ao modulo de Supervised Feedback).

O processo de avalição automática, considera que uma imagem recuperada é relevante, se ela for da mesma classe da imagem de busca, caso contrario a imagem é irrelevante, dessa forma, o usuário precisa informar ao sistema qual é a classe das imagens fornecidas (busca e dataset). EDA, permite que a classe das imagens sejam fornecidas de duas formas: via arquivo de classes ou via rótulo das imagens.

* Arquivo de classes: é esperado um arquivo que contém o nome de todas as imagens, tal que, cada linha possua o nome de uma imagem e o identificador da classe a qual a imagem pertence, [por exemplo](./Corel_class.txt).

<br/>  

* Rótulo das imagens: é esperado que cada imagem tenha no seu nome de arquivo esperado que cada imagem tenha no seu nome de arquivo a classe a qual pertence, por exemplo: "01_img2.jpg", neste caso, temos que a imagem img2.jpg pertence a classe 01.

Por conta da avaliação automática, o sistema necessita de um parâmetro que indique o número máximo de iterações (query and feedback) que podem se realizadas em cada uma das buscas, pois sem este parâmetro, o sistema poderia executar infinitas iterações e nunca finalizar o teste. Logo, antes de iniciar um experimento o sistema solicita que o usuário informe o número máximo de iterações.

O processo de experimento automatico, funciona da seguinte maneira:

  1. A primeira imagem de consulta listada, é utilizada para executar uma busca, o resultado dessa busca é convertido em uma lista com o nome das imagens recuperadas.
<br/>  
  
  2. A partir dessa lista, é feita a avaliação das imagens, sendo verificado se a classe das imagens recuperadas é a mesma da imagem de consulta. Se sim, a imagem é marcada como relevante, se não, a imagem é marcada como irrelevante.
<br/>  
  
  3. Em seguida, a técnica de RF é aplicada e uma nova busca é efetuada.
<br/>  

  4. Repete-se o segundo e terceiro passo até que o número máximo de iterações tenha sido alcançado. Quando isso ocorre, uma nova imagem de consulta é utilizada e repete-se o processo a partir do inicio. Caso não existam mais imagens de consulta, o processo se encerra e o sistema salva os resultados do teste.

**2.9 Result Analysis:**

Esta interface, permite, por meio de metricas quantitativas, visualizar os resultados obtidos nos experimentos. Como o processo de avaliação das imagens pode ser supervisionado ou não, esta interface foi dividida em duas sub-interfaces, uma para analisar o experimentos com feedback supervisionado e outro para os experimentos de feedback não supervisionado. Ambos possuem as mesmas funcionalidades, mas permitem avaliar de forma separada os resultados gerados por cada tipo de avaliação.

O funcionamento desta interface é bastante simples, inicialmente, é necessario selecionar qual o tipo de avaliação deseja-se analisar, em seguida, é preciso selecionar as métricas de avaliação e os arquivos de teste que serão utilizados. A partir disso, o sistema se encarrega de analisar os resultados e gerar os graficos.

* Para realizar a analise pode-se selecionar todos os arquivos de testes ou selecionar manualmente somente aqueles que se deseja.
<br/>  

* Após gerar os gráficos, o sistema permite que todos eles seja exportados. Para isso basta clicar no botão "Save Analysis" e, informar o local para o qual as imagens deve ser exportadas. Todos os gráficos seram salvos em formato PNG.
<br/>  

* O sistema permite que todos os arquivos de teste e scripts sejam copiados e, fornece uma funcionalidade de copia. Para acessa-lá, basta ir em  **options -> copy test file** e informar o local para onde os arquivos devem ser copiados.

**2.10 Using External Features:**

Todas as caracteriticas geradas externamente que estão disponiveis ao sistema, irão aparecer com a palavra "Self" antes do nome do extrator de caracterticas, por exemplo: "Self - Color_Histogram". Como, essas caracteristicas foram geradas externamente, para utilizar imagens de consulta que não fazem parte do dataset é necessario informar ao sistema, manualmente, as caracteristicas daquela imagem de consulta.

* Os modulos Exploratorio e de Experimentos: Feedback Supervisionado, irão exibir uma janela solicitando as caracteristicas da imagem de consulta atual. Espera-se uma única linha, contendo as caracteristicas separadas por ";".

* O modulo de Experimentos: Feedback não Supervisionado, permite que essas caracteriticas sejam informadas durante a seleção manual. Neste caso, é necessario selecionar um arquivo, que contem o caminho para cada uma das imagens de consulta, e, abaixo de cada nome, devem estar as caracteristicas daquela imagem. Novamente separadas por ";"

### 3. Additional Information and Legal Note ####

O arquivo binário de demonstração está sob as restrições GPLv2 devido ao uso gratuito dos requisitos do [Java](http://openjdk.java.net/legal/).

Este repositorio contém uma demonstração, quaisquer garantias expressas ou implícitas, incluindo, sem limitação, as garantias implícitas de comerciabilidade e adequação a uma finalidade específica são renunciadas. Em nenhuma circunstância os autores deste software ou seus contribuidores serão responsáveis por quaisquer danos diretos, indiretos, incidentais, especiais, exemplares ou conseqüenciais (incluindo, mas não se limitando a, aquisição de bens ou serviços substitutivos, perda de uso, dados ou lucros, ou interrupção de negócios), porém causados e em qualquer teoria de responsabilidade no contrato, responsabilidade objetiva ou ato ilícito (incluindo negligência ou de outra forma) que surja de qualquer forma no uso desta demonstração, mesmo se avisado da possibilidade de tal dano.
