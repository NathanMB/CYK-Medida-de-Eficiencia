# **CYK Medida de Eficiência**
# **Execução do Algoritmo**

O código foi desenvolvido na linguagem de programação chamada Lua. Para executar o código não há necessidade de instalação em máquina, ao acessar o link [Lua Online](https://repl.it/languages/lua) será redirecionado a uma IDE Online. Na barra lateral esquerda da IDE (Files) será necessário adicionar dois arquivos. O primeiro com o nome "main.lua" e o segundo com o nome "CYK.lua", após isso será necessário copiar os respectivos códigos para ambos os arquivos. Clicanco no botão verde, com o símbolo de Play, o código irá ser executado e mostrado o resultado no console ao lado direito.

# **Funcionamento do Algoritmo**

O algoritmo de CYK (Cocke Younger Kasami) considera cada árvore possível da sequência de palavras e conjuntos que foi passada. Após avaliar as árvores de tamanho 1, avalia as de tamanho 2, e assim sucessivamente. Para as de tamanho 2 ou maior, é considerado cada possível partição dela mesma, assim ela é dividia em duas partes:
  - Sendo Y coincidindo com a primeira parte;
  - Z coincidindo com a segunda parte;

Assim é gerado uma produção X, sendo a árvore completa, dado que X -> YZ. Quando esse processo é terminado, a palavra é reconhecida pela gramática se a árvore contendo ela coincide a partir do símbolo inicial.
