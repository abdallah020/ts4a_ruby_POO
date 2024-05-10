# Importation des classes nécessaires
require_relative 'lib/router'

# Fonction principale pour démarrer l'application
def main
  # Création d'une instance de Router
  router = Router.new

  # Appel de la méthode perform pour démarrer l'application
  router.perform
end

# Appel de la fonction principale pour démarrer l'application
main if __FILE__ == $PROGRAM_NAME
