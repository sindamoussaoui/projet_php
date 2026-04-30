
-- Categories
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100)
);

-- Produits
CREATE TABLE produits (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(150),
    description TEXT,
    prix NUMERIC,
    categorie_id INT REFERENCES categories(id)
);

-- Commandes
CREATE TABLE commandes (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(100),
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Détails commande
CREATE TABLE commande_details (
    id SERIAL PRIMARY KEY,
    commande_id INT REFERENCES commandes(id),
    produit_id INT REFERENCES produits(id),
    quantite INT,
    prix NUMERIC
);