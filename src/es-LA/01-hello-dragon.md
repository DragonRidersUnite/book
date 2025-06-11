# Hola Dragon!

Comenzaremos renderizando una imagen y un texto simple en la pantalla. Pero primero, debemos preparar nuestra computadora y DragonRuby Game Toolkit para el desarrollo.

## Primeros paasos

1. **Descargando un editor de código:** Como programaras tu juego, necesitas un editor de texto especial para escribir el código sin ningún formato adicional que agreguen los editores de texto como Microsoft Word. [Visual Studio Code](https://code.visualstudio.com/) es un excelente editor gratuito. Descárgalo e instálalo. (O usa tu propio editor favorito).
2. **Obten DragonRuby GTK:** Necesitas obtener una licencia de DragonRuby GTK para poder usar el motor. [Cómpralo en Itch y descarga el archivo zip para tu sistema operativo.](https://dragonruby.itch.io/dragonruby-gtk/purchase)
3. **Extrae el zip del motor DRGTK**: En el explorador de archivos de tu computadora, extrae el archivo zip.

Estamos listos para trabajar en tu juego. ¡Hagámoslo!

**ProTip:** ¡No elimine el archivo zip! Puedes descomprimirlo nuevamente para cuando comiences a trabajar en tu próximo juego. Es útil mantenerlo cerca.

## Qué hay en el archivo comprimido Zip

Cuando descarga DragonRuby Game Toolkit, contiene todo lo que necesita para construir su juego. No hay dependencias externas para instalar o manipular. Simplemente usas los archivos provistos y comienza a hacer tu juego.

Repasemos los archivos clave en el archivo que acaba de extraer:

- `dragonruby` — el ejecutable que usaras para iniciar tu juego en modo de desarrollo, tu entrada principal en el flujo de desarrollo
- `dragonruby-publish` — una herramienta de línea de comandos para ayudarte a crear y publicar fácilmente tu juego en línea, ¡no te preocupes por eso todavía!
- `samples/` — una carpeta de código de ejemplo que puede explorar y ejecutar si lo desea, o simplemente ignorarlo por ahora
- `docs/` — documentos de DragonRuby Game Toolkit para la versión que ha descargado, extremadamente útiles si desea profundizar más que este libro
- `mygame/` 🌟 —como su nombre lo indica, aquí es donde vive el código, los gráficos, el sonido y otros activos para tu juego; esta es la carpeta principal en la que trabajaras
  - `app/` — aquí es donde va tu código Ruby
    - `main.rb` — este es el archivo principal para el código de tu juego, no te preocupes por los otros dos archivos todavía
  - `data/` — donde puedes poner cualquier dato para tu juego, como archivos del editor de niveles
  - `fonts/` — donde van las fuentes, duh!
  - `metadata/` — archivos de configuración para tu juego, trabajaremos aquí más adelante
  - `sounds/` — donde van la música y los efectos de sonido
  - `sprites/` — dónde van las imágenes que se renderizarán en el juego; ya hay algunas imagenes presentes en este folder

No te preocupes por los otros archivos todavía. Centrarse en el folder o directorio `mygame/`, y, especificamente en, `mygame/app/main.rb`.

## Comienza el juego

Inicia el archivo `dragonruby`.

Si está en MacOS, haga clic derecho en el archivo y selecciona "Abrir". Deberá asegurarte de que se pueda ejecutar el software de fuentes no verificadas.

Esto es lo que se muestra:
![captura de pantalla de Hello World! Para DragonRuby GTK](./img/hello-world.jpg)

Esto no es un juego... ¡todavía! Pero estas haciendo tres cosas clave:

1. Abrir una ventana de aplicación
2. Renderizar textos
3. Mostrar una imagen

Y aún no has escrito ningún código. No es un mal punto de partida.

DRGTK maneja las cosas aburridas cuando se trata de hacer juegos, lidiando con API de bajo nivel como gráficos, ventanas y sonidos. En cambio, podemos centrarnos en crear nuestro juego en lugar de, por ejemplo, descubrir cómo guardar datos de una manera que sea compatible con Linux, Mac, Windows, Android, iOS y la web.

## Una descripción general del archivo principal del juego

Echemos un vistazo a lo que hay en `mygame/app/main.rb`:

```ruby
{{#include code/chapter_01/01_default/app/main.rb}}
```

Abre este archivo en Visual Studio Code. Continúe y haga eso: Nueva ventana> Abrir> [seleccione la carpeta en su computadora con DragonRuby Toolkit]

¿Seis líneas de códigos para representar texto y una imagen? ¡Nada mal! (Confía en mí, si hicieras todo esto desde cero sin un motor, tomaría cientos de líneas de código).

Esto es lo que hace ese código, línea por línea:

```ruby
{{#include code/chapter_01/01_default/app/main.rb:1}}
```

Este `def` define un metodo llamado `tick` y pasa un parámetro llamado `args`. `args` es la abreviatura de argumentos y nos lo proporciona DragonRuby GTK.

Los métodos son fragmentos de código reutilizables a los que puede llamar (invocar) para hacer algo una y otra vez. Piensa en métodos como verbos; son acciones. Los métodos son un bloque de construcción fundamental que permite la reutilización del código.

Digamos que quieres darle una galleta a un amigo 🍪, definirías un método llamado `give_cookie` y pasarías `friend` como parámetro. El amigo entonces tiene un método llamado `eat` que llamamos, pasando un parámetro de cookie.

```ruby
def give_cookie(friend)
  friend.eat("cookie")
end
```

Entonces llamarías o invocarias a ese método como:

```ruby
francis = Friend.new
give_cookie(francis)
```

Nota: los métodos en Ruby tienen paréntesis opcionales. Puede usarlos o dejarlos fuera al definir y llamar a tus métodos. Estos son los mismos:

```ruby
def give_cookie(friend)
  friend.eat("cookie")
end

def give_cookie friend
  friend.eat "cookie"
end
```

Soy un agente del caos y utilizo _ambos_ estilos a lo largo del libro. ¡Tengo que mantenerte alerta!

Espera, ¿cómo empezamos a hablar de galletas y amigos? Bien, volvamos al código anterior.

Las siguientes tres líneas manejan la salida de texto a la pantalla:

```ruby
{{#include code/chapter_01/01_default/app/main.rb:2:4}}
```

Tus ojos pueden estar derritiéndose un poco. ¡Pero no te preocupes, limpia ese ojo derretido y enfócate! En realidad, es bastante intuitivo una vez que le coges el truco.

¿Recuerdas los `args` de arriba? ¿Ese parámetro que se pasa a `tick`? Bueno, ¡puedes llamar a métodos en él! Esto le permite interactuar con el motor del juego.

`args` tiene un método llamado `outputs` que representa los datos que se muestran en la pantalla. Se accede con `args.outputs`. Cool! `labels` es un método de `outputs`, ¿ves cómo el `.` encadena las cosas?

El `<<` se llama operador pala. Le permite insertar datos en una colección. `labels` es la colección en la que estamos metiendo datos porque queremos representar algo de texto.

Y finalmente, el código entre corchetes `[]` es una matriz de datos que representa lo que queremos mostrar en la pantalla. Puede que aún no esté claro exactamente lo que está haciendo, pero se volverá más claro con el tiempo.

Pienso en las matrices como una pila de CD. Los CD están en un orden específico, pero no sabes qué es un CD determinado a menos que saques uno de la pila y lo mires. Tienes que hacer lo mismo con una matriz. En la programación, coloca datos en una matriz para recopilar esos datos y realizar un seguimiento de ellos. Si quieres saber qué hay en un lugar específico en una matriz, debe verificar.

Puedes ver algo de código entre comillas, esas son cadenas. Y son lo que muestra el juego. Sin embargo, para mostrar el texto, debemos decirle al motor dónde colocarlo en la pantalla. Eso es lo que hacen los dos primeros elementos de la matriz: especifican la posición x e y del texto en el juego. Luego está el texto que queremos representar. Eso es seguido por el tamaño del texto. Luego finalmente la alineación (centrada en este caso).

Aquí está desglosado:

```ruby
#  x,   y,           text, size, alignment
[640, 500, 'Hello World!',    5,         1]
```

No te preocupe por memorizar lo que significan los elementos posicionales de la matriz. Esta es solo una forma rápida de representar texto. Muy pronto comenzaremos a usar un enfoque más amistoso. El juego de muestra hace esto tres veces, por lo que representa tres fragmentos de texto diferentes. La coordenada `y` es diferente para cada uno, apilándolos uno encima del otro verticalmente en lugar de superponerse entre sí.

Dios mío, basta de divagaciones, ajustemos un poco el código. Cambia el texto de `"Hello World!"` a `"Hello Dragon!"` y guarda el archivo.

![captura de pantalla de Hello Dragon! Para DragonRuby GTK](./img/hello-dragon.jpg)

¿Viste eso? El juego recargó tu código y cambió el texto para que fuera "¡Hello Dragon!" Eso fue rápido, ¿no? Esa es una de las mejores partes de DRGTK: la recarga en vivo de tu código de juego en el motor. Esto le permite realizar cambios en su juego rápidamente, reduciendo el tiempo entre los ciclos de escribir su código y probarlo.

```ruby
{{#include code/chapter_01/01_default/app/main.rb:5}}
```

`args.outputs.sprites` es como etiquetas, pero en cambio es una colección de sprites\*. Representa la imagen `"dragonruby.png"` en x: 576, y: 280, al igual que el texto de la etiqueta, pero también establece el tamaño de la imagen para mostrar. Eso es lo que representan `128` y `101` en la matriz. Aquí hay un desglose de esos elementos:

```ruby
#  x,   y,   w,   h,            image
[576, 280, 128, 101, 'dragonruby.png']
```

Al igual que con las etiquetas, no te preocupes por memorizar el orden aquí. Hay formas más amigables de mostrarlos que veremos en breve. Pero es un código bastante fácil para poner una imagen en la pantalla.

Finalmente, la última línea:

```ruby
{{#include code/chapter_01/01_default/app/main.rb:6}}
```

significa que la definición del método `tick` ha terminado. Cualquier código después de eso no es parte del método `tick`. Eso es todo por lo que sacamos de la caja.

## Explicación de las coordenadas de la pantalla

Tomemos un desvío por el camino de Coordenadas de Pantalla. Las posiciones `x` e `y` son coordenadas en el plano bidimensional de la ventana del juego. ¿Recuerdas la geometría? Apenas lo hago. Pero esto es importante, así que no te quedes dormido conmigo todavía. ¡Solo estamos en el primer capítulo!

![diagrama que muestra el eje x y el eje y con 0, 0 en la parte inferior izquierda y 1280, 720 en la parte superior derecha](./img/c01-coords.png)

Los juegos hechos con DRGTK se componen de una ventana que tiene un tamaño de 1280x720 píxeles. Eso es 1280 píxeles de ancho y 720 píxeles de alto. El rectángulo de la pantalla del juego contiene 921600 píxeles, esos dos números multiplicados. Cada uno de esos píxeles tiene una coordenada en el plano. Facilita la referencia a un píxel específico usando su posición `x` e `y`.

DRGTK comienza 0, 0 en la parte inferior izquierda. Entonces 1280, 720 sería la esquina superior derecha. **Nota:** esto varía de la mayoría de los motores de juegos, bibliotecas y herramientas, pero es intencional para que sea más fácil pensar en la gravedad y sigue el plano geométrico 2D que se enseña en matemáticas.

Es importante tener en cuenta las coordenadas, ya que las usaremos mucho al hacer nuestro juego. Un aspecto importante de los juegos es mover cosas en la pantalla, lo que hacemos cambiando sus coordenadas en la pantalla.

## Nuestro propio hola

Volviendo a hacer el juego. Bien, sí, cambiaste una cadena y cambió lo que se mostraba. Está muy bien. Pero presionemos reiniciar y hagámoslo nosotros mismos.

Quiero que elimines el código en `mygame/app/main.rb`. Selecciónelo todo y elimínalo. Sí, lo sé, el lienzo en blanco es un desafío. Pero debe comenzar a escribir el código tu mismo para aprender y desarrollar la memoria muscular. Así que continúa y escribe cada línea a continuación en tu `main.rb`.

```ruby
def tick args
  args.outputs.labels << [120, 120, "Hola Dragon!"]
end
```

Sabes lo que hace eso, ¿verdad? Bueno, viste que se recarga automáticamente en tu juego, ¡así que por supuesto que lo haces!

Saludemos también a nuestro amigo Dylan.

```ruby
def tick args
  args.outputs.labels << [120, 120, "Hello Dragon!"]
  args.outputs.labels << [120, 100, "Hello Oboe!"]
end
```

¡Vaya, tantos amigos a los que saludamos! La cosa es... que el código es un poco... duplicado. Escribamos nuestro propio método para limpiar eso:

```ruby
def greet friend
  "Hello #{friend}!"
end

def tick args
  args.outputs.labels << [120, 120, greet("Dragon")]
  args.outputs.labels << [120, 100, greet("Oboe")]
end
```

El nuevo código refactoriza (cambia la implementación del código sin cambiar el comportamiento) el original para que podamos cambiar fácilmente el saludo en un lugar en lugar de muchos. Este es un ejemplo un poco trivial, pero muestra cómo podemos escribir nuestros propios métodos en DRGTK para mejorar nuestro código. La reutilización del código es fundamental para el resto de este libro.

El código `"Hello #{friend}!"` hace lo que se llama interpolación de cadenas. Toma lo que sea 'amigo', con suerte un nombre como una cadena, y lo inserta. Es bastante similar a este código: `"Hola " + amigo + "!"`, pero un poco más fácil de usar. El `#{}` le dice a Ruby que ejecute cualquier código de Ruby dentro de esas llaves.

Los métodos en Ruby devuelven un valor. Los valores devueltos pueden ser utilizados por la persona que llama para cualquier propósito que sea necesario. En el ejemplo anterior, el valor de retorno es la cadena que construimos. Ruby devuelve la última línea de la definición del método automáticamente. Pero puedes regresar antes explícitamente con `return`, lo que puede ser útil si quieres terminar la ejecución de un método antes.

Continúe y cambie el método `#greet` a:

```ruby
def greet friend
  "Hello #{friend}!"
  1
end
```

¡Guau! ¿Qué pasó con nuestros saludos? Bueno, cambiamos nuestro código y ahora siempre devuelve `1`, que no es lo que queremos. Es solo un ejemplo para ilustrar cómo funciona. Continúe y deshaga ese cambio.

Terminemos este capítulo mostrando un sprite. En `mygame/sprites/misc/` hay un archivo llamado `dragon-0.png`. Es un dragón de pixel art hecho por Nick Culbertson que es de uso gratuito. Con buena. ¡Gracias, Nick!

```ruby
{{#include code/chapter_01/02_our_own_hello/app/main.rb}}
```

![captura de pantalla de Hello Dragon! con el dragón de píxeles mostrado](./img/hello-dragon-own.jpg)

Ese es un código bastante bueno para el primer capítulo. Tenemos texto y una imagen que se muestra. También aprendimos sobre métodos. No te preocupes si no todo tiene un sentido total y completo. Lo entenderás más con el tiempo. Recuerda, sé paciente contigo mismo.

## Bucle de juego explicado

Hay mucha magia sucediendo donde podemos simplemente escribir `def tick` y mágicamente tener un juego. Lo que sucede aquí es que DragonRuby Game Toolkit toma el código en `mygame/app/main.rb`, encuentra el método `tick` y luego ejecuta un ciclo que lo llama 60 veces por segundo hasta que el programa se cierra. Este bucle se conoce como Game Loop.

Al programar juegos, suceden muchas cosas al mismo tiempo. Los enemigos se mueven, se muestran imágenes, se calculan las matemáticas, se maneja la entrada. El bucle se ejecuta una y otra vez, teniendo en cuenta cualquier cambio en el estado del juego. Esto es similar a cómo funcionan las pantallas de los dispositivos: se actualizan tantas veces por segundo, tan rápido que apenas es perceptible para el ojo humano.

Dentro del ciclo del juego, realizaremos un seguimiento de todo lo que sucede, actualizaremos el estado y renderizaremos texto e imágenes. Es importante comenzar a pensar en las cosas en bucle, ya que influye en el tiempo y la estructura del código.

![diagrama que muestra el bucle del juego que se ejecuta 60 veces por segundo, el manejo de la actualización del mundo y la representación](./img/c01-gameloop.png)

El ciclo del juego comenzará a sentirse más natural con el tiempo, pero por ahora, recuerda esto: **DRGTK ejecuta el método `tick` 60 veces por segundo**.

Si está familiarizado con los juegos, es posible que conozca los cuadros por segundo (FPS). Esa es la cantidad de fotogramas que se procesan en un segundo dado. 60 FPS es conocido por su suavidad y, a menudo, es el objetivo de muchos juegos. En DragonRuby GTK, los 60 tics por segundo se pueden considerar como si tu juego se ejecutara a 60 cuadros por segundo (FPS).

## Que Sigue

Hagamos que el dragón del jugador se mueva en la pantalla cuando presionemos ciertas teclas. La aportación de los jugadores es fundamental para crear juegos y un excelente próximo paso.

[end of src/es-LA/01-hello-dragon.md]
