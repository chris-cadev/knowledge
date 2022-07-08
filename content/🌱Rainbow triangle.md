---
title: 🌱Rainbow triangle
tags:
---

Rainbow triangle era un juego que cree en preparatoria para que lo jugaran mis amigos en ese entonces, pero solo era eso. Ahora lo voy recrear con las abilidades que tengo ahora esperando que se va ver mucho mejor.

Este es link al antiguo juego, creo que ya ni esta la forma de descargarlo:
https://www.deviantart.com/xentyo/art/Rainbow-Triangle-517500183

---
Primero empece a buscar un motor de juego, pero me di cuenta que no es la forma correcta de empezar con el juego, porque a la gente no le importa eso, si no el juego en si. Asi que mejor empece a pensar a donde iria a ejecutarse el juego, y llegue a la conclusion de que... soprendentemente (?) todos mis amigos tienen celular. Asi que mejor pienso en que motor de juego se puede usar facil en react native. Recordé [[Skia]] que era para usar directamente un motor de pixeles o algo asi recordaba, y solo tendria que agregarle las fisicas o algo asi.

---
El solo pensar en que usaria [[React Native]] me disparo el que deberia usar:
- [[pnpm]]
- [[typescript]]
- [[nvm]]
---
es un martirio trabajar con skia para react native, y mas por los paths. Si resuelvo como animar los paths en react-native-skia voy a hacer un post.

---
se pudo resolver lo del path, solo era necesario usar L para hacerlo una coordenada absoluta y no relativa. De esa forma cuando se sumaban las coordenadas para moverlo ahora si se podia hacer.

---
despues ya no se pudo seguir con el proyecto porque el uso de hooks en react dificultaba mucho el conectar todo. quizas aplicando patrones y todo eso se pueda pero no valdria la pena.

---
Tenia mucha ilusion de que funcionara con Skia pero parece que esa libreria tiene otro enfoque y no tanto para este tipo de animaciones, asi que la funcionalidad no encaja con lo que se quiere hacer.

---
Ahora (2022-07-05 11:57:44) voy a ver si es mejor usar flutter o unity. de momento me decanto mas por flutter

---
Primero voy a instalarme unity en ubuntu para empezar a ver que onda con unity.
(2022-07-06 10:14:18)
