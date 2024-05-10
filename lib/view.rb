class View
  # Méthode pour récupérer les informations d'un nouveau potin depuis l'utilisateur
  def create_gossip
    puts "Entrez votre nom :"
    author = gets.chomp
    puts "Entrez le contenu de votre gossip :"
    content = gets.chomp
    { author: author, content: content }
  end

  # Méthode pour afficher tous les potins
  def index_gossips(gossips)
    puts "Liste des potins :"
    gossips.each_with_index do |gossip, index|
      puts "#{index}. #{gossip.author}: #{gossip.content}"
    end
  end

  # Méthode pour demander à l'utilisateur quel potin il veut supprimer
  def ask_gossip_to_delete
    puts "Quel gossip voulez-vous supprimer ? (Entrez son numéro)"
    gets.chomp.to_i
  end

  # Méthode pour afficher un message à l'utilisateur
  def display_message(message)
    puts message
  end

  # Méthode pour afficher un message d'erreur à l'utilisateur
  def display_error(error)
    puts "Erreur : #{error}"
  end
end
