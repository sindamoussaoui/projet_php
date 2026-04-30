<?php
session_start();
include("config.php");

if (!isset($_SESSION['user_id'])) { header("Location: login.php"); exit(); }

$pdo->beginTransaction();
// 1. Enregistrer la commande liée à l'utilisateur
$stmt = $pdo->prepare("INSERT INTO commandes (user_id) VALUES (?)");
$stmt->execute([$_SESSION['user_id']]);
$commande_id = $pdo->lastInsertId();

// 2. Enregistrer les produits
foreach ($_SESSION['panier'] as $id => $qte) {
    $p = $pdo->prepare("SELECT prix FROM produits WHERE id=?");
    $p->execute([$id]);
    $prix = $p->fetchColumn();
    
    $ins = $pdo->prepare("INSERT INTO commande_details (commande_id, produit_id, quantite, prix) VALUES (?, ?, ?, ?)");
    $ins->execute([$commande_id, $id, $qte, $prix]);
}

$pdo->commit();
unset($_SESSION['panier']);
echo "Commande validée !";
?>