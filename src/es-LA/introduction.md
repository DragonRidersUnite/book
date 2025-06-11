<!-- TODO: Adaptar este archivo a Español Latinoamericano. Mantener ejemplos de código e imágenes sin cambios. -->
# Introducción

![portada de Creando Juegos con DragonRuby, con el subtítulo 'Una guía completa para enviar juegos multiplataforma con facilidad' de Brett Chalupa y Dragon Rider Community.](./img/cover.jpg)

Este libro está dirigido a nuevos desarrolladores de juegos que estén interesados en aprender a codificar y crear juegos. Si ha escrito código antes, especialmente Ruby, entonces tendrá un poco de ventaja. Pero los conceptos de este libro son aptos para principiantes. Ya sea que sea nuevo en el desarrollo de juegos o simplemente DragonRuby Game Toolkit, habrá creado un juego terminado al final de este.

No necesita experiencia previa con la programación o la creación de juegos para seguir este libro.

## Por qué aprender a hacer juegos

Hacer juegos es una maravilla. Es desafiante pero gratificante. Son la suma total de muchos medios creativos, además de que son interactivos. Aprenderás tantas habilidades diferentes haciendo juegos:

- Programación y lógica.
- Renderizado imágenes
- Respondiendo a entrada
- Diseño de juego
- Diseño interactivo
- Trabajar con archivos de imagen.
- Edición de archivos de audio
- Distribuir el software del juego a los usuarios.
- Obtener comentarios de tu juego e iterarlo para mejorarlo

Ya sea que tu sueño sea hacer juegos como profesión o simplemente como un pasatiempo, creo que es una práctica creativa que vale la pena seguir.

## Acerca del kit de herramientas del juego DragonRuby

[DragonRuby Game Toolkit](https://dragonruby.org/toolkit/game) (DRGTK) es un motor de juego multiplataforma para crear juegos 2D. Te permite escribir juegos en Ruby, un lenguaje maravillosamente expresivo y accesible. Le permite iterar rápidamente en sus juegos y enviarlos a cualquier plataforma moderna: sistemas operativos modernos, dispositivos móviles y consolas de juegos.

DRGTK **no** es un motor sin código. Escribirás el código que hace que tu juego se ejecute. Esto puede parecer aterrador al principio, pero es muy divertido y realmente poderoso. ¡Crear juegos también es una excelente manera de aprender a programar! ¿No sabes a Ruby? Está bien, este libro te enseñará lo que necesitas saber.

### ¡Pero no es gratis!

DRGTK cuesta dinero, sí. Y hay muchos motores de juegos gratuitos por ahí. Pero el equipo de DRGTK está comprometido a trabajar de manera sostenible en el motor y hacerlo lo mejor posible, lo que significa que necesitan que se les pague por su trabajo. Apoya a equipos pequeños comprando su software. Pagar por el software muestra que estás interesado y les ayuda a seguir haciendo lo que aman.

Está invirtiendo en el motor y el ecosistema, literalmente, al comprar DRGTK. Quiero que tenga éxito, así que compré una licencia. Tengo tantas ganas de que tenga éxito que he escrito este libro para tratar de ayudarte a hacer juegos con él. Cuanto más exitoso sea DragonRuby Game Toolkit, mejor será para todos los que hagan juegos con él.

Además, si eres estudiante o necesitas asistencia financiera, el equipo de DragonRuby ofrece licencias gratuitas. [Póngase en contacto con el equipo para obtener una licencia gratuita.](https://dragonruby.org/toolkit/game)

También hay [un entorno interactivo gratuito en línea](https://fiddle.dragonruby.org) puedes usar para probar DragonRuby GTK. ¡Pruébelo y vea lo que piensa!

## Por qué DragonRuby Game Toolkit

Hay más motores de juegos, frameworks y bibliotecas de las que puedo contar con los dedos de las manos y los pies. Entonces, ¿por qué deberías usar DragonRuby Game Toolkit?

Esa es una pregunta legítima. Aquí están mis razones por las cuales:

- Se centra en los juegos 2D, por lo que no hay intereses en conflicto en el funcionamiento de las herramientas. Significa que lo que necesita saber es bastante simple y fácil de recordar.
- Hace que sea _tan_ simple distribuir juegos para todas las plataformas modernas, desde computadoras de escritorio hasta la web, desde dispositivos móviles hasta consolas. Es verdaderamente multiplataforma y _simplemente funciona_, lo cual es increíble.
- Es muy rápido, lo cual es importante para hacer juegos de calidad.
- Hace uso de Ruby, que es un lenguaje de programación maravillosamente productivo.
- No te obliga a usar un editor o herramientas específicas.
- Es liviano para ejecutar el motor, lo que significa que puede crear juegos en cualquier computadora, incluso en una Raspberry Pi.
- Tiene recarga en vivo y sin compilación, lo que significa que cuando cambias el código del juego, se actualiza automáticamente en el motor en ejecución. Honestamente, esto es tan asombroso. No sabrías lo increíble que es esto a menos que hayas usado otros motores de juegos que requieren que compiles tu juego con cada cambio.

Voy a ser honesto, DRGTK podría no ser para ti. Si quieres hacer juegos en 3D, busca en otra parte. Aunque, si eres nuevo en el desarrollo de juegos, no te recomendaría comenzar con un juego en 3D. Si no está dispuesto a programar, busque en otra parte.

Pero para todos los demás, creo que DRGTK los dejará boquiabiertos (o al menos los bajará un poco).

## Mentalidad

Cuando se aprende algo nuevo, especialmente algo desafiante, es importante tener la mentalidad correcta.

- Sé curioso: ¡es la mejor manera de aprender!
- Sea paciente: aprender es difícil, pero persiste.
- Sé amable: contigo mismo y con los demás.

Cuando aprendemos a tocar un nuevo instrumento, aprendemos los conceptos básicos cubriendo piezas musicales simples. Del mismo modo, vamos a "cubrir" mecánicas de juego más simples para que pueda comenzar. En poco tiempo, comprenderá los conceptos básicos y podrá pasar a juegos y mecánicas más complejos.

Comienza haciendo pequeños juegos que puedas terminar en un par de días. Haz muchos juegos pequeños para aprender rápidamente. No te envuelvas demasiado en la idea de tus sueños o en hacer algo que llegue a Steam. Definitivamente no intentes hacer un MMORPG. En su lugar, concéntrese en **publicar** tus pequeños juegos.

¿Qué vas a Publicar? Publicar es cuando 1. terminas tu juego y 2. lo liberas para que la gente lo juegue.

Así que esta debe ser tu forma de pensar, resumida: crea un juego pequeño y publicalo gratis, luego crea otro juego pequeño y publicalo gratis. Lo que hará esta mentalidad iterativa es ayudarte a crecer como desarrollador, crear una base de juegos y fans y preparar tu fuerza de publicar para prepararte a hacer un juego mejor cada vez.

## Lo Que Estaremos Haciendo

![captura de pantalla del juego terminado de lo que vas a hacer](./img/c09-blue-sky.jpg)

A lo largo del libro, construiremos un shoot-'em-up simple en el que pilotas un dragón. Nuestro juego se llamará _Target Practice_. Aprenderás todos los aspectos básicos de la creación de un juego:

- El bucle del juego
- Renderiar textos
- Renderizar sprites y animarlos.
- Manejo de entrada
- Reproducción de efectos de sonido y música.
- Mejorar tu juego
- ¡Enviándolo!

[🎮 ¡Juega el juego directamente en tu navegador!](https://dragonridersunite.itch.io/dragonruby-book) (Incluso puedes descargarlo en tu sistema operativo).

## Sostén el Teléfono

"Quién emonios _eres_?" podrías estar gritando a tu pantalla. ¿Yo? ¡Soy solo la voz del dragón que vive dentro de todos los seres! No, no, bromeo. ¡Soy Brett! Soy un programador que disfruta haciendo juegos y compartiendo lo que he aprendido en el camino.
![avatar de píxeles de Brett](./img/brett.png)

¡Lo mismo! Si yo fuera un montón de píxeles, supongo.

Me encanta Ruby. Lo he estado escribiendo durante más de 12 años, y es una alegría. También me encantan los juegos. Particularmente los 2D. Aqui estamos. 💎 + ❤️ + 🎮 = 📕 Vaya ecuación, ¡¿no?!

¿Quieres que hable en serio acerca de por qué deberías escucharme? Oh, te saltaste esta sección, está bien. Wow, ¿Ya estás tratando de sacarme? ¿Tan rapido? Bueno, ¡nos vemos en el próximo capítulo! Veremos quién ríe el último.

## Por qué el libro es gratis

Cuando tenía 16 años, tomé una clase de informática en la escuela secundaria. Fue mi primera exposición a la programación con un lenguaje más complejo que HTML y CSS. Programamos en Java. Por alguna extraña razón, mi maestra nos pidió que imprimiéramos nuestras tareas para calificarlas.

Esa clase fue fundamental en el curso que tomaría mi vida en los 14 años transcurridos desde entonces. A los 16 años era un niño emo al que le encantaban los videojuegos y el anime. Imagina a un adolescente de cabello ondulado en su habitación escuchando Bright Eyes mientras juega _Final Fantasy XII_. Ese fui yo.

Entonces, naturalmente, para mi proyecto final en esa clase de informática de la escuela secundaria, hice un juego. Pilotas un Moltres de Pokémon que dispara bolas de fuego a los robots Zaku de Gundam que vuelan por la pantalla. Si te golpea un enemigo, se acabó el juego. Si derrotas a todos los enemigos, ganas. Este juego se tituló cariñosamente _Zaku Space Battle_.

![captura de pantalla de Zaku Space Battle que muestra el sprite de Moltres, los sprites de Zaku, la bola de fuego y el fondo del espacio](./img/zaku-space-battle.jpg)

Para hacer ese juego, seguí un tutorial gratuito en línea que establecía las bases para hacer un juego con Java. No había forma de que hubiera descubierto por mi cuenta cómo hacer un juego en ese momento sin la ayuda de un tutorial gratuito en línea. Me divertí tanto haciendo ese proyecto final que fui a la universidad para estudiar programación de juegos y hacer programación para mi carrera. Tomé lo que aprendí de ese tutorial, amplié la funcionalidad y lo hice mío (con sprites de derechos de autor, ¡pero aún así!).

Este libro es de libre acceso para que alguien que ama los juegos y quiera intentar hacerlos pueda hacerlo. Los recursos de programación gratuitos realmente han dado forma a mi vida y mi carrera. Así que este libro es mi forma de retribuir y tratar de ayudar a otros desarrolladores.

Aprenderas los fundamentos de la programación y creación de juegos, así como algunos temas más avanzados. Si este libro puede ayudar incluso a una sola persona a comenzar y terminar un juego, vale la pena cada minuto que he dedicado a él. Haremos un juego no muy diferente de _Zaku Space Battle_. Una vez que lo termines, ¡toma lo que has aprendido y hazlo tuyo!

Si quieres, puedes [invitarme a un café](https://buymeacoffee.com/brettchalupa) como una forma de decir gracias. Es muy apreciado.

## Contribuir

Este libro es de código abierto. Eso significa que cualquiera puede ver el código que lo crea y contribuir a mejorarlo. ¿Encontraste algo que no funciona, contiene un error tipográfico o le falta claridad? [Envíe un issue o contribuya en GitHub.](https://github.com/DragonRidersUnite/book) Es fácil y puede hacerlo directamente desde su navegador. ¡Gracias por adelantado!

Si está atascado y deseas sobtener ayuda adicional, comuníquese con [DragonRuby Discord] (https://discord.dragonruby.org). ¡Te despegaremos!

## Cómo leer el libro

Cada capítulo se basa en el anterior. Pasarás de mostrar una sola imagen a crear un juego completo al final del libro. El código que se agrega y cambia se explica en detalle, pero puede [siempre encontrar el código fuente para cada capítulo en GitHub](https://github.com/DragonRidersUnite/book/tree/main/src/code).

Programa junto con el libro, pero siéntase libre de hacer ajustes y experimentar si te sientes emocionado.

Prefer an offline version? [You can find a PDF and HTML version for download on the Itch page.](https://dragonridersunite.itch.io/dragonruby-book)

## Empezar

Muy bien, ¿estás listo para hacer un juego? ¡Empecemos!

[end of src/es-LA/introduction.md]
