# auto_tools_flutter
Conjunto de ferramentas para facilitar o gerenciamento de veículos

## Ferramentas
### Comparador de combustíveis
- Comparador de preço do combustível por distância de rendimento.  
_para aqueles casos em que até o Etanol está tão caro que nem até a Gasolina compensa mais_  

- Notificador (em progresso)  
_para te lembrar de quando é aquela próxima revisão que o mecânico disse que vai sair mais cara_

## A fazer:
- ### Pipeline
  Rodar um pipeline ao atualizar a main que faça
  - Ajuste da tag `<base>` no arquivo index.html
  - execução do [Peanut](https://pub.dev/packages/peanut) para compilar para o Github Pages (`flutter pub global run peanut:peanut`)
  - push para a branch gh-pages (`git push origin gh-pages`)
- ### Notificador  
  Ferramenta onde se cadastre uma notificação a ser recebida em uma data específica.

## Tecnologias utilizadas
- Arquitetura MVVM
- Provider
- Firebase
