<?php
session_start();
include("config.php");
$stmt = $pdo->query("SELECT * FROM produits");
$produits = $stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Boutique Maman & Bébé</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>🍼 Boutique Maman & Bébé</h1>
    <a href="panier.php">🛒 Voir mon panier</a>
    <div class="products">
        <?php foreach($produits as $p): ?>
        <div class="card">
            <h3><?= htmlspecialchars($p['nom']) ?></h3>
            <p><?= $p['prix'] ?> DT</p>
            <form method="POST" action="panier.php">
                <input type="hidden" name="id" value="<?= $p['id'] ?>">
                <input type="number" name="qte" value="1" min="1">
                <button type="submit" name="add">Ajouter</button>
            </form>
        </div>
        <?php endforeach; ?>
    </div>
</body>
</html>