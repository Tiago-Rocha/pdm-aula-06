# pdm-aula-06 · UX mobile e layouts

Repositório da aula 6 de PDM (Programação para Dispositivos Móveis), CTeSP DAW, ESTA, Universidade dos Açores, 2026/27.

## Como começar

```bash
git clone https://github.com/Tiago-Rocha/pdm-aula-06.git
cd pdm-aula-06
flutter pub get
```

Abre a pasta no VS Code. `Ctrl+Shift+P` → *Flutter: Select Device* → o teu Android. Depois F5: corre a configuração "Tempo Açores (debug)" que já vem no projeto, em `.vscode/launch.json`.

A app é a Tempo Açores tal como ficou no fim da aula 5, mais o ecrã de previsão em `lib/forecast_screen.dart`. É aí que trabalhas. `lib/data.dart` tem os dados estáticos e não se altera.

```bash
flutter test
```

Os testes começam vermelhos. Cada passo da aula põe um deles verde.

## Os passos

O repositório tem um branch por passo. `main` é o ponto de partida; `passo-4` é o estado final.

| Passo | Branch | O que fazes | Teste |
|---|---|---|---|
| 1 | `passo-1` | Em `CurrentConditions`, a `Row` de mínima, máxima e chuva rebenta num telemóvel. Corrige-a com `Expanded`. | `Passo 1` |
| 2 | `passo-2` | Em `IslandHeader`, põe o nome da ilha em baixo à esquerda com `Positioned` e um `Chip` com o estado do tempo em cima à direita. | `Passo 2` |
| 3 | `passo-3` | Cria `lib/day_chip.dart` com o widget `DayChip(forecast)`: um `Card` com o dia da semana, o ícone e a máxima. Usa-o em `DaysRow`. | os dois `Passo 3` |
| 4 | `passo-4` | Opcional, trabalho de casa: extrai o `Card` da grelha para `lib/island_card.dart` como `IslandCard(island: ...)`, como fizeste com o `DayChip`. | os dois `Passo 4` |

## Sincronizar com a aula

No fim de cada passo, quer tenhas acabado quer não, corre os comandos do slide, um de cada vez. Guardam o que fizeste e põem-te no código desse passo:

```bash
git stash -u
git checkout passo-1
flutter pub get
```

Depois, no VS Code, hot restart com o botão ↻ da barra de depuração. Se o `pubspec.yaml` ou os assets tiverem mudado, pára a app (■) e F5 outra vez.

Para voltares ao início: `git stash -u` e depois `git checkout main`.

## Créditos

- `assets/img/corvo.jpg`: [A couple enjoys the views of Caldeirão, Corvo Island, Azores, Portugal (PPL3-Altered) julesvernex2.jpg](https://commons.wikimedia.org/wiki/File:A_couple_enjoys_the_views_of_Caldeir%C3%A3o,_Corvo_Island,_Azores,_Portugal_(PPL3-Altered)_julesvernex2.jpg), Jules Verne Times Two, Wikimedia Commons, CC BY-SA 4.0, redimensionada.
- `assets/img/faial.jpg`: [Ermida de São João - Ilha do Faial - Portugal (51711005266).jpg](https://commons.wikimedia.org/wiki/File:Ermida_de_S%C3%A3o_Jo%C3%A3o_-_Ilha_do_Faial_-_Portugal_(51711005266).jpg), Vitor Oliveira from Torres Vedras, PORTUGAL, Wikimedia Commons, CC BY-SA 2.0, redimensionada.
- `assets/img/flores.jpg`: [Lagoa Comprida Flores.jpg](https://commons.wikimedia.org/wiki/File:Lagoa_Comprida_Flores.jpg), Unukorno, Wikimedia Commons, CC BY-SA 3.0, redimensionada.
- `assets/img/graciosa.jpg`: [Aerial view of the coastline at Poceirões, Graciosa Island, Azores, Portugal (PPL1-Corrected) julesvernex2.jpg](https://commons.wikimedia.org/wiki/File:Aerial_view_of_the_coastline_at_Poceir%C3%B5es,_Graciosa_Island,_Azores,_Portugal_(PPL1-Corrected)_julesvernex2.jpg), Jules Verne Times Two, Wikimedia Commons, CC BY-SA 4.0, redimensionada.
- `assets/img/pico.jpg`: [At the top of Mountain Pico (Portugal's highest peak), Pico Island, Azores, Portugal (PPL2-Enhanced) julesvernex2.jpg](https://commons.wikimedia.org/wiki/File:At_the_top_of_Mountain_Pico_(Portugal%27s_highest_peak),_Pico_Island,_Azores,_Portugal_(PPL2-Enhanced)_julesvernex2.jpg), Jules Verne Times Two, Wikimedia Commons, CC BY-SA 4.0, redimensionada.
- `assets/img/santa_maria.jpg`: [Baía da praia.JPG](https://commons.wikimedia.org/wiki/File:Ba%C3%ADa_da_praia.JPG), Carlos Luis M C da Cruz, Wikimedia Commons, Public domain, redimensionada.
- `assets/img/sao_jorge.jpg`: [Caldeira do Santo Cristo.jpg](https://commons.wikimedia.org/wiki/File:Caldeira_do_Santo_Cristo.jpg), Alacoolwiki, Wikimedia Commons, CC BY-SA 4.0, redimensionada.
- `assets/img/sao_miguel.jpg`: [Lagoa das Sete Cidades, São Miguel.jpg](https://commons.wikimedia.org/wiki/File:Lagoa_das_Sete_Cidades,_S%C3%A3o_Miguel.jpg), Samuel Monteiro Domingues, Wikimedia Commons, CC BY-SA 4.0, redimensionada.
- `assets/img/terceira.jpg`: [Ayuntamiento, Angra do Heroísmo, isla de Terceira, Azores, Portugal, 2020-07-25, DD 12.jpg](https://commons.wikimedia.org/wiki/File:Ayuntamiento,_Angra_do_Hero%C3%ADsmo,_isla_de_Terceira,_Azores,_Portugal,_2020-07-25,_DD_12.jpg), Diego Delso, Wikimedia Commons, CC BY-SA 4.0, redimensionada.

Conteúdos do docente com licença CC BY-NC-SA 4.0.
