# Proyecto Blog Challenge

Este proyecto es una aplicación Flutter que muestra una lista de publicaciones obtenidas de una API utilizando el patrón BLoC (Business Logic Component). Cuenta con pruebas unitarias para el BLoC, el repositorio y el servicio de la API.

# Características

1. Arquitectura BLoC: Organización de la lógica de negocios en bloques, separando la UI de la lógica y las interacciones con el backend.
2. Pruebas unitarias: Test para el BLoC, repositorio y servicio, utilizando bloc_test, mockito y flutter_test.
3. Consumo de API: Los datos son obtenidos de la API https://jsonplaceholder.typicode.com/posts.

# Requisitos
1. Flutter SDK
2. Dart

# Configuración del Proyecto
Clona este repositorio:
```
git clone git@github.com:maximza10/somnio_blog_challenge.git
cd somnio_blog_challenge
```

# Instala las dependencias:

Asegúrate de que las dependencias están instaladas correctamente ejecutando:
```
flutter pub get
```

# Ejecuta la aplicación:

Para iniciar la aplicación en un emulador o dispositivo físico:

```
flutter run
```

# Arquitectura del Proyecto

```
lib/
├── blocs/
│   ├── post/                      # BLoC relacionado a la lógica de las publicaciones
│   │   ├── post_bloc.dart         # Lógica del BLoC para manejar eventos y estados
│   │   ├── post_event.dart        # Eventos del BLoC (e.g. LoadPosts)
│   │   ├── post_state.dart        # Estados del BLoC (e.g. PostLoading, PostLoaded)
├── core/
│   ├── network/                    
│   │   ├── dio_client.dart        # Cliente para peticiones http/https
│   ├── utils/                    
│   │   ├── constants.dart         # Archivo de constantes
├── models/
│   └── post.dart                  # Modelo Post basado en Freezed
├── repositories/
│   └── post_repository.dart       # Repositorio para manejar la interacción con el servicio
├── services/
│   └── post_service.dart          # Servicio para hacer peticiones HTTP (utilizando Dio)
├── ui/
│   ├── screens/                   # Contenedor de vistas
│   │   ├── home_page.dart         # Pagina principal
│   │   ├── post_list_page.dart    # Pagina que lista los post
│   ├── widgets/                   # Contenedor de widgets
│   │   ├── post_item_view.dart    # Widget para generar la vista de cada item de los posts
│   │   ├── post_list_view.dart    # Widget para generar el listado de posts
├── main.dart                      # Entrada principal de la aplicación
```

# Principales Componentes:

1. PostBloc: Gestiona los eventos y el estado de la lista de publicaciones.
2. PostRepository: Intermediario entre el BLoC y el servicio de API.
3. PostService: Hace las peticiones HTTP utilizando la librería Dio.
4. PostModel: Modelo de datos de la publicación, generado con la librería Freezed.