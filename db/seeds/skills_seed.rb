# Seed pour les compétences U13
puts "Création des compétences U13..."

# Données des compétences U13
u13_skills = [
  { name: "Savoir courir", category: "U13", age_group: "U13", description: "Maîtriser les fondamentaux de la course en basketball" },
  { name: "Changment de vitesse dans la course", category: "U13", age_group: "U13", description: "Varier sa vitesse de course pour déstabiliser l'adversaire" },
  { name: "Changement de direction", category: "U13", age_group: "U13", description: "Changer de direction rapidement et efficacement" },
  { name: "S'arreter en 1 ou 2 temps", category: "U13", age_group: "U13", description: "Maîtriser les arrêts en un ou deux temps" },
  { name: "Pivoter en engageant", category: "U13", age_group: "U13", description: "Effectuer un pivot en engageant le pied d'appui" },
  { name: "Pivoter en effaçant", category: "U13", age_group: "U13", description: "Effectuer un pivot en effaçant le pied d'appui" },
  { name: "Passe poitrine", category: "U13", age_group: "U13", description: "Réaliser une passe poitrine précise et efficace" },
  { name: "Passe à terre", category: "U13", age_group: "U13", description: "Effectuer une passe à terre pour contourner la défense" },
  { name: "Passe désaxée", category: "U13", age_group: "U13", description: "Réaliser une passe désaxée pour surprendre l'adversaire" },
  { name: "Passe à une main", category: "U13", age_group: "U13", description: "Maîtriser la passe à une main" },
  { name: "Passe dans le dribble", category: "U13", age_group: "U13", description: "Effectuer une passe pendant le dribble" },
  { name: "Ouvrir un couloir de passe", category: "U13", age_group: "U13", description: "Créer un espace pour permettre une passe" },
  { name: "Passe de contre attaque à deux mains", category: "U13", age_group: "U13", description: "Réaliser une passe de contre-attaque à deux mains" },
  { name: "Passe de contre attaque à une main", category: "U13", age_group: "U13", description: "Effectuer une passe de contre-attaque à une main" },
  { name: "Feinte de passe", category: "U13", age_group: "U13", description: "Utiliser des feintes de passe pour déstabiliser la défense" },
  { name: "Tir en course lay up", category: "U13", age_group: "U13", description: "Maîtriser le tir en course lay up" },
  { name: "Tir en course en puissance power", category: "U13", age_group: "U13", description: "Effectuer un tir en course en puissance" },
  { name: "Tir en course en lay back", category: "U13", age_group: "U13", description: "Réaliser un tir en course en lay back" },
  { name: "Tir de lancer franc", category: "U13", age_group: "U13", description: "Maîtriser le tir de lancer franc" },
  { name: "Tir de plein pied", category: "U13", age_group: "U13", description: "Effectuer un tir de plein pied" },
  { name: "Tir en suspension", category: "U13", age_group: "U13", description: "Maîtriser le tir en suspension" },
  { name: "Appuis du tir", category: "U13", age_group: "U13", description: "Travailler sur les appuis pour un tir efficace" },
  { name: "Retomber dans ses appuis", category: "U13", age_group: "U13", description: "Maîtriser la retombée dans ses appuis après un tir" },
  { name: "Travail sur la concentration du tir", category: "U13", age_group: "U13", description: "Développer la concentration lors du tir" },
  { name: "Gestuelle de tir", category: "U13", age_group: "U13", description: "Perfectionner la gestuelle de tir" },
  { name: "Écran de retard au rebond", category: "U13", age_group: "U13", description: "Effectuer un écran de retard au rebond" },
  { name: "Protection de balle après un rebond", category: "U13", age_group: "U13", description: "Protéger la balle après avoir récupéré un rebond" },
  { name: "Sortie de balle après un rebond", category: "U13", age_group: "U13", description: "Sortir la balle efficacement après un rebond" },
  { name: "Tir en puissance sur rebond offensif", category: "U13", age_group: "U13", description: "Effectuer un tir en puissance sur rebond offensif" },
  { name: "Manupulation de balle dans le dribble", category: "U13", age_group: "U13", description: "Maîtriser la manipulation de balle pendant le dribble" },
  { name: "Aisance main droite", category: "U13", age_group: "U13", description: "Développer l'aisance avec la main droite" },
  { name: "Aisance main gauche", category: "U13", age_group: "U13", description: "Développer l'aisance avec la main gauche" },
  { name: "Dribble de contre attaque", category: "U13", age_group: "U13", description: "Maîtriser le dribble de contre-attaque" },
  { name: "Dribble de pénétration", category: "U13", age_group: "U13", description: "Effectuer un dribble de pénétration" },
  { name: "Dribble tête haute", category: "U13", age_group: "U13", description: "Dribbler tête haute pour voir le jeu" },
  { name: "Dribble dans le dos", category: "U13", age_group: "U13", description: "Maîtriser le dribble dans le dos" },
  { name: "Dribble en reverse", category: "U13", age_group: "U13", description: "Effectuer un dribble en reverse" },
  { name: "Dribble entre les jambes", category: "U13", age_group: "U13", description: "Maîtriser le dribble entre les jambes" },
  { name: "Dribble de recul", category: "U13", age_group: "U13", description: "Effectuer un dribble de recul" },
  { name: "Position défensive", category: "U13", age_group: "U13", description: "Adopter une position défensive correcte" },
  { name: "Orientations défensives", category: "U13", age_group: "U13", description: "Maîtriser les orientations défensives" },
  { name: "Défense sur porteur de balle", category: "U13", age_group: "U13", description: "Défendre efficacement sur le porteur de balle" },
  { name: "Défense sur non porteur à une passe", category: "U13", age_group: "U13", description: "Défendre sur un non porteur à une passe" },
  { name: "Défense non porteur à l'opposé du ballon", category: "U13", age_group: "U13", description: "Défendre sur un non porteur à l'opposé du ballon" },
  { name: "Sauter au ballon", category: "U13", age_group: "U13", description: "Sauter efficacement pour récupérer le ballon" },
  { name: "Défense sur les coupes", category: "U13", age_group: "U13", description: "Défendre sur les coupes adverses" },
  { name: "Position de triple menace", category: "U13", age_group: "U13", description: "Adopter une position de triple menace" },
  { name: "Regard à la réception de balle", category: "U13", age_group: "U13", description: "Avoir le bon regard à la réception de balle" },
  { name: "Départ direct", category: "U13", age_group: "U13", description: "Effectuer un départ direct" },
  { name: "Départ croisé", category: "U13", age_group: "U13", description: "Maîtriser le départ croisé" },
  { name: "Feintes de tir et de départ", category: "U13", age_group: "U13", description: "Utiliser des feintes de tir et de départ" },
  { name: "Démarquage en v", category: "U13", age_group: "U13", description: "Effectuer un démarquage en V" },
  { name: "Démarquage en l", category: "U13", age_group: "U13", description: "Effectuer un démarquage en L" },
  { name: "Prise d'information puis prise de décision", category: "U13", age_group: "U13", description: "Prendre des informations puis prendre une décision" },
  { name: "Utilisation des couloirs", category: "U13", age_group: "U13", description: "Utiliser efficacement les couloirs" },
  { name: "Course de contre attaque et transition dans les couloirs", category: "U13", age_group: "U13", description: "Maîtriser la course de contre-attaque et la transition dans les couloirs" }
]

# Création des compétences
u13_skills.each do |skill_data|
  skill = Skill.find_or_create_by(name: skill_data[:name], category: skill_data[:category]) do |s|
    s.age_group = skill_data[:age_group]
    s.description = skill_data[:description]
  end

  if skill.persisted?
    puts "✅ Compétence créée : #{skill.name}"
  else
    puts "⚠️  Compétence déjà existante : #{skill.name}"
  end
end

puts " #{u13_skills.count} compétences U13 traitées !"
