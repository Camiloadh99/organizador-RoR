## Primeros pasos

1. Instalar postrgress desde homebrew si no se tiene antes de crear proyecto en RoR

2. Enlazar bootstrap con simple_form:

   ```zsh
   rails g simple_form:install --bootstrap
   ```

3. Crear los modelos independientes primero para poder crear despues aquellos que dependan (siempre modelo com Mayus y en singular)

4. Si quiero tener relaciones puedo hacer esto

   4.1 Crear modelo independiente

   ```zsh
   rails g scaffold Category name:string description:text
   ```

   4.2 Relacionar con references como tipo

   ```zsh
   rails g scaffold Task name:string description:text due_date:date category:references
   ```

   4.3 Hacer migraciones
