## Primeros pasos

1.  Instalar postrgress desde homebrew si no se tiene antes de crear proyecto en RoR

2.  Enlazar bootstrap con simple_form:

    ```zsh
    rails g simple_form:install --bootstrap
    ```

3.  Crear los modelos independientes primero para poder crear despues aquellos que dependan (siempre modelo com Mayus y en singular)

4.  Si quiero tener relaciones puedo hacer esto
    4.0 inicializar postgres y crear usuario para usar en la config

    ```zsh
    brew services start postgresql
    createuser -P -d <Nombre del usuario>
    ```

    4.1 Crear modelo independiente

    ```zsh
    rails g scaffold Category name:string description:text
    ```

    4.2 Relacionar con references como tipo

    ```zsh
    rails g scaffold Task name:string description:text due_date:date category:references
    ```

    4.3 Hacer migraciones, como estamos en posgress toca configurar usuario y contraseña en database.yml y migrar

    ```zsh
    rails db:migrate
    ```

    4.4 hay una gema llamada annotate que permite saber el Squema information automatico para saber que tiene mi modelo, se instala annotate y se corre:

    ```zsh
    annotate --models
    ```

## Auth

La gem devise sirve directamente para crear un sistema de autenticacion, este crea el modelo y todo lo que necesitas para crear y mantener un user

1. Se instala la gema de devise
   ```zsh
   rails generate devise:install
   ```
2. se crea el modelo user con devise
   ```zsh
   rails g devise User
   ```
3. migrar DB, devise ya crear muchas rutas
4. en application_controller agregar

```ruby
  before_action :authenticate_user!
```

## Añadir migracion manual

```zsh
rails g migration < migration name > < mas info >
```

Quiero por ejemplo decir que user va a tener una relacion

```zsh
rails g migration AddOwnerToTask user:references
```
