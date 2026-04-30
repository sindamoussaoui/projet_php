<?php
include "config.php";
session_start();

try {
    // Création de la commande
    $pdo->exec("INSERT INTO commandes DEFAULT VALUES");

    // Récupération de l’ID de la commande
    $commande_id = $pdo->lastInsertId();

    // Insertion des détails de la commande
    foreach ($_SESSION['panier'] as $id => $qte) {

        // Récupération du prix depuis la table produits
        $stmt = $pdo->prepare("SELECT prix FROM produits WHERE id = ?");
        $stmt->execute([$id]);
        $produit = $stmt->fetch();

        $prix = $produit['prix'];

        // Insertion dans commande_details
        $stmt = $pdo->prepare("
            INSERT INTO commande_details (commande_id, produit_id, quantite, prix)
            VALUES (?, ?, ?, ?)
        ");
        $stmt->execute([$commande_id, $id, $qte, $prix]);
    }

    echo "Commande ajoutée";

} catch (Exception $e) {
    echo $e->getMessage();
}
?>