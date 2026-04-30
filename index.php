<?php
session_start();
include("config.php");

// Récupérer tous les produits depuis la base
$stmt = $pdo->query("SELECT * FROM produits");
$produits = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Boutique Maman & Bébé</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<h1>🍼 Boutique Maman & Bébé</h1>

<a href="commande.php">🛒 Voir panier</a>

<div class="products">

<?php foreach($produits as $p): ?>
    <div class="card">
        <h3><?= $p['nom'] ?></h3>
        <p><?= $p['prix'] ?> DT</p>

        <!-- Formulaire pour ajouter au panier -->
        <form method="POST" action="panier.php">
            <input type="hidden" name="id" value="<?= $p['id'] ?>">
            <input type="number" name="qte" value="1" min="1">
            <button type="submit">Ajouter</button>
        </form>
    </div>
<?php endforeach; ?>

</div>

</body>
</html>