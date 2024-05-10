require 'csv'
require 'bundler'
require "pry"

Bundler.require

class Gossip
  attr_reader :author, :content

  # Initialise un nouveau potin avec un auteur et un contenu
  def initialize(author, content)
    @author = author
    @content = content
  end

  # Sauvegarde le potin dans la base de données (fichier CSV)
  def save
    CSV.open('db/gossip.csv', 'a') do |csv|
      csv << [author, content]
    end
  end

  # Récupère tous les potins depuis la base de données
  def self.all
    gossips = []
    CSV.foreach('db/gossip.csv') do |row|
      gossips << Gossip.new(row[0], row[1])
    end
    gossips
  end

  # Supprime un potin de la base de données en fonction de son index
  def self.destroy(index)
    gossips = all
    gossips.delete_at(index)
    rewrite_csv(gossips)
  end

  # Réécrit le fichier CSV avec les potins restants après suppression
  def self.rewrite_csv(gossips)
    CSV.open('db/gossip.csv', 'w') do |csv|
      gossips.each do |gossip|
        csv << [gossip.author, gossip.content]
      end
    end
  end
end
