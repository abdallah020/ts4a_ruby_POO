# Importation des classes nécessaires
require_relative 'controller'

# Définition de la classe Router
class Router
  # Initialisation du Router
  def initialize
    # Création d'une instance de Controller
    @controller = Controller.new
  end

  # Méthode pour démarrer l'application
  def perform
    puts "BIENVENUE DANS THE GOSSIP PROJECT"

    # Boucle pour afficher le menu et gérer les actions de l'utilisateur
    loop do
      puts "Que souhaitez-vous faire ?"
      puts "1. Créer un gossip"
      puts "2. Afficher la liste des gossips"
      puts "3. Supprimer un gossip"
      puts "4. Quitter l'application"
      print "> "
      choice = gets.chomp.to_i

      case choice
      when 1
        @controller.create_gossip
      when 2
        @controller.index_gossips
      when 3
        @controller.delete_gossip
      when 4
        puts "À bientôt !"
        break
      else
        puts "Choix invalide. Veuillez sélectionner une option valide."
      end
    end
  end
end
