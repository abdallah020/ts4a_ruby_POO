# On importe les fichiers nécessaires
require_relative 'gossip'
require_relative 'view'

class Controller
  # Initialise le contrôleur avec une instance de la vue
  def initialize
    @view = View.new
  end

  # Méthode pour créer un potin
  def create_gossip
    # Demande à la vue de récupérer les informations de l'utilisateur
    params = @view.create_gossip
    # Crée un nouveau potin avec les informations récupérées
    gossip = Gossip.new(params[:author], params[:content])
    # Sauvegarde le potin dans la base de données
    gossip.save
    # Affiche un message de succès à l'utilisateur
    @view.display_message("Potin créé avec succès !")
  end

  # Méthode pour afficher tous les potins
  def index_gossips
    # Récupère tous les potins depuis la base de données
    gossips = Gossip.all
    # Demande à la vue d'afficher les potins
    @view.index_gossips(gossips)
  end

  # Méthode pour supprimer un potin
  def destroy_gossip
    # Affiche la liste des potins à l'utilisateur
    index_gossips
    # Demande à la vue de récupérer le numéro du potin à supprimer
    gossip_index = @view.ask_gossip_to_delete
    # Vérifie si le numéro du potin est valide
    if gossip_index.between?(0, Gossip.all.length - 1)
      # Supprime le potin correspondant au numéro donné
      Gossip.destroy(gossip_index)
      # Affiche un message de succès à l'utilisateur
      @view.display_message("Potin supprimé avec succès !")
    else
      # Affiche un message d'erreur si le numéro du potin est invalide
      @view.display_error("Numéro de potin invalide !")
    end
  end
end
